"""Reproduce the alternating sums discussed in the article from the ancillary tables.

Run with Python 3. This checks the descriptive figures for channels 0 and 4.
The Lean package independently proves the main theorem.
"""
from fractions import Fraction
from functools import lru_cache
from pathlib import Path
import re

DATA = Path(__file__).resolve().parents[1] / "anc/Grothe/UpperSix/Haagerup/Data/OverlapData.lean"
SCALE = 2**128
HEAD = 250


@lru_cache(maxsize=None)
def binomial_prefixes(a, b, degree):
    """Numerators of prefix sums for (a + b X)^degree, all over (a+b)^degree."""
    term = a**degree
    sums = [term]
    for j in range(min(degree, HEAD)):
        term = term * (degree - j) * b // ((j + 1) * a)
        sums.append(sums[-1] + term)
    return sums


def head_interval(entries, a, b):
    # At X = -1 each entry retains one sign throughout its binomial expansion.
    lower = upper = 0
    for parity, degree, shift, lo, hi in entries:
        if parity % 2:
            lo, hi = -hi, -lo
        prefix = binomial_prefixes(a, b, degree)[min(HEAD - shift, degree)]
        denom = (a + b)**degree
        lower += lo * prefix // denom
        upper -= (-hi * prefix) // denom
    return Fraction(lower, SCALE), Fraction(upper, SCALE)


def check_bounds(label, interval, tail, lower, upper):
    lo, hi = interval
    assert Fraction(lower) < lo - tail <= hi + tail < Fraction(upper), label
    print(f"{label}: ({lower}, {upper})")


def main():
    tiger, *rows = re.split(r"private def tcellRow_(\d+) : RowI", DATA.read_text())
    mu = [(int(lo), int(hi)) for lo, hi in re.findall(r"⟨(-?\d+),\s*(-?\d+)⟩", tiger)]
    assert len(mu) == HEAD + 1
    raw = [(n, 0, n, lo, hi) for n, (lo, hi) in enumerate(mu)]
    check_bounds("Raw tiger head only", head_interval(raw, 1, 0), 0,
                 "0.712901574109", "0.712901574110")
    reflected = [(n, 2*n + 1, n, lo, hi) for n, (lo, hi) in enumerate(mu)]
    check_bounds("Channel 4 including tail", head_interval(reflected, 930767036298, 69232963702),
                 Fraction(3, 10**12), "0.712901282238", "0.712901282245")

    entries = []
    seen = set()
    for row_id, row in zip(rows[::2], rows[1::2]):
        d2 = int(row_id)
        for d1, lo, hi in re.findall(r"\((\d+),\s*⟨(-?\d+),\s*(-?\d+)⟩\)", row):
            d1 = int(d1)
            assert d1 + 3*d2 <= 2*HEAD + 1 and (d1 + d2) % 2 == 1
            seen.add((d1, d2))
            n = (d1 + d2 - 1) // 2
            entries.append((n, d1, n + d2, int(lo), int(hi)))
    assert len(entries) == len(seen) == 21168
    check_bounds("Channel 0 including tail", head_interval(entries, 991, 9),
                 Fraction(50024, 10**12), "0.7119197", "0.7119200")


if __name__ == "__main__":
    main()
