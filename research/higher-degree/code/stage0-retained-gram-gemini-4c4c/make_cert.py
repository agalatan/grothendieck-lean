#!/usr/bin/env python3
"""Certificate generator for Stage 0 (#751 / #849) sector resolution (tag S0RG).

Reads research/higher-degree/code/degree5-stage0/results/b/{gC,g83,g84,gA}/rows_all.lines,
records SHA-256 provenance and exact denominator-10^10 rationalised row parameters, runs the
zero-float outward-rounded Jet2 shifted-polar integrator across all 9 benchmark rows, and writes
cert_stage0_gram.json (< 25 KB).
"""

from concurrent.futures import ProcessPoolExecutor
from decimal import Decimal, ROUND_HALF_EVEN
from fractions import Fraction
import hashlib
import json
import os
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as V


MESH_TIERS = {
    "tier1": {
        "nr_kd1": 120, "nr_kd2": 18, "nw_kd1": 90, "nw_kd2": 18, "Kr_kd": 3, "Kw_kd": 4,
        "nr_g1": 72, "nr_g2": 16, "nw_g1": 48, "nw_g2": 16, "Kr_g": 2, "Kw_g": 3,
    },
    "tier2": {
        "nr_kd1": 210, "nr_kd2": 28, "nw_kd1": 150, "nw_kd2": 26, "Kr_kd": 5, "Kw_kd": 6,
        "nr_g1": 108, "nr_g2": 22, "nw_g1": 64, "nw_g2": 22, "Kr_g": 3, "Kw_g": 4,
    },
    "tier3_gA80": {
        "nr_kd1": 210, "nr_kd2": 28, "nw_kd1": 150, "nw_kd2": 26, "Kr_kd": 5, "Kw_kd": 6,
        "nr_g1": 165, "nr_g2": 28, "nw_g1": 110, "nw_g2": 26, "Kr_g": 4, "Kw_g": 5,
    },
    "tier3_g84_85": {
        "nr_kd1": 270, "nr_kd2": 32, "nw_kd1": 180, "nw_kd2": 28, "Kr_kd": 7, "Kw_kd": 9,
        "nr_g1": 165, "nr_g2": 28, "nw_g1": 110, "nw_g2": 26, "Kr_g": 4, "Kw_g": 5,
    },
}


GAMES = [
    ("gC", "39/50", "779/10000", [
        ("0.800", "tier1", "0", "1/10", None),
    ]),
    ("g83", "83/100", "2241/10000", [
        ("0.800", "tier1", "7/20", "7/20", None),
        ("0.850", "tier2", "7/20", "7/20", None),
    ]),
    ("g84", "21/25", "319/1250", [
        ("0.700", "tier1", "7/20", "7/20", None),
        ("0.800", "tier1", "7/20", "7/20", None),
        ("0.840", "tier2", "7/20", "1", None),
        ("0.850", "tier3_g84_85", "7/20", "1", "32/100"),
    ]),
    ("gA", "8493/10000", "2827/10000", [
        ("0.800", "tier3_gA80", "7/20", "1", "7/20"),
        ("0.850", "tier2", "7/10", "1", "2/5"),
    ]),
]


def rat10_str(dec_val):
    scaled = int((Decimal(dec_val) * Decimal(10 ** 10)).to_integral_value(rounding=ROUND_HALF_EVEN))
    f = Fraction(scaled, 10 ** 10)
    return f"{f.numerator}/{f.denominator}" if f.denominator != 1 else str(f.numerator)


