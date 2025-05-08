# Aureum Core Protocol

**Aureum** is a nonprofit, open-source protocol for a gold-backed digital currency. Each AUR token represents 0.1 grams of physical gold, stored in audited, independently operated vaults. Token issuance is governed by smart contracts and constrained by real-time reserve data published on-chain via verified oracles.

This repository contains the reference implementation of the Aureum protocol, including:

## 📦 Repository Structure

```
aureum-core/
├── contracts/                 # Solidity smart contracts
│   ├── AureumToken.sol        # ERC-20 token w/ mint constraints
│   ├── VaultManager.sol       # Tracks registered vaults and total reserves
│   └── MockVaultFeed.sol      # Simulated oracle for dev/testing
├── scripts/                   # Deployment and test scripts
├── test/                      # Test cases (Hardhat/Foundry)
├── public/                    # JSON schemas for reserve data, audits
├── docs/                      # Protocol documentation & governance
│   ├── governance.md          # Maintainer model and ethics charter
│   └── architecture.md        # Overview of contracts and logic
├── README.md                  # Project overview and usage
└── LICENSE                    # Open source license (MIT)
```

## 🧠 Core Concepts
- **1 AUR = 0.1 grams of physical gold**
- **Vault aggregation**: supports multi-vault, multi-region reserve architecture
- **Oracle-enforced minting**: smart contracts limit supply to verified reserves
- **Nonprofit governance**: minting is permissioned by gold deposits, not discretion
- **Optional redemption**: through authorized partners (outside protocol layer)

## 🔧 Requirements
- Solidity 0.8.20+
- Node.js + Hardhat (for testing/deployment)
- Chainlink oracle integration (or simulated mock)

## 🛡️ Governance
This repository is maintained by the Aureum Foundation. All changes must adhere to the monetary ethics and security principles outlined in `/docs/governance.md`. Public contributions are welcome via pull request.

## 📄 License
MIT License. The protocol is open-source, but the name "Aureum" and associated marks are protected by the Aureum Foundation.

