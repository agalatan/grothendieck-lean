<!-- Copy of the problem statement prepared for outside sessions on 16 November 2026 (text by claude-b9ee and its content worker; the numbers were checked by the worker against its logs). Its kit/ is ../../code/degree5-content/; its ref/ scripts are outside the repository. Only this line was added. -->
# The content inequality on its energy band: problem statement, version 2

16 November 2026. Self-contained: a reader needs Gaussian analysis and the files of §6, nothing else.
**What it is for.** The lower bound K_G^ℂ ≥ 1.402 for the complex Grothendieck constant would follow from a game
of degree 5 whose certificate is conditional on an inequality between a gain and a deficit of the same law, row by
row. (T) of §2 is what that inequality still needs on the six rows t ∈ [0.80, 0.855], where the certificate has
least room. It is one of several open steps, not the last one: on the rows t ≥ 0.86 the argument closes in floating
point and its constants are not certified, the rows 0.14 < t < 0.65 need a separate argument, some finite-amplitude
and odd-sector pieces are open, and the conditional certificate has one author and no independent review. The
numbers of §2 that define (T) (the allowances θ_room, the band ends) are floating-point computations (N).
Labels: **P** proved on paper, **C** exact or interval-certified, **N** floating point (a search gives a lower
bound on a supremum, up to the accuracy of its quadrature). Version 1 asked for one constant at every energy;
that statement is false (§4) and is withdrawn.
**Status of the target (T) of §2: open in both directions.** On the rows 0.84 to 0.855 every search is far below
the allowance. On every row the largest ratio found grows with the number of variables; on the row 0.80, the only
one searched beyond four variables, it is still growing at six (§3), where it is a factor 2.1 below the allowance.
So (T) may be false on the rows 0.80 and 0.82 in high dimension. Either answer is wanted.

## 1. Definitions

**Gaussian space.** y = (y₁, …, y_n) are independent standard complex Gaussians, E|y_j|² = 1; n is arbitrary.
∂_j = ∂/∂y_j, ∂̄_j = ∂/∂ȳ_j, ⟨f, g⟩ = E[f̄ g]. H_{p,q} is the closed span of the Wick polynomials of holomorphic
degree p and antiholomorphic degree q, and P_{p,q} the orthogonal projection onto it. For a unit vector e ∈ ℂⁿ,
y_e = Σ_j e_j y_j.

**The cubic.** q ∈ H₂,₁ ("remote cubic"). Examples, each of norm 1: H(X) = X(|X|² − 2)/√2 (the junta), X(|Y|² − 1),
X²Ȳ/√2. Its scalars and fields:

    V = |q|²,   u = E V (the energy),   δ = E V² − 2u² ≥ 0,   χ = δ/u² ∈ [0, 42]   (P; χ = 42 at the junta),
    F_k = ∂̄_k q,   a = Σ_j ∂_j q · F_j,   c₂ = Σ_k |F_k|²  (E c₂ = u),   W_k = Σ_j F_j ∂_j F_k,   b = Σ_k conj(F_k)·W_k.

Chaos structure (P): a = P₂,₀(q²) + ½P₃,₁(q²); c₂ − u ∈ H₁,₁ ⊕ H₂,₂; W_k = ∂̄_k a ∈ H₃,₀; and the budget

    δ = ‖P₂,₀(q²)‖² + ‖P₃,₁(q²)‖² + 2‖c₂ − u‖².                                                        (B)

**Profiles.** A profile is a real, bounded, continuous h on [0, ∞). Each row of the problem (§2) has two, h_A and
h_B, given as tables (§6). They are smooth, with h(v) ≈ h(0) + h′(0)v near 0 and h(v) ~ const/√v at infinity.
Transforms of a profile, with τ ~ Exp(1) independent of everything:

    k(v) = E h(v + uτ)   (so k − u k′ = h),          k(v, c) = E h(v + cτ)   (two variables; k(v) = k(v, u)).

**Content.** The first-chaos content of q in a profile h is the vector c[h] with components

    c_e[h] = E[ȳ_e · q · h(V)],       ‖c[h]‖² = Σ_j |c_{e_j}[h]|² over an orthonormal basis.

The content direction is e* = c[h]/‖c[h]‖. It depends on q and on h.

