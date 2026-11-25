# [stage 2c copy of degree5-cert/cert2b/lpfloat2.py: constants and the nu-range from gamecfg.py; nothing else changed]
# Float moment+radius LP sup for a row from its caps file (N): the target for the exact cover.
#   sup over sigma, nu (cap nodes), m of  max_law E chord(sigma sqrt U; nu) - kappa sigma^2 - nu^2/eta
#   law: E1 = 1, E U = 1, E U^2 = m, E U^3 <= 9m-12+C6(m-2)^1.5, E sqrt U <= rho = 0.95133.
import sys, json, numpy as np
from fractions import Fraction as F
from scipy.optimize import linprog
import os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import gamecfg as _G
E1, ETA, C6, RHO = float(_G.EPS1), float(_G.ETA), 40.45313, float(_G.RHO)     # stage 2c: from game.json
def lp_sup(capsfile, sig_hi=1.25, sig_step=0.02):
    d = json.load(open(capsfile))
    bA, bB = float(F(d['row']['bA'])), float(F(d['row']['bB']))
    kap = 1 / E1 - (bA ** 2 + bB ** 2) / ETA
    lip = 2 * np.sqrt(1 + bA ** 2 + bB ** 2)
    U = np.concatenate([[0.0], np.linspace(0, 20, 601)[1:], np.linspace(20, 600, 120)[1:]])
    best = (-9, None)
    for k, v in d['caps'].items():
        nu = float(F(k))
        if not (_G.LP_NU_RANGE[0] <= nu <= _G.LP_NU_RANGE[1]): continue
        S = np.array([float(F(a)) for a, _ in v]); C = np.array([float(F(b)) for _, b in v])
        f = lambda s: np.where(s <= S[-1], np.interp(s, S, C), C[-1] + lip * (s - S[-1]))
        for sig in np.arange(0.0, sig_hi, sig_step):
            fu = f(sig * np.sqrt(U))
            for m in (2.0, 2.05, 2.2, 2.5, 3.0, 3.5, 4.0, 5.0, 7.0, 10.0, 20.0, 44.0):
                r = linprog(-fu, A_ub=[U ** 3, np.sqrt(U)], b_ub=[9 * m - 12 + C6 * (m - 2) ** 1.5, float(_G.rho_on_s(F(m - 2).limit_denominator(1000), F(m - 2).limit_denominator(1000)))],
                            A_eq=np.vstack([np.ones_like(U), U, U ** 2]), b_eq=[1, 1, m], bounds=(0, None), method='highs')
                if r.status == 0:
                    val = -r.fun - kap * sig * sig - nu * nu / ETA
                    if val > best[0]: best = (val, (round(sig, 3), nu, m))
    return best
if __name__ == '__main__':
    print(json.dumps(lp_sup(sys.argv[1])))
