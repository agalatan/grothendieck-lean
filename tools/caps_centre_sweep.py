#!/usr/bin/env python3
"""Prepare and resume the centre-piece SEARCH in #87, never a caps verification.

inventory --out MANIFEST records every centre and historical stored-grid result.
prepare MANIFEST writes one scratch CapPlanRuns module per pending centre.
validate MANIFEST checks completed exports against their identity and provenance.
solve MANIFEST runs caps_plan's exact-rational search on completed exports.

Historical results lack the new source provenance. They are reported separately,
and are reused only with inventory --adopt-history --review-note TEXT after a
human/agent source and exact-matrix review. Such reuse remains historical search,
not a new Lean check. All cap_up values are ADDITIONAL to baseline capPad. This
tool changes neither capPad nor the cover, and never builds or publishes a cache.
"""
import argparse
from collections import Counter
from fractions import Fraction
import hashlib
import importlib.util
import json
from pathlib import Path
import re
import sys

ROOT = Path(__file__).resolve().parents[1]
PIECES = Path("data/caps-m-pieces/pieces.json")
PLAN = Path("data/caps-m/plan")
GRID = {256: 1, 1024: 2}
SUCCESS = {"pass", "fixed", "cap_up"}


class SweepError(ValueError):
    pass


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def write_json(path, value):
    path = Path(path)
    path.parent.mkdir(parents=True, exist_ok=True)
    data = json.dumps(value, sort_keys=True, indent=2) + "\n"
    if path.exists() and path.read_text() == data:
        return
    tmp = path.with_suffix(path.suffix + ".tmp")
    tmp.write_text(data)
    tmp.replace(path)


def key(row):
    return (int(row["k"]), int(row["i"]), int(row["j"]))


def key_string(row):
    return ":".join(map(str, key(row)))


def centres(nodes):
    out = []
    for node in nodes:
        found = [(j, p) for j, p in enumerate(node["pieces"])
                 if Fraction(str(p["slack"])) < Fraction(1, 10**11)]
        if len(found) != 1:
            raise SweepError(f"{node['k']}:{node['i']}: expected one centre, found {len(found)}")
        j, piece = found[0]
        if piece["nq"] not in GRID:
            raise SweepError(f"unknown stored nq {piece['nq']}")
        out.append({"k": node["k"], "i": node["i"], "j": j,
                    "grid": GRID[piece["nq"]], "nq": piece["nq"],
                    "node_sha256": hashlib.sha256(canonical(node)).hexdigest(),
                    "piece_sha256": hashlib.sha256(canonical(piece)).hexdigest()})
    if len({key(x) for x in out}) != len(out):
        raise SweepError("duplicate node/centre identity")
    return sorted(out, key=key)


def baseline_cap_pad(root):
    source = (root / "Grothe/Lower/RowDataTypes.lean").read_text()
    m = re.search(r"^def capPad\s*:\s*ℚ\s*:=\s*(\d+)\s*/\s*(\d+)\s*$", source, re.M)
    if not m:
        raise SweepError("cannot parse exact baseline capPad")
    return str(Fraction(int(m[1]), int(m[2])))


def provenance(root):
    # Reuse the fail-closed import parser rather than approximate a Lean import
    # closure. Mathlib is pinned by the manifest/toolchain; project modules by bytes.
    spec = importlib.util.spec_from_file_location("centre_caps_stamp", root / "scripts/caps_stamp.py")
    stamp = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(stamp)
    stamp.ROOT = str(root)
    files = {Path(*m.split(".")).with_suffix(".lean").as_posix()
             for m in stamp.closure(["Grothe.LowerAnalytic.CapExport"])}
    files.update({PIECES.as_posix(), "GrotheCapsKernel.lean", "lean-toolchain",
                  "lakefile.toml", "lake-manifest.json", "tools/caps_plan.py", "tools/caps_lmi.py"})
    hashes = {p: sha(root / p) for p in sorted(files)}
    return {"files": hashes, "fingerprint": hashlib.sha256(canonical(hashes)).hexdigest(),
            "baseline_capPad": baseline_cap_pad(root),
            "cap_up_convention": "additional to baseline_capPad, not the final capPad"}


