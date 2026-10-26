The current lower endpoint has a successful full Lean CI receipt: run [40234828241](https://github.com/agalatan/grothendieck-lean/actions/runs/40234828241) at `5f46810672e97231883db052b614c966399512b1`. `CI.json` pins the endpoint import closure, certificate inputs, environment and archived evidence. That run built the default `Grothe` target (9,161 jobs), passed the safety scan, and checked 451 axiom-report entries using 24 of 84 permitted native facts. The lower endpoint itself uses 14 native facts. Its analytic premises remain explicit.

The current endpoint closure contains 113 repository Lean files; 113 are byte-identical to the tested commit.

`CI_AXIOMS.log` contains the actual axiom-report output extracted from GitHub, with Actions timestamps and prefixes removed. `CI_EXCERPT.log` retains authentic selected build/safety/stamp log lines. Their SHA-256 hashes are in `CI.json`. The source guard hashes active index blobs and requires a clean Git working tree for all pinned files. This avoids stalled on-demand reads; `--direct-reads` also hashes every working file directly. The verifier replays the archived report through the tested commit's original axiom checker.

From the repository root:

```sh
python3 -B -I data/lower-unshifted/verification/verify_ci_scope.py data/lower-unshifted/verification/CI.json
```

`BUILD_GAP.json` remains unchanged historical context: the temporary targeted-build logs are still lost. The successful GitHub run supersedes that missing-receipt status for the guarded endpoint scope; missing logs were not recovered or relabelled. The caps step checked the unchanged 140-file source stamp and did not rebuild the 60 range facts.

**Combined-tree CI is separately pending.** This historical receipt does not cover the newly merged signed-resolvent proof, changed root imports, workflow, or enlarged current axiom report. The receipt records the tested versions and observed Git index stages of those excluded files. A fresh run must validate the merged default target.
