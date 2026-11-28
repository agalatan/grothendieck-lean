#!/usr/bin/env python3
"""02 - Haagerup's constant gamma-dagger and its rational enclosure; Haagerup's bound 1/gamma_H.

Arithmetic : (a) floating point, mpmath at 50 digits (quadrature, the alternating series, the hypergeometric
             closed form);  (b) exact (`fractions.Fraction`) for the algebraic enclosure;  (c) floating point,
             mpmath at 50 digits, for Haagerup's constant gamma_H of 1987.
Paper      : the definition of gamma-dagger and the decimal expansions of gamma-dagger, 1/gamma-dagger, gamma_H
             and 1/gamma_H in the introduction (numerical evaluations, given there for orientation); the lemma
             "Enclosure of gamma-dagger" in the proof of the main theorem, and the computation "Rational
             arithmetic for gamma-dagger".
Lean       : `Haagerup.gammaDagger_bounds` (GammaDagger.lean) proves 0.711958633 < gamma-dagger < 0.711958683;
             `Haagerup.inv_gammaDagger_gt` (Haagerup.lean) proves that the bound of the main theorem is below
             1/gamma-dagger.
Runtime    : about 1 second.
Needs      : mpmath for parts (a) and (c) (part (b) is standard library; without mpmath parts (a) and (c) are
             reported as failed).
Prints     : gamma-dagger and 1/gamma-dagger to 32 digits by three methods; the rational numbers of the lemma
             and its bounds 0.711958633 < gamma-dagger < 0.711958683; gamma_H and 1/gamma_H to 20 digits.

Part (b) recomputes the construction of the lemma instead of reading its numbers:
  * P_14(x) = sum_{k<=14} binom(2k,k) 4^-k x^k, and (1 - x) P_14(x)^2 = 1 - sum_{m=15}^{29} d_m x^m;
  * so |1 - (1 - x) P_14^2| <= 3^-15 for |x| <= 1/3, and with 1 + sin^2 t = (3/2)(1 - x), x = cos(2t)/3,
        a * cos^2 t * P_14(x) <= cos^2 t / sqrt(1 + sin^2 t) <= b * cos^2 t * P_14(x)
    for every rational a <= sqrt(2 / (3 (1 + 3^-15))) and b >= sqrt(2 / (3 (1 - 3^-15)));
  * int_0^{pi/2} cos^2 t P_14(cos(2t)/3) dt = q_0 * pi/2, with q_0 the mean of (1 + u)/2 * P_14(u/3) over
    u = cos(2t), computed from the means of cos^n;
  * the paper's enclosure 3.14159265358979323846 < pi < 3.14159265358979323847, recomputed from Machin's
    formula in exact arithmetic.
"""
import sys

sys.dont_write_bytecode = True  # leave no __pycache__ next to the scripts

from fractions import Fraction

import common
from common import Report, dec, dec_dn, dec_up


def part_a(rep: Report) -> None:
    rep.section("(a) gamma-dagger in floating point (mpmath, 50 digits)")
    try:
        import mpmath as mp
    except ImportError:
        rep.check("floating point", "mpmath is installed", False)
        return
    mp.mp.dps = 50
    quad = mp.quad(lambda t: mp.cos(t) ** 2 / mp.sqrt(1 + mp.sin(t) ** 2), mp.linspace(0, mp.pi / 2, 9))
    hyp = mp.pi / 4 * mp.hyp2f1(mp.mpf(1) / 2, mp.mpf(1) / 2, 2, -1)

    def r(k):  # r_k = (pi/4) binom(2k,k)^2 / (16^k (k+1))
        k = int(k)
        return mp.pi / 4 * mp.binomial(2 * k, k) ** 2 / (mp.mpf(16) ** k * (k + 1))

    # the series converges like k^-2; mpmath's default (Richardson/Shanks) acceleration sums it to full precision
    series = mp.nsum(lambda k: (-1) ** int(k) * r(k), [0, mp.inf])
    rep.info(f"  quadrature of cos^2 t / sqrt(1 + sin^2 t) on [0, pi/2] : {mp.nstr(quad, 32)}")
    rep.info(f"  (pi/4) * 2F1(1/2, 1/2; 2; -1)                          : {mp.nstr(hyp, 32)}")
    rep.info(f"  accelerated alternating series sum (-1)^k r_k          : {mp.nstr(series, 32)}")
    rep.info(f"  1 / gamma-dagger                                       : {mp.nstr(1 / quad, 32)}")
    # partial sums of an alternating series with decreasing terms bracket the limit
    s = mp.mpf(0)
    for k in range(2000):
        s += (-1) ** k * r(k)
    lo, hi = sorted((s, s + r(2000)))
    rep.info(f"  partial sums S_1999 and S_2000 bracket it              : [{mp.nstr(lo, 12)}, {mp.nstr(hi, 12)}]")
    tol = mp.mpf(10) ** -40                # more than the 32 digits printed
    rep.check("floating point", "quadrature and hypergeometric form agree to 40 digits", abs(quad - hyp) < tol)
    rep.check("floating point", "accelerated series and quadrature agree to 40 digits", abs(series - quad) < tol)
    rep.check("floating point", "the quadrature value lies between the partial sums S_1999 and S_2000",
              lo < quad < hi)
    enc = common.gamma_dagger_enclosure()
    rep.check("floating point", "the quadrature value lies inside the exact enclosure of part (b)",
              mp.mpf(enc["lower"].numerator) / enc["lower"].denominator < quad
              < mp.mpf(enc["upper"].numerator) / enc["upper"].denominator)


