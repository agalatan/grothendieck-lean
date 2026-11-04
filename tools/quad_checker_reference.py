#!/usr/bin/env python3
"""Reference replay of the conditional coefficients at the row-227 node (issue #303).

Recomputes, in Python's `decimal` module at a chosen precision (mpmath is not installed on the
laptop), the conditional coefficients sign(v)^(c+d) I_cd(A) of the common profile at the
row-227 source node (panel 4 / rule 31 of the original partition, `Grothe/UpperChaos/
ConditionalSourceRow227Shift.lean`), at the pinned midpoint shift A0 = midpoint / 2^1024 of
`Grothe/UpperChaos/OriginalMomentSeedData.lean` (`data/original-moment-seed/
row227-charge-replay.json`), with the same recurrences as the Lean checker `GrotheQuadKernel`:

    J_0(x)   = sum_n (-x)^n (2n)! / (4^n (n!)^3 (n+1))          (x = A0^2)
    S(A)     = (sqrt(pi)/2) A J_0(A^2)                            (common scalar)
    r_h      = (h+1/2) / (h+2+x - x r_{h+1}),  r_H = 1/2           (moment ratios, backward)
    U_{0,d+1} = -A r_d U_{0,d} / sqrt(d+1),  U_{0,0} = 1           (zero row)
    U_{c+1,d} = (A sqrt(d+1) U_{c,d+1} + (d+1-c) U_{c,d}) / (A sqrt(c+1))  (charge recurrence)
    I_{c,d}  = S(A) U_{c,d}

and compares them with
  (a) the saved binary64 row (`--saved-row FILE`: the 35,777-word row227.bin of PR #298,
      SHA-256 85f6792a14d4c198979bfc9ea6c513b765bd76147cc4fe0d0a9566addae48d1c, or the
      committed prefix in data/quad-checker/row227.json), and
  (b) the Lean checker's `#eval` output (`--lean-output FILE`: lines `c d lo hi` as printed by
      `Grothe/UpperQuad/Row227Check.lean`).

The decimal computation is floating (not interval): its accuracy is controlled by `--digits`
(default 400); the comparison reports the maximum absolute difference per total degree band.
Agent-ID: claude-b9ee. Refs #303, #21.
"""
from __future__ import annotations

import argparse
import json
import math
import os
import struct
import sys
from decimal import Decimal, getcontext

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATA = os.path.join(ROOT, "data", "quad-checker", "row227.json")


def pi_decimal() -> Decimal:
    """pi by the Machin formula at the current precision (plus guard digits)."""
    getcontext().prec += 10
    def arctan_inv(n: int) -> Decimal:
        x = Decimal(1) / n
        x2 = x * x
        term = x
        total = Decimal(0)
        k = 0
        eps = Decimal(10) ** -(getcontext().prec)
        while abs(term) > eps:
            total += term / (2 * k + 1)
            term = -term * x2
            k += 1
        return total
    pi = 16 * arctan_inv(5) - 4 * arctan_inv(239)
    getcontext().prec -= 10
    return +pi


def seed_j0(x: Decimal, terms: int) -> Decimal:
    """J_0(x) = sum_n (-x)^n (2n)!/(4^n (n!)^3 (n+1)) through `terms` terms."""
    t = Decimal(1)
    s = Decimal(1)
    for n in range(terms):
        t = t * (-x) * (2 * n + 1) / (2 * (n + 1) * (n + 2))
        s += t
    return s


def ratios(x: Decimal, depth: int, count: int) -> list[Decimal]:
    """r_0..r_{count-1} from r_depth = 1/2 (any value in [0,1] converges)."""
    r = Decimal(1) / 2
    out = [None] * count
    for h in range(depth - 1, -1, -1):
        r = (Decimal(h) + Decimal(1) / 2) / (h + 2 + x - x * r)
        if h < count:
            out[h] = r
    return out


def triangle(A: Decimal, rs: list[Decimal], D: int) -> dict[tuple[int, int], Decimal]:
    """U_{c,d} over c <= d+1, c+d <= D."""
    U: dict[tuple[int, int], Decimal] = {(0, 0): Decimal(1)}
    for d in range(D):
        U[(0, d + 1)] = -A * rs[d] * U[(0, d)] / Decimal(d + 1).sqrt()
    cmax = (D + 1) // 2
    for c in range(cmax):
        den = A * Decimal(c + 1).sqrt()
        for d in range(c, D - c):
            U[(c + 1, d)] = (A * Decimal(d + 1).sqrt() * U[(c, d + 1)] + (d + 1 - c) * U[(c, d)]) / den
    return U


