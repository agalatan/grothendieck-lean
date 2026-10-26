#!/usr/bin/env python3
"""Plan the rows 12–15 node-cap campaign (route M, issue #16): the cheapest grid per piece.

The Lean check of a localised piece costs ~seconds on 400×128 (grid 0), ~1 min on 1600×256 (grid 1) and ~3 min on
1600×1024 (grid 2) (prices + interval enclosures; docs/SPEED_TOOLS.md). The stored pieces use grid 1 or 2. This tool
finds, per piece, the cheapest grid on which the exact check accepts the stored cap with some S-lemma multipliers:

  1. `gen`: write throwaway Lean modules (not committed) that export the piece matrices of chosen nodes on a chosen
     grid with the checker's own functions (`exportPiecesOn`, Grothe/LowerAnalytic/CapExport.lean);
     build them with `lake build` (the #eval runs at build time with the precompiled kernel).
  2. `solve`: for every exported piece: pass with the stored multipliers (`ok`), or search exact multipliers with
     tools/caps_lmi.py (SDP + 60-digit refinement + Fraction LDL, the same test as `ldlOK`), or the minimal cap
     increase. Requires the enclosure and polynomial checks of the export to hold.
  3. `plan`: combine the verdicts of all grids into data/caps-m/plan/<k>x<i>.json (cheapest accepted grid,
     multipliers, or the cap increase on the finest grid) and print the cost summary.

All of this is search: the plan is certified only by the generated native range facts (tools/gen_cap_pieces.py).

usage:
  tools/caps_plan.py gen  PIECES.json GRID OUTJSONL_DIR NODE [NODE ...]     (NODE = k:i; writes the Lean modules)
  tools/caps_plan.py gen-select PIECES.json GRID OUTDIR BATCH centre|all   (batched modules over all nodes)
  tools/caps_plan.py solve EXPORT.jsonl OUT.json
  tools/caps_plan.py plan PIECES.json SOLVED_DIR OUT_DIR
"""
import glob, json, os, sys, time
from fractions import Fraction as F

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
sys.path.insert(0, os.path.join(ROOT, "tools"))
RUNS = os.path.join(ROOT, "Grothe", "LowerAnalytic", "CapPlanRuns")   # throwaway modules, never committed
GRIDS = {0: "400x128", 1: "1600x256", 2: "1600x1024"}
SEC = {0: 6.0, 1: 46.0, 2: 185.0}   # Lean check seconds per piece (prices + enclosure dominate), calibrated in plan
NQ_GRID = {256: 1, 1024: 2}


def node_strings(n, g):
    """Directions and piece strings of node n, every piece on grid g (format of tools/gen_cap_pieces.py)."""
    return list(n["ds"]), [f"{g};{p['recipe']};" + ";".join(p["cons"]) for p in n["pieces"]]


def cmd_gen(pieces_path, grid, outdir, nodes):
    P = {f"{n['k']}:{n['i']}": n for n in json.load(open(pieces_path))}
    os.makedirs(RUNS, exist_ok=True)
    os.makedirs(outdir, exist_ok=True)
    mods = []
    for key in nodes:
        n = P[key]
        tag = f"{n['k']}x{n['i']}"
        ds, pcs = node_strings(n, grid)
        out = os.path.abspath(os.path.join(outdir, f"exp_{tag}_g{grid}.jsonl"))
        if os.path.exists(out):
            os.remove(out)
        name = f"Run_{tag}_g{grid}"
        src = ["import Grothe.LowerAnalytic.CapExport", "", "namespace Grothe.LowerAnalytic", "",
               "set_option maxRecDepth 100000", "",
               f"def planNode_{tag}_g{grid} : Nat × Nat × List String × List String :=",
               f"  ({n['k']}, {n['i']}, [{', '.join(json.dumps(x) for x in ds)}], [\n" +
               ",\n".join("    " + json.dumps(x) for x in pcs) + "])", "",
               f"#eval exportPiecesOn {json.dumps(out)} planNode_{tag}_g{grid} (List.range {len(pcs)}) {grid}", "",
               "end Grothe.LowerAnalytic", ""]
        open(os.path.join(RUNS, f"{name}.lean"), "w").write("\n".join(src))
        mods.append(f"Grothe.LowerAnalytic.CapPlanRuns.{name}")
    print(" ".join(mods))


def cmd_gen_select(pieces_path, grid, outdir, batch, which):
    """Modules exporting selected pieces of many nodes in batches (one module per batch of nodes).
    which = "centre": the one low-slack piece of each node (slack < 1e-11; the two-sided centre constraint), the
    pieces that can need a cap increase."""
    nodes = json.load(open(pieces_path))
    only = set(os.environ.get("CAPS_NODES", "").split())   # optional "k:i k:i ..." filter
    sel = []
    for n in nodes:
        if only and f"{n['k']}:{n['i']}" not in only:
            continue
        js = [j for j, p in enumerate(n["pieces"]) if p["slack"] < 1e-11] if which == "centre" else \
             list(range(len(n["pieces"])))
        if js:
            sel.append((n, js))
    os.makedirs(RUNS, exist_ok=True)
    os.makedirs(outdir, exist_ok=True)
    mods = []
    for b in range(0, len(sel), batch):
        part = sel[b:b + batch]
        name = f"Run_{which}{os.environ.get('CAPS_TAG', '')}_g{grid}_{b // batch:03d}"
        out = os.path.abspath(os.path.join(outdir, f"exp_{which}{os.environ.get('CAPS_TAG', '')}_g{grid}_{b // batch:03d}.jsonl"))
        if os.path.exists(out):
            os.remove(out)
        src = ["import Grothe.LowerAnalytic.CapExport", "", "namespace Grothe.LowerAnalytic", "",
               "set_option maxRecDepth 100000", ""]
        calls = []
        for n, js in part:
            tag = f"{n['k']}x{n['i']}"
            ds, pcs = node_strings(n, grid)
            src += [f"def planNode_{tag}_{name} : Nat × Nat × List String × List String :=",
                    f"  ({n['k']}, {n['i']}, [{', '.join(json.dumps(x) for x in ds)}], [\n" +
                    ",\n".join("    " + json.dumps(x) for x in pcs) + "])", ""]
            calls.append(f"  exportPiecesOn {json.dumps(out)} planNode_{tag}_{name} {js} {grid}")
        src += [f"def run_{name} : IO Unit := do", *calls, "", f"#eval run_{name}", "", "end Grothe.LowerAnalytic", ""]
        open(os.path.join(RUNS, f"{name}.lean"), "w").write("\n".join(src))
        mods.append(f"Grothe.LowerAnalytic.CapPlanRuns.{name}")
    print(" ".join(mods))


