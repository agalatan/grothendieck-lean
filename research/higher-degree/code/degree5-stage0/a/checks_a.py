# Stage 0 (a): two checks at a fixed row and a fixed point (sigma, nu, s) (N).  A research worker of claude-b9ee.
#  1. discretisation of the enriched classes: the value with the default atoms and tests, with twice the atoms, with
#     finer tests, and with both (finer atoms raise the value, finer tests lower it);
#  2. the atom at zero: the plain class with the extra constraint P(U <= a) <= m for several (a, m): how much a small-ball
#     input alone would lower the row.
#   usage: checks_a.py E1 ETA t l beta bA bB sigma nu s OUT.json
import sys, os, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, s0core as C, oracles as O, enriched as En
from scipy.optimize import linprog
e1, eta, t = map(float, sys.argv[1:4]); p = [float(x) for x in sys.argv[4:8]]; sig, nu, s = map(float, sys.argv[8:11])
eng = C.Engine(e1, eta); kap = eng.kappa(p); cst = eng.cconst(t, p) - kap * sig * sig - nu * nu / eta
rho = O.rho_fn('KOUL3')(s); out = dict(e1=e1, eta=eta, t=t, p=p, sig=sig, nu=nu, s=s, rho=rho, disc=[], ball=[])
r0 = En.atoms_default() ** 0.5; rf = np.unique(np.concatenate([r0, (r0[1:] + r0[:-1]) / 2]))
k0 = En.knots_default() ** 0.5; kf = np.unique(np.concatenate([k0, (k0[1:] + k0[:-1]) / 2]))
for third in (False, True):
    for (an, a) in (('default', r0), ('double', rf)):
        for (kn, k) in (('default', k0), ('double', kf)):
            E = En.Enriched(third=third, knots=k ** 2, atoms=a ** 2); t0 = time.time()
            o = E.solve(eng.psi(p, sig * np.sqrt(E.v), nu), s, rho)
            rec = dict(cls='E3' if third else 'E2', atoms=an, tests=kn, natoms=E.N, ntests=len(k), value=None if o is None else cst + o[0],
                       mass_U_le_1e3=None if o is None else float(o[1][E.v <= 1e-3].sum()), mass_U_le_1e2=None if o is None else float(o[1][E.v <= 1e-2].sum()), secs=time.time() - t0)
            out['disc'].append(rec); print(rec, flush=True)
U = O.UGRID; f = None
tab = C.PsiTable(eng, p, [nu]); f = tab(0, sig * np.sqrt(U))
def lp(extra=None):
    A = [U ** 3, np.sqrt(U)]; b = [6 + 9 * s + O.C6 * s ** 1.5, rho]
    if extra: A.append((U <= extra[0]).astype(float)); b.append(extra[1])
    r = linprog(-f, A_ub=np.vstack(A), b_ub=b, A_eq=np.vstack([np.ones_like(U), U, U ** 2]), b_eq=[1, 1, 2 + s], bounds=(0, None), method='highs')
    return (cst - r.fun, float(r.x[U <= 1e-3].sum()), float(r.x @ np.sqrt(U))) if r.status == 0 else (None, None, None)
v, m0, er = lp(); out['ball'].append(dict(a=None, m=None, value=v, mass_U_le_1e3=m0, Er=er)); print(out['ball'][-1])
for a in (1e-3, 1e-2, 0.05, 0.1):
    for m in (0.08, 0.04, 0.02, 0.01, 0.005, 1 - np.exp(-a)):
        v, m0, er = lp((a, m)); out['ball'].append(dict(a=a, m=float(m), value=v, mass_U_le_1e3=m0, Er=er)); print(out['ball'][-1], flush=True)
json.dump(out, open(sys.argv[11], 'w'), indent=1)
