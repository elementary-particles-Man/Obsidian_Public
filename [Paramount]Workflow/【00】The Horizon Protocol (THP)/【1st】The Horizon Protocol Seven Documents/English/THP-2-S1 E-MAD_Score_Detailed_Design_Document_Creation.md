# Total Human Prosperity (THP) E-MAD Score: Detailed Design and Framework Specifications

## Executive Summary

This specification defines the detailed design for the "E-MAD (Economically-Mutually Assured Destruction) Score," which quantitatively evaluates negative impacts on society and the environment, based on the philosophy of Total Human Prosperity (THP). The objective is to elevate the initial concept into a fully specified, auditable, and scalable framework by conducting multi-faceted design reviews based on the presented prototype and integrating international norms and established risk assessment methodologies.

The core of the E-MAD score lies in its two-stage architecture, which separates the objective damage assessment from the evaluation of contextual factors such as intent and scale. This structure reflects best practices adopted in advanced judgment systems, such as legal sentencing, credit ratings in the financial sector, and incident evaluations in ESG (Environmental, Social, and Governance), thereby ensuring transparency and fairness.

This framework explicitly aligns its evaluation criteria with international norms such as the UN Global Compact, the fundamental conventions of the International Labour Organization (ILO), and the OECD Guidelines for Multinational Enterprises. This ensures the legitimacy and global applicability of the score. By prioritizing the use of disclosed information compliant with GRI (Global Reporting Initiative) Standards as a data source, a direct and auditable link is established between the reporting of the evaluated organization itself and its score.

 The E-MAD score defined in this specification functions not merely as a penalty system, but as a "social credit rating" within the THP economic sphere. It provides a standardized and advanced signal to stakeholders, indicating the risk of an organization generating negative externalities in the future. This design establishes the technical foundation for translating THP's philosophy into a concrete measurement and evaluation tool, contributing to the construction of a more just and sustainable socio-economic system.

## 1. Architectural Principles and Framework Overview

### 1.1. Conceptual Consistency with Total Human Prosperity (THP)

The E-MAD score does not exist as a standalone punitive system but is a measurement tool designed to protect and promote the ideals of THP. Its fundamental purpose is to quantify actions that actively undermine collective well-being. Well-being here is a comprehensive concept that transcends material wealth, encompassing psychological satisfaction, social connections, and a healthy ecosystem. This score functions as a counter-metric to traditional economic indicators like GDP, which fail to capture negative externalities. It operationalizes the principles of a "well-being economy" by creating clear disincentives for activities that harm the planet and its people.

This framework explicitly adopts a Human-Centered approach, prioritizing the living standards and well-being of the median household over abstract economic output. This philosophy is fully consistent with the global "Beyond GDP" movement, which seeks more comprehensive measures of social progress. The E-MAD score is an indispensable component for translating THP's philosophical foundation into a concrete evaluation system.

### 1.2. Core Scoring Architecture: Two-Stage Impact Assessment

The two-stage structure presented in the prototype (① objective damage assessment → ② contextual modification by intent/scale) is a robust design pattern proven effective in advanced judgment systems. This design clearly separates two distinct questions: "what happened (damage)" and "why it happened (attribution)." This separation is crucial for enhancing the transparency of the evaluation process, eliminating arbitrariness, and ensuring fairness. This architecture has strong analogies with established frameworks in multiple fields.

-   **Analogy with Legal Sentencing**: This structure reflects legal frameworks such as the U.S. Federal Sentencing Guidelines. These guidelines first determine a "base offense level" based on the seriousness of the crime, and then apply "adjustment factors" such as the role in the offense, criminal history, and obstruction of justice to determine the final sentence. Stage 1 (Provisional Composite Score P) in the E-MAD score corresponds to the "base offense level," and Stage 2 (intent/scale coefficients) corresponds to the "adjustment factors."

-   **Analogy with ESG Incident Evaluation**: Major ESG rating agencies such as Sustainalytics and MSCI, when evaluating negative events (conjunctures), first objectively assess the "severity of the impact" (e.g., scale of environmental pollution) and, separately, analyze the company's "management system and response" (e.g., promptness of post-incident response, recurrence prevention measures). The E-MAD score model formalizes this evaluation logic, clearly distinguishing objective damage (Score P) from contextual factors such as intent (Mintent) and scale (Mscale).

