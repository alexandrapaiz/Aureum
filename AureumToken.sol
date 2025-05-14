// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

interface IVaultFeed {
    function getGoldAmount() external view returns (uint256);
}

/// @title AureumToken - Gold-backed ERC-20 token with mint constraints
contract AureumToken is ERC20 {
    address public owner;
    IVaultFeed public vaultFeed;

    // 1 AUR = 0.1 grams of gold = 10 decigrams
    uint256 public constant GRAMS_PER_TOKEN = 10;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor(address _vaultFeed) ERC20("Aureum", "AUR") {
        owner = msg.sender;
        vaultFeed = IVaultFeed(_vaultFeed);
    }

    /// @notice Mint tokens if gold reserves allow
    /// @param to Recipient address
    /// @param amount Amount to mint (in wei units of AUR)
    function mint(address to, uint256 amount) external onlyOwner {
        uint256 maxSupply = (vaultFeed.getGoldAmount() * (10 ** decimals())) / GRAMS_PER_TOKEN;
        require(totalSupply() + amount <= maxSupply, "Exceeds backed supply");
        _mint(to, amount);
    }
}
