#!/usr/bin/env python3
"""Generate the table-binding family in an explicit staging tree.

Run through tools/gen_row227_full_certificate.py. Source generation is not
Lean verification. Agent-ID: codex-aa04. Refs #293, #21.
"""

from dataclasses import dataclass
import argparse
import gzip
import hashlib
import json
from pathlib import Path

from row227_paths import ROOT, workspace

HERE = workspace() / "table-binding"
OUT = HERE / "generated"
TRIANGLE = HERE.parent / "triangle-generator"
PREFIX = "Grothe.UpperChaos."
WIDTH = 32


def digest(data):
    return hashlib.sha256(data).hexdigest()


def require(condition, description):
    if not condition:
        raise ValueError(description)


def start(name, imports):
    return [*("import " + (x if x.startswith(("Mathlib.", "Lean.")) else PREFIX + x)
              for x in sorted(set(imports))), "", "/-!",
            "Generated exact lookup binding. Agent-ID: codex-aa04. Refs #293, #21.",
            "Reuses named triangle intervals; no new numerical values or enclosures.",
            "Regenerate with tools/gen_row227_full_certificate.py.", "-/", "",
            "open LeanCert.Core", "namespace " + PREFIX + name, "",
            "open ConditionalTableLookup", ""]


def finish(lines, name, targets):
    lines += ["", "open Lean Elab Command", "run_cmd do",
              "  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]",
              "  for target in #["]
    for i, target in enumerate(targets):
        lines += ["      ``" + PREFIX + name + "." + target +
                  ("," if i + 1 < len(targets) else "] do")]
    lines += ["    for dependency in (← Lean.collectAxioms target) do",
              "      unless allowed.contains dependency do",
              '        throwError m!"{target} uses unexpected axiom {dependency}"', "",
              "end " + PREFIX + name, ""]
    return "\n".join(lines).encode()


@dataclass
class Node:
    name: str
    first: int
    past: int
    left: object = None
    right: object = None


def tree(lines, nodes, triangle=False):
    if len(nodes) == 1:
        return nodes[0]
    middle = len(nodes) // 2
    left = tree(lines, nodes[:middle], triangle)
    right = tree(lines, nodes[middle:], triangle)
    require(left.past == right.first, "adjacent dispatch slices")
    name = f"node{left.first:04d}_{right.past:04d}"
    node = Node(name, left.first, right.past, left, right)
    typ = "ℕ → ℕ → Option IntervalDyadic" if triangle else "ℕ → Option IntervalDyadic"
    domain = (f"ExactTriangleSlice 502 {left.first} {right.past} {name}" if triangle
              else f"ExactDomain {name} {left.first} {right.past}")
    lemma = "split_triangle_domain" if triangle else "split_domain"
    lines += [f"def {name} : {typ} := split {right.first} {left.name} {right.name}", "",
              f"theorem {name}_domain : {domain} := by",
              f"  exact {lemma} (by decide) (by decide) {left.name}_domain {right.name}_domain", ""]
    return node


def path_to(node, leaf):
    if node.name == leaf.name:
        return []
    child = node.left if leaf.first < node.right.first else node.right
    side = "left" if child is node.left else "right"
    return [(node, side)] + path_to(child, leaf)


def route(lines, path, arithmetic):
    for node, side in path:
        lines += [f"  rw [{node.name}, split_{side} {node.right.first} "
                  f"{node.left.name} {node.right.name} (by {arithmetic})]"]


def enclosure_tree(lines, nodes):
    if len(nodes) == 1:
        return nodes[0]
    middle = len(nodes) // 2
    left = enclosure_tree(lines, nodes[:middle])
    right = enclosure_tree(lines, nodes[middle:])
    node = Node(f"node{left.first:04d}_{right.past:04d}", left.first, right.past)
    lines += [f"theorem {node.name}_enclosed : AllEnclosed OriginalRow227TriangleLookup.T {node.name} :=",
              f"  allEnclosed_append {left.name}_enclosed {right.name}_enclosed", ""]
    return node


