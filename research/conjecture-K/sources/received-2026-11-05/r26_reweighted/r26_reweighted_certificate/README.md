<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/r26_reweighted/r26_reweighted_certificate/README.md (file dated 2026-11-05). Only this line was added. -->
# R26 reweighted content certificate

**Proved:** C(XP)^2 <= 0.22 [B(u)-F(XP)] at all three rows on the full
0.00551 <= u <= 0.0463 interval, under the moment conditions

    EP=0, E|P|^2=u, E|P|^4>=2u^2,
    E|P|^6<=37u E|P|^4-68u^3.

These include every centered complex Gaussian quadratic form. The proof
uses a fixed affine Cauchy-Schwarz weight and a moment polynomial. It does
not use a pseudovariance grid.

**Also proved:** the unbounded tail of a new 0.235 mixed-family candidate,
and existence of a uniform, unquantified neighborhood of the pure-P endpoint.

**Not proved:** that candidate on its entire compact small-Wick domain;
full R26; general Conjecture K. See `proof.md` for precise statements.

## Exact replay

Requirements: Python with python-flint (tested with 0.9.0), and Node.js for
the BigInt tail check. NumPy and SciPy are not used for certificate decisions.

Run from this directory:

```sh
python3 check_kernels.py
python3 verify_pure.py peak
python3 verify_pure.py flank
python3 verify_pure.py upper
python3 verify_pure.py peak --bridge
python3 verify_pure.py flank --bridge
python3 verify_pure.py upper --bridge
node verify_tail.mjs
```

The kernel check recomputes all 441 nodes at 160 bits, checking containment
in the stored rational enclosures. The six rational envelope checks cover
continuous parameter rectangles and prove their tails. Recorded results and
logs are included. This is not a Lean proof.

## Numerical candidate exploration

These commands need NumPy/SciPy and are **not proof verifiers**:

```sh
OPENBLAS_NUM_THREADS=1 WICK_ROW=peak python3 scan_candidate.py
OPENBLAS_NUM_THREADS=1 WICK_ROW=flank python3 scan_candidate.py
OPENBLAS_NUM_THREADS=1 WICK_ROW=upper python3 scan_candidate.py
OPENBLAS_NUM_THREADS=1 WICK_ROW=peak python3 refine_candidate.py
OPENBLAS_NUM_THREADS=1 WICK_ROW=flank python3 refine_candidate.py
OPENBLAS_NUM_THREADS=1 WICK_ROW=upper python3 refine_candidate.py
```

The inherited approximate scalar tables are included in `numeric/`. They
are used only by the exploratory programs. The exact proof uses the JSON
benchmark-kernel enclosures, never those approximate tables.

## Provenance

`kernel_enclosures.py` is adapted from the supplied Gaussian-factor/R23
rational checker. `kernel_proof.md` contains the inherited analytic kernel
facts, including complete monotonicity. `quadratic_moment_input.md` is an
unchanged extract of the supplied R23 moment proof. The new contribution is
the weight, polynomial, pointwise certificate, and mixed-family continuation
target in `proof.md`.
