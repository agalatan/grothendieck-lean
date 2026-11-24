# P5. A six-dimensional integral inequality: the content ratio in the three-cluster family

**Summary.** In a family of cubic Wick polynomials built from one "driver" variable and three clusters of c
variables, the ratio (first-chaos content)²/(fourth cumulant × a law functional) is an explicit integral over five
radial variables and one angle, depending on the cubic through eight real parameters and the law of one scalar
G = B_c·H. Prove that this ratio stays below a given allowance for every c ≥ 2, every parameter value and every
admissible law of H, on a band of energies, for eleven explicit radial profiles; or find parameters and a law that
exceed it.

This is the special case of problem P1 (same folder) in which all the largest ratios found so far live. It is
finite-dimensional for each c, and uniform in c is the point.

Source record (not needed to do the work): ledger row 4.30 and §5 item 2 ("the κ question") of
`research/higher-degree/STATUS.md`; `sources/content-problem-v2-2026-11-16/PROBLEM_V3.md` §3;
`sources/kappa-three-cluster-2026-11-17/NOTE.md`; `sources/kappa-spheres-2026-11-24-gemini-21d5/PROOF.md`
(repository `agalatan/grothendieck-lean`, master). Scripts:
`research/higher-degree/code/degree5-attack/ref/` (`kappa.py`, `bipartite.py`,
`clusters.py`, `bulk/bulk_c<c>.json`).

Labels: **P** proved on paper, **C** certified by exact or interval arithmetic, **N** floating point (a search gives
a lower bound of a supremum); "author only" when nobody but the author has checked it.

---

## 1. Setting and notation

**The random variables.** Independent:

- R ~ Exp(1) (the squared modulus of a standard complex Gaussian X);
- S₁, S₂, S₃ ~ Gamma(c) (shape c, scale 1: sums of c independent Exp(1) variables); c ≥ 2 an integer;
- φ uniform on [0, 2π);
- B_c ~ c·Beta(1, c − 1), i.e. density ((c − 1)/c)(1 − b/c)^{c−2} on [0, c] (for c = 2: uniform on [0, 2]);
  E B_c = 1, E B_c² = κ₀(c) := 2c/(c + 1);
- H ≥ 0 with E H = 1 and H ≤ 3c² (otherwise arbitrary), and G := B_c·H. Put κ := E G² = κ₀(c)·E H² ≥ κ₀(c).

**Parameters.** a ≥ 0, (m₁, m₂, m₃) ∈ ℂ³, s_R ≥ 0 with a² + c·(|m₁|² + |m₂|² + |m₃|²) + s_R = 1; energy u > 0.

**The model.** With h₂(R) = (R − 2)/√2:

    A = a·h₂(R) + Σ_{k=1}^{3} m_k·(S_k − c)   ∈ ℂ,          σ² = s_R·S₁S₂S₃/c³,
    V = u·( R·|A|² + σ²·G + 2·√R·|A|·σ·√G·cos φ ).

Then E V = u (check: E[R|A|²] = a²·E[R·h₂²] + c·Σ|m_k|²·E R = a² + cΣ|m_k|², since E[R(R − 2)²]/2 = 1 and
E[R(R − 2)] = 0; E σ² = s_R).

**The three functionals.** For a real, bounded, continuous profile h on [0, ∞), with τ ~ Exp(1) independent:

    k′(v) = (E h(v + u·τ) − h(v))/u,
    c_X  = √u · E[ ( R·A + (A/|A|)·√R·σ·√G·cos φ ) · h(V) ]                    (a complex number),
    δ    = u²·( E[ R²|A|⁴ + 4·R·|A|²·σ² + κ·σ⁴ ] − 2 )                          (= E V² − 2u²),
    Ω̂    = (3/2)·E[V·k′(V)²] − (3/4)·(E[V·k′(V)])²/u,
    ratio = |c_X|² / (δ·Ω̂).