def selected_enclosures(outputs, packet, addresses):
    records = packet["selected"]
    count = (len(records) + 31) // 32
    chunk_modules, chunk_nodes = [], []
    for chunk, first in enumerate(range(0, count, 16)):
        module = f"OriginalRow227SelectedIntervalsChunk{chunk:03d}"
        last = min(count, first + 16)
        row_imports = {addresses[r[0], r[1]]["binding_module"]
                       for r in records[first * 32:last * 32]}
        imports = ["ConditionalSelectedIntervalBinding", f"OriginalRow227SelectedErrorChunk{chunk:03d}",
                   *row_imports]
        lines = start(module, imports)
        lines += ["open ConditionalNormalizedFiniteChecks ConditionalSelectedIntervalBinding",
                  "open OriginalRow227SelectedError.Data OriginalRow227ErrorBoundary", ""]
        nodes, targets = [], []
        for block in range(first, last):
            batch = records[block * 32:(block + 1) * 32]
            name, checks = f"block{block:04d}", f"checks{block:04d}"
            pairs, entry_names = [], []
            for index, record in enumerate(batch):
                c, d = record[:2]
                data = addresses[c, d]
                entry = f"({name}.get ⟨{index}, by rw [{name}_length]; decide⟩)"
                coefficient = f"{data['data_module']}.coefficient{c}_{d}"
                pairs.append(f"({entry}, {coefficient})")
                entry_names.append((entry, coefficient, data))
            lines += [f"def {checks} : Array (ErrorEntry × IntervalDyadic) := #[",
                      "  " + ",\n  ".join(pairs), "]", "",
                      f"theorem {checks}_size : {checks}.size = {len(batch)} := rfl", "",
                      f"theorem {checks}_checked :",
                      f"    blockCheck (fun p => enclosureCheck p.1 p.2) {checks} = true := by",
                      "  decide +kernel", ""]
            for index, (entry, coefficient, data) in enumerate(entry_names):
                proof = f"entry{block * 32 + index:05d}_enclosed"
                lines += [f"theorem {proof} : Enclosed OriginalRow227TriangleLookup.T {entry} := by",
                          f"  apply enclosed_of_eq_check OriginalRow227TriangleLookup.T _ {coefficient}",
                          f"  · exact {data['binding_module']}.{data['block']}_value ⟨{data['index']}, by decide⟩",
                          f"  · exact blockCheck_get (fun p => enclosureCheck p.1 p.2) {checks} {checks}_checked",
                          f"      ⟨{index}, by rw [{checks}_size]; decide⟩", ""]
            lines += [f"theorem {name}_enclosed : AllEnclosed OriginalRow227TriangleLookup.T {name} := by",
                      "  exact " + "\n    ".join(
                          [f"allEnclosed_cons entry{block * 32 + i:05d}_enclosed <|" for i in range(len(batch))]
                          + ["allEnclosed_nil OriginalRow227TriangleLookup.T"]), ""]
            nodes.append(Node(name, block, block + 1))
            targets += [checks + "_checked", name + "_enclosed"]
        root = enclosure_tree(lines, nodes)
        targets.append(root.name + "_enclosed")
        outputs[module + ".lean"] = finish(lines, module, targets)
        chunk_modules.append(module)
        chunk_nodes.append(root)
    module = "OriginalRow227SelectedIntervals"
    lines = start(module, ["OriginalRow227SelectedFields", *chunk_modules])
    lines += ["open ConditionalSelectedIntervalBinding OriginalRow227SelectedError",
              "open OriginalRow227SelectedError.Data OriginalRow227SelectedFields", ""]
    for chunk_module in chunk_modules:
        lines += ["open " + chunk_module]
    lines += [""]
    root = enclosure_tree(lines, chunk_nodes)
    lines += ["theorem all_enclosed : AllEnclosed OriginalRow227TriangleLookup.T entries :=",
              f"  {root.name}_enclosed", "",
              "theorem selected_enclosure (p : ℕ × ℕ) (hp : p ∈ ConditionalNodeIndices.modes) :",
              "    centerQ p - radiusQ p ≤ (OriginalRow227TriangleLookup.T p.1 p.2).lo.toRat ∧",
              "      (OriginalRow227TriangleLookup.T p.1 p.2).hi.toRat ≤ centerQ p + radiusQ p := by",
              "  let e := selectedEntry p hp",
              "  have he : e ∈ entries := selectedEntry_mem p hp",
              "  have hk : entryKey e = p := selectedEntry_key p hp",
              "  rw [← hk, centerQ_at_entry e he, radiusQ_at_entry e he]",
              "  exact all_enclosed e he", ""]
    outputs[module + ".lean"] = finish(lines, module, ["all_enclosed", "selected_enclosure"])


