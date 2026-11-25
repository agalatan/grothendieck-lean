# P1. The first-chaos content of a cubic chaos element against its fourth cumulant, on an energy band

**Summary.** For q in the complex Wick chaos H₂,₁ (any dimension) and an explicit radial profile h, bound the first
chaos part of q·h(|q|²) by θ(u)·δ·Ω̂[h], where δ is the fourth cumulant of |q|, Ω̂ a functional of the law of |q|,
and θ(u) a given allowance depending on the energy u = E|q|²; this is asked for eleven profiles pairs, on a band of
energies each, and only for q that satisfy an explicit side condition. **The statement is open in both directions**:
the largest ratio found is 1.3 to 12 times below the allowance, but it grows with the number of variables, and on
the hardest rows the allowance may be optimistic (see §2.4). A proof, a counterexample, or a proof on a class that
contains the known extremal structures are all wanted.

Source record (not needed to do the work): ledger rows 4.19, 4.28–4.32 and §5 item 2 of
`research/higher-degree/STATUS.md`; the earlier problem statement
`research/higher-degree/sources/content-problem-v2-2026-11-16/PROBLEM_V3.md` (longer tables of searches); profile
files under `research/higher-degree/code/degree5-content/` (repository `agalatan/grothendieck-lean`, master). Search
scripts that are not in the repository are copied to
`research/higher-degree/code/degree5-attack/ref/`.

Labels: **P** proved on paper, **C** certified by exact or interval arithmetic, **N** floating point (a search gives
a lower bound of a supremum, never an upper bound); "author only" when nobody but the author has checked it.

---

## 1. Setting and notation

**Gaussian space.** y = (y₁, …, y_n): independent standard complex Gaussians (density π⁻¹e^{−|y|²}; E|y_j|² = 1,
E y_j² = 0). n is arbitrary. ⟨f, g⟩ = E[conj(f)·g].

**Chaos.** H_{a,b} is the closed span of the Wick polynomials of holomorphic degree a and antiholomorphic degree b.
An orthonormal basis of H₂,₁(ℂⁿ): y_i(|y_i|² − 2)/√2; y_i²ȳ_k/√2 (k ≠ i); y_a(|y_b|² − 1) (a ≠ b); y_i y_j ȳ_k (i < j,
k ∉ {i, j}). H₁,₀ is the span of y₁, …, y_n and Π₁ the orthogonal projection onto it.

**The cubic and its scalars.** q ∈ H₂,₁(ℂⁿ) ("remote cubic"). V = |q|², u = E V (the energy),
δ = E V² − 2u² ≥ 0 (the fourth cumulant of the circular variable q), χ = δ/u² ∈ [0, 42] (P; χ = 42 exactly for the
*junta* H(X) = X(|X|² − 2)/√2).

**Profiles and their transforms.** A profile is a real, bounded, continuous h on [0, ∞). With τ ~ Exp(1)
independent of everything:

    k(v) = E h(v + u·τ)        (so k − u·k′ = h, i.e. k′(v) = (k(v) − h(v))/u).

**Content.** c[h] = Π₁[q·h(V)], i.e. the vector with components c_j = E[ȳ_j·q·h(V)]; ‖c[h]‖² = Σ_j|c_j|².

**The law functional** (it depends on q only through the law of V):

    Ω̂[h] = (3/2)·E[V·k′(V)²] − (3/4)·(E[V·k′(V)])²/u.

**Ratio.** r_h(q) = ‖c[h]‖²/(δ·Ω̂[h]); invariant under unitary changes of y.

**The response function.** ρ(x) = E|Z + √x| for a standard complex Gaussian Z:
ρ(x) = (√π/2)·e^{−x/2}·[(1 + x)·I₀(x/2) + x·I₁(x/2)] (modified Bessel functions). ε₁ = 39/50.

### 1.1 The row profiles

