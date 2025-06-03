// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

interface IChainlinkFeed {
    function latestRoundData() external view returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound
    );
}

contract GoldOracleAdapter is Ownable {
    IChainlinkFeed public chainlinkFeed;
    uint256 public manualPrice; // fallback value in case Chainlink is unavailable
    uint256 public manualTimestamp;

    event OracleUpdated(address indexed newFeed);
    event ManualPriceSet(uint256 price, uint256 timestamp);

    constructor(address _chainlinkFeed) {
        chainlinkFeed = IChainlinkFeed(_chainlinkFeed);
    }

    function getLatestPrice() external view returns (uint256 price, uint256 timestamp) {
        try chainlinkFeed.latestRoundData() returns (
            uint80, int256 answer, , uint256 updatedAt, uint80
        ) {
            require(answer > 0, "Invalid price");
            return (uint256(answer), updatedAt);
        } catch {
            require(manualPrice > 0, "No fallback price set");
            return (manualPrice, manualTimestamp);
        }
    }

    function setManualPrice(uint256 _price) external onlyOwner {
        require(_price > 0, "Price must be positive");
        manualPrice = _price;
        manualTimestamp = block.timestamp;
        emit ManualPriceSet(_price, manualTimestamp);
    }

    function updateChainlinkFeed(address _newFeed) external onlyOwner {
        require(_newFeed != address(0), "Invalid address");
        chainlinkFeed = IChainlinkFeed(_newFeed);
        emit OracleUpdated(_newFeed);
    }
}