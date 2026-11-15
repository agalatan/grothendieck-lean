<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_GPT_CONJECTURE_K.md (file dated 2026-10-20). Only this line was added. -->
# Prompt for GPT: Conjecture K, the self-interacting shared-driver case

Attached is our current handoff bundle. **Read Chapter 36 first** (`ch36-K-state.tex`, "Conjecture K: consolidated state"); then
Chapters 33 and 35 (your Gaussian-covariance and Gaussian-factor theorems) and 28 (your coherent one-driver A theorem). Everything
below is in those chapters.

## Where we are

* **Certified (Lean, CI):** 1.401674103 < K_G^ℂ < 1.404599424. To reach 1.402 we need K_η at the peak profile, with the visible shared
  sectors fitting in **η_AB = 240297199/2651182000000 ≈ 9.06·10⁻⁵**. The degree-3 ceiling is 1.402258.
* **Setting** (Ch. 36 §1). Peak values: ε = 1891/2500, L = Z(a + b|Z|²) with a = 699/1250 and b = 179/1250.
  - Λ(G) = E|L+G| + E|L−G| − E|G|²/ε, and S = sup_v {2E|L+√v W| − v/ε}.
  - After the joint phase rotation, Λ = E_T[E(|ℓ(T)+R_T| + |ℓ(T)−R_T|) − E|R_T|²/ε], with T ~ Exp(1) and ℓ(T) = √T(a+bT).
  - The residual is R_T = q + (T−1)r_A + (T/√2)r_B + √T(Y+W).
* **Proved by you and replayed here** (all at the peak, all exact replays PASS):
  - remote cubics: Λ < S + 10⁻⁵;
  - the diagonal and the even sectors;
  - the coherent one-driver Wick A family: exact K;
  - the whole Gaussian covariance class: exact K with penalties α²/10, β²/4, γ²/25;
  - shared A/B on unequal Wick sums (small coefficients);
  - B only up to normalised fourth moment 3.757;
  - independent blocks: weak K with error O(1/N);
  - **shared A/B on arbitrary Gaussian-factor drivers C^T X + gU (C independent of X): Λ ≤ S + 5·10⁻⁵ − (‖α‖²+‖β‖²)/200.**
* **Reduction:** Λ ≤ S − α²/10 − β²/4 − γ²/25 + D, where D is the signed, visibly averaged gap between the law of R_T and its
  matched Gaussian (Ch. 33).

## The task: the crux for 1.402

Prove **D ≤ α²/10 + β²/4 + γ²/25 + η_AB** (or K_η directly) when the cubic is **nonlinear in a driver it shares with the A/B
sectors**. That is exactly what Ch. 35 excludes (C independent of X) and what Ch. 28 covers only for one driver with A alone. In order:

1. **One driver, A and B together, all amplitudes:** q = cH(X) + gG, r_A = αX, r_B = λX̄ (H(X) = X(|X|²−2)/√2). Extend Ch. 28 to
   include B, at every amplitude and every relative phase.
2. **Self-interaction plus Gaussian-factor terms on the same driver:** q = cH(X) + C^T X' + gU, with A/B on (X, X'), i.e. Ch. 35's
   class plus a Wick cube on one of the shared drivers.
3. **Two self-interacting drivers**, then a general coupled cubic. Alternatively, a reduction showing that the influential part of any
   cubic can be brought to cases 1–2 with an error paid by the deficit (a gluing lemma).

**Methods that worked (please reuse):**
- integrate the visible variable first (signed averaged profiles, the Hankel/Laguerre representations);
- the 15/16 Gaussian Young remainder;
- the Gram reduction to three faces;
- the convex orientation envelope with vertex certificates;
- joint (not marginal) Stein replacement.

**Known not to work (do not retry):**
- the weighted-content reduction (T);
- equal-variance peeling;
- fibrewise Gaussian domination;
- every single-scale strengthening (heat-kernel, characteristic-function, Laplace);
- gluing by buffer doubling, since substitution preserves the law;
- conditioning without the core's deficit;
- law-only comparisons (your Gaussian-marginal obstruction).

## Secondary targets (only if the crux stalls)

* **Diagonal interactions** with shared A/B, and the **row envelope** over (t, ℓ, β) at ε ≈ 0.7564 needed for an actual endpoint.
* **PVD₀ / BNC** (exactness of the remote part; worth ≤ 10⁻⁵). Prove E|q| ≤ (√π/2)‖q‖₂ on H21; equivalently, for real third chaos X,
  τ_{X+√rZ}(0) ≤ Var for every r, i.e. E[|∇X|² | X=0] ≤ E|∇X|². Ch. 32 §"BNC: exact reformulations" has the nodal and
  rotation-process forms and the proved cases. The missing ingredient is a spread lemma for the nodal-set energy or the frequency
  amplitudes.

## Requirements

* Give every claim a label: [P] proof, [C] exact/directed computation with a replayable checker, [F] float, [?] unverified.
* Supply portable verifiers (standard-library Python plus C++17), a `verify_all.py`, a SHA256 manifest and replay logs.
* Deliver a ready-to-port LaTeX chapter (ch37) in the handoff's style, plus a Markdown twin.
* State scope and independence assumptions on the latent laws explicitly; the crux is the case *without* them.
* Report counterexamples with exact numbers and a checker; that is as valuable as a proof.
* Do not claim a new endpoint without a complete row cover.
