// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title MockVaultManager - Simplified mock for testing AureumToken interactions
contract MockVaultManager {
    address public owner;
    uint256 public totalGoldGrams;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
        totalGoldGrams = 0;
    }

    /// @notice Set the total simulated gold backing
    /// @param amount New gold amount in grams
    function setTotalGold(uint256 amount) external onlyOwner {
        totalGoldGrams = amount;
    }

    /// @notice Return total simulated gold in grams
    function getTotalGold() external view returns (uint256) {
        return totalGoldGrams;
    }
}
