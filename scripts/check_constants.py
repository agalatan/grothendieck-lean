#!/usr/bin/env python3
"""Check that the documents quote the bounds that Lean states.

The two bounds are read from the Lean sources: the theorem `main_bounds` in Grothe/MainResult.lean and the
definition `LowerTarget` in Grothe/Statement.lean. The script then checks that

* the two Lean statements agree with each other;
* every document of QUOTING states the bounds asked of it, in decimal form;
* docs/CONSTANTS.md also states both exact rationals as Lean writes them;
* no document of STRICT mentions a number of RETIRED (an older bound that readers must not take for the current one).

Usage: python3 scripts/check_constants.py [--root DIR] [--print]
Exit status 0 iff every check passes. `--print` only prints the bounds read from Lean.
"""
import argparse
import re
import sys
from fractions import Fraction
from pathlib import Path

# documents that state the current bounds, and which of the two each must contain in decimal form
BOTH = ("lower", "upper")
QUOTING = {
    "README.md": BOTH,
    "docs/CONSTANTS.md": BOTH,
    "docs/LEAN_DETAILS.md": BOTH,
    "docs/overview.tex": BOTH,
    "research/README.md": BOTH,
    "research/conjecture-K/README.md": BOTH,
    "research/higher-degree/README.md": BOTH,
    "research/identity-tail/README.md": ("lower",),
    ".claude/skills/lean-grothe/SKILL.md": BOTH,
}
# documents in which an older bound may not appear at all (elsewhere it may, marked as history)
STRICT = ["README.md", ".claude/skills/lean-grothe/SKILL.md"]
# older lower bounds of this repository
RETIRED = ["1.40191", "1.4018", "1.401700322371"]

MAIN_BOUNDS = re.compile(
    r"theorem\s+main_bounds\s*:\s*"
    r"\(\s*(\d+)\s*/\s*(\d+)\s*:\s*ℝ\s*\)\s*<\s*complexGrothendieckConstant\s*∧\s*"
    r"complexGrothendieckConstant\s*≤\s*(\d+)\s*/\s*(\d+)"
)
LOWER_TARGET = re.compile(r"def\s+LowerTarget\s*:\s*Prop\s*:=\s*LowerAbove\s*\(\s*(\d+)\s*/\s*(\d+)\s*\)")


def decimal(num: int, den: int) -> str:
    """The exact decimal expansion of num/den; an error if it does not terminate."""
    q = Fraction(num, den)
    d = q.denominator
    for p in (2, 5):
        while d % p == 0:
            d //= p
    if d != 1:
        raise ValueError(
            f"{num}/{den} has no finite decimal expansion: decide how the documents display it and extend "
            "scripts/check_constants.py"
        )
    digits = 0
    while (q * 10**digits).denominator != 1:
        digits += 1
    scaled = int(q * 10**digits)
    whole, frac = divmod(scaled, 10**digits)
    return f"{whole}.{frac:0{digits}d}" if digits else str(whole)


def read_bounds(root: Path):
    """((lower num, lower den), (upper num, upper den)) from main_bounds, checked against LowerTarget."""
    main = (root / "Grothe/MainResult.lean").read_text(encoding="utf-8")
    m = MAIN_BOUNDS.search(main)
    if not m:
        raise ValueError("Grothe/MainResult.lean: the statement of main_bounds was not recognised")
    lower, upper = (int(m[1]), int(m[2])), (int(m[3]), int(m[4]))
    stmt = (root / "Grothe/Statement.lean").read_text(encoding="utf-8")
    t = LOWER_TARGET.search(stmt)
    if not t:
        raise ValueError("Grothe/Statement.lean: the definition of LowerTarget was not recognised")
    if Fraction(int(t[1]), int(t[2])) != Fraction(*lower):
        raise ValueError(
            f"LowerTarget is {t[1]}/{t[2]} but main_bounds states {lower[0]}/{lower[1]}: the two must agree"
        )
    return lower, upper


def contains_number(text: str, number: str) -> bool:
    """`number` occurs in `text` as a whole decimal (not as a prefix of a longer one)."""
    return re.search(r"(?<![\d.])" + re.escape(number) + r"(?!\d)", text) is not None


def check(root: Path):
    """The list of problems found (empty iff everything agrees)."""
    lower, upper = read_bounds(root)
    lo, up = decimal(*lower), decimal(*upper)
    problems = []
    values = {"lower": lo, "upper": up}
    for rel, wanted in QUOTING.items():
        path = root / rel
        if not path.is_file():
            problems.append(f"{rel}: missing (it is listed in QUOTING)")
            continue
        text = path.read_text(encoding="utf-8")
        for name in wanted:
            if not contains_number(text, values[name]):
                problems.append(f"{rel}: does not state the {name} bound {values[name]}")
    constants = root / "docs/CONSTANTS.md"
    if constants.is_file():
        text = re.sub(r"\s+", "", constants.read_text(encoding="utf-8"))
        for name, (num, den) in (("lower", lower), ("upper", upper)):
            if f"{num}/{den}" not in text:
                problems.append(f"docs/CONSTANTS.md: does not state the exact {name} rational {num} / {den}")
    for rel in STRICT:
        path = root / rel
        if not path.is_file():
            continue
        for lineno, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            for old in RETIRED:
                if old not in (lo, up) and contains_number(line, old):
                    problems.append(f"{rel}:{lineno}: mentions the older bound {old}")
    return (lo, up), problems


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--root", default=Path(__file__).resolve().parent.parent, type=Path)
    parser.add_argument("--print", action="store_true", help="print the bounds read from Lean and stop")
    args = parser.parse_args()
    try:
        if args.print:
            lower, upper = read_bounds(args.root)
            print(f"lower {lower[0]}/{lower[1]} = {decimal(*lower)}")
            print(f"upper {upper[0]}/{upper[1]} = {decimal(*upper)}")
            return 0
        (lo, up), problems = check(args.root)
    except ValueError as err:
        print(f"check_constants: {err}", file=sys.stderr)
        return 1
    for p in problems:
        print(p)
    if problems:
        print(f"check_constants: {len(problems)} problem(s); Lean states {lo} < K ≤ {up}", file=sys.stderr)
        return 1
    print(f"check_constants: OK, the documents state {lo} < K ≤ {up}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
