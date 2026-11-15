<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/progress_2026-11-05/conjectureK_audit/README.md (file dated 2026-11-05). Only this line was added. -->
# Conjecture K research results — 5 November 2026

Read **proof.md** first.

Two rigorous results:

1. **Gaussian-factor theorem:** for every
   `q = sum_j X_j (Y* A_j Y - tr A_j)`, arbitrary complex matrices and arbitrary
   numbers of drivers, the content satisfies `C(q)^2 <= 0.239 (B(u)-F(q))`
   on `0.00551 <= u <= 0.0463`, at all three application rows. The previous
   covariance cutoff is removed. With the supplied 0.24 shell-cost theorem,
   this proves K on the shared-A rectangle for this class.
2. **Conjecture E is false:** an explicit energy-preserving perturbation of the
   Wick monomial increases the content-to-deficit ratio. The proof covers
   both the same-norm and the penalized deficit conventions. It does not
   refute K or the 0.24 content inequality.

Full Conjecture K, the general content lemma, and the requested unconditional
Grothendieck lower bound remain unresolved in this work.

## Replay

The rigorous Python checks require **python-flint** (tested with version 0.9.0).
They do not require NumPy or SciPy. Run from the extracted directory:

```bash
# conjectureK_audit/replay.sh
node verify_algebra.mjs
python3 verify.py
python3 verify_factor.py peak
python3 verify_factor.py flank
python3 verify_factor.py upper
```

Completed scalar checks for the Gaussian-factor theorem:

| Row | Rational rectangles | Polynomial-positivity boxes | r intervals |
|---|---:|---:|---:|
| Peak | 1,988,470 | 196 | 16 |
| Flank | 306,582 | 196 | 16 |
| Upper | 53,194 | 196 | 16 |

The largest rational expectation bound is below **0.238154**, so the stated
constant 0.239 retains margin.

For the counterexample, `verify.py` certifies that the derivative with respect
to the squared perturbation parameter is greater than **0.001**, for both
deficit conventions. An analytic Taylor bound then certifies the explicit
perturbation `tau = 1/10000`.

## Regenerate every analytic kernel enclosure

```bash
# conjectureK_audit/regenerate.sh
python3 generate_kernels.py
python3 regenerate_benchmark.py peak
python3 regenerate_benchmark.py flank
python3 regenerate_benchmark.py upper
```

`generate_kernels.py` resumes existing nodes. Remove its output `kernels.json`
to regenerate that table from zero. The other three commands always regenerate
their tables. All four tables were generated/re-generated in this session;
the three benchmark tables reproduced the supplied source data exactly.

The original benchmark kernel construction and its proof are included in
`benchmark_kernels.py` and `benchmark_kernel_proof.md`. The new counterexample
uses nonsingular positive double integrals, documented in proof.md.

## Files and proof dependencies

- `proof.md`: full analytic arguments, exact scope, and remaining gap.
- `verify_algebra.mjs`: independent exact arithmetic checks for the vector
  envelope constants, Gaussian moments, and explicit Taylor remainder.
- `verify_factor.py`, `factor_envelopes.json`, `*_kernels.json`: continuous
  rational certificate for the Gaussian-factor theorem.
- `generate_kernels.py`, `kernels.json`, `verify.py`: Arb kernel enclosures and
  continuous certificate disproving E.
- `*_factor_result.json`, `result.json`: completed replay results.
- `design_factor_envelopes.py`: optional floating candidate search; it is not
  trusted by the proof checker and requires NumPy/SciPy.
- `SHA256SUMS.json`: hashes of the packaged files.

The original uploaded monograph has not been modified. The Gaussian-factor
consequence for Lambda uses the shell-cost estimate supplied in that monograph.
None of these results is claimed to be formalized in Lean.
