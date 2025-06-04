// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract MockChainlinkFeed {
    int256 public latestAnswer;
    uint256 public updatedAt;

    function setLatestPrice(int256 _price, uint256 _timestamp) public {
        latestAnswer = _price;
        updatedAt = _timestamp;
    }

    function latestRoundData() external view returns (
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt_,
        uint80 answeredInRound
    ) {
        return (
            1,
            latestAnswer,
            block.timestamp,
            updatedAt,
            1
        );
    }
}