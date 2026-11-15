<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/RUNS.md (file dated 2026-11-13). Only this line was added. -->
# Reproduction record

Agent-ID: codex-a713. All commands below use the audit directory, and every Python process runs in isolated mode. The numerical scripts disable bytecode writes. Run jobs sequentially, or limit concurrency to four numerical workers; two simultaneous n=6 optimizers were preferable on this shared 16 GB laptop. Each invocation has a time budget and resumes from its own checkpoints.

Environment observed: macOS 26.3.1, arm64; Python 3.12.3 at `/Library/Frameworks/Python.framework/Versions/3.12/bin/python3`; NumPy 2.3.5; SciPy 1.17.1; threadpoolctl 3.6.0. Certificate replays used python-flint 0.9.0 installed only in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies/`. The compiler is Apple clang 17.0.0 (clang-1700.6.4.2). No Lean build was run.

## Numerical pipeline

This is a reproduction recipe for the saved pipeline, not a claim that every historical command was logged verbatim. Existing initial checkpoints are skipped. To reproduce from scratch without overwriting this evidence, copy the owned scripts into a fresh subdirectory inside the audit directory, then adjust the absolute paths below. Each script resolves its data/output directory from its own location.

```bash
export VECLIB_MAXIMUM_THREADS=1
export OPENBLAS_NUM_THREADS=1
export OMP_NUM_THREADS=1

/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/kernels.py --row peak --ngrid 4097

TMPDIR=/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/compiler_tmp clang++ -O3 -std=c++17 -dynamiclib /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/fast_eval.cpp -o /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/fast_eval.dylib

/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/calibrate_kernels.py

for audit_n in 2 3 4 5 6; do
  for audit_u in .02 .03 .0463; do
    /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/batch_optimise.py --n "$audit_n" --u "$audit_u" --power 20 --restarts 50 --batch 10 --maxiter 150 --gtol 2e-6 --ftol 2e-11 --seed 713013 --threads 1 --seconds 1350
    /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/refine.py --n "$audit_n" --u "$audit_u" --power 20 --restarts 50 --batch 10 --maxiter 200 --gtol 1e-5 --maxls 25 --memory 10 --seed 713013 --seconds 1350
  done
  /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/validate.py --n "$audit_n" --power 19 --replicates 8 --rotated-polar --label polar_p19_r8 --seed 1518713 --seconds 1350
  /Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/holdout.py --n "$audit_n" --power 21 --replicates 8 --selection-label polar_p19_r8 --wick-control --seed 23110713 --seconds 1350
done
```

If a cell hits the time or iteration limit, rerun its command before validating its final endpoints. Check convergence rather than assuming the loop alone completes every cell. Training uses seed 713013+n; validation scramble b uses 1518713+1000n+17b; final holdout uses 23110713+1000n+31b, for b=0,...,7. No final holdout is used to optimize or reselect that cell's tensor.

Historical variation: n=2 and n=3 at u=.0463 initially used SciPy L-BFGS-B in [optimise.py](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/optimise.py), with 120 iterations, maxls 18, maxcor 10, gtol 2e-6 and ftol 2e-11. Other initial cells used the batched independent L-BFGS/Armijo solver above. All 750 paths subsequently used the same intrinsic sphere-refinement method. Thus the uniform initial recipe can produce different paths in those two cells while satisfying the experimental design.

An initial coordinate-scale stopping defect and its correction are documented in [NUMERICAL_REVIEW.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/NUMERICAL_REVIEW.md). Original tensors remain separate from refined tensors. One n=6/u=.03 refinement was interrupted to reduce memory pressure and resumed from saved endpoints. An n=5 holdout invocation was attempted before its selection file existed; it exited before sampling, then was rerun successfully. These diagnostic logs remain in the directory.

The independent low-dimensional baseline is reproduced with:

```bash
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/structured_baseline.py
```

## Results, hashes and checks

```bash
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/summarize_results.py
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/statistical_diagnostics.py
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/audit_snapshot.py
```

The coefficient hashes in validation/holdout identify the evaluated tensors. [SOURCE_MANIFEST.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/SOURCE_MANIFEST.json) is a **post-hoc source snapshot**, not run-start provenance. It does not infer authorship from mere presence in this shared directory. [EXPERIMENT_STATUS.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/EXPERIMENT_STATUS.json) separates initial starts, continued starts, convergence and validation counts. [SELECTED_TENSORS.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/SELECTED_TENSORS.json) contains all selected coefficients and their zero-based (i,j,k) indices. [STATISTICAL_DIAGNOSTICS.json](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/STATISTICAL_DIAGNOSTICS.json) checks those hashes and energies and records delete-one-scramble bias estimates and rotated structures.

## Rigorous certificate replay

The analytic implication and remaining trust boundaries are in [CERTIFICATE_AUDIT.md](/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/CERTIFICATE_AUDIT.md). The sequential local replay drivers are:

```bash
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/run_serial.py
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/run_original_verifier.py
/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/replay_family_certificates.py
```

The kernel-node driver resumes using input-data hashes. A successful scalar or integer checker is claimed as an end-to-end theorem check only where its integral premises were independently recomputed and the mathematical implication was audited. The Hermitian self-interaction scalar enclosures and the full universal small-energy tensor argument retain the limits specified in the report.
