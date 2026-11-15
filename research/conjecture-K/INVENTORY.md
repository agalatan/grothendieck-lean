# Inventory: what was left outside the repository

This folder holds text, scripts, small JSON and a few small logs only. Everything else stays in the git-ignored
working folders on the laptop, under `/Users/alingalatan/workspaces/grothe/handoff/`. This file lists what was left
there on 15 November 2026, with absolute paths, sizes and one line each, and the SHA-256 of the files a result
depends on.

**Rules applied.** Copied: `.md`, `.tex`, `.txt` documents; `.py`, `.mjs`, `.cpp` scripts; JSON result files of at
most 300 KB. Left out: zips, certificates and data above 300 KB, logs, binaries, PDFs, byte-code caches, third-party
libraries, shell scripts, and documents that are not about Conjecture K. One exception to "no logs": the logs and
JSON-lines records of the review and of the numerical follow-up of 15 November (each at most a few KB) are in the
repository, under `sources/external-2026-11-15/review/` and `code/kprime-2026-11-15/`, because `REVIEW.md` and the
write-up of the follow-up cite them as their record.

**Completeness.** Every file under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/` is either in
this repository folder or covered by a row of sections 1 to 4 below (checked by script when this file was generated:
no file unaccounted for). One working folder, `kprime-2026-11-15/`, was still being written at that time; section 4
has a row for whatever appeared there after its copy was taken, and no such row if nothing did. Sections 5 and 6
cover the K-related parts of two larger folders, which also hold material on other subjects that is not listed.

**Not copied although they are text:** seven byte-identical copies of `sources/received-2026-11-05/hermitian_content/proof.md`
that later packages ship as `kernel_proof.md` or `benchmark_kernel_proof.md`, and the `upstream/` copies inside
packages.

## Files in the repository whose hashes matter

The verifier outputs of the cover improvement are small and are in the repository; their hashes are recorded here
next to the certificate they verify (section 1). SHA-256 of the files as they are in the working folder; the copies
under `code/audit-2026-11-13/` are byte-identical (JSON and scripts get no provenance line).

| file in the repository | size | SHA-256 | what it is |
|---|---:|---|---|
| `code/audit-2026-11-13/improvement_independent_check.py` | 9,729 B | `db3f64d22651da96f4e7f2cb16950d1ed23ee795913a7d6862db43d6ddcdece1` | the independent checker (final version) |
| `code/audit-2026-11-13/results/improvement_independent_v6.json` | 5,266 B | `8952eb44fc6d78cdb937e4d4f66360cbdd4d4ea6c9d3eda4d5e718450765c7ac` | its output on the final certificate: PASS for all 11,107 boxes and the partition |
| `code/audit-2026-11-13/results/improvement_isolated_replay_v6.json` | 3,379 B | `a7d52300cc97d77ad83c7c7aeb3c9bab52f67b9d5c2725069648ed5b9e1c3453` | output of the isolated replay of the saved cover |
| `code/audit-2026-11-13/results/improvement_replay_v6.json` | 1,550 B | `2d0161c8339c3f5c2a816151ad7c2de4d10fc029aea642393e6d40ce8f95dfbe` | summary of the search-side exact replay |
| `code/audit-2026-11-13/results/IMPROVEMENT_FINAL_CHECKS.json` | 7,399 B | `dd7261595c259dc87e5623fd6fac61716ba520dea523e13b96f52baf8baddf25` | final consistency checks of the improvement |

The command of `IMPROVEMENT.md` for the independent check is

    python3 -I improvement_independent_check.py --certificate improvement_certificate_v6.json

The checker reads the Lean row and batch data under the hard-coded root `/Users/alingalatan/workspaces/grothe` and
compares source hashes. It was run against commit `32cfb7d87`; one of the pinned Lean files
(`Grothe/Research/LawNodeLower.lean`) has since been golfed without statement changes, and a rerun on the current
`master` has not been tried.

## Files left outside

Sizes are apparent sizes (1 MB = 1024 KB = 1024² bytes). A row with several files gives their number and total size; a row never repeats a file
listed by an earlier row. "SHA-256" is given for single files that a result or a provenance claim depends on.

### 1. The cover improvement of 13 November (audit folder)

| path | files | size | contents |
|---|---:|---:|---|
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_certificate_v6.json` | 1 | 3.1 MB | **The final certificate** of K_G^ℂ > 1.401697318640: 11,107 serialized boxes and 22,213 partition tokens, cap B = 713420784003651/10¹⁵. The hash is the one printed in `IMPROVEMENT.md`. SHA-256 `693f21b4be14c4a49e1e55b6c8556b0f639fbe8ec1d1011700a39542fc89fd77` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_cover_v6.json` | 1 | 8.2 MB | The full rational input cover behind the final certificate. SHA-256 `aac65b27029aaa0c9887c2daf8e0b05e282f879d6bda376e7921cd44a02cb400` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_ledger_v6.json` | 1 | 668.1 KB | Ledger of the splits accepted in the final refinement pass. SHA-256 `c223d5128d01139a4eb623eaee4f463afbc67005c2ecfa145e79396ced386b83` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_c*_v[1-5].json` | 10 | 55.6 MB | Superseded versions v1 to v5 of the certificate and of the cover (v4 is identical to v3). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_ledger_v[2-5].json` | 4 | 2.5 MB | Ledgers of the superseded versions. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_[ri]*_v[1-5].json` | 9 | 32.6 KB | Replay and independent-check outputs of the superseded versions. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_joint_probe.jsonl` | 1 | 15.0 KB | Exploratory searches of the joint A/B box inequality (diagnostic only; neither a counterexample nor a certificate). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/improvement_*.log` | 12 | 50.0 KB | Logs of the improvement runs. |

### 2. The audit's experiment and replays (audit folder)

| path | files | size | contents |
|---|---:|---:|---|
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/tensor_peak_*.npz` | 1500 | 6.9 MB | Saved end points of the full-tensor experiment: 750 initial and 750 refined coefficient vectors (n = 2…6, three energies, 50 starts). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/optim_*.jsonl` | 30 | 1.4 MB | Optimisation and refinement records, one line per path. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/validation_*.jsonl` | 8 | 8.0 MB | Validation replicates of every end point (8 scrambles of 2¹⁹ points). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/validation_peak_n[2-6]_polar_p19_r8_summary.json` | 5 | 2.3 MB | Validation summaries of all end points (each above 300 KB; the selections `*_winners.json` are in the repository). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/validation_peak_n2_smoke*` | 2 | 3.5 KB | Smoke-test outputs. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/holdout_*.jsonl` | 6 | 174.2 KB | Holdout replicates (the summaries are in the repository). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/STATISTICAL_DIAGNOSTICS.json` | 1 | 513.9 KB | Replicate bias and coefficient checks of the experiment (above 300 KB). SHA-256 `65a313053029e7548674022f2c1a57663aab1a207069e0351534f8d0da1fbec4` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/kernels_peak_*.npz` | 2 | 289.0 KB | Kernel tables φ, g of the experiment (4097 and 8193 nodes); regenerate with `kernels.py`. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_*.npz` | 3 | 634.6 KB | Abel-transform tables and the refined optimum of the optimiser-audit sub-agent. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent_kernels_*.npz` | 2 | 226.5 KB | Kernel tables of the second audit's pushforward quadrature. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/tables-peak.npz` | 1 | 21.6 KB | Copy of the kscan kernel table used by the optimiser audit. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/*.log` | 80 | 1.5 MB | Run logs and replay logs (among them the replay evidence cited by the audits: `a_cost_tensor_replay.log`, `b_cost_replay.log`, `r23_moments_replay.log`, `r25_shells_replay.log`, `r26_*_duals_replay.log`, `hermitian_duals_*.log`, `saddle_algebra_replay.log`, `j3_algebra_replay.log`, `budget_audit.log`, `family_certificates_replay.log`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/nodes.jsonl` | 1 | 186.0 KB | The 441 recomputed kernel nodes of the 0.22 certificate (Arb balls at 160 bits, bounds, hashes, timings). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r26_kernel_recheck/*.log` | 3 | 26.7 KB | Logs of the kernel recomputation. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/r*/*kernels.json` | 6 | 59.9 KB | Kernel input tables copied from the certificate packages for the replays. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/*_replay/*.json` | 5 | 42.6 KB | Kernel tables and envelope data copied from the certificate packages for the replays (the `*_result.json` files are in the repository). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/independent-pushforward-audit/PROVENANCE.json` | 1 | 4.0 KB | Provenance record of the second audit: SHA-256 of its 13 outputs and 5 inputs. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/fast_eval.dylib` | 1 | 32.7 KB | Compiled evaluator (build it from `code/audit-2026-11-13/fast_eval.cpp`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/*_duals` | 2 | 77.6 KB | Two compiled checkers (`r26_verify_duals`, `verify_hermitian_duals`), built from `verify_duals.cpp` of the Hermitian self-interaction package. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies/` | 139 | 20.4 MB | python-flint 0.9.0 installed locally for the certificate replays (third-party library). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/__pycache__/` | 3 | 31.6 KB | Python byte-code caches. |

### 3. Certificate packages received on 5 and 6 November (zips)

| path | files | size | contents |
|---|---:|---:|---|
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-r23_r25_certificate.zip` | 1 | 34.4 KB | R23: X·P(Y) with any complex quadratic P, constant 0.239; R24 remote domination; R25 shell bookkeeping. SHA-256 `165624dd51a4f00c1953f2f4c9ac4b269180b6df3d2fabe5e20ea8a67d575524` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-r26_reweighted_certificate_20261105.zip` | 1 | 140.8 KB | The reweighted certificate: constant 0.22 for X·P; the strip candidate (†) with its tail. SHA-256 `87ebd35b62e72f34df61e92728923b28a51191155f363e5adf86dfc3fd2e5481` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-gaussian_factor_content_certificate.zip` | 1 | 44.8 KB | The whole Gaussian-factor class, constant 0.239. SHA-256 `a08c1a67e400573bad1a34d5e426c7dbccb3d6ec0241c31bcf724c83d04eb6b4` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-conjectureK_gaussian_factor_extension_20261105.zip` | 1 | 56.2 KB | Third packaging of the Gaussian-factor theorem (3,171,979 boxes). SHA-256 `2db72c4a29ca79cec21fb2387bc4fd99c001ef03cfc5b42a51d6e523906ee2fe` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-conjectureK_progress_2026-11-05.zip` | 1 | 52.4 KB | The certified saddle at the Wick monomial and a second packaging of the Gaussian-factor theorem. SHA-256 `7d4a09ed6e2904c0acf0c6cf867460b864abbf2e62185e3afe2709ac782d2bce` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-hermitian_content_certificate.zip` | 1 | 22.9 KB | Hermitian one-driver family, constant 0.236364. SHA-256 `2a50c39f9c18ab3080be9f13915e8ccc78a2a8c0bc7f9898ce1f29831ee4df7e` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-r26_self_interaction_certificate_2026-11-05.zip` | 1 | 17.1 MB | Hermitian self-interaction family, constant 0.23 with reserve 1/40000 (the largest package: moment-dual witnesses and scalar bounds). SHA-256 `4fd3adbe4af40dffd7a3e9e56f447a03759dc0f1bd8a9683f91a3f9cc507d5cd` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-wick_r26_twenty_percent_20261105.zip` | 1 | 89.1 KB | Wick neighbourhood p ≤ u/5, constant 9/40. SHA-256 `5216c7499ab075aee2c2ac57b27f889d19410c756a709f8a9b41cc0f4475e8a7` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-conjectureK_R26_twenty_percent_extension_20261105.zip` | 1 | 15.8 KB | Second proof of p ≤ u/5 (47/200, u ≥ 0.03). SHA-256 `fa128b20750b02077a4177677e320d1e769629553f755940f0d7d5c09dbbd781` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-wick_endpoint_extension.zip` | 1 | 30.7 KB | Wick neighbourhood p ≤ u/16, constant 49/211 (superseded). SHA-256 `591e82c2e33c31d041f803702b96632d03c4fa21792046c44dd46f025014f5ef` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-wick_endpoint_one_twelfth_20261105.zip` | 1 | 70.4 KB | Wick neighbourhood p ≤ u/12 (superseded) and six local boxes of the envelope (★). SHA-256 `568c5de0e7599c5bc4b3f4f47835d4f3cd8cc278ed4441d9360bfb57809c6ad8` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-integrated_wick_envelope_20261105.zip` | 1 | 181.9 KB | The envelope (★): exact reduction, proved tail, numerical evidence on the compact part (no certificate). SHA-256 `a9637e842c9f6b1c1f2e1e6250bbff69c1fcdbde421371464a0b5b5e39741c57` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-r26_envelope_audit.zip` | 1 | 92.7 KB | The kernel value 𝓚(0.0463) and the obstruction to radial envelopes at the pure-P end. SHA-256 `1a8b012589ec213530d160180ab9f2f6b2a79a0e98355582f531b89b27e347cb` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-r26_fresh_reductions.zip` | 1 | 9.8 KB | Directional size-biased Cauchy–Schwarz reduction (no certificate). SHA-256 `844ed159ac0e8bb90d1f3123ed0d52a26f676412c6d0a9b312e9bc0462997e2e` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-b_shell_global_cost_certificate.zip` | 1 | 5.3 KB | B-shell cost at every amplitude, κ_B = 0.26 / 0.29 / 0.30. SHA-256 `32473ee6d04b9f74bb192b63e1d24f01844ec70c16d2588880160c6715801e96` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-b_sector_content_and_cost_20261105.zip` | 1 | 63.9 KB | B-content 239/2000 for the Gaussian-factor class; local B-cost 7/20; mixed A/B Hessian at q = 0. SHA-256 `0ab6086ee3b2a12d80c8a78c4b3bced4b70f68fafe0e9f4f7d91715d2a2a6e4c` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-odd_sector_certificate.zip` | 1 | 2.4 KB | Odd sectors over the zero core: pure cost k₁, k₃. SHA-256 `333de314b1943f480a1a8e78df27c8d739fc5654827b9f64a4722e9e323a2882` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-odd_sector_inverse_norm_obstruction.zip` | 1 | 4.0 KB | Failure of the inverse-norm condition at a nonzero core. SHA-256 `35fb6c2723b929e1d09ea8a24e05bf9914653317bd1333ebfd19ac38bd762c12` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-directional_odd_cost_certificate.zip` | 1 | 5.3 KB | Directional odd-sector cost at one nonzero core. SHA-256 `d3fb3252a13216fc5d1a01250110aa22e4f38168a8c357372d740aef104221c8` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-signed_joint_ab_hessian_certificate.zip` | 1 | 3.0 KB | Signed A/B Hessian at q = 0 with a 0.07 margin. SHA-256 `f55797b238c2300bae12f1c9463c204f54d520d98b49ff0ead04d84c0a02d347` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-joint_ab_uniform_reduction.zip` | 1 | 3.2 KB | Exact 2×2 kernel reduction of the infinitesimal A/B Hessian at a general q (no certificate). SHA-256 `789b29d894e422d585dcbf40b90edb4dd1897987d6b01ad5da6afe692c02e862` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-smooth_joint_kernel_certificate.zip` | 1 | 3.8 KB | Singularity-free coordinates; the signed bound on the shift interval [0.099, 0.101]. SHA-256 `931f6b2a44efdbd7abfd4744c88eba6567444c218320215b35174e33356488f3` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-all_shift_signed_ab_certificate.zip` | 1 | 65.4 KB | Signed infinitesimal A/B bound at every remote base (474 interval boxes and an exact tail). SHA-256 `d6a9dc38d52651e7a1bcf04685a3b31ded3ba5fa5032d0be2fca29be5b50c938` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-all_shift_signed_ab_certificate_v2.zip` | 1 | 37.7 KB | Second, independent certificate of the same bound (229 intervals and a tail). SHA-256 `12d3f4057fa443146ea6c730e72ebb7564da96d9057506a34f9b5307e553ae1f` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/chatgpt-J3_audit_certificate.zip` | 1 | 10.9 KB | The J3 audit: scalar obstructions (kernel ratio, weakened-diagonal witness) and the corrected finite-amplitude target. SHA-256 `38b42b5f0197047a84932bd5929fc7102287eb39938551a7bcefdcf1daf7c6b4` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/` | 346 | 37.1 MB | The extracted contents of these packages other than their markdown documents: verifiers and generators (88 `.py`, 18 `.mjs`, 2 `.cpp`), kernel tables and results (`.json`, `.jsonl`, `.npz`), logs, the generated bound tables of the Hermitian self-interaction package (`*_bounds.txt`, three files of 7 MB, and six `.bin` files with interval points and moment duals, 14.8 MB), byte-code caches, one compiled checker, the `upstream/` copies of documents that are in the repository under their original place, and seven byte-identical copies of the Hermitian content proof (`kernel_proof.md`, `benchmark_kernel_proof.md`). |

### 4. Other files of the working folder

| path | files | size | contents |
|---|---:|---:|---|
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/conjectureK-monograph-bundle.zip` | 1 | 36.6 MB | Zip bundle of the working folder (the "bundle root" of monograph §7): the monograph with its companion files and `ai-notes/` with the extracted packages. SHA-256 `c7baf010f76ca642d8ee715c92cc0af5fb2368d97e09e52594cf41cfecc83e14` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/*.log` | 7 | 26.1 KB | Outputs of seven `e11_*` scripts (the scan of monograph §3.5, the hill-climb, the sector scan, the odd-form computation, the envelope check, the size-bias check, the finite A/B kernel grid). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/e4-logs/` | 13 | 15.4 KB | Outputs of the E1 and E4 runs of 4 November (first-moment maxima; full-tensor attack on K). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/k5/logs/` | 53 | 124.6 KB | Logs of the K₅ experiment. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/k5/results/` | 48 | 256.2 KB | Candidates of the K₅ experiment (24 `.json` with 24 `.npz`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/k5/*.sh` | 2 | 788 B | Two launch and synchronisation scripts of the K₅ runs (they name a droplet folder). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/d1/d1-note.pdf` | 1 | 298.9 KB | The D₁ note typeset (source: `sources/d1/d1-note.tex`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/out1/` | 180 | 3.5 MB | Pass 1 of the global search: 180 files, 840 runs with their coefficient vectors (summary: `code/kscan-2026-11-13/out1-summary.json`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/tables-peak.npz` | 1 | 21.6 KB | Kernel table of the global search; regenerate with `tables.py`. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/tailgames-2026-11-14/*.log` | 11 | 29.3 KB | Logs of the identity-tail exploration (the sources of the numbers in its README: `sanity.log`, `cp_*.log`, `two.log`, `scan2.log`, `scan3.log`, `htriv.log`, `m3_*.log`). |

### 5. October material that was not copied (`handoff/research-third-decimal/`)

| path | files | size | contents |
|---|---:|---:|---|
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/cubic-chaos-partial-proof.zip` | 1 | 12.4 KB | Package of 22 October: K on four of the six components relative to z₁, the n = 1 case (exact supremum 387√π/500), a class of conditionally Gaussian cubics, the enclosure 1.3739535256614 < S < 1.3739535256616. SHA-256 `af79c8a75674a73fdd43033ff94fd6e7ecad70f01440558cfdf9044f304cab62` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/cubic-chaos-improved-certificate.zip` | 1 | 260.9 KB | Package of 22 October: "every cubic q independent of z_1 satisfies Lambda(q) < S + 0.0000105". SHA-256 `92c5178b0b07dcc63cf3705cf46462c32f9a76e96cf42b5dd5db50f29578afbb` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/cubic-chaos-independent-bound-audited.zip` | 1 | 29.7 KB | Package of 22 October: audited form of the same bound with a Gaussian buffer, Λ(q + gU) < 1.373964. SHA-256 `32c8363b52468b6839f38f9b493fd48ed8755fcff471b0fa9792567c9cb7d0a8` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/independent-sector-stein-3p6e-7.zip` | 1 | 100.5 KB | Package of 22 October: Λ(q) < 1.373953883 < S + 0.00000036 for every remote cubic ([P,C] in its README; sixth-moment constant 40.45313 as an input). SHA-256 `5ebf9492027059da7ac0f66a1bcb22e605af27cc8fdb4947ec62fa4187309974` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/grothendieck-joint-structure-progress-20261022.zip` | 1 | 44.5 KB | Package of 22 October on the joint structure (not opened for this record). SHA-256 `edda6a3d8a5e08f0db346e8d740fe3fb01c87508eed7e372befcb67f4665251e` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/gpt-packages/local-stability-20261022/` | 4 | 6.3 KB | Two verifier scripts and logs of a local-stability certificate of 22 October. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/` | 7 | 637.5 KB | The October report typeset (`conjecture_K_report.pdf`) and its LaTeX build files. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/attack-20261022/` | 331 | 13.0 MB | Running notes of 22 October (`NOTES.md`, 115 KB: response attack, gate-loss decomposition, local stability, degree-5 tests, upper-bound steps) with scripts, logs and the write-up `attack_analysis.tex`. Partly about K. Not copied: the notes mix the lower and upper bounds and name machine folders. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/kattack-2026-10-15/` | 137 | 5.3 MB | Floating-point tests of 15 October at the peak row (among them `kprime.py` and `kprime.log`, the measurement of the K′ penalty) and replay logs of the packages of that day. No notes. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/forest-2026-10-20/` | 19 | 41.1 KB | Scripts of 20 October that test the stronger versions of K (fibrewise domination, variance spheres, Laplace domination, PVD, BNC). No notes. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/gate/` | 74 | 126.4 KB | Scripts, logs and data of worker G1 (11 and 12 October), with `AUDIT_DELTA.md` and `PROGRESS.md` (not about K). The note `KSIDE.md` is in the repository. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kconj/` | 24 | 59.4 KB | Scripts and logs of worker K1 (the notes are in the repository). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kproof/` | 17 | 9.6 MB | Scripts and data of worker K2 (the notes are in the repository). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/pipeline/kclt/` | 17 | 158.8 KB | Scripts and logs of worker K3 (the notes are in the repository). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/PROMPT_GPT_*.md` | 6 | 25.4 KB | Prompts of 21 and 22 October that are not about K (response covers, slice and multislice bands, Gram and fine-mesh certificates, improving the lower bound without K). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/` | 530 | 75.0 MB | The 71 review folders of the packages of 15 to 22 October behind the manuscript chapters. `remote-diagonal-20261015/` is the source of the remote cap of `STATUS.md` 3.2 (not replayed by the audit). Five notes of `weak-k-20261015/package/` are in the repository (`sources/october-handoff/weak-k-2026-10-15/`). |

### 6. The October manuscript (`handoff/manuscript/`)

| path | files | size | contents |
|---|---:|---:|---|
| `/Users/alingalatan/workspaces/grothe/handoff/manuscript/main.pdf` | 1 | 4.2 MB | The manuscript typeset (656 pages). |
| `/Users/alingalatan/workspaces/grothe/handoff/manuscript/legacy/**/*.tex` | 27 | 341.9 KB | Chapters and fragments not about K: the problem, the certified bounds, the upper bound, certificate mechanisms, the superseded lower ladder, literature, appendices, the wrapper `main.tex`. |
| `/Users/alingalatan/workspaces/grothe/handoff/manuscript/new/` | 12 | 65.2 KB | The new chapters of 25 October other than the three copied ones (status at a glance, how to read, attack plans, the upper construction, formalisation). |
| `/Users/alingalatan/workspaces/grothe/handoff/manuscript/notes/` | 7 | 82.2 KB | Sources of the converted notes (`WHY_THE_GAP.md` there is identical to the copy in `sources/october-handoff/`). |
| `/Users/alingalatan/workspaces/grothe/handoff/manuscript/tools/` | 2 | 12.6 KB | The two scripts that generate the manuscript (`annotate_stale.py`, `convert.py`). |
| `/Users/alingalatan/workspaces/grothe/handoff/manuscript/main.*` | 7 | 816.3 KB | LaTeX wrapper and build files. |
| `/Users/alingalatan/workspaces/grothe/handoff/manuscript/build.out` | 1 | 217.4 KB | Build output. |


## Follow-up audit, 15 November 2026 (codex-a7c4)

No new external files or dependencies were created. The small acceptance scripts and witnesses of
`independent-sector-stein-3p6e-7.zip` are now included verbatim under
`code/audit-2026-11-15-codex-a7c4/remote_stein_original/`; their hashes are in
`remote_replay_all.json`. The proof and covariance input are copied with provenance lines into the new source
folder. Archive hashes and the precise inherited theorem are recorded in `sources/audit-2026-11-15-codex-a7c4/REMOTE.md`.
The weaker `cubic-chaos-improved-certificate.zip` remains at its existing path in section 5; its large dual data
are read directly from the archive by `remote_legacy_replay.py`. That replay is conditional on its stored grids.
The existing python-flint dependency directory in section 2 was reused read-only through an explicit
`--dependency-dir`; no library or binary is added to the repository.

Two small logs are retained as cited acceptance records: `remote_replay.log` and `remote_legacy_replay.log` under
`code/audit-2026-11-15-codex-a7c4/`. The independent numerical output is `sector_numerics.json`; no sampling arrays,
binaries, archives, PID files or byte-code caches are retained in the new audit directories.

The review by claude-b9ee added three small text files to the same two directories (`REVIEW_claude-b9ee.md`, a
numerical test script and its log); it used a python-flint installation in a session scratch directory, of which
nothing is retained.
