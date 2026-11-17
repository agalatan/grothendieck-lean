# claude-b9ee research worker (fourpartite): N-level checks (floating point, orientation only).
# (1) The two-step conditioning of section 4 of PROOF_4PARTITE.md: for g = <u,X> + <v,Y> + <X,MY> + c0 Z0,
#     E|g| computed by the exact one-dimensional Fourier formula (SVD) equals E over (Y_perp, X') of the one-block
#     values, and E|g| <= sqrt(2/pi) E sqrt(V) <= sqrt(2/pi) sqrt(E V) = sqrt(2/pi)||g||_2.
# (2) One numerical value of E|P| / (sqrt(2/pi)||P||_2) per class of 4-partite cubics (section 5).
import numpy as np
from scipy import integrate, special
import sys, time

SQ2PI = np.sqrt(2/np.pi)
rng = np.random.default_rng(20261117)

def Eabs_fourier(c0sq, blocks):
    """E|c0 Z0 + sum_j (a_j X_j + b_j Y_j + c_j X_j Y_j)| by the char. function formula (any variance)."""
    a = np.array([b[0] for b in blocks]); b = np.array([b[1] for b in blocks]); c = np.array([b[2] for b in blocks])
    s = c*c; w = a*a + b*b; p = a*b*c
    v = c0sq + np.sum(s + w)
    def f(t):
        t2 = t*t; d = 1 + s*t2
        lr = -c0sq*t2/2 - 0.5*np.sum(np.log(d)) - np.sum(w*t2/(2*d))
        th = np.sum(p*t*t2/d)
        return (1 - np.exp(lr)*np.cos(th))/t2
    pts = [0, 0.5, 1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48, 64, 100, 200, 400, 1000, 3000]
    tot = 0.0
    for lo, hi in zip(pts[:-1], pts[1:]):
        r, e = integrate.quad(f, lo, hi, limit=400, epsabs=1e-13, epsrel=1e-11)
        tot += r
    # tail: int_T^inf (1 - Re phi)/t^2 ~ 1/T
    tot += 1.0/pts[-1]
    return 2/np.pi*tot, np.sqrt(v)

def Eabs_general(u, v, M, c0):
    """E|<u,X> + <v,Y> + <X,MY> + c0 Z0| via the SVD reduction to blocks."""
    U, S, Vt = np.linalg.svd(M)
    r = len(S)
    up = U.T @ u; vp = Vt @ v
    blocks = [(up[j], vp[j], S[j]) for j in range(r)]
    rest = c0*c0 + np.sum(up[r:]**2) + np.sum(vp[r:]**2)
    return Eabs_fourier(rest, blocks)

def one_block(a, b, c):
    """E|aX + bY + cXY| by the conditional formula given Y"""
    def f(y):
        m = b*y; sg = abs(a + c*y)
        if sg < 1e-300:
            val = abs(m)
        else:
            mu = m/sg
            val = sg*SQ2PI*np.exp(-mu*mu/2) + m*special.erf(mu/np.sqrt(2))
        return val*np.exp(-y*y/2)/np.sqrt(2*np.pi)
    pts = [-12, 12]
    if c != 0 and -12 < -a/c < 12:
        pts = [-12, -a/c, 12]
    tot = 0.0
    for lo, hi in zip(pts[:-1], pts[1:]):
        r, e = integrate.quad(f, lo, hi, limit=200, epsabs=1e-13, epsrel=1e-11)
        tot += r
    return tot

def reduction_check(m, n, nq=12):
    u = rng.normal(size=m); v = rng.normal(size=n); M = rng.normal(size=(m, n)); c0 = rng.normal()
    var = u@u + v@v + np.sum(M*M) + c0*c0
    e_svd, _ = Eabs_general(u, v, M, c0)
    # two-step conditioning with c0 absorbed: Xt = (X, Z0), ut = (u, c0), Mt = (M; 0)
    ut = np.append(u, c0); Mt = np.vstack([M, np.zeros((1, n))])
    vh = v/np.linalg.norm(v)
    # orthonormal basis of v-perp
    Q, _ = np.linalg.qr(np.column_stack([vh, rng.normal(size=(n, n-1))]))
    B = Q[:, 1:]                     # n x (n-1)
    q = Mt @ vh
    # Gauss-Hermite over Y_perp (n-1 dims) and X' (m dims, orthogonal to p inside R^{m+1})
    gx, gw = np.polynomial.hermite_e.hermegauss(nq); gw = gw/np.sqrt(2*np.pi)
    vals = []; Vs = []; wts = []
    import itertools
    for idx in itertools.product(range(nq), repeat=n-1):
        yp = B @ np.array([gx[i] for i in idx]); wy = np.prod([gw[i] for i in idx])
        p = ut + Mt @ yp
        ph = p/np.linalg.norm(p)
        Qp, _ = np.linalg.qr(np.column_stack([ph, rng.normal(size=(m+1, m))]))
        Pp = Qp[:, 1:]               # basis of p-perp in R^{m+1}
        qprime = Pp.T @ q            # coordinates of q' = P_{p perp} q
        for jdx in itertools.product(range(nq), repeat=m):
            xp = np.array([gx[j] for j in jdx]); wx = np.prod([gw[j] for j in jdx])
            a = np.linalg.norm(p); b = np.linalg.norm(v) + xp @ qprime; c = ph @ q
            vals.append(one_block(a, b, c)); Vs.append(a*a + b*b + c*c); wts.append(wy*wx)
    vals = np.array(vals); Vs = np.array(Vs); wts = np.array(wts)
    e_red = np.sum(wts*vals); sqV = np.sum(wts*np.sqrt(Vs)); EV = np.sum(wts*Vs)
    print('m=%d n=%d: E|g| SVD-Fourier %.10f | two-step conditioning %.10f | sqrt(2/pi)E sqrt(V) %.10f | '
          'sqrt(2/pi)||g|| %.10f (E V = %.10f vs ||g||^2 = %.10f) | ratio %.6f'
          % (m, n, e_svd, e_red, SQ2PI*sqV, SQ2PI*np.sqrt(var), EV, var, e_svd/(SQ2PI*np.sqrt(var))))
    sys.stdout.flush()