-   **Analogy with Credit Risk Assessment**: Credit rating agencies combine a company's business and financial risk profiles to calculate a benchmark rating called an "anchor," and then apply "modifying factors" such as governance, liquidity, and peer comparison to determine the final rating. The Provisional Composite Score P in the E-MAD score corresponds to this "anchor" and is modified by M-factors (Modifier factors).

This two-stage architecture is a logical consequence of enhancing the overall reliability and legitimacy of the score by breaking down each element of the evaluation and making each independently verifiable.

### 1.3. Guiding Principles

The design, operation, and future development of the E-MAD score shall strictly adhere to the following four guiding principles:

-   **Simplicity & Transparency**: Score calculation shall use only basic arithmetic operations (addition and multiplication) and publicly available, non-proprietary reference tables. This approach, which completely eliminates "black boxes," is an essential requirement for ensuring the legitimacy and auditability of the score, and directly addresses a major criticism of some complex ESG and financial models.

-   **Auditability**: All steps of the calculation process, from raw indicator data to the final score, must be recorded and traceable. This ensures that any score can be independently verified and reproduced by a third party.

-   **Extensibility**: The category-separated, additive modular design means that the core engine does not need to be redesigned when new impact categories (e.g., "cultural heritage," "animal welfare") are added in the future. The addition of new categories is completed by defining only a new set of indicators and corresponding scoring tables.

-   **Normative Grounding**: The definitions of "damage" and "non-compliance" are not arbitrarily determined. They explicitly rely on internationally established norms and standards such as the UN Global Compact (UNGC), International Labour Organization (ILO) conventions, and OECD guidelines. This provides a defensible and globally recognized basis for the value judgments of the score.

By adhering to these principles, the E-MAD score means more than just a number. It functions as a measure of trust in society, a kind of "non-financial credit rating." Just as traditional credit ratings assess an entity's ability to fulfill financial obligations and signal reliability in capital markets, the E-MAD score assesses the degree to which an entity adheres to social and environmental responsibilities as defined by THP principles and international norms. Its architecture (objective analysis, contextual modification, strict governance, and appeal process) reflects the structure of credit rating agencies. Therefore, a low E-MAD score is a sophisticated risk signal, indicating a high risk of generating negative externalities in the future, just as a low credit rating suggests a high risk of future financial default. This redefinition elevates the purpose of the score from simple punishment to advanced risk information provision for all stakeholders (investors, policymakers, consumers, etc.).

## 2. Stage 1 - Objective Impact Assessment: Categories and Base Score (S)

The first stage of scoring evaluates the objective damage caused by an event across five independent categories and calculates a base score (S) for each. In this process, subjective elements such as intent and negligence are intentionally excluded, and only the scale and severity of the damage are focused on. The evaluation scale for each category is defined based on internationally recognized standards and scientific knowledge, ensuring transparency and comparability.

### 2.1. Human Impact (HUM)

-   **Basic Principle**: This category measures direct and indirect harm to human life, health, well-being, and fundamental rights. It aims to capture broader impacts beyond mere casualties, such as the structure of human rights violations and the impairment of human potential, aligning with the core values of THP.

-   **Indicators and Benchmarks**:

    -   `HUM-01: Deaths and Serious Injuries`: Measures the number of deaths and serious injuries directly attributable to the event.

    -   `HUM-02: Violation of Fundamental Labor Rights`: Evaluates acts that violate the 11 fundamental conventions established by the International Labour Organization (ILO). This includes forced labor (Conventions No. 29, No. 105), child labor (Conventions No. 138, No. 182), discrimination (Conventions No. 100, No. 111), and freedom of association (Conventions No. 87, No. 98). This indicator also complies with Principles 3-6 of the UN Global Compact.

    -   `HUM-03: Complicity in Human Rights Violations`: Measures involvement in violations of internationally recognized human rights as enshrined in the Universal Declaration of Human Rights and referred to in UNGC Principles 1 and 2. This aligns with the UN "Protect, Respect and Remedy" Framework and Chapter IV of the OECD Guidelines for Multinational Enterprises.

    -   `HUM-04: Negative Impact on Health and Well-being`: Evaluates broader impacts such as community health (including mental health), access to medical care, and exposure to harmful environments. This is consistent with Goal 3 of the Sustainable Development Goals (SDGs) and the emphasis on health outcomes in the OECD Well-being Framework.

    -   `HUM-05: Forced Displacement of Residents and Destruction of Livelihoods`: Quantifies the number of people forcibly displaced or whose primary livelihoods have been destroyed.

