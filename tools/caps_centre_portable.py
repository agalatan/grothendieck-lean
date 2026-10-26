#!/usr/bin/env python3
"""Prepare portable #87 research exports from ONE immutable completed checkpoint.

Only new files are prepared: no builds, solvers, processes, caches or mathematics
are changed. Completed entries retain their original paths, evidence and scratch
bytes; their old absolute-IO modules are explicitly forbidden build targets.
Remaining centres get a new unique tag and relative IO paths, identical on macOS
and Linux. Stored grids remain unchanged. Fine preparation uses1600x1152 for g2
and3200x256 for g1, without changing pieceGrids or capPad.

  python3 tools/caps_centre_portable.py prepare --agent-id codex-15b7 \
    --manifest data/caps-m/plan/centre-sweep-codex-15b7.json \
    --checkpoint data/caps-m/plan/checkpoint-codex-15b7.json \
    --tag Codex15b7Portable --out data/caps-m/plan/portable/Codex15b7Portable/manifest.json
  python3 tools/caps_centre_portable.py --check data/caps-m/plan/portable/Codex15b7Portable/portable-config.json

The checkpoint must account for any old existing raw exports/solutions. A
remaining centre with such artifacts is rejected, rather than recomputed from an
older snapshot. Preparation is idempotent and never overwrites changed files.
Checks audit structural identity/provenance, not feasibility or native acceptance.
"""
from __future__ import annotations

import argparse
import copy
from fractions import Fraction
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_centre_checkpoint as checkpoint
import caps_centre_fine as fine
import caps_centre_sweep as sweep

ROOT = Path(__file__).resolve().parents[1]
FORMAT = "caps-centre-portable/v1"
GENERATOR = "tools/caps_centre_portable.py"
FIELDS = ("module_file", "export", "export_provenance", "solved")


def require(value, message):
    if not value:
        raise sweep.SweepError(message)


def safe(root, value):
    require(type(value) is str and value and "\\" not in value and "\0" not in value, "Invalid portable path")
    path = PurePosixPath(value)
    require(not path.is_absolute() and path.as_posix() == value and
            not any(p in (".", "..") for p in path.parts), "Path escape/noncanonical portable path: " + value)
    current = Path(root).resolve()
    for part in path.parts:
        current /= part
        require(not current.is_symlink(), "Symlink in portable path: " + value)
    require(current.resolve(strict=False).is_relative_to(Path(root).resolve()), "Path escapes worktree")
    return current


def data_path(root, value):
    path = safe(root, value)
    require(path.is_relative_to(Path(root).resolve() / sweep.PLAN), "Portable config/artifact must live under PLAN")
    return path


def argument_name(root, value):
    """CLI/API paths may be absolute inside this root; stored paths never are."""
    path = Path(value)
    if path.is_absolute():
        require(path.is_relative_to(Path(root).resolve()), "Argument path escapes worktree")
        value = path.relative_to(Path(root).resolve()).as_posix()
    else:
        value = path.as_posix()
    safe(root, value)
    return value


def sha_bytes(value):
    return hashlib.sha256(value).hexdigest()


def json_bytes(value):
    return (json.dumps(value, sort_keys=True, indent=2) + "\n").encode()


def sidecar(prov, entry):
    return {"fingerprint": prov["fingerprint"], "key": sweep.key_string(entry), "grid": entry["grid"],
            **{k: entry[k] for k in ("node_sha256", "piece_sha256", "module_source_sha256")}}


def source(node, entry, name, *, grid_spec=None, target=None):
    """Frozen upstream template; only the IO literal is portable/relative."""
    stored = entry.get("stored_grid", entry["grid"])
    pieces = [f"{stored};{p['recipe']};" + ";".join(p["cons"]) for p in node["pieces"]]
    target = entry["export"] if target is None else target
    call = f"  exportPiecesOn {json.dumps(target)} centreNode_{name} [{entry['j']}] {stored}"
    if grid_spec is not None:
        step = Fraction(grid_spec[2])
        call = (f"  exportPiecesOnGrid {json.dumps(target)} centreNode_{name} [{entry['j']}] "
                f"({grid_spec[0]}, {grid_spec[1]}, ({step.numerator} : ℚ) / {step.denominator})")
    return "\n".join([
        "import Grothe.LowerAnalytic.CapExport", "", "namespace Grothe.LowerAnalytic", "",
        "set_option maxRecDepth 100000", "",
        f"def centreNode_{name} : Nat × Nat × List String × List String :=",
        f"  ({entry['k']}, {entry['i']}, {json.dumps(node['ds'])}, [",
        ",\n".join("    " + json.dumps(piece) for piece in pieces) + "])", "",
        f"def run_{name} : IO Unit := do",
        f"  if ← System.FilePath.pathExists {json.dumps(target)} then",
        '    throw (IO.userError "Export already exists; validate/preserve it before resuming")', call, "",
        f"#eval run_{name}", "", "end Grothe.LowerAnalytic", ""]).encode()