**The law functional.** It depends on q only through the law of V:

    Ω̂[h] = (3/2)·E[V k′(V)²] − (3/4)·(E[V k′(V)])²/u.

**Ratio.** r_h(q) = ‖c[h]‖² / (δ·Ω̂[h]). It is invariant under unitary changes of the variables y.

**Two representations of the content, with their Cauchy–Schwarz bounds.** Both come from one integration by parts
(E[G·q] = Σ_j E[∂_jG·∂̄_jq] for q ∈ H₂,₁).

(I) (P, reviewed)

    c_e[h] = E[ȳ_e · k′(V) · (q̄·a + q·(c₂ − u))],
    |c_e[h]|² ≤ δ·Ω_e,     Ω_e = ‖P₂,₀G_e‖² + ¼‖P₃,₁G_e‖² + ½‖P₁,₁G′_e‖² + ½‖P₂,₂G′_e‖²,
    G_e = y_e·q·k′(V),   G′_e = y_e·q̄·k′(V).

(II) (representation P, reviewed; the bound P by one author, not yet reviewed)

    c_e[h] = E[ȳ_e · (∂_vk(V, c₂)·q̄·a + ∂_ck(V, c₂)·b)]
           = ⟨P₂,₀G₁, P₂,₀(q²)⟩ + ½⟨T, P₃,₁(q²)⟩,
    G₁ = y_e·q·∂_vk(V, c₂),     T = P₃,₁G₁ + Σ_k ȳ_k⋄P₃,₀(y_e·F_k·∂_ck(V, c₂)),
    |c_e[h]|² ≤ (δ − 2‖c₂ − u‖²)·Ω^loc_e,     Ω^loc_e = ‖P₂,₀G₁‖² + ¼‖T‖².

Here ȳ_k⋄g = ȳ_k g − ∂_k g is Wick multiplication, the adjoint of ∂̄_k. By (B) the budget of (II) is
‖P₂,₀(q²)‖² + ‖P₃,₁(q²)‖². For a given q only the direction e = e* is needed in either bound.

Ω_e and Ω^loc_e are not functions of the law of V. If q does not depend on y_e then Ω_e ≤ Ω̂ (P), but then c_e = 0.

## 2. The target

**Rows.** Six rows, labelled t. For each: the profiles h_A, h_B, a reference energy u*, and a band [u₀, u_cap].

| row t | u* | u₀/u* | u_cap/u* | θ_t | measured θ_room(u) at u/u* = 0.5, 0.6, 0.7, 0.85, 1.0 | t_lo |
|---|---|---|---|---|---|---|
| 0.80 | 0.087859 | 0.37 | 1.22 | 0.36 | 2.80, 1.33, 0.84, 0.49, 0.36 (10.4 at 0.4) | 0.7850 |
| 0.82 | 0.068255 | 0.43 | 1.16 | 0.64 | 5.2, 2.5, 1.46, 0.91, 0.66 | 0.8117 |
| 0.84 | 0.048151 | 0.54 | 1.14 | 1.33 | —, —, 3.7, 2.2, 1.44 | 0.8348 |
| 0.845 | 0.043055 | 0.58 | 1.08 | 1.88 | —, —, 5.0, 2.7, 2.0 | 0.8424 |
| 0.85 | 0.037940 | 0.63 | 1.09 | 2.5 | —, —, 7.4, 3.9, 2.7 | 0.8476 |
| 0.855 | 0.032796 | 0.70 | 1.11 | 3.7 | —, —, 13.9, 6.3, 4.1 | 0.8523 |

θ_room(u) is the largest constant for which the inequality below, used in our convex program over laws of V, keeps the
row inside its error budget at the energy u (N; "—": below the band or not computed). θ_t is its minimum over the
band, attained at u* or just above it. An independent recomputation of the rows 0.80 and 0.84 agrees with the table
within −3 % and +8 % at the five energies. The numbers belong to one game; a game with a larger error budget is being
computed and will raise every θ_t, so a method is worth more than a constant.

**TARGET.** For each row, every n, every q ∈ H₂,₁(ℂⁿ) with u = E|q|² ∈ [u₀, u_cap], and both profiles h ∈ {h_A, h_B}:

    ‖c[h](q)‖² ≤ θ(u)·δ(q)·Ω̂[h],          θ(u) = θ_t·max(1, u*/u)^{1.8}.                              (T)

