<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_GPT_CONJECTURE_K_v1_unsent.md (file dated 2026-10-20). Only this line was added. -->
# Prompt for GPT: Conjecture K (the shared odd-sector coupling)

You are continuing a research collaboration on the **complex Grothendieck constant** K_G^ℂ. Attached is our handoff bundle
(`handoff-bundle-*.zip`: LaTeX handoff `handoff-2026-10-15/main.tex` + chapters, the standalone `conjecture_K_report`, all certificate
folders and verifiers, the Lean sources). Chapter references below are to that handoff. Please read Chapters 7, 15, 22–27 and the
Conjecture K report before starting.

## Where we are

* **Lean-certified (master, CI green):** 1.401674103 < K_G^ℂ < 1.404599424. The lower bound uses the cubic Gaussian witness
  T = P₁,₀ − εP₂,₁ at ε = 149/200 with B = 7134326/10⁷ (common-law cover `cert-combined-e` on per-row data `cert-0745e`). Hypotheses
  outside Lean: the simultaneous Gaussian reduction, the cap tables (exact-arithmetic certificates), moment bounds and Stein inputs for
  the law of U = |q|²/σ², and the two Gaussian transfer inputs.
* The certificate route is saturating. The remaining cap-side room is a few 10⁻⁶ in B. Even ideal caps leave B ≳ 0.71342, but **1.402 needs
  B ≤ 0.713267**. The gap is structural: the certificate pays the gate/price relaxation of the mixed sectors. **Conjecture K removes
  that relaxation.** In its weak form K_η, with η ≤ 10⁻⁴ at the peak, it gives K_G^ℂ > 1.402 (≈ 1.40221 at ε ≈ 0.7564).

## The setting (Chapter 7, §exactrow; notation of Chapter 25)

Z is a standard complex Gaussian (the visible coordinate). L = Z(a + b|Z|²), a = ℓ − 2β, b = β, H = Z(|Z|² − 2)/√2. Then

  Λ(G) = E|L + G| + E|L − G| − E|G|²/ε,   S(ℓ,β) = sup_σ { E|L+σW| + E|L−σW| − σ²/ε },  W ~ CN(0,1) independent of Z.

Peak profile box: ε = 1891/2500, a ∈ [0.55919, 0.55921], b ∈ [0.14319, 0.14321] (ℓ ≈ 0.8456, β ≈ 0.1432, σ* ≈ 0.2009,
S ≈ 1.3739535). G ∈ H^{2,1}(ℂⁿ) (cubic Wick chaos of bidegree (2,1)), decomposed by its dependence on Z:

  G = q + r_A(|Z|² − 1) + r_B Z²/√2 + Y Z + W Z̄ + ν H(Z),

where
* q ∈ H^{2,1}(remote) is the remote cubic;
* r_A ∈ H^{1,0} and r_B ∈ H^{0,1} are remote first chaos (the **odd sectors A, B**);
* Y ∈ H^{1,1} and W ∈ H^{2,0} are remote second chaos (the **even sectors**);
* ν ∈ ℂ is the diagonal.

**Conjecture K:** Λ(G) ≤ S for every n and G. **K_η:** Λ(G) ≤ S + η. The needed range is ε ∈ [0.74, 0.76], ℓ ∈ [0.76, 0.90],
β ∈ [0.12, 0.16]. The binding part is the peak profile box and the central rows t ∈ [21/25, 851/1000].

## What is already proved (do not redo; cite)

1. **Remote part (Ch. 22, 24).** Λ(q + gW + νH) < S + 2.2·10⁻⁵ − c|ν|² for every remote cubic q of any dimension and amplitude. The proof
   uses a two-node Hermite majorant, since f(u) = √π E√(R+u) is Bernstein. With C₆ = 40.45313 the slack is ≈ 1.0·10⁻⁵. Diagonal
   penalties are 0.571(Re ν)² + 0.265(Im ν)² for every remote law (common-shift certificate, Ch. 27).
2. **Budget (Ch. 24).** On the central rows the remote-only row cap is 2697232101/3782000000. That leaves
   **η_AB = 240297199/2651182000000 ≈ 9.0638·10⁻⁵** for all additional gain from the visible shared sectors (A, B and their interactions).
3. **Even sectors (Ch. 15 §profileslack):** Λ(q + Z r_Y + Z̄ r_W) ≤ Λ(q) − (1/ε − 13/10)(E|r_Y|² + E|r_W|²) for any dependence among
   (q, r_Y, r_W), on the q-only baseline.
