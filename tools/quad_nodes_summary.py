#!/usr/bin/env python3
"""Summarise the per-node records of `quadrun shard` (issue #303, milestone 2).

Reads `nodes-*.txt` (one line per node: ordinal panel rule s v neg A x cutoff P pairs
maxWidthLog2 bessel ms accumulate_ms) from a directory and writes a JSON summary: counts by
precision used, by seed regime (series x < 150 / Watson), by profile sign and cutoff; the
distribution of the largest enclosure width (log2) per node; the Bessel sums; timings.
Agent-ID: claude-b9ee. Refs #303, #21.
"""
from __future__ import annotations

import collections
import glob
import hashlib
import json
import os
import sys


def parse_interval(tok: str) -> float:
    # "[a," or "b]" tokens come in pairs; the caller joins them
    return float(tok.strip("[],"))


def main() -> int:
    if len(sys.argv) < 3:
        print("usage: quad_nodes_summary.py <dir with nodes-*.txt> <out.json> [raw-final.txt]")
        return 2
    d, out = sys.argv[1], sys.argv[2]
    rows = []
    for path in sorted(glob.glob(os.path.join(d, "nodes-*.txt"))):
        with open(path, encoding="utf-8") as f:
            for line in f:
                t = line.split()
                if len(t) < 16:
                    continue
                # s is "[a," "b]" (two tokens), bessel likewise
                ordinal, panel, rule = int(t[0]), int(t[1]), int(t[2])
                s = (parse_interval(t[3]) + parse_interval(t[4])) / 2
                v = float(t[5]); neg = t[6] == "1"; a = float(t[7]); x = float(t[8])
                cutoff = int(t[9]); prec = int(t[10]); pairs = int(t[11]); width = int(t[12])
                bessel = parse_interval(t[14])
                ms = int(t[15]); acc = int(t[16]) if len(t) > 16 else 0
                rows.append(dict(ordinal=ordinal, panel=panel, rule=rule, s=s, v=v, neg=neg, A=a, x=x,
                                 cutoff=cutoff, prec=prec, pairs=pairs, width_log2=width, bessel=bessel,
                                 ms=ms, acc_ms=acc))
    rows.sort(key=lambda r: r["ordinal"])
    ords = [r["ordinal"] for r in rows]
    summary = {
        "nodes": len(rows),
        "ordinals_complete": ords == list(range(len(rows))),
        "by_precision": dict(collections.Counter(r["prec"] for r in rows)),
        "seed_series_nodes": sum(1 for r in rows if r["x"] < 150),
        "seed_watson_nodes": sum(1 for r in rows if r["x"] >= 150),
        "negative_profile_nodes": sum(1 for r in rows if r["neg"]),
        "full_cutoff_nodes": sum(1 for r in rows if r["cutoff"] >= 531),
        "pairs_total": sum(r["pairs"] for r in rows),
        "A_min": min(r["A"] for r in rows), "A_max": max(r["A"] for r in rows),
        "x_max": max(r["x"] for r in rows),
        "width_log2_max": max(r["width_log2"] for r in rows),
        "width_log2_histogram": dict(sorted(collections.Counter((r["width_log2"] // 50) * 50 for r in rows).items())),
        "width_log2_max_full_cutoff": max(r["width_log2"] for r in rows if r["cutoff"] >= 531),
        "bessel_max": max(r["bessel"] for r in rows), "bessel_min": min(r["bessel"] for r in rows),
        "bessel_above_one": sum(1 for r in rows if r["bessel"] > 1.0),
        "ms_total_node": sum(r["ms"] for r in rows), "ms_total_accumulate": sum(r["acc_ms"] for r in rows),
        "worst_width_nodes": [dict(ordinal=r["ordinal"], s=r["s"], A=r["A"], x=r["x"], cutoff=r["cutoff"],
                                   prec=r["prec"], width_log2=r["width_log2"])
                              for r in sorted(rows, key=lambda r: -r["width_log2"])[:10]],
    }
    if len(sys.argv) > 3 and os.path.exists(sys.argv[3]):
        h = hashlib.sha256()
        with open(sys.argv[3], "rb") as f:
            for chunk in iter(lambda: f.read(1 << 20), b""):
                h.update(chunk)
        summary["raw_final_sha256"] = h.hexdigest()
        summary["raw_final_bytes"] = os.path.getsize(sys.argv[3])
    with open(out, "w", encoding="utf-8") as f:
        json.dump(summary, f, indent=1)
    print(json.dumps({k: v for k, v in summary.items() if k != "worst_width_nodes"}, indent=1))
    return 0


if __name__ == "__main__":
    sys.exit(main())