def historical_candidates(root, entries):
    by = {key(e): e for e in entries}
    found, ignored = {}, []
    for path in sorted((root / PLAN / "solved").glob("sol_*_g*.json")):
        for row in json.loads(path.read_text()):
            ident = key(row)
            if ident not in by or row.get("status") not in SUCCESS:
                continue
            if row.get("grid") != by[ident]["grid"]:
                ignored.append({"key": key_string(row), "grid": row.get("grid"),
                                "file": path.relative_to(root).as_posix(), "reason": "not stored grid"})
                continue
            if row.get("encl") is False or row.get("polyOK") is False:
                raise SweepError(f"successful historical result has failed guards: {path}")
            increase = Fraction(row.get("cap_up", "0"))
            if increase < 0 or (row["status"] != "cap_up" and increase):
                raise SweepError(f"invalid historical cap increase: {path}")
            if not isinstance(row.get("lm"), list):
                raise SweepError(f"historical result lacks multipliers: {path}")
            candidate = {"file": path.relative_to(root).as_posix(), "file_sha256": sha(path),
                         "status": row["status"], "cap_up": str(increase),
                         "result_sha256": hashlib.sha256(canonical(row)).hexdigest()}
            previous = found.get(ident)
            if previous and previous["result_sha256"] != candidate["result_sha256"]:
                raise SweepError(f"conflicting historical results for {key_string(row)} on stored grid")
            found[ident] = candidate
    return found, ignored


def inventory(root, adopt_history=False, review_note=None):
    if adopt_history and not (review_note and review_note.strip()):
        raise SweepError("history adoption needs an explicit source/exact-matrix review note")
    entries = centres(json.loads((root / PIECES).read_text()))
    history, ignored = historical_candidates(root, entries)
    for entry in entries:
        entry["historical"] = history.get(key(entry))
        entry["search_status"] = "historical_adopted" if adopt_history and entry["historical"] else "pending"
    counts = Counter(e["grid"] for e in entries)
    hc = Counter(e["grid"] for e in entries if e["historical"])
    return {"schema": 1, "purpose": "centre-piece search; final Lean caps verification is CI's caps run",
            "provenance": provenance(root), "historical_review_note": review_note if adopt_history else None,
            "summary": {"centres": len(entries), "stored_grid_counts": dict(sorted(counts.items())),
                        "historical_stored_grid_candidates": len(history),
                        "remaining_after_reviewed_history": {str(g): counts[g] - hc[g] for g in sorted(counts)},
                        "pending_searches": sum(e["search_status"] == "pending" for e in entries)},
            "ignored_historical_grids": ignored, "entries": entries}


def check_manifest(root, manifest):
    current = provenance(root)
    if current != manifest["provenance"]:
        changed = sorted(p for p in current["files"].keys() | manifest["provenance"]["files"].keys()
                         if current["files"].get(p) != manifest["provenance"]["files"].get(p))
        raise SweepError("source provenance changed; prepare a new inventory/campaign: " + ", ".join(changed))
    expected = {key(e): e for e in centres(json.loads((root / PIECES).read_text()))}
    if len(manifest["entries"]) != len(expected) or len({key(e) for e in manifest["entries"]}) != len(expected):
        raise SweepError("manifest centre inventory is incomplete")
    for entry in manifest["entries"]:
        orig = expected.get(key(entry))
        if orig is None or any(entry.get(k) != v for k, v in orig.items()):
            raise SweepError(f"manifest entry does not match inputs: {key_string(entry)}")
        old = entry.get("historical")
        if entry["search_status"] == "historical_adopted":
            if not old or not manifest.get("historical_review_note") or sha(root / old["file"]) != old["file_sha256"]:
                raise SweepError("historical adoption missing review or changed solved bytes")