**Where this comes from (P; you may take it as the definition).** Let X, and three vectors x, y, w of c independent
standard complex Gaussians each ("clusters"), all independent. Let R₃ be a polynomial in the span of the 3c³
monomials x̄_a y_b w_d, x_a ȳ_b w_d, x_a y_b w̄_d (one variable from each cluster, exactly one conjugated), and

    q = √u·[ a·X(|X|² − 2)/√2 + X·Σ_k m_k(S_k − c) + √s_R·R₃/‖R₃‖₂ ],     S₁ = |x|², S₂ = |y|², S₃ = |w|².

q lies in the complex Wick chaos H₂,₁ of the 3c + 1 variables, V has the law of |q|², c_X = E[X̄·q·h(|q|²)] is the only
non-zero component of the first-chaos projection of q·h(|q|²), and G = c³|R₃(ω)|²/‖R₃‖₂² with ω uniform on the
product of the three unit spheres. For every such R₃, G = B_c·H in law with H as above (P: fix two of the unit
vectors; R₃ is then a real-linear map from the third sphere to ℂ = ℝ², and the squared norm of the projection of a
uniform point of S^{2c−1} on a plane is Beta(1, c − 1); H ≤ 3c² from |R₃| ≤ √α + √β + √γ on unit vectors). Not every
H in the class above comes from a polynomial; the class is a relaxation.

**The profiles.** The eleven rows and their profiles h_A, h_B are those of problem P1 (§1.1 there): JSON tables
`research/higher-degree/code/degree5-content/profiles/band_row_<t>.json` (t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855)
and `research/higher-degree/code/degree5-content/profiles_low/band_row_<t>.json` (t = 0.70, 0.72, 0.74, 0.76, 0.78).
From a file: G_A(s) = `GA` + 0.4·`G0`, G_B(s) = `GB` + 0.3·`G0` on the amplitudes `S` ∈ [0, 6] (cubic spline; constant
beyond 6), h_X(v) = G_X(√v)/√v, and u\* = `ustar`. The definitions behind the tables (two-dimensional Gaussian
integrals with explicit row constants in the key `row`) are in P1 §1.1.

**The response restriction.** ρ(x) = (√π/2)·e^{−x/2}·[(1 + x)·I₀(x/2) + x·I₁(x/2)], ε₁ = 39/50. A parameter point is
*admissible* for a file if E ρ(λ²V) ≥ t_lo + λu/ε₁ for all λ > 0 (`t_lo` of the file; for the six band rows
t_lo = 0.7850, 0.8117, 0.8348, 0.8424, 0.8476, 0.8523).

---

## 2. The statement

> **Target.** For each of the five files of `profiles_low/`: for every integer c ≥ 2, every admissible
> (a, m₁, m₂, m₃, s_R), every law of H ≥ 0 with E H = 1 and H ≤ 3c², every energy u in the range of the file's list
> `allowance`, and both profiles h ∈ {h_A, h_B}:
>
>     ratio ≤ θ_room(u)        (the list `allowance` of the file, interpolated linearly).
>
> Same question for the six files of `profiles/` with θ(u) = θ_t·max(1, u\*/u)^{1.8},
> θ_t = 0.36, 0.64, 1.33, 1.88, 2.5, 3.7, on u/u\* ∈ [0.37, 1.22], [0.43, 1.16], [0.54, 1.14], [0.58, 1.08], [0.63, 1.09],
> [0.70, 1.11].

Band minima of θ_room on the five covering files: 0.2190 at 1.612u\* (piece 0.70), 0.2587 at 1.500u\* (0.72), 0.3141
at 1.455u\* (0.74), 0.4000 at 1.492u\* (0.76), 0.5232 at 1.448u\* (0.78).

**Weaker versions that are still useful.**
- The same with H restricted to the laws that come from actual polynomials R₃ (then also: G has a non-increasing
  density, E G³ ≥ 3(c + 1)κ²/(2(c + 2)), and κ ≥ 2c/(c + 1) + 1/(1014(c + 1)³) for odd c).
- The same for H ≡ 1 (G = B_c exactly; possible for a polynomial only when c ∈ {2, 4}), which is conjecturally the
  worst case at each c.
