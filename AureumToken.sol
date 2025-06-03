// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

interface IGoldOracle {
    function getLatestPrice() external view returns (uint256 price, uint256 timestamp);
}

interface IFeeModule {
    function chargeFee(address payer, uint256 amount) external returns (uint256 netAmount);
}

contract AureumToken is ERC20, Ownable {
    uint256 public constant GRAM_SCALE = 1e8;          // scale to handle precision (8 decimals)
    uint256 public constant GRAMS_PER_AUR = 1e7;       // 0.1g = 1e7 units

    IGoldOracle public oracle;
    IFeeModule public feeModule;

    event Minted(address indexed to, uint256 amountAUR, uint256 goldPriceUSD);

    constructor(address oracleAddress, address feeModuleAddress)
        ERC20("Aureum", "AUR")
    {
        oracle = IGoldOracle(oracleAddress);
        feeModule = IFeeModule(feeModuleAddress);
        _mint(msg.sender, 0); // zero initial supply
    }

    function mint(address to, uint256 usdAmount) external onlyOwner {
        (uint256 pricePerGram, uint256 timestamp) = oracle.getLatestPrice();
        require(block.timestamp - timestamp < 3600, "Stale oracle");

        uint256 aurToMint = (usdAmount * GRAM_SCALE) / pricePerGram;
        uint256 aurTokens = (aurToMint * 1e18) / GRAMS_PER_AUR; // convert to 18 decimals

        uint256 netTokens = feeModule.chargeFee(to, aurTokens);
        _mint(to, netTokens);

        emit Minted(to, netTokens, pricePerGram);
    }

    function updateOracle(address newOracle) external onlyOwner {
        oracle = IGoldOracle(newOracle);
    }

    function updateFeeModule(address newFeeModule) external onlyOwner {
        feeModule = IFeeModule(newFeeModule);
    }
}