# Inventory: what is kept outside the repository

The working folder of this record is `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/claude-research-2026-11-15/`
(git-ignored). Copied into `code/`:
- the scripts of `primal-dual/` (with `results/round3/*.py` in `code/primal-dual/round3/`);
- the scripts of `degree5-cert/code/` (in `code/degree5-design/`);
- the scripts of `literature/checks/degree5-row/`, `degree5-milestones/` and `higher-degree/`;
- six small result files, listed below.

Everything else stays in the working folder:
- `primal-dual/results/` (2.9 MB): the cutting-plane logs and JSON files of yo, big and big2_final, the refinement logs, the
  round-3 tail and Krivine runs, and the `.npy` archives of the Z3 checks;
- `degree5-cert/out/` (logs of the design runs) and `degree5-cert/dl-hjm/`, `degree5-cert/dl-saha/` (TeX sources of
  arXiv:2609.25462 and arXiv:2608.11158, downloaded by the design worker);
- `literature/BIBLIOGRAPHY.md` and `literature/IDEAS.md` (reading notes; IDEAS item CXO is refuted by
  `../conjecture-K/STATUS.md` §14 item 5), and the other scripts of `literature/checks/`.

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
