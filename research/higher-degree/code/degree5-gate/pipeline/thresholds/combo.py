# [copy from research/higher-degree/code/degree5-content/ or degree5-cert/content5/code/ (the content study of claude-b9ee's workers);
#  claude-b9ee worker d5newcap, 16 Nov 2026: the game constants come from the environment (D5_E1, D5_ETA) and Clarabel is
#  single-threaded; nothing else changed unless noted]
# Same-law test of the combined content bound for the tilted A/B shells, per capped row.  N.
#   (S) structural (ledger 11.49 transferred):  ||c_X||^2 <= gamma_X(u) delta,   delta = chi u^2
#   (F) elementary Cauchy-Schwarz/Bessel bound (law functional):
#        ||c_X||^2 <= u Var[G'(S) + G(S)/S] + (u/2) E[(G'(S) - G(S)/S)^2],   S = |q|,  G = tilted radial profile
#   target:  min(F_A,S_A) + min(F_B,S_B) <= 4 mu kappa (D + Vsl)   for every admissible law of U = |q|^2/u
#   max over laws (moment + Stein relaxation of lawstein.py) of the left minus right, via the minimax in (thA, thB).
import sys, json
import numpy as np, cvxpy as cp, rowlib as R, resolvent as RS, lawstein as LS

class _Prof:
    """a tilted radial profile G = G_X + c G_0 as a callable, with its quotient G(s)/s (exact limit at 0) when the row has it."""
    def __init__(self, row, X, c):
        self.row, self.X, self.c = row, X, c
    def __call__(self, x):
        r = self.row; return (r.ga(x) if self.X == 'A' else r.gb(x)) + self.c * r.g0(x)
    def quot(self, x):
        r = self.row; xm = np.minimum(x, r.smax)
        if not getattr(r, 'exact', False): xs = np.maximum(x, 1e-9); return self(xs) / xs
        return np.where(np.asarray(x) <= r.smax, (r.QA(xm) if self.X == 'A' else r.QB(xm)) + self.c * r.Q0(xm), self(x) / np.maximum(x, 1e-9))

def prof_derivs(row, s, t):
    """(G_A, G_A', G_B, G_B') of the tilted profiles.  d5newcap, 16 Nov 2026: the derivative is the EXACT one (tables of
    prof2.py: derivative of the defining integral) whenever the row has it; SPLINE_DERIV=1 forces the study's spline
    derivative (for regressions against the study's numbers only)."""
    import os
    GA, GB = _Prof(row, 'A', s), _Prof(row, 'B', t)
    if getattr(row, 'exact', False) and os.environ.get('SPLINE_DERIV', '0') != '1':
        GAp = lambda x: row.dGA(np.minimum(x, row.smax)) + s * row.dG0(np.minimum(x, row.smax))
        GBp = lambda x: row.dGB(np.minimum(x, row.smax)) + t * row.dG0(np.minimum(x, row.smax))
    else:
        if os.environ.get('SPLINE_DERIV', '0') != '1' and os.environ.get('ALLOW_SPLINE_DERIV', '0') != '1':
            raise RuntimeError('this profile table has no exact derivatives (make it with prof2.py), or set ALLOW_SPLINE_DERIV=1')
        GAp = lambda x: row.GA(np.minimum(x, row.smax), 1) + s * row.G0(np.minimum(x, row.smax), 1)
        GBp = lambda x: row.GB(np.minimum(x, row.smax), 1) + t * row.G0(np.minimum(x, row.smax), 1)
    return GA, GAp, GB, GBp

def ab_vec(G, Gp, S):
    S = np.maximum(S, 1e-9); q = G.quot(S) if hasattr(G, 'quot') else G(S) / S
    return Gp(S) + q, Gp(S) - q

