#!/usr/bin/env python3
"""Reproduce the complete original row227 certificate from committed inputs.

Agent-ID: codex-aa04. Refs #293, #21. This invokes no Lean compiler. All
families generate in an owned temporary tree, then their declared sources are
copied or compared. Hashes describe provenance; the Lean proofs establish the
enclosures and successful original-payload lookups.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile

import gen_row227_certificate as transcript


ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "Grothe/UpperChaos"
FAMILIES = (
    ("ratios.py", "ratio-generator"),
    ("triangle.py", "triangle-generator"),
    ("errors.py", "error-generator"),
    ("roots.py", "root-binding-generator"),
    ("tables.py", "table-binding"),
    ("payload.py", "payload-binding-generator"),
)
MANUAL = (
    "ConditionalIntegerErrorSum", "ConditionalKeyedErrorSum",
    "ConditionalRatioBlocks", "ConditionalSavedGrid", "ConditionalSelectedPayload",
    "ConditionalSelectedRecordBinding", "ConditionalTableLookup",
    "ConditionalSelectedIntervalBinding", "OriginalRow227SelectedFields",
    "OriginalRow227SelectedBudgets", "OriginalRow227VectorAssembly",
    "OriginalRow227Certificate",
)
PACKET_SHA = "27df67cc032cf15455eaa18da7464e4cb7c5adecf50c2a6bcdd2d7e92787ff47"
MANIFEST = ROOT / "data/original-row227-certificate/full-generated-files.json"


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha(raw):
    return hashlib.sha256(raw).hexdigest()


def committed_inputs():
    paths = set(transcript.PINS)
    paths.update((
        "data/original-row227-certificate/certificate.json.gz",
        "data/original-row227-certificate/arithmetic-verification.json",
        "tools/gen_row227_full_certificate.py", "tools/gen_row227_certificate.py",
        "Grothe/UpperChaos/ConditionalSourceRow227Scalar.lean",
        "Grothe/UpperChaos/OriginalRow227ErrorBoundary.lean",
        "Grothe/UpperChaos/OriginalRow227Payload.lean",
        "Grothe/UpperChaos/OriginalRow227PayloadData.lean",
    ))
    paths.update(str(p.relative_to(ROOT)) for p in
                 sorted((ROOT / "tools/row227_certificate").glob("*.py")))
    paths.update(str(p.relative_to(ROOT)) for p in
                 sorted(LEAN.glob("OriginalRow227PayloadChunk*.lean")))
    paths.update("Grothe/UpperChaos/" + name + ".lean" for name in MANUAL)
    return {name: sha((ROOT / name).read_bytes()) for name in sorted(paths)}


def generate(staging):
    env = dict(os.environ, GROTHE_ROW227_GENERATION_DIR=str(staging))
    files, reports = {}, {}
    for script, family in FAMILIES:
        folder = staging / family
        folder.mkdir()
        command = [sys.executable, "-B", str(ROOT / "tools/row227_certificate" / script)]
        if script == "ratios.py":
            command += ["--packet", str(ROOT / "data/original-row227-certificate/certificate.json.gz"),
                        "--packet-sha256", PACKET_SHA,
                        "--bridge", str(LEAN / "ConditionalRatioBlocks.lean"),
                        "--output-dir", str(folder / "generated")]
        subprocess.run(command, env=env, cwd=ROOT, check=True)
        family_files = list((folder / "generated").rglob("*.lean"))
        require(family_files, "empty generated family: " + family)
        for path in sorted(family_files):
            raw = path.read_bytes()
            if path.stem in MANUAL:
                require(path.stem == "ConditionalRatioBlocks" and
                        raw == (LEAN / path.name).read_bytes(), "unexpected manual template output")
                continue
            require(path.name not in files, "duplicate generated module: " + path.name)
            files[path.name] = raw
        reports[family] = {
            "module_count": len(family_files),
            "manifests": {str(p.relative_to(folder)): sha(p.read_bytes())
                          for p in sorted(folder.rglob("*.json"))},
        }
    require(len(files) == 5410, "complete generated-module count")
    return files, reports


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="compare without changing repository files")
    args = parser.parse_args()
    before = committed_inputs()
    require(before["data/original-row227-certificate/certificate.json.gz"] == PACKET_SHA,
            "pinned integer transcript")
    with tempfile.TemporaryDirectory(prefix="codex-aa04-row227-generation-") as temp:
        files, reports = generate(Path(temp).resolve())
    require(committed_inputs() == before, "inputs changed during generation")
    manifest = {
        "schema": 1, "agent": "codex-aa04", "task": 293,
        "target": "Grothe.UpperChaos.OriginalRow227Certificate.midpoint_saved_vector_error",
        "status": "GENERATED_SOURCE_NOT_VERIFICATION_EVIDENCE",
        "input_sha256": before, "families": reports,
        "handwritten_modules": list(MANUAL),
        "generated_module_count": len(files),
        "generated_source_bytes": sum(map(len, files.values())),
        "files": {"Grothe/UpperChaos/" + name: {"bytes": len(raw), "sha256": sha(raw)}
                  for name, raw in sorted(files.items())},
    }
    encoded = (json.dumps(manifest, indent=2, sort_keys=True) + "\n").encode()
    managed = set()
    if MANIFEST.exists():
        old = json.loads(MANIFEST.read_bytes())
        managed = set(old["files"])
        require(set(old["files"]) <= set(manifest["files"]),
                "obsolete generated outputs require explicit reviewed removal")
    for name, raw in files.items():
        path = LEAN / name
        if args.check:
            require(path.exists() and path.read_bytes() == raw, "byte reproduction: " + name)
        else:
            if path.exists() and str(path.relative_to(ROOT)) not in managed:
                require(path.read_bytes() == raw, "refuse to overwrite existing non-generated source: " + name)
            path.write_bytes(raw)
    if args.check:
        require(MANIFEST.exists() and MANIFEST.read_bytes() == encoded, "manifest reproduction")
    else:
        MANIFEST.write_bytes(encoded)
    print(json.dumps({"mode": "checked" if args.check else "generated",
                      "modules": len(files), "handwritten": len(MANUAL),
                      "source_bytes": manifest["generated_source_bytes"],
                      "manifest_sha256": sha(encoded)}, sort_keys=True))


if __name__ == "__main__":
    main()
