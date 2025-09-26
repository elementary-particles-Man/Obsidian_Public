# LM-09 Ops Room Final Protocol v1

## Audit Header
- Project: THP-Hardening-LastOneMile
- Task ID: LM-09
- Document: LM-09_Final_Ops_Room_Protocol
- Version: 2025-09-19 v1.0
- Status: Approved for Immediate Use
- Prepared: 2025-09-19 10:00 JST
- Prepared By: JIMS-Operations
- Reference: LM-03_OpsRoom_Spec.md, LM-04_MoU_Final_Dissemination_Record.log

## 1. Location & Access
- **Primary Ops Room**: Cabinet Annex B2, War-Room Sector (Gate-B badge required).
- **Secondary Ops Room**: JIMS HQ 4F Crisis Suite (auto-switch on primary outage).
- **Secure Entry**: Dual-factor (Commander issued token + biometric). Access roster in `OpsRoom_Access_List_20250919.csv`.

## 2. Communications Matrix
| Channel | Purpose | Primary | Alternate |
| --- | --- | --- | --- |
| SecureLine Bridge A | Commander directives | OpsRoom Lead | JIMS-Operations Deputy |
| SecureLine Bridge B | MiniLateral Liaison | MOFA Liaison | OpsRoom Liaison |
| WebRTC (Ops Console) | LM-01 Dashboard view | DataOps Lead | Dashboard SRE |
| Voice (E1 trunk) | Civil coordination | Cabinet Secretariat Comms | Metropolitan Police Liaison |

## 3. Approvers & Deputies
| Role | Primary | Deputy |
| --- | --- | --- |
| OpsRoom Lead | Rina Kagawa | Kenji Matsuda |
| Commander Liaison | Cmdr. Akagi | Cmdr. Sato |
| Legal Conduct | MoJ Liaison (S. Nishida) | OpsRoom Legal Advisor |
| DataOps Lead | Aya Fujimoto | Masato Shiba |

## 4. Key Procedures
1. **Activation**: Commander or OpsRoom Lead can trigger Gate-B; log to `OpsRoom_Activation_Log.jsonl`.
2. **MiniLateral Coordination**: Use SecureLine Bridge B within 5 minutes of TR-06 critical alert.
3. **Audit Snapshot**: Generate every 6 hours; store in `/ops/dashboard-public/audit_snapshots/`.
4. **SITREP Generation**: `LM-01` team produces reports (e.g., `SITREP_2025-09-19_0900.md`); distribute via SecureLine + archive.

## 5. Distribution List
- JIMS-Operations Core Team
- JIMS-Finance DataOps
- JIMS-Legal Liaison Group
- MOFA MiniLateral Liaison
- OpsRoom Watch Officers
- Commander’s Staff (for reference)

## 6. Instructions
- Update this protocol upon leadership changes or communication reroutes.
- All modifications require Commander approval and logging in `OpsRoom_Protocol_Change_Log.jsonl`.

---
*Reference: LM-03_OpsRoom_Spec.md, LM-04_MoU_Final_Dissemination_Record.log.*
