# Conjecture K

*This book states the current best-known state of Conjecture K. The evidence for every statement (who proved it, who
checked it, which files and checkers) is in the ledger [`STATUS.md`](STATUS.md), cited here by row number; the
monograph of 5 and 6 November with its errata is
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

**Why it matters.** The proved bounds are 1.401700322371 < K_G^ℂ < 1.404599398052 (Lean, `main_bounds`). The lower
bound comes from the cubic witness T_ε = P₁,₀ − εP₂,₁: every pair of unimodular functions satisfies
Re⟨f, T_εg⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G), exactly, and the proof replaces sup Λ by scalar relaxations. K with an error
η ≤ 10⁻⁴ would turn the row into an explicit one-dimensional function and give about 1.402; exact K would give about
1.4022; no certificate with this witness exceeds 1.4022581233.

**Where things stand.** Conjecture K is open, and no violation is known. A proof splits into six layers (1.9).

- **Proved** (at the peak row unless the whole box is named): the remote part, Λ(q) < S + 3.6·10⁻⁷ for every cubic q
  independent of z₁ (2.1); the A-shell with independent drivers, on the whole box (2.2); explicit regions of the
  shared-driver core (2.4); the content inequality for several structured families (2.5); the B-shell cost and the
  alignment of B- and A-contents (2.7, with a sharper author-only bound); the local joint A/B form (2.8); the odd sectors over the zero core and, separately, each pure odd sector over every remote core (2.9, latter author only); the
  central part of the consumer, conditional on an all-sector bound (2.10).
- **Proved for the retained functional Λ̂** (which keeps the first-chaos penalty dropped from the row; a bound on
  sup Λ̂ suffices just as well, and its benchmark is the same S): the whole A-shell at the peak row,
  Λ̂(q + (T − 1)r) < S + 2·10⁻⁵ for every remote cubic q of energy at most 0.0463 and every remote linear form r, in
  every dimension and at every amplitude, and the same with error below 9.8·10⁻⁵ on a profile rectangle around the
  peak (2.6).
- **Open:** the raw content inequality of L4 for general cubics; the finite-amplitude joint A/B bound, reduced to a
  compact box; the B-content of general cubics; shared odd sectors over a core containing A/B; the remote part away from the
  peak; the response regions outside the central one; the consumer and its Lean statement (chapter 3).

**How far.** Apart from L2 and the one-coordinate results, every finished piece holds at the peak row or near it, and
a 1.402 proof needs an all-sector bound with error about 1.006·10⁻⁴ there, plus coverage of the other response
regions. With the retained functional the A-shell uses 2·10⁻⁵ of that budget; the B-shell, the joint A/B interaction
and the shared odd-sector interactions remain missing. With the raw functional of K the content inequality is also missing. The
gain at stake is about 3·10⁻⁴ on the constant.

## 1. Setting

### 1.1 Gaussian chaos

z = (z₁, …, z_n) are independent standard complex Gaussians (E|z_j|² = 1) and ⟨f, g⟩ = E[f̄g]. H_{p,q} is the Wick
chaos of bidegree (p, q) and P_{p,q} the projection onto it; Π₁ is the projection onto the first chaos H₁,₀ of the
remote coordinates. z₁ is the **visible** coordinate, T = |z₁|² is Exp(1), and z₂, …, z_n (written X, Y, w in
examples) are the **remote** coordinates. W is a standard complex Gaussian independent of everything else, and
ph(z) = z/|z|.

### 1.2 The witness and the exact row

The lower bound is K_G^ℂ ≥ 1/‖T_ε‖ with ‖T_ε‖ = sup{Re⟨f, T_εg⟩ : |f| = |g| = 1}. For unimodular f, g put
h = (f + g)/2, k = (f − g)/2, rotate so that P₁,₀h = t·z₁ with 0 ≤ t ≤ √π/2, and put G = εP₂,₁k ∈ H₂,₁. Then for
every real ℓ and β

    Re⟨f, T_ε g⟩ ≤ t² − 2ℓt + 2β²/ε + Λ(G),
    Λ(G) = E|L + G| + E|L − G| − ‖G‖²/ε,     L = z₁(ℓ + β(T − 2)) = z₁(a + bT).

[P · audit of codex-a713 · 2.1] Three nonnegative terms are dropped: ‖P₁,₀k‖², ε‖P₂,₁h + B/ε‖² with B = βz₁(T − 2),
and the pointwise phase slack. Everything below is about sup Λ.

### 1.3 Conjecture K and its weak forms

    K:   Λ(G) ≤ S(ε, ℓ, β) := sup_{σ≥0} {2E|L + σW| − σ²/ε}   for every n and every G ∈ H₂,₁(ℂⁿ).

[open · 2.2] The comparison object σW is the limit in law of σN^{−1/2}Σ_{j≤N} H(w_j), H(w) = w(|w|² − 2)/√2, over
fresh remote coordinates: a limit of cubics independent of z₁. If K holds, S is the supremum of Λ over all finite
dimensions, approached along such sequences. No attainment in a fixed dimension is asserted: at the peak, n = 1 has
supremum B₀ = 2E|L| < S (2.9), while at the corner (0.74, 0.90, 0.12), where σ* = 0, G = 0 attains S.

- **K_η:** Λ ≤ S + η. At the peak row the budget for 1.402 is about 10⁻⁴ (1.5).
- **K′:** keep the first-chaos penalty; its unconstrained form is the retained functional Λ̂ of 1.6. A bound on
  sup Λ̂ is weaker than K and suffices.
- **Response restrictions:** only G that come from actual responses matter, and they have bounded energies (2.10).
  Such restrictions are valid for responses, not inside a supremum over all G.
- **The box matters:** K for every profile is false (chapter 4, item 1).

### 1.4 The rows and the peak constants

The principal certificates use three rows; statements for the whole box say so.

| row | ε | ℓ | β = b | a = ℓ − 2β | σ* (maximiser of Λ(σW)) |
|---|---|---|---|---|---|
| peak | 1891/2500 = 0.7564 | 1057/1250 = 0.8456 | 179/1250 = 0.1432 | 699/1250 = 0.5592 | 0.2009 |
| flank | 149/200 = 0.745 | 4267/5000 = 0.8534 | 1467/10000 = 0.1467 | 14/25 = 0.56 | 0.1726 |
| upper | 1891/2500 = 0.7564 | 0.877 | 19/125 = 0.152 | 573/1000 = 0.573 | 0.1617 |