- θ(u) lies below the measured θ_room(u) at every energy of the table, so (T) suffices there. Between the table
  energies the margin is thin: the independent recomputation, on a finer grid of χ (in progress), finds θ_room about
  0.44 at 0.90u* on the row 0.80 and about 1.34 at 1.05u* on the row 0.84, where θ(u) is 0.435 and 1.33. So aim a
  few per cent lower: on these two rows (T) with 0.95·θ_t in place of θ_t has numerical slack at the energies and
  values of χ tested; sufficiency over the whole band is not certified. Any θ(u) ≤ θ_room(u) will do.
- **Sufficient forms, by (I) and (II):** a majorant at the content direction,

      Ω_{e*} ≤ θ(u)·Ω̂     or     (1 − 2‖c₂ − u‖²/δ)·Ω^loc_{e*} ≤ θ(u)·Ω̂,

  or any other bound of ‖c[h]‖² by θ(u)·δ times a functional of the law of V and of the row data. **They are not
  equivalent to (T), and on the row 0.80 they are false.** Row 0.80 at u*: θ(u)·Ω̂ = 0.0416 for the first test cubic
  of §5, where (I) gives 0.0478; for the cofactor cubic 0.0332 against (I) = 0.0622 and (II) = 0.0435; for the two
  juntas 0.0404 against 0.0446 and 0.0456. (On that row, at u*, (I) exceeds the allowance on five of seven test
  cubics and (II) on two; at 0.85u* both do on the cofactor cubic.) So on the row 0.80 no bound through (I) or (II)
  at the content direction can prove (T): the content itself has to be bounded more sharply. On the row 0.82, (I)
  exceeds the allowance at u* on the cofactor cubic only (0.0596 against 0.0526), and (II) stays below it on every
  test cubic, with a smallest factor 1.27. On the rows 0.84 to 0.855 both forms hold on every test cubic (smallest
  factors 1.7, 2.3, 2.9, 4.3 for (I) and 2.4, 3.3, 4.1, 6.0 for (II)), and there (T) would follow from a majorant
  of Ω_{e*} or of Ω^loc_{e*} by a functional of the law. The test cubics have two or three variables; (I) and (II)
  were not computed on the maximisers of §3 with four or more.
- A proof may be computer-assisted (interval arithmetic on the profile tables or on the definitions of §6), but any
  reduction to finitely many parameters must be a proof. A proof for a class of cubics is useful if the class
  contains the maximisers of §3, or shows what bounds their ratio as the number of variables grows.
- **Optional restriction (the response family; P + C).** (T) is needed only for cubics whose law satisfies, for all λ > 0,

      E ρ(λ²V) ≥ t_lo + λ·u/ε₁,      ε₁ = 39/50,      ρ(x) = (√π/2)·e^{−x/2}·[(1 + x)·I₀(x/2) + x·I₁(x/2)].

  This is what u ≤ u_cap comes from. Near u* it excludes the most concentrated laws (among them the two-variable
  maximisers at u*).

**Not needed.**
- u < u₀: there the proved bounds already suffice (the row has an energy slack that pays for the content).
- u > u_cap: no admissible cubic.
- u → 0 or χ → 0 asymptotics; constants uniform in the energy or in the profile; statements for all profiles.
- The supremum over directions e; the constants of version 1.

## 3. What is known

**Numerics (N): the largest ratio found grows with the number of variables.** Sector A (sector B is lower on every
case). Searches over all of H₂,₁(ℂⁿ) by local optimisation from several starts. For n = 3 and 4, driver-class
starts and random starts end at the same values to three digits; for n = 5, two starts from the four-variable
maximiser and one random start agree to 0.6 %; for n = 6 there are two starts from the five-variable maximiser
only. Every maximiser listed satisfies the response restriction of §2, except the three entries marked †.
A search gives a lower bound on the supremum, up to the accuracy of the evaluation described under the table,
and never an upper bound.

