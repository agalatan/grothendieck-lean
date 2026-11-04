#!/usr/bin/env python3
"""Generate the pinned original-moment seed data and bounded integer checks.

Agent-ID: codex-aa04. Refs #21.
Only the three committed data/original-moment-seed inputs are read. Neither
historical row payloads nor numerical error claims from the source report are
used. All arithmetic is integer arithmetic. Generation is not Lean acceptance.
Run --check for a read-only, byte-for-byte reproduction check.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
import gzip
import hashlib
import json
from pathlib import Path
import re
import sys

INPUT_DIR = Path("data/original-moment-seed")
LEAN_DIR = Path("Grothe/UpperChaos")
GENERATOR_REL = Path("tools/gen_original_moment_seed.py")
INPUT_HASHES = {
    "row227-charge-replay.json": "05ca9474e8e5994b201cb6c56f93ef1c2fd855ab5ff8b63c0dfbaec3ca71015f",
    "row227-seed-checkpoints.json": "cd31a15ecf983ecca41655c75d6d72aa470fbdcb31eb9a78d1e23218cfc74afb",
    "row227-seed-checkpoints.jsonl.gz": "fef3fce31043a010945c5cdbf5aad256f6193891b78f2fdf827fe0a9ab51a37e",
}
SOURCE_NAME = "row227-charge-replay.json"
REPORT_NAME = "row227-seed-checkpoints.json"
TRANSCRIPT_NAME = "row227-seed-checkpoints.jsonl.gz"
BLOCK_SIZE = 64
LAST_RETAINED = 512
TERMINAL = LAST_RETAINED + 1
POINT_COUNT = TERMINAL + 1


def digest(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def require(condition: bool, message: str) -> None:
    if not condition:
        raise ValueError(message)


def decimal(value: object, label: str) -> int:
    require(isinstance(value, str) and re.fullmatch(r"0|-?[1-9][0-9]*", value) is not None,
            label + " must be a canonical decimal string")
    return int(value)


def natural(value: object, label: str) -> int:
    require(type(value) is int and value >= 0, label + " must be a natural integer")
    return value


@dataclass(frozen=True)
class Packet:
    scale: int
    midpoint: int
    x_numerator: int
    x_denominator: int
    points: tuple[tuple[int, int], ...]
    radius: int
    lower_sum: int
    upper_sum: int


def validate_packet(source: dict, report: dict, records: list) -> Packet:
    """Semantic checks, also exercised directly by corruption tests.

    The CLI calls this only after exact input hashes and cross-links passed.
    Public source-report coefficient/error claims are deliberately unused.
    """
    require(natural(source["ordinal"], "source ordinal") == 227, "source ordinal differs")
    require(natural(source["bits"], "source bits") == 1024, "source precision differs")
    require(natural(source["seed_terms"], "source seed_terms") == 513, "source seed count differs")
    scale = decimal(report["scale"], "scale")
    require(scale == 1 << 1024, "scale differs from 2^1024")
    require(scale == decimal(source["denominator"], "source denominator"), "source scale mismatch")
    midpoint = decimal(source["A_midpoint"], "source midpoint")
    require(midpoint >= 0, "source midpoint must be nonnegative")
    x_numerator = decimal(report["x_numerator"], "x numerator")
    x_denominator = decimal(report["x_denominator"], "x denominator")
    require(x_numerator >= 0 and x_denominator > 0, "invalid parameter signs")
    require(midpoint * midpoint == x_numerator, "source midpoint square mismatch")
    require(scale * scale == x_denominator, "parameter denominator mismatch")
    require(natural(report["last_seed_index"], "last seed index") == LAST_RETAINED,
            "retained index differs")
    require(natural(report["last_term_index"], "last term index") == TERMINAL,
            "terminal index differs")
    require(natural(report["transition_guard_count"], "transition count") == TERMINAL,
            "transition count differs")
    require(isinstance(records, list) and len(records) == POINT_COUNT, "checkpoint count differs")
    points = []
    for n, record in enumerate(records):
        require(isinstance(record, list) and len(record) == 3, "malformed checkpoint record")
        require(natural(record[0], "checkpoint index") == n, "checkpoint index/order differs")
        lo, hi = decimal(record[1], "lower endpoint"), decimal(record[2], "upper endpoint")
        require(lo <= hi, "checkpoint endpoints reversed")
        points.append((lo, hi))
    require(points[0][0] <= scale <= points[0][1], "initial checkpoint excludes one")
    radius = decimal(report["next_term_radius_scaled"], "terminal radius")
    require(radius == 1, "terminal radius differs from one")
    require(-radius <= points[TERMINAL][0] and points[TERMINAL][1] <= radius,
            "terminal checkpoint exceeds radius")
    for n in range(TERMINAL):
        factor = -x_numerator * (2 * n + 1)
        denominator = x_denominator * 2 * (n + 1) * (n + 2)
        require(points[n + 1][0] * denominator <= factor * points[n][1],
                f"lower transition guard failed at {n}")
        require(factor * points[n][0] <= points[n + 1][1] * denominator,
                f"upper transition guard failed at {n}")
    lower_sum = sum(lo for lo, _ in points[:TERMINAL])
    upper_sum = sum(hi for _, hi in points[:TERMINAL])
    require(lower_sum - radius == decimal(report["seed_lower_scaled"], "seed lower"),
            "retained lower sum mismatch")
    require(upper_sum + radius == decimal(report["seed_upper_scaled"], "seed upper"),
            "retained upper sum mismatch")
    require(upper_sum - lower_sum + 2 * radius == decimal(report["width_scaled"], "width"),
            "enclosure width mismatch")
    require(max(abs(v).bit_length() for p in points for v in p) ==
            natural(report["max_endpoint_bits"], "maximum endpoint bits"), "endpoint bit count differs")
    return Packet(scale, midpoint, x_numerator, x_denominator, tuple(points), radius,
                  lower_sum, upper_sum)


def decode_packet(raw: dict[str, bytes]) -> Packet:
    source = json.loads(raw[SOURCE_NAME])
    report = json.loads(raw[REPORT_NAME])
    require(report["source_report_sha256"] == digest(raw[SOURCE_NAME]), "source-report hash link mismatch")
    require(report["checkpoints_sha256"] == digest(raw[TRANSCRIPT_NAME]), "transcript hash link mismatch")
    records = [json.loads(line) for line in gzip.decompress(raw[TRANSCRIPT_NAME]).splitlines()]
    return validate_packet(source, report, records)


def load_packet(repo: Path) -> tuple[Packet, dict[str, bytes]]:
    raw = {name: (repo / INPUT_DIR / name).read_bytes() for name in INPUT_HASHES}
    for name, expected in INPUT_HASHES.items():
        require(digest(raw[name]) == expected, "pinned input hash mismatch: " + name)
    return decode_packet(raw), raw


def integer_literal(value: int) -> str:
    return str(value) if value >= 0 else f"({value})"


def z(value: int) -> str:
    return f"({value} : ℤ)"


def render_data(packet: Packet) -> bytes:
    points = packet.points
    scale, midpoint = packet.scale, packet.midpoint
    radius = packet.radius
    lower_sum, upper_sum = packet.lower_sum, packet.upper_sum
    blocks = [points[start : start + BLOCK_SIZE] for start in range(0, len(points), BLOCK_SIZE)]
    require(list(map(len, blocks)) == [64] * 8 + [2], "data block coverage differs")
    lines = [
        "import Mathlib.Data.Rat.Cast.Defs",
        "",
        "/-!",
        "Generated integer checkpoints for the original moment seed.",
        "Generated by tools/gen_original_moment_seed.py from the three hash-pinned",
        "data/original-moment-seed inputs. Agent-ID: codex-aa04. Refs #21.",
        "",
        "The physical midpoint candidate is midpoint / scale. Its squared candidate",
        "is xNumerator / xDenominator. midpoint is the exact nonnegative integer",
        "square root of the report numerator; physical-source binding is separate.",
        "",
        "Checkpoints 0 through 513 occur once below. Terms 0 through 512 are retained",
        "and term 513 supplies the proposed remainder radius. Definitions and",
        "expected integer totals are provided here; none is a Lean-checked",
        "arithmetic or integral enclosure theorem. No numerical premise is hidden.",
        "-/",
        "",
        "namespace Grothe.UpperChaos.OriginalMomentSeedData",
        "",
        f"def scale : ℤ := {scale}",
        f"def midpoint : ℤ := {midpoint}",
        "def xNumerator : ℤ := midpoint * midpoint",
        "def xDenominator : ℤ := scale * scale",
        "def midpointQ : ℚ := (midpoint : ℚ) / (scale : ℚ)",
        "def x : ℚ := (xNumerator : ℚ) / (xDenominator : ℚ)",
        "",
    ]
    for index, block in enumerate(blocks):
        start = index * BLOCK_SIZE
        lines.extend([
            f"/-- Original checkpoint indices {start} through {start + len(block) - 1}. -/",
            f"def block{index:02d} : Array (ℤ × ℤ) := #[",
        ])
        for position, (lo, hi) in enumerate(block):
            suffix = "," if position + 1 < len(block) else ""
            lines.append(f"  ⟨{integer_literal(lo)}, {integer_literal(hi)}⟩{suffix}")
        lines.extend(["]", ""])
    lines.extend([
        "def blocks : Array (Array (ℤ × ℤ)) := #[",
        "  " + ", ".join(f"block{index:02d}" for index in range(len(blocks))),
        "]",
        "",
        "/-- Computed table length, rather than an asserted length theorem. -/",
        "def tableLength : ℕ := blocks.foldl (fun count block => count + block.size) 0",
        "def expectedTableLength : ℕ := 514",
        "",
        "/-- Both array lookups preserve failure; no decoder or unchecked indexing. -/",
        "def point? (n : ℕ) : Option (ℤ × ℤ) := do",
        "  let block ← blocks[n / 64]?",
        "  block[n % 64]?",
        "",
        "/-- Total lookup, explicitly zero-completed outside the stored table.",
        "Future finite checks must also establish successful point? lookups. -/",
        "def point (n : ℕ) : ℤ × ℤ := (point? n).getD (0, 0)",
        "def lower (n : ℕ) : ℤ := (point n).1",
        "def upper (n : ℕ) : ℤ := (point n).2",
        "",
        "/-- Proposed scaled next-term radius, awaiting a Lean arithmetic check. -/",
        f"def radius : ℤ := {radius}",
        "/-- Expected sum of retained lower integers, indices 0 through 512. -/",
        f"def lowerSum : ℤ := {integer_literal(lower_sum)}",
        "/-- Expected sum of retained upper integers, indices 0 through 512. -/",
        f"def upperSum : ℤ := {integer_literal(upper_sum)}",
        "def enclosureLower : ℤ := lowerSum - radius",
        "def enclosureUpper : ℤ := upperSum + radius",
        "",
        "end Grothe.UpperChaos.OriginalMomentSeedData",
        "",
    ])
    source = "\n".join(lines).encode("utf-8")
    return source


def render_check(packet: Packet) -> bytes:
    points = packet.points
    out = ["""import Grothe.UpperChaos.OriginalMomentSeedData
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Data.List.Range
import Mathlib.Tactic.NormNum

