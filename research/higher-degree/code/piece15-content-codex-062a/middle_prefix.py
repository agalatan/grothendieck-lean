#!/usr/bin/env python3
"""Replay funded middle bins of piece 15 with published and refitted JM1 multipliers. Agent-ID: codex-062a."""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import energy_band as band
from energy_band import first, replay


def published_witnesses():
    weights = json.loads((replay.HERE / "first_energies.json").read_text())
    at_start = [c for c in first.bind(weights) if c["u_idx"] == 1]
    witnesses = {f"node-{i}": c for i, c in enumerate(at_start)}
    for lo, hi in band.GROUPS:
        rows = json.loads((replay.HERE / f"energy_band_{lo}_{hi}.json").read_text())
        for i, row in enumerate(rows):
            witnesses[f"prior-{hi}-{i}"] = row
    witnesses.update(load_fits())
    return witnesses


def load_fits():
    fits = json.loads((replay.HERE / "middle_fits.json").read_text())
    for name, record in fits.items():
        lo, hi = record["chi"]
        i = record["eighth"]
        replay.check(type(i) is int and 0 <= i < 8 and name == f"fit-{lo}-{hi}-{i}", "invalid fit recipe")
    return fits


def regenerate_fits(row_cache):
    import generate_certificates as search

    row, = [r for r in json.loads(row_cache.read_text())["rows"] if r["tag"] == "0.855"]
    evaluator = search.CppRowEvaluator(row)
    rho_a, rho_b = search.build_verified_rice_polygon()
    nodes = [replay.funded_row(i)[1] for i in (1, 2)]
    t_lo = first.geometry(1)[0]["t_lo"]
    seed = json.loads((replay.HERE / "energy_band_10_16.json").read_text())[-1]
    for name, record in load_fits().items():
        lo, hi = record["chi"]
        i = record["eighth"]
        low, high, limit = band.geometry(nodes, lo, hi, Q(i, 8), Q(i + 1, 8))
        u = float((low + high) / 2)
        price = float(Q(int(limit * 65536), 65536))
        _, grid, test = search.make_u_grids(u)
        fresh = first.price_cell(search, evaluator, rho_a, rho_b, u, t_lo, lo, hi, price, grid, test, seed=seed)
        replay.check(all(record[k] == fresh[k] for k in ("F_claimed", "slicesA", "slicesB")),
                     f"regenerated {name} differs")
        print(f"Regenerated {name}.", flush=True)


def bind(groups):
    """Bind consecutive normalized energy intervals to the funded row and both sectors."""
    u1, u2 = [replay.funded_row(i)[1] for i in (1, 2)]
    ref = first.geometry(1)[0]
    witnesses = published_witnesses()
    cells = []
    replay.check([g["chi"] for g in groups] == [[8, 10], [10, 12], [12, 14], [14, 16]],
                 "wrong fourth-excess bins")
    for g in groups:
        lo, hi = g["chi"]
        left = Q(0)
        for end, price, donor_a, donor_b in g["intervals"]:
            right, exact_price = Q(end), Q(price)
            low, high, allowance = band.geometry((u1, u2), lo, hi, left, right)
            replay.check(0 < exact_price <= allowance, "unfunded witness")
            value = float(exact_price)
            replay.check(Q(value) == exact_price, "non-dyadic stream price")
            replay.check(donor_a in witnesses and donor_b in witnesses, "unknown published witness")
            cells.append(dict(ref, u_lo=first.enclose(low)[0], u_hi=first.enclose(high)[1],
                              chi_lo=lo, chi_hi=hi, F_claimed=value, theta_allow=value,
                              slicesA=witnesses[donor_a]["slicesA"], slicesB=witnesses[donor_b]["slicesB"]))
            left = right
        replay.check(left == Q(g["through"]) and left > 0, "energy cover ends at the wrong endpoint")
    return cells


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--price", metavar="ROW_CACHE", type=Path, help="regenerate the four refitted witnesses")
    args = parser.parse_args()
    if args.price:
        regenerate_fits(args.price)
        return
    groups = json.loads((replay.HERE / "middle_prefix.json").read_text())
    cells = bind(groups)
    replay.original.verify_all()
    cfg = replay.original.load_full_cfg(str(replay.SOURCE / "dual_certs.json"))
    replay.run_replay(cfg, cells)
    for group in groups:
        print(f"Verified chi in ({group['chi'][0]}, {group['chi'][1]}] through x = {group['through']}.")


if __name__ == "__main__":
    main()
