#!/usr/bin/env python3
"""Generate the payload-binding-generator family in an explicit staging tree.

Run through tools/gen_row227_full_certificate.py. Source generation is not
Lean verification. Agent-ID: codex-aa04. Refs #293, #21.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import gzip
import hashlib
import json
from pathlib import Path
import re
import struct


from row227_paths import ROOT, workspace

HERE = workspace() / "payload-binding-generator"
FUTURE = HERE.parent
OUT = HERE / "generated"
PREFIX = "Grothe.UpperChaos."
NS = PREFIX + "OriginalRow227SelectedPayloadBinding"
PN = "OriginalRow227Payload.Data"
EN = "OriginalRow227SelectedError.Data"
CERT_PIN = "27df67cc032cf15455eaa18da7464e4cb7c5adecf50c2a6bcdd2d7e92787ff47"
WORD_PIN = "85f6792a14d4c198979bfc9ea6c513b765bd76147cc4fe0d0a9566addae48d1c"
RECORD = re.compile(r"⟨(\d+), (\d+), (\d+), (\d+), (\(?-?\d+\)?), (\d+)⟩")


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


@dataclass(frozen=True)
class Node:
    name: str
    module: str
    start: int
    length: int
    left: str | None = None
    right: str | None = None


def parse_records(body):
    rows = [[int(x.strip("()")) for x in row] for row in RECORD.findall(body)]
    require(re.sub(RECORD.pattern + r"|[\s,]", "", body) == "", "entire error-record literal parsed")
    return rows


def load():
    inputs = {}

    def read(path):
        raw = path.read_bytes()
        key = str(path.relative_to(ROOT)) if path.is_relative_to(ROOT) else "generated/" + str(path.relative_to(FUTURE))
        inputs[key] = sha(raw)
        return raw

    packet_raw = read(ROOT / "data/original-row227-certificate/certificate.json.gz")
    require(sha(packet_raw) == CERT_PIN, "pinned packet")
    packet = json.loads(gzip.decompress(packet_raw))
    records = packet["selected"]
    require(len(records) == 31877 and all(len(r) == 7 for r in records), "selected packet shape")
    word_raw = read(ROOT / "data/original-row227-certificate/row227.bin")
    require(sha(word_raw) == WORD_PIN and len(word_raw) == 35777 * 8, "pinned full original payload")
    words = struct.unpack("<35777Q", word_raw)
    pnodes, porder, parents = {}, {}, {}
    production = ROOT / "Grothe/UpperChaos"
    for path in [*sorted(production.glob("OriginalRow227PayloadChunk*.lean")),
                 production / "OriginalRow227PayloadData.lean"]:
        source = read(path).decode()
        module = path.stem
        porder[module] = []
        for name, body in re.findall(r"def (leaf\d{4}) : List ℕ := \[\n(.*?)\n\]", source, re.S):
            index = int(name[4:])
            data = [int(x) for x in re.findall(r"\d+", body)]
            require(re.sub(r"[\d\s,]", "", body) == "", f"payload leaf syntax {name}")
            start = 64 * index
            require(data == list(words[start:start+64]) and 0 < len(data) <= 64, f"original payload leaf {name}")
            require(name not in pnodes, f"unique payload node {name}")
            pnodes[name] = Node(name, module, start, len(data))
            porder[module].append(name)
        for name, left, right in re.findall(
                r"def (node\d{4}_\d{4}) : List ℕ := (\w+) \+\+ (\w+)", source):
            a, b = pnodes[left], pnodes[right]
            require(a.start+a.length == b.start and name not in pnodes, f"payload adjacency {name}")
            require(left not in parents and right not in parents, "payload is a tree")
            parents[left] = parents[right] = name
            pnodes[name] = Node(name, module, a.start, a.length+b.length, left, right)
            porder[module].append(name)
        for name in porder[module]:
            require(f"theorem {name}_length : {name}.length = {pnodes[name].length}" in source,
                    f"cached payload length {name}")
    require(sum(n.left is None for n in pnodes.values()) == 560, "all 560 payload leaves")
    top = "node0000_0560"
    require(pnodes[top].start == 0 and pnodes[top].length == len(words), "full payload root")
    require(set(pnodes) - set(parents) == {top}, "single payload root")
    row_source = read(production / "OriginalRow227Payload.lean").decode()
    require(f"⟨227, 8121379, 532, Data.{top}⟩" in row_source, "public row uses actual parsed root")
    read(production / "OriginalRow227PayloadLookup.lean")
    read(production / "Q0ConditionalPairRankCheck.lean")

    error_dir = FUTURE / "error-generator/generated"
    error_manifest = json.loads(read(error_dir / "regeneration.json"))
    error_sources = {}
    for name, digest in error_manifest["files"].items():
        raw = read(error_dir / name)
        require(sha(raw) == digest, f"selected source manifest {name}")
        error_sources[Path(name).stem] = raw.decode()
    enodes, eorder, blocks = {}, {}, {}
    boundary = read(production / "OriginalRow227ErrorBoundary.lean").decode()
    boundary_body = boundary.split("def entries : Array ErrorEntry := #[", 1)[1].split("\n]", 1)[0]
    boundary_records = parse_records(boundary_body)
    modules = [f"OriginalRow227SelectedErrorChunk{i:03d}" for i in range(63)] + ["OriginalRow227SelectedErrorData"]
    for module in modules:
        source = error_sources[module]
        eorder[module] = []
        if module.endswith("Chunk000"):
            require("def block0000 : List ErrorEntry :=\n  OriginalRow227ErrorBoundary.entries.toList" in source,
                    "first block aliases accepted diagnostic records")
            blocks["block0000"] = boundary_records
            enodes["block0000"] = Node("block0000", module, 0, len(boundary_records))
            eorder[module].append("block0000")
        for name, body in re.findall(r"def (block\d{4}) : List ErrorEntry := \[\n(.*?)\n\]", source, re.S):
            data = parse_records(body)
            index = int(name[5:])
            require(name not in enodes and 0 < len(data) <= 32, f"bounded unique error block {name}")
            blocks[name] = data
            enodes[name] = Node(name, module, 32*index, len(data))
            eorder[module].append(name)
        for name, left, right in re.findall(
                r"def (node\d{4}_\d{4}) : List ErrorEntry := (\w+) \+\+ (\w+)", source):
            a, b = enodes[left], enodes[right]
            require(a.start+a.length == b.start and name not in enodes, f"error tree adjacency {name}")
            enodes[name] = Node(name, module, a.start, a.length+b.length, left, right)
            eorder[module].append(name)
        for name in eorder[module]:
            require(f"theorem {name}_length : {name}.length = {enodes[name].length}" in source,
                    f"cached error length {name}")
            require(f"theorem {name}_valid : {name}.all entryValid = true" in source,
                    f"checked error validity {name}")
    require(len(blocks) == 997 and enodes["node0000_0997"].length == 31877, "full selected tree")
    flat = [r for b in sorted(blocks) for r in blocks[b]]
    require(flat == [r[:6] for r in records], "every actual selected-source record equals packet")
    require([(r[0], r[1]) for r in flat] == [(c, d) for d in range(251) for c in range(d+2)], "selected key order")
    for c, d, rank, word, _, _ in flat:
        m = c+d
        expected_rank = max(0, max(0, m+m*m//4 - max(0,m-266)*max(0,m-265)//2)+c-max(0,m-265))
        require(rank == expected_rank and 0 <= rank < len(words) and word == words[rank], "exact production rank and word")
    require("def entries : List ErrorEntry := Data.node0000_0997" in error_sources["OriginalRow227SelectedError"],
            "public selected entries use actual parsed error tree")
    read(ROOT / "Grothe/UpperChaos/ConditionalSelectedRecordBinding.lean")
    return pnodes, porder, parents, enodes, eorder, blocks, inputs


def preamble(imports, namespace, description):
    return [*(f"import {m}" for m in sorted(set(imports))), "", "/-!",
            "Generated by tools/gen_row227_full_certificate.py.",
            description,
            "Only short leaves are evaluated; original append trees are traversed by cached facts.",
            "Agent-ID: codex-aa04. Refs #293, #21.", "-/", "", f"namespace {namespace}", ""]


def finish(lines, namespace, targets):
    if targets:
        lines.extend(["open Lean Elab Command", "run_cmd do",
                      "  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]",
                      "  for target in #["])
        lines.extend("      ``" + namespace + "." + name + ("," if i+1<len(targets) else "] do")
                     for i, name in enumerate(targets))
        lines.extend(["    for dependency in (← Lean.collectAxioms target) do",
                      "      unless allowed.contains dependency do",
                      '        throwError m!"{target} uses unexpected axiom {dependency}"', ""])
    return ("\n".join([*lines, f"end {namespace}"]) + "\n").encode()


DEFS = """open OriginalRow227ErrorBoundary ConditionalSelectedRecordBinding

