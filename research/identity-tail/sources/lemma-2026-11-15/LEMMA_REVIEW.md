<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/caps-stage0b-lemma-2026-11-15/LEMMA_REVIEW.md (16 November 2026); a review worker of claude-b9ee. Only this line was added. -->
# Referee report: the rank-one correction lemma for Ψ_ν (PROOF.tex, stage 0b)

claude-b9ee worker, 16 November 2026 (Europe/Bucharest). Independent check of `PROOF.tex` in this folder. Nothing in the
repository was changed. Labels: **P** proved (written proof checked line by line), **C** exact computation, **N** floating-point
evidence only.

## Verdict: PROVED (P)

Theorem 1 holds as stated. For every ν ≥ 0, d₂, d₃ > ν, R ≥ 0, every γ with 0 ≤ γ ≤ γ*(R), and all L, p ∈ ℂ with |L| ≤ R:

    Φ_d(L+p, L−p) − (γ/16)·(4 Re(p L̄) − c₀ − c₁|L|²)²  ≥  Ψ_ν(L+p, L−p),
    γ*(R) = 8σ(e₂e₃)² / ( Δ·( Δ(σ² + 2R|δ|)² + 16R²(e₂e₃)² ) ).

- I found no gap and no error in the mathematics.
- The proof is short and elementary: one gap identity, completing a square, one identity for H̃, Cauchy–Schwarz, the reverse
  triangle inequality and a one-variable bound.
- I re-derived every step by hand and checked every identity exactly with an independent sympy script (§3).
- The coefficient is sharp (Proposition 2, also checked).
- At ν = 0 it is exactly AF eq. (4), i.e. `CapMajorant.anchored_pair` on master.
- The stage-0 restrictions are not needed: min(e₂,e₃) > 0.2·max(e₂,e₃), l_lo ≥ ν and rms|p₀| ≤ l_lo.

The only finite obligation left is the per-cell rational inequality (eq. (cell) of PROOF.tex §5). It has no division and fits the
style of the current kernel, which checks `gg · majDq ≤ 8`. The data must also follow the rules of §5: exact centre, γ rounded
down from the exact ν̂, and a separate check for cells with γ = 0.

## 1. Is it the right statement? (P)

The anchored cap integrates a pointwise majorant over polar cells. Each cell has constant prices (d₂, d₃), a constant γ and
R = r_hi(c + β r_hi²) ≥ |L| on the ring (AF §3; it needs c = ℓ − 2β > 0 and β > 0, true for every computed row of the new witness).
So the cap needs exactly a bound valid for all p ∈ ℂ and all |L| ≤ R with cell-constant data, and Theorem 1 is that bound.

I expanded −(γ/16)(4x − c₀ − c₁l²)² term by term against `capnu.CapRow.weights` (corr `'nunum'`) and against the exact
integrator of `midnu.SetupNu.integrate_nu`. They implement exactly this majorant:
- linear coefficient τ + γc₀/4;
- constant term −γc₀²/16;
- l-dependent terms γc₁/4 (on l²x), −γc₀c₁/8 (on l²) and −γc₁²/16 (on l⁴);
- quadratic part −γx², integrated with harmonics 0, 2 and 4.

Cells with e₂ ≤ 0 or e₃ ≤ 0 keep γ = 0. There the uncorrected majorant is valid by Lemma 1 as soon as M ≻ 0, i.e. d₂ > 0 and
Δ > 0. Lemma 1 does not need d_i > ν, but the verifier must check d₂ > 0 and Δ > 0 for such cells. The `cell_ok` function of
`gstar.py` rejects them, so it needs a second branch (§5).

The outer region r ≥ 8 uses d₂ = d₃ = 1 and no correction; this needs ν̂ < 1.

## 2. Line-by-line notes (all steps checked by hand)

- **§1:** Δ = e₂e₃ + νσ and Γ(R) = (σ² + 2R|δ|)/(e₂e₃) (uses 4e₂e₃ + δ² = σ²). Both forms of γ* agree, γ* = 8/D_ν, and the
  correction has the shape h²/(2D_ν) of AF (4). Correct.
- **Reduction to real L.** A common rotation of p, f and g leaves Φ_d, h and ℓ_w invariant. Correct.
- **Lemma 1 (gap identity).** w*Mw = d₂ + d₃ − 2ν Re(f̄g). The cross terms give Re(w*V) because M is real symmetric.
  Correct, with ‖·‖ the M⁻¹-norm.