def table_value(addresses, c, d):
    a = addresses[c, d]
    return f"{a['binding_module']}.{a['block']}_value ⟨{a['index']}, by decide⟩"


def root_value(n):
    return f"OriginalRow227RootBindings{(n - 1) // 32:02d}.S_eq_root{n}"


def proof_dispatch(lines, items, variable, lower, upper, body, indent="  "):
    if len(items) == 1:
        body(lines, items[0], indent)
        return
    middle = len(items) // 2
    cut = lower(items[middle])
    lines += [indent + f"by_cases h{cut} : {variable} < {cut}", indent + "·"]
    proof_dispatch(lines, items[:middle], variable, lower, upper, body, indent + "  ")
    lines += [indent + "·"]
    proof_dispatch(lines, items[middle:], variable, lower, upper, body, indent + "  ")


def emit_transitions(outputs, manifest, addresses):
    shared_opens = ["open ConditionalNormalizedDyadic ConditionalNormalizedFiniteChecks",
                    "open ConditionalNormalizedCertificate OriginalRow227TriangleShared",
                    "open OriginalRow227RootLookup OriginalRow227TriangleLookup OriginalRow227RatioLookup", ""]
    row_modules = []
    for c in range(1, 252):
        rows = [r for r in manifest["forward_rows"] if r["c"] == c]
        module = f"OriginalRow227ForwardBindingsRow{c:03d}"
        imports = ["OriginalRow227Roots", "OriginalRow227RatioLookup", "Mathlib.Tactic.FinCases",
                   f"OriginalRow227TriangleBindingsRow{c:03d}",
                   f"OriginalRow227TriangleBindingsRow{c - 1:03d}", *[r["module"] for r in rows]]
        lines = start(module, imports) + shared_opens
        targets = []
        for r in rows:
            number = r["module"].removeprefix("OriginalRow227TriangleForward")
            entry, fields, step = "entry" + number, "fields" + number, "step" + number
            count, first, original = r["count"], r["start_d"], r["module"]
            size = "size" + number
            lines += [f"theorem {size} : {original}.entries.size = {count} := rfl", "",
                      f"def {entry} (i : Fin {count}) : ForwardEntry (-768) :=",
                      f"  {original}.entries[i.val]'(by rw [{size}]; exact i.isLt)", "",
                      f"theorem {fields} (i : Fin {count}) :",
                      f"    ({entry} i).IA = shift ∧ ({entry} i).ID = S ({first} + i.val + 1) ∧",
                      f"      ({entry} i).IC = S {c} ∧ ({entry} i).Inext = T {c - 1} ({first} + i.val + 1) ∧",
                      f"      ({entry} i).Icur = T {c - 1} ({first} + i.val) ∧",
                      f"      ({entry} i).output = T {c} ({first} + i.val) ∧",
                      f"      ({entry} i).charge = charge {c - 1} ({first} + i.val) := by",
                      "  fin_cases i"]
            for d in range(first, first + count):
                lines += [f"  · exact ⟨rfl, ({root_value(d + 1)}).symm, ({root_value(c)}).symm,",
                          f"      ({table_value(addresses, c - 1, d + 1)}).symm,",
                          f"      ({table_value(addresses, c - 1, d)}).symm,",
                          f"      ({table_value(addresses, c, d)}).symm, rfl⟩"]
            lines += ["", f"theorem {step} (i : Fin {count}) :",
                      f"    forwardStepOK (-768) (charge {c - 1} ({first} + i.val)) shift",
                      f"      (S ({first} + i.val + 1)) (S {c}) (T {c - 1} ({first} + i.val + 1))",
                      f"      (T {c - 1} ({first} + i.val)) (T {c} ({first} + i.val))",
                      f"      (OriginalRow227Roots.root_pos {c} (by decide) (by decide))",
                      f"      (OriginalRow227Roots.product_pos {c - 1} (by decide)) = true := by",
                      f"  have h := blockCheck_get ForwardEntry.check {original}.entries {original}.checked",
                      f"    ⟨i.val, by rw [{size}]; exact i.isLt⟩",
                      f"  change ({entry} i).check = true at h",
                      f"  rcases {fields} i with ⟨hA, hD, hC, hN, hU, hO, hq⟩",
                      "  simpa only [ForwardEntry.check, hA, hD, hC, hN, hU, hO, hq] using h", ""]
            targets += [fields, step]
        lines += [f"theorem forward_row (d : ℕ) (hlo : {c - 1} ≤ d) (hhi : d < {502 - c}) :",
                  f"    forwardStepOK (-768) (charge {c - 1} d) shift (S (d + 1)) (S {c})",
                  f"      (T {c - 1} (d + 1)) (T {c - 1} d) (T {c} d)",
                  f"      (OriginalRow227Roots.root_pos {c} (by decide) (by decide))",
                  f"      (OriginalRow227Roots.product_pos {c - 1} (by decide)) = true := by"]
        def forward_leaf(out, r, ind):
            first, count = r["start_d"], r["count"]
            number = r["module"].removeprefix("OriginalRow227TriangleForward")
            out += [ind + f"have hi : d - {first} < {count} := by omega",
                    ind + f"have heq : {first} + (d - {first}) = d := by omega",
                    ind + f"simpa only [heq] using step{number} ⟨d - {first}, hi⟩"]
        proof_dispatch(lines, rows, "d", lambda r: r["start_d"],
                       lambda r: r["start_d"] + r["count"], forward_leaf)
        outputs[module + ".lean"] = finish(lines, module, targets + ["forward_row"])
        row_modules.append(module)
    zero_modules = []
    for block, first in enumerate(range(0, 501, 32)):
        count = min(32, 501 - first)
        original, module = f"OriginalRow227TriangleZero{block:02d}", f"OriginalRow227ZeroBindings{block:02d}"
        lines = start(module, ["OriginalRow227Roots", "OriginalRow227RatioLookup", original,
                               "OriginalRow227TriangleBindingsRow000", "Mathlib.Tactic.FinCases"]) + shared_opens
        lines += [f"theorem entries_size : {original}.entries.size = {count} := rfl", "",
                  f"def entry (i : Fin {count}) : ZeroEntry (-768) :=",
                  f"  {original}.entries[i.val]'(by rw [entries_size]; exact i.isLt)", "",
                  f"theorem fields (i : Fin {count}) :",
                  f"    (entry i).IA = shift ∧ (entry i).IR = R ({first} + i.val) ∧",
                  f"      (entry i).IS = S ({first} + i.val + 1) ∧",
                  f"      (entry i).IU = T 0 ({first} + i.val) ∧",
                  f"      (entry i).next = T 0 ({first} + i.val + 1) := by", "  fin_cases i"]
        for d in range(first, first + count):
            lines += [f"  · exact ⟨rfl, rfl, ({root_value(d + 1)}).symm,",
                      f"      ({table_value(addresses, 0, d)}).symm,",
                      f"      ({table_value(addresses, 0, d + 1)}).symm⟩"]
        lines += ["", f"theorem step (i : Fin {count}) :",
                  f"    zeroStepOK (-768) shift (R ({first} + i.val)) (S ({first} + i.val + 1))",
                  f"      (T 0 ({first} + i.val)) (T 0 ({first} + i.val + 1))",
                  f"      (OriginalRow227Roots.root_pos ({first} + i.val + 1) (by omega)",
                  "        (by have hi := i.isLt; omega)) = true := by",
                  f"  have h := blockCheck_get ZeroEntry.check {original}.entries {original}.checked",
                  "    ⟨i.val, by rw [entries_size]; exact i.isLt⟩",
                  "  change (entry i).check = true at h",
                  "  rcases fields i with ⟨hA, hR, hS, hU, hN⟩",
                  "  simpa only [ZeroEntry.check, hA, hR, hS, hU, hN] using h", ""]
        outputs[module + ".lean"] = finish(lines, module, ["fields", "step"])
        zero_modules.append(module)
    module = "OriginalRow227TriangleLocalChecks"
    lines = start(module, ["OriginalRow227TriangleBase", *row_modules, *zero_modules]) + shared_opens
    lines += ["theorem zero (d : ℕ) (hd : d + 1 < 502) :",
              "    zeroStepOK (-768) shift (R d) (S (d + 1)) (T 0 d) (T 0 (d + 1))",
              "      (OriginalRow227Roots.root_pos (d + 1) (by omega) hd) = true := by"]
    def zero_leaf(out, b, ind):
        first, count = 32 * b, min(32, 501 - 32 * b)
        out += [ind + f"have hi : d - {first} < {count} := by omega",
                ind + f"have heq : {first} + (d - {first}) = d := by omega",
                ind + f"simpa only [heq] using OriginalRow227ZeroBindings{b:02d}.step ⟨d - {first}, hi⟩"]
    proof_dispatch(lines, list(range(16)), "d", lambda b: 32 * b, lambda b: min(501, 32 * b + 32), zero_leaf)
    lines += ["", "theorem forward (c d : ℕ) (hcd : c + 1 ≤ d + 1) (hsum : c + 1 + d < 502) :",
              "    forwardStepOK (-768) (charge c d) shift (S (d + 1)) (S (c + 1))",
              "      (T c (d + 1)) (T c d) (T (c + 1) d)",
              "      (OriginalRow227Roots.root_pos (c + 1) (by omega) (by omega))",
              "      (OriginalRow227Roots.product_pos c (by omega)) = true := by"]
    def row_leaf(out, row, ind):
        out += [ind + f"have heq : c = {row - 1} := by omega", ind + "subst c",
                ind + f"exact OriginalRow227ForwardBindingsRow{row:03d}.forward_row d (by omega) (by omega)"]
    proof_dispatch(lines, list(range(1, 252)), "c + 1", lambda c: c, lambda c: c + 1, row_leaf)
    base = table_value(addresses, 0, 0)
    lines += ["", "theorem checks : LocalChecks (-768) 502 shift R S T := by",
              "  refine { roots := OriginalRow227Roots.root_checked, rootPos := OriginalRow227Roots.root_pos,",
              "    productPos := OriginalRow227Roots.product_pos, base := ?_, zero := zero, forward := forward }",
              "  intro _", f"  rw [{base}]", "  exact OriginalRow227TriangleBase.checked", ""]
    outputs[module + ".lean"] = finish(lines, module, ["zero", "forward", "checks"])


