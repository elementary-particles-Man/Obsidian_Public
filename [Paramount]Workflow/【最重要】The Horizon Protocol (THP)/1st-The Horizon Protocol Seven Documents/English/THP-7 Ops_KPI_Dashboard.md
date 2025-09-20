# THP-7 Ops_KPI_Dashboard

**Version:** rev.3.3 (Walpurgis Edition) **Last Updated:** 2025-09-20 JST

## 1. Operational Summary

This dashboard is an integrated operational monitoring panel for real-time detection of Walpurgis crisis precursors and automatic, phased activation of each THP protocol. All indicators are evaluated not in isolation, but in their interrelationships and temporal sequence.

**Current Overall Status:** <font color="green">**GREEN**</font> (Monitoring Phase)

## 2. Automated Execution Trigger Panel (Level 2)

### 2.1. Gate Judgment System (Walpurgis Precursor Detection System)

| Gate | Status | Condition | Impact on THP Status |
|---|---|---|---|
| **Gate-A** | **WATCH** | `MOVE > 140` **AND** `HY OAS weekly +150bp` reached. | 🟢GREEN → 🟡WATCH |
| **Gate-B** | **ARMED** | In addition to Gate-A conditions, **2 or more** of the 3 indicators for US Treasury auctions (Tail +5bp | B/C < 2.10 | Indirect < 50%) simultaneously reach the threshold. | 🟡WATCH → 🔶ALERT |
| **Gate-C** | **FIRE** | In addition to Gate-B conditions, `DXY` `Gold` `WTI` simultaneously surge (correlation coefficient ρ > 0.6), OR all 3 US Treasury auction indicators reach the threshold. | 🔶ALERT → 🔴CRITICAL |
<!-- THP-GATED_ROW_v1 -->
| **Gate-D** | **TERMINAL** | `CCR<40%(48h)`・`GSC<85%(24h/3系中2)`・`CLS(95pctl×3 + CCP停止/強制ノビション)` of **2/3** simultaneously met for immediate promotion | 🔴CRITICAL → ☠ TERMINAL (**Forced transition to THP-Aftermath**) |

### 2.2. Global Financial Markets

| Indicator Category | Indicator Name | Current Value | Status | Execution Trigger | Status |
|---|---|---|---|---|---|
| **Interest Rate Volatility** | **MOVE Index** | 125 | Stable | `> 140` (Gate-A) / `> 170` (Gate-B) | 🟢 |
| **Credit Risk** | **HY OAS** | +350bp | Stable | Weekly `+150bp` (Gate-A) | 🟢 |
| **US Treasury Auction** | **Tail / B/C / Indirect Bid** | Normal | Stable | 2 out of 3 points reached (Gate-B) / All 3 points simultaneously reached (Gate-C)¹ | 🟢 |
| **Composite Risk** | **DXY, Gold, WTI** | Normal | Stable | Simultaneous surge of 3 indicators (ρ > 0.6) (Gate-C) | 🟢 |
| **FX Intervention** | **Yen Appreciation Suppression Operation** | None | Normal | **Detection of this operation is a taboo subject**² | 🟢 |

¹ **Footnote: US Treasury Auction 3-Point Set** - Simultaneous achievement of all 3 points is considered one of the Gate-C conditions.

- Reaching 2 out of 3 points activates Gate-B (Armed) and transitions to an early warning posture.

² **Footnote: Taboo on Yen Appreciation Suppression (Dollar Buying) Intervention** - **Reasons for prohibition:** ① Waste of foreign reserves by counter-supporting during dollar flight, ② Worsens currency swap basis and increases procurement costs, ③ Sends wrong signals to the market, ④ Undermines the ideological foundation of THP's multi-currency lifeline corridor design.

- **Detection Proxy:** ① "Fireworks-type" spike in USD/JPY not linked to indicators, followed by a stall, ② Rapid expansion of USD/JPY currency basis swap in the negative direction, ③ Unnatural fluctuations in T-Bill/FB issuance or GC repo market, ④ Abnormal expansion/contraction of BOJ current account balance/call market on the next business day. The composite occurrence of these factors will raise the Gate judgment by one level.

## 3. Operational Guidelines

### 3.1. Operational Cycle and Log Format

- **Operational Cycle:**

    - **Time Point I (09:00 JST):** Reflects the situation after the Tokyo market opens.

    - **Time Point II (23:00 JST):** Reflects the situation after London Fix.

    - **Time Point III (22:30 JST):** Reflects the situation after the US spot market opens.

    - **Ad-hoc:** At the time of US Treasury auction results announcement (02:00–03:00 JST).

