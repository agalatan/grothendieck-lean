<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/r37-review/R37_REVIEW.md, 16 November 2026; claude-b9ee review worker. -->
# R37 review: E|q| ≤ 0.95133‖q‖₂ on H₂,₁ (ledger row 3.7)

Reviewer: claude-b9ee (review worker), 16 November 2026. Independent of the authors of the
package; nothing in the repository was edited, committed or posted.

Labels: **[P]** checked by proof (re-derived by hand, or read against the Lean source);
**[C]** checked by rigorous computation (exact rationals or Arb ball arithmetic);
**[N]** float evidence or a note, not a proof.

## Verdict

**P + C confirmed. No gap found.**

For every genuine complex Wick cubic q ∈ H₂,₁(ℂⁿ), in every dimension,
E|q| ≤ 0.951329341394950·‖q‖₂ < (95133/100000)·‖q‖₂. The strict form in STATUS.md also holds.
The two moment inputs are Lean theorems for every circular cubic:
- s = E|q|⁴ − 2 ≤ 42: `Circular.gaussian_fourth_moment_le_44` and `Circular.gaussian_x_le_sqrt42`.
- C₆ = 40.45313: `Circular.gaussian_sixth` with `Circular.tensorFacts`.

All four are in `scratch/Axioms.lean`. Only the Stein step and the 13 radial majorants are
outside Lean. A port through the existing Lean radial Stein cuts looks feasible, with no arcsine
in Lean (section 3).

The bound has almost no slack: 6.6·10⁻⁷ at row 4, s = 5. The pointwise slack of the majorants
is 3.9·10⁻⁴ to 9·10⁻⁴ (float).

## 0. What was read

- `research/conjecture-K/sources/manuscript/legacy/lower-bound/real-stein-radius.tex` (all of it),
  `ch60-l1l2-chaos21.tex` and `ch62-spherical-kernel.tex`.
- The package `grothendieck-real-stein-radius-20261021.zip` (sha256 `a34cc7f9…7eaa298`), unpacked into fresh
  folders: `README.md`, `PROOF.md`, `RADIAL_REDUCTION.md`, `LEAN_HANDOFF.md`, `VALIDATION.md`, and
  **every line** of `verify_all.py`, `verify_radius.py` and `radius_core.py` (the only code `verify_all`
  runs). Also `radius_certificates.json`: 13 rows, each with 142 knots on [0, 24], `λ₀…λ₃`, `μ` and an
  s-interval. Not run: `verify_property_P.py` and `property_P/`, which are unrelated to the radius.
- `ide-replay/` (`qcheck.py`, `verify_all.log`, `fresh.json`).
- Lean sources: `Grothe/LowerAnalytic/{SixthMoment, Circular, CircularFourth, CircularTensor, Moments,
  Fluctuation, SpectralBudget, RadialParts, RadialCut, Bridge, ComplexGaussianCore}.lean` and
  `Grothe/Lower/{Law, Cuts, Stein, Mixed}.lean`.
- Documentation: `docs/overview.tex` (moment section), `docs/LEAN_DETAILS.md` (lower bound) and `scratch/Axioms.lean`.

## 1. The proof (P)

Normalise E|q|² = 1. Let Z be a standard complex Gaussian vector. The real coordinates
x = √2 Re Z, y = √2 Im Z are standard real Gaussians. Put R = |q|, X = Re q and s = E R⁴ − 2.

1. **X is in the real third chaos** [P]. A complex Wick polynomial of bidegree (2,1) lies in the
   complexified real Wiener chaos of order 3, so LX = −3X for the Ornstein–Uhlenbeck generator L.
