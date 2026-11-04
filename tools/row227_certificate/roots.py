#!/usr/bin/env python3
"""Generate the root-binding-generator family in an explicit staging tree.

Run through tools/gen_row227_full_certificate.py. Source generation is not
Lean verification. Agent-ID: codex-aa04. Refs #293, #21.
"""
import argparse
import hashlib
import json
from pathlib import Path

from row227_paths import ROOT, workspace

HERE = workspace() / "root-binding-generator"
TRIANGLE = HERE.parent / "triangle-generator"
OUT = HERE / "generated"
BASE = "Grothe.UpperChaos."


def raw(n):
    return f"OriginalRow227TriangleRoots{(n - 1) // 32:02d}"


def bind(n):
    return f"OriginalRow227RootBindings{(n - 1) // 32:02d}"


def prefix(imports, name):
    return "\n".join(f"import {BASE}{s}" for s in sorted(set(imports))) + f"""

/-! Generated root binding. Reuses every original named interval
and checked fact, without repeating root arithmetic or evaluating a large list.
Agent-ID: codex-aa04. Refs #293, #21. -/

open LeanCert.Core
namespace {BASE}{name}
open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks

"""


def suffix(s, name, targets):
    s += f"end {BASE}{name}\n\nopen Lean Elab Command\nrun_cmd do\n"
    s += "  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]\n"
    for t in targets:
        s += f"  for dependency in (← Lean.collectAxioms ``{BASE}{name}.{t}) do\n"
        s += "    unless allowed.contains dependency do\n      throwError m!\"unexpected axiom {dependency}\"\n"
    return s


def tree(first, past, depth=1):
    pad = "  " * depth
    if past - first == 1:
        return f"{pad}{raw(first)}.root{first}"
    mid = (first + past) // 2
    return (f"{pad}if n < {mid} then\n{tree(first, mid, depth + 1)}\n"
            f"{pad}else\n{tree(mid, past, depth + 1)}")


def proof(first, past, depth=1):
    pad = "  " * depth
    if past - first == 1:
        n = first
        return (f"{pad}have he : n = {n} := by omega\n{pad}subst n\n"
                f"{pad}exact ⟨{bind(n)}.root{n}_checked, {bind(n)}.root{n}_pos,\n"
                f"{pad}  {bind(n)}.product{n}_pos⟩\n")
    mid = (first + past) // 2
    return (f"{pad}by_cases h{mid} : n < {mid}\n{pad}·\n"
            f"{proof(first, mid, depth + 1)}{pad}·\n{proof(mid, past, depth + 1)}")


