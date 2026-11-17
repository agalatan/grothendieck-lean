# Inventory: what was left outside the repository

This folder holds text, scripts, small JSON and a few small logs only. Everything else stays in the git-ignored
working folders on the laptop, under `/Users/alingalatan/workspaces/grothe/handoff/`. This file lists what was left
there on 15 November 2026, with absolute paths, sizes and one line each, and the SHA-256 of the files a result
depends on.

**Rules applied.** Copied: `.md`, `.tex`, `.txt` documents; `.py`, `.mjs`, `.cpp` scripts (a `.cpp` with its header
`.hpp`); JSON result files of at most 300 KB. Left out: zips, certificates and data above 300 KB, logs, binaries,
PDFs, byte-code caches, third-party libraries, shell scripts, and documents that are not about Conjecture K. One
exception to "no logs": the logs and JSON-lines records of the review and of the numerical follow-up of 15 November
(each at most a few KB) are in the repository, under `sources/external-2026-11-15/review/` and
`code/kprime-2026-11-15/`, because `REVIEW.md` and the write-up of the follow-up cite them as their record. The same
holds for the logs of the three reviews of the report on the tilted sector, under `code/tilted-sector-2026-11-15/`
(the largest is the 25 KB log of the replay of its fifth version, `replay_version5.log`), and for
`code/kprime-2026-11-15/tilt_restricted_67.log`, which the first of them cites. The result files of the verifiers of
that report are `.txt` documents and are under `sources/received-2026-11-15-tilted-sector/`. The fourth review adds two
small logs, under `code/tilted-sector-2026-11-15/review4/`.

**Completeness.** Every file under `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/` is either in
this repository folder or covered by a row of sections 1 to 4 below (checked by script when this file was generated:
no file unaccounted for). One working folder, `kprime-2026-11-15/`, was still being written at that time; section 4
has a row for whatever appeared there after its copy was taken, and no such row if nothing did. Sections 5 and 6
cover the K-related parts of two larger folders, which also hold material on other subjects that is not listed.

**Update of 15 November** (the report on the tilted sector in its fifth version with the reviews of its first,
second and fifth versions, the prompt of that day, the final state of `kprime-2026-11-15/`, the corrected
`external-2026-11-15/REVIEW.md`). The check was run again when they were added: every file under `research-degree5/`
is in the repository or covered by a row. Section 4 has rows for what the three working folders of that day hold
beyond the copies. The folder of the report, `gpt-tilted-sector-2026-11-15/`, held one version at a time: its author
revised the report, its verifier and its results in place four times and went on adding files after the fifth
version. The repository has the first version, the fourth and the fifth; their hashes are below. The folder of the
reviews, `gpt-tilted-sector-2026-11-15-review/`, is in the repository whole, except byte-code caches. No copied file
is larger than 300 KB; the files that the author of the report added after its fifth version are not copied (section 4).
*Update of #412:* those files became the sixth version of the report, which is now in the repository; five of its
files, above 300 KB, stay in the working folder (section 4 and the last section). The check was run again: every file
of the report folder is in the repository or in a row of section 4.

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

The report on the tilted sector of 15 November (`STATUS.md`, section 11 (b)) was rewritten in place by its author
five times, so its copies cannot all be compared with the working files; the hashes say which versions the
repository holds. For a `.md` file the hash is that of the file as it was copied, that is, of the copy without its
first line.

| file in the repository | size | SHA-256 | what it is |
|---|---:|---|---|
| `sources/received-2026-11-15-tilted-sector/first-version/REPORT.md` | 24,880 B without its first line | `67ac4eee114db52588a84b02e7e90883044d7c3530d3aa5d87fafcc3f4b3dceb` | the report, **first version**, as reviewed in `REVIEW.md` (file dated 03:23) |
| `code/tilted-sector-2026-11-15/first-version/verify.py` | 10,226 B | `8d889c26e7e41d7da5ce12a1991799293d24b5c7f59b5d427ddc59c7e733620d` | the exact verifier of the first version, as reviewed and replayed; the review quotes this hash |
| `sources/received-2026-11-15-tilted-sector/preliminary_results.txt` | 4,592 B | `34d2f40d5c84d3220bc76f21810b051febbe4b11501cbe3ef739ba8e19995010` | the output of that verifier (`results.txt` at the time of the first review); its third line prints the hash of the verifier |
| `code/tilted-sector-2026-11-15/second-version/verify.py` | 16,471 B | `8ce971c12983f6b27776a16aed66547bc6e9ee723bbef9a7ee3e6063d57e5175` | the verifier of the second version, as replayed for `REVIEW_2.md` |
| `sources/received-2026-11-15-tilted-sector/REPORT_localization_history.md` | 42,400 B without its first line | `26e6cdcefebdc82979eb37e48205327c2f1bb8e0efac86ebd88ea3c498f747dd` | the report, **fourth version** (04:40); identical to the copy of `REPORT.md` taken at 04:40 |
| `code/tilted-sector-2026-11-15/fourth-version/verify.py` | 21,125 B | `c2109f2f5f4e03a145f526e8ace8f560469fa5207e3ea232dd8e586982ffa625` | the verifier of the fourth version (04:38); `results_localization_history.txt` prints this hash |
| `sources/received-2026-11-15-tilted-sector/results_localization_history.txt` | 16,360 B | `d43da0a8a5ecc69431a2aa6dad40625d25fc4fd941b4f4c3927292f218699a61` | the output of that verifier (04:38) |
| `sources/received-2026-11-15-tilted-sector/REPORT_secant_history.md` | 11,205 B without its first line | `94a46ca8b87092365993485844a8c2d7c4c9b685c72c6b93a1cd42a0be6a8213` | the report, **fifth version** (05:17), as reviewed in `REVIEW_3.md`; under this name since the sixth version; the last lines of `results_secant_history.txt` print this hash |
| `code/tilted-sector-2026-11-15/verify_secant_history.py` | 25,464 B | `7572574a7357e3dc4772b438fcc7a6b924f24244826e24ea281f6267e9285caf` | the verifier of the fifth version, under this name since the sixth; `results_secant_history.txt` and `replay_version5.log` print this hash |
| `code/tilted-sector-2026-11-15/secant_verify.cpp` | 8,661 B | `05587544ff9b3c96a863179185d42925d1c06b7e866b3b9a4bd1bc0911ce3f11` | the checker of the compact cover of the global remainder bound; printed likewise |
| `code/tilted-sector-2026-11-15/secant_content_witness.json` | 26,568 B | `ddb1e7214b8348e2975db9c85050e571938a371c099dacf0300aeed01d8ebf20` | the rational barrier of the central content bound; printed likewise |
| `sources/received-2026-11-15-tilted-sector/results_secant_history.txt` | 25,901 B | `39e37a1d4e713f6377ef02afb52f67f53e56dfd6d1c6b138a188122d2f63f43a` | the output of the verifier of the fifth version (05:17), under this name since the sixth |
| `sources/received-2026-11-15-tilted-sector/REPORT.md` | 13,246 B without its first line | `d697d3682a5e5a36fc8ad391e19183f91da5f11bb82337548443b10413b4202f` | the report, **sixth version** (06:06), as reviewed in `REVIEW_4.md`; `results.txt` prints this hash |
| `code/tilted-sector-2026-11-15/verify.py` | 31,459 B | `7931e47c76703dc182409e90e710e1cebc116035718f9aa6530347ecce950b55` | the verifier of the sixth version; `results.txt` prints this hash |
| `sources/received-2026-11-15-tilted-sector/results.txt` | 31,355 B | `89e5e0997d48bfb8d464f92f4d865c10e7c2ef522a8137ce799aec17638e0495` | the index of the runs of the sixth version (06:06) |
| `sources/received-2026-11-15-tilted-sector/deficit_integrated_results.txt` | 26,969 B | `6f802691de7ef2a6f9242d44173d4b4847f12a6779c105f03029bea21221e2fe` | the log of the run of the new chain, `verify.py --deficit-only`; `results.txt` prints this hash |
| `sources/received-2026-11-15-tilted-sector/deficit_moment_verify_witness.json` | 18,702 B | `ac6921cac8a2f3ca4cd67ab3d0cdce72c66e7e1e7d5375226117709b973f9780` | the low-energy moment cover, as regenerated in that run |
| `sources/received-2026-11-15-tilted-sector/deficit_moment_prefix_witness.json` | 26,880 B | `a1eb21d0f9d30453aa9128969cd2c067f18a2c62396a34e95abc3a5560b67a0f` | the prefix moment cover, as regenerated in that run |
| `sources/received-2026-11-15-tilted-sector/deficit_cover_union_results.json` | 373 B | `4f7f03aac1a7177995a949d5e308e55fa85bd855b7f1335ad44c0868ae1582f4` | the exact union of the 178 rectangles, as regenerated in that run |
| `sources/received-2026-11-15-tilted-sector/secant_proof.md` | 15,799 B without its first line | `6aaff2395fca95da706299b14e0a5bea3497d1281b559550bec45d5dd5fccd40` | the note of the global remainder bound, in its state of 06:02 (closing paragraph revised); its 05:17 state had `325c097bd78bd3ef6e59576f31f73ddb6cc342d3b372e6256e3b2efc83a8ee1e` |
| `sources/received-2026-11-15-tilted-sector/secant_assembly.md` | 5,113 B without its first line | `0d3848dc1147dfffa70b5ce1e1c5f39cdfadaa649afafd64427feb43e900f76c` | the note of the assembly, in its state of 06:02 (sections 3 and 4 revised); its 05:17 state had `dcfff6ebaf5e8f0b9f5698513020fa3c23e9455b566bae872c5d787ee6803f4d` |

