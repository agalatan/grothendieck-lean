# Stage 0 of the degree-5 plan (issue #751): enriched law classes and the gate for the games near the optimum

A research worker of claude-b9ee, 27–28 November 2026 (Bucharest time). Two workers in sequence: the first stopped on
a usage limit at 01:35; the second took the runs over, cut them to what the verdict needs, and wrote this report.
**Every number here is N** (floating point, grids, quadrature): no row value is a bound, no share is a theorem. Code:
[`../../code/degree5-stage0/`](../../code/degree5-stage0/README.md), written `CODE` below. Raw outputs:
`handoff/degree5-stage0-2026-11-28/stage0-raw.tar.gz` (git-ignored, on the laptop).

## 0. Summary and verdict

- **Verdict under the stop rule of #751, as written: degree 5 does not continue.** No game of the list of #751 (cubic
  weight 0.83–0.849) has a quintic share below 0.35 on the band. At t = 0.80, the lowest band row and the row where
  each game's share is smallest on the band, the shares are 0.522 (g83), 0.673 (g84), 0.842 (gA); they grow with t and
  pass 1 at t = 0.875 (g83), 0.845 (g84) and by 0.84 (gA). The share is measured on explicit one-spike responses and
  contains no radius, so no assumed quintic radius can lower it (§6). The second condition of the rule fails for every
  listed game, so the rule closes degree 5 whatever part (a) gives.
- **Part (a) alone would have passed** (§4). In the class E3 (moments, the radius table of 114/125, the first- and third-order
  antiholomorphic identities) the best rows found for the optimum gA are at most 0.7070140 on the eight sampled t in
  [0, 0.55] (the worst at t = 0.05), room 5.9·10⁻³ at 1/1.4027, with dual gaps ≤ 3·10⁻⁶ against the laws found; g84
  and g83 have rooms ≥ 1.36·10⁻² and 2.19·10⁻² on the t computed.
  The plain class of the record (moments + radius 2287/2500) exceeds every target by up to 2.4·10⁻², as before. So the
  small-t obstruction of ledger 4.54 comes from the law class; the obstruction that remains is the sector one.
- **Outside the rule (not part of the verdict):** g80 = (1, −0.80, 0.1364), added by the first worker and not in the
  list of #751 (model value 1/N = 1.403117), has θ ≤ 0 on all 20 rows 0.70–0.886 and a quintic share 0.143–0.328 on
  0.70–0.86, 0.338 at 0.865 and 0.350–0.374 on 0.87–0.886 (§9).

## 1. What was asked and the setting

Degree 5 stopped on 26 November (ledger 4.53–4.55) for two measured reasons: (1) for the optimum and its neighbours
the small-t law rows searched exceed every target, in a law class of moments and a radius, with laws that carry 12 %
of their mass at q = 0; (2) on the band the quintic shells take more than the whole deficit. Stage 0 tests both, with
a stop rule fixed in #751 before the run:

> continue to Stage 1 only if some game has rows below 1/1.4027 on all of [0, 0.55] and a quintic share below 0.35 at
> a quintic radius that looks provable. Otherwise degree 5 is closed and the effort goes to degree 7.

**The games.** T = P₁,₀ − εP₂,₁ + ηP₃,₂, written (1, −ε, η); η is the best quintic weight for its ε on the ridge of
ledger 1.11.

| name | game (1, −ε, η) | model value 1/N (ledger 1.10, 1.11) | role |
|---|---|---|---|
| gC | (1, −0.78, 0.0779) = (1, −39/50, 779/10000) | 1.402785 | the capped game: control |
| g83 | (1, −0.83, 0.2241) | 1.403493 | in the list of #751 |
| g84 | (1, −0.84, 0.2552) | 1.403584 | in the list |
| gA2 | (1, −0.848, 0.2795) | 1.40364 | in the list |
| gA1 | (1, −0.84896, 0.2818) | 1.403648 | in the list |
| gA | (1, −0.8493, 0.2827) | 1.403646 | in the list: the optimum; control of the record |
| g80 | (1, −0.80, 0.1364) | 1.403117 | **not in the list of #751**; added by the first worker to locate where the quintic share crosses 0.35 |

**Targets.** 500/701 = 0.7132668, 1/1.4025 = 0.7130125, 1/1.4027 = 0.7129108, 1/1.403 = 0.7127584. The room of a row
is the target minus its value.

**The row** (ledger 4.1, at the q-only responses, exactly as `../../code/degree5-gate/pipeline/rows/lawbundle.py`):

  value(p) = t² − 2ℓt + 2β²/ε + sup over (σ, ν, law) of [ E Ψ₅(σ√U; ν; p) − κ(p)σ² − ν²/η ],

