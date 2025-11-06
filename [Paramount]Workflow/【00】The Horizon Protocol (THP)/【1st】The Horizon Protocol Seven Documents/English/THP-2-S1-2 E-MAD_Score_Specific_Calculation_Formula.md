# The Horizon Protocol (THP) E-MAD Score: Specific Calculation Framework

## 1. Overview of the Calculation Formula

The E-MAD (Economically-Mutually Assured Destruction) Score is calculated by the following master formula:

> $$ E-MAD Score = F × M_{intent} × M_{scale} $$

This formula consists of three main components:

-   F **(Base Damage Score)**: The magnitude of objective damage caused by the incident.
-   Mintent **(Intent Adjustment Factor)**: The degree of the organization's intent regarding the incident.
-   Mscale **(Scale Adjustment Factor)**: The scope and scale of the impact of the incident.

The final score is standardized to a range of 0 to 100, with a higher score indicating a greater negative impact on society and the environment.

## 2. Details of Key Components

### 2.1. Base Damage Score (F-score)

The F-score classifies incidents into three categories: **Human Impact (HUM)**, **Environmental Impact (ENV)**, and **Governance (GOV)**, and is calculated based on indicators defined within each category.

> $$ F = \sum (w_i × s_i) $$

-   wi: Weight of each evaluation indicator (sum is 1.0)
-   si: Score of each evaluation indicator (0-100)

Indicators are evaluated on a 5-level scale (Level 1-5) according to the severity of the damage.

### 2.2. Intent Adjustment Factor (Mintent)

The intent adjustment factor evaluates the organization's intent regarding the incident and adjusts the score.

|Intent Level|Description|Coefficient (Mintent)|
|---|---|---|
|**Level 5: Intentional/Active**|Actively carried out with malicious intent|**1.20**|
|**Level 4: Willful Blindness**|Recognized the occurrence but tolerated it|**1.10**|
|**Level 3: Conscious Negligence**|Could have recognized but overlooked|**1.00**|
|**Level 2: Unconscious Negligence**|Negligence with low foreseeability|**0.90**|
|**Level 1: Force Majeure**|Objectively unavoidable|**0.80**|

### 2.3. Scale Adjustment Factor (Mscale)

The scale adjustment factor evaluates the scope of the incident's impact and adjusts the score.

|Impact Scale Level|Description|Coefficient (Mscale)|
|---|---|---|
|**Level 5: Global Scale**|Impacts all humanity, global ecosystems|**1.20**|
|**Level 4: Continental/Major Power Scale**|Impacts multiple countries or wide regions|**1.10**|
|**Level 3: National/Widespread Scale**|Impacts an entire nation's economy or society|**1.00**|
|**Level 2: Regional/Industrial Scale**|Impacts a specific region or industrial sector|**0.90**|
|**Level 1: Limited**|Extremely limited impact scope|**0.80**|

## 3. Detailed Scoring Matrix

Below are the specific evaluation indicators and level definitions for calculating the F-score.

|Category|Code|Evaluation Indicator|Level 1 (0-20)|Level 2 (21-40)|Level 3 (41-60)|Level 4 (61-80)|Level 5 (81-100)|Weight (w)|
|---|---|---|---|---|---|---|---|---|
|**Human Impact (HUM)**|HUM-01|Impact on Life and Health|Minor health damage|Non-serious injury|Serious injury, limited deaths|Numerous deaths|Mass genocide, intergenerational health damage|0.40|
||HUM-02|Labor Rights Violations|Minor violations|Systematic exploitation|Forced labor, child labor|Widespread forced labor|Slavery|0.30|
||HUM-03|Human Rights Violations|Violation of individual dignity|Discrimination, privacy infringement|Torture, inhumane treatment|Systematic human rights abuses|Ethnic cleansing|0.30|
|**Environmental Impact (ENV)**|ENV-01|Ecosystem Damage|Limited pollution|Recoverable ecosystem destruction|Serious and long-term pollution|Widespread and difficult-to-recover destruction|Irreversible ecosystem collapse|0.40|
||ENV-02|Resource Depletion|-|Overuse of renewable resources|-|Mass consumption of endangered resources|Permanent resource depletion|0.20|
||ENV-03|Climate Change Promotion|-|Violation of GHG protocol|-|Large-scale GHG emissions|Irreversible alteration of climate system|0.20|
||ENV-04|Waste and Pollution|-|Improper disposal of hazardous substances|-|Widespread pollution spread|Intergenerational persistence of pollution|0.10|
||ENV-05|Violation of Precautionary Principle|-|Concealment of risk information|-|Disregard of clear dangers|Intentional disregard of catastrophic risks|0.10|
|**Governance (GOV)**|GOV-01|Corruption and Bribery|-|Minor bribery|-|Bribery of judiciary/administration|Privatization of state functions|0.40|
||GOV-02|Anti-competition|-|Market monopolization|-|Monopoly, cartel|Structural destruction of market economy|0.30|
||GOV-03|Information Manipulation|False advertising|Misleading information disclosure|Public opinion manipulation|Propaganda|Systematic falsification of historical facts|0.20|
||GOV-04|Lack of Accountability|-|Obstruction of audit, retaliation against whistleblowers|-|Obstruction of justice|-|0.10|

## 4. Calculation Process and Application Examples

**Process:**

1.  Identify the incident, determine the level of each indicator based on the matrix above, and determine the score (si).
2.  Calculate the F-score for each category (HUM, ENV, GOV) by weighted addition.
3.  Calculate the overall F-score for the incident by weighted averaging according to the importance of the categories, and determine the final F-score.
4.  Determine the levels of intent (Mintent) and scale (Mscale), and determine the adjustment factors.
5.  Substitute into the master formula to calculate the final E-MAD score.

**Case Study Example:** A company intentionally discharged industrial wastewater containing harmful chemicals into a river to circumvent regulations. This resulted in widespread ecosystem destruction and health damage to residents downstream.

-   **F-score Calculation:**

    -   `HUM-01` (Life and Health): Level 3 (50)
    -   `ENV-01` (Ecosystem Damage): Level 4 (70)
    -   `ENV-04` (Waste and Pollution): Level 4 (70)
    -   `GOV-04` (Accountability): Level 2 (30) ... Concealment discovered in later investigation

-   **Adjustment Factors:**

    -   `M_intent`: Level 4 (Willful Blindness) → **1.10**
    -   `M_scale`: Level 3 (National/Widespread Scale) → **1.00**

-   **Final Score (Provisional):**

    -   F-score provisionally calculated as "76.7."
    -   **E-MAD Score** = 76.7 × 1.10 × 1.00 = **84.37**
