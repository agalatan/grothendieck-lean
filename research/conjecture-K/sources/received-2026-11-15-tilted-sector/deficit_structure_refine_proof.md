<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_structure_refine_proof.md (file dated 2026-11-15 05:46). Only this line was added. -->
# Refined low-energy content coefficients

Agent-ID: **codex-6e2b**, 15 November 2026.

**P+C.** At the peak row and tilt `s=3/5`, for every finite dimension and
every complex cubic of bidegree `(2,1)`, the following bounds hold. All
energy intervals include both endpoints and end at `463/10000=.0463`.

| Lower energy endpoint | Certified scalar cap `M` | Exact content coefficient `(11/108)M^2` | Convenient larger rational coefficient |
|---|---|---|---|
| `9/1000` | `701801/1000000` | `5417771079611/108000000000000` | `251/5000=.0502` |
| `3/250` | `689101/1000000` | `5223462070211/108000000000000` | `121/2500=.0484` |
| `3/200` | `677001/1000000` | `560181543779/12000000000000` | `467/10000=.0467` |
| `9/500` | `665401/1000000` | `4870343398811/108000000000000` | `451/10000=.0451` |
| `1/50` | `658001/1000000` | `4762618476011/108000000000000` | `441/10000=.0441` |

For each row, `||c_{3/5}(q)||^2` is at most the displayed coefficient
times `delta=E|q|^4-2(E|q|^2)^2`. The exact coefficients are approximately
`.0501645470, .0483653895, .0466817953, .0450957722, .0440983192`.
There is no condition on `chi=delta/u^2`.

The exact rational witnesses are
`deficit_structure_refine_witness_009.json`, `012.json`, `015.json`,
`018.json`, and `020.json`, with the common filename prefix on each.
Their values and physical derivatives define cubic Hermite functions on
the 500 cells `[i/500,(i+1)/500]`. The scalar functions are extended
constantly after one, at the slightly smaller endpoint values
`.7018, .6891, .6770, .6654, .6580`, respectively.

The additive checker `deficit_structure_refine_verify.py` follows the
already audited proof in `deficit_structure_content_proof.md` unchanged:

1. Recompute the interval bound `|m''''|<=1000` on `[0,1]`, and the
   bounds `m''>-1` on the positive half-line and `|m''|<3/5` on `[1,infinity)`.
   Both omitted source-integration tails and infinite parameter rays are
   explicitly included.
2. Recompute `m''` at all 501 rational nodes. Linear interpolation plus
   `1000/(8*500^2)` is a whole-cell source majorant.
3. Verify every rational cubic Bernstein coefficient of
   `(5/3-(u/2)partial_x^2+x partial_x)K-m''_upper` is positive at both
   energy endpoints. Affine dependence on `u` covers the entire interval.
4. Verify the scalar cap, the exact endpoint conditions, and the
   nonnegative derivative at one. The half-line comparison, including
   its favorable downward derivative jump, gives `k_u<=K`; the lower
   source bound gives `k_u>=-3/5`. Oddness supplies the whole-line bound
   `||k_u||_infinity<=M`.
5. Apply the proved angular/tensor inequality
   `||c||^2<=(11/108)||k_u||_infinity^2 delta` and check each comparison
   to the convenient rational coefficient exactly.

The residual margins exceed `1.936e-5`. The fresh scalar integrations
are shared among these five witnesses within one replay; no stored
integral is trusted. Numerical optimization only proposed the rational
functions and is not a mathematical premise. The previously frozen
certificates were not modified.
