# THP-7 Ops_KPI_Dashboard

**Version:** rev.3.2 (Walpurgis Edition) **Last Updated:** 2025-09-18 JST

## 1. Operational Summary

This dashboard is an integrated operational monitoring board for detecting the precursors of the Walpurgis crisis in real time and activating each protocol of THP automatically and in stages. All indicators are evaluated not in isolation, but in their mutual relevance and temporal sequence.

**Current Overall Status:** <font color="green">**GREEN**</font> (Monitoring Phase)

## 2. Automatic Execution Trigger Panel (Level 2)

### 2.1. Gate Judgment System (Walpurgis Precursor Detection System)

|Gate|Status|Condition|Impact on THP Status|
|---|---|---|---|
|**Gate-A**|**WATCH**|`MOVE > 140` **AND** `HY OAS Weekly +150bp` is reached.|🟢GREEN → 🟡WATCH|
|**Gate-B**|**ARMED**|In addition to Gate-A conditions, **two or more** of the three indicators in the US Treasury auction <Tail +5bp | B/C < 2.10 | Indirect < 50%> reach their reference values simultaneously.|🟡WATCH → 🔶ALERT|
|**Gate-C**|**FIRE**|In addition to Gate-B conditions, the three indicators `DXY`, `Gold`, and `WTI` surge simultaneously (correlation coefficient ρ > 0.6), or all three US Treasury auction indicators reach their reference values.|🔶ALERT → 🔴CRITICAL|

### 2.2. Global Financial Markets

|Indicator Category|Indicator Name|Current Value|Situation|Execution Trigger|Status|
|---|---|---|---|---|---|
|**Interest Rate Volatility**|**MOVE Index**|125|Stable|`> 140` (Gate-A) / `> 170` (Gate-B)|🟢|
|**Credit Risk**|**HY OAS**|+350bp|Stable|Weekly `+150bp` (Gate-A)|🟢|
|**US Treasury Auction**|**Tail / B/C / Indirect Bid**|Normal|Stable|2 out of 3 points reached (Gate-B) / 3 points reached simultaneously (Gate-C)¹|🟢|
|**Complex Risk**|**DXY, Gold, WTI**|Normal|Stable|Simultaneous surge of 3 indicators (ρ > 0.6) (Gate-C)|🟢|
|**Currency Intervention**|**Yen Appreciation Suppression Op**|None|Normal|**Detection of this operation is a taboo**²|🟢|

¹ **Footnote: UST Auction 3-piece set** - Reaching all 3 points simultaneously is considered one of the Gate-C conditions.

- Reaching 2 out of 3 points activates Gate-B (Armed) and shifts to an early warning system.

² **Footnote: Taboo of Yen Appreciation Suppression (Dollar Buying) Intervention** - **Reasons for prohibition:** ① Counter-cyclical support in a dollar flight phase is a waste of foreign exchange reserves, ② It worsens the basis of currency swaps and increases procurement costs, ③ It sends the wrong signal to the market, ④ It undermines the ideological foundation of THP's multi-currency lifeline corridor design.

- **Detection Proxy:** ① "Fireworks-type" spike in USD/JPY that is not linked to indicators, followed by a stall, ② Sharp expansion of the USD/JPY currency basis swap in the negative direction, ③ Unnatural fluctuations in the T-Bill/FB new issue or GC repo market, ④ Abnormal expansion and contraction of the Bank of Japan's current account balance and call market on the next business day. The combined occurrence of these will be a factor in raising the Gate judgment by one level.

## 3. Operational Guidelines

### 3.1. Operational Cycle and Log Format

- **Operational Cycle:**
    - **Time I (09:00 JST):** Reflects the situation after the Tokyo market opens.
    - **Time II (23:00 JST):** Reflects the situation after the London Fix.
    - **Time III (22:30 JST):** Reflects the situation after the US cash market opens.
    - **Extraordinary:** At the time of the US Treasury auction results announcement (02:00–03:00 JST).

- **Standard Log Format:**
    - **Observation:** `MOVE=158, HY OAS=+190bp/w, Tail=+6.2bp, Indirect=48%`
    - **Judgment:** `Gate-B, THP-Status=🟡→🔶`
    - **Interpretation:** `Dollar flight is accelerating, and buying demand in the secondary market is evaporating. Precursor to auction dysfunction.`
    - **THP Connection:** `LM-02(Toolkit)=ARMED, LM-05(Legal)=ARMED, LM-07(Comms)=PREPARE`

### 3.2. T-13 → T-0 Sequence Model

- **T-13 to 10:** HY OAS expands, and rating agencies announce measures such as a negative watch within the same week. **Gate-A** activated.
- **T-9 to 6:** The MOVE index approaches 170, and two of the three indicators in the US Treasury auction worsen. **Gate-B** activated.
- **T-5 to 2:** DXY, Gold, and WTI rise simultaneously (ρ > 0.6). **Gate-C** activated. Just before the Niagara Falls (vertical drop of the market).
- **T-1 to 0:** Excessive allocation to primary dealers is confirmed in the auction. The SLR/repo market becomes tight, and additional margin calls by CCPs occur in a chain reaction.
- **T-0:** The market fully prices in the auction failure, and the THP protocol is formally activated.

## 4. Social and Inequality Domain

| Indicator Category | Indicator Name | Current Value | Situation | Execution Trigger | Status |
| --- | --- | --- | --- | --- | --- |
| **Asset Inequality** | **Asset Share of the Bottom 50%** | 2.5% | Stable | Declines to `≤ 2.0%` | 🟡WATCH |
| **Social Psychology** | **Inequality Narrative Utterances** | Increasing | Monitoring | "Criticism of foreign aid + household budget discourse" overlap in the same week | 🟡WATCH |
| **Social Stability** | **Number of Riots and Protests** | Minimal | Calming down | "Zero protests" + "rising inflation rate" occur simultaneously | 🔴ALERT |