### 2.2. Economic Impact (ECO)

-   **Basic Principle**: Measures not only direct monetary losses but also the destruction of economic resilience and the hindrance of inclusive prosperity. This reflects THP's shift in focus from a GDP-centric view to sustainable and shared wealth.

-   **Indicators and Benchmarks**:

    -   `ECO-01: Direct Economic Loss`: Quantified as a percentage of the GDP of the affected region or the revenue of the organization concerned (whichever is more appropriate for assessing scale). This is a standard indicator in financial risk assessment.

    -   `ECO-02: Systemic Disruption and Supply Chain Impact`: Evaluates the degree of disruption to critical infrastructure, key industries, or essential services. It draws on the concept of strategic risk management.

    -   `ECO-03: Job Destruction and Increase in Precarious Employment`: Measures net job losses and the shift to precarious or non-regular forms of employment. This is a major concern in human-centered economics.

    -   `ECO-04: Asset Destruction and Widening Wealth Inequality`: Quantifies the destruction of public and private assets (housing, community infrastructure, etc.) and evaluates the impact on regional wealth inequality (e.g., disproportionate impact on low-income groups).

### 2.3. Environmental Impact (ENV)

-   **Basic Principle**: Evaluates the severity, scope, and permanence of environmental damage based on established scientific and regulatory frameworks. This reflects THP's principle that human prosperity is inseparable from planetary health.

-   **Indicators and Benchmarks**:

    -   `ENV-01: Geographical Scope and Ecosystem Damage`: Measures the affected area (km2) and the ecological importance of that ecosystem (e.g., protected wetlands, old-growth forests) using environmental impact assessment (EIA) methods.

    -   `ENV-02: Severity of Pollution`: Compares pollutant concentrations with established safety standards (WHO, EPA, etc.) and evaluates the toxicity and persistence of released substances.

    -   `ENV-03: Irreversibility and Recovery Period`: Estimates the time required for the environment to recover to its baseline state and imposes maximum penalties for "permanent" damage. This is a critical indicator in natural resource damage assessment (NRDA).

    -   `ENV-04: Biodiversity Loss`: Quantifies the impact on endangered or keystone species and the degradation of critical habitats.

    -   `ENV-05: Violation of the Precautionary Approach Principle`: Evaluates whether the precautionary approach to environmental problems, a core tenet of UNGC Principle 7 and the Rio Declaration, was not upheld.

### 2.4. Governance and Compliance (GOV)

-   **Basic Principle**: Measures failures in an organization's internal controls, ethical culture, and adherence to legal and normative standards of conduct. Strong governance is the foundation for preventing negative impacts in all other categories.

-   **Indicators and Benchmarks**:

    -   `GOV-01: Corruption and Bribery`: Evaluates involvement in bribery, extortion, and other forms of corruption as defined by the UN Convention Against Corruption and UNGC Principle 10.

    -   `GOV-02: Anti-competitive Practices`: Measures involvement in price cartels, market manipulation, and other antitrust violations.

    -   `GOV-03: Structural Non-compliance`: Identifies repetitive patterns of legal violations and indicates structural deficiencies in compliance functions. This is a critical factor in corporate sentencing.

    -   `GOV-04: Retaliation Against Whistleblowers`: Measures retaliatory actions taken against individuals who reported misconduct. This is a definitive indicator of a poor ethical culture and weak internal oversight.

    -   `GOV-05: Obstruction of Justice`: Evaluates attempts to conceal information, destroy evidence, or otherwise impede investigations. This is a significant aggravating factor in legal and regulatory contexts.

### 2.5. Information Integrity (INF)

-   **Basic Principle**: Measures damage caused by the intentional or negligent dissemination of false, misleading, or incomplete information. Such acts fundamentally undermine stakeholder trust and informed decision-making.

-   **Indicators and Benchmarks**:

    -   `INF-01: Scale of Dissemination of False Information`: Quantifies the reach and impact of false information (e.g., number of people reached, affected market value).

    -   `INF-02: Deceptive Practices (e.g., Greenwashing)`: Evaluates the extent to which an organization exaggerates its positive impacts or conceals negative impacts. This is a major concern in ESG analysis.

    -   `INF-03: Violation of Material Information Disclosure Obligations`: Measures the failure to report known material risks or negative impacts in a timely and transparent manner. This is a core violation of reporting standards.

    -   `INF-04: Promptness and Completeness of Correction`: Evaluates an organization's response after false information is discovered. Prompt, comprehensive, and public correction mitigates score penalties.