| row t | u/u* | n = 2 | n = 3 | n = 4 | n = 5 | n = 6 | θ_room(u) | θ_room / largest |
|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.85 | 0.160 | 0.193 | 0.210 | 0.224 | 0.236 | 0.49 | 2.1 |
| 0.80 | 1.00 | 0.137† | 0.168 | 0.185 | 0.198 | — | 0.36 | 1.8 |
| 0.82 | 0.85 | 0.213 | 0.249 | 0.269 | — | — | 0.91 | 3.4 |
| 0.82 | 1.00 | 0.183† | 0.218 | 0.237 | — | — | 0.66 | 2.8 |
| 0.84 | 0.85 | 0.309 | 0.346 | 0.366 | — | — | 2.2 | 6.0 |
| 0.84 | 1.00 | 0.267† | 0.304 | 0.324 | — | — | 1.44 | 4.5 |
| 0.845 | 0.85 | 0.345 | 0.382 | 0.401 | — | — | 2.7 | 6.8 |
| 0.85 | 0.85 | 0.390 | 0.426 | 0.444 | — | — | 3.9 | 8.8 |
| 0.855 | 0.85 | 0.447 | 0.481 | 0.498 | — | — | 6.3 | 12.6 |

† Not a possible response by the restriction of §2: the two-variable maximisers at u* violate it.

How the entries are computed. δ is exact for every n. n = 2, 3: tensor quadrature. n ≥ 4: the search maximises the
ratio on a fitting sample of 2^18 quasi-random points, and the entry is the ratio of the cubic it returns on an
independent sample (2^19 points for n = 4, 2^20 for n = 5, 6), accurate to about 0.5 %. The value on the fitting
sample is biased upward, by 1.3 %, 3.3 % and 7 % at n = 4, 5, 6 (0.213, 0.231, 0.253 on the row 0.80 at 0.85u*),
and must not be quoted. For the same reason the true maxima at n = 5, 6 may be 1 to 2 % above the entries.

- **Still growing at n = 6 on the row 0.80.** The increments per added variable are 0.033, 0.018, 0.014, 0.012 at
  0.85u* (0.031, 0.017, 0.013 at u*), while the fourth excess of the maximiser falls (χ = 14.8, 9.3, 7.0, 5.6, 4.5
  for n = 2, …, 6 at 0.85u*). The increments decrease, but the data do not decide the limit: a decay like 1/n
  (logarithmic growth; the allowance would be reached only for n in the hundreds) fits them as well as a geometric
  decay with ratio 0.8 to 0.9 (a limit between 0.29 and 0.35, below the allowance 0.49). Whether the growth
  saturates below the allowance is the first thing to find out (§2, status of the target). From n = 2 to n = 4 the
  ratio grows by the factors 1.32, 1.26, 1.19, 1.16, 1.14, 1.11 on the six rows; from the row 0.84 on the allowance
  is 4 to 13 times the largest ratio found.
- **The shape of the maximisers.** Relative to the content direction X, with y the other variables:
  q = a·X(|X|² − 2)/√2 + X·Q(y) + R₃(y), where Q(y) = Σ_j m_j(|y_j|² − 1) in suitable coordinates and R₃ is a cubic
  in y alone. Shares of the energy u at the row 0.80 (squared norms of the orthogonal parts): for n = 2, the junta
  part 0.38 and X·Q 0.62, with Q of rank one and no R₃ (the "worst" cubic of §5 is close to it); for n = 3: 0.24,
  0.49 and R₃ 0.27; for n = 4: 0.18, 0.46 and 0.36, with |m_j| ≈ 0.45, 0.36, 0.37 and phases about −0.27π, 0.20π,
  0.19π; for n = 5: 0.14–0.15, 0.38–0.45 and 0.40–0.44; for n = 6: 0.12, 0.37–0.39 and 0.49–0.50. The parts
  X²·conj(ℓ(y)), (|X|² − 1)·ℓ(y) and conj(X)·F(y) carry at most 0.002 of the energy at the best maximisers, and the
  matrix of Q is normal to within 0.03 (norm of its commutator with its adjoint). In three variables the
  maximiser is, up to a unitary change of variables and to two digits,
  √u·[0.49·X(|X|² − 2)/√2 + 0.57e^{0.26πi}·X(|y₁|² − 1) + 0.40e^{−0.20πi}·X(|y₂|² − 1) + 0.52·y₂²ȳ₁/√2]
  (χ = 9.65; ratio 0.191 at the row 0.80, 0.85u*, where the maximiser has 0.193). At u* on that row it has, per δ,
  truth 0.0196, (I) = 0.0448, (II) = 0.0312 and Ω̂ = 0.1181, so the allowance θ(u)·Ω̂ is 0.0425: (I) exceeds it and
  (II) is below it by a factor 1.36. So the maximisers leave the class "X times a form": they are not divisible
  by a linear form, and no class theorem below contains them.
