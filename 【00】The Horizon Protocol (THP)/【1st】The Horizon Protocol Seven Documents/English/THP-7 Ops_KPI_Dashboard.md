# THP-9 Ops-KPI Dashboard Ver. 2.4: Cascade Collapse Monitoring Framework (Final)

**DocID:** THP-KPI-DASH/v2.4/2025-09-27-18:00(JST) **Rev:** 2.4 **Threat Model:** Walpurgis Ver. 2.0 (Multiple Simultaneous and Chained Complex Collapse)

## 1. Operational Philosophy: Capturing the Initial Phase of a Chain Collapse

The sole purpose of this dashboard is to capture the **"initial phase"** when global systems begin to collapse in a chain reaction. The threat is not a single financial event, but a complex crisis (Polycrisis) where multiple **detonators** interact. The detection principle is **"Simultaneous Spike Detection of Multiple Factors."**

## 2. Integrated Monitoring Gate System (7 Systems)

To improve monitoring accuracy, the gates have been expanded to 7 systems. These fault lines are constantly monitored in parallel, and their correlations are analyzed.

|Gate ID|Name|Monitoring Target|
|---|---|---|
|**Gate-D**|**DOLLAR / DOMESTIC** (US Domestic Vulnerabilities)|Sustainability of US finances.|
|**Gate-L**|**LIQUIDITY / SETTLEMENT** (Liquidity/Settlement Pipeline)|Clogging of the financial system's "pipeline." Leading indicator of price fluctuations.|
|**Gate-E/F**|**ENERGY & FOOD** (Energy/Food)|Risk of disruption to the physical supply chain supporting the real economy.|
|**Gate-S**|**STATES / MUNI** (US States/Municipal Finance)|Risk of collapse from areas that the federal government cannot bail out.|
|**Gate-C/R**|**CASCADE - CHINA/RUSSIA** (China/Russia Mutual Collapse)|Geopolitical and economic shock caused by state dysfunction in China and Russia.|
|**Gate-G**|**GEOPOLITICS** (Geopolitical Detonators)|Risk of accidental or planned military conflict in the Middle East and Europe.|
|**Gate-M**|**MARKET** (Simultaneous Freezing of Market Sentiment)|Panic-driven risk-off occurring simultaneously in multiple markets.|

## 3. Key Monitoring Indicators and Thresholds (Final Version)

### Gate-L: LIQUIDITY / SETTLEMENT

|Indicator|Monitoring Item|Alert Threshold (YELLOW)|
|---|---|---|
|**Cross-Currency Basis** ⏱️|USD/JPY 3M Basis|≤ –75bp (and ≤ –15bp from previous day)|
|**Repo Market** ⏱️|GC Repo – SOFR Spread|≥ +35bp (continuous throughout the day)|
|**Settlement Failure** ⏱️|UST Fails-to-Deliver|≥ $50bn/day (2 consecutive business days)|

### Gate-E/F: ENERGY & FOOD

|Indicator|Monitoring Item|Alert Threshold (YELLOW)|
|---|---|---|
|**Energy Price** ⏱️|JKM or TTF|+30% / 10 business days|
|**Grain Futures Price** ⏱️|CBOT Wheat/Corn|+15% / 5 business days|
|**Supply and Demand Report** ⏱️|WASDE Global Major Grain Stocks|Downward revision of ▲3% or more from previous month|
|**Export Restrictions** ⏱️|Grain export restrictions by major countries|**Alert triggered by breaking news + sudden change in futures prices**|

### Gate-S: STATES / MUNI

|Indicator|Monitoring Item|Alert Threshold (YELLOW)|
|---|---|---|
|**Credit Risk (Long-term)** ⏱️|CA/IL/NY 5Y CDS|+40bp / week|
|**Credit Risk (Short-term)** ⏱️|Short-term Muni Market Spread|Rapid expansion (+20bp / 3 business days)|
|**Fiscal Situation** ⏱️|Revenue performance of major states|▲5% or more below budget for 2 consecutive months|

