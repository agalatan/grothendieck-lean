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
| `src6/`, `src18/` | 4.7 MB | the inputs extracted from git for the first pass (`code/fetch_sources.sh` recreates them from the pinned commits, with `cell-inputs.npz` in addition). The copy of `Parameters.lean` in `src6/` predates the exact `deltaCertQ` of master; the numbers the scripts read are the same |
| `tails-2026-11-24/` | 252 KB | the second pass (STATUS §4): `cell_grades.py`, `cmp_grades.py`, `cell_heads.py`, `schur_tail.py`, `mixture_real.py` (copied into `code/`), their JSON results (copied, except `grades-125.json`, whose content is the first 126 entries of `grades-250.json` computed at 1536 bits) and their logs (not copied) |
| `rerun-2026-11-24/` | 212 KB | the run of the README's chain from `code/` on the laptop (every command except `cell_grades.py` and `schur_tail.py`): its logs, and the JSON files it wrote, which are the ones of `code/` |

SHA-256 of the result files of `code/` (the first six are also in `rerun-2026-11-24/`, the last two in
`tails-2026-11-24/`):

| file | SHA-256 |
|---|---|
| `results.json` | `1168043b4943aed27a80f700a2e13edf6e454dfd5a557fa9dd902bfb30aa51c0` |
| `colgen.json` | `5a19984fb006ab5fdd7775b322f19ddd04b8a108099fe5d060c966a8a62a9c54` |
| `colgen2.json` | `8bba811ee94cc255a943864b34d73dd2f066c5bbf8664c3e76754994babc30cc` |
| `colgen3.json` | `bccb332871d1093f862919a209bc3a49e10e98e3bec647ac9fbd89ac61be799b` |
| `mixture_real.json` | `65813b95b42ec4f76858b3aa376b081eb9a9f183d7a37333cf7b51fbb2e39786` |
| `heads-250.json` | `721f5c6903191903419740e32c147437e302b90150411a79228264f60efc30f4` |
| `grades-250.json` | `d7f106c65604e22b2817bc7fb06c6f4d2922605b2807f34eb75f6404a8fcd93b` |
| `schur_tail.json` | `8333f32c2beebcd2ddd65047bf1d659b8c40b97f0187a7f716fba4cc6612eae3` |

Outside `code/`: `channels/channel-21.json` (the committed cell channel)
`b9c9148d44dc38d54e651a4234c2f7be69983bc82d91ea5a57b063c87c78535c`; `tails-2026-11-24/grades-125.json`
`92dcb3d02ea761ad32ac4dd8c6450739d4a9225a27b3b676dc631474b4b87b32`. The JSON files of the first pass and
`tails-2026-11-24/mixture_real.json` in the working folder are earlier outputs of the same scripts without the exact
allowance fields; the values the ledger quotes are the same in both.

Inputs that live in git, not in this folder:

- the six-channel data: `Grothe/UpperSix/Haagerup/Parameters.lean` and `Grothe/UpperSix/Haagerup/Data/OverlapData.lean`
  at master commit `f6620f3b6bb3a8defc0ab37569eb744e4afa4726`;
- the eighteen-channel data: commit `76c4647b7de50c89aba82da63a3ee3d37f7c0cc3`, the head of pull request #556
  (`refs/pull/556/head` of origin; its branch `gemini-1aa9/upper-mixture` is deleted): `data/upper-replacement/` (`cell-inputs.npz`, 15.8 MB, SHA-256
  `cd95bb2964de41113752e8df8ab40cc91beee1d7506413e1953004917578df9b`, the hash of its `manifest.json`;
  `exact-columns.json`), `data/upper-preprocess/certificate.json`, `Grothe/Upper/Data.lean`,
  `Grothe/UpperReplacement/RootData.lean`, `Grothe/UpperReplacement/HeadWitnessFacts/Group00.lean`–`Group07.lean`
  and `tools/replay_private_upper_budget.py`, whose interval routines the scripts import.

No log is kept in the repository.

**Eighth channel (26 November 2026, #723).** The run was on the droplet `yo`, in the folder
`~/claude-b9ee-eighth`, which is deleted. Its logs and small JSON results are in `code/eighth-channel/`. Only the
intermediate `columns.json` (0.96 MB) was not kept: `columns.py` rebuilds it in two minutes.
