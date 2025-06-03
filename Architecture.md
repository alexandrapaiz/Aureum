# 🏗️ Aureum Protocol Architecture

**Aureum** is a programmable, gold-pegged digital currency designed to serve as a sovereign store of wealth. Anchored to the **global spot price of gold** and deployed on Ethereum-compatible networks, Aureum combines the enduring credibility of gold with the composability and auditability of smart contract infrastructure.

Aureum is not backed by redemption guarantees or discretionary peg maintenance. Instead, it relies on transparent oracles, open minting logic, and market adoption to preserve its price integrity. Redemption may be enabled via independent vault partners, but this remains outside the core protocol layer.

---

## 🧱 Architecture Overview

| Principle             | Aureum Design                                                                |
| --------------------- | ---------------------------------------------------------------------------- |
| **Peg**               | Anchored to global gold spot price (USD/gram) via oracle feed                |
| **Supply Discipline** | No discretionary inflation; minting allowed only within price-aligned bounds |
| **Transparency**      | All minting, pricing, and supply logic is on-chain and publicly auditable    |
| **Redeemability**     | Redemption is optional via third-party vault partners (out-of-protocol)      |
| **Decentralization**  | Initial governance by Foundation, with DAO transition as protocol matures    |
| **Open Source**       | Fully open codebase, built for verification and contribution                 |
| **Sovereign Utility** | Designed for real-world adoption via wallets, L2s, and payments integrations |

---

## 🔧 Core Components

### `AureumToken.sol`

* ERC-20 compliant token contract
* Each **AUR** represents **0.1 grams of gold**
* Minting is permissioned and constrained by historical price data
* Immutable monetary logic: no inflation, no hidden privileges

### `SpotPriceLedger.sol`

* On-chain, timestamped, append-only log of verified gold spot prices
* Forms the basis for minting validation
* Anchors the peg to verifiable external value without requiring redemption pressure

### `GoldOracleAdapter.sol`

* Oracle module that integrates Chainlink or admin-fed feeds
* Pushes validated gold prices to `SpotPriceLedger`
* Designed for upgradeability and decentralization over time

### `FeeModule.sol`

* Computes and enforces the Entrepreneurial Cost Share (ECS)
* Fixed minting fee (e.g., 1 basis point) to fund protocol development and governance
* Fully transparent and auditable on-chain

### Frontend (MVP Interface)

* Dashboard showing:

  * Current gold price peg (USD/gram)
  * Total AUR supply and mint history
  * Spot price history via `SpotPriceLedger`
* No login or custodial system

---

## ⚙️ Lifecycle Summary

1. **Oracle Update**

   * Oracle fetches current gold spot price and submits to `SpotPriceLedger.sol`

2. **Price Logging**

   * New price is timestamped and immutably stored

3. **Minting Authorization**

   * Users or whitelisted partners may mint AUR within peg-aligned constraints
   * Minting triggers ECS payment to the protocol treasury

4. **Token Circulation**

   * AUR is held, traded, or integrated into on/off-chain systems

5. **Redemption (Optional)**

   * Partner vaults may choose to offer gold redemption for AUR at their discretion
   * The protocol encourages this through social trust and ecosystem growth, not enforcement

---

## 🌐 Integration Targets

* Ethereum L1 + L2s (Arbitrum, Polygon)
* Wallets: MetaMask, WalletConnect, Ledger, Trezor
* Payments: POS providers, Tap-to-Pay, Apple Pay (via bridge integrations)
* Storage: IPFS / Arweave for price proof and public metadata
* Future: Embedded vault APIs for opt-in redemption quoting

---

## 🔒 Governance and Security

* Multisig-managed Foundation (Genesis phase)
* Transition to DAO for non-monetary parameters
* Oracle entries are signed and verifiable
* All core logic hardened against discretionary minting or inflation bugs

---

## 🧾 Summary

Aureum is a decentralized monetary layer designed to track real-world gold with digital clarity. Its architecture prioritizes supply discipline, redeemability potential, and open governance.

> **Not a stablecoin. Not a speculative token. Aureum is a price-anchored digital monetary standard, engineered for trust and permanence.**
