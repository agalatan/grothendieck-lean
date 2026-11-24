#!/usr/bin/env python3
"""Check that the documents quote the bounds that Lean states.

The two bounds are read from the Lean sources: the theorem `main_bounds` in Grothe/MainResult.lean and the
definition `LowerTarget` in Grothe/Statement.lean. The script then checks that

* the two Lean statements agree with each other;
* every document of QUOTING states the bounds asked of it, in decimal form;
* docs/CONSTANTS.md also states both exact rationals as Lean writes them;
* in the Lean files that state the theorems, every `IsBound (N / D)` is the upper bound, every `LowerAbove (N / D)`
  the lower bound, and main_bounds_refined rounds constant_le_exact upward. Elsewhere the original role checks apply;
* no document of STRICT mentions a number of RETIRED (an older bound that readers must not take for the current one).

Usage: python3 scripts/check_constants.py [--root DIR] [--print]
Exit status 0 iff every check passes. `--print` only prints the bounds read from Lean.
"""
import argparse
import re
import sys
from fractions import Fraction
from math import ceil
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
    # the docstrings of the Lean files that state the theorems
    "Grothe/Statement.lean": ("lower",),
    "Grothe/MainResult.lean": BOTH,
    "Grothe/UpperResult.lean": ("upper",),
}
# The Lean files that state the theorems. In them (code and docstrings alike, whitespace and line breaks ignored):
# every `IsBound (N / D)` must be the upper bound, every `LowerAbove (N / D)` the lower bound, and no other rational
# of the form 14…/10^k may be quoted at all.
LEAN_STATEMENT_FILES = ["Grothe/Statement.lean", "Grothe/MainResult.lean", "Grothe/UpperResult.lean"]
BOUND_RATIONAL = re.compile(r"(?<![\d.])(14\d{3,})\s*/\s*(10{4,})(?!\d)")
ROLE_CLAIM = re.compile(r"\b(IsBound|LowerAbove)\s*\(\s*(\d+)\s*/\s*(\d+)\b")
# documents in which an older bound may not appear at all (elsewhere it may, marked as history)
STRICT = ["README.md", ".claude/skills/lean-grothe/SKILL.md"]
# older lower bounds of this repository
RETIRED = ["1.4018", "1.401700322371"]

