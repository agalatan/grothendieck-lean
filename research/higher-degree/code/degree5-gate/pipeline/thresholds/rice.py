# [copy from research/higher-degree/code/degree5-content/ or degree5-cert/content5/code/ (the content study of claude-b9ee's workers);
#  claude-b9ee worker d5newcap, 16 Nov 2026: the game constants come from the environment (D5_E1, D5_ETA) and Clarabel is
#  single-threaded; nothing else changed unless noted]
# Response-side constraints for the capped game (degree-5 analogue of ledger 2.12a/2.12b), and the law-dependent
# Rice support family:  for every lambda >= 0,  E rho(lambda^2 u U) - lambda u / e1 >= t   (actual responses with P10 h = t Z).
import numpy as np, cvxpy as cp
from scipy.special import ive
import lawstein as LS
import os as _os
R = np.sqrt(np.pi) / 2; E1 = float(_os.environ['D5_E1'])     # d5newcap: lambda_1 from the environment (the study had 0.78)
def rho(x):
    x = np.asarray(x, float); return R * ((1 + x) * ive(0, x / 2) + x * ive(1, x / 2))
LAMS = np.concatenate([np.linspace(0.1, 3.0, 30), np.linspace(3.2, 8.0, 13)])
def rice_rows(U, u, tlo, lams=LAMS):
    """rows (A, b): A @ p >= b  for each lambda."""
    A = np.array([rho(l * l * u * U) for l in lams]); b = np.array([tlo + l * u / E1 for l in lams])
    return A, b
# d5newcap, 16 Nov 2026 (optional, OFF by default): the proved s-dependent radius input (K ledger 3.7, certificate N) as one more
# linear constraint on the law, E sqrt(U) <= B(chi) (chi = E U^2 - 2 = s).  LAW_RADIUS = path of radius/rho_table_N.json.
_RAD = None
if _os.environ.get('LAW_RADIUS'):
    import json as _json
    from fractions import Fraction as _Fr
    _RAD = [tuple(float(_Fr(x)) for x in r) for r in _json.load(open(_os.environ['LAW_RADIUS']))['rows']]
def radius_of_chi(chi):
    c = [bl + (bh - bl) * (chi - a) / (b - a) for (a, b, bl, bh) in _RAD if a - 1e-12 <= chi <= b + 1e-12]
    return min(min(c), 0.93) if c else 0.93
def law_constraints(U, chi, stein=True):
    n = len(U); m = 2 + chi; p = cp.Variable(n, nonneg=True)
    cons = [cp.sum(p) == 1, U @ p == 1, (U ** 2) @ p == m, (U ** 3) @ p <= 6 + 9 * chi + LS.C6 * chi ** 1.5]
    if _RAD is not None: cons.append(np.sqrt(U) @ p <= radius_of_chi(chi))
    if stein:
        x = cp.Variable(n); r = cp.Variable(n); sx = cp.Variable(n, nonneg=True); sr = cp.Variable(n, nonneg=True)
        P = U @ x; Q = U @ r
        cons += [cp.sum(x) == 0, 2 * P + Q == chi, Q <= chi / 3, Q >= 0, cp.sum(sx) <= 2 * P / 3, cp.sum(sr) <= 2 * Q / 3,
                 cp.SOC(sx + p, cp.vstack([2 * x, sx - p]), axis=0), cp.SOC(sr + p, cp.vstack([2 * r, sr - p]), axis=0)]
        F, Fp = LS.tests(U)
        for f, fp in zip(F, Fp):
            cons.append((U * f) @ p == (f + U * fp) @ (p + x) + (U * fp) @ r)
    return p, cons
def feasible_margin(U, u, chi, tlo, stein=True):
    """max over admissible laws of min_lambda [E rho(l^2 u U) - l u/e1 - tlo]  (>= 0 iff some law is a possible response)."""
    p, cons = law_constraints(U, chi, stein); s = cp.Variable()
    A, b = rice_rows(U, u, 0.0)
    cons += [A @ p - b >= s]
    pr = cp.Problem(cp.Maximize(s), cons); pr.solve(solver='CLARABEL', max_threads=1)
    return pr.value - tlo