def main():
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument("--only-row", default=None, help="Re-integrate only one row id, reusing existing certified brackets for unchanged rows")
    args = parser.parse_args()

    repo_root = HERE.parents[3]
    out_path = HERE / "cert_stage0_gram.json"
    existing_by_id = {}
    if args.only_row is not None and out_path.is_file():
        prev = json.loads(out_path.read_text(encoding="utf-8"), parse_float=Decimal, parse_int=int)
        existing_by_id = {r["id"]: r["certified"] for r in prev.get("rows", [])}

    provenance = {}
    raw_by_game = {}

    for gname, _, _, _ in GAMES:
        rel_p = f"research/higher-degree/code/degree5-stage0/results/b/{gname}/rows_all.lines"
        full_p = repo_root / rel_p
        raw_bytes = full_p.read_bytes()
        provenance[gname] = {
            "rel_path": rel_p,
            "sha256": hashlib.sha256(raw_bytes).hexdigest(),
        }
        by_t = {}
        for line in raw_bytes.decode("utf-8").splitlines():
            line = line.strip()
            if not line:
                continue
            obj = json.loads(line, parse_float=Decimal, parse_int=int)
            t_key = str(Decimal(obj["t"]).quantize(Decimal("0.001")))
            by_t[t_key] = obj
        raw_by_game[gname] = by_t

    row_specs = []
    for gname, e1_s, eta_s, rlist in GAMES:
        for t_key, tier_name, cap_up, pl_low, nc_low in rlist:
            src = raw_by_game[gname][t_key]
            rid = f"{gname}_{t_key[:-1]}"
            spec = {
                "id": rid,
                "game": gname,
                "t_key": t_key,
                "e1": e1_s,
                "eta": eta_s,
                "t": rat10_str(src["t"]),
                "l": rat10_str(src["l"]),
                "beta": rat10_str(src["beta"]),
                "bA": rat10_str(src["bA"]),
                "bB": rat10_str(src["bB"]),
                "nu5": rat10_str(src["nu5"]),
                "sig": rat10_str(src["sig"]),
                "cap_upper": cap_up,
                "plain_lower_exceeds": pl_low,
                "mesh": MESH_TIERS[tier_name],
            }
            if nc_low is not None:
                spec["no_cmm_lower_exceeds"] = nc_low
            row_specs.append(spec)

    to_run = [s for s in row_specs if args.only_row is None or s["id"] == args.only_row]
    max_w = min(len(to_run), os.cpu_count() or 1, 9)
    if max_w <= 1:
        run_res = [V.integrate_and_certify_row(s) for s in to_run]
    else:
        with ProcessPoolExecutor(max_workers=max_w) as ex:
            run_res = list(ex.map(V.integrate_and_certify_row, to_run))
    fresh_by_id = {r["id"]: r for r in run_res}

    for spec in row_specs:
        if spec["id"] in fresh_by_id:
            res = fresh_by_id[spec["id"]]
            spec["certified"] = {
                "kappa_D": list(res["kappa_D"]),
                "plain_e21": list(res["plain_e21"]),
                "no_cmm_5sc": list(res["no_cmm_5sc"]),
                "retained_all_dim": list(res["retained_all_dim"]),
                "sos_lams": [list(x) for x in res["sos_lams"]],
                "min_concav_lo": res["min_concav_lo"],
            }
            print(
                f"Generated {spec['id']:10s} ({res['elapsed_ms']:5d} ms): "
                f"plain={V.fmt_interval(res['plain_e21'], 4)} "
                f"no_cmm={V.fmt_interval(res['no_cmm_5sc'], 4)} "
                f"ret={V.fmt_interval(res['retained_all_dim'], 5)}"
            )
        else:
            V.check(spec["id"] in existing_by_id, f"Missing existing certified data for {spec['id']}")
            spec["certified"] = existing_by_id[spec["id"]]

    cert_doc = {
        "package": "stage0-retained-gram-gemini-4c4c",
        "tag": "S0RG",
        "issue": 849,
        "refs": [751, 453],
        "scale_S": V.S,
        "provenance": provenance,
        "rows": row_specs,
    }
    out_path.write_text(json.dumps(cert_doc, indent=2) + "\n", encoding="utf-8")
    print(f"Wrote {out_path} ({out_path.stat().st_size} bytes)")


if __name__ == "__main__":
    main()