TWO_SIDED = (
    r"\(\s*(\d+)\s*/\s*(\d+)\s*:\s*ℝ\s*\)\s*<\s*complexGrothendieckConstant\s*∧\s*"
    r"complexGrothendieckConstant\s*≤\s*(\d+)\s*/\s*(\d+)"
)
MAIN_BOUNDS = re.compile(r"theorem\s+main_bounds\s*:\s*" + TWO_SIDED)
REFINED_BOUNDS = re.compile(r"^\s*theorem\s+main_bounds_refined\s*:\s*" + TWO_SIDED, re.MULTILINE)
EXACT_UPPER = re.compile(
    r"^\s*theorem\s+constant_le_exact\s*:\s*Statement\.complexGrothendieckConstant\s*≤\s*"
    r"\(\s*10\s*:\s*ℝ\s*\)\s*\^\s*(\d+)\s*/\s*(\d+)", re.MULTILINE
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


def check_refined(root, main, lower, upper, problems):
    """Validate the one supplementary upper endpoint at its declaration, including its rounding."""
    source = root / "Grothe/UpperResult.lean"
    upper_source = source.read_text(encoding="utf-8") if source.is_file() else ""
    if "main_bounds_refined" not in main and "constant_le_exact" not in upper_source:
        constants = root / "docs/CONSTANTS.md"
        if constants.is_file() and "main_bounds_refined" in constants.read_text(encoding="utf-8"):
            problems.append("docs/CONSTANTS.md names a missing main_bounds_refined theorem")
        return None
    refined = REFINED_BOUNDS.search(main)
    exact = EXACT_UPPER.search(upper_source)
    if refined is None or exact is None:
        problems.append("the refined bound needs both main_bounds_refined and constant_le_exact")
        return None
    lo_num, lo_den, num, den = map(int, refined.groups())
    power, exact_den = map(int, exact.groups())
    if min(lo_den, den, exact_den) <= 0:
        problems.append("the refined bound has a zero denominator")
        return None
    endpoint = Fraction(10**power, exact_den)
    if Fraction(lo_num, lo_den) != Fraction(*lower) or not Fraction(*lower) < endpoint:
        problems.append("main_bounds_refined must use LowerTarget below its exact upper bound")
    if num != ceil(endpoint * den) or Fraction(num, den) >= Fraction(*upper):
        problems.append("main_bounds_refined must round constant_le_exact upward and improve main_bounds")
    value = decimal(num, den)
    for rel in ("docs/CONSTANTS.md", "docs/LEAN_DETAILS.md", "docs/overview.tex"):
        path = root / rel
        if path.is_file() and not contains_number(path.read_text(encoding="utf-8"), value):
            problems.append(f"{rel}: does not state the refined upper bound {value}")
    return refined.start(3), refined.end(4)


SHARP_LOWER = re.compile(
    r"^\s*theorem\s+lower_bound_sharp\s*:\s*\(\s*(\d+)\s*/\s*(\d+)\s*:\s*ℝ\s*\)"
    r"\s*<\s*complexGrothendieckConstant", re.MULTILINE
)
EXACT_LOWER = re.compile(r"^\s*theorem\s+endpoint_eq\s*:\s*endpoint\s*=\s*(\d+)\s*/\s*(\d+)\s*:=", re.MULTILINE)


def check_sharp_lower(root, main, lower, problems):
    """Validate the strict lower endpoint against its exact Lean fraction."""
    source = root / "Grothe/Lower/Cert/SharpEnvelope.lean"
    if not source.is_file() and "lower_bound_sharp" not in main:
        return set()
    rounded = SHARP_LOWER.search(main)
    exact = EXACT_LOWER.search(source.read_text(encoding="utf-8")) if source.is_file() else None
    if rounded is None or exact is None:
        problems.append("the sharp lower bound needs both lower_bound_sharp and SharpEnvelope.endpoint_eq")
        return set()
    num, den = map(int, rounded.groups())
    p, q = map(int, exact.groups())
    if den == 0 or q == 0:
        problems.append("the sharp lower bound has a zero denominator")
        return set()
    endpoint = Fraction(p, q)
    # For a strict claim the nearest grid point below p/q is (ceil(den*p/q) - 1) / den.
    if not (Fraction(*lower) < Fraction(num, den) < endpoint <= Fraction(num + 1, den)):
        problems.append("lower_bound_sharp must improve LowerTarget and round the exact endpoint strictly downward")
    value = decimal(num, den)
    for rel in ("docs/CONSTANTS.md", "docs/LEAN_DETAILS.md", "docs/overview.tex"):
        path = root / rel
        if not path.is_file():
            continue
        contents = path.read_text(encoding="utf-8")
        if not contains_number(contents, value):
            problems.append(f"{rel}: does not state the sharp lower bound {value}")
        if rel == "docs/CONSTANTS.md" and not re.search(rf"(?<!\d){p}\s*/\s*{q}(?!\d)", contents):
            problems.append(f"{rel}: does not state the exact sharp lower fraction")
    return {(rounded.start(1), rounded.end(2))}


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
    current = {Fraction(*lower), Fraction(*upper)}
    role = {"IsBound": ("upper", Fraction(*upper)), "LowerAbove": ("lower", Fraction(*lower))}
    for rel in LEAN_STATEMENT_FILES:
        path = root / rel
        if not path.is_file():
            continue
        # a line comment that continues a sentence must not hide a wrapped fraction; newlines are kept for line numbers
        text = re.sub(r"\n[ \t]*--[ \t]?", "\n", path.read_text(encoding="utf-8"))

        def line_of(pos):
            return text.count("\n", 0, pos) + 1

        refined_span = check_refined(root, text, lower, upper, problems) if rel == "Grothe/MainResult.lean" else None
        lower_spans = check_sharp_lower(root, text, lower, problems) if rel == "Grothe/MainResult.lean" else set()
        for m in ROLE_CLAIM.finditer(text):  # \s matches line breaks: a wrapped claim is still read
            name, want = role[m[1]]
            if Fraction(int(m[2]), int(m[3])) != want:
                problems.append(
                    f"{rel}:{line_of(m.start())}: {m[1]} ({m[2]} / {m[3]}) is not the {name} bound of main_bounds"
                )
        for m in BOUND_RATIONAL.finditer(text):
            if m.span() == refined_span or m.span() in lower_spans:
                continue
            if Fraction(int(m[1]), int(m[2])) not in current:
                problems.append(f"{rel}:{line_of(m.start())}: quotes {m[1]} / {m[2]}, which is not a current bound")
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
        main_source = (args.root / "Grothe/MainResult.lean").read_text(encoding="utf-8")
        refined = REFINED_BOUNDS.search(main_source)
        refined_lower = SHARP_LOWER.search(main_source)
        if args.print:
            lower, upper = read_bounds(args.root)
            print(f"lower {lower[0]}/{lower[1]} = {decimal(*lower)}")
            print(f"upper {upper[0]}/{upper[1]} = {decimal(*upper)}")
            if refined:
                num, den = int(refined[3]), int(refined[4])
                print(f"refined upper {num}/{den} = {decimal(num, den)}")
            if refined_lower:
                num, den = map(int, refined_lower.groups())
                print(f"sharp lower {num}/{den} = {decimal(num, den)}")
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
    if refined:
        up = decimal(int(refined[3]), int(refined[4]))
    if refined_lower:
        lo = decimal(*map(int, refined_lower.groups()))
    print(f"check_constants: OK, the documents state {lo} < K ≤ {up}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
