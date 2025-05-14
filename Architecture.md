# 🏗️ Aureum Architecture Overview

**Aureum** is a gold-backed digital currency protocol designed for verifiable monetary integrity. It operates on Ethereum-compatible blockchains and enforces strict minting rules based on on-chain proof of reserves. The architecture prioritizes security, transparency, and long-term discipline, inspired by the monetary rigor of Bitcoin and the programmability of Ethereum.

---

## 🔧 Core Components

### 1. `AureumToken.sol`
- ERC-20 compliant smart contract representing the AUR token
- Each token equals 0.1 grams of physical gold
- Minting restricted by reserve verification
- Supply cannot exceed total verifiable gold reserves

### 2. `VaultManager.sol`
- Tracks registered, whitelisted vaults
- Aggregates total gold reserves across multiple providers
- Interfaces with external oracle data feeds
- Ensures only verified reserves influence minting logic

### 3. `MockVaultFeed.sol`
- Used for testing and local development
- Simulates real-time reserve data
- Replaced in production with Chainlink-integrated oracles

### 4. Oracles (e.g. Chainlink)
- Provide verified gold reserve data from independent vaults
- Push data on-chain at regular intervals or via event triggers
- Ensure that minting supply remains fully collateralized

### 5. Frontend Dashboard
- Interfaces with the blockchain to show real-time:
  - Circulating supply
  - Gold reserves by vault
  - Mint/burn events
  - Audit metadata and oracle updates
- Publicly accessible; no login or KYC required

---

## ⚙️ Workflow Summary

1. **Gold Deposit:** A vault receives new physical gold  
2. **Data Published:** Vault signs or pushes reserve update via oracle  
3. **VaultManager Update:** Receives new verified reserve data  
4. **Token Minting:** Foundation-approved operator mints AUR (within limit)  
5. **User Interaction:** Users receive AUR, transact, and optionally redeem via partners  
6. **Verification:** Anyone can audit reserve ratio, supply cap, and vault data  

---

## 📡 Integration Targets

- Ethereum mainnet or compatible L2s (Polygon, Arbitrum)
- MetaMask, WalletConnect, hardware wallets
- Chainlink oracle nodes or custom external adapters
- GitHub-hosted proofs and audit records (JSON + IPFS optional)

---

## 🔐 Security Considerations

- Immutable minting rules
- Vault registration is permissioned by governance
- All oracle data must be cryptographically signed and time-stamped
- Emergency pause logic can be added (multi-sig controlled, foundation-only)

---

## 📁 Files & Contracts

| Contract/File | Purpose |
|---------------|---------|
| `AureumToken.sol` | Main token contract enforcing 1:1 gold backing |
| `VaultManager.sol` | Tracks vaults and calculates total reserve |
| `MockVaultFeed.sol` | Test implementation of vault oracle feed |
| `scripts/` | Deployment, setup, and local testing automation |
| `docs/governance.md` | Maintainer roles, ethics charter, and governance scope |

---

## 🎯 Design Philosophy

- Simplicity, verifiability, and neutrality  
- Align technical architecture with monetary discipline  
- Enable auditability for individuals, not just institutions  
- Separate trust in code from trust in custodians—verify all vaults, always  

**Aureum** is built to be a programmable monetary foundation for the digital age, combining gold’s timeless value with cryptographic enforcement.