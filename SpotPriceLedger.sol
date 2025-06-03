// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SpotPriceLedger
 * @dev This contract maintains an on-chain, append-only log of gold spot prices.
 * It acts as the immutable peg anchor for the Aureum protocol, storing a timestamped
 * history of price updates pushed by a trusted oracle. All AUR minting constraints,
 * peg validations, and supply verifications derive from this historical log.
 *
 * Key Features:
 * - Accepts spot price data from an authorized oracle (e.g., Chainlink Adapter)
 * - Maintains full historical price records (auditable and non-editable)
 * - Enables retrieval of latest or past prices by index
 * - Allows governance to rotate oracle address securely
 *
 * Note: Price format follows Chainlink conventions (1e8 precision for USD-based feeds).
 *       For example, a gold price of $63.215 is stored as 6321500000.
 */

contract SpotPriceLedger {
    /// @notice Address of the oracle authorized to push price updates
    address public oracle;

    /// @notice Contract owner, typically the protocol deployer or multisig
    address public owner;

    /// @notice Represents a gold spot price entry with timestamp
    struct PriceEntry {
        uint256 price;       // Gold spot price in USD with 8 decimals
        uint256 timestamp;   // Block timestamp when price was recorded
    }

    /// @notice Array storing the entire history of spot price entries
    PriceEntry[] public priceHistory;

    /// @notice Emitted when a new spot price is successfully recorded
    event PriceUpdated(uint256 price, uint256 timestamp);

    /// @notice Emitted when the authorized oracle address is changed
    event OracleChanged(address indexed newOracle);

    /// @dev Restricts function access to contract owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    /// @dev Restricts function access to the currently authorized oracle only
    modifier onlyOracle() {
        require(msg.sender == oracle, "Not oracle");
        _;
    }

    /**
     * @notice Constructor to initialize the ledger with an oracle address
     * @param _oracle Initial oracle address authorized to submit spot prices
     */
    constructor(address _oracle) {
        require(_oracle != address(0), "Oracle cannot be zero address");
        owner = msg.sender;
        oracle = _oracle;
    }

    /**
     * @notice Called by the oracle to submit a new gold spot price
     * @param _price The new gold price in 1e8 format (USD per gram)
     */
    function recordPrice(uint256 _price) external onlyOracle {
        require(_price > 0, "Invalid price");

        // Push new price and timestamp to historical ledger
        priceHistory.push(PriceEntry({
            price: _price,
            timestamp: block.timestamp
        }));

        emit PriceUpdated(_price, block.timestamp);
    }

    /**
     * @notice Returns the most recently recorded spot price and its timestamp
     * @return price Latest price (1e8 format)
     * @return timestamp Block timestamp of the latest entry
     */
    function getLatestPrice() external view returns (uint256 price, uint256 timestamp) {
        require(priceHistory.length > 0, "No prices recorded");
        PriceEntry storage latest = priceHistory[priceHistory.length - 1];
        return (latest.price, latest.timestamp);
    }

    /**
     * @notice Returns a historical spot price entry by index
     * @param index Position in the price history array
     * @return price Spot price at given index (1e8 format)
     * @return timestamp Timestamp at which the price was recorded
     */
    function getPriceAtIndex(uint256 index) external view returns (uint256 price, uint256 timestamp) {
        require(index < priceHistory.length, "Invalid index");
        PriceEntry storage entry = priceHistory[index];
        return (entry.price, entry.timestamp);
    }

    /**
     * @notice Changes the oracle authorized to push spot price updates
     * @param _newOracle Address of the new oracle
     */
    function changeOracle(address _newOracle) external onlyOwner {
        require(_newOracle != address(0), "Zero address");
        oracle = _newOracle;
        emit OracleChanged(_newOracle);
    }

    /**
     * @notice Returns the total number of recorded spot price entries
     * @return count Length of the price history array
     */
    function priceCount() external view returns (uint256 count) {
        return priceHistory.length;
    }
}