### 2.6. Indicator Mapping and Data Sourcing

-   **Primary Data Sources**: This framework prioritizes the use of public, standardized, and verifiable data. GRI Standards are designated as the primary data framework because they provide a modular and comprehensive system for reporting impacts across economic, environmental, and social topics.

-   **Mapping Protocol**: Each E-MAD indicator (e.g., `HUM-02`) is mapped to specific GRI disclosure items (e.g., GRI 400 series: disclosure items related to social topics). This creates a direct and auditable link between corporate self-reporting and the E-MAD score.

-   **Secondary Data Sources**: If self-disclosed data is unavailable or unreliable, the framework utilizes data from credible third-party organizations. This includes:

    -   Conjecture reports from ESG rating agencies (Sustainalytics, MSCI).
    -   Reports from international organizations (UN, OECD, World Bank) and highly-regarded NGOs.
    -   Judgments by government and judicial bodies (rulings, regulatory fines, etc.).

This data sourcing strategy embeds a strong incentive structure within the E-MAD framework. The reliability of the score depends on auditable and trustworthy data, and by design, data from standardized frameworks like GRI are prioritized. Therefore, organizations aiming for a good E-MAD score (or challenging a low score) will have a strong incentive to provide comprehensive, GRI-compliant data to demonstrate their performance and impact management. Failure to disclose data on material topics as defined by GRI 3 is likely to result in a default low score for that indicator based on negative inferences from secondary sources. As a result, the E-MAD score functions as a kind of "forcing function." It transforms voluntary disclosure standards into de facto requirements for all organizations concerned about their social reputation and associated risks. This creates a symbiotic relationship where the evaluation framework (E-MAD) promotes the adoption of the disclosure framework (GRI), enhancing the robustness of the overall system.

|Severity Level|Level Definition (Examples of Quantitative/Qualitative Criteria)|Base Score (S)|
|---|---|---|
|**Level 1: Minor**|- **`HUM-01`**: No deaths or serious injuries. - **`HUM-02`**: Isolated and minor violations of ILO fundamental conventions confirmed, but corrective actions promptly completed. - **`HUM-03`**: Risk of negative human rights impact identified, but prevented through due diligence.|100|
|**Level 2: Limited**|- **`HUM-01`**: 1-9 deaths, or 1-49 serious injuries. - **`HUM-02`**: Multiple non-core labor rights violations confirmed, such as restrictions on freedom of association. - **`HUM-05`**: Fewer than 100 local residents temporarily evacuated.|80|
|**Level 3: Significant**|- **`HUM-01`**: 10-99 deaths, or 50-499 serious injuries. - **`HUM-02`**: Limited cases of child labor or forced labor found within the supply chain (violations of ILO Conventions No. 182, No. 29). - **`HUM-03`**: Complicity in human rights violations pointed out, and recommendations received from the UN Human Rights Council, etc.|60|
|**Level 4: Severe**|- **`HUM-01`**: 100-999 deaths, or 500-4,999 serious injuries. - **`HUM-02`**: Structural discrimination or forced labor found to be rampant within the organization. - **`HUM-05`**: More than 10,000 residents forced into permanent relocation.|40|
|**Level 5: Catastrophic**|- **`HUM-01`**: 1,000 or more deaths, or 5,000 or more serious injuries. - **`HUM-02`**: Systematic child labor or forced labor discovered to be at the core of the business. - **`HUM-03`**: Direct and active involvement in human rights violations recognized by international judicial bodies.|20|

_Note: The table above is a conceptual example for the Human Impact (HUM) category. In actual operation, detailed criteria will be defined for each indicator (`HUM-01` to `HUM-05`). If there are multiple applicable events within a category, the most severe level (i.e., the lowest base score) will be adopted as the score for that category. This "worst-event principle" is an important risk management measure to prevent a single catastrophic failure from being averaged out and overlooked by other minor events._

## 3. Calculation of Provisional Composite Score (P)

The base scores (S) for each category calculated in Stage 1 are then weighted and aggregated to form the Provisional Composite Score (P). This score represents the objective multi-dimensional damage of an event as a single numerical value.

### 3.1. Weighting Framework

