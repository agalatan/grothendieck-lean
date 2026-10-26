# Speed tools for the node-cap pieces (route M, rows 12–15)

Issue #42. Tools that make the search for fixes of failing localised pieces fast. They are search tools only:
every proposal must pass the Lean checker (`pieceOKc`, the native range facts of the pipeline).

## Where the time goes (profiled 25–26 Oct 2026, droplet, shared load ≈ 10)

One piece on the 1600 × 1024 grid, measured inside `lake build` of a module with `#eval`
(`GrotheKernel` is precompiled and runs natively; `Grothe/LowerAnalytic/*` definitions are interpreted):

| step | where | time |
|---|---|---|
| tables `mkTables` 400×128 / 1600×256 / 1600×1024 (once per run) | `Grothe/LowerAnalytic/CapTables.lean`, interpreted | 7.6 s / 19.5 s / 20.1 s |
| coverage `capCoverOK` (one node) | interpreted | 0.04 s |
| prices + interval enclosure `mkGrid` + `matI` + `loQ`/`hiQ` | `GrotheCapsKernel/CapCheck.lean`, **native** | **≈ 180–190 s** |
| exact constrained check `pieceOKc` (13×13 LDLᵀ over ℚ) | `Grothe/LowerAnalytic/CapConstr.lean`, interpreted | ≈ 32–36 s |

Consequences:

* A compiled executable (`lean_exe`) would only remove the interpreted share (≈ 15% per piece). It would also need
  every imported module, Mathlib included, compiled to C. It is **not worth it**.
* The expensive part, prices and enclosures, does **not depend on the S-lemma multipliers** λ, μ: they enter only
  the final 13×13 matrix, and linearly. The old fix search (`CapPDE`–`CapPDG`: up to 8 scalings × 11 cap increments,
  each a full exact check) cost up to ≈ 50 min per piece. Exporting the matrices once and searching on them costs
  one export (≈ 3.5 min per piece) plus ≈ 15 s.
* Speeding up the certified checks themselves would need changes to `matI` (it memoises 4 interval weights per
  cell, ≈ 6.5 M big-integer intervals and ≈ 8 GB RSS on 1600 × 1024). Moving the table computation
  (`CapTab.*`, plain ℚ arithmetic) into the precompiled `GrotheKernel` would also help. Both touch certified code;
  see #13.

## Tools

### 1. `Grothe/LowerAnalytic/CapExport.lean` (Lean, built by CI, no `#eval`, not part of any certificate)

`exportPieces path node js` writes one JSON line per piece `j ∈ js` of a piece node `(k, i, dirs, pieces)`, computed
with the checker's own functions (`mkGrid`, `matI`, `loQ`, `hiQ`, `loewnerUp`, `pieceN`, `Cons.sMat`, `pieceOKc`):

* `N`: the unconstrained matrix at the stored cap + `capPad`;
* per constraint, `A` (= `sMat` at λ = 1, μ = 0), `B` (λ = 0, μ = 1), `lo`, `hi`, and the stored λ, μ;
* `ok` (= `pieceOKc` with the stored multipliers), `encl`, `polyOK`.

The checked matrix is `N − Σ_c (λ_c A_c + μ_c B_c)`. Run it from a throwaway module inside a `lake build`, so the
precompiled kernel is loaded (`lake env lean file.lean` interprets everything: about 50× slower). Example
(droplet, node data as a `List (Nat × Nat × List String × List String)` such as the generated
`CapPieces/D<k>x<i>.lean`):

```lean
import Grothe.LowerAnalytic.CapExport
import Grothe.LowerAnalytic.CapPieces.D14x200
open Grothe.LowerAnalytic
def run : IO Unit := exportPieces "/home/agalatan/<dir>/exp_14x200.jsonl" pieceNode_14x200 [0, 1, 2]
#eval run
```

Start it as a process group (`AGENTS.md` §12). The output file is appended and flushed after every piece.

