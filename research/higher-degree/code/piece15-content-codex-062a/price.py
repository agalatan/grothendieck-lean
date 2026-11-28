#!/usr/bin/env python3
"""Propose piece-15 multipliers using the original Remez/LP search. Agent-ID: codex-062a."""
import json
from pathlib import Path
import sys

from replay import SOURCE
import generate_certificates as search
import verify as original


def price(row_cache):
    cfg = original.load_full_cfg(str(SOURCE / "dual_certs.json"))
    seeds = {c["chi_hi"]: c for c in cfg["cells"] if c["piece_idx"] == 15 and c["u_idx"] == 2}
    row, = [r for r in json.loads(row_cache.read_text())["rows"] if r["tag"] == "0.855"]
    evaluator = search.CppRowEvaluator(row)
    rho_a, rho_b = search.build_verified_rice_polygon()
    for seed, lo, hi, bound in [(1, 1, 2, 8.375), (1, 2, 3, 6.72), (20, 20, 42, 12)]:
        base = seeds[seed]
        u = (base["u_lo"] + base["u_hi"]) / 2
        _, grid, test = search.make_u_grids(u)
        witness = dict(chi_lo=lo, chi_hi=hi, F_claimed=bound)
        for sector, is_b in [("slicesA", False), ("slicesB", True)]:
            bands = evaluator.eval_psi_g1_bounds(is_b, u, u * test)
            witness[sector], _ = search.polish_slices_at_F(
                evaluator, is_b, rho_a, rho_b, u, base["t_lo"], lo, hi, bound, base[sector], grid, test, *bands)
        yield witness


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("usage: python3 price.py ROW_CACHE.json")
    print(json.dumps(list(price(Path(sys.argv[1]))), allow_nan=False, separators=(",", ":")))