A *row* is five real numbers (ℓ, β, b_A, b_B, ν₅). With z a standard complex Gaussian, T = |z|²,
e₁₁ = T − 1, e₂₀ = z²/√2, e₃₂ = z(T² − 6T + 6)/√12 and ph(a) = a/|a|:

    L′(z) = z(ℓ + β(T − 2)) + ν₅·e₃₂(z),    D(z) = 1 − b_A·e₁₁(z) − b_B·e₂₀(z),    A_±(z; s) = L′(z) ± s·D(z)   (s ≥ 0),
    Γ_A(s) = Re E_z[conj(e₁₁)·(ph A₊ − ph A₋)],   Γ_B(s) = Re E_z[conj(e₂₀)·(ph A₊ − ph A₋)],   Γ₀(s) = Re E_z[ph A₊ − ph A₋],
    G_A = Γ_A + (2/5)·Γ₀,     G_B = Γ_B + (3/10)·Γ₀,     h_X(v) = G_X(√v)/√v     (X = A, B).

So h_A and h_B are explicit two-dimensional integrals; there is no closed form. Tables: each JSON file below has
`row` (the five numbers: keys `l`, `beta`, `bA`, `bB`, `nu5`), `S` (705 amplitudes in [0, 6]), `GA`, `GB`, `G0` (Γ_A,
Γ_B, Γ₀ on `S`), `ustar` (the reference energy u\*), and for the covering rows also the derivatives `dGA`, `dGB`,
`dG0`, the cap `ucap`, `t_lo`, and the list `allowance` (θ_room(u) at 17–19 energies with the binding χ).

- Band rows (six files): `research/higher-degree/code/degree5-content/profiles/band_row_<t>.json`,
  t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855.
- Covering rows (five files): `research/higher-degree/code/degree5-content/profiles_low/band_row_<t>.json`,
  t = 0.70, 0.72, 0.74, 0.76, 0.78. The label is the *piece* of the parameter t that the file serves; the row inside
  is tuned at a larger value (0.79, 0.79, 0.80, 0.81, 0.82).

**How to evaluate.** Interpolate `GA + 0.4·G0` (or `GB + 0.3·G0`) by a cubic spline in s on [0, 6]; beyond s = 6 use
the constant G_X(6) (0.787 and 0.615 on the row of the piece 0.70). h_X(0) = G_X′(0) (−0.483 for h_A there: h_A is
negative near 0, changes sign near s ≈ 0.5 and decays like const/√v). The tables agree with the
definitions to 3·10⁻⁵ (checked for this file on two rows with an independent quadrature). For rigorous work use the
definitions, not the tables.

---

## 2. The statement

### 2.1 Target on the covering rows (the binding one)

For each of the five files of `profiles_low/`, with its `t_lo`, `ucap` and `allowance`:

> **(T-low).** For every n, every q ∈ H₂,₁(ℂⁿ) with u = E|q|² ∈ [0.30·`ucap`, `ucap`] that satisfies the response
> restriction
>
>     E ρ(λ²·|q|²) ≥ t_lo + λ·u/ε₁        for all λ > 0,                                               (R1)
>
> and both profiles h ∈ {h_A, h_B} of the file:
>
>     ‖Π₁[q·h(|q|²)]‖² ≤ θ_room(u)·δ(q)·Ω̂[h],
>
> where θ_room(u) is the piecewise-linear interpolation of the file's list `allowance` (and no condition where the
> list has `null`: there no q satisfies (R1)).

| piece | row tuned at | u\* | t_lo | ucap/u\* | band minimum of θ_room | at u/u\* | first two entries of the list | last energy with a possible q |
|---|---|---|---|---|---|---|---|---|
| 0.78 | 0.82 | 0.068249 | 0.7749 | 1.724 | 0.5232 | 1.448 | 5.90 at 0.52u\*, 2.02 at 0.69u\* | 1.586u\* |
| 0.76 | 0.81 | 0.078121 | 0.7549 | 1.776 | 0.4000 | 1.492 | 3.93 at 0.53u\*, 1.42 at 0.71u\* | 1.650u\* |
| 0.74 | 0.80 | 0.087869 | 0.7349 | 1.818 | 0.3141 | 1.455 | 2.60 at 0.55u\*, 1.00 at 0.73u\* | 1.673u\* |
| 0.72 | 0.79 | 0.097518 | 0.7149 | 1.854 | 0.2587 | 1.500 | 1.73 at 0.56u\*, 0.71 at 0.74u\* | 1.706u\* |
| 0.70 | 0.79 | 0.097518 | 0.6949 | 2.070 | 0.2190 | 1.612 | 0.855 at 0.62u\*, 0.455 at 0.83u\* | 1.822u\* |