At the peak: p = 1/ε = 2500/1891;

    B₀ = Λ(0) = 2E|L| = 387√π/500 ∈ (1.371879280600869, 1.371879280600870),
    1.3739535256614 < S < 1.3739535256616,      S − B₀ > 0.002074245,

with S attained near v₀ = σ*² = 403448/10⁷ [C · codex-a7c4, replayed by claude-b9ee · 3.14]. The profile constants
used below are j₀ = ½E|L|⁻¹ ∈ [1.431973791291431, 1.431973791291432], g₀ ∈ [−0.835135932614130, −0.835135932614129]
and k_A = p − E[(T − 1)²/(2|L|)] = 0.320054504 (1.8).

The corner (ε, ℓ, β) = (0.74, 0.90, 0.12) of the box has σ* = 0; Theorem B (2.3) covers it, several other proofs do
not, and it matters only if a row cover uses it [R · 2.5].

### 1.5 What K would give

- The complete lower cover gives K_G^ℂ ≥ 1250000000/891774069 > 1.401700322371, with row cap
  891774069/1250000000 = 0.7134192552 [Lean · 12.1].
- 1.4018 needs a row cap below 5000/7009 = 0.7133685261…; the present cover does not reach it.
- 1.402 needs a row cap below 500/701 = 0.7132667617…; 1.4022 below 5000/7011 = 0.7131650263….
- At the peak row an all-sector bound Λ ≤ S + η with η ≤ 10⁻⁴ covers the response interval t ∈ [0.84, 0.851] for
  1.402, with the cap more than 6.12·10⁻⁷ below 500/701. The largest admissible allowance on that interval is
  η_max = 166713115892493/1656988750000000000 = 0.0001006120988404375…, with no reserve left [P + C · codex-a7c4,
  re-derived by claude-b9ee · 8.1].
- Under exact K the cap would be about 0.713160 at ε = 0.7564, that is 1.40221 [R, floating point · 8.4].
- No certificate with T_ε exceeds 1.4022581233, for any multiplier and dimension [R here · 12.2]; at ε = 149/200 the
  witness cannot reach 1.402 at all [R · 8.3]. A witness with an identity tail, (1, −ε, ν, ν, …), has the model
  ceiling 1.40248 at ε ≈ 0.768, ν ≈ 0.0235, untested at certificate level [N · STATUS §10]. The degree-5 analogue of K
  fails numerically at its flank rows (chapter 4, item 12.3).

### 1.6 The retained functional Λ̂

    Λ̂(G) := min_{ξ ∈ H₁,₀} { ‖ξ‖² + E|L + G − ξ| + E|L − G + ξ| } − ‖G‖²/ε.

[P · `ch20`; re-derived by claude-b9ee (REV) and in A15R · 2.10a] Λ̂ is the first-chaos dual of the October
manuscript. It satisfies Λ′ ≤ Λ̂ ≤ Λ, where Λ′ is the constrained functional of K′ (2.10), and the row of 1.2 holds
with Λ̂ in place of Λ. So a bound sup Λ̂ ≤ S + η serves the lower bound exactly as K_η would. The inner minimum has a
unique minimiser, of norm at most √π/2, and a residual certificate for trial points [P · 2.13].

On a remote q (independent of z₁) the two functionals differ by the first-chaos content of the phase: with
μ = Π₁ E_{z₁}ph(L + q),

    ‖μ‖²/(1 + j₀) ≤ Λ(q) − Λ̂(q) ≤ ‖μ‖²,      1/(1 + j₀) = 0.411188641… at the peak.

[P + C · `ch20` and codex-a7c4, re-derived and replayed by claude-b9ee · 3.16] They agree exactly when μ = 0 (for
instance q = cXY·conj(V) with three independent remote coordinates) and differ strictly on q = cX(|Y|² − 1) at every
amplitude c > 0 and every profile. The pointwise difference does not separate the suprema. For independent blocks
q = Σ_j c_jH(X_j),

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
of the remote coordinates, and d ∈ ℂ. The **core** is q + (T − 1)r_A. The sectors z₁Q, z̄₁P and d·z₁(T − 2) are the
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
**content inequality** is C(q)² ≤ κ·D(q). The **B-content** c_B is defined in the same way with g_B, and the
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
| L5 | all sectors together | B cost and alignment proved; joint A/B and odd sectors open | 2.7–2.9 |
| L6 | row envelope and consumption | central component proved; the rest open | 2.10 |

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
  |a − λ·699/1250| + (3/2)|b − λ·179/1250| ≤ λ/50000 [P + C, author only · codex-a7c4 · 3.11].
- **One-sided rectangle.** ε ∈ [0.74, 0.76], 0 ≤ a/λ − 0.5592 ≤ 1/2000 and 0 ≤ b/λ − 0.1432 ≤ 1/625 give
  Λ(q) < S + 9.934·10⁻⁵ [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 3.15].
- **Convex cells.** Caps at the vertices of a convex cell of profiles transfer to the cell through a concave lower
  bound of S, such as the supporting plane of the Gaussian benchmark [P · 3.13]. No cell is certified: remote caps
  exist at the peak only.

The flank and upper rows are outside all of these.

**Reformulations.** For one fixed profile, four statements are equivalent: the universal complex sharp radius bound,
Gaussian-buffer PVD, same-variance remote domination, and exact remote K at every price p > 0. Real BNC implies real
PVD, which implies complex PVD; no converse is known [P · codex-a7c4, re-derived by claude-b9ee · 3.5]. The sharp
radius bound E|q| ≤ (√π/2)‖q‖₂ on H₂,₁ is open; cases are proved for real BNC of order 2, one-variable H₃ at every
scale, the family aH₃(g₁) + bH₂(g₁)g₂ and Gaussian scale mixtures [R · 3.6]. Weaker radii: E|q| < 0.95133‖q‖₂ for every Wick cubic [R · 3.7]. In real second chaos,
E|X| ≤ √(2/π)‖X‖₂ [R · 3.8]. Exact remote K is not needed for 1.402.

