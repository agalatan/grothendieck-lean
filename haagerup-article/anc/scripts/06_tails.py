#!/usr/bin/env python3
"""06 - The Hardy tails: circle means against the budgets B_p, and the positivity conditions on the disk.

Arithmetic : floating point (numpy, double precision) for the circle means and the positivity conditions: a
             numerical illustration of what Lean proves with Taylor models, not an enclosure.  One check is
             interval arithmetic with exact endpoints (the Parseval sum of the head against B_p).
Paper      : the subsection "Correlation matrices and Schur denominators", the computations "Positivity on the
             outer circles" and "Circle means", the lemmas "Pointwise bound" and "Hardy tail", and the proposition
             "Tail bounds".
Lean       : `Haagerup.reg0_ok` .. `reg5_ok` (positivity on the circle |t| = r_reg,p) and `Haagerup.mean0_ok` ..
             `mean5_ok` (circle mean <= B_p), in Haagerup/ContourChecks/; they give
             sum_k (h_k^(p))^2 rho_p^(4k+2) <= B_p through `Haagerup.hardy_smoothed_channel_tm`,
             `hardy_phase_channel_tm`, `hardy_anti_channel_tm` (TaylorHardySound.lean), and the tail through
             `Haagerup.hardy_tail` (Transfer.lean).  The exact comparison of B_p with tau_p is in 01.
Runtime    : about 30 seconds (most of it the exact head series for the Parseval sums).
Needs      : numpy.

Notation of the paper (Lean names in brackets).  Gamma_p(t) [RtGen] is the complex symmetric 2 x 2 matrix
        Gamma_p(t) = M diag(t P_p(t^2), -t^3) M      for p = 0, 1, 5,
                     diag(t P_2(t^2), 0)             for p = 2,
                     diag(-t R_p(t^2), t R_p(t^2))   for p = 3, 4,
        M = [[ct^2 + se st^2, ct st (1 - se)], [ct st (1 - se), st^2 + se ct^2]],
and for beta = beta_p [jCertQ] the Schur denominator [gaussDenominator] is
        Lambda_beta(Gamma) = 16 beta^2 |det(I - Gamma^2)|^2 det Z det(T + beta I) det(T + 2E + beta I),
        A = (I - Gamma^2)^-1,  C = Gamma A,  Z = Re A - beta I,  Cr = Re C,  Ci = Im C,
        T = Z - Cr Z^-1 Cr,  E = (Cr Z^-1 Cr + Ci Z^-1 Ci) / 2,
the pair (Gamma, beta) being admissible if Z and T are positive definite.  The channel function
f_p(t) = sum_k h_k^(p) t^(2k+1) is holomorphic on |t| < r_reg,p once I +- Re Gamma_p(t) are positive definite on
the circle |t| = r_reg,p, and |f_p(t)|^2 <= 1 / Lambda_beta(Gamma_p(t)) at admissible points: a bound that does not
depend on the rounding map.  The budget B_p bounds the mean of 1/Lambda over the circle |t| = rho_p, and the
circle mean of |f_p|^2 itself equals sum_k (h_k^(p))^2 rho_p^(4k+2) (Parseval).

This script
  (1) samples the positivity conditions on the closed disk |t| <= r_reg,p (the paper needs them on the circle;
      the interior follows by the maximum principle);
  (2) computes the mean of 1/Lambda over |t| = rho_p, both by the trapezoidal rule on the whole circle and as the
      paper's integral (4/pi) int_0^1 d sigma / ((1 + sigma^2) Lambda) over the first-quadrant arc
      t = rho (1 - sigma^2 + 2 i sigma) / (1 + sigma^2), and compares it with B_p;
  (3) compares the partial Parseval sum over the head k <= 250 (from the certified tables) with both;
  (4) prints the tail bound sqrt(B rho^-1006 / (1 - rho^-4)) next to tau_p.
The true circle mean of |f_p|^2 is not computed directly (that would need the 8-dimensional Gaussian integral of
the cell maps at complex correlations); (3) gives it from below and (2) bounds it from above.
"""
import sys

sys.dont_write_bytecode = True  # leave no __pycache__ next to the scripts

import math
from fractions import Fraction

import common
from common import Report, dec, dec_up, sci


