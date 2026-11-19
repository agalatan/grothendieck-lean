<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/PROBLEM_V2.md (17 November 2026, 01:25), the problem statement prepared for outside sessions (text by claude-b9ee and its content worker); the same file is content-problem-v2/PROBLEM_V2.md of the package in /Users/alingalatan/workspaces/grothe/handoff/research-degree5/content-problem-v2-2026-11-16/. Its kit/ is ../../code/degree5-content/; its ref/ scripts are outside the repository (../../INVENTORY.md). Only this line was added. -->
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
**Status of the target (T) of §2: open in both directions.** On the rows 0.84 to 0.855 every search is far below the
allowance. On every row the largest ratio found grows with the number of variables n, by a mechanism that no class
theorem covers (a bulk on the cofactor's own variables, §3). On the row 0.80 the largest values found are 0.276 at
0.85u* (n = 25) and 0.250 at u* (n = 25): factors 1.76 and 1.44 below the allowance. They belong to a family with
three clusters of c variables (n = 3c + 1) in which the ratio is an explicit integral governed by one number κ ≥ 1,
the fourth-moment ratio of the bulk given the cofactor (κ = 2 for a Gaussian bulk; §3). κ ≥ 2 − 4/(c + 1) is proved
(§3) and the smallest κ found is about 2 − 1.5/c; with the smallest κ found, the values for c = 4, 5, 6, 7, 8, 9, 10
are 0.2743, 0.2736, 0.2758, 0.2743, 0.2766, 0.2734, 0.2724 at 0.85u* and 0.2470, 0.2467, 0.2493, 0.2481, 0.2508,
0.2481, 0.2474 at u*. With κ at the proved lower bound and G of Gamma shape, the formula stays at or below 0.345 at
0.85u* and 0.318 at u* for c from 2 to 40 (the allowances are 0.49 and 0.36). Open: in this family, which laws of G
occur beyond their second moment (the Gamma shape is an approximation); outside it, whether a bulk of degree three
can stay further from Gaussian in high dimension. The supremum over n is not known, and (T) may be false on the low
rows in high dimension. The inequality is also needed on rows below 0.80, where the allowances are smaller (§2): the
six rows here are not the whole problem. Either answer is wanted.

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

**Rows below 0.80 (scope; N, from the computation of the certificate, quoted as data).** The certificate needs the
inequality on every row from t = 0.70 to 0.886, not only on the six rows above, and the low rows are harder. The
best band minimum of θ_room found so far is about 0.62 at t = 0.80 (with a covering row tuned at 0.82), 0.45 at t =
0.78, about 0.29 at t = 0.76, and 0.17 and 0.13 at t = 0.74 and 0.72 with rows tuned at those values (rows tuned
higher gain 25 to 40 %, and a split of the error budget that depends on χ another 15 %). The ratios are smaller
there too (the two-variable maximum at 0.85u* is 0.10 at t = 0.76 and 0.07 at t = 0.72), but the allowance divided
by the two-variable maximum falls from 3.2 at t = 0.80 to 1.9 at t = 0.72 over all cubics (3.4 when only possible
responses are counted). Profiles and tables for these rows will be added in a later version. Do not take the six
rows 0.80 to 0.855 as the whole problem: a method should work for a family of rows, and the growth with n of §3 has
to be absorbed on the low rows as well.

**TARGET.** For each row, every n, every q ∈ H₂,₁(ℂⁿ) with u = E|q|² ∈ [u₀, u_cap], and both profiles h ∈ {h_A, h_B}:

    ‖c[h](q)‖² ≤ θ(u)·δ(q)·Ω̂[h],          θ(u) = θ_t·max(1, u*/u)^{1.8}.                              (T)

- θ(u) lies below the measured θ_room(u) at every energy of the table, so (T) suffices there. An independent
  recomputation (a finer grid of χ, an exact Γ′, and the law-layer test minimised over all weights of the two
  sectors instead of the nine weights {0, 1/2, 1}²) finds that (T) as stated uses about half of the room at the
  cells that bound it on the rows 0.80 and 0.84 (N). The values θ_room(u) of the table are lower bounds of the
  largest constant admissible in the relaxation: the nine-weight grid understates it by 2 to 17 %, the five-value
  grid of χ overstates it by 2 to 16 %, and the approximate Γ′ understates it by 0.6 to 8 %. Any θ(u) ≤ θ_room(u)
  will do.
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

**Numerics (N): the largest ratio found grows with the number of variables.** Sector A
(sector B is lower on every case). Searches by local optimisation: over all of H₂,₁(ℂⁿ) for n ≤ 8 (starts from
the driver class, from the maximiser with one variable fewer, and random starts; for n = 3 and 4 they end at the
same values to three digits; for n = 5, 6, 7 on the row 0.80 three or more searches per entry agree to 0.1–1.3 %;
for n = 8 two searches per entry give 0.2525, 0.2515 at 0.85u* and 0.2253, 0.2252 at u*), and in reduced families
read off the maximisers (described below), which reproduce the full maxima for n ≤ 7 and reach further. Every
maximiser listed satisfies the response restriction of §2, except the three entries marked †.
A search gives a lower bound on the supremum, up to the accuracy of the evaluation described under the table,
and never an upper bound.

| row t | u/u* | n = 2 | n = 3 | n = 4 | n = 5 | n = 6 | n = 7 | n = 8 | n = 9 | n = 10 | n = 11 | n = 12 | n = 13 | θ_room(u) | θ_room / largest (both tables) |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.85 | 0.1595 | 0.1925 | 0.2105 | 0.2246 | 0.2386 | 0.2483 | 0.2532 | 0.2575 | 0.2588 | 0.2630 | 0.2666 | 0.2756 | 0.49 | 1.8 |
| 0.80 | 1.00 | 0.1367† | 0.1679 | 0.1847 | 0.1987 | 0.2114 | 0.2211 | 0.2257 | 0.2301 | 0.2315 | 0.2361 | 0.2397 | 0.2482 | 0.36 | 1.4 |
| 0.82 | 0.85 | 0.2134 | 0.2493 | 0.2685 | 0.2835 | 0.2975 | 0.3075 | 0.3075 | 0.3075 | 0.3172 | 0.3172 | 0.3172 | 0.3314 | 0.91 | 2.8 |
| 0.82 | 1.00 | 0.1835† | 0.2179 | 0.2367 | 0.2525 | 0.2646 | 0.2752 | 0.2752 | 0.2752 | 0.2855 | 0.2855 | 0.2855 | 0.3005 | 0.66 | 2.2 |
| 0.84 | 0.85 | 0.309 | 0.346 | 0.366 | — | — | — | — | — | — | — | — | — | 2.2 | 5.2 |
| 0.84 | 1.00 | 0.267† | 0.304 | 0.324 | — | — | — | — | — | — | — | — | — | 1.44 | 3.8 |
| 0.845 | 0.85 | 0.345 | 0.382 | 0.401 | — | — | — | — | — | — | — | — | — | 2.7 | 6.1 |
| 0.85 | 0.85 | 0.390 | 0.426 | 0.444 | — | — | — | — | — | — | — | — | — | 3.9 | 8.1 |
| 0.855 | 0.85 | 0.447 | 0.481 | 0.498 | — | — | — | — | — | — | — | — | — | 6.3 | 12.0 |

† Not a possible response by the restriction of §2: the two-variable maximisers at u* violate it.

Row 0.80, n ≥ 7: the largest value found with exactly n variables, its two independent samples, the value on the
fitting sample, and the family it comes from (bipartite (p, q), or clusters c₁, c₂, c₃; the main table carries the
largest value up to n forward):

| n | 0.85u*: value [two independent samples], fit | found in | u*: value [two independent samples], fit | found in |
|---|---|---|---|---|
| 7 | 0.2483 [0.2485, 0.2482], fit 0.2505 | clusters 2,2,2 | 0.2211 (formula) | clusters 2,2,2, bulk of smallest κ |
| 8 | 0.2532 [0.2531, 0.2532], fit 0.2613 | bipartite (3,4) | 0.2257 [0.2261, 0.2253], fit 0.2308 | bipartite (3,4) |
| 9 | 0.2575 [0.2575, 0.2575], fit 0.2660 | bipartite (3,5) | 0.2301 [0.2302, 0.2300], fit 0.2377 | bipartite (3,5) |
| 10 | 0.2588 (formula) | clusters 3,3,3, bulk of smallest κ | 0.2315 (formula) | clusters 3,3,3, bulk of smallest κ |
| 11 | 0.2630 [0.2628, 0.2632], fit 0.2799 | bipartite (4,6) | 0.2361 [0.2361, 0.2362], fit 0.2505 | bipartite (4,6) |
| 12 | 0.2666 [0.2664, 0.2669], fit 0.2793 | clusters 4,3,4 | 0.2397 [0.2395, 0.2399], fit 0.2510 | clusters 4,3,4 |
| 13 | 0.2756 [0.2750, 0.2761], nothing fitted | clusters 4,4,4, bulk of smallest κ | 0.2482 [0.2477, 0.2487], nothing fitted | clusters 4,4,4, bulk of smallest κ |

In the searches the fit exceeds the value by 1 % at 31 coefficients (clusters 2,2,2), 4 % at 91 (3,3,3) and 7 to 8 %
at 205 (4,4,4), and the maximum returned for 4,4,4 was low by 1.5 and 3 %: with the bulk fixed (next table) the same
family gives 0.2756 against 0.2715 at 0.85u* and 0.2482 against 0.2402 at u*. Second starts of the searches: 0.2481
and 0.2483 (2,2,2), 0.2572 and 0.2575 (3,3,3), 0.2709 and 0.2715 (4,4,4) at 0.85u*; 0.2301 and 0.2310 (3,3,3) at u*.

Three clusters of c variables with the bulk of smallest κ (§3 below): only a, m₁, m₂, m₃, s_R are optimised (8 real
parameters, nothing is fitted to a sample). Entry: the formula of §3 by product quadrature; in brackets, where it
was run, the same cubic evaluated directly in 3c + 1 variables on two independent samples of 2^21 points (largest
deviation between the two: 0.5 %; every cubic checked directly is a possible response):

| row t | u/u* | c = 2 (n = 7) | c = 3 (n = 10) | c = 4 (n = 13) | c = 5 (n = 16) | c = 6 (n = 19) | c = 7 (n = 22) | c = 8 (n = 25) | c = 9 (n = 28) | c = 10 (n = 31) | θ_room(u) |
|---|---|---|---|---|---|---|---|---|---|---|---|
| 0.80 | 0.85 | 0.2483 | 0.2588 | 0.2743 (0.2756) | 0.2736 (0.2739) | 0.2758 (0.2748) | 0.2743 | 0.2766 (0.2761) | 0.2734 | 0.2724 (0.2731) | 0.49 |
| 0.80 | 1.00 | 0.2211 | 0.2315 | 0.2470 (0.2482) | 0.2467 (0.2470) | 0.2493 (0.2482) | 0.2481 | 0.2508 (0.2505) | 0.2481 | 0.2474 (0.2479) | 0.36 |
| 0.82 | 0.85 | 0.3075 | 0.3172 | 0.3314 | 0.3295 | 0.3305 | — | 0.3290 | — | — | 0.91 |
| 0.82 | 1.00 | 0.2752 | 0.2855 | 0.3005 | 0.2993 | 0.3010 | — | 0.3008 | — | — | 0.66 |
| 0.84 | 0.85 | 0.4014 | 0.4074 | 0.4177 | 0.4130 | 0.4113 | — | 0.4053 | — | — | 2.2 |
| 0.84 | 1.00 | 0.3614 | 0.3692 | 0.3814 | 0.3780 | 0.3775 | — | 0.3735 | — | — | 1.44 |
| 0.845 | 0.85 | 0.4347 | 0.4390 | 0.4474 | 0.4416 | 0.4388 | — | 0.4310 | — | — | 2.7 |
| 0.845 | 1.00 | 0.3921 | 0.3986 | 0.4093 | 0.4049 | 0.4035 | — | 0.3979 | — | — | 2.0 |
| 0.85 | 0.85 | 0.4743 | 0.4763 | 0.4823 | 0.4752 | 0.4710 | — | 0.4611 | — | — | 3.9 |
| 0.85 | 1.00 | 0.4287 | 0.4333 | 0.4421 | 0.4365 | 0.4338 | — | 0.4264 | — | — | 2.7 |
| 0.855 | 0.85 | 0.5227 | 0.5215 | 0.5243 | 0.5155 | 0.5097 | — | 0.4972 | — | — | 6.3 |
| 0.855 | 1.00 | 0.4735 | 0.4755 | 0.4815 | 0.4744 | 0.4703 | — | 0.4604 | — | — | 4.1 |

How the entries are computed. δ is exact for every n (q as a polynomial). n = 2, 3: tensor quadrature. n ≥ 4: the
search maximises the ratio on a fitting sample of quasi-random points (2^18 for n = 4, 2^20 for n ≥ 5), and the
entry is the ratio of the cubic it returns on independent samples: the mean over two samples of 2^21 points with
other scramble seeds for n ≥ 5 on the rows 0.80 and 0.82 (one sample of 2^19 or 2^20 points for n = 4 and for the
other rows). Measured spread between independent samples of one cubic: 0.03–0.27 % at n = 4, 0.10–0.26 % at
n = 5, 0.1–0.5 % at n = 6 to 31. The value on the fitting sample is biased upward (in the full searches with 2^20
points by 1.4 %, 1.8 %, 3.8 % and 5.2 % at n = 5, 6, 7, 8; by 3.3 % and 7 % at n = 5, 6 with 2^18 points)
and must not be quoted. The supremum is non-decreasing in n; an entry repeats the previous one when no larger
value was found with n variables. The entries for n ≥ 7 are from the reduced families: with fewer coefficients on
the same sample they fit less noise and return slightly larger true values than the full search (n = 7: 0.2483
against 0.2474; n = 8: 0.2532 against 0.2525). None of these numbers is a rigorous bound: δ is exact, but the
content and Ω̂ are estimated integrals.

- **Growth with n (data; no limit can be read off).** Row 0.80, largest values found at 0.85u* for n = 2, …, 13:
  0.1595, 0.1925, 0.2105, 0.2246, 0.2386, 0.2483, 0.2532, 0.2575, 0.2588, 0.2630, 0.2666, 0.2756 (increments 0.033,
  0.018, 0.014, 0.014, 0.010, 0.005, 0.004, 0.001, 0.004, 0.004, 0.009). At u*: 0.1367, 0.1679, 0.1847, 0.1987,
  0.2114, 0.2211, 0.2257, 0.2301, 0.2315, 0.2361, 0.2397, 0.2482 (increments 0.031, 0.017, 0.014, 0.013, 0.010,
  0.005, 0.004, 0.001, 0.005, 0.004, 0.008; the first value is not a possible response). The fourth excess of the
  maximiser falls: χ = 14.8, 9.3, 7.1, 5.6, 4.5, 3.8, 3.4, 3.0, 2.8, 2.5, 2.3, 2.1 at 0.85u*. From n = 2 to n = 6
  each added variable brought 0.033, 0.018, 0.014, 0.014; from n = 6 to n = 13 the gain is 0.037 at 0.85u* and 0.037
  at u*, about 0.005 per variable. Beyond n = 13 only the three-cluster family was run: its values for c = 4, 5, 6,
  7, 8, 9, 10 (n = 13, 16, 19, 22, 25, 28, 31) are 0.2743, 0.2736, 0.2758, 0.2743, 0.2766, 0.2734, 0.2724 at 0.85u*
  and 0.2470, 0.2467, 0.2493, 0.2481, 0.2508, 0.2481, 0.2474 at u* (formula; direct values in the table above). Up
  to n = 8 the values are confirmed by searches over all cubics; for n ≥ 9 they come from families chosen by hand,
  and the largest value at a given n has come from different families (the table of pairs above), so a larger value
  at any n ≥ 9 is not excluded. On the row 0.82 the values for n = 2, …, 13 are 0.2134, 0.2493, 0.2685, 0.2835,
  0.2975, 0.3075, 0.3075, 0.3075, 0.3172, 0.3172, 0.3172, 0.3314 at 0.85u* and 0.1835, 0.2179, 0.2367, 0.2525,
  0.2646, 0.2752, 0.2752, 0.2752, 0.2855, 0.2855, 0.2855, 0.3005 at u* (searches to n = 10, and the three-cluster
  family). On the rows 0.84 to 0.855 the searches were run for n ≤ 4 only (from n = 2 to n = 4 the ratio grows by
  the factors 1.32, 1.26, 1.19, 1.16, 1.14, 1.11 on the six rows); the three-cluster family there is in the table
  above: its largest value at 0.85u* is at c = 8, 4, 4, 4, 4, 4 on the rows 0.80, 0.82, 0.84, 0.845, 0.85, 0.855,
  and at c = 8 it is lower than at c = 4 by 0.7, 3.0, 3.7, 4.4, 5.2 % on the rows 0.82, 0.84, 0.845, 0.85, 0.855.
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
  (II) is below it by a factor 1.36. For n ≥ 5 the eigenvalues m_j come in clusters of equal values (n = 5: two of
  0.36e^{−0.26πi} and two of 0.30e^{0.18πi}; n = 7: two each of 0.27e^{−0.23πi}, 0.27e^{0.23πi} and 0.20), and in
  suitable
  coordinates R₃ consists of monomials y_a y_b ȳ_c whose three variables are different and all carry eigenvalues
  (n = 7: one variable from each cluster). So the maximisers leave the class "X times a form": they are not
  divisible by a linear form, and no class theorem below contains them.
- **What the maximisers use (P for the identities, N for the numbers).** Given y, the maximiser is
  q = √u·[X·(a·h₂(|X|²) + z) + r] with h₂(t) = (t − 2)/√2 and (z, r) = (Q(y), R₃(y)): apart from the junta, a
  Gaussian in X with variance u|z|² and **non-zero conditional mean** √u·r. The law of V and the content along X
  depend on y only through (z, |r|²), so the ratio is a functional of a and of the joint law of the pair
  (Q(y), |R₃(y)|²) on ℂ × [0, ∞). To first order in |r|² the bulk enters the content through E[Q·|R₃|²·h′(·)],
  that is through

      Cov(Q, |R₃|²) = Σ_j m_j·K_jj,      K_jj = Σ_μ |B_μ|²·deg_j(μ) ≥ 0,      Σ_j K_jj = 3‖R₃‖²,

  for R₃ = Σ_μ B_μ·(Wick monomial μ), with deg_j(μ) the degree of μ in y_j and ȳ_j together. At the maximisers
  Re m_j > 0 for every j and this covariance is real and positive in the phase of the junta: 0.285, 0.331, 0.332,
  0.330 for n = 3, …, 6 (correlation coefficient 0.45 to 0.54). In the class theorems below the bulk lives on fresh
  variables: it is independent of every cofactor, q is a centred Gaussian mixture given the cofactor variables, and
  the content comes from third cumulants of the cofactors only.
- **Surgery on the maximisers (N; row 0.80, 0.85u*; each variant renormalised to the energy u).**

  | n | maximiser | R₃ on an independent copy of y | R₃ → independent Gaussian | without R₃ | without the junta | lost without the dependence |
  |---|---|---|---|---|---|---|
  | 3 | 0.193 | 0.160 | 0.154 | 0.172 | 0.133 | 17 % |
  | 4 | 0.210 | 0.153 | 0.153 | 0.176 | 0.148 | 27 % |
  | 5 | 0.223 | 0.154 | 0.160 | 0.185 | 0.158 | 31 % |
  | 6 | 0.238 | 0.139 | 0.154 | 0.181 | 0.173 | 41 % |
  | 7 | 0.247 | 0.129 | 0.150 | 0.180 | 0.182 | 48 % |

  "Independent copy": R₃(y′) with y′ an independent copy of y, so that R₃ keeps its law and loses its dependence on
  the cofactor. An independent bulk lowers the ratio below the value without any bulk; the dependent one raises it.
  (This test evaluates δ by quadrature as well; its values are good to about 1 %.)
- **A reduced family that reproduces the maxima for n ≤ 6 in minutes ("bipartite"; N).** With X the content
  direction, a cluster A of p variables and a cluster B of q variables (n = 1 + p + q):

      q = √u·[a·H(X) + X·Σ_j m_j(|y_j|² − 1) + Σ_{c∈A} (ȳ_c·P_c(y_B) + y_c·N_c(y_B))],

  P_c holomorphic quadratics and N_c (1,1)-forms in the variables of B, Wick-ordered; a real, m_j complex:
  1 + p + q + p(3q² + q)/2 coefficients. `ref/bipartite.py` (numpy and scipy only; usage in its header) searches
  it: (p, q) = (1,1), (1,2), (2,2), (2,3) give 0.1925, 0.2104, 0.2246, 0.2378 on the row 0.80 at 0.85u*, which are
  the full maxima for n = 3, 4, 5 and 0.3 % below the full maximum for n = 6, in about 2, 3, 6 and 7 minutes on one
  core (98, 194, 344 and 426 s measured on a core shared with another job).
  Its values further out: 0.2410 (n = 7; (3,3)), 0.2532 (n = 8; (3,4)), 0.2575 (n = 9; (3,5)), 0.2585 (n = 10;
  (4,5)), 0.2630 (n = 11; (4,6)) at 0.85u* and 0.2257 (n = 8; (3,4)), 0.2301 (n = 9; (3,5)), 0.2312 (n = 10; (4,5)),
  0.2361 (n = 11; (4,6)) at u* (the pair is (p, q); q = p + 1 or p + 2 is best). It is not the whole structure: for
  n = 7 it gives 0.2410 at (3,3), where the maximiser (0.248) has three clusters of two variables and R₃ consists of
  the monomials y_a y_b ȳ_c with one variable from each cluster. Families with three or four clusters and R₃ on the
  monomials across clusters give 0.2483 (n = 7; 2,2,2), 0.2465 (n = 8; 2,3,2), 0.2528 (n = 9; 3,2,3), 0.2575 (n =
  10; 3,3,3), 0.2577 (n = 11; 4,2,4), 0.2666 (n = 12; 4,3,4), 0.2715 (n = 13; 4,4,4) at 0.85u* and 0.2209 (n = 7;
  2,2,2), 0.2188 (n = 8; 2,3,2), 0.2253 (n = 9; 3,2,3), 0.2310 (n = 10; 3,3,3), 0.2336 (n = 11; 3,4,3), 0.2397 (n =
  12; 4,3,4), 0.2402 (n = 13; 4,4,4) at u* (cluster sizes after the semicolon).
- **Three clusters: an exact reduction to the law of one scalar (P), and what it gives (N).** Take three clusters of
  c cofactor variables (n = 3c + 1), S_k = Σ_{j∈k}|y_j|², and assume: (H1) the eigenvalue is constant on each
  cluster (m_j = m_k for j in cluster k); (H2) R₃ is supported on the 3c³ monomials y_a y_b ȳ_c with a, b, c in
  three different clusters. By (H2) R₃ is homogeneous of degree one in each cluster, so R₃(y) = (S₁S₂S₃)^{1/2}·R₃(ω)
  with ω uniform on the product of the three unit spheres and independent of (S₁, S₂, S₃). Hence q has the law of

      q = √u·[X·A + σ·√G·e^{iψ}],     A = a·h₂(|X|²) + Σ_k m_k·(S_k − c),     σ² = s_R·S₁S₂S₃/c³,     a² + c·Σ_k|m_k|² + s_R = 1,

  with |X|² ~ Exp(1), S_k ~ Gamma(c), ψ uniform and G = c³|R₃(ω)|²/‖R₃‖² (so E G = 1), all independent. With φ
  uniform,

      V = |q|² = u·(|X|²|A|² + σ²G + 2|X||A|σ√G·cos φ),     c_X = √u·E[(|X|²·A + (A/|A|)·|X|σ√G·cos φ)·h(V)],

  the content is c_X·e_X, δ = E V² − 2u², and Ω̂ is the functional of §1 of the law of V: the ratio |c_X|²/(δ·Ω̂) is
  an integral over five moduli and one angle, and it depends on R₃ only through the law of G. Put κ = E G² =
  (c/(c+1))³·E|R₃|⁴/(E|R₃|²)² (Gaussian expectations on the right): κ = 2 when the bulk is Gaussian given the
  cluster sums (G exponential), κ = 1 when its modulus is fixed. The reduction under (H1), (H2) is P; everything
  below is N.
  - *The search maximisers are of this form, with the bulk of smallest κ.* At the maximisers of the searches for c =
    2, 3, 4 the eigenvalues are constant on clusters to 1–8 %, E[|R₃|² | all moduli] is s_R·S₁S₂S₃/c³ to 1 %, Cov(Z,
    |R₃|²) = s_R·Σ_k m_k to 1 %, and κ = 1.334, 1.591, 1.619. Minimising κ over the 3c³ coefficients (exact fourth
    moments; L-BFGS from 2 to 9 random starts; the smallest value found, so an upper bound of the infimum):

    | c | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 |
    |---|---|---|---|---|---|---|---|---|---|---|
    | smallest κ found | 1 | 1.3333 | 1.5800 | 1.6000 | 1.7057 | 1.7481 | 1.7930 | 1.7997 | 1.8329 | 1.8476 |
    | (2 − κ)·c | 1.00 | 1.33 | 1.26 | 1.60 | 1.47 | 1.51 | 1.45 | 1.60 | 1.50 | 1.52 |
    | proved lower bound 2c²/(c+1)² (and κ ≥ 1) | 0.5000 | 0.8889 | 1.1250 | 1.2800 | 1.3889 | 1.4694 | 1.5312 | 1.5802 | 1.6200 | 1.6529 |
    | one type alone | 1.0000 | 1.4815 | 1.6875 | 1.7920 | 1.8519 | 1.8892 | 1.9141 | 1.9314 | 1.9440 | 1.9534 |
    | κ at the search maximiser | — | 1.334 | 1.591 | 1.619 | — | — | — | — | — | — |

    One type alone (all monomials conjugated in the same cluster) has κ ≥ 2(1 + 3/c)/(1 + 1/c)³, with equality
    exactly for tensors whose three flattenings have flat singular values (P); the minimisers mix the three types so
    that their energies are anti-correlated. For c = 2 the value 4/3 is attained by the explicit cubic R₃ =
    z₂·(x̄₁y₁ + x̄₂y₂) + z̄₁·(x₁y₂ − x₂y₁), with x, y, z the three clusters (P, from |⟨x, y⟩|² + |x∧y|² = |x|²|y|²).
    That 4/3 is the minimum, and all the values for c ≥ 3 (8/5 to ten digits at c = 4; 1.5800205 at c = 3), are what
    the optimiser found, not proved. (2 − κ)·c lies between 1.26 and 1.60 for 2 ≤ c ≤ 10.
  - *A lower bound (P): κ ≥ 2c²/(c + 1)² = 2 − 4/(c + 1) + 2/(c + 1)² for every cubic of the family.* Write R₃ = t₁
    + t₂ + t₃ by type (t_k: the monomials conjugated in cluster k). The three types have different characters under
    the phases of the clusters, so with Gaussian expectations E|R₃|⁴ = Σ_k E|t_k|⁴ + 4·Σ_{k<l} E|t_k|²|t_l|². First,
    E|t_k|²|t_l|² ≥ E|t_k|²·E|t_l|²: with the fourth moments of the spheres, E|t_k|²|t_l|² is a sum of eight
    contractions of the two tensors; four are non-negative (among them ‖T_k‖²‖T_l‖², which is the right-hand side)
    and each of the other four is bounded in modulus by one of the non-negative ones (Cauchy–Schwarz). (It is also
    an instance of the non-negative correlation of squares of elements of Wiener chaoses: Malicet, Nourdin, Peccati,
    Poly, J. Funct. Anal. 270 (2016), arXiv:1503.02154, Theorem 1.1 with d = 2, applied to the real and imaginary
    parts of t_k and t_l.) Second, E|t_k|⁴ = 2(‖T_k‖⁴ + Σ_j Tr G_j²) ≥ 2(1 + 3/c)·(E|t_k|²)², with G_j the
    Gram matrices of the three flattenings. So E|R₃|⁴ ≥ (2 + (6/c)·Σ_k w_k²)·(E|R₃|²)² ≥ (2 + 2/c)·(E|R₃|²)², w_k
    the weights of the types, and κ ≥ (c/(c+1))³·(2 + 2/c). Each of the two inequalities is attained (numerically,
    for c = 2, 3), but not both at once: the bound is 0.89, 1.28, 1.58, 1.70 at c = 2, 4, 8, 12 against 1.33, 1.60,
    1.80 found. So κ → 2 as c → ∞ in this family, at a rate between 1.26/c and 4/c.
  - *Cubics with that bulk:* the table above (R₃ = √s_R × the minimiser). On the row 0.80 the values for c = 2, 3,
    4, 5, 6, 7, 8, 9, 10 are 0.2483, 0.2588, 0.2743, 0.2736, 0.2758, 0.2743, 0.2766, 0.2734, 0.2724 at 0.85u* and
    0.2211, 0.2315, 0.2470, 0.2467, 0.2493, 0.2481, 0.2508, 0.2481, 0.2474 at u*.
  - *A Gaussian bulk (κ = 2, G exponential), for comparison:* largest ratio 0.1954, 0.2231, 0.2371, 0.2445, 0.2505,
    0.2513, 0.2479 at 0.85u* for c = 1, 2, 3, 4, 6, 8, 12 and 0.1966, 0.2103, 0.2178, 0.2244, 0.2259, 0.2238 at u*
    for c = 2, 3, 4, 6, 8, 12 on the row 0.80. It is 8 to 11 % below the search values at c = 2, 3, 4.
  - *Sensitivity to κ (data).* With G ~ Gamma(k)/k, k = 1/(κ − 1), the formula reproduces the six search values at c
    = 2, 3, 4 to 0.1–1 % when κ is the measured one. The ratio is steep in κ: on the row 0.80 at 0.85u*, κ = 1.6
    gives 0.302, 0.333 at c = 6, 8, where the cubics with the smallest κ found (1.75, 1.80) give 0.2758, 0.2766 (κ =
    1.6 at c = 12, excluded by the bound, would give 0.496). With κ at the proved lower bound (1.00, 1.12, 1.28,
    1.39, 1.47, 1.53, 1.58, 1.65, 1.70, 1.77, 1.84, 1.90 at c = 2, 3, 4, 5, 6, 7, 8, 10, 12, 16, 24, 40; κ = 1 where
    the bound is below 1) and G of Gamma shape, the formula gives 0.285, 0.333, 0.341, 0.345, 0.345, 0.345, 0.343,
    0.338, 0.334, 0.323, 0.304, 0.275 at 0.85u* and 0.258, 0.305, 0.313, 0.317, 0.318, 0.318, 0.317, 0.313, 0.309,
    0.300, 0.282, 0.257 at u* on the row 0.80: the largest of these, 0.345 and 0.318, are below the allowances 0.49
    and 0.36. So in this mechanism the supremum over n is decided by two things that are open: the value of κ_min(c)
    between the proved 2 − 4/(c + 1) and the 2 − 1.5/c found, and the largest value of the formula over the laws of
    G that a cubic can have (the Gamma shape is an approximation; only E G = 1 and E G² = κ are matched: at c = 6,
    u*, two-point laws of G with the same two moments, G ∈ {0, κ} and G = 1 ± √(κ − 1), give 0.324 and 0.318 at κ =
    1.47, where the Gamma shape gives 0.318, and 0.255 and 0.253 at κ = 1.75, where the cubic itself gives 0.249).
  - *Scripts.* `ref/kappa.py`: the explicit cubic, the minimisation of κ, the formula for any κ or for the bulk in a
    file (`ref/bulk/`), and the direct check in 3c + 1 variables. `ref/clusters.py`: the search in the cluster
    family; c = 2 returns 0.2481 at 0.85u* in 209 s on one core; c = 3 returns 0.2573 in 625 s.
- **Two families with many variables whose ratio is a two-dimensional integral (P for the reductions; N for the
  values).** J shared variables y_1, …, y_J, all with the same eigenvalue m; S = Σ_{j≤J}|y_j|² (a Gamma(J) variable);
  W a standard complex Gaussian independent of (X, S):

      q = √u·[X·(a·h₂(|X|²) + m·(S − J)) + σ(S)·W].

  (a) *A limit model:* bulk terms b·ȳ_j·Γ_j, with Γ_j the Gaussian limit of a diffuse holomorphic quadratic in fresh
  variables (ȳ_j·P_j(U) ∈ H₂,₁): σ² = b²·S, a² + J(|m|² + b²) = 1. It is a limit of cubics, reached slowly: with Γ
  replaced by a quadratic in K fresh variables at the J = 1 maximiser the ratio is 0.152, 0.178, 0.190 for
  K = 2, 4, 8, against 0.210.
  (b) *Genuine cubics in 1 + J + J(J+1)/2 variables:* bulk terms g·P_cd(y)·conj(L_cd), c ≤ d ≤ J, with P_cc = y_c²/√2,
  P_cd = y_c y_d and one fresh variable L_cd for each: given (X, y) the bulk is exactly Gaussian, σ² = g²·S²/2,
  a² + J|m|² + g²·J(J+1)/2 = 1.
  In both the content is along X. For a = 0 they are centred conditionally Gaussian mixtures like those of the class
  theorems; the one difference is that the variance of the bulk is modulated by the cofactor variables, which gives
  the first-order coupling E[Z·σ²] ≠ 0 between the cofactor Z = m(S − J) and σ². Largest ratio over the parameters,
  row 0.80:

  | J | 1 | 2 | 3 | 4 | 5 | 6 | 8 | 10 | 12 | 14 | 16 | 20 | 30 | 40 |
  |---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
  | (a), 0.85u* | 0.2101 | 0.2359 | 0.2429 | 0.2439 | 0.2421 | 0.2398 | 0.2332 | 0.2281 | — | 0.2171 | — | 0.2040 | — | — |
  | (a), u* | 0.1867 | 0.2116 | 0.2187 | 0.2200 | 0.2187 | 0.2169 | 0.2113 | — | — | — | — | — | — | — |
  | (b), 0.85u* | — | 0.2041 | 0.2223 | 0.2330 | — | 0.2440 | 0.2481 | 0.2492 | 0.2492 | — | 0.2458 | 0.2425 | 0.2318 | 0.2238 |
  | (b), u* | — | — | — | 0.2066 | — | 0.2176 | 0.2221 | 0.2237 | 0.2241 | — | 0.2218 | 0.2191 | 0.2102 | — |

  (χ falls from 4.6 to 0.4 along (a) and from 6.9 to 0.6 along (b); every maximiser is a possible response; an added
  independent bulk is never used; without the junta, a = 0, family (a) gives at most 0.203.) Both families rise and
  then fall: (a) peaks at J = 4, (b) near J = 10 to 12, that is in 66 to 91 variables. **The finite maximisers are
  above both** (0.276 at 0.85u* and 0.250 at u*). Their R₃ consists of terms ȳ_c y_a y_b in which all three
  variables carry eigenvalues, so the covariance of the cofactor with the bulk energy is 3 times (a mean eigenvalue)
  × (bulk energy), against 2 times in (b) and once in (a); and, unlike in (a) and (b), their bulk is not Gaussian
  given the cofactor variables (κ < 2 in the reduction above). With a Gaussian bulk the three-cluster structure
  itself stops at 0.251 and 0.226.
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
  are outside: they have a junta term and a bulk on the cofactor's own variables (§3, "what the maximisers use").
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
- `ref/bipartite.py` (self-contained, numpy and scipy only: the bipartite family of §3, its search with an exact δ,
  and the evaluation on independent samples; reference values and run times in its header)
- `ref/clusters.py` (the search in the cluster family of §3: R₃ on the monomials across clusters; it imports
  `ref/bipartite.py`; reference values in its header)
- `ref/kappa.py` and `ref/bulk/bulk_c<c>.json` (the reduction of §3: the explicit cubic for c = 2, the minimisation of κ,
  the formula for any κ or any bulk, the direct check; the bulks of smallest κ found for c = 2, 3, 4, 5, 6, 7, 8, 9, 10)

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