def rendered_stored(node, original, provenance, tag):
    entry = copy.deepcopy(original)
    suffix = f"{tag}_{provenance['fingerprint'][:12]}_{entry['k']}x{entry['i']}_j{entry['j']}_g{entry['grid']}"
    name = "Run_centre_" + suffix
    export = sweep.PLAN / "exports" / ("exp_centre_" + suffix + ".jsonl")
    entry.update(module="Grothe.LowerAnalytic.CapPlanRuns." + name,
                 module_file="Grothe/LowerAnalytic/CapPlanRuns/" + name + ".lean",
                 export=export.as_posix(), export_provenance=export.with_suffix(".provenance.json").as_posix(),
                 solved=(sweep.PLAN / "solved" / ("sol_centre_" + suffix + ".json")).as_posix())
    payload = source(node, entry, name)
    entry["module_source_sha256"] = sha_bytes(payload)
    return entry, {entry["module_file"]: payload,
                   entry["export_provenance"]: json_bytes(sidecar(provenance, entry))}


def rendered_fine(root, node, original, tag):
    require(type(original["grid"]) is int and original["grid"] in (1, 2), "Unsupported stored centre grid")
    spec = [1600, 1152, "1/200"] if original["grid"] == 2 else [3200, 256, "1/400"]
    spec = fine.grid_spec(*spec)
    require(spec[1] >= original["nq"], "Prepared fine grid would coarsen stored grid")
    provenance = fine.provenance(root, spec)
    entry = {k: original[k] for k in ("k", "i", "j", "nq", "node_sha256", "piece_sha256")}
    entry.update(grid=3, stored_grid=original["grid"], grid_spec=spec)
    suffix = f"{tag}_{provenance['fingerprint'][:12]}_{entry['k']}x{entry['i']}_j{entry['j']}_g3"
    name = "Run_centreFine_" + suffix
    export = sweep.PLAN / "exports/fine" / ("exp_centreFine_" + suffix + ".jsonl")
    entry.update(module="Grothe.LowerAnalytic.CapPlanRuns." + name,
                 module_file="Grothe/LowerAnalytic/CapPlanRuns/" + name + ".lean",
                 export=export.as_posix(), export_provenance=export.with_suffix(".provenance.json").as_posix(),
                 solved=(sweep.PLAN / "solved/fine" / ("sol_centreFine_" + suffix + ".json")).as_posix())
    payload = source(node, entry, name, grid_spec=spec)
    entry["module_source_sha256"] = sha_bytes(payload)
    manifest = {"schema": 1, "purpose": "explicit finer-grid centre SEARCH, not stored-grid or Lean verification",
                "provenance": provenance, "entry": entry}
    path = (sweep.PLAN / "fine-campaign" /
            f"fine-{tag}-{entry['k']}x{entry['i']}-{provenance['fingerprint'][:12]}.json").as_posix()
    return path, manifest, {entry["module_file"]: payload,
                            entry["export_provenance"]: json_bytes(sidecar(provenance, entry)),
                            path: json_bytes(manifest)}


