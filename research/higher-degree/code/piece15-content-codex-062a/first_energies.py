#!/usr/bin/env python3
"""Verify every funded bin on piece 15 at the first two grid energies. Agent-ID: codex-062a."""
import argparse
from fractions import Fraction as Q
import json
import math
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import replay

BOUNDS = {
    "0.60": {(0, 10): Q(11), (10, 42): Q(32)},
    "0.70": {(0, 16): Q(51, 8), (16, 42): Q(32)},
}
ALL_ENDS = [1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 20, 24, 30, 36, 42]


def enclose(q):
    """Tight outward binary64 enclosure of an exact rational."""
    f = float(q)
    return (math.nextafter(f, -math.inf) if Q(f) > q else f,
            math.nextafter(f, math.inf) if Q(f) < q else f)


def geometry(index):
    t_exact, node = replay.funded_row(index)
    lo, hi = enclose(Q(node["u"]))
    ref = dict(piece_idx=15, u_idx=index, row_tag="0.855", kind="JM1_BOUND",
               u_lo=lo, u_hi=hi, t_lo=enclose(t_exact)[0])
    return ref, node


def bind(weights):
    replay.check(set(weights) == set(BOUNDS), "wrong funded energy rows")
    cells = []
    for index, (scale, bounds) in enumerate(BOUNDS.items()):
        ref, node = geometry(index)
        replay.check(Q(scale) == Q(node["ucapfrac"]), "energy fraction mismatch")
        cells.extend(replay.bind_to_bins(ref, node, weights[scale], bounds, ALL_ENDS))
    return cells


def price(cache):
    import generate_certificates as search  # Optional NumPy/SciPy proposal stage.
    row, = [r for r in json.loads(cache.read_text())["rows"] if r["tag"] == "0.855"]
    evaluator = search.CppRowEvaluator(row)
    rho_a, rho_b = search.build_verified_rice_polygon()
    result = {}
    for index, (scale, bounds) in enumerate(BOUNDS.items()):
        ref, _ = geometry(index)
        u = (ref["u_lo"] + ref["u_hi"]) / 2
        _, grid, test = search.make_u_grids(u)
        result[scale] = []
        for (lo, hi), limit in bounds.items():
            bound = float(limit)
            result[scale].append(price_cell(search, evaluator, rho_a, rho_b, u, ref["t_lo"],
                                            lo, hi, bound, grid, test))
    return result


def price_cell(search, evaluator, rho_a, rho_b, u, t_lo, lo, hi, bound, grid, test, *, seed=None):
    witness = dict(chi_lo=lo, chi_hi=hi, F_claimed=bound)
    for key, is_b in (("slicesA", False), ("slicesB", True)):
        args = evaluator, is_b, rho_a, rho_b, u, t_lo, lo, hi
        if seed is None:
            _, slices = search.certify_sector_jm1(*args, bound)
        else:
            slices = seed[key]
        bands = evaluator.eval_psi_g1_bounds(is_b, u, u * test)
        witness[key], _ = search.polish_slices_at_F(*args, bound, slices, grid, test, *bands)
    return witness


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--price", type=Path, metavar="ROW_CACHE", help="regenerate the witnesses from the original row cache")
    args = parser.parse_args()
    if args.price:
        print(json.dumps(price(args.price), allow_nan=False, separators=(",", ":")))
        return
    replay.original.verify_all()
    cfg = replay.original.load_full_cfg(str(replay.SOURCE / "dual_certs.json"))
    cells = bind(json.loads((replay.HERE / "first_energies.json").read_text()))
    replay.run_replay(cfg, cells)
    print("Verified all 15 funded bins at each of 0.60 and 0.70 u_cap on piece 15.")


if __name__ == "__main__":
    main()