- A bound ratio ≤ F(file, u) with F explicit, even if F exceeds the allowance at some energies: the allowances may
  move (see the warning in P1 §2.4: in the worst case they must be multiplied by about 0.6, and the band minimum of the
  piece 0.70 would then be 0.13, **below** the values found; more likely the loss is 5–20 %. Do not treat the table
  as final).

**Room, as measured (N).** Piece 0.70: the largest ratios found with actual bulks are 0.1601, 0.1626, 0.1650,
0.1632 at 1.612u\* for c = 4, 6, 8, 10 (allowance 0.2190; factor 1.33) and 0.1739, 0.1764, 0.1790, 0.1770 at 1.449u\*
(allowance 0.2323; factor 1.30). Piece 0.74: 0.1911–0.1964 against 0.3141. Row 0.80: 0.2724–0.2766 at 0.85u\* against
0.49, and 0.2467–0.2508 at u\* against 0.36, for c = 4, …, 10.

---

## 3. What is known

- **The reduction** (the model of §1 is exactly the cubic) and **the content is along X**: P, author only.
- **κ ≥ 2c/(c + 1)** for every R₃ (P, re-derived by a second party), with equality iff c ∈ {2, 4}; explicit
  minimisers: c = 2: R₃ = w₂(x̄₁y₁ + x̄₂y₂) + w̄₁(x₁y₂ − x₂y₁), κ = 4/3; c = 4: a quaternion-type form, κ = 8/5. For odd
  c a strict gap (P + C, author only). Best known upper bounds for min κ: 1.58002048 (c = 3), 875/513 (c = 5),
  2484/1421 (c = 6), 1.79601358 (c = 7), 1312/729 (c = 8), 8019/4375 (c = 9), 120500/65219 (c = 10) (P + C, author
  only). The optimal C in κ ≥ 2 − C/c lies in [1168/729, 2].
- **The ratio is steep in κ and decreasing in it (N).** With G of Gamma shape (G ~ Gamma(k)/k, k = 1/(κ − 1)), row
  0.80 at 0.85u\*: κ = 2 (Gaussian bulk) gives at most 0.251 over c; κ = 1.6 gives 0.302, 0.333 at c = 6, 8.
- **Thresholds on the piece 0.70 (N, Gamma shape).** The value of κ at which the maximised formula reaches the
  allowance 0.2323 at 1.449u\*: κ\*(c) = 1.290, 1.407, 1.488, 1.596, 1.662, 1.708 for c = 4, 5, 6, 8, 10, 12. The proved
  floors 2c/(c + 1) are 1.600, 1.667, 1.714, 1.778, 1.818, 1.846: above the thresholds by 0.14–0.31. An earlier,
  weaker floor (2c²/(c + 1)²) missed them by 0.001–0.019; with it the Gamma-shape values were 0.2281–0.2402 at
  1.449u\* (up to 3.4 % above the allowance). With the intermediate "Wick" floor 2c²(3c + 5)/(3(c + 1)³) the
  Gamma-shape values are 0.1924–0.1979 at 1.449u\* and 0.1786–0.1838 at 1.612u\*.
- **The shape of the law matters at the 10 % level (N).** Two-point laws of G with the same first two moments give
  ratios 9–11 % above the Gamma shape at the stored maximisers; the exact Beta law at c = 4 (H ≡ 1) gives
  0.1548–0.1573 and 0.1680–0.1709 at 1.612u\* and 1.449u\*, below the Gamma shape with the same κ.
- **Comparison laws (P).** E H² = κ/κ₀; G dominates B_c in the convex order; W₂²(G, B_c) ≤ κ − κ₀ for the natural
  coupling; explicit W₂ bounds to the moment-matched Gamma law.
