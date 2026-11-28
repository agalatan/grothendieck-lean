# Inventory: what is kept outside the repository

The working folder of this record is `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/`
(git-ignored). Copied into `code/`:
- the scripts of `primal-dual/` (with `results/round3/*.py` in `code/primal-dual/round3/`);
- the scripts of `degree5-cert/code/` (in `code/degree5-design/`);
- the scripts of `literature/checks/degree5-row/`, `degree5-milestones/` and `higher-degree/`;
- six small result files, listed below.

Everything else stays in the working folder:
- `primal-dual/results/` (3.1 MB with the later rounds): the cutting-plane logs and JSON files of yo, big and
  big2_final, the refinement logs, the round-3 tail and Krivine runs, and the `.npy` archives of the Z3 checks;
- `degree5-cert/out/` (logs of the design runs) and `degree5-cert/dl-hjm/`, `degree5-cert/dl-saha/` (TeX sources of
  arXiv:2609.25462 and arXiv:2608.11158, downloaded by the design worker);
- `literature/BIBLIOGRAPHY.md` and `literature/IDEAS.md` (reading notes; IDEAS item CXO is refuted by
  `../conjecture-K/STATUS.md` §13, item 5), and the other scripts of `literature/checks/`.

Copied result files (in `code/primal-dual/results/`), with their working-folder originals:

| file | size | SHA-256 |
|---|---:|---|
| `primal-dual/results/yo/cp2_K2.json` | 11,974 B | `6a72b55a6d09b09db4f20621cbc6baf4f113f3f97bcc3d7ef17df2d1a1ca2d7f` |
| `primal-dual/results/yo/cp3_K3.json` | 24,327 B | `b80025606e9062afc42930a55295adb31877af3aaf0ac872c372e63bc30f57a2` |
| `primal-dual/results/yo/cp3_K4.json` | 40,935 B | `d4715750041d90339746bb93b4d3df8c2e90957f5a1f02a2d30d41790e1d02fb` |
| `primal-dual/results/big2_final/cp9.json` | 96,910 B | `933819bc679aaf8f3149ce7ec2f226eb9b34962e8bda5ce0cf49865e738179b7` |
| `primal-dual/results/big2_final/cp11.json` | 188,921 B | `70ab7ad49dd533c8f7f8fdb9d6ebfc9c7776ad89b2d8ca29153c2bb741667f51` |
| `primal-dual/results/round3/krivine_out.json` | 938 B | `91cbbc5a73aa99b017787a08811742ac5303c55cc08925efe8cc5c53880041d9` |

Not copied, cited by the ledger:

| file | size | SHA-256 |
|---|---:|---|
| `primal-dual/results/big/refine.log` | 513 B | `357ee781c2535022b54ce0b329ec1ade90293b16a826c3b11dc95702e16399fe` |
| `primal-dual/results/round3/krivine.log` | 885 B | `07314d535619cb2ffdad53720ff7e04ba6d6fa5a67ea2905ab4b309dd8d77336` |

The files that carry the certificates of STATUS 4.11, 4.17 and 4.18 (not copied; the paths are under `degree5-cert/`
of the working folder, whose other outputs are described in the next two sections):

| file | size | SHA-256 |
|---|---:|---|
| `cert/out/envelope_stage1.json` (4.11: the exact envelope B and its rows) | 9,514 B | `a23645f480395f6b00b61e22b20ad71fca855b991e24152e5c86ae05d4c709b4` |
| `cert/out/rows_cert_all.json` (4.11: the certified row constants) | 9,064 B | `55e656f23101d766f6d4e31993afda1d28fadb1d38992a90af2be45f295077e0` |
| `cert/out/replay_all.log` (4.11: the replay) | 7,109 B | `a5045e0f467dff9c5c722684d453580c3d1b08319be860d0e2da322aabdaad2c` |
| `cert2b/out/rows2b.json` (4.17: the row constants of stage 2b) | 9,461 B | `71f81a9cdb9c51672f0e36dc2c53e6b3aedf66c25374706eee0b57cd7112bbd9` |
| `cert2b/out/assemble2b.log` (4.17: the envelopes, B₅ and t₁) | 4,471 B | `822c58f169df70df6de31108f63ecaad662af1f88bcd6ba43b63801bf88deea0` |
| `cert2b/replay2b_all.py` (4.17: the replay checker) | 10,348 B | `b029933829726573ff47dcadc9988ca986c37f102a650210e455e0bd9c3b0baa` |
| `smallt/out/assembled.json` (4.18: the exact assembly) | 2,693 B | `b3b4c3f82970698fe37cc15c76a61bbaf4ee1e7061da11fcf706155928526ed2` |
| `smallt/out/used_files.txt` (4.18: the 38 node files of the assembly) | 890 B | `4b1e15d96a0a1856bc28fb8bdec3eedc8470ed05981a966b7b27d77f5b595279` |
| `smallt/assemble.py` (4.18: the exact assembly script) | 3,672 B | `3b37bfa22a174fdd17573e6f1ed86e60fb7bdaad7c05cf5e0d22de221c25041c` |
| `smallt/cert.py` (4.18: the certificate solver and its verifier) | 18,169 B | `ca1320d9a95fa7f9c8a800edc48ceee88b5a1173bbb7e25f24de71597234aa9a` |

## Degree-5 progress of 16 November (STATUS 1.10, 4.9–4.13)

`sources/degree5-progress-2026-11-16/` holds the reports. Their code and outputs stay in the working folder
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/`:
- `degree5-cert/cert/`: the certificate engine `psi5.cpp`, `law.py`, `cover.py`, `replay.py` and `envelope.py`; its outputs
  `cert/out/` are 43 MB, with `envelope_stage1.json`, `rows_cert_all.json` and `replay_all.log`;
- `degree5-cert/gate/` and `degree5-cert/share/`;
- `spike-layer/`;
- `primal-dual/results/round4/` and `round5/`.

## The capped degree-5 game of 16 November (STATUS 4.16–4.19)

`sources/degree5-capped-2026-11-16/` holds five reports, verbatim apart from their first lines: `CAPPED_GATE.md`,
`CERT_STAGE2.md`, `CERT_STAGE2B.md`, `SMALL_T.md` and `CONTENT_LEMMA_D5.md` (the version of 17 November, with rounds 4A
and 4B in §§12–13; its hash is in the last section). Their code and outputs stay in the working
folder `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/`:
- `capgate/` (1.3 MB): the gate of 4.16;
- `cert2/` (44 MB) and `cert2b/` (41 MB): the certificate of 4.17. `cert2b/replay2b_all.py` is the single replay
  checker; its logs are `cert2b/out/replay2b_*.log`;
- `smallt/` (1.1 MB): the 412 certificates of 4.18, with `reverify.py` and the exact `assemble.py`;
- `content5/` (19 MB; the folder is in use and grows): the scripts and outputs of 4.19 (`code/`, `out/`). Copied
  from it into `code/degree5-content/`:
  the profile generator (`prof.py`, `tilt.py`), `rows5.lines`, `rowlib.py`, `t4lib.py`, `t4fam.py`, `rice.py` and
  `lawstein.py`, unedited. The six JSON tables `code/degree5-content/profiles/band_row_<t>.json` were exported from
  its `out/prof_<k>.npz` (k = 5, 7, 9, 10, 11, 12) by `export_profiles.py`; `check_profiles.py` and its log check
  them against the definitions. The `.npz` tables, the searches and the logs stay in the working folder.

The certificate needs python-flint; it ran on a rented droplet whose run folders are deleted.

## The searches in more than two variables (16 November 2026)

`code/degree5-content/searches-2026-11-16/` holds the logs that STATUS 4.28 is read from:

| logs | content |
|---|---|
| `b2_table_5.log`, `b2_table_7.log`, `b2_table_9.log` | two variables (the column "rank 1") and the driver class with a cofactor of rank two, rows 0.80, 0.82, 0.84; "not possible" marks a maximiser outside the response family |
| `b2_gen3_5_n3_free.log`, `b2_rows_n3.log` | three variables: the searches at row 0.80 and the largest ratio per row and energy |
| `b2_gen3_5_n4_free.log`, `b2_gen3_5_n4_rice.log`, `b2_rows_n4.log` | four variables, the same |
| `b2_gen5_5_n5_free.log`, `b2_gen5_5_n5_rice.log`, `b2_gen5_5_n6_free.log` | five and six variables, row 0.80 |
| `b2_relax_5_free.log`, `b2_twopoint.log` | the relaxed problem over cofactor laws without constraints (the two-point laws) |
| `b2_relax_5_cs.log`, `b2_relax_7_cs.log`, `b2_relax_9_cs.log` | the same with the Cauchy–Schwarz constraints, rows 0.80, 0.82, 0.84 |
| `r4_ref_rows7.log` | the bounds 6.3.25 and 6.3.26 of the K ledger against the truth on test cubics, row 0.82 |

In the logs of the searches, "ratio A" is the objective on the nodes that the search fits, and
"(independent nodes …)" is the same cubic on a second set of nodes: a finer tensor rule for three variables, a
second and larger quasi-random sample for four or more. For three variables the two agree; for four or more only
the second is a value of the ratio. `b2_rows_n3.log` and `b2_rows_n4.log` print the second alone.

The search scripts (`b2_*.py` with `r4lib.py` and the kit) and the JSON files of the maximisers stay in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/`
(`code/`, `out/`): they are one worker's working files. A review worker re-evaluated the maximisers with n ≤ 6 at
t = 0.80 (STATUS 4.28; R4A §4.5); nothing else of them has been reviewed.
`sources/content-problem-v2-2026-11-16/PROBLEM_V2.md` is the problem statement prepared for outside sessions; its
`kit/` is `code/degree5-content/`. The inequality (T) that it poses is one of the open steps of STATUS §5, item 2,
not the only one.