def generate():
    manifest = json.loads((TRIANGLE / "manifest.json").read_text())
    assert manifest["root_count"] == 501 and manifest["M"] == 502
    sources = {}
    for b in range(16):
        p = TRIANGLE / "generated" / f"OriginalRow227TriangleRoots{b:02d}.lean"
        s = p.read_text()
        for n in range(1 + 32*b, min(502, 33 + 32*b)):
            for declaration in [f"def root{n} :", f"theorem root{n}_pos :", f"theorem product{n}_pos :"]:
                assert declaration in s, (p, declaration)
        assert "theorem checked : blockCheck" in s
        sources[p.name] = hashlib.sha256(p.read_bytes()).hexdigest()
    result = {}
    name = "OriginalRow227RootLookup"
    s = prefix([raw(n) for n in range(1, 502, 32)], name)
    s += "/-- Total extension; only 1 ≤ n ≤ 501 is used by root certificates. -/\n"
    s += "def S (n : ℕ) : IntervalDyadic :=\n" + tree(1, 502) + "\n\n"
    s += "theorem first : S 1 = OriginalRow227TriangleRoots00.root1 := rfl\n\n"
    s += "theorem last : S 501 = OriginalRow227TriangleRoots15.root501 := rfl\n\n"
    result[name] = suffix(s, name, ["first", "last"])
    for b in range(16):
        name = f"OriginalRow227RootBindings{b:02d}"
        s = prefix(["OriginalRow227RootLookup"], name)
        s += "open OriginalRow227RootLookup OriginalRow227TriangleShared\n\n"
        targets = []
        for n in range(1 + 32*b, min(502, 33 + 32*b)):
            s += f"theorem S_eq_root{n} : S {n} = {raw(n)}.root{n} := rfl\n\n"
            s += f"theorem root{n}_checked : sqrtCheck {n} (S {n}) = true := by\n"
            s += f"  rw [S_eq_root{n}]\n"
            s += f"  exact blockCheck_get (fun p : ℕ × IntervalDyadic => sqrtCheck p.1 p.2)\n"
            s += f"    {raw(n)}.entries {raw(n)}.checked ⟨{(n-1)%32}, by decide⟩\n\n"
            s += f"theorem root{n}_pos : 0 < (S {n}).lo.toRat := by\n"
            s += f"  rw [S_eq_root{n}]\n  exact {raw(n)}.root{n}_pos\n\n"
            s += f"theorem product{n}_pos : 0 < (roundedMul (-768) shift (S {n})).lo.toRat := by\n"
            s += f"  rw [S_eq_root{n}]\n  exact {raw(n)}.product{n}_pos\n\n"
            targets.extend([f"S_eq_root{n}", f"root{n}_checked", f"root{n}_pos", f"product{n}_pos"])
        result[name] = suffix(s, name, targets)
    name = "OriginalRow227Roots"
    s = prefix([f"OriginalRow227RootBindings{b:02d}" for b in range(16)] + ["OriginalRow227CheckpointData"], name)
    s += "open OriginalRow227RootLookup OriginalRow227TriangleShared\n\n"
    s += "theorem root_properties (n : ℕ) (hn : 0 < n) (hnM : n < 502) :\n"
    s += "    sqrtCheck n (S n) = true ∧ 0 < (S n).lo.toRat ∧\n"
    s += "      0 < (roundedMul (-768) shift (S n)).lo.toRat := by\n" + proof(1, 502) + "\n"
    s += "theorem root_checked (n : ℕ) (hn : 0 < n) (hnM : n < 502) :\n"
    s += "    sqrtCheck n (S n) = true := (root_properties n hn hnM).1\n\n"
    s += "theorem root_pos (n : ℕ) (hn : 0 < n) (hnM : n < 502) :\n"
    s += "    0 < (S n).lo.toRat := (root_properties n hn hnM).2.1\n\n"
    s += "theorem product_pos (c : ℕ) (hc : c + 1 < 502) :\n"
    s += "    0 < (roundedMul (-768) shift (S (c + 1))).lo.toRat :=\n"
    s += "  (root_properties (c + 1) (by omega) hc).2.2\n\n"
    s += "theorem midpoint_enclosed : (OriginalMomentSeedData.midpointQ : ℝ) ∈ shift :=\n"
    s += "  ⟨(Rat.cast_le (K := ℝ)).mpr OriginalRow227CheckpointData.midpoint_enclosed.1,\n"
    s += "    (Rat.cast_le (K := ℝ)).mpr OriginalRow227CheckpointData.midpoint_enclosed.2⟩\n\n"
    result[name] = suffix(s, name, ["root_properties", "root_checked", "root_pos", "product_pos", "midpoint_enclosed"])
    return result, sources


def main():
    ap=argparse.ArgumentParser();ap.add_argument("--check", action="store_true");args=ap.parse_args()
    files, inputs = generate(); out={n+".lean":s.encode() for n,s in files.items()}
    metadata={"agent":"codex-aa04", "status":"GENERATED_SOURCE_NOT_VERIFICATION_EVIDENCE", "root_count":501,
              "module_count":len(files), "new_numeric_checks":0, "inputs":inputs,
              "generator_sha256":hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              "files":{n:{"bytes":len(s),"sha256":hashlib.sha256(s).hexdigest()} for n,s in out.items()}}
    out["manifest.json"]=(json.dumps(metadata,indent=2)+"\n").encode()
    if args.check:
        assert {p.name for p in OUT.iterdir() if p.is_file()}==set(out)
        for n,s in out.items():assert (OUT/n).read_bytes()==s,n
    else:
        OUT.mkdir(parents=True,exist_ok=True)
        for n,s in out.items():(OUT/n).write_bytes(s)
    print(json.dumps({"modules":len(files),"roots":501,"new_numeric_checks":0,"check":args.check}))


if __name__=="__main__":main()