- The ratio decreases in u on the band; θ_room(u) decreases faster. The binding energies are 0.85u*–1.05u*.
- **A tool (P) and what it gives.** For q = X·(a(|X|² − 2) + Z) with Z independent of X, at fixed energy u the content
  and δ are linear and Ω̂ is concave in the law μ of Z; writing the inequality as F_{λ,φ}(μ) ≤ 0 for all λ > 0 and
  phases φ (the arithmetic–geometric mean in λ) makes it a convex functional of μ, so under k linear constraints on
  μ it suffices to check laws with at most k + 1 atoms. With only E Z = 0 and E|Z|² fixed the inequality is
  **false** for such laws (§4). Every cofactor Z = Σ_j m_j(|y_j|² − 1) satisfies, with s₂ = E|Z|² and
  k₂₂ = E|Z|⁴ − 2s₂² − |E Z²|²: |E Z²Z̄|² ≤ (2/3)s₂k₂₂, |E Z³|² ≤ (2/3)s₂k₂₂ and k₂₂ ≤ 6s₂² (Cauchy–Schwarz between
  Σm²m̄, Σ|m|² and Σ|m|⁴). They are convex or, once
  the complex numbers E Z², E Z²Z̄ and E Z³ are fixed, linear. With them the relaxed supremum found so far (N; lower
  bounds from a light search, at most 6 atoms) is 1.19 at the row 0.84, 0.85u* (allowance 2.2) and 1.13 at u*
  (allowance 1.44); 1.02 and 0.95 at the row 0.82 (allowances 0.91 and 0.66); 0.89 and 0.82 at the row 0.80
  (allowances 0.49 and 0.36). So with these constraints the relaxation fails on the rows 0.80 and 0.82, and on the
  row 0.84 it is not refuted but has little room. It does not cover the maximisers with R₃ ≠ 0.

**Bounds (I), (II) at the content direction (N).** In units of δΩ̂, two-variable cubics, band energies:
(I) gives 0.13–1.5 and (II) 0.20–1.1; (II) is 0.6–1.0 times (I) except on the junta at the lower rows. Both are
1.2 to 7 times the truth. With a Gaussian bulk added to q, Ω_{e*} tends to (3/4)·(E[V k′])²/u ≈ Ω̂ and Ω^loc_{e*} to
4/3 of that, while the content tends to 0: the two bounds have a floor, the truth has none.

**Class results (P, reviewed).** They hold for every profile and every energy:
- q = √u·X·P(Y), P = m^{−1/2}Σ_{j≤m}(|Y_j|² − 1): r_h ≤ 77/(9(m + 3)).
- q = √u·(Σ_i √ρ_i·X_i·P_i + √ρ₀·W), independent blocks, P_i = Σ_j λ_ij(|Y_ij|² − 1) with Σ_j λ_ij² = 1, and a bulk
  W = Σ_a Z̄_a·F_a(U): r_h ≤ 39/16 when every block has rank one, for any number of blocks and any weights; smaller
  explicit constants at higher rank.
- q = Σ_j X_j·(Y*A_jY − tr A_j) + Σ_j Z̄_j·F_j(U), with arbitrary complex matrices A_j on one shared block Y and
  holomorphic quadratics F_j: r_h ≤ 5/3.

  Common hypothesis: **every driver X_i enters linearly and is independent of its cofactor.** Given the other
  variables q is then a centred Gaussian; no term X_i|X_i|², X_i²ȳ or |X_i|²y occurs. The maximisers of the searches
  are outside.