- **Lemma 2.**
  - L_U, p_U, X and Y are correct.
  - (2.1): c_L = (d₂+d₃+2ν)/(2Δ), c_P = σ/(2Δ), τ = δ/(2Δ). I re-expanded it using Re((X+Y)(X̄−Ȳ)) = |X|² − |Y|².
  - c_Lc_P − τ² = 1/Δ. The completed square with ρ = δ/σ is correct.
  - c − km² = c_P − γl². The infimum formula is (5.3).
  - **Identity (3.3), ĥ = (Δ/σ)H̃.** I re-derived it by hand using (d₂+ν) + ρe₂ = (d₃+ν) − ρe₃ = 2Δ/σ and
    c₀ = −δσΔ/(e₂e₃). This identity is where the specific centre enters.
  - The −∞ case is correct (used only for sharpness).
- **Lemma 3.**
  - Identity (4.1) is correct; I expanded it by hand.
  - The two bounds (Cauchy–Schwarz on the first term, the reverse triangle inequality with s ≥ 0 on the second) are correct.
  - The one-variable bound 2a + |η|b ≤ 4 + |η||δ| is correct.
  - **A shorter route, useful for Lean.** Both sides of |η|b ≤ 2(2−a) + |η||δ| are ≥ 0, and
    (2(2−a) + |η||δ|)² − η²b² = (2−a)²σ²/(e₂e₃) when b² = σ² − e₂e₃a². This is exact (check (K) below) and gives the bound in
    one step, with no case δ = 0.
- **Proof of Theorem 1.**
  - Monotonicity: Γ is nondecreasing and 16R² strictly increasing.
  - γ ≤ γ*(l) gives 8(σ − 2γΔl²) ≥ γΔ²Γ² > 0, hence κ_γ ≤ 1/Γ², hence N − κH̃² ≥ N − H̃²/Γ² ≥ 0 by Lemma 3 with N = |r|².
  - The case l = 0 is included.
  - The ν = 0 reduction (6.3) is correct.
- **Proposition 2 (sharpness).**
  - At the far phases N = (2l − |δ|)² and H̃² = Γ²N, via (5.1): 4δ = η(σ² − δ²).
  - κ_γ increases in γ; the minimiser is real. Correct.
- **Remark on the radial line.** It relies on the three-regime formula of Ψ_ν on the radial line (`capnu.F_radial`), which is not
  proved in the document. It is a remark, not used by the theorem.
- **Relation to `gamma_closed`.**
  - Exact equality min_± g_d = γ*(l) is checked exactly by the self-test (3000 cases).
  - "gamma_closed ≤ γ*(l_hi)" also needs the float regime test to pick the far branch at γ = γ*. It does on every plateau cell: the
    max ratio is 1 + 4.7·10⁻¹⁰, which is float rounding only.
  - This bears only on the validity of the stage-0 numbers. They used 0.95·gamma_closed, so they are covered.
- **§4–5.** The remarks on e_min → 0, l_lo and the anchors are correct. The cross-multiplied cell condition is equivalent to
  γ ≤ γ* because its denominator is positive. The caution about float γ* is confirmed (§4 below).

## 3. Machine checks