-   **Default Settings**: As indicated in the prototype, by default, all categories are assigned equal weights (w=1). This is a measure to maximize simplicity and fairness, avoiding subjective value judgments that certain types of damage (e.g., environmental) are inherently more important than others (e.g., human).

-   **Materiality-Based Adjustment (Advanced Option)**: The framework includes an option to apply materiality-based weighting in specific contexts. This approach is based on the concept of GRI Standards, which are global standards for ESG evaluation and sustainability reporting. In the event that the impact of a particular event is significantly concentrated in a specific category, it is possible to increase the weight of that category. For example, in the case of a large-scale oil spill, the weight of the ENV category could be set to wENV = 1.5, and in the case of large-scale accounting fraud that shakes the financial system, the weights of ECO and GOV could be set to wECO = 1.25 and wGOV = 1.25, respectively. The application of this weighting adjustment shall only be carried out in accordance with publicly disclosed, transparent methodologies and governance processes (see Section 6).

### 3.2. Aggregation and Normalization

The aggregated score (P) is the weighted average of the base scores (Si) and weights (wi) for each category:

P = Σ(wi * Si) / Σwi (0 ≤ P ≤ 100)

However, N/A categories are excluded from both the numerator and denominator. The default value is (wi = 1.0). Rounding is to one decimal place. If there are many missing values and fewer than 2 valid categories, scoring is withheld (requires review).

-   **Application of the Worst-Event Principle**: The rule presented in the prototype, "if there are multiple indicators within the same category, the minimum value is adopted," is formally adopted. This is an important principle for reflecting the most severe aspects of the evaluation target in the score. This rule prevents excellent performance within a category from masking a single catastrophic failure within the same category. This is consistent with the concept of "tail risk" in risk management, which emphasizes events with a low probability of occurrence but a severe impact.

## 4. Stage 2 - Contextual Modification and Final Score (F)

The Provisional Composite Score (P) reflects the objective damage of an event, but it alone cannot capture the full picture. In Stage 2, two important modifying factors (Modifiers), "intent" and "scale," are applied to the context in which the event occurred, and the Final Score (F) is calculated. This stage adds qualitative dimensions of attribution and impact diffusion to the objective damage assessment.

### 4.1. Intent/Negligence Coefficient (Mintent)

The judgment first divides into "minor/major" based on the presence or absence of damage, and then evaluates intent.

Mintent ∈ {1.00, 0.80, 0.60, 0.30}

|Level|Definition|Coefficient|
|---|---|---|
|**L1: Good Faith/Slight Negligence**|No victims (no actual human or property damage, near miss/limited deviation)|1.00|
|**L2: Gross Negligence (Damage Occurred)**|Negligence but with victims (area where Mscale > 1.00 below)|0.80|
|**L3: Malice (Limited)**|Intentional but limited (no concealment/repetition, etc.)|0.60|
|**L4: Malice (Serious)**|Clear intent + concealment/repetition/organizational involvement, etc.|0.30|

Export to Google Spreadsheet

*The distinction between "minor/major" is the presence or absence of damage. If even one victim occurs, it is not slight negligence but scored at L2 or higher.

### 4.2. Damage Scale Coefficient (Mscale)

Mscale ∈ {1.00, 0.90, 0.70, 0.40, 0.10}

|Category|Guideline|Coefficient|
|---|---|---|
|**None**|No deaths/injuries, property/environmental damage|1.00|
|**Small**|Individual/Small scale (~10 people, ~$100k equivalent, local environment)|0.90|
|**Medium**|Regional/Departmental unit (~100 people, ~$1M)|0.70|
|**Large**|Widespread/Serious (~1,000 people, ~$10M)|0.40|
|**Catastrophic**|Catastrophe (>1,000 people, >$10M, irreversible)|0.10|

Export to Google Spreadsheet

*If there is "damage," it is not slight negligence but evaluated at L2 or higher (previous section).

### 4.6. Final Score

F = clamp(P × Mintent × Mscale)

Rounding to one decimal place. Simplicity, auditability, and reproducibility are prioritized, and coefficients are limited to these two.

*Exposure/diffusion and corrective efforts are supplemented in the report body (referenced in sentencing). Not included in the formula (to prevent complexity).

### 4.7. Fixed Evaluation Order

① Calculate P → ② Determine minor/major based on presence/absence of damage → ③ Select (Mintent) (minor = 1.00, major = 0.80/0.60/0.30) → ④ Select (Mscale) → ⑤ Calculate (F).

