# Stage 0 (a): oracles (the supremum over a class of laws for a fixed row p).  N.   A research worker of claude-b9ee.
#   phys:  a finite pool of laws of explicit cubics (physlaws.py);          -> the floor (actual responses)
#   plain: laws of U >= 0 with E U = 1, E U^2 = 2 + s, E U^3 <= 6 + 9 s + C6 s^1.5, E sqrt U <= rho(s)   (ledger 4.42)
# Both search sigma and nu globally: nu on a coarse grid then a fine one around the best, sigma on a grid then a
# bounded scalar refinement; the plain class solves one LP per (sigma, nu, s) on a grid of atoms and then REFINES the
# atoms against the LP's dual function (column generation), so the value returned is a dual certificate value on the
# check grid (the largest violation of the dual inequality on the check grid is reported).
import math, json, os
import numpy as np
from scipy.optimize import linprog, minimize_scalar
from fractions import Fraction as F
import s0core as C

C6 = 40.45313
NU_COARSE = np.array([-0.03, 0.0, 0.03, 0.06, 0.10, 0.15, 0.22, 0.30])
SIG_GRID = np.concatenate([np.arange(0.02, 0.20, 0.03), np.arange(0.20, 1.2001, 0.025)])

def nu_fine(nu0, h=0.03, n=7):
    return np.unique(np.round(np.concatenate([np.linspace(nu0 - h, nu0 + h, n), [0.0]]), 6))

# ----------------------------------------------------------------------------------------------- physical pool
def make_phys_oracle(eng, laws, keep=3):
    """laws: dict name -> (r atoms at norm 1, weights)."""
    def best_for_table(tab, kap):
        res = []
        for name, (r, w) in laws.items():
            for j, nu in enumerate(tab.nus):
                vals = np.array([w @ tab(j, sig * r) - kap * sig * sig for sig in SIG_GRID]) - nu * nu / eng.eta
                i = int(np.argmax(vals)); lo = SIG_GRID[max(i - 1, 0)]; hi = SIG_GRID[min(i + 1, len(SIG_GRID) - 1)]
                rr = minimize_scalar(lambda s: -(w @ tab(j, s * r) - kap * s * s), bounds=(lo, hi), method='bounded', options={'xatol': 1e-6})
                v, sg = (-rr.fun - nu * nu / eng.eta, rr.x) if -rr.fun - nu * nu / eng.eta > vals[i] else (vals[i], SIG_GRID[i])
                res.append((v, name, float(sg), float(nu)))
        return res
    def oracle(p):
        kap = eng.kappa(p)
        res = best_for_table(C.PsiTable(eng, p, NU_COARSE), kap)
        top = max(res); res += best_for_table(C.PsiTable(eng, p, nu_fine(top[3])), kap)
        res.sort(reverse=True)
        scs = []; seen = set()
        for v, name, sg, nu in res:                      # the best point of each of the `keep` best laws
            if name in seen: continue
            seen.add(name); r, w = laws[name]; scs.append((sg, nu, sg * r, w))
            if len(seen) >= keep: break
        v, name, sg, nu = res[0]
        return v, (name, round(sg, 5), round(nu, 5)), scs
    return oracle

# ----------------------------------------------------------------------------------------------- plain class
UGRID = np.unique(np.concatenate([[0.0], np.geomspace(1e-6, 0.05, 30), np.linspace(0.05, 20, 400), np.linspace(20, 100, 81), np.geomspace(100, 1600, 60)]))
UCHECK = np.unique(np.concatenate([[0.0], np.geomspace(1e-8, 0.05, 200), np.linspace(0.05, 20, 8000), np.linspace(20, 100, 1601), np.geomspace(100, 1600, 1200)]))
S_COARSE = (0.0, 0.5, 1.0, 1.5, 2.0, 3.0, 4.0, 5.5, 8.0, 12.0, 20.0, 42.0)
NU_P_COARSE = np.array([0.0, 0.03, 0.08, 0.15, 0.25])

def rho_fn(spec):
    """spec: 'p/q' (constant), or 'KOUL3' = the s-dependent bound of K ledger 3.7 for 114/125 (P + C, author only):
    E|q| <= (sqrt(pi)/2)(1 + (3299/625000) s) on [0, 11/2]; <= 0.9118551 on [11/2, 42]; <= 0.8858275 on [25, 42]."""
    if spec == 'KOUL3':
        g = math.sqrt(math.pi) / 2
        def f(s):
            b = 0.912
            if s <= 5.5: b = min(b, g * (1 + 3299 / 625000 * s))
            if s >= 5.5: b = min(b, 0.9118551)
            if s >= 25: b = min(b, 0.8858275)
            return b
        return f
    r = float(F(spec)); return lambda s: r