def part_b(rep: Report) -> None:
    rep.section("(b) the algebraic enclosure (exact rational arithmetic)")
    enc = common.gamma_dagger_enclosure()
    prod, d = enc["product"], enc["d"]
    rep.check("exact", "(1 - x) P_14(x)^2 = 1 - sum_{m=15}^{29} d_m x^m (the coefficients of x^1..x^14 vanish)",
              prod[0] == 1 and all(prod[k] == 0 for k in range(1, 15)) and len(prod) == 30)
    rep.check("exact", "d_m > 0 for m = 15..29", all(v > 0 for v in d.values()))
    rep.check("exact", f"sum of the d_m = {sum(d.values())}", sum(d.values()) == 1)
    rep.info(f"  d_15 = {d[15]},  d_29 = {d[29]}")
    c = enc["c"]
    rep.check("exact", "P_14 > 0 on [-1/3, 1/3]: c_(2m+1) / c_(2m) = (4m+1)/(4m+2) < 1 for m = 0..6",
              all(c[2 * m + 1] / c[2 * m] == Fraction(4 * m + 1, 4 * m + 2) for m in range(7)))
    rep.info(f"  q_0 = {enc['q0']}")
    rep.info(f"      = {dec(enc['q0'], 30)}")
    a, b, eps = enc["pref_lo"], enc["pref_hi"], enc["eps"]
    rep.info(f"  largest  a with denominator 5*10^10 and a^2 <= 2/(3(1 + 3^-15)) : {a.numerator * (5 * 10**10 // a.denominator)} / (5*10^10)")
    rep.info(f"  smallest b with denominator 5*10^10 and b^2 >= 2/(3(1 - 3^-15)) : {b.numerator * (5 * 10**10 // b.denominator)} / (5*10^10)")
    rep.check("exact", "a^2 * (3/2) * (1 + 3^-15) <= 1 <= b^2 * (3/2) * (1 - 3^-15)",
              a * a * Fraction(3, 2) * (1 + eps) <= 1 <= b * b * Fraction(3, 2) * (1 - eps))
    pi_lo, pi_hi = common.pi_enclosure(20)
    rep.info(f"  {dec_dn(pi_lo, 20)} < pi < {dec_up(pi_hi, 20)}  (Machin's formula, exact arithmetic)")
    lo, hi = enc["lower"], enc["upper"]
    rep.info(f"  a * q_0 * pi_lo / 2 >= {dec_dn(lo, 30)}   (lower bound of gamma-dagger, rounded down)")
    rep.info(f"  b * q_0 * pi_hi / 2 <= {dec_up(hi, 30)}   (upper bound of gamma-dagger, rounded up)")
    rep.check("exact", "0.711958633 < a * q_0 * pi_lo / 2", Fraction(711958633, 10 ** 9) < lo)
    rep.check("exact", "b * q_0 * pi_hi / 2 < 0.711958683", hi < Fraction(711958683, 10 ** 9))
    head = common.HEADLINE
    prod2 = head * Fraction(711958683, 10 ** 9)
    rep.info(f"  {dec(head, 5)} * 0.711958683 = {dec(prod2, 14)}  (140456 * 711958683 = {140456 * 711958683})")
    rep.check("exact", f"{dec(head, 5)} * 0.711958683 < 1, hence {dec(head, 5)} < 1/gamma-dagger", prod2 < 1)
    inv_lo, inv_hi = 1 / Fraction(711958683, 10 ** 9), 1 / Fraction(711958633, 10 ** 9)
    rep.check("exact", f"1.4045758 < 1/0.711958683 = {dec(inv_lo, 12)}... and 1/0.711958633 = {dec(inv_hi, 12)}... "
                       "< 1.4045760, hence 1.4045758 < 1/gamma-dagger < 1.4045760",
              Fraction(14045758, 10 ** 7) < inv_lo and inv_hi < Fraction(14045760, 10 ** 7))
    par = common.parameters()
    slope = par["cCertQ"] - par["deltaCertQ"]
    rep.check("exact", "the certified slope c - delta exceeds the upper bound of gamma-dagger "
                       f"(c - delta - upper = {common.sci(slope - hi, 6)})", slope > hi)


