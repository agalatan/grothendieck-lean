#!/usr/bin/env python3
r"""Check that the documents quote the bounds that Lean states.

The two bounds are read from the Lean sources: the theorem `main_bounds` in Grothe/MainResult.lean. Each is a
rounding of an exact value that Lean also states: the upper bound of `Grothe.UpperSeven.bound`
(Grothe/UpperResult.lean, `IsBound ((10 : ℝ) ^ p / D)`), and the lower endpoint `endpoint_eq` of the certificate
whose rounding lemma the proof of `main_bounds` uses (`Grothe.Lower.<Name>.rounded_lt`, in
Grothe/Lower/Cert/<Name>.lean; the script does not fix the name). The script checks that

* the upper bound of `main_bounds` is the exact upper value rounded up to its number of decimals, and
  `Grothe.UpperSeven.constant_le` states the same rational;
* the lower bound of `main_bounds` is the exact lower endpoint rounded strictly downward;
* every document of QUOTING states the bounds asked of it, in decimal form;
* docs/CONSTANTS.md also states both rationals as Lean writes them, and both exact values;
* truncated decimal expansions (`1.40…`, `1.40\ldots`) of the exact bounds in the current-bounds sections of the
  documents, and explicit `p / q = 1.40…` rational expansions across QUOTING, match exact integer division;
* in the Lean files that state the theorems, every `IsBound (…)` with a numeric argument is the upper bound (rounded
  or exact), no other rational 14…/10^k is quoted, and every decimal 1.40… is one of the two bounds or a truncation
  of one of the two exact values;
* no document of STRICT mentions a number of RETIRED (an older bound that readers must not take for the current one).

The script reads source text. It is a check of the documents against the statements, and a guard against an
edit that changes a statement without its documents; it is not a proof check. Which lemmas the proof of
`main_bounds` really uses is established by Lean (the build, and `#print axioms` in scratch/Axioms.lean); the
rounding lemma is located by the layout of the proof's source, which Lean does not constrain.

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
    "Grothe/MainResult.lean": BOTH,
    "Grothe/UpperResult.lean": ("upper",),
}
# The Lean files that state the theorems and the definitions. In them (code and docstrings alike, whitespace and
# line breaks ignored) the role checks of `check_lean_file` apply. Grothe/Statement.lean holds no number at all.
LEAN_STATEMENT_FILES = ["Grothe/Statement.lean", "Grothe/MainResult.lean", "Grothe/UpperResult.lean"]
UPPER_FILE = "Grothe/UpperResult.lean"
# the certificate of the lower endpoint: the proof of main_bounds names its rounding lemma
ROUNDING_LEMMA = re.compile(r"\bGrothe\.Lower\.(\w+)\.rounded_lt\b")
BOUND_RATIONAL = re.compile(r"(?<![\d.])(14\d{2,})\s*/\s*(10{3,})(?!\d)")
BOUND_DECIMAL = re.compile(r"(?<![\d.])(1\.40\d+)(…|\.\.\.)?")
DOC_ELLIPSIS_DECIMAL = re.compile(r"(?<![\d.])(1\.40\d+)(…|\.\.\.|\\ldots\b|\\dots\b)")
SUPERSCRIPTS = str.maketrans("⁰¹²³⁴⁵⁶⁷⁸⁹", "0123456789")
_INT_OR_POW10 = r"(?:(?:\(\s*10\s*:\s*ℝ\s*\)|10)\s*\^\s*(?:\{(\d+)\}|(\d+))|10([⁰¹²³⁴⁵⁶⁷⁸⁹]+)|(\d+))"
FRACTION_EQ_DECIMAL = re.compile(
    r"(?<!\d)" + _INT_OR_POW10 + r"\s*/\s*" + _INT_OR_POW10
    + r"[`$\s]*=[`$\s]*(?P<dec>1\.40\d+)(?P<ell>…|\.\.\.|\\ldots\b|\\dots\b)"
)
# prose/table files where bare ellipsis decimals `1.40…` (outside `## Other numbers` in CONSTANTS.md) name current
# bounds or one of the fixed literature / single-channel constants below
CURRENT_EXPANSION_DOCS = (
    "README.md",
    "docs/CONSTANTS.md",
    "docs/LEAN_DETAILS.md",
    "docs/overview.tex",
    ".claude/skills/lean-grothe/SKILL.md",
)
# 1/γ† = 1.404575934663742…, Haagerup's 1987 bound 1.40490913…, and the archived single-channel bound 1.40459939536120707492…
KNOWN_OTHER_EXPANSIONS = ("1.404575934663742", "1.40490913", "1.40459939536120707492")
# the arguments of a claim `IsBound (…)` that starts with a number
ROLE_CLAIM = re.compile(r"\b(IsBound)\s*\(\s*(?=[(\d])")
PLAIN = re.compile(r"(\d+)\s*/\s*(\d+)")
# the exact form of the upper bound: `(10 : ℝ) ^ 27 / D`, in prose also `10 ^ 27 / D` or `10^27 / D`
POWER = re.compile(r"(?:\(\s*10\s*:\s*ℝ\s*\)|10)\s*\^\s*(\d+)\s*/\s*(\d+)")
# documents in which an older bound may not appear at all (elsewhere it may, named as what it is)
STRICT = ["README.md", ".claude/skills/lean-grothe/SKILL.md"]
# older bounds of this repository: the lower bounds 1.4018 (a design target), 1.401700322371, 1.40191,
# 1.4019109461, 1.40191478 and 1.4019156097, and the upper bounds 1.40457588, 1.40455742, 1.40455741 and 1.40455641
RETIRED = ["1.4018", "1.401700322371", "1.40191", "1.4019109461", "1.40191478", "1.4019156097", "1.40457588",
           "1.40455742", "1.40455741", "1.40455641"]

# Each statement is matched whole, from the name to the `:=` of the declaration, in the text without comments: a
# right-hand side such as `N / D + 1` is not a bound that this script understands, and is refused.
RATIONAL = r"(?:\(\s*(\d+)\s*/\s*(\d+)\s*:\s*ℝ\s*\)|(\d+)\s*/\s*(\d+))"
MAIN_BOUNDS = re.compile(
    r"^[ \t]*theorem\s+main_bounds\s*:\s*"
    r"\(\s*(\d+)\s*/\s*(\d+)\s*:\s*ℝ\s*\)\s*<\s*complexGrothendieckConstant\s*∧\s*"
    r"complexGrothendieckConstant\s*≤\s*" + RATIONAL + r"\s*:=",
    re.MULTILINE,
)
EXACT_UPPER = re.compile(
    r"^[ \t]*theorem\s+bound\s*:\s*Statement\.IsBound\s*"
    r"\(\s*\(\s*10\s*:\s*ℝ\s*\)\s*\^\s*(\d+)\s*/\s*(\d+)\s*\)\s*:=",
    re.MULTILINE,
)
CONSTANT_LE = re.compile(
    r"^[ \t]*theorem\s+constant_le\s*:\s*Statement\.complexGrothendieckConstant\s*≤\s*" + RATIONAL + r"\s*:=",
    re.MULTILINE,
)
EXACT_LOWER = re.compile(r"^[ \t]*theorem\s+endpoint_eq\s*:\s*endpoint\s*=\s*(\d+)\s*/\s*(\d+)\s*:=", re.MULTILINE)


def strip_comments(text: str) -> str:
    """Lean source without its comments (`--` to the end of the line, nested `/- … -/`); line breaks are kept."""
    out, i, depth = [], 0, 0
    while i < len(text):
        two = text[i:i + 2]
        if two == "/-":
            depth, i = depth + 1, i + 2
        elif depth and two == "-/":
            depth, i = depth - 1, i + 2
        elif depth:
            if text[i] == "\n":
                out.append("\n")
            i += 1
        elif two == "--":
            while i < len(text) and text[i] != "\n":
                i += 1
        else:
            out.append(text[i])
            i += 1
    return "".join(out)


def lean_code(path: Path) -> str:
    return strip_comments(path.read_text(encoding="utf-8"))


def rational(m, first: int):
    """The (numerator, denominator) matched by RATIONAL, whose four groups start at index `first`."""
    return (int(m[first] or m[first + 2]), int(m[first + 1] or m[first + 3]))


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


def truncated(q: Fraction, digits: int) -> str:
    """The decimal expansion of the positive rational q, cut (not rounded) after `digits` decimals."""
    whole, frac = divmod(q.numerator * 10**digits // q.denominator, 10**digits)
    return f"{whole}.{frac:0{digits}d}"


def read_bounds(root: Path):
    """((lower num, lower den), (upper num, upper den)) from main_bounds."""
    m = MAIN_BOUNDS.search(lean_code(root / "Grothe/MainResult.lean"))
    if not m:
        raise ValueError(
            "Grothe/MainResult.lean: the statement of main_bounds was not recognised (it must read "
            "`(N / D : ℝ) < complexGrothendieckConstant ∧ complexGrothendieckConstant ≤ N' / D' :=`, nothing more)"
        )
    lower, upper = (int(m[1]), int(m[2])), rational(m, 3)
    if lower[1] == 0 or upper[1] == 0:
        raise ValueError("Grothe/MainResult.lean: main_bounds has a zero denominator")
    return lower, upper


def proof_body(code: str, m) -> str:
    """The proof of the declaration matched by `m` (a match that ends at its `:=`), in comment-free source: the rest
    of the `:=` line and the following lines that are indented more than the declaration. A bare `by` at any
    indentation directly after the `:=` belongs to the proof. The first other line that is not indented more than
    the declaration ends it, whatever it starts with.

    This is a reading of the source layout, not of the proof term: Lean accepts a further command indented under
    the proof, and such a command would be read as part of it. The dependency of `main_bounds` on its lemmas is
    what `#print axioms` and the build establish; this function only finds which certificate to compare with."""
    indent = len(re.match(r"[ \t]*", m.group(0))[0].expandtabs())
    first, _, tail = code[m.end():].partition("\n")
    body, started = [first], bool(first.strip())
    for line in tail.split("\n"):
        if not line.strip():
            continue
        if not started and line.strip() == "by":
            started = True
            continue
        if len(line.expandtabs()) - len(line.expandtabs().lstrip()) <= indent:
            break
        started = True
        body.append(line)
    return "\n".join(body)


def endpoint_file(root: Path):
    """The module (relative path) of the lower endpoint that main_bounds rounds, or None if it is not recognised.

    The rounding lemma is looked for in the source text of the proof of main_bounds (`proof_body`, a layout
    heuristic)."""
    main = lean_code(root / "Grothe/MainResult.lean")
    m = MAIN_BOUNDS.search(main)
    if not m:
        return None
    names = set(ROUNDING_LEMMA.findall(proof_body(main, m)))
    return f"Grothe/Lower/Cert/{names.pop()}.lean" if len(names) == 1 else None


def read_exact(root: Path):
    """(exact upper (power, denominator), exact lower endpoint (p, q)); None for a value that Lean does not state."""
    upper = lower = None
    path = root / UPPER_FILE
    if path.is_file():
        m = EXACT_UPPER.search(lean_code(path))
        if m and int(m[2]) != 0:
            upper = (int(m[1]), int(m[2]))
    rel = endpoint_file(root)
    if rel and (root / rel).is_file():
        m = EXACT_LOWER.search(lean_code(root / rel))
        if m and int(m[2]) != 0:
            lower = (int(m[1]), int(m[2]))
    return upper, lower


def contains_number(text: str, number: str) -> bool:
    """`number` occurs in `text` as a whole decimal (not as a prefix of a longer one)."""
    return re.search(r"(?<![\d.])" + re.escape(number) + r"(?!\d)", text) is not None


def check_rounding(root, lower, upper, exact_upper, exact_lower, problems):
    """The two bounds of main_bounds are the outward roundings of the exact values, and constant_le agrees."""
    if exact_upper is None:
        problems.append(f"{UPPER_FILE}: the exact upper bound `theorem bound : Statement.IsBound ((10 : ℝ) ^ p / D) :=` "
                        "was not recognised")
    else:
        if upper[0] != ceil(Fraction(10 ** exact_upper[0], exact_upper[1]) * upper[1]):
            problems.append(
                f"Grothe/MainResult.lean: the upper bound {upper[0]} / {upper[1]} of main_bounds is not the exact "
                f"bound 10^{exact_upper[0]} / {exact_upper[1]} rounded up"
            )
    path = root / UPPER_FILE
    m = CONSTANT_LE.search(lean_code(path)) if path.is_file() else None
    if m is None:
        problems.append(f"{UPPER_FILE}: the statement of constant_le was not recognised (it must read "
                        "`Statement.complexGrothendieckConstant ≤ N / D :=`, nothing more)")
    elif rational(m, 1) != upper:
        num, den = rational(m, 1)
        problems.append(f"{UPPER_FILE}: constant_le states {num} / {den}, main_bounds {upper[0]} / {upper[1]}")
    if exact_lower is None:
        rel = endpoint_file(root)
        problems.append(
            f"{rel}: the exact lower endpoint `theorem endpoint_eq : endpoint = p / q` was not recognised" if rel
            else "Grothe/MainResult.lean: the proof of main_bounds must use exactly one rounding lemma "
            "`Grothe.Lower.<Name>.rounded_lt`, of the certificate Grothe/Lower/Cert/<Name>.lean of its lower endpoint"
        )
    else:
        endpoint = Fraction(*exact_lower)
        # For a strict claim the nearest grid point below p/q is (ceil(den * p/q) - 1) / den.
        if not Fraction(*lower) < endpoint <= Fraction(lower[0] + 1, lower[1]):
            problems.append(
                f"Grothe/MainResult.lean: the lower bound {lower[0]} / {lower[1]} of main_bounds is not the exact "
                "endpoint (endpoint_eq) rounded strictly downward"
            )


def check_constants_page(root, lower, upper, exact_upper, exact_lower, problems):
    """docs/CONSTANTS.md states the two rationals of main_bounds and the two exact values."""
    constants = root / "docs/CONSTANTS.md"
    if not constants.is_file():
        return
    text = re.sub(r"\s+", "", constants.read_text(encoding="utf-8"))
    for name, (num, den) in (("lower", lower), ("upper", upper)):
        if re.search(rf"(?<!\d){num}/{den}(?!\d)", text) is None:
            problems.append(f"docs/CONSTANTS.md: does not state the exact {name} rational {num} / {den}")
    if exact_upper is not None:
        power, den = exact_upper
        # A typo in a long denominator can leave the rounded bound unchanged: ask for the full fraction.
        numerator = rf"10\^(?:\{{{power}\}}|{power}(?!\d))"
        if re.search(rf"(?<!\d)(?:{numerator}/{den}(?!\d)|\\frac\{{{numerator}\}}\{{{den}\}})", text) is None:
            problems.append("docs/CONSTANTS.md: does not state the exact upper bound of Grothe.UpperSeven.bound")
    if exact_lower is not None:
        p, q = exact_lower
        if re.search(rf"(?<!\d){p}/{q}(?!\d)", text) is None:
            problems.append("docs/CONSTANTS.md: does not state the exact lower endpoint (endpoint_eq)")


def int_or_pow10(m, first: int) -> int:
    """The integer matched by _INT_OR_POW10, whose four groups start at index `first`."""
    if m[first] or m[first + 1]:
        return 10 ** int(m[first] or m[first + 1])
    if m[first + 2]:
        return 10 ** int(m[first + 2].translate(SUPERSCRIPTS))
    return int(m[first + 3])


def check_displayed_expansions(rel, text, exact_upper, exact_lower, problems):
    """Truncated `1.40…` expansions in non-Lean documents match exact integer division."""
    def line_of(pos):
        return text.count("\n", 0, pos) + 1

    checked = set()
    for m in FRACTION_EQ_DECIMAL.finditer(text):
        num, den = int_or_pow10(m, 1), int_or_pow10(m, 5)
        if den == 0:
            continue
        checked.add(m.start("dec"))
        digits = len(m["dec"]) - 2
        want = truncated(Fraction(num, den), digits)
        if m["dec"] != want:
            problems.append(
                f"{rel}:{line_of(m.start('dec'))}: {num}/{den} starts {want}…, not {m['dec']}{m['ell']}"
            )
    if rel not in CURRENT_EXPANSION_DOCS:
        return
    exact = [
        q for q in (
            Fraction(10 ** exact_upper[0], exact_upper[1]) if exact_upper else None,
            Fraction(*exact_lower) if exact_lower else None,
        )
        if q is not None
    ]
    current_text = text.split("\n## Other numbers", 1)[0] if rel == "docs/CONSTANTS.md" else text
    for m in DOC_ELLIPSIS_DECIMAL.finditer(current_text):
        if m.start(1) in checked:
            continue
        digits = len(m[1]) - 2
        if any(truncated(q, digits) == m[1] for q in exact):
            continue
        if any(other.startswith(m[1]) for other in KNOWN_OTHER_EXPANSIONS):
            continue
        problems.append(
            f"{rel}:{line_of(m.start(1))}: quotes {m[1]}{m[2]}, which is not a truncation of an exact bound"
        )


def check_lean_file(rel, text, lower, upper, exact_upper, exact_lower, problems):
    """Role checks of one Lean statement file."""
    # a line comment that continues a sentence must not hide a wrapped fraction; newlines are kept for line numbers
    text = re.sub(r"\n[ \t]*--[ \t]?", "\n", text)

    def line_of(pos):
        return text.count("\n", 0, pos) + 1

    lo, up = Fraction(*lower), Fraction(*upper)
    exact_up = Fraction(10 ** exact_upper[0], exact_upper[1]) if exact_upper else None
    for m in ROLE_CLAIM.finditer(text):  # \s matches line breaks: a wrapped claim is still read
        rest = text[m.end():]
        power, plain = POWER.match(rest), PLAIN.match(rest)
        if m[1] == "IsBound" and power:
            shown = f"IsBound (10 ^ {power[1]} / {power[2]})"
            ok = int(power[2]) != 0 and Fraction(10 ** int(power[1]), int(power[2])) == exact_up
            what = "the exact upper bound of Grothe.UpperSeven.bound"
        elif plain:
            shown = f"IsBound ({plain[1]} / {plain[2]})"
            ok = int(plain[2]) != 0 and Fraction(int(plain[1]), int(plain[2])) == up
            what = "the upper bound of main_bounds"
        else:
            problems.append(f"{rel}:{line_of(m.start())}: the numeric argument of {m[1]} was not recognised")
            continue
        if not ok:
            problems.append(f"{rel}:{line_of(m.start())}: {shown} is not {what}")
    for m in BOUND_RATIONAL.finditer(text):
        if Fraction(int(m[1]), int(m[2])) not in (lo, up):
            problems.append(f"{rel}:{line_of(m.start())}: quotes {m[1]} / {m[2]}, which is not a current bound")
    exact = [q for q in (exact_up, Fraction(*exact_lower) if exact_lower else None) if q is not None]
    current = (decimal(*lower), decimal(*upper))
    for m in BOUND_DECIMAL.finditer(text):
        digits = len(m[1]) - 2
        if m[1] in current or (m[2] and any(truncated(q, digits) == m[1] for q in exact)):
            continue
        problems.append(
            f"{rel}:{line_of(m.start())}: quotes {m[1]}{m[2] or ''}, which is neither a current bound nor a "
            "truncation (with an ellipsis) of an exact value"
        )


def check(root: Path):
    """The list of problems found (empty iff everything agrees)."""
    lower, upper = read_bounds(root)
    exact_upper, exact_lower = read_exact(root)
    lo, up = decimal(*lower), decimal(*upper)
    problems = []
    check_rounding(root, lower, upper, exact_upper, exact_lower, problems)
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
        if not rel.endswith(".lean"):
            check_displayed_expansions(rel, text, exact_upper, exact_lower, problems)
    check_constants_page(root, lower, upper, exact_upper, exact_lower, problems)
    for rel in LEAN_STATEMENT_FILES:
        path = root / rel
        if path.is_file():
            check_lean_file(rel, path.read_text(encoding="utf-8"), lower, upper, exact_upper, exact_lower, problems)
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
            exact_upper, exact_lower = read_exact(args.root)
            print(f"lower {lower[0]}/{lower[1]} = {decimal(*lower)}")
            print(f"upper {upper[0]}/{upper[1]} = {decimal(*upper)}")
            if exact_lower:
                print(f"exact lower endpoint {exact_lower[0]}/{exact_lower[1]} = "
                      f"{truncated(Fraction(*exact_lower), 18)}…")
            if exact_upper:
                value = Fraction(10 ** exact_upper[0], exact_upper[1])
                print(f"exact upper bound 10^{exact_upper[0]}/{exact_upper[1]} = {truncated(value, 18)}…")
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
    print(f"check_constants: OK, Lean and the documents state {lo} < K ≤ {up}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