The copy of the first version of `REPORT.md` was restored after the working file had been overwritten, from the
reading of the working file that was made when the update began; it has the SHA-256 recorded from the working file
then (at 03:34 and again at 03:59). The second and third versions of the report are not in the repository. For the
record, the hashes of the working files when they were seen by the worker who first updated this folder: second
version (04:03 to 04:05) `REPORT.md` `d7213b2819f2f1c2e841572f351a4bea22c2c881b0ee435bf7b67938456653f0`, `verify.py`
`8ce971c12983f6b27776a16aed66547bc6e9ee723bbef9a7ee3e6063d57e5175` (the copy in `second-version/`), `results.txt`
`4a519277a195f6267b1e185f8fd764d33b0b56a813d16041eac1791ecc917f84`; third version (04:27 to 04:31) `REPORT.md`
`3b5c58b87f8179ef82e50b8eaa2b906f709d49e0ad9e5466fe4fccd5ffe35362`, `verify.py`
`985a885b7fe954822c921092eddbf8ed7d4ff50c9425c8d1377e6ed03350b61d` (also printed at the head of
`results_localization_history.txt`, for a run before the final one). The checkers that `REVIEW_2.md` replayed with
the second version (`localization_verify.py`, `theta_verify.cpp` with `theta_candidates.txt`, `content_profile.py`,
`profile_range.py`) are in the repository with unchanged hashes, and the verifier of the fifth version still uses
all of them except `localization_verify.py`.

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
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/conjectureK-monograph-bundle.zip` | 1 | 36.6 MB | Zip bundle of the working folder (the "bundle root" of §7 of the monograph of 5 and 6 November): the monograph with its companion files and `ai-notes/` with the extracted packages. SHA-256 `c7baf010f76ca642d8ee715c92cc0af5fb2368d97e09e52594cf41cfecc83e14` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/*.log` | 7 | 26.1 KB | Outputs of seven `e11_*` scripts (the scan of §3.5 of the monograph of 5 and 6 November, the hill-climb, the sector scan, the odd-form computation, the envelope check, the size-bias check, the finite A/B kernel grid). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/e4-logs/` | 13 | 15.4 KB | Outputs of the E1 and E4 runs of 4 November (first-moment maxima; full-tensor attack on K). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/k5/logs/` | 53 | 124.6 KB | Logs of the K₅ experiment. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/k5/results/` | 48 | 256.2 KB | Candidates of the K₅ experiment (24 `.json` with 24 `.npz`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/k5/*.sh` | 2 | 788 B | Two launch and synchronisation scripts of the K₅ runs (they name a droplet folder). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/d1/d1-note.pdf` | 1 | 298.9 KB | The D₁ note typeset (source: `sources/d1/d1-note.tex`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/out1/` | 180 | 3.5 MB | Pass 1 of the global search: 180 files, 840 runs with their coefficient vectors (summary: `code/kscan-2026-11-13/out1-summary.json`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/tables-peak.npz` | 1 | 21.6 KB | Kernel table of the global search; regenerate with `tables.py`. |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/tailgames-2026-11-14/*.log` | 11 | 29.3 KB | Logs of the identity-tail exploration (the sources of the numbers in its README: `sanity.log`, `cp_*.log`, `two.log`, `scan2.log`, `scan3.log`, `htriv.log`, `m3_*.log`). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kprime-2026-11-15/search3/run_mega.sh` | 1 | 598 B | Launch script of the three-variable search of `STATUS.md` 11.20 (eight single-threaded processes; a shell script that names a droplet folder). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kprime-2026-11-15/search3/driver.log` | 1 | 0 B | The log of that launcher (empty). |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_dual_budget_retest_witness.json` | 1 | 749.4 KB | The witness of a conditional retest of the Stein budgets (`deficit_dual_budget_retest_results.txt`); not an input. SHA-256 `ea0e459beccf7ebcbd466e69ef6bf7de59a5997ff38f6d2ffc00696b384e18c7` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_dual_cover_candidates.json` | 1 | 540.4 KB | **An input of the verifier**: the proposed dual coefficients that `deficit_dual_cover_verify.py` accepts exactly. A replay of the deficit chain needs it from here; `results.txt` prints this hash. SHA-256 `6441733fd5824feb974740ddd6ad27aff46049238d1a57a18236e2a82ea0933b` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_dual_cover_enriched_plan.json` | 1 | 306.4 KB | The same plan with the extra candidates of `deficit_dual_cover_enrich.py` (**N**); not an input. SHA-256 `52657b43b6b227c67ee6c2536e31a22b19875d05e5564f11fc1ffbea3aac4041` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_dual_cover_plan.json` | 1 | 333.3 KB | The plan of the floating-point search of the Stein cover (**N**); not an input. SHA-256 `4f5ce1b0887f2ad96d745a7bea2cb52b0c37a65b874fe087482ef6da061f653a` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/deficit_dual_cover_witness.json` | 1 | 748.8 KB | The witness of the Stein cover (119 accepted duals, 106 boxes), an output of `deficit_dual_cover_verify.py`, regenerated at each replay; `results.txt` prints this hash. SHA-256 `40962c50dad6b26069f6b42a71885db53f5f2067fefd17342cdaf7c8b8a0f261` |
| `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15-review/__pycache__/` | 2 | 18.3 KB | Python byte-code caches of the scripts of the second review. |

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


## Second audit after PR #397 (codex-a7c4, task #398)

New notes and small scripts/results are in `sources/reaudit-2026-11-15-codex-a7c4/` and
`code/reaudit-2026-11-15-codex-a7c4/`, indexed in README. No new external data, log, archive, binary or
dependency installation is retained. The direct Rice check reuses the existing python-flint dependency
directory named above read-only; the other checks use only the standard library. The content and odd-cost
checks explicitly reuse the old `odd_cost_check.py` interval/series definitions, recomputing their inputs
rather than loading saved JSON. All new commands print results without modifying the checkout by default.

The disjoint cost is an independent Python port of the already indexed historical full-box verifier,
with interval-union coverage checks. The new benchmark uses direct Rice integrals rather than the original
integration-by-parts implementation. Existing source files and the historical monograph body are byte-identical
to the merged PR #397 baseline. No historical certificate file has been replaced.

Added in review by claude-b9ee: `REVIEW_claude-b9ee.md` and a floating-point spot-check script with its log in the
two new directories. One earlier file is no longer byte-identical: `sources/audit-2026-11-15-codex-a7c4/REMOTE.md`
carries two dated notes in the reviewer's own passages (§3a and §4), recording the corrections of this audit.


## Third audit after reviewer-updated PR #399 (codex-a7c4, task #400)

New notes and six checkers with small JSON outputs are indexed under
`sources/third-audit-2026-11-15-codex-a7c4/` and `code/third-audit-2026-11-15-codex-a7c4/`.
The global alignment check uses the existing python-flint directory named above, read-only; no package was
installed. The remaining scripts use the standard library, with explicit reuse of earlier exact interval
and disk-cover helpers. All checkers are read-only by default. Saved outputs are not inputs.

No new external data, binary, archive, build directory, or persistent log is retained. Temporary acceptance
log/PID files were removed after completion. Every source present at baseline `39ae5c239` and the historical
monograph body are byte-identical; the reviewer's amendments from #399 are part of that baseline.

## Update of 15 November (issue #396): the report on the tilted sector and its reviews

Of the report folder, everything up to the end of the fifth version is in the repository; what its author added
later is the row `deficit_*` of section 4. The verifier of the fifth version compiles its two C++ checkers in a
temporary subfolder that it removes on exit. Its `results.txt` names a python-flint installation on its author's side
(a virtual environment under `/Users/alingalatan/workspaces/grothe-coordination/`), which is not part of this
record. The replays of the reviews ran in copies in a temporary scratch folder of the reviewer's session, with a
python-flint 0.9.0 installed there; that place is not durable, and what the replays printed is in the logs under
`code/tilted-sector-2026-11-15/` (`replay_version5.log` shows its paths). No library, binary,
archive or byte-code cache is added to the repository.

The previous copies of the report folder in this repository (the fourth version, taken at 04:40) were replaced by
the fifth version, except the verifier of the fourth version, which is kept as `fourth-version/verify.py`; its
report and results are in the folder under the names that their author gave them in the fifth version
(`REPORT_localization_history.md`, `results_localization_history.txt`), byte-identical to the earlier copies.


## Fourth audit after merged PR #403 and resynced #408 (codex-a7c4, task #406)

New notes, the archived #403 review, and small Python/JSON files are indexed under
`sources/fourth-audit-2026-11-15-codex-a7c4/` and `code/fourth-audit-2026-11-15-codex-a7c4/`.
The audit began at `2442792eab87cc48a71ba29dc74be7a250b4a03a` and was resynced to
`9a93fb47264f12c74840bc671a80154abc7eca28` to include the reviewed tilted-sector record of #408.
All pre-existing source files at that resynced baseline and the historical monograph body are preserved.
The older review amendments and #408's replacement history remain part of the inherited record.

No new external artifact or dependency installation is part of this delivery. The direct Rice benchmark
replay uses the existing python-flint directory named above; the new acceptance scripts use standard-library
exact rational or outward integer arithmetic, with explicit reuse of earlier radial interval helpers.
The finite integral and polynomial checks recompute their acceptances; saved JSON is output, not input.
Commands are read-only by default and explicit result-writing options only regenerate adjacent small JSON.
No Lean build, binary, archive, large certificate, persistent log or private cache is added.

The archived Claude review applies to #403's exact head and names what it did not check. Fourth-audit
paper arguments are author proofs pending independent external review; their scalar acceptances and
within-session cross-checks are identified in the notes. #408's global tilted secant and central content
certificates retain their separate existing independent-review provenance.


## Fifth audit after merged PR #409 (codex-a7c4, task #411)

Baseline `0882c67d3f7dbfd02f821cad48808440643f802d`. New notes and the exact archived review are under
`sources/fifth-audit-2026-11-15-codex-a7c4/`; three read-only Python checkers and adjacent small JSON outputs
are under `code/fifth-audit-2026-11-15-codex-a7c4/`. Every pre-existing source and the historical monograph
body remain byte-identical. The archive identifies #409's reviewed head and the reviewer’s exclusions.

No new external data or dependency installation is retained. `remote_augmented.py` reads the existing
`code/audit-2026-11-15-codex-a7c4/remote_stein_original/` polynomial bank and profile verifier, and uses
python-flint 0.9.0 from the already-listed dependency directory. Its JSON records all 17 selected rational
polynomials, 34 freshly evaluated profile nodes, 33 continuum leaves, and input hashes. The two other
checkers use only the standard library; `joint_tail.py` explicitly reuses the earlier dyadic interval helper.
Saved outputs are not acceptance inputs. All three fresh full replays match the saved JSON byte for byte.

No Lean build, binary, archive, private cache or persistent external log is part of this delivery. New
proofs are author proofs awaiting external review; internal cross-checks do not replace Claude review.


## Update of 15 November (issue #412): the sixth version of the report on the tilted sector, and REVIEW_4

The report folder is copied in the state of its sixth version (06:06): all its files except the five JSON files above
300 KB listed in section 4, with their SHA-256. One of them, `deficit_dual_cover_candidates.json`, is an input of the
verifier. The deficit chain of the verifier also reads the October Stein package through a fixed relative path into
the repository (`ROOT.parents[2]/research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original/`, from
the working folder): a replay needs the working folder in its place under `handoff/research-degree5/` or a copy with
the same layout (`STATUS.md`, 11.52). The fifth version's report, results and verifier are in the repository under the
names that their author gave them (`REPORT_secant_history.md`, `results_secant_history.txt`,
`verify_secant_history.py`), byte-identical to the earlier copies; `secant_proof.md` and `secant_assembly.md` were
revised in their closing remarks at 06:02 and are copied in that state (the hash table above has both hashes).

The scripts and two logs of the fourth review (`code/tilted-sector-2026-11-15/review4/`) come from a scratch folder of
the reviewer's session, which is not durable. Not copied from there: the numerical tables `tables.npz` and `m2.npz`
(binary; `tables.py` and `kcheck.py` write them again), the output `family_rows.json` of `check_cert.py` (251 KB of
data), a process-id file and a byte-code cache. Each copied script carries one added header line, since it is not a
working file of the delivery; the logs are copied byte for byte. No library, binary, archive or byte-code cache is
added to the repository.


## Sixth audit after merged PR #413, resynced through #416 (codex-a7c4, task #415)

The audit began at `adb96a5a28bce3ac6ea5896486153d2ffbc556a5` and was rebased onto
`40f8c5ee6` after #416 imported the completed tilted package and #381 updated the lower bound.
New notes are under `sources/sixth-audit-2026-11-15-codex-a7c4/`; four Python checkers and small JSON
outputs are under `code/sixth-audit-2026-11-15-codex-a7c4/`. Every source present at the resynced
baseline and the historical monograph body are preserved. #416's version replacements and history
are inherited unchanged. The #413 coordination comment and later mathematical approval are archived
separately; AUDIT §4 dispositions the review with its exclusions.

The tilted report and REVIEW_4 were read before #416 landed. Their provisional duplicate snapshots
were removed when the canonical copies arrived on master; the notes now cite those copies. This pass
does not rerun the large tilted certificate. The named external review replayed its secant and deficit
chains separately, not the combined default invocation (STATUS 11.50; section 14, item 53 of `sources/status-2026-11-15/STATUS_with_history.md`).
The review's exclusions and exact replacement of the 12 partly reviewed third-order branches are retained.
No new external file, package or dependency installation is left by this pass.

The new obstruction checker freshly invokes the existing A-kernel checker and direct Rice benchmark
cross-check, using python-flint from the dependency directory already listed above. The other new
checkers use the standard library; `odd_coupling.py` explicitly reuses the existing 220-bit interval
helper. All four full replays reproduce their adjacent JSON byte for byte. No saved JSON supplies an
acceptance input. No Lean build, binary, large file, persistent external log or private build cache is
part of this delivery. Internal peer checks do not replace external review.


## Current progress package (codex-a7c4, task #421)

The proofs under `sources/progress-2026-11-15-codex-a7c4/` and the small exact
checkers and results under `code/progress-2026-11-15-codex-a7c4/` add pure remote-core
odd costs, a sharp A/B kernel comparison and matched tilted B-content, and the
stronger common-response ellipsoid. `JOINT_TARGET.md` and its scalar checker
add a conditional joint-sector bridge; its global pointwise premise remains open. These are author-only mathematical results
pending external review; internal re-derivations are not external review. The
ellipsoid checker uses the previously reviewed Rice tangent as an explicit input.
No third-party dependency, binary, or private Lean build is added.

The complete lower cover is production proof data under `data/lower-refinement/`,
with its generator and Lean export; it is not an omitted research-only certificate.
Exploratory searches, the frozen-source obstruction and candidate joint envelopes
remain in the owning worktree's ignored `handoff/codex-a7c4-progress/` and
`handoff/codex-a7c4-next-{lower,odd,joint,content}/` folders. Their research conclusions
are tracked on issue #421; they are not inputs to any accepted bound here.

| file in the repository | size | SHA-256 |
|---|---:|---|
| `code/progress-2026-11-15-codex-a7c4/joint_content_exact.py` | 3,875 B | `81c7d5afce08980aa8ec5269c383b6fa68e20ecebe263113f2b52c7b53aae419` |
| `code/progress-2026-11-15-codex-a7c4/joint_content_exact_result.json` | 1,774 B | `734b1ed851dd6730f2b625c60b7abf8cfda5dbec2c4ec41c7b46b10df5b76374` |
| `code/progress-2026-11-15-codex-a7c4/joint_target_check.py` | 2,278 B | `b50392d57bbdbd07d2930192299cd2b9c29655ff2a7087f39dc00ca9525490a6` |
| `code/progress-2026-11-15-codex-a7c4/joint_target_multipliers.json` | 24,663 B | `6f04c6320f6ee44d7e0c245b14087e626252df6cfcff2726884ecdd5a972a2b2` |
| `code/progress-2026-11-15-codex-a7c4/joint_target_result.json` | 532 B | `05dee20a9c473f386545f93c83b8c21ef063cbc4f3c4a56217f3738c9964f0b8` |
| `code/progress-2026-11-15-codex-a7c4/joint_target_tail.py` | 3,118 B | `481d53f24ffacc958e4ad4542ab0de20d95be410efaf60c0a5687aa8ab0021c3` |
| `code/progress-2026-11-15-codex-a7c4/joint_target_tail_result.json` | 901 B | `0ef966cf0db99867ccc7d884f3a272fc699bf4c777275a238b6d6e652cfad57d` |
| `code/progress-2026-11-15-codex-a7c4/odd_control.json` | 33,214 B | `85966cafdb652b85fc0d60ecc6e2ba8a234f84df93e2f339cef42ff17a049297` |
| `code/progress-2026-11-15-codex-a7c4/odd_control.py` | 8,670 B | `541b436ea3ad5785cb64b3d5d5ef183138f7e63c8761f3c87eaf491a7170bb32` |
| `code/progress-2026-11-15-codex-a7c4/response_ellipsoid_check.py` | 4,516 B | `5127252a1541044dc4afc0ae66a273adcad79627e2d534a4392bb7395849674d` |
| `code/progress-2026-11-15-codex-a7c4/response_ellipsoid_result.json` | 8,198 B | `7688663ecd3b3f3475f510b552ebc9f57924a2d1d833d3e4c4a82e2550372f42` |


## Compact interior pieces (codex-a7c4, task #431)

`sources/compact-joint-2026-11-15-codex-a7c4/PROOF.md` records author-only proofs
of a uniform infinitesimal reserve, its nonlinear small-amplitude strip, an origin
neighborhood, a five-parameter critical box, and stronger finite-amplitude exteriors
from full directional potential matrices. The complete (P) interior remains open.
`code/compact-joint-2026-11-15/verify.py` regenerates the two Arb profile values,
compiles three interval verifiers from source, replays the inherited density cap
and exact constants, and checks all accepted regions. `result.json` is a small
receipt with source hashes; it is never read by acceptance. No production bound,
Lean source, binary, external certificate or third-party dependency is added.

Unfinished annulus covers and numerical probes remain in
`/Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/handoff/codex-a7c4-compact/`.
They are not accepted inputs. The proof programme and its remaining gap are tracked
on issue #431. There is no complete finite-amplitude cover hidden in those files.

| repository file | size | SHA-256 |
|---|---:|---|
| `code/compact-joint-2026-11-15/README.md` | 1,810 B | `043ee0ebbce6e73d2bdd6739ab89954df793f0273042dd3a0e1f44801b51ea0e` |
| `code/compact-joint-2026-11-15/hessian_integral.cpp` | 4,941 B | `8d4256c8c684d4abf43a9aeaeb4d006b2329f46e27435178d81c3e9daa42671d` |
| `code/compact-joint-2026-11-15/joint_integral.cpp` | 5,956 B | `85644f7f59c5ec80752733ee3311c1511fbf2a8932da83cdfaf1072d769148ae` |
| `code/compact-joint-2026-11-15/origin_check.py` | 2,529 B | `1e975c216a27d43e0966548db27e2293dde44108479885a0b49f91d2a975bbbf` |
| `code/compact-joint-2026-11-15/potential_integral.cpp` | 5,128 B | `f69971f16671639c9662dfe0615463205620220cf346040385a277fcf80c3d73` |
| `code/compact-joint-2026-11-15/profile_points.py` | 1,348 B | `2b2e522e587522b2c184712eb91687d64e5401b76dc5ac01d7dadb93ae72c8c7` |
| `code/compact-joint-2026-11-15/result.json` | 125,158 B | `d3c3eb4f62ad48a67c9ddffdaa2b345d84ba9a3f4e52032cd0863ceaf062a0f2` |
| `code/compact-joint-2026-11-15/strip_check.py` | 2,743 B | `6193d57181d37fff00e498afce17b118b5d7d51fd34e51ecb3b148c6b779fcd2` |
| `code/compact-joint-2026-11-15/verify.py` | 5,777 B | `b90afc03d9298c7c28d41f1568bae2d43dc046cd2a674c70b00e2d3d9e7daf48` |

## Review of the compact interior pieces (claude-b9ee, #437)

`code/review-437-claude-b9ee/` holds the two new pieces of the review of #437: an alternative proof of the critical
box with weaker, self-contained curvature inputs (`curvature_bounds.py`, Arb, 0.3 s) and a floating-point recomputation of
the matrices behind 7.4.11 and 7.4.12 directly in z₁ (`crosscheck.py`, numpy and scipy, about 25 minutes).
Its README records the numbers of the review run; no log is kept.

| repository file | size | SHA-256 |
|---|---:|---|
| `code/review-437-claude-b9ee/README.md` | 3,423 B | `31bc3eeff569dd8fb0d1ccb688ee1df1a67cd396d35ecb7e15c015f8dd478571` |
| `code/review-437-claude-b9ee/crosscheck.py` | 7,250 B | `54063ed9953864382a5e3abd08aede7ca20e9140c2abb64c893c57b34d1f04f1` |
| `code/review-437-claude-b9ee/curvature_bounds.py` | 6,009 B | `259c383f1a3e35dd28ce951631e54996cce3bbf67cee6de4c3dc5966e25422f8` |


## Normalized remainder and amplitude-complete tube (codex-a7c4, #431)

The source integral is evaluated after division by amplitude squared, with an amplitude-independent
one-sided quadrature error bound. The exact amplitude partition and all endpoint checks certify the
stated tube only; full (P) remains open. The small combined receipt is committed. Cloud logs and
individual shard receipts remain in the author's ignored `handoff/cloud/run-43709889135/`.

| repository file | size | SHA-256 |
|---|---:|---|
| `code/normalized-remainder-codex-a7c4/README.md` | 3,319 B | `3a4af749f32be198e6623f735efc18bb8e9e8663fe9379e3b319aff7ba99c89d` |
| `code/normalized-remainder-codex-a7c4/normalized_integral.cpp` | 4,833 B | `ec5af8beb938f9c586505c780eb6a94f3673f00a41f27dd5d66ac22e5d8bf011` |
| `code/normalized-remainder-codex-a7c4/result.json` | 43,193 B | `0261119b432194faed56c512e511725aea8874439a1a14d9466b216ce11cf244` |
| `code/normalized-remainder-codex-a7c4/verify.py` | 7,943 B | `b24e8679bfc1b903890e46f86f7246ee4ebb02a98140b9b6509ad8b299d729c0` |
| `sources/normalized-remainder-codex-a7c4/PROOF.md` | 7,150 B | `5e4967e704d1af05f7d5c89ef88fcc9088017215905d0450d9120262be41d48e` |

## Amplitude-adaptive compact tube (codex-a7c4, #431)

The uniform shift-curvature and coefficient-convexity estimates give quadratic spatial
interpolation losses. All 560 corner jobs and the exact 65-cell amplitude aggregation
passed. This certifies the explicit widened tube only; full (P) stays open.
The combined receipt is below 300 KB. Raw cloud logs and individual shard receipts
remain in the author’s ignored `handoff/cloud/codex-a7c4-20261115121547-29863/`.
Working proof: `handoff/codex-a7c4-compact-cover/PROOF.md`, archived verbatim below.

| repository file | size | SHA-256 |
|---|---:|---|
| `code/adaptive-cover-codex-a7c4/README.md` | 3,813 B | `cb9aebdfecd7a8d5477b7794d8fff8bd3e2306e1785315124102e5614a4053aa` |
| `code/adaptive-cover-codex-a7c4/result.json` | 183,242 B | `827c135d2c5c2a23bb42de86a464e9c64150423294bd2a4eb534652a13585a10` |
| `code/adaptive-cover-codex-a7c4/shift_curvature.cpp` | 1,148 B | `10017337ea12d581dc7ea1fb1863343698891d14bef8a62d6bd8f6fc9d599aad` |
| `code/adaptive-cover-codex-a7c4/verify.py` | 9,147 B | `c7a1932caf30c43965eb6e50155dee112d31aba4ed0768f0af2afac972418f5f` |
| `sources/adaptive-cover-codex-a7c4/PROOF.md` | 8,046 B | `9b5da0404fd776ae1c841cd187d17fb98bffeb3a0bbec759f1dd2bd98e2793fb` |

## All-direction matrix regions (codex-a7c4, #431)

The amplitude-capped PSD matrix majorant, the directional potential criterion
and the restricted mixed-driver corollaries are recorded here. The complete
446-job replay passes, with 438 endpoint matrices and 93 adaptive cone intervals.
The combined receipt is below 200 KB. Raw shard receipts and logs remain in
`handoff/cloud/codex-a7c4-20261115131529-6066/` in the author's owned worktree.
The source proof is a verbatim archive of `handoff/codex-a7c4-direction-cover/PROOF.md`.
Full (P) and the global lower-bound improvement remain open.

| repository file | size | SHA-256 |
|---|---:|---|
| `code/directional-matrix-codex-a7c4/README.md` | 4,082 B | `e84a04e5111083426452d4b3ca3956e6eb838684201b78b2f81b524ee717b180` |
| `code/directional-matrix-codex-a7c4/cone_integral.cpp` | 2,086 B | `df1d80a6d4fb3710907eb01e11cb305411d2c1b6db5bffa44b69b07a6bee5525` |
| `code/directional-matrix-codex-a7c4/joint_family.py` | 1,954 B | `1e2518f21a8049025209e19b37099df4ed8ab407dbf21db9fa7a975db54c9e96` |
| `code/directional-matrix-codex-a7c4/radial_matrix.cpp` | 4,298 B | `99e69ed0708ed51e2d9b30b22256c842e4f79f14dec64c302aef08fbc96a8663` |
| `code/directional-matrix-codex-a7c4/result.json` | 199,961 B | `ac3a2d05dd5430d28d3a49409003c1ecceeb81833c89e89c11ea008eccc2b54f` |
| `code/directional-matrix-codex-a7c4/test_receipts.py` | 3,649 B | `209f560139149c98666be65b41c7aebef54456953de15fe34cc529318269ae31` |
| `code/directional-matrix-codex-a7c4/verify.py` | 9,245 B | `fee9f240f652e61966e2663507bc33899276fbd3fcfba0e98cc116e1ac55d576` |
| `sources/directional-matrix-codex-a7c4/PROOF.md` | 14,000 B | `999cdca45faf9ae28c213e35cdb061f690353ede5564fe61f881549367923930` |

## Odd sectors over an A/B core, and the refutation of (O_U) (codex-91d4, task #430)

`sources/odd-over-AB-core-2026-11-15-codex-91d4/` holds the Phase 0 report and the Phase 1 refutation;
`code/odd-over-AB-core-2026-11-15/` holds the countercertificate (item 89), replayed by claude-b9ee in about 3 s.
The numerical lanes, replay receipts and within-session reviews stay in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-over-AB-core-2026-11-15/` (8.6 MB).

| file | size | SHA-256 |
|---|---:|---|
| `code/odd-over-AB-core-2026-11-15/README.md` | 1,186 B | `9a03a778d1a593657d13c39ea8e5143fe41d89f1c9b545380aeeb162105ea8e5` |
| `code/odd-over-AB-core-2026-11-15/certification/certificate_result.json` | 2,598 B | `a741783830af5705a2862adb848d116eae06005692218bfea727d7da084de7c5` |
| `code/odd-over-AB-core-2026-11-15/certification/dual_verify.cpp` | 6,452 B | `840ebd3a9c381ad72794fb4a11437e0dfdd3ef2ae5113d907b8e216c480c8f04` |
| `code/odd-over-AB-core-2026-11-15/certification/make_moments.py` | 3,500 B | `171c55139c1304a3d7788543b194eb9d3cbec50a0ab717a5345ab64e0f078c2f` |
| `code/odd-over-AB-core-2026-11-15/certification/negative_controls.json` | 3,429 B | `be38c260e70985e8f1a69e129e07fa0eaa701bf4d178d0d1127ef6d62f433b9e` |
| `code/odd-over-AB-core-2026-11-15/certification/negative_controls.py` | 2,456 B | `1ad60da835bf08a99f78ba7bfed921a8ebf2962ae464a077ded38fa5bce39ac3` |
| `code/odd-over-AB-core-2026-11-15/certification/verify.py` | 2,855 B | `5730358ec6f2bd43be21d4f301d1ab4a143b22bd319d93664babbd301e222f51` |
| `code/odd-over-AB-core-2026-11-15/verify_candidate_inputs.py` | 1,858 B | `d13da31a7f079ee7d0028dcde6f8d5a540f875dcffd2f57cfccf928616886a49` |
| `handoff …/phase1/MANIFEST.json` | 8,905 B | `7368fc41b508cbaa40275558365f54dde119eb5083e2ed7574a5dee2b51d39b5` |
| `handoff …/MANIFEST.json (Phase 0)` | 9,548 B | `a0742dd3a5ff0662399c1f23636c61b6711f4f068b1f54cfd99273b8368c0f95` |

## Odd sectors against the energy slack (codex-91d4, task #436)

`sources/odd-energy-slack-2026-11-15-codex-91d4/` holds the report, the proof notes, the accounting (7.2.8) and the
multivariate summary. The numerical lanes (about 29 MB) and the replay entry point stay in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-odd-energy-slack-2026-11-15/`; `python3 -I replay.py`
there regenerates every Phase 0 lane in about 80 s (replayed by claude-b9ee).

| file | size | SHA-256 |
|---|---:|---|
| `handoff …/MANIFEST.json` | 8,407 B | `f993d2959f19d5dd09a80a86df3ae14d7211ec1787f3ce0fdee1c49fa92182ac` |
| `handoff …/replay.py` | 5,021 B | `a5a56d16056bf3d3f455ab8be82f61918dd29d893c2b885de2e80adaad3679c3` |

## The direct all-sector trial at the peak (codex-91d4, task #436)

`sources/all-sector-peak-2026-11-15-codex-91d4/` holds the report and the analytic notes; `code/all-sector-peak-2026-11-15/`
holds the exact checkers of 7.5.1, 7.5.3, 7.5.4 and 7.5.5 with their receipts (standard-library Python, under a second
each). The numerical lanes, the frozen inputs, the review records and the replay entry point stay in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/`; `python3 -I replay.py`
there regenerates everything in about 65 s (replayed by claude-b9ee).

| file | size | SHA-256 |
|---|---:|---|
| `code/all-sector-peak-2026-11-15/README.md` | 1,413 B | `2cbe839ea15ad7ccae2e5e1c38fa67740423ad538d397194823ad08b8ed026d9` |
| `code/all-sector-peak-2026-11-15/allocation_result.json` | 915 B | `66bebadf18e7d9ab7009d943c4d18e212b3af5a00f867ad3c6898fbd24bc86e0` |
| `code/all-sector-peak-2026-11-15/closure_budget_sizes.json` | 972 B | `533ff52fbb7c389edf849a39da88d309b6f79707ffa569b1032eaac376ac44d8` |
| `code/all-sector-peak-2026-11-15/closure_budget_sizes.py` | 2,754 B | `11f3b00bad32432bf6e7a926a42c975f93c92a8297623d8af5a277870994d37c` |
| `code/all-sector-peak-2026-11-15/discriminant_result.json` | 2,544 B | `5ef191d90a98a2595aa07eac25054e1aa7edf65b17c882c690c62577c1a3e076` |
| `code/all-sector-peak-2026-11-15/inputs/coupled_budget_check.py` | 4,436 B | `f1855fd5aa8aea9e9e3b82ee6b63d8fed1e295fef012d641700b01592dcf0490` |
| `code/all-sector-peak-2026-11-15/inputs/coupled_budget_multipliers.json` | 108,971 B | `54715d0969614267b7c866fbf8d255c53edda4133fe8eca24f3a15ebffe0d4f8` |
| `code/all-sector-peak-2026-11-15/primitives_result.json` | 1,573 B | `b1ca45a3b2603e61212037b02e22622a3e8689b36b836467eb0950873e86d137` |
| `code/all-sector-peak-2026-11-15/region_result.json` | 3,347 B | `4a63bedc9a7074b89c4ad6479fc66cc002973d9cc314b04084f3d6c4a698917c` |
| `code/all-sector-peak-2026-11-15/verify_allocation.py` | 2,825 B | `d531aed95e8af4e79cca2d102b07c6e9f5f82836d6bfe8642b1686c59700fff6` |
| `code/all-sector-peak-2026-11-15/verify_discriminant.py` | 5,854 B | `bf65e43ab5ed5a606b7183632811c3828c3324423f278c2a48a8544ac733db9f` |
| `code/all-sector-peak-2026-11-15/verify_primitives.py` | 7,873 B | `9a0bee97cef9faf2ae508893584af7855893463be3e7739f7c6f5417ada837d8` |
| `code/all-sector-peak-2026-11-15/verify_region.py` | 5,260 B | `3a42db17629eec10d99a1197e26879f617238d94d34f00f7c5b62e540119712b` |
| `handoff …/MANIFEST.json` | 10,617 B | `b4a9b1dcce15a13a893072519ec964649ba13dbe45f430733f06e588ed65f3a3` |

## Tilted A content with coefficient 1/5 (codex-8d2f)

`sources/A-content-2026-11-15-codex-8d2f/` holds the five proof notes of 11.55. The verifier stays in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-A-content-tightening-2026-11-15/` (about 3 MB of
scripts, witnesses and a bundled input of 752 KB, plus a vendored python-flint of 21 MB). From a clean checkout with
that folder placed at its handoff path:

```sh
python3 -I -B verify_continuation.py --repo-root <repository root>
```

It replays every certificate and the exact union audit (187 rectangles, 40 gaps, every χ for u ≤ 1/80) in about
3.5 minutes.

| file | size | SHA-256 |
|---|---:|---|
| `handoff …/verify_continuation.py` | 3,315 B | `00b9c384f3f7fbbc1b7186780221e7f4f850da4787123cbb8a4aa223f04a96f3` |
| `handoff …/gap_audit.json` | 5,544 B | `82f971a63d9140ed6f6038570f84c9224196c4c5211a41bcdab9aef5ef48302f` |
| `handoff …/bundled_inputs/deficit_dual_cover_witness.json` | 766,723 B | `40962c50dad6b26069f6b42a71885db53f5f2067fefd17342cdaf7c8b8a0f261` |
| `handoff …/clean_checkout_verification.log` | 52,310 B | `802256e3d360e8d996984f693a221979f0b66867fe9d6e31923fead9ba146626` |

## The first consumer: rows and response regions (codex-8d2f, task #440)

`sources/rows-and-regions-2026-11-15-codex-8d2f/` holds the Phase 0 report and notes (STATUS 8.5 to 8.8). The checker
stays in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-rows-and-regions-2026-11-15/`: it pins the
hashes of 30 Lean row files and of eight research files, among them the living `STATUS.md` and `MONOGRAPH.md` of
commit a6330cf65, so it replays only against that commit, and its full receipt is 2.3 MB. With python-flint 0.9.0 in
the folder's `vendor/` (see its README):

```sh
git archive a6330cf651981f1b72be097a15b3fd23b7070f00 research/conjecture-K Grothe/Lower Grothe/LowerAnalytic | tar -x -C <root>
python3 -I -B verify.py --repo-root <root>
```

It checks the S_M enclosure and the conditional cover in about 84 s (replayed by claude-b9ee).

| file | size | SHA-256 |
|---|---:|---|
| `handoff …/verify.py` | 1,856 B | `cafdae1ba027ae4aa0d9f9f148680b09a58c7da4f80cace112b80e68e946a528` |
| `handoff …/ledger.py` | 7,286 B | `ac2be99a8fa6d146cbe9afc2caaacf24c16ad65636f104f30fc51a77df2c5b3a` |
| `handoff …/benchmark.py` | 2,492 B | `a0fda53b9d548f62c77d90624f17375cd2a21255827c7278596b9b79655dd366` |
| `handoff …/rows.json` | 3,429 B | `ca20bf525881233f4cfb924226ec145f3057b497841a0ee5362a6c55f60a4920` |
| `handoff …/input_hashes.json` | 5,414 B | `96a2493604a055d5595a5a2c3f6ad4b94815ce177066d3a2e43dfe1d147f9cfa` |
| `handoff …/ledger_result.json` | 2,280,980 B | `9e870208fb18436d79c0b0fc6eaf87c8efdb8c80255df23aab9bdebb37191416` |
| `handoff …/clean_checkout_verification.log` | 15,128 B | `8a1a97dcba63bc8d951881a2c0e52550aeb49a70c47422ff516ce775bcac5d59` |

## Odd sectors over a remote core: the 32/25 certificate (outside GPT, #436)

`sources/odd-cubic-core-2026-11-15/` holds the proof and its README (STATUS 7.2.10). The certificate is in
`code/odd-cubic-core-2026-11-15/`: run `python3 verify_results.py` there for the exact coverage check of the 320 recorded
bounds, and `python3 run_certificate.py --workers 8` for the full recompute (a C++17 compiler; about 160 s on 8 cores).
`review-claude-b9ee/recomputed_all_bounds_gcc13.txt` is claude-b9ee's recompute (GCC 13.3), equal to `results/all_bounds.txt`
value for value. The working folder `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/odd-cubic-core-2026-11-15/` also keeps:

| file | size | SHA-256 |
|---|---:|---|
| `PROOF.md` (claude-b9ee's note on the first, uncertified version, p − 0.0655, and its review) | 5,300 B | `024ed9fa6d7c48bc22416dde36da7d678c0533f9b12c830e489c7ffc71d8bab4` |
| `kern.py`, the author's first matrix script | 1,627 B | `c78799628252a2f09536ebf75c16dcfa8ace2ad0977bada2632bf3c9181c76d1` |
| `kern2.py`, the author's script for the optimised compensation | 1,592 B | `2b03cc07026abfdbf07297ec4181e4c321eb969962d98ef6339fc1724a3c360e` |
| `verify_independent_claude-b9ee.py`, image-plane quadrature reproducing p − 0.065540 at r = 0.475 | 2,634 B | `d21d14063720b8c2f4301f997a77793d6305b9c2ff3c6ca0951875e83b17f9c2` |

## Partial results of codex-c7e2 (#436)

`sources/partial-results-2026-11-15-codex-c7e2/` holds the package README and its notes; `code/partial-results-codex-c7e2/`
holds every checker and small result file (`node replay.mjs` runs the four exact checks; `variational/inherited_odd_cost_check.py`
is byte-identical to `code/audit-2026-11-15-codex-a7c4/odd_cost_check.py`). Only the anisotropic region (STATUS 7.5.1) was
reviewed; 3.18, 12.7 and the strip of 7.4.11 are author only. The extracted package is in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-partial-2026-11-15/`; its two search records stay there:

| file | size | SHA-256 |
|---|---:|---|
| `boundary/results.jsonl` (100 coarse optimisations in H₂,₁(ℂ²) with a buffer) | 50,793 B | `e838c16981ea7183955773debbc8dc6cf346719358e41220d297dfe2b16cde4c` |
| `boundary/results_fine.jsonl` (the 100 refined optimisations) | 50,849 B | `487d23af8d2f62c516a9b2663e55b5600ab553a354fed81cf3fd1188b5ea1942` |

## The centred joint form near u* (codex-91d4, #436)

`sources/near-star-2026-11-15-codex-91d4/` holds the report and the proof notes (STATUS 7.5.6). The checkers stay in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/near-star-continuation/`, because its `replay.py` checks a manifest that includes
the documents; `python3 -I -B replay.py` there runs the exact checks and controls in about 0.4 s (replayed by claude-b9ee),
and `--numerics` adds the probes. Its `replay_runs/` (520 KB of receipts and logs) is not copied.

| file | size | SHA-256 |
|---|---:|---|
| `verify_exterior.py` | 6,858 B | `9211871f0ceb2857729f3988a6b1264642c891e4e113a6cea5462760f4384da8` |
| `verify_assembly.py` | 2,521 B | `cf9def4dfba18d34b8ee976eb7a6a82d60905ad9829ce9422636005151f461fb` |
| `replay.py` | 4,473 B | `11e6d4ccb8f990327874c3e6a31941fed97cf62871488fc269ff6b751cdf400e` |
| `MANIFEST.json` | 3,369 B | `4cc3bc4ed6820dd6df066a53dea815e53585d893aad7449eccd7e96660423685` |
| `inputs/coupled_budget_check.py` | 4,436 B | `f1855fd5aa8aea9e9e3b82ee6b63d8fed1e295fef012d641700b01592dcf0490` |
| `inputs/coupled_budget_multipliers.json` | 108,971 B | `54715d0969614267b7c866fbf8d255c53edda4133fe8eca24f3a15ebffe0d4f8` |
| `inputs/verify_region.py` | 5,260 B | `3a42db17629eec10d99a1197e26879f617238d94d34f00f7c5b62e540119712b` |
| `inputs/verify_primitives.py` | 7,873 B | `9a0bee97cef9faf2ae508893584af7855893463be3e7739f7c6f5417ada837d8` |

## The odd-gap continuation (codex-91d4, #436)

`sources/odd-gap-2026-11-15-codex-91d4/` holds the reviewed documents (STATUS 7.2.11, 7.5.7). The package, 11 MB, stays
in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/odd-gap-continuation/`, with `singular-continuation/` beside it; `python3 -I replay.py`
there replays its exact checks in under a second (replayed by claude-b9ee). Its folders `analytic-geometry/`, `numerics/`,
`spectral-interpolation/` and `spectral-pilot/`, and the other notes of `singular-continuation/`, were not reviewed and are
not copied.

| file | size | SHA-256 |
|---|---:|---|
| `odd-gap-continuation/replay.py` | 21,782 B | `584b87410483c1ea9e8e9c3a7372f4b130e15cdf6832bfce0da17f4194e011b8` |
| `odd-gap-continuation/budget/verify_energy_slack.py` | 12,319 B | `4787093aa2003e2f679b7b08747807717dce9bfe983080945ee4e4b1648b7569` |
| `odd-gap-continuation/budget/energy_slack_result.json` | 22,802 B | `1f0816a77e8e83353efb9217b6a4a4c303735c93b3d65fef2c96e22428373a3d` |
| `odd-gap-continuation/verify_sector_cones.py` | 3,420 B | `021c2c145e0c95a35a554d0ee8457f298354bb21eaad6464c391a73a722e68d4` |
| `odd-gap-continuation/restricted-driver-assembly/verify.py` | 9,122 B | `7a63161d388e6b9e2f4c1366fbd3a30b92332efe678c94041af556def71f70ce` |
| `singular-continuation/verify_small_driver_strip.py` | 5,645 B | `edab01becf3ee1a2c6543a999b47200bb0999e49659de86ed4d091d8db5205b5` |

## The joint Edgeworth continuation (codex-91d4, #436)

`sources/joint-edgeworth-2026-11-15-codex-91d4/` holds the report and proof notes (STATUS 7.5.9). The checkers stay in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/joint-edgeworth-continuation/`, because `replay.py` checks a manifest that includes the
documents; with python-flint 0.8.0 (`requirements.txt`), `python3 -I -B replay.py --output <new folder>` replays three checks and
eight rejection controls (replayed by claude-b9ee).

| file | size | SHA-256 |
|---|---:|---|
| `replay.py` | 4,844 B | `32e99ce538c02d75432b25f5f7ae442a890f134c19ab7cc394ab574317ef8d52` |
| `verify_cumulants.py` | 7,727 B | `90150c5a08d842b5b85379d45a68a9b39d5fd94ba8d19028b01df78384d813e7` |
| `verify_gaussian_reference.py` | 3,643 B | `ea926a431256c64f62286cf10a088f7ea117ff9a8dfda954cbd3677ed40856bc` |
| `verify_budget.py` | 5,644 B | `ffcf94a6b3c371e55b33748bb1499f34cf8d5684214764070e7847064937991c` |
| `MANIFEST.json` | 1,684 B | `3724c1dc51aecb35d99228d4036e234e8c3a1ed663b3e5d9976f31cc3eb546bd` |

## Small-shell regions of the odd premise (outside GPT, #436)

`sources/odd-AB-small-shell-2026-11-15/` and `code/odd-AB-small-shell-2026-11-15/` hold the whole package (STATUS 7.5.8):
three C++ checkers, their 982 recorded bounds and logs. `python3 verify_results.py` there checks coverage and every constant;
`python3 run_certificate.py --workers 8` recomputes the three certificates (about 460 s on 8 cores; claude-b9ee's recompute
matched every bound and error term). Its base checker equals `code/odd-cubic-core-2026-11-15/certify.cpp` except for the
first-line path comment. The
working copy is `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/odd-cubic-core-2026-11-15/small-shell-AB/`.

## Codex-4d8a: driver tails, joint cone and uniform local K (#436)

`sources/uniform-local-2026-11-15-codex-4d8a/` and `code/uniform-local-codex-4d8a/` hold the documents, the checkers and the
320 recorded cone bounds (STATUS 6.3.11, 7.5.6, 7.5.8, 12.8). `node run_checks.mjs` runs the quick exact checks;
`python3 matrix/run_certificate.py --workers 8` recomputes the cone certificate (about 150 s on 8 cores; matched by
claude-b9ee). Not copied, in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-4d8a-uniform-local-2026-11-15/`: `inputs/` (verbatim copies of repository
documents), and the exploratory searches `root/`, `nearstar-numerics/` and `matrix/tradeoff_probe.*`.

## Codex-c7e2, round 2: near-Gaussian K and radius bounds (#436)

`sources/round2-2026-11-15-codex-c7e2/` holds the documents and `code/round2-codex-c7e2/` the exact scripts and the two
interval certifiers (STATUS 3.6, 6.3.11, 12.8). `node replay.mjs` runs the exact checks. To replay the interval certificates,
copy the weight file below into `code/round2-codex-c7e2/remotenumerics/` and run `node replay.mjs --interval` with
python-flint installed (about 20 s; replayed by claude-b9ee). Left in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/`,
besides the numerical archives of `remotenumerics/` (`*.npz`, `*.jsonl`), `search/` and the joint obstruction runners:

| file | size | SHA-256 |
|---|---:|---|
| `remotenumerics/free_radial_weights_n7_den16.json` (input of the seven-coordinate certificate) | 708,172 B | `41c8c58bc48724e4d53cd1bc633866a9f80fabc69483ec8de03e641d7db3cde3` |
| `global/inverse_neighborhood_certificate.json` (receipt of the inverse-moment certificate) | 486,497 B | `7b999c879c06b2c3d8766da7af3ed5cbdecb92165315c8612b1d70fc98be193e` |
| `global/inverse_counterexample_certificate.json` (receipt of the older single-polynomial certificate) | 406,316 B | `37688fd826d0b582f6350bcf7e5812c54fd76464d1890f0b371f36ea3ed5c0c4` |

## Codex-c7e2, round 3: quantitative odd A/B regions (#436)

`sources/round3-2026-11-15-codex-c7e2/` holds the documents and `code/round3-codex-c7e2/` the checkers (STATUS 7.5.10).
- **Replay.** From a copy of `code/round3-codex-c7e2/`, `node replay.mjs` runs seven checks, three rejection controls and the recentred cover (600 intervals, 1,885,070 source cells, about 38 s). `python3` must be on the PATH with python-flint installed. The replay writes `replay-results/` into its own folder, so run it on a copy.
- **Reproduced.** claude-b9ee's run from this layout reproduced the cover log `odd-perturb/recentered_potential_cover.log` byte for byte.
- **Not copied.** These stay in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/`: `odd-search/` (numerical only; no theorem uses it) and two duplicate copies of the cover log.

## Codex-91d4: partial-q replacement (#436)

`sources/partial-q-2026-11-15-codex-91d4/` holds the documents (STATUS 7.5.11). The checkers stay in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/partial-q-replacement/`. There, with python-flint 0.8.0 (`requirements.txt`),
`python3 -I -B replay.py --numerics --output <new folder>` replays four checkers and thirteen rejection controls in about 2 s
(replayed by claude-b9ee). Without `--output` the replay writes into that folder.

| file | size | SHA-256 |
|---|---:|---|
| `replay.py` | 5,171 B | `d6e8003b2f2ec22cc8463c4dd2a9213bc685ab4833bc668bb769ede7ab5c8f42` |
| `verify_interpolation.py` | 7,241 B | `c65da4093fb31c73b5a29a14c69ebb3b63fd861cdb3507ae4d33bfeff84867ff` |
| `verify_reference.py` | 3,641 B | `4dfcd75469ba990de00d0ed6f2c778b834aede264598b6ba953f77a712f4184a` |
| `verify_budget.py` | 8,122 B | `4d3ed03483b959e5b6426f1301f13cc7e7c48a864736c63cadb890d812ac5d09` |
| `verify_anisotropic.py` | 4,524 B | `2ca2898046116480df867d826eb0ec9b7948ae15f2a7472224fd9f38b414f108` |
| `MANIFEST.json` | 2,435 B | `a6c7e8178d215f3776f22c50a9100fdaf2fe03df0bb27409a6dd39519107fd06` |
| `requirements.txt` | 70 B | `a4927fcd2b9a126eea20fbcaad5710c7cab31aa0a4aa76a48d9044544f72ecec` |

## Codex-4d8a: exterior consumer at ε = 299/400 (#440)

`sources/exterior-2026-11-16-codex-4d8a/` holds the documents and `code/exterior-codex-4d8a/` the checkers (STATUS 8.9–8.11,
2.12e and 2.12f).
- **Replay.** In a copy of `code/exterior-codex-4d8a/`:
  - `python3 certify_exterior_7475.py --repo <checkout>` uses the standard library only and takes about 2 s. It checks the
    row hashes, pinned at commit e9b0a45 and unchanged on master 1fdb667, and writes `exterior_7475_certificate.json`.
  - `python3 central_7475.py --verify` and `python3 certify_shoulders.py` need python-flint; 0.8.0 and 0.9.0 both pass.
  - `python3 -I my_exterior_check.py <checkout>` is claude-b9ee's independent re-implementation of 8.9; it reads the 19
    rows from the Lean files. `python3 -I my_benchmark_check.py` (numpy, scipy) recomputes the ten central benchmarks.
  - `node verify_response_constants.mjs` and `python3 -I certify_cross_gram.py` check 2.12e and 2.12f.
- **Not copied.** These stay in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/audit-4d8a/`:
  the delivery zip, with the literature batches (reading ledgers, counterexample reviews, the Guo–Fang–Lu replay), the logs
  and the numerical shoulder search output; and the exterior certificate, which the replay regenerates.

| file | size | SHA-256 |
|---|---:|---|
| `grothendieck_1402_audit_codex_4d8a.zip` | 249,975 B | `319d5b660f5f5fb7837bc2a318282d7cd99a85ac35d1032c81426bb226a4e657` |
| `existing-program/exterior_7475_certificate.json` (in the zip) | 387,195 B | `84c01aa39e7c7d621f37a5452ef0b6d23fa0b87d95f741d74a213112bbbb023a` |

## Central aligned directions (codex-a7c4, task #431)

The source and proof cover all real aligned directions of (P) (STATUS 7.4.14). The full two-shard replay
of the enclosed-midpoint source passed in run 43750845217. claude-b9ee audited its twenty region receipts:
`verify.py --combine`, `test_receipts.py`, `phase_radius.py` and `archive_receipts.py` all pass. The receipts
and results are kept in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a7c4-central-aligned-receipts-2026-11-15/`
(the two shard folders, 2.0 MB and 1.6 MB; `central-result.json`, SHA-256
`a9e57e86ca4779e3306d1898de3198c076e6f1a27c70a693bb676afbbc61afac`; `central-phase-radius.json`, SHA-256
`7e6fe7c54eb3e408772b351cf4497d02c4ea49318b4970f6736f7587d589ab0c`). The superseded run 43743242420 was cancelled
by its author after finding the midpoint-enclosure gap; its outputs are not certificates.
The working proof is `handoff/codex-a7c4-central-aligned/PROOF.md` in the author worktree.

| file | size | SHA-256 |
|---|---:|---|
| `code/central-aligned-codex-a7c4/README.md` | 3,163 B | `cfd6fccc5f38accdae216a8af10b56ed37034612ad3c3b56177c70d24395d0e2` |
| `code/central-aligned-codex-a7c4/archive_receipts.py` | 4,773 B | `397486a3b549466d6aaa8ba31b2fd14da069dd355ce253af1164112e79e281ae` |
| `code/central-aligned-codex-a7c4/base_curvature.cpp` | 3,595 B | `016088276b453263c6ca770bc5be3f9051db3d592f3a3b75151830c6285f2b34` |
| `code/central-aligned-codex-a7c4/central_integral.cpp` | 5,556 B | `8e3b17bfe5669e0f9e32ed5330bf6a4aea80f7db5c09024ef15f6ed0186b6502` |
| `code/central-aligned-codex-a7c4/jet_test.cpp` | 1,231 B | `e714e47516d3e50e9e9899a4bb218e2896535be4897aaa461f9af8d90e51b1b0` |
| `code/central-aligned-codex-a7c4/mixed_jet.hpp` | 1,782 B | `8abc217c8fa877dd6a4f3fd9024d8047a070d0c6140bbff4d267a2d1162784c4` |
| `code/central-aligned-codex-a7c4/phase_radius.py` | 3,613 B | `a821645392be8384e3c4635add45e64be667f65fe7811ce8871ec6f44596c9ee` |
| `code/central-aligned-codex-a7c4/test_receipts.py` | 5,756 B | `4cfe888f5360e9af87667c9914ffb126fb15b4ee80e59b850ca38ec98694959e` |
| `code/central-aligned-codex-a7c4/verify.py` | 18,632 B | `630d497151674c21dfd0849f0eb384d923b9e5b8e3f584a62c134edf51ffc217` |
| `sources/central-aligned-codex-a7c4/PROOF.md` | 14,466 B | `9d2218082e17bb6b125f12edb75d9e3d5d18457f58894037a374eee701ea17ad` |

## Explicit scalar Edgeworth deficit (codex-a7c4, task #446)

The paper derivation and exact arithmetic checker of ledger 3.19 are author-only.
The checker runs in under a second with the Python standard library; it does not verify
the analytic argument and is not run by CI. The working proof is
`handoff/codex-a7c4-edgeworth/PROOF.md` in
`/Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/`.

| file | size | SHA-256 |
|---|---:|---|
| `code/edgeworth-codex-a7c4/README.md` | 2,125 B | `56d8ce900928b4f53db8f55e0962db8137b553d12b66cea63e292feb6409f27a` |
| `code/edgeworth-codex-a7c4/identity_controls.py` | 3,772 B | `f05243381a5deb998c0f818df12739383f891c8a5709494dd66c3bb5a2811e5e` |
| `code/edgeworth-codex-a7c4/result.json` | 613 B | `4c822ec35391d86bd346b189a7e6d30e9dc036ec603fcc537e22a6b703a72e79` |
| `code/edgeworth-codex-a7c4/verify.py` | 3,686 B | `f1063bbbe996def08d7b42cf28cd4c25a759fe3e0b944f082bf20f2980be27c0` |
| `sources/edgeworth-codex-a7c4/PROOF.md` | 13,381 B | `8f2d478a0cd2d895a6b84d19033828a8cddda2709152c59e80dbe86778ef7dbe` |

## Doubling test and circle LP (a Claude session of the user, 16 November 2026)

`code/doubling-2026-11-16/` holds two scripts, verbatim as the user relayed them (STATUS 3.6, 3.20).
- `doubling_test.py` is a Monte Carlo test of E|(X + X′)/√2| ≥ E|X| on H₂,₁. It needs numpy and runs in about 25 s; replayed by claude-b9ee.
- `circle_lp.py` gives LP bounds from N points on a Gaussian great circle for a single chaos energy. That session found them
  too weak for K: losses of about 0.03 at degree 1 and 0.16 at degree 3, and the complex version is vacuous.

## The real third chaos and the radius review (16 November 2026)

`sources/third-chaos-2026-11-16/` holds the reports and GPT's notes; `code/third-chaos-2026-11-16/` holds the scripts
(STATUS 3.6, 3.7, 3.20, 3.21).
- **Replay.** `code/third-chaos-2026-11-16/gpt/`: `python3 -I seven_dimensional_certificate.py`,
  `python3 -I doubling_certificate.py`, `python3 -I mom3_interval_certificate.py`, and `node large3_certificate.js`,
  `node cum3_check.js`, `node edge3_check_constants.js` (all passed for claude-b9ee). The 3.7 review scripts are in
  `code/third-chaos-2026-11-16/r37-review/`; `indep_arb.py` needs python-flint.
- **Not copied.**
  - GPT's zips stay in the user's Downloads (`cubic_chaos_partial_results.zip`, `(1)`, `(2)`).
  - The radius package `grothendieck-real-stein-radius-20261021.zip` stays in
    `/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/gpt-reviews/real-stein-radius-20261021/`.
  - The numerical maximisers and logs of `R3_REPORT.md` stay in
    `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/r3-chaos/`.
- **codex-6d92 (#458; STATUS 3.21, item 95).** `sources/third-chaos-2026-11-16/codex-6d92/` holds its three issue
  comments of 16 November, copied unchanged, and `REVIEW_claude-b9ee.md`. `code/third-chaos-2026-11-16/codex-6d92/`
  holds its two exact scripts (`python3 -I laplace_obstruction.py`, standard library; `python3 -I spectral_obstruction.py`,
  sympy; both pass for claude-b9ee) and, in `review-claude-b9ee/`, two independent checks with their logs (mpmath) and
  the two replay logs. The author's other scripts and searches stay in its worktree folder
  `handoff/third-chaos-codex-6d92/`; they were not reviewed.
- **The Gaussian-bath family (STATUS 3.21 (e)).** `sources/third-chaos-2026-11-16/he3-bath-family/` holds the task of a
  Codex session (`TASK.txt`, unchanged), the proof of an outside session of the user as the user relayed it
  (`PROOF_as_pasted.md`; no other file of it exists) and the review of claude-b9ee; only the first lines of the two
  notes were added. `code/third-chaos-2026-11-16/he3-bath-family/` holds the review's checks
  (`python3 -I check_bath_family.py`: numpy, scipy, mpmath, about a minute; exact vertex arithmetic and floating-point
  checks) and their log. The originals are in
  `/Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/he3-bath-family-2026-11-16/`.

## The real third chaos: four proofs and two reviews (17 November 2026)

`sources/third-chaos-2026-11-17/` (tag TCH2; STATUS 3.8, 3.21 (e), items 104 and 105) holds verbatim copies of the
four proofs (`bath/`, `diag/`, `fourpartite/`, `harmonic/`), of the review of the two Gemini conversation logs
(`gemini-review/REVIEW.md`) and of the review of two texts of another assistant's session, with those two texts
(`he3-radial-n3/`); only their first lines were added. `code/third-chaos-2026-11-17/` holds the scripts, their logs
and the data of the certificates, byte-identical, in folders of the same names. The originals are in
`/Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/gemini-log-2026-11-17/` (the four folders and
`REVIEW.md`) and `/Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/he3-radial-n3-2026-11-17/`;
every file there is copied or listed below.
- **Links in the copies.** "This folder" in a proof is its folder under `code/third-chaos-2026-11-17/`;
  `../REVIEW.md` in `diag/PROOF_DIAGONAL.md` is `gemini-review/REVIEW.md`; `../../he3-bath-family-2026-11-16/` in
  `bath/PROOF_BATH.md` is `sources/third-chaos-2026-11-16/he3-bath-family/`; `source/gemini-chain.txt` and
  `source/gemini-rigurous.txt`, which the proofs and the review cite by line number, are the two Gemini logs (below).
- **Replay** (Python 3.12 with python-flint 0.9.0 for Arb, sympy, mpmath, numpy and scipy). The certificates and
  exact checks ran on the droplet (two numerical scripts of `fourpartite/` on the laptop); claude-b9ee replayed every
  certificate and exact check, with identical output.
  - `bath/`: `python3 -I verify_constants.py` (77 exact checks), `python3 -I certify_caseB.py` (Arb: the 172 boxes
    of Case B and the 106-box cross-check of Case C), `python3 -I numerics.py` (**N**); about a minute in all.
  - `diag/`: `run_c01.sh` writes `psi_grid.txt` and `psi_grid_contour.txt` in about 6 minutes on 4 cores. Its `cd`
    line names the droplet folder where it ran (`~/claude-b9ee-diagsum`); run it in a copy of this folder with that
    line adapted. Then `python3 -I c02_bnd.py` and `python3 -I c03_main.py` (6 s; it ends with
    ALL CHECKS PASSED). `c00_exact.py` checks the exact inputs. `SHA256SUMS` lists every other file of the folder,
    and the copies match it. `n0*_N.py` and `t01_arb_speed.py` are design numerics (**N**).
  - `fourpartite/`: `python3 -I c01_K_certify.py` (Arb, 25 s), `python3 -I c02_K_crosscheck_iv.py 10` (mpmath.iv,
    17 cells, 44 s); the `n0*.py` scripts are numerics (**N**; `n04` to `n06` import each other, so run them in this
    folder).
  - `harmonic/`: `python3 -I verify_harmonic.py` (48 exact checks, about 15 s), `python3 -I numerics_harmonic.py`
    (**N**, about 40 s).
  - `he3-radial-n3/`: `python3 -I radial_Mn.py` (mpmath; the constants M_n of 3.21 (e1), **N**).
- **Exceptions to the rules of this folder.** The logs are copied because the proofs cite them as their record.
  `diag/psi_grid.txt` (1,520,968 B) is above the 300 KB limit: it is the data of the certificate of 3.21 (e2), which
  `c03_main.py` reads and `SHA256SUMS` pins, and the record of item 104.
- **Private paths.** Every copied file was scanned for paths, links, e-mail addresses, IP addresses and tokens.
  Besides paths under `/Users/alingalatan/workspaces/grothe/handoff/` and one arXiv link, the only ones are the
  droplet folders `~/claude-b9ee-diagsum` (in `diag/run_c01.sh` and `PROOF_DIAGONAL.md`) and
  `~/claude-b9ee-fourpartite` (in `PROOF_4PARTITE.md`, which says it was deleted). Nothing was changed.
- **Not copied** (they stay under `/Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/`):
  - the two Gemini conversation logs relayed by the user, which contain local paths of the user's machine:
    `gemini-log-2026-11-17/source/gemini-chain.txt` (649,693 B, 4,545 lines, SHA-256
    `90ab2c383e6d467190d094735db1ec7b6fe3a9eda0d31c85e6e6dd8611b0c035`) and
    `gemini-log-2026-11-17/source/gemini-rigurous.txt` (69,315 B, 660 lines, SHA-256
    `32117df9935941ce7ce5965e3ea09b120ba7bb74568096912cffc95fc58aeb10`). The second was not reviewed
    (`gemini-review/REVIEW.md`).
  - `PROMPT_WEAK_BOUND_2026-11-17.txt` (6,788 B, SHA-256
    `c5d8922313f3f4e564dfe879762e4ee300a6d1af0a4adb4538c4dfd300bff3fa`): a prompt of 17 November for an outside
    session on the weak bound √(17/25) of 3.21 (a). TCH3b reviews a Gemini answer to it (next section).

| file | size | SHA-256 |
|---|---:|---|
| `sources/third-chaos-2026-11-17/bath/PROOF_BATH.md` | 24,941 B without its first line | `1ed9f7f5b685a7ad7f1cbbd3e978f3c9103e6249e472016035bc910ac97285d5` |
| `sources/third-chaos-2026-11-17/diag/PROOF_DIAGONAL.md` | 15,115 B without its first line | `c48e80fad2fa526ad32c1592443382b0540d635d1ab936fb29dc6d4b04731cbd` |
| `sources/third-chaos-2026-11-17/fourpartite/PROOF_4PARTITE.md` | 30,646 B without its first line | `0e27927db6c83e67dc5e698fd3a6536e5a7b624438cfb81f6194fff5d66b8979` |
| `sources/third-chaos-2026-11-17/harmonic/PROOF_HARMONIC.md` | 20,967 B without its first line | `33a232f267ab6777415eb554a226163c40ba5ea0f617aa79db174174e9e7c60b` |
| `sources/third-chaos-2026-11-17/gemini-review/REVIEW.md` | 5,748 B without its first line | `e086726c3629e72ecd22a848f72340bf24d789dc5f043b44cc45d9ad639cbb8d` |
| `sources/third-chaos-2026-11-17/he3-radial-n3/REVIEW_claude-b9ee.md` | 3,379 B without its first line | `6d3bcad385d73b3c1cd13fb19e2307f9a65cc59887e65a54e767777c5bedd605` |
| `sources/third-chaos-2026-11-17/he3-radial-n3/PASTE1_hjm_example31.md` | 14,634 B without its first line | `bcf29cb60af76be6bc625314ee41cd86032e7821502477c3513bc50d19dee4b2` |
| `sources/third-chaos-2026-11-17/he3-radial-n3/PASTE2_radial_n3.md` | 41,968 B without its first line | `e92adbdc453f9c98b80ff979513d5a2364dd9f207845ee956998b1895a1bef9a` |
| `code/third-chaos-2026-11-17/bath/verify_constants.py` | 14,936 B | `92cae0101fccb73c92d6876a1ef6aad3d73367ad4e1307e08a9334dc21eb71a6` |
| `code/third-chaos-2026-11-17/bath/verify_constants.log` | 5,970 B | `b185e6928259c4fbc2ad6383a5ee69eb4ac86d752a42884c8857d3c46563740d` |
| `code/third-chaos-2026-11-17/bath/certify_caseB.py` | 6,295 B | `41d357d3e2a026a788e7c7ad0dabdbca9994021729425ebd91d37cfca42c0d3a` |
| `code/third-chaos-2026-11-17/bath/certify_caseB.log` | 36,593 B | `6423c148f58a8920ddb6083a15626806341c46a491d7d95022b1929175fc5f87` |
| `code/third-chaos-2026-11-17/diag/SHA256SUMS` (the hashes of the other 24 files of the folder) | 1,966 B | `44fa0961e58581db148a9742eabd3b6e6a54ca84a824e5bb1edc77eaabca70f4` |
| `code/third-chaos-2026-11-17/diag/psi_grid.txt` | 1,520,968 B | `4f37d3a852b890d786324f81dba098218dda4e6dcd6d1b45c5a8db74d125f491` |
| `code/third-chaos-2026-11-17/fourpartite/c01_K_certify.py` | 7,619 B | `32e1ee1edba39c8a148ef1335f426fc81e6d7b32897c2ca8e779cc6867a4b522` |
| `code/third-chaos-2026-11-17/fourpartite/c01_K_certify.log` | 13,016 B | `3a9169704a179e8fc6d3b76b6f8631f3ec3f643c3eb3e9e0d2dd2c20ff032f79` |
| `code/third-chaos-2026-11-17/fourpartite/c02_K_crosscheck_iv.py` | 3,260 B | `a92e9eada336f7fdf5ff5b33c53e7ceafe57d5313f455eaf617b92825285afa8` |
| `code/third-chaos-2026-11-17/fourpartite/c02_K_crosscheck_iv.log` | 2,011 B | `176b8c52c8ce9118ab9f140e5fe3d0e926f0af0cf7ccbcfef2cc06df8a2c1e7a` |
| `code/third-chaos-2026-11-17/harmonic/verify_harmonic.py` | 13,195 B | `d29c338f6c82cf50e4762343116e0b7ebd5209ab3f41cd3c492760602f061b0c` |
| `code/third-chaos-2026-11-17/harmonic/verify_harmonic.log` | 5,097 B | `c001e11273f4b34b91ca4a9d90b2debaeb39fba9ed7f1caa3a11b0a5a5022b2c` |
| `code/third-chaos-2026-11-17/he3-radial-n3/radial_Mn.py` | 2,155 B | `11f83ff03042993d8eee3696c0c0c088b0844447126f3980d32175f521be45f2` |
| `code/third-chaos-2026-11-17/he3-radial-n3/radial_Mn.log` | 829 B | `d81539f9a3ae1873817e73eeef2e6b6108862e013cc4d7e9c650b717018e198c` |

## The real third chaos, second batch: the HJM note, the weak target and Ω₃ (17 November 2026)

Three more folders of `sources/third-chaos-2026-11-17/` (tags TCH3a, TCH3b and TCH3c; STATUS 3.8, 3.21 (e), items 104
and 106), copied in the same way: one first line added to each document, and the scripts and logs byte-identical under
`code/third-chaos-2026-11-17/`, in folders of the same names. The originals are in `hjm-note-2026-11-17/`,
`gemini-weak-2026-11-17/` and `omega3-2026-11-17/` under
`/Users/alingalatan/workspaces/grothe/handoff/research-third-chaos/`; every file there is copied or listed below.
- **TCH3a, `hjm-note/HJM_Example3.1_d2_d3.md`.** A consolidation note on Example 3.1 of arXiv:2610.10477 for d = 2 and
  3, written by an outside assistant session of the user and supplied on 17 November 2026 at about 06:00. It
  consolidates Gemini material (two logs, attachments A to C and several expositions; only the two logs exist here, as
  the previous section says) and audits it in its §7. Its §6 Gap 3 calls the diagonal sums, the Gaussian-bath family
  and the 4-partite cubics unproved: the note predates STATUS 3.21 (e2), (e5) and (e6), which prove them, so this is
  not an error. `code/third-chaos-2026-11-17/hjm-note/` holds its two scripts and, in `runs_yo/`, claude-b9ee's
  re-runs of them on the droplet:
  - `python3 -I certify_d2.py` (numpy, scipy, mpmath; all cores, 87 s there) is the certificate of Theorem 4.7 and
    ends with CERTIFIED. `runs_yo/certify.log`: 5,053 cells, smallest lower bound 8.55·10⁻⁸, no failures. The note
    says 5,059 cells: its adaptive first phase depends on library versions, and every final cell is checked by the
    rigorous bound. IEEE double with a slack of 10⁻⁹, not interval arithmetic.
  - `python3 -I certify_d2.py --soundness` compares the bound with the true integral at 40 random spectra
    (`runs_yo/sound.log`: no violation, smallest difference 0.0182).
  - `python3 -I verify_example31.py` (numpy, scipy; one to two minutes) recomputes the numbers of the note in double
    precision (`runs_yo/verify.log`; every number matches the note).
- **TCH3b, `gemini-weak/REVIEW.md`.** claude-b9ee's review of a Gemini answer to the prompt
  `PROMPT_WEAK_BOUND_2026-11-17.txt` of the previous section. The user pasted the answer into the session of
  claude-b9ee on 17 November 2026; it is not kept, and REVIEW.md records its claims with their true values.
  `code/third-chaos-2026-11-17/gemini-weak/checks/` holds the five checks of the review (mpmath, numpy, scipy;
  `python3 -I <name>.py`, and `lp_circle.py` takes the degree and the numbers of points, for example
  `python3 -I lp_circle.py 3 7 9 11`). They have no logs.
- **TCH3c, `omega3/README.md`.** claude-b9ee's re-derivation of Gemini's martingale–isoperimetric bound (17 November
  2026, 06:17), with the quadrature for h₃ in one variable in `code/third-chaos-2026-11-17/omega3/`
  (`python3 -I h3_R.py`, numpy and scipy; its output is `h3_R.log`). Another worker will add a report and scripts to
  the handoff folder later; this copy holds the three files that were there at 06:19, and the ledger cites none of the
  later ones.
- **Logs.** The three logs of `runs_yo/` and `h3_R.log` are copied because the ledger cites them as records (STATUS
  3.8 and 3.21 (e)).
- **Private paths.** The three folders were scanned as in the previous section: no path, link, e-mail address, IP
  address or token.
- **Not copied:** the two `SHA256SUMS` files of the handoff folders (511 B and 494 B). The documents moved to
  `sources/` with a first line added, so the lists no longer match the layout; their hashes are those of the table.

| file | size | SHA-256 |
|---|---:|---|
| `sources/third-chaos-2026-11-17/hjm-note/HJM_Example3.1_d2_d3.md` | 51,160 B without its first line | `0113cb0690e11ce8e8690667f1b6b1531f5049b48f9fafd9b2015f4800b19a17` |
| `sources/third-chaos-2026-11-17/gemini-weak/REVIEW.md` | 4,268 B without its first line | `5f95aa510f54d7af6e10bbf6fc20fa60763e792d98c36d9aca1c6c2299be44de` |
| `code/third-chaos-2026-11-17/hjm-note/certify_d2.py` | 10,018 B | `df244d6c07a1b8bb8d13173efd1885db7fbc6d86b5cfe3cbe24954810d3eae0e` |
| `code/third-chaos-2026-11-17/hjm-note/verify_example31.py` | 6,677 B | `877f3472a014d7fcea1c08c26d281985392f73d9a7b433212c9681559ab169e3` |
| `code/third-chaos-2026-11-17/hjm-note/runs_yo/certify.log` | 6,108 B | `90be7291f9ef8f2e26e7cd1cc75fbf0a6a6dc1d574f16f295b51d030aff0da08` |
| `code/third-chaos-2026-11-17/hjm-note/runs_yo/sound.log` | 2,136 B | `c1f77967e524d083e7cf88e8dfdee038fbafc30c454183362aa80aeaffe7ee68` |
| `code/third-chaos-2026-11-17/hjm-note/runs_yo/verify.log` | 2,125 B | `0eba0666eb2ee46be23ec90e7ad5c197da1efdae695c802ed2b6de4386667cbe` |
| `code/third-chaos-2026-11-17/gemini-weak/checks/check1.py` | 1,738 B | `6f65ca572d2b98e98c6513b48aa6664fea5a320439afea03a5174fe1a4288a7f` |
| `code/third-chaos-2026-11-17/gemini-weak/checks/check2.py` | 1,432 B | `6bc8b8e1085e3ab65647e8e3bf449858b4cb3bed5f21c50cd733d9e6744b5b3b` |
| `code/third-chaos-2026-11-17/gemini-weak/checks/check3.py` | 1,426 B | `89f05b517f8e9b55bd8974a5bbee378d390996995e1dffaf58c3832dfdb7da5c` |
| `code/third-chaos-2026-11-17/gemini-weak/checks/check4.py` | 853 B | `947129dc01bb94e257b684fb19bc4e6ecfceb0ce9a5628e25a4bd48842fab353` |
| `code/third-chaos-2026-11-17/gemini-weak/checks/lp_circle.py` | 1,882 B | `c6766f68fdca54b6f4209e8fc3b65f395c845ca1bec02e17945ca1a79eed52d1` |
| `sources/third-chaos-2026-11-17/omega3/README.md` | 1,281 B without its first line | `45c68c55a676d30856289845dcfd5f0b8cf68506ec24ed6462017567ec81f30e` |
| `code/third-chaos-2026-11-17/omega3/h3_R.py` | 1,683 B | `8cb120208cf54f57b862645920c2ccfa015bd0addf6809f3d9c38a112207b513` |
| `code/third-chaos-2026-11-17/omega3/h3_R.log` | 201 B | `6a116f65d5385e624b49687cfb30b410d80d9aa3a51d122fe5ddc337ab62b8b0` |

## Codex-a786: phase symmetry and content (16 November 2026)

`sources/phase-content-2026-11-16-codex-a786/` holds the documents and `code/phase-content-codex-a786/` the checkers
(STATUS 11.31a, 11.56–11.58, item 90).
- **Replay.** From a copy of the code folder: `node replay.mjs`, with `PHASE_CONTENT_PYTHON` set to a Python that has
  python-flint (0.8.0 and 0.9.0 both pass). It runs the exact checks and three interval certificates: 111, 120 and 240 boxes.
  `upstream/` holds the delivery's copies of two checkers of `code/tilted-sector-2026-11-15/`, identical up to one comment line.
- **Replayed by claude-b9ee.** The exact output is identical to the delivered `results/exact.json`.
- **Not copied.** The zip (95,027 B), the replay logs `results/*.jsonl` and claude-b9ee's replay outputs stay in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-phase-content-2026-11-16/`.

## Interpolation and literature audit (codex-a7c4, task #464)

The notes are copied from `/Users/alingalatan/workspaces/grothe-codex-a7c4-interpolation-literature/handoff/interpolation-literature-codex-a7c4/`, dated 16 November 2026. Only their provenance headers were added. The checker and result are byte-identical copies. The report links the primary literature; its accompanying identity and book corollary were re-derived by claude-b9ee in #465, and the universal sign remains open.

| file | size | SHA-256 |
|---|---:|---|
| `sources/interpolation-literature-codex-a7c4/REPORT.md` | 23,046 B without its first line | `6e1f2f05d9ea7a1c44b9e6d35b28727cee3cbaea909c2f381899ceaa69eb2cdb` |
| `sources/interpolation-literature-codex-a7c4/DEFICIT_IDENTITY.md` | 9,230 B without its first line | `cb2040b299a5993f117ebf70591e6c39e43e76cddd5d3f1fee5ad92b28e995e2` |
| `sources/interpolation-literature-codex-a7c4/BOOK_NOTES.md` | 6,903 B without its first line | `b46c60b0db30fe985c52ed603e9fec3872c99e26df6d2b3f852e4b9b9b196912` |
| `code/interpolation-literature-codex-a7c4/check_identity.py` | 7,753 B | `74b9121171690310c3274e3f4316a53b0c1aca57196849e2ffb1307545e92448` |
| `code/interpolation-literature-codex-a7c4/identity_controls.json` | 3,821 B | `a9906658fa3b7eaf552c42b43299c0146fcd63a1dc24fd54e952cf0bbc94039e` |

The author PDF used to inspect the exponents of Raghavendra–Steurer is not committed: `papers/raghavendra-steurer.pdf` in that working directory, 328,396 B, SHA-256 `623bf225425245c738b73d0b22feaa3a8b1444956a8085dbe6326582da871da4`. Downloaded from <https://www.dsteurer.org/paper/grothendieck.pdf>. Its text extraction and two page renders are disposable inspection files. No build, cloud job, or binary artifact is part of this research record.

The Nourdin–Peccati book (Cambridge, 2012) was inspected using the user-supplied copy (not in the repository); 1,221,289 B, SHA-256 `dc30ba3537634dc9411750d717629d242d564457229e429cd687f1c46caa464d`. Neither the PDF nor its text extraction or page render is committed; only original reading notes and the derived estimate are included. Printed page p is PDF page p+16 in this copy.

## Antiholomorphic Stein calculus (a Claude session of the user, 16 November 2026)

`sources/antiholomorphic-stein-2026-11-16/` holds the delivery's `README.md` and `NOTE.md` and the independent `REVIEW.md`;
`code/antiholomorphic-stein-2026-11-16/` holds the scripts (STATUS 6.3.20–6.3.25, the KAS row of §9, item 91). The three
documents are verbatim copies; only their first lines were added. The delivery's README states its results before the
review: read it with `REVIEW.md` §7, whose findings the ledger rows follow.
- **Replay.** `python3 -I scripts/check_identities_exact.py` (standard library, 2 s) runs the exact checks. `run_all.sh`
  replays the numerics (numpy, scipy; about one hour, the two surveys dominate); its scripts import each other from
  `numerics/`, so they do not run under `-I`. The review worker replayed all of it.
- **`review/`** holds four scripts of the review: `exact_check.py` (its own exact check with sympy, 80 s),
  `indep.py` (its own model of the peak profiles), `eval_o1.py <folder of indep.py>` and `t3_mono_mp.py` (mpmath).
- **Not copied.** The zip (35,108 B), the delivery's logs and the rest of the review's scripts and logs stay in the local
  folder `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/antiholomorphic-stein-2026-11-17/` (the folder's
  name carries the wrong day; the delivery and the review are of 16 November).

## Codex-a786: the Malliavin addendum and the Clifford cubic (16 November 2026)

`sources/malliavin-addendum-2026-11-16-codex-a786/` holds the delivery's four documents and `REVIEW_claude-b9ee.md`;
`code/malliavin-addendum-codex-a786/` holds the checkers (STATUS 11.59, 11.60, item 90; a sentence in 6.3.22). The
documents are verbatim copies; only their first lines were added. `BOOK_NOTES.md` is the author's own reading notes on
Nourdin–Peccati's book; no text of the book is included.
- **Replay.** `node verify.mjs` (Node.js 20 or later, no packages, under a second) reproduces `result.json` exactly.
- **Second method.** `python3 -I clifford_check.py` (standard library, under a second) is claude-b9ee's independent
  check: exact Wick calculus on the 64 monomials of the cubic, without the trace-cumulant formula and without the law R·W.
- **Not copied.** The zip (16,740 B), `SOURCES.json` (it carries an identifier of the author's uploaded copy of the book)
  and the replay outputs stay in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-malliavin-addendum-2026-11-16/`.

## Signed cumulant remainder (codex-a7c4, task #467)

The notes are verbatim copies, apart from provenance headers, from `/Users/alingalatan/workspaces/grothe-codex-a7c4-cumulant-remainder/handoff/codex-a7c4-cumulant-remainder`, dated 16 November 2026. The code and outputs are byte-identical copies. The packet was reviewed in #468 (re-derived by claude-b9ee and a review worker; both scripts replayed), and its inherited two-step identity in #445. No binary files, cloud jobs, Lean builds or external runtime dependencies are required.

| file | size | SHA-256 of original |
|---|---:|---|
| `sources/cumulant-remainder-codex-a7c4/PROOF.md` | 12,728 B without provenance header | `08f40cfaffb5472b64907dc7ea68f4333273319dab21b3de374ca6d07dad9c29` |
| `sources/cumulant-remainder-codex-a7c4/JOINT_INTERFACE.md` | 2,812 B without provenance header | `22312e0c0c1bc9375fa40bdf0a6e6dbee374c45c3d0fa2ef0355572478ac8d97` |
| `code/cumulant-remainder-codex-a7c4/verify.py` | 6,894 B | `3117384738d6490f08bfa2c8487b6b99c251994f3516d4dafc80eb1f20e3fd96` |
| `code/cumulant-remainder-codex-a7c4/constants.json` | 2,464 B | `d521288d80a2b6aa6b19b10c1c716aebcbed9d041a4e0d8e9ae8a6db2425f470` |
| `code/cumulant-remainder-codex-a7c4/joint_controls.py` | 7,129 B | `7282fbe3e0c5173158ee13a42ffc0fbf28b1d666718b2a083f4be78e4db17615` |
| `code/cumulant-remainder-codex-a7c4/joint_controls.json` | 1,211 B | `22b5bda40a0f3974c859872985994f1c7389389c31a470d1d20619f21ee3d0cc` |

Replay: run the two commands in the packet README. `verify.py` checks all rational premises and whole-interval Bernstein coefficients; `joint_controls.py` independently compares moment and ordered Malliavin joint cumulants and checks the spectral products on a shared-field cubic. The outputs match the archived JSON files. These checks do not replace analytic review and are not run by CI.

## Codex-91d4: the joint Malliavin refinement of the partial-q replacement (#436)

`sources/np-joint-2026-11-16-codex-91d4/` holds the documents (`README.md`, `REPORT.md`, `PROOF_NOTES.md`,
`BOOK_APPLICATION.md`) and the independent review `REVIEW_claude-b9ee.md` (STATUS 7.5.11). They are verbatim copies; only
their first lines were added.
- **Checkers.** They stay in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/np-joint-refinement-2026-11-16/`,
  because `replay.py` checks a manifest that includes the documents. With python-flint 0.8.0: four checkers and fourteen
  rejection controls, about 10 s. The review worker replayed them; the eight outputs are byte-identical to the delivered ones.
- **The review** and its scripts (its own certificate of the eight prices on the whole interval, and an Arb cell cover of
  the uniform budget that does not use the concavity argument) are in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/review-np-joint-2026-11-16/`.
- **Two notes on the delivery's own records** (review §6): `PEER_REVIEW_RECEIPT.json` records an earlier text of
  `PROOF_NOTES.md` than the delivered one, and three of the fourteen rejection controls only compare fixed constants.

## The sign of the deficit (a research worker of claude-b9ee, 16 November 2026)

`sources/deficit-sign-2026-11-16/` holds the worker's `REPORT.md` and `REVIEW_claude-b9ee.md` (STATUS 3.23–3.26, 6.3.26,
items 92–94, tag KDS). They are verbatim copies; only their first lines were added. `code/deficit-sign-2026-11-16/`
holds the scripts, their small result files and their logs.
- **Logs.** The 35 `.log` files (the largest is 6,412 B) are kept because the report cites them as its record; two warning
  lines of `t01_zfamily.log` carry the original folder path.
- **Replay.** `python3 -I x01_exact_identities.py` (standard library, about 3 minutes) and `python3 -I x02_exact_lowchaos.py`
  (25 s) run the exact checks; claude-b9ee replayed both, with logs identical to the delivered ones. The numerical
  scripts need NumPy and SciPy and are run from their folder, one thread each
  (`OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 python3 -I <script>`); they were not rerun.
- **`review-claude-b9ee/`** holds `t2_witness_check.py`, an independent evaluation of the split of 6.3.24 and of the
  rotation identity on the witness of item 92, with its log.
- **Not committed** (binaries), in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/deficit-sign-2026-11-16/`:

| file | size | SHA-256 | what |
|---|---|---|---|
| `tab_peak.npz` | 80,354 B | `a8a3cd855af72048382cdc71f9c20ae92bc92dc1c43c4ec328c2203de3dd7d2e` | the peak-profile table read by `dslib.peak_profile`; produced by `code/antiholomorphic-stein-2026-11-16/numerics/tab.py` |
| `hess_n3_wxy_peak0.0463.npy` | 10,496 B | `426f460c56142d0f89f68e87f2cde7238789d126c0954c5ddd740e3ede23062b` | Hessian of T₂ at conj(W)·X·Y, peak profile (written by `t05_hessian_n3.py`) |
| `hess_n3_wx2y2_peak0.0463.npy` | 10,496 B | `ce0bc6182750779766a6ff9d9bb4759a9a39a42e185d7864755ff332a9fd841a` | Hessian of T₂ at conj(W)·(X² + Y²), peak profile (written by `t05_hessian_n3.py`) |

## Codex-a786: the content-law inequality on a structured class (16 November 2026)

`sources/content-law-2026-11-16-codex-a786/` holds the delivery's documents (`README.md`, `PROOFS.md`,
`SCALAR_REDUCTION.md`, `AUDIT.md`, `LEDGER_PATCH.md`, `SOURCES.md`) and the independent `REVIEW.md` (STATUS
6.3.27–6.3.29, tag KCL; `../higher-degree/STATUS.md` 4.20). They are verbatim copies; only their first lines were added.
The delivery's ledger patch and README are read through the review: its §7 lists three required corrections (a
misprinted "+" in (29a) among them), and the ledger rows follow its §6.
- **Checker.** `code/content-law-codex-a786/`: `node verify.mjs` (Node 20 or later, no dependencies) reproduces
  `results_exact.json` byte for byte. `SHA256SUMS` is the delivery's; its entries for the six documents refer to the
  files without the added first line.
- **Review scripts.** `code/content-law-codex-a786/review/scripts/` (16 files; `python3 -I`, one process, about five
  minutes in all; `REVIEW.md` §9 says what each does) and `review/logs/` (the 18 logs of at most 10 KB, kept because the
  review cites them as its record). The scripts read the degree-5 study's folder
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/`.
- **Not committed**, in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-2026-11-16/`:
  the zip `conjecture_k_content_law_codex_a786.zip` (22,912 B, SHA-256
  `2d8fc12b38d47dd50fffc19b4a2c2e0da1c42b74510ea7d8e7692f0bc2ec0ac3`), the profile tables `review/data/*.npz` (12 files), and the larger logs:

| file | size | SHA-256 |
|---|---|---|
| `review/logs/content_ratio_hp.json` | 269,142 B | `6f803b2760482bf5c59606a9a7fe18aa8377bfbf8382bf4c3cae13480ef303e9` |
| `review/logs/content_ratio_hp.log` | 67,141 B | `a048c99d7b57d5da331417bcb52bb2422fb3202e4e1ef71dacb6203b79f06cde` |
| `review/logs/content_ratio_hp_fine.json` | 269,299 B | `1f08eb109287a56550592847eaa35fb1eec362b9280b08b4abaed55dc90ed191` |
| `review/logs/content_ratio_hp_fine.log` | 67,144 B | `d75f7c9adfa2ae7e1e0f0eb3d3be2d9b34aa54a99ad6e91a1526b8827dee7101` |
| `review/logs/content_ratio_stored.json` | 269,144 B | `d17f8bedaf071a8dc99f383bfe1df37b190cdd67e61d8212e8fe91d5e50a03df` |
| `review/logs/content_ratio_stored.log` | 67,248 B | `4fc3674c206c251d04ac8b71339255edd822b9216c0f97eb4f4bd1f2fcd89acb` |
| `review/logs/results_exact.delivered.json` | 5,343 B | `16a0a1ba7076e3cd2697f30df20964c2257ee829007a3691a75b3fed3a7b4a7e` |
| `review/logs/uscan.json` | 55,848 B | `a6cda850eb64a395997963190bd0ac938ee56cd7fc06411a6d982de332a8dd84` |

## The signed-pairing content-law package (a GPT session of the user, 16 November 2026)

`sources/signed-pairing-2026-11-16-gpt/` holds the delivery's documents (`README.md`, `PROOFS.md`, `CERTIFICATES.md`,
`LEDGER_ADDITIONS.md`) and the independent `REVIEW.md` (STATUS 6.3.30, tag SPAIR; `../higher-degree/STATUS.md`
4.21–4.24). They are verbatim copies; only their first lines were added. Read the delivery through the review: its §9
lists five required corrections of wording (the bulk result is a limit model; "an infinite-dimensional family" is one
cubic per m), and the ledger rows follow its §8.
- **Checkers.** `code/signed-pairing-gpt/scripts/`: `node verify_gamma_exact.mjs` and `node verify_exact.mjs` (Node 20
  or later) and `python3 certify_gamma.py` (python-flint). `verify_exact.mjs` reads `results/certificate.json`, which is
  not committed (below); `build_certificate.py` and `variational_probe.py` are the proposal step that wrote it (NumPy,
  SciPy). The review worker replayed all three checkers, the Arb one with python-flint 0.8.0 on a rented droplet;
  the outputs are byte-identical to the delivered ones. `MANIFEST.sha256` is the delivery's; its entries for the four
  documents refer to the files without the added first line.
- **Review scripts.** `code/signed-pairing-gpt/review/scripts/` (18 files; `siglib.py` is their library) and
  `review/logs/` (22 logs of at most 13 KB, kept because the review cites them as its record). `cert_check.py` is the
  reviewer's own exact checker of the 121 cells; `null_highdeg.py` tests the 400 Wick controls at higher degree.
- **Not committed**, in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-signed-pairing-2026-11-16/`:
  the zip `content_law_signed_pairing_20261116.zip` (569,629 B, SHA-256 `a8ce64c450f9349e8ec58ef1b81d1dd9c6f6ec6baf8fb65c9595bf4925df3f4c`), the reviewer's
  `review/data/`, and:

| file | size | SHA-256 |
|---|---|---|
| `package/results/certificate.json` | 1,195,938 B | `b6b1c91aa78896312c1c97fbca8ff33070292b639e37adc7ac0b59e8cd97c08c` |
| `review/logs/rows_ratio.log` | 19,924 B | `d4f19664c15774e2923625b212cdf760c48da91d624eec029ad5f32d0e759dca` |
| `review/logs/rows_ratio_quick.log` | 19,923 B | `b493e54f82eeb0aa9d179d7f8374d7ee49ed588d465616f4da6e05d687914457` |

## The radius certificate ρ* ≤ 0.9359 (a GPT session of the user, 16 November 2026)

`sources/radius-9359-2026-11-16-gpt/` holds the delivery's `README.md` and `REVIEW_claude-b9ee.md` (STATUS 3.7, tag
KRAD). They are verbatim copies; only their first lines were added. `code/radius-9359-gpt/` holds the certificates and
the verifiers.
- **Replay.** `node verify.mjs`, `python3 -I verify.py certificates.json` and `python3 verify_examples.py` (standard
  library; under one second each; `verify_examples.py` imports `verify.py` from its folder). `verification.txt` is the
  delivery's record; `SHA256SUMS` is the delivery's, and its entry for `README.md` refers to the file without the added
  first line.
- **Independent verifier.** `review-claude-b9ee/own_verifier.py certificates.json` (standard library, 0.2 s), written
  from the README's §§5–6 without reading the delivered verifiers, and `negative_controls.py`; their logs and the three
  replay logs are beside them.
- **Not part of the proof.** `discover.py` is the numerical search that produced the certificates (NumPy, SciPy and a
  conic solver; `requirements-discovery.txt`); it was not run.
- **Not committed:** the zip `cubic_l1_rho_0_9359.zip` (30,227 B, SHA-256 `8d8358d33c3730df2af92562d6a63eced8bba38542824d13e69e3a33a9e4b66b`), in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-radius-9359-2026-11-16/`.

## The influence calculus (a Claude session of the user, 16 November 2026, two versions)

`sources/influence-calculus-2026-11-16/` holds the second version of the delivery (`README.md`, `NOTE2.md`,
`ADDENDUM.md`, `LITERATURE.md`) and the independent `REVIEW.md`, which covers both versions (STATUS 3.27,
6.3.31–6.3.35, items 96–98, tag KIC; `../higher-degree/STATUS.md` 4.25–4.26). They are verbatim copies; only their
first lines were added. The second version contains the first with its corrections marked; read both through the
review, whose §6 lists what the delivery overstates (F3–F7).
- **Replay.** `code/influence-calculus-2026-11-16/`: `python3 -I scripts/check_influence_exact.py`,
  `scripts/check_stein_energy_exact.py`, `scripts/check_fourth.py`, `scripts/check_sixth_moment.py` (standard library;
  the scripts import `wick_exact.py` from their folder, so run them from a copy without `-I` or with the folder on the
  path). `run_all.sh` replays the numerics (NumPy, SciPy), which read the peak-profile table produced by
  `../antiholomorphic-stein-2026-11-16/numerics/tab.py`. `results/` holds the delivery's logs, kept because the note
  cites them. The review worker replayed everything: identical logs, or noise in the last digit.
- **`review/`** holds the reviewer's own exact Wick code (`exact_wickbasis.py`), its numerics (`own_numerics.py`,
  `own_lawlevel.py`, `own_scan.py`, `own_v2.py`, `small_checks.py`), the replay drivers and their logs.
