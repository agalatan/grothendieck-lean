# Law-aware rows of a degree-5 game (N): minimise over p = (l, beta, bA, bB) the row value at t with the q-only supremum
# taken over the moment + radius law class (float LP on a grid), as degree5-cert/cert2/lawrow.py does, but by a bundle
# (cutting-plane) method instead of Nelder-Mead.          claude-b9ee worker d5newcap, 16 Nov 2026.
#
#   value(p) = t^2 - 2 l t + 2 beta^2/e1 + sup_{sigma, nu, m, law} [E Psi5(sigma sqrt U; nu; p) - kappa(p) sigma^2 - nu^2/eta],
#   law of U >= 0:  E 1 = 1, E U = 1, E U^2 = m, E U^3 <= 9m - 12 + C6 (m-2)^1.5, E sqrt U <= rho.
# value(p) is convex in p.  A "scenario" is a point (sigma, nu, discrete law) found by the LP oracle; for a fixed scenario
# the bracket is an explicit convex function of p, evaluated with its gradient by direct quadrature.  The master problem
# min_p max_scenarios is solved by SLSQP in epigraph form; the oracle is called at its solution; repeat until the oracle
# value (upper bound) meets the master value (lower bound).
# With STEIN=1 the final row is also evaluated with the scalar Stein family added to the law class (float SDP on a grid
# of R = sqrt U, hat basis of smallt/cert.py), on a local grid of (sigma, nu, s) around the LP maximiser.
# usage: D5_E1=.. D5_ETA=.. D5_RHO=p/q lawbundle.py t [l beta bA bB]   -> one JSON line
import sys, os, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as F
import numpy as np, d5eng2 as D
from scipy.optimize import minimize, linprog
from scipy.interpolate import CubicSpline

E1, ETA = D.E1, D.ETA
RHO = float(F(os.environ['D5_RHO'])); C6 = 40.45313
# optional s-dependent radius input (radius/rho_table_N.json): E sqrt(U) <= B(s), s = E U^2 - 2; rows [s_lo, s_hi, B_lo, B_hi],
# on a row the bound is the chord of its two endpoint bounds; a point on a row boundary takes the smaller of the two rows.
RHO_TABLE = None
if os.environ.get('D5_RHO_TABLE'):
    RHO_TABLE = [tuple(float(F(x)) for x in r) for r in json.load(open(os.environ['D5_RHO_TABLE']))['rows']]
def rho_of_s(s):
    if RHO_TABLE is None: return RHO
    c = [bl + (bh - bl) * (s - a) / (b - a) for (a, b, bl, bh) in RHO_TABLE if a - 1e-12 <= s <= b + 1e-12]
    return min(min(c), RHO) if c else RHO
GRID = D.zgrid(npan=40, nq=8, nth=256, half=True)
Z, WZ = GRID; TT = np.abs(Z) ** 2
E11 = D.e_ab(1, 1, Z); E20 = D.e_ab(2, 0, Z); E32 = D.e_ab(3, 2, Z)
SMAX = 12.0
S = np.concatenate([np.linspace(0, 8, 321), np.linspace(8, SMAX, 41)[1:]])
NU = np.array([float(x) for x in os.environ.get('LAW_NUS', '0,0.005,0.01,0.015,0.02,0.03').split(',')])
U = np.concatenate([[0.0], np.linspace(0, 20, 401)[1:], np.linspace(20, 600, 80)[1:]])
MS = (2.0, 2.5, 3.0, 3.5, 4.0, 5.0, 7.0, 10.0)
SIGS = np.arange(0.20, 1.1001, 0.025)

def kappa(p): return 1 / E1 - (p[2] ** 2 + p[3] ** 2) / ETA
def cconst(t, p): return t * t - 2 * p[0] * t + 2 * p[1] ** 2 / E1

def psi_direct(p, s_arr, nu, grad=True):
    """Psi5(s; nu) = E_z |L + nu e32 + s D| + |L + nu e32 - s D| and its p-gradient, direct quadrature (arrays over s)."""
    l, beta, bA, bB = p
    base = Z * (l + beta * (TT - 2)) + nu * E32; Dz = 1 - bA * E11 - bB * E20
    vals = np.empty(len(s_arr)); G = np.zeros((len(s_arr), 4))
    for i, s in enumerate(s_arr):
        Ap = base + s * Dz; Am = base - s * Dz; ap = np.abs(Ap); am = np.abs(Am)
        vals[i] = (ap + am) @ WZ
        if grad:
            pp = np.conj(Ap / np.maximum(ap, 1e-300)); pm = np.conj(Am / np.maximum(am, 1e-300)); sm = pp + pm; df = pp - pm
            G[i] = [np.real(sm * Z) @ WZ, np.real(sm * Z * (TT - 2)) @ WZ, np.real(df * (-s * E11)) @ WZ, np.real(df * (-s * E20)) @ WZ]
    return vals, G

