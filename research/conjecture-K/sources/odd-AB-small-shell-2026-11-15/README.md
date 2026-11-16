<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/odd-cubic-core-2026-11-15/small-shell-AB/shell_certificate/README.md, 15 November 2026; delivered by an outside GPT and relayed by the user. -->
<!-- shell_certificate/README.md -->
# Partial results for (P_odd)

`PROOF.md` gives rigorous dimension-free partial results with arbitrary sharing
and the exact prescribed shift. It does not prove the full capped claim.

The main bound is

    E D(X,O) - p W <= (22/5) V - (97/47275) W.

It proves (P_odd) with c = 0 for V <= 1241/110000000, approximately 1.12818e-5.
A second bound proves E D(X,O) <= p W when W >= 375 V. The proof also supplies
an explicit nonzero c improving the result when nu is nonzero, positive-slack
thresholds for smaller u, and a continuously optimized energy bound.

There are two new numerical lemmas, both completed:

- shell kernel: certified upper bound 1.090933195901016 < 11/10;
- translated odd kernel: certified upper bound 1.317087984571117 < 33/25.

The prior odd-kernel checker and its bounds are included for the interpolation
argument. All unbounded parameter tails are handled analytically. This is a
computer-assisted proof, not a Lean formalization.

Verify the recorded tables and exact constants:

```bash
# shell_certificate/: verification commands
python3 trig_intervals.py verify trig128.txt
python3 verify_results.py
```

Recompute all three certificates with Python 3 and a C++17 compiler:

```bash
# shell_certificate/: full recomputation
python3 run_certificate.py --workers 8
```

Recomputation preserves `results/` and writes `recomputed_results/`. The
provided computation used GCC 14.2.0 on x86_64, with
`-O3 -std=c++17 -fno-fast-math -ffp-contract=off`.

Files include the analytic proof, three C++ checkers, the exact-rational
trigonometric verifier, the run/verification scripts, and the completed interval
results. Exploratory counterexample searches are not part of the certificate
and are not used in any theorem.
