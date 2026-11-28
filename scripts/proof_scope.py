"""Select the proof check for the checked-out tree. Agent-ID: codex-062a."""
import json
import os
from pathlib import Path
import re
import subprocess


HEAVY_PATHS = """
Grothe/UpperChaos Grothe/Upper GrotheKernel GrotheCapsKernel
lakefile.toml lake-manifest.json lean-toolchain
""".split()

# These steps only execute for a real proof build. A successful workflow (and
# even a successful "build" job) may have skipped all the proof steps.
PROOF_STEPS = {
    "Build Grothe (everything, node caps included)",
    "Axiom report",
}
# The full-build batch (#787) renames the upper audit when it moves its sources.
UPPER_REPORT_NAMES = {"Six-channel upper axiom report", "Upper axiom report"}


def git(*args):
    return subprocess.check_output(["git", *args], text=True).strip()


def git_test(*args):
    result = subprocess.run(["git", *args], check=False)
    if result.returncode not in (0, 1):
        result.check_returncode()
    return result.returncode == 0


def lean_changed(base):
    # Keep both sides of renames and treat unusual file names literally.
    files = subprocess.check_output(["git", "diff", "--name-only", "--no-renames", "-z", base, "HEAD"])
    pattern = re.compile(os.environ["LEAN_PATHS"])
    paths = [os.fsdecode(p) for p in files.split(b"\0") if p]
    print(f"Changed files relative to {base}:")
    for path in paths:
        print(f"  {path!r}")
    return any(pattern.search(path) for path in paths)


def heavy_changed(base):
    # Only modification/deletion of an existing heavy source needs extra RAM.
    return not git_test("diff", "--quiet", "--no-renames", "--diff-filter=a",
                        base, "HEAD", "--", *HEAVY_PATHS)


def api(endpoint):
    return json.loads(subprocess.check_output(["gh", "api", endpoint], text=True))


def staging_proof(sha):
    repo = os.environ["GITHUB_REPOSITORY"]
    actions = f"repos/{repo}/actions"
    try:
        result = api(f"{actions}/workflows/lean.yml/runs?branch=staging&event=push"
                     f"&head_sha={sha}&per_page=1")
        for run in result["workflow_runs"]:
            if (run["head_sha"] != sha or run["head_branch"] != "staging"
                    or run["event"] != "push" or run["conclusion"] != "success"
                    or run["head_repository"]["full_name"] != repo):
                continue
            jobs = api(f"{actions}/runs/{run['id']}/attempts/{run['run_attempt']}/jobs?per_page=100")
            for job in jobs["jobs"]:
                if job["name"] == "build" and job["conclusion"] == "success":
                    passed = {s["name"] for s in job["steps"] if s["conclusion"] == "success"}
                    if PROOF_STEPS <= passed and passed & UPPER_REPORT_NAMES:
                        return run["html_url"]
    except (OSError, subprocess.CalledProcessError, ValueError, KeyError, TypeError) as exc:
        print(f"Could not verify the staging proof for {sha}: {exc}")
    return None


def proof_scope(branch, *, land=False, pinned_master="", before="", mode="check"):
    master = "refs/remotes/origin/master"
    staging = "refs/remotes/origin/staging"
    if mode == "caps":
        return True, True
    if land:
        base = pinned_master  # route already checked out the reconstructed merge
    elif branch == "master":
        base = before
    else:
        base = git("merge-base", master, "HEAD")
        if base == git("rev-parse", "HEAD"):
            print("Already contained in master.")
            return False, False

    if not base or subprocess.run(["git", "cat-file", "-e", f"{base}^{{commit}}"],
                                  stderr=subprocess.DEVNULL).returncode:
        print("No usable base; full check.")
        return True, True

    # The staging branch itself keeps its check against master. During a
    # freeze, topic branches can fork from an earlier staging commit.
    if not land and branch not in ("master", "staging") and git_test("show-ref", "--verify", "--quiet", staging):
        candidate = git("merge-base", staging, "HEAD")
        if not git_test("merge-base", "--is-ancestor", candidate, master):
            if not lean_changed(candidate):
                run_url = staging_proof(candidate)
                if run_url:
                    message = f"Proof inherited from staging commit `{candidate}`: {run_url}"
                    print(message)
                    if "GITHUB_STEP_SUMMARY" in os.environ:
                        with Path(os.environ["GITHUB_STEP_SUMMARY"]).open("a") as summary:
                            print(message, file=summary)
                    return False, False
            # A revert can match master while changing the staged proof. An
            # unverified baseline must also build even if its delta is docs.
            print(f"Checking this branch against staging commit {candidate}.")
            return True, heavy_changed(base) or heavy_changed(candidate)

    print(f"Checking the proof scope against {base}.")
    return lean_changed(base), heavy_changed(base)


if __name__ == "__main__":
    lean, heavy = proof_scope(os.environ["GITHUB_REF_NAME"], land=os.getenv("LAND") == "true",
                              pinned_master=os.getenv("PINNED_MASTER"), before=os.getenv("BEFORE"),
                              mode=os.getenv("MODE"))
    print(f"Proof check: {lean}; heavy sources changed: {heavy}")
    with Path(os.environ["GITHUB_OUTPUT"]).open("a") as output:
        print(f"lean={str(lean).lower()}", f"heavy={str(heavy).lower()}", sep="\n", file=output)
