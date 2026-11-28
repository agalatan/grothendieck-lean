#!/usr/bin/env python3
"""Verify interpolated JM1 funding on piece 15 between its first two energy nodes. Agent-ID: codex-062a."""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import first_energies as first
import replay

# Names the bins claimed in the proof. Each witness file covers the whole energy segment.
GROUPS = [(0, 4), (4, 10), (10, 16), (16, 42)]
FIELDS = {"left", "right", "parts", "chi_lo", "chi_hi", "F_claimed", "slicesA", "slicesB"}


def interpolate(v0, v1, x):
    return (1 - x) * Q(v0) + x * Q(v1)


def geometry(nodes, lo, hi, left, right):
    replay.check(0 <= left < right <= 1, "energy interval outside the two nodes")
    ends = [b for b in first.ALL_ENDS if lo < b <= hi]
    replay.check(ends and (lo == 0 or lo in first.ALL_ENDS) and hi in first.ALL_ENDS, "partial fourth-excess bin")
    for node in nodes:
        replay.check(sorted(map(int, node["theta_chi"])) == first.ALL_ENDS, "missing funded table endpoint")
    minimum = min(interpolate(nodes[0]["theta_chi"][str(b)], nodes[1]["theta_chi"][str(b)], x)
                  for b in ends for x in (left, right))
    u0, u1 = [Q(node["u"]) for node in nodes]
    low, high = interpolate(u0, u1, left), interpolate(u0, u1, right)
    return low, high, minimum


def bind(weights, group, nodes, t_lo, *, energy_index=0):
    lo, hi = group
    cursor = Q(0)
    result = []
    for w in weights:
        replay.check(set(w) in (FIELDS, FIELDS | {"price_at"}), "wrong band witness fields")
        left, right = Q(w["left"]), Q(w["right"])
        replay.check(left == cursor, "energy gap or overlap")
        replay.check((w["chi_lo"], w["chi_hi"]) == group, "wrong fourth-excess group")
        low, high, limit = geometry(nodes, lo, hi, left, right)
        replay.check(0 < Q(w["F_claimed"]) <= limit, "certificate exceeds its interpolated allowance")
        parts = w["parts"]
        replay.check(type(parts) is int and parts > 0, "invalid number of energy subintervals")
        for j in range(parts):
            cell_lo = interpolate(low, high, Q(j, parts))
            cell_hi = interpolate(low, high, Q(j + 1, parts))
            result.append(dict(piece_idx=15, u_idx=energy_index, row_tag="0.855", kind="JM1_BOUND", t_lo=t_lo,
                               u_lo=first.enclose(cell_lo)[0], u_hi=first.enclose(cell_hi)[1],
                               chi_lo=lo, chi_hi=hi, F_claimed=w["F_claimed"], theta_allow=w["F_claimed"],
                               slicesA=w["slicesA"], slicesB=w["slicesB"]))
        cursor = right
    replay.check(cursor == 1, "energy cover ends before the second node")
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--price", metavar="ROW_CACHE", type=Path,
                        help="regenerate the dual multipliers of the submitted intervals")
    args = parser.parse_args()
    nodes = [replay.funded_row(i)[1] for i in (0, 1)]
    t_lo = first.geometry(0)[0]["t_lo"]
    cells = []
    regenerated = 0
    if args.price:
        import generate_certificates as search
        row, = [r for r in json.loads(args.price.read_text())["rows"] if r["tag"] == "0.855"]
        evaluator = search.CppRowEvaluator(row)
        rho_a, rho_b = search.build_verified_rice_polygon()
    for lo, hi in GROUPS:
        weights = json.loads((replay.HERE / f"energy_band_{lo}_{hi}.json").read_text())
        cells.extend(bind(weights, (lo, hi), nodes, t_lo))
        if args.price:
            for w in weights:
                left, right = Q(w["left"]), Q(w["right"])
                x = Q(w["price_at"]) if "price_at" in w else (left + right) / 2
                replay.check(0 <= x <= 1, "pricing energy outside the two nodes")
                u = float(interpolate(nodes[0]["u"], nodes[1]["u"], x))
                _, grid, test = search.make_u_grids(u)
                fresh = first.price_cell(search, evaluator, rho_a, rho_b, u, t_lo, lo, hi, w["F_claimed"], grid, test)
                replay.check(all(w[k] == value for k, value in fresh.items()), "regenerated witness differs")
                regenerated += 1
    if args.price:
        print(f"Regenerated {regenerated} witnesses exactly.")
        return
    replay.original.verify_all()
    cfg = replay.original.load_full_cfg(str(replay.SOURCE / "dual_certs.json"))
    replay.run_replay(cfg, cells)
    print("Verified the interpolated funding on the whole closed energy band for", GROUPS)


if __name__ == "__main__":
    main()