def plan(root, manifest_name, checkpoint_name, tag, out_name, *, agent="codex-15b7"):
    """Pure planning/read audit. Return config and new bytes without writing."""
    root = Path(root).resolve()
    require(re.fullmatch(r"[A-Za-z][A-Za-z0-9_]*", tag), "Tag must be a Lean identifier fragment")
    original_bytes = data_path(root, manifest_name).read_bytes()
    checkpoint_bytes = data_path(root, checkpoint_name).read_bytes()
    original, saved = json.loads(original_bytes), json.loads(checkpoint_bytes)
    require(tag != original.get("campaign_tag"), "Portable tag must be NEW")
    require(saved.get("manifest") == manifest_name, "Immutable checkpoint names a different full manifest")
    for e in original["entries"]:
        for field in FIELDS:
            if field in e:
                safe(root, e[field])
    sweep.check_manifest(root, original)
    captured, audit = checkpoint.collect(root, agent, manifest_name, checkpoint_path=checkpoint_name)
    require(captured == saved, "Checkpoint input changed during read audit")
    snapshot = saved["progress_snapshot"]
    records = snapshot["centres"]
    complete = {k: r for k, r in records.items() if r.get("status") == "complete" and r.get("residual_accepted") is True}
    nodes = {(n["k"], n["i"]): n for n in json.loads(safe(root, sweep.PIECES.as_posix()).read_bytes())}
    new = copy.deepcopy(original)
    new["campaign_tag"] = tag
    out_path = data_path(root, out_name)
    require(out_path.suffix == ".json", "Portable manifest output must be JSON")
    config_name = out_path.with_name("portable-config.json").relative_to(root).as_posix()
    require(out_name != config_name, "Manifest/config output collision")
    preserved = dict(audit["source_and_dependency_sha256"])
    preserved[manifest_name] = sha_bytes(original_bytes)
    preserved[checkpoint_name] = sha_bytes(checkpoint_bytes)
    for name in audit["all_evidence_paths"]:
        preserved[name] = sweep.sha(safe(root, name))
    old_paths = {e[f] for e in original["entries"] for f in FIELDS if f in e}
    generated, pending, legacy_modules = {}, [], set()

    def preserve_module(entry):
        name = entry["module_file"]
        path = safe(root, name)
        require(path.is_file() and sweep.sha(path) == entry["module_source_sha256"],
                "Missing/changed legacy scratch bytes; restore/copy original bytes, never rebuild: " + name)
        preserved[name] = entry["module_source_sha256"]
        legacy_modules.add(entry["module"])

    for index, entry in enumerate(original["entries"]):
        ident = sweep.key_string(entry)
        require(type(entry["grid"]) is int and entry["grid"] in (1, 2), "Unsupported stored centre grid")
        if ident in complete:
            if "module_file" in entry:
                preserve_module(entry)
                require(sweep.export_record(root, original, entry) is not None, "Completed stored export is missing")
            continue
        require(entry.get("search_status") == "pending", "Incomplete selected historical centre cannot be regenerated")
        for field in ("export", "solved"):
            require(field in entry and not safe(root, entry[field]).exists(),
                    "Incomplete selected centre has existing old " + field + "; capture a current completed checkpoint: " + ident)
        node = nodes[entry["k"], entry["i"]]
        stored, outputs = rendered_stored(node, entry, original["provenance"], tag)
        new["entries"][index] = stored
        fine_path, fine_manifest, fine_outputs = rendered_fine(root, node, entry, tag + "Fine")
        require(not set(outputs).intersection(fine_outputs), "Stored/fine preparation collision")
        for name, payload in {**outputs, **fine_outputs}.items():
            require(name not in old_paths and name not in generated, "Output collides with an old/other prepared path: " + name)
            safe(root, name)
            generated[name] = payload
        pending.append({"key": ident, "stored_module": stored["module"], "stored_export": stored["export"],
                        "fine_manifest": fine_path, "fine_module": fine_manifest["entry"]["module"],
                        "fine_export": fine_manifest["entry"]["export"], "fine_grid_spec": fine_manifest["entry"]["grid_spec"]})
    # Preserve fine scratch sources referenced by completed records, including
    # failed primary attempts retained alongside successful supplemental proofs.
    for name in audit["all_evidence_paths"]:
        if not name.endswith(".json"):
            continue
        value = json.loads(safe(root, name).read_bytes())
        if isinstance(value, dict) and "entry" in value and "provenance" in value and "module_file" in value["entry"]:
            preserve_module(value["entry"])
            fine.validate(root, value)
    require(len(complete) + len(pending) == len(original["entries"]), "Portable inventory accounting is incomplete")
    # Campaign.finer discovers these locations independently of the stored
    # manifest. A completed/failed speculative fine export for a still-pending
    # centre must not be silently replaced by a freshly named computation.
    pending_keys = {p["key"] for p in pending}
    fine_candidates = list((root / sweep.PLAN).glob("fine-*.json"))
    fine_candidates += list((root / sweep.PLAN / "fine-campaign").glob("*.json"))
    for candidate in sorted(fine_candidates):
        name = candidate.relative_to(root).as_posix()
        safe(root, name)
        if name in generated:
            continue  # This exact portable preparation is checked byte-for-byte below.
        value = json.loads(candidate.read_bytes())
        entry = value["entry"]
        if sweep.key_string(entry) not in pending_keys:
            continue
        for field in ("export", "solved"):
            if safe(root, entry[field]).exists():
                raise sweep.SweepError("Incomplete selected centre has existing old fine " + field +
                                       " outside immutable checkpoint; inspect/adopt before preparing: " +
                                       sweep.key_string(entry) + " (" + name + ")")
    source_files = dict(audit["source_and_dependency_sha256"])
    for name in (GENERATOR, "tools/caps_centre_checkpoint.py", "tools/caps_centre_fine.py", "tools/caps_centre_sweep.py"):
        source_files[name] = sweep.sha(safe(root, name))
    generator = {"path": GENERATOR, "sha256": source_files[GENERATOR]}
    inputs = {"manifest": {"path": manifest_name, "sha256": sha_bytes(original_bytes)},
              "checkpoint": {"path": checkpoint_name, "sha256": sha_bytes(checkpoint_bytes)}}
    new["portable"] = {"format": FORMAT, "agent_id": agent, "generator": generator, "inputs": inputs,
                       "config": config_name, "pending_keys": [r["key"] for r in pending],
                       "completed_records": copy.deepcopy(complete), "legacy_modules_never_build": sorted(legacy_modules),
                       "scope": "Completed metadata/evidence retained; old absolute-IO source is for validation only, never rebuild it"}
    new["summary"] = {**new["summary"], "portable_remaining_centres": len(pending), "portable_completed_centres": len(complete)}
    require(out_name not in generated and out_name not in old_paths and out_name not in preserved,
            "Portable output would replace an old input/artifact")
    generated[out_name] = json_bytes(new)
    config = {"format": FORMAT, "agent_id": agent, "tag": tag, "generator": generator, "inputs": inputs,
              "manifest": {"path": out_name, "sha256": sha_bytes(generated[out_name])},
              "full_inventory_count": len(original["entries"]), "pending": pending, "completed_keys": sorted(complete),
              "completed_record_sha256": {k: sha_bytes(sweep.canonical(v)) for k, v in sorted(complete.items())},
              "preserved_files": dict(sorted(preserved.items())), "source_files": dict(sorted(source_files.items())),
              "outputs": {p: sha_bytes(b) for p, b in sorted(generated.items())},
              "caution": "Structural/path/hash provenance audit only; no new feasibility, minimality or native-verification claim"}
    require(config_name not in generated and config_name not in preserved and config_name not in old_paths,
            "Config output collision")
    generated[config_name] = json_bytes(config)
    # Recheck all immutable selected bytes, then preflight EVERY destination
    # before any write. Existing matching preparation is preserved idempotently.
    for name, sha in {**preserved, **source_files}.items():
        require(sweep.sha(safe(root, name)) == sha, "Immutable selected input changed: " + name)
    for name, payload in generated.items():
        path = safe(root, name)
        require(not path.exists() or (path.is_file() and path.read_bytes() == payload),
                "Refusing to overwrite changed existing output: " + name)
    existing_results(root, new, config, only_existing=True, prepared=generated)
    return config_name, config, generated