| check | status | result |
|---|---|---|
| `verify_identities.py` (sympy, rational phase parametrisation) | C | **32 of 33 lines OK**, identities (1.1)–(6.3) (`verify_identities.log`, regenerated with `-u`; the run that produced INDEX's "ALL IDENTITIES VERIFIED" left no log). Its last line, (7.1) (Lemma 2 as one identity), had not finished after more than an hour of `sympy.cancel`. **(7.1) is checked in two other ways:** (i) symbolically in pieces W1–W7 by the independent script below; (ii) exactly at 200 random rational points of all 9 symbols, phases included (`review/vi71_points.py`, 200/200 zero; a false polynomial identity fails at random points with probability 1) |
| independent `../caps-stage0c-2026-11-16/review/indep_identities.py` (reduction modulo f₁²+f₂²−1, g₁²+g₂²−1, no parametrisation): (G) Lemma 1, (W′) identity (3.3), (H) identity (4.1), (T) h = 0 on M(𝕋²), (K) the one-variable bound | C | **all verified** (`indep_identities.log`) |
| independent `indep_identities_split.py`: Lemma 2 in pieces (W1) completed square, (W2) h affine, (W3) = (3.3), (W4) = (5.3), (W5) = (5.4), (W6) = (3.2), (W7) | C | **all verified** (`indep_identities_split.log`) |
| `gstar.py` self-test: 3000 exact rational cases (stage-0 discriminant formula = γ*, AF at ν = 0, strictly decreasing in R, round-down and verifier) | C | **OK** (re-run: `gstar_selftest_rerun_2026-11-16.log`) |
| `numcheck.py 300 1`: (A) gd_far vs γ*, (B) brute force, (C) sharpness, (D) reduction, (E) key bound | N | **(A)** float agreement 2.8·10⁻⁶ (cancellation; exact equality is the self-test); **(B)** 9.6·10⁶ points, min normalised gap +4.2·10⁻¹²; **(C)** 1.001·γ* violated in 300/300, binding vertex in the far regime in 300/300; **(D)** 7.6·10⁻¹⁵; **(E)** +4.4·10⁻⁷ ≥ 0 (`numcheck_300_1.log`, regenerated) |
| `numcheck_adversarial.py 600 7` | N | **Not reproducible as specified:** the single seeded stream costs about 100 s per case (17 CPU-hours for 600 cases), so it was stopped. Instead I ran a sharded variant with identical tests and per-case streams (`../caps-stage0c-2026-11-16/review/numcheck_adversarial_sharded.py`, cases k ≡ 0 mod 3 of 120, plus 3 cases of shard 1). Logs: `adversarial_sharded_120_7_shard0.log` (40 cases) and `…_shard1_partial.log`. Results: **(F)** (full lemma, Nelder–Mead from 24 starts) min normalised gap −7.9·10⁻¹⁴, float noise at R = 49. **(R)** (reduced form) min −9.2·10⁻⁸ at a near-tangent point where Γ²N and H̃² are both about 10⁻¹⁶. In 60 digits the numerator Γ²N − H̃² there is **+7.1·10⁻²⁵** (normalised +4.1·10⁻⁹), its 17×17 neighbourhoods at radii 10⁻²…10⁻⁸ stay positive, and the far phase gives 10⁻⁴⁶, i.e. equality (`review/hp_reduced_adv.log`). No counterexample. |
| `cells_compare.py` (8 plateau rows, 15 anchors each, 1600 × 64 cells, exact per-cell verifier with python-flint) | C | 12,280,097 cells: **0 failures for the exact round-down**, see §4 for the float stand-in (`cells_compare_nq64.log/.json`, regenerated) |
| `capgain.py` (row t = 0.845, stage-0 setting vs γ* in every cell) | N | γ* is never worse; gain 0 to 5.6·10⁻⁷ in cap − Ψ at u = 0–0.5; at u = 0.4 block 2 becomes positive definite (`capgain.log`, regenerated) |
| independent `../caps-stage0c-2026-11-16/review/indep_numeric_debug.py 120 11` (the same stream as `indep_numeric.py`, with diagnostics). It uses no closed form of the proof: for every phase pair on a 192² grid and l ∈ [0,R], inf over p of E_w is computed from the quadratic obtained by evaluating E_w at 6 points, then refined by Nelder–Mead. (P) is a brute force with an independent Ψ_ν (4096-phase grid + golden section) | N + C | **(P)** 1,080,000 points, min normalised gap +5.5·10⁻¹⁰; **(S)** (1+10⁻⁴)γ* violated in 119/120 (the exception is a near-degenerate 2R ≈ \|δ\| draw, where the violation N(κΓ²−1)/(2σ) is below float resolution); **(I)** float minimum −4.2·10⁻⁶ (case 51) and −1.1·10⁻⁷ (case 95). Both are at R/σ ≈ 9,000 and 2,600, where the p-quadratic is nearly singular (a₁₁/c_P ≈ 10⁻⁶). In 60-digit arithmetic with the explicit coefficients (`review/hp_case.py`, logs `hp_case51.log`, `hp_case95.log`) the value at the float point is **+0.036** (normalised +1.1·10⁻⁷) and +0.037. The local minimum is −2.8·10⁻⁵¹ and −2.8·10⁻⁵², i.e. **0, attained at the far phase with l = R**: the sharp equality case of Proposition 2, not a counterexample |

## 4. What the exact per-cell check found

On 12,280,097 cells of the plateau rows (e_min/e_max down to 2.2·10⁻⁶, ν̂/σ up to 6.4, R/σ in [0.0028, 0.71]):

- **The float stand-in failed in 2 cells.** The script's γ = (1 − 2⁻⁴⁰)·float(γ*) fails the exact verifier in 2 cells (t = 0.87,
  u = 0.05 and t = 0.835, u = 0.30). Both have e₃ = d₃ − ν̂ ≈ 10⁻⁶ (`review/cc_detail.py`, logs `review/ccd*.log`).
  - Cause: float ν̂ = 47/1953 is rounded, and e₃ = d₃ − ν̂ cancels. Float e₃ differs from the exact e₃ in the 12th digit, and
    γ* ∝ e₃², so float γ* is 1.3·10⁻¹² and 2.7·10⁻¹² too large.
  - This is not a failure of the lemma. It is exactly the caution of PROOF.tex §5: compute γ in exact arithmetic from the exact
    ν̂ and round down (`g_round_down`, which asserts `cell_ok`).