def scen_value(t, p, sc, grad=True):
    """c(p) + E_law Psi(sigma sqrt U; nu; p) - kappa(p) sigma^2 - nu^2/eta for a scenario sc = (sigma, nu, s-atoms, weights)."""
    sig, nu, sat, w = sc
    v, G = psi_direct(p, sat, nu, grad)
    val = cconst(t, p) + w @ v - kappa(p) * sig ** 2 - nu ** 2 / ETA
    g = w @ G + np.array([-2 * t, 4 * p[1] / E1, 2 * p[2] * sig ** 2 / ETA, 2 * p[3] * sig ** 2 / ETA])
    return val, g

def psi_table(p):
    rw = D.Row(0.0, p[0], p[1], p[2], p[3], grid=GRID)
    return rw.psi_grid(S, NU)

def lp_law(fu, m):
    r = linprog(-fu, A_ub=[U ** 3, np.sqrt(U)], b_ub=[9 * m - 12 + C6 * (m - 2) ** 1.5, rho_of_s(m - 2)],
                A_eq=np.vstack([np.ones_like(U), U, U ** 2]), b_eq=[1, 1, m], bounds=(0, None), method='highs')
    return (-r.fun, r.x) if r.status == 0 else (None, None)

def oracle(t, p, sigs=SIGS, ms=MS, keep=4):
    """sup over the (sigma, nu, m) grid; returns the value and the best scenarios (one per nu, the top `keep`)."""
    P = psi_table(p); kap = kappa(p); out = []
    assert P.shape == (len(S), len(NU)), 'one column of Psi per nu'      # [gate worker, 25 Nov 2026]
    for j, nu in enumerate(NU):
        sp = CubicSpline(S, P[:, j])
        best = None
        for sig in sigs:
            s = sig * np.sqrt(U); ok = s <= SMAX
            fu = np.where(ok, sp(np.minimum(s, SMAX)), -1e3)          # atoms beyond SMAX are not allowed on this grid
            for m in ms:
                v, x = lp_law(fu, m)
                if v is None: continue
                val = v - kap * sig * sig - nu * nu / ETA
                if best is None or val > best[0]: best = (val, sig, nu, m, x)
        if best is not None: out.append(best)
    out.sort(key=lambda b: -b[0])
    scs = []
    for val, sig, nu, m, x in out[:keep]:
        idx = np.where(x > 1e-9)[0]
        scs.append((sig, nu, sig * np.sqrt(U[idx]), x[idx] / x[idx].sum()))
    val, sig, nu, m, x = out[0]
    return val, (sig, nu, m), scs

def master(t, pool, p0, box):
    """min over p (within the box around p0) of max_i scen_value_i(p), epigraph SLSQP with analytic gradients."""
    def cons_f(xv):
        return np.array([xv[4] - scen_value(t, xv[:4], sc, grad=False)[0] for sc in pool])
    def cons_j(xv):
        J = np.zeros((len(pool), 5))
        for i, sc in enumerate(pool):
            J[i, :4] = -scen_value(t, xv[:4], sc)[1]; J[i, 4] = 1
        return J
    tau0 = max(scen_value(t, p0, sc, grad=False)[0] for sc in pool)
    x0 = np.concatenate([p0, [tau0]])
    bnds = [(p0[i] - box[i], p0[i] + box[i]) for i in range(4)] + [(None, None)]
    res = minimize(lambda xv: xv[4], x0, jac=lambda xv: np.array([0, 0, 0, 0, 1.0]), method='SLSQP', bounds=bnds,
                   constraints=[dict(type='ineq', fun=cons_f, jac=cons_j)], options=dict(ftol=1e-11, maxiter=200))
    return list(res.x[:4]), float(res.x[4])

def optimise(t, p0, rounds=25, tol=2e-6, verbose=True, orc=None, box0=(0.08, 0.05, 0.05, 0.05)):
    orc = orc or oracle
    p = list(p0); pool = []; best = None; box = np.array(box0); t0 = time.time(); stall = 0
    for it in range(rounds):
        G, arg, scs = orc(t, p)
        ub = cconst(t, p) + G
        prev_best = best[0] if best else None
        if best is None or ub < best[0]: best = (ub, list(p), arg)
        else: box = box * 0.6                      # no progress: shrink the trust box around the incumbent
        stall = (stall + 1) if (prev_best is not None and prev_best - best[0] < 2e-7) else 0
        pool += scs
        pn, lb = master(t, pool, best[1], box)
        if verbose:
            print('  it %d: value %.7f (best %.7f) master %.7f gap %.1e  p = %s at %s  pool %d (%.0fs)' % (
                it, ub, best[0], lb, best[0] - lb, ['%.5f' % v for v in p], arg, len(pool), time.time() - t0), file=sys.stderr, flush=True)
        if best[0] - lb < tol or stall >= 2: break
        p = pn
    return best, pool

