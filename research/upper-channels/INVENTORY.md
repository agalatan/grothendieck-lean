# Inventory: what is kept outside the repository

The working folder of this record is
`/Users/alingalatan/workspaces/grothe/handoff/union-mixture-2026-11-24/` (git-ignored; 5.5 MB). The computations ran
on a temporary droplet (`mega`, folder `~/claude-b9ee-union`), which is destroyed; every result was copied back
before, and nothing exists only there.

| path (under the working folder) | size | what it holds |
|---|---:|---|
| `channels.py`, `analyse.py`, `colgen.py`, `colgen2.py`, `colgen3.py` | 34 KB | the scripts of the first pass; copied unchanged into `code/` |
| `results.json`, `colgen.json`, `colgen2.json`, `colgen3.json` | 27 KB | their results (STATUS §1–§3); copied into `code/` |
| `channels.log`, `analyse.log`, `colgen.log`, `colgen2.log`, `colgen3.log` | 29 KB | their logs; not copied |
| `channels/channel-00.json` … `channel-23.json` | 432 KB | the 24 head vectors as 2⁻¹²⁸ intervals (output of `channels.py`, the directory `out` of the README's commands); not copied, reproducible in under a minute |
| `src6/`, `src18/` | 4.7 MB | the inputs extracted from git on 24 November (`code/fetch_sources.sh` recreates them, with `cell-inputs.npz` in addition). The copy of `Parameters.lean` in `src6/` predates the exact `deltaCertQ` of master; the numbers the scripts read are the same |
| `tails-2026-11-24/` | 252 KB | the second pass (STATUS §4): `cell_grades.py`, `cmp_grades.py`, `cell_heads.py`, `schur_tail.py`, `mixture_real.py` (copied into `code/`), their JSON results (copied, except `grades-125.json`, whose content is the first 126 entries of `grades-250.json` computed at 1536 bits) and their logs (not copied) |

SHA-256 of the result files:

| file | SHA-256 |
|---|---|
| `results.json` | `22c7f3cc1f0d6143d6dabb22ba261715d6a91f0f69712938c683f6e46a3e8f4e` |
| `colgen.json` | `90d25138041dbf1f343718be56cf7fa277f20b3276e2943f455f3c5b7d686fdf` |
| `colgen2.json` | `b591042c234b970ac06285aed40ffcf605b7b43246737bb9c81a8ff19e5d252b` |
| `colgen3.json` | `1e3827f42104f9cc2db89425b4b27cf6661001e7df238d4a27a51af99bed7e61` |
| `channels/channel-21.json` (the committed cell channel) | `b9c9148d44dc38d54e651a4234c2f7be69983bc82d91ea5a57b063c87c78535c` |
| `tails-2026-11-24/grades-125.json` | `92dcb3d02ea761ad32ac4dd8c6450739d4a9225a27b3b676dc631474b4b87b32` |
| `tails-2026-11-24/grades-250.json` | `d7f106c65604e22b2817bc7fb06c6f4d2922605b2807f34eb75f6404a8fcd93b` |
| `tails-2026-11-24/heads-250.json` | `721f5c6903191903419740e32c147437e302b90150411a79228264f60efc30f4` |
| `tails-2026-11-24/schur_tail.json` | `8333f32c2beebcd2ddd65047bf1d659b8c40b97f0187a7f716fba4cc6612eae3` |
| `tails-2026-11-24/mixture_real.json` | `aa1f55efc5ab5827e95943758c76fd5083540c7b4258bf674a1afa63ee181c9f` |

Inputs that live in git, not in this folder:

- the six-channel data: `Grothe/UpperSix/Haagerup/Parameters.lean` and `Grothe/UpperSix/Haagerup/Data/OverlapData.lean`
  on master;
- the eighteen-channel data: branch `origin/gemini-1aa9/upper-mixture`, commit
  `76c4647b7de50c89aba82da63a3ee3d37f7c0cc3`: `data/upper-replacement/` (`cell-inputs.npz`, 15.8 MB, SHA-256
  `cd95bb2964de41113752e8df8ab40cc91beee1d7506413e1953004917578df9b`, the hash of its `manifest.json`;
  `exact-columns.json`), `data/upper-preprocess/certificate.json`, `Grothe/Upper/Data.lean`,
  `Grothe/UpperReplacement/RootData.lean`, `Grothe/UpperReplacement/HeadWitnessFacts/Group00.lean`–`Group07.lean`
  and `tools/replay_private_upper_budget.py`, whose interval routines the scripts import.

No log is kept in the repository.
