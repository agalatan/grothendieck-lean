# Handoff: 480-mode extension of the complex Grothendieck upper certificate, and the Lean status

8 October 2026. Written for the other instances working on improvements in parallel.
Everything below is reproducible from this bundle plus the pinned upstream snapshot
(`sheilman77/grothendieck_cx` at commit `7139f4cb8d0f30c2eb4c1267c46732a9d5229c3f`) and the
`grothendieck-lean-handoff-v2` archive (unchanged inputs; no new analytic assumptions).

## 1. Result

Extending the origin-kernel coefficient tables of the Heilman–Jones–Malavolta construction from
240 to 480 radial modes gives the certified endpoint

    K_G^C < 1.404898357808        (internal endpoint 1.40489835780712993522...)

versus the previous 1.404898359045958 (gain 1.24e-9). Same six kernels, same six weights, same
frozen preprocessor `inverse_eta.json` (SHA256 d058a4b2…), same energy caps, same truncation
error model; the only new input is one more certified quadrature table.

| quantity (frozen eta) | 240 modes | 480 modes |
|---|---|---|
| preprocessed upper endpoint | 1.404898359045957 | **1.404898357807130** |
| normalized slope D/M | 0.71179526516002430 | 0.71179526578767914 |
| weighted tail T | 2.5308e-8 | 6.3567e-9 |
| sixth-kernel tail, unweighted | 6.3628e-5 | 1.5982e-5 |
| remaining energies E_L, E_R, E_C | 8.8426e-4, 8.8513e-4, 3.5210e-3 | 2.2863e-4, 2.2884e-4, 9.1410e-4 |
| W'_N = sum_{n>=N} h_n/(2n+1) | 1.08431e-6 | 2.71173e-7 |
| fifth tail (total) | 1.0402e-12 | 1.8190e-13 |
| global integration error | 1.21088e-11 | 1.21120e-11 |
| retained nonlinear norm after composition | 4.3194e-8 | 6.1518e-8 |
| composition degree | 57240 | 114600 |

## 2. What is in the bundle (`upper-480/`)

| file | content | SHA256 |
|---|---|---|
| `added_origin_240_480.npz` | binary64 outward endpoints of A_n(0,36), B_n(0,36) for n = 240..479, both sides, real/imag | 4e21655bb11ba00683f9bafc58610b15eabf77a32c08064b691ce3196edf6fcd |
| `cache_240_480/*.json` | the 480 per-mode Arb enclosures with dps = 60 + n/4, plus the generation manifest (source hashes) | — |
| `gen.log` | generation log (6 processes, 45 min, macOS arm64, python-flint 0.9.0, NumPy 2.4.4, Python 3.14) | — |
| `verify_combined_N.py` | the v2 `verify_combined.py` parametrized by `--modes`, accepting extra `--added-table` files in order, `--eta`, `--final`; validated to reproduce the 240-mode result bit-for-bit | abb113327fd0ff442a182e3984c635206d7c3621a73b33cf1894b9239a8b4e85 |
| `result480.json` | full directed assembly output at 480 modes | 512506de496b2352041ff55122158025aab95c7f2c36bafdf9b25751bf89d70c |
| `eta_opt.py`, `eta480.json`, `result480_eta.json` | re-derived inverse-series preprocessor (heuristic proposal, then certified by the verifier); endpoint identical to the frozen eta beyond the 20th digit | b11e91a0… (eta480.json) |

Reproduce (from the v2 handoff root, with its `upstream/grothendieck_cx`):

    python generate_added_origin.py --source-dir upstream/grothendieck_cx --start 240 --count 480 --cutoff 36 --jobs 6 --output added_origin_240_480.npz
    python verify_combined_N.py --source-dir upstream/grothendieck_cx --modes 480 --added-table added_origin_240_480.npz --final 1.404898357808

`verify_combined_N.py` must sit next to the v2 `combined/` files (`manifest.json`,
`inverse_eta.json`, `added_origin_120_240.npz`, `energies.json`, `upper_base/`). Do not run with
`-O`/`-OO`.

## 3. What this tells you about where improvement is still possible

These are measured facts, not guesses; please do not spend effort re-discovering them.

1. **More modes are nearly worthless.** The weighted tail dropped by 1.9e-8 but the newly
   retained coefficients add 1.8e-8 to the nonlinear norm: the Cauchy–Schwarz tail bound at 240
   was within ~30% of the true coefficient mass beyond 240. The remaining energies scale like
   1/N, so the residual tail at N modes costs about 1.3e-8·(240/N) in the constant; the infinite-
   mode limit of this six-kernel construction is roughly 1.40489834, still above the LP method
   floor 1.404898309 (signed mixtures, no tail).
2. **The preprocessor is saturated.** Re-deriving eta as the inverse series of the mixture with
   120, 240 or 360 terms changes the endpoint by at most 5e-12 at 240 modes and < 1e-20 at 480:
   longer eta only moves mass between the composed residual and the linear coefficient.
3. **Weights are at the LP optimum** (active zero set {1,3,4,5,7}, from the cross-instance audit).
4. Therefore the upper side needs **new kernels** (new Gaussian phase constructions with their own
   quadrature) or a **new transfer idea**; the lower side has 0.002 of room up to the witness
   ceiling 1600/(363π) ≈ 1.40302, all of it in the profile/moment analysis of ‖T‖_{∞→1}.