- **Not committed**, in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/influence-calculus-2026-11-16/`: the two zips
  (`conjecture-K-influence-calculus.zip`, 41,742 B, SHA-256 `eaa4f0b5227a7c856cd1c43ee58745c4f89c4ae90f701ee9f2f43898af4a9540`;
  `conjecture-K-influence-calculus-v2.zip`, 65,469 B, SHA-256 `f601c453f909fae575599c4ffa04c9fdb73fb06e55da40c18651cf14786459d5`), the first version as
  delivered (`package/`), the replay logs (`review/replay-logs/`), and:

| file | size | SHA-256 |
|---|---|---|
| `review/tab_reviewer.npz` | 122,118 B | `44d1b330464d652acaaaec713cc158932beb508b8635cdb4e704758f2d8b760d` |

## The radius certificates ρ* ≤ 0.93 and ρ* ≤ 0.9387 (a research worker of claude-b9ee, 16 November 2026)

`sources/radius-relaxation-2026-11-16/REVIEW.md` is the independent review (STATUS 3.7, tag KRR), a verbatim copy with
one comment line added. `code/radius-relaxation/` holds the certificates and the scripts.
- **The certificates.** `cert_G_final.json` (0.9387, Lean inputs only). The certificate of 0.93 is 573,042 B and is
  kept as one file per row in `cert_N_final/`; `python3 -I join_cert_N.py` rebuilds `cert_N_final.json` and checks its
  SHA-256 `fb7d22b8bf268bc2960d5f5ffa522d0dddf8b4daa6a95110afd8a13ba321df44`.
- **Replay.** `python3 -I verify_cert.py cert_N_final.json` and `python3 -I verify_cert.py cert_G_final.json`
  (standard library, exact rationals, a few seconds each); the docstring of `verify_cert.py` states the theorem, the
  inputs with their Lean names and the proof that a verified row gives the bound. `check_budgets_exact.py` checks the
  second-moment identities on exact cubics; `test_verifier.py` holds the verifier's own tests.
- **Independent verifier.** `review-worker/own_verifier.py CERT.json` (Bernstein subdivision; written from the
  statement), with `own_wick.py`, `own_identities.py` (the Lean definitions transcribed and checked on 22 exact
  tensors), `negative_controls.py`, `differential.py`, `validate_cubics.py`, `compare_9359.py` and their logs;
  `endpoint_bounds.log` lists the bound of every row at both ends of its s-interval.
- **Generators and the combination.** The other scripts are the search and the construction of the certificates
  (they need NumPy and a conic solver and were not replayed by the reviewer); `combo_scan.py`, `combo_law.py`,
  `hermite_tests.py` and `logs/` are the numerical combination with the constraints of the outside certificates
  (about 0.9286, **N**).
- **Not committed:** the intermediate certificates, laws and scans, in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/radius-relaxation-2026-11-16/results/`.