# ---------------------------------------------------------------- Stein evaluation (float SDP on a grid of R)
def stein_tables():
    sys.path.insert(0, os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'smallt'))
    os.environ.setdefault('ST_E1', str(F(E1).limit_denominator(10 ** 6))); os.environ.setdefault('ST_ETA', str(F(ETA).limit_denominator(10 ** 6)))
    os.environ.setdefault('ST_RHO', os.environ['D5_RHO'])
    import cert as C
    R = np.concatenate([np.linspace(0, 0.3, 31), np.linspace(0.3, 2.5, 221)[1:], np.linspace(2.5, 8, 111)[1:], np.linspace(8, 20, 25)[1:]])
    nth = 2000; Ug = np.abs(np.cos((2 * np.arange(1, nth + 1) - 1) * np.pi / (2 * nth)))
    A = np.zeros((len(R), C.K)); M = np.zeros((len(R), C.K, C.K))
    for i, r in enumerate(R):
        X = r * Ug; phi, Phi = C.hats(X)
        A[i] = (X[:, None] * Phi - phi / 2).mean(axis=0); M[i] = phi.T @ phi / nth
    return R, A, M.reshape(len(R), C.K * C.K), C.K

def stein_eval(t, p, arg, tabs, dsig=(-0.09, -0.06, -0.03, 0.0, 0.03, 0.06, 0.09), ss=(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 8.0)):
    """sup over a local grid of (sigma, nu, s) of the SDP value with moments + radius + Stein; returns (value, argmax)."""
    import cvxpy as cp
    R, A, Mflat, K = tabs
    P = psi_table(p); kap = kappa(p); lip = 2 * np.sqrt(1 + p[2] ** 2 + p[3] ** 2)
    best = (-9, None)
    for j in range(len(NU)):                      # every nu of the grid (the Stein maximiser can sit at another nu than the LP's)
        nu = NU[j]; sp = CubicSpline(S, P[:, j])
        for ds in dsig:
            sig = arg[0] + ds
            if sig <= 0: continue
            s_ = sig * R
            obj = np.where(s_ <= SMAX, sp(np.minimum(s_, SMAX)), P[-1, j] + lip * (s_ - SMAX))
            for s in ss:
                q = cp.Variable(len(R), nonneg=True)
                cons = [cp.sum(q) == 1, R ** 2 @ q == 1, R ** 4 @ q == 2 + s, R ** 6 @ q <= 6 + 9 * s + C6 * s ** 1.5, R @ q <= rho_of_s(s)]
                Mb = cp.reshape(Mflat.T @ q, (K, K), order='C'); ab = A.T @ q
                cons.append(cp.bmat([[(Mb + Mb.T) / 2, cp.reshape(ab, (K, 1), order='C')], [cp.reshape(ab, (1, K), order='C'), np.array([[s / 12]])]]) >> 0)
                pr = cp.Problem(cp.Maximize(obj @ q), cons)
                try: pr.solve(solver='CLARABEL', max_threads=1)
                except Exception: continue
                if pr.value is None: continue
                v = pr.value - kap * sig * sig - nu * nu / ETA
                if v > best[0]: best = (v, (round(float(sig), 4), float(nu), s, float(q.value[R < 0.15].sum())))
    return best

