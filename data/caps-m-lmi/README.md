# S-lemma multiplier fixes for failing localised pieces (route M, row 14)

Search data, not certificates: every fix must pass the Lean checker (`pieceOKc`, the native range facts).

**Exports** (`exportPieces`, `Grothe/LowerAnalytic/CapExport.lean`, droplet, 26 Oct 2026), one JSON line per piece,
on the piece's stored grid:

- `exp_14x150.jsonl`: piece 0.
- `exp_14x200.jsonl`: pieces 0–6, 12, 18, 24, 30.
- `exp_14x280.jsonl`: pieces 0, 1, 2, 5, 6, 31, 32, 36, 98, 99, 103, 104, 129. These failed on the coarse 400×128
  grid; on the stored 1600×256 grid only 0, 5, 98 and 103 fail with the stored multipliers.

**Solutions** (`tools/caps_lmi.py solve`): `sol_14x150.json`, `sol_14x200.json`, `sol_14x280.json`. Per piece:

- `status`: `fixed` or `cap_up` means the rounded rational matrix passed the Python Fraction LDLᵀ test;
  `fail` means the search found no accepted witness, not proven infeasibility;
- `lm`: rational `[λ, μ]` per constraint, in the order of the piece's constraint string;
- `cap_up`: a sufficient feasible increase for the exported matrix, after exact rational checking; minimality
  and the necessity of any increase are unproved;
- `t_opt`: the SDP solver's numerical estimate of the optimal scaled smallest eigenvalue;
- `min_eig_refined`: the smallest eigenvalue estimate after the 60-digit refinement, not an interval enclosure.

No exact dual certificate or certified optimal value is produced. The rational matrix witnesses remain proposals
for the Lean pipeline: `pieceOKc` must check the actual piece's enclosure and multiplier admissibility as well as
LDLᵀ. A node also needs valid tables, the polynomial checks, every piece check and `capCoverOK`. The named Lean
re-checks below do not certify all exported pieces, the complete node, or a changed lower cover.

| node | failing (stored multipliers) | fixed, no cap change | feasible cap increase found | Lean re-check (`pieceOKc`) |
|---|---|---|---|---|
| 14:150 | 0 | 0 | — | piece 0: true |
| 14:200 | 0–6, 12, 18, 24, 30 | 1–6, 12, 18, 24, 30 | piece 0: +2.59e-9 | pieces 1, 6: true |
| 14:280 | 0, 5, 98, 103 | all four | — | pieces 0, 103: true |
