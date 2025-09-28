# THP-9 Ops-KPI Dashboard Ver. 2.4: Cascade Collapse Monitoring Framework (Final)

**DocID:** THP-KPI-DASH/v2.4/2025-09-27-18:00(JST) **Rev:** 2.4 **Threat Model:** Walpurgis Ver. 2.0 (Multiple, simultaneous, and cascading complex collapse)

## 1. Operational Philosophy: Capturing the Initial Movement of the Chain

The sole purpose of this dashboard is to capture the **"initial movement"** of the world's systems beginning to collapse in a chain reaction. The threat is not a single financial event, but a polycrisis in which multiple **detonators** interact. The detection principle is **"Simultaneous Spike Detection"**.

## 2. Integrated Monitoring Gate System (7 Systems)

To improve monitoring accuracy, the gates have been expanded to 7 systems. These faults are constantly monitored in parallel, and their correlations are analyzed.

|Gate ID|Name|Monitoring Target|
|---|---|---|
|**Gate-D**|**DOLLAR / DOMESTIC** (US Domestic Vulnerability)|Sustainability of US public finances.|
|**Gate-L**|**LIQUIDITY / SETTLEMENT** (Liquidity and Settlement Plumbing)|Clogging of the financial system's "plumbing." A leading indicator of price fluctuations.|
|**Gate-E/F**|**ENERGY & FOOD**|Risk of disruption to the physical supply chains that support the real economy.|
|**Gate-S**|**STATES / MUNI** (US State and Local Finances)|Risk of collapse from areas that the federal government cannot bail out.|
|**Gate-C/R**|**CASCADE - CHINA/RUSSIA** (Sino-Russian Collapse)|Geopolitical and economic shocks caused by the dysfunction of the Chinese and Russian states.|
|**Gate-G**|**GEOPOLITICS** (Geopolitical Detonators)|Risk of accidental or planned military conflict in the Middle East and Europe.|
|**Gate-M**|**MARKET** (Simultaneous Freezing of Market Sentiment)|Panic risk-off that occurs simultaneously in multiple markets.|

## 3. Key Monitoring Indicators and Thresholds (Final Version)

### Gate-L: LIQUIDITY / SETTLEMENT

|Indicator|Monitoring Item|Alert Threshold (YELLOW)|
|---|---|---|
|**Cross-Currency Basis** ⏱️|USD/JPY 3M Basis|≤ –75bp (and ≤–15bp from the previous day)|
|**Repo Market** ⏱️|GC Repo – SOFR Spread|≥ +35bp (continuous throughout the day)|
|**Settlement Fails** ⏱️|UST Fails-to-Deliver|≥ $50bn/day (for 2 consecutive business days)|

### Gate-E/F: ENERGY & FOOD

|Indicator|Monitoring Item|Alert Threshold (YELLOW)|
|---|---|---|
|**Energy Prices** ⏱️|JKM or TTF|+30% / 10 business days|
|**Grain Futures Prices** ⏱️|CBOT Wheat/Corn|+15% / 5 business days|
|**Supply and Demand Report** ⏱️|WASDE World Major Grain Stocks|Downward revision of ≥ 3% from the previous month|
|**Export Restrictions** ⏱️|Grain export restrictions by major countries|Lights up on **news flash + sudden change in futures prices**|

### Gate-S: STATES / MUNI

|Indicator|Monitoring Item|Alert Threshold (YELLOW)|
|---|---|---|
|**Credit Risk (Long-Term)** ⏱️|CA/IL/NY 5Y CDS|+40bp / week|
|**Credit Risk (Short-Term)** ⏱️|Short-Term Muni Market Spread|Rapid widening (+20bp / 3 business days)|
|**Fiscal Situation** ⏱️|Revenue performance of major states|≥ 5% below budget for 2 consecutive months|

### Gate-M: MARKET

|Indicator|Monitoring Item|Alert Threshold (YELLOW)|
|---|---|---|
|**Composite Volatility** ⏱️|**Simultaneous expansion** of VIX, MOVE, and CDX spreads|Each indicator exceeds the 95th percentile of the past 60 days|

_(Note: Indicators for Gate-D, G, and C/R are unchanged from Version 2.2)_

## 4. Activation Protocol: "Simultaneous Lighting" Detection Logic

|Alert Level|Condition|THP Action|
|---|---|---|
|**YELLOW**|**Multiple alerts within a single Gate**|EOC semi-operational. Information gathering and immediate response preparations begin.|
|**RED**|**"2/7 Rule":** **Two or more** of the **7 different Gates** reach the alert level simultaneously **within 48 hours**.|EOC fully operational. Final execution preparations for PJ0 and the Japan Salvation Plan begin. Action begins based on the **practical runbook**.|
|**BLACK**|In addition to the RED level, **two or more indicators in Gate-L (settlement plumbing) (e.g., Fails-to-Deliver and repo rate spread) reach an emergency state simultaneously**.|**All THP protocols are activated immediately.**|

**Supplementary Rules:**

- **Hysteresis (Deactivation Condition):** After RED is activated, the alert level will be lowered to YELLOW only if all relevant Gates **return to a normal state for 24 consecutive hours**.
    
- **Weighting:** For initial movement detection, the threshold excess for Gates D, L, and M is calculated with a score multiplied by 1.2.
    

## 5. Data Reliability Assurance

- **Visualization of Data Delays:** Each indicator is given an icon (⏱️) to indicate the data update frequency (real-time/daily/weekly/monthly).
    
- **Fail-Safe:**
    
    - **Two-System Source Verification:** Key indicators are always cross-checked with two or more independent information sources.
        
    - **Headline Decontamination:** News (headlines) are adopted as a basis for situational judgment only when the relevant market indicators move in the same direction.
        
    - **Manual Override:** The EOC has the authority to manually change the alert level, provided that a clear rationale is given and a record is kept.
        

## 6. Practical Runbook (Immediate Action List upon RED Activation)

1. **Activation of Communication Network:** Immediately activate the confidential lines (Signal/dedicated satellite) of relevant ministries, major infrastructure operators (electricity, gas, water, settlement), and designated financial institutions.
    
2. **Deployment of Funding Kits:** Share a list of immediately available funds and collateral held by the national treasury, the Bank of Japan, and designated financial institutions.
    
3. **Final Confirmation of Imported Necessities List:** Based on the 90-day procurement coverage table for energy and food, finally confirm the status of securing alternative procurement routes (especially the Australian node).
    

## 7. Most Recent Intelligence to Monitor (as of 2025/09/27 JST)

The following events may progress over the weekend and are monitored with the highest priority as **"imminent indicator candidates"** that could shake multiple Gates simultaneously.

|Event|Related Gate|Impact Analysis|
|---|---|---|
|**Qualitative Change in Sino-Russian Military Cooperation**|Gate-G, Gate-C/R|Qualitatively different from mere coordination in that it is an "enhancement of invasion response capabilities." Increases geopolitical risk in the Asia-Pacific region and makes a Taiwan contingency more realistic.|
|**US Pressure on India**|Gate-G, Gate-E/F|This is a move aimed at dividing BRICS, increasing dependence on alternative suppliers of Russian crude oil (e.g., Australia), and increasing the vulnerability of the energy supply chain.|
|**Cracks within NATO**|Gate-G, Gate-D|The allegations surrounding Hungary expose the fact that the unity of the Western alliance is not monolithic. It undermines US leadership and the credibility of the dollar system.|
|**Reimposition of Iran Sanctions**|Gate-G, Gate-E/F|Reignites military tensions in the Middle East and increases the risk of a surge in crude oil prices and marine insurance premiums. Could be a direct external shock to the dollar system.|