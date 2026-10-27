#!/usr/bin/env python3
"""Activate the reproducible row12 certificate sources and strict audit declarations.

Agent-ID: codex-0e12. This only writes source: native verification and cache
publication remain separate build obligations. All candidate bytes are regenerated
from the tracked adoption plans. Shared grid changes are reapplied as small exact
hunks to the current source, preserving unrelated changes since generation.
"""
from pathlib import Path
import argparse
import contextlib
import hashlib
import importlib.util
import io
import json
import os
import re
import sys
import tempfile

sys.dont_write_bytecode = True
ROOT = Path(__file__).resolve().parents[1]
NATIVE_SUFFIX = "._native.native_decide.ax_1_1"
GRID_OLD = "def pieceGrids : List (ℕ × ℕ × ℚ) := [(400, 128, 1 / 50), (1600, 256, 1 / 200), (1600, 1024, 1 / 200)]"
GRID_NEW = GRID_OLD[:-1] + ", (1600, 1152, 1 / 200), (3200, 256, 1 / 400)]"
ADM_OLD = "rcases hG with rfl | rfl | rfl <;> simp [gridAdm] <;> norm_num"
ADM_NEW = "rcases hG with rfl | rfl | rfl | rfl | rfl <;> simp [gridAdm] <;> norm_num"
SHARED = {
    "Grothe/LowerAnalytic/CapPieceRange.lean": (GRID_OLD, GRID_NEW),
    "Grothe/LowerAnalytic/CapPieceNodes.lean": (ADM_OLD, ADM_NEW),
}


def require(ok, message):
    if not ok:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def safe_path(root, relative):
    path = Path(relative)
    require(not path.is_absolute() and ".." not in path.parts, "Unsafe source path: " + str(path))
    target = root / path
    require(target.resolve().is_relative_to(root.resolve()), "Source path escapes through symlink: " + str(path))
    require(not target.is_symlink(), "Refusing source symlink: " + str(path))
    return target


def patched_shared(relative, data):
    """Reapply the reviewed grid/adm hunk without overwriting later source edits."""
    old, new = SHARED[relative]
    text = data.decode()
    if new in text:
        require(text.count(new) == 1 and old not in text, "Ambiguous already-applied grid hunk: " + relative)
        return data
    require(text.count(old) == 1, "Shared source changed at the grid hunk; review before activation: " + relative)
    text = text.replace(old, new)
    if relative.endswith("CapPieceRange.lean"):
        text = text.replace(
            "/-- The grids of the pieces: `400 × 128`, `1600 × 256`, `1600 × 1024` on `[0, 8]`. -/",
            "/-- Stable certificate grids on `[0, 8]`, including both exact research refinements. -/",
        )
    return text.encode()


def registered_list(data, additions=(), removals=()):
    lines = data.decode().splitlines()
    comments = [line for line in lines if line.strip().startswith("#")]
    entries = {line.split("#", 1)[0].strip() for line in lines if line.split("#", 1)[0].strip()}
    entries = (entries | set(additions)) - set(removals)
    return ("\n".join(comments + sorted(entries)) + "\n").encode()


def registered_report(data, declarations):
    lines = [line.strip() for line in data.decode().splitlines() if line.strip()]
    require(all(line.startswith(("import ", "#print axioms ")) for line in lines),
            "Unexpected content in scratch/Axioms.lean; preserve it and review")
    imports = sorted({line for line in lines if line.startswith("import ")})
    require("import Grothe" in imports, "The default strict report must import the canonical Grothe root")
    prints = {line for line in lines if line.startswith("#print axioms ")}
    prints.update("#print axioms " + name for name in declarations)
    return ("\n".join(imports) + "\n\n" + "\n".join(sorted(prints)) + "\n").encode()


def generated_candidate():
    spec = importlib.util.spec_from_file_location("row12_activation_candidate", ROOT / "tools/gen_cap_row_candidate.py")
    generator = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(generator)
    with contextlib.redirect_stdout(io.StringIO()):
        outputs, metadata = generator.render()
    require(metadata["row_index"] == 12 and metadata["localized_nodes"] == 88
            and metadata["localized_pieces"] == 4562 and metadata["anchored_vertices"] == 223
            and metadata["row_nodes"] == 396 and metadata["remaining_global_rows"] == [13, 14, 15],
            "Row12 generation census or staged scope differs")
    require(len(metadata["native_declarations"]) == 1307 and len(metadata["compute_roots"]) == 1307,
            "Expected exactly 1307 independent native facts")
    require(len(metadata["files_sha256"]) == 1488 and len(outputs) == 1489,
            "Candidate file census differs")
    for name, digest in metadata["files_sha256"].items():
        require(name in outputs and sha(outputs[name]) == digest, "Regenerated source hash differs: " + name)
    return outputs, metadata