def verdict(d):
    """Verdict of one exported piece on its grid: pass (stored multipliers), fixed (new multipliers), cap_up, fail."""
    import caps_lmi
    base = {"k": d["k"], "i": d["i"], "j": d["j"], "grid": d["grid"], "encl": d["encl"], "polyOK": d["polyOK"]}
    if not (d["encl"] and d["polyOK"]):
        return {**base, "status": "fail", "error": "enclosure or polynomial check fails"}
    if d["ok"]:
        return {**base, "status": "pass", "lm": [[str(c["lam"]), str(c["mu"])] for c in d["cons"]], "cap_up": "0"}
    r = caps_lmi.solve_piece(d, 1e-9)
    return {**base, "status": r["status"], "lm": r.get("lm"), "cap_up": r.get("cap_up"),
            "cap_up_float": r.get("cap_up_float", 0.0), "t_opt": r.get("t_opt"), "error": r.get("error")}


def cmd_solve(src, out):
    import caps_lmi
    t0 = time.time()
    res = [verdict(d) for d in caps_lmi.load(src)]
    json.dump(res, open(out, "w"), indent=1)
    from collections import Counter
    print(os.path.basename(src), dict(Counter(r["status"] for r in res)), f"{time.time() - t0:.1f}s")


def cmd_plan(pieces_path, solved_dir, out_dir):
    nodes = json.load(open(pieces_path))
    by = {}
    for f in glob.glob(os.path.join(solved_dir, "sol_*_g*.json")):
        for r in json.load(open(f)):
            by.setdefault((r["k"], r["i"], r["j"]), {})[r["grid"]] = r
    os.makedirs(out_dir, exist_ok=True)
    tot_stored = tot_plan = 0.0
    count = {g: 0 for g in GRIDS}
    caps, unplanned = [], 0
    for n in nodes:
        k, i = n["k"], n["i"]
        rows = []
        if not any((k, i, j) in by for j in range(len(n["pieces"]))):
            continue
        for j, p in enumerate(n["pieces"]):
            stored = NQ_GRID.get(p["nq"], 1)
            tot_stored += SEC[stored]
            v = by.get((k, i, j), {})
            pick = None
            for g in sorted(GRIDS):
                if g in v and v[g]["status"] in ("pass", "fixed"):
                    pick = (g, v[g]); break
            if pick is None:
                cand = [v[g] for g in sorted(GRIDS, reverse=True) if g in v and v[g]["status"] == "cap_up"]
                if cand:
                    best = min(cand, key=lambda r: F(r["cap_up"]))
                    pick = (best["grid"], best)
                    caps.append((k, i, j, best["grid"], best["cap_up_float"]))
            if pick is None:
                unplanned += 1
                g = stored
                rows.append({"j": j, "grid": g, "status": "unplanned", "tested": sorted(v)})
                tot_plan += SEC[g]
                continue
            g, r = pick
            count[g] += 1
            tot_plan += SEC[g]
            rows.append({"j": j, "grid": g, "status": r["status"], "lm": r.get("lm"), "cap_up": r.get("cap_up", "0"),
                         "tested": sorted(v)})
        json.dump({"k": k, "i": i, "pieces": rows}, open(os.path.join(out_dir, f"{k}x{i}.json"), "w"), indent=1)
    print(f"pieces per chosen grid: " + ", ".join(f"{GRIDS[g]} {count[g]}" for g in GRIDS) +
          f", unplanned {unplanned}")
    print(f"Lean check time, these nodes: stored grids {tot_stored / 3600:.2f} CPU-h -> plan {tot_plan / 3600:.2f} CPU-h")
    print(f"pieces needing a cap increase: {len(caps)}" +
          ("" if not caps else f", max {max(c[4] for c in caps):.3g}: " +
           ", ".join(f"{k}:{i}/{j} g{g} {d:.2g}" for k, i, j, g, d in caps)))


if __name__ == "__main__":
    a = sys.argv[1:]
    if a and a[0] == "gen":
        cmd_gen(a[1], int(a[2]), a[3], a[4:])
    elif a and a[0] == "gen-select":
        cmd_gen_select(a[1], int(a[2]), a[3], int(a[4]), a[5])
    elif a and a[0] == "solve":
        cmd_solve(a[1], a[2])
    elif a and a[0] == "plan":
        cmd_plan(a[1], a[2], a[3])
    else:
        print(__doc__)