def export_record(root, manifest, entry):
    path = root / entry["export"]
    sidecar = root / entry["export_provenance"]
    expected = {"fingerprint": manifest["provenance"]["fingerprint"],
                "key": key_string(entry), "grid": entry["grid"],
                "node_sha256": entry["node_sha256"], "piece_sha256": entry["piece_sha256"],
                "module_source_sha256": entry["module_source_sha256"]}
    if not sidecar.exists() or json.loads(sidecar.read_text()) != expected:
        raise SweepError(f"missing/stale export provenance: {sidecar}")
    if sha(root / entry["module_file"]) != entry["module_source_sha256"]:
        raise SweepError(f"scratch module changed after preparation: {entry['module_file']}")
    if not path.exists():
        return None
    if not path.stat().st_size:
        raise SweepError(f"empty prior export preserved; inspect before retrying: {path}")
    lines = [s for s in path.read_text().splitlines() if s.strip()]
    if len(lines) != 1:
        raise SweepError(f"expected one complete export row, found {len(lines)}: {path}")
    try:
        row = json.loads(lines[0])
    except json.JSONDecodeError as e:
        raise SweepError(f"partial/malformed export preserved at {path}: {e}") from e
    if key(row) != key(entry) or row.get("grid") != entry["grid"]:
        raise SweepError(f"export identity or stored grid mismatch: {path}")
    nodes = { (n["k"], n["i"]): n for n in json.loads((root / PIECES).read_text()) }
    node = nodes[(entry["k"], entry["i"])]
    if Fraction(row["capPad"]) != Fraction(manifest["provenance"]["baseline_capPad"]):
        raise SweepError(f"export capPad mismatch: {path}")
    if Fraction(row["cap"]) != Fraction(str(node["cap"])) or Fraction(row["s"]) != Fraction(str(node["s"])):
        raise SweepError(f"export node cap/location mismatch: {path}")
    if not row.get("encl") or not row.get("polyOK"):
        raise SweepError(f"export enclosure/polynomial guard failed: {path}")
    if len(row.get("N", [])) != 13 or any(len(r) != 13 for r in row["N"]):
        raise SweepError(f"export matrix is not13×13: {path}")
    constraints = node["pieces"][entry["j"]]["cons"]
    if len(row.get("cons", [])) != len(constraints):
        raise SweepError(f"export constraint count mismatch: {path}")
    for c, encoded in zip(row["cons"], constraints):
        fields = encoded.split(",")
        if len(fields) != 6:
            raise SweepError("invalid constraint input")
        for label, value in zip(("lo", "hi", "lam", "mu"), fields[2:]):
            expected_q = None if value == "*" else Fraction(value)
            actual_q = None if c.get(label) is None else Fraction(c[label])
            if actual_q != expected_q:
                raise SweepError(f"export constraint {label} mismatch: {path}")
        if any(len(c.get(label, [])) != 13 or any(len(r) != 13 for r in c[label]) for label in ("A", "B")):
            raise SweepError(f"export constraint matrix shape mismatch: {path}")
    return row


def prepare(root, manifest, tag, keys=(), limit=None):
    check_manifest(root, manifest)
    if not re.fullmatch(r"[A-Za-z][A-Za-z0-9_]*", tag):
        raise SweepError("tag must be a Lean identifier fragment starting with a letter")
    if manifest.get("campaign_tag", tag) != tag:
        raise SweepError("campaign tag changed; use a separate manifest for a new campaign")
    node_map = {(n["k"], n["i"]): n for n in json.loads((root / PIECES).read_text())}
    selected = [e for e in manifest["entries"] if e["search_status"] == "pending" and
                (not keys or key_string(e) in keys)]
    if keys and set(keys) - {key_string(e) for e in selected}:
        raise SweepError("requested centre key absent or already adopted")
    if limit is not None:
        selected = selected[:limit]
    prefix = tag + "_" + manifest["provenance"]["fingerprint"][:12]
    for entry in selected:
        suffix = f"{entry['k']}x{entry['i']}_j{entry['j']}_g{entry['grid']}"
        name = f"Run_centre_{prefix}_{suffix}"
        export = PLAN / "exports" / f"exp_centre_{prefix}_{suffix}.jsonl"
        module = Path("Grothe/LowerAnalytic/CapPlanRuns") / (name + ".lean")
        entry.update(module="Grothe.LowerAnalytic.CapPlanRuns." + name,
                     module_file=module.as_posix(), export=export.as_posix(),
                     export_provenance=export.with_suffix(".provenance.json").as_posix(),
                     solved=(PLAN / "solved" / f"sol_centre_{prefix}_{suffix}.json").as_posix())
        node = node_map[(entry["k"], entry["i"])]
        pcs = [f"{entry['grid']};{p['recipe']};" + ";".join(p["cons"]) for p in node["pieces"]]
        target = str((root / export).resolve())
        src = ["import Grothe.LowerAnalytic.CapExport", "", "namespace Grothe.LowerAnalytic", "",
               "set_option maxRecDepth 100000", "",
               f"def centreNode_{name} : Nat × Nat × List String × List String :=",
               f"  ({entry['k']}, {entry['i']}, {json.dumps(node['ds'])}, [",
               ",\n".join("    " + json.dumps(s) for s in pcs) + "])", "",
               "#eval do", f"  if ← System.FilePath.pathExists {json.dumps(target)} then",
               '    throw (IO.userError "Export already exists; validate/preserve it before resuming")',
               f"  exportPiecesOn {json.dumps(target)} centreNode_{name} [{entry['j']}] {entry['grid']}", "",
               "end Grothe.LowerAnalytic", ""]
        (root / module).parent.mkdir(parents=True, exist_ok=True)
        content = "\n".join(src)
        entry["module_source_sha256"] = hashlib.sha256(content.encode()).hexdigest()
        sidecar = {"fingerprint": manifest["provenance"]["fingerprint"],
                   "key": key_string(entry), "grid": entry["grid"],
                   "node_sha256": entry["node_sha256"], "piece_sha256": entry["piece_sha256"],
                   "module_source_sha256": entry["module_source_sha256"]}
        sidepath = root / entry["export_provenance"]
        if sidepath.exists() and json.loads(sidepath.read_text()) != sidecar:
            raise SweepError(f"refusing to overwrite foreign provenance: {sidepath}")
        if (root / module).exists() and (root / module).read_text() != content:
            raise SweepError(f"refusing to overwrite changed scratch module {module}")
        if (root / export).exists():
            export_record(root, manifest, entry)  # Preserve complete output; reject partial output.
            continue
        write_json(sidepath, sidecar)
        (root / module).write_text(content)
    manifest["campaign_tag"] = tag
    return manifest


