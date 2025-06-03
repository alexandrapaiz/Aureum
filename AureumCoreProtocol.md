# 🌕 Aureum Core Protocol

**Aureum** is an open-source, non-inflationary protocol for a gold-pegged digital currency designed to serve as a sovereign store of wealth. Each **AUR** token represents **0.1 grams of gold**, priced against the **global spot rate**. The protocol enforces monetary discipline through smart contracts, verifiable gold price oracles, and an immutable on-chain price ledger.

Aureum does not rely on central banks or discretionary monetary policy. There is no pre-mine, no inflation, and no founder allocation. Instead, the protocol includes a transparent, low **Entrepreneurial Cost Share (ECS)** — a fixed minting fee that scales with usage and compensates protocol contributors for the real-world costs of building, maintaining, and verifying the redeemable peg infrastructure.

This repository contains the reference implementation of the **Aureum Core Protocol**.

---

## 📆 Repository Structure

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

* **1 AUR = 0.1 grams of gold**, priced at global spot rate
* **Supply is uncapped**, expanding as minting demand and gold market participation grow
* **Entrepreneurial Cost Share (ECS)**: A fixed, low minting fee (e.g., 1 basis point) collected transparently

  * Not capped, but publicly visible and auditable
  * Designed to fairly compensate protocol builders without relying on inflation or speculative gains
* **Oracle-enforced minting**: All minting is governed by real-time gold spot price feeds
* **No inflation or pre-mine**: Supply expands only via user minting; no privileged allocations
* **Redemption optionality**: While AUR is pegged to gold, physical redemption is offered only via independent, opt-in vault partners—outside the core protocol layer

> Unlike Bitcoin, Aureum does not reward early adopters through speculative capital gains. Because AUR is price-pegged to gold, its value is stable. The ECS exists to ensure contributors are sustainably compensated for building infrastructure that cannot rely on inflation or appreciation.

---

## 🔧 Requirements

* Solidity 0.8.20+
* Node.js + Hardhat (for testing/deployment)
* Chainlink price feeds or admin-fed oracle fallback
* IPFS/Arweave optional for public price proof publishing

---

## 🔐 Governance & Ethics

This repository is stewarded by the **Aureum Foundation**, an independent nonprofit entity. The Foundation also protects the Aureum brand and prevents protocol misrepresentation or unauthorized forks from distorting the mission.

All changes must comply with the monetary constraints and security guarantees defined in `docs/governance.md`.

No change may introduce inflation, pre-minting, or discretionary monetary privileges. Contributions are welcome via pull request, subject to rigorous ethical and security review.

---

## 📄 License

MIT License. The protocol is free to use, fork, and audit. The **Aureum** name and brand may be protected by the Foundation to preserve alignment with open monetary values.

---

> *Aureum is a decentralized, gold-pegged digital currency designed to evolve into a sovereign monetary system—transparent, redeemable, and free from centralized control.*
