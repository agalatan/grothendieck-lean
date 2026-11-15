<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/odd-cubic-core-2026-11-15/certificate-32-25/README.md, delivered by an outside GPT and relayed by the user on 15 November 2026. -->
<!-- odd_sector_certificate/README.md -->
# Odd-sector inequality: proof and interval certificate

`PROOF.md` gives a computer-assisted proof of the stronger coefficient 32/25,
valid for arbitrary shared remote variables with E Q = 0. In particular it
proves the question's (★), including its weaker application version.

All analytic steps are proved in the document. The only numerical lemma is the
pair of one-parameter 3 by 3 matrix inequalities (7). The complete interval
computation passed on all 320 intervals covering [0,8]; the remaining half-line
has an analytic bound. This is not a Lean formalization.

Files:

- `certify.cpp`: interval integration, derivative error bounds, interpolation,
  tail correction, and interval positive-definiteness checks.
- `trig128.txt`: the trigonometric interval table used in the computation.
- `trig_intervals.py`: independent exact rational verification of that table.
- `run_certificate.py`: rebuild and rerun the entire certificate.
- `verify_results.py`: exact checks of coverage and the recorded upper bounds.
- `results/`: the completed certificate's 320 bounds and calculation logs.

Check the included table and results using Python's standard library:

```bash
# odd_sector_certificate/: verification commands
python3 trig_intervals.py verify trig128.txt
python3 verify_results.py
```

Recompute everything with Python 3 and a C++17 compiler supporting IEEE binary64:

```bash
# odd_sector_certificate/: full certificate command
python3 run_certificate.py --workers 8
```

This writes `recomputed_results/`, preserving the supplied original results.
On the supplied x86_64 environment, the complete calculation took approximately
two minutes with eight concurrent processes. It used GCC 14.2.0 with
`-O3 -std=c++17 -fno-fast-math -ffp-contract=off`.

The maximum rigorous upper bound was 1.2794477508577984, on
[0.425,0.45], strictly below 32/25. It includes both spatial quadrature errors,
continuous-parameter interpolation error, and the omitted integration tail.
The final supplied source adds checks of IEEE mode and the square-root
bracket; rerunning the worst interval with that source reproduced the bound.
