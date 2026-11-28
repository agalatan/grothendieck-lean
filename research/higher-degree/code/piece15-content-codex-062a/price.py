#!/usr/bin/env python3
"""Propose piece-15 multipliers using the original Remez/LP search. Agent-ID: codex-062a."""
import json
from pathlib import Path
import sys

from replay import PUBLIC_BOUNDS, SOURCE
import generate_certificates as search
import verify as original


def price(row_cache):
    cfg = original.load_full_cfg(str(SOURCE / "dual_certs.json"))
    base, = [c for c in cfg["cells"] if c["piece_idx"] == 15 and c["u_idx"] == 2
             and c["chi_lo"] == c["chi_hi"] == 20]
    row, = [r for r in json.loads(row_cache.read_text())["rows"] if r["tag"] == "0.855"]
    evaluator = search.CppRowEvaluator(row)
    rho_a, rho_b = search.build_verified_rice_polygon()
    u = (base["u_lo"] + base["u_hi"]) / 2
    _, grid, test = search.make_u_grids(u)
    for lo, hi in [(0, 8), (20, 42)]:
        bound = float(PUBLIC_BOUNDS[lo, hi])
        witness = dict(chi_lo=lo, chi_hi=hi, F_claimed=bound)
        for sector, is_b in [("slicesA", False), ("slicesB", True)]:
            args = evaluator, is_b, rho_a, rho_b, u, base["t_lo"]
            if lo == 0:
                # Set the mean-parameter slices on the tightest funded bin,
                # then solve the dual constraints over the entire [0, 8].
                _, models = search.certify_sector_jm1(*args, 6, 8, bound)
            else:
                models = base[sector]
            bands = evaluator.eval_psi_g1_bounds(is_b, u, u * test)
            witness[sector], _ = search.polish_slices_at_F(*args, lo, hi, bound, models, grid, test, *bands)
        yield witness


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit("usage: python3 price.py ROW_CACHE.json")
    print(json.dumps(list(price(Path(sys.argv[1]))), allow_nan=False, separators=(",", ":")))
