# The radial profiles of the degree-5 content band

What a reader outside the working folder needs in order to evaluate a statement about the content band
t ∈ [0.80, 0.855] of the capped degree-5 game (`../../STATUS.md` 4.19 and the rows after it, and §5, item 2). Everything here is
numerical (**N**). Nothing here is imported, built or checked by CI.

## The profiles

z is a standard complex Gaussian (E|z|² = 1), T = |z|², and e₁₁ = T − 1, e₂₀ = z²/√2, e₃₂ = z(T² − 6T + 6)/√12.
For a row with parameters (ℓ, β, b_A, b_B, ν₅) and an amplitude s ≥ 0 (the modulus of the remote cubic):

    L′(z) = z(ℓ + β(T − 2)) + ν₅·e₃₂(z),      D(z) = 1 − b_A·e₁₁(z) − b_B·e₂₀(z),      A±(z; s) = L′(z) ± s·D(z),

    ψ(s)   = E|A₊| + E|A₋|                           the q-only potential Ψ₅(s; ν₅)
    Γ_A(s) = Re E[conj(e₁₁)·(ph A₊ − ph A₋)]          first variation in the A shell (charge +1)
    Γ_B(s) = Re E[conj(e₂₀)·(ph A₊ − ph A₋)]          first variation in the B shell (charge −1)
    Γ_0(s) = Re E[ph A₊ − ph A₋]                      first variation along a remote linear form with visible factor 1

with ph w = w/|w|. The game is (1, −39/50, 779/10000): e₁ = 0.78, η = 0.0779.

**Tilted sector profiles.** On the six band rows the study uses the tilts (s_A, t_B) = (0.4, 0.3)
(`CONTENT_LEMMA_D5.md` §4.1):

    G_A = Γ_A + 0.4·Γ_0,      G_B = Γ_B + 0.3·Γ_0,      h(v) = G(√v)/√v.

For a remote cubic q ∈ H₂,₁ with V = |q|² and u = E V, the first-chaos content in a sector is c[h] = Π₁[q·h(V)], and

    k(v) = E h(v + uτ), τ ~ Exp(1),      Ω̂[h] = (3/2)·E[V·k′(V)²] − (3/4)·(E[V·k′(V)])²/u.

The quantity the ledger rows speak of is the ratio ‖c[h]‖²/(δ·Ω̂[h]), δ = E V² − 2u². Rows 4.20 and 4.27 of the
ledger measure it on u/u* ∈ [0.5, 1.3]; the band of each row on which the content law is needed is in
`../../sources/content-problem-v2-2026-11-16/PROBLEM_V2.md` §2. u* is the row's Gaussian energy, the maximiser of E ψ(√(u·τ)) − cost(u) (`rowlib.Row`).

## Files

| file | what |
|---|---|
| `profiles/band_row_<t>.json` | one table per row, t = 0.80, 0.82, 0.84, 0.845, 0.85, 0.855: the row parameters (`row`), the tilt, `ustar`, the benchmark `S5`, the threshold `theta_needed` of 4.19 (v), and `S`, `psi`, `GA`, `GB`, `G0` on 705 amplitudes in [0, 6] (12 significant digits). Beyond s = 6 the study continues ψ linearly and freezes Γ |
| `rows5.lines` | the 18 rows of the capped game optimised for t ≥ 0.70, one JSON object per line; the band rows are lines 5, 7, 9, 10, 11, 12 |
| `prof.py`, `tilt.py` | the generator: `python3 prof.py <line> out/prof_<line>.npz`, then `python3 tilt.py <line>` (adds Γ_0); about a minute per row |
| `export_profiles.py` | wrote the JSON tables from those `.npz` files |
| `check_profiles.py` | recomputes a table from the definitions with another quadrature |
| `check_profiles_0.855.log` | its output on the row 0.855 |
| `rowlib.py` | the row object (splines, u*, the junta and the spike family in closed one-dimensional form) |
| `t4lib.py`, `t4fam.py` | content, the representation 6.3.23, the projected bound 6.3.25 and Ω̂ for two-variable cubics with a diffuse bulk; `t4fam.py` is the driver behind the family tables of `CONTENT_LEMMA_D5.md` §11 |
| `rice.py`, `lawstein.py` | the response-side Rice family and the law layer (they need cvxpy; `t4fam.py` imports `rice.py`) |

The Python files other than `export_profiles.py` and `check_profiles.py` are unedited copies of the study's scripts
(`../../INVENTORY.md`); they expect `rows5.lines` in the working directory and the tables under `out/`.

## Accuracy

- The tables come from a tensor rule with 262,144 points. The integrands have a vortex at each zero of A±, so the
  accuracy is about 10⁻⁴, not machine precision.
- `check_profiles.py` (6.5 million points, graded panels) agrees with the tables to 2·10⁻⁵, 5·10⁻⁵ and 7·10⁻⁵ on the
  rows 0.80, 0.84 and 0.855.
- A review worker recomputed all six rows from the definitions with a third rule and found agreement to 8·10⁻⁵
  (`../../../conjecture-K/sources/content-law-2026-11-16-codex-a786/REVIEW.md` §4.1).
- The imaginary parts of the two expectations defining Γ_A and Γ_B vanish to 10⁻¹⁷.

## What is not here

The thresholds `theta_needed` are numerical outputs of the study (interpolated between its energies, and
extrapolated at t = 0.855); they are inputs to a statement, not certified numbers. The searches, the law-layer runs
and the logs of the study stay in the working folder (`../../INVENTORY.md`).
