"""Tasks 1-2 (N): DUAL of the radial relaxations (robust form: few global variables, one
conic block per check point).  u = E|q|^2 = 1, V = |q|^2, s = E V^2 - 2.

Kernels (functions of v): k2 = E[c2|V], k1 = E[c1|V], at = E[rho|V], rho = Re(conj(q)^2 a)/V.
Exact facts used (all valid for every cubic q in H_{2,1}):
  (I)   E[G1(V)] = E[k2 phi1(V)] + E[at Y1(V)]                       (phi = G', Y = phi - G/v)
  (II)  E[G2(V)] = (1/2) E[k1 phi2(V)] + (1/2) E[at Y2(V)]
  pointwise cone  C = {k2 >= 0, k1 >= 0, at^2 <= k1 k2}              (c1, c2 >= 0, |a|^2 <= c1 c2)
  budgets  E q_j(k) <= B_j(par):   q1 = (k2-1)^2      B1 = 16n + 4h
                                    q2 = (k1-k2-1)^2   B2 = 16n + 20h + 16b
                                    q3 = (k1+k2-3)^2   B3 = 80n + 20h + 16b + 96y + 32z
                                    q4 = (k1-2)^2      B4 = 32n + 16h + 16b + 48y + 16z
                                    q5 = at^2          B5 = 32b + 24y
  E[V at] = 32b + 48y,   s = 32n + 8h + 32b + 96y,
  par = (n,h,b,y,z) >= 0, n,h <= 1/4, b <= n, y <= z, z^2 <= n h, (3y-z)^2 <= h (n+b+3y-z).
Certificate (weak duality): tests G1, G2, lam, mu_j >= 0, sigma with, for all v >= 0 and k in C,
  sqrt(v) <= lam0 + lam1 v + lam2 v^2 + lam3 v^3 + [G1 - k2 phi1 - at Y1] + [G2 - k1 phi2/2 - at Y2/2]
             + sum_j mu_j q_j(k) + sigma v at                                               (*)
give  E sqrt(V) <= lam0 + lam1 + lam2 (2+s) + lam3 M3 + max_par [sum_j mu_j B_j + sigma (32b+48y)].
(*) is imposed at check points through its exact conic reformulation (theta_j, xi in C*).

Modes: 'R0' the old radial family (mix identity G2 = 2 G1, one budget q3 + 2 q5 <= 3 s);
       'L'  Lean SteinInputs (separate budgets, Q <= s/3);
       'G'  Lean Gram scalars (q3, q5, E[V at], parameter set);
       'N'  everything above.
"""
import os, sys, json, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))  # needed under python -I
import numpy as np
import cvxpy as cp
from grid import r_edges, C6
from outer import test_matrices

LJ = np.array([[1, 0, 0], [-1, 1, 0], [1, 1, 0], [0, 1, 0], [0, 0, 1]], float)   # rows l_j in (k2, k1, at)
CJ = np.array([1, 1, 3, 2, 0], float)
# B_j as rows over (n, h, b, y, z)
BJ = np.array([[16, 4, 0, 0, 0], [16, 20, 16, 0, 0], [80, 20, 16, 96, 32], [32, 16, 16, 48, 16], [0, 0, 32, 24, 0]], float)
# further directions of the (c2, c1) Gram matrix (budgets 6..9): (3d + beta c)^2 with d = (c1+c2-3)/3, c = c2-1,
# E(3d + beta c)^2 = E(c1+c2-3)^2 + 2 beta <c1+c2-3, c2-1> + beta^2 E(c2-1)^2,
# <c1+c2-3, c2-1> = 32n + 4h + 24y + 8z  (the package's 3 E[dc] = 2P + Q + R + B/4)
for _beta in (-0.25, -0.5, 1.0, 3.0):
    LJ = np.vstack([LJ, [1 + _beta, 1, 0]])
    CJ = np.append(CJ, 3 + _beta)
    BJ = np.vstack([BJ, BJ[2] + 2 * _beta * np.array([32, 4, 0, 24, 8], float) + _beta ** 2 * BJ[0]])
