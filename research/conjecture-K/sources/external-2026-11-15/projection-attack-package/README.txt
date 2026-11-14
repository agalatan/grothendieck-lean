Retaining the first-chaos penalty
================================

Status: rigorous partial progress; no improved numerical Grothendieck bound.

proofs.tex contains:
  * the exact penalized support-function duality;
  * a global finite-amplitude improvement for every remote adversary;
  * the exact corrected local A/B cost matrix, with certified constants;
  * a necessary fresh-coordinate stability inequality;
  * a certified counterexample to an auxiliary weighted-positivity route.

Run:
    python verify.py

The verifier requires python-flint. It uses rational arithmetic and Arb balls.
The interval integration encloses each whole cell and bounds both omitted tails.
results.txt records the executed check. No remote repository files were changed.

The remaining issue is uniform finite-amplitude control over general remote
cubics and the coupled visible sectors. The local matrix in this package is not
a substitute for that missing theorem. The counterexample is NOT a
counterexample to Conjecture K.
