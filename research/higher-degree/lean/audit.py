"""Check the optional QuinticResearch axiom report against the repository trust policy."""

from pathlib import Path
import subprocess
import sys

PACKAGE = Path(__file__).resolve().parent
sys.path.insert(0, str(PACKAGE.parents[2] / "scripts"))
from check_axioms import NATIVE, STANDARD, parse_reports


def main():
    result = subprocess.run(
        ["lake", "env", "lean", "Axioms.lean"], cwd=PACKAGE, text=True, stdout=subprocess.PIPE
    )
    if result.returncode:
        print(result.stdout, file=sys.stderr)
        return 1
    try:
        reports = parse_reports(result.stdout)
    except ValueError as error:
        print(error, file=sys.stderr)
        return 1
    expected = [
        line.removeprefix("#print axioms ")
        for line in (PACKAGE / "Axioms.lean").read_text().splitlines()
        if line.startswith("#print axioms ")
    ]
    if [name for name, _ in reports] != expected or len(set(expected)) != len(expected):
        print("The audit must report each requested theorem exactly once, in source order.", file=sys.stderr)
        return 1
    inherited = set()
    for name, axioms in reports:
        unexpected = set(axioms) - STANDARD - NATIVE
        if unexpected:
            print(f"{name} uses unregistered axioms: {sorted(unexpected)}", file=sys.stderr)
            return 1
        inherited.update(set(axioms) & NATIVE)
    print(f"Checked {len(reports)} research declarations; {len(inherited)} registered native dependencies.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