def solved_header(root, name, entry, export_path, provenance):
    path = safe(root, name)
    if not path.exists():
        return
    rows = json.loads(path.read_bytes())
    require(isinstance(rows, list) and len(rows) == 1, "Solved output must contain exactly one result")
    result = rows[0]
    require(sweep.key(result) == sweep.key(entry) and result.get("grid") == entry["grid"], "Solved identity/grid mismatch")
    expected = {"fingerprint": provenance["fingerprint"], "export_sha256": sweep.sha(safe(root, export_path)),
                "baseline_capPad": provenance["baseline_capPad"], "cap_up_convention": provenance["cap_up_convention"]}
    if entry["grid"] == 3:
        expected["grid_spec"] = entry["grid_spec"]
        require(result.get("grid_spec") == entry["grid_spec"], "Solved fine grid specification mismatch")
    require(result.get("provenance") == expected, "Solved output source/export provenance mismatch")
    require(result.get("status") in sweep.SUCCESS | {"fail"}, "Unknown solved search status")


def existing_results(root, manifest, config, *, only_existing=False, prepared=None):
    """Validate only; new research outputs may appear without changing preparation."""
    sweep.check_manifest(root, manifest)
    entries = {sweep.key_string(e): e for e in manifest["entries"]}
    for pending in config["pending"]:
        entry = entries[pending["key"]]
        if not only_existing or safe(root, entry["export"]).exists() or safe(root, entry["solved"]).exists():
            row = sweep.export_record(root, manifest, entry)
            require(not safe(root, entry["solved"]).exists() or row is not None, "Solved stored output lacks its export")
            solved_header(root, entry["solved"], entry, entry["export"], manifest["provenance"])
        fm = json.loads(prepared[pending["fine_manifest"]] if prepared is not None else
                        safe(root, pending["fine_manifest"]).read_bytes())
        if (not only_existing or safe(root, fm["entry"]["export"]).exists() or
                safe(root, fm["entry"]["solved"]).exists()):
            row = fine.validate(root, fm)
            require(not safe(root, fm["entry"]["solved"]).exists() or row is not None, "Solved fine output lacks its export")
            solved_header(root, fm["entry"]["solved"], fm["entry"], fm["entry"]["export"], fm["provenance"])