- **Standard Log Format:**

    - **Observation:** `MOVE=158, HY OAS=+190bp/w, Tail=+6.2bp, Indirect=48%`

    - **Judgment:** `Gate-B, THP-Status=🟡→🔶`

    - **Interpretation:** `Dollar flight accelerates, secondary market buying demand evaporates. Precursor to auction dysfunction.`

    - **THP Connection:** `LM-02(Toolkit)=ARMED, LM-05(Legal)=ARMED, LM-07(Comms)=PREPARE`

### 3.2. T-13 → T-0 Sequence Model

- **T-13~10:** HY OAS expands, and rating agencies announce negative watch or similar measures within the same week. **Gate-A** activated.

- **T-9~6:** MOVE index approaches 170, and 2 out of 3 indicators in US Treasury auctions worsen. **Gate-B** activated.

- **T-5~2:** DXY, Gold, WTI simultaneously rise (ρ > 0.6). **Gate-C** activated. Just before Niagara Falls (vertical market drop).

- **T-1~0:** Excessive allocation to primary dealers is confirmed in the auction. SLR/repo market tightens, and additional margin calls by CCPs occur in a chain reaction.

- **T-0:** The market fully prices in the auction failure, and the THP protocol is officially activated.

## 4. Social and Inequality Domain

| Indicator Category | Indicator Name | Current Value | Status | Execution Trigger | Status |
|---|---|---|---|---|---|
| **Wealth Inequality** | **Asset Share of Bottom 50%** | 2.5% | Stable | `≤ 2.0%` に低下 | 🟡WATCH |
| **Social Psychology** | **Inequality Narrative Utterance** | Increasing | Monitoring | "Criticism of overseas aid + household budget fiscal discourse" overlap in the same week | 🟡WATCH |
| **Social Stability** | **Number of Riots/Protests** | Minimal | Calming | "Zero protest actions" + "rising inflation rate" occur simultaneously | 🔴ALERT |
<!-- THP-DEATH_OPS_KPI_v1 -->
## Gate-D (☠ DEATH / TERMINAL) — Addendum

**Promotion Conditions (Immediate activation upon 2/3 simultaneous fulfillment)**
1. **Cash Convertibility Ratio (CCR) Collapse**:
   - Definition: CCR = "Ratio of salaries for public services, electricity, water, medical, and communication that can be converted to JPY/JPY-Parities at T+2"
   - Threshold: CCR < 40% for 48 consecutive hours
2. **Grid Staffing Continuity (GSC) Index**:
   - Definition: GSC = "Arrival rate of minimum replacement personnel for critical facilities"
   - Threshold: < 85% for 24 consecutive hours in two out of three systems (transmission/distribution, control, power generation)
3. **Clearing Collapse Signal (CLS)**:
   - Condition: CCP required margin Δ (Initial+Variation) exceeds 95th percentile of normal times for 3 consecutive business sessions
   - AND: Public announcement of "temporary suspension" or "forced novation" by major CCPs confirmed

> **Declaration (Dashboard Display)**:
> **THP STATUS = ☠ Gate-D (TERMINAL)** — Irreversible recovery impossible. Forced transition to post-order system (THP-Aftermath).

### New KPIs (Addendum)
- **CCR (Cash Convertibility Ratio)**: Salary convertibility rate based on T+2 (Target: public services, electricity, water, medical, communication)
- **GSC (Grid Staffing Continuity)**: Personnel arrival rate for ISO/TSO/major power generation (3-system monitoring)
- **JG/JS/JOIL-Par**: Provisional Fix of JPY/Gold, JPY/Silver, JPY/WTI
- **L/C Utilization Rate**: Issuance execution ratio of government-guaranteed L/C + reinsurance pool
- **JIMS Corridor Flow**: JPY settlement volume of humanitarian aid, power fuel, medical, and water passing through
- **Shadow-USD Dependency**: Ratio of immediate dollar exchange of other currency invoices (pseudo-dollarization indicator)
<!-- THP-KPI_UNITS_v1 -->
### KPI Units (Explicit)
- CCR: % (T+2, Target = Public/Electricity/Water/Medical/Communication)
- GSC: % (Personnel arrival rate, 3-system monitoring)
- JG-Par: JPY/oz, JS-Par: JPY/oz, JOIL-Par: JPY/bbl, JGR-Par: JPY/basket, JWA-Par: JPY/m³
- L/C Utilization Rate: %
- JIMS Flow: JPY
- Shadow-USD Dependency: %
<!-- THP-TIMELINE_D_v1 -->
### T-0 Onwards (Automatic Transition upon DEATH Activation)
- **T+0~**: `CCR/GSC/CLS` conditions met, **Gate-D** activated. Dashboard displays **THP STATUS = ☠ Gate-D (TERMINAL)** and automatically transitions to **THP-Aftermath** procedure.