- Because they hold for all profiles, these constants are at least the ratio of h(v) = v: 16/(3(m + 3)) on X·P_m and
  256/63 on the junta. So no profile-free constant meets θ_t on the rows 0.80–0.84 at low rank, and none can treat a
  self-interaction term at all.
- The sharp profile-free constant for a given q and e (P):
  θ*(q, e) = (2/(3δ))·(E[|M_e(V)|²/V] + |E M_e(V)|²/u), with M_e(v) = E[ȳ_e(q̄a + q(c₂ − u)) | V = v].

**The side conditions (P + C).** u ≤ u_cap and the response family of §2. **Low energies (N on proved bounds):**
for u ≤ u₀ two proved bounds of the content (one of them ‖c‖² ≤ γδ with γ ≈ 0.3) suffice in the convex program.

## 4. False or useless

- **One constant for all energies.** As u → 0 the ratio of a smooth profile tends to that of h(v) = v: 256/63 on
  the junta, 16/(3(m + 3)) on X·P_m. These exceed θ_t on most rows.
- **The supremum over directions e** in (I) or (II). It is attained on cubics with zero content (X²Ȳ), where
  sup_e Ω_e reaches 1.54·Ω̂; at the row 0.80 it exceeds the allowance.
- **Law-free corollaries**, e.g. ‖c‖² ≤ (3/2)·sup_v(v·k′(v)²)·δ: 2.8–4.9 times Ω̂.
- **Bessel or unprojected forms**, e.g. Ω_e ≤ (3/2)·E[|y_e|²·V k′²] with the coupling of |y_e|² and V relaxed: about
  3–4.5 times Ω̂. The projections in Ω_e are essential.
- **Splitting q at its content direction** into a self-interaction part (bounded by (I)) and a cofactor part
  (bounded by conditioning): proved as an inequality, never below (I) unsplit, 2.1–2.5 times Ω̂. H(X) + H(Y) has
  content direction (X + Y)/√2, where 87 % of its budget counts as cofactor.
- **Bounds of order δ^{3/2}** for all cubics: they cover χ ≤ 10⁻⁷–3·10⁻⁵ on these rows; the hard cases have χ = 2–42.
- **Finite-dimensional reductions with absolute errors**: the constants are unusable.
- **Treating the cofactor of a driver as an arbitrary centred law.** For q = X·Z with Z = s with probability
  1/(1 + s²) and −1/s otherwise (not a chaos variable), the ratio is 2.19 at the row 0.80 as s → 1 (allowance 0.36),
  and 8/3 for h(v) = v at every s. A proof on a driver class must use that the cofactor lies in the second chaos:
  information of third-moment or Stein type, not a bound on the kurtosis.
- **Perturbation from the direction-independent case** (Ω_e ≤ Ω̂ for e independent of q): the cubic part of
  q·k′(V) alone gives Ω_e up to 5 times its Gaussian value; the truth is small only through cancellation with the
  quintic part.

## 5. Test cases (N)

Sector A, two rows, u/u* ∈ {0.7, 0.85, 1.0}. All entries are per δ: truth = ‖c[h_A]‖²/δ, (I) = Ω_{e*},
(II) = (1 − 2‖c₂ − u‖²/δ)·Ω^loc_{e*}. Cubics, all with ‖q‖² = u:
- worst: √u·X·(α(|X|² − 2)/√2 + β·e^{iπ/3}·(|Y|² − 1)), α = 0.63, β = √(1 − α²); χ = 16.02;
- cofactor: √u·X·(|Y|² − 1); χ = 16;      junta: √u·H(X); χ = 42;
- two juntas: √(u/2)·(H(X) + H(Y)); χ = 21;
- Wick + shared: √u·X·(cos 0.3·(|X|² − 2)/√2 + i·sin 0.3·(|Y|² − 1)); χ = 35.43.

