# Stage 0 (a): do explicit cubics satisfy the constraints of enriched.py as coded?  (N; a control of the implementation.)
# For q = sum t_abc (z_a z_b conj z_c - delta_ac z_b - delta_bc z_a), t symmetric in (a, b), normalised to E|q|^2 = 1,
# the kernels of K ledger 3.7 are computed pointwise on a scrambled Sobol sample:
#   F_k = dbar_k q, c1 = sum|d_j q|^2, c2 = sum|F_k|^2, a = sum d_j q F_j, rho = Re(conj(q)^2 a)/V,
#   W_k = sum_j F_j d_j F_k, w3 = sum|W_k|^2, beta = Re(conj(q) sum conj(F_k) W_k), alpha2 = |a|^2,
# and every linear constraint of the class is evaluated with the SAME test tables (enriched.tests) by sample averages:
# the residuals of (I), (II), (III), (IV) for every test, and the Gram relations: the scalars (n, h, b, y, z) are
# fitted by least squares to the seven second-moment relations (5 unknowns), whose residual must vanish, and every
# inequality of the class is then checked.   usage: validate_class.py [log2 sample = 21]
import sys, os, math
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, enriched as En, physlaws as PL

def kernels(t, z):
    n = t.shape[0]; zb = np.conj(z)
    q = np.einsum('abc,ia,ib,ic->i', t, z, z, zb) - np.einsum('aba,ib->i', t, z) - np.einsum('abb,ia->i', t, z)
    F = np.einsum('abk,ia,ib->ik', t, z, z)
    d = 2 * np.einsum('jbc,ib,ic->ij', t, z, zb) - 2 * np.einsum('jaa->j', t)[None, :]
    dF = 2 * np.einsum('jbk,ib->ijk', t, z)                     # d_j F_k
    W = np.einsum('ij,ijk->ik', F, dF)
    V = np.abs(q) ** 2; c1 = (np.abs(d) ** 2).sum(1); c2 = (np.abs(F) ** 2).sum(1); a = (d * F).sum(1)
    rho = np.where(V > 0, np.real(np.conj(q) ** 2 * a) / np.maximum(V, 1e-300), 0.0)
    w3 = (np.abs(W) ** 2).sum(1); beta = np.real(np.conj(q) * (np.conj(F) * W).sum(1))
    return V, c1, c2, rho, np.abs(a) ** 2, beta, w3

def check(name, t, m):
    n = t.shape[0]; t = (t + t.transpose(1, 0, 2)) / 2
    U = PL.sample(2 * n, m, 5); z = np.stack([PL.cgauss(U[:, 2 * k], U[:, 2 * k + 1]) for k in range(n)], axis=1)
    V, c1, c2, rho, al, beta, w3 = kernels(t, z); u = V.mean()
    V, c1, c2, rho, al, beta, w3 = V / u, c1 / u, c2 / u, rho / u, al / u ** 2, beta / u ** 2, w3 / u ** 2      # normalise to E V = 1
    kn = En.knots_default(); PHI, G, g, Y = En.tests(kn, V); N = len(V)
    se = lambda x: x.std() / math.sqrt(N)
    worst = {}
    for nm, f in (('I', lambda k: G[k] - c2 * PHI[k] - rho * Y[k]), ('II', lambda k: G[k] - c1 * PHI[k] / 2 - rho * Y[k] / 2),
                  ('III', lambda k: c2 * (c2 - 1) * PHI[k] - (c2 - 1) * G[k] + (c2 - 1) * rho * Y[k] + beta * g[k]),
                  ('IV', lambda k: al * PHI[k] - rho * G[k] + c2 * rho * Y[k] + beta * g[k])):
        r = [(abs(f(k).mean()), se(f(k))) for k in range(len(kn))]
        worst[nm] = max(r, key=lambda x: x[0] / max(x[1], 1e-300))
    s = (V ** 2).mean() - 2
    # second moments = M (n, h, b, y, z)
    M = np.array([[32, 8, 32, 96, 0], [16, 4, 0, 0, 0], [16, 20, 16, 0, 0], [80, 20, 16, 96, 32], [0, 0, 32, 24, 0], [0, 0, 32, 48, 0], [0, 0, 0, 24, 0]], float)
    rhs = np.array([s, ((c2 - 1) ** 2).mean(), ((c1 - c2 - 1) ** 2).mean(), ((c1 + c2 - 3) ** 2).mean(), al.mean(), (V * rho).mean(), w3.mean()])
    sol, res, rk, sv = np.linalg.lstsq(M, rhs, rcond=None); nn, h, b, y, zz = sol
    resid = np.abs(M @ sol - rhs).max()
    s0 = 8 * nn + 2 * h + 8 * b + 8 * zz; h0 = (8 * nn + 2 * h + 8 * b) / 3 + 24 * y - 16 * zz / 3; mm = nn + b + 3 * y - zz; m3 = (V ** 3).mean(); rs = math.sqrt(max(s, 0))
    ineq = dict(min_gram=min(sol), n_minus_b=nn - b, z_minus_y=zz - y, nh_minus_z2=nn * h - zz * zz, m=mm, hm_minus=h * mm - (3 * y - zz) ** 2, h0=h0,
                sixth=6 + 9 * s + En.C6 * s ** 1.5 - m3, joint1=6 + 9 * s + rs * (198 * h0 + 300 * math.sqrt(max(s0 * h0, 0))) - m3,
                joint2=6 + 9 * s + rs * (11781 / 32 * h0 + 135 * math.sqrt(max(s0 * h0, 0))) - m3,
                cone_pointwise=float((c1 * c2 - rho ** 2).min()), alpha_cone=float(np.minimum(al - rho ** 2, c1 * c2 - al).min()), beta_cone=float((V * c2 * w3 - beta ** 2).min()),
                radius_slack=En.math.sqrt(1) * 0 + (0.912 - np.sqrt(V).mean()))
    print('%s (n = %d, 2^%d points): s = %.4f, E sqrt V = %.5f, E c1 = %.5f, E c2 = %.5f' % (name, n, m, s, np.sqrt(V).mean(), c1.mean(), c2.mean()))
    print('   identities, worst residual over the %d tests (|mean|, standard error): ' % len(kn) + '; '.join('%s %.1e (%.1e)' % (k, v[0], v[1]) for k, v in worst.items()))
    print('   Gram scalars (n, h, b, y, z) = %s, residual of the 7 relations %.1e' % (np.round(sol, 5).tolist(), resid))
    print('   inequalities (each must be >= 0 up to the sampling error): ' + ', '.join('%s %.2e' % kv for kv in ineq.items()))

if __name__ == '__main__':
    m = int(sys.argv[1]) if len(sys.argv) > 1 else 21
    rng = np.random.default_rng(3)
    t = np.zeros((1, 1, 1), complex); t[0, 0, 0] = 1; check('junta y(|y|^2 - 2)', t, m)
    t = np.zeros((3, 3, 3), complex); t[0, 1, 2] = 1; check('y1 y2 conj(y3)', t, m)
    t = np.zeros((2, 2, 2), complex); t[0, 0, 1] = 1; check('y1^2 conj(y2)', t, m)
    for n in (2, 3, 4):
        t = rng.normal(size=(n, n, n)) + 1j * rng.normal(size=(n, n, n)); check('random tensor', t, m)
