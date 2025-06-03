# 🌕 Aureum Core Protocol

**Aureum** is an open-source, non-inflationary protocol for a gold-pegged digital currency designed to become a sovereign store of wealth. Each **AUR** token represents **0.1 grams of gold**, priced according to the **global spot rate**. The protocol enforces strict supply discipline via smart contracts, gold price oracles, and an immutable on-chain price ledger.

Aureum is not governed by central banks or discretionary monetary policy. There is no pre-mine, no inflation, and no founder token allocation. Instead, the protocol includes a transparent, low **Entrepreneurial Cost Share** — a fixed minting fee that scales with usage and fairly compensates protocol creators for building and maintaining the system.

This repository contains the reference implementation of the **Aureum Core Protocol**.

---

## 📦 Repository Structure

```
aureum-core/
├── contracts/                 # Solidity smart contracts
│   ├── AureumToken.sol        # ERC-20 token with gold peg enforcement
│   ├── SpotPriceLedger.sol    # On-chain log of gold spot prices
│   ├── GoldOracleAdapter.sol  # Chainlink or admin-fed price oracle
│   └── FeeModule.sol          # Handles Entrepreneurial Cost Share logic
├── scripts/                   # Deployment and test scripts
├── test/                      # Test cases (Hardhat/Foundry)
├── public/                    # JSON schemas for price proofs and ledger hashes
├── docs/                      # Protocol documentation & governance
│   ├── governance.md          # Maintainer model and ethics charter
│   └── architecture.md        # Overview of contracts and logic
├── README.md                  # Project overview and usage
└── LICENSE                    # Open source license (MIT)
```

---

## 🧠 Core Concepts

- **1 AUR = 0.1 grams of gold**, priced at global spot rate
- **Supply is uncapped**, expanding as minting demand and gold holdings grow
- **Entrepreneurial Cost Share**: A fixed, low minting fee (e.g., 0.15%) collected transparently and proportionally to usage
  - Not capped, but publicly visible and auditable
  - Intended to fairly reward the creators and core maintainers
- **Oracle-enforced minting**: Gold spot price data governs minting constraints
- **No inflation or pre-mine**: No privileged issuance or hidden allocations
- **Redemption optionality**: AUR may be redeemed via third-party partners, outside the core protocol layer

---

## 🔧 Requirements

- Solidity 0.8.20+
- Node.js + Hardhat (for testing/deployment)
- Chainlink price feeds or admin-fed oracle fallback
- IPFS/Arweave optional for public price proof publishing

---

## 🔐 Governance & Ethics

This repository is stewarded by the **Aureum Foundation**, an independent nonprofit. All changes must comply with the monetary principles and security standards defined in `docs/governance.md`.

No change may introduce inflation, pre-minting, or discretionary mint authority. Contributions are welcome via pull request, with clear ethical review.

---

## 📄 License

MIT License. The protocol is free to use, fork, and audit. The name **"Aureum"** and its associated brand may be protected by the Aureum Foundation in alignment with open-source monetary ethics.

---

> *Aureum is a new, decentralized foundation for economic sovereignty—rooted in gold and open to all.*