2. **Circular symmetry** [P]. We have q(e^{iφ}Z) = e^{iφ}q(Z), and the law of Z is rotation
   invariant. So the law of q on ℂ is rotation invariant, and X =ᵈ R cos Θ with Θ uniform and
   independent of R. Consequently:
   - E X² = 1/2;
   - E X⁴ = (3/8)(2+s);
   - κ₄(X) = 3s/8.

   [C] I checked these exactly (sympy, Gaussian monomial moments) on six random cubics with
   integer complex coefficients (n = 1, 2, 3): E X² = E Y², E XY = 0, E X² = E|q|²/2, and
   κ₄ = (3/8)(E|q|⁴ − 2(E|q|²)²). See `analytic_check.py`.
3. **The Γ decomposition** [P]. Let Γ = |∇X|²/3 and write X² = v + J₂ + J₄ + J₆ in Hermite
   grades. The carré du champ gives |∇X|² = ½L(X²) − X·LX = 3v + 2J₂ + J₄, so
   Γ = v + (2/3)J₂ + (1/3)J₄.
   - The Stein identity E[X f(X)] = E[f′(X)Γ] (from X = −LX/3 and Gaussian integration by parts),
     applied with f = x³, gives E X⁴ = 3E[X²Γ].
   - Comparing grades: v² + A + B + ‖J₆‖² = 3v² + 2A + B. Hence κ₄ = 2A + B (and ‖J₆‖² = 2v² + A).
   - Var Γ = (4A + B)/9 = (2κ₄ − B)/9 ≤ (2/9)κ₄ = s/12.

   [C] On the same six cubics: E Γ = E X² and E X⁴ = 3E[X²Γ] hold exactly. Var Γ/κ₄ lies in
   0.157–0.170, below 2/9.

   This is **verbatim the identity already proved in Lean**: `Grothe.LowerAnalytic.chaos3_remainder`
   states 2κ₄(F) − E(|∇F|² − 3E F²)² = E J₄².
4. **The completed-square Stein inequality** [P]. Let w be even, continuous and piecewise linear,
   constant beyond its last knot (hence bounded), and let V = ∫₀ˣ w.
   - Integrability: V is C¹ with V′ = w bounded and |V(x)| ≤ ‖w‖∞|x|, so f = V is admissible in
     the Stein identity. All terms are polynomially bounded, and polynomial chaos has all moments.
   - The kinks of w never enter, because only V and w appear.
   - E h_w(X) = E[(Γ − ½)w(X) − w(X)²/(2μ)] ≤ (μ/2)E(Γ − ½)² = (μ/2)Var Γ ≤ μs/24. The middle
     step is the pointwise bound ab − b²/(2μ) ≤ μa²/2 with μ > 0, and E Γ = E X² = 1/2.
5. **Circular reduction** [P]. By step 2, E h_w(X) = E Ψ_w(R) with Ψ_w(r) = E_θ h_w(r cos θ).
   Since h_w is even (V odd, w even), Ψ_w(r) = (2/π)∫₀^{π/2} h_w(r cos θ)dθ.
6. **The majorant gives B(s)** [P]. Suppose Q ≥ 0 on [0,∞) and λ₃ ≥ 0. Then
   E R ≤ λ₀ + λ₁E R² + λ₂E R⁴ + λ₃E R⁶ + E Ψ_w(R) ≤ B(s), using:
   - E R² = 1 and E R⁴ = 2+s exactly, so the signs of λ₁ and λ₂ are irrelevant;
   - E R⁶ ≤ 6 + 9s + C₆s^{3/2};
   - step 4.

   The sixth-moment form matches the Lean statement E U³ ≤ 9m − 12 + C₆(m−2)^{3/2}, since
   9(2+s) − 12 = 6 + 9s.
7. **Moment inputs** [P, read in Lean]. The range s ≥ 0 follows from κ₄ = 2A + B ≥ 0.

   | input | Lean theorems | scope |
   |---|---|---|
   | s ≤ 42 | `Circular.gaussian_fourth_moment_le_44`, `Circular.gaussian_x_le_sqrt42` | — |
   | C₆ = 4045313/100000 | `Circular.gaussian_sixth` (from `sixth_moment_circular` / `cumulant_bound`) | stated under `TensorFacts` |
   | `TensorFacts` | `Circular.tensorFacts` (`CircularTensor.lean`) | every circular pair (`Chaos3 a`, `Circular J a b`) |

   All of these are in `scratch/Axioms.lean`. H₂,₁ in standard coordinates falls in this class
   (`WickChaos.lean`, as used by `normQk_le_rho`). **So the constant 40.45313 is the one proved
   in Lean**, and for exactly this class.

   [C] Sanity check: the six cubics satisfy the sixth-moment inequality. The single monomial gives
   the ratio 40.2952, the documented near-extremal value.