def lp_plain(fu, U, s, rho):
    r = linprog(-fu, A_ub=np.vstack([U ** 3, np.sqrt(U)]), b_ub=[6 + 9 * s + C6 * s ** 1.5, rho],
                A_eq=np.vstack([np.ones_like(U), U, U ** 2]), b_eq=[1, 1, 2 + s], bounds=(0, None), method='highs')
    if r.status != 0: return None
    y_eq = r.eqlin.marginals; y_ub = r.ineqlin.marginals                     # duals of the minimisation of -f
    return -r.fun, r.x, (-y_eq, -y_ub)

def plain_point(tab, j, sig, s, rho, refine=True):
    """sup over the plain class at (sigma, nu_j, s): LP on UGRID, then atoms added where the dual inequality fails on UCHECK.
    Returns (value, atoms U, weights, largest remaining violation on UCHECK)."""
    U = UGRID.copy(); viol = None
    for rnd in range(6 if refine else 1):
        out = lp_plain(tab(j, sig * np.sqrt(U)), U, s, rho)
        if out is None: return None
        val, x, (ye, yu) = out
        if not refine: break
        dual = ye[0] + ye[1] * UCHECK + ye[2] * UCHECK ** 2 + yu[0] * UCHECK ** 3 + yu[1] * np.sqrt(UCHECK)
        gapv = tab(j, sig * np.sqrt(UCHECK)) - dual; viol = float(gapv.max())
        if viol < 1e-9: break
        idx = np.argsort(-gapv)[:200]; U = np.unique(np.concatenate([U, UCHECK[idx[gapv[idx] > 1e-10]]]))
    k = x > 1e-11
    return val, U[k], x[k] / x[k].sum(), viol

def make_plain_oracle(eng, rho_spec, keep=4, s_list=S_COARSE, log=None):
    rho = rho_fn(rho_spec)
    def scan(tab, kap, sigs, ss, refine):
        res = []
        for j, nu in enumerate(tab.nus):
            for sig in sigs:
                for s in ss:
                    o = plain_point(tab, j, sig, s, rho(s), refine=refine)
                    if o is None: continue
                    res.append((o[0] - kap * sig * sig - nu * nu / eng.eta, float(sig), float(nu), float(s), o))
        return res
    def oracle(p):
        kap = eng.kappa(p)
        res = scan(C.PsiTable(eng, p, NU_P_COARSE), kap, SIG_GRID[::3], s_list, False)
        v0, sg0, nu0, s0, _ = max(res, key=lambda b: b[0])
        # fine stage around the coarse maximiser: nu, sigma and s refined, atoms refined against the dual
        ss = sorted(set([s0] + [x for x in np.round(np.linspace(max(s0 - 1.2, 0), min(s0 + 1.2, 42), 9), 4)]))
        sigs = np.round(np.arange(max(sg0 - 0.0375, 0.01), sg0 + 0.0376, 0.0125), 5)
        res2 = scan(C.PsiTable(eng, p, nu_fine(nu0, h=0.02, n=5)), kap, sigs, ss, True)
        res2.sort(key=lambda b: -b[0])
        scs = []; seen = set()
        for v, sg, nu, s, o in res2:
            key = (round(nu, 4), round(s, 2))
            if key in seen: continue
            seen.add(key); scs.append((sg, nu, sg * np.sqrt(o[1]), o[2]))
            if len(scs) >= keep: break
        v, sg, nu, s, o = res2[0]
        mass0 = float(o[2][o[1] <= 1e-3].sum()); mass01 = float(o[2][o[1] <= 1e-2].sum())
        edge = (sg in (sigs[0], sigs[-1]) and sg > 0.02) or (s in (ss[0], ss[-1]) and 0 < s < 42) or abs(nu - tab_edge(nu0)) < 1e-9
        return v, dict(sig=sg, nu=nu, s=s, mass_U_le_1e3=mass0, mass_U_le_1e2=mass01, viol=o[3], coarse=(round(v0, 7), sg0, nu0, s0), edge=bool(edge)), scs
    return oracle
def tab_edge(nu0): return nu0 + 0.02