**External claims.** A report claims a remote closure in another normalisation (E|q|² ≤ 1 ⟹ Φ(q) ≤ 2853/4000, and
three related statements); its package is not in the record, so nothing is checked [R · 11.7–11.11].

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
  s + u(T − 1)² + bT + cT², coefficients nonnegative and 𝓕-measurable, then F(G) ≤ B(‖G‖²) (needs a/β ≤ 11/2; covers
  the σ* = 0 corner; excludes arbitrary conditional cross-covariance) [P · audit · 5.2]. A genuine cubic can have a
  sign-indefinite conditional cross term: X[(T − 1) + (|Y|² − 1)] has conditional variance [(T − 1) + (|Y|² − 1)]²,
  so shared-driver cubics are not covered by 5.2 [P · 5.3].
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
response bound on the remote energy (2.10). Its near-Gaussian part δ/u² ≤ 0.05 has no proof [open · 6.1.5].

### 2.5 The A-sector of K: cost and content (L4)

**Cost.** For every remote q and every remote linear U with ‖U‖² ≤ 0.0113, with any sharing, at the three rows:

    Λ(q + (T − 1)U) ≤ Λ(q) + 2Re⟨U, Π₁[q·g(|q|²)]⟩ − 0.24·‖U‖².

[P with the exact checker replayed · second audit of codex-a713 · 6.2.1]

**Cost plus content.** If C(q)² ≤ 0.24·D(q), then Λ(q + (T − 1)U) ≤ B(u) − pu ≤ S. *Proof:* the first-order term is
at most 2C‖U‖, and 2C‖U‖ − 0.24‖U‖² ≤ C²/0.24 ≤ D(q); add Λ(q) = B(u) − pu − D(q). ∎ [P · 6.2.3] A bound for every
unit direction bounds the whole projection, with no dimension factor [P · 6.2.4]. So on R the A-core reduces to the
content inequality, but this proves neither raw K for all G nor K′ (R comes with response restrictions) [P · 6.2.5].

**Families with the content inequality** (0.00551 ≤ u ≤ 0.0463, three rows unless the row says otherwise; X a remote
driver, Y the other remote coordinates):

| family | constant κ | status |
|---|---|---|
| q = X·P, P any centred variable independent of X with the moment bounds of 6.3.1; every complex quadratic P(Y) | 0.22 | P + C (audit) · 6.3.3 |
| Gaussian-factor class Σ_j X_jP_j(Y), any number of drivers and coefficient matrices | 0.239 | P + C (audit) · 6.3.4 |
| Hermitian self-interaction e^{iα}X[c(\|X\|² − 2) + Y*AY − tr A], real c, Hermitian A, u ∈ [0.03, 0.0463] | 0.23 | implication P, certificate C conditional on saved scalar bounds · 6.3.5 |
| Wick neighbourhood X[c(\|X\|² − 2) + P], P centred independent of X, E\|P\|² ≤ u/5 | 9/40 | implications P, numerical premises R · 6.3.6 |
| **peak row only:** p + h with p, h ∈ H₂,₁, p of charge one under rotation of a specified coordinate block, h with no component of that character, D(p) > 0, C(p)² ≤ (9/40)D(p), ‖p + h‖² ≤ 0.0463 and ‖h‖² ≤ D(p)/90 | 6/25 | P + C · 6.3.9b |

The moment theorem behind the first row is E|P|⁶ ≤ 37p·E|P|⁴ − 68p³ and E|P|⁴ ≥ 2p² for P = Y*AY − tr A, any complex
A, p = E|P|² [P + C · 6.3.1]. The self-interaction family has the deficit identity
B(u) − F(q) = Ê d_{u,R}(|b|²) + |c|²𝓚(u) with 𝓚 > 0 [P · 6.3.7]. The families do not add up: the cross terms between
shells survive phase averaging (q = X̄Y² + (|X|² − 1)Y has energy 3 and E[X̄q|q|²] = 6) [P + C · 6.3.8].

**Open in L4:** the self-interaction family with non-Hermitian P and Wick share between 1/16 and 4/5, where an
envelope giving 0.22 is true on grids [N · 6.3.13]; the small-Wick strip [6.3.14]; the same family for u < 0.03 with
large P [6.3.15]; the mixed one-driver shells X̄B(Y), (|X|² − 1)V(Y), X²W̄(Y), R₀(Y) [6.3.16]; several
self-interacting drivers [6.3.17]; and the **raw content inequality for an arbitrary cubic on R** [open · 6.3.18].

**What a proof must use.** At the peak, Q = √u₀·X·exp(2πi·F₂(|X|²)) with F₂(r) = 1 − (r + 1)e^{−r} and
u₀ = 403448/10⁷ has exactly the law of √u₀·W, is orthogonal to the whole remote first chaos and has the matched
conditional covariance; yet G = Q − (i/1250)(T − 1)X has Λ(G) > S + 7·10⁻⁷, numerically Λ(G) − S ≈ 1.12·10⁻⁵
[P + C, N · codex-a7c4, re-derived and replayed by claude-b9ee · 6.5.1].
Q is not a cubic (E‖DQ‖² = u₀(1 + 64π²/81) > 3u₀), so K is not refuted, but the law of the residual, orthogonality
and radial tests cannot suffice: the Wick structure (E‖Dq‖² = 3u, the resolvent identity) must enter.

**Numerically** the supremum of C²/D at u = 0.0463 is about 0.0876 in every dimension tested (n ≤ 10), against the
proved family constants 0.22 to 0.239 [N · STATUS §9]. The best known value is the two-variable tensor
X[(|X|² − 2) + z(|Y|² − 1)], z = 0.0528 + 0.2212i, at 0.08760259435; the Wick monomial (0.0875653) is a saddle, not the
maximiser [N · 6.4.2; chapter 4, item 20].

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

*Proof.* Apply step 1 at w = q(y), ρ = r(y) and integrate over the remote variables. The linear term is
2Re E[conj(r)·q·(g + (3/5)j)(|q|²)], and since r lies in the first chaos and Π₁q = 0 it equals 2Re⟨r, c_{3/5}(q)⟩, at
most 2Cσ. Complete the square. ∎ [P · 11.40] No bound on ‖r‖, no localisation of a maximiser and no Gaussian tail
are needed, and q and r may share coordinates.

**Step 3: the tilted content against the deficit.** First, energy-dependent coefficients: ‖c_{3/5}(q)‖² ≤ γ·δ for
every u in [e, 0.0463] and every χ, with

| from e = | 9/1000 | 3/250 | 3/200 | 9/500 | 1/50 | 1/40 | 3/100 | 7/200 | 1/25 | 11/250 |
|---|---|---|---|---|---|---|---|---|---|---|
| γ | 251/5000 | 121/2500 | 467/10000 | 451/10000 | 441/10000 | 1859/43200 | 3/80 | 71/2000 | 17/500 | 13/400 |

