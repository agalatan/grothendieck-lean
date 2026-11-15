<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/hermitian_content/README.md (file dated 2026-11-05). Only this line was added. -->
# Hermitian-content certificate

Read `proof.md` for the theorem, proof, scope, and numerical trust boundary.
The result is a content constant 59091/250000 = 0.236364 for
q = exp(i theta) X(Y* A Y - tr A), arbitrary Hermitian A, on
0.00551 <= E|q|² <= 0.0463, at all three application rows.

Dependencies: Python 3 and python-flint (tested with python-flint 0.9.0).
No NumPy, SciPy, optimizer, or precomputed floating approximation is needed for
the proof replay. The source uses Python because the rigorous special-function
integrator is supplied by Arb/FLINT.

Replay the rational checks against the supplied ball-enclosed tables:

```bash
# hermitian_content/replay.sh
python verify.py peak
python verify.py flank
python verify.py upper
```

Recompute every kernel enclosure and then replay all checks:

```bash
# hermitian_content/regenerate.sh
python -m pip install python-flint
python generate.py peak
python verify.py peak
python generate.py flank
python verify.py flank
python generate.py upper
python verify.py upper
```

Scripts resolve file paths relative to their own directory. The generator
uses six ordinary worker processes for independent quadrature nodes.

`*_kernels.json` stores dyadic rigorous enclosures. `*_result.json` stores the
completed check counts. The scalar-envelope checks use exact rational
arithmetic; generation and the J(0) tail check use Arb ball arithmetic. This is
not a Lean/kernel-checked certificate. The Gaussian shell-cost input needed to
infer Conjecture K for this class is taken from the supplied research record,
not re-certified here.