Each selection basis (evidence ID/criterion article) must be linked to the audit log.

### Note on Scope of Application

This score aims for micro-evaluation of order maintenance. Its application is limited to non-violent E-Penalty (credit score adjustment, risk premium, etc.). If sanctions step into the atonement/condemnation framework (E-MAD), it falls under the jurisdiction of each National Council of Ethics and is separated from this design.

## 5. "Crimson" Designation: Protocol for Extreme Events

The E-MAD framework includes a special designation to address the most severe inhumane acts that go beyond the scope of normal numerical scoring: the "Crimson" designation.

### 5.1. Definition and Triggers

-   **Basic Principle**: The Crimson designation is not a score, but a qualitative flag indicating that an organization has been involved in the most serious international crimes. Since the nature of the act itself transcends the framework of quantitative damage assessment, normal scoring logic is bypassed. The application of this designation must be based on strict, clear, and legally defensible criteria to eliminate arbitrariness and ensure maximum legitimacy.

-   **Legal Basis**: The triggers for Crimson designation rely directly and exclusively on the definitions of crimes stipulated in the Rome Statute of the International Criminal Court (ICC). This confers the highest level of authority under international law. The ambiguous definition of "nuclear, genocide, etc." in the prototype is concretized by these strict legal standards.

-   **Key Triggers**:

    -   **`Genocide`**: Acts committed with intent to destroy, in whole or in part, a national, ethnical, racial or religious group. Uses the definition of Article 6 of the Rome Statute as is.

    -   **`Crimes Against Humanity`**: Acts committed as part of a widespread or systematic attack directed against any civilian population (murder, extermination, enslavement, torture, etc.). Uses the definition of Article 7 of the Rome Statute as is.

    -   **`Systematic War Crimes`**: Grave breaches of the Geneva Conventions (such as intentionally directing attacks against civilians or civilian objects) committed as part of a plan or policy or on a large scale. Complies with the definition of Article 8 of the Rome Statute.

### 5.2. Activation and Judgment Process

-   **Triggering Evidence**: The Crimson designation is activated only by an official recognition, indictment, or sanction by an authorized international or national judicial body (e.g., ICC, UN-backed special tribunals), or an official decision by the UN Security Council or Human Rights Council, to avoid the E-MAD score evaluator making its own quasi-judicial judgment.

-   **Application**: When such a recognition occurs, the organization automatically receives the Crimson designation. This designation takes precedence over any numerical score. This is an immediate status change within the E-MAD system that cannot be appealed.

This design of the Crimson designation has significant implications, transforming the E-MAD score from a mere measurement tool into an enforcement mechanism for international humanitarian law within the THP framework. By grounding the source of legal legitimacy in the judgments of internationally authoritative bodies like the ICC, the E-MAD system does not make new judgments but rather plays a role in **recognizing and amplifying** existing authoritative legal and political judgments. In other words, the Crimson designation does not mean "score 0." It is a signal of a "state change," indicating that the organization is engaged in activities beyond the acceptable limits of the international community, similar to the World Bank's debarment list. This makes the E-MAD score a powerful tool for translating international legal recognition into concrete outcomes within the THP economic system.

## 6. Operational Governance and Lifecycle Management

Strict operational governance and systematic lifecycle management are essential to ensure the reliability, consistency, and long-term validity of the E-MAD score. This section defines the structure for framework oversight, score review and appeal processes, and periodic methodological reviews.

### 6.1. Framework Oversight

-   **THP Standards Board**: Modeled after the GRI's Global Sustainability Standards Board (GSSB) and boards overseeing financial standards, an independent governance body, the "THP Standards Board," composed of diverse stakeholders, shall be established. The responsibilities of this board include maintaining the public rulebook (including all scoring tables and definitions), reviewing methodologies, and overseeing the appeal process.

-   **Ensuring Transparency**: To ensure full transparency, all minutes of board meetings, methodological documents, and decisions shall be made public.

### 6.2. Score Review and Appeal Process

-   **Rationale**: A credible scoring system requires a formal correction and appeal process to ensure fairness and accuracy. This builds trust from stakeholders and the legitimacy of the system.