def r_matrix(np, p: int, t):
    """Gamma_p(t) as the three entries (a, b, c) of [[a, b], [b, c]], for a numpy array t of complex numbers."""
    par = common.parameters()
    P, Q = common.channel_polys(p)
    t2 = t * t
    pt = t * sum(float(c) * t2 ** k for k, c in enumerate(P))
    qt = t * sum(float(c) * t2 ** k for k, c in enumerate(Q)) if Q else 0 * t
    if p in common.SMOOTHED:
        ct, st, se = float(par["ctQ"]), float(par["stQ"]), float(par["seQ"])
        m00, m01, m11 = ct * ct + se * st * st, ct * st * (1 - se), st * st + se * ct * ct
        return m00 * m00 * pt + m01 * m01 * qt, m00 * m01 * pt + m01 * m11 * qt, m01 * m01 * pt + m11 * m11 * qt
    return pt, 0 * t, qt


def sym_min_eig(a, b, c):
    """Smallest eigenvalue of the real symmetric [[a, b], [b, c]] (arrays)."""
    return (a + c) / 2 - (((a - c) / 2) ** 2 + b * b) ** 0.5


def schur_bound(np, a, b, c, j: float):
    """(Lambda_beta(Gamma), min eigenvalue of Z, min eigenvalue of T) for Gamma = [[a, b], [b, c]], beta = j;
    the paper's definition of the Schur denominator, written out for symmetric 2 x 2 matrices."""
    s11, s12, s22 = a * a + b * b, a * b + b * c, b * b + c * c
    det = (1 - s11) * (1 - s22) - s12 * s12
    a11, a12, a22 = (1 - s22) / det, s12 / det, (1 - s11) / det            # A = (I - R^2)^-1
    c11, c12, c22 = a * a11 + b * a12, a * a12 + b * a22, b * a12 + c * a22  # C = R A (symmetric)
    z11, z12, z22 = a11.real - j, a12.real, a22.real - j
    zdet = z11 * z22 - z12 * z12

    def sandwich(x11, x12, x22):                                             # X Z^-1 X for real symmetric X
        i11, i12, i22 = z22 / zdet, -z12 / zdet, z11 / zdet
        return (i11 * x11 * x11 + 2 * i12 * x11 * x12 + i22 * x12 * x12,
                i11 * x11 * x12 + i12 * (x11 * x22 + x12 * x12) + i22 * x12 * x22,
                i11 * x12 * x12 + 2 * i12 * x12 * x22 + i22 * x22 * x22)

    kr = sandwich(c11.real, c12.real, c22.real)
    ki = sandwich(c11.imag, c12.imag, c22.imag)
    t11, t12, t22 = z11 - kr[0], z12 - kr[1], z22 - kr[2]
    e11, e12, e22 = (kr[0] + ki[0]) / 2, (kr[1] + ki[1]) / 2, (kr[2] + ki[2]) / 2
    d1 = (t11 + j) * (t22 + j) - t12 * t12
    d2 = (t11 + 2 * e11 + j) * (t22 + 2 * e22 + j) - (t12 + 2 * e12) ** 2
    den = 16 * j * j * np.abs(det) ** 2 * zdet * d1 * d2
    return den, sym_min_eig(z11, z12, z22), sym_min_eig(t11, t12, t22)


def schur_bound_second_form(np, a, b, c, j: float):
    """Lambda in the form in which the Lean checker evaluates it (the paper's appendix on Taylor models;
    HaagerupKernel/TaylorHardy.lean), with generic 2 x 2 linear algebra: G+- = Re (I -+ Gamma)^-1 - beta I,
    Z = (G+ + G-)/2, Cr = (G+ - G-)/2, Ci = Im((I - Gamma)^-1 - (I + Gamma)^-1)/2, T = G- Z^-1 G+,
    E = (Cr Z^-1 Cr + Ci Z^-1 Ci)/2, and |det(I - Gamma^2)|^2 = |det(I - Gamma)|^2 |det(I + Gamma)|^2."""
    R = np.stack([np.stack([a, b], axis=-1), np.stack([b, c], axis=-1)], axis=-2)
    eye = np.eye(2)
    inv_m, inv_p = np.linalg.inv(eye - R), np.linalg.inv(eye + R)
    gp, gm = inv_m.real - j * eye, inv_p.real - j * eye
    z = (gp + gm) / 2
    cr = (gp - gm) / 2
    ci = (inv_m - inv_p).imag / 2
    zi = np.linalg.inv(z)
    t = gm @ zi @ gp
    e = (cr @ zi @ cr + ci @ zi @ ci) / 2
    det = np.linalg.det
    return (16 * j * j * np.abs(det(eye - R)) ** 2 * np.abs(det(eye + R)) ** 2 * det(z)
            * det(t + j * eye) * det(t + 2 * e + j * eye))


