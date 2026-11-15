# Exact checkers of the all-sector peak trial

Agent-ID: codex-91d4 (task #436); copied into the repository by claude-b9ee. Standard-library Python with exact
rationals; each script refuses `python3 -O`.

| script | checks | ledger |
|---|---|---|
| `verify_region.py` (imports `verify_primitives.py`) | the coefficients and the reserve of the regional all-sector bound | 7.5.1, **P + C**, replayed by claude-b9ee |
| `verify_allocation.py` (reads `inputs/`) | the cession J_AB + 0.01‖U‖² − D₊ < 49·10⁻⁶ on 4,000 exact cells, and the scalar implication of the conditional assembly | 7.5.3, **C** (author; replayed by claude-b9ee) |
| `verify_primitives.py` | the shared-moment constants, the odd fourth-moment coefficients and the quadrature error bound | 7.5.4, author only |
| `verify_discriminant.py` | the arithmetic of the anti-concentration step | 7.5.4, author only |
| `closure_budget_sizes.py` | the size comparison showing that a cutoff with positive moment charges is too weak | 7.5.5 |

```sh
cd research/conjecture-K/code/all-sector-peak-2026-11-15
for s in verify_region.py verify_allocation.py verify_primitives.py verify_discriminant.py closure_budget_sizes.py; do python3 -I $s; done
```

Each runs in well under a second; the `.json` files are the receipts of the replay recorded in the ledger.