| row t | u/u* | cubic | (δ − 2‖c₂−u‖²)/δ | truth | (I) | (II) | Ω̂[h_A] | θ(u) of (T) | θ_room(u) |
|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.70 | worst | 0.646 | 0.02038 | 0.05257 | 0.03381 | 0.10701 | 0.684 | 0.84 |
| 0.80 | 0.70 | cofactor | 0.625 | 0.01213 | 0.06752 | 0.04669 | 0.08878 | | |
| 0.80 | 0.70 | junta | 0.762 | 0.01358 | 0.01911 | 0.02437 | 0.10826 | | |
| 0.80 | 0.70 | two juntas | 0.762 | 0.01647 | 0.04790 | 0.04663 | 0.10372 | | |
| 0.80 | 0.70 | Wick + shared | 0.746 | 0.01451 | 0.02908 | 0.02728 | 0.11159 | | |
| 0.80 | 0.85 | worst | 0.646 | 0.01773 | 0.05020 | 0.03227 | 0.11241 | 0.482 | 0.49 |
| 0.80 | 0.85 | cofactor | 0.625 | 0.01025 | 0.06521 | 0.04527 | 0.09141 | | |
| 0.80 | 0.85 | junta | 0.762 | 0.01153 | 0.01714 | 0.02434 | 0.11536 | | |
| 0.80 | 0.85 | two juntas | 0.762 | 0.01427 | 0.04628 | 0.04621 | 0.10912 | | |
| 0.80 | 0.85 | Wick + shared | 0.746 | 0.01236 | 0.02702 | 0.02665 | 0.11862 | | |
| 0.80 | 1.00 | worst | 0.646 | 0.01551 | 0.04779 | 0.03084 | 0.11544 | 0.360 | 0.36 |
| 0.80 | 1.00 | cofactor | 0.625 | 0.00872 | 0.06222 | 0.04347 | 0.09233 | | |
| 0.80 | 1.00 | junta | 0.762 | 0.00990 | 0.01565 | 0.02438 | 0.11988 | | |
| 0.80 | 1.00 | two juntas | 0.762 | 0.01244 | 0.04460 | 0.04558 | 0.11223 | | |
| 0.80 | 1.00 | Wick + shared | 0.746 | 0.01066 | 0.02532 | 0.02618 | 0.12311 | | |
| 0.84 | 0.70 | worst | 0.646 | 0.02271 | 0.04504 | 0.02987 | 0.06213 | 2.53 | 3.7 |
| 0.84 | 0.70 | cofactor | 0.625 | 0.01454 | 0.05173 | 0.03661 | 0.05501 | | |
| 0.84 | 0.70 | junta | 0.762 | 0.01705 | 0.02194 | 0.02081 | 0.05994 | | |
| 0.84 | 0.70 | two juntas | 0.762 | 0.01871 | 0.04022 | 0.03668 | 0.05997 | | |
| 0.84 | 0.70 | Wick + shared | 0.746 | 0.01791 | 0.02891 | 0.02380 | 0.06234 | | |
| 0.84 | 0.85 | worst | 0.646 | 0.02122 | 0.04465 | 0.02928 | 0.06874 | 1.78 | 2.2 |
| 0.84 | 0.85 | cofactor | 0.625 | 0.01339 | 0.05326 | 0.03732 | 0.05986 | | |
| 0.84 | 0.85 | junta | 0.762 | 0.01539 | 0.02004 | 0.02030 | 0.06727 | | |
| 0.84 | 0.85 | two juntas | 0.762 | 0.01739 | 0.03999 | 0.03698 | 0.06642 | | |
| 0.84 | 0.85 | Wick + shared | 0.746 | 0.01625 | 0.02743 | 0.02314 | 0.06972 | | |
| 0.84 | 1.00 | worst | 0.646 | 0.01978 | 0.04401 | 0.02864 | 0.07414 | 1.33 | 1.44 |
| 0.84 | 1.00 | cofactor | 0.625 | 0.01229 | 0.05397 | 0.03757 | 0.06359 | | |
| 0.84 | 1.00 | junta | 0.762 | 0.01396 | 0.01847 | 0.01987 | 0.07331 | | |
| 0.84 | 1.00 | two juntas | 0.762 | 0.01614 | 0.03958 | 0.03712 | 0.07169 | | |
| 0.84 | 1.00 | Wick + shared | 0.746 | 0.01479 | 0.02611 | 0.02262 | 0.07582 | | |

- Read a line as: truth ≤ (I), (II) by proof; (T) asks truth ≤ θ(u)·Ω̂. The last two columns are the same for the
  five cubics of a row and energy. Example: row 0.80, 0.85u*, worst: 0.01773 ≤ 0.482 × 0.11241 = 0.0542, a factor 3.1
  ("worst" is close to the largest ratio in two variables, 0.158 against 0.160; cubics in more variables have larger
  ratios, §3).
