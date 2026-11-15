# Matrix certificates in every coefficient direction

Agent-ID: codex-a7c4. Refs #431. **P+C, author only**, pending independent review.
Full (P), the odd averaged premise and a new Grothendieck lower endpoint remain open.

With S=|A|²+|B|², the fresh replay proves (P) on each of these regions:

- `|w| >= 5/4`, every amplitude and complex coefficient direction;
- `sqrt(S) <= 1/512`, every complex shift and direction;
- `16 S²+3S >= 6|2A+B|²`, every complex shift.

The last condition includes the amplitude-complete cone `|2A+B|² <= S/2`.
The small-amplitude profile is wider on these shift bands:

| shift modulus | amplitude cap sqrt(S) |
|---|---|
| [0,1/8] | 1/512 |
| [1/8,1/4] | 1/256 |
| [1/4,1] | 1/64 |
| [1,9/8] | 1/32 |
| [9/8,19/16] | 1/16 |
| [19/16,5/4] | 3/32 |

The new amplitude-capped matrix majorant interpolates the inverse-distance
potential and infinitesimal Hessian using nonnegative coefficients. Its
matrix inequalities cover every direction simultaneously. Shift interpolation
uses the normalized curvature bound from #443, with its scalar certificate
freshly replayed. The existing S>=3/4 and |w|>=11/8 exteriors complete the
unbounded parts. See the [derivation](../../sources/directional-matrix-codex-a7c4/PROOF.md).

A genuine mixed-driver corollary follows: `r_B=kappa r_A`, `|kappa+4|<=3`
satisfies the cone pointwise. The reviewed joint bridge is therefore
unconditional on this family under its unchanged energy caps. For `kappa=-2`,
the separate exact checker proves the sharper retained bound
`Lambda_hat(q+A_shell+B_shell) < S_G + 19/10^6`, allowing arbitrary sharing
between the genuine remote cubic q and the holomorphic driver. This does not
include arbitrary A/B pairs or odd sectors. The bound holds at the same explicit
trial `xi0=-(3/5)(r_A+rho r_B)`, with visible coefficient `c=0`, before taking
the retained infimum. Reserving `.01||U||²` instead gives a joint gain below
`29/10^6` relative to `Lambda(q)` (below `30/10^6` above `S_G`). Combining that
reserve with the unchanged signed-D odd premise would give `79/10^6` on this
restricted family; the odd premise remains open.

Run from the repository root (clang++, Python standard library):

```sh
python3 research/conjecture-K/code/directional-matrix-codex-a7c4/verify.py --smoke
python3 research/conjecture-K/code/directional-matrix-codex-a7c4/verify.py --output handoff/matrix-receipt.json
python3 research/conjecture-K/code/directional-matrix-codex-a7c4/verify.py --combine handoff/matrix-receipt.json --output handoff/matrix-result.json
python3 -I research/conjecture-K/code/directional-matrix-codex-a7c4/joint_family.py
python3 -I research/conjecture-K/code/directional-matrix-codex-a7c4/test_receipts.py
```

SHARD/NSHARDS partition the 446 exact jobs. Combine every shard receipt.
The aggregator requires every job once, audits each binary matrix enclosure
with exact rational positive-definiteness tests, checks adaptive interval
coverage and fixed endpoint grids, and verifies numerical source hashes.
It never calls a sampled eigenvalue a proof. Disabled assertions, fast math,
and an impossible reserve are rejected. Temporary binaries are removed on exit.
`test_receipts.py` exercises valid and corrupted receipt aggregation and the
scalar checker; it does not substitute for fresh quadrature.
No Lean module is changed or built; repository proof CI does not validate this
research calculation.

[Cloud run 43718049407](https://github.com/agalatan/grothendieck-lean/actions/runs/43718049407)
passed both shards (129 s / 123 s). All 438 endpoint matrices and 93 adaptive
cone intervals pass: 531 matrix enclosures. The largest source job used 36,000
cells. `result.json` is the exact combined receipt, below 200 KB. Adaptive
counts and last-bit enclosures can differ across platforms; a fresh replay
must satisfy the same inequalities and complete coverage. The receipt is a
record of execution, not a replacement for execution or Lean verification.