[P + C · codex-6e2b; re-derived and replayed by claude-b9ee and a reviewer agent · 11.49] The bound comes from a
shifted Gaussian resolvent and a scalar function k_u solving (5/3 − (u/2)∂² + x∂)k_u = m″, enclosed by rational
barriers. Uniform bounds hold as well: ‖c_{3/5}(q)‖² ≤ min{(2/25)δ, (19321/10⁶)u} and ‖c_{3/5}(q)‖ ≤ 1/50 for
u ≤ 0.0463 [P + C · 11.30]. Then the comparison:

    ‖c_{3/5}(q)‖² ≤ (3/10)·D₊(q) + 6·10⁻⁶     for every remote cubic q with u ≤ 0.0463, in every dimension.

[P + C · codex-6e2b; re-derived by a reviewer agent of claude-b9ee, replayed in two runs, interval code not audited ·
11.50] An exact union of 178 rectangles covers (u, χ) ∈ [0, 0.0463] × [0, 42]: on low energies by global Hermite
moment caps of h(v) = 2E|L + √v|, above u = 2/125 by 119 global spectral Stein duals; the benchmark B is bounded below
by chords and every budget is a polynomial in (u, √χ) with exact Bernstein coefficients. No sign of D is assumed, and
the certificate needs no partly unreviewed content bound [C · 11.52]. Its margins are thin in places (4.3·10⁻⁷ in one
box), so it rests on the interval code.

**The lemma, and the retained A-core.** Steps 2 and 3 give, for every remote cubic q with u ≤ 0.0463 and every remote
linear form r, in every dimension,

    2E|L + q + (T − 2/5)r| − (p − 9/25)‖r‖² ≤ 2E|L + q| + κ·D₊(q) + η,
    κ = 56730/59009 ≈ 0.9614,   η = 5673/295045000 ≈ 1.92·10⁻⁵,

and therefore

    Λ̂(q + (T − 1)r) < S + 5778430967237/295045000000000000 < S + 2·10⁻⁵.

*Proof of the second line.* By the tilt, Λ̂(q + (T − 1)r) ≤ Λ(q) + κD₊(q) + η. If D(q) ≥ 0 this is
B(u) − pu − (1 − κ)D(q) + η ≤ S + η. If D(q) < 0 it is Λ(q) + η < 1.373953883 + η by the remote cap of 2.1. ∎ With D₊
in the lemma the remote error is not attenuated by 1 − κ (chapter 4, item 87). [lemma P + C · codex-6e2b, reviewed by
claude-b9ee; consequence P + C · claude-b9ee, and independently codex-a7c4 · 11.51]

For u ≤ 0.021 a separate certificate gives more, Λ̂(q + (T − 1)r) < S − 69/25000000, strictly below S
[P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 11.47]. Two subclasses, 0.03 ≤ u ≤ 0.0463 with
χ ≤ 7/100, and χ ≤ 1/4, have their own certificates, independent of step 3: the first reviewed [P + C · 11.46], the
second by its author [P author only + C · 11.48], so that the class χ ≤ 1/4 is P + C as a special case of the lemma.

**Around the peak.** With λ = ε/(1891/2500), ε ∈ [0.74, 0.76], 0 ≤ a/λ − 0.5592 ≤ 1/2500 and
0 ≤ b/λ − 0.1432 ≤ 1/800,

    Λ̂(q + (T − 1)r) < S + 9.79·10⁻⁵    for every remote cubic with u ≤ λ²·0.0463 and every remote linear r,

using the weighted scaling of 1.6 with the cost k_λ = 59009/189100 − (λ − 1)·9/25. The exact budget is
9.7888442057·10⁻⁵: a profile loss of 7.8·10⁻⁵, η, and the 3.6·10⁻⁷ between the remote cap and a lower bound of S; at the peak it
reproduces the lemma's budget within 3·10⁻⁹ [P + C · codex-a7c4, re-derived and replayed by claude-b9ee; it inherits
step 3 · 11.53]. The flank and upper rows are outside this rectangle.

This closes the A-shell of Λ̂ at the peak row, at every amplitude. It does not touch the B-shell, the odd sectors, the
other rows, or K itself: for Λ (the tilt s = 0) the remainder and content steps are unproved; numerically the global
remainder margin at s = 0 is 0.320, against 0.362 at s = 3/5 (STATUS 11.37).

Supporting results of the same chain: the circular-mean bound E_θ|1 + te^{iθ}| ≤ 1 + (3/10)t² [P + C · 11.25]; the
global bound 𝒥(q, r) ≤ (1074/625)u − (859/2500)‖r‖² for every remote cubic q and remote linear form r, whose proof
uses only that q and r are square integrable, independent of z₁ and orthogonal [P + C · 11.26]; a
structural bound ‖Π₁[q·h(|q|²)]‖² ≤ (3/4)δ·E m_h(|q|²) for every remote cubic q and every real profile h such that
Φ(x) = x·h(|x|²) and its first two derivatives grow at most polynomially [P · 11.29]; a zero-content class
(q = Σ a_{ij,k}X_iX_j·conj(Y_k) over independent blocks has Π₁[F(q)] = 0 for every F) [P · 11.31]; and a conditional
remainder bound with a Gaussian tail for sectors that only have a restricted Hessian bound [P · 11.32].

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
general cubics the raw content-to-deficit inequality is open [7.1.5].

**Retained B-content.** At the matched tilt s_B = 0.5053·(3/5) = 15159/50000, the centered comparison and the
completed tilted-A content theorem give

    ‖c_{B,s_B}(q)‖² ≤ (1/10)D₊(q) + 443/10⁸     for every remote cubic q with u ≤ 0.0463.

[P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.1.7] This controls the first-order term. The finite-amplitude cost for this
tilt, and the joint A/B cost, remain open.

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

**A retained joint target using the existing content theorem.** Set ρ = 0.5053, s = 3/5,
r_+ = α + ρβ, r_− = β − ρα, S_r = |α|² + |β|² and
h = (T − 1 + s)α + sρβ + z₁²·conj(β)/√2. A sufficient pointwise premise is

    E_{z₁} R(L + w, h) ≤ (p − 0.0926)S_r − 0.67|r_+|² − 0.08|r_−|² + (|w|²/2 + S_r)S_r

