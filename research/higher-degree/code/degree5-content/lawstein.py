# Law layer for the capped rows: smallest same-variance deficit over relaxed laws of U = |q|^2/u.  N.
#   moments:  E U = 1, E U^2 = m = 2 + chi, E U^3 <= 6 + 9 chi + C6 chi^{3/2}
#   Stein (inherited inputs, remote_strong_PROOF.md section 2, eqs. (3), (5)): joint variables X_c, r with
#     E X_c = 0, 2P + Q = chi, Q <= chi/3, E X_c^2 <= 2P/3, E r^2 <= 2Q/3  (P = E X_c U, Q = E r U),
#     E[U f(U)] = E[(1 + X_c)(f + U f') + r U f']   for the test functions f below.
#   Discretised on a U grid with x_i = E[X_c; U = U_i], r_i = E[r; U = U_i] and Jensen (x_i^2/p_i <= E[X_c^2; U_i]).
import numpy as np, cvxpy as cp

C6 = 4045313 / 100000

def ugrid(n1=160, n2=140, n3=60):
    a = np.linspace(0, 4, n1, endpoint=False); b = np.linspace(4, 40, n2, endpoint=False); c = np.geomspace(40, 600, n3)
    return np.concatenate([a, b, c])

RATES = [0.05, 0.1, 0.2, 0.35, 0.5, 0.75, 1.0, 1.5, 2.0, 3.0, 5.0, 8.0, 12.0, 20.0, 35.0, 60.0]

def tests(U):
    F, Fp = [], []
    for a in RATES:
        e = np.exp(-a * U); F.append(e); Fp.append(-a * e)
    for c in (0.5, 1.0, 2.0, 4.0, 8.0):        # rational tests 1/(1 + U/c)
        F.append(1 / (1 + U / c)); Fp.append(-1 / c / (1 + U / c) ** 2)
    return np.array(F), np.array(Fp)

def max_Eh(hv, U, m, stein=True, solver=None):
    """max E h(U) over relaxed laws; hv = h on the grid U.  Returns (value, p)."""
    n = len(U); chi = m - 2; p = cp.Variable(n, nonneg=True)
    cons = [cp.sum(p) == 1, U @ p == 1, (U ** 2) @ p == m, (U ** 3) @ p <= 6 + 9 * chi + C6 * max(chi, 0) ** 1.5]
    if stein:
        x = cp.Variable(n); r = cp.Variable(n); sx = cp.Variable(n, nonneg=True); sr = cp.Variable(n, nonneg=True)
        P = U @ x; Q = U @ r
        cons += [cp.sum(x) == 0, 2 * P + Q == chi, Q <= chi / 3, Q >= 0, cp.sum(sx) <= 2 * P / 3, cp.sum(sr) <= 2 * Q / 3]
        cons += [cp.quad_over_lin(x[i], p[i]) <= sx[i] for i in range(0)]   # placeholder (vectorised below)
        # rotated cones x_i^2 <= sx_i p_i  <=>  ||(2 x_i, sx_i - p_i)|| <= sx_i + p_i
        cons += [cp.SOC(sx + p, cp.vstack([2 * x, sx - p]), axis=0), cp.SOC(sr + p, cp.vstack([2 * r, sr - p]), axis=0)]
        F, Fp = tests(U)
        for f, fp in zip(F, Fp):
            cons.append((U * f) @ p == (f + U * fp) @ (p + x) + (U * fp) @ r)
    prob = cp.Problem(cp.Maximize(hv @ p), cons)
    prob.solve(solver=solver or ('CLARABEL' if stein else 'HIGHS'))
    return prob.value, p.value, prob.status