8. **Convexity and cover** [P]. B(s) = const + (λ₂ + 9λ₃ + μ/24)s + λ₃C₆s^{3/2} with λ₃ ≥ 0, so B
   is convex in s and attains its maximum on an interval at an endpoint. Each row's Q ≥ 0 does not
   depend on s, so each row bounds E R for every s; the intervals only select the row. The 13
   intervals are contiguous from 0 to 42 [C].

**No gap.** Three remarks:
- The step-4 argument needs a genuine Gaussian polynomial, not an abstract law with the same
  moments. R37 is stated for genuine cubics, so this is correct.
- All constants are dimension-free.
- Notes on the stale "not in Lean" remark and on documentation are in section 4.

## 2. The certificate (C)

### 2.1 Fresh replay of the package checker [C]

Command: `python -I …/verify_all.py --out …/fresh.json`, run from an unrelated folder on `big`
(Python 3.12.3, python-flint **0.8.0**; the package pins 0.9.0).

| item | result |
|---|---|
| SHA256 manifest | verified |
| status | `FRESH GLOBAL RADIUS PASS` |
| wall time | 659 s at machine load ≈ 30/48 |
| cell evaluations | 106,740, exactly as claimed |
| infinite tails | all 13 pass; T(60) ≥ 6.8·10⁵ |
| max objective, C₆ = 40.45313 | [0.95132934139494945122… ± 1.3·10⁻⁴⁸] |
| max objective, C₆ = 50 | [0.96017896356439336769… ± 3.8·10⁻⁴⁸] |
| agreement with `ide-replay/fresh.json` | identical in every deterministic field (evals, per-row minima, tails, bounds) |

### 2.2 The checker read against PROOF.md: the enclosures are sound [P]

- **Pieces.** The cubic coefficients of h_w on each piece, and the update G_{k+1} (trapezoid,
  exact for linear w), are correct. The last piece has w = v_K constant.
- **Primitives.** Each S_m has derivative z^m/√(1−z²), and S_m(0), S_m(1) are correct. Each is
  nondecreasing, so `primitive()` clips the ball to [0,1] and takes the union of endpoint
  values. This encloses the whole range, including z = 0 and z = 1.
- **Value.** Ψ = (2/π)Σ_k Σ_m a_{km} r^m [S_m(min(ξ_{k+1}/r,1)) − S_m(min(ξ_k/r,1))]. Pieces with
  ξ_k ≥ r are skipped; the clip handles the piece containing r.
- **Derivative.** Ψ′(r) = E_θ[cos θ·h_w′(r cos θ)] is valid because h_w is Lipschitz
  (differentiation under the integral; Ψ is absolutely continuous). The code's
  Σ m a_{km} r^{m−1}[S_m] is exactly this. With R an interval, every r-dependent subexpression is
  enclosed, so the result encloses Q′ on the whole cell. Pieces that are only partly active get
  enclosures containing 0.
- **Cells.** Initial cells cover [0, 60] (200 pieces of width 0.3), with adaptive bisection
  (failure below width 10⁻⁹). A cell is accepted when the ball Q(mid) − (width/2)·sup|Q′| is
  entirely > 0.
- **Cells at 0.** The cells next to 0 use the global Lipschitz bound
  2|λ₁|b + 4|λ₂|b³ + 6λ₃b⁵ + (2/π)·sup_{[0,b]}|h′| + 1. It is valid because |Ψ′(r)| ≤ E|cos θ|·sup|h′|.
  Q(0) = λ₀ + h_w(0) > 0 is asserted.