# ----------------------------------------------------------------------------------------------- enriched classes
S_E_COARSE = (0.0, 1.5, 4.0, 8.0, 16.0, 42.0)
SIG_E_COARSE = (0.15, 0.35, 0.5, 0.65, 0.8, 0.95)
NU_E_COARSE = np.array([0.0, 0.05, 0.15])
def make_enriched_oracle(eng, third, rho_spec, keep=3, knots=None, atoms=None, first=True, m3=True):
    """E2 (third = False) / E3 (third = True) of enriched.py, with the radius input rho_spec ('none': no radius input).
    Search: a coarse global grid of (sigma, nu, s) on the first call and whenever full=True, then coordinate refinement
    (bounded scalar searches in sigma, s and nu, twice).  Later calls start from the previous maximiser and also scan a
    reduced grid.  Returns the value, the argument and the best laws as scenarios."""
    import enriched as En
    E = En.Enriched(third=third, knots=knots, atoms=atoms, first=first)
    rho = (lambda s: None) if rho_spec == 'none' else rho_fn(rho_spec)
    rv = np.sqrt(E.v); state = dict(last=None, nsolve=0)
    def point(p, kap, sig, nu, s, cache):
        key = (round(sig, 6), round(nu, 6), round(s, 5))
        if key in cache: return cache[key]
        f = eng.psi(p, sig * rv, nu) if False else None
        return None
    def oracle(p, full=None):
        kap = eng.kappa(p); cache = {}; ptab = {}
        def val(sig, nu, s):
            key = (round(float(sig), 6), round(float(nu), 6), round(float(s), 5))
            if key not in cache:
                fk = (key[0], key[1])
                if fk not in ptab: ptab[fk] = eng.psi(p, key[0] * rv, key[1])
                o = E.solve(ptab[fk], key[2], rho(key[2]), m3=m3); state['nsolve'] += 1
                cache[key] = (-np.inf, None) if o is None else (o[0] - kap * key[0] ** 2 - key[1] ** 2 / eng.eta, o[1])
            return cache[key][0]
        do_full = (state['last'] is None) if full is None else full
        if do_full:
            for nu in NU_E_COARSE:
                for sig in SIG_E_COARSE:
                    for s in S_E_COARSE: val(sig, nu, s)
        if state['last'] is not None:
            sg, nu, s = state['last']
            for ds in (-0.05, 0.0, 0.05):
                for s2 in (max(s - 1.0, 0.0), s, min(s + 1.0, 42.0)): val(max(sg + ds, 0.02), nu, s2)
        for rep in range(2):
            (sg, nu, s) = max(cache, key=lambda k: cache[k][0])
            r = minimize_scalar(lambda x: -val(x, nu, s), bounds=(max(sg - 0.15, 0.01), sg + 0.15), method='bounded', options={'xatol': 2e-3})
            (sg, nu, s) = max(cache, key=lambda k: cache[k][0])
            r = minimize_scalar(lambda x: -val(sg, nu, x), bounds=(max(s - 2.5, 0.0), min(s + 2.5, 42.0)), method='bounded', options={'xatol': 2e-2})
            (sg, nu, s) = max(cache, key=lambda k: cache[k][0])
            r = minimize_scalar(lambda x: -val(sg, x, s), bounds=(nu - 0.04, nu + 0.04), method='bounded', options={'xatol': 1e-3})
        ranked = sorted(cache, key=lambda k: -cache[k][0])
        (sg, nu, s) = ranked[0]; state['last'] = (sg, nu, s)
        scs = []; seen = []
        for k in ranked:
            if cache[k][1] is None: continue
            if any(abs(k[1] - k2[1]) < 5e-3 and abs(k[2] - k2[2]) < 0.3 and abs(k[0] - k2[0]) < 0.03 for k2 in seen): continue
            seen.append(k); w = cache[k][1]; idx = w > 1e-9
            scs.append((k[0], k[1], k[0] * rv[idx], w[idx] / w[idx].sum()))
            if len(scs) >= keep: break
        w = cache[ranked[0]][1]
        arg = dict(sig=sg, nu=nu, s=s, mass_U_le_1e3=float(w[E.v <= 1e-3].sum()), mass_U_le_1e2=float(w[E.v <= 1e-2].sum()), mass_U_le_01=float(w[E.v <= 0.1].sum()),
                   Er=float(w @ rv / w.sum()), nsolve=state['nsolve'], full=bool(do_full))
        return cache[ranked[0]][0], arg, scs
    return oracle
