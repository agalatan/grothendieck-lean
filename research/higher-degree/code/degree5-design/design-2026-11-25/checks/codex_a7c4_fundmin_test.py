#!/usr/bin/env python3
# Exact test by codex-a7c4 that the allocation "fundMin" is false on each of the pieces 1-11: the zero-content pairs of
# checks/zero_content_budget.py at lambda = 10^-12 need more than fundMin gives (its eta_h is the necessary lower bound
# computed at lambda = 10^-9).  The block between the two marker lines is copied unedited from the re-review comment of
# codex-a7c4 on PR #646 (25 November 2026); the lines after it, which print the shortfalls, were added when it was recorded.
# Run from the repository root:
#     python3 -I research/higher-degree/code/degree5-design/design-2026-11-25/checks/codex_a7c4_fundmin_test.py
# Output: checks/codex_a7c4_fundmin_test.log.
# ---- codex-a7c4 ----
from fractions import Fraction as F
from pathlib import Path
import json
p = Path("research/higher-degree/code/degree5-design/design-2026-11-25/tables")
rows = json.loads((p / "zero_content_budget.json").read_text(), parse_float=F)
fund = {r["j"]: r["eta_h"] for r in
        json.loads((p / "funded/rooms.json").read_text(), parse_float=F)
        if r["variant"] == "fundMin"}
assert set(fund) == set(range(1, 12))
x = F(39, 50) * F(1, 10**12)
for row in rows:
    j = row["j"]
    if j in fund:
        k = F(row["kappa_h_design"])
        need = F(row["gain_lo"]) - k*F(row["cap_hi"]) - 2*F(101,100)*x - 2*k*x*x
        assert need - max(fund[j], F(row["eta_h_needed_design_share"])) > F(157,10**11)
# ---- end of codex-a7c4's block ----
for row in rows:
    j = row["j"]
    if j in fund:
        k = F(row["kappa_h_design"])
        need = F(row["gain_lo"]) - k*F(row["cap_hi"]) - 2*F(101,100)*x - 2*k*x*x
        print("piece %2d: eta_h needed at lambda = 10^-12 > %.12e; fundMin gives %.12e; shortfall > %.3e" % (
            j, float(need), float(fund[j]), float(need - max(fund[j], F(row["eta_h_needed_design_share"])))))
print("all assertions passed: fundMin is short by more than 1.57e-9 on each of the pieces 1-11")