def solve_point(row, U, u, chi, gA, gB, mu, kappa, profs, ths=None):
    GA, GAp, GB, GBp = profs; S = np.sqrt(u * U)
    aA, bA = ab_vec(GA, GAp, S); aB, bB = ab_vec(GB, GBp, S)
    psi = row.ps(S); B5 = row.B5(u); Vsl = row.Vsl(u); delta = chi * u * u
    SA, SB = gA * delta, gB * delta
    def inner(thA, thB):
        n = len(U); m = 2 + chi; p = cp.Variable(n, nonneg=True)
        x = cp.Variable(n); r = cp.Variable(n); sx = cp.Variable(n, nonneg=True); sr = cp.Variable(n, nonneg=True)
        P = U @ x; Q = U @ r
        cons = [cp.sum(p) == 1, U @ p == 1, (U ** 2) @ p == m, (U ** 3) @ p <= 6 + 9 * chi + LS.C6 * chi ** 1.5,
                cp.sum(x) == 0, 2 * P + Q == chi, Q <= chi / 3, Q >= 0, cp.sum(sx) <= 2 * P / 3, cp.sum(sr) <= 2 * Q / 3,
                cp.SOC(sx + p, cp.vstack([2 * x, sx - p]), axis=0), cp.SOC(sr + p, cp.vstack([2 * r, sr - p]), axis=0)]
        F, Fp = LS.tests(U)
        for f, fp in zip(F, Fp):
            cons.append((U * f) @ p == (f + U * fp) @ (p + x) + (U * fp) @ r)
        FA = u * ((aA ** 2) @ p - cp.square(aA @ p)) + (u / 2) * ((bA ** 2) @ p)
        FB = u * ((aB ** 2) @ p - cp.square(aB @ p)) + (u / 2) * ((bB ** 2) @ p)
        X = 4 * mu * kappa * (B5 - psi @ p + Vsl)
        obj = thA * FA + thB * FB - X + (1 - thA) * SA + (1 - thB) * SB
        pr = cp.Problem(cp.Maximize(obj), cons); pr.solve(solver='CLARABEL', max_threads=1)
        return pr.value, p.value
    best = None
    grid = ths if ths is not None else [0.0, 0.25, 0.5, 0.75, 1.0]
    for thA in grid:
        for thB in grid:
            v, p = inner(thA, thB)
            if best is None or v < best[0]: best = (v, thA, thB, p)
    return best, dict(SA=SA, SB=SB, X0=4 * mu * kappa * Vsl)

if __name__ == '__main__':
    k = int(sys.argv[1]); s, t, kappa = float(sys.argv[2]), float(sys.argv[3]), float(sys.argv[4])
    row = R.Row('out/prof_%d.npz' % k); mu = float(sys.argv[5]); profs = prof_derivs(row, s, t)
    U = LS.ugrid(); us = row.ustar
    ufac = [0.5, 0.75, 0.9, 1.0, 1.1, 1.3, 1.6] if us > 0.01 else [1.0]
    uvals = [f * us for f in ufac] if us > 0.01 else [0.006, 0.012, 0.02, 0.03]
    chis = [0.05, 0.2, 0.5, 1.0, 2.0, 4.0, 8.0, 16.0, 30.0, 42.0]
    out = dict(t=row.t, s=s, tt=t, kappa=kappa, mu=mu, pts=[])
    for u in uvals:
        gA = RS.gamma_struct(row, profs[0], u)['gamma']; gB = RS.gamma_struct(row, profs[2], u)['gamma']
        for chi in chis:
            (v, thA, thB, p), aux = solve_point(row, U, u, chi, gA, gB, mu, kappa, profs)
            out['pts'].append(dict(u=u, chi=chi, viol=float(v), thA=thA, thB=thB, gA=gA, gB=gB, **{k_: float(w) for k_, w in aux.items()}))
            print('t=%.3f u=%.5f chi=%5.2f gA=%.4f gB=%.4f  max[min(F,S) - X] = %+.3e (thA %.2f thB %.2f)' % (row.t, u, chi, gA, gB, v, thA, thB), flush=True)
    json.dump(out, open('out/combo_%d_%s_%s_%s.json' % (k, s, t, kappa), 'w'), indent=1)
