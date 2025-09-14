# The Horizon Protocol (THP)
## E‑MAD Formal Specification (v1.1)

### 0. Preface
This document establishes the **formal specification of E‑MAD (Effective Multilateral Assured Denial)** as a core operational subsystem of **The Horizon Protocol (THP)**. While the **Ethics Charter** provides abstract and normative foundations (*jinrin* 人倫, atonement 贖罪, condemnation 断罪), the present specification prioritizes **concreteness and rigor**. It defines how E‑MAD is measured, executed, and governed, ensuring compatibility with THP’s Charters and operational dashboards.

E‑MAD is **non‑violent, transparent, and multilateral**. Its purpose is not retaliation but the **assured denial of aggressor success**, thereby preventing war and catastrophic escalation.

---

### 1. Conceptual Foundations (from the Ethics Charter)
1. **Jinrin (人倫) as Boundary**  
   Separates absolute justice (reality) from the human realm (social, political, ethical). It provides the dividing line between *atonable* sins and *condemnable* sins.
2. **Atonement (贖罪)** — *Red*  
   Acts of aggression or invasion. Entities may re‑enter the international community after atonement and fulfillment of obligations. **Function:** restorative and reintegrative.
3. **Condemnation (断罪)** — *Crimson*  
   Acts such as nuclear attack or crimes against humanity. Non‑violent yet absolute measures (e.g., termination of debt privileges, irreversible exclusion). **No forgiveness**; stigma is permanent. **Function:** protective and exclusionary.
4. **Principle of Success Denial**  
   The goal is to make aggression **irrational** by denying the possibility of success through transparent indicators and public consent.

---

### 2. E‑MAD Layered Response System
E‑MAD operationalizes these principles through a **five‑tier** scale, each tied to transparent indicators and public dashboards.

- **Blue (Baseline / Monitoring)**  
  State: Normal compliance.  
  Action: Publish score and indicators; continuous monitoring and civic education.  
  Penalty: None.  
  Goal: Maintain transparency and predictability.

- **Yellow (警戒 / Warning)**  
  State: Early warning.  
  Action: Diplomatic engagement via neighboring states; confidence‑building measures.  
  Penalty: None.  
  Goal: Prevent escalation at the earliest stage.

- **Orange (臨界点 / Critical Threshold)**  
  State: Pre‑incident criticality.  
  Action: **Multilateral diplomatic intervention** prioritized over coercion.  
  Penalty: **Non‑punitive pricing signals** (e.g., risk‑premium surcharges) reflecting elevated systemic risk.  
  Goal: Prevent hostile acts through pressure **short of rupture**.

- **Red (侵略・攻撃実行 / Atonement)**  
  State: **Active aggression confirmed**.  
  Classification: **Atonement (贖罪)**.  
  Action: **Multi‑vector denial measures** — monetary reparations; **risk‑premium surcharges**; time‑bound access restrictions (markets/settlement/insurance); escrowed **compliance investments**; independent **monitoring & verification** obligations.  
  Path to Reintegration: **Possible** upon fulfillment against the **Atonement Difficulty Index (ADI)** and restorative requirements under international oversight.  
  Goal: **Deny success** while maintaining a route back to the community.

- **Crimson (人倫断罪 / One‑Strike‑Out)**  
  State: **Nuclear strike or crimes against humanity** (人倫に悖る重大な秩序破壊).  
  Classification: **Condemnation (断罪)**.  
  Action: **Absolute, non‑violent measures** — e.g., **termination of all debt privileges**; permanent exit from international settlement networks and strategic supply chains; *humanitarian exceptions always preserved*.  
  Reintegration / Appeal: **No reintegration; no appeal by the perpetrator** (*one‑strike‑out rule*). See §4.3–4.4 for the limited **Reconsideration Request** right of the Four Saints.  
  Goal: **Universal exclusion (世界拒否)** to protect world order.

---

### 3. Metrics and Indicators
E‑MAD maintains **dual indicators** plus an atonement difficulty gauge.