def canonical_pairs(D: int, dmax: int) -> list[tuple[int, int]]:
    out = []
    for m in range(D + 1):
        for c in range(max(0, m - dmax), (m + 1) // 2 + 1):
            out.append((c, m - c))
    return out


def load_saved(path: str, count: int) -> list[float]:
    raw = open(path, "rb").read()
    n = min(len(raw) // 8, count)
    return list(struct.unpack("<%dd" % n, raw[: 8 * n]))


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--digits", type=int, default=400, help="decimal working precision")
    ap.add_argument("--depth", type=int, default=800, help="terminal depth of the ratio recurrence")
    ap.add_argument("--terms", type=int, default=300, help="terms of the J_0 series")
    ap.add_argument("--D", type=int, default=531, help="largest c+d of the recurrence triangle")
    ap.add_argument("--dmax", type=int, default=265, help="largest d of the stored canonical set")
    ap.add_argument("--saved-row", default=None, help="binary64 row file (row227.bin)")
    ap.add_argument("--lean-output", default=None, help="Lean #eval output (lines: c d lo hi)")
    ap.add_argument("--dump", default=None, help="write the reference values (c d value) here")
    args = ap.parse_args()

    getcontext().prec = args.digits
    with open(DATA, encoding="utf-8") as f:
        data = json.load(f)
    A = Decimal(int(data["midpoint"])) / (Decimal(2) ** int(data["scale_log2"]))
    x = A * A
    pi = pi_decimal()
    j0 = seed_j0(x, args.terms)
    S = pi.sqrt() / 2 * A * j0
    rs = ratios(x, args.depth, args.D)
    U = triangle(A, rs, args.D)
    pairs = canonical_pairs(args.D, args.dmax)
    sign = -1 if data.get("profile_negative", False) else 1
    I = {p: S * U[p] * (sign ** (p[0] + p[1])) for p in pairs}
    print(f"A0 = {str(A)[:40]}...  x = A0^2 = {str(x)[:30]}...")
    print(f"J0(x) = {str(j0)[:40]}...  S(A0) = {str(S)[:40]}...")
    print(f"pairs: {len(pairs)}  (D={args.D}, dmax={args.dmax})")
    sumsq = sum(v * v for v in I.values())
    print(f"sum of squares over the canonical set: {str(sumsq)[:25]} (Bessel: <= 1)")
    for p in pairs[:8]:
        print(f"  I[{p[0]},{p[1]}] = {str(I[p])[:30]}")

    if args.dump:
        with open(args.dump, "w", encoding="utf-8") as f:
            for p in pairs:
                f.write(f"{p[0]} {p[1]} {I[p]}\n")

    if args.saved_row:
        saved = load_saved(args.saved_row, len(pairs))
        # the committed JSON prefix is accepted too
        bands = {}
        for i, p in enumerate(pairs[: len(saved)]):
            diff = abs(I[p] - Decimal(saved[i]))
            band = (p[0] + p[1]) // 50
            bands[band] = max(bands.get(band, Decimal(0)), diff)
        print(f"(a) saved row: {len(saved)} words compared; max |reference - saved| per band of c+d:")
        for band in sorted(bands):
            print(f"    c+d in [{50*band},{50*band+49}]: {float(bands[band]):.3e}")
        print(f"    overall max: {float(max(bands.values())):.3e}; "
              f"binary64 half-ulp at 1 is 1.1e-16")
    elif "saved_words_prefix" in data:
        words = data["saved_words_prefix"]
        saved = [struct.unpack("<d", struct.pack("<Q", int(w)))[0] for w in words]
        mx = max(abs(I[p] - Decimal(saved[i])) for i, p in enumerate(pairs[: len(saved)]))
        print(f"(a) committed prefix: {len(saved)} words; max |reference - saved| = {float(mx):.3e}")

    if args.lean_output:
        n = 0
        mx_out = Decimal(0)
        mx_w = Decimal(0)
        bad = 0
        with open(args.lean_output, encoding="utf-8") as f:
            for line in f:
                parts = line.split()
                if len(parts) != 4:
                    continue
                c, d = int(parts[0]), int(parts[1])
                lo, hi = Decimal(parts[2]), Decimal(parts[3])
                v = I[(c, d)]
                n += 1
                mx_w = max(mx_w, hi - lo)
                if v < lo or v > hi:
                    bad += 1
                    mx_out = max(mx_out, max(lo - v, v - hi))
        print(f"(b) Lean enclosures: {n} pairs read; reference outside the enclosure: {bad}; "
              f"max excursion {float(mx_out):.3e}; max width {float(mx_w):.3e}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
