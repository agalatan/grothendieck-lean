#!/usr/bin/env python3
"""Generate the triangle-generator family in an explicit staging tree.

Run through tools/gen_row227_full_certificate.py. Source generation is not
Lean verification. Agent-ID: codex-aa04. Refs #293, #21.
"""

import argparse
import gzip
import hashlib
import json
from pathlib import Path
import sys

from row227_paths import ROOT, workspace
sys.path.insert(0, str(ROOT / "tools"))
import gen_row227_certificate as cert

HERE = workspace() / "triangle-generator"
OUT = HERE / "generated"
BASE = "Grothe.UpperChaos."
WIDTH = 32


def integer(x):
    return f"({x})" if x < 0 else str(x)


def interval(bounds):
    lo, hi = bounds
    return (f"commonExponentInterval {integer(lo)} {integer(hi)} (-768) "
            "(by decide +kernel)")


def start(imports, name):
    return "\n".join("import " + m for m in sorted(set(imports))) + f"""

/-! Generated full original row227 triangle component.
Agent-ID: codex-aa04. Refs #293, #21.
Regenerate with the pinned integer transcript, never hand-edit numbers. -/

open LeanCert.Core
namespace {BASE}{name}
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

"""


def finish(source, name, targets=()):
    s = source + f"end {BASE}{name}\n"
    if targets:
        s += "\nopen Lean Elab Command\nrun_cmd do\n"
        s += "  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]\n"
        for target in targets:
            s += f"  for dependency in (← Lean.collectAxioms ``{BASE}{name}.{target}) do\n"
            s += "    unless allowed.contains dependency do\n      throwError m!\"unexpected axiom {dependency}\"\n"
    return s