for all complex w, α, β, using the remainder function R(V, h) defined above. This premise is **open**. For genuine
cubics, the shared-driver estimates E[|q|²S_r] ≤ 4uV and E[S_r²] ≤ 2V², V = E S_r, carry its quartic correction
into the response domain. The existing tilted-A content theorem with coefficient 0.3, its uniform norm cap 0.02
and the centered error of (2.7) then suffice: under u ≤ 0.0463 and u + V ≤ 0.080051, the premise implies

    Λ̂(q + A + B) < S + 0.00004936.

The implication and its 1,000-cell rational scalar certificate are re-derived and replayed by claude-b9ee
[P + C · codex-a7c4 · 7.4.10]. The target uses the existing content coefficient 0.3. Its exterior holds when
|w|²/2 + S_r ≥ 891/500 by the uniform bound Rem ≤ 2.17 S_r, from a density bound, layer cake and exact polynomial
positivity [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 7.4.10].

The infinitesimal inequality has a uniform reserve 0.01 S_r for 0 ≤ |w| ≤ 2, certified over 61 shift intervals
by removing the inverse-norm singularity in polar coordinates centered at L + w. An exact continuity bound proves
the nonlinear premise (P) whenever sqrt(S_r) ≤ 1/50000, for every complex shift and phase. Two further pieces are
proved: |w|, sqrt(S_r) ≤ 1/10000, and a five-dimensional box around the finite-amplitude local minimum
w ≈ 0.6004, α ≈ 0.3496, β ≈ 0.2023, with absolute defect at most −0.0013909
[P + C, author only · codex-a7c4 · 7.4.11]. Full inverse-distance potential matrices give stronger nonlinear exteriors: (P) holds if |w| ≥ 11/8 or
S_r ≥ 3/4, with continuum covers of 11 and 178 shift intervals respectively [P + C, author only · 7.4.12].
The remaining compact region has |w| ≤ 11/8 and 1/50000 ≤ sqrt(S_r) ≤ sqrt(3)/2, apart from those two pieces.
Its finite-amplitude cover remains **open**. Odd sectors over the joint core are a separate obligation; these
partial interior results do not yield a new Grothendieck lower bound.

### 2.9 The odd sectors

**Zero core.** For O = z₁Q + z̄₁P + d·z₁(T − 2) with Q, P remote L² variables (EQ = 0), v = E|Q|² + E|P|²,
h = 2|d|²:

    Λ(O) ≤ Λ(0) − k₁·v − k₃·h,   (k₁, k₃) = (0.128, 0.330), (0.156, 0.356), (0.166, 0.361)

at the peak, flank and upper rows, at every amplitude [P + C · 5.4]. The displayed values are rounded safe lower
bounds of the coefficients k₁ = p − J₁ and k₃ = p − (J₃ − 4J₂ + 4J₁)/2 (the flank k₃ is 0.35662424897376…). These
unrounded coefficients are sharp on the Q- and d-axes, and they are row-specific: at (0.76, 0.76, 0.16) the cubic (i/100)Z(|Y|² − 1) raises Λ above Λ(0) [P + C · 5.4a]. The pure P
axis has cost at least 0.41 on the whole box, and Λ̂ = Λ there [P + C · 5.4b]; the retained functional keeps the Q
cost and improves k₃ [P + C · 5.4c].

**One coordinate (n = 1).** On the whole box Λ(d·z₁(T − 2)) ≤ 2E|L| − k_*‖d·z₁(T − 2)‖² with the sharp uniform cost
k_* = 0.151676198434561…, so sup Λ on H₂,₁(ℂ) is 2E|L|, attained only at G = 0 [P author only + C · 2.6]; for Λ̂ the
sharp cost is 0.392424545003417… [P + C · 2.6a].

**Remote core.** Over every remote q, each of z₁Q and z̄₁P separately has uniform cost 0.01, 0.03, 0.04 at the peak,
flank and upper rows; the normalised visible cubic ν·z₁(T − 2)/√2 has costs 0.22, 0.24, 0.25. These bounds hold at
every amplitude with arbitrary sharing, for both Λ and Λ̂. Simultaneous raw odd sectors satisfy the sum of these
costs when E[Q | q] = E[P | q] = E[Q·conj(P) | q] = 0; the retained simultaneous conclusion is proved when q and
(Q, P) use disjoint Gaussian blocks and Q, P have their genuine chaos degrees [P + C · codex-a7c4, re-derived and replayed by claude-b9ee ·
7.2.6, 7.2.7]. No A or B shell is present in that base.

**General nonzero core.** By parity (1.7) there is no first-order term and no coupling to the even block; what is needed is a
uniform pure cost Λ(H + O) ≤ Λ(H) − κ_E‖O‖² over genuine even cubic cores H at the required rows [open · 7.2.4]. Within
the odd block, z₁Q and the normalised one-coordinate cubic ν·z₁(T − 2)/√2 interact at a remote base q through

    K = Re ν·E[Re Q·A(|q|)] + Im ν·E[Im Q·B(|q|)],

with two distinct radial kernels A and B (the mixed second derivative is 2K). Both terms vanish at q = 0, because
A(0) = 0 and EQ = 0, but not in general: at q = 0.001·X(|Y|² − 1) the directions (Q, ν) = (|Y|² − 1, 1) and
(i(|Y|² − 1), i) give K < −8·10⁻⁶ and K > 4·10⁻⁶ (numerically −9.32·10⁻⁶ and 4.66·10⁻⁶, also by mixed finite
differences) [P + C, N · codex-a7c4, re-derived and replayed by claude-b9ee · 7.2.5]. A
directional majorant (|X + Y| + |X − Y|)² ≤ 4M − 4c²/M, M = |X|² + |Y|², c = Re(XȲ), is available [P · 7.2.2]. At
one explicit core H and for one specified odd direction O it gives Λ(H + τO) ≤ Λ(H) − 0.063‖τO‖² for
0.03 ≤ |τ| ≤ 0.04 only [analytic reduction P, interval integration R · 7.2.3]; numerically the cost is 0.79 to 1.32
per unit energy on nine cores [N].

### 2.10 Response domains and the central consumer

Only G that come from actual responses enter the row. Put R = √π/2 and let E_q, E_A, E_B, E_Q, E_P, E_ν be the
six sector energies in (1.7), with E_ν = 2|d|². Every actual response, with all sharing allowed, satisfies

    E_q/2 + 2E_A/3 + 4E_B/3 + E_Q + E_P + 8E_ν/7 ≤ ε²(R² − t²).