def prepare(root, manifest_name, checkpoint_name, tag, out_name, *, agent="codex-15b7"):
    manifest_name, checkpoint_name, out_name = [argument_name(root, value) for value in
                                               (manifest_name, checkpoint_name, out_name)]
    config_name, config, generated = plan(root, manifest_name, checkpoint_name, tag, out_name, agent=agent)
    for name, payload in generated.items():
        path = safe(root, name)
        path.parent.mkdir(parents=True, exist_ok=True)
        if path.exists():
            require(path.read_bytes() == payload, "Output changed after preflight: " + name)
            continue
        with path.open("xb") as stream:
            stream.write(payload)
    manifest = json.loads(generated[out_name])
    existing_results(Path(root), manifest, config)
    return config_name, config


def check(root, config_name):
    """Read-only API for transport/batch preflights, valid after results appear."""
    config_name = argument_name(root, config_name)
    stored = json.loads(data_path(root, config_name).read_bytes())
    require(stored.get("format") == FORMAT, "Unknown portable config format")
    expected_name, expected, generated = plan(root, stored["inputs"]["manifest"]["path"],
                                              stored["inputs"]["checkpoint"]["path"], stored["tag"],
                                              stored["manifest"]["path"], agent=stored["agent_id"])
    require(expected_name == config_name and expected == stored, "Portable config pins/content changed")
    for name, payload in generated.items():
        require(safe(root, name).is_file() and safe(root, name).read_bytes() == payload, "Missing/changed prepared output: " + name)
    existing_results(Path(root), json.loads(generated[stored["manifest"]["path"]]), stored)
    return stored


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--check", type=Path)
    sub = parser.add_subparsers(dest="mode")
    p = sub.add_parser("prepare")
    for flag in ("manifest", "checkpoint", "out"):
        p.add_argument("--" + flag, required=True)
    p.add_argument("--tag", required=True)
    p.add_argument("--agent-id", required=True)
    args = parser.parse_args(argv)
    try:
        if args.check is not None:
            require(args.mode is None, "Choose prepare or --check")
            result = check(ROOT, args.check.as_posix())
            config_name = args.check.as_posix()
        else:
            require(args.mode == "prepare", "Choose prepare or --check")
            config_name, result = prepare(ROOT, args.manifest, args.checkpoint, args.tag, args.out, agent=args.agent_id)
        print(json.dumps({"config": config_name, "canonical_centres": result["full_inventory_count"],
                          "completed_preserved": len(result["completed_keys"]), "remaining": len(result["pending"]),
                          "scope": "preparation/provenance only; no build or solve"}, sort_keys=True))
    except (OSError, ValueError, KeyError, TypeError) as exc:
        parser.exit(1, f"FAIL: {exc}\n")


if __name__ == "__main__":
    main()