def fourpartite_ratio(T, dims, nmc=4000):
    """P = T123 + T124 + T134 + T234 (dict of tensors), parts of sizes dims; condition on (X1, X2)
    and use the exact SVD-Fourier value of E|g| for g(X3, X4); Monte Carlo over (X1, X2)."""
    d1, d2, d3, d4 = dims
    norm2 = sum(np.sum(t*t) for t in T.values())
    acc = []
    for k in range(nmc):
        x1 = rng.normal(size=d1); x2 = rng.normal(size=d2)
        u = np.einsum('ijk,i,j->k', T['123'], x1, x2) if '123' in T else np.zeros(d3)
        v = np.einsum('ijk,i,j->k', T['124'], x1, x2) if '124' in T else np.zeros(d4)
        M = np.zeros((d3, d4))
        if '134' in T: M += np.einsum('ijk,i->jk', T['134'], x1)
        if '234' in T: M += np.einsum('ijk,i->jk', T['234'], x2)
        e, _ = Eabs_general(u, v, M, 0.0)
        acc.append(e)
    acc = np.array(acc)
    return np.mean(acc)/(SQ2PI*np.sqrt(norm2)), np.std(acc)/np.sqrt(nmc)/(SQ2PI*np.sqrt(norm2))

def k43_exact(t):
    """K_4^(3) on four coordinates: P = t1 x2x3x4 + t2 x1x3x4 + t3 x1x2x4 + t4 x1x2x3, Gauss-Hermite over (x1,x2)"""
    gx, gw = np.polynomial.hermite_e.hermegauss(60); gw = gw/np.sqrt(2*np.pi)
    tot = 0.0
    for i in range(60):
        for j in range(60):
            x1, x2 = gx[i], gx[j]
            a = t[3]*x1*x2; b = t[2]*x1*x2; c = t[1]*x1 + t[0]*x2
            tot += gw[i]*gw[j]*one_block(a, b, c)
    return tot/(SQ2PI*np.sqrt(np.sum(np.array(t)**2)))

if __name__ == '__main__':
    t0 = time.time()
    print('== (1) reduction checks ==')
    for (m, n) in [(1, 2), (2, 2), (2, 3)]:
        reduction_check(m, n, nq=10 if m + n <= 4 else 6)
    print('== (2) classes of 4-partite cubics: E|P|/(sqrt(2/pi)||P||_2) ==')
    t = rng.normal(size=4)
    print('K_4^(3), 4 coordinates, random coefficients %s: %.8f (Gauss-Hermite, 60^2 nodes)' % (np.round(t, 3), k43_exact(t)))
    print('K_4^(3), equal coefficients: %.8f' % k43_exact([1, 1, 1, 1]))
    dims = (3, 3, 3, 3)
    T = {k: rng.normal(size=dims[:3]) for k in ['123', '124', '134', '234']}
    T['124'] = rng.normal(size=(3, 3, 3)); T['134'] = rng.normal(size=(3, 3, 3)); T['234'] = rng.normal(size=(3, 3, 3))
    r, e = fourpartite_ratio(T, dims, nmc=1500)
    print('blow-up of K_4^(3), parts 3+3+3+3 (12 coordinates), Gaussian tensors: %.5f +- %.5f (MC over (X1,X2))' % (r, e))
    T3 = {'134': rng.normal(size=(3, 3, 3)), '234': rng.normal(size=(3, 3, 3))}
    r, e = fourpartite_ratio(T3, (3, 3, 3, 3), nmc=1500)
    print('two edge-types T134 + T234 (12 coordinates; = tripartite-like in X3,X4 given X1,X2): %.5f +- %.5f' % (r, e))
    Tt = {'134': rng.normal(size=(4, 4, 4))}
    r, e = fourpartite_ratio(Tt, (4, 1, 4, 4), nmc=1500)
    print('tripartite cubic T(X1,X3,X4), parts 4+4+4: %.5f +- %.5f' % (r, e))
    # tight cycle C_7^(3): colours 0,1,2,3,0,1,2 -> parts {0,4},{1,5},{2,6},{3}
    tc = rng.normal(size=7)
    # build tensors in the part coordinates: part1 = (x0,x4), part2 = (x1,x5), part3 = (x2,x6), part4 = (x3)
    pos = {0: (1, 0), 4: (1, 1), 1: (2, 0), 5: (2, 1), 2: (3, 0), 6: (3, 1), 3: (4, 0)}
    Tc = {'123': np.zeros((2, 2, 2)), '124': np.zeros((2, 2, 1)), '134': np.zeros((2, 2, 1)), '234': np.zeros((2, 2, 1))}
    for i in range(7):
        e3 = sorted([pos[i], pos[(i+1) % 7], pos[(i+2) % 7]])
        key = ''.join(str(p[0]) for p in e3)
        Tc[key][e3[0][1], e3[1][1], e3[2][1]] += tc[i]
    r, e = fourpartite_ratio(Tc, (2, 2, 2, 1), nmc=3000)
    print('tight cycle C_7^(3) (7 coordinates, strong 4-colouring 0123012): %.5f +- %.5f' % (r, e))
    print('time %.0f s' % (time.time() - t0))
