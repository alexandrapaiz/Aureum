# 🌕 Aureum

**Aureum** is a programmable, gold-pegged digital currency—designed as a sovereign store of wealth for the decentralized era.

Anchored to the **global spot price of gold** and deployed on Ethereum-compatible networks, Aureum offers individuals and institutions a credible alternative to inflationary fiat currencies. It combines the timeless integrity of gold with the transparency, composability, and auditability of modern cryptographic systems.

Aureum is not governed by central banks. It does not rely on redemptions to maintain its peg. Instead, it enforces a strict monetary discipline through verifiable pricing data, transparent minting logic, and an open-source architecture built for permanence and trust.

---

## 🧱 Architecture Overview

| Principle            | Aureum Design                                                               |
|----------------------|------------------------------------------------------------------------------|
| **Peg**              | Anchored to the global gold spot price (USD/gram)                            |
| **Supply Integrity** | No discretionary inflation; minting permitted only within verified constraints |
| **Transparency**     | All minting, pricing, and supply data are publicly auditable on-chain        |
| **Redeemability**    | Redemption is optional, partner-based, and market-driven (future integration) |
| **Decentralization** | Long-term roadmap toward DAO-based governance and multisig control           |
| **Open Source**      | Fully transparent codebase, open to independent verification and contribution |
| **Real-World Ready** | Designed for future integration with Apple Pay, hardware wallets, and POS    |

---

## 🔧 Core Components

### `AureumToken.sol`
- ERC-20 compliant digital currency contract
- Each unit of AUR represents **0.1 grams of gold**, valued at current spot
- Minting is constrained by historical spot price records and administrator permission
- Immutable monetary logic: no inflation, no arbitrary adjustments

### `SpotPriceLedger.sol`
- On-chain, append-only record of verified gold spot prices
- Timestamped and signed entries form the historical basis for minting
- Anchors the currency to objective global value, independent of redemption pressure

### `GoldOracleAdapter.sol`
- Oracle module integrating Chainlink or authorized price feeds
- Pushes externally validated spot prices to the on-chain ledger
- MVP includes fallback admin input with future decentralization planned

### Frontend Interface (MVP)
- Public dashboard displaying:
  - Current gold peg (USD/gram)
  - Total circulating supply of AUR
  - Historical spot prices and mint records
- No login, KYC, or central account system

---

## ⚙️ Lifecycle Summary

1. **Oracle Update**  
   Authorized oracle (e.g., Chainlink) publishes the current gold spot price.

2. **Price Recording**  
   The new price is submitted to `SpotPriceLedger.sol`, time-stamped and verifiable.

3. **Mint Authorization**  
   New AUR may be minted only within peg-aligned parameters and through authorized governance roles.

4. **User Engagement**  
   Users receive AUR, store it, transact, or integrate it into decentralized and real-world payment systems.

5. **Long-Term Redemption**  
   Redemption through vault partners is possible but not essential to peg stability.

---

## 🌍 Integration Targets

- Ethereum mainnet and L2 networks (Polygon, Arbitrum)
- Wallets: MetaMask, WalletConnect, Ledger, Trezor
- Payment platforms: Apple Pay (via integrations), PoS compatibility
- Oracle infrastructure: Chainlink, custom adapters
- File hosting: IPFS / Arweave for public metadata and audit proofs

---

## 🔐 Security and Governance

- Immutable minting constraints enforced by contract logic
- Price feed entries are cryptographically signed and non-editable
- Emergency controls restricted to multisig foundation governance (MVP)
- Planned evolution to permissionless, DAO-led issuance and oversight

---

## 📁 Repository Structure

| Contract/File             | Description                                          |
|---------------------------|------------------------------------------------------|
| `AureumToken.sol`         | Main currency contract with gold peg enforcement     |
| `SpotPriceLedger.sol`     | Spot price history ledger and peg anchor             |
| `GoldOracleAdapter.sol`   | Oracle integration logic                             |
| `scripts/`                | Deployment, migration, and test automation           |
| `docs/governance.md`      | Roles, roadmap, and ethics charter                   |

---

## 🎯 Monetary Philosophy

Aureum is not a speculative token. It is a **sovereign monetary instrument**, purpose-built for those who seek:

- Stability without compromise  
- Ownership without counterparty risk  
- Transparency without dependence  
- Wealth preservation without dilution  

> Aureum is the convergence of gold’s timeless trust and Ethereum’s programmable clarity—a modern monetary foundation, born of code and conviction.

---

## 🛠️ License

Aureum is released under the MIT License. Contributions are welcome.