/-!
Generated bounded integer checks for the original moment seed.
Generated by tools/gen_original_moment_seed.py from data/original-moment-seed.
Seventeen bounded kernel checks cover all 513 transitions and retained terms.
No native facts, decoder, exact Taylor evaluator or resource overrides.
Agent-ID: codex-aa04. Refs #21.
-/

namespace Grothe.UpperChaos.OriginalMomentSeedCheck
open OriginalMomentSeedData

def stepOK (n : ℕ) : Bool :=
  decide (lower (n + 1) * (xDenominator * 2 * ((n : ℤ) + 1) * ((n : ℤ) + 2)) ≤
      (-xNumerator * (2 * (n : ℤ) + 1)) * upper n ∧
    (-xNumerator * (2 * (n : ℤ) + 1)) * lower n ≤
      upper (n + 1) * (xDenominator * 2 * ((n : ℤ) + 1) * ((n : ℤ) + 2)))

theorem parameters : 0 < scale ∧ 0 < xDenominator ∧ 0 ≤ xNumerator := by
  decide +kernel

theorem initial : lower 0 ≤ scale ∧ scale ≤ upper 0 := by decide +kernel

theorem terminal : -radius ≤ lower 513 ∧ upper 513 ≤ radius := by decide +kernel

theorem table_length : tableLength = 514 := by decide +kernel

