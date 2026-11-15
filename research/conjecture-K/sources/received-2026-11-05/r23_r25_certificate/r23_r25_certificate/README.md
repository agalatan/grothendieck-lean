<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r23_r25_certificate/r23_r25_certificate/README.md (file dated 2026-11-05). Only this line was added. -->
# R23 non-Hermitian content certificate

## Certified result

For q = X(Y* A Y - tr A), with arbitrary complex matrix A and X independent
of Y, the content inequality

    ||Pi_(1,0) F_A(q)||² <= (239/1000) [B(u) - F(q)]

holds for 0.00551 <= u = tr(AA*) <= 0.0463 at all three application rows.
The completed rational checks cover 983671 boxes at the peak row, 157507 at
the flank row, and 27601 at the upper row, plus 77 polynomial-positivity boxes
per row and analytic control of the unbounded tail.

`proof.md` gives the exact sixth moment, the sharp Gaussian-anchored coupled
bound m6 <= 37 u m4 - 68 u³, the phase-sensitive refinement, and the deduction
of the content theorem. `kernel_proof.md` contains the underlying kernel
representations and rigorous quadrature/tail bounds from the previous
Hermitian certificate.

## Replay

Requirements: Python 3 with python-flint (tested with 0.9.0), and Node.js for
the two independent exact algebra checks. No SciPy, NumPy, or numerical
optimizer is needed for the certificate.

From the extracted directory:

```bash
# r23_r25_certificate/replay.sh
node verify_moments.mjs
node check_shells.mjs
python verify.py peak
python verify.py flank
python verify.py upper
```

To recompute all scalar kernel enclosures before replaying:

```bash
# r23_r25_certificate/regenerate.sh
python -m pip install python-flint
python generate.py peak
python generate.py flank
python generate.py upper
python verify.py peak
python verify.py flank
python verify.py upper
```

The scripts locate data relative to their own directory. The generator uses
six worker processes for independent scalar integrations. Peak verification
took about one minute in the development environment; runtimes vary.

## Files and trust boundary

- `verify_moments.mjs`: enumerates all 265 centered Wick contractions and checks
  the exact noncommutative trace polynomial for the sixth moment.
- `check_shells.mjs`: verifies the mixed-shell counterexample to zero content.
- `envelopes.json`: seven rational phase-sensitive polynomial envelopes.
- `kernels.py`, `generate.py`: rigorous positive-integrand Arb quadrature and
  explicit integration-tail bounds.
- `*_kernels.json`: outward-rounded dyadic kernel enclosures.
- `verify.py`: exact rational continuum/positivity checks, plus a rigorous Arb
  evaluation for J(0) in the tail estimate.
- `*_result.json`: completed check counts and rational bounds.
- `proof.md`: proofs, scope, R24 identities, and R25 bookkeeping.
- `kernel_proof.md`: supporting analytic kernel proof.

This is an analytic proof with an Arb-plus-exact-rational computational
certificate, not a Lean certificate. The deduction of the shared-A K statement
uses the supplied 0.24 shell-cost theorem; that input theorem is not reverified
in this archive.

R24 proves remote-only domination for cX(|X|²-2)+XP and supplies an exact
size-biased deficit/content decomposition. Its remaining shared-A content
bound is NOT certified here. R25 is exact bookkeeping, not a proof of general K.