5. Literature check (8 Oct 2026): nothing newer than arXiv:2609.25462 for the complex constant;
   arXiv:2610.10477 (primal/dual, real constant 1.773 ≤ K_G ≤ 1.7799) is the current style of
   large certified searches.

## 4. Lean formalization status (repo `grothe`, commit 85cf5f1, Lean v4.34.1 / Mathlib v4.34.1)

All statements below compile with no `sorry`; axioms are `propext`, `Classical.choice`,
`Quot.sound` plus explicitly listed `native_decide` facts (finite exact computations).

**Upper bounds, fully assembled theorems with explicit analytic hypotheses:**
- `complex_grothendieck_source` : `K_G^C ≤ 1.404898554745441` (HJM, 120 modes).
- `complex_grothendieck_refined` : `K_G^C ≤ 1.404898426735` (120 modes, sharper tails).
- `complex_grothendieck_240` : `K_G^C ≤ 1.404898359045958` (240 modes, common preprocessor,
  first-order joint energy). The finite interval checker (`FiniteCertificate240 Dlo240`,
  Dlo240 ≈ 0.71179529047965838, margin 2.8e-16 over the needed 0.7117952904796581) is a
  sound fixed-point interval kernel (2^-128 outward rounding) with soundness proofs; one
  20-minute `native_decide` evaluates it.
- Proved analytic core: transfer inequality via tensor powers; valid ⇒ dominated kernels;
  convex mixtures; allowable preprocessors (unit feature vectors) and composition on the disc;
  the Wiener-norm contraction; Haagerup coefficients and the corrected Wallis estimate
  `h_n < 1/(4(n+1/4)(n+1))`; telescoping tails; the weighted Cauchy–Schwarz joint tail;
  fifth-tail block reserves; all rational arithmetic.
- Remaining hypotheses (not formalized): kernel domination (Haagerup's Gaussian identity), box
  containment of the truncated coefficient integrals (Arb quadrature), scalar coefficient
  identification, the sixth-kernel first-order decomposition with its three energy caps, the
  four Cauchy tails and the fifth finite part.
- The 480-mode result above is **not yet in Lean**. Port plan: 480 boxes in
  `Grothe/Cert240/Data.lean`, mode count 480 in `Interface.lean`/`CheckerDefs.lean`,
  composition through degree 114600 (≈ 4× the current evaluation), constants in
  `Assembly240.lean`/`JointTail.lean`/`FifthTail240.lean` at cutoff 480 (Cauchy tails
  `10R^-961/(1-R^-2)`, `W'_480`, energies above, fifth finite part 1.82e-13 incl. reserve).

**Lower bounds, finite layer formalized, analytic reduction as hypotheses:**
- v1 (`B = 3569353321/5e9`, `K > 1.400813971`) and v2 (`B = 7138283181/1e10`,
  `K > 1.4008970709`, C6 = 49.42288923): Bernstein bounds, LDL-certified PSD gates, dyadic
  covers, all virtual caps (21/4197 and 18/10218 leaves), scalar envelopes, strict endpoints;
  v2 also verifies chord domination of all 365 physical polynomials (lifted node caps + affine
  tail), so the analytic hypothesis on the potentials reduces to: convex, 2-Lipschitz, below the
  lifted node caps. The nine old source row caps are taken as data.
- Analytic lemmas proved: three-moment lemma, C6 and rho positivity certificates (old and
  sharper C6), `E|q| < rho` inherited by the sharper constant, variance/retained-square
  identities, two-row mixing bound, joint convexity/argument allocation, Schur gate,
  endpoint/limit argument.
- Not formalized: Gaussian profile reduction, node caps (Gaussian price enclosures), Wick
  sixth-moment identity, Gaussian-operator-to-matrix transfer.

**Interfaces, if you produce a new certificate and want it formalized:**
- Upper: supply, per kernel, the exact rational scalar rows (or coefficient boxes), the box
  tables as exact binary64 endpoints, the energy caps, and the weights; the Lean side needs
  `FiniteCertificate240`-style statement `Dlo ≤ P_0 − Σ_{n≥1}|P_n|` for boxed inputs and the
  per-kernel tail bounds in the form `Σ' n, |k_i (n+N)| ≤ t_i`.
- Lower: records with exact rationals in the v2 JSON format (profiles, leaves with binary paths
  and polynomial indices, optional argument scales, tightening data) check directly; new
  physical polynomials need their chord cells (`physical.cells`, `tail_index`).

## 5. Conventions and pitfalls (as encountered)

- Radial index n ↔ odd degree 2n+1; preprocessors ρ(t) = t·P(t²) are stored as the list of P.
- Upstream negates the third scalar row and its weight; use the positive orientation.
- Weight mass M = 1.000000000000000012, not 1.
- β = −iα exactly (endpoint identity), so the joint amplitude C(0) = 0.
- Truncated inputs: boxes enclose A_n(0,36); the s > 36 remainder has ℓ² norm ≤ e^-18 per side;
  use box-derived norms ‖A‖₂, ‖B‖₂ ≤ 0.99948 (not 1) in the error budget, else the 240-mode
  margin is lost (the margin is only 2.8e-16).
- Lower side: add the 1e-8 lift exactly once (node caps and polynomial constants); the single
  penalty after allocation is −d²u²/d'; keep one contact pair per rectangle if you ever use
  conditional first moments.