def emit(packet):
    rows = {}
    table = {}
    for c, d, lo, hi in packet["coefficients"]:
        rows.setdefault(c, []).append(d)
        table[c, d] = (lo, hi)
    assert len(table) == 63503 and sorted(rows) == list(range(252))
    files, owners, root_owners = {}, {}, {}
    shared = "OriginalRow227TriangleShared"
    s = start([BASE + "ConditionalNormalizedFiniteChecks"], shared)
    s += f"def shift : IntervalDyadic :=\n  {interval(packet['shift'])}\n\n"
    files[shared] = finish(s, shared)
    for block, first in enumerate(range(1, 502, WIDTH)):
        name = f"OriginalRow227TriangleRoots{block:02d}"
        s = start([BASE + shared, "Lean.Util.CollectAxioms", "Lean.Elab.Command"], name)
        s += f"open {shared}\n\n"
        root_checks = []
        for n in range(first, min(502, first + WIDTH)):
            lo, hi = packet["roots"][n]
            s += f"def root{n} : IntervalDyadic :=\n  {interval((lo, hi))}\n\n"
            s += (f"theorem root{n}_pos : 0 < root{n}.lo.toRat :=\n"
                  f"  commonExponentInterval_pos (lo := {integer(lo)}) (hi := {integer(hi)})\n"
                  "    (exp := -768) (by decide +kernel) (by decide +kernel)\n\n")
            s += (f"theorem product{n}_pos :\n"
                  f"    0 < (roundedMul (-768) shift root{n}).lo.toRat := by\n  decide +kernel\n\n")
            root_owners[n] = name
            root_checks.append(f"({n}, root{n})")
        s += "def entries : Array (ℕ × IntervalDyadic) := #[" + ", ".join(root_checks) + "]\n\n"
        s += "theorem checked : blockCheck (fun p => sqrtCheck p.1 p.2) entries = true := by\n  decide +kernel\n\n"
        files[name] = finish(s, name, ["checked"])

    # Data modules have bounded size and no dependency on previous proof modules.
    data_count = 0
    for c, ds in sorted(rows.items()):
        expected = list(range(0 if c == 0 else c - 1, 502 - c))
        assert ds == expected
        for first in range(0, len(ds), WIDTH):
            block = ds[first:first + WIDTH]
            name = f"OriginalRow227TriangleData{data_count:04d}"
            data_count += 1
            s = start([BASE + "ConditionalNormalizedFiniteChecks"], name)
            for d in block:
                s += f"def coefficient{c}_{d} : IntervalDyadic :=\n  {interval(table[c, d])}\n\n"
                owners[c, d] = name
            files[name] = finish(s, name)

    def coefficient(c, d):
        return f"{owners[c,d]}.coefficient{c}_{d}"

    def root(n):
        return f"{root_owners[n]}.root{n}"

    def root_pos(n):
        return f"{root_owners[n]}.root{n}_pos"

    def product_pos(n):
        return f"{root_owners[n]}.product{n}_pos"

    def ratio_name(n):
        return f"OriginalRow227RatioData{n // WIDTH:02d}"

    def ratio(n):
        name = ratio_name(n)
        return f"({name}.checkpoints[{n % WIDTH}]'(by rw [{name}.checkpoints_size]; decide))"

    name = "OriginalRow227TriangleBase"
    s = start([BASE + owners[0,0], "Lean.Util.CollectAxioms", "Lean.Elab.Command"], name)
    s += (f"theorem checked : (integerInterval 1).subset {coefficient(0,0)} = true := by\n"
          "  decide +kernel\n\n")
    files[name] = finish(s, name, ["checked"])

    zero_count = 0
    for first in range(0, 501, WIDTH):
        ds = list(range(first, min(first + WIDTH, 501)))
        name = f"OriginalRow227TriangleZero{zero_count:02d}"
        zero_count += 1
        imports = {BASE + shared, "Lean.Util.CollectAxioms", "Lean.Elab.Command"}
        for d in ds:
            imports.update([BASE + owners[0, d], BASE + owners[0, d+1], BASE + root_owners[d+1],
                            BASE + ratio_name(d)])
        s = start(imports, name) + f"open {shared}\n\n"
        entries = [f"{{ IA := shift, IR := {ratio(d)}, IS := {root(d+1)},\n"
                   f"    IU := {coefficient(0,d)}, next := {coefficient(0,d+1)}, hS := {root_pos(d+1)} }}" for d in ds]
        s += "def entries : Array (ZeroEntry (-768)) := #[\n  " + ",\n  ".join(entries) + "\n]\n\n"
        s += "theorem checked : blockCheck ZeroEntry.check entries = true := by\n  decide +kernel\n\n"
        files[name] = finish(s, name, ["checked"])

    forward_count = 0
    forward_rows = []
    for c in range(1, 252):
        ds = rows[c]
        for first in range(0, len(ds), WIDTH):
            block = ds[first:first + WIDTH]
            name = f"OriginalRow227TriangleForward{forward_count:04d}"
            forward_count += 1
            imports = {BASE + shared, "Lean.Util.CollectAxioms", "Lean.Elab.Command"}
            for d in block:
                imports.update(BASE + owners[p] for p in [(c,d),(c-1,d),(c-1,d+1)])
                imports.update([BASE + root_owners[c], BASE + root_owners[d+1]])
            s = start(imports, name) + f"open {shared}\n\n"
            entries = [f"{{ charge := {d+2-c}, IA := shift, ID := {root(d+1)}, IC := {root(c)},\n"
                       f"    Inext := {coefficient(c-1,d+1)}, Icur := {coefficient(c-1,d)},\n"
                       f"    output := {coefficient(c,d)}, hC := {root_pos(c)}, hAC := {product_pos(c)} }}" for d in block]
            s += "def entries : Array (ForwardEntry (-768)) := #[\n  " + ",\n  ".join(entries) + "\n]\n\n"
            s += "theorem checked : blockCheck ForwardEntry.check entries = true := by\n  decide +kernel\n\n"
            files[name] = finish(s, name, ["checked"])
            forward_rows.append({"module":name,"c":c,"start_d":block[0],"count":len(block)})
    manifest = {"agent":"codex-aa04","status":"SOURCE_ONLY_UNCOMPILED_LOCAL_CHECKS_NOT_FULL_ROW_THEOREM",
                "M":502,"bits":768,"coefficient_count":len(table),"root_count":501,
                "zero_transitions":501,"forward_transitions":sum(len(rows[c]) for c in range(1,252)),
                "data_modules":data_count,"zero_modules":zero_count,"forward_modules":forward_count,
                "forward_rows":forward_rows,
                "coefficient_owners":[[c,d,owners[c,d]] for c,d in sorted(owners)],
                "not_claimed":"No global table binding, ratio certificate assembly, selected-vector sum, or Lean acceptance yet"}
    return files, manifest


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--check", action="store_true")
    a = p.parse_args()
    raw = (cert.DATA / "certificate.json.gz").read_bytes()
    assert hashlib.sha256(raw).hexdigest() == "27df67cc032cf15455eaa18da7464e4cb7c5adecf50c2a6bcdd2d7e92787ff47"
    packet = json.loads(gzip.decompress(raw))
    cert.verify(packet, cert.load_inputs())
    files, manifest = emit(packet)
    OUT.mkdir(parents=True,exist_ok=True)
    for name, source in files.items():
        path = OUT / (name + ".lean")
        if a.check:
            assert path.read_text() == source, name
        else:
            path.write_text(source)
    manifest["files"] = {name:hashlib.sha256(s.encode()).hexdigest() for name,s in files.items()}
    text = json.dumps(manifest,indent=2)+"\n"
    if a.check:
        assert (HERE / "manifest.json").read_text() == text
    else:
        (HERE / "manifest.json").write_text(text)
    print(json.dumps({"modules":len(files),"source_bytes":sum(len(s.encode()) for s in files.values()),
                      "data_modules":manifest["data_modules"],"zero_modules":manifest["zero_modules"],
                      "forward_modules":manifest["forward_modules"],"coefficient_count":manifest["coefficient_count"],
                      "status":"reproduced" if a.check else "generated; UNCOMPILED"}))


if __name__ == "__main__":
    main()