**Re-checking a fix in Lean**: export the piece again, with its constraint string edited to the new multipliers.
The `ok` field is then `pieceOKc` itself.

### 2. `tools/caps_lmi.py` (Python; needs numpy, scipy, mpmath, cvxpy; droplet: `~/grothe-cx/venv/bin/python3`)

```sh
python3 tools/caps_lmi.py solve EXPORT.jsonl OUT.json        # per piece: fixed / cap_up / fail
python3 tools/caps_lmi.py apply PIECES.json OUT.json NEW.json # new multipliers into a pieces file
```

Per piece:

1. **Semidefinite program** (cvxpy, Clarabel): maximise t subject to S K(λ, μ) S ⪰ t I, λ, μ ≥ 0, and λ = 0 on
   halfspaces, where S is a diagonal scaling.
2. **Refinement:** the solver's accuracy (~1e-8) can be coarser than a piece's margin (1e-10 occurs), so the point
   is refined by Nelder–Mead on the smallest eigenvalue of S K S, computed with mpmath at 60 digits.
3. **Exact test:** the multipliers are rounded to rationals and K is tested exactly (Fraction LDLᵀ, the same test
   as `ldlOK`).
4. **Fallback:** if the search finds no accepted multipliers at the stored cap, use an SDP to propose a cap increase
   `cap_up`, then enlarge it as needed until the exact rational test passes. This is a sufficient feasible increase;
   the tool does not prove it is minimal or that the stored cap is infeasible for every multiplier choice.

The SDP and high-precision eigenvalues guide the search. Only the Fraction LDLᵀ test verifies feasibility of the
rounded rational matrix for the frozen export; no exact dual certificate or certified optimal value is produced.
A solver failure means that this search found no accepted witness. The Lean `pieceOKc` re-check also checks
enclosure sanity and multiplier admissibility on the actual piece data. A node certificate additionally needs
valid tables, the polynomial checks, all piece checks and `capCoverOK`; individual matrix witnesses do not establish
the whole node or lower cover.

A cap increase changes the row's stored cap (`rowData`, the lower cover), not the pieces file. `apply` only records
it.

## Results (row 14, 26 Oct 2026; data in `data/caps-m-lmi/`)

| node | grid | failing with stored multipliers | fixed with no cap increase | feasible cap increase found | Lean re-check (`pieceOKc`) |
|---|---|---|---|---|---|
| 14:150 | 1600×1024 | 0 | 0 (λ 0.0701351 → 0.0701396) | — | piece 0: **true** |
| 14:200 | 1600×1024 | 0–6, 12, 18, 24, 30 | 1–6, 12, 18, 24, 30 (margins 5e-5 … 1e-2) | piece 0: **+2.59e-9** (no accepted zero-increase witness found) | pieces 1, 6: **true** |
| 14:280 | 1600×256 | 0, 5, 98, 103 (the other coarse-grid failures pass on the stored grid) | all four (smallest margin 6.6e-8, piece 0) | — | pieces 0, 103: **true** |

Conclusion for #14: of 16 failing pieces at three nodes, the search found rational matrix witnesses for 15 with
new multipliers and no cap change. For 14:200 piece 0 it found a witness with a cap increase of 2.6e-9;
necessity of that increase is unproved, and whether the lower cover tolerates it is a separate check. The listed
Lean re-checks cover only the named pieces. For the campaign (#16): run `exportPieces` on every piece whose check
fails, then `caps_lmi.py solve`, then `apply`, then regenerate the pieces' Lean data.

## Timings

| task | before | after |
|---|---|---|
| fix search, one failing piece (1600×1024) | up to ≈ 50 min (`CapPDE`–`CapPDG` grid of 88 exact checks) | ≈ 3.5 min export + ≈ 15 s search + ≈ 4 min Lean re-check |
| per additional multiplier trial | ≈ 35 s (interpreted exact check) | milliseconds (float) / ≈ 0.1 s (60-digit eigenvalues) |