The lists start at 0.30·`ucap`. Below that energy the record has no allowance for the covering rows (on the band
rows the proved bound of §3.2 alone suffices below u₀; the corresponding energy for the covers was not computed).
Above the last column no law of |q|² in the certificate's law class satisfies (R1).

(The cap is `ucap` = 4ε₁²·B·(A − t_lo) with A = 0.88676278, B = 0.432306903, the tangent ρ(x) ≤ A + Bx inserted in (R1);
checked for this file. θ_room is nearly flat within ±0.1u\* of its minimum and rises steeply below.)

### 2.2 Target on the six band rows

> **(T).** For each band row, every n, every q ∈ H₂,₁(ℂⁿ) with u ∈ [u₀, u_cap] and both profiles:
> ‖Π₁[q·h(|q|²)]‖² ≤ θ_t·max(1, u\*/u)^{1.8}·δ·Ω̂[h]. The restriction (R1) with the row's t_lo may be assumed.

| row | u\* | u₀/u\* | u_cap/u\* | θ_t | t_lo |
|---|---|---|---|---|---|
| 0.80 | 0.087859 | 0.37 | 1.22 | 0.36 | 0.7850 |
| 0.82 | 0.068255 | 0.43 | 1.16 | 0.64 | 0.8117 |
| 0.84 | 0.048151 | 0.54 | 1.14 | 1.33 | 0.8348 |
| 0.845 | 0.043055 | 0.58 | 1.08 | 1.88 | 0.8424 |
| 0.85 | 0.037940 | 0.63 | 1.09 | 2.5 | 0.8476 |
| 0.855 | 0.032796 | 0.70 | 1.11 | 3.7 | 0.8523 |

The rows 0.84–0.855 are the ones the final certificate certainly uses with these profiles; the rows 0.80 and 0.82
may be replaced by covers (for the piece 0.80 a row tuned at 0.82 has band minimum 0.72 instead of 0.36).

### 2.3 What is not needed

Energies outside the band; one constant for all energies (false, §4); statements for all profiles; the supremum
over directions in any intermediate bound; q that violate (R1).

### 2.4 The weakest version that suffices, and a warning about the allowances

- θ_room(u) is the largest constant for which this inequality, inserted in a convex program over laws of V
  together with one proved bound, keeps a row of a certificate inside its error budget. It is a floating-point
  output (N) and it is *sufficient, not necessary*: a different argument for the same row might need less. Any
  bound of ‖c[h]‖² by θ_room(u)·δ times a functional of the law of V and the row data would do.
- **The allowances scale (to first approximation proportionally) with a constant μ, the "A/B margin", that was
  taken at its zero-amplitude value**
  (0.351, 0.351, 0.367, 0.384, 0.400 for the five covering rows; key `mu` of the files). A global inequality with a
  constant margin holds only with about 0.60–0.66 of those values (N, computed for this file; problem P2 of this
  set is about recovering the difference; with the refined inequality proposed there the loss would be an
  estimated 5–20 % instead). In the worst case every θ_room of §2.1 must be multiplied by 0.60–0.66: the band
  minimum for the piece 0.70 would then be about 0.13, **below** the largest ratio found (0.165).
  So: a proof of (T-low) with room to spare (a factor 1.6 or more) is worth much more than one that just meets the
  table, and a method is worth more than a constant. State your result as "ratio ≤ F(row, u)" so that it can be
  compared with whatever allowance the final certificate has.
- The game behind the rows may change (a variant raises every allowance by about 12 %).

---

## 3. What is known

