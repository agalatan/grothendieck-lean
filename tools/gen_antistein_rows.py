#!/usr/bin/env python3
"""Generate kernel-checked AntiStein row certificates and tightened envelope from data/antistein-rows/.

Reads:
  data/antistein-rows/antistein_0.835.json
  data/antistein-rows/antistein_0.845.json
  data/antistein-rows/env_tight.json
  data/antistein-rows/SHA256SUMS

Generates:
  Grothe/LowerAnalytic/AntiRows/Row08Nodes.lean
  Grothe/LowerAnalytic/AntiRows/Row08NodeToks.lean
  Grothe/LowerAnalytic/AntiRows/Row08BankXX.lean
  Grothe/LowerAnalytic/AntiRows/Row08Quad.lean
  Grothe/LowerAnalytic/AntiRows/Row08CellYY.lean  (moment-node cells)
  Grothe/LowerAnalytic/AntiRows/Row08Cells.lean
  Grothe/LowerAnalytic/AntiRows/Row08.lean
  Grothe/LowerAnalytic/AntiRows/Row09Nodes.lean
  Grothe/LowerAnalytic/AntiRows/Row09NodeToks.lean
  Grothe/LowerAnalytic/AntiRows/Row09BankXX.lean
  Grothe/LowerAnalytic/AntiRows/Row09Quad.lean
  Grothe/LowerAnalytic/AntiRows/Row09CellYY.lean  (moment-node cells)
  Grothe/LowerAnalytic/AntiRows/Row09Cells.lean
  Grothe/LowerAnalytic/AntiRows/Row09.lean
  Grothe/Lower/EnvelopeTight.lean

All certificates are verified by proof-producing kernel reduction (`decide +kernel` / `rfl`)
with zero `native_decide` axioms.

Usage:
  python3 tools/gen_antistein_rows.py          # write generated Lean modules
  python3 tools/gen_antistein_rows.py --check  # verify files match byte-for-byte
"""
import argparse
import hashlib
import json
import os
import re
import sys
from fractions import Fraction as Fr

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA_DIR = os.path.join(REPO, "data", "antistein-rows")
ANTI_DIR = os.path.join(REPO, "Grothe", "LowerAnalytic", "AntiRows")
ENV_OUT = os.path.join(REPO, "Grothe", "Lower", "EnvelopeTight.lean")

CUT_MAP = {
    "n": ".n",
    "h": ".h",
    "b": ".b",
    "y": ".y",
    "z": ".z",
    "bn": ".bn",
    "yz": ".yz",
    "h0": ".h0",
    "m": ".m",
    "c1": ".c1",
    "c2+": ".c2p",
    "c2-": ".c2m",
}


def fmt_rat_div(s) -> str:
    f = Fr(s)
    if f.denominator == 1:
        return f"({f.numerator} : ℚ)" if f.numerator < 0 else str(f.numerator)
    if f.numerator < 0:
        return f"({f.numerator} / {f.denominator} : ℚ)"
    return f"{f.numerator} / {f.denominator}"


def fmt_rat(s) -> str:
    f = Fr(s)
    n = f"({f.numerator})" if f.numerator < 0 else str(f.numerator)
    return f"mkRat {n} {f.denominator}"


def fmt_rat_arg(s) -> str:
    return f"({fmt_rat(s)})"


def fmt_int_list(xs, per_line=8) -> str:
    if not xs:
        return "[]"
    lines = []
    for i in range(0, len(xs), per_line):
        lines.append(", ".join(str(x) for x in xs[i : i + per_line]))
    if len(lines) == 1:
        return "[" + lines[0] + "]"
    return "[\n    " + ",\n    ".join(lines) + "\n  ]"


def fmt_endpar(par) -> str:
    alA = fmt_rat(par["alpha"][0])
    alB = fmt_rat(par["alpha"][1])
    sb = fmt_rat(par["sqrt_ub"])
    eta = fmt_rat(par["eta"])
    cuts = []
    for kind, th_s, wt_s in par["cuts"]:
        th = "0" if th_s is None else fmt_rat(th_s)
        wt = fmt_rat(wt_s)
        cuts.append(f"⟨{CUT_MAP[kind]}, {th}, {wt}⟩")
    cuts_s = "[" + ", ".join(cuts) + "]"
    return f"⟨{alA}, {alB}, {sb}, {eta}, {cuts_s}⟩"


def fmt_opt_endpar(par) -> str:
    if par is None:
        return "none"
    return f"(some {fmt_endpar(par)})"


