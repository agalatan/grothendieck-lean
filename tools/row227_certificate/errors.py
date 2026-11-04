#!/usr/bin/env python3
"""Generate the error-generator family in an explicit staging tree.

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

HERE = workspace() / "error-generator"
OUTPUT = HERE / "generated"
DATA = ROOT / "data/original-row227-certificate"
PREFIX = "Grothe.UpperChaos."
NS = PREFIX + "OriginalRow227SelectedError"
BLOCK_SIZE = 32
BLOCKS_PER_MODULE = 16
COUNT = 31877
CERT_SHA = "27df67cc032cf15455eaa18da7464e4cb7c5adecf50c2a6bcdd2d7e92787ff47"
RAW_SHA = "fe9c650652a34cb726c538626200986a41f924d2c6f0269615909da5e0af9750"
WORD_SHA = "85f6792a14d4c198979bfc9ea6c513b765bd76147cc4fe0d0a9566addae48d1c"


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def integer(n):
    return f"({n})" if n < 0 else str(n)


def rank(c, d):
    m = c + d
    return max(0, max(0, m + m * m // 4 - max(0, m - 266) * max(0, m - 265) // 2)
               + c - max(0, m - 265))


def saved_scaled(word):
    exp = (word >> 52) & 2047
    require(0 <= word < 1 << 64 and 1 <= exp <= 1023, "normal source word")
    mantissa = (1 << 52) + (word & ((1 << 52) - 1))
    return (-mantissa if word >> 63 else mantissa) << (717 + exp)


def load():
    compressed = (DATA / "certificate.json.gz").read_bytes()
    require(sha(compressed) == CERT_SHA, "compressed certificate pin")
    raw = gzip.decompress(compressed)
    require(sha(raw) == RAW_SHA, "uncompressed transcript pin")
    packet = json.loads(raw)
    require((packet["schema"], packet["bits"], packet["triangle"], packet["source_cutoff"])
            == (1, 768, 502, 532), "schema and grids")
    payload = (DATA / "row227.bin").read_bytes()
    require(sha(payload) == WORD_SHA and len(payload) == 35777 * 8, "full original payload pin")
    words = list(struct.unpack("<35777Q", payload))
    records = packet["selected"]
    require(len(records) == COUNT, "complete selected record count")
    keys = [(c, d) for d in range(251) for c in range(d + 2)]
    require([(r[0], r[1]) for r in records] == keys, "exact selected order")
    coefficients = {(c, d): (lo, hi) for c, d, lo, hi in packet["coefficients"]}
    scalar = packet["scalar_center"]
    scalar_source = (ROOT / "Grothe/UpperChaos/ConditionalSourceRow227Scalar.lean").read_text()
    scalar_match = re.search(r"def shatNumerator : ℤ :=\s*(\d+)", scalar_source)
    require(scalar_match and int(scalar_match[1]) == scalar, "production scalar center")
    for ordinal, record in enumerate(records):
        require(len(record) == 7 and all(type(n) is int for n in record), "integer record")
        c, d, index, word, center, radius, delta = record
        require(d * (d + 3) // 2 + c == ordinal, "contiguous row ordinal")
        require(index == rank(c, d) and 0 <= index < len(words), "production pair rank")
        require(word == words[index], "exact original word at rank")
        lo, hi = coefficients[c, d]
        require(radius >= 0 and center - radius <= lo <= hi <= center + radius,
                "record radius encloses the original checkpoint")
        require(delta == scalar * center - saved_scaled(word), "exact signed residual")
    boundary_path = ROOT / "Grothe/UpperChaos/OriginalRow227ErrorBoundary.lean"
    boundary = boundary_path.read_text()
    body = boundary.split("def entries : Array ErrorEntry := #[", 1)[1].split("\n]", 1)[0]
    tuples = re.findall(r"⟨(\d+), (\d+), (\d+), (\d+), (\(?-?\d+\)?), (\d+)⟩", body)
    parsed = [[int(n.strip("()")) for n in row] for row in tuples]
    require(parsed == [r[:6] for r in records[:BLOCK_SIZE]], "reused first block records")
    totals = {"normalized": sum(r[5] ** 2 for r in records),
              "saved": sum(r[6] ** 2 for r in records)}
    verification = json.loads((DATA / "arithmetic-verification.json").read_text())
    for kind, total in totals.items():
        require(total == int(verification[kind + "_sum_sq"]), "original aggregate " + kind)
        match = re.search(r"theorem " + kind + r"_sum_checked\s*:\s*.*?=\s*(\d+)\s*:=", boundary, re.S)
        require(match and int(match[1]) == sum(r[5 if kind == "normalized" else 6] ** 2
                                              for r in records[:BLOCK_SIZE]),
                "reused first block theorem " + kind)
    require(totals["normalized"] * 10 ** 80 <= 157 ** 2 * 2 ** 1536, "normalized candidate guard")
    require(totals["saved"] * 10 ** 48 <= 13759969 ** 2 * 2 ** 3584, "saved candidate guard")
    provenance = {
        "certificate_gzip_sha256": sha(compressed), "transcript_sha256": sha(raw),
        "payload_sha256": sha(payload), "source_word_count": len(words),
        "boundary_source_sha256": sha(boundary.encode()),
        "scalar_source_sha256": sha(scalar_source.encode()),
        "selected_records_sha256": sha(json.dumps(records, separators=(",", ":")).encode()),
    }
    return records, totals, provenance


def preamble(imports, namespace, description):
    return [*("import " + x for x in imports), "", "/-!",
            "Generated selected-error certificate. Regenerate with tools/gen_row227_full_certificate.py.",
            description,
            "All records come from committed certificate.json.gz; hashes are provenance only.",
            "No actual vector/error bound follows until checkpoint and payload bindings are proved.",
            "Agent-ID: codex-aa04. Refs #293, #21.", "-/", "",
            "open scoped BigOperators", "", "namespace " + namespace, "",
            "open OriginalRow227ErrorBoundary", ""]


def audit(lines, namespace, names):
    lines.extend(["", "open Lean Elab Command", "run_cmd do",
                  "  let allowed : Array Name := #[`propext, `Classical.choice, `Quot.sound]",
                  "  for target in #["])
    for i, name in enumerate(names):
        lines.append("      ``" + namespace + "." + name + ("," if i + 1 < len(names) else "] do"))
    lines.extend(["    for dependency in (← Lean.collectAxioms target) do",
                  "      unless allowed.contains dependency do",
                  '        throwError m!"{target} uses unexpected axiom {dependency}"', ""])


def finish(lines, namespace):
    return ("\n".join([*lines, "end " + namespace]).rstrip() + "\n").encode()


DEFS = r"""
def entryKey (e : ErrorEntry) : ℕ × ℕ := (e.c, e.d)