### 3.1 Numerics (N): the largest ratio found, sector A (sector B is lower in every case run)

| target | allowance at the binding energy | largest ratio found among q satisfying (R1) | where | factor |
|---|---|---|---|---|
| piece 0.70 | 0.2190 (1.612u\*); 0.2323 (1.449u\*) | 0.1650; 0.1787 | three clusters of 8 variables, n = 25 | 1.33; **1.30** |
| piece 0.72 | 0.2587 | 0.1749 | same family | 1.48 (1.44 at 1.40u\*) |
| piece 0.74 | 0.3141 | 0.1962 | same | 1.60 |
| piece 0.76 | 0.4000 | 0.2167 | same | 1.85 |
| piece 0.78 | 0.5232 | 0.2417 | same | 2.17 |
| row 0.80 | 0.36 at u\*; 0.49 at 0.85u\* | 0.2508; 0.2766 | same, n = 25 | 1.44; 1.76 |
| row 0.82 | 0.66; 0.91 | 0.3010; 0.3314 | three clusters of 6 / 4 | 2.2; 2.7 |
| rows 0.84–0.855 | 1.44–4.1 at u\*; 2.2–6.3 at 0.85u\* | 0.38–0.48; 0.42–0.52 | three clusters of 4 | 3.8–8.5; 5.2–12 |

- **Growth with the number of variables.** Row 0.80 at 0.85u\*, largest value found with at most n variables,
  n = 2, …, 13: 0.1595, 0.1925, 0.2105, 0.2246, 0.2386, 0.2483, 0.2532, 0.2575, 0.2588, 0.2630, 0.2666, 0.2756
  (searches over all of H₂,₁(ℂⁿ) for n ≤ 8, reduced families beyond). The three-cluster family for
  c = 4, …, 10 clusters size (n = 13, …, 31): 0.2743, 0.2736, 0.2758, 0.2743, 0.2766, 0.2734, 0.2724: flat. The data end
  at n = 31 and are from hand-chosen families for n ≥ 9; a larger value at some n is not excluded.
- **The shape of the maximisers.** With X the content direction and y the other variables:
  q = a·X(|X|² − 2)/√2 + X·Q(y) + R₃(y), Q(y) = Σ_j m_j(|y_j|² − 1) with complex m_j of positive real part, clustered
  in groups of equal values, and R₃ a cubic in y alone made of monomials y_a y_b ȳ_c whose three variables lie in
  three different clusters. Energy shares at n = 6: junta 0.12, X·Q 0.38, R₃ 0.50. Given y, q is a Gaussian in X with
  a non-zero conditional mean R₃(y), and |R₃|² is positively correlated with the cofactor Q
  (Cov(Q, |R₃|²) = Σ_j m_j·K_jj > 0). Replacing R₃(y) by an independent copy lowers the ratio by 17–48 %. χ of the
  maximisers falls with n (14.8 at n = 2, 2.1 at n = 13, 1.8 at n = 13 on the cover of 0.70).
- **Three clusters reduce to a one-dimensional law** (P; see problem P5 of this set, which is that special case).
- **Reproduced for this file:** the junta on the row 0.80: ‖c[h_A]‖²/δ = 0.01358, 0.01153, 0.00990 and Ω̂ = 0.10828,
  0.11542, 0.11993 at u/u\* = 0.7, 0.85, 1 (ratios 0.125, 0.100, 0.083); on the cover of the piece 0.70 the junta has
  ratio 0.0677, 0.0457, 0.0404 (h_A) and 0.0475, 0.0294, 0.0251 (h_B) at u/u\* = 1.035, 1.449, 1.612; the stored
  three-cluster cubic with c = 4 on that cover at 1.612u\*: 0.1594 (formula), 0.1609 (direct, two samples 0.1606,
  0.1611), satisfying (R1) with margin 0.717 against t_lo = 0.6949.

### 3.2 Proved (P unless said), all for every profile and every energy

