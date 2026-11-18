#!/usr/bin/env python3
"""Exact check of the budget of the six-channel certificate from the generated HeadData.lean (Fractions only).

usage (from anywhere; standard library only, a second or two):

    python3 -I haagerup-article/lean/scripts/check_budget.py [HeadData.lean [channels.json]]

With S = scale, c_i(k) = centre_i[k] / S, r_i = radius_i / S and tau_i = tail_i / S from HeadData.lean, and the
weights w_i of channels.json,

    D_lean = sum_i w_i c_i(0) - sum_{k=1..250} |sum_i w_i c_i(k)| - sum_i w_i r_i - sum_i w_i tau_i.

If (b) sum_{k<=250} |h_i(k) - c_i(k)| <= r_i and (c) sum_{k>250} |h_i(k)| <= tau_i hold for every channel, then
D_lean <= h(0) - sum_{k>=1} |h(k)| for the mixture h = sum_i w_i h_i (ConvexTransfer.cert_margin_of_head_and_tails);
with (a), each h_i dominated, the transfer theorem gives K_G^C <= 1/D_lean. Exit status 0 iff D_lean > 7119595/10^7
(> gamma_dagger, by HaagerupConstant) and 1/D_lean < 14045611/10^7.
"""
import json
import os
import re
import sys
from decimal import Decimal, getcontext
from fractions import Fraction

KH = 250
NCH = 6
GD_UPPER = Fraction(7119595, 10**7)
K_TARGET = Fraction(14045611, 10**7)
HERE = os.path.dirname(os.path.abspath(__file__))
LEAN = os.path.join(HERE, "..", "HaagerupRefutation", "HeadData.lean")
CHANNELS = os.path.join(HERE, "..", "..", "certificate", "channels.json")
getcontext().prec = 40


def dec(q, digits=25):
    """q as a decimal string, rounded to the given number of significant digits (display only)."""
    return format(Decimal(q.numerator) / Decimal(q.denominator), f".{digits}g")


def parse(text):
    def one(pattern):
        found = re.findall(pattern, text, re.S | re.M)
        assert len(found) == 1, (pattern, len(found))
        return found[0]

    scale = int(one(r"^def scale : Nat := (\d+)$"))
    lists = {}
    for i in range(NCH):
        blk = one(r"^def centre" + str(i) + r" : List Int := \[\n([^\]]*)\]")
        blk = re.sub(r"--[^\n]*", "", blk)
        vals = [int(x) for x in blk.replace("\n", " ").split(",")]
        assert len(vals) == KH + 1, (i, len(vals))
        lists[i] = vals
    arms = one(r"^def centre : Fin 6 → List Int\n((?:  \| \d => centre\d\n)+)")
    centre = {int(a): lists[int(b)] for a, b in re.findall(r"  \| (\d) => centre(\d)\n", arms)}
    assert sorted(centre) == list(range(NCH))

    def nat_fun(name):
        arms = one(r"^def " + name + r" : Fin 6 → Nat\n((?:  \| \d => \d+\n)+)")
        f = {int(a): int(b) for a, b in re.findall(r"  \| (\d) => (\d+)\n", arms)}
        assert sorted(f) == list(range(NCH)), name
        return f

    return scale, centre, nat_fun("radius"), nat_fun("tail")


def main():
    lean = sys.argv[1] if len(sys.argv) > 1 else LEAN
    chan_file = sys.argv[2] if len(sys.argv) > 2 else CHANNELS
    S, centre, radius, tail = parse(open(lean, encoding="utf-8").read())
    chans = json.load(open(chan_file))
    assert len(chans) == NCH
    w = [Fraction(c["w"]) for c in chans]
    assert sum(w) == 1 and all(x > 0 for x in w)

    print(f"HeadData: scale S = {S}; channels.json: {NCH} channels, weights sum to 1")
    print(f"{'i':>2} {'kind':6} {'w_i':>14} {'c_i(0)':>18} {'sum_k>=1 |c_i(k)|':>18} {'r_i':>12} {'tau_i':>12}")
    for i, c in enumerate(chans):
        c0 = Fraction(centre[i][0], S)
        l1 = Fraction(sum(abs(x) for x in centre[i][1:]), S)
        print(f"{i:>2} {c['kind']:6} {float(w[i]):14.10f} {float(c0):18.12f} {float(l1):18.10e} "
              f"{float(Fraction(radius[i], S)):12.6e} {float(Fraction(tail[i], S)):12.6e}")

    h0 = sum(w[i] * centre[i][0] for i in range(NCH)) / S
    l1 = sum(abs(sum(w[i] * centre[i][k] for i in range(NCH))) for k in range(1, KH + 1)) / S
    rad = sum(w[i] * radius[i] for i in range(NCH)) / S
    tl = sum(w[i] * tail[i] for i in range(NCH)) / S
    D = h0 - l1 - rad - tl
    print(f"  sum_i w_i c_i(0)                  = {dec(h0, 30)}")
    print(f"  sum_(k=1..250) |sum_i w_i c_i(k)| = {dec(l1)}")
    print(f"  sum_i w_i r_i                     = {dec(rad)}")
    print(f"  sum_i w_i tau_i                   = {dec(tl)}")
    print(f"  D_lean                            = {dec(D, 30)}")
    ok1 = D > GD_UPPER
    ok2 = D > 0 and 1 / D < K_TARGET
    print(f"  D_lean - 7119595/10^7             = {dec(D - GD_UPPER, 12)}   ({'ok' if ok1 else 'FAILS'})")
    if D > 0:
        print(f"  1/D_lean                          = {dec(1 / D, 30)}")
        print(f"  14045611/10^7 - 1/D_lean          = {dec(K_TARGET - 1 / D, 12)}   ({'ok' if ok2 else 'FAILS'})")
    if ok1 and ok2:
        print("BUDGET OK: D_lean > 7119595/10^7 and 1/D_lean < 14045611/10^7")
        return 0
    print("BUDGET FAILS")
    return 1


if __name__ == "__main__":
    sys.exit(main())
