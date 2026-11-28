#!/usr/bin/env python3
"""Replay the piece-15 JM1 certificates using the original content-cell verifier. Agent-ID: codex-062a."""
from decimal import Decimal
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile

HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "degree5-content-cells-gemini-c1de"
TABLE = HERE.parent / "degree5-design/design-2026-11-25/tables/funded/fin_table_fundFull.json"
sys.path.insert(0, str(SOURCE))
import verify as original

# Exact decimals in the proof note. The C++ verifier works with dyadic inputs.
PUBLIC_BOUNDS = {(0, 8): Q("4.8218"), (16, 20): Q("6.545"), (20, 42): Q(12)}
COVERED_BIN_ENDS = [1, 2, 3, 4, 6, 8, 20, 24, 30, 36, 42]


def check(ok, message):
    if not ok:
        raise ValueError(message)


def funded_row(index=2):
    table = json.loads(TABLE.read_text(), parse_float=Decimal)
    chosen = sorted(table["chosen"], key=lambda c: Q(c["piece"][0]))[14]
    piece, = [p for p in table["cases"]
              if p["piece"] == chosen["piece"] and p["row_tag"] == chosen["row_tag"]]
    node = piece["theta"][index]
    check(piece["row_tag"] == "0.855" and Q(node["ucapfrac"]) == (Q("0.60"), Q("0.70"), Q("0.78"))[index],
          "wrong funded energy or profile for piece 15")
    return Q(piece["piece"][0]), node


def bind_cells(cfg, weights):
    # The parent verifier binds the reference energy and Rice threshold to the exact funded table.
    ref, = [c for c in cfg["cells"] if c["piece_idx"] == 15 and c["u_idx"] == 2
            and c["chi_lo"] == c["chi_hi"] == 20]
    t_exact, node = funded_row()
    check(Q(ref["t_lo"]) <= t_exact and Q(ref["u_lo"]) <= Q(node["u"]) <= Q(ref["u_hi"]),
          "certificate energy or Rice threshold misses the funded row")
    # The original singleton has enough margin over the full (16, 20] table bin at F = 6.545.
    point = {"chi_lo": 16, "chi_hi": 20, "F_claimed": 6.545,
             "slicesA": ref["slicesA"], "slicesB": ref["slicesB"]}
    return bind_to_bins(ref, node, [*weights, point], PUBLIC_BOUNDS, COVERED_BIN_ENDS)


def bind_to_bins(ref, node, weights, public_bounds, expected_ends):
    cols = {"chi_lo", "chi_hi", "F_claimed", "slicesA", "slicesB"}
    check(all(set(c) == cols for c in weights), "wrong witness fields")
    weights = sorted(weights, key=lambda c: c["chi_lo"])
    check([(c["chi_lo"], c["chi_hi"]) for c in weights] == sorted(public_bounds), "wrong chi intervals")
    bins = sorted(int(k) for k in node["theta_chi"])
    closed = []
    cells = []
    for c in weights:
        inside = [(a, b) for a, b in zip([0] + bins, bins) if c["chi_lo"] <= a and b <= c["chi_hi"]]
        check(inside and inside[0][0] == c["chi_lo"] and inside[-1][1] == c["chi_hi"],
              "certificate endpoints do not enclose whole funded bins")
        allowance = min(Q(node["theta_chi"][str(b)]) for _, b in inside)
        certified = Q(c["F_claimed"])
        check(0 < certified <= allowance, "certificate exceeds a funded allowance")
        check(certified <= public_bounds[c["chi_lo"], c["chi_hi"]], "certificate exceeds the published bound")
        # theta_allow labels the stream. Proof checks use F_claimed, audited above as an exact binary64.
        cells.append({**ref, **c, "theta_allow": c["F_claimed"]})
        closed.extend(b for _, b in inside)
    check(closed == expected_ends, "unexpected set of covered bins")
    return cells


def audit_tails(cfg, cells):
    params = {k: list(map(Q, cfg[k])) for k in
              ("t_knots", "c_rat", "s_gram", "rho_a", "rho_b", "lams_rice")}
    params["eps_K"] = Q(cfg["eps_K"])
    exp_bounds = [original.exp_neg_rational_bounds(x) for x in params["t_knots"]]
    for c in cells:
        cell = {k + "_q": Q(c[k]) for k in ("u_lo", "u_hi", "t_lo", "chi_lo", "chi_hi")}
        cell.update(F_q=Q(c["F_claimed"]), P_max_q=Q(2))
        for key in ("slicesA", "slicesB"):
            check(c[key] and all(s["a_r"] <= s["b_r"] for s in c[key]), "empty or reversed slice")
            for s in c[key]:
                original.verify_slice_rational_tail_and_signs(s, cell, params, exp_bounds, False)


def run_replay(cfg, cells):
    audit_tails(cfg, cells)
    with tempfile.TemporaryDirectory() as tmp:
        work = Path(tmp)
        binary, data, receipt = (work / name for name in ("certifier", "cells.dat", "result.json"))
        stream = original.emit_dat_from_json({**cfg, "cells": cells}, data)
        subprocess.run(["c++", "-O3", "-frounding-math", "-ffp-contract=off", "-Wno-unknown-pragmas", "-std=c++17", "-pthread",
                        str(SOURCE / "certify_content_cells.cpp"), "-o", str(binary)], check=True)
        subprocess.run([str(binary), "--verify-all", str(data), str(receipt), "--threads", "3"], check=True)
        result = json.loads(receipt.read_text())
    check_receipt(result, cells, hashlib.sha256(stream).hexdigest())


def check_receipt(result, cells, stream_digest):
    check(result["dat_sha256"] == stream_digest, "receipt does not match certificate input")
    check(result["status"] == "CERTIFIED" and len(result["cells"]) == len(cells), "incomplete C++ replay")
    for c, rec in zip(cells, result["cells"]):
        check((rec["piece"], rec["row"], rec["u_idx"], rec["u_lo"], rec["u_hi"], rec["t_lo"],
               rec["chi_lo"], rec["chi_hi"], rec["kind"], rec["F_certified"]) ==
              (c["piece_idx"], c["row_tag"], c["u_idx"], c["u_lo"], c["u_hi"], c["t_lo"],
               c["chi_lo"], c["chi_hi"], c["kind"], c["F_claimed"]), "cell mismatch")
        check(rec["worst_M_A"] < 0 and rec["worst_M_B"] < 0, "continuous residual is nonnegative")
        left = "(" if rec["chi_lo"] == 0 else "["
        print(f"u in [{rec['u_lo']}, {rec['u_hi']}], chi in {left}{rec['chi_lo']}, {rec['chi_hi']}], "
              f"F = {Q(rec['F_certified'])}, "
              f"sup bounds A, B = {rec['worst_M_A']:.6g}, {rec['worst_M_B']:.6g}")


def main():
    original.verify_all()  # global Rice tangent inequalities, parent inputs and exact energy-node bindings
    cfg = original.load_full_cfg(str(SOURCE / "dual_certs.json"))
    cells = bind_cells(cfg, json.loads((HERE / "cells.json").read_text()))
    run_replay(cfg, cells)
    print(f"Verified {len(COVERED_BIN_ENDS)} whole funded bins at piece 15, u/u_cap = 0.78 (10 additional).")


if __name__ == "__main__":
    main()