NB = len(CJ)
EA = np.array([0, 0, 32, 48, 0], float)
SROW = np.array([32, 8, 32, 96, 0], float)
S0 = np.array([8, 2, 8, 0, 8], float)
H0 = np.array([8 / 3, 2 / 3, 8 / 3, 24, -16 / 3], float)

MODES = {
    'R0': dict(ident='mix', budgets=(3, 5), par='total', cone='none', sigma=False),
    'L': dict(ident='mix', budgets=(3, 5), par='sep', cone='none', sigma=True),
    'G': dict(ident='mix', budgets=(3, 5), par='gram', cone='none', sigma=True),
    'N': dict(ident='both', budgets=(1, 2, 3, 4, 5), par='gram', cone='cone', sigma=True),
}


def check_points(ek, sub, tail=60, tail_max=400.0):
    pts = [0.0]
    for a_, b_ in zip(ek[:-1], ek[1:]):
        pts.extend(list(a_ + (b_ - a_) * (np.arange(sub) + 0.5) / sub))
        pts.append(b_)
    pts.extend(list(np.geomspace(ek[-1] * 1.01, tail_max, tail)))
    return np.array(pts)


def rot(x, y, t):
    """elementwise x^2 <= y t (y, t >= 0)."""
    return cp.SOC(y + t, cp.vstack([2 * x, y - t]), axis=0)