with p = (ℓ, β, b_A, b_B), κ(p) = 1/ε − (b_A² + b_B²)/η, Ψ₅(s; ν; p) = E_z|L + νe₃₂ + sD| + E_z|L + νe₃₂ − sD|,
L = z(ℓ + β(|z|² − 2)), D = 1 − b_A e₁₁(z) − b_B e₂₀(z), and U = |q|²/‖q‖₂² for the remote cubic q of the response,
σ = ‖q‖₂. The sector cost is zero (K₅ is assumed with no allowance), so a row value is what the law layer alone gives.
value(p) is convex in p.

## 2. Methods

### 2.1 Part (a): a global inner maximisation and a bound over all rows

Two sides are computed for every (game, t, class), by `CODE/a/rows0.py`:

- **Upper side (a row).** For a row p the supremum over the class is computed by an oracle (`CODE/a/oracles.py`): a
  grid in (σ, ν, s), s = E U² − 2, then refinement; for each point one linear or conic program over a grid of atoms of
  U (253 atoms in the enriched classes). In the plain class the atoms are refined against the dual function of the LP
  until the dual inequality holds on a check grid of 11,000 points to 10⁻⁹. In the enriched classes the conic solver
  (Clarabel) returns primal and dual values (they agree to 10⁻⁷); the best row is re-evaluated at the end on the full
  grid.
- **Lower side (all rows).** Every law the oracle returns is kept in a pool. For a pool of laws of the class,
  min over p of the maximum over the pool is a lower bound of min over p of value(p), whatever way the pool was found.
  This master problem is convex; it is solved without a trust region, and a dual bound is computed from subgradients:
  with weights λ on the pool, every p with |p − p̂|∞ ≤ 3 has max_i f_i(p) ≥ Σλ_i f_i(p̂) − 3|Σλ_i∇f_i(p̂)|₁
  (`CODE/a/s0core.py`, `master`). The **gap** of a cell is the row value minus this bound.

So a cell "v (gap g)" means: the row found has value v in the class, and no row of the type of ledger 4.1 with
|p − p̂|∞ ≤ 3 has a value below v − g against the laws found. This replaces the trust-box master and the local Stein
oracle of the run of 25–26 November; "global" in this report means exactly this (the inner supremum over a fixed grid
of the whole class, and a master without trust box). What stays numerical: the grids (atoms, (σ, ν, s)), the
quadrature of Ψ₅ (40 × 8 Gauss–Legendre nodes in |z|, 128 angles), floating point, and the finite family of 27 hat
tests. The laws of the pool are feasible to solver tolerance, not exactly.

### 2.2 The law classes

All classes are sets of laws of U ≥ 0 (with auxiliary kernel moments in E2, E3), E U = 1.

| class | constraints | status of the constraints |
|---|---|---|
| **plain, 2287/2500** | E U = 1, E U² = 2 + s, E U³ ≤ 6 + 9s + C₆s^{3/2} (C₆ = 40.45313), E√U ≤ 2287/2500 | the class of the record (ledger 4.42, 4.54); moments **Lean**, radius **P + C** (`../../../conjecture-K/STATUS.md` 3.7) |
| **plain, 114/125** (code name KOUL3) | the same with E√U ≤ ρ(s): (√π/2)(1 + (3299/625000)s) on [0, 11/2], 0.9118551 on [11/2, 42], 0.8858275 on [25, 42] | K ledger 3.7, **P + C, author only** (gemini-4c4c) |
| **E2** | plain 114/125, and: the two first-order antiholomorphic radial identities (I), (II) for 27 hat tests and φ = v; per value of U the moment matrix of (1, c₁, c₂, ρ) is positive semidefinite and its means lie in the cone c₁, c₂ ≥ 0, ρ² ≤ c₁c₂; E ρ² ≤ E α₂ ≤ E c₁c₂; ρ = 0 at U = 0; E(c₂ − 1)², E(c₁ − c₂ − 1)², E(c₁ + c₂ − 3)², E α₂, E[Uρ] as linear forms of the Gram scalars (n, h, b, y, z) with s = 32n + 8h + 32b + 96y and the inequalities between them; the two joint sixth-moment forms | exactly the facts (F1)–(F4) of `../../../conjecture-K/code/radius-relaxation/verify_cert.py` (K ledger 3.7: the mixture of (I), (II), the moments and most Gram facts are **Lean**; (I), (II) separately, the cone and two variance identities **P + C**) |
| **E3** | E2, and the two third-order identities (III), (IV) for the 27 hat tests, with E[β̃; U]² ≤ U·E[c₂; U]·E[w; U] per value of U and E w = 24y | Proposition 2 and Theorem 3 of `../../../conjecture-K/sources/complex-radius-2026-11-17-gemini-2762/PROOF.md` (**P + C**, independently reviewed) |
| **floor** (code name phys) | not a class: 30 laws of explicit cubics (Gaussian bulk, the junta, y₁y₂ȳ₃, y₁²ȳ₂, y₁(\|y₂\|² − 1), sums, spikes in a bulk) | actual responses: a lower estimate of the row in every valid class |

