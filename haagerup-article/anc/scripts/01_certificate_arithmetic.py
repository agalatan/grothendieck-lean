#!/usr/bin/env python3
"""01 - The rational arithmetic of the six-channel certificate.

Arithmetic : exact (`fractions.Fraction`); standard library only.
Paper      : the computation "Rational arithmetic of the certificate" in the list of finite computations (the
             table of the six channels; the Hardy tail lemma for the six tail inequalities; the proof of the
             six-channel certificate for the assembly); the bound 1/(c - delta) = 1.4045574031... of the
             certificate theorem and the bound 1.40456 of the main theorem.
Lean       : the same facts are checked by the kernel inside `Haagerup.isBound_cert` (CertCheck.lean: weights,
             l1 norms, `tails_rat_ok`, head cap + weighted tails <= delta), `Haagerup.certificate_value` and
             `Haagerup.isBound` (Haagerup.lean).
Runtime    : under 1 second.

Prints     : the parameters as read (to compare with the paper's table), one line per check, and
             c - delta and 1/(c - delta) as exact rationals and to 30 decimals.

Everything is read from Haagerup/Parameters.lean (see common.py), except the bound 1.40456 of the main theorem
(`common.HEADLINE`); nothing here is used by the Lean proof.
"""
import sys

sys.dont_write_bytecode = True  # leave no __pycache__ next to the scripts

import math
from fractions import Fraction

import common
from common import Report, dec, sci, sci_up