def build(s, mode, ek, rr, opts=None, fixed=None):
    """fixed: dict with numpy values for c1, c2 (test coefficients), lam, mu, sigma: then only
    the pointwise variables are optimised (the fine re-check)."""
    o = dict(MODES[mode])
    o.update(joint=False, sixth=True, lam3max=None)
    if opts:
        o.update(opts)
    uk = ek ** 2
    v = rr ** 2
    K, N = len(uk), len(v)
    F, G, Y = test_matrices(uk, v)
    K = F.shape[0]                      # number of test basis functions (depends on the test class)
    cons = []
    if fixed is None:
        c1 = cp.Variable(K)
        c2 = cp.Variable(K) if o['ident'] == 'both' else 2 * c1
        lam = cp.Variable(4)
        mu = cp.Variable(NB, nonneg=True)
        sig = cp.Variable() if o['sigma'] else 0.0
        cons.append(lam[3] >= 0)
        if not o['sixth']:
            cons.append(lam[3] == 0)
        for j in range(NB):
            if (j + 1) not in o['budgets']:
                cons.append(mu[j] == 0)
    else:
        c1, c2, lam, mu, sig = fixed['c1'], fixed['c2'], fixed['lam'], fixed['mu'], fixed['sigma']
    phi1, G1, Y1 = F.T @ c1, G.T @ c1, Y.T @ c1
    phi2, G2, Y2 = F.T @ c2, G.T @ c2, Y.T @ c2
    act = [j for j in range(NB) if (j + 1) in o['budgets']]
    th = cp.Variable((len(act), N))
    tau = cp.Variable((len(act), N), nonneg=True)
    for i, j in enumerate(act):
        mj = mu[j] if fixed is None else float(mu[j])
        # theta^2 <= 4 mu tau
        if fixed is None:
            cons.append(cp.SOC(mj + tau[i], cp.vstack([th[i], mj - tau[i]]), axis=0))
        else:
            if mj > 0:
                cons.append(cp.square(th[i]) / (4 * mj) <= tau[i])
            else:
                cons.append(th[i] == 0)
    La = LJ[act]                       # (#act, 3)
    lin2 = La[:, 0] @ th - phi1        # coefficient of k2 that xi2 must absorb
    lin1 = La[:, 1] @ th - 0.5 * phi2
    lina = La[:, 2] @ th - (Y1 + 0.5 * Y2) + sig * v
    if o['cone'] == 'none':
        cons += [lin2 == 0, lin1 == 0, lina == 0]
    elif o['cone'] == 'pos':
        cons += [lin2 >= 0, lin1 >= 0, lina == 0]
    else:  # full dual cone: xi2, xi1 >= 0, xia^2 <= 4 xi1 xi2
        cons += [cp.SOC(lin2 + lin1, cp.vstack([lina, lin2 - lin1]), axis=0)]
    poly = lam[0] + lam[1] * v + lam[2] * v ** 2 + lam[3] * v ** 3
    slack = poly + G1 + G2 - CJ[act] @ th - cp.sum(tau, axis=0) - rr
    sc = 1.0 / (1.0 + 0.02 * v ** 2 + 7e-5 * v ** 3)     # natural size of the terms of (*)
    info = dict(v=v, rr=rr, uk=uk, F=F, G=G, Y=Y, opts=o, act=act)
    if fixed is not None:
        prob = cp.Problem(cp.Maximize(sc @ slack), cons)
        info.update(slack=slack, th=th, tau=tau, lin=(lin2, lin1, lina))
        return prob, info
    slack_con = cp.multiply(sc, slack) >= 0
    cons.append(slack_con)
    info['slack_con'] = slack_con
    info['sc'] = sc
    M3 = 6 + 9 * s + C6 * s ** 1.5
    obj = lam[0] + lam[1] + lam[2] * (2 + s) + lam[3] * M3
    if o['par'] == 'total':
        # q3 + 2 q5 <= 3 s : mu3 = m, mu5 = 2 m
        cons.append(mu[4] == 2 * mu[2])
        obj = obj + 3 * s * mu[2]
    elif o['par'] == 'sep':
        # q3 <= 6P, q5 <= (3/2) Q, E[V at] = (3/2) Q, 2P + Q = s, 0 <= Q <= s/3
        tpar = cp.Variable()
        cons += [tpar >= 3 * s * mu[2], tpar >= 2 * s * mu[2] + 0.5 * s * (mu[4] + sig)]
        obj = obj + tpar
    else:
        # max over the parameter set of d . par, dualised by hand
        d = BJ.T @ mu + EA * sig              # coefficients of (n,h,b,y,z)
        eta = cp.Variable()
        nu = cp.Variable(4, nonneg=True)
        om = cp.Variable(5, nonneg=True)
        ze = cp.Variable(3)                   # (zeta_n, zeta_h, zeta_z): zeta_z^2 <= 4 zeta_n zeta_h
        ch = cp.Variable(3)                   # (chi_h, chi_m, chi_x):   chi_x^2 <= 4 chi_h chi_m
        cons += [cp.SOC(ze[0] + ze[1], cp.hstack([ze[2], ze[0] - ze[1]])),
                 cp.SOC(ch[0] + ch[1], cp.hstack([ch[2], ch[0] - ch[1]]))]
        extra = np.zeros(5)
        if o['joint']:
            # lam3 = l3s + l3a + l3b ; l3a (J2), l3b (J3):  E V^3 <= 6 + 9s + sqrt(s)(c_g g + c_h h0), g^2 <= s0 h0
            l3 = cp.Variable(3, nonneg=True)
            cons.append(lam[3] == cp.sum(l3))
            sq = np.sqrt(s)
            obj = lam[0] + lam[1] + lam[2] * (2 + s) + l3[0] * M3 + (l3[1] + l3[2]) * (6 + 9 * s)
            dg = sq * (300 * l3[1] + 135 * l3[2])
            d = d + sq * (198 * l3[1] + (11781.0 / 32) * l3[2]) * H0
            ps = cp.Variable(3)               # (psi_s, psi_h, psi_g): psi_g^2 <= 4 psi_s psi_h ; pairing psi_s s0 + psi_h h0 + psi_g g >= 0
            kap = cp.Variable(nonneg=True)    # multiplier of h0 >= 0
            cons += [cp.SOC(ps[0] + ps[1], cp.hstack([ps[2], ps[0] - ps[1]])), dg + ps[2] == 0]
            d = d + ps[0] * S0 + (ps[1] + kap) * H0
            info['l3'] = l3
        st = [d[0] - 32 * eta - nu[0] + nu[2] + om[0] + ze[0] + ch[1],
              d[1] - 8 * eta - nu[1] + om[1] + ze[1] + ch[0],
              d[2] - 32 * eta - nu[2] + om[2] + ch[1],
              d[3] - 96 * eta - nu[3] + om[3] + 3 * ch[1] + 3 * ch[2],
              d[4] + nu[3] + om[4] + ze[2] - ch[1] - ch[2]]
        obj = obj + eta * s + 0.25 * (nu[0] + nu[1])
        if o.get('r19'):
            # the 0.93462 package's (19):  8z <= 24(1+alpha) y + (5 + 3/alpha)(1 - 4h)  for every alpha > 0
            al19 = np.array(o['r19'], float)
            k19 = 5 + 3 / al19
            x19 = cp.Variable(len(al19), nonneg=True)
            st[1] = st[1] - 4 * (k19 @ x19)
            st[3] = st[3] + 24 * ((1 + al19) @ x19)
            st[4] = st[4] - 8 * cp.sum(x19)
            obj = obj + k19 @ x19
            info['x19'] = x19
        if o.get('nocaps'):
            cons += [nu[0] == 0, nu[1] == 0]
        stat_cons = [e_ == 0 for e_ in st]
        cons += stat_cons
        info['stat'] = stat_cons
    if o['lam3max'] is not None:
        cons.append(lam[3] <= o['lam3max'])
    prob = cp.Problem(cp.Minimize(obj), cons)
    info.update(c1=c1, c2=c2, lam=lam, mu=mu, sigma=sig, slack=slack)
    pass
    return prob, info