- Two representations of the content from one Gaussian integration by parts (E[G·q] = Σ_j E[∂_jG·∂̄_jq] for
  q ∈ H₂,₁). With F_k = ∂̄_k q, a = Σ_j ∂_jq·F_j, c₂ = Σ_k|F_k|² (E c₂ = u), y_e = Σ e_j y_j:
  (I) c_e[h] = E[ȳ_e·k′(V)·(q̄·a + q·(c₂ − u))], hence |c_e|² ≤ δ·Ω_e with
  Ω_e = ‖P₂,₀G_e‖² + ¼‖P₃,₁G_e‖² + ½‖P₁,₁G′_e‖² + ½‖P₂,₂G′_e‖², G_e = y_e·q·k′(V), G′_e = y_e·q̄·k′(V), using the budget
  δ = ‖P₂,₀(q²)‖² + ‖P₃,₁(q²)‖² + 2‖c₂ − u‖². A second, "local" representation (II) uses k(v, c) = E h(v + cτ) at
  c = c₂ and the budget δ − 2‖c₂ − u‖².
- Class theorems (for *every* profile and energy): r_h ≤ 77/(9(m + 3)) for q = √u·X·m^{−1/2}Σ_{j≤m}(|Y_j|² − 1);
  r_h ≤ 5/3 for conditionally Gaussian cubics Σ_j X_j·(Y\*A_jY − tr A_j) + Σ_j Z̄_jF_j(U); r_h ≤ 209/126 for
  X·(Y\*AY − tr A) with A Hermitian; 6/11 and 173/594 for shared matrix blocks of size 2 and ≥ 3. Common hypothesis:
  every driver enters linearly and is independent of its cofactor (no term X|X|², X²ȳ, |X|²y). The maximisers of
  §3.1 are outside all of them.
- A limit model: for Q = αX(|X|² − 2) + βW with an independent Gaussian W, |E[X̄Q·h(|Q|²)]|² ≤ θ·168α⁴·Ω̂ with
  θ = 7/20, …, 18/5 for α/β ≤ 11/100, …, 3/5 (P + C). No finite-dimensional statement follows.
- A bound from two derivatives (P, author only): ‖Π₁[q·h(V)]‖ ≤ √(2u·Var a(V)) + √(u·E[V²h′(V)²]), a = h + V·h′. It
  is the "one proved bound" that θ_room already uses; it has a Gaussian floor (it does not vanish when q becomes
  Gaussian) and suffices alone only for u ≤ u₀.
- The sharp profile-free constant for a given q and direction e:
  θ\*(q, e) = (2/(3δ))·(E[|M_e(V)|²/V] + |E M_e(V)|²/u), M_e(v) = E[ȳ_e(q̄a + q(c₂ − u)) | V = v].

### 3.3 Counterexamples to stronger statements (exact unless said)

- **One constant for all energies:** as u → 0 the ratio tends to that of h(v) = v, which is 256/63 on the junta and
  16/(3(m + 3)) on X·P_m; these exceed θ_t on most rows.
- **Rows tuned at t itself for the pieces t ≤ 0.74** (not part of this problem): their allowances 0.160, 0.114,
  0.085 are exceeded by cubics satisfying (R1) (0.171, 0.148, 0.131; N). This is why covering rows are used.
- **Relaxing a driver's cofactor to an arbitrary centred law:** q = X·Z with Z two-valued gives ratio 2.19 on the
  row 0.80 (allowance 0.36). With the Cauchy–Schwarz moment constraints that every second-chaos cofactor
  satisfies, the relaxed supremum is still ≥ 0.82 there (N).
- **The bounds (I), (II) at the content direction** exceed the allowance of the row 0.80 on explicit two- and
  three-variable cubics (e.g. per unit δ at u\*: allowance 0.0416, (I) = 0.0478 on
  √u·X·(0.63·(|X|² − 2)/√2 + 0.777·e^{iπ/3}·(|Y|² − 1)); N). On the rows 0.84–0.855 they stay below it by factors
  1.7–6.0 on all test cubics.

---

## 4. Why the obvious approaches fail

- **Profile-free constants** cannot reach a self-interaction term: any bound valid for all profiles is at least
  the value at h(v) = v, i.e. 256/63 on the junta.