-   **Process Based on Best Practices**:

    -   **Stage 1: Notification to Evaluated Entity and Fact-Checking**: Referring to S&P Global Ratings' policies, the evaluated organization shall be notified in advance of an impending score change and given a period to confirm that there are no factual errors in the underlying data.

    -   **Stage 2: Formal Appeal**: If an organization believes that the methodology has been incorrectly applied to the facts, it may file a formal appeal with an independent review committee established within the THP Standards Board. This two-stage structure (initial review followed by appeal) is modeled after the World Bank's sanctions system (first-stage suspension/debarment officer and second-stage sanctions committee).

    -   **Ensuring Independence**: To ensure objective review, the appeal committee must be completely independent of the team that conducted the initial scoring.

### 6.3. Periodic Methodological Review

-   **Review Cycle**: The entire E-MAD score methodology shall undergo a comprehensive public review on a fixed cycle (e.g., every 3-5 years), similar to the review processes for credit rating methodologies and GRI Standards.

-   **Process**: The review process shall include public consultations with stakeholders such as evaluated organizations, civil society, and academic experts. This allows for the incorporation of new research findings, addressing newly emerging forms of harm, and continuously maintaining the validity and robustness of the score.

|Step|Process|Responsible Body|Remarks|
|---|---|---|---|
|**1**|**Event Occurrence**|-|Incident that is the starting point of the evaluation.|
|**2**|**Data Collection**|E-MAD Analysis Team|Collects objective data from GRI reports, news, NGO reports, judicial decisions, etc.|
|**3**|**Initial Scoring**|E-MAD Analysis Team|Calculates the base score (S) for each category based on the scoring table.|
|**4**|**Provisional Composite Score (P) Calculation**|E-MAD Analysis Team|Calculates P by weighted average.|
|**5**|**Application of Modifying Factors**|E-MAD Analysis Team|Evaluation and application of intent (Mintent) and scale (Mscale).|
|**6**|**Drafting of Final Score (F)**|E-MAD Analysis Team|Calculates F = P × Mintent × Mscale.|
|**7**|**Notification to Evaluated Entity and Fact-Checking**|E-MAD Analysis Team → Evaluated Organization|Provides an opportunity to fact-check the underlying data before the final score is released.|
|**8A**|**Final Score Release**|E-MAD Analysis Team|Releases the score if there are no objections or after the process is complete.|
|**8B**|**Formal Appeal**|Evaluated Organization → Appeal Committee|Formally submits an appeal regarding the application of the methodology.|
|**9**|**Review and Ruling on Appeal**|Appeal Committee|Reviews the appeal from an independent standpoint and makes a final decision.|
|**10**|**Final Score Release Based on Ruling**|E-MAD Analysis Team|Releases the score reflecting the committee's ruling.|
|**※**|**Crimson Designation**|External Judicial/International Bodies → E-MAD System|Based on official recognition by external authoritative bodies, immediately applied bypassing the numerical scoring process above.|

Export to Google Spreadsheet

_This flowchart illustrates the structured procedure for ensuring transparency, accountability, and fairness throughout the E-MAD score lifecycle. Each step is clearly defined, and responsibilities are made explicit. This allows all participants (evaluated entities, score users, and the general public) to understand that the system operates according to predictable and fair procedures, enhancing the overall reliability of the system._

## Conclusion

This detailed design document concretizes the THP E-MAD score prototype into a theoretically robust, operationally feasible, and internationally legitimate evaluation framework. This design is summarized in the following key conclusions and recommendations:

1.  **Embodiment of Philosophy**: The E-MAD score operationalizes THP's core philosophy of "human-centered prosperity" in a measurable way. By quantifying negative externalities overlooked by traditional indicators like GDP, it provides a new metric for evaluating whether economic activities truly contribute to human well-being.

2.  **Establishment of Structural Robustness**: The two-stage architecture, which separates objective damage assessment and contextual modification, applies best practices from legal judgment and financial risk assessment, maximizing the transparency, fairness, and auditability of the evaluation process.

3.  **Adherence to International Norms**: By explicitly aligning evaluation criteria with established international norms such as the UN Global Compact, ILO fundamental conventions, and OECD Guidelines for Multinational Enterprises, the score eliminates arbitrariness and ensures legitimacy and acceptance in a global context. This establishes the E-MAD score as a universal evaluation tool unbiased by specific cultures or values.

