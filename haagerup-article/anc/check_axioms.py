#!/usr/bin/env python3
"""Check the axiom report of the package.

    lake env lean Axioms.lean | python3 check_axioms.py

Reads the output of `Axioms.lean` on standard input (or from the file given as the only argument) and exits with an
error unless

  * there is a report for each of the six public theorems, and for every `#print axioms` line of `Axioms.lean`;
  * every theorem depends only on Lean's standard axioms `propext`, `Classical.choice`, `Quot.sound` and on the
    `native_decide` facts listed in `native.txt`;
  * every fact listed in `native.txt` is used by the main theorem.

Standard library only.
"""
import pathlib
import re
import sys

HERE = pathlib.Path(__file__).resolve().parent
STANDARD = {"propext", "Classical.choice", "Quot.sound"}
PUBLIC = [
    "Haagerup.isBound_cert",
    "Haagerup.certificate_value",
    "Haagerup.isBound",
    "Haagerup.constant_le",
    "Haagerup.inv_gammaDagger_gt",
    "Haagerup.constant_lt_inv_gammaDagger",
]
MAIN = "Haagerup.constant_lt_inv_gammaDagger"


def parse(text):
    """Map each reported theorem to the set of its axioms."""
    flat = " ".join(text.split())
    reports = {}
    for name, body in re.findall(r"'([^']+)' depends on axioms: \[([^\]]*)\]", flat):
        reports[name] = {a.strip() for a in body.split(",") if a.strip()}
    for name in re.findall(r"'([^']+)' does not depend on any axioms", flat):
        reports[name] = set()
    return reports


def main():
    if len(sys.argv) > 2:
        sys.exit(__doc__)
    text = pathlib.Path(sys.argv[1]).read_text() if len(sys.argv) == 2 else sys.stdin.read()
    reports = parse(text)
    native = set((HERE / "native.txt").read_text().split())
    requested = re.findall(r"^#print axioms (\S+)", (HERE / "Axioms.lean").read_text(), re.M)

    errors = []
    for name in PUBLIC:
        if name not in requested:
            errors.append(f"Axioms.lean does not print the axioms of {name}")
    for name in requested:
        if name not in reports:
            errors.append(f"no axiom report for {name}")
    for name in reports:
        if name not in requested:
            errors.append(f"report for {name}, which Axioms.lean does not request")
    for name, axioms in sorted(reports.items()):
        extra = sorted(axioms - STANDARD - native)
        if extra:
            errors.append(f"{name} depends on axioms outside the allowed list: {', '.join(extra)}")
    unused = sorted(native - reports.get(MAIN, set()))
    if unused:
        errors.append(f"listed in native.txt but not used by {MAIN}: {', '.join(unused)}")

    for name in requested:
        if name in reports:
            axioms = reports[name]
            std = sorted(axioms & STANDARD)
            nat = sorted(axioms & native)
            print(f"{name}: {', '.join(std) if std else 'no standard axiom'}"
                  + (f"; native_decide facts: {', '.join(nat)}" if nat else ""))
    if errors:
        sys.exit("AXIOM CHECK FAILED\n" + "\n".join("  " + e for e in errors))
    print(f"axiom check passed: {len(requested)} theorems; standard axioms and the {len(native)} facts of native.txt only")


if __name__ == "__main__":
    main()