theorem scale_eq_power : scale = (2 : ℤ) ^ 1024 := by norm_num [scale]
"""]
    groups = []
    for index, start in enumerate(range(0, 513, 32)):
        count = min(32, 513 - start)
        sums = [sum(pair[k] for pair in points[start:start + count]) for k in (0, 1)]
        groups.append((index, start, count, sums))
        out.append(f"\ntheorem steps{index:02d} : (List.range' {start} {count}).all stepOK = true := by\n  decide +kernel\n")
        stored_count = min(32, 514 - start)
        out.append(f"\ntheorem stored{index:02d} :\n    (List.range' {start} {stored_count}).all (fun n => (point? n).isSome) = true := by\n  decide +kernel\n")
        for label, total in zip(("lower", "upper"), sums):
            out.append(f"\ntheorem {label}Sum{index:02d} :\n    ((List.range' {start} {count}).map {label}).sum = {z(total)} := by\n  decide +kernel\n")

    def split_range(total=513):
        return "  rw [" + ",\n    ".join(
            f"← List.range'_append_1 (s := {start}) (m := {count}) (n := {total-start-count})"
            for _, start, count, _ in groups[:-1]
        ) + "]\n"

    out.append("\ntheorem all_steps : (List.range' 0 513).all stepOK = true := by\n")
    out.append(split_range())
    out.append("  simp only [List.all_append, " + ", ".join(f"steps{i:02d}" for i, *_ in groups) + ", Bool.and_self]\n")
    out.append("\ntheorem all_stored :\n    (List.range' 0 514).all (fun n => (point? n).isSome) = true := by\n")
    out.append(split_range(514))
    out.append("  simp only [List.all_append, " + ", ".join(f"stored{i:02d}" for i, *_ in groups) + ", Bool.and_self]\n")
    for label in ("lower", "upper"):
        out.append(f"\ntheorem {label}_list_sum :\n    ((List.range' 0 513).map {label}).sum = {label}Sum := by\n")
        out.append(split_range())
        out.append("  simp only [List.map_append, List.sum_append, " + ", ".join(f"{label}Sum{i:02d}" for i, *_ in groups) + "]\n")
        out.append(f"  norm_num only [{label}Sum]\n")

    out.append("""