def make_stein_oracle(tabs, center, dsig=(-0.06, -0.03, 0.0, 0.03, 0.06), ss=(2.0, 3.0, 4.0, 5.0, 6.0), keep=3):
    """oracle for the moment + radius + Stein class: SDPs on a local grid of (sigma, nu, s) around `center` (which follows
    the maximiser from call to call); scenarios = the SDP laws (atoms on the R grid)."""
    import cvxpy as cp
    R, A, Mflat, K = tabs
    state = dict(c=center)
    def orc(t, p):
        P = psi_table(p); kap = kappa(p); lip = 2 * np.sqrt(1 + p[2] ** 2 + p[3] ** 2); res = []
        j0 = int(np.argmin(np.abs(NU - state['c'][1])))
        for j in sorted(set([j0, min(j0 + 1, len(NU) - 1)] + ([j0 - 1] if j0 > 0 else []))):
            nu = NU[j]; sp = CubicSpline(S, P[:, j])
            for ds in dsig:
                sig = state['c'][0] + ds
                if sig <= 0.02: continue
                s_ = sig * R
                obj = np.where(s_ <= SMAX, sp(np.minimum(s_, SMAX)), P[-1, j] + lip * (s_ - SMAX))
                for s in ss:
                    q = cp.Variable(len(R), nonneg=True)
                    cons = [cp.sum(q) == 1, R ** 2 @ q == 1, R ** 4 @ q == 2 + s, R ** 6 @ q <= 6 + 9 * s + C6 * s ** 1.5, R @ q <= rho_of_s(s)]
                    Mb = cp.reshape(Mflat.T @ q, (K, K), order='C'); ab = A.T @ q
                    cons.append(cp.bmat([[(Mb + Mb.T) / 2, cp.reshape(ab, (K, 1), order='C')], [cp.reshape(ab, (1, K), order='C'), np.array([[s / 12]])]]) >> 0)
                    pr = cp.Problem(cp.Maximize(obj @ q), cons)
                    try: pr.solve(solver='CLARABEL', max_threads=1)
                    except Exception: continue
                    if pr.value is None or q.value is None: continue
                    res.append((pr.value - kap * sig * sig - nu * nu / ETA, float(sig), float(nu), s, np.maximum(q.value, 0)))
        res.sort(key=lambda b: -b[0])
        scs = []
        for val, sig, nu, s, x in res[:keep]:
            idx = np.where(x > 1e-7)[0]
            scs.append((sig, nu, sig * R[idx], x[idx] / x[idx].sum()))
        val, sig, nu, s, x = res[0]
        state['c'] = (sig, nu)
        return val, (round(sig, 4), nu, s, float(x[R < 0.15].sum())), scs
    return orc

if __name__ == '__main__':
    t = float(sys.argv[1])
    p0 = [float(x) for x in sys.argv[2:6]] if len(sys.argv) >= 6 else [0.9 * t, 0.005, -0.001, -0.001]
    t0 = time.time()
    if os.environ.get('FIX_P') == '1':                 # evaluate the given row only (e.g. the zero row at t = 0)
        G, arg, _ = oracle(t, p0); best = (cconst(t, p0) + G, list(p0), arg)
    else:
        best, pool = optimise(t, p0)
    val, p, arg = best
    rec = dict(t=t, l=p[0], beta=p[1], bA=p[2], bB=p[3], value=val, lp_arg=arg, C=val - t * t + 2 * p[0] * t, room=500 / 701 - val,
               e1=E1, eta=ETA, rho=RHO, start=p0, secs=time.time() - t0)
    if os.environ.get('STEIN') == '1':
        tabs = stein_tables()
        Gs, args = stein_eval(t, p, arg, tabs)
        rec.update(value_stein=cconst(t, p) + Gs, stein_arg=args, C_stein=cconst(t, p) + Gs - t * t + 2 * p[0] * t,
                   room_stein=500 / 701 - cconst(t, p) - Gs, secs_total=time.time() - t0)
    if os.environ.get('STEIN_OPT') == '1':
        # re-optimise the row against the moment + radius + Stein class (bundle with the SDP oracle, fresh pool)
        tabs = stein_tables()
        c0 = rec['stein_arg'][:2] if 'stein_arg' in rec else arg[:2]
        if os.environ.get('FIX_P') == '1':
            G2, a2, _ = make_stein_oracle(tabs, c0, dsig=(-0.09, -0.06, -0.03, 0.0, 0.03, 0.06, 0.09), ss=(1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 8.0))(t, p)
            b2 = (cconst(t, p) + G2, p, a2)
        else:
            b2, _ = optimise(t, p, rounds=int(os.environ.get('STEIN_ROUNDS', 8)), tol=5e-6, orc=make_stein_oracle(tabs, c0), box0=(0.05, 0.03, 0.03, 0.03))
        v2, p2, a2 = b2
        # final value of the optimised row: the wide scan (every nu, 7 sigma, s = 1..8) around the last maximiser
        Gf, af = stein_eval(t, p2, a2, tabs)
        v2 = max(v2, cconst(t, p2) + Gf)
        rec.update(stein_opt=dict(l=p2[0], beta=p2[1], bA=p2[2], bB=p2[3], value=v2, arg=a2, arg_scan=af, C=v2 - t * t + 2 * p2[0] * t, room=500 / 701 - v2),
                   secs_total=time.time() - t0)
    print(json.dumps(rec), flush=True)