1. **E‑MAD Score (0–100)**  
   Composite indicator aggregating denial capacity across domains: economy, cyber, logistics, communication/space, energy/water, public health, information integrity.  
   Color‑coded stages (**Blue, Yellow, Orange, Red, Crimson**).  
   Aggregation: **weighted geometric means** within domains; **harmonic mean with a floor** across domains.

2. **Estimated Loss**  
   Quantified in monetary terms (USD + PPP adjustment).  
   Derived from scenario modeling (event trees, Monte Carlo).  
   Reported in P5 / P50 / P95 ranges.  
   Displayed separately for aggressor, victim, and third‑party losses.

3. **Atonement Difficulty Index (ADI, 0–100)**  
   **Multi‑vector difficulty** for Red cases; it determines reintegration path length/conditions.  
   Vectors include: (a) **Reparations capital** (damages & restoration); (b) **Risk‑premium surcharge factor** and duration; (c) **Access‑restriction span** (markets/settlement/insurance); (d) **Compliance‑verification score** (audits passed, monitoring incidents); (e) **Victim restitution index** (coverage & timeliness); (f) **Humanitarian‑impact minimization**.  
   Method: publicly documented weighting with sensitivity analysis; quarterly review via public RFC.

4. **Transparency Requirements**  
   All data, models, weights, and code open‑sourced.  
   Metadata (timestamps, sources, revision history) machine‑readable.  
   Independent audits required; dashboard shows **contribution analysis** and **Why‑Changed** logs.

---

### 4. Governance and Process

#### 4.1 Tripartite Governance
- **Expert Committee**: methodology, models, and quality control.  
- **Citizen Assembly**: randomly selected + voluntary applicants; deliberative legitimacy.  
- **Multilateral Council (人倫評議会)**: states, IGOs, civil society; **sole adjudicative body** for E‑MAD stage decisions.

#### 4.2 Change Management
Public RFC → peer review → impact assessment → pilot → vote → deployment.  
Emergency hotfixes valid 72 hours; retroactive approval mandatory.

#### 4.3 Four Saints (四聖) — Advisory Only
- **No voting rights; not part of the 人倫評議会**.  
- **Crimson (断罪) cases**: may exercise a **Reconsideration Request Right** (一次・一回限り) to the 人倫評議会.  
- **Red（贖罪） cases**: may exercise a **Special Pardon Request Right**（特赦要請権、一回限り）**after substantial atonement progress**.  
- All opinions are **public memoranda**; advisory in nature; final decisions rest exclusively with the 人倫評議会.

#### 4.4 Due Process, Evidence Standards, and Appeals
- **Notification & Reasons**: Formal notice with grounds and evidence summaries for Orange/Red/Crimson.  
- **Evidence standards**: Red＝**高度の蓋然性**（clear and convincing）; Crimson＝**合理的疑いなし**（beyond reasonable doubt）.  
- **Appeals**:  
  - **Crimson (one‑strike‑out)**: **No appeal permitted by the perpetrator**. Only the **Four Saints** may submit a **Reconsideration Request** to the 人倫評議会, once per case.  
  - **Red**: Appeal permitted; stays and modifications possible subject to monitoring outcomes and ADI targets.  
- **Humanitarian Exception (Zero‑Stop Principle)**: At all stages, **medical, food, water, and relief communications** are never halted.  
- **Auditability**: Full logs, hearing records, and vote tallies published; privacy‑minimized.

---

### 5. Operational Integration (THP Context)
- **Ops‑KPI Dashboard** links E‑MAD stages to real‑time indicators of market flows, credit stress, cyber incidents, and humanitarian supply chains.  
- **Ethics Charter** provides normative oversight: ensures that stages Red and Crimson map to *atonement* and *condemnation*.  
- **Lexicon & Charters** standardize terminology and cultural legitimacy across domains.

---

### 6. Conclusion
E‑MAD operationalizes THP’s ethical foundations through **non‑violent, transparent, multilateral denial of success**.  
- **Atonement (Red)**: path to reintegration; difficulty governed by **ADI**.  
- **Condemnation (Crimson)**: irreversible exclusion under **one‑strike‑out**.  
- **Jinrin** remains the boundary principle separating these outcomes.  
**Concept is immutable; implementation adapts via democratic process.**

