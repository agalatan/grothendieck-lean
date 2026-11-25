#!/usr/bin/env python3
"""07 - The alternating sums W of the channels and the ceiling of the mixture.

Arithmetic : interval, with exact rational endpoints (`fractions.Fraction`); standard library only.
Paper      : the subsection "The alternating ceiling" (W(h) = sum_k (-1)^k h_k >= D(h)), the end of the
             subsections "The reflected pair" and "The smoothed map" (the enclosures of W), and "How close the
             certificate is to its ceiling" in the last section.
Lean       : these numbers explain the construction and are NOT used in the proof of the main theorem; the Lean
             package does not state them.  What they rest on is in the package: the certified intervals
             (`Haagerup.Data.tig_mu_ok`, `Haagerup.Data.tcell_rows_ok`) and the tail allowances tau_p (the tail
             bounds inside `Haagerup.isBound_cert`).
Runtime    : about 30 seconds.

For each channel p the head sum  sum_{k=0}^{250} (-1)^k h_k^(p)  is enclosed with `common.channel_head` (exact
interval arithmetic on the certified tables), and |sum_{k>250} (-1)^k h_k^(p)| <= sum_{k>250} |h_k^(p)| <= tau_p.
So  W(h^(p)) in [head_lo - tau_p, head_hi + tau_p].  The enclosure of W holds given the Lean theorems above;
this script does not re-derive the tables or the tails (04 and 06 recompute them numerically).

The values compared with are the bounds quoted in the paper's text (QUOTED below); the computed enclosures come
from the Lean data.
"""
import sys

sys.dont_write_bytecode = True  # leave no __pycache__ next to the scripts

from fractions import Fraction

import common
from common import Report, dec, dec_dn, dec_up, sci, sci_dn, sci_up

# Bounds quoted in the paper's text, against which the computed enclosures are compared.
QUOTED = {
    "W smoothed upper": Fraction(7119200, 10 ** 7),                    # W < 0.7119200 for channels 0, 1, 5
    "W reflected lower": Fraction(712901282238, 10 ** 12),             # 0.712901282238 < W
    "W reflected upper": Fraction(712901282245, 10 ** 12),             #                  W < 0.712901282245
    "W(H) upper": Fraction(711975481, 10 ** 9),                        # W(H) < 0.711975481
    "slope lower": Fraction(711968053, 10 ** 9),                       # 0.711968053 < c - delta
}