/-- The ordinal of `(c,d)` in the original selected order: d first, then c. -/
def keyOrdinal (p : ℕ × ℕ) : ℕ := p.2 * (p.2 + 3) / 2 + p.1

def entryOrdinal (e : ErrorEntry) : ℕ := keyOrdinal (entryKey e)

/-- Finite index and representation guards. Payload lookup and true
coefficient enclosure are separate obligations. -/
def entryValid (e : ErrorEntry) : Bool :=
  decide (e.d ≤ 250 ∧ e.c ≤ e.d + 1 ∧
    e.rank = Q0ConditionalPairRankCheck.rank e.c e.d ∧
    e.word < 2 ^ 64 ∧ 1 ≤ Q0SourceExceptionCenters.exponent e.word ∧
    Q0SourceExceptionCenters.exponent e.word ≤ 1023 ∧ 0 ≤ e.radius)

theorem entryValid_mem_modes (e : ErrorEntry) (h : entryValid e = true) :
    entryKey e ∈ ConditionalNodeIndices.modes := by
  have hv : e.d ≤ 250 ∧ e.c ≤ e.d + 1 ∧
      e.rank = Q0ConditionalPairRankCheck.rank e.c e.d ∧
      e.word < 2 ^ 64 ∧ 1 ≤ Q0SourceExceptionCenters.exponent e.word ∧
      Q0SourceExceptionCenters.exponent e.word ≤ 1023 ∧ 0 ≤ e.radius :=
    of_decide_eq_true h
  exact (ConditionalNodeIndices.mem_modes e.c e.d).mpr ⟨hv.1, hv.2.1⟩

/-- Append arithmetic is symbolic in the lists. Its final premise is a
single addition of the two separately checked integer totals. -/
theorem sum_map_append_eq (xs ys : List ErrorEntry) (f : ErrorEntry → ℤ)
    (a b total : ℤ) (hx : (xs.map f).sum = a) (hy : (ys.map f).sum = b)
    (hadd : a + b = total) : ((xs ++ ys).map f).sum = total := by
  rw [List.map_append, List.sum_append, hx, hy]
  exact hadd

