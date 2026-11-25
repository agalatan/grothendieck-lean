# Conjecture K

*This book states the current best-known state of Conjecture K. The evidence for every statement
(who proved it, who checked it, which files and checkers) is in the ledger [`STATUS.md`](STATUS.md), cited here by row
number; the monograph of 5 and 6 November with its errata is
[`sources/monograph-2026-11-05/MONOGRAPH_with_errata.md`](sources/monograph-2026-11-05/MONOGRAPH_with_errata.md).*

**How to read the brackets.** After each statement a bracket gives its status, its author and checker, and its row in
`STATUS.md`, for example [P + C · codex-a7c4, checked by claude-b9ee · 4.2]. The labels are those of the ledger:
**P** a written proof re-derived by someone other than its author ("author only" when nobody else has), **C** an exact
or interval certificate replayed by someone other than its author, **Lean** a theorem of this repository, **N**
numerical only (a search gives lower bounds on a supremum, never upper bounds), **R** read from the record without
independent verification, **open** no claim. A number in parentheses, such as (2.6), is a section of this book.
"Peak" means the peak row of section 1.4. This book is edited in place: every change in the state of knowledge
rewrites the passage concerned.

## 0. Summary

**The statement.** Let z₁ be a standard complex Gaussian, T = |z₁|² and L = z₁(a + bT). For G in the cubic Wick chaos
H₂,₁ of finitely many complex Gaussian variables (z₁ and further, remote, coordinates) put

    Λ(G) = E|L + G| + E|L − G| − ‖G‖²/ε.

Conjecture K says that Λ(G) never exceeds S, its supremum over the diffuse Gaussian adversaries σW (W standard
complex Gaussian, independent of z₁), on the box ε ∈ [0.74, 0.76], ℓ ∈ [0.76, 0.90], β ∈ [0.12, 0.16] with
a = ℓ − 2β, b = β.

**Why it matters.** The proved bounds are those of `main_bounds` (Lean; a lower bound a little above 1.4019 and an upper bound below 1.40456, stated exactly in `docs/CONSTANTS.md`). The lower bound of
the cubic witness alone is 1.401700322371 (12.1); Lean's lower bound adds an identity tail to it. The cubic witness is T_ε = P₁,₀ − εP₂,₁: every pair of unimodular functions satisfies
Re⟨f, T_εg⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G), exactly, and the proof replaces sup Λ by scalar relaxations. K with an error
η ≤ 10⁻⁴ would turn the row into an explicit one-dimensional function and give about 1.402; exact K would give about
1.4022; no certificate with this witness exceeds 1.4022581233.

**Where things stand.** Conjecture K is open, and no violation is known. A proof splits into six layers (1.9).

- **Proved** (at the peak row unless the section says three rows or the whole box): the remote part,
  Λ(q) < S + 3.6·10⁻⁷ for every cubic q independent of z₁ (2.1); the A-shell with independent drivers, on the whole
  box (2.2); explicit regions of the shared-driver core (2.4); the content inequality for several structured families
  (2.5); the B-shell cost and the alignment of B- and A-contents (2.7); the local joint A/B form, and the retained
  joint premise (P) for all complex shifts and both complex drivers (2.8, 7.4.16); the odd sectors over the zero core and over every remote core,
  with arbitrary sharing (2.9); the central part of the consumer, conditional on an all-sector bound, at
  ε = 299/400 the whole consumer outside (0.8165, 0.866), and by homothety transfer of the spectral mass row the
  whole consumer outside (0.795, 0.864) at ε = 3/4 and outside (0.7515, 0.863) at ε = 94/125 [author only] (2.10).
- **Proved for the retained functional Λ̂** (which keeps the first-chaos penalty dropped from the row; a bound on
  sup Λ̂ suffices just as well, and its benchmark is the same S): the whole A-shell at the peak row,
  Λ̂(q + (T − 1)r) < S + 2·10⁻⁵ for every remote cubic q of energy at most 0.0463 and every remote linear form r, in
  every dimension and at every amplitude, and the same with error below 9.8·10⁻⁵ on a profile rectangle around the
  peak (2.6); all six sectors together below S + 10⁻⁴ on an energy region around the zero core, and below
  2E|L| < S for every G without a remote cubic, with no premise (2.9).
- **Open:** the raw content inequality of L4 for general cubics; the finite-amplitude joint A/B bound, reduced to a
  compact box; the B-content of general cubics; odd sectors over a core containing A/B shells; the remote part away from the
  peak; the response regions outside the central one; the consumer and its Lean statement (chapter 3).

**How far.** Apart from L2, Theorems A and B, the one-coordinate results and the three-row sector costs, the finished
pieces hold at the peak row or near it. Three single-witness routes to 1.402 are mapped (2.10). At ε = 1891/2500 an all-sector bound
with error at most 1.006·10⁻⁴ at the peak row covers t ∈ [0.84, 0.851], and four response intervals stay uncovered. At
ε = 299/400 everything outside (0.8165, 0.866) is proved, and ten all-sector inequalities at other profiles remain;
they are stated with allowance 2.5·10⁻⁵, and the largest admissible allowances on the binding rows are 3.0–4.4·10⁻⁵.
At ε = 94/125 = 0.752 everything outside the wider central interval (0.7515, 0.863) is proved [author only], and thirteen central rows (rows 1–7 off the peak box, reaching u/λ² ≤ 0.134) admit at
least 1.021·10⁻⁴ > 10⁻⁴ on every row (> 3.36× the binding room at ε = 299/400, with Row 8 on [0.840, 0.847] inside the proved remote and retained A-core
rectangles; at ε = 3/4 Lean's `Lower.ρ` alone closes the exterior outside (0.795, 0.864) with nine central rows
admitting > 7.57·10⁻⁵). The best all-sector bound for Λ̂ at the peak is S + 9.9·10⁻⁵, conditional on the averaged odd-sector premise (P_Ψ) outside the certified regions
(2.8, 2.9): three times too large for the binding rows at ε = 299/400, and below the allowance of every row at ε = 94/125,
but only at the peak profile; each of the thirteen rows needs its own all-sector bound (open; the profile transfer costs
≈ 7·10⁻⁴, 8.6). With the retained functional the A-shell uses 2·10⁻⁵ of the budget; the B-shell, the joint A/B interaction and
the shared odd-sector interactions remain missing. With the raw functional of K the content inequality is also
missing. The gain at stake is about 3·10⁻⁴ on the constant.

## 1. Setting

### 1.1 Gaussian chaos

z = (z₁, …, z_n) are independent standard complex Gaussians (E|z_j|² = 1) and ⟨f, g⟩ = E[f̄g]. H_{p,q} is the Wick
chaos of bidegree (p, q) and P_{p,q} the projection onto it; Π₁ is the projection onto the first chaos H₁,₀ of the
remote coordinates. z₁ is the **visible** coordinate, T = |z₁|² is Exp(1), and z₂, …, z_n (written X, Y, w in
examples) are the **remote** coordinates. W is a standard complex Gaussian independent of everything else, and
ph(z) = z/|z|.

### 1.2 The witness and the exact row

K_G^ℂ is the complex Grothendieck constant: the infimum of the K with V(A) ≤ K·C(A) for every finite complex matrix A, where
C(A) and V(A) are the suprema of |Σ a_ij·conj(ε_i)δ_j| over unimodular scalars and of |Σ a_ij⟨x_i, y_j⟩| over unit
vectors of a complex Hilbert space (`docs/CONSTANTS.md`). The **cubic witness** is the operator T_ε = P₁,₀ − εP₂,₁ on
L² of the Gaussian space, and a function f of z is **unimodular** if |f| = 1 pointwise.

The lower bound is K_G^ℂ ≥ 1/‖T_ε‖ with ‖T_ε‖ = sup{Re⟨f, T_εg⟩ : |f| = |g| = 1}. For unimodular f, g put
h = (f + g)/2, k = (f − g)/2, rotate so that P₁,₀h = t·z₁ with 0 ≤ t ≤ √π/2, and put G = εP₂,₁k ∈ H₂,₁. Then for
every real ℓ and β

    Re⟨f, T_ε g⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G),
    Λ(G) = E|L + G| + E|L − G| − ‖G‖²/ε,     L = z₁(ℓ + β(T − 2)) = z₁(a + bT).

[P · audit of codex-a713 · 2.1] Three nonnegative terms are dropped: ‖P₁,₀k‖², ε‖P₂,₁h + B/ε‖² with B = βz₁(T − 2),
and the pointwise phase slack. Everything below is about sup Λ.

A choice of (ε, ℓ, β) is a **row**, and the G = εP₂,₁k of a unimodular pair, with its parameter t, is a **response**.
A bound Re⟨f, T_εg⟩ ≤ c for every unimodular pair is a **cap**, and gives K_G^ℂ ≥ 1/c (the thresholds are in 1.5). A
**consumer** is an argument that turns bounds on sup Λ (or sup Λ̂, 1.6) at finitely many rows into such a cap, by
covering every t ∈ [0, √π/2] (2.10) [STATUS §8].

### 1.3 Conjecture K and its weak forms

    K:   Λ(G) ≤ S(ε, ℓ, β) := sup_{σ≥0} {2E|L + σW| − σ²/ε}   for every n and every G ∈ H₂,₁(ℂⁿ).

[open · 2.2] The comparison object σW is the limit in law of σN^{−1/2}Σ_{j≤N} H(w_j), H(w) = w(|w|² − 2)/√2, over
fresh remote coordinates: a limit of cubics independent of z₁. If K holds, S is the supremum of Λ over all finite
dimensions, approached along such sequences. No attainment in a fixed dimension is asserted: at the peak, n = 1 has
supremum B₀ = 2E|L| < S (2.9), while at the corner (0.74, 0.90, 0.12), where σ\* = 0, G = 0 attains S.

- **K_η:** Λ ≤ S + η. At the peak row the budget for 1.402 is about 10⁻⁴ (1.5).
- **K′:** keep the first-chaos penalty; its unconstrained form is the retained functional Λ̂ of 1.6. A bound on
  sup Λ̂ is weaker than K and suffices.
- **Response restrictions:** only G that come from actual responses matter, and they have bounded energies (2.10).
  Such restrictions are valid for responses, not inside a supremum over all G.
- **The box matters:** K for every profile is false (chapter 4, item 1).

### 1.4 The rows and the peak constants

The principal certificates use three rows; statements for the whole box say so.

| row | ε | ℓ | β = b | a = ℓ − 2β | σ\* (maximiser of Λ(σW)) |
|---|---|---|---|---|---|
| peak | 1891/2500 = 0.7564 | 1057/1250 = 0.8456 | 179/1250 = 0.1432 | 699/1250 = 0.5592 | 0.2009 |
| flank | 149/200 = 0.745 | 4267/5000 = 0.8534 | 1467/10000 = 0.1467 | 14/25 = 0.56 | 0.1726 |
| upper | 1891/2500 = 0.7564 | 0.877 | 19/125 = 0.152 | 573/1000 = 0.573 | 0.1617 |

At the peak: p = 1/ε = 2500/1891;

    B₀ = Λ(0) = 2E|L| = 387√π/500 ∈ (1.371879280600869, 1.371879280600870),
    1.3739535256614 < S < 1.3739535256616,      S − B₀ > 0.002074245,

where S is attained at u_\* = σ\*², the unique maximiser of B(u) − pu, with B(u) = 2E|L + √u·W| (1.8).
At the peak, 0.0403448 < u_\* < 0.0403449 [P + C · 2.7c], near the rational reference energy
v₀ = 403448/10⁷ [C · codex-a7c4, replayed by claude-b9ee · 3.14]. The profile constants used below are
j₀ = ½E|L|⁻¹ ∈ [1.431973791291431, 1.431973791291432], g₀ ∈ [−0.835135932614130, −0.835135932614129]
and k_A = p − E[(T − 1)²/(2|L|)] = 0.320054504 (1.8).

The corner (ε, ℓ, β) = (0.74, 0.90, 0.12) of the box has σ\* = 0; Theorem B (2.3) covers it, several other proofs do
not, and it matters only if a row cover uses it [R · 2.5].

### 1.5 What K would give