Notation of K ledger 3.7: c₁ = Σ|∂_j q|², c₂ = Σ|∂̄_j q|², a = Σ∂_j q·∂̄_j q, ρ = Re(q̄²a)/|q|², α₂ = |a|²,
W_k = Σ_j F_j∂_jF_k with F_k = ∂̄_k q, w = Σ|W_k|², β̃ = Re(q̄ΣF̄_kW_k). The identities, for a test φ with G = ∫₀^v φ,
g = G/v, Y = φ − g:

  (I) E G(U) = E[c₂φ(U)] + E[ρY(U)],  (II) E G(U) = ½E[c₁φ(U)] + ½E[ρY(U)],
  (III) E[c₂(c₂ − 1)φ(U) − (c₂ − 1)G(U) + (c₂ − 1)ρY(U) + β̃g(U)] = 0,
  (IV) E[α₂φ(U) − ρG(U) + c₂ρY(U) + β̃g(U)] = 0.

E2 and E3 are conic programs (`CODE/a/enriched.py`): per atom of U a 4 × 4 moment matrix and two second-order cones.
A finite family of tests makes the class larger than the class with all tests, so its values are on the safe side. So
both enriched classes rest on constraints that are proved (**P + C** or Lean); the only unproved input is the radius
table of 114/125 (**P + C, author only**).

**Why these constraints apply to the row.** In the q-only responses the remote cubic is independent of z, and after
averaging the phase of z the potential depends on |q| only, so the row uses the law of U alone, and (I)–(IV)
constrain it through auxiliary kernels the row does not use. The coupled antiholomorphic rows of Lean
(`AntiSteinRowCheck`) are certificates in E2 restricted to the Lean facts. The damped fourth/fifth-order rows of
`cert_915.json` and the tied OU-resolvent rows of `cert_912.json` are **not** implemented as constraints; their
consequence, the radius table of 114/125, is the input.