The proof combines the common-response support inequality with weighted Cauchy–Schwarz; equivalently it is a
weighted Bessel bound with h and k in separate slots [P · codex-a7c4, re-derived by claude-b9ee · 2.12b]. It is a feasibility bound,
not a claim of odd-sector monotonicity.

At ε = 1891/2500, for t ≥ 0.84 the remote cap is 0.046266 [P + C · codex-a7c4, re-derived by
claude-b9ee · 2.12a]. Combining it with the stronger ellipsoid gives total energy below 0.080051; the total is
below 0.070564 for t ≥ 0.8456 and below 0.061366 for t ≥ 0.851 [P + C · codex-a7c4, re-derived and replayed by claude-b9ee · 2.12b]. Without a threshold in t no such cap holds
(chapter 4, item 69). The October manuscript has 25 further response constraints [R · 2.12]. These cuts apply to
responses only: inserting them inside a supremum over all G is invalid, and two penalties that spend the same square
cannot be added.

**Central component.** At the single peak row, an all-sector bound Λ ≤ S + η (for Λ or Λ̂) with η ≤ 10⁻⁴ covers
t ∈ [0.84, 0.851] with cap margin above 6.12·10⁻⁷ below 500/701; separately, the largest admissible allowance there is
η_max = 166713115892493/1656988750000000000 = 0.0001006120988404375…, with no reserve [P + C · 8.1]. The premise is
the open all-sector bound; a remote-only cap does not replace it.

The rest of the consumer is not built: an exact cover of t and of the rows; the σ* = 0 corner if the cover uses it;
interval upper bounds for S at each row; coverage of the energies outside R and of every omitted response region; an
error ledger with exact thresholds; a single witness operator behind rows with different ε. No Lean statement of a
K-consumer exists [open · STATUS §8].

### 2.11 Charging response feasibility to the discarded squares