4. **Odd sectors, partial results (Ch. 14, 17, 27):**
   * Global A-theorem when r_A's drivers are independent of the centred content of q.
   * Wick junta A-only: Λ(cH(X) + α(T−1)X + gG) ≤ S + 7.3·10⁻⁵.
   * B-only in any dimension: ≤ S + 10⁻⁵ − ‖β‖²/200.
   * Simultaneous A+B on the Wick junta: ≤ S + 10⁻⁴.
   * Global theorem Λ(cH(X) + SX + TX̄ + CX²/√2 + gG) ≤ S − c²D, with the remote coefficients independent of X.
   * Symmetric classes: A at every amplitude under (Q,A) =ᵈ (Q,iA); B under E[B|Q] = 0.
5. **Weaker target K_rot (Ch. 25, 26, 27).** At a global norm maximiser, rotation stationarity (a Ward identity) gives
   F ≥ ‖d‖²/(ε²t² + εω) with d = 2βr_A + √2β r̄_B. The sharper tensor bound of Ch. 27 makes the denominator
   ε[9γ(t) − (9 − 3min{3, √3x/2})τ²]. So it suffices to prove Λ(G) − (that penalty) ≤ S + η. The penalty pays roughly 0.13–0.57 of
   the measured junta gains.

## What is known to fail (do not retry)

* The weighted-content form (T), (C_A + C_B)λ_max(M) ≤ 0.292(S − Λ_q + η), is **false**: q = (7/(20√2))X²Ȳ (Ch. 15). The target reverts to
  **(T₀)**: ‖Π₁,₀F_A(q)‖² + ‖Π₁,₀F_B(q)‖² ≤ 0.292(S − Λ_q + η), with the charge-one profiles F_A(u) = E_z[A(z) ph(L+u)] and
  F_B(u) = E_z[B(z) conj ph(L+u)] (Ch. 7 §Kb).
* **Peeling** fails: replacing a shared driver of r_A by an independent Gaussian of equal conditional variance is not an upper bound
  (+1.96·10⁻² at aligned phase). K cannot be proved sector by sector at equal variance.
* **Exact K-a (η = 0) cannot be proved from the radial relaxation.** Artificial laws satisfy every scalar input yet beat the Gaussian at
  σ*, though only by < 4.65·10⁻⁶ (Ch. 19). Moments alone fail near σ*; the Stein cuts are needed. Even with all cuts, the certifiable
  deficit d* is only 30–50% of the true deficit near σ* (Ch. 23).
