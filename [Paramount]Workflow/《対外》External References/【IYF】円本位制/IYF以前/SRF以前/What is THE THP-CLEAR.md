# **THP-CLEAR

Minimum Public Specification (Safe Version)**  
Cabinet Secretariat, Government of Japan (Draft)

---

## **1. Purpose**

THP-CLEAR (“CLEAR”) is a **public evidence infrastructure** designed to enhance fiscal transparency and administrative accountability.  
It is **not a financial system**, and does not participate in monetary policy, currency issuance, payment processing, or credit creation.

CLEAR supports national credibility by ensuring that **government expenditures are accompanied by verifiable, tamper-resistant evidence records**.

---

## **2. Conceptual Design (Public-Facing Layer Only)**

CLEAR consists of **three functional layers**, all non-financial:

### **(1) Evidence Layer**

- Stores metadata representing the _outcome_ of administrative actions  
    (procurement, contracts, disbursements, etc.).
    
- Records are **append-only** and cannot be overwritten.
    
- Contains no personal data.
    

### **(2) Verification Layer**

- Read-only interface for audit bodies:  
    Board of Audit, ministry internal auditors, and municipal auditors.
    
- Supports reconciliation between evidence logs and existing fiscal records.
    
- No write capability.
    

### **(3) Operations Layer**

- Ministries and municipalities continue to use existing systems.
    
- CLEAR passively receives evidence logs without modifying workflows.
    
- No requirement to replace current financial management systems.
    

---

## **3. Scope (What CLEAR Does and Does Not Do)**

### **CLEAR does not:**

- Make fiscal decisions
    
- Evaluate policies
    
- Generate or alter financial data
    
- Manage personal information
    
- Monitor citizens or administrative staff
    
- Interfere with markets, banks, or currency functions
    

### **CLEAR does only one thing:**

> **It preserves evidence of public expenditures in a secure, tamper-resistant, audit-ready format.**

---

## **4. Security & Privacy (Public Elements Only)**

- Uses internationally recognized cryptographic standards (AES / SHA families).
    
- Logs do not contain personal information.
    
- No external network access; isolated government infrastructure.
    
- Public outputs are aggregated and statistically processed.
    

(Implementation details, key management, internal protocols: **not disclosed**.)

---

## **5. Relation to the Domestic Yen Standard**

CLEAR strengthens the **credibility of Japan’s fiscal governance**.  
It does not affect monetary policy.  
Under the Domestic Yen Standard:

- **Fiscal transparency becomes a supporting pillar of long-term yen credibility.**
    
- CLEAR offers internationally verifiable evidence that public spending is accountable and auditable.
    
- CLEAR complements—rather than alters—the role of the Bank of Japan.
    

---

## **6. International Alignment**

CLEAR is aligned with:

- IMF Fiscal Transparency Code
    
- OECD GovTech / Public Governance Principles
    
- BIS SupTech / RegTech frameworks
    
- G7 Digital Government Principles
    

CLEAR is a **transparency instrument**, not a financial innovation.

---

## **7. Governance**

- Operated by the Government of Japan (Cabinet Secretariat & relevant ministries).
    
- No outsourcing of core functions.
    
- External networks not connected.
    
- Periodic review by audit bodies and reporting to the Diet.
    

---

## **8. Summary**

CLEAR is a **non-financial evidence platform** that strengthens fiscal transparency and institutional credibility.  
It supports the Domestic Yen Standard by providing a **verifiable transparency backbone**,  
without altering any monetary or market functions.