def one_dim_factor(r, j: float):
    """The paper's function lambda_beta of one complex variable: Lambda_beta(diag(g1, g2)) =
    16 beta^2 lambda_beta(g1) lambda_beta(g2)."""
    x2, y2 = r.real ** 2, r.imag ** 2
    u = 1 - x2 + y2
    w = y2 / u
    return (1 - j - w) * (1 + y2 - j * u) / (1 - j * (u + 4 * x2 * w))


def main() -> int:
    rep = Report("06  Hardy tails: circle means, budgets and positivity (numerical illustration)")
    try:
        import numpy as np
    except ImportError:
        rep.check("floating point", "numpy is installed", False)
        return rep.finish()
    par = common.parameters()
    rho, reg, jq, B, tau = par["rhoQ"], par["regRQ"], par["jCertQ"], par["budgetQ"], par["tailQ"]

    rep.section("(1) Positivity on the disk |t| <= r_reg,p (sample: 60 radii x 1440 angles)")
    rep.info("  p   r_reg     min eig of I +- Re Gamma(t)    min |det(I -+ Gamma)|   min eig of Re (I -+ Gamma)^-1")
    rep.info("               on the disk    on |t| = r_reg")
    theta = np.linspace(0.0, 2 * np.pi, 1440, endpoint=False)
    for p in range(6):
        radii = float(reg[p]) * np.arange(1, 61) / 60.0
        t = (radii[:, None] * np.exp(1j * theta)[None, :])
        a, b, c = r_matrix(np, p, t)
        lam = np.minimum(sym_min_eig(1 - a.real, -b.real, 1 - c.real), sym_min_eig(1 + a.real, b.real, 1 + c.real))
        dets, inv_eig = [], []
        for sgn in (1, -1):
            m11, m12, m22 = 1 - sgn * a, -sgn * b, 1 - sgn * c
            d = m11 * m22 - m12 * m12
            dets.append(np.abs(d).min())
            inv_eig.append(sym_min_eig((m22 / d).real, (-m12 / d).real, (m11 / d).real).min())
        rep.info(f"  {p}   {dec(reg[p], 5)}   {lam.min():.6f}       {lam[-1].min():.6f}         "
                 f"{min(dets):.6f}                {min(inv_eig):.6f}")
        rep.check("floating point", f"channel {p}: I +- Re Gamma(t) positive definite, det(I -+ Gamma) != 0 and "
                                    "Re (I -+ Gamma)^-1 positive definite at every sample point; the minimum "
                                    "of the first is on the boundary circle",
                  bool(lam.min() > 0 and min(dets) > 0 and min(inv_eig) > 0 and lam.min() == lam[-1].min()))

    rep.section("(2) Mean over |t| = rho_p of the pointwise bound 1/Lambda, against the budget B_p")
    nodes, weights = np.polynomial.legendre.leggauss(400)
    sigma = (nodes + 1) / 2                                     # Gauss-Legendre nodes on [0, 1]
    means = []
    for p in range(6):
        j = float(jq[p])
        vals = {}
        for n in (4096, 8192):
            t = float(rho[p]) * np.exp(2j * np.pi * np.arange(n) / n)
            a, b, c = r_matrix(np, p, t)
            den, zmin, tmin = schur_bound(np, a, b, c, j)
            vals[n] = (float(np.mean(1.0 / den)), float(zmin.min()), float(tmin.min()), float(den.min()),
                       float((1.0 / den).max()))
        mean, zmin, tmin, dmin, umax = vals[8192]
        means.append(mean)
        tq = float(rho[p]) * (1 - sigma ** 2 + 2j * sigma) / (1 + sigma ** 2)
        a, b, c = r_matrix(np, p, tq)
        quarter = float(4 / np.pi * np.sum(weights / 2 / ((1 + sigma ** 2) * schur_bound(np, a, b, c, j)[0])))
        rep.info(f"  channel {p}: rho = {dec(rho[p], 4)}, beta = {dec(jq[p], 2)}: mean of 1/Lambda = {mean:.7f}, "
                 f"max = {umax:.5f}, B_p = {dec(B[p], 6)}, B_p / mean = {float(B[p]) / mean:.7f}")
        rep.check("floating point", f"channel {p}: admissible on the circle (Z and T positive definite), the "
                                    "trapezoidal means with 4096 and 8192 points and the paper's integral over the "
                                    "first-quadrant arc agree to 1e-10, and the mean is <= B_p",
                  zmin > 0 and tmin > 0 and dmin > 0 and abs(vals[4096][0] - mean) <= 1e-10 * mean
                  and abs(quarter - mean) <= 1e-10 * mean and mean <= float(B[p]))
        t = float(rho[p]) * np.exp(2j * np.pi * np.arange(8192) / 8192)
        a, b, c = r_matrix(np, p, t)
        second = schur_bound_second_form(np, a, b, c, j)
        rep.check("floating point", f"channel {p}: Lambda agrees with its second form (through (I -+ Gamma)^-1, as "
                                    "the Lean checker evaluates it) to 1e-9 on the circle",
                  bool(np.max(np.abs(second / schur_bound(np, a, b, c, j)[0] - 1)) <= 1e-9))
        if p not in common.SMOOTHED:
            closed = 16 * j * j * one_dim_factor(a, j) * one_dim_factor(c, j)
            den = schur_bound(np, a, b, c, j)[0]
            rep.check("floating point", f"channel {p}: Lambda agrees with the closed form for diagonal matrices, "
                                        "16 beta^2 lambda(g1) lambda(g2), to 1e-9 on the circle",
                      bool(np.max(np.abs(closed / den - 1)) <= 1e-9))

    rep.section("(3) Parseval: sum_{k<=250} (h_k^(p))^2 rho_p^(4k+2) from the certified tables")
    rep.info("  (a lower bound of the circle mean of |f_p|^2, which is at most the mean of 1/Lambda, hence at most B_p)")
    for p in range(6):
        head = common.channel_head(p, "interval")
        up = sum(common.abs_sup(lo, hi) ** 2 * rho[p] ** (4 * k + 2) for k, (lo, hi) in enumerate(head))
        last = common.abs_sup(*head[250]) ** 2 * rho[p] ** 1002
        rep.info(f"  channel {p}: partial sum <= {dec_up(up, 9)}; its last term (k = 250) is {sci(last, 3)}; "
                 f"mean of 1/Lambda = {means[p]:.7f}; B_p = {dec(B[p], 6)}")
        rep.check("interval", f"channel {p}: the Parseval sum over the head is <= B_p", up <= B[p])
        rep.check("floating point", f"channel {p}: the Parseval sum over the head is <= the mean of 1/Lambda",
                  float(up) <= means[p])

    rep.section("(4) Tail bounds sqrt(B rho^-1006 / (1 - rho^-4)) for sum_{k>250} |h_k^(p)|")
    rep.info("  p   from B_p        from the numerical mean          tau_p")
    for p in range(6):
        r = float(rho[p])
        log_scale = -1006 * math.log(r) - math.log1p(-r ** -4)
        from_b = math.sqrt(float(B[p])) * math.exp(log_scale / 2)
        from_mean = math.sqrt(means[p]) * math.exp(log_scale / 2)
        rep.info(f"  {p}   {from_b:.6e}    {from_mean:.6e}                     {sci(tau[p], 6)}")
        rep.check("floating point", f"channel {p}: the tail bound from B_p is <= tau_p (01 checks this exactly)",
                  from_b <= float(tau[p]))
    wt = sum(par["wQ"][p] * tau[p] for p in range(6))
    rep.info(f"  weighted tail allowance sum_p w_p tau_p = {sci(wt, 6)}")
    return rep.finish()


if __name__ == "__main__":
    common.main_guard(main)