def fmt_anti_node(b) -> str:
    return "\n".join([
        "{",
        f"  sigma := {fmt_rat(b['sigma'])}",
        f"  gridDen := {b['grid_den']}",
        f"  knots := {fmt_int_list(b['knots'], 16)}",
        f"  phi1 := {fmt_int_list(b['phi1'])}",
        f"  phi2 := {fmt_int_list(b['phi2'])}",
        f"  xi2 := {fmt_int_list(b['xi2'])}",
        f"  xi1 := {fmt_int_list(b['xi1'])}",
        f"  xia := {fmt_int_list(b['xia'])}",
        f"  th2 := {fmt_int_list(b['th2'])}",
        f"  th4 := {fmt_int_list(b['th4'])}",
        f"  lam0 := {b['lam0']}",
        f"  lam1 := {b['lam1']}",
        f"  lam2 := {b['lam2']}",
        f"  l3s := {b['l3s']}",
        f"  l3a := {b['l3a']}",
        f"  l3b := {b['l3b']}",
        f"  mu1 := {b['mu1']}",
        f"  mu2 := {b['mu2']}",
        f"  mu3 := {b['mu3']}",
        f"  mu4 := {b['mu4']}",
        f"  mu5 := {b['mu5']}",
        f"  slope1 := {b['slope1']}",
        f"  slope2 := {b['slope2']}",
        f"  sigmaAt := {b['sigma_at']}",
        "}",
    ])


def fmt_summary(b) -> str:
    return (
        f"⟨{fmt_rat(b['sigma'])}, {b['lam0']}, {b['lam1']}, {b['lam2']}, "
        f"{b['l3s']}, {b['l3a']}, {b['l3b']}, "
        f"{b['mu1']}, {b['mu2']}, {b['mu3']}, {b['mu4']}, {b['mu5']}, {b['sigma_at']}⟩"
    )


def fmt_sigma_node(n) -> str:
    k = n["kind"]
    if k == "zero":
        return ".zero"
    if k == "quad":
        return f".quad {n['idx']} {fmt_rat_arg(n['sigma'])} {fmt_rat_arg(n['val'])}"
    if k == "moment":
        return (
            f".moment {fmt_rat_arg(n['sigma'])} {fmt_rat_arg(n['a0'])} {fmt_rat_arg(n['a1'])} "
            f"{fmt_rat_arg(n['a2'])} {fmt_rat_arg(n['a4'])} {fmt_rat_arg(n['a6'])} "
            f"{fmt_rat_arg(n['sb_lo'])} {fmt_rat_arg(n['sb_hi'])}"
        )
    if k == "anti":
        return (
            f".anti {n['idx']} {fmt_rat_arg(n['sigma'])} {fmt_rat_arg(n['val'])} "
            f"{fmt_opt_endpar(n['par_lo'])} {fmt_endpar(n['par_hi'])}"
        )
    raise ValueError(f"unknown node kind {k}")


def parse_row_node_toks(num: str):
    """Extract the exact ASCII decimal token pairs from `Grothe/Lower/RowData{num}.lean`."""
    txt = open(os.path.join(REPO, f"Grothe/Lower/RowData{num}.lean"), encoding="utf-8").read()
    m = re.search(r'"(0:[^"]+)"', txt)
    assert m, f"failed to locate row{num}.nodes in RowData{num}.lean"
    s = m.group(1)

    def parse_q_tok(t: str) -> str:
        if "/" in t:
            a, b = t.split("/")
            return f"({int(a)}, some {int(b)})"
        return f"({int(t)}, none)"

    toks = []
    for item in s.split(";"):
        a, b = item.split(":")
        toks.append(f"({parse_q_tok(a)}, {parse_q_tok(b)})")
    return toks