**The atom at zero (#751 asked for "a constraint excluding the atom at zero").** None was used, because none is
available: with a hat test supported on [0, δ], δ → 0, (I) and (II) give E[c₂; U = 0] = E[c₁; U = 0] = 0, so on an atom
at zero both kernels vanish, and the atom is charged to the variance budgets (a mass m₀ at U = 0 costs m₀ in
E(c₂ − 1)² = 16n + 4h, 4m₀ in E(c₁ − 2)², 9m₀ in E(c₁ + c₂ − 3)², each of order s). The identities make the atom
expensive, not impossible: the optimal laws keep 0.6–1.8 % of their mass at U ≤ 10⁻³ in E3, 3.6–4.1 % in E2, against 12.2 % in
the plain class (§4). The general small-ball input (Carbery–Wright, P(|q| ≤ δ‖q‖₂) ≤ Cδ^{1/3}) only limits mass below
radii of order 10⁻⁵ and does nothing for the row.

### 2.3 Part (b): the gate of 4.16, unchanged

The pipeline of 25–26 November (`../../code/degree5-gate/pipeline/`) was run unchanged per game (`CODE/b_game.sh`):
Gaussian rows on 20 values of t from 0.70 to 0.886 (`rows/rowscan.py`); the exact coupled one-spike model
(`gate/spike2.py`, points c ∈ {0.1, 0.3, 0.6, 1} × σ ∈ {0.5, 0.9, 1, 1.1}σ\*) giving the sharing constant θ; the band
table (`thresholds/band5.py`) giving the quintic share κ_h and the band minimum of θ_room at the room of the target
(10000/14025 = 1/1.4025 for the listed games and g80; 500/701 for gC, as recorded). The **quintic share** κ_h is, as in
`gate/kappa_h.py`, the largest over the gate points of [the gains of all shell groups other than the A/B shells H10/H01
and the scalar shift] / (D + V_sl). It is a property of explicit responses and of the row, and contains no radius.

The "sharp buffered comparison of #735" (K ledger 3.5a: E‖Z + √s q‖ ≤ (√π/2)√(1 + s) for s ≤ 1/6) was **not** put in
place of the radius charge: it bounds the cubic part of the row potential, not the shell gains that make up κ_h, so it
cannot move the share. The first worker also found that it applies verbatim to no tuned row (the tuned rows have
b_A, b_B ≠ 0 and ν₅ ≠ 0, so their potential is not of the form E‖Z + √s q‖); this second worker did not re-derive that
statement. Its size condition σ\*²/ℓ² ≤ 1/6 holds on the Gaussian rows from t ≈ 0.79–0.80 up (`CODE/results/b_tables.md`,
B2, last column).

## 3. Controls

| control | now | record | verdict |
|---|---|---|---|
| gC Gaussian rows, 15 rows in common | largest difference 2.1·10⁻¹¹ | `../../code/degree5-gate/pipeline/ctl/g078_rows_all_recorded.lines` | reproduced |
| gC quintic share / band minimum, rows 0.80, 0.82 | 0.110720 / 0.49489; 0.120977 / 0.78514 | 0.110720 / 0.49489; 0.120977 / 0.78513 | reproduced |
| gC θ (4.16: −0.037 at 0.70, −0.091 at the peak, −0.20 at 0.88; shells ≤ 0.16) | −0.037 (0.70), −0.091 (0.85), −0.203 (0.88); κ_h ≤ 0.163 | 4.16 | reproduced (0.163 against "at most 0.16": rounding of the record) |
| gA Gaussian rows, 20 rows | largest difference 1.5·10⁻¹⁰ | `../../code/degree5-gate/results/gA/rows_all.lines` | reproduced |
| gA quintic share / band minimum, row 0.80 | 0.841627 / 0.01816 | 0.841627 / 0.01816 | reproduced |
| gA θ on 0.82–0.875 (4.54: +0.009 to +0.075) and κ_h from 0.82 on (1.04–1.68) | θ +0.044, +0.055, +0.069, +0.069 and κ_h 1.327, 1.440, 1.518, 1.526 at 0.84, 0.845, 0.865, 0.87 | 4.54 | consistent on the rows computed (4 of the 9 rows 0.82–0.875; the others were stopped, §7) |
| gA plain class 2287/2500, t = 0.25 | 0.7366375 (gap −8·10⁻¹⁰) | 0.7364982 (4.54) | **not to the digit**: 1.4·10⁻⁴ higher now. The new oracle is global on its grid, the record's was local; higher is the expected direction (a better law found). No conclusion changes |
| gC plain class 2287/2500, t = 0.25 | 0.6816657 | 0.6815588 (first worker's reading of the record) | not to the digit: 1.1·10⁻⁴ higher, same reason |
| plain class through the LP code and through the conic code (gA, t = 0.25) | 0.7366375 and 0.7366741 | — | agree to 3.7·10⁻⁵ (different atom grids) |
| sup E√U over the class without a radius input (`CODE/results/checks/enriched_sup.log`) | E2: 0.931278 at s = 6; E3: 0.917496 at s = 5.5; both 0.8868 at s = 0 | second-moment class 0.9286 (N), certified 0.93; third-order class certified 0.9156, 0.89694 at s = 0 | as expected: the coded classes are slightly larger than the record's (27 hat tests only) |
| explicit cubics satisfy every constraint as coded (`CODE/a/validate_class.py`, 2²⁰ points; `CODE/results/checks/validate_class.log`) | junta, y₁y₂ȳ₃, y₁²ȳ₂, random tensors in ℂ², ℂ³, ℂ⁴: residuals of (I)–(IV) over the 27 tests within 2.3 standard errors; pointwise cones hold to ≥ −3·10⁻⁸; Gram scalars consistent (e.g. (0.125, 0.250, 0, 0, 0) for y₁y₂ȳ₃); two Gram inequalities of the junta are −7·10⁻³ and −1·10⁻² at s = 41.6, where the Gram relations themselves have a sampling residual of 8·10⁻² | — | consistent with the sampling error; no violation beyond it |

## 4. Part (a): the small-t rows

Full tables: `CODE/results/a_tables.md` (A1 every cell, A2 the worst row per game and class, A3 the maximising laws).
Each cell: the value of the best row found, and in brackets the gap to the dual bound of the pool (§2.1). "—" = not
computed (stopped, §7). Targets: 1/1.4027 = 0.7129108.

**Table A (the optimum gA = (1, −0.8493, 0.2827))**

| t | floor (explicit cubics) | plain 2287/2500 | plain 114/125 | E2 | E3 |
|---|---|---|---|---|---|
| 0 | — | — | — | — | 0.7063521 (4·10⁻⁷) |
| 0.05 | — | — | — | — | **0.7070140** (2·10⁻⁷) |
| 0.1 | 0.6685312 | 0.7207626 | 0.7160308 | 0.7105116 (5·10⁻⁷) | 0.7068243 (2·10⁻⁶) |
| 0.2 | 0.6728590 | 0.7348208 | 0.7289928 | — | 0.7041031 (2·10⁻⁷) |
| 0.25 | 0.6759529 | **0.7366375** | 0.7303467 | 0.7079473 (2·10⁻⁷) | 0.7020280 (2·10⁻⁷)ᵃ |
| 0.3 | 0.6795554 | 0.7354394 | 0.7288837 | — | 0.6998047 (3·10⁻⁶) |
| 0.4 | — | — | — | — | 0.6962540 (5·10⁻⁷) |
| 0.55 | — | — | — | — | 0.7014360 (1·10⁻⁶) |

ᵃ from the log, the final re-evaluation lost (§7). All plain-class gaps are ≤ 10⁻⁶.

**Table A2 (the worst row on the sampled t, per game; room at 1/1.4027)**

| game | t sampled in E3 | plain 2287/2500 | plain 114/125 | E2 (t = 0.1, 0.25 only) | E3 |
|---|---|---|---|---|---|
| gC | 0.1, 0.25 | 0.6839376 (t = 0.4); +2.9·10⁻² | 0.6772989; +3.6·10⁻² | 0.6557118; +5.7·10⁻² | 0.6503222; +6.3·10⁻² |
| g83 | 0, 0.05, 0.1, 0.25 | 0.7213230 (t = 0.25); **−8.4·10⁻³** | 0.7151633; **−2.3·10⁻³** | 0.6945891; +1.8·10⁻² | 0.6910039 (t = 0.05); +2.2·10⁻² |
| g84 | 0, 0.05, 0.1, 0.2, 0.25 | 0.7292829 (t = 0.25); **−1.6·10⁻²** | 0.7230162; **−1.0·10⁻²** | 0.7028391; +1.0·10⁻² | 0.6992993 (t = 0.05); +1.4·10⁻² |
| gA2 | 0.1, 0.25 | 0.7356005; **−2.3·10⁻²** | 0.7293321; **−1.6·10⁻²** | 0.7094391; +3.5·10⁻³ | 0.7057578 (t = 0.1); +7.2·10⁻³ |
| gA1 | 0.1, 0.25 | 0.7363635; **−2.4·10⁻²** | 0.7300817; **−1.7·10⁻²** | 0.7102311; +2.7·10⁻³ | 0.7065454 (t = 0.1); +6.4·10⁻³ |
| gA | 0, 0.05, 0.1, 0.2, 0.25, 0.3, 0.4, 0.55 | 0.7366375 (t = 0.25); **−2.4·10⁻²** | 0.7303467; **−1.7·10⁻²** | 0.7105116; +2.4·10⁻³ | **0.7070140 (t = 0.05); +5.9·10⁻³** |

**Reading.**
- Each enriched class lowers the rows by much more than the room needed: at gA, t = 0.25, from 0.7366 (plain 2287/2500)
  to 0.7303 (radius table 114/125), 0.7079 (E2) and 0.7020 (E3). The largest single step is the first-order identities
  (E2), which cut the atom at zero from 12.2 % to about 4 %; the third-order identities take it to about 1 %.
- In E3 the rows of gA are largest at small t (0.7064–0.7070 on [0, 0.1]), fall to 0.6963 at t = 0.4 and rise again to
  0.7014 at 0.55: the room is smallest at t = 0.05 (5.9·10⁻³) and the next smallest is 6.1·10⁻³ at 0.1. The E3 laws sit at
  s = 5.49–5.50 for t ≤ 0.3, the point where the radius table of 114/125 changes piece (11/2): **the radius input binds,
  so a part of the gain of E3 rests on the table of 114/125 (P + C, author only)**.
- E2 alone already gives room 2.4·10⁻³ at t = 0.1 and 0.25 for gA (t = 0 and 0.05 not computed in E2).
- **What these numbers are.** Upper side: the best row found, evaluated over the class on a grid. Lower side: the dual
  bound over the laws found, for rows within |p − p̂|∞ ≤ 3. Neither is a certificate: the true supremum over the class
  at the row found may exceed the grid value (finer grids raised the plain value by 3.7·10⁻⁵, §3), and the t not sampled
  are not covered. With rooms of 5.9·10⁻³ and above, both effects would have to be a hundred times larger than measured
  to change the conclusion of part (a).
- g80 has no part (a) cells (its queue was stopped, §7).

## 5. Part (b): the gate on the band

Full tables: `CODE/results/b_tables.md` (B1 controls; B2: θ, κ_h, A/B share, one-inequality constant, non-concave
points and σ\*²/ℓ² for every row computed; B3: the band table; B4: the radius-only bound of the quintic gain) and
`CODE/results/b_groups.md` (the shell groups of κ_h).

**Table B. The quintic share κ_h (gate points) and θ per row** (N; "—" = not computed in the time; gA1 and gA2 were
stopped after their first rows, which agree with gA to 0.013 in κ_h: gA1 0.387, 0.761, 1.314, 1.687 at 0.70, 0.79,
0.84, 0.865).

| t | gC κ_h / θ | g80 κ_h / θ | g83 κ_h / θ | g84 κ_h / θ | gA κ_h / θ |
|---|---|---|---|---|---|
| 0.70 | 0.073 / −0.037 | 0.143 / −0.033 | 0.277 / −0.028 | 0.334 / −0.027 | 0.389 / −0.026 |
| 0.76 | 0.093 / −0.045 | 0.190 / −0.040 | 0.396 / −0.033 | 0.493 / −0.031 | — |
| 0.80 | 0.111 / −0.056 | 0.233 / −0.048 | 0.522 / −0.039 | 0.673 / −0.035 | 0.842 / −0.022 |
| 0.82 | 0.121 / −0.065 | 0.259 / −0.055 | 0.611 / −0.042 | 0.808 / −0.029 | — |
| 0.84 | 0.133 / −0.080 | 0.290 / −0.066 | 0.726 / −0.048 | 0.993 / +0.002 | 1.327 / +0.044 |
| 0.845 | 0.136 / −0.085 | 0.299 / −0.070 | 0.755 / −0.042 | 1.048 / +0.010 | 1.440 / +0.055 |
| 0.85 | 0.139 / −0.091 | 0.308 / −0.074 | 0.796 / −0.034 | 1.124 / +0.020 | — |
| 0.86 | 0.146 / −0.108 | 0.328 / −0.085 | — | — | — |
| 0.865 | 0.151 / −0.121 | 0.338 / −0.093 | 0.925 / −0.011 | 1.359 / +0.047 | 1.518 / +0.069 |
| 0.87 | 0.154 / −0.138 | 0.350 / −0.104 | 0.980 / −0.002 | 1.461 / +0.058 | 1.526 / +0.069 |
| 0.875 | 0.159 / −0.162 | 0.362 / −0.118 | 1.026 / +0.005 | 1.557 / +0.066 | — |
| 0.88 | 0.163 / −0.203 | 0.373 / −0.140 | 1.063 / +0.011 | 1.627 / +0.073 | — |
| 0.886 | 0.154 / −0.137 | 0.374 / −0.106 | — | — | — |

The gA rows 0.865 and 0.87 are the unconverged Gaussian rows of 4.54 (σ\* = 0); their values are quoted as computed.
Band table (room of 1/1.4025; 500/701 for gC): band minimum of θ_room at t = 0.80 / 0.82: gC 0.495 / 0.785; g80
0.288 / 0.454 (then 0.829 at 0.84, 1.102 at 0.845); g83 0.092 / 0.125; g84 0.049 / 0.052; gA 0.018 / none.

**What makes up the share** (`CODE/results/b_groups.md`; at the maximising point, which is always c = 0.1, σ = σ\*):
H₂,₂ takes about 60 % of κ_h, H₃,₁ about 18 %, H₁,₁ about 17 %, H₂,₀/H₀,₂ about 5 %; for gA at t = 0.80:
0.502 + 0.155 + 0.142 + 0.043. **The maximiser sits at the edge c = 0.1 of the grid of spike couplings**, so the largest
share over all c is at least the value shown: the tabulated shares are lower estimates, which only strengthens the
verdict.

**The share scales with the quintic weight.** At t = 0.80: η = 0.078, 0.136, 0.224, 0.255, 0.283 give κ_h = 0.111,
0.233, 0.522, 0.673, 0.842. By linear interpolation in η the share 0.35 is reached at t = 0.80 near η ≈ 0.17
(ε ≈ 0.81; the cap-0.81 game of 4.53 had 0.31 there), and on the whole band 0.70–0.886 only for η ≲ 0.13.

## 6. The two errors of the brief

1. **"A quintic radius below √π/2" cannot be a provable universal input.** K ledger 3.30 (a): normalised diffuse sums
   and multilinear sums in H₃,₂ converge in L¹ to √π/2, so sup E|q|/‖q‖₂ ≥ √π/2 over the quintic chaos. Any universal
   quintic radius is at least √π/2 = 0.8862; the sharp value √π/2 itself is open (3.30 (b) proves it only for
   hyperplane-vanishing and conditionally Gaussian quintics; the proved universal bound is 0.999999998).
2. **The gate's quintic share does not depend on any quintic radius.** κ_h is a ratio of shell gains of explicit
   one-spike responses to the deficit (§2.3); no radius enters it, and a valid radius bound cannot lower the gain of an
   actual response. A radius r enters a certificate only through the first-order bound 2r‖G₅‖₂ of the phase terms,
   i.e. a gain of at most ηr²/(1 − c) for the whole quintic part; against the deficit of the gate points this ratio is
   between 1 and 3·10⁶ for every r ≥ 0.7 (B4): useless at any radius. So "the quintic radius that would bring the
   share under 0.35" does not exist; the share can only be lowered by the decomposition (§9).

Also (§2.3): the buffered comparison of 3.5a does not act on the shares.

## 7. Where the time went

Measured on mega (32 vCPUs; every process single-threaded, OMP_NUM_THREADS = 1).

- **Part (a), one enriched cell** = 2–4 bundle iterations × 160–330 oracle points, i.e. 500–1,000 conic solves.
  Profile of one oracle point (`CODE/a/prof_cell.py`, E3, 253 atoms, 27 tests; machine loaded; `CODE/results/checks/prof_cell.log`):
  **conic solve (Clarabel) 72 %**, **quadrature of Ψ₅ on the atom grid (numpy) 23 %**, Python glue (assembly of the
  sparse cone data) 5 %. One E3 solve takes 1.8–2.6 s, one E2 solve 1.2–1.7 s, one Ψ₅ evaluation 0.4–0.7 s. A cell
  took 15–20 minutes alone and 50–110 minutes on the oversubscribed machine (load about 75 on 32 cores in the first
  half of the night). Plain-class cells are LPs (HiGHS) with atom refinement: similar wall time, dominated by the LP
  solves and the 11,000-point dual check.
- **Part (b), one game** = Gaussian rows (2 × 10 rows, about 25 minutes), then in parallel the cheap gate integrals
  (per row hab, h11c, law LP, lp_rows: about 6 minutes per row, 20 rows sequential, about 2 hours), the exact one-spike
  model (`run_sp2_line.py`: 12–13 minutes per row on one core, `gate_*/out/sp2.log`; 4 chains of 5 rows, about 1 hour)
  and the band table (`band5.py`: per band row the κ_h scan of 12 spike points and the θ_room program of
  `r4_theta5.py`, 20–30 minutes per row, 10 rows sequential, about 4 hours). All of it is numpy quadrature driven from
  Python loops, plus small LPs.
- **Worth porting to C++** if this had to be repeated over many games or certified: (1) the Ψ₅ kernel
  E_z|L + νe₃₂ ± sD| on a grid of s (40 × 8 × 128 nodes per value; an embarrassingly parallel sum; with interval
  arithmetic it is the node-cap kernel of 4.17, already written in C++ in `LAWREP`); (2) the coupled one-spike
  integrand of `spike2.py`, the main cost of the gate and of the band table. Not the conic solves: Clarabel is already
  compiled (Rust); the saving there is fewer solves (warm starts across the (σ, ν, s) grid, a coarser first pass). The
  Python glue is not worth porting.

**What was stopped, and one incident.** At the handover (28 Nov, about 01:55) the part (a) cells at t = 0.3–0.4 in all
classes, the plain cells of gC at t = 0.1, the small-t queue of g80, the follow-up queues (E3 with the radius 2287/2500
and with no radius at t = 0, 0.05, 0.1, 0.25; t = 0.025, 0.075, 0.125) and the gates of gA1 and gA2 were stopped. Six
cells were started, at t = 0 and 0.05 in E3 for gA, g84 and g83, because the binding t of E3 is the smallest one and
none of these was queued, and then three more for gA at t = 0.3, 0.4, 0.55 to cover the upper part of
[0, 0.55]. The rest of the gates ran on until 28 Nov 02:29 (all jobs stopped then). Incident: the cell gA, E3, t = 0.25
converged (iteration 3: 0.7020280, gap 2.0·10⁻⁷), but before it wrote its result its driver script, which had been
edited on disk while it ran, re-launched the cell and truncated its log; the value is taken from a copy of the log made
an hour earlier (`CODE/results/a/gA__E3_KOUL3__0.25.err.recovered`; the result file `CODE/results/a/gA__E3_KOUL3__0.25.json` is rebuilt from it by hand and says so), and the final full-grid re-evaluation of that cell is
missing.

## 8. Verdict under the stop rule of #751

The rule needs, for one game, (i) rows below 1/1.4027 = 0.7129108 on all of [0, 0.55] in a class whose constraints are
proved or look provable, and (ii) a quintic share below 0.35 at a quintic radius the evidence makes plausible.

- **(ii) fails for every game of the list.** The smallest share of each on the band is at t = 0.80, the lower end:
  0.522 (g83), 0.673 (g84), 0.842 (gA); gA1 and gA2 lie between g84 and gA (gA1: 0.761 at t = 0.79, against 0.619 for
  g84 and 0.766 for gA). The share is a lower estimate (grid edge, §5) and contains no radius (§6), so no radius changes
  this.
- **(i)** would hold in E3 on the sampled t for gA, g84 and g83 (largest rows 0.7070140, 0.6992993, 0.6910039, rooms
  ≥ 5.9·10⁻³ at 1/1.4027); the class rests on proved constraints (Lean, P + C) plus the radius table of 114/125
  (P + C, author only). It fails in the plain class of the record. Since (ii) fails, (i) does not decide anything.

**Decision: degree 5 is closed for the games of #751; by the rule the effort goes to degree 7.** Deciding numbers:
κ_h(t = 0.80) = 0.522, 0.673, 0.842 for g83, g84, gA, against 0.35.

## 9. Not part of the stop rule: g80, and what could lower the quintic share

**g80.** The game (1, −0.80, 0.1364) is outside the list of #751, so it cannot reopen degree 5 under the rule as
written. It is reported because it is the one game computed that nearly meets condition (ii): θ ≤ 0 on all 20 rows
(−0.033 to −0.140); κ_h ≤ 0.328 on 0.70–0.86 (0.290–0.308 on the binding rows 0.84–0.85), but 0.350–0.374 on
0.87–0.886, where the rooms are larger. Its Gaussian envelope is 0.7126976 at t = 0.85 (room 2.1·10⁻⁴ at 1/1.4027 and
6.1·10⁻⁵ at 1/1.403, with zero sector cost); its band minimum of θ_room is 0.288 at t = 0.80 (capped game 0.495,
cap-0.81 game 0.217). Its small-t rows were not computed (stopped); the E3 rows grow with ε at every t computed, so
those of g83 (§4, at most 0.6910 on t ≤ 0.25) indicate what g80 would need (an indication, not a bound). Whether g80 is worth a design is for the user: with zero sector cost it
buys at most 1/0.7126976 = 1.40312, against 1.402735 for the capped design (4.50).

**What could lower the share** (ideas, none tested here):
1. *Charge the H₂,₂ and H₃,₁ shells against the quintic sector's own deficit.* At the maximising points 78 % of the
   share is H₂,₂ + H₃,₁. The record charges them, like every non-A/B group, to the shared deficit D + V_sl. A
   decomposition that keeps the −ν²/η term of the quintic coefficient with these shells (the comparator at the pair's
   quintic coefficient, the second form of H8 in DSGN §5.6) would pay for part of them out of the quintic weight.
2. *A tilt in the quintic direction*, as the tilt (2/5, 3/20) did for the A/B shells (4.43): a retained penalty on the
   H₂,₂ shell, re-optimised per row.
3. *Treat the visible quintic G₅ = ν₅e₃₂ exactly* instead of as part of the response; its own group (H₃,₂) is already
   0 at the maximising points, so this is the least promising.

**The single computation that would test (1):** for g84 at t = 0.80 and 0.85, re-run the exact one-spike model
(`gate/spike2.py`) with the quintic coefficient ν₅ optimised per spike point and its penalty ν²/η kept with the
H₂,₂/H₃,₁ groups, on a grid of c extended below 0.1 (c ∈ {0.02, 0.05, 0.1, 0.3}). If κ_h falls below 0.35 at both rows,
idea (1) reopens the listed games; if it stays above 0.5, decompositions of this type do not help. Cost: 2 rows × 16
points, about an hour on 8 cores.

## 10. Proposed ledger rows (not entered; for the recording worker)

- **4.56** *Stage 0 (#751), part (a): in the class E3 the small-t rows of the optimum and its neighbours are below
  1/1.4027 on the sampled t.* E3 = moments + the radius table of 114/125 + the first- and third-order antiholomorphic
  identities (27 hat tests) + the kernel moment facts of K 3.7; global oracle on a fixed grid, master without trust box.
  Largest rows found on the sampled t: gA 0.7070140 (t = 0.05; t ∈ {0, 0.05, 0.1, 0.2, 0.25, 0.3, 0.4, 0.55}),
  g84 0.6992993, g83 0.6910039 (t ≤ 0.25); E2 at t = 0.1, 0.25: gA 0.7105116; dual gaps ≤ 3·10⁻⁶; the E3 laws sit at
  the piece boundary s = 11/2 of the radius table. The plain class of the record exceeds every target by up to 2.4·10⁻² (gA, t = 0.25: 0.7366375, 1.4·10⁻⁴
  above the record's 0.7364982). E3 cuts the mass at U ≤ 10⁻³ from 12.2 % to about 1 %. | the games gA, g84, g83 (and
  E2/E3 at t = 0.1, 0.25 for all six listed games); sampled t only | **N** (research workers of claude-b9ee; author
  only) | STAGE0 §4.
- **4.57** *Stage 0, part (b): the quintic shares of the games with ε = 0.83–0.8493 are 0.52–0.84 at t = 0.80 and pass 1
  from t = 0.84–0.875; θ > 0 from t = 0.84 (g84, gA) and 0.875 (g83).* Controls: gC and gA reproduce 4.16 and 4.54
  (rows to 1.5·10⁻¹⁰, shares to 10⁻⁶). The share contains no radius; any universal quintic radius is ≥ √π/2 (K 3.30 (a)).
  g80 (ε = 0.80, outside #751): θ ≤ 0 on all rows, κ_h 0.143–0.374, above 0.35 only on 0.87–0.886. | the pipeline of
  D5GATE unchanged; maximisers at the edge c = 0.1 of the grid | **N** | STAGE0 §5, §6.
- **4.58** *Decision of #751: degree 5 closed.* By the rule of #751, condition (ii) fails for every listed game. Not
  excluded: other sector decompositions (STAGE0 §9). | **N** | STAGE0 §8.

with the sources line `STAGE0 | sources/degree5-stage0-2026-11-28/REPORT.md and code/degree5-stage0/: issue #751, Stage 0
of the degree-5 plan. Research workers of claude-b9ee, 27–28 November 2026; author only`.
