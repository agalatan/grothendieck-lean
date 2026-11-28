#!/usr/bin/env python3
"""Replay piece-15 content certificates between the 0.70 and 0.78 energy nodes. Agent-ID: codex-062a."""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import energy_band as band
from energy_band import first, replay

GROUPS = [(0, 8), (16, 20), (20, 42)]


def load_package(group):
    lo, hi = group
    stem = f"second_band_{lo}_{hi}"
    package = json.loads((replay.HERE / f"{stem}.json").read_text())
    if "shards" in package:
        replay.check(set(package) == {"shards", "rectangles"}, "wrong manifest fields")
        witnesses = []
        for i, name in enumerate(package["shards"], 1):
            replay.check(name == f"{stem}_part{i}.json", "incorrect witness shard name or order")
            witnesses.extend(json.loads((replay.HERE / name).read_text()))
        return {"rectangles": package["rectangles"], "witnesses": witnesses}
    return package


def bind(package, group, nodes, t_lo):
    replay.check(set(package) == {"witnesses", "rectangles"}, "wrong package fields")
    witnesses = package["witnesses"]
    rows = []
    required = {"F_claimed", "slicesA", "slicesB", "price_at"}
    if group == (0, 8):
        required.add("seed")
    used = set()
    for left, right, index in package["rectangles"]:
        replay.check(type(index) is int and 0 <= index < len(witnesses), "invalid witness index")
        w = witnesses[index]
        replay.check(set(w) == required, "wrong witness fields")
        rows.append(dict(left=left, right=right, parts=1, chi_lo=group[0], chi_hi=group[1],
                         F_claimed=w["F_claimed"], slicesA=w["slicesA"], slicesB=w["slicesB"]))
        used.add(index)
    replay.check(len(used) == len(witnesses), "unused witness in package")
    return band.bind(rows, group, nodes, t_lo, energy_index=1)


def regenerate(packages, cfg, nodes, t_lo, row_cache):
    import generate_certificates as search

    row, = [r for r in json.loads(row_cache.read_text())["rows"] if r["tag"] == "0.855"]
    evaluator = search.CppRowEvaluator(row)
    rho_a, rho_b = search.build_verified_rice_polygon()
    at_right = replay.bind_cells(cfg, json.loads((replay.HERE / "cells.json").read_text()))
    right_low, = [c for c in at_right if (c["chi_lo"], c["chi_hi"]) == (0, 8)]
    right_mid, = [c for c in at_right if (c["chi_lo"], c["chi_hi"]) == (16, 20)]
    at_left = first.bind(json.loads((replay.HERE / "first_energies.json").read_text()))
    left_low, = [c for c in at_left if c["u_idx"] == 1 and c["chi_lo"] == 0]
    low_seeds = {"left_endpoint": left_low, "right_endpoint": right_low}
    for (lo, hi), package in packages.items():
        for w in package["witnesses"]:
            seed = right_mid if (lo, hi) == (16, 20) else None
            if (lo, hi) == (0, 8):
                tag = w["seed"]
                replay.check(tag in ("left_endpoint", "right_endpoint") or (type(tag) is int and 0 <= tag < 8),
                             "unknown starting witness")
                if tag not in low_seeds:
                    # Fit the narrow (6,8] model at this eighth's midpoint before repricing on (0,8].
                    u_lo, u_hi, allowance = band.geometry(nodes, 0, 8, Q(tag, 8), Q(tag + 1, 8))
                    fit_u = float((u_lo + u_hi) / 2)
                    fit_bound = float(Q(int(allowance * 10000), 10000))
                    _, grid, test = search.make_u_grids(fit_u)
                    low_seeds[tag] = first.price_cell(search, evaluator, rho_a, rho_b, fit_u, t_lo,
                                                      6, 8, fit_bound, grid, test)
                seed = low_seeds[tag]
            if w["price_at"] is None:
                replay.check(seed is not None and w["F_claimed"] == seed["F_claimed"], "invalid reused bound")
                fresh = seed
            else:
                x = Q(w["price_at"])
                replay.check(0 <= x <= 1, "pricing energy outside the funded band")
                u = float(band.interpolate(nodes[0]["u"], nodes[1]["u"], x))
                _, grid, test = search.make_u_grids(u)
                fresh = first.price_cell(search, evaluator, rho_a, rho_b, u, t_lo, lo, hi,
                                         w["F_claimed"], grid, test, seed=seed)
            replay.check(all(w[k] == fresh[k] for k in ("slicesA", "slicesB")),
                         f"regenerated witness differs for ({lo}, {hi}] at x={w['price_at']}")
        print(f"Regenerated all {len(package['witnesses'])} witnesses for ({lo}, {hi}].", flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--price", metavar="ROW_CACHE", type=Path, help="regenerate and compare the multipliers")
    parser.add_argument("--price-bin", type=int, choices=[hi for _, hi in GROUPS], metavar="UPPER_ENDPOINT",
                        help="regenerate only the group ending at this fourth excess")
    args = parser.parse_args()
    if args.price_bin is not None and args.price is None:
        parser.error("--price-bin requires --price")
    packages = {group: load_package(group) for group in GROUPS
                if args.price_bin is None or group[1] == args.price_bin}
    nodes = [replay.funded_row(i)[1] for i in (1, 2)]
    t_lo = first.geometry(1)[0]["t_lo"]
    cells = []
    for group, package in packages.items():
        cells.extend(bind(package, group, nodes, t_lo))
    cfg = replay.original.load_full_cfg(str(replay.SOURCE / "dual_certs.json"))
    if args.price:
        regenerate(packages, cfg, nodes, t_lo, args.price)
        print("All selected witness multipliers match.")
        return
    replay.original.verify_all()
    replay.run_replay(cfg, cells)
    print("Verified 11 funded bins on piece 15 at every energy between the 0.70 and 0.78 nodes: (0,8] and (16,42].")


if __name__ == "__main__":
    main()