## The content band reviewed, the scope and the low rows (17 November 2026; STATUS 4.28–4.35)

Copied into `sources/`, verbatim apart from the first line of each `.md` file:
- `sources/degree5-content-review-round4a-2026-11-17/REVIEW_ROUND4A.md` (R4A): the review of CONT5 §12. Its scripts,
  logs and data stay in `content5/review-round4a/` of the working folder (1.2 MB: `scripts/`, `logs/`, `data/`; its
  §11 lists them).
- `sources/degree5-newcap-2026-11-17/PROGRESS.md` (NEWCAP): the degree-5 worker's report in its final state, and
  `SCOPE_TABLE.txt`, the scope table of STATUS 4.31 (copied unedited, without a header line). The worker's folder
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/degree5-newcap-2026-11-16/`
  (48 MB) keeps the code (`thresholds/`, `gate/`, `smallt/`, `rows/`, `radius/`, `cert2c/`), the outputs
  (`thresholds/games/`, where `g078big/` is the scope run) and complete copies of its two droplet folders
  (`big_copy/`, 11 MB; `yo_copy/`, 12 MB). The droplet folders themselves, `big:/root/claude-b9ee-d5newcap` and
  `yo:~/claude-b9ee-d5newcap`, were left in place by the worker.
- `sources/content-problem-v2-2026-11-16/PROBLEM_V3.md` (PV3) is version 3 of the problem statement (17 November,
  02:13; 696 lines), which adds the pieces below 0.80; its `kit/profiles_low/` is `code/degree5-content/profiles_low/`
  (the same five files). The low-row data of CONT5 §13.9 stay in the working folder: the table
  `content5/out/b2_lowtab.txt` and the 65 records `content5/out/big/b2_lowr_*.json` (6.5 MB), written by
  `content5/code/b2_lowr.py` and `b2_lowtab.py`.
- `sources/content-problem-v2-2026-11-16/PROBLEM_V2.md` (PV2) is the version of 17 November, 01:25 (585 lines). The
  same file is in the package for outside sessions,
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/content-problem-v2-2026-11-16/content-problem-v2/`
  (with `kit/`, `ref/` and `SHA256SUMS`; zipped as `content-problem-v2.zip`). Its `ref/` scripts (`bipartite.py`,
  `clusters.py`, `kappa.py` and `bulk/bulk_c<c>.json`, c = 2, …, 10) are in `content5/ref/` of the working folder;
  the searches with n ≥ 7 and on the low rows (`b2_gen7.py`, `b2_kappa.py`, `b2_low*.py`, `r4_low.py`, `r4_kappa.py`)
  are in `content5/code/`, their outputs in `content5/out/`. The paragraph of its §2 on the rows below 0.80 quotes
  the scope before the final run of the degree-5 worker; STATUS 4.31 has the final values.

The spectral scan of STATUS 4.35 is in the degree-5 worker's working folder
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/degree5-spec-2026-11-17/`
(840 KB, in use; no hashes): `PROGRESS.md`, `code/spec_scan.py` (the scan), `code/collect.py` (the table:
`python3 code/collect.py out/A_*.jsonl out/B_*.jsonl out/C_*.jsonl`), the records `out/A_*`, `B_*`, `C_*` (`.jsonl`)
and `logs/`. The ledger quotes its scan of the direct bound only; the law rows with spectral cuts that the folder also
holds (`code/spec_row.py`) are not quoted.

Copied into `code/degree5-content/profiles_low/` (LOWKIT), unedited, with a new `README.md`: the five profiles of the
covering rows, from `profiles_low/` of the worker's folder. The profiles of the rows tuned at t itself
(`band_row_<t>_own.json`) are not copied.

| file (paths relative to `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/`) | size | SHA-256 |
|---|---:|---|
| `claude-research-2026-11-15/degree5-cert/content5/REVIEW_ROUND4A.md` (the original of R4A) | 95,599 B | `5424d4ca2fb2224911012ab68b3028b5abfd75758169399576b7df062a8c6b7b` |
| `degree5-newcap-2026-11-16/PROGRESS.md` (the original of NEWCAP) | 54,390 B | `8fbab395d2ab170741cbe9708aa4edb84521b9fc72cfb6ee6eaf48da2da59861` |
| `degree5-newcap-2026-11-16/profiles_low/SCOPE_TABLE.txt` (copied) | 3,383 B | `5abfb090c3139c1110217160705b462c53f5e7163998fecc8dd0201b926647c7` |
| `claude-research-2026-11-15/degree5-cert/content5/PROBLEM_V2.md` (the original of PV2) | 50,378 B | `2fdb9e7a73ef205912014106fca3cc2c874a92f4aec8ea00609e2fde87a5bb73` |
| `claude-research-2026-11-15/degree5-cert/content5/PROBLEM_V3.md` (the original of PV3) | 60,457 B | `8222551f8eefeaf640d06e78c6a3be3b49339b5799b78d2ff6a3b8861dfdf9ce` |
| `claude-research-2026-11-15/degree5-cert/CONTENT_LEMMA_D5.md` (the original of CONT5, version of 17 November, 02:15; 1902 lines) | 153,886 B | `d3ffedc03369f3f2ec311e8cde515eed6718ce0edd887e47935bcd5b2c95d57f` |
| `claude-research-2026-11-15/degree5-cert/content5/out/b2_lowtab.txt` (the low-row table of CONT5 §13.9, not copied) | 4,314 B | `7d5ba89461ac03b580456d6ad173230eb79a394ee08ce9c7224086a6f6701708` |
| `content-problem-v2-2026-11-16/content-problem-v2.zip` (the package, not copied) | 350,379 B | `f18a04986e941959e0fffa17d139388671b6c3a0a8061216d17cc8bedaeee926` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.70.json` (copied) | 94,609 B | `c66c77221dd984fa4daa7eb8d36ab12f80d868e79ed85641c118637c19376c1a` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.72.json` (copied) | 94,866 B | `3f2ccc90af124df905194f6509376d332f57dd852d57d854e7dc0b5c742c821a` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.74.json` (copied) | 94,755 B | `c21abd20ab511286ee7d93d75144d0fbbf326f34bade9277e84484ed5435e5b1` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.76.json` (copied) | 94,740 B | `ed618494f5af8944332ffbdcff75add8641d62a6ace0095156a3d9eac84adae2` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.78.json` (copied) | 94,864 B | `91b828c1857a36d51e1f95ee3de88189204f95006e9eac44565fa1095ff82fde` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.70_own.json` (not copied) | 94,961 B | `4f1a2727e86cbde7242890e4d25aa5351b45d86a60b925f23cb235e98cf108ef` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.72_own.json` (not copied) | 94,984 B | `a44ccd79828bfdf4eddcf6c69054d0da829fdb00bc9202f041ace98e7ece6cb9` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.74_own.json` (not copied) | 94,765 B | `2f01c6ac1f4b26775ab0537eaca50e7014ae7dc932c6b5e79c359d54eb444956` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.76_own.json` (not copied) | 94,849 B | `f11f813c1f35bfb5a0c18223131d1a7b3c0e64623f868f3ce4f3089d33c83338` |
| `degree5-newcap-2026-11-16/profiles_low/band_row_0.78_own.json` (not copied) | 94,885 B | `9e87da333e1a00a77b4105c13f51d4e9b86e239a4fc87d91c03868c1b6b39446` |

## The three-cluster κ bound (claude-b9ee, 17 November 2026, #507)

`sources/kappa-three-cluster-2026-11-17/NOTE.md` gives the original Wick bound and the spherical projection
follow-up by codex-6d92. The latter proves κ ≥ 2c/(c + 1), the exact minima at c = 2 and 4, and the law
comparison in STATUS 4.30.
`code/kappa-three-cluster-2026-11-17/` holds its four scripts (`wick4.py`, `pairs_check.py`, `minkappa.py`,
`bound_exact.py`, run with `python3 -I` in that folder) and five small logs, kept because the note cites them:
`wick4.log`, `pairs_check.log`, `minkappa.log`, `bound_exact.log` and `formula_t070.log`. The last one holds the outputs of
`kappa.py formula 0.70 U c k(c) kit/profiles_low/` for U = 1.612 and 1.449 and c = 4, 5, 6, 8, 10, 12, run in the PV3
working folder `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/content-problem-v3-2026-11-17/content-problem-v3/`
(about 30–50 s each, sampled, **N**).

- The expanded `bound_exact.py` verifies the floor and coupling identities, the two sharp examples by sparse
  Gaussian moments, and the distinct third moments at fixed κ. Run `python3 -I bound_exact.py` in the code folder.
  Exact replay used Python 3.12.3 and SymPy 1.14.0. [Replay log](code/kappa-three-cluster-2026-11-17/bound_exact.log)
