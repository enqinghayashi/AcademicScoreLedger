# AcademicScoreLedger

This repository contains the implementation of the Solidity homework assignment.  
The contract demonstrates the use of:

- State variables  
- Constructor  
- Function modifiers  
- Mappings  
- Permission control (`onlyOwner` + `require`)  
- Teaching Assistant (TA) role management  
- Recording and querying scores securely

---

## 📌 Features

### ✔ Owner Management
- The account that deploys the contract becomes the **owner** automatically.
- Only the owner can:
  - Assign / change the **TA**
  - Transfer ownership to another address

### ✔ Teaching Assistant (TA) Permissions
- Only **one TA address** is allowed.
- Only the TA can **record scores** on-chain.

### ✔ Student Score System
- `mapping(address => uint8)` stores scores for students (0–100).
- Students can only check **their own scores**.
- Score range is validated using `require`.

### ✔ Secure Access Control
- `modifier onlyOwner`
- `modifier onlyTA`
- Additional `require` checks for viewing and updating sensitive data.

---

## 📁 File Structure

```
📦 MyContract
 ┣ 📜 MyContract.sol
 ┗ 📜 README.md
```

---
