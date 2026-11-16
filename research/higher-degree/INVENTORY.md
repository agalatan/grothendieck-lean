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
`CERT_STAGE2.md`, `CERT_STAGE2B.md`, `SMALL_T.md` and `CONTENT_LEMMA_D5.md`. Their code and outputs stay in the working
folder `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/`:
- `capgate/` (1.3 MB): the gate of 4.16;
- `cert2/` (44 MB) and `cert2b/` (41 MB): the certificate of 4.17. `cert2b/replay2b_all.py` is the single replay
  checker; its logs are `cert2b/out/replay2b_*.log`;
- `smallt/` (1.1 MB): the 412 certificates of 4.18, with `reverify.py` and the exact `assemble.py`;
- `content5/` (7.6 MB; the folder is in use and grows): the scripts and outputs of 4.19 (`code/`, `out/`). Copied
  from it into `code/degree5-content/`:
  the profile generator (`prof.py`, `tilt.py`), `rows5.lines`, `rowlib.py`, `t4lib.py`, `t4fam.py`, `rice.py` and
  `lawstein.py`, unedited. The six JSON tables `code/degree5-content/profiles/band_row_<t>.json` were exported from
  its `out/prof_<k>.npz` (k = 5, 7, 9, 10, 11, 12) by `export_profiles.py`; `check_profiles.py` and its log check
  them against the definitions. The `.npz` tables, the searches and the logs stay in the working folder.

The certificate needs python-flint; it ran on a rented droplet whose run folders are deleted.

## The searches in more than two variables (16 November 2026)

`code/degree5-content/searches-2026-11-16/` holds the logs of the searches of STATUS 4.28: `b2_rows_n3.log`,
`b2_rows_n4.log` (the largest sector-A ratio per row and energy in three and four variables), `b2_gen5_5_n5_rice.log`,
`b2_gen5_5_n5_free.log`, `b2_gen5_5_n6_free.log` (five and six variables, row 0.80) and `b2_relax_9_cs.log` (the relaxed
problem over cofactor laws with Cauchy–Schwarz constraints, row 0.84). The search scripts (`b2_*.py` with `r4lib.py`
and the kit) and the JSON files of the maximisers stay in
`/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/degree5-cert/content5/`
(`code/`, `out/`): they are one worker's working files and have not been reviewed.
`sources/content-problem-v2-2026-11-16/PROBLEM_V2.md` is the problem statement handed to outside sessions; its `kit/`
is `code/degree5-content/`.