/-- Adjacent ordinal ranges compose without computing either list. -/
theorem ordinals_append {xs ys : List ErrorEntry} {first leftCount rightCount : ℕ}
    (hx : xs.map entryOrdinal = List.range' first leftCount)
    (hy : ys.map entryOrdinal = List.range' (first + leftCount) rightCount) :
    (xs ++ ys).map entryOrdinal = List.range' first (leftCount + rightCount) := by
  rw [List.map_append, hx, hy]
  exact (List.range'_append_1 (s := first) (m := leftCount) (n := rightCount)).symm

"""


@dataclass(frozen=True)
class Node:
    name: str
    first_block: int
    end_block: int
    start: int
    length: int
    normalized: int
    saved: int


def leaf(lines, index, records):
    start = index * BLOCK_SIZE
    data = records[start:start + BLOCK_SIZE]
    name = f"block{index:04d}"
    totals = [sum(r[k] ** 2 for r in data) for k in (5, 6)]
    node = Node(name, index, index + 1, start, len(data), *totals)
    lines.extend([f"/-- Selected ordinals [{start}, {start + len(data)}), retaining all six fields. -/",
                  f"def {name} : List ErrorEntry :="])
    if index == 0:
        lines.extend(["  OriginalRow227ErrorBoundary.entries.toList", ""])
    else:
        lines[-1] += " ["
        for j, row in enumerate(data):
            values = ", ".join(integer(n) for n in row[:6])
            lines.append("  ⟨" + values + "⟩" + ("," if j + 1 < len(data) else ""))
        lines.extend(["]", ""])
    lines.extend([f"theorem {name}_length : {name}.length = {len(data)} := rfl", "",
                  f"theorem {name}_ordinals : {name}.map entryOrdinal = List.range' {start} {len(data)} := by",
                  "  decide +kernel", "",
                  f"theorem {name}_valid : {name}.all entryValid = true := by",
                  "  decide +kernel", ""])
    for kind, total, expression in (("normalized", node.normalized, "e.radius ^ 2"),
                                    ("saved", node.saved, "errorNumerator e ^ 2")):
        lines.extend([f"theorem {name}_{kind} :",
                      f"    ({name}.map fun e => {expression}).sum = {total} := by"])
        if index == 0:
            lines.append(f"  exact OriginalRow227ErrorBoundary.{kind}_sum_checked")
        else:
            lines.append("  decide +kernel")
        lines.append("")
    return node


def join(lines, left, right):
    require(left.start + left.length == right.start and left.end_block == right.first_block,
            "adjacent aggregation spans")
    node = Node(f"node{left.first_block:04d}_{right.end_block:04d}",
                left.first_block, right.end_block, left.start, left.length + right.length,
                left.normalized + right.normalized, left.saved + right.saved)
    lines.extend([f"def {node.name} : List ErrorEntry := {left.name} ++ {right.name}", "",
                  f"theorem {node.name}_length : {node.name}.length = {node.length} := by",
                  f"  change ({left.name} ++ {right.name}).length = {node.length}",
                  f"  rw [List.length_append, {left.name}_length, {right.name}_length]", "",
                  f"theorem {node.name}_ordinals :",
                  f"    {node.name}.map entryOrdinal = List.range' {node.start} {node.length} := by",
                  f"  exact ordinals_append {left.name}_ordinals {right.name}_ordinals", "",
                  f"theorem {node.name}_valid : {node.name}.all entryValid = true := by",
                  f"  change ({left.name} ++ {right.name}).all entryValid = true",
                  f"  rw [List.all_append, {left.name}_valid, {right.name}_valid]", ""])
    for kind, expression in (("normalized", "e.radius ^ 2"), ("saved", "errorNumerator e ^ 2")):
        a, b, total = getattr(left, kind), getattr(right, kind), getattr(node, kind)
        lines.extend([f"theorem {node.name}_{kind} :",
                      f"    ({node.name}.map fun e => {expression}).sum = {total} := by",
                      f"  exact sum_map_append_eq {left.name} {right.name} (fun e => {expression})",
                      f"    {a} {b} {total}",
                      f"    {left.name}_{kind} {right.name}_{kind} (by decide +kernel)", ""])
    return node


def tree(lines, nodes):
    require(bool(nodes), "nonempty tree")
    if len(nodes) == 1:
        return nodes[0]
    middle = len(nodes) // 2
    return join(lines, tree(lines, nodes[:middle]), tree(lines, nodes[middle:]))


def render(records, totals):
    outputs = {}
    defs_name = "OriginalRow227SelectedErrorDefs"
    lines = preamble([PREFIX + "OriginalRow227ErrorBoundary", PREFIX + "ConditionalNodeIndices",
                      PREFIX + "Q0ConditionalPairRankCheck", "Mathlib.Data.Finset.Card",
                      "Mathlib.Data.List.Nodup"],
                     NS + ".Data", "Shared list, ordinal and append-sum APIs for bounded blocks.")
    lines.append(DEFS)
    audit(lines, NS + ".Data", ["entryValid_mem_modes", "sum_map_append_eq", "ordinals_append"])
    outputs[defs_name + ".lean"] = finish(lines, NS + ".Data")

    count = (len(records) + BLOCK_SIZE - 1) // BLOCK_SIZE
    chunks = []
    imports = []
    block_metadata = []
    for chunk_index, first in enumerate(range(0, count, BLOCKS_PER_MODULE)):
        module = f"OriginalRow227SelectedErrorChunk{chunk_index:03d}"
        lines = preamble([PREFIX + defs_name], NS + ".Data",
                         "At most 32 actual records per closed arithmetic check; symbolic append tree.")
        nodes = [leaf(lines, i, records)
                 for i in range(first, min(count, first + BLOCKS_PER_MODULE))]
        chunk = tree(lines, nodes)
        chunks.append(chunk)
        imports.append(PREFIX + module)
        audit(lines, NS + ".Data", [node.name + "_" + suffix for node in nodes
                                     for suffix in ("ordinals", "valid", "normalized", "saved")])
        outputs[module + ".lean"] = finish(lines, NS + ".Data")
        for node in nodes:
            block_metadata.append({"name": node.name, "module": module,
                                   "first_ordinal": node.start, "length": node.length,
                                   "normalized_sum_sq": str(node.normalized),
                                   "saved_sum_sq": str(node.saved),
                                   "reuses_original_boundary": node.first_block == 0})
    lines = preamble(imports, NS + ".Data", "Balanced assembly of all 31,877 selected-error records.")
    root = tree(lines, chunks)
    require((root.start, root.length, root.normalized, root.saved)
            == (0, COUNT, totals["normalized"], totals["saved"]), "aggregate tree root")
    audit(lines, NS + ".Data", [root.name + "_" + x for x in ("ordinals", "valid", "normalized", "saved")])
    outputs["OriginalRow227SelectedErrorData.lean"] = finish(lines, NS + ".Data")

    lines = preamble([PREFIX + "OriginalRow227SelectedErrorData"], NS,
                     "Complete candidate integer budgets, with exact selected order and coverage.")
    lines.extend(["open Data", "", f"def entries : List ErrorEntry := Data.{root.name}", "",
                  f"def normalizedTotal : ℤ := {root.normalized}", "",
                  f"def savedTotal : ℤ := {root.saved}", "",
                  f"theorem entries_length : entries.length = {COUNT} := Data.{root.name}_length", "",
                  f"theorem entries_ordinals : entries.map entryOrdinal = List.range' 0 {COUNT} :=",
                  f"  Data.{root.name}_ordinals", "",
                  "theorem entries_valid : entries.all entryValid = true :=",
                  f"  Data.{root.name}_valid", "",
                  "/-- Distinct selected records have distinct coordinate keys. -/",
                  "theorem entries_keys_nodup : (entries.map entryKey).Nodup := by",
                  "  apply List.Nodup.of_map keyOrdinal",
                  "  rw [List.map_map]",
                  "  change (entries.map entryOrdinal).Nodup",
                  "  rw [entries_ordinals]",
                  "  exact List.nodup_range' _", "",
                  "/-- Exact coverage; no default lookup or discarded record is used. -/",
                  "theorem entries_keys_eq_modes :",
                  "    (entries.map entryKey).toFinset = ConditionalNodeIndices.modes := by",
                  "  have hsub : (entries.map entryKey).toFinset ⊆ ConditionalNodeIndices.modes := by",
                  "    intro p hp",
                  "    obtain ⟨e, he, rfl⟩ := List.mem_map.mp (List.mem_toFinset.mp hp)",
                  "    exact entryValid_mem_modes e ((List.all_eq_true.mp entries_valid) e he)",
                  f"  have hcard : (entries.map entryKey).toFinset.card = {COUNT} := by",
                  "    rw [List.toFinset_card_of_nodup entries_keys_nodup, List.length_map, entries_length]",
                  "  exact Finset.eq_of_subset_of_card_le hsub",
                  "    (ConditionalNodeIndices.card_modes.le.trans hcard.ge)", "",
                  "theorem normalized_sum : (entries.map fun e => e.radius ^ 2).sum = normalizedTotal :=",
                  f"  Data.{root.name}_normalized", "",
                  "theorem saved_sum : (entries.map fun e => errorNumerator e ^ 2).sum = savedTotal :=",
                  f"  Data.{root.name}_saved", "",
                  "/-- Integer form of the candidate normalized radius 157 / 10^40. -/",
                  "theorem normalized_budget_checked :",
                  "    normalizedTotal * (10 : ℤ) ^ 80 ≤ (157 : ℤ) ^ 2 * (2 : ℤ) ^ 1536 := by",
                  "  decide +kernel", "",
                  "/-- Integer form of the candidate saved-center radius 13759969 / 10^24. -/",
                  "theorem saved_budget_checked :",
                  "    savedTotal * (10 : ℤ) ^ 48 ≤ (13759969 : ℤ) ^ 2 * (2 : ℤ) ^ 3584 := by",
                  "  decide +kernel", "",
                  "theorem normalized_integer_budget :",
                  "    (entries.map fun e => e.radius ^ 2).sum * (10 : ℤ) ^ 80 ≤",
                  "      (157 : ℤ) ^ 2 * (2 : ℤ) ^ 1536 := by",
                  "  rw [normalized_sum]", "  exact normalized_budget_checked", "",
                  "theorem saved_integer_budget :",
                  "    (entries.map fun e => errorNumerator e ^ 2).sum * (10 : ℤ) ^ 48 ≤",
                  "      (13759969 : ℤ) ^ 2 * (2 : ℤ) ^ 3584 := by",
                  "  rw [saved_sum]", "  exact saved_budget_checked", ""])
    audit(lines, NS, ["entries_ordinals", "entries_valid", "entries_keys_nodup", "entries_keys_eq_modes",
                     "normalized_sum", "saved_sum",
                     "normalized_budget_checked", "saved_budget_checked",
                     "normalized_integer_budget", "saved_integer_budget"])
    outputs["OriginalRow227SelectedError.lean"] = finish(lines, NS)
    return outputs, block_metadata


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="read and compare every expected output")
    args = parser.parse_args()
    records, totals, provenance = load()
    outputs, blocks = render(records, totals)
    metadata = {"agent": "codex-aa04", "task": 293,
                "status": "GENERATED_SOURCE_NOT_VERIFICATION_EVIDENCE",
                "generator_sha256": sha(Path(__file__).read_bytes()),
                "inputs": provenance, "selected_count": COUNT, "block_size": BLOCK_SIZE,
                "block_count": len(blocks), "last_block_length": blocks[-1]["length"],
                "normalized_radius": "157/10^40", "normalized_grid": "2^768",
                "saved_radius": "13759969/10^24", "saved_grid": "2^1792",
                "normalized_total": str(totals["normalized"]), "saved_total": str(totals["saved"]),
                "files": {name: sha(source) for name, source in sorted(outputs.items())}, "blocks": blocks}
    outputs["regeneration.json"] = (json.dumps(metadata, indent=2, sort_keys=True) + "\n").encode()
    if not args.check:
        OUTPUT.mkdir(parents=True, exist_ok=True)
    expected = set(outputs)
    existing = {p.name for p in OUTPUT.iterdir()} if OUTPUT.exists() else set()
    require(not (existing - expected), "unexpected output files: " + str(sorted(existing - expected)))
    for name, source in outputs.items():
        path = OUTPUT / name
        if args.check:
            require(path.exists() and path.read_bytes() == source, "byte reproduction: " + name)
        else:
            path.write_bytes(source)
    print(json.dumps({"status": metadata["status"], "mode": "checked" if args.check else "generated",
                      "lean_modules": len(outputs) - 1, "blocks": len(blocks), "selected": COUNT,
                      "last_block": blocks[-1]["length"], "source_bytes": sum(map(len, outputs.values())),
                      "metadata_sha256": sha(outputs["regeneration.json"])}, sort_keys=True))


if __name__ == "__main__":
    main()
