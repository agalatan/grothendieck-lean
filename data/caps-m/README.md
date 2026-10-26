# Data of the caps route M (rows 12–15, t = 0.84–0.855)

- `pieces.json` — every vertex node of rows 12–15 that has a MIDCAPS certificate: 358 nodes, 16,719 constrained
  pieces (the certificate with the fewest pieces per node). Generated on 2026-10-23 by
  `GROTHE_HANDOFF=<main checkout>/handoff python3 tools/gen_cap_pieces.py json data/caps-m/pieces.json` from
  `handoff/lower-stein/cert-0745e/row_<t>.json` and `handoff/lower-stein/cert-0745{d,e}/midcaps/*.json`
  (git-ignored archive). This file is now the canonical input of `tools/gen_cap_pieces.py lean …`.
- `node-recipes/recM_<t>.json` — anchored proposal recipes (route A) for all vertex nodes of rows 12–15, made by
  `~/grothe-cx/t4/pkg/propM.py` on the droplet (m from `proposal_m.propose(row, s)`, v0 = m + s·a, no variance,
  scale 1). They pass the Lean node check on grid 1 except in the MIDCAPS windows (see docs/CAPS_M_STATUS.md §2).
- `pd3-results.txt` — raw output of the piece diagnostic (nodes 14:150, 14:200, 14:280).