- **Reproduced for this file (N):** `kappa.py formula 0.70 1.612 4 bulk_c4.json` gives 0.1594 (quasi-Monte-Carlo;
  the record's product quadrature 0.1601) with maximiser a² = 0.052, cΣ|m_k|² = 0.285, s_R = 0.663,
  m = (0.138e^{−0.11πi}, 0.141e^{−0.15πi}, 0.180e^{+0.25πi}), χ = δ/u² = 1.78; the same cubic evaluated directly in 13
  variables gives 0.1609 (two samples: 0.1606, 0.1611) and is admissible (response margin 0.717 against 0.6949).
  `kappa.py explicit` gives κ = 4/3 for the c = 2 form.

---

## 4. Why the obvious approaches fail

- **Using only κ.** The ratio is not a function of (c, parameters, κ): two laws of G with the same two moments
  differ by 10 %. A proof must control the law (the factorisation G = B_c·H and the constraints on H are what is
  available).
- **Replacing the bulk by a Gaussian (κ = 2).** That is the limit c → ∞ at H ≡ 1 and gives *smaller* ratios
  (0.251/0.226 against 0.276/0.250 on the row 0.80); the finite-c bulks are less dispersed and worse.
- **Making the bulk independent of the cofactor.** In the model the bulk variance σ² = s_R S₁S₂S₃/c³ depends on the
  same S_k as the cofactor Σm_k(S_k − c); this dependence carries 17–48 % of the ratio. Dropping it (the class
  theorems of P1 §3.2 do) loses the mechanism.
- **Large c by a central limit argument with absolute errors:** the errors are of order c^{−1/2} and the margin is
  30 %; an expansion in 1/c with explicit remainders is needed, or monotonicity in c beyond some c₀.

---

## 5. Suggested approaches

- **Structure.** Conditionally on (R, S₁, S₂, S₃), V/u is |ξ + ζ|² with ξ = √R·|A| deterministic and ζ = σ√G·e^{iφ}
  an isotropic complex variable with radial law σ²G. For H ≡ 1 and c → ∞, ζ is Gaussian and the inner integrals are
  Gaussian smoothings of h: E[h(|ξ + ζ|²)] = (𝒦_{σ²u}h)(uξ²) in the notation k(v, s) = E h(v + sτ). For finite c the
  Beta factor replaces the exponential law of |ζ|²/σ² by c·Beta(1, c − 1), a compactly supported law. This suggests
  writing the three functionals as integrals of explicit kernels against the law of (ξ², σ²) ∈ ℝ₊², a
  two-dimensional law determined by (a, m, s_R, c), plus the law of H.
- **Convexity in the law of H.** At fixed parameters, c_X and δ are affine in the law of H (δ through κ) and Ω̂ is
  concave in the law of V, hence in the law of H. By the arithmetic–geometric mean, |c_X|² ≤ θ·δ·Ω̂ holds iff
  F_{λ,ψ} := 2Re(e^{iψ}c_X) − λ·δ − (θ/λ)·Ω̂ ≤ 0 for all λ > 0 and all phases ψ, and each F_{λ,ψ} is a convex
  functional of the law of H. A convex functional on the laws on [0, 3c²] with E H = 1 is maximal at an extreme
  point, and the extreme points are laws with at most two atoms. This reduces "every law of H"
  to a two-parameter family per (c, parameters); it is in the record as a tool for a related family (P, author
  only) and was not applied here. Note that two-point laws are *worse* than the truth by about 10 %: if the
  two-point relaxation exceeds the allowance, restrict to laws from polynomials (non-increasing density of G, the
  third-moment bound).
- **Uniformity in c.** For c ≥ c₀ compare with the limit c = ∞ (Gamma(c)/c → 1, B_c → Exp(1)) with explicit
  remainders in 1/c; for c < c₀ a certified cover of the compact parameter set {a² + cΣ|m_k|² + s_R = 1} × phases
  (seven real dimensions after removing a common phase of m) × the two-point family of H × the energy band. The
  cover is large; exploit that the integrand is smooth in the parameters and that the maximisers found are
  isolated (m₁ ≈ m₂ with a negative phase, m₃ with a positive one, s_R ≈ 0.66, a² ≈ 0.05).
- **Certified evaluation.** The profiles must be enclosed from their definitions (P1 §1.1). Interval arithmetic
  with outward rounding; the integrals over R, S_k are against smooth densities with exponential tails; the
  integrand is bounded (|h| ≤ sup|h|, V·k′(V)² bounded) so tail bounds are elementary. The degree-3 analogue of
  such a cover (a different inequality) used about 1.2·10⁶ boxes in four dimensions.

---

## 6. Deliverable

- A proof note: the exact class of (c, parameters, H) covered, the bound obtained as a function of (file, u), each
  step checkable; the convexity reduction, if used, proved in full.
- A certifier with its result file and an independent verifier; exact rational or interval arithmetic
  (python-flint/Arb, or C++ with outward rounding and an exact verifier); negative controls: it must reject
  the target with θ_room replaced by 0.15 on the piece 0.70 at 1.612u\* (the stored c = 4 cubic has 0.16), and it
  must reject "ratio ≤ 0.22" on the row 0.80 at 0.85u\* (the stored cubics have 0.27).
- For a counterexample: c, the parameters, the law of H (and whether it comes from a polynomial R₃, with the
  polynomial), the energy, admissibility, and the three integrals from two independent quadratures.
- Labels "P, author only", "C, author only", "N".

---

## 7. How to test a claimed result

1. **The script.** From a folder containing `research/higher-degree/code/degree5-content/profiles_low/` (the five JSON files) and `ref/`:
   `python3 research/higher-degree/code/degree5-attack/ref/kappa.py formula 0.70 1.612 4 research/higher-degree/code/degree5-attack/ref/bulk/bulk_c4.json research/higher-degree/code/degree5-content/profiles_low/ --direct` must print a
   formula value near 0.159–0.160 and a direct value 0.1609 (two minutes; numpy and scipy).
   `python3 research/higher-degree/code/degree5-attack/ref/kappa.py formula 0.70 1.612 4 1.6 research/higher-degree/code/degree5-content/profiles_low/` uses G ~ Gamma(k)/k with κ = 1.6.
   `python3 research/higher-degree/code/degree5-attack/ref/kappa.py explicit` must print κ = 1.3333333333.
2. **Your own evaluation of the model of §1** at the stored maximiser of the piece 0.70 at u = 1.612u\*
   (u\* = 0.097518): c = 4, a² = 0.052, |m| = (0.138, 0.141, 0.180), arg m = (−0.11π, −0.15π, +0.25π), s_R = 0.663,
   G = B₄ (H ≡ 1; this is the stored bulk, whose κ is 8/5). An evaluation written for this file from the formulas
   of §1 (quasi-Monte-Carlo, 2²⁰ points, two seeds) gives for h_A: 0.1606 and 0.1597 at 1.612u\*, 0.1741 at 1.449u\*,
   with δ/u² = 1.768; for h_B: 0.1339 and 0.1481. With G ~ Exp(1) (κ = 2) at the same parameters: 0.1293 and 0.1403
   (h_A). With H two-valued, H = 1 ± √0.2 with equal weights (κ = 1.92): 0.1342 and 0.1456.
3. **Consistency of δ.** E[R²|A|⁴ + 4R|A|²σ² + κσ⁴] can be computed in closed form from the moments of Exp(1) and
   Gamma(c); compare with a sampled E V²/u².
4. **Limits.** s_R = 0 and m = 0 (a = 1) is the one-variable junta: ratio 0.0404 for h_A on the cover of the piece
   0.70 at 1.612u\*, 0.0457 at 1.449u\* (a one-dimensional rule; the model code gives 0.0407 and 0.0461). a = 0,
   s_R = 0 with one non-zero m_k is X·(S_k − c)/√c with δ/u² = 4 + 12/c, for which the proved class bound
   ratio ≤ 77/(9(c + 3)) must hold (at c = 4, 1.612u\*: ratio 0.031).
5. **Admissibility.** For each candidate evaluate min_{λ ∈ [0.1, 8]} [E ρ(λ²V) − λu/ε₁] ≥ t_lo.