- **Tail, r ≥ 60.** Write h = h_∞ + d, where h_∞ is the last-piece quadratic extended to all x and
  d is supported on [0, 24].
  - The h_∞ part averages to v_K r²/2 + (2/π)(G_K − v_Kξ_K)r − v_K/2 − v_K²/(2μ).
  - |(2/π)∫₀^{ξ_K} d/√(r²−x²)| ≤ (2/π)‖d‖₁/√(r²−ξ_K²), and ‖d‖₁ is bounded by sup·width per piece.
  - T′ ≥ p(r) = 6λ₃r⁵ + 4λ₂r³ + 2c₂r + c₁, because the D-term has positive derivative. p(60) > 0,
    and p′(r) = g(r²) with g a convex quadratic (λ₃ ≥ 0) that has g(3600) > 0 and g′(3600) > 0.
    Hence p > 0 and T is increasing, so T(r) ≥ T(60) > 0.
- **Endpoints.** These are computed in Arb with C₆ given exactly, compared as balls (`<`), and the
  s-cover contiguity is asserted.

`verify_all` runs with `margin=0`; λ₀ already includes the +1/1000. [C] For every row,
λ₀ − 1/1000 is dyadic, consistent with "solver float + exact increment".

### 2.3 Independent rigorous re-check [C]

`indep_arb.py` is my own code, written from the definitions, without the package code:
- **Exact pieces.** Each piece cubic is built by exact rational polynomial algebra. Exact
  continuity of h at all 141 interior knots is asserted.
- **θ-formulation.** The primitives are written in θ (arccos and √): C₀ = θ, C₁ = sin θ,
  C₂ = θ/2 + sin θ cos θ/2, C₃ = sin θ − sin³θ/3.
- **Cell enclosures.** The bound on Q′ over a cell comes from the monotonicity in r of
  C_m(θ_k(r)): the union of the values at the two cell endpoints.
- **Different tail argument.** At R₁ = 64:
  - ‖d‖₁ is bounded per piece by an exact Taylor shift at the midpoint;
  - 2/π is replaced by rational bounds;
  - the coefficients of the lower polynomial P(64 + t) are all shown positive in exact rational
    arithmetic.

**All 13 rows pass:** 114,710 cells. The smallest shifted tail coefficient is λ₃ > 0, and the
Q(0) enclosures agree with the package code. Each row takes 16–33 s.

### 2.4 Exact endpoint objectives [C]

`endpoints_exact.py` uses only Fractions, with integer square roots giving rigorous bounds for
√s.

| C₆ | max endpoint upper bound | attained at | margin to the target |
|---|---|---|---|
| 40.45313 | 0.951329341394949 | row 4, s = 5 | 6.586·10⁻⁷ |
| 50 | 0.960178963564393 | row 5, s = 6 | 1.04·10⁻⁶ (to 0.96018) |

### 2.5 Float evidence [N]

- **Direct quadrature** (`float_check.py`): Gauss–Legendre in θ between the arccos breakpoints,
  with V by the knot trapezoid. It does not use the package primitives.
  - The minimum of Q over r ∈ [0, 10⁴] lies between 3.86·10⁻⁴ (row 5, r ≈ 12.02) and about
    9·10⁻⁴.
  - The minima sit at r ≈ 8–15, at integer knots of w.
  - The float values match the package's Arb `qvalue` at 403 sample points, with maximum
    difference 1.9·10⁻⁹. The largest differences are at r near 60, where |Q| ~ 10⁶, so this is
    float rounding.
- **The IDE's slack figure is inaccurate.** The IDE note's "minima ≥ 6·10⁻⁴" is off. Its
  `qcheck.py` grid has step 0.5 beyond r = 12 and misses the dip at r ≈ 12.02 in row 5. This
  does not matter for rigour, since both rigorous checkers cover every r.