/-- Extract the already checked production rank without evaluating a record list. -/
theorem rank_of_valid (e : ErrorEntry)
    (h : OriginalRow227SelectedError.Data.entryValid e = true) :
    e.rank = Q0ConditionalPairRankCheck.rank e.c e.d := by
  have hv : e.d ≤ 250 ∧ e.c ≤ e.d + 1 ∧
      e.rank = Q0ConditionalPairRankCheck.rank e.c e.d ∧
      e.word < 2 ^ 64 ∧ 1 ≤ Q0SourceExceptionCenters.exponent e.word ∧
      Q0SourceExceptionCenters.exponent e.word ≤ 1023 ∧ 0 ≤ e.radius :=
    of_decide_eq_true h
  exact hv.2.2.1

/-- Transport two bounded record-field checks to an independently lifted lookup.
The global payload is never an argument of a closed decision procedure. -/
theorem lookup_of_fields (e : ErrorEntry) (rank word : ℕ)
    (hrank : e.rank = rank) (hword : e.word = word)
    (hlookup : OriginalRow227Payload.row.words[rank]? = some word) :
    OriginalRow227Payload.row.words[e.rank]? = some e.word := by
  simpa only [hrank, hword] using hlookup

/-- A bounded exhaustive index proof and the cached validity fact bind a block.
Successful lookups are required at every actual record index; there is no default. -/
theorem allPayloadBound_of_get_lookup (es : List ErrorEntry) (n : ℕ)
    (hlen : es.length = n)
    (hvalid : es.all OriginalRow227SelectedError.Data.entryValid = true)
    (hlookup : ∀ i : Fin n,
      OriginalRow227Payload.row.words[(es[i.val]'(by omega)).rank]? =
        some (es[i.val]'(by omega)).word) : AllPayloadBound es := by
  intro e he
  refine ⟨rank_of_valid e ((List.all_eq_true.mp hvalid) e he), ?_⟩
  obtain ⟨i, hi, hei⟩ := List.mem_iff_getElem.mp he
  have hin : i < n := by omega
  have h := hlookup ⟨i, hin⟩
  simpa only [hei] using h

"""


def render(pnodes, parents, enodes, eorder, blocks):
    outputs, paths, bindings = {}, {}, []
    defs = "OriginalRow227SelectedPayloadBindingDefs"
    lines = preamble([PREFIX + "ConditionalSelectedRecordBinding", PREFIX + "OriginalRow227SelectedErrorDefs",
                      "Mathlib.Tactic.FinCases"], NS, "Symbolic bridges for checked record fields and finite local lookups.")
    lines.append(DEFS)
    outputs[defs + ".lean"] = finish(lines, NS, ["rank_of_valid", "lookup_of_fields", "allPayloadBound_of_get_lookup"])

    # Each proof is universally quantified over the leaf's local index and word.
    # Bounds and append length facts refer to numbers, never evaluated trees.
    for chunk in range(18):
        module = f"OriginalRow227PayloadLeafLift{chunk:02d}"
        lines = preamble([PREFIX + "OriginalRow227Payload", "Lean.Util.CollectAxioms", "Lean.Elab.Command"],
                         NS + ".Leaf", "Reusable original-payload leaf-to-root lifts, one per production leaf.")
        lines.extend(["open OriginalRow227Payload.Data", ""])
        targets = []
        for index in range(chunk*32, min(560, (chunk+1)*32)):
            leaf = pnodes[f"leaf{index:04d}"]
            target = leaf.name + "_lookup"
            lines.extend([f"theorem {target} (i word : ℕ) (_hi : i < {leaf.length})",
                          f"    (hlookup : {PN}.{leaf.name}[i]? = some word) :",
                          f"    OriginalRow227Payload.row.words[{leaf.start} + i]? = some word := by"])
            current, previous = leaf, "hlookup"
            path = []
            while current.name in parents:
                parent = pnodes[parents[current.name]]
                left, right = pnodes[parent.left], pnodes[parent.right]
                offset = leaf.start-parent.start
                child_offset = leaf.start-current.start
                local_index = "i" if child_offset == 0 else f"{child_offset} + i"
                hname = "h" + str(len(path))
                lines.append(f"  have {hname} : {PN}.{parent.name}[{offset} + i]? = some word := by")
                if current.name == left.name:
                    lines.extend([f"    exact append_left_lookup (xs := {PN}.{left.name}) (ys := {PN}.{right.name})",
                                  f"      (i := {offset} + i) (n := {left.length}) (x := word)",
                                  f"      {PN}.{left.name}_length (by omega)"])
                    if current.left is None:
                        lines.append(f"      (by simpa only [Nat.zero_add] using {previous})")
                    else:
                        lines.append(f"      {previous}")
                    side = "left"
                else:
                    lines.extend([f"    apply append_right_lookup (xs := {PN}.{left.name}) (ys := {PN}.{right.name})",
                                  f"      (i := {offset} + i) (n := {left.length}) (x := word)",
                                  f"      {PN}.{left.name}_length (by omega)",
                                  f"    have hindex : ({offset} + i) - {left.length} = {local_index} := by omega",
                                  "    rw [hindex]"])
                    if current.left is not None and child_offset == 0:
                        lines.append(f"    simpa only [Nat.zero_add] using {previous}")
                    else:
                        lines.append(f"    exact {previous}")
                    side = "right"
                path.append({"node": parent.name, "side": side, "offset": offset, "left_length": left.length})
                current, previous = parent, hname
            lines.extend([f"  exact {previous}", ""])
            paths[leaf.name] = {"start": leaf.start, "length": leaf.length, "module": module, "path": path}
            targets.append(target)
        outputs[module + ".lean"] = finish(lines, NS + ".Leaf", targets)

    chunks = []
    for index in range(63):
        source_module = f"OriginalRow227SelectedErrorChunk{index:03d}"
        module = f"OriginalRow227SelectedPayloadChunk{index:03d}"
        chunk_blocks = [name for name in eorder[source_module] if enodes[name].left is None]
        lift_modules = {
            paths[f"leaf{record[2]//64:04d}"]["module"]
            for block in chunk_blocks for record in blocks[block]
        }
        lines = preamble([PREFIX + defs, PREFIX + source_module, *(PREFIX + m for m in lift_modules)],
                         NS + ".Data", "Concrete successful original-payload lookup for each bounded selected-record block.")
        lines.extend(["open ConditionalSelectedRecordBinding", ""])
        for name in eorder[source_module]:
            node = enodes[name]
            lines.extend([f"theorem {name}_payloadBound : AllPayloadBound {EN}.{name} := by"])
            if node.left is None:
                lines.extend([f"  apply allPayloadBound_of_get_lookup {EN}.{name} {node.length}",
                              f"    {EN}.{name}_length {EN}.{name}_valid", "  intro i", "  fin_cases i"])
                for position, record in enumerate(blocks[name]):
                    _, _, rank, word, _, _ = record
                    leaf_index, offset = divmod(rank, 64)
                    leaf_name = f"leaf{leaf_index:04d}"
                    lines.extend(["  · exact lookup_of_fields",
                                  f"      ({EN}.{name}[{position}]'(by rw [{EN}.{name}_length]; decide))",
                                  f"      {rank} {word}",
                                  "      (by decide +kernel) (by decide +kernel)",
                                  f"      (Leaf.{leaf_name}_lookup {offset} {word}",
                                  "        (by decide +kernel) (by decide +kernel))"])
                    bindings.append([node.start+position, name, position, leaf_name, offset, rank, word])
            else:
                lines.extend([f"  exact allPayloadBound_append {EN}.{node.left} {EN}.{node.right}",
                              f"    {node.left}_payloadBound {node.right}_payloadBound"])
            lines.append("")
        root = eorder[source_module][-1]
        chunks.append((module, root))
        outputs[module + ".lean"] = finish(lines, NS + ".Data", [b + "_payloadBound" for b in chunk_blocks] + [root + "_payloadBound"])

    lines = preamble([PREFIX + "OriginalRow227SelectedErrorData", *(PREFIX+m for m,_ in chunks)],
                     NS + ".Data", "Balanced composition follows the exact original selected-record append tree.")
    lines.extend(["open ConditionalSelectedRecordBinding", ""])
    for name in eorder["OriginalRow227SelectedErrorData"]:
        node = enodes[name]
        lines.extend([f"theorem {name}_payloadBound : AllPayloadBound {EN}.{name} := by",
                      f"  exact allPayloadBound_append {EN}.{node.left} {EN}.{node.right}",
                      f"    {node.left}_payloadBound {node.right}_payloadBound", ""])
    outputs["OriginalRow227SelectedPayloadData.lean"] = finish(lines, NS + ".Data", ["node0000_0997_payloadBound"])

    lines = preamble([PREFIX + "OriginalRow227SelectedPayloadData", PREFIX + "OriginalRow227SelectedError"],
                     NS, "All actual selected records are bound to the original public row and decoder.")
    lines.extend(["open OriginalRow227ErrorBoundary ConditionalSelectedRecordBinding", "",
                  "/-- Every actual record has its production rank and exact original word. -/",
                  "theorem entries_payloadBound : AllPayloadBound OriginalRow227SelectedError.entries :=",
                  "  Data.node0000_0997_payloadBound", "",
                  "theorem entry_payloadBound (e : ErrorEntry) (he : e ∈ OriginalRow227SelectedError.entries) :",
                  "    PayloadBound e := entries_payloadBound e he", "",
                  "theorem entry_lookup (e : ErrorEntry) (he : e ∈ OriginalRow227SelectedError.entries) :",
                  "    OriginalRow227Payload.row.words[e.rank]? = some e.word :=",
                  "  (entry_payloadBound e he).2", "",
                  "theorem entry_production_lookup (e : ErrorEntry) (he : e ∈ OriginalRow227SelectedError.entries) :",
                  "    OriginalRow227Payload.row.words[Q0ConditionalPairRankCheck.rank e.c e.d]? = some e.word :=",
                  "  lookup_at_rank e (entry_payloadBound e he).1 (entry_payloadBound e he).2", "",
                  "theorem storedScalar_at_entry (e : ErrorEntry) (he : e ∈ OriginalRow227SelectedError.entries) :",
                  "    Q0SourceSavedLinearModel.storedScalar OriginalRow227Payload.row (e.c, e.d) =",
                  "      Q0SourceExceptionCenters.value e.word :=",
                  "  storedScalar_eq e (entry_payloadBound e he).1 (entry_payloadBound e he).2", "",
                  "theorem storedModeCenter_at_entry (e : ErrorEntry) (he : e ∈ OriginalRow227SelectedError.entries) :",
                  "    Q0SourceExceptionCenters.storedModeCenter OriginalRow227Payload.row (e.c, e.d) =",
                  "      (Q0SourceExceptionCenters.value e.word : ℂ) :=",
                  "  storedModeCenter_eq e (entry_payloadBound e he).1 (entry_payloadBound e he).2", ""])
    outputs["OriginalRow227SelectedPayloadBinding.lean"] = finish(lines, NS,
        ["entries_payloadBound", "entry_payloadBound", "entry_lookup", "entry_production_lookup", "storedScalar_at_entry", "storedModeCenter_at_entry"])
    return outputs, paths, bindings


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    pnodes, porder, parents, enodes, eorder, blocks, inputs = load()
    outputs, paths, bindings = render(pnodes, parents, enodes, eorder, blocks)
    metadata = {
        "agent": "codex-aa04", "task": 293, "status": "GENERATED_SOURCE_NOT_VERIFICATION_EVIDENCE",
        "generator_sha256": sha(Path(__file__).read_bytes()), "input_sha256": inputs,
        "payload_words": 35777, "payload_leaves": len(paths), "selected_records": len(bindings),
        "error_blocks": len(blocks), "error_chunks": 63, "max_payload_leaf": 64, "max_record_block": 32,
        "max_lift_depth": max(len(x["path"]) for x in paths.values()), "full_payload_decisions": 0,
        "public_theorem": NS + ".entries_payloadBound",
        "files": {n: sha(b) for n,b in sorted(outputs.items())}, "payload_paths": paths, "record_bindings": bindings,
        "limitations": ["No Lean elaboration, warning-free acceptance or default-resource acceptance claimed.",
                        "No coefficient recurrence/enclosure or final row-budget theorem is proved here."],
    }
    outputs["manifest.json"] = (json.dumps(metadata, indent=2, sort_keys=True)+"\n").encode()
    if not args.check:
        OUT.mkdir(parents=True, exist_ok=True)
    existing = {p.name for p in OUT.iterdir()} if OUT.exists() else set()
    require(not existing-set(outputs), "unexpected generated file")
    for name, raw in outputs.items():
        path = OUT/name
        if args.check:
            require(path.exists() and path.read_bytes() == raw, f"source reproduction {name}")
        else:
            path.write_bytes(raw)
    print(json.dumps({"status": metadata["status"], "mode": "checked" if args.check else "generated",
                      "lean_modules": len(outputs)-1, "payload_leaves": len(paths), "selected_records": len(bindings),
                      "error_blocks": len(blocks), "max_lift_depth": metadata["max_lift_depth"],
                      "source_bytes": sum(len(raw) for name,raw in outputs.items() if name.endswith(".lean")),
                      "manifest_sha256": sha(outputs["manifest.json"])}, sort_keys=True))


if __name__ == "__main__":
    main()