- **The supremum over directions e** in (I) or (II) is attained on cubics with zero content (X²Ȳ), where it reaches
  1.54·Ω̂.
- **Law-free corollaries** (‖c‖² ≤ (3/2)·sup_v(v·k′(v)²)·δ) are 2.8–4.9 times Ω̂; **Bessel forms** that relax the
  coupling of |y_e|² and V about 3–4.5 times Ω̂: the projections in Ω_e are essential.
- **Splitting q at its content direction** into a self-interaction part and a cofactor part: proved as an
  inequality, never better than (I).
- **Bounds of order δ^{3/2}** cover χ ≤ 10⁻⁷–3·10⁻⁵; the hard cases have χ = 2–42.
- **Compression to finitely many variables** has absolute errors of order 1/√m: unusable.
- **Perturbation from the direction-independent case** (Ω_e ≤ Ω̂ when q does not depend on y_e): the cubic part of
  q·k′(V) alone gives Ω_e up to 5 times its Gaussian value; the truth is small through a cancellation with the
  quintic part.
- **A bound on the kurtosis of the cofactor** is not enough (the two-point example); third-moment or Stein-type
  information on second-chaos variables is needed.

---

## 5. Suggested approaches

- **Decide the dimension question first.** Either find q (any n) above the allowance on a covering row, or
  identify what bounds the ratio as n grows. The three-cluster reduction (P5) shows the mechanism: the ratio
  depends on the bulk only through the law of one scalar whose second moment κ is bounded below by 2c/(c + 1).
  Is there a family outside the hypotheses (H1), (H2) of that reduction (unequal eigenvalues inside a cluster,
  more clusters, bulk monomials with repeated clusters) with a larger ratio at large n?
- **A same-law argument.** The inequality compares two functionals of q through the law of V and one direction.
  Conditioning on the cofactor variables makes q an affine function of the driver X with a random mean and a
  random variance; the content along X is then E over (mean, variance) of an explicit two-dimensional Gaussian
  integral of h. A proof could bound that integral by the conditional contribution to δ·Ω̂ and then control the
  joint law of (cofactor, |R₃|²) by chaos constraints (third cumulants, positive correlation bounds, the κ bound).
- **Rows 0.84–0.855 first.** There a certified majorant Ω_{e\*} ≤ θ·Ω̂ at the content direction e\* (or its local
  variant) with θ up to 1.33–3.7 suffices; the measured Ω_{e\*}/Ω̂ is at most 0.95–1.04.
- **Certified computation.** Any reduction to finitely many parameters must be a proof; after it, interval
  arithmetic over a compactified parameter domain with analytic exteriors is acceptable (this is how the
  analogous pointwise premise at degree 3 was closed: a cover of ℂ³ modulo symmetry by about 1.2·10⁶ boxes, C++
  with outward rounding, an exact rational verifier and negative controls). The profiles must then be enclosed
  from their definitions (two-dimensional integrals of ph of a polynomial), not read from the tables.

---

## 6. Deliverable

- A note with every step checkable: the class of q covered (all of H₂,₁, or a named class), the rows, the band, and
  the bound obtained as an explicit function of (row, u), compared with θ_room(u).
- Every number the proof uses produced by a script delivered with it, in exact rational or interval arithmetic
  (python-flint/Arb, or C++ with outward rounding and an exact verifier); negative controls (the same machinery
  must reject the allowance of an own row, e.g. 0.085 at the piece 0.70, and must reject one constant for all
  energies).
- For a counterexample: the cubic as a list of coefficients in the orthonormal basis of §1, its energy, a
  verification of (R1), and the three integrals with error estimates from two independent quadratures (δ exactly).
- Labels "P, author only", "C, author only", "N".

---

## 7. How to test a claimed inequality

Everything below needs numpy and scipy only. Run from the repository root; the profiles are in `research/higher-degree/code/degree5-content/` and the scripts in `research/higher-degree/code/degree5-attack/ref/`.