### Gate-M: MARKET

|Indicator|Monitoring Item|Alert Threshold (YELLOW)|
|---|---|---|
|**Composite Volatility** ⏱️|**Simultaneous expansion** of VIX, MOVE, CDX spreads|Each indicator breaks through the 95th percentile of the past 60 days|

_(Note: Indicators for Gate-D, G, C/R are unchanged from Version 2.2)_

## 4. Activation Protocol: "Simultaneous Illumination" Detection Logic

|Alert Level|Conditions|THP Action|
|---|---|---|
|**YELLOW**|**Multiple alerts within a single Gate**|EOC partially activated. Information gathering and immediate response preparations begin.|
|**RED**|**"2/7 Rule":** Two or more of the **seven different Gates** reach alert level simultaneously **within 48 hours**.|EOC fully activated. Final preparations for PJ0 and Japan National Salvation Plan begin. Actions commence based on the **operational runbook**.|
|**BLACK**|In addition to RED level, **two or more indicators in Gate-L (settlement pipeline) simultaneously reach emergency status** (e.g., Fails-to-Deliver and repo rate divergence).|**All THP protocols are immediately activated.**|

**Supplementary Rules:**

-   **Hysteresis (Deactivation Condition):** After RED activation, the alert level is lowered to YELLOW only if all relevant Gates return to **normal status for 24 consecutive hours.**

-   **Weighting:** For initial detection, exceeding the thresholds of Gate-D, L, and M is calculated with a 1.2x score.

## 5. Data Reliability Assurance

-   **Visualization of Data Latency:** Each indicator is assigned an icon (⏱️) indicating the data update frequency (real-time/daily/weekly/monthly).

-   **Failsafe:**

    -   **Two-Source Cross-Verification:** Key indicators are always cross-checked with two or more independent information sources.

    -   **Headline Decontamination:** News reports (headlines) are adopted as a basis for situational judgment only if related market indicators move in the same direction.

    -   **Manual Override:** The EOC has the authority to manually change the alert level, provided there is clear justification and a record is kept.

## 6. Operational Runbook (Immediate Action List upon RED Activation)

1.  **Activation of Communication Network:** Immediately activate secure lines (Signal/dedicated satellite) for relevant ministries, key infrastructure operators (electricity, gas, water, settlement), and designated financial institutions.

2.  **Deployment of Liquidity Kit:** Share a list of immediately available funds and collateral held by the Treasury, the Bank of Japan, and designated financial institutions.

3.  **Final Confirmation of Essential Import List:** Final confirmation of securing alternative procurement routes (especially the Australian node) based on the 90-day procurement coverage table for energy and food.

## 7. Latest Monitoring Intelligence (as of 2025/09/27 JST)

The following events have the potential to progress over the weekend and simultaneously shake multiple Gates, and are therefore monitored with the highest priority as **"candidate immediate indicators."**

|Event|Related Gate|Impact Analysis|
|---|---|---|
|**Qualitative Change in China-Russia Military Cooperation**|Gate-G, Gate-C/R|Qualitatively different from mere cooperation, in terms of "strengthening invasion response capabilities." Increases geopolitical risk in the Asia-Pacific region and heightens the reality of a Taiwan contingency.|
|**US Pressure on India**|Gate-G, Gate-E/F|An attempt to divide BRICS, increasing dependence on alternative suppliers of Russian crude oil (e.g., Australia) and increasing the vulnerability of the energy supply chain.|
|**Cracks within NATO**|Gate-G, Gate-D|Allegations surrounding Hungary expose that the cohesion of the Western alliance is not monolithic. Undermines US leadership and the credibility of the dollar system.|
|**Re-imposition of Iran Sanctions**|Gate-G, Gate-E/F|Rekindles military tensions in the Middle East and increases the risk of a surge in crude oil prices and marine insurance premiums. Could be a direct external shock to the dollar system.|
