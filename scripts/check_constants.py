#!/usr/bin/env python3
"""Check that the documents quote the bounds that Lean states.

The two bounds are read from the Lean sources: the theorem `main_bounds` in Grothe/MainResult.lean and the
definition `LowerTarget` in Grothe/Statement.lean. The script then checks that

* the two Lean statements agree with each other;
* every document of QUOTING states the bounds asked of it, in decimal form;
* docs/CONSTANTS.md also states both exact rationals as Lean writes them;
* in the Lean files that state the theorems, every `IsBound (N / D)` is the upper bound, every `LowerAbove (N / D)`
  the lower bound, and supplementary lower and upper endpoints round their exact theorems outward. Elsewhere the original role checks apply;
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
RETIRED = ["1.40191", "1.4018", "1.401700322371"]

TWO_SIDED = (
    r"\(\s*(\d+)\s*/\s*(\d+)\s*:\s*ℝ\s*\)\s*<\s*complexGrothendieckConstant\s*∧\s*"
    r"complexGrothendieckConstant\s*≤\s*(\d+)\s*/\s*(\d+)"
)
MAIN_BOUNDS = re.compile(r"theorem\s+main_bounds\s*:\s*" + TWO_SIDED)
SUPPLEMENTARY = (
    ("main_bounds_refined", "constant_le_exact"),
    ("main_bounds_phase", "constant_le_phase"),
)


def combined_statement(name):
    return re.compile(r"^\s*theorem\s+" + re.escape(name) + r"\s*:\s*" + TWO_SIDED, re.MULTILINE)


def upper_statement(name):
    return re.compile(
        r"^\s*theorem\s+" + re.escape(name) + r"\s*:\s*Statement\.complexGrothendieckConstant\s*≤\s*"
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


def check_supplementary(root, main, lower, upper, problems):
    """Check each named endpoint against its exact proof and the preceding bound."""
    source = root / "Grothe/UpperResult.lean"
    upper_source = source.read_text(encoding="utf-8") if source.is_file() else ""
    documents = {}
    for rel in ("docs/CONSTANTS.md", "docs/LEAN_DETAILS.md", "docs/overview.tex"):
        path = root / rel
        if path.is_file():
            documents[rel] = path.read_text(encoding="utf-8")

    spans = set()
    previous_rounded = previous_exact = Fraction(*upper)
    for combined_name, exact_name in SUPPLEMENTARY:
        if combined_name not in main and exact_name not in upper_source:
            if combined_name in documents.get("docs/CONSTANTS.md", ""):
                problems.append(f"docs/CONSTANTS.md names a missing {combined_name} theorem")
            continue
        combined = combined_statement(combined_name).search(main)
        exact = upper_statement(exact_name).search(upper_source)
        if combined is None or exact is None:
            problems.append(f"the supplementary bound needs both {combined_name} and {exact_name}")
            continue
        lo_num, lo_den, num, den = map(int, combined.groups())
        power, exact_den = map(int, exact.groups())
        if min(lo_den, den, exact_den) <= 0:
            problems.append(f"{combined_name} has a zero denominator")
            continue
        endpoint = Fraction(10**power, exact_den)
        rounded = Fraction(num, den)
        if Fraction(lo_num, lo_den) != Fraction(*lower) or not Fraction(*lower) < endpoint:
            problems.append(f"{combined_name} must use LowerTarget below its exact upper bound")
        if num != ceil(endpoint * den) or rounded >= previous_rounded or endpoint >= previous_exact:
            problems.append(f"{combined_name} must round {exact_name} upward and improve the preceding bound")
        # The rounded headline can stay the same after a typo in a long denominator.
        # Check the full fraction in the canonical constants table as well.
        numerator = rf"10\^(?:\{{{power}\}}|{power}(?!\d))"
        exact_text = re.sub(r"\s+", "", documents.get("docs/CONSTANTS.md", ""))
        exact_fraction = rf"(?<!\d)(?:{numerator}/{exact_den}(?!\d)|\\frac\{{{numerator}\}}\{{{exact_den}\}})"
        if "docs/CONSTANTS.md" in documents and re.search(exact_fraction, exact_text) is None:
            problems.append(f"docs/CONSTANTS.md: does not state the exact {exact_name} fraction")
        value = decimal(num, den)
        for rel, contents in documents.items():
            if not contains_number(contents, value):
                problems.append(f"{rel}: does not state the supplementary upper bound {value}")
        spans.add((combined.start(3), combined.end(4)))
        previous_rounded, previous_exact = rounded, endpoint
    return spans


LOWER_REFINEMENTS = (
    ("sharp", "lower_bound_sharp", "SharpEnvelope"),
    ("shared-gate", "lower_bound_shared_gate", "SharedGate"),
)
EXACT_LOWER = re.compile(r"^\s*theorem\s+endpoint_eq\s*:\s*endpoint\s*=\s*(\d+)\s*/\s*(\d+)\s*:=", re.MULTILINE)


def rounded_lower(main, theorem):
    return re.search(
        rf"^\s*theorem\s+{theorem}\s*:\s*\(\s*(\d+)\s*/\s*(\d+)\s*:\s*ℝ\s*\)"
        r"\s*<\s*complexGrothendieckConstant", main, re.MULTILINE
    )


def checked_lower_spans(root, main, lower, problems):
    """Check each strict lower bound against its own exact fraction and its predecessor."""
    # `SharpEnvelope` and `SharedGate` refine the scalar-row 1.40191 lower certificate; once
    # `LowerTarget` advances past them (e.g. to 1.402 via antiholomorphic Stein rows), still verify
    # their own monotone chain above 1.40191 and their strict downward rounding.
    floor = min(Fraction(*lower), Fraction(140191, 100000))
    spans = set()
    for name, theorem, module in LOWER_REFINEMENTS:
        source = root / f"Grothe/Lower/Cert/{module}.lean"
        if not source.is_file() and theorem not in main:
            continue
        rounded = rounded_lower(main, theorem)
        exact = EXACT_LOWER.search(source.read_text(encoding="utf-8")) if source.is_file() else None
        if rounded is None or exact is None:
            problems.append(f"the {name} lower bound needs both {theorem} and {module}.endpoint_eq")
            continue
        num, den = map(int, rounded.groups())
        p, q = map(int, exact.groups())
        if den == 0 or q == 0:
            problems.append(f"the {name} lower bound has a zero denominator")
            continue
        endpoint = Fraction(p, q)
        if not (floor < Fraction(num, den) < endpoint <= Fraction(num + 1, den)):
            problems.append(f"{theorem} must improve the preceding bound and round its exact endpoint strictly downward")
        floor = max(floor, endpoint)
        spans.add((rounded.start(1), rounded.end(2)))
        value = decimal(num, den)
        for rel in ("docs/CONSTANTS.md", "docs/LEAN_DETAILS.md", "docs/overview.tex"):
            path = root / rel
            if not path.is_file():
                continue
            contents = path.read_text(encoding="utf-8")
            if not contains_number(contents, value):
                problems.append(f"{rel}: does not state the {name} lower bound {value}")
            if rel == "docs/CONSTANTS.md" and not re.search(rf"(?<!\d){p}\s*/\s*{q}(?!\d)", contents):
                problems.append(f"{rel}: does not state the exact {name} lower fraction")
    return spans


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

        supplementary_spans = set()
        if rel == "Grothe/MainResult.lean":
            supplementary_spans = check_supplementary(root, text, lower, upper, problems)
            supplementary_spans.update(checked_lower_spans(root, text, lower, problems))
        for m in ROLE_CLAIM.finditer(text):  # \s matches line breaks: a wrapped claim is still read
            name, want = role[m[1]]
            if Fraction(int(m[2]), int(m[3])) != want:
                problems.append(
                    f"{rel}:{line_of(m.start())}: {m[1]} ({m[2]} / {m[3]}) is not the {name} bound of main_bounds"
                )
        for m in BOUND_RATIONAL.finditer(text):
            if m.span() in supplementary_spans:
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
        text = (args.root / "Grothe/MainResult.lean").read_text(encoding="utf-8")
        supplementary = []
        for combined_name, _ in SUPPLEMENTARY:
            matched = combined_statement(combined_name).search(text)
            if matched:
                supplementary.append((combined_name, int(matched[3]), int(matched[4])))
        lower_values = [(name, rounded) for name, theorem, _ in LOWER_REFINEMENTS
                        if (rounded := rounded_lower(text, theorem))]
        if args.print:
            lower, upper = read_bounds(args.root)
            print(f"lower {lower[0]}/{lower[1]} = {decimal(*lower)}")
            print(f"upper {upper[0]}/{upper[1]} = {decimal(*upper)}")
            for combined_name, num, den in supplementary:
                label = combined_name.removeprefix("main_bounds_")
                print(f"{label} upper {num}/{den} = {decimal(num, den)}")
            for name, rounded in lower_values:
                num, den = map(int, rounded.groups())
                print(f"{name} lower {num}/{den} = {decimal(num, den)}")
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
    if supplementary:
        _, num, den = supplementary[-1]
        up = decimal(num, den)
    if lower_values:
        ref_num, ref_den = map(int, lower_values[-1][1].groups())
        if Fraction(ref_num, ref_den) > Fraction(lo):
            lo = decimal(ref_num, ref_den)
    print(f"check_constants: OK, the documented strongest interval is {lo} < K ≤ {up}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