- The complete lower cover of the cubic witness gives K_G^ℂ ≥ 1250000000/891774069 > 1.401700322371, with row cap
  891774069/1250000000 = 0.7134192552 [Lean until #525 · 12.1]; master no longer carries it.
- 1.4018 needs a row cap below 5000/7009 = 0.7133685261…; the cover of the cubic witness does not reach it. Lean
  proves its lower bound with the identity-tail witness instead (#525, whose design target was 1.4018; `main_bounds`;
  `../identity-tail/`), so a consumer of K at the cubic witness improves the proved bound only if it gives more than
  that bound (row cap below its reciprocal, about 0.71331).
- 1.402 needs a row cap below 500/701 = 0.7132667617…; 1.4022 below 5000/7011 = 0.7131650263….
- At the peak row an all-sector bound Λ ≤ S + η with η ≤ 10⁻⁴ covers the response interval t ∈ [0.84, 0.851] for
  1.402, with the cap more than 6.12·10⁻⁷ below 500/701; the largest admissible allowance on that interval is
  1.006·10⁻⁴, given exactly in 2.10 [P + C · codex-a7c4, re-derived by claude-b9ee · 8.1].
- Under exact K the cap would be about 0.713160 at ε = 0.7564, that is 1.40221 [N, read from the record · 8.4].
- No certificate with T_ε exceeds 1.4022581233, for any multiplier and dimension [R here · 12.2]; at ε = 149/200 the
  witness cannot reach 1.402 at all [R · 8.3]. A witness with an identity tail, (1, −ε, ν, ν, …), has the model
  ceiling 1.40248 at ε ≈ 0.768, ν ≈ 0.0235 [N · STATUS §10]; its certificate, at (ε, ν) = (191/250, 47/2000), designed for the
  target 1.4018 and giving the Lean lower bound, is the subject of `../identity-tail/STATUS.md`. The degree-5 analogue of K fails numerically at its
  flank rows and at its peak row (chapter 4, item 12.3).

### 1.6 The retained functional Λ̂

    Λ̂(G) := min_{ξ ∈ H₁,₀} { ‖ξ‖² + E|L + G − ξ| + E|L − G + ξ| } − ‖G‖²/ε.

[P · the October manuscript; re-derived by claude-b9ee and by codex-a7c4 · 2.10a] Λ̂ is the first-chaos dual of the
October manuscript. It satisfies Λ′ ≤ Λ̂ ≤ Λ, where Λ′ is the constrained functional of K′
(the same supremum over unimodular f, g with εP₂,₁k = G, with the penalty −‖P₁,₀k‖² kept) [P · 2.10], and the row of
1.2 holds with Λ̂ in place of Λ. So a bound sup Λ̂ ≤ S + η serves the lower bound exactly as K_η would. The inner
minimum has a unique minimiser, of norm at most √π/2, and a residual certificate for trial points [P · 2.13].

On a remote q (independent of z₁) the two functionals differ by the first-chaos content of the phase: with
μ = Π₁ E_{z₁}ph(L + q),

    ‖μ‖²/(1 + j₀) ≤ Λ(q) − Λ̂(q) ≤ ‖μ‖²,      1/(1 + j₀) = 0.411188641… at the peak.

[P + C · the October manuscript and codex-a7c4, re-derived and replayed by claude-b9ee · 3.16] They agree exactly when
μ = 0 (for instance q = cXY·conj(V) with three independent remote coordinates) and differ strictly on q = cX(|Y|² − 1)
at every amplitude c > 0 and every profile. The pointwise difference does not separate the suprema. For independent
blocks q = Σ_j c_jH(X_j),

    0 ≤ Λ(q) − Λ̂(q) ≤ 192a⁻⁶(1 + 4b/a)·Σ_j |c_j|⁶,

so along the diffuse sequence q_N = √(u/N)Σ_{j≤N}H(X_j) the gap is O(u³/N²) and Λ̂(q_N) → B(u) − pu [P + C ·
codex-a7c4, re-derived and replayed by claude-b9ee · 2.14]. The benchmark S is therefore common to both functionals,
and the raw remote cap of 2.1 serves both. One caution: Λ̂ does not scale like Λ. At the profile (λε₀, λa₀, λb₀) one
has Λ̂(λG) = λΛ̂₀^{(λ)}(G), where the multiplier cost of Λ̂₀^{(λ)} carries the weight λ; the unweighted law fails
strictly [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 3.17].

**The tilt.** For every remote q ∈ L², every remote linear form r and every real s,

    Λ̂(q + (T − 1)r) ≤ 2E|L + q + (T − 1 + s)r| − p‖q‖² − (p − s²)‖r‖².

*Proof.* Take ξ = −s·r in the minimum. G − ξ = q + (T − 1 + s)r is even in z₁ and L is odd, so the two expectations
are equal; ‖ξ‖² = s²‖r‖² and ‖G‖² = ‖q‖² + ‖r‖². ∎ [P · claude-b9ee, re-derived by codex-a7c4 · 11.12]

The penalty retained on r is s² smaller, and the A-direction T − 1 becomes T − 1 + s. At G = 0 the local cost of the
tilted direction is k(s) = k_A − 2g₀s − (1 + j₀)s² = 0.320 + 1.670s − 2.432s², largest (0.607) at s ≈ 0.3434 and
equal to 0.4467 at s = 3/5; the first-order term in r becomes 2Re⟨r, c_s(q)⟩ with the **tilted content** c_s of 1.8
[P + C · 11.13]. With the retained element optimised freely, the local A/B cost matrix at G = 0 is
[[0.60684, 0.26291], [0.26291, 1.01344]] (smallest eigenvalue ≈ 0.4778), against [[0.32005, 0.11799], [0.11799,
0.94020]] for Λ [P + C · 11.4, 7.3.1]; these are local values, not finite-amplitude costs (chapter 4, item 19).

### 1.7 The sectors, their frequencies and parity

Every G ∈ H₂,₁ decomposes by its dependence on z₁:

    G = q + (T − 1)·r_A + z₁²·conj(r_B)/√2 + z₁·Q + z̄₁·P + d·z₁(T − 2),

with q a remote cubic, r_A and r_B remote linear forms (the **A shell** and the **B shell**), Q ∈ H₁,₁ and P ∈ H₂,₀
of the remote coordinates, and d ∈ ℂ. The **core** is q + (T − 1)r_A. The forms r_A and r_B are the **drivers** of
the shells: *disjoint* when they are independent of q, *shared* when they involve the remote coordinates of q (any
dependence is then allowed). The sectors z₁Q, z̄₁P and d·z₁(T − 2) are the
**odd sectors** (odd under z₁ → −z₁); the October manuscript calls them "even sectors", after their even frequency.

- **Frequency.** After factoring the phase of z₁, q and A carry frequency −1, B +1, z₁Q and d·z₁(T − 2) 0, z̄₁P −2;
  E[|G|² | T] has no cross terms between different frequencies [P · 2.8].
- **Parity.** For H even and O odd under z₁ → −z₁, Λ(H + O) = Λ(H − O). *Proof:* the substitution z₁ → −z₁ maps L to
  −L and exchanges E|L + H + O| with E|L − H + O|, and ‖H ± O‖² = ‖H‖² + ‖O‖². ∎ So the odd sectors have no first
  variation at an even base where Λ is differentiable, and no mixed Hessian entries with the even block; at a genuine
  even cubic base the first derivative exists, but an even L² base can have a cusp (chapter 4, item 71) [P · 2.9].

So the first-order interaction of a cubic with the sectors runs through A and B only: A has the frequency of q, and B
has first-order content as well (2.7). The odd sectors are a pure-cost problem.

### 1.8 Remote cubics: energy, kurtosis, deficit, contents

For a remote cubic q put u = ‖q‖², δ = E|q|⁴ − 2u² and χ = δ/u². For every circular cubic of the third chaos
E|q|⁴ ≤ 44u², so 0 ≤ χ ≤ 42, and E|q|⁶ ≤ 6u³ + 9uδ + (4045313/100000)δ^{3/2} [Lean · 3.4]. For every G put
F(G) = E|L + G| + E|L − G|, so that Λ(G) = F(G) − ‖G‖²/ε; for G even in z₁, in particular for a remote q,
F(G) = 2E|L + G|. With

    B(u) = 2E|L + √u·W|,   D(q) = B(u) − F(q),   D₊ = max(D, 0),

one has Λ(q) = F(q) − pu = B(u) − pu − D(q) and S = sup_u (B(u) − pu). D is the **deficit** of q against a Gaussian
of the same energy. A remote cap Λ(q) ≤ S + η_R does not say D(q) ≥ −η_R; the Gaussian slack S − (B(u) − pu) stays.

The profiles are E_{z₁}ph(L + y) = y·j(|y|²) and E_{z₁}[(T − 1)ph(L + y)] = y·g(|y|²), with j(0) = j₀ and g(0) = g₀;
−g and the B-kernel −g_B are completely monotone [P · 2.7a]. The **A-content** of q is
C(q) = ‖Π₁[q·g(|q|²)]‖: the first-order term of Λ(q + (T − 1)U) in a remote linear U is 2Re⟨U, Π₁[q·g(|q|²)]⟩. The
**content inequality** is C(q)² ≤ κ·D(q). The **B-content** is c_B(q) = Π₁[F_B(q)] with
F_B(w) = E_{z₁}[(z₁²/√2)·conj(ph(L + w))] = w·g_B(|w|²) [7.1.6, 7.1.8]; c_A = Π₁[q·g(|q|²)] is the vector of norm
C(q). The **Wick monomial** is the one-variable cubic X(|X|² − 2), up to a constant factor. The
**tilted content** is

    c_s(q) = Π₁[q·h_s(|q|²)],   h_s = (g − g₀) − s(j₀ − j)

(subtracting the constants changes nothing because Π₁q = 0).

### 1.9 The six layers of a proof

K_η must hold for every G, not only for the core. A proof has six layers:

| layer | statement | status | here |
|---|---|---|---|
| L1 | remote part: Λ(q) ≤ S + η for q independent of z₁ | peak row and a neighbourhood: proved; other rows open | 2.1 |
| L2 | the core with drivers independent of q | proved on the whole box | 2.2 |
| L3 | the core with shared drivers: explicit regions | proved regions at the peak; one region **R** | 2.4 |
| L4 | the core on the residual region: cost plus content | K: families proved, general cubics open; Λ̂: closed at the peak | 2.5, 2.6 |
| L5 | all sectors together | B cost and alignment proved; odd sectors over remote cores proved (peak); joint A/B and odd sectors over A/B cores open | 2.7–2.9 |
| L6 | row envelope and consumption | peak central interval: proved conditionally on an all-sector bound; exterior proved outside (0.8165, 0.866) at ε = 299/400 and outside (0.7515, 0.863) at ε = 94/125 (author only, 13 central rows each with > 10⁻⁴ allowance); central all-sector bounds and Lean consumer open | 2.10 |

**How the pieces depend on each other.** Two chains lead from the remote cap to a lower bound; each arrow uses
everything before it, and both end in a consumer (L6), whose rows other than the peak need the same chain at their own
profiles [STATUS §15].

    through Λ̂ (enough for the bound, 1.6):
      remote cap (3.3)  →  retained A-core, S + 2·10⁻⁵ (11.51: tilt 11.12, remainder 11.39, gain 11.40, content 11.61)
        →  A + B core, S + 4.936·10⁻⁵ (7.4.10)            unconditional on the peak energy domain (7.4.16)
        →  all six sectors, S + 9.9·10⁻⁵ (7.5.3)           odd premise (P_Ψ) open outside the proved regions (7.4.16, 7.5.12)
        →  consumer (8.1, 8.9–8.13)                        central rows and the Lean statement: open

    through Λ (Conjecture K itself):
      remote sign D(q) ≥ 0 on the class handled  →  A-core by cost 6.2.1 and the content inequality
        C(q)² ≤ κ·D(q) (6.2.3), which already forces D(q) ≥ 0 there                    content: open in general (6.3.18)
        →  A + B core (7.4, with the constants of 7.4.2; B-content from A-content, 7.1.6)   joint bound: open
        →  odd sectors over cores with A/B shells (7.2.4)                              open
        →  consumer                                                                    open

Outside both chains and proved: disjoint drivers (4.2), Theorems A and B (5.1, 5.2), the odd sectors over the zero core
and over remote cores (5.4, 7.2.10), and the all-sector bound on an energy region around the zero core (7.5.1). The two
chains use different remote inputs. The Λ̂ chain consumes the remote cap 3.3, Λ(q) < S + 3.6·10⁻⁷, whose positive
allowance at zero driver is paid inside its displayed totals. The Λ chain needs Λ(q) ≤ S, so it cannot consume 3.3 as a
sharp input: the strong content route 6.2.3 assumes C(q)² ≤ κ·D(q) on the class being handled, which contains D(q) ≥ 0
there, and its weaker variant uses a priced slack η, with η = 0 for a sharp conclusion. These are premises on the class
at hand. They are distinct from the all-energy, all-price sharp radius conjecture D(q) ≥ 0 for every q (3.5, 3.6),
which is a separate open problem that neither chain needs in full.

## 2. What is proved

### 2.1 The remote part (L1)

Remote K reduces to a moment problem for U = |q|²/u: two-point extremal laws, cubic Hermite majorants of the profile,
a secant envelope in the variance [P · audit · 3.1]. At the peak row:

    Λ(q) < 1.373953883 < S + 3.6·10⁻⁷     for every remote cubic q, in every finite dimension, at every variance.

[P + C · October package; acceptance replayed with every profile integral recomputed by codex-a7c4 and again by
claude-b9ee · 3.3] The certificate uses 68 profile caps, 45 Stein nodes, 154 outer boxes and the zero- and
high-variance rays. Its inputs about cubic chaos (EU = 1, EU² = 2 + χ, the sixth moment, the Stein variables and the
spectral cuts) are Lean theorems of this repository; the cuts it uses have knots that the Lean family does not have,
which a dense-test extension covers on paper [Lean, P · 3.4, 3.12]. It is an external certificate, not a Lean
theorem, and it does not give same-variance domination D(q) ≥ 0.

Around the peak:

- **Tube.** With λ = ε/(1891/2500), Λ(q) < S + 8.1·10⁻⁵ for ε ∈ [0.74, 0.76] and
  |a − λ·699/1250| + (3/2)|b − λ·179/1250| ≤ λ/50000 [P author only + C · codex-a7c4 · 3.11].
- **One-sided rectangle.** ε ∈ [0.74, 0.76], 0 ≤ a/λ − 0.5592 ≤ 1/2000 and 0 ≤ b/λ − 0.1432 ≤ 1/625 give
  Λ(q) < S + 9.934·10⁻⁵ [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 3.15].
- **Convex cells.** Caps at the vertices of a convex cell of profiles transfer to the cell through a concave lower
  bound of S, such as the supporting plane of the Gaussian benchmark [P · 3.13]. No cell is certified: remote caps
  exist at the peak only.

The flank and upper rows are outside all of these.

**Near the Gaussian.** Every nonzero remote cubic with 0 < χ ≤ χ₀ := 1/72000 (or 0 < χ ≤ 1/73500 via U(1) phase
averaging) satisfies E|q| ≤ (√π/2)√u·(1 − χ/32), buffered PVD E|q + √v·W| ≤ (√π/2)√(u + v) (v ≥ 0), and
D(q) ≥ −B″(u)δ/8 > 0 at every energy, every price and every profile a > 0, b ≥ 0; strict unbuffered domination
E|q| < (√π/2)√u holds for 0 < χ ≤ χ₁ := 1/18000 (or 1/18375) [P + C, author only · gemini-2762 · 3.18]. The proof
expands E|F| to second order in Stein cumulants on 𝓗₃, collapses the Ornstein–Uhlenbeck semigroup kernels g_{k,l} to a
single positive integral on (0, 1), and certifies |R_{|x|}(F)| ≤ (86/25)κ₄(F)^{3/2} in exact rational/Bernstein
arithmetic; qualitative existence of a universal χ₀ > 0 also follows from the total-variation Edgeworth theorem on
clipped absolute values [P, author only · codex-c7e2 · 3.18]. Two further theorems show that K itself holds in a
dimension-free neighbourhood of the Gaussian law: for the whole cubic at every amplitude when its normalised fourth
excess is below some χ\* > 0, and, near the optimum, with a strictly positive quadratic deficit [P author only · 12.8].
That all-sector threshold χ\* has no numerical value (at most of order 10⁻¹⁶ with the stated constants). At the peak
profile, smoothing by L gives much wider signed deficit regions:

**An explicit near-Gaussian deficit.** At the peak profile, write
κ₆ᶜ=E|q|⁶−6u³−9uδ. The scalar Edgeworth expansion gives, for every remote cubic
and 0<u≤0.0463,

    2E|L+q| = B(u)+(δ/4)B″(u)+(κ₆ᶜ/36)B‴(u)+R,
    |R| ≤ 5700√u δ^(3/2), or 2700√u δ^(3/2) when χ≤1/100.

The degree-specific joint products of the second and fourth chaos components of ‖DF‖²−3, F=√(2/u)Re q, control the
remainder. The ordered cumulant recursion of Nourdin–Peccati (their Theorem 8.2.5) computes their mixed moments in the
finite controls; the product formula (their Theorem 2.7.10) supplies the universal bounds. Cauchy–Schwarz using E V⁻¹
and E V⁻² also gives −B″(u)/4>21/50 throughout this energy range. Together with the sixth-moment bound, these imply
the following dimension-uniform signed regions:

| domain | deficit |
|---|---|
| 0<u≤0.0463, χ≤1/250 | D(q)≥7δ/50 [3.19] |
| 0<u≤0.0463, χ≤9/2000 | D(q)≥δ/8 [3.19] |
| 0<u≤0.0463, χ≤1/5000 | D(q)≥δ/1000 [3.19] |
| 0≤u≤69/100000, every shape | D(q)≥9δ/50 [3.19a] |
| 0<u≤83/100000, 0<χ≤42 | D(q)>0 [3.19a] |

The original signed estimates are **P** on χ≤1/12000, χ≤10⁻⁴, χ≤1/5000 and u≤1/4000 respectively
[codex-a7c4, re-derived by claude-b9ee and a review worker · 3.19]. The smoothed Gaussian scale mixture,
the orthogonality of 𝓗₂ ⊕ 𝓗₄ to 𝓗₀ ⊕ 𝓗₆ ⊕ 𝓗₈, and the Hermite envelope |h₄(s)−3|≤(17/4)√s
give the wider signed regimes [P + C · gemini-21d5, independently reviewed by codex-a7c4 · 3.19].
On 56 energy intervals the absolute remainder is at most (467/2)δ^(3/2) for every shape,
or (265/2)δ^(3/2) for χ≤9364/390625. Nine low-energy intervals give the last two rows
[P + C, author only · codex-a7c4 · 3.19a].

The smoothed expansion gives D(q)>0 on (0,3/250] × (0,1/9] and on [3/250,0.0463] × (0,1/125].
The 79 Stein duals and the Stieltjes–Maclaurin estimate cover the adjoining larger shapes in 3.29.
Together these give strict positivity on (0,0.0463] × (0,49/100] ∪ (0,83/100000] × (0,42].
The remaining shapes in this peak positivity problem have χ>49/100 and u>83/100000 [3.19a, 3.29].

For 0.03≤u≤0.0463 and χ≤10⁻⁴ (9/2000, author only), the content coefficient 3/80 of 2.6 gives
‖c₍₃/₅₎(q)‖²≤0.3D(q), without additive error. With k=59009/189100, the global tilted
A-shell remainder (2.6) gives Λ̂(q+(T−1)r)≤S−δ/250 for every remote linear r, every
amplitude and arbitrary sharing. On χ≤1/12000 (1/250, author only) the retained reserve is 19δ/1000.
These follow from 1/8−(3/80)/k>1/250 and 7/50−(3/80)/k>19/1000.

Separately, the reviewed remote-core odd cost of 2.9 gives Λ(q+O)≤S−δ/8−(1988/47275)‖O‖² on 0<u≤0.0463, χ≤10⁻⁴ (9/2000,
author only), for
all genuine odd sectors O with arbitrary sharing and amplitude, provided no A/B shell is present. Each of the other
deficit bounds in the table substitutes on its own domain. These scalar results do not combine the A-shell and
odd-sector corollaries. For the fixed all-sector trial of 2.9 the same expansion leaves, beyond the scalar deficit, a
shared residual: the scalar factor paired with a difference of shifted and unshifted kernels, and the mixed
contractions with the first- and second-chaos parts, in both real channels of ν. The scalar result does not bound it;
the [joint interface](sources/cumulant-remainder-codex-a7c4/JOINT_INTERFACE.md) states it and a bound that would
suffice.

**Reformulations.** For one fixed profile, four statements are equivalent: the sharp radius bound E|q| ≤ (√π/2)‖q‖₂
for every cubic of H₂,₁; the same bound with every Gaussian buffer, E|q + √v·W| ≤ (√π/2)√(u + v) for every v ≥ 0
(PVD); same-variance remote domination, D(q) ≥ 0 for every remote cubic; and exact remote K at every price p > 0. For
a real chaos variable X of order k, the sign condition E[(Γ − σ²)e^{−sX²}] ≤ 0 for every s ≥ 0, with Γ = ‖DX‖²/k and
σ² = E X² (BNC), implies E|X + √r·g| ≤ √(2/π)·√(σ² + r) for every r ≥ 0 and an independent standard real Gaussian g
(real PVD); on the third chaos real PVD implies the complex one, and no converse is known
[P · codex-a7c4, re-derived by claude-b9ee · 3.5]. Exact remote K is not needed for 1.402. A further route to the
sharp radius bound is doubling monotonicity: if E|(X + X′)/√2| ≥ E|X| for every X ∈ H₂,₁ and an independent copy X′,
iteration and the central limit theorem give the bound. It is a conjecture, supported on the cubics tested (smallest
gain found +0.0065) [open; N · 3.20]; its real analogue is false, for He₃(G)/√6 (an exact rational certificate,
replayed), so a proof must use the complex structure [3.20]. The radius over H₂,₁(ℂᵐ) is within 3/√m of the radius over all dimensions, a rate and not a
bound [P · 3.28].

**The radius.** The sharp radius bound is open; cases are proved for real BNC of order 2, one-variable H₃ at every
scale, the family aH₃(g₁) + bH₂(g₁)g₂ and Gaussian scale mixtures [R · 3.6]. In every dimension, the sharp bound holds
with every Gaussian buffer for 0 < χ ≤ 1/72000 (3.18), strictly without a buffer for 0 < χ ≤ 1/18000 and across the
high-kurtosis regime χ ∈ [26, 42], where **E|q| ≤ (443/500)‖q‖₂ = 0.886‖q‖₂ < (√π/2)‖q‖₂** [P + C, author only ·
gemini-2762 · 3.6, 3.7], as well as on hyperplane-vanishing cubics and on P₃,₁(q²) = 0 [P, author only · 3.25, 3.24].
Without a buffer, (E|q|)² ≤ (1569/2000)E|q|² holds for every cubic in at most seven coordinates; with every buffer,
radius domination holds for one two-variable family around the known counterexample to the stronger Laplace comparison
[author only, certificates replayed · 3.6]. Across all of H₂,₁ in every dimension, **E|q| ≤ (4571/5000)‖q‖₂ =
0.9142‖q‖₂** (combining the universal phase-averaged linear bound E|q| ≤ (√π/2)‖q‖₂(1 + (26449/5000000)χ) < 0.9121‖q‖₂
on χ ∈ [0, 11/2] with rows 7–13 of `cert_915.json` on χ ∈ [11/2, 42], whose Sturm and Bernstein checkers were replayed
by codex-062a while Row 7's damped Level-3 proof remains author only; `cert_915.json` alone gives **1829/2000 = 0.9145**
via 5 compactly-supported damped fourth/fifth-order Stein rows on χ ∈ [2, 7] at ε = 1/40 with a piecewise-linear 5×5 knot
matrix T(v) and 9 Level-2 flank rows, largest row bound < 0.9143745) [P, author only + C · gemini-2762, rows 7–13
replayed by codex-062a · 3.7], **E|q| ≤ (2287/2500)‖q‖₂ = 0.9148‖q‖₂** (combining that phase-averaged linear bound on
χ ∈ [0, 6] with the Level-2 flank rows 16–22 of `cert_916.json` on χ ∈ [6, 42]) [P + C · gemini-2762, independently
reviewed by codex-062a, codex-6d92 and claude-b9ee · 3.7], and **E|q| ≤ (2289/2500)‖q‖₂ = 0.9156‖q‖₂** (strictly below
0.916‖q‖₂ when q ≠ 0):
a 23-row certificate (`cert_916.json`) on χ ∈ [0, 42] augments the second-moment relaxation below with two third-order
radial forms of 2.5 (tests q̄(c₂ − 1)g₃(V) and qāg₄(V)) coupled through ∂̄_ka = W_k and E Σ_k|W_k|² = 24y, passing the
0.916 radius test of the uncapped degree-5 game in `../higher-degree` [P + C · gemini-2762, independently reviewed by
codex-6d92 and claude-b9ee · 3.7, 3.21]. From the two first-order radial Stein identities of 2.5 alone, a 23-row
certificate gives E|q| ≤ (93/100)‖q‖₂ [P + C · a research worker of claude-b9ee, with an independent review · 3.7];
with Lean theorems as its only inputs that second-moment method gives 9387/10000, two outside certificates give
9359/10000 and 46731/50000 [P + C · 3.7], and all second-moment constraints on the kernels together stop near 0.9286
[N · 3.7]. On the complex quintic chaos H₃,₂(ℂⁿ), diffuse sums reach √π/2, hyperplane-vanishing and conditionally
Gaussian quintics (including H₃,₂(ℂ¹) and every Wick monomial) satisfy E|q| ≤ (√π/2)‖q‖₂, multi-start searches in
d = 1…6 stay at or below 0.6919 [N], and a closed-form degree-6 majorant with the three-pair Frobenius sixth-moment
bound E|q|⁶ ≤ 59,735,934‖q‖₂⁶ proves E|q| ≤ (499999999/500000000)‖q‖₂ < ‖q‖₂ in every dimension [P + C, author only ·
gemini-2762 · 3.30]. In real second chaos, E|X| ≤ √(2/π)‖X‖₂ [R · 3.8], and a
second, computer-assisted proof exists [P + C author only, double precision · an outside session of the user, its
certificate re-run by claude-b9ee · 3.8]. At p = 1 this is the conjectured value of sup‖Σⱼxⱼ(Eⱼ − 1)‖ₚ over unit x,
for independent standard exponentials Eⱼ, in a conjecture of Brazitikos, Tang and Tkocz (arXiv:2602.03058, Remark 4),
which D₁ therefore settles at p = 1 [P · 3.8]. With a first-chaos part the bound is proved when the second-chaos part
has a spectrum symmetric about 0 [P + C author only · 3.21 (e5)]. In real third chaos the same bound would give the
sharp radius by phase averaging. It is open in general. It holds on reflection-odd and conditionally Gaussian cubics
[P author only, certificates replayed · 3.21 (e1)], and on cubics with 0 < κ₄ ≤ 1/12250 (with E|F| ≤ √(2/π)‖F‖₂(1 −
κ₄/48) on 0 < κ₄ ≤ 1/49000) [P + C, author only · gemini-2762 · 3.21 (e1)]; by slicing along great circles with radial
integration, the whole third chaos in at most eleven coordinates [P + C · 3.21 (e3)]; harmonic cubics in at
most twelve [P + C author only · 3.21 (e3)]; the diagonal sums Σλᵢ·He₃(Xᵢ) in every dimension, with strict
inequality [P + C author only · 3.21 (e2)]; the normalised elementary symmetric cubic e₃ in any number of variables
[P author only · 3.21 (e4)]; every h whose correlation with some He₃(⟨v, X⟩)/√6 is at least 0.698,
for maximal tensor influence at least 0.692, and every h with κ₄ ≥ 49 [P + C · 3.21 (e4)]; four-partite cubics and, in the chaos of every order
d ≥ 2, the (d + 1)-partite elements [P + C author only · 3.21 (e5)]; and the
limit family a·He₃(X) + b·XY + c·Z of third-chaos variables with a Gaussian bath (X, Y, Z independent standard
Gaussians; equality only when a = b = 0), also with any independent Gaussian scale mixture added
[P + C author only · 3.21 (e6)]. On conditionally Gaussian cubics even the smoothing sign of 3.21 (d) holds
[P · 3.21 (e7)]. Another sufficient condition is Ω₃, a covariance inequality between Γ and a weight concentrated near
the nodal set, which comes from a martingale–isoperimetric bound; it holds numerically on about 200 cubics, but no
mechanism for it is known where the sharp bound is open [P; N · 3.21 (e10)]. Every nonzero h satisfies E|h| < 0.88714‖h‖₂
in every dimension, by rotations on a Gaussian circle restricted to the at most three sign changes per half-turn of a
cubic [P + C · 3.21 (e9)(i)]. The tested rotation certificates do not reach √0.68 [N · 3.21 (e9)]. Moments, hypercontractivity and the
cumulant bounds cannot give even the constant √0.68 there, the real form of 0.916, and the stronger Gaussian Laplace
and small-ball comparisons are false even for He₃(G) [3.6, 3.21; chapter 4, item 95]. √0.68 is also proved in at most
fifteen coordinates, for correlation at least 0.642, for κ₄ ≥ 46.6, for maximal tensor influence at least 0.66502 or at most 0.0064,
for Var(‖∇h‖²/3) ≤ 89/2250 when E h² = 1, and for κ₄ ≤ 91/500 = 0.182
[P + C · 3.21 (e9)(ii)–(iv)], and extended via a one-step Ornstein–Uhlenbeck resolvent identity with a V₂ ⊥ V₄
cross-multiplier to **Var(‖∇h‖²/3) ≤ 373/200 = 1.865** when E h² = 1 and **κ₄ ≤ 19/2 = 9.5** (covering all four Cartan
isoparametric cubics, from universal linear bounds E|h| ≤ √(2/π)‖h‖₂(1 + (26449/7500000)κ₄) and E|h| ≤ √(2/π)‖h‖₂(1 +
(717/40000)Var(‖∇h‖²/3)/‖h‖₂⁴)) [P + C · gemini-2762, re-derived and replayed by codex-062a · 3.21 (e9)(iv)]. On the 2-sphere the L¹/L² constant of odd cubics is
conjectured to be √55/8 = 0.9270, attained by the hemisphere: it is
proved for zonal sign patterns, and the hemisphere is a strict local maximum [P · 3.21 (e3)]. The largest ratio
E|h|/(√(2/π)‖h‖₂) found numerically is 0.9051, in ten coordinates [N · 3.21 (e8)].

**A weighted interpolation target.** Put F=√(2/u)Re q and Γ=‖DF‖²/3. For the visible
mixture L =_law √V W, the scalar Stein reduction gives the exact deficit formula

    D(q)=−√π E_V[√(V+u) ∫₀^{u/(2V)} E[(Γ−1)e^(−aF²)]/(1+2a)^(3/2) da].

Thus E[(Γ−1)e^(−aF²)]≤e for all a>0 implies D(q)≥−e[B(u)−B(0)]. The Malliavin variance bound Var Γ≤χ/3 and the kernel
range [0,1] give |D(q)|≤√(χ/12)[B(u)−B(0)]. At the peak, 0<u≤0.0463 and χ≤1/45000 therefore imply |D(q)|<10⁻⁴
[P · codex-a7c4, re-derived by claude-b9ee · 3.22]. The mixture and B(u)−B(0)≤√π u/(2a) hold throughout the profile
box [2.7]. The desired nonpositive sign is the smoothing condition of the real third chaos [3.21 (d)]. The sign D≥0 is
open. Quadrature of the payoff and of the interpolation formula agree on the controls; this tests the identity, not
the sign [N · 3.22]. The [literature audit](sources/interpolation-literature-codex-a7c4/REPORT.md) explains why
Gaussian comparison and Parisi formulas do not supply that sign automatically. It also separates the real
Raghavendra–Steurer algorithm from the complex minimax argument of the October manuscript.

**External claims.** A report claims a remote closure in another normalisation (E|q|² ≤ 1 ⟹ Φ(q) ≤ 2853/4000, and
three related statements); its package is not in the record, so nothing is checked [R · 11.7–11.11].

**Two classes with exact remote K, and the structure of the deficit.** For q ∈ H₂,₁ put J = Σ_j(|∂_jq|² − |∂̄_jq|²).
Then E f(|q|²) − f(0) = E[J·f′(|q|²)] for every smooth f of polynomial growth. For a real C¹ profile φ of polynomial
growth put D_φ(q) = E φ(uτ) − E φ(|q|²), with τ a standard exponential variable independent of q; for
φ(v) = 2E|L + √v|, the expectation being over z₁, this is the deficit D(q) of 1.8. Then D_φ(q) = −Cov(J, K_φ′(|q|²))
with K_φ(v) = E φ(v + uτ), and the Laplace order, the buffer deficits and the smoothing sign are positive functionals
of the single function N(λ) = (1 + λu)·E e^{−λ|q|²} − 1 [P + C, both author only · 3.23]. Two classes follow.
- If P₃,₁(q²) = 0 (equivalently Σ_j ∂_jq·∂̄_jq ≡ 0; every decoupled cubic), then |q|² is exponential conditionally
  on |∂̄q|². So D_φ(q) ≥ 0 for every concave profile, and every content of q vanishes
  [P + C, both author only · 3.24].
- If q vanishes on a complex hyperplane {X = 0}, then for every Gaussian buffer σ ≥ 0,
  √π·√(σ² + u) − 2E|σW + q| ≥ |α|²a_σ + ‖ℓ‖²b_σ with a_σ, b_σ > 0, where α and ℓ are the coefficients of X(|X|² − 2)
  and of X². In particular E|q| ≤ (√π/2)·√(u − |α|²/4 − ‖ℓ‖²/2). The class contains every one-driver cubic, in every
  dimension [P author only · 3.25].

The proof of the second class conditions on one coordinate. A component free of that coordinate enters with the wrong
sign, so the method covers two variables numerically and not three [N · 3.25, item 94]. For a general cubic,
D_φ = 𝒥_dec + two weighted contractions of the pair (a, DF·F), with a = Σ_j ∂_jq·∂̄_jq and F = ∂̄q, where 𝒥_dec ≥ 0 is
the deficit of the decoupled surrogate ⟨w, ∂̄q⟩ with an independent Gaussian vector w. At the peak row all three terms
are nonnegative on every cubic tested; a proof of the sign of the two contractions would give D(q) ≥ 0 there in every
dimension [P author only for the identity, N for the signs · 3.26]. For √v itself this split and that of 2.5 each have
a term of the wrong sign on explicit cubics [N · chapter 4, item 92].

### 2.2 Disjoint drivers (L2)

For mutually independent z₁, q and U, with q ∈ L² and U a centred proper Gaussian linear form,

    Λ(q + (T − 1)U) ≤ Λ(q) − (1/ε − 197/(200ℓ))·‖U‖²,

at every amplitude and on the whole box (the cost is at least 3/152 there) [P + C · codex-a7c4, re-derived and
replayed by claude-b9ee · 4.2]. With independent drivers the A-shell is pure cost, and the core reduces to L1 with
the same error. The redistribution form F(H + (T − 1)U) ≤ F(H + √b·W), for mutually independent z₁, H ∈ L² and a
Gaussian U with b = E|U|² and b + E|H|² ≤ ℓ², holds as well; the independence of H from z₁ is needed [P · audit · 4.1].

### 2.3 Shells without a remote cubic; conditionally Gaussian adversaries

- **Theorem A.** If the Wick polynomial of G vanishes at z₁ = 0 (every sector except q and A), then
  F(G) ≤ B(‖G‖²) with the paired F(G) = E|L + G| + E|L − G| of 1.8: same-norm domination at every amplitude (needs
  a/β ≥ 11/4) [P · audit · 5.1]. Its tangent step
  fails once a remote q is present: a remote variance adds a positive tangent correction [P · 5.1a].
- **Theorem B.** If 𝓕 is independent of z₁ and G is centred proper Gaussian given (z₁, 𝓕) with conditional variance
  s + u(T − 1)² + bT + cT², coefficients nonnegative and 𝓕-measurable, then F(G) ≤ B(‖G‖²)
  (needs a/β ≤ 11/2; covers the σ\* = 0 corner; excludes arbitrary conditional cross-covariance) [P · audit · 5.2]. A
  genuine cubic can have a sign-indefinite conditional cross term: X[(T − 1) + (|Y|² − 1)] has conditional variance
  [(T − 1) + (|Y|² − 1)]², so shared-driver cubics are not covered by Theorem B [P · 5.3].
- Theorems on buffered and small-amplitude classes of the October manuscript need a Gaussian buffer or very small
  energy [R · 5.5]. Two further regimes are recorded [R]: a remote part q + gW with a genuine cubic q of energy at most
  0.0064 and a diffuse buffer g ≥ 0.185, where every shared A and B shell is covered at all amplitudes [5.6]; and the
  one-driver family with c = 0, P equal in law to −P and the remote remainder R independent, where the content
  vanishes by symmetry and K holds exactly for 1/24000 ≤ w ≤ 0.0113 [6.3.19].

### 2.4 Shared drivers: explicit regions (L3)

Write w = ‖r‖² for the A-shell form r, which may share coordinates with q. Using only that q and r are square
integrable, independent of z₁ and orthogonal, at the peak row:

    Λ(q + (T − 1)r) ≤ B₀ + 0.389644·u − 0.124324·w,

so Λ < S + 10⁻⁴ for u ≤ 0.00558 + 0.31907w; and for u ≤ 0.0463, w ≥ 0.0206 gives Λ < S + 10⁻⁴, w ≥ 0.0208 gives
Λ < S, w ≥ 0.02105 gives Λ < S − 10⁻⁴ [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 6.1.1, 6.1.1a].
A fourth-moment bound pushes the threshold down to w ≥ 0.01125 [R · 6.1.2]. What remains is the **residual
rectangle**

    R = {w < 0.01125, 0.00551 + 0.319w < u ≤ 0.0463}

(with the proved regions alone, {w < 0.0206, 0.00558 + 0.31907w < u ≤ 0.0463}). The upper end u ≤ 0.0463 is the
response bound on the remote energy (2.10). For a remote Gaussian linear form r with w ≤ 0.0113, its bounded-kurtosis
strip χ = δ/u² ≤ 0.2809 across the band (including χ ≤ 0.05; χ ≤ 9/100 directly from the remote cap, χ ≤ 1/4 in stdlib,
all χ on u ≤ 0.00815, and τ_max ≤ 0.054) satisfies Λ < S + 10⁻⁴ [P + C · 6.3.40; P + C, author only · gemini-5331 · 6.1.5, 6.3.43].

### 2.5 The A-sector of K: cost and content (L4)

**Cost.** For every remote q and every remote linear U with ‖U‖² ≤ 0.0113, with any sharing, at the three rows:

    Λ(q + (T − 1)U) ≤ Λ(q) + 2Re⟨U, Π₁[q·g(|q|²)]⟩ − 0.24·‖U‖².

[P with the exact checker replayed · second audit of codex-a713 · 6.2.1]

**Cost plus content.** If C(q)² ≤ 0.24·D(q), then Λ(q + (T − 1)U) ≤ B(u) − pu ≤ S. *Proof:* the first-order term is at
most 2C‖U‖, and 2C‖U‖ − 0.24‖U‖² ≤ C²/0.24 ≤ D(q); add Λ(q) = B(u) − pu − D(q). ∎ [P · 6.2.3] A bound for every unit
direction bounds the whole projection, with no dimension factor [P · 6.2.4]. So on R the A-core reduces to the content
inequality, but this proves neither raw K for all G nor K′ (R comes with response restrictions) [P · 6.2.5].

At the peak profile, the allowance version C² ≤ 0.24(S − Λ + 10⁻⁴) holds dimension-free for χ ≤ 0.2809
throughout the band, for all χ when u ≤ 0.00815 and for every maximum normalized influence at most 0.054.
Intermediate energy strips have larger fourth-excess ceilings
[P + C · 6.3.40]. The staircase builds on gemini-5331’s smoothed OU bound and Radau method and replays 48 witnesses from #518. The influence extension uses the supplemental bank.
[gemini-5331’s #518 proof at b18e47309](https://github.com/agalatan/grothendieck-lean/blob/b18e47309ed0a2f0a76bdda47374f871fbc5552d/research/conjecture-K/sources/raw-content-2026-11-17-gemini-5331/PROOF.md) · [Supplement](sources/content-509-codex-6d92/SUPPLEMENT.md)

The strong bound C² ≤ 0.24D holds on the band for χ ≥ 40.32.
Fourth-moment stability captures at least 93% of the energy in one Wick direction there
[P + C · 6.3.41]. For a sum of independent coordinate blocks, the bound
C² ≤ 7.98 Σ_j δ_j^{3/2} gives the weak form for 95 or more equal-energy blocks
[P + C · 6.3.42]. The directional gain and block bound use the baseline OU estimate of gemini-5331’s #518 §§3.1–3.3.
[gemini-5331’s #518 proof at b18e47309](https://github.com/agalatan/grothendieck-lean/blob/b18e47309ed0a2f0a76bdda47374f871fbc5552d/research/conjecture-K/sources/raw-content-2026-11-17-gemini-5331/PROOF.md)

The #512 matrix dual admits an added rank-one content term obtained from an exact directional
integration-by-parts identity [P]. The first relaxation exceeds the weak target in the intermediate-excess tests [N].
[Duality reduction](sources/content-509-codex-6d92/DUALITY.md)

**Families with the content inequality** (0.00551 ≤ u ≤ 0.0463, three rows unless the row says otherwise; X a remote
driver, Y the other remote coordinates):

| family | constant κ | status |
|---|---|---|
| q = X·P, P any centred variable independent of X with the moment bounds of 6.3.1; every complex quadratic P(Y) | 0.22 | P + C (audit) · 6.3.3 |
| Gaussian-factor class Σ_j X_jP_j(Y), any number of drivers and coefficient matrices | 0.239 | P + C (audit) · 6.3.4 |
| A real phase linear in a real Gaussian carrier block, including balanced odd/even driver-shell examples | 47/200 | P (independent review of #675), from the P + C, author-only inputs of 6.3.16a · [6.3.16b](sources/real-driver-blocks-codex-a7c4/PROOF.md) |
| Mixed Gaussian drivers Σⱼ[XⱼPⱼ(Y) + X̄ⱼHⱼ(Y)], with arbitrary jointly dependent (1,1) and holomorphic (2,0) bath coefficients | 47/200 | P + C, author only · [6.3.16a](sources/mixed-driver-blocks-codex-a7c4/PROOF.md) |
| Complete one-driver self-interaction X[c(\|X\|² − 2) + P], arbitrary complex c ∈ ℂ and centred P ∈ L² independent of X, Wick share f = 2\|c\|²/u ∈ [1/16, 1] | 11/50 | P + C, author only · gemini-21d5 · 6.3.13 |
| Small-Wick self-interaction X[c(\|X\|² − 2) + Y\*AY − tr A], arbitrary complex c ∈ ℂ and complex matrix A, f ∈ [0, 1/16] (hence all f ∈ [0, 1]) | 47/200 | P + C, author only · gemini-21d5 · 6.3.5, 6.3.14, 6.3.15 |
| Mixed driver q = X[c(\|X\|² − 2) + P(Y)] + X̄H(Y), any complex centred (1,1) quadratic P and holomorphic quadratic H | 47/200 for every Wick share, 11/50 for f ≥ 1/16 | P (independent review of #664), from the P + C, author-only envelopes in 6.3.13–6.3.14 · 6.3.16 |
| Wick neighbourhood X[c(\|X\|² − 2) + P], P centred independent of X, E\|P\|² ≤ u/5 | 9/40 | implications P (audit); scalar/cell premises C, author only · gemini-21d5 · 6.3.6 |
| **peak row only:** p + h with p, h ∈ H₂,₁, p of charge one under rotation of a specified coordinate block, h with no component of that character, D(p) > 0, C(p)² ≤ (9/40)D(p), ‖p + h‖² ≤ 0.0463 and ‖h‖² ≤ D(p)/56 | 6/25 | P + C · 6.3.9b–6.3.9c |
| Character core p under a compact unitary symmetry, h with zero component of that character. Includes opposite signs under negation of a driver block. D(p)>0, C(p)² ≤ κD(p), ‖p+h‖² ≤ 0.0463, ‖h‖² ≤ D(p)/n | 6/25 | For κ = 47/200, 9/40, 11/50 respectively, n = 167, 56, 42 on peak and flank and n = 160, 54, 40 on upper. P + C · [6.3.9c](sources/mixed-driver-sign-perturbation-codex-a7c4/PROOF.md); the same budgets transfer to real sign characters (P + C, author only) · [6.3.9d](sources/real-trilinear-neighbourhood-codex-a7c4/REAL_CHARACTERS.md) |
| Any q whose real part has trilinear projection P on three orthogonal real blocks, with u₀ = 2E P² and residual energy e = 2E(Re q−P)². At 0 ≤ u₀+e ≤ 463/10000, it suffices that e ≤ (3/40)[(4/3)E P⁴−u₀²], or e ≤ u₀²/4 if one block is a line. | 6/25 | P + C, author only · [6.3.9e](sources/real-trilinear-neighbourhood-codex-a7c4/PROOF.md) |

The moment theorem behind the scalar proper Gaussian-factor and small-Wick results is E|P|⁶ ≤ 37p·E|P|⁴ − 68p³ and E|P|⁴ ≥ 2p² for P = Y\*AY − tr A, any complex
A, p = E|P|² [P + C · 6.3.1]. The self-interaction family has a deficit identity whose Wick term |c|²𝓚(u) is strictly positive across the band (𝓚(u) > 0.0307 at all three rows, and 𝓚(0.0463) ∈ [0.16678146, 0.16678220] at the peak)
[identity P · second audit; bounds P + C, author only · gemini-21d5 · 6.3.7]. On f ∈ [1/16, 1] a linear-plus-quadratic envelope in (|z|², Re(c̄z)) avoids division by p = u − 2|c|² as f → 1 and holds without fourth- or sixth-moment hypotheses on P; on f ∈ [0, 1/16] the moment-polynomial envelope (†) with affine weight w(y) = 3/10 + (7/10)y closes the small-Wick strip, both certified in outward-rounded C++17 `Aff4` Taylor arithmetic with exact rational tails [P + C, author only · gemini-21d5 · 6.3.13–6.3.15; [Proof](sources/one-driver-self-interaction-2026-11-24-gemini-21d5/PROOF.md)]. The families do not add up: the cross terms between shells survive phase averaging
(q = X̄Y² + (|X|² − 1)Y has energy 3 and E[X̄q|q|²] = 6) [P + C · 6.3.8].

**Bounded kurtosis and universal O(δ^{3/2}) bounds.** By the positive Laplace-atom representation of the scalar
responses m_A and m_B, both attain their global third-derivative suprema uniquely at 0, giving
‖c_A(q)‖² ≤ (3√6/4)g′(0)²·δ^{3/2} (< 5353/625·δ^{3/2} at the peak; ‖c_B(q)‖² < 9801/5000·δ^{3/2}; exponent 3/2 sharp,
3√6/4 ≈ 1.8371 matching the universal leading-tensor coefficient of 6.3.12, where the Hermitian one-driver class has
absolute coefficient ≤ 0.481, ratio ≈ 0.262) at every energy and dimension, lowered to < 9/2·δ^{3/2} for u ≥ 0.044 by 1-D
Ornstein–Uhlenbeck smoothing (sharpened by √(13/15) in 6.3.42), together with ‖c_A(q)‖² ≤ [32/(225πa⁴)]·δ (< 58/125·δ
at the peak). Combined with the Edgeworth bounds of 2.1, spectral Stein duals and Stieltjes–Maclaurin deficit envelopes,
this gives signed C(q)² ≤ (6/25)D(q) + 10⁻⁶ on [0, 0.0463] × [0, 841/10000] and exact zero-slack C(q)² ≤ (6/25)D(q)
across the full connected domain [0, 0.0463] × [0, 49/625] ∪ [0, 7/10000] × [0, 42] ∪ [0, 3/250] × [0, 1/4] with no
near-Gaussian sliver. The all-shapes extension to 7/10000 uses the unsmoothed raw A-content constant 5353/625 [P + C, author only · codex-a7c4 · 3.19a; gemini-5331, gemini-21d5 · 6.3.43].

The opposite driver character X̄H(Y) can be included at arbitrary strength in the one-driver self-interaction. Replacing it by X·conj(H(Y)) preserves the joint law with X and all first-chaos content. The resulting complex quadratic of real Gaussians satisfies the combined small-Wick moment multiplier. [One-driver proof](sources/mixed-driver-folding-codex-a7c4/PROOF.md)

With several drivers and no self-interaction, the folded law is a proper Gaussian mixture. A bound on the directional real covariance gives C² ≤ (47/200)D for every choice of bath quadratics. In particular (|X|² − 1)U(Y) + X²·conj(V(Y)) is covered for arbitrary linear U,V by taking Y as the driver block. [Many-driver proof](sources/mixed-driver-blocks-codex-a7c4/PROOF.md)

A real phase of the cubic can have an independent real Gaussian carrier even when no complex carrier exists. Angular averaging recovers the full content norm from the real coordinate covariances with a single sign. A three-coordinate example realizes every positive ratio of odd to even energy, including equal weights. Its normalized covariance is at most 2/3, giving C² ≤ (595896997819/3000000000000)D throughout this explicit family. [Real-driver proof](sources/real-driver-blocks-codex-a7c4/PROOF.md)

**Open in L4:** mixtures of the odd-X core with the even-X terms (|X|² − 1)V(Y), X²W̄(Y) or R₀(Y) beyond the sign neighbourhood of 6.3.9c and the real-block class [6.3.16–6.3.16b]; several
self-interacting drivers [6.3.17]; and the **raw content inequality for an arbitrary intermediate-kurtosis cubic on R**
[open · 6.3.18].

**What a proof must use.** At the peak, Q = √u₀·X·exp(2πi·F₂(|X|²)) with F₂(r) = 1 − (r + 1)e^{−r} and
u₀ = 403448/10⁷ has exactly the law of √u₀·W, is orthogonal to the whole remote first chaos and has the matched
conditional covariance; yet G = Q − (i/1250)(T − 1)X has Λ(G) > S + 7·10⁻⁷, numerically Λ(G) − S ≈ 1.12·10⁻⁵
[P + C, N · codex-a7c4, re-derived and replayed by claude-b9ee · 6.5.1].
Q is not a cubic (E‖DQ‖² = u₀(1 + 64π²/81) > 3u₀), so K is not refuted, but the law of the residual, orthogonality
and radial tests cannot suffice: the Wick structure (E‖Dq‖² = 3u, the resolvent identity) must enter.

**Scalar profile bounds and the Gaussian budget.** For the peak radial profile φ(r) = 2E|L + √r|, complete
monotonicity gives global rational bounds g(r) − g₀ ≤ g′(0)r/(1 + 1.29r) and
φ(r) ≤ φ(0) + φ′(0)r + φ″(0)r²/(2(1 + 2.14r)) [P + C · 2.7b]. The Gaussian buffer satisfies
S − (B(u) − pu) ≥ (27/25)(u − u_\*)² on 0.00551 ≤ u ≤ 0.0463 [P + C · 2.7c], with u_\* defined in 1.4.
These bounds do not close the content inequality: at u = 0.0403448, the expectation of the Taylor cubic
φ(0) + φ′(0)r + φ″(0)r²/2 + φ‴(0)r³/6, less pu + S, exceeds 0.00010675513, already larger than
η = 10⁻⁴; the rational bound with denominator 1 + 2.14r loses more. A sharper rational parameter
φ‴(0)/(−3φ″(0)) ≈ 1.4224237982 passes the Gaussian budget numerically at u_\* and 0.0463, but its global validity
and the subsequent content-versus-deficit comparison remain open [N · 2.7b–c]. The fourth-moment identity of 6.3.21
controls the size of the Stein defect; it does not establish the sign of its correlation with the Hessian in
Gaussian interpolation. The signed deficit estimate of 3.19 applies on its stated near-Gaussian region.

**Numerically** the supremum of C²/D at u = 0.0463 is about 0.0876 in every dimension tested (n ≤ 10), against the
proved family constants 0.22 to 0.239 [N · STATUS §9]. The best known value is the two-variable tensor
X[(|X|² − 2) + z(|Y|² − 1)], z = 0.0528 + 0.2212i, at 0.08760259435; the Wick monomial (0.0875653) is a saddle, not the
maximiser [N · 6.4.2; chapter 4, item 20].

**An antiholomorphic Stein calculus.** For q ∈ H₂,₁ one has E[G·q] = Σ_j E[∂_jG·∂̄_jq]. Put a = Σ_j ∂_jq·∂̄_jq and
c₂ = Σ_j|∂̄_jq|². The pair (a, c₂ − u) carries the fourth excess exactly: δ = ‖P₂,₀(q²)‖² + ‖P₃,₁(q²)‖² + 2‖c₂ − u‖²,
with a = P₂,₀(q²) + ½P₃,₁(q²) [P + C · 6.3.20, 6.3.21]. Content and deficit are linear in that pair:
E[ȳ_e q h(V)] = E[ȳ_e k′(V)(q̄a + q(c₂ − u))] for every continuous radial profile h of polynomial growth and every
unit linear form y_e, with V = |q|², the one-dimensional transform k = E h(· + uτ) and τ a standard exponential
variable independent of q, and D(q) has the parallel form [P · 6.3.23, 6.3.24]. Cauchy–Schwarz then gives
‖c‖² ≤ δ·sup_e Ω_e, where Ω_e is a weighted sum of squared norms of chaos projections of y_e·q·conj(k′(V)) and
y_e·q̄·conj(k′(V)), with no supremum over the radius and an exact budget [P · 6.3.25]. This is a bound only once sup_e
Ω_e has a certified majorant, which it does not have. For the raw functional the route cannot reach the content
constants 0.10 and 0.15 that the joint A/B assembly would need (2.8): it gives 0.229·D on a two-variable cubic
[N · item 91]. For the tilt 3/5 the largest value found is 0.048·D [N · STATUS §9].

A second, local form removes the field c₂ − u: E[ȳ_e q h(V)] = E[ȳ_e(∂_vk·q̄a + ∂_ck·b)], with k(v, c) = E h(v + cτ),
F = ∂̄q and b = Σ_k conj(F_k)·(F·∇)F_k. The content is then linear in the pair (a, DF·F), whose budget is
‖P₂,₀(q²)‖² + ½‖P₃,₁(q²)‖² [P + C, both author only · 6.3.26]. Its Cauchy–Schwarz bound is 0.128·D at the cubic above and at
least 0.162·D at its own worst cubic, still above 0.15 [N · item 93].

**The same-law content inequality on structured classes.** Write c[h] = Π₁[q·h(|q|²)] for the content of a profile h.
The degree-5 certificate of `../higher-degree` uses, for the tilted profiles of the six rows of its content band
t ∈ [0.80, 0.855] and for every remote cubic, the inequality ‖c[h]‖² ≤ θ·δ·Ω̂[h], where
Ω̂[h] = (3/2)E[V·k′(V)²] − (3/4)(E[V·k′(V)])²/u, with V and the transform k of h as above, is a functional of the law
of |q|² alone and θ is the allowance of the row: the rows stay inside their rooms for θ ≤ 0.37, 0.64, 1.33, 1.88, 2.5,
3.7. It is posed row by row on a band of energies [N · `../higher-degree/STATUS.md` 4.19, 4.20]. The open steps of
that route are listed in `../higher-degree/STATUS.md`, section 5; the one that uses the rows of this ledger is this
inequality on the band. With one constant for all energies it is false: on X(|Y|² − 1) the ratio ‖c[h]‖²/(δΩ̂[h]) of
the row profiles rises above the thresholds of the first two rows as u → 0
[P · 6.3.28; `../higher-degree/STATUS.md` 4.20]. For each cubic the best constant valid for all profiles and
energies is θ\*(q) = (2/3)(‖E[Z | q]‖² + |⟨q, Z⟩|²/u)/δ, where Z is the representative of the content in
c[h] = ⟨Z, q·k′(V)⟩: 1.547 at X(|Y|² − 1) and 5.000 at the Wick monomial [P for the rule, N for the values · 6.3.30].
The inequality is proved, with constants that hold for every profile and every energy, on classes of cubics without
self-interaction of a driver. For q = √u·X·P with a Hermitian quadratic cofactor P the test function of the content
representation depends on P through |P| only, so P can be replaced by its conditional mean given |P| before
Cauchy–Schwarz [P · 6.3.27]; for P_m = m^{−1/2}Σ_{j≤m}(|Y_j|² − 1) this gives the constant 77/(9(m + 3)), and an
independent decoupled bulk raises it to 253/(18(m + 3)) + 2/(9m) [P + C · 6.3.28, 6.3.29]. The inequality also holds
for sums of independent blocks of this kind with a decoupled bulk, for conditionally Gaussian cubics, with the
constant 5/3, and for sums of shared matrix blocks [P + C · 6.3.36, 6.3.37, 6.3.39]. A bound of order δ^{3/2} for every
cubic covers only χ ≤ 9·10⁻⁸ to 3·10⁻⁵ on the band rows [P, N · 6.3.38]. None of these results closes a row, and on
the rows t = 0.80 and 0.82 the inequality is open in both directions [`../higher-degree/STATUS.md` 4.20, 4.27].

**Influences.** With J₁[a, b] = E[∂_aq·conj(∂_bq)] and I₂[j, k] = ⟨∂̄_jq, ∂̄_kq⟩ (traces 2u and u), the field c₂ − u
has ‖c₂ − u‖² = ‖J₁‖²_HS + ‖I₂‖²_HS, and the largest eigenvalues satisfy λ₁² + λ₂² ≤ δ/2, with equality only at X²Ȳ
[P + C · 6.3.32]. The content is a pairing of two shadows of the profile with these matrices,
‖c[h]‖ ≤ √λ₁·sd[(vh)′(V)] + √λ₂·‖V·h′(V)‖₂ [P · 6.3.31, 6.3.34]. But the cubics a·X(|X|² − 2) + b·X²Ȳ have
(λ₁, λ₂) = (2u, u) at every χ between 10 and 42, so no bound on the influences in terms of (u, χ) improves this where
the degree-5 certificate needs it (binding cells at χ = 16 and 30). The loss there is the misalignment of the shadows
with the influence directions: at X²Ȳ (χ = 10) the content vanishes while every factor of the bound stays of order one
[P, N · 6.3.33, item 98]. For the raw A-profile, bounding the two shadows linearly in V = |q|² via its Laplace measure
gives C(q)² ≤ C_inf(a)·u²·τ_max(q), τ_max(q) = max(λ₁/(2u), λ₂/u) (C_inf < 507/100 at the peak); since every cubic
satisfies χ ≤ 42τ_max(q) [P + C · 6.3.42] (and ≤ 50τ_max(q) directly [6.3.43]), τ_max(q) ≤ 1/455 closes the raw A-core
without Stein duals, and adding Stein duals extends the weak form to τ_max(q) ≤ 0.054 [P + C · 6.3.40; P + C, author only · 6.3.43].

### 2.6 The A-sector of the retained functional: the tilted lemma

Fix the tilt s = 3/5 and put A = T − 2/5, P = p − 9/25 = 0.962052, k = P − 13/20 = 59009/189100 = 0.31205 and

    𝒥(q, r) = 2E|L + q + A·r| − P‖r‖² − F(q).

By the tilt (1.6), Λ̂(q + (T − 1)r) ≤ Λ(q) + 𝒥(q, r): 𝒥 is the gain of the tilted A-sector over the remote base q. The
proof of the lemma below has three steps.

**Step 1: a global remainder bound.** With f(w, ρ) = E_{z₁}|L + w + (T − 2/5)ρ| for complex w and ρ,

    Rem(w, ρ) := 2[f(w, ρ) − f(w, 0) − ⟨∇_ρf(w, 0), ρ⟩] ≤ (13/20)·|ρ|²    for all w, ρ ∈ ℂ.

[P + C · codex-6e2b; four regions re-derived and the whole verifier replayed by claude-b9ee, interval code not
audited line by line · 11.39] Small ρ goes through a curvature certificate [P + C · 11.33], large ρ and large |w|
through explicit bounds, and the compact rest through joint convexity of f and multilinear interpolation on 102,104
boxes. The numerical supremum is 0.5997, so 13/20 leaves a margin of 0.05.

**Step 2: the gain is bounded by the content, at every amplitude.** For every remote cubic q and remote linear r, with
C = ‖c_{3/5}(q)‖ and σ = ‖r‖,

    𝒥(q, r) ≤ 2Cσ − kσ² ≤ C²/k.

*Proof.* Apply step 1 at w = q(y), ρ = r(y) and integrate over the remote variables. The linear term is 2Re
E[conj(r)·q·(g + (3/5)j)(|q|²)], and since r lies in the first chaos and Π₁q = 0 it equals 2Re⟨r, c_{3/5}(q)⟩, at most
2Cσ. Complete the square. ∎ [P · 11.40] No bound on ‖r‖, no localisation of a maximiser and no Gaussian tail are
needed, and q and r may share coordinates.

**Step 3: the tilted content against the deficit.** First, energy-dependent coefficients: ‖c_{3/5}(q)‖² ≤ γ·δ for
every u in [e, 0.0463] and every χ, with

| from e = | 9/1000 | 3/250 | 3/200 | 9/500 | 1/50 | 1/40 | 3/100 | 7/200 | 1/25 | 11/250 |
|---|---|---|---|---|---|---|---|---|---|---|
| γ | 251/5000 | 121/2500 | 467/10000 | 451/10000 | 441/10000 | 1859/43200 | 3/80 | 71/2000 | 17/500 | 13/400 |

[P + C · codex-6e2b; re-derived and replayed by claude-b9ee and a reviewer agent · 11.49] The bound comes from a
shifted Gaussian resolvent and a scalar function k_u solving (5/3 − (u/2)∂² + x∂)k_u = m″, enclosed by rational
barriers. Five more coefficients, from e = 1/125, 1/50, 1/40, 3/80 and 21/500, are 49/1000, 83/2000, 393/10000,
173/5000 and 331/10000 [P + C · codex-91d4, replayed and recomputed by a review worker of claude-b9ee · 11.62].
Uniform bounds hold as well: ‖c_{3/5}(q)‖² ≤ min{(2/25)δ, (19321/10⁶)u} and ‖c_{3/5}(q)‖ ≤ 1/50 for
u ≤ 0.0463 [P + C · 11.30]. Then the comparison:

    ‖c_{3/5}(q)‖² ≤ (7/25)·D₊(q) + 6·10⁻⁶     for every remote cubic q with u ≤ 0.0463, in every dimension.

[P + C · codex-91d4, by the method of codex-6e2b; re-derived and replayed by a review worker of claude-b9ee, who
re-evaluated every rectangle with its own exact code; interval code not audited · 11.61] An exact union of 196
rectangles covers (u, χ) ∈ [0, 0.0463] × [0, 42]: on low energies by global Hermite moment caps of h(v) = 2E|L + √v|,
above u = 2/125 by 119 global spectral Stein duals; the benchmark B is bounded below by chords and every budget is a
polynomial in (u, √χ) with exact Bernstein coefficients. No sign of D is assumed, and the certificate needs no partly
unreviewed content bound [C author only · 11.61]. Its margins are thin in places (2.7·10⁻⁹ in one box), so it rests
on the interval code. The same method gives the coefficient 3/10 with the ten coefficients above alone
[P + C · codex-6e2b, re-derived by a reviewer agent of claude-b9ee, replayed in two runs · 11.50]; with these duals
it cannot reach 3/20 (chapter 4, item 103).

**The lemma, and the retained A-core.** Steps 2 and 3 give, for every remote cubic q with u ≤ 0.0463 and every remote
linear form r, in every dimension,

    2E|L + q + (T − 2/5)r| − (p − 9/25)‖r‖² ≤ 2E|L + q| + κ·D₊(q) + η,
    κ = 52948/59009 ≈ 0.8973,   η = 5673/295045000 ≈ 1.92·10⁻⁵,

and therefore

    Λ̂(q + (T − 1)r) < S + 5778430967237/295045000000000000 < S + 2·10⁻⁵.

*Proof of the second line.* By the tilt, Λ̂(q + (T − 1)r) ≤ Λ(q) + κD₊(q) + η. If D(q) ≥ 0 this is
B(u) − pu − (1 − κ)D(q) + η ≤ S + η. If D(q) < 0 it is Λ(q) + η < 1.373953883 + η by the remote cap of 2.1. ∎ With D₊
in the lemma the remote error is not attenuated by 1 − κ (chapter 4, item 87). The bound is at most S once
D(q) ≥ η/(1 − κ) = 5673/30305000 ≈ 1.87·10⁻⁴. [lemma P + C · codex-6e2b, reviewed by claude-b9ee; its κ from step 3
· 11.61; consequence P + C · claude-b9ee, and independently codex-a7c4 · 11.51]

For u ≤ 0.021 a separate certificate gives more, Λ̂(q + (T − 1)r) < S − 69/25000000, strictly below S
[P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 11.47]. Two special cases of the lemma,
0.03 ≤ u ≤ 0.0463 with χ ≤ 7/100, and χ ≤ 1/4, have certificates of their own, independent of step 3 [P + C · 11.46; P
author only + C · 11.48].

**Around the peak.** With λ = ε/(1891/2500), ε ∈ [0.74, 0.76], 0 ≤ a/λ − 0.5592 ≤ 1/2500 and
0 ≤ b/λ − 0.1432 ≤ 1/800,

    Λ̂(q + (T − 1)r) < S + 9.79·10⁻⁵    for every remote cubic with u ≤ λ²·0.0463 and every remote linear r,

using the weighted scaling of 1.6 with the cost k_λ = 59009/189100 − (λ − 1)·9/25. The exact budget is
9.7888442057·10⁻⁵: a profile loss of 7.8·10⁻⁵, η, and the 3.6·10⁻⁷ between the remote cap and a lower bound of S; at
the peak it reproduces the lemma's budget within 3·10⁻⁹ [P + C · codex-a7c4, re-derived and replayed by claude-b9ee;
it inherits step 3 · 11.53]. The flank and upper rows are outside this rectangle.

This closes the A-shell of Λ̂ at the peak row, at every amplitude. It does not touch the B-shell, the odd sectors, the
other rows, or K itself: for Λ (the tilt s = 0) the remainder and content steps are unproved; numerically the global
remainder margin at s = 0 is 0.320, against 0.362 at s = 3/5 (STATUS 11.37).

Supporting results of the same chain: a circular-mean bound [P + C · 11.25]; a global bound for 𝒥(q, r) whose proof
uses only that q and r are square integrable, independent of z₁ and orthogonal [P + C · 11.26]; a structural bound of
the content of a general real profile by δ [P · 11.29]; a zero-content class, q = Σ a_{ij,k}X_iX_j·conj(Y_k) over
independent blocks [P · 11.31]; and a conditional remainder bound with a Gaussian tail for sectors that only have a
restricted Hessian bound [P · 11.32].

**A sharper content coefficient.** The comparison of step 3 also holds with 1/5 in place of 3/10, with η = 6·10⁻⁶, on
part of its domain: every χ for u ≤ 1/80, and further rectangles, 68.9% of the (u, χ) area with 40 gap rectangles
left. Above u = 1/100 it uses one content envelope per energy slab and interpolates the deficit term, whose second
derivative is at least −(3/5)(2 + χ) [C author only, interpolation P · codex-8d2f, replayed by claude-b9ee · 11.55].
The lemma above does not need it, and neither does the joint bridge of 2.8.

**Phase symmetry.** The content sees the phases of the coordinates, which the law of |q| does not. If a group of
unitary changes of coordinates fixes q and fixes no nonzero vector of ℂⁿ, then Π₁[F(q)] = 0 for every F: every content
of q vanishes, for every profile. The cyclic cubics Σ a_j Z_j²·conj(Z_{j+1}) are examples in every dimension n ≥ 2,
with fourth excess χ = 18/n for equal coefficients and n ≥ 3 (χ = 13 at n = 2)
[P · codex-a786, re-derived by claude-b9ee · 11.31a]. Around such a cubic, a perturbation h contributes at first order
only through its resonant characters: ‖c(p₀ + h)‖ ≤ √(3v_r/2) + √11·v [P + C · 11.56]. For the five-cycle perturbed by
εZ₀Z₂·conj(Z₁) the projected Taylor terms vanish through order four, so ‖c‖² ≤ 3·10⁷|ε|¹⁰, and the retained A-core
stays below S + 4.6·10⁻⁷ at χ ∈ [3.6, 3.68] [P + C · 11.57, 11.58]. The symmetry need not be diagonal: a cubic in 16
variables built from seven anticommuting matrices has the law of R·W with R ~ Gamma(8, 1), fourth excess 19/18 and
zero content, and its retained A-core is below S − (59009/189100)‖r‖² at every amplitude [P + C · 11.60]. Its scalar
Stein budget is (109/19)δ, almost the universal 6δ: a nearly maximal budget and exact phase cancellation coexist, so
sharpening the budget constant cannot help [P + C · item 90]. This does not bound the content of a general cubic: the
missing step is a control of the resonant energy by the deficit of the same law.

### 2.7 The B-sector

**Cost.** For every remote q and remote linear r, at every amplitude and with any sharing,

    Λ(q + z₁²·conj(r)/√2) ≤ Λ(q) + 2Re E[conj(r)·F_B(q)] − κ_B‖r‖²,   κ_B = 13/50, 29/100, 3/10

at the peak, flank and upper rows [P + C · audit · 7.1.1]. The base must be remote: the cost does not hold at every
even L² base, in particular not at q + (T − 1)r_A (chapter 4, item 39).

**Content.** The B shell has first-order content: for H = X(|X|² − 2), E[X̄H] = 0 but E[X̄H|H|²] = 32, so a small B
shell of the right phase raises Λ [P · 7.1.2]. At the peak its content is aligned with the A-content:

    |g_B(v) − 0.5053·g(v)| < 0.007 for every v ≥ 0

[P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.1.4]. Writing k_A = −g and k_B = −g_B, the sharper
global comparison is

    [k_B(0)/k_A(0)] k_A(v) ≤ k_B(v) ≤ k_A(v)/√2     (a > 0, b ≥ 0, v ≥ 0).

The lower coefficient is sharp and exceeds 0.5053 at the peak. Centering the one-sided difference before projection
therefore gives ‖c_B − 0.5053c_A‖ ≤ 0.0035√u for every remote L² q with Π₁q = 0, in every dimension and at every
energy [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.1.6]. Without orthogonality, the bound is 0.007√u.
Raw B-content thus reduces to raw A-content; for the Gaussian-factor class C_B² ≤ (239/2000)·D [R · 7.1.3]; for
general cubics the raw content-to-deficit inequality is open [7.1.5]. Against the fourth cumulant,
‖c_B(q)‖² ≤ γ_B·δ for every remote cubic, with γ_B from 0.061 on 1/2000 ≤ u ≤ 1/100 down to 0.046 on
1/25 ≤ u ≤ 0.0463, and ‖c_B(q)‖² ≤ (7/50)δ at every energy [P + C · codex-91d4, re-derived and replayed by a review
worker of claude-b9ee · 7.1.8]; that is not a deficit bound.

**Retained B-content.** At the matched tilt s_B = 0.5053·(3/5) = 15159/50000, the centered comparison and the content
comparison of 2.6 (step 3) give

    ‖c_{B,s_B}(q)‖² ≤ (1/10)D₊(q) + 443/10⁸     for every remote cubic q with u ≤ 0.0463.

[P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.1.7] This controls the first-order term. The
finite-amplitude cost for this tilt, and the joint A/B cost, remain open.

### 2.8 The joint A/B form

**At q = 0.** With H = (T − 1)r_A + z₁²·conj(r_B)/√2, Λ(sH) = 2E|L| − s²Q₀ + o(s²) with

    Q₀ ≥ 0.24‖r_A‖² + 0.26‖r_B‖² + 0.236·Re E[r_A·conj(r_B)] + 0.08(‖r_A‖² + ‖r_B‖²)

at the three rows, for arbitrary jointly distributed remote r_A, r_B [P + C · codex-a7c4, re-derived and replayed by
claude-b9ee · 7.3.1]. The sharp least local eigenvalues are 0.298364651634117… (peak), 0.32315284787… (flank) and
0.32771589719… (upper), each attained along a genuine cubic Gaussian-driver direction [P author only, C, N ·
codex-a7c4, replayed and recomputed to 40 digits by claude-b9ee · 7.4.9]; along
(r_A, r_B) ∝ (1, −1/5) the peak value is 0.298526… [P + C · 7.4.8]. So no global common A/B cost can exceed these
numbers.

**At every remote base, infinitesimally.** −½·(second derivative of Λ along the A/B direction) ≥
0.241‖r_A‖² + 0.261‖r_B‖² + 0.236·Re E[r_A·conj(r_B)] at every remote q, every dimension and sharing [reduction and
tail P + C, compact part R · audit · 7.3.2]. This cannot be integrated along q + s(A + B), whose intermediate bases are
not remote (route 40 of the ledger).

**The missing statement.** Put V = L + q and R(V, h) = 2(|V + h| − |V| − Re(h·conj(ph V))). For every dimension,
every q ∈ H₂,₁ with 0.00551 ≤ ‖q‖² ≤ 0.0463 and arbitrary remote r_A, r_B with squared norms at most 0.0113:

    E R(V, h) ≤ (p − 0.24)‖r_A‖² + (p − 0.26)‖r_B‖² + 0.236·‖r_A‖‖r_B‖

(or the signed form with −0.236·Re E[r_A·conj(r_B)]) [open · 7.4]. It does not follow from the two axis costs
(chapter 4, item 43). It reduces to a compact box: with r_x(α, β) = E_{z₁}R(L + x, (T − 1)α + z₁²·conj(β)/√2), it is
enough that r_x(α, β) ≤ Q(α, β) − η(|α|² + |β|²) for 0 ≤ x ≤ 29/10 and |α|, |β| ≤ 0.4, with reserve η = 7.53·10⁻⁵
(robust Q) or 8.07·10⁻⁵ (signed Q); for |x| ≥ 29/10 the tail holds at every amplitude with reserve 0.007
[P + C · codex-a713 and codex-a7c4, re-derived and replayed by claude-b9ee · 7.4.5].

**What content constant it would need.** For a positive-definite cost matrix [[k_A, m], [m, k_B]] the optimised gain
is ‖c‖²/k_A + ‖d − (m/k_A)c‖²/(k_B − m²/k_A) [P · 7.4.1]. With the centered alignment of 2.7: a favourable signed m = 0.118
and content constant 0.24 leave an excess below 0.000019372; a diagonal cost with content constant 0.15
gives at most 0.000003593; an adverse cross term at most 0.118 with constant 0.10 gives at most
0.000017953 [P, C · 7.4.2]. These are conditional on the joint bound.

**A retained joint target.** Set ρ = 0.5053, s = 3/5, r_+ = α + ρβ, r_− = β − ρα, S_r = |α|² + |β|² and
h = (T − 1 + s)α + sρβ + z₁²·conj(β)/√2. A sufficient pointwise premise, called (P) from here on, is

    E_{z₁} R(L + w, h) ≤ (p − 0.0926)S_r − 0.67|r_+|² − 0.08|r_−|² + (|w|²/2 + S_r)S_r

for all complex w, α, β, using the remainder function R(V, h) defined above. This premise is **open**. For genuine
cubics, the shared-driver estimates E[|q|²S_r] ≤ 4uV and E[S_r²] ≤ 2V², V = E S_r, carry its quartic correction into
the response domain. The content comparison of 2.6 (step 3, with coefficient 0.3), the uniform cap ‖c_{3/5}(q)‖ ≤ 1/50
and the centered error of (2.7) then suffice: under u ≤ 0.0463 and u + V ≤ 0.080051, the premise implies

    Λ̂(q + A + B) < S + 0.00004936.

The implication and its 1,000-cell rational scalar certificate are re-derived and replayed by claude-b9ee
[P + C · codex-a7c4 · 7.4.10].

The infinitesimal inequality has a uniform reserve 0.01 S_r for 0 ≤ |w| ≤ 2. A five-dimensional box around the
finite-amplitude local minimum w ≈ 0.6004, α ≈ 0.3496, β ≈ 0.2023 has absolute defect at most −0.0013909
[P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.4.11]. Full inverse-distance potential matrices prove
(P) at every shift when S_r ≥ 3/4 [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.4.12].

An amplitude-capped matrix majorant handles all coefficient directions simultaneously. For a unit direction E,
write k=h_E exp(−iθ) and r=|L+w|. With η=min(1,s_max M(T)/r), where
M(T)=sqrt((T−.4)²+(.30318+T/sqrt(2))²), the normalized scalar remainder satisfies

    G_s ≤ [α(η)|k|²+β(η)(Im k)²]/(2r),  0≤s≤s_max,
    α(η)=9η/(2+η)²,  β(η)=4(1−η)/(2+η)².

The endpoint η=0 is the normalized Hessian limit; η=1 uses the unconditional potential bound. Both coefficients
multiply positive semidefinite matrices. Interval source quadrature, exact rational matrix comparisons and shift
interpolation prove (P) whenever |w| ≥ 5/4, at every amplitude and phase, and on an origin profile: sqrt(S_r) ≤ 1/512,
1/256, 1/64, 1/32, 1/16, 3/32 for |w| in [0,1/8], [1/8,1/4], [1/4,1], [1,9/8], [9/8,19/16], [19/16,5/4]. In particular
sqrt(S_r) ≤ 1/512 suffices for every complex shift. A further sufficient condition, valid at every shift, is 16
S_r²+3S_r ≥ 6|2A+B|². It includes the amplitude-complete cone |2A+B|²≤S_r/2 [P + C · codex-a7c4, re-derived and
replayed by claude-b9ee · 7.4.11–12].

Consequently, for proportional holomorphic drivers r_B=κr_A with |κ+4|≤3, the joint bridge (7.4.10) is unconditional
under its caps u≤0.0463 and u+V≤0.080051, with arbitrary sharing with the genuine remote cubic q. For κ=−2, completing
a scalar square at the explicit trial ξ₀=−(3/5)(r_A+ρr_B), with visible coefficient c=0, gives
Λ̂(q+A_shell+B_shell)<S+19/10⁶. If 0.01‖U‖², with U=r_B−ρr_A, is reserved for odd sectors, the joint gain plus this
reserve is below 29/10⁶ relative to Λ(q), which with the odd premise (P_Ψ) of 2.9 would give an all-sector allowance
of 79/10⁶ on this family [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.4.12]. The odd premise is
open; the result does not cover odd sectors or arbitrary A/B driver pairs.

A normalized Bregman remainder certificate has source-quadrature error constants independent of amplitude.
For D=(D_A,D_B), write S_D=|D_A|²+|D_B|² and ℛ(w,D,τ)=Rem(w,τD)/τ², using its continuous limit at τ=0.
The uniform shift-curvature estimate ℛ_ww ≥ −480 S_D combines with convexity in the coefficient coordinates
to give quadratic spatial interpolation errors. The resulting amplitude-adaptive
cover has A = τ(1 + ix), B = τ(y + iz), |x|, |z|, |y − 37/64| ≤ r and |w − 3/5| ≤ δ/2:

| τ | r | δ |
|---|---|---|
| [0,1/8] | 1/8 | 1/64 |
| [1/8,1/4] | 1/16 | 1/128 |
| [1/4,1/2] | 1/32 | 1/128 |
| [1/2,5/8] | 1/16 | 1/64 |
| [5/8,7/8] | 1/8 | 1/32 |

The smallest box, r = 1/32 and δ = 1/128, is valid for every amplitude after adjoining the exterior τ ≥ 7/8
[P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.4.13]. The curvature argument uses a uniform
density/mass potential estimate and retains the nonnegative singular Hessian of the norm; it requires no lower bound
on the perturbed norm. The remaining compact region has |w| ≤ 5/4 and 1/512 ≤ sqrt(S_r) ≤ sqrt(3)/2, outside the
origin profile, the directional exterior 16 S_r²+3S_r ≥ 6|2A+B|², and the proved local boxes and tube. Its
finite-amplitude cover remains **open** in general. On the real aligned plane (w, A, B real, that is every triple on
one complex line through zero) it is proved by a certified cover of 20 regions [P + C · 7.4.14]. On each of its
31,090 direct boxes, let t be the largest absolute real coefficient after rotating the shift to the real axis.
The normalized imaginary increment e in t(D+i e) may range over ‖e‖₂ ≤ 1/32. Pairing e and −e and integrating
the resulting cost widens the audited radius 1/8192 by a factor of 256 [P + C, author only · 7.4.14].
The origin, amplitude and directional exteriors also cover this radius over the 1,502 inherited boxes. Thus the
condition ‖Im(A,B)‖₂ ≤ max(|Re A|,|Re B|)/32 suffices at **every shift and amplitude** in this frame. In particular
the retained A+B bound S + 4936/10⁸ holds on the complex proportional-driver family described in the proof, under
the energy caps of 7.4.10. Section 7.4.16 covers arbitrary phases. Moderate odd energies over the joint core remain open outside the proved regions.
[Proof and replay](sources/central-aligned-codex-a7c4/COMPLEX_PHASES.md)

**Global 4D complex closure of (P) [P + C · gemini-c1de, independently checked by codex-a7c4 · 7.4.16].** By U(1) phase rotation and
conjugation symmetry, (P) reduces to w ≥ 0 and Im A ≥ 0 in ℝ⁴. On any shifted-polar partition {Q_k} of L + w = r e^{iθ}
(where dμ = 2 r f(T) dr dθ / (2π) is C^∞ everywhere, cancelling 1/r identically), Cauchy–Schwarz weighted by √|L + w|
yields the cell Gram upper bound U_WCS(w, v) = Σ_k 2(√(A_k(A_k + 2 b_kᵀv + vᵀM_k v)) − A_k − b_kᵀv) + Rem_tail, which
has zero O(1) and zero O(s) gap relative to the infinitesimal Hessian and exact monotonicity in (A, B, C) for outward
interval arithmetic. Combining (1) 448 MVT potential slabs on [0, 8] plus an exact rational zero-float w ≥ 8 tail
(closing S_r ≥ 3/4 and w ≥ 11/8), (2) 200 slabs of a 3-line switched origin profile on [0, 11/8], (3) self-contained
shift curvature ∂_ww Rem ≥ −480 S_r, (4) 56 slabs of 3D ray-convexity cube shells on [0, 5/16] (904,850 3D boxes, 0
open, closing s₀(w) to ‖v‖_∞ = 1/8 via the exact discriminant ((ρ − 1)/(ρ + 1))² ≤ η), and (5) 54 slabs of a 4D
adaptive WCS bulk cover on [0, 11/8] (271,520 4D boxes, 0 open, closing s_bulk ≤ ‖v‖₂ ≤ √(3/4)) certifies (P) on all
of ℂ³ [P + C · gemini-c1de, independently checked by codex-a7c4 · 7.4.16]. Together with the independently reviewed conditional bridge (7.4.10),
this yields Λ̂(q + A + B) < S + 4936/10⁸ unconditionally on u ≤ 0.0463, u + V ≤ 0.080051 for arbitrary holomorphic A/B
drivers and sharing. On the same energy domain, the six-sector bound Λ̂(G) < S + 99·10⁻⁶ holds whenever
W ≥ min{550V − 1241/125000, (20575/138)V − 1241/690000}. Moderate shell energy outside the established odd-sector regions remains open. [Proof](sources/global-complex-P-gemini-c1de/PROOF.md) · [independent proof check and full replay of #604](https://github.com/agalatan/grothendieck-lean/pull/604#issuecomment-7144799609)

**A common cost at the A-tilt alone.** With the trial −(3/5)r_A only and h = (T − 2/5)α + z₁²·conj(β)/√2, a common
cost 23/100 means E_{z₁}R(L + w, h) ≤ (p − 59/100)|α|² + (p − 23/100)|β|² for all complex w, α, β. It holds for |w| ≥
7/2, for total amplitude (|α|² + |β|²)^{1/2} at least 5 or at most 1/32000, and in the cones |β| ≤ |α|/21 and |α|
≤ |β|/56, at every w and amplitude; the rest is open [P + C · codex-91d4, re-derived and replayed by a review worker of
claude-b9ee · 7.4.15]. No common cost above 0.24772, the least eigenvalue of the zero-core matrix at this tilt, can
hold. Integrated, it would bound the gain by (‖c_{3/5}(q)‖² + ‖c_B(q)‖²)/(23/100) with no cap on the driver energies;
with the coefficient 7/25 of 2.6 that is not below S, so it needs deficit bounds for both contents with coefficients
of sum below 23/100.

### 2.9 The odd sectors

**Zero core.** For O = z₁Q + z̄₁P + d·z₁(T − 2) with Q, P remote L² variables (EQ = 0), v = E|Q|² + E|P|²,
h = 2|d|²:

    Λ(O) ≤ Λ(0) − k₁·v − k₃·h,   (k₁, k₃) = (0.128, 0.330), (0.156, 0.356), (0.166, 0.361)

at the peak, flank and upper rows, at every amplitude [P + C · 5.4]. The displayed values are rounded safe lower
bounds of the coefficients k₁ = p − J₁ and k₃ = p − (J₃ − 4J₂ + 4J₁)/2 (the flank k₃ is 0.35662424897376…). These
unrounded coefficients are sharp on the Q- and d-axes, and they are row-specific: at (0.76, 0.76, 0.16) the cubic
(i/100)Z(|Y|² − 1) raises Λ above Λ(0) [P + C · 5.4a]. The pure P axis has cost at least 0.41 on the whole box, and
Λ̂ = Λ there [P + C · 5.4b]; the retained functional keeps the Q cost and improves k₃ [P + C · 5.4c].

**One coordinate (n = 1).** On the whole box Λ(d·z₁(T − 2)) ≤ 2E|L| − k_\*‖d·z₁(T − 2)‖² with the sharp uniform cost
k_\* = 0.151676198434561…, so sup Λ on H₂,₁(ℂ) is 2E|L|, attained only at G = 0 [P author only + C · 2.6]; for Λ̂ the
sharp cost is 0.392424545003417… [P + C · 2.6a].

**Remote core.** Over every remote q, each of z₁Q and z̄₁P separately has uniform cost 0.01, 0.03, 0.04 at the peak,
flank and upper rows; the normalised visible cubic ν·z₁(T − 2)/√2 has costs 0.22, 0.24, 0.25. These bounds hold at
every amplitude with arbitrary sharing, for both Λ and Λ̂. Simultaneous raw odd sectors satisfy the sum of these costs
when E[Q | q] = E[P | q] = E[Q·conj(P) | q] = 0; the retained simultaneous conclusion is proved when q and (Q, P) use
disjoint Gaussian blocks and Q, P have their genuine chaos degrees [P + C · codex-a7c4, re-derived and replayed by
claude-b9ee · 7.2.6, 7.2.7]. No A or B shell is present in that base.

**Remote core, all three sectors with arbitrary sharing.** At the peak the centring conditions are not needed. For
remote q, Q, P with E Q = 0 and arbitrary mutual dependence, and constant ν,

    E[|L + q + O| + |L + q − O| − 2|L + q|] ≤ (32/25)‖O‖²,   so   Λ(q + O) ≤ Λ(q) − (1988/47275)‖O‖²,

and the same for Λ̂ [P + C · outside GPT, re-derived and recomputed by claude-b9ee · 7.2.10]. Three ingredients make
it work. The pointwise majorant |x + y| + |x − y| − 2|x| ≤ |y|²/|x| − (Re x̄y)²/(2|x|³) holds at every amplitude.
A compensating term −(3/5)Re Q·Re ν − (6/5)Im Q·Im ν is kept in the conditional inequality and removed after
averaging by E Q = 0; without it the imaginary Q/ν block at q = 0 exceeds p by 0.387 per unit energy. Rotation and
reflection in z₁ leave two 3×3 matrix families in the single parameter r = |q|, certified below 32/25 by interval
arithmetic on [0, 8] and analytically beyond.

**General nonzero core.** By parity (1.7) there is no first-order term and no coupling to the even block; what is
needed is a uniform pure cost Λ(H + O) ≤ Λ(H) − κ_E‖O‖² over genuine even cubic cores H at the required rows; for
remote cores this is the theorem above, so what remains are cores with A/B shells, whose base can vanish quadratically
at fixed remote values [open · 7.2.4]. Within the odd block, z₁Q and the normalised one-coordinate cubic
ν·z₁(T − 2)/√2 interact at a remote base q through

    K = Re ν·E[Re Q·A(|q|)] + Im ν·E[Im Q·B(|q|)],

with two distinct radial kernels A and B (the mixed second derivative is 2K). Both terms vanish at q = 0, because
A(0) = 0 and EQ = 0, but not in general: at q = 0.001·X(|Y|² − 1) the directions (Q, ν) = (|Y|² − 1, 1) and
(i(|Y|² − 1), i) give K < −8·10⁻⁶ and K > 4·10⁻⁶ (numerically −9.32·10⁻⁶ and 4.66·10⁻⁶, also by mixed finite
differences) [P + C, N · codex-a7c4, re-derived and replayed by claude-b9ee · 7.2.5]. A
directional majorant (|X + Y| + |X − Y|)² ≤ 4M − 4c²/M, M = |X|² + |Y|², c = Re(XȲ), is available [P · 7.2.2]. At
one explicit core H and for one specified odd direction O it gives Λ(H + τO) ≤ Λ(H) − 0.063‖τO‖² for
0.03 ≤ |τ| ≤ 0.04 only [analytic reduction P, interval integration R · 7.2.3]; numerically the cost is 0.79 to 1.32
per unit energy on nine cores [N].

**Notation for the rest of 2.9.** R = r_A + 0.5053r_B and U = r_B − 0.5053r_A are the r_+ and r_− of 2.8 for the shell
drivers; V = ‖r_A‖² + ‖r_B‖²; W_Q, W_P, W_ν are the energies of z₁Q, z̄₁P and ν·z₁(T − 2)/√2, where ν = √2·d, and W is
their sum; D = D₊ − D₋; and ω = |Q|² + |P|² + |ν|² pointwise.

**Cores with A and B (retained functional, peak row).** Over a core E = q + A + B the odd increment
Δ = Λ̂(E + O) − Λ̂(E) need not be small: a genuine shared example inside the energy and response caps has
Δ = +1.24·10⁻⁴, although its core lies 0.04 below S [N · 7.2.9]. At the common remote trial of 2.8 the increment is
not even paid by the allowance 0.01‖r_B − 0.5053r_A‖² + 5·10⁻⁵ [P + C · item 89]. What pays for it is the energy
slack σ(u) = S − (B(u) − pu) of the core. The joint bridge of 2.8 gives Λ̂(E) < B(u) − pu + D₋ + 49·10⁻⁶, so the
right comparison is Δ − σ(u) + D₋ ≤ 5·10⁻⁵, which gives Λ̂(E + O) < S + 99·10⁻⁶ [P · 7.2.8]. No tested
configuration violates Δ ≤ σ(u) + 5·10⁻⁵, including cores at the energy where σ vanishes [N · 7.2.9].

**All sectors at the peak (retained functional).** Take the trial ξ = −(2/5)r_A − (7/100)r_B − (2/7)ν·z₁. The
two-sign inequality |1 + z| + |1 − z| ≤ 2 + ½(Re z)² + (Im z)² at L, and the orthogonality of the visible harmonics
under the radial weight 1/|L|, give for every G in the six sectors, with arbitrary sharing,

    Λ̂(G) ≤ 2E|L| + (413/500)u − (11/40)V − (16/125)W_Q − (213/500)W_P − (249/500)W_ν,

so Λ̂(G) < S + 10⁻⁴ when the energy part is at most 1087/500000, and Λ̂(G) < S when it is at most 1037/500000. With
q = 0 every coefficient is negative: Λ̂(G) ≤ 2E|L| < S for every G without a remote cubic, at every amplitude. The raw
analogue, with no trial, has +37/200 on V and −33/100 on W_ν and gives exact K on its region [P + C · codex-c7e2, from
the inequality of the October manuscript, re-derived and replayed by claude-b9ee · 7.5.1]. On the remote axis the
region reaches only u ≤ 0.00263; the energy u\* ≈ 0.0403 where σ vanishes lies far outside it. Elsewhere the central
secant is bounded by Ψ(X, H) = 2(√(|X|² + |H|²) − |X|) − (Re X·conj H)²/(|X|² + |H|²)^(3/2) [P · 7.5.2], and (P) of
2.8 together with the averaged premise

    (P_Ψ)   |c|² + E Ψ(X, O − cz₁) − p‖O‖² ≤ 0.01‖U‖² + σ(u) − D₋(q) + 5·10⁻⁵   for one global complex c,

with X = L + E + (3/5)R, would give Λ̂(G) < S + 99·10⁻⁶ for every G at the peak with u ≤ 0.0463 and u + V ≤ 0.080051
[P + C · 7.5.3]. In its secant form (P_Ψ) holds for every core without A/B shells (7.2.10); with A/B shells it is
open outside the regions below. The elementary estimate gives W ≤ 6.16·10⁻¹⁰ (7.5.4). Conditioning on the visible
radius gives W ≤ 1/3000000 for every admissible core, with arbitrary sharing and any allowed shell energy V.
The real projection of the rotated core is a constant plus one cosine. Its sharp angular sublevel estimate gives
$\mathbb E\Psi(X,O)-pW\le (9/20)W+(71/20)W^{3/4}$ [P + C · independently re-derived and replayed by claude-b9ee and gemini-c1de · 7.5.4a]. [Proof and exact replay](sources/angular-odd-strip-codex-a7c4/PROOF.md)

The radial weight $g(t)=\sqrt{t/(a+bt)}$ is concave. Two integrations by parts give
$\mathbb E[g(T)((T-2)^2/2-1)]\le0$, cancelling the extra cost of the odd radial mode. This lowers the coefficient of $W^{3/4}$ to $109/40$ and extends the strip to $W\le1/2100000$.
Across visible radii the phase tangency is controlled by a cubic. Its real sublevel lengths also give $\mathbb E\Psi(X,O)\le37000W^{11/12}$, a stronger power at the origin. A conditional zero circle makes the odd increment at least of order $h^2\log(1/h)$ for a perpendicular odd field of amplitude $h$. A linear estimate in the odd energy must therefore use more information about the remote law [P + C · independently re-derived and replayed by gemini-c1de · 7.5.4b]. [Radial estimate and exact replay](sources/radial-phase-power-codex-a7c4/PROOF.md) · [Independent review](https://github.com/agalatan/grothendieck-lean/pull/621#issuecomment-7147504001)

A single tangency parameter controls the visible phase at every sublevel scale. Keeping it fixed saves $13/100$ in the layer-cake integral. In the odd field the radial coefficient shares the positive harmonic with $Q$, while $P$ multiplies the negative harmonic. Put $m=\mathbb E|Q|^2$, $n=\mathbb E|P|^2$, $v=|\nu|^2$ and $B_o=(\sqrt{m+17v/20}+\sqrt n)^2$. Two weighted radial moments then give $\mathbb E\Psi(X,O)-pW\le-3W/25+(487/200)(B_o/2)^{3/4}$. The resulting all-core strip is $W\le1/1800000$. It extends to $1/1440000$ if $\min(m+v,n)\le W/10$, to $1/900000$ with one visible harmonic, and to $1/765000$ with only the radial odd mode. The shell energy can range over the full retained domain [P + C · independently re-derived and replayed by gemini-c1de · 7.5.4c]. [Proof and exact replay](sources/odd-harmonic-energy-codex-a7c4/PROOF.md) · [Independent review](https://github.com/agalatan/grothendieck-lean/pull/632#issuecomment-7148521609)

The particular cutoff estimate W/τ + τ·min(1, τ²/a²) with separate positive moment charges falls short by a factor of
about six near u\* [7.5.5]. An anti-concentration bound controls how often the A/B drivers come near a rank-zero
visible root [P author only · 7.5.4], but rank-one zero curves, and a value defect that vanishes identically outside
the energy region above, show that it does not finish the proof [7.5.5]. A centred joint form compares the A/B and odd
sectors together with the right side of (P), keeping the unused margin of (P) and a compensating Q/ν term of zero
mean. Under the caps u ≤ 0.0463 and u + V ≤ 0.080051 it reduces the target to one compact averaged bound. Its defect
F_joint is nonpositive when |q| ≥ 10, and, if |ν|² ≤ 1/50 (which holds when W < 1/50), also when S_r ≥ 11/5 or ω ≥ 4
[P + C · codex-91d4, re-derived and replayed by claude-b9ee · 7.5.6].

**Pieces of the case with A/B shells.** For moderate V near u\*, rows 7.5.4a–b cover small odd energy uniformly. The averaged odd premise remains open at larger W outside the small-shell estimates below.

- **A cut on the drivers.** Two Gaussian drivers satisfy Pr(S_r ≥ xV) ≤ e^{−x} for x ≥ 3, and (F_joint)₊ ≤ 2.198, so
  the joint obligation can be restricted to S_r ≤ 16V at a cost below 2.5·10⁻⁷; near u\* this means S_r ≤ 0.641
  [P + C · codex-4d8a · 7.5.6].
- **Small shells.** A translated-base inequality keeps the unperturbed base in every denominator and so avoids the
  quadratic zeros of the shifted core. It proves the odd premise for V ≤ 1.13·10⁻⁵ and whenever W ≥ 375V, but it
  charges the shells about 4.4V, about 15 times their own cost, and cannot go further [P + C · outside GPT · 7.5.8].
- **The joint form at smaller shells.** Convex interpolation onto the A/B base, with every inverse norm at the
  unperturbed base and a recentred potential certificate, proves the averaged bound of the centred joint form for
  V ≤ 3.67·10⁻⁷, and an odd region over one strongly non-Gaussian shared core (χ = 33/128); its region for the odd
  premise lies inside that of the translated-base inequality [P + C · codex-c7e2 · 7.5.10].
- **Sharp global joint secant and multiscale unconditional closure.** A sharp global joint secant inequality drops
  the factor L on the transverse even part v_K² and absorbs the full even remainder, and on bulk cells away from the
  zero of L + q pairs a rational bulk even majorant with a perturbed-ellipse odd bound. With one phase-invariant global
  visible shift c\* = −(31/100)Re ν − i(7/25)Im ν and zero-mean compensating form C(Q, ν) (c₃ = c₄ = 0), this shrinks
  the pointwise shift exterior of F_joint to |q| ≥ 11/8 (both c = 0 and c\*, with no |ν|² ≤ 1/50 cap), proves the
  unconditional odd-dominance cone W ≥ 179V (and W ≥ 150V for recentred (P_Ψ)), and through an 18-level staircase in
  S_r and exact two-driver Gaussian tail expectations proves E F_joint(c\*) ≤ 4.9712·10⁻⁵ < 50·10⁻⁶ — hence
  Λ̂(G) < S + 99.36·10⁻⁶ < S + 10⁻⁴ for all six sectors at the peak **without assuming (P)** — for every
  0 ≤ V ≤ 11/100000 = 1.1·10⁻⁴ [P + C · gemini-c1de, independently checked by codex-a7c4 · 7.5.12].
- **Tiny odd energy, a dominant odd sector, or proportional drivers** [P + C · codex-91d4 · 7.5.7]; the remote slack
  S − max(B(u) − pu, Λ(q)) exceeds 10⁻⁴ for u ≤ 0.03 [P + C · 7.2.11].
- **Extremely diffuse laws.** A finite joint Edgeworth expansion with explicit remainder settles a box near u\*
  [P + C · codex-91d4 · 7.5.9].
- **A nearly Gaussian cubic.** Replacing only the cubic q by a Gaussian, with the rest of the law kept exactly, costs
  at most √(πuχ/12) + O((√V + √W)·χ^{1/4}). Near u\* this gives the all-sector bound for every A/B covariance and
  non-diffuse odd fields once χ ≤ 2·10⁻⁸ [P + C · codex-91d4 · 7.5.11]. On shared families the true cost is at least
  66 times smaller in size; its power χ^{1/4} is attained (a cubic with one heavy block), with a constant at least 167
  times smaller than the bound's [N · 7.5.11]. What limits this route is that constant and the two-sided form of the
  bound.

### 2.10 Response domains and the central consumer

Only G that come from actual responses enter the row. Let E_q, E_A, E_B, E_Q, E_P, E_ν be the
six sector energies in (1.7), with E_ν = 2|d|². Every actual response, with all sharing allowed, satisfies

    E_q/2 + 2E_A/3 + 4E_B/3 + E_Q + E_P + 8E_ν/7 ≤ ε²(π/4 − t²).

The proof combines the common-response support inequality with weighted Cauchy–Schwarz; equivalently it is a weighted
Bessel bound with h and k in separate slots [P · codex-a7c4, re-derived by claude-b9ee · 2.12b]. It is a feasibility
bound, not a claim of odd-sector monotonicity.

At ε = 1891/2500, for t ≥ 0.84 the remote cap is 0.046266 [P + C · codex-a7c4, re-derived by claude-b9ee · 2.12a].
Combining it with the stronger ellipsoid gives total energy below 0.080051; the total is below 0.070564 for t ≥ 0.8456
and below 0.061366 for t ≥ 0.851 [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 2.12b]. Without a
threshold in t no such cap holds (chapter 4, item 69). The October manuscript has 25 further response constraints
[R · 2.12]. These cuts apply to responses only: inserting them inside a supremum over all G is invalid, and two
penalties that spend the same square cannot be added.

**Central component.** At the single peak row, an all-sector bound Λ ≤ S + η (for Λ or Λ̂) with η ≤ 10⁻⁴ covers
t ∈ [0.84, 0.851] with cap margin above 6.12·10⁻⁷ below 500/701; separately, the largest admissible allowance there is
η_max = 166713115892493/1656988750000000000 = 0.0001006120988404375…, with no reserve [P + C · 8.1]. The premise is
the open all-sector bound; a remote-only cap does not replace it.

The rest of the consumer is not built: an exact cover of t and of the rows; the σ\* = 0 corner if the cover uses it;
interval upper bounds for S at each row; coverage of the energies outside the residual rectangle of 2.4 and of every
omitted response region; an error ledger with exact thresholds; a single witness operator behind rows with different
ε. No Lean statement of a K-consumer exists [open · STATUS §8].

**A first consumer.** A simple first consumer keeps the witness ε = 149/200 and its 19 rows (in Lean until #525,
which replaced that witness by the identity-tail witness and its 14 rows). These rows
and the crude row already cover every response t except [0.84, 0.8555]. One new row M = (149/200, 0.84775, 0.1450976)
on that interval, with an all-sector bound Λ̂_M ≤ S_M + 10⁻⁴, would give K_G ≥ 1.40171 [C, P author only · codex-8d2f,
replayed by claude-b9ee · STATUS 8.5]. This is below the lower bound that Lean now proves, so the consumer no longer
improves the bound; it stays the cheapest test of K at one row. The responses there fit the peak energy box after the weighted scaling, but the
tested triangle/support transfer of the peak results exceeds the allowance: the profile change alone costs 7·10⁻⁴
against 1.04·10⁻⁴ [STATUS 8.6]. One route is new component estimates at M (remote cap, joint premise, odd premise); a
sharper transfer or a direct all-sector estimate at M are others. For 1.402 at ε = 1891/2500, the reusable envelope of
the 19 rows at ε = 149/200 leaves four response intervals, among them [0.696, 0.84] [STATUS 8.7].

**The exterior at ε = 299/400.** Moving the 19 rows (in Lean until #525) from ε₀ = 149/200 to e = 299/400 changes the payoff by
δ(‖Qk‖² − ‖Qh‖²), δ = 1/400. The retained square absorbs −δ‖Qh‖², because
2β²/ε₀ − ε₀‖x + (β/ε₀)v‖² − δ‖x‖² = 2β²/e − e‖x + (β/e)v‖² when ‖v‖² = 2, and ‖Qk‖ ≤ ρ or the response energies
bound δ‖Qk‖². On 1,674 exact cells this proves V ≤ 713263/10⁶ < 500/701 for every response with t ≤ 0.8165 or
t ≥ 0.866, with no K premise [P + C · codex-4d8a, re-derived, replayed and re-implemented by claude-b9ee ·
STATUS 8.9]. Ten central rows cover the rest: if their retained all-sector inequalities
Λ̂_i ≤ S_i^upper + 1/40000 hold, then K_G^ℂ ≥ 1000000/713263 > 1.402007 [benchmarks C, premises open · STATUS
8.10]. The admissible allowances fall from 1.09·10⁻³ at t ≈ 0.82 to 3.0·10⁻⁵ at t ≈ 0.854. The binding core
[0.8465, 0.8615] needs an all-sector error about a third of what the peak results give under (P) and (P_Ψ). At
ε = 1891/2500, four certified shoulder benchmarks leave allowances of 1.5–3.4·10⁻⁴ [STATUS 8.11].

**The exterior at ε = 3/4 and ε = 94/125.** Above ε = 299/400 the crude row t² + ερ² fails near t = 0.
Setting c(ε) = (2141/3150)ε makes the piecewise potential φ_{c(ε)}^{(ε)}(r) = max_{y∈[0,1]}(2εry − c(ε)y²) equal to
(ε/ε₁)·φ_{c₁}^{(ε₁)}(r) identically on [0, ∞) (ε₁ = 25/31, c₁ = 2141/3906), so the 136-node pruned spectral Stein
certificate `cert_mass_0.5_pruned.json` (`../identity-tail/STATUS.md` 5.5, fact (3); **Lean** at ε₁ since #525, `certMassRow` in `Grothe/Lower/Cert/MassRow.lean`,
with hypotheses Lean's `Moments`, `SteinCut` and `Lower.ρ`) transfers without an identity tail to give
V_ε ≤ (1 − c(ε))t² + c(ε) + (ε/ε₁)S₁ − ‖P₁,₀k‖² − ε‖P₂,₁h‖².
Combined with the 19 rows at ε = 149/200, retained-square two-row mixing (`RowHolds.mix`), operator-change recompletion and 2.12b,
this proves V_{3/4} ≤ 7132652/10⁷ < 500/701 outside (0.795, 0.864) using `Lower.ρ` alone, and, adding ρ = 46731/50000
(2.1), V_{94/125} ≤ 7132660/10⁷ < 500/701 outside (0.7515, 0.863) [homothety and covers P + C, author only · gemini-9a4e · STATUS 8.12].
Outward-rounded integer Rice enclosures certify nine central rows on [0.795, 0.864] at ε = 3/4 with allowances above
7.57·10⁻⁵, and thirteen central rows on [0.7515, 0.863] at ε = 94/125 with **every row admitting η_{max,i} > 10⁻⁴**
(minimum > 1.021·10⁻⁴, above the 9.9·10⁻⁵ peak budget of 2.9); Row 8 on [0.840, 0.847] lies strictly inside the proved
remote and retained A-core rectangles of 2.1 and 2.6 with u/λ² < 0.0463 [P + C, author only; central premises open ·
STATUS 8.13].

### 2.11 Charging response feasibility to the discarded squares

Let H=z₁(T−2)/√2 and Σ=‖P₁,₀k‖²+ε‖P₂,₁h+(√2β/ε)H‖². For every actual bounded response, in every finite dimension and
with arbitrary remote sharing, Σ≥max(0,sup_{λ≥0}J_λ), where

    a(λ)=2(λ+2)/(3λ+4),       n(λ)=8(λ+1)/(7λ+6),
    J_λ=(λ/ε²)[E_q/2+a(λ)E_A+4E_B/3+E_Q+E_P+n(λ)E_ν]
         −λ(π/4−t²)+[ελ/(2(3ε+4λ))](t−4β/ε)².

[P + C · codex-9b17, re-derived and replayed by claude-b9ee in [review
of #433](https://github.com/agalatan/grothendieck-lean/pull/433#issuecomment-6892542529) · 2.12c] The exact raw row
subtracts this penalty from its Λ expression. At the peak, t=.8456, E_q=.04, E_A=.03 and all other energies zero pass
the energy cuts of 2.10 but force Σ>.009. This compares relaxations, not realizability or a global endpoint
improvement. The weighted Gram proof, square completions and exact row identity are in
[the source proof](sources/response-penalty-2026-11-15-codex-9b17/PROOF.md).

**Retained-compatible extension.** Allocate fractions s,k of the first-chaos and visible-cubic squares to this penalty
and only the complementary fractions to another dual. The exact coefficients and proof are in
[the allocation note](sources/response-penalty-2026-11-15-codex-9b17/ALLOCATION.md). For s=0,k=1, the first-chaos
square stays entirely with Λ̂. Writing D for the weighted energy on the left of the ellipsoid of 2.10
(not the deficit), the remaining h-square is at least

    λ[D/ε²−(π/4−t²)]+[ελ/(2(3ε+4λ))](t−4β/ε)².

At the peak, λ=1/4 makes this exceed 10⁻⁴ on the whole region t≥.8456, D≥.04. The square-completion algebra, the
split-budget composition, the witness-frame interface and the scalar regional inequality are Lean theorems
(`Lower/ResponsePenalty.lean`, `LowerAnalytic.VOf_frame_with_penalty`) [Lean · 2.12d]; the allocation extension is
[P, author only · 2.12d]. The Gaussian Gram instance and the support and cover certificates that would use the penalty
are not formalised. The Lean cover of the lower bound (ε=149/200, in the variables (t,τ,x)) does not track D and has
spent the first-chaos square, so J_λ does not lower its caps: no cap improvement and no endpoint follows [2.12d].

**Two further penalties** [P + C, author only · codex-4d8a · STATUS 2.12e, 2.12f]. Phase alignment gives
Σ ≥ (2β²/e²)(Im ν)²/(t² + ‖G‖²/e), so Σ > (337/4000)(Im ν)² at the peak for t ≤ 0.863 and ‖G‖² ≤ 0.080051; it
belongs to the raw row and must not be subtracted from Λ̂ again. Applying weighted Bessel to f and g separately
keeps a cross term and improves J₁ by more than 3.9·10⁻⁴ on an explicit region.

## 3. What is open, in priority order

A bound sup Λ̂ ≤ S + η on the rows of a consumer gives the lower bound (1.6); K itself is not needed for it. Part A is
ordered by what a proof of 1.402 through Λ̂ needs first; part B lists what K needs in addition [STATUS §15].

**A. The bound through the retained functional Λ̂.** The A-sector is closed at the peak and on a profile rectangle
around it (2.6). The route gives the same conclusion as K_η, with larger numerical margins (chapter 5).

1. **Completed.** At the peak row the joint remainder premise (P) holds on all of ℂ³ (7.4.16, **P + C**).
   With the bridge of 7.4.10 this gives Λ̂(q + A + B) < S + 0.00004936 throughout u ≤ 0.0463,
   u + V ≤ 0.080051, with arbitrary sharing and phases (2.8). A second target, with no
   caps on the driver energies but with content premises that are open, is the common cost 23/100 at the A-tilt alone
   (2.8).
2. **The odd sectors over a core with A/B shells**: remote cores are done at the peak (2.9). With A/B shells the base
   can vanish quadratically at fixed remote values, so an argument must average over the Gaussian drivers; the
   compensation of 2.9, which keeps both Q/ν channels in the conditional inequality and removes them by E Q = 0, is
   the model. The target is the averaged premise (P_Ψ) of 2.9, or the compact averaged bound of its centred joint
   form, outside the small-energy and odd-dominance regions of 7.4.16 and 7.5.12. *Gives:* with item 1, Λ̂(G) < S + 9.9·10⁻⁵ for every G within
   the response caps at the peak (2.9).
3. **A consumer whose rows these bounds fit** (2.10): cover the complementary t regions with a fixed ε, using the
   t-dependent energy caps, and state the consumer in Lean. The peak bound covers t ∈ [0.84, 0.851] only. A simple
   first step is one new row at ε = 149/200 with an all-sector bound there, which gives 1.40171 (below the proved
   lower bound, so a test of K only). At ε = 299/400 only
   the central interval (0.8165, 0.866) is left, as ten explicit all-sector inequalities; their binding rows admit
   3.0–4.4·10⁻⁵, less than the 9.9·10⁻⁵ of item 2. At ε = 94/125 only (0.7515, 0.863) is left (author only), as
   thirteen central rows each admitting > 1.021·10⁻⁴ > 10⁻⁴ (and > 7.57·10⁻⁵ on nine rows at ε = 3/4 from `Lower.ρ`
   alone), with Row 8 on [0.840, 0.847] already inside the proved remote and retained A-core rectangles. Rows away from
   that peak rectangle still need remote, A-core and all-sector estimates on their own profiles and energy caps
   (2.1, 2.6), with the weighted scaling of 1.6; the flank and upper rows are outside both. At ε = 1891/2500 four
   response intervals are uncovered, with certified benchmarks on parts of two of them (2.10 · 8.7, 8.11). Also open:
   the corner σ\* = 0 if a cover uses it (1.4), and the unchecked external remote claims (2.1 · 11.7–11.11).
   *Gives:* 1.402.
4. **Numerics for Λ̂ with more than three remote variables** (chapter 5).

**B. Conjecture K itself.**

5. **The joint A/B remainder bound at finite amplitude** (2.8), first at the peak row. Enough: the compact box
   0 ≤ x ≤ 29/10, |α|, |β| ≤ 0.4 with reserve 7.53·10⁻⁵ (robust) or 8.07·10⁻⁵ (signed). Alternative: a global
   pointwise cost m for A and B together. Any such m lies below 0.29836…, the local value at the origin, attained
   along a genuine cubic direction (2.8), so a candidate such as 0.29 must be tested away from the origin before any
   certificate. With such an m the A + B gain is a quadratic form in the contents at every amplitude, as step 2 of 2.6
   is for the tilted A-sector. *Gives:* the A + B core of K from content bounds.
6. **The raw L4 content inequality** for general cubics on 0.00551 ≤ u ≤ 0.0463, with the constant fixed by item 5
   (0.10 under the adverse joint hypothesis). For the A-only constant 6/25, the staircase and small-influence class
   (χ ≤ 0.2809 across the band, τ_max ≤ 0.054), high excess χ ≥ 40.32, and independent blocks are covered (2.5 ·
   6.3.40–6.3.42), together with the complete one-driver self-interaction family across all shares and phases (2.5 · 6.3.13–6.3.15, author only) and bounded kurtosis against D (signed +10⁻⁶ on χ ≤ 841/10000, exact zero-slack across
   χ ≤ 49/625 with no near-Gaussian sliver; 2.5 · 6.3.43, author only). Open pieces at intermediate/high
   kurtosis: the remaining even-character shells beyond the sign neighbourhood (6.3.9c, 6.3.16) and several self-interacting drivers (6.3.17). By the
   local representation of 2.5, the content and
   the excess D − 𝒥_dec of the deficit over that of the decoupled surrogate (2.1) are linear in one pair of fields, so
   the target can be put as C² ≤ κ·(D − 𝒥_dec). Cauchy–Schwarz on either Stein pair falls short of the needed
   constants (2.5; items 91, 93), so a proof must use the angles between the fields. Near cubics with a phase symmetry
   only the resonant part of a perturbation contributes at first order; that route lacks a control of the resonant
   energy of a general cubic by its own deficit (2.6). The B-content of general cubics follows from the A-content by
   the peak alignment (2.7). *Gives:* the A-core of K, with item 5 the A + B core, and the B-sector with its cost.
7. **Exact remote K** (2.1), which the peak row does not need: it is known on the classes named in 2.1. The routes are
   doubling monotonicity (3.20), the smoothing sign of the weighted interpolation formula (3.21 (d), 3.22) and the sign
   of the two weighted contractions of the deficit (3.26), all in 2.1.
8. **The sharp radius ρ\* = √π/2 on H₂,₁** (2.1; 3.6) and the real third-chaos target E\|h\| ≤ √0.68‖h‖₂ (3.21 (a),
   (e9)). Directly on H₂,₁, ρ\* ≤ 2289/2500 = 0.9156 < 0.916 is proved outside Lean [P + C · 3.7], passing the radius
   test of the uncapped degree-5 game; the best constants are 2287/2500 = 0.9148 [P + C · 3.7] and 4571/5000 = 0.9142
   [P author only + C · 3.7] (2.1).

**C. Other routes to the same decimals** have their own ledgers. The identity-tail witness raises the model ceiling to
1.40248; its certificate and its Lean form are recorded in `../identity-tail/STATUS.md`. The games of degree 5 and
higher are recorded in `../higher-degree/STATUS.md`; their open steps are listed in its section 5, and the one that
uses the rows of this ledger is the content lemma on a band of energies (2.5).

## 4. Statements known to be false

Each is false as stated; none is a counterexample to K. The numbers are the labels of the ledger (`STATUS.md`,
section 13), where every source is listed.

**Strengthenings and reformulations of K**

- **1. K for every profile.** False for profiles with ℓ − 2β of order 10⁻¹⁰ at tiny norms; no violation on the box
  [R].
- **4. Fibrewise domination at a fixed shift, E|r + q| ≤ E|r + ‖q‖W|.** False for q = z₂(|z₃|² − 1) at every r ≥ 2.5
  (+2.2·10⁻³ at r = 2.5): K is an averaged statement in the visible variable [N].
- **5. Single-scale strengthenings** (heat kernel, Laplace transform, characteristic function, convex order).
  E e^{−30|H|²} < 1/31 for H = z[(|z|² − 2) + i(|w|² − 1)]/√3 [R].
- **6. Monotonicity along the CLT.** G = c·z₁(|z₂|² − 1) gains 4.9·10⁻⁴ at c = 0.15 [N].
- **78. The interval condition SEI, E[(τ_X(X) − σ_X²)·1{|X| < c}] ≤ 0 for every c > 0 with τ_X the Stein kernel of X,
  is preserved by adding any independent symmetric unimodal variable.** X₁ = Z₁Z₂Z₃/3 satisfies SEI, X₁ + U with U
  uniform on [−1, 1] does not (gap ≥ 91/18000). Valid closures: independent Gaussian addition, or two SEI summands
  with symmetric unimodal densities [P + C].
- **80. The diffuse Gaussian attains the cubic supremum in each fixed dimension.** At n = 1 the peak supremum is
  B₀ < S [P].
- **12.3. The degree-5 analogue K₅ holds.** At the flank rows t ∈ [0.86, 0.88] one spike gives +1.55·10⁻⁵; at the peak
  row many spikes give +7.1·10⁻⁵ [N].

**Remote part and domination**

- **68. A remote cap gives D(q) ≥ −η_R.** It gives D(q) ≥ −[S − (B(u) − pu)] − η_R only [P].
- **87. A gain bound in terms of D₊ attenuates the remote error by 1 − κ.** That attenuation needs the signed D; with
  D₊ the error is η_R + η (2.6) [P + C].
- **84. A nonlinear function of a remote cubic is orthogonal to the first chaos because the cubic is.**
  q = cX(|Y|² − 1) has a nonzero first-chaos phase content; the diffuse benchmark of Λ̂ needs the estimate of 1.6
  [P + C].
- **85. The retained functional scales like the raw one.** The multiplier cost carries a weight λ, and the unweighted
  law fails strictly on q = cX(|Y|² − 1) [P + C].
- **66, 67. Redistribution 4.1 and Theorem B without independence from z₁.** H = −L·1{T ≥ 10} with U = sW, and
  𝓕 = σ(z₁) with G = (a/2)W·1{T ≤ 1/100}, break them [P, author only].
- **11. Replacing a shared (T − 1)U by an independent Gaussian of equal variance does not lower Λ.** The shared version
  is larger by up to 1.96·10⁻² [R].
- **10. Λ is concave in the conditional covariance.** Largest Hessian eigenvalue +1.3 to +2.9 [N].

**Content**

- **20. The Wick monomial maximises C²/D.** The imaginary direction X[(|X|² − 2) + iτ(|Y|² − 1)] increases the ratio
  at u = 0.0463; the monomial is a saddle [P, C; sign inputs R].
- **26. Content or deficit is Schur-convex in the spectrum of a Hermitian form.** (2, −1, −1) ≺ (2, 0, −2), yet the
  leading tensors are 576 and 0 [R].
- **27. Phase averaging removes the shells X̄B, X²W̄.** Cross terms survive [P + C].
- **28. Centring and conditional Gaussianity give the constant 0.24 without the chaos moment inequality.** Two-point
  laws reach 0.2646 [R].
- **88. Shared-A domination holds for any residual with Gaussian law, orthogonal to the first chaos, with the matched
  covariance.** The non-cubic witness of 2.5 gives Λ(G) > S + 7·10⁻⁷; arguments through the law alone cannot prove
  K [P + C].
- **45. ‖Π(q·h)‖ ≤ E[|q|h(|q|²)].** False for q = y(|y|² − 2)/√2 with h = 1{v > 1}; the L² contraction is the valid
  step [P].
- **74. Character exclusions alone give the weighted bound of the neighbourhood lemma.** Fails for non-cubic L²
  functions; the lemma needs p, h ∈ H₂,₁ [P, author only].

**Sectors and assembly**

- **36. Every sector other than A is pure cost.** B has first-order content (2.7) [P].
- **37. The odd sectors have content of order u.** They have no first-order term (1.7) [P].
- **39. The B-cost holds at every even L² base, so at q + (T − 1)r_A.** Cusp at H = L·sign(Re z₁); with a loss of 0.07
  on both diagonals the excess is 4.2·10⁻⁴, above 10⁻⁴ [P; package counterexamples R].
- **43. Separate A and B axis costs imply a joint cost.** The quadratic 2c_Aa + 2c_Bb − 0.24a² − 0.26b² + 0.40ab
  satisfies both axis costs, the content constant 0.10, exact alignment and both amplitude caps, and exceeds the
  deficit by 3.3·10⁻⁴ [P].
- **7.4.4. A positive mixed coefficient makes the cross term nonnegative.** Not for arbitrary relative phases [P].
- **81. The raw joint A/B form has a global cost 0.300.** Its local cost at the peak is 0.29836… [P + C].
- **44. g_B/g ∈ [0.505, 0.56] at the three rows.** False at the flank and upper rows [R]; at the peak the alignment
  of 2.7 holds.
- **72. The Schur-complement formula with an indefinite cost matrix.** k_A = k_B = 1, m = 2 gives 0 for an unbounded
  gain [P].
- **77. The pointwise remainder of K over all five sectors has nonnegative cost.** Constant coefficients
  (k_Q, k_P, ν) = (i, 0, −i) give local cost below −3/8 [P + C]. Constant Q is not a centred quadratic: the integrated
  zero-core theorem of 2.9 stands; over a remote core the two channels of the Q/ν coupling are absorbed by the
  compensation of 2.9 (peak row), and over a core with A/B shells the interaction is open.
- **70. The odd sectors never raise Λ over the zero core on the whole box; the flank d-cost is 0.36.** The corner
  cubic (i/100)Z(|Y|² − 1) at (0.76, 0.76, 0.16) raises Λ, and (i/100)Z(T − 2) at the flank violates the cost 0.36
  [P + C].
- **73. Retaining the first-chaos correction restores full-box odd nonincrease.** The corner cubic of item 70 raises Λ̂
  as well [P + C]. The flank example concerns Λ only: the retained flank d-cost exceeds 0.525048300689048 per unit
  cubic energy.
- **71. Parity implies differentiability at every even L² base.** H = L·sign(Re z₁) has a cusp along Z(T − 2) [P].
- **38. Over a nonzero core the odd sectors obey the inverse-norm condition E[|O|²/|L + H|] ≤ (1/ε − κ_E)‖O‖².** Fails
  even with κ_E = 0 at an explicit core [R]; it is the condition (PH) of items 47–49.
- **86. Over a nonzero core the Q/ν coupling has one Hermitian radial kernel.** It has two channels, with opposite
  signs on a genuine cubic witness (2.9) [P + C].
- **89. At the common remote trial, the odd increment over an A/B core is paid by 0.01‖r_B − 0.5053r_A‖² + 5·10⁻⁵.**
  A shared witness on one remote coordinate, inside the energy and response caps, exceeds that allowance by more
  than 10⁻⁴; its fixed-trial retained value is about 0.038 below S (numerical), so it does not threaten the all-sector
  target (2.9) [P + C].
- **19. The local matrix of the retained functional (tied multiplier) plus I/10 is a global majorant.** Violated by
  more than 97/1000 at an explicit point [R].
- **47–49. Decoupling, the statements (EC), (PH), (PG) of the October plan, and a uniform fibre bound, all for the odd
  sectors (the October "even sectors").** False by up to 5.7·10⁻³, or with eigenvalues 1.3395 and 1.7095 above p
  [N, R].
- **50. Subtracting the first-chaos penalty at the unpenalised best response bounds the retained supremum.** The
  maximisers readjust; the valid object is the dual Λ̂ [N].
- **11.6. A weighted cubic contraction is nonnegative.** q = X[5(|X|² − 2) + 6i(|Y|² − 1)]/√86 makes it below −1/50
  [R].
- **92. The terms of the deficit representations are separately nonnegative for √v.** On
  cos θ·X²Ȳ/√2 + sin θ·X(|X|² + |Y|² − 3)/√3 at θ = 0.2 the second term of the representation of 2.5 is
  −1.33·10⁻⁴ against D = 0.2456; the comparison with the decoupled surrogate fails on the Wick monomial
  (0.6908 > 0.6267). At the peak row no violation was found [N].
- **95. Gaussian Laplace or small-ball domination on the real third chaos.** False for He₃(G)/√6: its density at
  zero is 0.99868·φ(0), and the Laplace comparison fails for every t > 403. The L¹ bound and the smoothing sign are
  not contradicted [P + C].

**Response side**

- **69. The total response energy is below 0.072.** It needs t ≥ 0.8456; at t ≥ 0.84 the cap is 0.080051, and a
  response at t = 0 has energy above 0.09 [P + C].

The ledger lists the remaining items (2, 3, 7, 8, 46, 59, 96, 97, 102, 104–107) and, in its section 14, the routes
that do not work: the fourth-moment envelopes (their refinements move the cutoff w ≈ 0.0112 by about 10⁻⁴),
leading-order and Taylor control of the content (finite amplitude is essential), buffer insertion by Jensen, proofs
from the law of the residual alone, the fixed moment bank for the augmented remote certificate, the saved dual bank
for a content coefficient 3/20 (item 103), Cauchy–Schwarz through the law of |q|²
alone or on either Stein pair for the raw content (items 91, 93), conditioning on one coordinate beyond the cubics
that vanish on a hyperplane (item 94), and others.

## 5. Numerical evidence

All numbers here are floating point at the peak row (**N**). A search gives lower bounds on a supremum, not upper
bounds; each table names its limits.

**No violation of K.** Searches over H₂,₁(ℂ²) and H₂,₁(ℂ³) with a diffuse part
(largest excesses +1.4·10⁻¹² and +5·10⁻⁹, at the level of the quadrature error and of a grid artefact), scale
mixtures, full tensors in dimensions 3 to 5 at the three rows (every candidate below S on 2·10⁷ fresh samples), and
all six sectors over H₂,₁(ℂ²) with 18 shells [2.3].

**The content ratio C²/D of K** (supremum over remote cubics of energy u):

| source | u = 0.02 | u = 0.03 | u = 0.0463 |
|---|---|---|---|
| independent audit, n = 2…6, 50 starts, holdout validation | 0.0691 | 0.0785 | 0.087602 (n = 2) … 0.087492 (n = 6) |
| best structured tensor (feasible in every n ≥ 2) | 0.06914308 | 0.07857990 | 0.08760259 |
| Monte Carlo scan, n = 2…10 | ≈ 0.070 | ≈ 0.080 | 0.0828 to 0.0892, ±0.0003 to ±0.0011 (values above 0.0876 lie within their error bars and carry a selection bias; the first two rows are the reference) |
| Wick monomial | | | 0.0875653 |

No strict increase with n is resolved; the maximisers are 96 to 98 % Wick monomial plus an imaginary Hermitian
X·P(Y) part. Against the content constants 0.10, 0.15, 0.24 the margins are 1.14, 1.71, 2.74 [7.4.6]. Untested:
n > 10, large diffuse parts, the flank and upper rows [STATUS §9].

**Sector gain against the deficit** (gain = supremum over the sector amplitudes of the functional at q + sectors minus
Λ(q); for Λ̂ the retained element is optimised together with the sectors):

| tensors | sectors | K | Λ̂ |
|---|---|---|---|
| Wick monomial, u = 0.0463 | A | 0.1604 | 0.0170 |
| Wick monomial, u = 0.0463 | A + B | 0.1653 | 0.0183 |
| all of H₂,₁(ℂ²), u from 0.005 to 0.15 | A | up to 0.1609 | up to 0.0237 |
| the same tensors | A + B | up to 0.1657 | up to 0.0241 |
| all of H₂,₁(ℂ³), u = 0.02, 0.03, 0.0463 | A | 0.1611 | up to 0.0247 |

[11.15, 11.16, 11.20] The margin of gain ≤ D is about 6 for K and about 40 for Λ̂. The retained ratio grows slowly with
the number of remote variables (0.017, 0.021, 0.023 at u = 0.0463 for one, two, three) and its limit is unknown. A
fixed tilt does as well as the free multiplier: 0.0257 at s = 0.6 and 0.0237 at s = 0.7 over two-variable tensors
[11.19]. The mechanism is a cancellation in the tilted content: the profile h_s changes sign for s between 0.58 and
1.29, and on the Wick monomial the content at s = 0.6 is 0.36 times that at s = 0 [11.14].

**The tilted content certificate against the truth.** The true coefficients behind the certified envelopes of step 3
of 2.6 are 0.0474 down to 0.0321 against the certified 0.049 down to 0.0325; on 1,298 tensors of the
Gaussian-to-monomial family and 288 random two-variable cubics the comparison with 3/10 holds with the largest
C²/(0.3D) equal to 0.040 [11.49, 11.50, 11.62]. On the Wick monomial D/δ falls from 0.73 at u = 0.0005 to 0.13
at u = 0.0463, which is why bounds through δ need energy-dependent coefficients [11.29].

**Pointwise remainders of other sectors** (smallest sampled p − Rem/|r|², which would be a global cost if certified):

| sectors | K | tilt (0.6, 0) |
|---|---|---|
| A alone | 0.320 | 0.362 (certified: at least 0.312, 2.6) |
| A and B together | at most 0.29836 (the sharp local value at the origin, 2.8) | at most 0.24772 (the sharp local value at the origin, 2.8) |
| B alone | 0.706 | |
| A, B, z₁Q, z̄₁P | 0.128 | |
| with d·z₁(T − 2) | fails pointwise (−0.387) | |

[11.37, 11.45, 7.4.9, 7.4.15] The second derivative along the sector, unlike the remainder, exceeds the budget
without a restriction on the amplitude at every tilt tried [11.17].

**Identity tail.** In the two-variable graded model the cubic head with a constant tail ν reaches the norm 0.713021
(1.402483) at ε = 0.7681, ν = 0.0235, against 0.7131355 (1.402258) without the tail [STATUS §10]. The certificate of
`../identity-tail` is at another point of the (ε, ν) plane (1.5).

## 6. Where everything is

| chapter | ledger rows (`STATUS.md`) |
|---|---|
| 1.2–1.5 setting, budget | 2.1–2.5, 8.1–8.4, 12.1, 12.2 |
| 1.6 retained functional | 2.10, 2.10a, 2.13, 2.14, 3.16, 3.17, 11.2–11.13 |
| 1.7–1.8 sectors, cubics | 2.7–2.9, 3.4 |
| 2.1 remote part | 3.1–3.30, 11.7–11.11, 12.8 |
| 2.2–2.3 disjoint drivers, Theorems A and B | 4.1, 4.2, 5.1–5.6, 6.3.19 |
| 2.4–2.5 shared drivers, content | 6.1.1–6.5.1 |
| 2.6 tilted lemma, retained A-core | 11.25–11.62 |
| 2.7–2.8 B-sector, joint form | 7.1.1–7.4.16 |
| 2.9 odd sectors | 2.6, 2.6a, 5.4–5.4c, 7.2.2–7.2.11, 7.5.1–7.5.12 |
| 2.10–2.11 response, consumer, penalties | 2.12–2.12f, 8.1–8.13 |
| 3 open problems | section 15 |
| 4 false statements | section 13 (and 14) |
| 5 numerics | sections 9, 10, 11 (c), 2.3 |

Each ledger row names its sources and its checkers, and the tag table in section 0 of the ledger gives their folders.
Everything outside the repository (zips, large certificates, logs) is listed with hashes in
[`INVENTORY.md`](INVENTORY.md). The folder's [`README.md`](README.md) indexes the files assembled up to 15 November
2026, and the October manuscript is read through
[`sources/manuscript/MANUSCRIPT_DIGEST_K.md`](sources/manuscript/MANUSCRIPT_DIGEST_K.md).