def solve(s, mode, drk=0.1, gk=1.08, sub=6, r_max=60.0, opts=None, verbose=False, ret=False, recheck=True):
    ek = r_edges(drk, 6.0, r_max, gk)
    rr = check_points(ek, sub)
    prob, info = build(s, mode, ek, rr, opts)
    t0 = time.time()
    try:
        prob.solve(solver=cp.CLARABEL, verbose=verbose)
        val, st = prob.value, prob.status
    except Exception as ex:  # noqa
        val, st = None, 'error: %s %s' % (type(ex).__name__, ex)
    out = dict(s=s, mode=mode, K=len(ek), N=len(rr), drk=drk, sub=sub, value=val, status=st,
               secs=round(time.time() - t0, 2))
    if opts:
        out['opts'] = opts
    sol = None
    if val is not None and info['lam'].value is not None:
        c1 = info['c1'].value
        c2 = info['c2'].value
        sg = info['sigma']
        sol = dict(c1=c1, c2=c2, lam=info['lam'].value, mu=np.maximum(info['mu'].value, 0.0),
                   sigma=float(sg.value) if hasattr(sg, 'value') else 0.0, ek=ek)
        out.update(lam=[float(x) for x in sol['lam']], mu=[float(x) for x in sol['mu']], sigma=sol['sigma'])
        if recheck:
            rf = check_points(ek, 4 * sub + 1, tail=400, tail_max=4000.0)
            p2, i2 = build(s, mode, ek, rf, opts, fixed=sol)
            try:
                p2.solve(solver=cp.CLARABEL)
                sl = i2['slack'].value
                out['fine_min_slack'] = float(sl.min())
                out['fine_argmin_r'] = float(rf[sl.argmin()])
                out['bound_N'] = float(val - min(sl.min(), 0.0))
            except Exception as ex:  # noqa
                out['fine_min_slack'] = 'error: %s' % type(ex).__name__
    if ret:
        return out, info, sol
    return out


if __name__ == "__main__":
    svals = [float(x) for x in sys.argv[1].split(',')] if len(sys.argv) > 1 else [5.0]
    modes = sys.argv[2].split(',') if len(sys.argv) > 2 else ['R0', 'L', 'G', 'N']
    drk = float(sys.argv[3]) if len(sys.argv) > 3 else 0.2
    gk = float(sys.argv[4]) if len(sys.argv) > 4 else 1.08
    sub = int(sys.argv[5]) if len(sys.argv) > 5 else 4
    for s in svals:
        for m in modes:
            print(json.dumps(solve(s, m, drk=drk, gk=gk, sub=sub)), flush=True)
