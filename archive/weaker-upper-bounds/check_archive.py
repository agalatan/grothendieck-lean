#!/usr/bin/env python3
"""Check preserved bytes and absence of archive dependencies in active Lean.

This is a repository integrity check, not a Lean proof or a numerical replay.
Use --source to compare every preserved file to its original Git object too.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess

ARCHIVE = Path(__file__).resolve().parent
ROOT = ARCHIVE.parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", action="store_true")
    args = parser.parse_args()
    manifest = json.loads((ARCHIVE / "manifest.json").read_text())
    errors = []
    archived_modules = set(manifest["archived_modules"])
    for entry in manifest["files"]:
        path = ARCHIVE / entry["archived"]
        if not path.is_file():
            errors.append(f"missing archive file: {path}")
            continue
        content = path.read_bytes()
        if len(content) != entry["size"] or hashlib.sha256(content).hexdigest() != entry["sha256"]:
            errors.append(f"changed archive bytes: {path}")
        if entry["action"] == "move" and (ROOT / entry["source"]).exists():
            errors.append(f"archived file is active again: {entry['source']}")
        if args.source:
            old = subprocess.run(
                ["git", "show", f"{manifest['source_commit']}:{entry['source']}"],
                cwd=ROOT, capture_output=True, check=False)
            if old.returncode or old.stdout != content:
                errors.append(f"archive differs from pinned source: {entry['source']}")
    paths = []
    for directory in ("Grothe", "GrotheKernel", "GrotheCapsKernel", "scratch"):
        paths.extend((ROOT / directory).rglob("*.lean"))
    paths.extend(ROOT / f"{library}.lean" for library in ("Grothe", "GrotheKernel", "GrotheCapsKernel"))
    for path in paths:
        text = re.sub(r"/\-.*?\-/", "", path.read_text(), flags=re.S)
        for imported in re.findall(r"^import\s+([^\n]+)", text, flags=re.M):
            for module in imported.split("--", 1)[0].split():
                if module in archived_modules or module.startswith("archive."):
                    errors.append(f"active archive import: {path.relative_to(ROOT)} -> {module}")
                if module.startswith(("Grothe.", "GrotheKernel.", "GrotheCapsKernel.")):
                    if not (ROOT / (module.replace(".", "/") + ".lean")).is_file():
                        errors.append(f"missing local import: {path.relative_to(ROOT)} -> {module}")
    retired = json.loads((ARCHIVE / "retired-audit-entries.json").read_text())
    for rel, entries in retired.items():
        path = ROOT / rel
        if path.exists():
            stale = set(path.read_text().splitlines()).intersection(entries)
            if stale:
                errors.append(f"retired audit entries are active in {rel}: {sorted(stale)}")
    for error in errors:
        print("FAIL:", error)
    if errors:
        return 1
    print(f"PASS: {len(manifest['files'])} preserved files; active imports and audit boundary are clear")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
