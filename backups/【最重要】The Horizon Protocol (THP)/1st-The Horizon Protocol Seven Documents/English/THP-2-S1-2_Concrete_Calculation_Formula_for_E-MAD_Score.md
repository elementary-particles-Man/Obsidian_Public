# The Horizon Protocol (THP) E-MAD Score: Concrete Calculation Framework

## 1. Overview of the Calculation Formula

The E-MAD (Economically-Mutually Assured Destruction) score is calculated using the following master formula:

> $$ E-MAD Score = F × M_{intent} × M_{scale} $$

This formula consists of three main components:

- F **(Foundational Damage Score)**: The objective magnitude of the damage caused by the incident.
    
- Mintent​ **(Intent Adjustment Factor)**: The degree of the organization's intent regarding the incident.
    
- Mscale​ **(Scale Adjustment Factor)**: The scope and scale of the incident's impact.
    

The final score is standardized on a scale of 0 to 100, with a higher score indicating a greater negative impact on society and the environment.

## 2. Details of the Main Components

### 2.1. Foundational Damage Score (F-Score)

The F-score is calculated by classifying incidents into three categories: **Human Impact (HUM)**, **Environmental Impact (ENV)**, and **Governance (GOV)**, and then using indicators defined within each category.

> $$ F = \sum (w_i × s_i) $$

- wi​: The weight of each evaluation indicator (total is 1.0)
    
- si​: The score of each evaluation indicator (0-100)
    

The indicators are evaluated on a 5-level scale (Level 1-5) according to the severity of the damage.

### 2.2. Intent Adjustment Factor (Mintent​)

The intent adjustment factor evaluates the organization's intent regarding the incident and adjusts the score.

|Intent Level|Description|Factor (Mintent​)|
|---|---|---|
|**Level 5: Intentional/Active**|Actively committed with malicious intent|**1.20**|
|**Level 4: Reckless Disregard**|Tolerated while recognizing the occurrence|**1.10**|
|**Level 3: Conscious Negligence**|Overlooked what could have been recognized|**1.00**|
|**Level 2: Unconscious Negligence**|Negligence with low foreseeability|**0.90**|
|**Level 1: Force Majeure**|Objectively impossible to avoid|**0.80**|

### 2.3. Scale Adjustment Factor (Mscale​)

The scale adjustment factor evaluates the scope of the incident's impact and adjusts the score.

|Impact Scale Level|Description|Factor (Mscale​)|
|---|---|---|
|**Level 5: Global Scale**|Impacts all humanity, the global ecosystem|**1.20**|
|**Level 4: Continental/Superpower Scale**|Impacts multiple countries or a wide region|**1.10**|
|**Level 3: National/Wide-Area Scale**|Impacts the entire economy or society of a country|**1.00**|
|**Level 2: Regional/Industrial Scale**|Impacts a specific region or industrial sector|**0.90**|
|**Level 1: Limited**|The scope of impact is extremely limited|**0.80**|

## 3. Detailed Scoring Matrix

The following is a specific evaluation indicator and level definition for calculating the F-score.

|Category|Code|Evaluation Indicator|Level 1 (0-20)|Level 2 (21-40)|Level 3 (41-60)|Level 4 (61-80)|Level 5 (81-100)|Weight (w)|
|---|---|---|---|---|---|---|---|---|
|**Human Impact (HUM)**|HUM-01|Impact on Life and Health|Minor health damage|Non-serious injury|Serious injury, limited death|Multiple fatalities|Mass atrocities, transgenerational health damage|0.40|
||HUM-02|Labor Rights Violations|Minor violations|Systematic exploitation|Forced labor, child labor|Widespread forced labor|Slavery|0.30|
||HUM-03|Human Rights Violations|Infringement of individual dignity|Discrimination, privacy violations|Torture, inhumane treatment|Systematic human rights violations|Ethnic cleansing|0.30|
|**Environmental Impact (ENV)**|ENV-01|Ecosystem Damage|Limited pollution|Recoverable ecosystem destruction|Serious and long-term pollution|Widespread and difficult-to-recover destruction|Irreversible ecosystem collapse|0.40|
||ENV-02|Resource Depletion|-|Overuse of renewable resources|-|Mass consumption of endangered resources|Permanent depletion of resources|0.20|
||ENV-03|Contribution to Climate Change|-|Violation of GHG protocols|-|Large-scale GHG emissions|Irreversible alteration of the climate system|0.20|
||ENV-04|Waste and Pollution|-|Improper disposal of hazardous substances|-|Widespread pollution|Transgenerational persistence of pollution|0.10|
||ENV-05|Violation of the Precautionary Principle|-|Concealment of risk information|-|Disregard of obvious dangers|Intentional disregard of catastrophic risks|0.10|
|**Governance (GOV)**|GOV-01|Corruption and Bribery|-|Minor bribery|-|Bribery of judiciary/administration|Privatization of state functions|0.40|
||GOV-02|Anti-competitive Practices|-|Market oligopoly|-|Monopoly, cartel|Structural destruction of the market economy|0.30|
||GOV-03|Information Manipulation|False advertising|Misleading information disclosure|Public opinion manipulation|Propaganda|Systematic falsification of historical facts|0.20|
||GOV-04|Lack of Accountability|-|Obstruction of audits, retaliation against whistleblowers|-|Obstruction of justice|-|0.10|

## 4. Calculation Process and Application Example

**Process:**

1. Identify the incident, determine the level of each indicator based on the matrix above, and determine the score (si​).
    
2. Calculate the F-score for each category (HUM, ENV, GOV) by weighted addition.
    
3. Calculate the final F-score for the entire incident by taking a weighted average according to the importance of the categories.
    
4. Determine the levels of intent (Mintent​) and scale (Mscale​) and determine the adjustment factors.
    
5. Substitute into the master formula to calculate the final E-MAD score.
    

**Case Study Example:** A company intentionally discharges industrial wastewater containing harmful chemicals into a river to circumvent regulations. This destroys a wide range of ecosystems and causes health problems for residents downstream.

- **F-Score Calculation:**
    
    - `HUM-01` (Life and Health): Level 3 (50)
        
    - `ENV-01` (Ecosystem Damage): Level 4 (70)
        
    - `ENV-04` (Waste and Pollution): Level 4 (70)
        
    - `GOV-04` (Accountability): Level 2 (30) ... Concealment was discovered in a later investigation
        
- **Adjustment Factors:**
    
    - `M_intent`: Level 4 (Reckless Disregard) → **1.10**
        
    - `M_scale`: Level 3 (National/Wide-Area Scale) → **1.00**
        
- **Final Score (Provisional):**
    
    - The F-score is provisionally calculated as "76.7".
        
    - **E-MAD Score** = 76.7 × 1.10 × 1.00 = **84.37**