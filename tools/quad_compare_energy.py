#!/usr/bin/env python3
"""Compare the checker's energy enclosures with the committed `energyTable` (issue #303).

Inputs: the `energy-*.txt` files of `quadrun rotate` (lines `q n m lo hi`, enclosure
`[lo, hi] / 2^256` of `energy (retainedSmoothed a0) (n, m)`), and `handoff/quad-checker/
energy-table.txt` (`n m num den`, the 21,168 head entries of certificate.json).

Exact rational arithmetic.  Reports, over the head `n + 3m ≤ 501`: the excursion
`max(lo − t, t − hi, 0)` (its sum is the certified `htable` bound), the midpoint difference,
their max/ℓ²/ℓ¹, by bands of `m` and of `n + 3m`, the entries whose excursion exceeds a given
per-entry threshold, the total mass of all computed bidegrees and of the head, and the
degree-one entries explicitly.
Agent-ID: claude-b9ee. Refs #303, #21.
"""
from __future__ import annotations

import argparse
import glob
import json
import math
import os
import sys
from fractions import Fraction

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("energy_dir", help="directory with energy-*.txt")
    ap.add_argument("--table", default=os.path.join(ROOT, "handoff", "quad-checker", "energy-table.txt"))
    ap.add_argument("--json", default=None)
    ap.add_argument("--list-threshold", type=float, default=1e-15,
                    help="list entries whose excursion exceeds this")
    args = ap.parse_args()
    scale = Fraction(1, 2 ** 256)
    encl: dict[tuple[int, int], tuple[Fraction, Fraction]] = {}
    grades = set()
    for path in sorted(glob.glob(os.path.join(args.energy_dir, "energy-*.txt"))):
        with open(path, encoding="utf-8") as f:
            for line in f:
                q, n, m, lo, hi = line.split()
                grades.add(int(q))
                encl[(int(n), int(m))] = (int(lo) * scale, int(hi) * scale)
    table: dict[tuple[int, int], Fraction] = {}
    with open(args.table, encoding="utf-8") as f:
        for line in f:
            if line.startswith("#"):
                continue
            n, m, num, den = line.split()
            table[(int(n), int(m))] = Fraction(int(num), int(den))
    print(f"enclosures: {len(encl)} bidegrees from {len(grades)} grades (missing grades: "
          f"{sorted(set(range(251)) - grades)[:10]}); table: {len(table)} entries")
    head = [(n, m) for (n, m) in table]
    missing = [p for p in head if p not in encl]
    print(f"head entries without enclosure: {len(missing)}")
    total_mass = sum(hi for (lo, hi) in encl.values())
    head_mass_lo = sum(encl[p][0] for p in head if p in encl)
    head_mass_hi = sum(encl[p][1] for p in head if p in encl)
    table_mass = sum(table.values())
    exc = {}
    mid = {}
    maxw = Fraction(0)
    for p in head:
        if p not in encl:
            continue
        lo, hi = encl[p]
        t = table[p]
        exc[p] = max(lo - t, t - hi, Fraction(0))
        mid[p] = abs((lo + hi) / 2 - t)
        maxw = max(maxw, hi - lo)
    def stats(vals):
        vals = list(vals)
        return {"max": float(max(vals)) if vals else 0.0,
                "l2": math.sqrt(float(sum(v * v for v in vals))),
                "l1": float(sum(vals)), "count": len(vals)}
    by_m = {}
    for mb in range(0, 168, 20):
        sel = [exc[p] for p in exc if mb <= p[1] < mb + 20]
        if sel:
            by_m[f"m in [{mb},{mb+19}]"] = stats(sel)
    by_deg = {}
    for db in range(0, 502, 100):
        sel = [exc[p] for p in exc if db <= p[0] + 3 * p[1] < db + 100]
        if sel:
            by_deg[f"n+3m in [{db},{db+99}]"] = stats(sel)
    worst = sorted(exc.items(), key=lambda kv: -kv[1])[:12]
    listed = [(p, float(v), float(table[p]), float(encl[p][0]), float(encl[p][1]))
              for p, v in exc.items() if v > Fraction(args.list_threshold)]
    summary = {
        "head_entries": len(exc),
        "excursion": stats(exc.values()),
        "mid_diff": stats(mid.values()),
        "max_width": float(maxw),
        "htable_bound_l1_excursion": str(sum(exc.values())),
        "htable_bound_float": float(sum(exc.values())),
        "total_mass_upper": float(total_mass),
        "head_mass": [float(head_mass_lo), float(head_mass_hi)],
        "table_mass": float(table_mass),
        "by_m": by_m, "by_degree": by_deg,
        "worst": [{"n": p[0], "m": p[1], "excursion": float(v), "table": float(table[p]),
                   "lo": float(encl[p][0]), "hi": float(encl[p][1])} for p, v in worst],
        "entries_above_threshold": len(listed), "threshold": args.list_threshold,
        "degree_one": {f"({n},{m})": {"table": str(table[(n, m)]), "lo": str(encl[(n, m)][0]),
                                      "hi": str(encl[(n, m)][1]), "excursion": float(exc[(n, m)])}
                       for (n, m) in [(1, 0), (0, 1)] if (n, m) in encl},
    }
    print(f"excursion: max {summary['excursion']['max']:.3e}, ℓ² {summary['excursion']['l2']:.3e}, "
          f"ℓ¹ {summary['excursion']['l1']:.3e}  (htable bound)")
    print(f"midpoint difference: max {summary['mid_diff']['max']:.3e}, ℓ² {summary['mid_diff']['l2']:.3e}, "
          f"ℓ¹ {summary['mid_diff']['l1']:.3e}; max enclosure width {float(maxw):.3e}")
    print(f"mass: all computed bidegrees ≤ {float(total_mass):.12f}; head [{float(head_mass_lo):.12f}, "
          f"{float(head_mass_hi):.12f}]; table head {float(table_mass):.12f}")
    for k, v in by_m.items():
        print(f"  {k}: n={v['count']} max {v['max']:.2e} ℓ² {v['l2']:.2e} ℓ¹ {v['l1']:.2e}")
    for k, v in by_deg.items():
        print(f"  {k}: n={v['count']} max {v['max']:.2e} ℓ² {v['l2']:.2e} ℓ¹ {v['l1']:.2e}")
    print(f"entries with excursion > {args.list_threshold:.1e}: {len(listed)}")
    for row in listed[:20]:
        print("   (n,m)=%s exc %.3e table %.17g encl [%.17g, %.17g]" % row)
    for k, v in summary["degree_one"].items():
        print(f"degree one {k}: table {v['table']}, enclosure [{float(Fraction(v['lo'])):.17g}, "
              f"{float(Fraction(v['hi'])):.17g}], excursion {v['excursion']:.3e}")
    if args.json:
        with open(args.json, "w", encoding="utf-8") as f:
            json.dump(summary, f, indent=1)
        print(f"wrote {args.json}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