def part_c(rep: Report) -> None:
    rep.section("(c) Haagerup's bound of 1987, for orientation (floating point, mpmath, 50 digits)")
    try:
        import mpmath as mp
    except ImportError:
        rep.check("floating point", "mpmath is installed", False)
        return
    mp.mp.dps = 50

    def phi(t):  # phi(t) = (pi/4) t 2F1(1/2, 1/2; 2; t^2) = sum_k r_k t^(2k+1)
        return mp.pi / 4 * t * mp.hyp2f1(mp.mpf(1) / 2, mp.mpf(1) / 2, 2, t * t)

    # gamma_H solves sum_k |b_k| gamma^(2k+1) = 1, where phi^-1(u) = sum_k b_k u^(2k+1).  Haagerup proved
    # b_0 = 4/pi > 0 and b_k <= 0 for k >= 1 (this theorem is used here, not rechecked), so the equation reads
    # (8/pi) gamma - phi^-1(gamma) = 1; with s = phi^-1(gamma):  phi(s) = pi (s + 1) / 8 and gamma_H = phi(s).
    s = mp.findroot(lambda x: phi(x) - mp.pi * (x + 1) / 8, (mp.mpf("0.8"), mp.mpf("0.82")), solver="anderson")
    gamma_h = phi(s)
    rep.info(f"  s with phi(s) = pi (s + 1) / 8 : {mp.nstr(s, 20)}")
    rep.info(f"  gamma_H = phi(s)               : {mp.nstr(gamma_h, 20)}")
    rep.info(f"  1 / gamma_H                    : {mp.nstr(1 / gamma_h, 20)}")
    rep.check("floating point", "the residual of the equation is below 1e-40, and 0 < s < 1",
              abs(phi(s) - mp.pi * (s + 1) / 8) < mp.mpf(10) ** -40 and 0 < s < 1)
    rep.check("floating point", "0.7117898066 < gamma_H < 0.7117898067 and 1.4049091327 < 1/gamma_H < 1.4049091328",
              mp.mpf("0.7117898066") < gamma_h < mp.mpf("0.7117898067")
              and mp.mpf("1.4049091327") < 1 / gamma_h < mp.mpf("1.4049091328"))
    rep.check("floating point", "1.404898554746 < 1/gamma_H - 10^-5 (the upper bound of Heilman, Jones and "
                                "Malavolta quoted in the paper)",
              mp.mpf("1.404898554746") < 1 / gamma_h - mp.mpf(10) ** -5)
    gd = mp.quad(lambda t: mp.cos(t) ** 2 / mp.sqrt(1 + mp.sin(t) ** 2), mp.linspace(0, mp.pi / 2, 9))
    rep.check("floating point", f"gamma_H < gamma-dagger: 1/gamma_H - 1/gamma-dagger = {mp.nstr(1 / gamma_h - 1 / gd, 6)}",
              gamma_h < gd)


def main() -> int:
    rep = Report("02  gamma-dagger: numerical value and exact rational enclosure")
    part_a(rep)
    part_b(rep)
    part_c(rep)
    return rep.finish()


if __name__ == "__main__":
    common.main_guard(main)
