#!/usr/bin/env python3
"""Verify the precise source scope of the archived successful CI receipt.

This verifies pinned files and the repository-local endpoint import closure.
It does not compile Lean or extend the historical run to the current root target.
"""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys


def sha256(data):
    return hashlib.sha256(data).hexdigest()


def lean_code(data):
    """Remove nested Lean comments and normalize whitespace outside strings."""
    text = data.decode("utf-8")
    result = []
    i = 0
    while i < len(text):
        if text.startswith("--", i):
            end = text.find("\n", i + 2)
            i = len(text) if end < 0 else end
            result.append(" ")
        elif text.startswith("/-", i):
            depth = 1
            i += 2
            while depth and i < len(text):
                if text.startswith("/-", i):
                    depth += 1
                    i += 2
                elif text.startswith("-/", i):
                    depth -= 1
                    i += 2
                else:
                    i += 1
            if depth:
                raise ValueError("Unterminated Lean comment")
            result.append(" ")
        elif text[i] == '"':
            start = i
            i += 1
            while i < len(text):
                if text[i] == "\\":
                    i += 2
                elif text[i] == '"':
                    i += 1
                    break
                else:
                    i += 1
            result.append(text[start:i])
        elif text[i].isspace():
            while i < len(text) and text[i].isspace():
                i += 1
            if not result or result[-1] != " ":
                result.append(" ")
        else:
            result.append(text[i])
            i += 1
    return "".join(result).strip().encode("utf-8")


def imports(data):
    code = lean_code(data).decode("utf-8")
    # All project-local import declarations use literal module names.
    return re.findall(r"\bimport\s+((?:Grothe|GrotheKernel)(?:\.[A-Za-z0-9_]+)+)", code)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("receipt", nargs="?", type=Path,
                        default=Path(__file__).with_name("CI.json"))
    parser.add_argument("--direct-reads", action="store_true",
                        help="Read every working file directly instead of index blobs plus Git's clean-tree guard")
    args = parser.parse_args()
    root = Path(__file__).resolve().parents[3]
    receipt = args.receipt.resolve()
    record = json.loads(receipt.read_text())
    commit = record["source_commit"]
    failures = []
    groups = ("endpoint_closure_sha256", "environment_sha256", "input_sha256")
    pinned = {}
    for group in groups:
        for path, expected in record[group].items():
            current = ((root / path).read_bytes() if args.direct_reads else
                       subprocess.check_output(["git", "show", f":{path}"], cwd=root))
            tested = subprocess.check_output(["git", "show", f"{commit}:{path}"], cwd=root)
            if sha256(current) != expected["current"]:
                failures.append(f"Current source hash mismatch: {path}")
            if sha256(tested) != expected["tested"]:
                failures.append(f"Tested source hash mismatch: {path}")
            if current != tested:
                exception = record["comment_only_exceptions"].get(path)
                if not exception:
                    failures.append(f"Source differs from tested commit: {path}")
                else:
                    before = exception["tested_comment_fragment"].encode()
                    after = exception["current_comment_fragment"].encode()
                    if tested.count(before) != 1 or current != tested.replace(before, after, 1):
                        failures.append(f"Source differs beyond the exact comment replacement: {path}")
                    if (sha256(lean_code(current)) != exception["lean_code_sha256"] or
                            lean_code(current) != lean_code(tested)):
                        failures.append(f"Lean code differs from tested commit: {path}")
            pinned[path] = current
    clean = subprocess.run(["git", "diff", "--quiet", "--", *pinned], cwd=root)
    if clean.returncode:
        failures.append("Pinned sources have unstaged changes or Git could not check them")
    closure = set()
    todo = list(record["endpoint_roots"])
    while todo:
        module = todo.pop()
        path = module.replace(".", "/") + ".lean"
        if path in closure:
            continue
        if path not in pinned:
            failures.append(f"Unpinned local import: {path}")
            continue
        closure.add(path)
        todo.extend(imports(pinned[path]))
    if closure != set(record["endpoint_closure_sha256"]):
        failures.append("Endpoint closure membership changed")
    for name, expected in record["archived_artifact_sha256"].items():
        if sha256((receipt.parent / name).read_bytes()) != expected:
            failures.append(f"Archived artifact hash mismatch: {name}")
    if sha256(Path(__file__).read_bytes()) != record["scope_verifier_sha256"]:
        failures.append("Scope verifier hash mismatch")
    historical_audit = subprocess.check_output(
        ["git", "show", f"{commit}:scripts/check_axioms.py"], cwd=root).decode()
    audit = subprocess.run([sys.executable, "-B", "-I", "-c", historical_audit],
                           input=(receipt.parent / "CI_AXIOMS.log").read_bytes(),
                           capture_output=True, cwd=root)
    if audit.returncode:
        failures.append("Archived report failed the tested commit's axiom checker: " +
                        audit.stdout.decode() + audit.stderr.decode())
    if failures:
        raise SystemExit("\n".join(failures))
    print(json.dumps({"status": "PASS_PINNED_ENDPOINT_SCOPE", "run_id": record["run_id"],
                      "source_commit": commit, "local_import_files": len(closure),
                      "comment_only_exceptions": list(record["comment_only_exceptions"]),
                      "current_source_method": "direct reads and Git clean-tree guard" if args.direct_reads else
                      "active index blobs and Git clean-tree guard",
                      "historical_axiom_checker": audit.stdout.decode().strip(),
                      "combined_current_root_ci": "NOT ESTABLISHED BY THIS RECEIPT"}, indent=2))


if __name__ == "__main__":
    main()