def activation_plan(candidate=None):
    outputs, metadata = generated_candidate()
    if candidate is not None and candidate.exists():
        expected = set(outputs)
        actual = {str(path.relative_to(candidate)) for path in candidate.rglob("*") if path.is_file()}
        require(actual == expected, "Candidate contains missing or unexpected files; preserve and review")
        for name, data in outputs.items():
            require(safe_path(candidate, name).read_bytes() == data, "Prepared candidate differs from regeneration: " + name)

    desired, observed = {}, {}
    for name, data in outputs.items():
        if name == "row12-candidate.json":
            continue  # candidate-state metadata is not an active source manifest
        require(name.endswith(".lean") or name == "Grothe/LowerAnalytic/CapRow12/Anchors.manifest.json",
                "Unexpected activated source path: " + name)
        path = safe_path(ROOT, name)
        current = path.read_bytes() if path.exists() else None
        if name in SHARED:
            require(current is not None, "Missing canonical shared source: " + name)
            desired[name] = patched_shared(name, current)
        else:
            require(current is None or current == data,
                    "Existing source differs from the regenerated row12 bytes; preserve and review: " + name)
            desired[name] = data
        observed[name] = current

    # Every native theorem is printed and required independently; the node proofs
    # and final row assembly are also audited, so missing or truncated reports fail.
    nodes = sorted("Grothe.LowerAnalytic.nodeCap_" + Path(name).stem[1:]
                   for name in metadata["new_modules_excluded_until_activation"]
                   if re.fullmatch(r"N12x\d+", Path(name).stem))
    require(len(nodes) == 88, "Expected every localized node theorem")
    declarations = metadata["native_declarations"] + nodes + metadata["required_declarations"]
    audit = {
        "data/axioms/native.txt": lambda data: registered_list(data, (n + NATIVE_SUFFIX for n in metadata["native_declarations"])),
        "data/axioms/required.txt": lambda data: registered_list(data, declarations),
        "scratch/Axioms.lean": lambda data: registered_report(data, declarations),
        "data/root-imports-exclude.txt": lambda data: registered_list(
            data, removals=(name[:-5].replace("/", ".") for name in metadata["new_modules_excluded_until_activation"])),
    }
    for name, render in audit.items():
        data = safe_path(ROOT, name).read_bytes()
        observed[name] = data
        desired[name] = render(data)
    return desired, observed, metadata


def publish(desired, observed):
    # Recheck the full plan before the first write: no partial source activation
    # if a concurrent edit invalidated any of the reviewed snapshots.
    for name, before in observed.items():
        path = safe_path(ROOT, name)
        current = path.read_bytes() if path.exists() else None
        require(current == before, "Source changed during activation planning: " + name)
    for name, data in desired.items():
        if observed[name] == data:
            continue
        path = safe_path(ROOT, name)
        path.parent.mkdir(parents=True, exist_ok=True)
        with tempfile.NamedTemporaryFile(dir=path.parent, prefix=".row12-", delete=False) as stream:
            stage = Path(stream.name)
            stream.write(data)
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(stage, path)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--apply", action="store_true", help="publish the source activation and strict report registrations")
    mode.add_argument("--check", action="store_true", help="check the active source and strict report registrations")
    parser.add_argument("--candidate", type=Path,
                        help="optionally cross-check an existing prepared overlay; tracked plans remain authoritative")
    args = parser.parse_args(argv)
    try:
        candidate = None
        if args.candidate is not None:
            candidate = args.candidate if args.candidate.is_absolute() else ROOT / args.candidate
            require(candidate.is_dir(), "Explicit candidate directory is missing: " + str(candidate))
        desired, observed, metadata = activation_plan(candidate)
        changed = sorted(name for name in desired if desired[name] != observed[name])
        if args.check:
            require(not changed, "Active row12 source/registration differs: " + ", ".join(changed[:8]))
        elif args.apply:
            publish(desired, observed)
        print(json.dumps({"agent_id": "codex-0e12", "row": 12, "prepared_source_files": 1488,
                          "native_facts": 1307, "changed_files": len(changed),
                          "applied": args.apply, "checked": args.check,
                          "generation_base": metadata["canonical_base"], "remaining_rows": [13, 14, 15],
                          "native_verified": False, "cache_uploaded": False}))
        return 0
    except (ValueError, OSError) as error:
        print("FAIL: " + str(error), file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