## The content law on independent blocks (codex-a786, second delivery)

`sources/content-law-blocks-2026-11-16-codex-a786/` holds verbatim copies of the delivery's notes and of the independent review (tag KCB); only their
first lines were added. `code/content-law-blocks-codex-a786/` holds the delivered verifier with its result files, and the reviewer's scripts
and logs in `review-worker/`.
- **Replay.** `node verify.mjs` and `node certify_phase.mjs` reproduce `results_exact.json` and `phase_intervals.json`.
- **Not committed:** the zip `conjecture_k_content_law_blocks_codex_a786.zip` (39,372 B, SHA-256 `13f16b9a7e7c0089d940b4696db1f5abf5c310155db9838c32ca9b7342a4e149`), in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-content-law-blocks-2026-11-16/`; the delivery's reading notes and source manifest are not copied.

## Shared factors and the three-derivative bound (GPT, second content-law delivery)

`sources/shared-factors-2026-11-16-gpt/` holds verbatim copies of the delivery's notes and of the independent review (tag SFAC); only their
first lines were added. `code/shared-factors-gpt/` holds the delivered verifier with its result files, and the reviewer's scripts
and logs in `review-worker/`.
- **Replay.** `node scripts/verify.mjs`, run in that folder, reproduces `results/replay.json`.
- **Not committed:** the zip `content_law_shared_factors_20261116.zip` (15,859 B, SHA-256 `b97885cd4f2e763e955498dab27dd5e914f30bf958d9adc2d8bf123eabfabeed`), in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-shared-factors-2026-11-16/`; the delivery's reading notes and source manifest are not copied.

