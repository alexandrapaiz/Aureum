// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title FeeModule
 * @notice This contract calculates and distributes the Entrepreneurial Cost Share (ECS) for the Aureum protocol.
 *
 * ECS is a fixed minting fee applied to all new AUR issued via the protocol. It exists to fairly compensate
 * protocol builders and maintainers in a non-inflationary, auditable manner. This module performs the following:
 *
 * - Calculates the ECS amount given a minting volume
 * - Stores the ECS fee recipient address
 * - Enables upgrades to the fee recipient by governance
 * - Allows public querying of the current fee rate
 *
 * Note: This contract does not hold funds directly. The AUR token contract must call `getFee()` during mint
 * to calculate and transfer the fee accordingly.
 */

contract FeeModule {
    /// @notice The fee rate as parts per million (e.g., 100 = 1 basis point = 0.01%)
    uint256 public constant FEE_PPM = 100; // 1 basis point = 0.01%

    /// @notice The recipient of all ECS fee proceeds (e.g. Aureum Foundation multisig)
    address public feeRecipient;

    /// @notice Emitted when the fee recipient address is changed
    event FeeRecipientUpdated(address indexed oldRecipient, address indexed newRecipient);

    /// @param _initialRecipient The initial recipient of ECS fees
    constructor(address _initialRecipient) {
        require(_initialRecipient != address(0), "Invalid recipient");
        feeRecipient = _initialRecipient;
    }

    /**
     * @notice Calculates the fee amount for a given minting volume
     * @param mintAmount The total amount of AUR being minted (in token decimals)
     * @return feeAmount The amount to be paid as ECS (in token decimals)
     */
    function getFee(uint256 mintAmount) public pure returns (uint256 feeAmount) {
        // feeAmount = mintAmount * FEE_PPM / 1,000,000
        feeAmount = (mintAmount * FEE_PPM) / 1_000_000;
    }

    /**
     * @notice Updates the ECS fee recipient
     * @dev Should be restricted to governance (e.g. Foundation multisig)
     * @param newRecipient The new recipient address
     */
    function setFeeRecipient(address newRecipient) external {
        require(msg.sender == feeRecipient, "Only current recipient can change");
        require(newRecipient != address(0), "Cannot set zero address");
        emit FeeRecipientUpdated(feeRecipient, newRecipient);
        feeRecipient = newRecipient;
    }

    /**
     * @notice Returns the current ECS fee rate in parts per million
     * @return Current fee rate (e.g., 100 = 1 basis point)
     */
    function feeRate() external pure returns (uint256) {
        return FEE_PPM;
    }
}