- **The stage-0 float `gamma_closed` exceeds the exact γ\* in 41 % of the cells,** by at most 4.7·10⁻¹⁰ relative (PROOF.tex
  says 42 %). Stage 0 used 0.95 × it, so its numbers are covered.
- **Invalid cells:** 7,903 cells (0.06 %) have e₂ ≤ 0 or e₃ ≤ 0, and get γ = 0.

## 5. Notes for the generator and the verifier (stage 0b/0d, kernel in stage 2)

1. **Exact data.** γ must be computed from the exact dyadic prices and the exact ν̂, then rounded down. c₀ and c₁ must be
   **exact** rationals of the same data: the theorem needs the exact centre, because h must vanish on M(𝕋²).
   - **A gap in the stage-0 code (not material to its numbers).** `capnu_cert.py` and `midnu.SetupNu.integrate_nu` compute c₀
     and c₁ in floating point (with the float ν̂) and then feed them to the outward integration as exact data (`MR(c0_data)` with
     radius 0).
   - With a centre off by δ the pointwise bound can fail by about (γ/16)(δ² + 2|h||δ|), i.e. about 10⁻¹⁷ here. That is far below
     every reported number, but it is a soundness gap.
   - The generator must compute c₀ and c₁ exactly, or the verifier must recompute them from (d₂, d₃, ν̂).
2. **Cells with γ = 0** need d₂ > 0 and d₂d₃ > ν̂², not d_i > ν̂.
3. **Rounding the quadratic weights.** If the kernel stores rounded weights (c_L, c_P, τ) instead of exact ones, the majorant
   stays valid when the rounded 2×2 form dominates the exact one: c_L′ ≥ c_L, c_P′ ≥ c_P and
   (c_L′ − c_L)(c_P′ − c_P) ≥ (τ′ − τ)².
   - Reason: Φ_N − ℓ_w = ½‖V − Mw‖²_{M⁻¹} + ½V*(N − M⁻¹)V.
   - This replaces today's separate checks na·pa ≥ 1 and nb·pb ≥ 1.
4. **Proof in Lean (outside the caps closure).** `CapMajorant.lean` is not in the closure (it is not among the 9,537 files of
   `row12-build.json`), so Theorem 1 can be proved there in stage 1:
   - Lemma 1 is a ring identity;
   - Lemma 2 is the identity (7.1), or the pieces W1–W7;
   - Lemma 3 is (4.1), Cauchy–Schwarz and `abs_norm_sub_norm_le`, plus the one-line identity (K) above;
   - the final step is the arithmetic of γ ≤ γ*.
   At ν = 0 it specialises to `anchored_pair`, so the generalisation replaces AF (4) in place.

## 6. What this review did not do, and the files

**Not done.**
- No Lean formalisation of Theorem 1; it is planned as stage 1a in `../caps-stage0c-2026-11-16/STAGE0C.md` §7.
- `numcheck_adversarial.py 600 7` was not run as specified (17 CPU-hours); the sharded variant above replaces it.
- The one-shot sympy identity (7.1) did not finish; it is covered as stated in §3.

**Bug fixed.** `cells_compare.py` crashed with python-flint 0.8 (`float(fmpq)`). The one-line fix is marked in the file.

**Regenerated logs, in this folder.**
- `verify_identities.log` (32 lines);
- `gstar_selftest_rerun_2026-11-16.log` (the old `gstar_selftest.log` is kept);
- `numcheck_300_1.log`;
- `cells_compare_nq64.log/.json` (the 8 rows run in parallel and concatenated);
- `capgain.log`;
- `adversarial_sharded_120_7_shard0.log` and `…_shard1_partial.log`.

**Independent checks** live in `../caps-stage0c-2026-11-16/review/`:
- `indep_identities.py` / `.log`;
- `indep_identities_split.py` / `.log`;
- `indep_numeric.py`, `indep_numeric_debug.py` and `indep_numeric_debug_120_11.log`;
- `hp_case.py` with `hp_case51.log` and `hp_case95.log`;
- `hp_reduced.py` with `hp_reduced_adv.log`;
- `cc_detail.py` with `cc_detail_failcells.log`;
- `numcheck_adversarial_sharded.py`;
- `vi71_points.py` with `vi71.log`.

**Runs.** The heavy runs were on big, in `/root/claude-b9ee-capsnu`, which is deleted after the run. The sympy runs were on the
laptop.