- Accuracy: three digits (a three-dimensional quadrature with 692,224 nodes; a coarser rule agrees to 0.8 %). On the
  junta a one-dimensional rule gives Ω̂[h_A] = 0.06732 at the row 0.84, 0.85u* (the script of §6), against 0.06727.
- Sector B, same cases: `ref/r4_ref.json` (§6). Its contents and Ω̂ are about 5 times smaller.

## 6. Files

All paths are relative to the folder of this file.

The profile kit (its README defines the profiles from the row parameters):
- `kit/README.md`
- `kit/profiles/band_row_<t>.json`, t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855: tables `S` (705 amplitudes in [0, 6]),
  `GA`, `GB`, `G0`, `psi`, and `ustar`
- `kit/check_profiles.py` (recomputes a table from the definitions), `kit/prof.py`, `kit/tilt.py` (the generator),
  `kit/t4lib.py` ((I) for two-variable cubics)

Scripts and outputs of this note (they import the kit's modules: put `kit/` on the Python path):
- `ref/r4_ref.py` (the table of §5), `ref/r4_local.py` ((II)), `ref/r4lib.py`, `ref/r4_ratio.py` (ratios and
  searches), `ref/r4_xz.py` (the two-variable family)
- `ref/r4_ref.json` (the table of §5 for both sectors)

**Evaluating a row profile.** With s = √v the amplitude:

    G_A(s) = GA(s) + 0.4·G0(s),     G_B(s) = GB(s) + 0.3·G0(s),     h_X(v) = G_X(√v)/√v,     u* = ustar.

Interpolate the tables with a cubic spline; G_X(s) is constant to three digits beyond s = 6; h_X(0) = G_X′(0).
The tables are accurate to about 10⁻⁴. The kit's README still names the band u/u* ∈ [0.5, 1.3]; the band of §2
replaces it. A complete example (numpy and scipy only; it prints 0.01540, 0.06732, 0.2287):

```python
import json, numpy as np
from scipy.interpolate import CubicSpline
from numpy.polynomial.laguerre import laggauss
from numpy.polynomial.legendre import leggauss
KIT = 'kit/profiles/'
d = json.load(open(KIT + 'band_row_0.84.json')); S = np.array(d['S'])
GA = CubicSpline(S, np.array(d['GA']) + 0.4 * np.array(d['G0']))          # sector A; sector B: GB + 0.3 G0
def h(v):                                                                  # h(v) = G(sqrt v)/sqrt v
    s = np.sqrt(np.maximum(v, 1e-18)); return GA(np.minimum(s, 6.0)) / s
tau, w = laggauss(64)                                                      # E f(tau), tau ~ Exp(1)
u = 0.85 * d['ustar']
kp = lambda v: (np.array([w @ h(x + u * tau) for x in np.atleast_1d(v)]) - h(np.atleast_1d(v))) / u   # k' = (k - h)/u
# the junta q = sqrt(u) X (|X|^2 - 2)/sqrt 2:  V = u T (T-2)^2 / 2 with T = |X|^2 ~ Exp(1);  delta = 42 u^2
x, wx = leggauss(40); T = []; W = []
for a, b in zip([0, .5, 1, 1.5, 2, 2.5, 3, 4, 6, 9, 14, 22, 34], [.5, 1, 1.5, 2, 2.5, 3, 4, 6, 9, 14, 22, 34, 60]):
    T.append((b - a) / 2 * x + (a + b) / 2); W.append((b - a) / 2 * wx)
T = np.concatenate(T); W = np.concatenate(W) * np.exp(-T); V = u * T * (T - 2) ** 2 / 2
c = np.sqrt(u) * (W @ (T * (T - 2) / np.sqrt(2) * h(V)))                  # E[conj(X) q h(V)]
K = kp(V); Omhat = 1.5 * (W @ (V * K ** 2)) - 0.75 * (W @ (V * K)) ** 2 / u
print(c ** 2 / (42 * u * u), Omhat, c ** 2 / (42 * u * u * Omhat))        # truth/delta, Omhat, ratio
```