[P + C · codex-9b17, re-derived and replayed by claude-b9ee in
[review of #433](https://github.com/agalatan/grothendieck-lean/pull/433#issuecomment-6892542529) · 2.12c].
Let H=Z(T−2)/√2 and Σ=‖P₁,₀k‖²+ε‖P₂,₁h+(√2β/ε)H‖².
For every actual bounded response, in every finite dimension and with arbitrary
remote sharing, Σ≥max(0,sup_{λ≥0}J_λ), where

    a(λ)=2(λ+2)/(3λ+4),       n(λ)=8(λ+1)/(7λ+6),
    J_λ=(λ/ε²)[E_q/2+a(λ)E_A+4E_B/3+E_Q+E_P+n(λ)E_ν]
         −λ(π/4−t²)+[ελ/(2(3ε+4λ))](t−4β/ε)².

The exact raw row subtracts this penalty from its Λ expression. At the peak,
t=.8456, E_q=.04, E_A=.03 and all other energies zero pass the existing energy
cuts but force Σ>.009. This compares relaxations, not realizability or a global
endpoint improvement. The weighted Gram proof, square completions and exact row
identity are in [the source proof](sources/response-penalty-2026-11-15-codex-9b17/PROOF.md).

**Retained-compatible extension.** Allocate fractions s,k of the first-chaos
and visible-cubic squares to the new penalty and only the complementary fractions
to another dual. The exact coefficients and proof are in
[the allocation note](sources/response-penalty-2026-11-15-codex-9b17/ALLOCATION.md).
For s=0,k=1, the first-chaos square stays entirely with Λ̂. Writing D for the
weighted energy in 2.10, the remaining h-square is at least

    λ[D/ε²−(π/4−t²)]+[ελ/(2(3ε+4λ))](t−4β/ε)².

At the peak, λ=1/4 makes this exceed 10⁻⁴ on the whole region t≥.8456, D≥.04.
The square-completion algebra, split-budget composition, actual witness-frame
interface and scalar regional inequality are **Lean** (`Lower/ResponsePenalty.lean`,
`LowerAnalytic.VOf_frame_with_penalty`; 2.12d). The new extension awaits independent
review. The Gaussian Gram instantiation and compatible support/cover certificates
remain unformalized. The current production cover has ε=149/200, tracks (t,τ,x)
and has already spent the first-chaos square; its caps cannot simply be reduced
by J_λ. Neither a uniform cap improvement nor a new numerical endpoint follows yet.

## 3. What is open, in priority order

1. **The joint A/B remainder bound at finite amplitude** (2.8), first at the peak row. Enough: the compact box
   0 ≤ x ≤ 29/10, |α|, |β| ≤ 0.4 with reserve 7.53·10⁻⁵ (robust) or 8.07·10⁻⁵ (signed). Alternative: a global
   pointwise cost m for A and B together. Any such m lies below 0.29836…, the local value at the origin, attained
   along a genuine cubic direction (2.8), so a candidate such as 0.29 must be tested away from the origin before any
   certificate. With such an m the A + B gain is a quadratic form in the contents at every amplitude, as step 2 of
   2.6 is for the tilted A-sector.
   *Gives:* the A + B core of K from content bounds.
2. **The raw L4 content inequality** for general cubics on 0.00551 ≤ u ≤ 0.0463, with the constant fixed by item 1
   (0.10 under the adverse joint hypothesis). Pieces: the mixed shells, several self-interacting drivers, the
   envelopes on the self-interaction family. A candidate method is that of step 3 of 2.6: energy-dependent
   δ-coefficients against moment caps and Stein duals in (u, χ). *Gives:* the A-core of K, and with item 1 the
   A + B core.
3. **B-content for general cubics.** The peak alignment reduces it to A-content. *Gives:* the B-sector with its cost.
4. **The odd sectors over a nonzero core**: a uniform pure cost over genuine even cubic cores. Numerically z₁Q and
   z̄₁P keep a pointwise cost of about 0.128 jointly with A and B, while d·z₁(T − 2) needs an argument after
   integration, because its pointwise cross term with z₁Q has the wrong sign; such an argument must keep both coupling
   channels of 2.9, which centring removes only at the zero core. *Gives:* L5 together with items 1–3.
5. **The remote part at the other rows**: certificates for the row envelope beyond the tube and the rectangle around
   the peak; the flank and upper rows are outside both. *Gives:* L1 for the consumer's rows.
6. **The response regions outside R and the consumer**: cover the complementary t regions with a fixed ε, using the
   t-dependent energy caps, and state the consumer in Lean. *Gives:* 1.402 from K_η.
7. **The retained functional Λ̂.** The A-sector is closed at the peak and on a profile rectangle around it (2.6).
   Left: prove the joint remainder premise (P) of 2.8 for |w| ≤ 11/8 and
   1/50000 ≤ sqrt(S_r) ≤ sqrt(3)/2, outside its proved local pieces; its conditional assembly uses the existing tilted-content theorem.
   The other obligations are the odd sectors, the other rows through the weighted scaling of 1.6,
   and more than three remote variables in the numerics. *Gives:* the same conclusion as K_η, with larger margins (chapter 5).
8. **The identity-tail witness** raises the model ceiling to 1.40248 and is untested at certificate level.

The independent audit advises treating this as a bounded research programme with an explicit decision point, not as a
near-complete route to an additional 0.0005.

## 4. Statements known to be false

Each is false as stated; none is a counterexample to K. The numbers are the labels of the ledger (`STATUS.md`,
section 13), where every source is listed.

**Strengthenings and reformulations of K**

- **1. K for every profile.** False for profiles with ℓ − 2β of order 10⁻¹⁰ at tiny norms; no violation on the box
  [R].
- **4. Fibrewise domination at a fixed shift, E|r + q| ≤ E|r + ‖q‖W|.** False for r ≥ 2.5 (+2.2·10⁻³ at r = 2.5): K is
  an averaged statement in the visible variable [R].
- **5. Single-scale strengthenings** (heat kernel, Laplace transform, characteristic function, convex order).
  E e^{−30|H|²} < 1/31 for H = z[(|z|² − 2) + i(|w|² − 1)]/√3 [R].
- **6. Monotonicity along the CLT.** G = c·z₁(|z₂|² − 1) gains 4.9·10⁻⁴ at c = 0.15 [N].
- **78. SEI is preserved by adding any independent symmetric unimodal variable.** X₁ = Z₁Z₂Z₃/3 is SEI, X₁ + U with U
  uniform on [−1, 1] is not (gap ≥ 91/18000). Valid closures: independent Gaussian addition, or two SEI summands with
  symmetric unimodal densities [P + C].
- **80. The diffuse Gaussian attains the cubic supremum in each fixed dimension.** At n = 1 the peak supremum is
  B₀ < S [P].
- **12.3. The degree-5 analogue K₅ holds at its flank rows.** One spike gives +1.55·10⁻⁵ at t ∈ [0.86, 0.88] [N].

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
- **45. ‖Π(q·h)‖ ≤ E[|q|h(|q|²)].** Invalid for Gaussian linear forms; the L² contraction is the valid step [P].
- **74. Character exclusions alone give the weighted bound of the neighbourhood lemma.** Fails for non-cubic L²
  functions; the lemma needs p, h ∈ H₂,₁ [P, author only].

**Sectors and assembly**

- **36. Every sector other than A is pure cost.** B has first-order content (2.7) [P].
- **37. The odd sectors have content of order u.** They have no first-order term (1.7) [P].
- **39. The B-cost holds at every even L² base, so at q + (T − 1)r_A.** Cusp at H = L·sign(Re z₁); a loss of 0.07 on
  both diagonals breaks the 5.5·10⁻⁵ budget [P; package counterexamples R].
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
  (k_Q, k_P, ν) = (i, 0, −i) give local cost below −3/8 [P + C]. Constant Q is not a centred quadratic: the
  integrated zero-core theorem 5.4 stands.
- **70. The odd sectors never raise Λ over the zero core on the whole box; the flank d-cost is 0.36.** The corner
  cubic (i/100)Z(|Y|² − 1) at (0.76, 0.76, 0.16) raises Λ, and (i/100)Z(T − 2) at the flank violates the cost 0.36
  [P + C].
- **73. Retaining the first-chaos correction restores full-box odd nonincrease.** The corner cubic of item 70 raises Λ̂
  as well [P + C]. The flank example concerns Λ only: the retained flank d-cost exceeds 0.525048300689048 per unit
  cubic energy.
- **71. Parity implies differentiability at every even L² base.** H = L·sign(Re z₁) has a cusp along Z(T − 2) [P].
- **38. Over a nonzero core the odd sectors obey the inverse-norm condition E[|O|²/|L + H|] ≤ (1/ε − κ_E)‖O‖².** Fails
  even with κ_E = 0 at an explicit core [R].
- **86. Over a nonzero core the Q/ν coupling has one Hermitian radial kernel.** It has two channels, with opposite
  signs on a genuine cubic witness (2.9) [P + C].
- **19. The local matrix of the retained functional (tied multiplier) plus I/10 is a global majorant.** Violated by
  more than 97/1000 at an explicit point [R].
- **47–49. Decoupling, (EC)/(PH)/(PG) and a uniform fibre bound for the even sectors.** False by up to 5.7·10⁻³, or
  with eigenvalues 1.3395 and 1.7095 above p [N, R].
- **50. Subtracting the first-chaos penalty at the unpenalised best response bounds the retained supremum.** The
  maximisers readjust; the valid object is the dual Λ̂ [N].
- **11.6. A weighted cubic contraction is nonnegative.** q = X[5(|X|² − 2) + 6i(|Y|² − 1)]/√86 makes it below −1/50
  [R].

**Response side**

- **69. The total response energy is below 0.072.** It needs t ≥ 0.8456; at t ≥ 0.84 the cap is 0.081884, and a
  response at t = 0 has energy above 0.09 [P + C].

The ledger lists the remaining items (2, 3, 7, 8, 46, 59) and, in its section 14, the routes that do not work: the
fourth-moment envelopes (saturated at w ≈ 0.0112), leading-order and Taylor control of the content (finite amplitude
is essential), buffer insertion by Jensen, proofs from the law of the residual alone, the fixed moment bank for the
augmented remote certificate, Cauchy–Schwarz through the law of |q|² alone, and others.

## 5. Numerical evidence

All numbers here are floating point at the peak row (**N**). A search gives lower bounds on a supremum, not upper
bounds; each table names its limits.

**No violation of K.** Exhaustive searches over H₂,₁(ℂ²) and H₂,₁(ℂ³) with a diffuse part, scale mixtures, full
tensors in dimensions 3 to 5 at the three rows (every candidate below S on 2·10⁷ fresh samples), and all six sectors
over H₂,₁(ℂ²) with 18 shells [2.3].

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

**The tilted content certificate against the truth.** The true coefficients behind 11.49 are 0.0468 down to 0.0321
against the certified 0.0502 down to 0.0325; on 1,298 tensors of the Gaussian-to-monomial family and 288 random
two-variable cubics the comparison of 11.50 holds with the largest C²/(0.3D) equal to 0.040 [11.49, 11.50]. On the
Wick monomial D/δ falls from 0.73 at u = 0.0005 to 0.13 at u = 0.0463, which is why bounds through δ need
energy-dependent coefficients [11.29].

**Pointwise remainders of other sectors** (smallest sampled p − Rem/|r|², which would be a global cost if certified):

| sectors | K | tilt (0.6, 0) |
|---|---|---|
| A alone | 0.320 | 0.362 (certified: at least 0.312, 2.6) |
| A and B together | at most 0.29836 (the sharp local value at the origin, 2.8) | 0.252 |
| B alone | 0.706 | |
| A, B, z₁Q, z̄₁P | 0.128 | |
| with d·z₁(T − 2) | fails pointwise (−0.387) | |

[11.37, 11.45, 7.4.9] The second derivative along the sector, unlike the remainder, exceeds the budget without a
restriction on the amplitude at every tilt tried [11.17].

**Identity tail.** The cubic head with a constant tail ν reaches the model norm 0.713021 (1.402483) at ε = 0.7681,
ν = 0.0235, against 0.713136 (1.402257) without the tail [STATUS §10].

## 6. Where everything is

| chapter | ledger rows (`STATUS.md`) | sources (under `sources/`) | checkers (under `code/`) |
|---|---|---|---|
| 1.2–1.5 setting, budget | 2.1–2.5, 8.1–8.4, 12.1, 12.2 | `audit-2026-11-13/`, `reaudit-2026-11-15-codex-a7c4/FOUNDATIONS.md`, `manuscript/MANUSCRIPT_DIGEST_K.md` | `reaudit-2026-11-15-codex-a7c4/` |
| 1.6 retained functional | 2.10, 2.10a, 2.13, 2.14, 3.16, 3.17, 11.2–11.13 | `external-2026-11-15/`, `numerics-kprime-2026-11-15/`, `fifth-audit-2026-11-15-codex-a7c4/FOUNDATIONS.md`, `sixth-audit-2026-11-15-codex-a7c4/FOUNDATIONS.md`, `manuscript/legacy/ch20-pinned-gate.tex` | `kprime-2026-11-15/`, `fifth-audit-2026-11-15-codex-a7c4/`, `sixth-audit-2026-11-15-codex-a7c4/` |
| 1.7–1.8 sectors, cubics | 2.7–2.9, 3.4 | `third-audit-2026-11-15-codex-a7c4/CONTENT_KERNELS.md`, `reaudit-2026-11-15-codex-a7c4/SECTORS.md` | `third-audit-2026-11-15-codex-a7c4/` |
| 2.1 remote part | 3.1–3.16, 11.7–11.11 | `audit-2026-11-15-codex-a7c4/REMOTE.md`, `reaudit-…/REMOTE.md`, `fourth-audit-…/REMOTE.md`, `fourth-audit-…/REFORMULATIONS.md` | `audit-2026-11-15-codex-a7c4/`, `fourth-audit-2026-11-15-codex-a7c4/` |
| 2.2–2.3 disjoint drivers, Theorems A and B | 4.1, 4.2, 5.1–5.5 | `third-audit-…/POTENTIAL.md`, `audit-2026-11-13/ADDITIONAL_ANALYTIC_AUDIT.md`, `audit-2026-11-15-codex-a7c4/CLAIMS.md` | `third-audit-2026-11-15-codex-a7c4/` |
| 2.4–2.5 shared drivers, content | 6.1.1–6.5.1 | `fourth-audit-…/CONTENT.md`, `audit-2026-11-13/CERTIFICATE_AUDIT.md`, `received-2026-11-05/`, `sixth-audit-…/OBSTRUCTION.md` | `fourth-audit-2026-11-15-codex-a7c4/`, `audit-2026-11-13/`, `sixth-audit-…/gaussian_obstruction.py` |
| 2.6 tilted lemma, retained A-core | 11.25–11.54 | `received-2026-11-15-tilted-sector/` (`REPORT.md`, `deficit_*_proof.md`, `secant_*.md`, `REVIEW_3.md`, `REVIEW_4.md`); `fifth-audit-…/REMOTE.md`; `sixth-audit-…/REMOTE.md` | `tilted-sector-2026-11-15/` (`verify.py`); `fifth-audit-…/remote_augmented.py`; `sixth-audit-…/retained_profile_transfer.py` |
| 2.7–2.8 B-sector, joint form | 7.1.1–7.4.9 | `third-audit-…/ALIGNMENT.md`, `fourth-audit-…/JOINT.md`, `fifth-audit-…/JOINT.md`, `audit-2026-11-13/ASSEMBLY_AUDIT.md`, `improvement_joint_tail.md` | `fourth-audit-…/joint_reduction.py`, `fifth-audit-…/joint_tail.py` |
| 2.9 odd sectors | 2.6, 2.6a, 5.4–5.4c, 7.2.2–7.2.5 | `audit-2026-11-15-codex-a7c4/ODD_COST.md`, `reaudit-…/SECTORS.md`, `third-audit-…/SECTORS.md`, `sixth-audit-…/JOINT.md` | `audit-2026-11-15-codex-a7c4/`, `reaudit-…/`, `third-audit-…/`, `sixth-audit-…/odd_coupling.py` |
| 2.10 response, consumer | 2.12, 2.12a, 8.1 | `reaudit-…/FOUNDATIONS.md`, `manuscript/legacy/ch25-parts/` | `reaudit-…/foundations_exact.py` |
| 3 open problems | section 15 | the audits above | |
| 4 false statements | section 13 (and 14) | as cited there | |
| 5 numerics | sections 9, 10, 11 (c), 2.3 | `numerics-kscan-2026-11-13/`, `numerics-tailgames-2026-11-14/`, `numerics-kprime-2026-11-15/`, `audit-2026-11-13/REPORT.md` §5 | `kscan-2026-11-13/`, `tailgames-2026-11-14/`, `kprime-2026-11-15/`, `audit-2026-11-13/` |

Everything outside the repository (zips, large certificates, logs) is listed with hashes in
[`INVENTORY.md`](INVENTORY.md). The folder's [`README.md`](README.md) indexes every file, and the October manuscript is
read through [`sources/manuscript/MANUSCRIPT_DIGEST_K.md`](sources/manuscript/MANUSCRIPT_DIGEST_K.md).
