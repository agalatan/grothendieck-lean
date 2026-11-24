#!/usr/bin/env python3
"""Hardy tails of unsmoothed two-coordinate channels by the pointwise Gaussian Schur bound that both
Lean developments certify (article, Section 4, item 2; CircleCheck.gaussianDen), in floating point.

For covariance diag(r1, r2), r_c = t P_c(t^2), and a parameter 0 < j < 1/2:
  g+- = Re 1/(1 -+ r) - j,  Z = (g+ + g-)/2,  Cr = (g+ - g-)/2,  Ci = Im(1/(1-r) - 1/(1+r))/2,
  T = g- g+ / Z,  E = (Cr^2 + Ci^2)/(2Z)       (per coordinate; all matrices are diagonal)
  |f(t)|^2 <= 1 / (16 j^2 prod_c |1-r_c|^2 |1+r_c|^2 Z_c (T_c + j)(T_c + 2E_c + j)),
valid where g+-> 0 in both coordinates.  B(rho, j) = circle mean of the right-hand side; then
  sum_{k >= K} |h_k| <= sqrt(B rho^-(4K+2) / (1 - rho^-4))     (Hardy tail lemma).
Analyticity needs |Re r_c(t)| < 1 on the closed disk of radius rho (checked on the circle; harmonic).

Label N: uniform grids, float64; a certificate needs the adaptive interval cover of the Lean checker.
Agent-ID: claude-b9ee (worker).  Usage: schur_tail.py OUT.json [a1 a2 ...]  (a as p/q)"""
import json, sys
from fractions import Fraction as Q
import numpy as np

def rvals(P, rho, n):
    th = 2 * np.pi * (np.arange(n) + 0.5) / n
    t = rho * np.exp(1j * th)
    return t * np.polyval(list(P)[::-1], t * t)

def pointwise(rs, j):
    den = 16 * j * j * np.ones(rs[0].shape)
    ok = np.ones(rs[0].shape, bool)
    for r in rs:
        ip, im = 1 / (1 - r), 1 / (1 + r)
        gp, gm = ip.real - j, im.real - j
        ok &= (gp > 0) & (gm > 0)
        Z = (gp + gm) / 2; Cr = (gp - gm) / 2; Ci = (ip.imag - im.imag) / 2
        T = gm * gp / Z; E = (Cr * Cr + Ci * Ci) / (2 * Z)
        den = den * np.abs(1 - r) ** 2 * np.abs(1 + r) ** 2 * Z * (T + j) * (T + 2 * E + j)
    return np.where(ok, 1 / den, np.inf)

def budget(P1, P2, rho, j, n=1 << 16):
    """Circle mean of the pointwise bound (midpoint rule, n points); inf if not admissible."""
    rs = [rvals(P1, rho, n), rvals(P2, rho, n)]
    if max(np.abs(r.real).max() for r in rs) >= 1:
        return np.inf
    return float(pointwise(rs, j).mean())

def tail(B, rho, K):
    """Bound on sum_{k >= K} |h_k|."""
    return float(np.sqrt(B * rho ** -(4.0 * K + 2) / (1 - rho ** -4.0)))

def r_reg(P, lo=1.0, hi=2.0):
    """Largest radius with |Re r| < 1 on the circle (bisection; Re r is harmonic, so on the disk)."""
    for _ in range(60):
        mid = (lo + hi) / 2
        if np.abs(rvals(P, mid, 1 << 14).real).max() < 1: lo = mid
        else: hi = mid
    return lo

def best(P1, P2, K, rhos, js, n=1 << 14):
    out = None
    for rho in rhos:
        for j in js:
            B = budget(P1, P2, rho, j, n)
            if np.isfinite(B):
                t = tail(B, rho, K)
                if out is None or t < out[0]: out = (t, rho, j, B)
    return out

if __name__ == "__main__":
    D12 = 10 ** 12
    res = {"validation": [], "new": {}}
    print("== validation against certified budgets (the float mean must be a little below the certified B) ==")
    p2 = [n / D12 for n in (91987193366, -494518221970, 403975324766, -99055436, 0, 0, 0,
                             -27080072, -217490491, -7730415, 0, -10946266, 0, 475570792, 8681386426)]
    r3 = [980543369477 / D12, -19456630523 / D12]; r4 = [930767036298 / D12, -69232963702 / D12]
    r18 = [91942572547021e-14, -8057427452979e-14]
    for name, P1, P2, rho, j, Bc in (("six channel 2 (phase, P2)", p2, [0.0], 1.03, 0.2, 2.919013),
                                     ("six channel 3 (tiger, R3)", [-x for x in r3], r3, 1.035, 0.4, 1.692090),
                                     ("six channel 4 (tiger, R4)", [-x for x in r4], r4, 1.09, 0.4, 1.658129),
                                     ("eighteen cell channel (search value 1.423561197753204, Lean budget 2)", r18, r18, 1.09, 0.35, 1.423561197753204)):
        vals = [budget(P1, P2, rho, j, n) for n in (1 << 14, 1 << 16, 1 << 18)]
        print("%-75s rho %.4f j %.2f: mean %.9f / %.9f / %.9f (2^14, 2^16, 2^18 points) ; certified/quoted %.6f"
              % (name, rho, j, *vals, Bc))
        res["validation"].append(dict(name=name, rho=rho, j=j, mean_2e18=vals[2], reference=Bc))
    print("\n== new cell copies R = [a, -(1-a)] (both coordinates R) ==")
    rhos = np.round(np.arange(1.02, 1.30, 0.0025), 4); js = np.round(np.arange(0.05, 0.50, 0.025), 3)
    for aq in [Q(x) for x in sys.argv[2:]] or [Q(n, 10000) for n in (9000, 9194, 9300, 9305, 9310, 9315, 9320, 9400, 9500)]:
        a = float(aq); R = [a, a - 1]
        rr = r_reg(R)
        rec = dict(a=str(aq), r_reg=rr)
        line = "a = %.4f: r_reg = %.5f" % (a, rr)
        for K in (126, 251):
            t, rho, j, B = best(R, R, K, rhos[rhos < rr], js)
            B2 = budget(R, R, rho, j, 1 << 18)
            rec[f"best_K{K}"] = dict(rho=float(rho), j=float(j), B=B2, tail=tail(B2, rho, K))
            line += " | K=%d: best rho %.4f j %.3f B %.6f tail %.3e" % (K, rho, j, B2, tail(B2, rho, K))
        B109 = min(budget(R, R, 1.09, j, 1 << 18) for j in js); j109 = min(js, key=lambda j: budget(R, R, 1.09, j, 1 << 16))
        rec["rho_1.09"] = dict(j=float(j109), B=B109, tail126=tail(B109, 1.09, 126), tail251=tail(B109, 1.09, 251),
                               tail126_budget2=tail(2.0, 1.09, 126))
        line += " | rho 1.09: best j %.3f B %.6f tail126 %.4e (with budget 2: %.4e)" % (j109, B109, tail(B109, 1.09, 126), tail(2.0, 1.09, 126))
        B115 = min(budget(R, R, 1.15, j, 1 << 18) for j in js) if rr > 1.151 else float('inf')
        rec["rho_1.15"] = dict(B=B115, tail126=tail(B115, 1.15, 126))
        line += " | rho 1.15: B %.6f tail126 %.3e" % (B115, tail(B115, 1.15, 126))
        print(line); res["new"][rec["a"]] = rec
    json.dump(res, open(sys.argv[1], "w"), indent=1)
