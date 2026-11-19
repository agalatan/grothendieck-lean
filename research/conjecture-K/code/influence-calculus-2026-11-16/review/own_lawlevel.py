#!/usr/bin/env python3
"""Reviewer's numerics for the consumer form of Theorem 9 (label N): the worst case over LAWS.

For the tilt 3/5 at the peak row and a cell (u, chi), with delta = chi u^2:

    W(u, chi) = sup { T(u, delta; mu) :  mu a law on [0, infinity),  E V = u,  E V^2 <= (2 + chi) u^2 },
    T(u, delta; mu) = max over the cap set of (sqrt(l1) sA(mu) + sqrt(l2) sB(mu))^2      (REVIEW.md section 5),

the largest value that the law-level bound can take when only (u, chi) is known.  T is concave in mu and
    (sqrt(l1) sA + sqrt(l2) sB)^2 = min over 0<s<1, m of  E_mu[ l1 (psi(V)-m)^2 / s + l2 (V h'(V))^2 / (1-s) ],
which is jointly convex in (s, m) and linear in mu, so by the minimax theorem
    sup_mu (...)^2 = min_{s,m} sup_mu E_mu[...]      (inner problem: a linear programme in mu on a grid of v),
and W = max over the extreme arc of the cap set (a single corner (2u, u) when kappa*chi >= 5).
The primal optimiser of the last LP is a feasible law; its T value is printed as a lower bound of W (duality gap).
An optional third constraint is the radius bound E sqrt(V) <= 0.95133 sqrt(u) of ledger 3.7.

usage: own_lawlevel.py <out-dir>      (needs tab_reviewer.npz written by own_numerics.py)
"""
import sys, os, math
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy.optimize import linprog, minimize, brentq
from own_numerics import Prof, cap, GAMMA, Bbench, S2

def setup(P, lab, vmax=25.0, n=1500):
    s = np.linspace(0.0, math.sqrt(vmax), n); v = s * s
    hv = P.h(lab, v); hp = P.hp(lab, v)
    return v, hv + v * hp, v * hp, P.phi(v)

def lp(v, obj, u, chi, radius):
    A_ub = [v * v / (u * u)]; b_ub = [2.0 + chi]
    if radius: A_ub.append(np.sqrt(v / u)); b_ub.append(0.95133)
    r = linprog(-obj, A_ub=np.array(A_ub), b_ub=np.array(b_ub), A_eq=np.array([np.ones_like(v), v / u]), b_eq=np.array([1.0, 1.0]),
                bounds=(0, None), method="highs")
    assert r.status == 0, r.message
    return -r.fun, r.x

def sig(x):
    """logistic map onto (0, 1), kept away from the ends (an end is optimal when l1 or l2 vanishes)."""
    return min(max(1.0 / (1.0 + math.exp(-max(min(x, 40.0), -40.0))), 1e-9), 1.0 - 1e-9)

def W_lambda(v, psi, vh, u, chi, l1, l2, radius):
    """min_{s,m} sup_mu E[l1 (psi-m)^2/s + l2 vh^2/(1-s)]  and the T-value of the final primal law."""
    def J(x):
        s = sig(x[0]); m = x[1]
        return lp(v, l1 * (psi - m) ** 2 / s + l2 * vh ** 2 / (1 - s), u, chi, radius)[0]
    best = minimize(J, [0.0, float(psi[0])], method="Nelder-Mead", options={"xatol": 2e-4, "fatol": 1e-12, "maxiter": 160,
                    "initial_simplex": [[0.0, float(psi[0])], [0.6, float(psi[0])], [0.0, float(psi[0]) - 0.02]]})
    s = sig(best.x[0]); m = best.x[1]
    val, mu = lp(v, l1 * (psi - m) ** 2 / s + l2 * vh ** 2 / (1 - s), u, chi, radius)
    mean = float(mu @ psi); sA = math.sqrt(max(float(mu @ (psi - mean) ** 2), 0.0)); sB = math.sqrt(float(mu @ vh ** 2))
    return val, (math.sqrt(l1) * sA + math.sqrt(l2) * sB) ** 2, mu

def W(v, psi, vh, u, chi, kappa, radius=False, narc=5):
    L2 = kappa * chi * u * u
    if L2 >= 5 * u * u: cands = [(2 * u, u)]
    else:
        L = math.sqrt(L2)
        t_lo = math.acos(min(2 * u / L, 1.0)) if L > 2 * u else 0.0            # l1 = L cos t <= 2u
        t_hi = math.asin(min(u / L, 1.0)) if L > u else math.pi / 2            # l2 = L sin t <= u
        cands = [(L * math.cos(t), L * math.sin(t)) for t in np.linspace(t_lo, t_hi, narc)]
    best = (-1, None, None, None)
    for (l1, l2) in cands:
        val, low, mu = W_lambda(v, psi, vh, u, chi, l1, l2, radius)
        if val > best[0]: best = (val, low, mu, (l1, l2))
    return best

def main():
    out = sys.argv[1]; P = Prof(os.path.join(out, "tab_reviewer.npz"))
    v, psi, vh, phi = setup(P, "tilt")
    print("== worst case of the law-level bound over all laws with E V = u, E V^2 <= (2+chi) u^2   (tilt 3/5, peak row)")
    print("   columns: W/delta for kappa = 1/2 (reviewer) [primal lower bound] | kappa = 3/4 (package) | with the radius constraint, kappa = 1/2 | gamma of 11.49")
    for u in (0.009, 0.02, 0.03, 0.0463):
        g = GAMMA[u]; Bu = Bbench(P, u)
        rows = {}
        for chi in (4, 8, 10, 12, 16, 24, 42):
            dl = chi * u * u
            wb, lowb, mub, lam = W(v, psi, vh, u, chi, 0.5)
            wa = W(v, psi, vh, u, chi, 0.75)[0] if 0.75 * chi < 5 or 0.5 * chi < 5 else wb
            wr = W(v, psi, vh, u, chi, 0.5, radius=True)[0] if 0.5 * chi >= 5 else float("nan")
            supp = [(float(v[k]), float(mub[k])) for k in np.argsort(-mub)[:4] if mub[k] > 1e-9]
            rows[chi] = wb
            print(f"   u={u:<6} chi={chi:<3}: {wb/dl:.4f} [{lowb/dl:.4f}] | {wa/dl:.4f} | {wr/dl:.4f} | gamma={g:.4f}   "
                  f"{'T9 wins for every law' if wb < g*dl else 'not for every law'}; extremal law (v, mass): " + ", ".join(f"({a:.4f}, {b:.4f})" for a, b in supp), flush=True)
        # crossover: smallest chi with W(u, chi) <= gamma chi u^2 (bisection on the grid values)
        f = lambda chi: W(v, psi, vh, u, chi, 0.5)[0] - g * chi * u * u
        ks = sorted(rows); lo = None
        for a, b in zip(ks[:-1], ks[1:]):
            if rows[a] - g * a * u * u > 0 >= rows[b] - g * b * u * u: lo = (a, b)
        if lo:
            x = brentq(f, lo[0], lo[1], xtol=0.05)
            print(f"   u={u}: the law-level bound is below gamma*delta for EVERY law of the class when chi >= {x:.1f} (kappa = 1/2)", flush=True)
        else:
            print(f"   u={u}: no crossover inside the scanned range; signs at the ends: {rows[ks[0]] - g*ks[0]*u*u:+.2e}, {rows[ks[-1]] - g*ks[-1]*u*u:+.2e}", flush=True)

if __name__ == "__main__":
    main()