- **End-to-end sanity on concrete laws** (`law_check.py`). For all 13 rows, E Ψ_w(R) ≤ μs/24
  holds with a wide margin:
  - the single monomial (s = 42), by quadrature;
  - a normalised sum of 4 independent monomials (s = 10.5), by Monte Carlo with 2·10⁶ samples.

  Their E|q| values (0.691 and 0.740) are well below B(s).

## 3. Lean assessment

### What already exists [P, read]

- **Moment inputs** (both proved; section 1, step 7): s ≤ 42 and the sixth moment with C₆.
- **Radius.** The current Lean radius is `first_moment_lt_rho`, ρ = 0.973612157, from three
  moments. It enters `Moments.mh` through `moments_of_three`, `normQk_le_rho` and the scale τ ≤ ρ.
- **Variance identity.** `chaos3_remainder` is the R37 variance identity.
- **Radial Stein machinery:**
  - `radial_parts`: radial integration by parts for any C¹ radial test with growth bounds;
  - `radial_cut` and `gaussian_steinInputs`;
  - `steinCut_of_inputs`, giving `SteinCut` for the Gaussian law of every circular cubic.
- **The Lean cut is the radial cut (R) of RADIAL_REDUCTION.md, with α = −γ.** The cut `cutG` is
  (φ+β′)² + 2(φ−Φ/u)² + 2α(Φ−φ) + (α²/3)(u²−2), where φ is piecewise linear in u on a v-mesh and
  vanishes beyond the last knot.
- **Integration lemma.** `TB.node`/`node_fn` (`Law.lean`) turn a pointwise inequality
  Φ(τv) + Σc_j·cutG_j(v) ≤ y(v) into E Φ(τ√U) ≤ y.J(x), for **arbitrary** Φ.

### Route A: the literal port of the TeX proof

New Lean needed:
1. A real Stein identity E[a f(a)] = E[f′(a)|∇a|²]/3 for C¹ f with bounded f′ under `stdGaussian`,
   an analogue of `RadialTest.stein`: ~150–300 lines.
2. Var Γ ≤ s/12 from `chaos3_remainder` and `Circular.gE_pow_four`: ~50–100 lines.
3. The completed square and integrability: ~100 lines.
4. Circular averaging: ~200–400 lines. A measure-level rotation lemma can be avoided. Apply 1–3 to
   every rotated real part cos φ·a − sin φ·b, which is still `Chaos3` with a circular partner and
   has the same E X² and κ₄. Then integrate over φ by Fubini, using the pointwise identity
   cos φ·a − sin φ·b = √U·cos(φ + arg q).
5. The 13 arcsine majorants: verified rational enclosures of arcsin and √, and about 10⁵ cells ×
   140 pieces of interval arithmetic. This needs a new `native_decide` checker: ~1000–2000 lines
   and heavy compute.

Total roughly 2000–3000 lines; part 5 dominates.

### Route B (recommended): reuse the existing Lean Stein cuts

**The domination step** [P]. I re-derived RADIAL_REDUCTION.md:
- Ψ_w(√u) = ua − b/2 − E_θw²/(2μ), where a = E_θ[sin²θ·w] and b = E_θ w.
- Projecting onto {1, cos 2θ} gives E_θw² ≥ b² + 2(b−2a)².

So Ψ_w(√u) ≤ G_R(u), the radial cut with test φ = b/2, Φ = ua, Y = b/2 − a and γ = μ/4. Its
expectation bound γs/6 = μs/24 is exactly Lean's `cutG` budget.

**No regularity lemma is needed.** For Lean, replace φ by a piecewise-linear interpolant φ̃ in u
and verify the majorant for φ̃ directly. φ̃ is simply another admissible mesh test, so the cusp of
a at 0 and the density/approximation lemma of RADIAL_REDUCTION.md play no role.

**The constant tail is representable.** The constant tail w_K/2 is carried by β′. The resulting
extra term −2αc₀(u−1) is a polynomial with zero mean, which goes into y.

