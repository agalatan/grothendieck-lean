#!/usr/bin/env python3
"""05 - The head of the six-channel mixture: H_0, sum_{k=1}^{250} |H_k|, and the head cap.

Arithmetic : interval, with exact rational endpoints (`fractions.Fraction`), for the comparison with the head
             cap; exact rational arithmetic at the midpoints of the certified intervals for the descriptive
             figures.  Standard library only.
Paper      : the proposition "Head formulas" (the three finite forms of the channel series), the computation
             "Head" and the proposition "Head bound"; the remark "Cancellation across channels".
Lean       : `Haagerup.head_sum_ok` (HeadCheck.lean) with `Haagerup.head_residual_of_fastHeadOK`
             (FastHeadSound.lean): |H_0 - c| + sum_{k=1}^{250} |H_k| <= head cap.  Lean evaluates the same sums
             in fixed-point arithmetic at scale 2^-80 with a rounding budget; here the arithmetic is exact, so the
             enclosure below is slightly tighter than what Lean certifies, and the two need not agree digit by
             digit.
Runtime    : about 20 to 40 seconds.
Prints     : per channel h_0, sum |h_k| and D_250 at the midpoints; the enclosure of H_0, of sum |H_k| and of
             the quantity compared with the head cap; the largest coefficients of the mixture.

Inputs: the certified intervals of Haagerup/Data/OverlapData.lean (mu_n of the reflected pair, the energies
E(d1, d2) of the smoothed map) and Haagerup/Parameters.lean.  The series are formed by `common.channel_head`;
its docstring states the formulas.  The phase channel uses r_m = (pi/4) binom(2m,m)^2 / (16^m (m+1)) with
3.14159265358979323846 < pi < 3.14159265358979323847, as in the paper.
"""
import sys

sys.dont_write_bytecode = True  # leave no __pycache__ next to the scripts

from fractions import Fraction

import common
from common import Report, abs_sup, dec, dec_dn, dec_up, sci, sci_dn, sci_up


def main() -> int:
    par = common.parameters()
    w, c, cap = par["wQ"], par["cCertQ"], par["headCapCertQ"]
    rep = Report("05  The head of the mixture, k = 0..250")

    mu = common.tig_mu_intervals()
    en = common.tcell_energy_intervals()
    rep.section("Inputs")
    rep.info(f"  mu_n of the reflected pair: {len(mu)} intervals, largest width {max(b - a for a, b in mu)} / 2^128")
    rep.info(f"  E(d1, d2) of the smoothed map: {len(en)} intervals, largest width "
             f"{max(b - a for a, b in en.values())} / 2^128")
    total = sum(b for _, b in en.values())
    rep.check("interval", f"the energies of the table sum to at most 1 (upper bound {dec_up(Fraction(total, common.SCALE), 12)})",
              total <= common.SCALE and all(a >= 0 for a, _ in en.values()))
    # part (a) of the paper's computation "Head", on the integer endpoints (mu^-, mu^+) and (e^-, e^+)
    rep.check("exact", "part (a) of the computation: mu^+ - mu^- <= 2^48, sum_n |mu_n^-| <= 2^128; "
                       "e^- >= 0, e^+ - e^- <= 2^48, sum e^- <= 2^128",
              all(b - a <= 1 << 48 for a, b in mu) and sum(abs(a) for a, _ in mu) <= common.SCALE
              and all(a >= 0 and b - a <= 1 << 48 for a, b in en.values())
              and sum(a for a, _ in en.values()) <= common.SCALE)

    rep.section("Per channel, at the midpoints of the intervals (exact arithmetic on the midpoints)")
    rep.info("  p   h_0                      sum_{k=1..250}|h_k|       D_250 = h_0 - sum       1/D_250")
    for p in range(6):
        h = [v for v, _ in common.channel_head(p, "midpoint")]
        s = sum(abs(x) for x in h[1:])
        d = h[0] - s
        inv = dec(1 / d, 6) if d > 0 else "-"
        rep.info(f"  {p}   {dec(h[0], 18):>22}   {dec(s, 18):>22}   {dec(d, 12):>16}   {inv:>10}")
    rep.info(f"  (channel 2 alone has D_250 < 0; its weight is {sci(w[2], 3)}.)")

    rep.section("The mixture H_k = sum_p w_p h_k^(p), interval arithmetic with exact endpoints")
    H = common.mixture_head("interval")
    width = max(b - a for a, b in H)
    rep.info(f"  largest width of an H_k interval: {sci(width, 3)}")
    rep.info(f"  H_0 in [{dec_dn(H[0][0], 30)},")
    rep.info(f"          {dec_up(H[0][1], 30)}]")
    r0 = abs_sup(H[0][0] - c, H[0][1] - c)
    tail_abs = sum(abs_sup(a, b) for a, b in H[1:])
    tail_abs_lo = sum(min(abs(a), abs(b)) if a * b > 0 else 0 for a, b in H[1:])
    rep.info(f"  c                              = {dec(c, 12)}")
    rep.info(f"  |H_0 - c|                     <= {sci_up(r0, 12)}")
    rep.info(f"  sum_{{k=1..250}} |H_k|          in [{sci_dn(tail_abs_lo, 16)}, {sci_up(tail_abs, 16)}]")
    rep.info(f"  |H_0 - c| + sum |H_k|         <= {sci_up(r0 + tail_abs, 16)}")
    rep.info(f"  head cap                       = {sci(cap, 6)}")
    rep.info(f"  head cap - (|H_0 - c| + sum)  >= {sci_dn(cap - r0 - tail_abs, 6)}")
    rep.check("interval", "|H_0 - c| + sum_{k=1}^{250} |H_k| <= head cap", r0 + tail_abs <= cap)

    rep.section("The same at the midpoints")
    Hm = [v for v, _ in common.mixture_head("midpoint")]
    rep.info(f"  H_0                   = {dec(Hm[0], 30)}")
    rep.info(f"  H_0 - c               = {sci(Hm[0] - c, 12)}")
    sm = sum(abs(x) for x in Hm[1:])
    rep.info(f"  sum_{{k=1..250}} |H_k| = {sci(sm, 16)}")
    rep.check("exact", "the midpoint values lie inside the interval enclosures",
              all(a <= v <= b for v, (a, b) in zip(Hm, H)))
    rep.info("  the ten largest |H_k|, k >= 1:")
    order = sorted(range(1, len(Hm)), key=lambda k: -abs(Hm[k]))
    for k in order[:10]:
        rep.info(f"    k = {k:3d}   H_k = {sci(Hm[k], 10)}")
    for a, b in ((1, 10), (11, 50), (51, 150), (151, 250)):
        rep.info(f"  sum of |H_k| for k = {a}..{b}: {sci(sum(abs(Hm[k]) for k in range(a, b + 1)), 8)}")
    rep.info(f"  signs of H_1..H_250: {sum(1 for x in Hm[1:] if x > 0)} positive, {sum(1 for x in Hm[1:] if x < 0)} negative")
    return rep.finish()


if __name__ == "__main__":
    common.main_guard(main)