- `python3 -I factorization_check.py` (claude-b9ee's review of the spherical projection) tests G = B_c H by Monte Carlo
  against the exact Wick κ and the sampled third moment (**N**; about one minute).
  [Replay log](code/kappa-three-cluster-2026-11-17/factorization_check.log)
- `formula_bulk_t070.log` (claude-b9ee): `kappa.py formula 0.70 U c ref/bulk/bulk_c<c>.json kit/profiles_low/` in the PV3
  working folder for c = 4, 6, 8 and U = 1.612, 1.449: the formula maximised with the actual laws of the stored
  smallest-κ bulks (**N**; about two minutes each).
- `python3 -I shape_probe.py <PV3-packet-path>` evaluates the Gamma, actual Beta and two-point proxies at
  rounded candidates from the prior log (**N**). Replay used NumPy 2.3.5 and SciPy 1.17.1.
  [Replay log](code/kappa-three-cluster-2026-11-17/shape_probe.log)

The numerical probe reads these files within the PV3 working folder named above.

| File | Bytes | SHA-256 |
| --- | ---: | --- |
| `ref/kappa.py` | 11070 | `d485e520e27168b5e42eaa9f7d6161cf65c4bec5f7c3f67a9443d28deb69dd46` |
| `ref/bipartite.py` | 13733 | `2dbc6b4543e631a26e749bf28b8b915afc33ca480b4e28fab209940df6256004` |
| `kit/profiles_low/band_row_0.70.json` | 94609 | `c66c77221dd984fa4daa7eb8d36ab12f80d868e79ed85641c118637c19376c1a` |

## The degree-9 small-t and two-chaos study (gemini-5675, 17 November 2026, #524)

All files of `D9ST` (STATUS 1.6, 1.8, 1.9, 2.6, 4.36–4.38) are committed in the repository, with no external working-folder artefacts:
- `sources/degree9-small-t-2026-11-17-gemini-5675/PROOF.md`: complete proofs and dependency inventory.
- `code/degree9-small-t-gemini-5675/`:
  - `python3 -I verify_two_chaos_diffuse.py` (`verify_two_chaos_diffuse.log`): exact outward-rational certificate (**C**, Python stdlib only) for the diffuse two-chaos theorem (`0 ≤ c ≤ 2`), the `c = 21/10` witness, and the chirp polynomials.
  - `python3 -I verify_t0_refutation_exact.py` (`verify_t0_refutation_exact.log`): exact `Fraction` universal `τ⁴`, `τ⁸` and `1/ℓ²` series plus outward integer interval enclosures (**C**, Python stdlib only) certifying `V₉(1/50) − V₉(0) ∈ [+1.399512·10⁻⁸, +1.431863·10⁻⁸] > 0` (`ℓ = 1`) and `V₉ ∈ [0.712140692470, 0.712141619442] > 0.71211` (`ℓ = 1600, τ = 1/20, α₃,₂ = 3/250`).
  - `python3 -I verify_small_t_and_wick.py` (`verify_small_t_and_wick.log`): exact outward-rational certificates (**C**, Python stdlib only) for the `SMALL_T` Parseval obstruction at degrees 7 (`≥ 0.75146`) and 9 (`≥ 0.72057`), the necessary radius caps (`≤ 0.899299` for two-chaos at `c₉`, `≤ 0.886359` and `≤ 0.899374` for dual `B < 250/351`, `≤ 0.94767` and `≤ 0.94044` for primal Parseval), the global diffuse Gaussian ideal `B₉*,Gauss = (181333/800000)π`, and the 2880-matching Wick classification of `‖R₉(q)‖₂²`.
  - `probe_multimode_hankel.py` (`probe_multimode_hankel.log`): multi-coordinate Hankel numerical probe (**N**; run with Python 3.12.3, NumPy and SciPy).

## The four-square defect, odd-c Hurwitz gap, c = 3 construction and C_opt ≥ 1168/729 (gemini-21d5, 24 November 2026, #507)

All files of `KSPH` (STATUS 4.30) are committed in the repository, with no external working-folder artefacts:
- [`sources/kappa-spheres-2026-11-24-gemini-21d5/PROOF.md`](sources/kappa-spheres-2026-11-24-gemini-21d5/PROOF.md): complete proofs and dependency inventory for Theorems 1–4.
- [`code/kappa-spheres-gemini-21d5/verify_kappa_spheres.py`](code/kappa-spheres-gemini-21d5/verify_kappa_spheres.py) ([`REPLAY.log`](code/kappa-spheres-gemini-21d5/REPLAY.log), [`verify_kappa_spheres_result.json`](code/kappa-spheres-gemini-21d5/verify_kappa_spheres_result.json)): pure Python stdlib verifier (`python3 -I -O verify_kappa_spheres.py`, AST-audited zero floats, **C**), checking the four-square defect identity from first-principles monomial Gaussian moments, the quantitative odd-c Hurwitz lower bound, the closed-form algebraic c = 3 construction and rational witnesses, the disjoint circular block harmonic-mean constructions for c = 5, 6, 8, 9, 10 (including C_opt ≥ 1168/729 > 8/5 at c = 8) plus the coupled rational c = 7 witness, and 7 adversarial negative controls.

## The attack plan and problem statements of 25 November 2026 (STATUS 4.39, tag ATK)

- `sources/degree5-attack-2026-11-25/PLAN.md` and `problems/P1`–`P6`: written from the ledger and its sources by a
  research worker of claude-b9ee; in the repository in full. Only repository paths were substituted for the worker's
  local paths.
- `code/degree5-attack/`: `rows2b.json`, the search scripts `ref/` with the stored bulks, and the check scripts with
  their outputs. The working copy, with nothing more in it, is
  `/Users/alingalatan/workspaces/grothe/handoff/degree5-attack-2026-11-25/`.
- Not in the repository: the certificate pipeline that P4 asks to replay,
  `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/cert2b/`
  (P4 embeds its 29 rows and says what a replay must reproduce).

## The recomputed design of 25 November 2026 (STATUS 4.41–4.45, tag DSGN)

- `sources/degree5-design-2026-11-25/DESIGN.md` was written for the repository from the design worker's script
  outputs and its note `ASSEMBLY.md` (the assembly theorem and its proof); it is not a verbatim copy of a working
  file.
- `code/degree5-design/design-2026-11-25/`: the design worker's scripts, the cover pipeline, the certified row
  constants, the exact envelopes, the margin scans, the tables and `RESULTS.txt`, copied unedited from the working
  folder; `checks/` and `README.md` there were written when the computation was recorded. `RESULTS.txt` and the logs
  under `A_reproduce/`, `certB_const/out/`, `certB_lin/out/` and `smallt/` are kept because the note cites them as its
  record (the exception of [`../README.md`](../README.md)); the folder holds 2.0 MB of text in files of at most 152 KB.
- The working folder is `/Users/alingalatan/workspaces/grothe/handoff/degree5-attack-2026-11-25/design/` (45 MB). Not
  in the repository:
  - the 52 cover files `certB_const/out/cover_<row>.json` and `certB_lin/out/cover_<row>.json` (31,936,823 B in all;
    one line each with SHA-256 and size in `code/degree5-design/design-2026-11-25/COVERS.sha256`), and the per-row
    logs `certB_*/out/logs/`;
  - `work/`: the per-case outputs of the conic programs and searches (`g078/`, 7.9 MB; `g078lap/`, 1.2 MB; `g077/`,
    0.9 MB; `g078hi/`), their command files and logs, and the JSON forms of the tables of §3.3 of the note;
  - `margins/`: the logs of the scans and the two re-scans `m078hi_t0.86.json`, `m078hi_t0.865.json`;
  - the node caps of the 29 rows (those of the stage-2b certificate, `degree5-cert/cert2b/` of the working folder of
    15–17 November, as for STATUS 4.17) and the tools that the allowance and re-evaluation programs import
    (`thresholds/` of the degree-5 worker's folder named in the section on 17 November above).
- `/Users/alingalatan/workspaces/grothe/handoff/degree5-attack-2026-11-25/mega-design-raw.tar.gz`: the raw outputs as
  copied from the droplet (`design/work/`, `design/certB_*/out/`, the scan logs, and the logs of the replay of
  STATUS 4.17 under `runA/`).

- The repairs of DSGN §5.6 (STATUS 4.44) were run by the recording worker on the droplet in a folder that was removed
  afterwards. In the repository: the generators and the summary script under `checks/`, and under
  `tables/funded/` and `tables/nu_matched/` the outputs that the tables use (the factor tables of `final_table.py`,
  the margin scans and the allowance outputs of the ν-matched rows). Not kept anywhere: the per-run logs, the
  allowance outputs of the 33 funded and control runs other than through the factor tables, and the eleven profile
  archives of the ν-matched rows (they are reproduced by `prof2.py` of the working folder's `thresholds/` from
  `tables/nu_matched/rows5.lines`). The profile archives `prof_t0p<row>.npz` of the design run that these runs used
  are in `mega-design-raw.tar.gz` under `design/work/g078/out/`.

| file | size | SHA-256 |
|---|---:|---|
| `degree5-attack-2026-11-25/mega-design-raw.tar.gz` | 51,993,411 B | `3961b48d3dd97911f769f2b4001c02fa57b36bc56d16f9f7f5c61303a14c378b` |
| `degree5-attack-2026-11-25/design/ASSEMBLY.md` (the source of §5 of the note) | 16,966 B | `9d15595b0492f331609290ea78556e7f39e5b7b27415eae8122d8dd0553f17ef` |
| `degree5-attack-2026-11-25/design/RESULTS.txt` (copied) | 66,963 B | `613a6133ce919afda9f00ed4b4ef97add4ca929107cda3d89a4202b989dd1bb5` |
| `degree5-attack-2026-11-25/design/work/table_g078.json` | 508,211 B | `532624de6304efba9a3c12091330cb6f59c4620787f358756005ed1704c9d7c1` |
| `degree5-attack-2026-11-25/design/work/table_g078pub.json` | 274,585 B | `471add239caad7113425986a864cd739922674a3ef3a94f0764f3372ce3270b8` |
| `degree5-attack-2026-11-25/design/work/table_g078lap.json` | 112,751 B | `d6983a57437494d3f1becaa5bf46d583a6a843ca2ea242e44fe602a909d5f928` |
| `degree5-attack-2026-11-25/design/work/table_g077.json` | 63,528 B | `0ce52fc524a54432d44b1a357f743f4f7e87fc2b8d4c53f960b3b557867e7689` |
| `degree5-attack-2026-11-25/design/work/finL.cases.json` (the candidates of pieces 1–8) | 19,962 B | `399fe514b0c176424f09ea28f7ea1e46880ff55d4f442ec0e8c5730cf45675d0` |
| `degree5-attack-2026-11-25/design/work/finU.cases.json` (pieces 9–21) | 14,424 B | `0f57cbe7c014e08d3d45ecfdc7e7886f336b347866e323c14160a72e5cb80099` |
| `degree5-attack-2026-11-25/design/work/finT.cases.json` (the tilt (3/10, 1/10)) | 2,985 B | `90d8b083cefb0bb78194e35668971b6e1a322d9d7f6a4fb791e5c10dbcacb5f2` |

## Certified pure-cost constants for the odd and quintic sectors (gemini-21d5, 25 November 2026, #627; STATUS 4.16b, tag PCOST)

All files of `PCOST` are committed in the repository, with zero external working-folder artefacts or third-party dependencies:
- [`sources/degree5-pure-cost-2026-11-25-gemini-21d5/PROOF.md`](sources/degree5-pure-cost-2026-11-25-gemini-21d5/PROOF.md): complete proofs, outward-rounded 19-row summary table, $E_{\max}(s)$ profile summary, negative-control inventory, and replay instructions.
- [`code/degree5-pure-cost-gemini-21d5/`](code/degree5-pure-cost-gemini-21d5/):
  - `python3 -IB research/higher-degree/code/degree5-pure-cost-gemini-21d5/verify_pure_cost.py` (and `python3 -IB -O ...`): zero-dependency Python 3 stdlib verifier (< 2 s) checking exact denominator-$10^6$ row rationalisation against `rows5.lines` and `band_row_0.70.json`, exact rational positivity/root-uniqueness premises, zero-float `Fraction` boundary proof $Z(0.80) > 1 > Z(0.81)$, exact `Fraction` Sturm chains for all 280 rational quartic elliptic secant ladder rungs, dyadic hexfloat receipt audit of `result.json`, and 11 adversarial negative/corruption controls (`--replay-cpp` recompiles `certify_pure_cost.cpp` and verifies bit-exact equality against `result.json`, ~21 min wall on 8 threads).

| file | size | SHA-256 |
|---|---:|---|
| `sources/degree5-pure-cost-2026-11-25-gemini-21d5/PROOF.md` | 52,049 B | `d7613c80579fba6cbc8c919c89e6868a2b5c9c139351624af4af1c2fccde250f` |
| `code/degree5-pure-cost-gemini-21d5/certify_pure_cost.cpp` | 114,283 B | `7c8df15e632c6d667b924fd25f9d8846e91a0008c3dc5f283a348319bf024f79` |
| `code/degree5-pure-cost-gemini-21d5/verify_pure_cost.py` | 27,802 B | `bbfe36382f883947979c7f625df280fe9bf61d8a39c53bda4abc45951933b977` |
| `code/degree5-pure-cost-gemini-21d5/result.json` | 52,138 B | `bab7b3ba411bbef8d93dd8ed0f89cfc00d8047a4d83335fb768ae910f076eafc` |

## The retarget note of 25 November 2026 (STATUS 1.11, 1.12, 4.50–4.52, tag RETG)

- `sources/degree5-retarget-2026-11-25/RETARGET.md` was written for the repository; it is not a copy of a working file.
- `code/degree5-retarget/`: the scripts and their result files (0.5 MB of text, files of at most 221 KB). The
  floating-point runs were made on the droplet in `~/claude-b9ee-retarget`, removed afterwards; nothing of them is
  kept outside the repository. The per-run outputs of the allowance program (93 files) and the per-iteration logs
  were not kept: `theta/thetas.json` and `ceiling/eps_profile_K*.json` hold what the tables use.
- Inputs outside the repository, read by `theta/gen_theta_job.py` and `theta/extract_cells.py`: the band files, the
  command file `fin_all.txt` and the ratio files of the design run (`design/work/` of the working folder named in
  the previous section), the profile archives `design/work/g078/out/prof_t0p<row>.npz` (in
  `mega-design-raw.tar.gz` there) and the tools `thresholds/*.py` of the degree-5 worker's folder.

## Unconditional symmetrised spiked cubic radius and angle-dependent envelope (gemini-4c4c, 25 November 2026, #628; STATUS 4.48, tag SSPK)

All files of `SSPK` are committed in the repository, with zero external working-folder artefacts:
- [`sources/spiked-cubic-radius-gemini-4c4c/PROOF.md`](sources/spiked-cubic-radius-gemini-4c4c/PROOF.md): complete proofs, dependency inventory, 11-ray Pythagorean half-plane table, sector-free capped degree-5 cutoff derivation (`t ≤ 9190839/25000000 = 0.36763356`), and negative-control inventory.
- [`code/spiked-cubic-radius-gemini-4c4c/`](code/spiked-cubic-radius-gemini-4c4c/):
  - `python3 -IB research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/verify.py` (and `python3 -IB -O ...`; `--radius-only` for the narrower Theorem 1 radius result): zero-float Python 3 stdlib verifier (**C**) requiring positive radii ($r_1 > 0$, $R_j > 0$), checking Machin π brackets, `4.18g` Stieltjes-Laguerre ellipsoids and radial envelopes, `4.18e` left closure on `[0, 7/20]`, all 56 Sturm-certified third-order spiked Stein rows across 7 interior rays and 4 right-analytical `4.18g` rays, convex-quadratic slab cover (`sup √(t² + s²) ≤ 0.9389788947 < 939/1000 < √(9π/32)`), and binding Theorem 2(2) coverage through `t ≤ 9190839/25000000 = 0.36763356` (where this 11-ray + Lean-mass upper envelope crosses `500/701` at `0.36763357`).
  - `python3 -IB research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/check_identities_exact.py`: zero-float Python 3 stdlib polynomial checker verifying spiked Stein identities `(I′)`–`(IV′)`, `∂̄_m a(G) = W_m` (including on `G = z₁² z̄₂` where `∂₁F₂ ≠ ∂₂F₁`), zero-mean `±G` symmetrisation, pointwise cones and split Young inequality, `z₁` integration-by-parts Hölder `(4/3, 4)` + 4-term AM-GM sixth-moment bounds, and `5 × 5` cofactor determinants against Leibniz determinants over `ℚ` (~36 s).
  - `python3 -IB research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/test_controls.py`: zero-float Python 3 stdlib AST audit and adversarial negative/corruption control suite (`r₁ = 22/25 = 0.88`, one-field negative `claim = "-939/1000"` and negative `R_0`, exact `Fraction` proof `E|F|/‖F‖₂ > 0.9430 > √(9π/32)` on unsymmetrised `F = z₁(1 − (|z₁|² − 2)/4)`, `r₁ = 47/50 = 0.94`, disabling `q_sym = 0`, truncated `s_G`, tail `φ₄[K] ≠ 0`, Sturm knot corruption, `t_right < √π/2`, `+10⁻⁷` mid-`t` cutoff inflation, missing `degree5_midt.lean_mass` / `degree5_midt` keys, and lowered `lean_mass.t_cutoff`).
  - `make_cert.py`: standalone Clarabel + HiGHS rational certificate generator reproducing `cert_spiked.json` from scratch.

| file | size | SHA-256 |
|---|---:|---|
| `sources/spiked-cubic-radius-gemini-4c4c/PROOF.md` | 50,106 B | `219f672f474306e5e106c041960edd6cf22b4269d5f20b7c0dbad9ca82f18deb` |
| `code/spiked-cubic-radius-gemini-4c4c/cert_spiked.json` | 261,727 B | `85ee61e46e4a4d3cc54a1ea4fa2b043c8e1f79ae25ff3fa7cdbf3778b55fb960` |
| `code/spiked-cubic-radius-gemini-4c4c/verify.py` | 38,440 B | `a482e177d55c7749a8b898e5f0382b271efb69147a31801f0a87945d36468fc4` |
| `code/spiked-cubic-radius-gemini-4c4c/check_identities_exact.py` | 28,384 B | `e646e1edf97ae1bc7ab0258d76d3523a1d2afd7665b58f915eef76c037035bb6` |
| `code/spiked-cubic-radius-gemini-4c4c/test_controls.py` | 11,899 B | `ba51f27cf2ad710590497acddd444b21ad295628559d85ffe20a857201849ec9` |
| `code/spiked-cubic-radius-gemini-4c4c/make_cert.py` | 57,080 B | `39d980e48d4dcce31152a504377497df00122ae792689e333fbf7c052c75c2a6` |

## The gate of two other degree-5 games, 25–26 November 2026 (STATUS 4.53–4.55, tag D5GATE)

- `sources/degree5-gate-2026-11-25/GATE.md` was written for the repository; it is not a copy of a working file.
- `code/degree5-gate/`: `pipeline/` (the scripts and command lists that ran on the droplet yo in `~/claude-b9ee-gate/pkg`,
  removed afterwards), `results/` (the small outputs the note uses, copied by `collect.sh`), `summary.py` and its output
  `SUMMARY.md`, `exact/ranges.py` and `exact/ranges.log`.
- Outside the repository, in `handoff/degree5-gate-2026-11-25/` of the main checkout (git-ignored): `pkg/` (the droplet
  folder as it was at the end: 1,005 files, 11 MB, with the per-row gate outputs `gate_*/out/`, the profiles
  `thresholds/games/*/out/prof_*.npz`, the allowance logs and the law-bundle logs `law/*.err`), the same folder as one
  archive, and the package list of the Python environment used.

| file | size | SHA-256 |
|---|---:|---|
| `handoff/degree5-gate-2026-11-25/pkg.tar.gz` | 5,052,854 B | `058e375a4b31272dae597447516c86343484c1bd380913a419e7ffcab9c22965` |
| `handoff/degree5-gate-2026-11-25/venv-freeze.txt` | 247 B | `9ad57a22603315ad85c065d7f137c2f67f5e45a423ec1ec0503720ced0f23a6a` |

## Independent Level C clean-room replay of the degree-5 law layer and small-t bound (gemini-21d5, 26 November 2026, #625; STATUS 4.17, 4.18(b), 4.40, 4.42, 4.45, tag LAWREP)

All files of `LAWREP` are committed in the repository, with zero external working-folder artefacts and zero third-party dependencies:
- [`sources/degree5-law-replay-2026-11-25-gemini-21d5/PROOF.md`](sources/degree5-law-replay-2026-11-25-gemini-21d5/PROOF.md): complete proofs of Claim 1 and Claim 3 (both zero-`arcsin` cover and elementary Lean-constant proof), outward-rounded tables of all 29 rows of `rows2b.json` and all 26 rows of `rows2c_final.json`, exact envelope/room verification (including all 21 pieces of Design `D*`), sanity checks, and 12 negative controls.
- [`code/degree5-law-replay-gemini-21d5/`](code/degree5-law-replay-gemini-21d5/):
  - `python3 -IB research/higher-degree/code/degree5-law-replay-gemini-21d5/verify_law_caps.py` (and `python3 -IB -O ...`): zero-dependency Python 3 stdlib verifier (< 2 s) auditing SHA-256 provenance, static zero-`libm`-transcendental C++ source check, Claim 1 outer-domain premises, P4 §§4, 8 sanity checks in pure `Fraction` arithmetic, all 60 certified covers (`29` `rows2b` plain + `5` zero-`arcsin` Stein + `26` `rows2c` plain at `ρ₀ = 2287/2500`), all 55 exact rational multi-atom primal lower-bound witnesses in `ℒ = (L1)–(L4)` on the plain covers, pure-`Fraction` box-bound replays of exported binding plain and Stein boxes, both proofs of Claim 3 (`40` `σ`-nodes / `39` intervals and cover-free Lean deduction), exact rational envelopes and rooms (`rows2b`, `rows2c_final`, and all 21 `D*` pieces at `500/701`, `1/1.40195` and `1/1.40210`), and 12 adversarial negative/corruption controls (`--replay-cpp` recompiles `certify_law_caps.cpp` and checks deterministic equality across `rows`, `claim3_small_t`, `sample_boxes`, `sanity_checks`, and `negative_controls`, ~37 min wall on 8 threads).

| file | size | SHA-256 |
|---|---:|---|
| `sources/degree5-law-replay-2026-11-25-gemini-21d5/PROOF.md` | 50,807 B | `479c3a6c1bcfd4083271b4a8fb93b4bc8581adbd3fc956dceb06b1e7d1917366` |
| `code/degree5-law-replay-gemini-21d5/certify_law_caps.cpp` | 160,431 B | `2168deca284b95a01c496e6277505cbe62193ee44c4f97a05735fb99cf14868f` |
| `code/degree5-law-replay-gemini-21d5/verify_law_caps.py` | 48,423 B | `c0bdb9f51080cee3ec1ffc74e98f4e6ffa7cd4d18b0f58e42495c5291cc7ed3e` |
| `code/degree5-law-replay-gemini-21d5/result.json` | 85,055 B | `0020b02c426d0bd9e9b9e15573db7d70bcf7a46f57d02fe14e4313e0ad388571` |

## Finite-amplitude g84 spike rows (codex-a7c4, #824)

Row 4.16c uses the g84 row data shipped with Stage 0. The [proof](sources/finite-spike-codex-a7c4/PROOF.md) derives a global curvature bound on three quintic fields and compares them with the freely optimized visible quintic. The [standard-library checker](code/finite-spike-codex-a7c4/verify.py) verifies the polynomial majorants and row hash in rational arithmetic. The [NumPy/SciPy evaluator](code/finite-spike-codex-a7c4/explore.py) computes the finite-amplitude paired norms numerically.

## Capped physical rows and the degree-five node pilot (codex-a7c4, #829)

The [shape-resolved mass proof](sources/capped-spiked-mass-codex-a7c4/PROOF.md) and its [stdlib replay](code/capped-spiked-mass-codex-a7c4/verify.py) use the committed P7 Sturm certificate and Lean witness data. The [physical proofs and node plan](sources/quintic-node-pilot-codex-a7c4/ROADMAP.md) use the [pilot checkers](code/quintic-node-pilot-codex-a7c4/), including one shared MPFR interval integrator for the g84 model and capped Gaussian benchmark. The input row files are already in the degree-five design and Stage 0 directories.

## The fifth-chaos projection of 23 October 2026, moved from the archive (claude-b9ee, #764)

`sources/quintic-projection-2026-10-23/` and `code/quintic-projection-2026-10-23/` hold the study that
`sources/literature-2026-11-16/HIGHER_DEGREE.md` cites for the tail-priced separation banks of the upper side. The
files were in the archive folder `miscellaneous/` until master `bfb5961e3` (removed by #764) and are verbatim, with one
provenance line added at the top of each note. Their endpoints are those of 23 October 2026.

| file | size | what it holds |
|---|---:|---|
| `sources/quintic-projection-2026-10-23/EXACT_QUINTIC_PROJECTION_2026-10-23.md` | 18 KB | A written proof: the U(m)-invariant part of H₃,₂ over ℂ ⊕ ℂᵐ ⊕ Sym²(ℂᵐ) has dimension 13 (10 at m = 1); the exact fifth cross coefficient s5_m of the phase pair ph(Z + cH₂,₁(Z) ± bG) by a conditional Mehler identity, with \|s5_m − s5_∞\| ≤ 4/m. |
| `sources/quintic-projection-2026-10-23/MEHLER_AUDIT.md` | 16 KB | The audit of that identity and of what the scripts do not prove. |
| `sources/quintic-projection-2026-10-23/QUINTIC_REASSESSMENT_2026-10-23.md` | 18 KB | The experiment: the sign of the fifth coefficient, a cancellation bank, and a tail-priced oracle whose best diagnostic 0.71160976 stayed below the net score 0.71194718 of that day's rounding (numerical). |
| `sources/quintic-projection-2026-10-23/REPLAY.md` | 5 KB | The replay instructions of the original folder `research/quintic_projection_20261023/` (its `README.md`). |
| `code/quintic-projection-2026-10-23/` | 72 KB | The four scripts of the endpoint replay (python-flint) with their input and replay JSON files. From a current checkout, `python3 -IB research/higher-degree/code/quintic-projection-2026-10-23/verify_bank_constants.py` runs directly; the paths in `REPLAY.md` are those of the original folder. |

Not kept: the folders `numerics/` and `production_replays/` of the original (0.3 MB of search results and logs), at
`miscellaneous/research/research/quintic_projection_20261023/` of master `bfb5961e3`; the production verifiers
`tools/verify_quintic_*.py`, `tools/check_quintic_certificates.py` and `tools/tail_priced_phase_oracle.py`, deleted
from `tools/` by commit `d84c3fdfc` (`git show 8115260f8:tools/<name>`); and the Lean algebra
`miscellaneous/research/Grothe/LowerAnalytic/QuinticTransferAudit.lean` of master `bfb5961e3`.

## Certified continuous-law first-chaos content bounds per (u, χ) cell (gemini-c1de, 26 November 2026, #623; STATUS 4.56, tag CONTCELL)

The [piece-15 extension](sources/piece15-content-codex-062a/PROOF.md) uses the same profiles and certifier. Its two new [dual witnesses and replay](code/piece15-content-codex-062a/) and the reused χ = 20 multipliers cover ten additional funded bins at 0.78 u_cap (4.56a).

All files of `CONTCELL` are committed in the repository (< 220 KB per file), with zero external working-folder artefacts:
- [`sources/degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md`](sources/degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md): proofs of the minimax linearized joint-Kantorovich bound (`JM1`), exponential Kantorovich duality (including piecewise-linear prefix-intercept accounting), Cone-𝒦 + Coupled-Gram rational Stein + Kummer/Cauchy–Schwarz Rice continuous-law duality, outward-rounded 2D Gaussian polar + centered vortex row profile enclosures with rounded-center Taylor radii, guaranteed moving-vortex overlap start, closed singleton mesh seams, quantitative `Ival` Gaussian/moving-vortex tail bounds, exact rational tilts, and dependency-free backward `k_X'` contraction recurrence, verification summary across Pieces 1–17 of `fin_table_fundFull.json`, non-divergent shifted-vortex proof of the `256/63` low-energy Wick junta limit with certified `h_X'(0) > 0`, enclosed `u = 1/10^6` (`ε₁ = 39/50`) and own-row `0.70` negative controls, and `K`-cluster `2 + 6/K` identity and structural plateau analysis.
- [`code/degree5-content-cells-gemini-c1de/`](code/degree5-content-cells-gemini-c1de/):
  - `python3 -IB research/higher-degree/code/degree5-content-cells-gemini-c1de/verify.py` (and `python3 -IB -O ...`): zero-dependency Python 3 stdlib `Fraction`/`Decimal` receipt & tail auditor (< 2 s) checking `< 300 KB` file bounds, SHA-256 cryptographic binding of `result.json` to `dual_certs.json`, all 7 shards, `dual_certs.dat`, and `certify_content_cells.cpp`, all 15 distinct `row_summaries` (ordered `PA_inf`/`PB_inf` in `[-2, 2]` and `h_A'(0) > 0, h_B'(0) > 0`), Kummer + Cauchy–Schwarz rational Rice tangents, algebraic Wick/cluster moment identities, multiplier signs, Coupled-Gram hypotheses, contiguous slice coverage of exported `g1_range_A` / `g1_range_B`, asymptotic `U³` cubic dominance (including negative Kantorovich prefix intercepts) across all 1,485 slices of all `109` certificates, exact downward-rounded `t_lo` and tight `[u_lo, u_hi]` binding to the 5 discrete grid energies per piece, closure of all `35/35` (Piece 16) and `11/11` (Piece 17) finite active cells (`θ < 50`) plus `θ = 50` table bins, explicit subinterval intersection accounting on the omitted `(24, 42]` bins at `0.92 u_cap` (`(24, 39)` `JM1`-bounded vs `[39, 42]` `(R1)`-infeasible), and negative controls (`--replay-cpp` recompiles `certify_content_cells.cpp` with `-ffp-contract=off` and replays the full 15-row 2D Gaussian + 109-cell `[0, U₀]` continuous-law certification from scratch).
  - `python3 -IB research/higher-degree/code/degree5-content-cells-gemini-c1de/test_controls.py` (and `python3 -IB -O ...`): 28-check positive-fixture, mathematical negative-control, rounded-midpoint Taylor & mixed-sign `FE_UPWARD` magnitude regression, moving-vortex join & singleton mesh-seam regression, outward-rounded C++ console vs receipt consistency, `g_1` slice-cover, SHA-256 receipt binding, default-mode `row_summaries` (`[]`, 15 duplicates, inverted `PA_inf=[1,-1]`) & missing-bin partition controls, and field-specific corruption control suite against both `verify.py` and the live C++17 binary.

| file | size | SHA-256 |
|---|---:|---|
| `sources/degree5-content-cells-2026-11-25-gemini-c1de/PROOF.md` | 37,592 B | `cdbb3ed041e94b7496518ac38f482a3257ed0ed06f897512c6a3b51c798dd72f` |
| `code/degree5-content-cells-gemini-c1de/README.md` | 3,803 B | `ec39f2c1bbc44aefb1c2106b15e8d35ca4ebc7746d695a27874a26580c3dc1d2` |
| `code/degree5-content-cells-gemini-c1de/certify_content_cells.cpp` | 166,692 B | `6b301b218eb075fb365cc6fab6732a249021eb73d6e145078bd641290323723e` |
| `code/degree5-content-cells-gemini-c1de/generate_certificates.py` | 60,974 B | `037db9afd0aaa5f9994e2b0d2b399d023aa5c2c6b2bda0df2163f877c7164590` |
| `code/degree5-content-cells-gemini-c1de/verify.py` | 43,203 B | `5c031c5d75c7534264793d47580b9cd254c7c7550cbf3161390dbc30b1d75e97` |
| `code/degree5-content-cells-gemini-c1de/test_controls.py` | 23,107 B | `5b794948a6ce206f7abdc2eddb3c0b2c769c8abd48f8c76077d0819d88afdead` |
| `code/degree5-content-cells-gemini-c1de/dual_certs.json` | 1,735 B | `3ac783ea4065bfb3e19ad31fa980992564a5b430e921361afe30368b65dd2c50` |
| `code/degree5-content-cells-gemini-c1de/dual_certs_1.json` | 213,360 B | `8ea096c5d2c7d6db8b4bfb96cc6dbb3b3e0c919307660d413f3472b072bb2057` |
| `code/degree5-content-cells-gemini-c1de/dual_certs_2.json` | 219,824 B | `1227be0f609a04d131725b83a369d38577f9338346bf709f94e360446a25c258` |
| `code/degree5-content-cells-gemini-c1de/dual_certs_3.json` | 198,073 B | `46217af702c926513397bc632689bc89d7a5cea0de327d480e91e6455f27c0a1` |
| `code/degree5-content-cells-gemini-c1de/dual_certs_4.json` | 181,911 B | `a1a3233f9cd8dc76a7423286559c378b913b57f205289f88a060cc756d2ab750` |
| `code/degree5-content-cells-gemini-c1de/dual_certs_5.json` | 210,811 B | `bf6f184bda076e499e1520f963cb4beda0a86f0aee9737517c649ecb39e78710` |
| `code/degree5-content-cells-gemini-c1de/dual_certs_6.json` | 212,073 B | `ae4eddaa67df26decdbb906df5d644772cd8820c823837047750a9a02853aecd` |
| `code/degree5-content-cells-gemini-c1de/dual_certs_7.json` | 162,808 B | `8c35eeb96193065e521b420abb411e545d18f8ae18559e0506586ec946baed1b` |
| `code/degree5-content-cells-gemini-c1de/result.json` | 52,299 B | `142a0604f6c9dff42a09cf8d6e0aba1a66957c68ce5da940a4ba68bfeead2e8b` |

## Conditional cubic and quintic response moments

The [proof](sources/quintic-conditional-debit-codex-a7c4/PROOF.md), [integral checker](code/quintic-conditional-debit-codex-a7c4/joint_integral.py) and [payoff replay](code/quintic-conditional-debit-codex-a7c4/verify.py) give ledger row 4.18k. Both scripts use Python’s standard library. The buffered endpoints needed for the conditional statement are explicit rational inputs.

## Sharp Gaussian-buffered cubic radius through s <= 5/8 and remote mid-t P3 closure on [0, 61/100] (gemini-4c4c, 28 November 2026, #784; STATUS 4.18j, tag KBRS)

All files of `KBRS` are committed under [`../conjecture-K/`](../conjecture-K/INVENTORY.md) (`cert_buffered_rice.json` is 261,984 B < 300 KB, zero external dependencies in `verify.py` and `test_controls.py`):
- [`../conjecture-K/sources/buffered-rice-stein-gemini-4c4c/PROOF.md`](../conjecture-K/sources/buffered-rice-stein-gemini-4c4c/PROOF.md): self-contained proofs of Theorem 1 ($0 \le s \le 5/8$), Corollary 1a (exact remote cubic energy frontier $\sqrt{2\pi/13} \le t \le \sqrt{\pi}/2$ so the uninflated remote energy cap applies at all 19 rationalised degree-5 row amplitudes `0.70`–`0.886`), and Theorem 2 (certified buffered Rice constants $R_{\mathrm{buf}}(s_j)$ closing `#628` `ATK P3` §5 below $500/701 - 10^{-3}$ across $t = \lVert P_{1,0}\frac{f+g}{2}\rVert_2 \in [0, 61/100]$ and certifying finite-dimensional tightness at $t = 618/1000, A = 2017/5000$).
- [`../conjecture-K/code/buffered-rice-stein-gemini-4c4c/`](../conjecture-K/code/buffered-rice-stein-gemini-4c4c/):
  - `python3 -IB research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/verify.py` (and `python3 -IB -O ... --quiet`, ~21 s): zero-float, zero-`assert` stdlib verifier tying `C₆` and `χ ≤ 42` to their Lean sources.
  - `python3 -IB research/conjecture-K/code/buffered-rice-stein-gemini-4c4c/test_controls.py` (and `python3 -IB -O ...`, ~22 s): AST self-audit, 17 corruption controls, mandatory `P3` §6 false-cap `0.62` rejection at exact $t = 0.30$ ($\alpha^2 = \frac{9}{25\pi}$, plus rational $c = 11/4$), and exact rational verification of all 7 `P3` §3 / §7 Gaussian driver benchmarks.

| file | size | SHA-256 |
|---|---:|---|
| `../conjecture-K/sources/buffered-rice-stein-gemini-4c4c/PROOF.md` | 42,514 B | `3a2181ce5e50d4c64e554685c02015a97220ea074e5667bc29b4198bfa7a8d08` |
| `../conjecture-K/code/buffered-rice-stein-gemini-4c4c/README.md` | 3,535 B | `b565626b13af8a841b2f0ff649afde83a000c24d76d6c045a758db75565b43b2` |
| `../conjecture-K/code/buffered-rice-stein-gemini-4c4c/verify.py` | 60,886 B | `0b65a4e764b5097bd52fa14b0f0f8feccf08df4e43f73f02e57c0eaccd8ffc07` |
| `../conjecture-K/code/buffered-rice-stein-gemini-4c4c/test_controls.py` | 13,057 B | `ef414fe26c1707783500ca1f91bf7ca48ee1fa7a4f3818d83d9b77f3f9539fa0` |
| `../conjecture-K/code/buffered-rice-stein-gemini-4c4c/make_cert.py` | 39,334 B | `8a099ee8ad5347143cb8079deb29f6d7044df917b1e561af5a88c60bb271aa1d` |
| `../conjecture-K/code/buffered-rice-stein-gemini-4c4c/cert_buffered_rice.json` | 261,984 B | `0e6ded21f92142cf75602411efcef827a8b360b168258e7b189187bbba0b7dd6` |

## Weighted sector energies and buffered cubic radii

The [two-radius argument](sources/quintic-mixed-sectors-codex-a7c4/PROOF.md) and [Rice witnesses](code/quintic-mixed-sectors-codex-a7c4/rice_rows.json) give row 4.18k. The [weighted projection argument](sources/quintic-mixed-sectors-codex-a7c4/GRAM.md) and [all-amplitude splice](sources/quintic-mixed-sectors-codex-a7c4/SHOULDER.md) give row 4.18l. Row 4.18m uses these projections to [restrict the support test for a hypothetical violating pair](sources/quintic-mixed-sectors-codex-a7c4/ALL_SECTORS.md). The [combined replay](code/quintic-mixed-sectors-codex-a7c4/replay.py) runs the exact comparisons and controls with Python's standard library. All new certificate data are in the repository.

| File | Bytes | SHA-256 |
|---|---:|---|
| `code/quintic-mixed-sectors-codex-a7c4/all_sector.py` | 9,550 | `8c5233f58e0e61c74cbf0481b84cab35d872bf6404d2d9963afe73f25d073f76` |
| `code/quintic-mixed-sectors-codex-a7c4/rays.py` | 6,917 | `93807dd7ab73a07fa0f446d41e2d2ef99a3d1f3873304ab6d6cb97235715b0b8` |
| `code/quintic-mixed-sectors-codex-a7c4/replay.py` | 826 | `ce28865b6109ccf8724954eb4b728c26d4b291a9bb914c311a3c906b7e6baaff` |
| `code/quintic-mixed-sectors-codex-a7c4/rice_rows.json` | 2,816 | `300a456066b378d6b4be11cebb43537eca9e895d243e4fb5a265fd1e1a8033f2` |
| `code/quintic-mixed-sectors-codex-a7c4/sector_chords.json` | 530 | `455540267e6c9edf0f5f7904f68cfbf55d95593dd85b5b4f9bed917ed3bef2b4` |
| `code/quintic-mixed-sectors-codex-a7c4/sector_gram.py` | 5,437 | `8bcfcefaeabd48d0e5a2f2844bd9680319d62a2b3b47d1bb086d543e6fb2d94e` |
| `code/quintic-mixed-sectors-codex-a7c4/step_shoulder.py` | 5,740 | `410c38a1bb5c4967bc26ce97cf0e2a3a907ce8a2e2feef8a777ad3c1300303c1` |
| `code/quintic-mixed-sectors-codex-a7c4/transfer.py` | 4,829 | `ae6949855649dfcf2747fca03b052f98b5f090563cfc6ae9321dd22d0dff7ddb` |
| `sources/quintic-mixed-sectors-codex-a7c4/ALL_SECTORS.md` | 6,268 | `4544d89812ebf2f95c47d7674ccbdeeb58163643f399b67483d80ee9ccd72dd4` |
| `sources/quintic-mixed-sectors-codex-a7c4/GRAM.md` | 8,146 | `ffae0de83e80905623d59f4b6dc22661204347ac15fa8fe940419c8fe9507d94` |
| `sources/quintic-mixed-sectors-codex-a7c4/PROOF.md` | 9,336 | `211b4036734330f84ae88ab062b20509b05c4f40c7b4d4ce65cfa480d5bde5a7` |
| `sources/quintic-mixed-sectors-codex-a7c4/SHOULDER.md` | 3,910 | `bd888f2671961d52782cfc6508fc45e1a445637d16d94512a0c64d8955d3a319` |

## Degree-five sector moments and sharp cubic restriction (codex-a7c4, #843)

Rows 4.18n–p use the [payoff proof](sources/quintic-sector-moments-codex-a7c4/PROOF.md), the [cubic restriction theorem](sources/quintic-sector-moments-codex-a7c4/RESTRICTION.md) and the [exact replay](code/quintic-sector-moments-codex-a7c4/replay.py). The JSON file contains the six additional rational Stein profiles.

The [repricing](sources/quintic-sector-moments-codex-a7c4/SPIKED.md) in #855 uses the same six potentials. Its [control](code/quintic-sector-moments-codex-a7c4/fixed_prices.py) tests the loss from fixing the Hölder coefficients.

| File | Bytes | SHA-256 |
|---|---:|---|
| `code/quintic-sector-moments-codex-a7c4/angular.py` | 6,146 | `e3bf988a1f0f959c91386fcc2cd02344cc45824f3972360fdde3b6e1962e2c26` |
| `code/quintic-sector-moments-codex-a7c4/cover.py` | 8,927 | `9451d29b38dc2474996f1855e3dbdec5466273d5cd2bd358eff906c41b35b8ae` |
| `code/quintic-sector-moments-codex-a7c4/deformed_ray.py` | 8,375 | `37310f049ffff8d81c7bf155ebf8462dd09e0392cb15fd585ed2c9516fa4472c` |
| `code/quintic-sector-moments-codex-a7c4/fixed_prices.py` | 4,724 | `33195a492d2fb9acbd320b0e9974132a43ee547aa2075f24233b3e4c34389fe0` |
| `code/quintic-sector-moments-codex-a7c4/mass_gram.py` | 4,166 | `1c47283d80c92baaa02952ba1f59803540b3569ed9d09aa581e6e4122524bc4c` |
| `code/quintic-sector-moments-codex-a7c4/p7_stein_rows.json` | 32,525 | `dfa18dad3862681edb264977a4d4bedcaea79bbcb15509cb6677b7bbaa1e9338` |
| `code/quintic-sector-moments-codex-a7c4/replay.py` | 923 | `4ea75c251b7cefe9812b4bd522d0ea33771a50e6e7e3a3e2f61db006a425a4a3` |
| `code/quintic-sector-moments-codex-a7c4/restriction_controls.py` | 6,180 | `ea7ce48509d782aab28883318291371f966ea453d199c4bea2854ac52997e738` |
| `code/quintic-sector-moments-codex-a7c4/shape.py` | 6,606 | `2f2dfac48aa7110cd3aa9740ccbce67fc618381a1759045499a5f07d76837f2d` |
| `code/quintic-sector-moments-codex-a7c4/shape_deformed.py` | 4,048 | `8e67b5480f202779c61a65b37be6a4faa6cf5fdbd00c0966d21156f50030ff88` |
| `code/quintic-sector-moments-codex-a7c4/spiked_p7.py` | 5,109 | `b12f68177098efc5bd1603c67b1b6b719b9d896d65451071453de2fb293c693c` |
| `code/quintic-sector-moments-codex-a7c4/test_mass_gram.py` | 3,692 | `7a03e865c7117a07dc5154b8fcb54fba17fffd2b05926f8677dffbb6e3737bab` |
| `code/quintic-sector-moments-codex-a7c4/test_spiked_p7.py` | 2,166 | `5f97cced0673370e9564a523e52dde361d0d7a15583ce9c56c450ebafa8ee15e` |
| `sources/quintic-sector-moments-codex-a7c4/ANGULAR.md` | 5,474 | `d4830b49cea5e4add2e48fe83a6caad05cf04f3d7c6c349aafb40a2759712efb` |
| `sources/quintic-sector-moments-codex-a7c4/DEFORMED.md` | 7,337 | `2b96029f12cd83691d23a3773072dd558520d4528e0a6e4241b73047857694c9` |
| `sources/quintic-sector-moments-codex-a7c4/MASS_GRAM.md` | 3,581 | `5c84206fed3ff9b8a85eeaba49d5f68e304ae659f3c659c4b1b94a1ad2f93da5` |
| `sources/quintic-sector-moments-codex-a7c4/MOMENTS.md` | 4,673 | `3a0faa44017d7698a4383c8acbc7e619a09a372428e93bc039844d9b0d73f1c0` |
| `sources/quintic-sector-moments-codex-a7c4/PROOF.md` | 4,599 | `e0971e623cd05d9f2eba684052e9e427941497e4dadb6ee89aba1930cca4c20c` |
| `sources/quintic-sector-moments-codex-a7c4/RESTRICTION.md` | 6,581 | `820d4c90f12c0e89abf7f5b363f561598f91adcaeed2e441345198fd6e37455a` |
| `sources/quintic-sector-moments-codex-a7c4/SHAPE_DEFORMED.md` | 2,721 | `a0221f3935bad6e24f92010d8b7e6e8007ebfb96ff32fcfd8f843c495a1500a0` |
| `sources/quintic-sector-moments-codex-a7c4/SPIKED.md` | 8,935 | `8b82902d1f0ace6065ef300a4e93d612481aa05827b5f28e56fb5773f9ba6f82` |

## Unrestricted angular-product strips (codex-a7c4)

Row 4.18q extends the [fourth-excess cover](sources/quintic-product-support-codex-a7c4/COVER.md). The verifier recomputes all potential, price and cell inequalities from the checked-in inputs.

| File | Bytes | SHA-256 |
|---|---:|---|
| `code/quintic-product-support-codex-a7c4/crossing_row.json` | 5,286 | `968196255ed511805bbc00aa03313602a77b90f154491e9bfc63f2f013dbff23` |
| `code/quintic-product-support-codex-a7c4/p7_product.py` | 2,978 | `66b6584cc8dd2f0e55563725eae8dd87ac05fc245039bbee52568b8de874d5d2` |
| `code/quintic-product-support-codex-a7c4/p7_product_rows.json` | 21,572 | `79ac8940d6cfe4a1b6fa6877751cf7966c84cda3b8a1502bf861c521a3886e32` |
| `code/quintic-product-support-codex-a7c4/product_cover.py` | 9,546 | `3b7db24fd5517d0817b233dc3a7cef1f14e7b06b67902e06253ce3a0e437728b` |
| `code/quintic-product-support-codex-a7c4/step_charges.py` | 11,145 | `5ae65e9ac8c243c1dcd78651ce549cc69230f3037ef2319c3a7d74c5461a0a7a` |
| `code/quintic-product-support-codex-a7c4/symmetric_product.py` | 1,828 | `a98854ba27e99aead627c03677850c3361d210655865ae0e7de8a1ebcbc17ba9` |
| `code/quintic-product-support-codex-a7c4/test_symmetric_product.py` | 1,256 | `82feb13b22b067ef418721c3c05ec19ec2e8ce9d92d18de7724d0b1e41048e63` |
| `code/quintic-product-support-codex-a7c4/wide_row.json` | 5,288 | `ddf5d49ae0f3918aa662f635593adf5fbdc53b331f817ea76db8ebfd356970f5` |
| `sources/quintic-product-support-codex-a7c4/COVER.md` | 4,109 | `64815128c4043f2961507b6f7e1b6e0593c8964d27348d7c41e5e1d994b4f4ab` |
| `sources/quintic-product-support-codex-a7c4/PRODUCT.md` | 5,538 | `3277a58ecaaa65a3c2c6a09abbf7df9c2d0883a751eaaf9d709327e775b2b6d1` |
| `sources/quintic-product-support-codex-a7c4/RADIAL_CHARGE.md` | 2,959 | `6c5fa9380e0e3b833dbc1688d1dc2558a569ba88e4c32eefd73d07ec3ae03573` |
| `sources/quintic-product-support-codex-a7c4/SYMMETRIC.md` | 2,063 | `2e164ad1a50fd1c54a0f9a49e7c81df33268ac314e08527ebcb24e4470155500` |

## Matched sector prices and the rank-one quartic (codex-a7c4)

Row 4.18r uses the [common sector constraints](sources/quintic-sector-frontier-codex-a7c4/SHOULDER.md), an explicit feasible tuple for the previous scalar relaxation and the rank-one sum-of-squares bound.

| File | Bytes | SHA-256 |
|---|---:|---|
| `code/quintic-sector-frontier-codex-a7c4/joint_sector.py` | 9,841 | `9b5969309bb5923c2294fa5563ad6353fcd0819f989aaed1d4e03a90de911121` |
| `code/quintic-sector-frontier-codex-a7c4/matched_coefficients.py` | 1,217 | `86f9d15b5a47915ac5d457eaea9dce70dcbf039a4504e85a741edd5c357329b3` |
| `code/quintic-sector-frontier-codex-a7c4/point.py` | 3,853 | `2e32084e1387218ab72f2a01dea12686c641e113c68901657b0e9d003b3f2848` |
| `code/quintic-sector-frontier-codex-a7c4/prices.json` | 270 | `f3335f17d2e74fa0553e49dae6e3082022a81da328f186366c8bb749445a4483` |
| `code/quintic-sector-frontier-codex-a7c4/rank_bound.py` | 2,259 | `258c721af50ed35cb945da2da97beeea58c3b7cb746b54bd921cafaf81be0116` |
| `code/quintic-sector-frontier-codex-a7c4/rank_one.py` | 3,617 | `cc737b40c77b719cc1735310c07eb33d4a6df0c7c9820582f6ea253734c4326e` |
| `code/quintic-sector-frontier-codex-a7c4/rank_sos.json` | 1,343 | `d4c76a7819d4490417dd36f4e36438251893ff4b2eff267b36950214c7fc8e0a` |
| `code/quintic-sector-frontier-codex-a7c4/sector_prices.py` | 2,003 | `cbf1b185cdff4f9a04cf401d63589e97d2bbb6ef6d7d2507e349eaaf15685d24` |
| `code/quintic-sector-frontier-codex-a7c4/shoulder.py` | 10,662 | `9689bb0492677aa53a4fc508e6090992073dc56cfff9cf1dbdc6cb0806df7943` |
| `sources/quintic-sector-frontier-codex-a7c4/MATCHED.md` | 6,575 | `6a1029ee19f85b5c5fd6e1bb691acee32fbdbb27ccb8a048455b800c4849e9fb` |
| `sources/quintic-sector-frontier-codex-a7c4/POINT.md` | 3,175 | `79c2b7acd3c5b87b8238e3a906a5a6508bdceb4792579d6371a315e9ef1590c4` |
| `sources/quintic-sector-frontier-codex-a7c4/RANK_ONE.md` | 3,502 | `94d279e969526b7298050e49da04a428639acc7fbc177925e8df4dc2855883e5` |
| `sources/quintic-sector-frontier-codex-a7c4/SHOULDER.md` | 5,594 | `af07439d24d49df02a3228a91b3687d1d32764073665834dfbabb62ec2813267` |

## Antisymmetric slice-Gram inequality and $c \to 0^+$ retained-defender saddle bounds (gemini-4c4c, 28 November 2026, #849; STATUS 4.57, tag S0RG)

All files of `S0RG` are committed in the repository (< 75 KB per file), with zero external dependencies in `verify.py` and `test_controls.py` and SHA-256 provenance + exact `(id, game, t_key, e1, eta, cap_upper)` binding to `code/degree5-stage0/results/b/{gC,g83,g84,gA}/rows_all.lines`:
- [`sources/stage0-retained-gram-gemini-4c4c/PROOF.md`](sources/stage0-retained-gram-gemini-4c4c/PROOF.md): self-contained proofs of Theorem 1 (4-channel slice-Gram decomposition of `ctC` in `Grothe/LowerAnalytic/GramTensor.lean`, antisymmetric involution inequality $4\lVert C_{--}\rVert_{\mathrm{HS}}^2 = n + b - (3y - z) \ge 0$, three sharp dimension-free chaos bounds, and rational 5-scalar counterexamples), Theorem 2 (retained-defender gate-free dual rows across all $n \ge 2$ and $O(c^8) = O(D^2)$ vanishing of scalar $\nu_5$ re-optimisation), Theorem 3 (exact Bargmann–Laguerre $c \to 0^+$ quadratic/local diffuse-spike saddle at $\sigma = \sigma_*$ across all $d \ge 1$ and 4-term SOS collapse onto $e_{2,1}$), and Theorem 4 (zero-`erf` full-line Radon shifted-polar reduction, `Jet2` iterated midpoint enclosure, $r \ge 5$ analytic tails, and outward-rounded $c \to 0^+$ bounds at 9 Stage 0 sample rows; finite gate points $c > 0$ and off-peak $\sigma \ne \sigma_*$ remain open, so Stage 0's stop rule is not yet discharged).
- [`code/stage0-retained-gram-gemini-4c4c/`](code/stage0-retained-gram-gemini-4c4c/):
  - `python3 -IB research/higher-degree/code/stage0-retained-gram-gemini-4c4c/verify.py` (and `python3 -IB -O ... --quiet`): zero-float, zero-`assert` Python 3 stdlib verifier performing AST self-audit, symbolic, $\mathbb{Q}[i]$-tensor & physical Gaussian Wick polynomial verification, SHA-256 + row/weight/cap/flag pinning across all 9 sample rows, and from-scratch outward `Jet2` interval re-integration.
  - `python3 -IB research/higher-degree/code/stage0-retained-gram-gemini-4c4c/test_controls.py` (and `python3 -IB -O ...`): 23-check adversarial corruption and mathematical negative-control suite.

| file | size | SHA-256 |
|---|---:|---|
| `sources/stage0-retained-gram-gemini-4c4c/PROOF.md` | 65,684 B | `b7a6fb955282bd82603ac833827aac7e514956893bda4a2c8a7f625ba1419704` |
| `code/stage0-retained-gram-gemini-4c4c/README.md` | 4,292 B | `3e79b2b618b473f2d6730ab31e529a53829fa8bd60eec5f167f0fd185c8aaa2f` |
| `code/stage0-retained-gram-gemini-4c4c/verify.py` | 74,521 B | `7e20c250c35b747244470fb55c8b6ec72e8e015196e0f9812390428a0801066b` |
| `code/stage0-retained-gram-gemini-4c4c/test_controls.py` | 11,368 B | `563f3213887b057622b9bef9c915002c6a8bd9f87e9945e746e1eca2cce34e90` |
| `code/stage0-retained-gram-gemini-4c4c/make_cert.py` | 6,658 B | `b2db7bb4ebf1ae4b3f50156def0e854bcd5ecf3923dfb4d6f0c65b9d36706439` |
| `code/stage0-retained-gram-gemini-4c4c/cert_stage0_gram.json` | 14,532 B | `43629bc0fb30ea5c445318d70f5d4edeb27c9696f6b203c4b44620c9282f877c` |