def main() -> int:
    par = common.parameters()
    w, tau = par["wQ"], par["tailQ"]
    rep = Report("07  Alternating sums W and the ceiling of the mixture")
    g_lo, g_hi = common.gamma_dagger_tight()
    rep.info(f"gamma-dagger in [{dec_dn(g_lo, 28)}, {dec_up(g_hi, 28)}] (exact enclosure, see 02)")

    rep.section("The reflected pair without preprocessor: S_250 = sum_{n=0}^{250} (-1)^n mu_n")
    mu = common.tig_mu_intervals()
    lo = sum(a if n % 2 == 0 else -b for n, (a, b) in enumerate(mu))
    hi = sum(b if n % 2 == 0 else -a for n, (a, b) in enumerate(mu))
    s_lo, s_hi = Fraction(lo, common.SCALE), Fraction(hi, common.SCALE)
    rep.info(f"  S_250 in [{dec_dn(s_lo, 24)}, {dec_up(s_hi, 24)}]")
    rep.info(f"  S_250 - gamma-dagger in [{sci_dn(s_lo - g_hi, 8)}, {sci_up(s_hi - g_lo, 8)}]")
    rep.check("interval", "S_250 > gamma-dagger + 9.429e-4 (as stated in the paper)",
              s_lo - g_hi > Fraction(9429, 10 ** 7))
    mid = [Fraction(a + b, 2 * common.SCALE) for a, b in mu]
    s_abs = sum(abs(x) for x in mid[1:])
    rep.info(f"  at the midpoints: mu_0 = {dec(mid[0], 12)}, sum_{{n=1..250}} |mu_n| = {dec(s_abs, 8)}, "
             f"D_250 = {dec(mid[0] - s_abs, 8)}, 1/D_250 = {dec(1 / (mid[0] - s_abs), 6)}")
    # an upper bound of D_250 over the intervals: upper endpoint of mu_0, smallest |mu_n| of each interval
    d_hi = Fraction(mu[0][1] - sum(min(abs(a), abs(b)) if a * b > 0 else 0 for a, b in mu[1:]), common.SCALE)
    rep.info(f"  for all values in the intervals: D_250 <= {dec_up(d_hi, 8)}, hence 1/D_250 >= {dec_dn(1 / d_hi, 5)}")
    rep.info("  (D_250 is an upper bound of the slope D = mu_0 - sum_{n>=1} |mu_n| of this channel, so 1/D >= 1/D_250:")
    rep.info(f"   the transfer lemma cannot give a constant below {dec_dn(1 / d_hi, 5)} from it; D is not bounded from "
             "below here.)")
    rep.info(f"  mu_1 = {dec(mid[1], 12)}, mu_2 = {dec(mid[2], 12)}; signs of mu_0..mu_250 (midpoints): "
             f"{sum(1 for x in mid if x > 0)} positive, {sum(1 for x in mid if x < 0)} negative")

    rep.section("Full alternating sums W(h^(p)) = head sum +- tau_p")
    W = {}
    for p in range(6):
        h_lo, h_hi = common.alternating_head(p, "interval")
        W[p] = (h_lo - tau[p], h_hi + tau[p])
        rep.info(f"  channel {p}: head sum in [{dec_dn(h_lo, 20)}, {dec_up(h_hi, 20)}], tau = {sci(tau[p], 6)}")
        rep.info(f"             W in [{dec_dn(W[p][0], 15)}, {dec_up(W[p][1], 15)}]")

    sm_lo, sm_hi = max(W[p][0] for p in common.SMOOTHED), min(W[p][1] for p in common.SMOOTHED)
    rep.check("interval", "channels 0, 1, 5 (same map, P(-1) = Q(-1) = 1) have one common value of W: their "
                          f"enclosures intersect in [{dec_dn(sm_lo, 12)}, {dec_up(sm_hi, 12)}]", sm_lo <= sm_hi)
    rep.check("interval", f"W < {dec(QUOTED['W smoothed upper'], 7)} for channels 0, 1, 5 (paper), and this is "
                          "below gamma-dagger",
              all(W[p][1] < QUOTED["W smoothed upper"] for p in common.SMOOTHED)
              and QUOTED["W smoothed upper"] < g_lo)
    rep.info(f"  gamma-dagger - W(smoothed) in [{sci_dn(g_lo - sm_hi, 6)}, {sci_up(g_hi - sm_lo, 6)}]")
    rf_lo, rf_hi = max(W[p][0] for p in common.REFLECTED), min(W[p][1] for p in common.REFLECTED)
    rep.check("interval", "channels 3, 4 (R(-1) = 1) have one common value of W: their enclosures intersect in "
                          f"[{dec_dn(rf_lo, 15)}, {dec_up(rf_hi, 15)}]", rf_lo <= rf_hi)
    rep.check("interval", f"{dec(QUOTED['W reflected lower'], 12)} < W < {dec(QUOTED['W reflected upper'], 12)} "
                          "for channel 4 (paper)",
              QUOTED["W reflected lower"] < W[4][0] and W[4][1] < QUOTED["W reflected upper"])
    rep.info(f"  W(reflected) - gamma-dagger in [{sci_dn(W[4][0] - g_hi, 8)}, {sci_up(W[4][1] - g_lo, 8)}]")
    sigma = common.poly_eval(par["p2Q"], Fraction(-1))
    rep.info(f"  channel 2: sigma = P_2(-1) = {dec(sigma, 12)}; W = sum_m (-1)^m r_m sigma^(2m+1)")
    rep.check("interval", "|W| <= gamma-dagger for channel 2", -g_lo <= W[2][0] and W[2][1] <= g_lo)

    rep.section("The ceiling W(H) = sum_p w_p W(h^(p)) of the mixture")
    # channels with the same map and preprocessors equal to 1 at X = -1 have the same W: use the intersection
    best = {p: (sm_lo, sm_hi) for p in common.SMOOTHED}
    best.update({p: (rf_lo, rf_hi) for p in common.REFLECTED})
    best[2] = W[2]
    direct_lo = sum(w[p] * best[p][0] for p in range(6))
    direct_hi = sum(w[p] * best[p][1] for p in range(6))
    rep.info(f"  from the enclosures above:  W(H) in [{dec_dn(direct_lo, 15)}, {dec_up(direct_hi, 15)}]")
    enc14 = common.gamma_dagger_enclosure()
    paper = ((w[0] + w[1] + w[5]) * QUOTED["W smoothed upper"] + w[2] * enc14["upper"]
             + (w[3] + w[4]) * QUOTED["W reflected upper"])
    rep.info(f"  from the paper's three rounded bounds (0.7119200; gamma-dagger < 0.711958683; 0.712901282245):")
    rep.info(f"      W(H) < {dec_up(paper, 15)}")
    rep.check("interval", f"W(H) < {dec(QUOTED['W(H) upper'], 9)} (paper)", paper < QUOTED["W(H) upper"]
              and direct_hi < QUOTED["W(H) upper"])
    slope = par["cCertQ"] - par["deltaCertQ"]
    rep.info(f"  c - delta = {dec(slope, 15)}")
    rep.check("exact", f"{dec(QUOTED['slope lower'], 9)} < c - delta", QUOTED["slope lower"] < slope)
    rep.check("interval", "c - delta <= W(H) (consistent with D(H) <= W(H)); "
                          f"W(H) - (c - delta) in [{sci_dn(direct_lo - slope, 6)}, {sci_up(direct_hi - slope, 6)}]",
              slope <= direct_lo)
    rep.check("interval", f"max_p W(h^(p)) < {dec(QUOTED['W reflected upper'], 12)}: no mixture of these six "
                          "channels has slope above it",
              all(best[p][1] < QUOTED["W reflected upper"] for p in range(6)))
    inv = 1 / QUOTED["W reflected upper"]
    rep.info(f"  1 / 0.712901282245 = {dec(inv, 9)}")
    rep.check("exact", "1 / 0.712901282245 > 1.40271: such mixtures give no bound below 1.40271 (paper)",
              inv > Fraction(140271, 10 ** 5))
    return rep.finish()


if __name__ == "__main__":
    common.main_guard(main)