def validate(root, manifest):
    check_manifest(root, manifest)
    valid, missing = [], []
    for entry in manifest["entries"]:
        if "export" not in entry:
            continue
        (valid if export_record(root, manifest, entry) else missing).append(key_string(entry))
    return {"complete_exports": valid, "missing_exports": missing}


def solve(root, manifest):
    check_manifest(root, manifest)
    sys.path.insert(0, str(root / "tools"))
    import caps_lmi
    import caps_plan
    summary = Counter()
    for entry in manifest["entries"]:
        if "export" not in entry or export_record(root, manifest, entry) is None:
            continue
        path = root / entry["solved"]
        source_sha = sha(root / entry["export"])
        prov = {"fingerprint": manifest["provenance"]["fingerprint"], "export_sha256": source_sha,
                "baseline_capPad": manifest["provenance"]["baseline_capPad"],
                "cap_up_convention": manifest["provenance"]["cap_up_convention"]}
        if path.exists():
            rows = json.loads(path.read_text())
            if (len(rows) != 1 or key(rows[0]) != key(entry) or rows[0].get("grid") != entry["grid"] or
                    rows[0].get("provenance") != prov):
                raise SweepError(f"existing solved output has stale provenance: {path}")
            summary[rows[0]["status"]] += 1
            continue
        result = caps_plan.verdict(caps_lmi.load(root / entry["export"])[0])
        result["provenance"] = prov
        write_json(path, [result])
        summary[result["status"]] += 1
        print(key_string(entry), result["status"], result.get("cap_up"), flush=True)
    return dict(summary)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest="command", required=True)
    inv = sub.add_parser("inventory")
    inv.add_argument("--out", type=Path, required=True)
    inv.add_argument("--adopt-history", action="store_true")
    inv.add_argument("--review-note")
    prep = sub.add_parser("prepare")
    prep.add_argument("manifest", type=Path)
    prep.add_argument("--tag", required=True)
    prep.add_argument("--key", action="append", default=[])
    prep.add_argument("--limit", type=int)
    for command in ("validate", "solve"):
        p = sub.add_parser(command)
        p.add_argument("manifest", type=Path)
    args = parser.parse_args(argv)
    try:
        if args.command == "inventory":
            value = inventory(ROOT, args.adopt_history, args.review_note)
            write_json(args.out, value)
            print(json.dumps(value["summary"], sort_keys=True))
        else:
            value = json.loads(args.manifest.read_text())
            if args.command == "prepare":
                prepare(ROOT, value, args.tag, args.key, args.limit)
                write_json(args.manifest, value)
                print("\n".join(e["module"] for e in value["entries"] if "module" in e))
            elif args.command == "validate":
                print(json.dumps(validate(ROOT, value), sort_keys=True))
            else:
                print(json.dumps(solve(ROOT, value), sort_keys=True))
    except (SweepError, OSError, KeyError, ValueError) as e:
        parser.exit(1, f"FAIL: {e}\n")


if __name__ == "__main__":
    main()