def verify_sha256sums():
    sums_path = os.path.join(DATA_DIR, "SHA256SUMS")
    if not os.path.isfile(sums_path):
        raise FileNotFoundError(f"Missing {sums_path}")
    with open(sums_path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            expected, fname = line.split()
            fpath = os.path.join(DATA_DIR, fname)
            got = hashlib.sha256(open(fpath, "rb").read()).hexdigest()
            if got != expected:
                raise ValueError(f"SHA-256 mismatch on {fname}: got {got}, expected {expected}")


CHUNK_KNOTS = 12


def compute_anti_chunk_states(nodes_raw, an):
    """Exact mirror of `checkAntiPiecesAux` running state `(g1, g2, lp_idx)` at every knot index."""
    nodes = [(Fr(x), Fr(y)) for x, y in nodes_raw]
    sig = Fr(an["sigma"])
    M = an["grid_den"]
    M2 = M * M
    rMA = 1 << 14
    knots = an["knots"]
    phi1 = an["phi1"]
    phi2 = an["phi2"]
    s1 = an["slope1"]
    s2 = an["slope2"]
    lps_hi = [nodes[i + 1][0] / sig for i in range(len(nodes) - 1)] + [None]

    g1, g2, lp_idx = 0, 0, 0
    states = [(0, 0, 0)]
    for i in range(len(knots) - 1):
        cur_lo = Fr(knots[i], M)
        r_hi = Fr(knots[i + 1], M)
        while True:
            lp_hi = lps_hi[lp_idx]
            if lp_hi is None:
                break
            if lp_hi <= cur_lo:
                lp_idx += 1
            elif r_hi <= lp_hi:
                if lp_hi == r_hi:
                    lp_idx += 1
                break
            else:
                cur_lo = lp_hi
                lp_idx += 1
        U0 = knots[i] * knots[i]
        U1 = knots[i + 1] * knots[i + 1]
        du = U1 - U0
        g1 = g1 + M2 * rMA * (phi1[i] + phi1[i + 1]) * du + s1 * (U1 * U1 - U0 * U0)
        g2 = g2 + M2 * rMA * (phi2[i] + phi2[i + 1]) * du + s2 * (U1 * U1 - U0 * U0)
        states.append((g1, g2, lp_idx))
    return states


def fmt_int_arg(v: int) -> str:
    return f"({v})" if v < 0 else str(v)


def shard_bank(bank):
    """Deterministically group bank indices into compilation shards:
    M=40 entries get 1 per shard; M<40 entries grouped up to 3 per shard."""
    shards = []
    cur = []
    for idx, b in enumerate(bank):
        if b["grid_den"] >= 40:
            if cur:
                shards.append(cur)
                cur = []
            shards.append([idx])
        else:
            cur.append(idx)
            if len(cur) >= 3:
                shards.append(cur)
                cur = []
    if cur:
        shards.append(cur)
    return shards


def gen_row_files(num: str, row_name: str, cert: dict) -> dict:
    """Return {abs_path: content} for all generated files of one tightened row."""
    files = {}
    prefix = f"row{num}"
    # 1. RowXXNodes.lean
    nodes_lines = [
        "import Grothe.LowerAnalytic.AntiSteinRowCheck",
        "",
        f"/-! # Thinned node caps and header constants for tightened row `{row_name}` (`row{num}`)",
        "(generated by `tools/gen_antistein_rows.py`; do not edit) -/",
        "",
        "namespace Grothe.LowerAnalytic",
        "",
        f"def {prefix}Smax : ℚ := {fmt_rat(cert['smax'])}",
        f"def {prefix}Kappa : ℚ := {fmt_rat(cert['kappa'])}",
        f"def {prefix}CapTight : ℚ := {fmt_rat(cert['cap'])}",
        "",
        f"def {prefix}SubNodes : List (ℚ × ℚ) := [",
    ]
    for i, (x, y) in enumerate(cert["nodes"]):
        comma = "," if i + 1 < len(cert["nodes"]) else ""
        nodes_lines.append(f"  ({fmt_rat(x)}, {fmt_rat(y)}){comma}")
    nodes_lines += [
        "]",
        "",
        "end Grothe.LowerAnalytic",
        "",
    ]
    files[os.path.join(ANTI_DIR, f"Row{num}Nodes.lean")] = "\n".join(nodes_lines)

    # 2. RowXXNodeToks.lean (pure-kernel sublist proof: rowXXSubNodes ⊆ rowXX.nodeList)
    toks = parse_row_node_toks(num)
    tok_lines = [
        "import Grothe.LowerAnalytic.AntiSteinRowCheck",
        "import Grothe.LowerAnalytic.NodeListParse",
        f"import Grothe.Lower.RowData{num}",
        f"import Grothe.LowerAnalytic.AntiRows.Row{num}Nodes",
        "",
        f"/-! # Pure-kernel `nodeList` sublist proof for row `{row_name}` (`row{num}`)",
        "(generated by `tools/gen_antistein_rows.py`; do not edit) -/",
        "",
        "open Grothe.Lower",
        "",
        "namespace Grothe.LowerAnalytic",
        "",
        "set_option maxRecDepth 200000",
        "set_option maxHeartbeats 1000000",
        "",
        f"private def {prefix}NodeToks : List ((ℕ × Option ℕ) × (ℕ × Option ℕ)) := [",
    ]
    for i, tok in enumerate(toks):
        comma = "," if i + 1 < len(toks) else ""
        tok_lines.append(f"  {tok}{comma}")
    tok_lines += [
        "]",
        "",
        f"private theorem {prefix}NodeToks_str : String.ofList (capsChars {prefix}NodeToks) = {prefix}.nodes := rfl",
        "",
        f"private theorem {prefix}NodeToks_range : {prefix}NodeToks.all capTokInRange = true := by",
        "  decide +kernel",
        "",
        f"private theorem {prefix}NodeToks_sub : isSublistQ {prefix}SubNodes ({prefix}NodeToks.map evalCapTok) = true := by",
        "  decide +kernel",
        "",
        f"theorem {prefix}SubNodes_sublist : isSublistQ {prefix}SubNodes {prefix}.nodeList = true := by",
        f"  rw [nodeList_eq_of_capsChars {prefix} {prefix}NodeToks (by decide) {prefix}NodeToks_range {prefix}NodeToks_str]",
        f"  exact {prefix}NodeToks_sub",
        "",
        "end Grothe.LowerAnalytic",
        "",
    ]
    files[os.path.join(ANTI_DIR, f"Row{num}NodeToks.lean")] = "\n".join(tok_lines)

    # 3. RowXXBankYY.lean shards (chunked into <=12-knot kernel lemmas for fast WHNF reduction)
    bank = cert["bank"]
    shards = shard_bank(bank)
    shard_mods = []
    for si, idxs in enumerate(shards):
        mod = f"Row{num}Bank{si:02d}"
        shard_mods.append(mod)
        lines = [
            "import Grothe.LowerAnalytic.AntiSteinChunk",
            f"import Grothe.LowerAnalytic.AntiRows.Row{num}Nodes",
            "",
            f"/-! # AntiStein bank shard {si:02d} for row `{row_name}` (`row{num}`)",
            "(generated by `tools/gen_antistein_rows.py`; do not edit) -/",
            "",
            "namespace Grothe.LowerAnalytic",
            "",
            "set_option maxRecDepth 200000",
            "",
        ]
        for idx in idxs:
            an = bank[idx]
            aname = f"{prefix}Anti_{idx:02d}"
            lines.append(f"def {aname} : AntiNode :=")
            lines.append(fmt_anti_node(an))
            lines.append("")
            n_int = len(an["knots"]) - 1
            if n_int <= CHUNK_KNOTS:
                lines.append(
                    f"theorem {aname}_ok : checkAntiNode {prefix}SubNodes {prefix}Smax {aname} = true := by"
                )
                lines.append("  decide +kernel")
                lines.append("")
            else:
                states = compute_anti_chunk_states(cert["nodes"], an)
                lines.append(
                    f"private theorem {aname}_hdr : checkAntiHead {prefix}SubNodes {aname} = true := by"
                )
                lines.append("  decide +kernel")
                lines.append("")
                chunk_names = []
                pos = 0
                ci = 0
                while pos + CHUNK_KNOTS < n_int:
                    nxt = pos + CHUNK_KNOTS
                    g1s, g2s, lp0 = states[pos]
                    g1e, g2e, lp1 = states[nxt]
                    cname = f"{aname}_c{ci:02d}"
                    chunk_names.append(cname)
                    lines.append(
                        f"private theorem {cname} : checkAntiChunk {prefix}SubNodes {prefix}Smax {aname} "
                        f"{pos} {CHUNK_KNOTS} {fmt_int_arg(g1s)} {fmt_int_arg(g2s)} {lp0} "
                        f"{fmt_int_arg(g1e)} {fmt_int_arg(g2e)} {lp1} = true := by"
                    )
                    lines.append("  decide +kernel")
                    lines.append("")
                    pos = nxt
                    ci += 1
                g1s, g2s, lp0 = states[pos]
                tname = f"{aname}_tail"
                lines.append(
                    f"private theorem {tname} : checkAntiTail {prefix}SubNodes {prefix}Smax {aname} "
                    f"{pos} {fmt_int_arg(g1s)} {fmt_int_arg(g2s)} {lp0} = true := by"
                )
                lines.append("  decide +kernel")
                lines.append("")
                expr = tname
                for cname in reversed(chunk_names):
                    expr = f"(checkAntiTail_of_chunk _ _ _ _ _ _ _ _ _ _ _ {cname} {expr})"
                lines.append(
                    f"theorem {aname}_ok : checkAntiNode {prefix}SubNodes {prefix}Smax {aname} = true :="
                )
                lines.append(f"  checkAntiNode_of_tail _ _ _ {aname}_hdr {expr}")
                lines.append("")
        lines += ["end Grothe.LowerAnalytic", ""]
        files[os.path.join(ANTI_DIR, f"{mod}.lean")] = "\n".join(lines)

    # 4. RowXXQuad.lean (per-node quadBank checks + nodesOK + bankSums)
    qbank = cert["quad_bank"]
    quad_lines = [
        "import Grothe.LowerAnalytic.AntiSteinRowCheck",
        f"import Grothe.LowerAnalytic.AntiRows.Row{num}Nodes",
        "",
        f"/-! # Quadratic bank and summary headers for row `{row_name}` (`row{num}`)",
        "(generated by `tools/gen_antistein_rows.py`; do not edit) -/",
        "",
        "namespace Grothe.LowerAnalytic",
        "",
        "set_option maxRecDepth 200000",
        "",
        f"theorem {prefix}Nodes_ok : nodesOK {prefix}SubNodes = true := by",
        "  decide +kernel",
        "",
    ]
    for qi, q in enumerate(qbank):
        qname = f"{prefix}Quad_{qi:02d}"
        quad_lines += [
            f"private def {qname} : QuadNode :=",
            f"  ⟨{fmt_rat(q['sigma'])}, {fmt_rat(q['a0'])}, {fmt_rat(q['a1'])}, {fmt_rat(q['a2'])}⟩",
            "",
            f"private theorem {qname}_ok : checkQuadNode {prefix}SubNodes {prefix}Smax {qname} = true := by",
            "  decide +kernel",
            "",
        ]
    quad_lines += [
        f"def {prefix}QuadBank : List QuadNode := [",
        "  " + ", ".join(f"{prefix}Quad_{qi:02d}" for qi in range(len(qbank))),
        "]",
        "",
        f"theorem {prefix}QuadBank_ok : {prefix}QuadBank.all (checkQuadNode {prefix}SubNodes {prefix}Smax) = true := by",
        f"  simp only [{prefix}QuadBank, List.all_cons, List.all_nil, Bool.and_true,",
        "    " + ", ".join(f"{prefix}Quad_{qi:02d}_ok" for qi in range(len(qbank))) + "]",
        "",
        f"def {prefix}BankSums : List AntiNodeSummary := [",
    ]
    for i, b in enumerate(bank):
        comma = "," if i + 1 < len(bank) else ""
        quad_lines.append(f"  {fmt_summary(b)}{comma}")
    quad_lines += ["]", "", "end Grothe.LowerAnalytic", ""]
    files[os.path.join(ANTI_DIR, f"Row{num}Quad.lean")] = "\n".join(quad_lines)

    # 5. Moment-cell shards RowXXCellYY.lean + RowXXCells.lean assembly
    cells = cert["cells"]
    moment_cell_mods = []
    non_moment_cells = []
    for ci, c in enumerate(cells):
        has_moment = any(n["kind"] == "moment" for n in c["nodes"])
        if has_moment:
            mod = f"Row{num}Cell{ci:02d}"
            moment_cell_mods.append(mod)
            cname = f"{prefix}Cell_{ci:02d}"
            # Partition snodes into alternating non-moment runs and singleton moment nodes.
            runs = []
            cur_run = []
            for n in c["nodes"]:
                if n["kind"] == "moment":
                    if cur_run:
                        runs.append(("run", cur_run))
                        cur_run = []
                    runs.append(("moment", n))
                else:
                    cur_run.append(n)
            if cur_run:
                runs.append(("run", cur_run))
            assert runs and runs[0][0] == "run" and runs[0][1][0]["kind"] == "zero"

            clines = [
                "import Grothe.LowerAnalytic.AntiSteinRowCheck",
                f"import Grothe.LowerAnalytic.AntiRows.Row{num}Nodes",
                f"import Grothe.LowerAnalytic.AntiRows.Row{num}Quad",
                "",
                f"/-! # Moment `s`-cell {ci:02d} (`[{c['s_lo']}, {c['s_hi']}]`) for row `{row_name}` (`row{num}`)",
                "(generated by `tools/gen_antistein_rows.py`; do not edit) -/",
                "",
                "namespace Grothe.LowerAnalytic",
                "",
                "set_option maxRecDepth 200000",
                "",
            ]
            run_exprs = []
            run_ok_names = []
            run_id = 0
            mom_id = 0
            sLo_s = fmt_rat_arg(c["s_lo"])
            sHi_s = fmt_rat_arg(c["s_hi"])
            for kind, payload in runs:
                if kind == "run":
                    rname = f"{cname}_seg{run_id:02d}"
                    run_id += 1
                    clines.append(f"private def {rname} : List RowSigmaNode := [")
                    for ni, n in enumerate(payload):
                        n_comma = "," if ni + 1 < len(payload) else ""
                        clines.append(f"  {fmt_sigma_node(n)}{n_comma}")
                    clines += [
                        "]",
                        "",
                        f"private theorem {rname}_ok :",
                        f"    {rname}.all (checkSigmaNode {prefix}SubNodes {prefix}Smax {sLo_s} {sHi_s} {prefix}QuadBank {prefix}BankSums) = true := by",
                        "  decide +kernel",
                        "",
                    ]
                    run_exprs.append(rname)
                    run_ok_names.append(f"{rname}_ok")
                else:
                    mname = f"{cname}_m{mom_id:02d}"
                    mom_id += 1
                    clines += [
                        f"private def {mname} : RowSigmaNode :=",
                        f"  {fmt_sigma_node(payload)}",
                        "",
                        f"private theorem {mname}_ok :",
                        f"    checkSigmaNode {prefix}SubNodes {prefix}Smax {sLo_s} {sHi_s} {prefix}QuadBank {prefix}BankSums {mname} = true := by",
                        "  decide +kernel",
                        "",
                    ]
                    run_exprs.append(f"[{mname}]")
                    run_ok_names.append(f"{mname}_ok")

            snodes_expr = " ++ ".join(run_exprs)
            clines += [
                f"def {cname} : AntiSCell :=",
                f"  ⟨{fmt_rat(c['s_lo'])}, {fmt_rat(c['s_hi'])},",
                f"   {snodes_expr}⟩",
                "",
                f"private theorem {cname}_hdr : decide (0 ≤ {cname}.sLo) && decide ({cname}.sLo < {cname}.sHi) = true := by",
                "  decide +kernel",
                "",
                f"private theorem {cname}_chain :",
                f"    checkSigmaChain ({prefix}SubNodes.headD (0, 0)).2 {cname}.sLo {cname}.sHi {prefix}Kappa {prefix}CapTight (mkRat 3 4) {cname}.snodes = true := by",
                "  decide +kernel",
                "",
                f"theorem {cname}_ok :",
                f"    checkAntiSCell {prefix}SubNodes {prefix}Smax {prefix}Kappa {prefix}CapTight (mkRat 3 4) {prefix}QuadBank {prefix}BankSums {cname} = true := by",
                f"  have hall : {cname}.snodes.all (checkSigmaNode {prefix}SubNodes {prefix}Smax {cname}.sLo {cname}.sHi {prefix}QuadBank {prefix}BankSums) = true := by",
                f"    simp only [{cname}, List.all_append, List.all_cons, List.all_nil, Bool.and_true,",
                "      " + ", ".join(run_ok_names) + "]",
                f"  have hsn : ∃ t, {cname}.snodes = .zero :: t := ⟨_, rfl⟩",
                "  obtain ⟨t, ht⟩ := hsn",
                "  unfold checkAntiSCell",
                "  dsimp only",
                "  rw [ht]",
                "  dsimp only",
                "  rw [← ht]",
                f"  simp only [{cname}_chain, hall, Bool.and_true]",
                f"  exact {cname}_hdr",
                "",
                "end Grothe.LowerAnalytic",
                "",
            ]
            files[os.path.join(ANTI_DIR, f"{mod}.lean")] = "\n".join(clines)
        else:
            non_moment_cells.append((ci, c))

    # 6. RowXXCells.lean (non-moment cells checked per-cell + assembly of all 12 cells)
    cells_lines = [
        "import Grothe.LowerAnalytic.AntiSteinRowCheck",
        f"import Grothe.LowerAnalytic.AntiRows.Row{num}Nodes",
        f"import Grothe.LowerAnalytic.AntiRows.Row{num}Quad",
    ] + [f"import Grothe.LowerAnalytic.AntiRows.{m}" for m in moment_cell_mods] + [
        "",
        f"/-! # `s`-cell assembly check for row `{row_name}` (`row{num}`)",
        "(generated by `tools/gen_antistein_rows.py`; do not edit) -/",
        "",
        "namespace Grothe.LowerAnalytic",
        "",
        "set_option maxRecDepth 200000",
        "",
    ]
    for ci, c in non_moment_cells:
        cname = f"{prefix}Cell_{ci:02d}"
        cells_lines.append(f"private def {cname} : AntiSCell :=")
        cells_lines.append(f"  ⟨{fmt_rat(c['s_lo'])}, {fmt_rat(c['s_hi'])}, [")
        snodes = c["nodes"]
        for ni, n in enumerate(snodes):
            n_comma = "," if ni + 1 < len(snodes) else ""
            cells_lines.append(f"    {fmt_sigma_node(n)}{n_comma}")
        cells_lines += [
            "  ]⟩",
            "",
            f"private theorem {cname}_ok :",
            f"    checkAntiSCell {prefix}SubNodes {prefix}Smax {prefix}Kappa {prefix}CapTight (mkRat 3 4) {prefix}QuadBank {prefix}BankSums {cname} = true := by",
            "  decide +kernel",
            "",
        ]
    cell_names = [f"{prefix}Cell_{ci:02d}" for ci in range(len(cells))]
    cells_lines += [
        f"def {prefix}Cells : List AntiSCell := [",
        "  " + ", ".join(cell_names),
        "]",
        "",
        f"private theorem {prefix}SCellChain_ok : checkSCellChain 0 42 {prefix}Cells = true := by",
        "  decide +kernel",
        "",
        f"theorem {prefix}Cells_ok : checkAntiCells {prefix}SubNodes {prefix}Smax {prefix}Kappa {prefix}CapTight (mkRat 3 4) {prefix}QuadBank {prefix}BankSums {prefix}Cells = true := by",
        f"  rw [checkAntiCells, {prefix}Nodes_ok, {prefix}QuadBank_ok, {prefix}SCellChain_ok]",
        f"  simp only [{prefix}Cells, List.all_cons, List.all_nil, Bool.and_true,",
        "    " + ", ".join(f"{n}_ok" for n in cell_names) + "]",
        "",
        "end Grothe.LowerAnalytic",
        "",
    ]
    files[os.path.join(ANTI_DIR, f"Row{num}Cells.lean")] = "\n".join(cells_lines)

    # 7. RowXX.lean (soundness assembly -> CircularRowBound rowXX rowXXCapTight)
    asm_lines = [
        "import Grothe.LowerAnalytic.AntiSteinRowSound",
        "import Grothe.Lower.Rows",
        f"import Grothe.Lower.RowData{num}",
        f"import Grothe.LowerAnalytic.AntiRows.Row{num}Nodes",
        f"import Grothe.LowerAnalytic.AntiRows.Row{num}NodeToks",
        f"import Grothe.LowerAnalytic.AntiRows.Row{num}Quad",
        f"import Grothe.LowerAnalytic.AntiRows.Row{num}Cells",
    ] + [f"import Grothe.LowerAnalytic.AntiRows.{m}" for m in shard_mods] + [
        "",
        f"/-! # Certified tightened `CircularRowBound` for row `{row_name}` (`row{num}`)",
        "(generated by `tools/gen_antistein_rows.py`; do not edit) -/",
        "",
        "open Grothe.Lower",
        "",
        "namespace Grothe.LowerAnalytic",
        "",
        f"def {prefix}Bank : List AntiNode := [",
        "  " + ", ".join(f"{prefix}Anti_{i:02d}" for i in range(len(bank))),
        "]",
        "",
        f"private theorem {prefix}BankSums_eq : {prefix}Bank.map AntiNode.summary = {prefix}BankSums := rfl",
        "",
        f"private theorem {prefix}Bank_ok : {prefix}Bank.all (checkAntiNode {prefix}SubNodes {prefix}.smax) = true := by",
        f"  have hs : {prefix}.smax = {prefix}Smax := by decide +kernel",
        "  rw [hs]",
        f"  simp only [{prefix}Bank, List.all_cons, List.all_nil, Bool.and_true,",
        "    " + ", ".join(f"{prefix}Anti_{i:02d}_ok" for i in range(len(bank))) + "]",
        "",
        f"theorem {prefix}_delta_pos : 0 < {prefix}.delta := by decide +kernel",
        "",
        f"theorem {prefix}_gateOK : gateOK {prefix}.N = true := by decide +kernel",
        "",
        f"theorem {prefix}_kappa_le : {prefix}.kappa * {prefix}.delta ^ 2 ≤ {prefix}.delta + gatePrice {prefix}.N {prefix}.g1 {prefix}.g2 {prefix}.g3 := by",
        "  decide +kernel",
        "",
        f"/-- **Tightened antiholomorphic Stein bound for row `{row_name}` (`row{num}`)** up to `σ ≤ δ · 93/100`. -/",
        f"theorem circularRowBound_{prefix} : CircularRowBound {prefix} {prefix}CapTight := by",
        f"  have hs : {prefix}.smax = {prefix}Smax := by decide +kernel",
        f"  have hk : {prefix}.kappa = {prefix}Kappa := by decide +kernel",
        f"  have hstop : {prefix}.delta * (93 / 100) ≤ mkRat 3 4 := by decide +kernel",
        f"  have hcells : checkAntiCells {prefix}SubNodes {prefix}.smax {prefix}.kappa {prefix}CapTight (mkRat 3 4)",
        f"      {prefix}QuadBank ({prefix}Bank.map AntiNode.summary) {prefix}Cells = true := by",
        f"    rw [hs, hk, {prefix}BankSums_eq]",
        f"    exact {prefix}Cells_ok",
        "  intro d",
        f"  exact checkAntiCells_sound {prefix} {prefix}SubNodes {prefix}CapTight (mkRat 3 4) {prefix}QuadBank {prefix}Bank {prefix}Cells",
        f"    {prefix}SubNodes_sublist (by decide +kernel) hstop {prefix}Bank_ok hcells",
        "",
        "end Grothe.LowerAnalytic",
        "",
    ]
    files[os.path.join(ANTI_DIR, f"Row{num}.lean")] = "\n".join(asm_lines)
    return files


def gen_env_file(env_cert: dict) -> str:
    EPS = Fr(25, 31)
    CAPPAD = Fr(1, 10**11)
    Q_RE = r"\((-?\d+)\s*:\s*ℚ\)(?:\s*/\s*(\d+))?"
    cap08 = Fr(env_cert["cap08"])
    cap09 = Fr(env_cert["cap09"])
    envB = Fr(env_cert["env_B"])
    env_rows = []
    for idx in range(1, 15):
        txt = open(os.path.join(REPO, f"Grothe/Lower/RowData{idx:02d}.lean"), encoding="utf-8").read()
        m = re.search(r"def row\d+ : Row :=\s*⟨\s*" + r",\s*".join([Q_RE] * 6) + ",", txt)
        assert m, f"failed parsing RowData{idx:02d}.lean"
        qs = [Fr(int(m[2 * k + 1]), int(m[2 * k + 2]) if m[2 * k + 2] else 1) for k in range(6)]
        ell, beta, _, _, _, cap = qs
        if idx == 8:
            cap = cap08
        elif idx == 9:
            cap = cap09
        C = 2 * beta * beta / EPS + cap + CAPPAD
        env_rows.append((ell, beta, C))

    lines = [
        "import Grothe.Lower.EnvelopePure",
        "import Grothe.Lower.MassFacts",
        "import Grothe.Lower.RowData",
        "",
        "/-!",
        "# Tightened envelope breaking `K_G^ℂ > 1.402` (generated by `tools/gen_antistein_rows.py`; do not edit)",
        "",
        f"Replaces only `row08` (`0.835`) and `row09` (`0.845`) with their tightened antiholomorphic Stein caps",
        f"`cap08Tight = {cap08}` and `cap09Tight = {cap09}` (`{len(env_cert['cells'])}` structured cells,",
        f"maximum `{float(Fr(env_cert['worst'])):.8f} ≤ envBTight = {envB}`). Verified by `decide +kernel`.",
        "-/",
        "",
        "namespace Grothe.Lower",
        "",
        f"def cap08Tight : ℚ := {fmt_rat_div(cap08)}",
        f"def cap09Tight : ℚ := {fmt_rat_div(cap09)}",
        f"def envBTight : ℚ := {fmt_rat_div(envB)}",
        "",
        "def rowDataTight : List Row := [",
        "  row01, row02, row03, row04, row05, row06, row07,",
        "  { row08 with cap := cap08Tight },",
        "  { row09 with cap := cap09Tight },",
        "  row10, row11, row12, row13, row14",
        "]",
        "",
        "def envRowsTight : List EnvRow := [",
    ]
    for i, (ell, beta, C) in enumerate(env_rows):
        comma = "," if i + 1 < len(env_rows) else ""
        lines.append(f"  ⟨{fmt_rat_div(ell)}, {fmt_rat_div(beta)}, {fmt_rat_div(C)}⟩{comma}")
    lines += [
        "]",
        "",
        "theorem envRowsTight_eq : rowDataTight.map Row.env = envRowsTight := by",
        "  simp only [rowDataTight, envRowsTight, List.map, Row.env, List.cons.injEq, EnvRow.mk.injEq, and_true]",
        "  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;>",
        "    exact ⟨by decide +kernel, by decide +kernel, by decide +kernel⟩",
        "",
        "def envCellsTight : List EnvCell := [",
    ]
    cells = env_cert["cells"]
    for i, (lo, hi, ri, rj, th) in enumerate(cells):
        comma = "," if i + 1 < len(cells) else ""
        lines.append(f"  ⟨{fmt_rat_div(lo)}, {fmt_rat_div(hi)}, {ri}, {rj}, {fmt_rat_div(th)}⟩{comma}")
    lines += [
        "]",
        "",
        "/-- Kernel-checked tightened envelope certificate (`V̂ ≤ envBTight` on `[0, 9/10]`, zero `native_decide`). -/",
        "theorem certEnvelopeTight : checkEnvPure envRowsTight massS envBTight envCellsTight = true := by",
        "  decide +kernel",
        "",
        "end Grothe.Lower",
        "",
    ]
    return "\n".join(lines)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true", help="Verify generated files match byte-for-byte")
    args = ap.parse_args()

    verify_sha256sums()
    cert08 = json.load(open(os.path.join(DATA_DIR, "antistein_0.835.json"), encoding="utf-8"))
    cert09 = json.load(open(os.path.join(DATA_DIR, "antistein_0.845.json"), encoding="utf-8"))
    env_cert = json.load(open(os.path.join(DATA_DIR, "env_tight.json"), encoding="utf-8"))

    want = {}
    want.update(gen_row_files("08", "0.835", cert08))
    want.update(gen_row_files("09", "0.845", cert09))
    want[ENV_OUT] = gen_env_file(env_cert)

    # Check for stale files in AntiRows/
    existing = set()
    if os.path.isdir(ANTI_DIR):
        for fn in os.listdir(ANTI_DIR):
            if fn.endswith(".lean"):
                existing.add(os.path.join(ANTI_DIR, fn))

    if args.check:
        bad = []
        for path, content in sorted(want.items()):
            if not os.path.isfile(path):
                bad.append(f"missing {os.path.relpath(path, REPO)}")
            else:
                got = open(path, encoding="utf-8").read()
                if got != content:
                    bad.append(f"differs {os.path.relpath(path, REPO)}")
        for extra in sorted(existing - set(want.keys())):
            bad.append(f"stale {os.path.relpath(extra, REPO)}")
        if bad:
            for b in bad:
                print("FAIL:", b)
            return 1
        print(f"OK: {len(want)} generated AntiStein row/envelope modules match data/antistein-rows/ byte-for-byte")
        return 0

    os.makedirs(ANTI_DIR, exist_ok=True)
    for extra in sorted(existing - set(want.keys())):
        os.remove(extra)
        print("removed stale", os.path.relpath(extra, REPO))
    for path, content in sorted(want.items()):
        # Preserve mtime when unchanged so Lake keeps cached .olean builds
        if os.path.isfile(path) and open(path, encoding="utf-8").read() == content:
            continue
        with open(path, "w", encoding="utf-8", newline="\n") as f:
            f.write(content)
    print(f"wrote {len(want)} generated Lean files ({len(cert08['bank'])} bank08, {len(cert09['bank'])} bank09, {len(env_cert['cells'])} env cells)")
    return 0


if __name__ == "__main__":
    sys.exit(main())