private theorem list_range_sum (f : ℕ → ℤ) (n : ℕ) :
    ((List.range n).map f).sum = ∑ i ∈ Finset.range n, f i := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [List.range_succ, List.map_append, List.sum_append, Finset.sum_range_succ]
    simp [ih]

theorem lower_sum : (∑ i ∈ Finset.range 513, lower i) = lowerSum := by
  rw [← list_range_sum, List.range_eq_range']
  exact lower_list_sum

theorem upper_sum : (∑ i ∈ Finset.range 513, upper i) = upperSum := by
  rw [← list_range_sum, List.range_eq_range']
  exact upper_list_sum

end Grothe.UpperChaos.OriginalMomentSeedCheck
""")
    result = "".join(out)
    return result.encode("utf-8")


def render_outputs(repo: Path) -> dict[Path, bytes]:
    packet, raw = load_packet(repo)
    outputs = {
        LEAN_DIR / "OriginalMomentSeedData.lean": render_data(packet),
        LEAN_DIR / "OriginalMomentSeedCheck.lean": render_check(packet),
    }
    for content in outputs.values():
        require(not any(token in content for token in (b"set_option", b"native_decide", b"sorry")),
                "unexpected generated proof construct")
    manifest = {
        "schema": 1,
        "agent_id": "codex-aa04",
        "status": "GENERATED_SOURCE_NO_LEAN_VERIFICATION_CLAIM",
        "generator": {"file": GENERATOR_REL.as_posix(), "sha256": digest(Path(__file__).read_bytes())},
        "inputs": [{"file": (INPUT_DIR / name).as_posix(), "sha256": digest(raw[name]),
                    "bytes": len(raw[name])} for name in sorted(raw)],
        "outputs": [{"file": rel.as_posix(), "sha256": digest(content), "bytes": len(content)}
                    for rel, content in sorted(outputs.items())],
        "checkpoint_count": POINT_COUNT,
        "data_block_sizes": [64] * 8 + [2],
        "transition_group_sizes": [32] * 16 + [1],
        "retained_sum_group_sizes": [32] * 16 + [1],
        "stored_lookup_group_sizes": [32] * 16 + [2],
        "retained_indices": [0, LAST_RETAINED],
        "terminal_index": TERMINAL,
        "integer_radius": packet.radius,
        "integer_width": packet.upper_sum - packet.lower_sum + 2 * packet.radius,
        "midpoint_binding": "Exact A_midpoint and denominator from the pinned source report; their squares equal the seed parameter integers.",
        "source_report_usage": ["ordinal", "bits", "seed_terms", "A_midpoint", "denominator"],
        "nonclaims": [
            "No Lean/compiler verification is asserted by generation or this manifest.",
            "Physical source-node/profile-shift binding and parameter transport remain separate.",
            "The sqrt(pi) prefactor, stored coefficient errors and final endpoint are not certified here.",
            "Other numerical/source-payload/error claims in the original report are not consumed.",
        ],
    }
    outputs[INPUT_DIR / "generated-files.json"] = (
        json.dumps(manifest, indent=2, sort_keys=True) + "\n").encode("utf-8")
    return outputs


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[1],
                        help="Repository root (default: parent of this script's tools directory).")
    parser.add_argument("--check", action="store_true", help="Compare all generated bytes; write nothing.")
    args = parser.parse_args()
    repo = args.repo.resolve()
    outputs = render_outputs(repo)
    for rel, content in outputs.items():
        path = repo / rel
        if args.check:
            require(path.is_file() and path.read_bytes() == content,
                    "generated output differs: " + rel.as_posix())
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(content)
    print(json.dumps({"mode": "check" if args.check else "generate", "points": POINT_COUNT,
                      "transitions": TERMINAL, "outputs": [p.as_posix() for p in outputs],
                      "lean_compiled": False}, sort_keys=True))


if __name__ == "__main__":
    try:
        main()
    except (ValueError, KeyError, OSError, TypeError) as error:
        print("original-moment-seed: " + str(error), file=sys.stderr)
        raise SystemExit(1)