def build():
    compressed = (ROOT / "data/original-row227-certificate/certificate.json.gz").read_bytes()
    require(digest(compressed) == "27df67cc032cf15455eaa18da7464e4cb7c5adecf50c2a6bcdd2d7e92787ff47",
            "committed packet pin")
    packet = json.loads(gzip.decompress(compressed))
    manifest_bytes = (TRIANGLE / "manifest.json").read_bytes()
    manifest = json.loads(manifest_bytes)
    owners = {(c, d): owner for c, d, owner in manifest["coefficient_owners"]}
    require(len(owners) == 63503 and manifest["M"] == 502, "exact triangle extent")
    require(set(owners) == {(c, d) for c in range(252) for d in range(max(0, c - 1), 502 - c)},
            "complete canonical triangle and boundary")
    require(set(owners) == {(c, d) for c, d, _, _ in packet["coefficients"]}, "packet coordinates")
    source_hashes = {}
    for owner in sorted(set(owners.values())):
        source = (TRIANGLE / "generated" / (owner + ".lean")).read_bytes()
        source_hashes[owner] = digest(source)
        require(source_hashes[owner] == manifest["files"][owner], "named data source pin")
    outputs, row_nodes, row_modules, blocks, addresses = {}, [], [], [], {}
    for c in range(252):
        module = f"OriginalRow227TriangleLookupRow{c:03d}"
        ds = list(range(max(0, c - 1), 502 - c))
        row_owners = sorted({owners[c, d] for d in ds})
        lines = start(module, ["ConditionalTableLookup", *row_owners])
        leaves, targets = [], []
        for first in range(0, len(ds), WIDTH):
            batch = ds[first:first + WIDTH]
            owner = owners[c, batch[0]]
            require(all(owners[c, d] == owner for d in batch), "same existing data block")
            number = owner.removeprefix("OriginalRow227TriangleData")
            values = "values" + number
            block = "block" + number
            count, d0, past = len(batch), batch[0], batch[-1] + 1
            lines += [f"def {values} : Array IntervalDyadic := #[",
                      "  " + ",\n  ".join(f"{owner}.coefficient{c}_{d}" for d in batch), "]", "",
                      f"theorem {values}_size : {values}.size = {count} := rfl", "",
                      f"def {block} : ℕ → Option IntervalDyadic := segment {d0} {values}", "",
                      f"theorem {block}_domain : ExactDomain {block} {d0} {past} := by",
                      f"  simpa only [{values}_size] using segment_domain {d0} {values}", "",
                      f"theorem {block}_get (i : Fin {count}) :",
                      f"    {block} ({d0} + i.val) = some ({values}[i.val]'(by rw [{values}_size]; exact i.isLt)) := by",
                      f"  exact segment_get {d0} {values} ⟨i.val, by rw [{values}_size]; exact i.isLt⟩", ""]
            leaf = Node(block, d0, past)
            leaves.append(leaf)
            targets += [block + "_domain", block + "_get"]
            info = {"id": len(blocks), "c": c, "first_d": d0, "count": count, "data_module": owner,
                    "row_module": module, "block": block, "values": values,
                    "binding_module": f"OriginalRow227TriangleBindingsRow{c:03d}"}
            blocks.append(info)
            for index, d in enumerate(batch):
                addresses[c, d] = {**info, "index": index}
        root = tree(lines, leaves)
        lines += [f"def lookup : ℕ → Option IntervalDyadic := {root.name}", "",
                  f"theorem lookup_domain : ExactDomain lookup {max(0, c - 1)} {502 - c} :=",
                  f"  {root.name}_domain", ""]
        targets += ["lookup_domain"]
        for leaf in leaves:
            info = addresses[c, leaf.first]
            count, values = info["count"], info["values"]
            lines += [f"theorem {leaf.name}_lookup (i : Fin {count}) :",
                      f"    lookup ({leaf.first} + i.val) = some ({values}[i.val]'(by rw [{values}_size]; exact i.isLt)) := by",
                      "  have hi := i.isLt",
                      f"  change {root.name} ({leaf.first} + i.val) = _"]
            route(lines, path_to(root, leaf), "omega")
            lines += [f"  exact {leaf.name}_get i", ""]
            targets += [leaf.name + "_lookup"]
        outputs[module + ".lean"] = finish(lines, module, targets)
        row_modules.append(module)
        row_nodes.append(Node(f"row{c:03d}", c, c + 1))
    module = "OriginalRow227TriangleLookup"
    lines = start(module, ["ConditionalNodeIndices", *row_modules])
    for c, node in enumerate(row_nodes):
        lines += [f"def {node.name} : ℕ → ℕ → Option IntervalDyadic :=",
                  f"  row {c} {row_modules[c]}.lookup", "",
                  f"theorem {node.name}_domain : ExactTriangleSlice 502 {c} {c + 1} {node.name} := by",
                  f"  exact row_domain (by decide : {c} < 502) {row_modules[c]}.lookup_domain", ""]
    root = tree(lines, row_nodes, triangle=True)
    lines += [f"def lookup : ℕ → ℕ → Option IntervalDyadic := {root.name}", "",
              "theorem lookup_domain : ExactTriangleSlice 502 0 252 lookup :=",
              f"  {root.name}_domain", "",
              "theorem lookup_some_iff (c d : ℕ) :",
              "    (∃ value, lookup c d = some value) ↔ c ≤ d + 1 ∧ c + d < 502 := by",
              "  rw [lookup_domain c d]", "  omega", "",
              "theorem selected_lookup {c d : ℕ} (h : (c, d) ∈ ConditionalNodeIndices.modes) :",
              "    ∃ value, lookup c d = some value := by",
              "  apply (lookup_some_iff c d).mpr",
              "  have hm := (ConditionalNodeIndices.mem_modes c d).mp h", "  omega", "",
              "def T : ℕ → ℕ → IntervalDyadic := totalize lookup", "",
              "theorem T_eq_of_lookup {c d : ℕ} {value : IntervalDyadic}",
              "    (h : lookup c d = some value) : T c d = value := totalize_of_some h", ""]
    targets = ["lookup_domain", "lookup_some_iff", "selected_lookup", "T_eq_of_lookup"]
    for c, leaf in enumerate(row_nodes):
        lines += [f"theorem row{c:03d}_lookup (d : ℕ) : lookup {c} d = {row_modules[c]}.lookup d := by",
                  f"  change {root.name} {c} d = _"]
        route(lines, path_to(root, leaf), "decide")
        lines += ["  rfl", ""]
        targets.append(f"row{c:03d}_lookup")
    outputs[module + ".lean"] = finish(lines, module, targets)
    for c in range(252):
        module = f"OriginalRow227TriangleBindingsRow{c:03d}"
        row_module = row_modules[c]
        lines = start(module, ["OriginalRow227TriangleLookup"])
        lines += [f"open {row_module}", ""]
        targets = []
        for block in [b for b in blocks if b["c"] == c]:
            name, values, count, first = (block[k] for k in ("block", "values", "count", "first_d"))
            rhs = f"({values}[i.val]'(by rw [{values}_size]; exact i.isLt))"
            lines += [f"theorem {name}_lookup (i : Fin {count}) :",
                      f"    OriginalRow227TriangleLookup.lookup {c} ({first} + i.val) = some {rhs} :=",
                      f"  (OriginalRow227TriangleLookup.row{c:03d}_lookup _).trans ({row_module}.{name}_lookup i)", "",
                      f"theorem {name}_value (i : Fin {count}) :",
                      f"    OriginalRow227TriangleLookup.T {c} ({first} + i.val) = {rhs} :=",
                      f"  OriginalRow227TriangleLookup.T_eq_of_lookup ({name}_lookup i)", ""]
            targets += [name + "_lookup", name + "_value"]
        outputs[module + ".lean"] = finish(lines, module, targets)
    selected = []
    for ordinal, (c, d, rank, word, center, radius, delta) in enumerate(packet["selected"]):
        selected.append({"ordinal": ordinal, "error_block": ordinal // 32, "error_offset": ordinal % 32,
                         "c": c, "d": d, "rank": rank,
                         "payload_leaf": rank // 64, "payload_offset": rank % 64,
                         "triangle": [addresses[c, d]["id"], addresses[c, d]["index"]]})
    transitions = []
    for row in manifest["forward_rows"]:
        c = row["c"]
        transitions.append({**row, "addresses": [
            {"d": d, "output": [addresses[c, d]["id"], addresses[c, d]["index"]],
             "current": [addresses[c - 1, d]["id"], addresses[c - 1, d]["index"]],
             "next": [addresses[c - 1, d + 1]["id"], addresses[c - 1, d + 1]["index"]]}
            for d in range(row["start_d"], row["start_d"] + row["count"])]})
    selected_enclosures(outputs, packet, addresses)
    emit_transitions(outputs, manifest, addresses)
    metadata = {"agent": "codex-aa04", "status": "GENERATED_SOURCE_NOT_VERIFICATION_EVIDENCE",
                "generator_sha256": digest(Path(__file__).read_bytes()),
                "generic_source_sha256": digest((ROOT / "Grothe/UpperChaos/ConditionalTableLookup.lean").read_bytes()),
                "interval_binding_source_sha256": digest((ROOT / "Grothe/UpperChaos/ConditionalSelectedIntervalBinding.lean").read_bytes()),
                "triangle_manifest_sha256": digest(manifest_bytes), "coefficient_count": len(owners),
                "named_data_hashes": source_hashes, "block_count": len(blocks), "row_count": 252,
                "files": {n: digest(s) for n, s in sorted(outputs.items())}, "blocks": blocks,
                "selected_bindings": selected, "forward_bindings": transitions}
    outputs["binding-plan.json"] = (json.dumps(metadata, indent=2, sort_keys=True) + "\n").encode()
    return outputs


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    outputs = build()
    if not args.check:
        OUT.mkdir(parents=True, exist_ok=True)
    existing = {p.name for p in OUT.iterdir()} if OUT.exists() else set()
    require(existing <= set(outputs), "unexpected output files")
    for name, contents in outputs.items():
        path = OUT / name
        if args.check:
            require(path.exists() and path.read_bytes() == contents, "byte reproduction " + name)
        else:
            path.write_bytes(contents)
    print(json.dumps({"status": "UNCOMPILED", "mode": "checked" if args.check else "generated",
                      "lean_modules": len(outputs) - 1, "bytes": sum(map(len, outputs.values())),
                      "binding_plan_sha256": digest(outputs["binding-plan.json"])}))


if __name__ == "__main__":
    main()