def main() -> int:
    par = common.parameters()
    rep = Report("01  Certificate arithmetic (exact rational arithmetic)")
    w, tau, rho, B = par["wQ"], par["tailQ"], par["rhoQ"], par["budgetQ"]
    c, cap, delta = par["cCertQ"], par["headCapCertQ"], par["deltaCertQ"]

    rep.section("The parameters read from Haagerup/Parameters.lean (the paper's table of the six channels)")
    rep.info(f"  rotations of the smoothing: (c_theta, s_theta) = ({par['ctQ']}, {par['stQ']}), "
             f"(s_eta, c_eta) = ({par['seQ']}, {par['ceQ']})")
    for p in range(6):
        rep.info(f"  channel {p}: w = {w[p] * 10 ** 12} / 10^12, rho = {rho[p]}, r_reg = {par['regRQ'][p]}, "
                 f"beta = {par['jCertQ'][p]}, B = {B[p] * 10 ** 6} / 10^6, tau = {tau[p] * 10 ** 12} / 10^12")
    for name, label in (("p0Q", "P_0"), ("q0Q", "Q_0"), ("p1Q", "P_1"), ("q1Q", "Q_1"), ("p2Q", "P_2"),
                        ("r3Q", "R_3"), ("r4Q", "R_4"), ("p5Q", "P_5"), ("q5Q", "Q_5")):
        den = 10 ** 12 if name in ("p2Q", "r3Q", "r4Q", "p5Q") else 0
        rep.info(f"  {label} = {common.poly_str(par[name], den)}".replace(f"/ {10 ** 12}", "/ 10^12"))
    rep.info(f"  c = {c * 10 ** 12} / 10^12, head cap = {cap * 10 ** 12} / 10^12, delta = {delta * 10 ** 24} / 10^24")

    rep.section("Weights")
    for p in range(6):
        rep.info(f"  w_{p} = {w[p]} = {dec(w[p], 12)}")
    rep.check("exact", "every weight is positive", all(x > 0 for x in w))
    rep.check("exact", f"the weights sum to 1 (sum = {sum(w)})", sum(w) == 1)
    rep.info(f"  weight of the smoothed channels 0, 1, 5 : {dec(w[0] + w[1] + w[5], 12)}")
    rep.info(f"  weight of the reflected channels 3, 4   : {dec(w[3] + w[4], 12)}")

    rep.section("Preprocessors: sum of the absolute values of the coefficients")
    for name in ("p0Q", "q0Q", "p1Q", "q1Q", "p2Q", "r3Q", "r4Q", "p5Q", "q5Q"):
        norm = sum(abs(x) for x in par[name])
        rep.check("exact", f"l1 norm of {name} = {norm} <= 1", norm <= 1)
    rep.info("  value at X = -1 (used for the alternating sums):")
    for name in ("p0Q", "p1Q", "p2Q", "r3Q", "r4Q", "p5Q"):
        rep.info(f"    {name}(-1) = {common.poly_eval(par[name], Fraction(-1))}")

    rep.section("The two rotations of the smoothing")
    rep.check("exact", "ctQ^2 + stQ^2 = 1", par["ctQ"] ** 2 + par["stQ"] ** 2 == 1)
    rep.check("exact", "seQ^2 + ceQ^2 = 1", par["seQ"] ** 2 + par["ceQ"] ** 2 == 1)

    rep.section("Tail inequalities  B_p * rho_p^-(4K+6) <= tau_p^2 * (1 - rho_p^-4),  K = 250, 4K + 6 = 1006")
    rep.info("  (CertCheck.lean states it with the exponent 2*(2*251+1) = 1006: the tail starts at k = 251.)")
    for p in range(6):
        lhs = B[p] / rho[p] ** 1006
        rhs = tau[p] ** 2 * (1 - 1 / rho[p] ** 4)
        rep.check("exact", f"channel {p}: rho = {rho[p]}, B = {dec(B[p], 6)}, tau = {sci(tau[p], 6)}; "
                           f"lhs/rhs = {sci(lhs / rhs, 6)}", lhs <= rhs)
        # the tail bound that the budget gives, sqrt(B rho^-1006 / (1 - rho^-4)); the square root is rounded
        t2 = lhs / (1 - 1 / rho[p] ** 4)
        root = Fraction(math.isqrt(t2.numerator * 10 ** 80 // t2.denominator) + 1, 10 ** 40)
        rep.info(f"        sqrt(B rho^-1006 / (1 - rho^-4)) <= {sci_up(root, 6)} (rounded up)")
    rep.check("exact", "1 < rho_p < r_reg,p and 0 < beta_p < 1 for every channel (beta_p is jCertQ in the Lean file)",
              all(1 < rho[p] < par["regRQ"][p] and 0 < par["jCertQ"][p] < 1 for p in range(6)))

    rep.section("Assembly")
    wt = sum(w[p] * tau[p] for p in range(6))
    rep.info(f"  head cap            = {cap} = {sci(cap, 6)}")
    rep.info(f"  sum_p w_p tau_p     = {wt} = {sci(wt, 6)}")
    rep.info(f"  delta (Parameters)  = {delta} = {sci(delta, 8)}")
    rep.check("exact", "head cap + sum_p w_p tau_p = delta, exactly", cap + wt == delta)
    slope = c - delta
    rep.info(f"  c                   = {c} = {dec(c, 12)}")
    rep.info(f"  c - delta           = {slope}")
    rep.info(f"                      = {dec(slope, 30)}")
    rep.info(f"  1 / (c - delta)     = {1 / slope}")
    rep.info(f"                      = {dec(1 / slope, 30)}")
    rep.check("exact", "0 < delta < c", 0 < delta < c)
    up5 = Fraction(math.ceil(1 / slope * 10 ** 5), 10 ** 5)
    rep.info(f"  1 / (c - delta) rounded up to 5 decimals = {dec(up5, 5)}")
    rep.check("exact", f"1 / (c - delta) <= {dec(common.HEADLINE, 5)} (the bound of the main theorem)",
              1 / slope <= common.HEADLINE and up5 == common.HEADLINE)
    rep.check("exact", f"c - delta > 1 / {dec(common.HEADLINE, 5)}, strictly", slope * common.HEADLINE > 1)
    return rep.finish()


if __name__ == "__main__":
    common.main_guard(main)