1. **The junta** (one-dimensional; must print 0.01540, 0.06732, 0.2287 on the row 0.84 at 0.85u\*):

```python
import json, numpy as np
from scipy.interpolate import CubicSpline
from numpy.polynomial.laguerre import laggauss
from numpy.polynomial.legendre import leggauss
d = json.load(open('research/higher-degree/code/degree5-content/profiles/band_row_0.84.json')); S = np.array(d['S'])
GA = CubicSpline(S, np.array(d['GA']) + 0.4 * np.array(d['G0']))          # sector A; sector B: GB + 0.3 G0
def h(v):
    s = np.sqrt(np.maximum(v, 1e-18)); return GA(np.minimum(s, 6.0)) / s
tau, w = laggauss(64); u = 0.85 * d['ustar']
kp = lambda v: (np.array([w @ h(x + u * tau) for x in np.atleast_1d(v)]) - h(np.atleast_1d(v))) / u
x, wx = leggauss(40); T = []; W = []
for a, b in zip([0, .5, 1, 1.5, 2, 2.5, 3, 4, 6, 9, 14, 22, 34], [.5, 1, 1.5, 2, 2.5, 3, 4, 6, 9, 14, 22, 34, 60]):
    T.append((b - a) / 2 * x + (a + b) / 2); W.append((b - a) / 2 * wx)
T = np.concatenate(T); W = np.concatenate(W) * np.exp(-T); V = u * T * (T - 2) ** 2 / 2   # q = sqrt(u) H(X)
c = np.sqrt(u) * (W @ (T * (T - 2) / np.sqrt(2) * h(V))); K = kp(V)
Om = 1.5 * (W @ (V * K ** 2)) - 0.75 * (W @ (V * K)) ** 2 / u
print(c ** 2 / (42 * u * u), Om, c ** 2 / (42 * u * u * Om))                # content^2/delta, Omega-hat, ratio
```

2. **Two-variable test cubics** (all of norm √u; a three-dimensional quadrature): √u·X(|Y|² − 1) (χ = 16);
   √u·(H(X) + H(Y))/√2 (χ = 21; content direction (X + Y)/√2);
   √u·X·(0.63·(|X|² − 2)/√2 + 0.777·e^{iπ/3}(|Y|² − 1)) (χ = 16.02; close to the two-variable maximum). Reference, row
   0.80 at 0.85u\*, sector A, per unit δ: ‖c‖²/δ = 0.01025, 0.01427, 0.01773 and Ω̂ = 0.09141, 0.10912, 0.11241.
3. **The adversarial family.** `python3 research/higher-degree/code/degree5-attack/ref/kappa.py formula 0.70 1.612 4 research/higher-degree/code/degree5-attack/ref/bulk/bulk_c4.json research/higher-degree/code/degree5-content/profiles_low/ --direct`
   evaluates the stored three-cluster cubic (13 variables, quasi-Monte-Carlo with 2²¹ points; two minutes):
   it must print about 0.159 for the formula and 0.1609 for the direct evaluation, "a possible response".
   `research/higher-degree/code/degree5-attack/ref/bulk/bulk_c<c>.json`, c = 2, …, 10, hold the bulks; `research/higher-degree/code/degree5-attack/ref/bipartite.py` and `research/higher-degree/code/degree5-attack/ref/clusters.py` search the
   reduced families (their headers give usage and reference values).
4. **(R1).** For a candidate q evaluate min over λ ∈ [0.1, 8] of [E ρ(λ²V) − λu/ε₁] and compare with t_lo. For a
   Gaussian q, E ρ(λ²uτ) = (√π/2)·√(1 + λ²u) and the minimum is √(π/4 − u/ε₁²), so (R1) reads u ≤ ε₁²(π/4 − t_lo²)
   (use this to test the code).
5. **Accuracy.** δ must be computed exactly (q as a polynomial; E y^a ȳ^b = a!·[a = b]). For n ≥ 4 the value on the
   sample used by an optimiser is biased upward by 1–8 %; quote only the value of the returned cubic on an
   independent sample.