## Finite reduction and the shared bulk (GPT, third content-law delivery)

`sources/finite-reduction-2026-11-16-gpt/` holds verbatim copies of the delivery's notes and of the independent review (tag KFR); only their
first lines were added. `code/finite-reduction-gpt/` holds the delivered verifier with its result files, and the reviewer's scripts
and logs in `review-worker/`.
- **Replay.** `node scripts/verify.mjs`, run in that folder, reproduces `results/replay.json`.
- **Not committed:** the zip `content_law_finite_reduction_20261116.zip` (16,630 B, SHA-256 `528630828566275121c49a635215527c88542f63795f2005844d69e383e612fc`), in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-finite-reduction-2026-11-16/`; the delivery's reading notes and source manifest are not copied.

## Shared matrix blocks and the tangent obstruction (codex-a786, third delivery)

`sources/shared-trace-2026-11-16-codex-a786/` holds verbatim copies of the delivery's notes and of the independent review (tag KST); only their
first lines were added. `code/shared-trace-codex-a786/` holds the delivered verifier with its result files, and the reviewer's scripts
and logs in `review-worker/`.
- **Replay.** `node scripts/verify.mjs`, run in that folder, reproduces `results/replay.json`; its line 60 checks the algebra of the misprinted display (20) of `PROOFS.md` (the review, §2).
- **Not committed:** the zip `content_law_shared_trace_and_phase_obstruction_20261116.zip` (31,228 B, SHA-256 `456fa2a3dd0a4b7ff5dd511113467fa784d27803f565fa57d3cc6e004f8afa9f`), in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-a786-shared-trace-2026-11-16/`; the delivery's reading notes and source manifest are not copied.

