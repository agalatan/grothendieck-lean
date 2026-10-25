#!/usr/bin/env python3
"""Capture the historical successful CI run and its guarded endpoint scope.

Writes only the lower-unshifted and upper-preprocess verification directories.
Requires Git history and authenticated read access through gh. No Lean is built.
"""
from pathlib import Path
import datetime
import hashlib
import importlib.util
import json
import os
import re
import subprocess

ROOT = Path(__file__).resolve().parents[3]
COMMIT = "5f46810672e97231883db052b614c966399512b1"
RUN = 40234828241
spec = importlib.util.spec_from_file_location("scope", Path(__file__).with_name("verify_ci_scope.py"))
scope = importlib.util.module_from_spec(spec)
spec.loader.exec_module(scope)


def command(*args):
    return subprocess.check_output(args, cwd=ROOT)


def blob(ref, path):
    return command("git", "show", f"{ref}:{path}")


def sha(data):
    return hashlib.sha256(data).hexdigest()


def dump(path, value):
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


def main():
    os.setpgrp()
    print("Owned receipt audit process group", os.getpgrp(), flush=True)
    meta = json.loads(command("gh", "run", "view", str(RUN), "--json",
                              "status,conclusion,headSha,url,jobs,createdAt,updatedAt"))
    assert meta["conclusion"] == "success" and meta["headSha"] == COMMIT
    raw = command("gh", "run", "view", str(RUN), "--log").decode("utf-8-sig")
    report = []
    collecting = False
    excerpt = ["# Authentic selected GitHub Actions log lines; timestamps and prefixes retained.",
               f"# Run {RUN}, tested commit {COMMIT}.",
               "# Complete axiom output is separately archived as CI_AXIOMS.log."]
    for line in raw.splitlines():
        fields = line.split("\t", 2)
        if len(fields) == 3 and fields[1] == "Axiom report":
            body = re.sub(r"^\ufeff?\d{4}-\d\d-\d\dT\S+\s?", "", fields[2])
            if body.startswith("'Grothe.fresh_upper' depends on axioms:"):
                collecting = True
            if collecting:
                report.append(body)
            if re.fullmatch(r"checked \d+ theorems; native_decide facts used: \d+ of \d+", body):
                collecting = False
        if (("Build the Lean development" in line and
             ("Built Grothe" in line or "Build completed successfully" in line)) or
                "No sorry, axiom or unchecked" in line or "Node caps (separate target" in line or
                ("Axiom report" in line and "checked 451" in line)):
            excerpt.append(line)
    report = ("\n".join(report) + "\n").encode()
    excerpt = ("\n".join(excerpt) + "\n").encode()
    blocks = re.findall(r"'([^']+)' depends on axioms: \[(.*?)\]", report.decode(), re.S)
    assert len(blocks) == 451
    native = {name: sorted(set(re.findall(
        r"[A-Za-z0-9_]+(?:\.[A-Za-z0-9_]+)*\._native\.native_decide\.ax_1_1", axioms)))
        for name, axioms in blocks}
    assert len({name for values in native.values() for name in values}) == 24
    assert report.endswith(b"checked 451 theorems; native_decide facts used: 24 of 84\n")
    assert b"Build completed successfully (9161 jobs)" in excerpt
    job = meta["jobs"][0]
    for keyword in ["Build the Lean development", "No sorry", "Axiom report", "Node caps"]:
        assert any(s["name"].startswith(keyword) and s["conclusion"] == "success"
                   for s in job["steps"])

    cases = [
        ("lower", "data/lower-unshifted/verification", ["Grothe.Research.RefinedCoverResult"],
         "Grothe.Research.RefinedLowerCheck.lower_bound_of_refined_cover_data"),
        ("upper", "data/upper-preprocess/verification",
         ["Grothe.UpperChaos.PhiBound", "Grothe.UpperChaos.HardyKernel"],
         "Grothe.UpperChaos.fresh_upper_rounder")]
    for side, folder, roots, endpoint in cases:
        directory = ROOT / folder
        closure, exceptions = {}, {}
        todo = list(roots)
        while todo:
            module = todo.pop()
            path = module.replace(".", "/") + ".lean"
            if path in closure:
                continue
            current, tested = blob("", path), blob(COMMIT, path)
            assert (ROOT / path).read_bytes() == current, path
            closure[path] = {"current": sha(current), "tested": sha(tested)}
            if current != tested:
                before = "The current degree-13 preprocessor and its finite-power tail certificate are"
                after = "The current preprocessor and its signed resolvent tail certificate are"
                assert path == "Grothe/Upper/Haagerup.lean"
                assert tested.count(before.encode()) == 1
                assert current == tested.replace(before.encode(), after.encode(), 1), path
                assert scope.lean_code(current) == scope.lean_code(tested), path
                exceptions[path] = {"lean_code_sha256": sha(scope.lean_code(current)),
                                    "tested_comment_fragment": before,
                                    "current_comment_fragment": after,
                                    "scope": "Only a documentation comment changed; both exact byte hashes are pinned."}
            todo.extend(scope.imports(current))
            if len(closure) % 50 == 0:
                print(side, len(closure), "import files", flush=True)
        environment = {}
        for path in ["lakefile.toml", "lake-manifest.json", "lean-toolchain"]:
            current, tested = blob("", path), blob(COMMIT, path)
            assert current == tested, path
            environment[path] = {"current": sha(current), "tested": sha(tested)}
        if side == "lower":
            paths = set(json.loads(blob(COMMIT, "data/lower-unshifted/verification/EXPORT.json"))["source_sha256"])
            paths.add("data/lower-unshifted/cover-ledger.json")
            value = {"B": "356710460411/500000000000", "L": "56067881993/40000000000",
                     "boxes": 10762, "premise": "NodeCaps remains explicit."}
        else:
            paths = {"data/upper-preprocess/certificate.json", "data/upper-preprocess/hardy_result.json",
                     "data/upper-preprocess/inputs/contour_input.json", "data/upper-preprocess/proposal.json",
                     "tools/gen_upper_data.py"}
            value = {"bound": "500000000000000000/355973699864771491",
                     "strict_headline": "1.404598149218",
                     "premises": "ComparisonInputs, energy table accuracy and Hardy input remain explicit."}
        inputs = {}
        for path in sorted(paths - set(closure)):
            current, tested = blob("", path), blob(COMMIT, path)
            assert current == tested, path
            inputs[path] = {"current": sha(current), "tested": sha(tested)}
        subprocess.run(["git", "diff", "--quiet", "--",
                        *sorted(set(closure) | set(environment) | set(inputs))], cwd=ROOT, check=True)
        (directory / "CI_AXIOMS.log").write_bytes(report)
        (directory / "CI_EXCERPT.log").write_bytes(excerpt)
        excluded = {path: {"tested_sha256": sha(blob(COMMIT, path)), "observed_index_stages":
                          command("git", "ls-files", "--stage", "--", path).decode().splitlines()}
                    for path in ["Grothe.lean", "GrotheKernel.lean", "scratch/Axioms.lean",
                                 "scripts/check_axioms.py", ".github/workflows/lean.yml"]}
        gap = blob(COMMIT, f"{folder}/BUILD_GAP.json")
        assert blob("", f"{folder}/BUILD_GAP.json") == gap
        count = len(native[endpoint])
        assert count == (14 if side == "lower" else 3)
        record = {
            "status": "PASS_FULL_CI_FOR_PINNED_ENDPOINT_SCOPE", "run_id": RUN,
            "run_url": meta["url"], "source_commit": COMMIT, "ci_created_utc": meta["createdAt"],
            "ci_completed_utc": meta["updatedAt"], "ci_conclusion": meta["conclusion"],
            "retrieved_utc": datetime.datetime.now(datetime.timezone.utc).isoformat(),
            "job_id": job["databaseId"], "job_url": job["url"], "job_steps": job["steps"],
            "scope": f"Successful full default-target CI at the tested commit; current {side} endpoint import closure and certificate inputs guarded separately below.",
            "observed_head_during_master_integration": command("git", "rev-parse", "HEAD").decode().strip(),
            "new_master_being_integrated": "4e9f32d78a198da551239bbfa9e56e713d765cae",
            "current_source_method": "SHA-256 of active Git index blobs, plus git diff --quiet for every pinned source/input. Verifier --direct-reads additionally hashes working files.",
            "working_tree_endpoint_closure_hashed_directly": True,
            "endpoint": value, "endpoint_roots": roots, "endpoint_theorem": endpoint,
            "endpoint_native_facts": native[endpoint], "endpoint_local_import_file_count": len(closure),
            "endpoint_closure_sha256": dict(sorted(closure.items())), "comment_only_exceptions": exceptions,
            "environment_sha256": environment, "input_sha256": inputs,
            "historical_full_build": {"target": "Grothe (default target; not GrotheCaps)", "jobs": 9161,
                                      "axiom_report_theorems": 451, "unique_native_facts_used": 24,
                                      "allowed_native_facts": 84, "no_lean_warnings": True},
            "caps_scope": "PASS source stamp only: 140 files unchanged from separately verified caps; this run did not rebuild the 60 range facts.",
            "archived_artifact_sha256": {"CI_AXIOMS.log": sha(report), "CI_EXCERPT.log": sha(excerpt)},
            "historical_audit_and_root_files_not_current_coverage": excluded,
            "combined_current_root_ci": {"status": "PENDING_SEPARATE_CI", "reason":
                "New signed-resolvent modules, changed root imports, workflow and enlarged current axiom report require separate combined-tree CI."},
            "scope_verifier": "data/lower-unshifted/verification/verify_ci_scope.py",
            "scope_verifier_sha256": sha(Path(__file__).with_name("verify_ci_scope.py").read_bytes()),
            "historical_targeted_build_gap": {"file": "BUILD_GAP.json", "sha256": sha(gap),
                "superseded_for_unchanged_endpoint_by": "This actual successful full CI. Missing targeted logs were not recovered."}}
        dump(directory / "CI.json", record)
        previous_name = "BUILD_VALIDATION.json" if side == "lower" else "VALIDATION.json"
        previous = json.loads(blob(COMMIT, f"{folder}/{previous_name}"))
        validation = {"status": record["status"], "scope": record["scope"], "source_commit": COMMIT,
                      "run_id": RUN, "run_url": meta["url"], "ci_receipt": "CI.json",
                      "ci_receipt_sha256": sha((directory / "CI.json").read_bytes()),
                      "actual_axiom_report_available": True, "actual_axiom_report_count": 451,
                      "lean_result": "Successful full default-target CI; current endpoint source closure separately guarded against the tested source. The newly merged current root requires separate CI.",
                      "targeted_logs_recovered": False, "historical_targeted_status": previous["status"],
                      "historical_gap": "BUILD_GAP.json", "historical_gap_sha256": sha(gap),
                      "combined_current_root_ci": "PENDING_SEPARATE_CI", "endpoint": value}
        if side == "lower":
            validation["exact_data_checks"] = previous["exact_data_checks"]
        dump(directory / previous_name, validation)
        if side == "upper":
            dump(directory / "BUILD_VALIDATION.json", validation)
        text = f"""The current {side} endpoint has a successful full Lean CI receipt: run [{RUN}]({meta['url']}) at `{COMMIT}`. `CI.json` pins the endpoint import closure, certificate inputs, environment and archived evidence. That run built the default `Grothe` target (9,161 jobs), passed the safety scan, and checked 451 axiom-report entries using 24 of 84 permitted native facts. The {side} endpoint itself uses {count} native facts. Its analytic premises remain explicit.

The current endpoint closure contains {len(closure)} repository Lean files; {len(closure)-len(exceptions)} are byte-identical to the tested commit."""
        if exceptions:
            text += " The sole exception is `Grothe/Upper/Haagerup.lean`: master changed only a documentation comment. Both exact byte hashes and the unchanged comment-stripped Lean-code hash are pinned."
        text += f"""

`CI_AXIOMS.log` contains the actual axiom-report output extracted from GitHub, with Actions timestamps and prefixes removed. `CI_EXCERPT.log` retains authentic selected build/safety/stamp log lines. Their SHA-256 hashes are in `CI.json`. The source guard hashes active index blobs and requires a clean Git working tree for all pinned files. This avoids stalled on-demand reads; `--direct-reads` also hashes every working file directly. The verifier replays the archived report through the tested commit's original axiom checker.

From the repository root:

```sh
python3 -B -I data/lower-unshifted/verification/verify_ci_scope.py {folder}/CI.json
```

`BUILD_GAP.json` remains unchanged historical context: the temporary targeted-build logs are still lost. The successful GitHub run supersedes that missing-receipt status for the guarded endpoint scope; missing logs were not recovered or relabelled. The caps step checked the unchanged 140-file source stamp and did not rebuild the 60 range facts.

**Combined-tree CI is separately pending.** This historical receipt does not cover the newly merged signed-resolvent proof, changed root imports, workflow, or enlarged current axiom report. The receipt records the tested versions and observed Git index stages of those excluded files. A fresh run must validate the merged default target.
"""
        (directory / "README.md").write_text(text)
        print(side, "receipt written:", len(closure), "files,", len(exceptions), "comment exceptions,",
              len(inputs), "inputs", flush=True)


if __name__ == "__main__":
    main()
