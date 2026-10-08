# 480-mode extension of the upper certificate (computational, not yet in Lean)

8 October 2026. Starting from the 240-mode certificate (`handoff/upper/`), the origin-kernel
radial coefficient tables were extended by certified Arb quadrature to modes 240..479 with
the handoff's own generator (`generate_added_origin.py --start 240 --count 480`, 6 processes,
45 minutes; per-mode enclosures in `cache_240_480/`, log in `gen.log`), and the combined
verifier was parametrized in the mode count (`verify_combined_N.py`, validated to reproduce
the 240-mode result exactly). Table SHA-256:
`4e21655bb11ba00683f9bafc58610b15eabf77a32c08064b691ce3196edf6fcd`.

Result (`result480.json`, frozen preprocessor `inverse_eta.json`):

| quantity | 240 modes | 480 modes |
|---|---|---|
| preprocessed upper endpoint | 1.404898359045957 | **1.404898357807130** |
| weighted tail `T` | 2.5308e-8 | 6.357e-9 |
| sixth-kernel tail (unweighted) | 6.363e-5 | 1.598e-5 |
| remaining energies `E_L, E_R, E_C` | 8.84e-4, 8.85e-4, 3.52e-3 | 2.29e-4, 2.29e-4, 9.14e-4 |
| `W'_N` | 1.0843e-6 | 2.7117e-7 |
| retained nonlinear norm after composition | 4.32e-8 | 6.15e-8 |

So `K_G^ℂ < 1.404898357808`, an improvement of 1.24e-9 over the 240-mode endpoint.  The gain
is small because the far-tail coefficient mass is real: the Cauchy–Schwarz tail bound at 240
was within about 30% of the actual `Σ_{240≤n<480}|k_n|`, and the newly retained coefficients
enter the nonlinear norm.  The remaining energies scale like `1/N`, so the residual tail at
`N` modes behaves like `~1.5e-8/ (N/240)` in the constant; even infinitely many modes would
leave this six-kernel construction above roughly 1.4048983450.  Re-deriving the preprocessor as
the inverse series of the 480-mode mixture (`eta_opt.py`, `eta480.json`) changes the endpoint
by less than 1e-20: the preprocessor is saturated.

Formalizing this in Lean needs: 480-box data in `Grothe/Cert240/Data.lean` (generator
extension), the checker mode count (`CheckerDefs.lean`, `Interface.lean`) at 480, the
composition through radial degree 114600 (≈ 4× the current 20-minute `native_decide`), and the
analytic constants in `Assembly240.lean`/`JointTail.lean`/`FifthTail240.lean` recomputed for
cutoff 480 (Cauchy tails `10R⁻⁹⁶¹/(1−R⁻²)`, `W'_480`, the energy caps above, the fifth finite part).