* **Sup-norm/derivative expansions lose a factor ~100**, because the profiles have P'''(0) ≈ 100 and vary on |u| ~ 0.3 while |q| ~ 0.2.
  Any proof of (T₀) must use the exact profile, e.g. your positive Laplace representation F_D(u) = −u ∫ e^{−s|u|²} μ_D(ds).
* The symmetric-class theorems (Ch. 27) **exclude exactly the binding family**: the coherent Wick junta q = cH(X) + sW with A = αX,
  B = λX̄ (E[X̄ | q] ≠ 0).
* The idealised B bound with q kept exact is not a theorem (6.7% pointwise failure).

## Measured facts (floating point; for orientation)

* On the junta family and the L2 maximisers (n = 2–6), the optimal mixed-sector gain is ≤ 0.16–0.17 of the q-only deficit d_q.
  For fixed junta q₀, the joint optimum keeps Y = W = ν = 0, so the even sectors add nothing on top of optimal A/B.
* (T₀) against the rigorous d* + η_AB holds on all 14 tested points. The margin is thin, with ratios up to 0.89–0.91 (junta a = 1,
  σ = 0.25–0.3; L2 n = 5, σ = 0.3); all of the thinness comes from the deficit relaxation, not the content.
* The quadratic model of the aligned A gain is exact: 2cα − dα², d = 1/ε − h_eff ≈ 0.42–0.62, against the rigorous 0.292.

## The task

**Prove (or certify by finite exact/interval computation) the shared odd-sector coupling on the peak profile box. Concretely, K_η for the
odd sectors A and B with shared drivers, at finite amplitude, with η ≤ η_AB ≈ 9.06·10⁻⁵ minus the remote slack actually used.**
Any one of the following counts as real progress. They are listed in order of value.

1. **Full K_η on the box.** For every n and G (all sectors), Λ(G) ≤ S + 10⁻⁴.
2. **K_rot on the box.** The same with the rotation penalty of item 5 subtracted, assuming stationarity at a global maximiser. State
   exactly which squares the row inequality must retain, so that we can formalize it.
3. **(T₀) with the certifiable deficit.** ‖Π₁,₀F_A(q)‖² + ‖Π₁,₀F_B(q)‖² ≤ 0.292(d*(σ,x) + η_AB) for all q ∈ H^{2,1}. Here d* is the largest
   deficit that the certificate's law constraints certify: EU = 1, EU² = 2 + x², EU³ ≤ 6 + 9x² + C₆x³, E√U ≤ ρ = 0.973612157, and all
   Stein cuts of `Grothe/Lower/Law.lean`. Sharpening d* is allowed if you add new, provable scalar constraints on the law of U, for
   example the Azmoodeh–Malicet–Mijoule–Poly spectral inequalities. Say what we would have to prove about U.
4. **A finite-parameter certificate for the coherent junta.** One influential coordinate X shared by q, r_A and r_B, plus an independent
   Gaussian buffer, plus Y, W, ν: q = cH(X) + sW, r_A = αX, r_B = λX̄. That is 4–6 real parameters, at every amplitude, with
   box/interval certificates (your ring + Bernstein + polygon-oracle machinery). Then **the reduction from many coordinates to this case**,
   or a precise statement of what that reduction needs.

## Requirements

* Give a status label for every claim: [P] written proof, [C] exact/directed-rounding computation with a replayable checker,
  [F] floating point, [?] unverified. Never present [F] as [P].
* Checkers: standard-library Python (Fraction / integer arithmetic / explicit outward rounding), or pinned dependencies (state versions).
  Ship a `verify_all.py`, a `SHA256SUMS.json` and replay logs, as in your previous packages.
* Deliverable: a LaTeX chapter in the style of the handoff, ready to drop in as `ch28-*.tex`, plus a Markdown twin and the code folder,
  zipped.
* If you find a **counterexample** to any target (including K_η itself on the box), report it with exact numbers and a checker. That is
  as valuable as a proof.
* Do not claim a new numerical endpoint unless a complete row cover is supplied. State conditional results as conditional.
* Be explicit about hypotheses on the joint law of the remote variables, especially independence or symmetry assumptions. The open
  crux is precisely the case **without** such assumptions.

## Addendum (20 October, after your coherent-Wick-A package and an IDE reassessment; see handoff Ch. 28–29)

* **Your coherent-Wick-A package was replayed in full here** (`verify_all.py`, PASS in 771 s). It is ported as Ch. 28. Exact K
  (η = 0) for cH(X) + α(|Z|²−1)X + gG at every amplitude now counts as proved [P+C].
* **Exact one-variable form (Ch. 29 §2).** After the joint visible/remote phase rotation:
  Λ(G) = E_T[ E_w(|ℓ(T)+R_T| + |ℓ(T)−R_T|) − E_w|R_T|²/ε ], with
  R_T = q + (T−1)r_A + (T/√2)r_B + √T(Y+W), T ~ Exp(1), and real shift ℓ(T) = √T(a+bT).
  The price identity is exact because every visible weight has mean square 1.
* **No fibrewise domination.** v ↦ E|u+√v G| is convex for u ≳ √v. Only about 20% of the visible law lies in the concave region at v*.
  Every constant must therefore be computed with T integrated first, which is your decisive idea, now as a principle.
* **First-order profile margins at v*:** E[w p]/E[w] = 0.648 (A), 0.470 (Y/W), 0.294 (B). The averaged A-curvature is d_A ≈ 0.466,
  against the pointwise 0.292 used in (T₀). With it, the tightest tested (T₀) ratio drops from about 0.91 to about 0.57.
  The inadmissible profile (T−2)² would beat the Gaussian. It is realised by (T−2)X/√2, which contains the pure first-chaos term −X/√2, so K rests on the bidegree constraint (corrected by you: a random coefficient on H(Z) has the stable profile T(T−2)²/2).
* **The Gaussian-profile layer is closed numerically** (signs now proved by you), even for polarized shared-driver A+B: R_T = √sG + α(T−1)X + κe^{iφ}(T/√2)X̄ has its
  maximum at α = κ = 0. **Any violation of K must therefore come from non-Gaussian joint cumulants** of q with the drivers of r_A and r_B.
* **Suggested next targets, in order:**
  1. Your coherent theorem with B added: q = cH(X), r_A = αX, r_B = λX̄, buffer.
  2. Two drivers.
  3. A "profile + averaged-cumulant" expansion for the near-Gaussian regime using d_A ≈ 0.466-type averaged constants.
  4. A gluing lemma between the regimes: an explicit replacement error, paid by the deficit, that preserves the joint law of the retained
     drivers and the remainder's random conditional covariance. Your q_N = X·N^{-1/2}Σ(|Y_j|²−1) example shows doubling alone does nothing.

## Addendum 2 (20 October, later): stronger versions of K (handoff Ch. 32)

* **K for every ε ⟺ Gaussian domination on every variance sphere (K_all).** For every G in H21 with E|G|² = v:
  E|L+G| + E|L−G| ≤ 2E|L+√v W|.
  The equivalence holds because g(v) is concave. Numerically K_all holds on the coherent family at nine variance levels (0.002–1.5).
* **Lemma [P]:** L = Z(a+b|Z|²) with a, b ≥ 0 is a circular Gaussian scale mixture: the density of |L|² is completely monotone
  (Faà di Bruno induction). The remote part of K, for every profile and every ε, therefore follows from a **visible-free** inequality:
  (PVD) E|N+q| ≤ (√π/2)·√(V + E|q|²) for every V ≥ 0, q ∈ H21, N ~ CN(0,V) independent.
  Its real form on the third Wiener chaos is: the Gaussian maximises E|N+X| for X real third chaos and N real Gaussian, and at V = 0
  maximises E|X|/‖X‖₂. PVD holds in every test (H(X), 40 random tensors with n ≤ 6, Wick sums). Proving it gives exact K-a with no
  moment or Stein inputs.
* **No-go:** every single-scale strengthening is false.
  - Heat-kernel domination fails for the Gaussian A-profile (−4.9e-3), and A is the only admissible sector that fails it.
  - The characteristic function of H(X) goes negative (−0.127).
  - Laplace domination fails for a random 2-coordinate cubic at λ ≳ 100, by 13σ.

  A proof must couple scales.
* **Suggested:** prove PVD at V = 0, i.e. E|X| ≤ √(2/π)‖X‖₂ on the real third chaos. One route is the Malliavin identity
  E|X| = (2/3)E[‖DX‖²δ₀(X)]. Then prove K_all for the coherent A+B junta.

## Addendum 3 (20 October, evening)

* Your polarized-profile package was replayed in full here (PASS, 300 s) and ported as Ch. 33. The Gaussian covariance layer is now
  proved: Λ ≤ S − α²/10 − β²/4 − γ²/25.
* **Remaining target:** the signed gap D ≤ α²/10 + β²/4 + γ²/25 + η. Interpolating θ ↦ cosθ·G + sinθ·(matched Gaussian) splits
  D = −∫φ′ into two terms (Ch. 32–33):
  1. The BNC term, a function of the law of R_T alone. It is zero for Gaussians, and for remote cubics it is the visible-free PVD.
     BNC: E[X Φ_s(X)] ≤ σ² E[e^{−sX²}] for all s, with Φ_s = ∫₀ e^{−sy²}; equivalently a weighted Laplace-ratio inequality.
  2. The Malliavin cross energy E ∇²|·|(Y)[DL, DG], nonzero exactly for the Z-dependent sectors.
* **Suggested:** prove BNC for the real third chaos, then bound the cross energy by the certified penalties.

## Addendum 4: the BNC lemma, precisely (handoff Ch. 32 §sec:bnc-forms)

**Open lemma (BNC).** Let X be in the real Wiener chaos of order k = 3 and σ² = E X². Then τ_Y(0) ≤ Var(Y) for every Gaussian
smoothing Y = X + √r·Z, r ≥ 0. Here τ is the Stein kernel.
* Equivalently, E|Y| ≤ 2·Var(Y)·p_Y(0).
* Equivalently, E[(‖DX‖²/3 − σ²)·e^{−sX²}] ≤ 0 for all s ≥ 0.
* The binding case is r = 0: E[|∇X|² | X = 0] ≤ E|∇X|², i.e. the energy on the nodal set is at most its mean.

It implies PVD, and with the Gaussian-scale-mixture lemma for L it gives exact K-a for all profiles and all ε.

What is known:
* **Proved:**
  - the conditionally Gaussian case, by monotone likelihood ratio;
  - leading order near the Gaussian (κ₃ = 0 by symmetry, gap ≈ c·κ₄/(6λ));
  - closure of the interval form under independent sums with symmetric unimodal summands.
* **Numerics:** an adversarial search gives τ(0) ≤ 0.78σ²; the interval form gives 0.07–0.80.
* **Reformulation:** the rotation process F(θ) = X(x cosθ + y sinθ) turns the binding case into "at its zeros the process is no faster
  than on average" (ZCV). For one frequency this is E[A²]E[1/A] ≥ 2E[A]; Rayleigh gives equality and a fixed amplitude fails by 2×.
* **Consequence:** BNC is a *spread* (small-ball) property of the frequency amplitudes, not a moment property; kurtosis alone cannot
  prove it.

Wanted: a quantitative spread lemma for the nodal-set energy or the frequency amplitudes of a polynomial chaos, e.g. via Kac–Rice for F
(which has at most 2k zeros) together with a lower bound on the Gaussian nodal perimeter ≥ (√k/2)·E|X|/σ.