4.  **Strictness of "Crimson" Designation**: By strictly relying on the Rome Statute of the International Criminal Court for the triggers of the "Crimson" designation for extreme events such as genocide and crimes against humanity, and limiting its activation to official recognition by authoritative international bodies, the risk of the scoring system making quasi-judicial judgments is avoided, and it becomes a powerful mechanism to support the enforcement of international humanitarian law.

5.  **Creation of Incentives for Data Disclosure**: Prioritizing GRI Standards-compliant disclosed information as a data source is not merely a technical choice. It functions as a strong incentive for companies and organizations to voluntarily disclose high-quality, standardized information about their social and environmental impacts. This makes the E-MAD score a catalyst for increasing overall societal transparency.

**Recommendation**: The success of the E-MAD score depends not only on the sophistication of its design but also on the reliability of the governance system that supports its operation. Therefore, as a next step, it is recommended to immediately begin drafting specific articles of incorporation, selection processes, and operating rules for the "THP Standards Board" and "Appeal Committee" outlined in this specification. Ensuring the independence, expertise, and diverse stakeholder representation of these bodies is key to the E-MAD score gaining sustained trust and functioning as a core infrastructure of the THP economic sphere.

Ultimately, the E-MAD score presented in this design document is not just a tool to punish negative acts. It is a compass to envision a better future, measure progress towards it, and guide all organizations to fulfill their responsibility to contribute to Total Human Prosperity.

---

## Appendix

### Appendix A: Minimum Example

Example: 3 categories (all w=1), (S={80,60,90}) → (P=(80+60+90)/3=76.7).

Damage: None → (Mintent=1.00), (Mscale=1.00).

Final: (F=76.7×1.00×1.00=76.7⇒76.7).

### Appendix B: Linkage between E-MAD Score and International Frameworks

_This matrix shows how each evaluation category of the E-MAD score aligns with key international norms and goals._

|E-MAD Category|Indicator (Example)|Related SDGs|Related UNGC Principles|Related ILO Fundamental Conventions|Related OECD Guidelines|
|---|---|---|---|---|---|
|**Human Impact (HUM)**|`HUM-02` Labor Rights Violations|8: Decent Work and Economic Growth|3, 4, 5, 6|C87, C98, C29, C105, C138, C182, C100, C111|V. Employment and Industrial Relations|
||`HUM-03` Human Rights Violations|16: Peace, Justice, and Strong Institutions|1, 2|-|IV. Human Rights|
|**Environmental Impact (ENV)**|`ENV-01` Ecosystem Damage|14: Life Below Water, 15: Life on Land|8, 9|-|VI. Environment|
||`ENV-05` Violation of Precautionary Principle|12: Responsible Consumption and Production|7|-|VI. Environment|
|**Governance (GOV)**|`GOV-01` Corruption and Bribery|16: Peace, Justice, and Strong Institutions|10|-|VII. Combating Bribery, Bribe Solicitation and Extortion|
||`GOV-04` Retaliation Against Whistleblowers|16: Peace, Justice, and Strong Institutions|-|-|II. General Policies|
|**Economic Impact (ECO)**|`ECO-03` Job Destruction|8: Decent Work and Economic Growth|6|C111|V. Employment and Industrial Relations|
|**Information Integrity (INF)**|`INF-02` Deceptive Practices|12: Responsible Consumption and Production|-|-|III. Disclosure of Information|

Export to Google Spreadsheet

### Appendix C: Definitions of Key Terms

-   **Total Human Prosperity (THP)**: A state of comprehensive and sustainable prosperity for humanity and society, encompassing not only material wealth but also psychological well-being, social connections, the realization of individual potential, and a healthy global environment.

-   **Due Diligence**: The process that organizations should undertake to identify, prevent, mitigate, and account for how they address actual or potential negative impacts on human rights, the environment, etc., through their own activities and business relationships.

-   **Materiality**: The judgment that a topic is sufficiently important to reflect an organization's economic, environmental, and social impacts, and to substantially influence stakeholder evaluations and decision-making.

-   **Gross Negligence**: An act of consciously and voluntarily disregarding the need to exercise reasonable care, recognized as having an extremely high probability of causing foreseeable serious harm.

-   **Precautionary Approach**: The principle that where there are threats of serious or irreversible damage, lack of full scientific certainty shall not be used as a reason for postponing cost-effective measures to prevent environmental degradation.

-   **Rome Statute**: The international treaty that establishes the International Criminal Court (ICC), its jurisdiction, and functions. It defines the most serious international crimes, such as genocide, crimes against humanity, and war crimes.
