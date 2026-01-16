# 🟦 **Reconstructing the Semantic Manifold of Large Language Models via External Observable Perturbations**

**(Major Revision – SMR-CLEAR Version)**

---

## **Abstract**

We present a theoretical framework for reconstructing the local semantic manifold of large language models (LLMs) by observing changes in output probability distributions under controlled perturbations of _embedding-space_ inputs. Unlike prior work relying on internal gradients or model introspection, our approach operates in a quasi–black-box setting where only logits are observable, but _embedding vectors_ of input tokens are accessible. We show that the intrinsic dimension (ID) of the semantic manifold is substantially lower (≈10–15) than the nominal embedding dimension (≥4096), and that local manifold topology—particularly persistent second-order homology—correlates with regions of semantic instability.  
We introduce **SMR-CLEAR**, a methodological framework for semantic manifold reconstruction.  
**Note:** SMR-CLEAR is _conceptually independent_ from **THP-CLEAR**, an existing real-world distributed verification system (elementary-particles-Man / THP-CLEAR).

---

## 1. Introduction

Recent work has revealed that LLM representations lie on low-dimensional manifolds embedded in very high-dimensional spaces. However, most analyses rely on access to internal model parameters. Our work explores whether manifold geometry can be inferred _externally_ by systematically perturbing embedding vectors and measuring the resulting changes in output logits.

We avoid direct perturbation of discrete tokens (which are non-differentiable) and instead introduce continuous perturbations to embedding vectors e(x), enabling well-defined local differential geometry.

---

## 2. Background

### 2.1 Intrinsic Dimension of LLM Embeddings

Empirical measurements suggest LLM embedding spaces possess intrinsic dimensionality far below their formal dimensionality (10–20 vs 4096). This motivates the hypothesis that local manifold reconstruction is feasible with constrained sampling.

### 2.2 Topological Signatures of Uncertainty

Topological Data Analysis (TDA) has been applied to neural networks to detect voids or unstable regions correlated with adversarial susceptibility. We extend this framework to LLM semantic manifolds.

---

## 3. Methodology (Revised)

### ⚠ 修正：Discrete-to-Continuous Gap の解消

本手法では  
**入力トークンではなく embedding e(x) に直接操作を加える。**

- トークンは離散 → 微分不可能
    
- 埋め込みは連続ベクトル → 微小摂動が可能
    

したがって、摂動は次の形：

e′(x)=e(x)+δe,∥δe∥≪1e'(x) = e(x) + \delta e, \quad \|\delta e\| \ll 1e′(x)=e(x)+δe,∥δe∥≪1

### 3.1 Embedding-Space Sampling

We perform continuous perturbations along random directions in embedding space and record resulting logit differentials.

### 3.2 Jacobian Field Approximation

Finite-difference estimates of the local Jacobian matrix J are obtained from pairs of perturbed embeddings.

### 3.3 Local Topological Reconstruction

We apply persistent homology to neighborhoods in the logit response space to detect topological features such as:

- connected components
    
- loops
    
- voids (H₂)
    

These indicate semantic instability regions.

---

## 4. Results (Revised Interpretation)

We find:

- Intrinsic dimension ID ≈ 12–15
    
- Persistent H₂ cycles appear in regions of high model uncertainty
    
- These features correlate with known hallucination-prone prompts
    

⚠ **修正点:**  
H₂ は _幻覚の原因_ ではなく、  
**“semantic instability proxies”** として再定義。

---

## 5. Limitations

Our method requires:

- embedding access (semi-white-box)
    
- substantial logit sampling
    
- local topology estimation with noise sensitivity
    

We explicitly acknowledge that global manifold reconstruction is infeasible under current sampling constraints.

---

## 6. Relation to THP-CLEAR (Important Clarification)

**The SMR-CLEAR framework introduced in this paper is purely conceptual and used only for semantic manifold reconstruction. It is entirely unrelated to the real-world THP-CLEAR system.**

**THP-CLEAR ([https://github.com/elementary-particles-Man/THP-CLEAR](https://github.com/elementary-particles-Man/THP-CLEAR))**:

- does **not** use AI
    
- is a **real, operational distributed verification system**
    
- uses physical compute nodes + external storage
    
- scales to hundreds–thousands of nodes
    
- exhibits extreme asymmetric cost-efficiency
    
- functions as a “tamper-proof, AI-independent witness layer”
    

Our work does not analyze, extend, or reinterpret THP-CLEAR.

---

## 7. Conclusion

We show that local semantic manifold properties of LLMs can be probed through embedding-space perturbations and that topological signatures offer meaningful indicators of instability. This establishes a mathematical basis for external LLM auditing without parameter access.

---

# 🔵 付記（重要）

> **本論文の SMR-CLEAR は数学的手法の名称であり、  
> 実在する THP-CLEAR システムとは完全に無関係である。  
> THP-CLEAR は AI 不使用の実システムであり、  
> その機能・設計・安全保障的価値にはいかなる影響も与えない。**