**Float experiment** [N] (`route_b.py`). I kept the scalar certificate's λ₀…λ₃ and μ unchanged,
so the endpoint objective stays exactly 0.9513293414.

| setting | rows | minimum slack of v ≤ P(v²) + G̃(v²) |
|---|---|---|
| exact radial test | all 13 | ≈ 1.00·10⁻³ |
| 800 uniform v-cells on [0, 60], constant beyond | all 13 | ≥ 4.9·10⁻⁴ |
| same | rows 1–12 | ≥ 7.7·10⁻⁴ |
| same | row 0 | 4.9·10⁻⁴, at v ≈ 0.49 (√u cusp of b; refine the mesh near 0) |
| truncation at T = 24 (row 4) | — | fails by −4.5·10⁴ near v = 24 |

The truncation point therefore has to lie where λ₃v⁶ dominates; T ≥ 40 works. With the exact
test, G_R − Ψ_w ≥ 0 numerically (≥ −3·10⁻¹⁷).

**What is needed:**
- a generator (Python);
- 13 node data sets (mesh, knot values, β′, α, weights, y);
- a sweep checker for v + Σc·cutG(v) ≤ y(v) with Φ = id (cell polynomials exist: `cutPolyV`,
  `cellG_quartic`; the existing sweeps handle row potentials): ~100–300 lines;
- an assembly theorem over the 13 x-intervals with x ≤ √42 (endpoint convexity in s = x², or a
  Bernstein check in x): ~200–400 lines.

There is no arcsine, no rotation lemma and no new Gaussian analysis. Estimate: ~500–800 lines of
Lean plus data, a small `native_decide` budget, 1–3 agent-days. The exact-rational version of the
experiment is not yet done.

**Downstream use.** Do not replace `Lower.ρ` globally: that would invalidate the existing
15,096-box certificate. Add a separate theorem E√U ≤ 95133/100000 and feed it to the degree-5
work.

## 4. Notes and minor issues [N]

- **Stale "not in Lean" remark.** `ch62` says the C₆ input "is not formalised in Lean", and the
  theorem says "not new Lean proofs". The first is **stale**: the sixth-moment bound for circular
  cubics is in the Lean build. The second is still true of the R37 chain itself.
- **Stale overview entry.** `docs/overview.tex` "First moment [P,C]: E|q| ≤ 0.97073" predates R37.
  Lean proves 0.973612157. I did not edit it.
- **Package housekeeping.**
  - `verify_all.analytic_checks()` also asserts unrelated two-driver quantities (Kcold, Kbuffer)
    and the t = 847/5000 row margin. These are harmless and outside R37.
  - Dead code in `radius_core.py`: `verify_interval`, `verify_range`, `lip_local`, and an
    `if True else None` line.
- **Margin.** The stated constant has 6.6·10⁻⁷ of slack. Any weaker input, for instance a larger
  C₆, moves it (C₆ = 50 gives 0.96018).

## 5. Files (all under this folder)

- **Scripts**:
  - `scripts/endpoints_exact.py`
  - `scripts/indep_arb.py`, `scripts/run_indep.sh`
  - `scripts/float_check.py`
  - `scripts/analytic_check.py`
  - `scripts/law_check.py`
  - `scripts/route_b.py`, `scripts/run_route_b.sh`
- **Logs**:
  - `logs/verify_all.log`, `logs/fresh.json` (package replay)
  - `logs/indep_all.log`
  - `logs/float_check.log`
  - `logs/analytic_check.log`
  - `logs/law_check.log`
  - `logs/route_b_*.log`. In `route_b_all.log`, the negative "min (G_R − Psi)" values of rows 0–6
    come from a bug in my script at v = 0 (the angular average of sin²θ·w at r = 0), since fixed.
    The corrected diagnostics for those rows are in `route_b_fix_0…6.log`. The mesh results were
    not affected.
  - `logs/endpoints_exact.log`
- **Remote folder.** The work folder on `big` (`/root/claude-b9ee-r37`) was deleted after copying.