## The radius certificate ρ* ≤ 0.93462 (GPT, second radius delivery)

`sources/radius-93462-2026-11-16-gpt/` holds verbatim copies of the delivery's notes and of the independent review (tag KRG); only their
first lines were added. `code/radius-93462-gpt/` holds the delivered verifier with its result files, and the reviewer's scripts
and logs in `review-worker/`.
- **Replay.** `node verify.mjs`, `python3 -I verify.py certificates.json`, `python3 -I verify_identities.py`, `python3 -I negative_controls.py` (standard library); `discover.py` is the numerical search and was not run.
- **Not committed:** the zip `cubic_l1_rho_0_93462.zip` (57,384 B, SHA-256 `f4e52b13fe6d4871d34557d1ac587e703b721483eaa4d5552c305f2b22ce11f5`), in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-radius-93462-2026-11-16/`; the delivery's reading notes and source manifest are not copied.

## Codex-91d4: A/B contents and joint-secant regions (task #426)

`sources/ab-sector-2026-11-15-codex-91d4/` holds the notes of both phases and the independent review
`REVIEW_claude-b9ee.md` (STATUS 7.1.8, 7.4.15, 11.61, 11.62, item 103; tag KAB). The notes are verbatim copies with only
their first lines added; the two `MANIFEST.json` files are unchanged copies and record the SHA-256 of every delivered
file, the notes as delivered included.
- **Checkers.** They stay in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/`,
  because both `verify.py` check manifests that include the documents. With Python 3.12, python-flint and a C++17
  compiler, `python3 -I verify.py --dependency-dir <folder containing flint>` in `route2/` replays the A cover, the B
  barriers and the joint-secant regions (about 4 minutes on one core); `python3 -I verify.py` in the parent folder
  replays the Phase-0 scalar checks (standard library, under a second). The review worker replayed both on Linux with
  g++ 13.3; every regenerated result equals the delivered one up to its timing fields.
- **The review's scripts and logs** are in
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15-review/`: the exact
  re-evaluation of the 196 rectangles (`own_cover.py`), the floating-point recomputation of the scalar profiles, the
  angular suprema, the zero-core matrices and the joint-secant values (`own_scalar.py`, `own_misc.py`,
  `own_secant.py`, `own_small.py`), the exact check that the one exempt box which uses the branch 3δ^{3/2} re-certifies
  with (2/25)δ (`recert_exempt.py`, added when the review was applied to this folder), their logs, and the logs and
  result files of the replay (`replay_full.log`, `replay/`).
- **Not copied** (they stay in the same handoff folder): of Phase 0 `README.md`, `INTERNAL_REVIEW.md`, `ROUTE2.md`,
  `SOURCE_RECORD.json`, `inputs/` and the numerical probes with their logs and JSON results; of route 2 `README.md`,
  `INTERNAL_REVIEW.md`, the component readmes, the internal reviews `secant/A_INTERNAL_REVIEW.md` and
  `b_content/REVIEW_JOINT_SECANT.md`, the numerical probes and the generated tables and logs.
