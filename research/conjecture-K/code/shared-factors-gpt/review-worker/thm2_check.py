#!/usr/bin/env python3
# Reviewer (N, Gauss-Hermite quadrature exact for the polynomial cases): the ingredients of Theorem 2 and Corollary 3
# of the shared-factors package, on cubics q in H_{2,1}(C^2) (four real Gaussian coordinates).
#   (i)   Q_i = I_3(f_i):  E Q_i^2 = 6 |f_i|^2 = u/2;   kappa_4(Q_i) = 3 delta/8 = 2 |P_2(Q_i^2)|^2 + |P_4(Q_i^2)|^2 >= 1296 |K_i|^2,
#         K_i = f_i (x)_2 f_i;  so Lambda = max |K_i|_HS <= sqrt(3 delta/8)/36                                   (7)
#   (ii)  E[G_e phi(q)] = sum_{i,a,b} E[ d_iab phi(q) { 3 <grad Q_a, A_i grad Q_b> + 18 D_{v_ia} Q_b } ]            (8)
#         A_i = f_i(e,.,.),  v_ia = <A_i, f_a(.,.,*)>,  for polynomial and non-polynomial phi
#   (iii) |<grad Q_a, A grad Q_b>|_2 <= 9 sqrt(60) Lambda |A|_HS for symmetric A                                      (9)
#   (iv)  |D^3 phi(z)|_HS^2 <= D_h^2(|z|^2) for phi = Re(z h(|z|^2))  (finite differences on a test profile)
#   (v)   the final inequality (6) and Corollary 3 (9a) on the same cubics; E[G_e Q_1^3] = 324 <A_1, K_1> and the ratio 3/4.
import math, itertools, sys
import numpy as np
rng = np.random.default_rng(11)
S2 = math.sqrt(2)

def cubic(coef, X, Y):
    TX, TY = np.abs(X) ** 2, np.abs(Y) ** 2
    m = [X * (TX - 2) / S2, Y * (TY - 2) / S2, X * X * np.conj(Y) / S2, Y * Y * np.conj(X) / S2, X * (TY - 1), Y * (TX - 1)]
    return sum(c * mm for c, mm in zip(coef, m))

def gh(n):
    x, w = np.polynomial.hermite_e.hermegauss(n); w = w / w.sum()
    G = np.array(np.meshgrid(x, x, x, x, indexing='ij')).reshape(4, -1)
    W = np.einsum('i,j,k,l->ijkl', w, w, w, w).ravel()
    return G, W

def tensors(coef):
    """symmetric 3-tensors f_1, f_2 of Re q, Im q in the real coordinates g (X = (g1 + i g2)/sqrt2, Y = (g3 + i g4)/sqrt2):
    f(a,b,c) = (1/6) d_a d_b d_c Q, from exact differences of the cubic polynomial (its cubic part)."""
    def Q(g):
        X = (g[0] + 1j * g[1]) / S2; Y = (g[2] + 1j * g[3]) / S2
        return cubic(coef, X, Y)
    f = np.zeros((2, 4, 4, 4))
    E = np.eye(4)
    for a, b, c in itertools.product(range(4), repeat=3):
        # third mixed difference of a cubic polynomial is exact:  sum over sign patterns
        val = 0
        for sa, sb, sc in itertools.product((1, -1), repeat=3):
            val += sa * sb * sc * Q(sa * E[a] + sb * E[b] + sc * E[c])
        val = val / 8 / 6
        f[0, a, b, c] = val.real; f[1, a, b, c] = val.imag
    return f

def run(coef, label):
    coef = np.asarray(coef, complex)
    f = tensors(coef)
    G, W = gh(14)
    X = (G[0] + 1j * G[1]) / S2; Y = (G[2] + 1j * G[3]) / S2
    q = cubic(coef, X, Y); Qr = [q.real, q.imag]
    u = float(W @ np.abs(q) ** 2); delta = float(W @ np.abs(q) ** 4) - 2 * u * u
    K = [np.einsum('acd,bcd->ab', f[i], f[i]) for i in range(2)]
    Lam = max(np.linalg.norm(k) for k in K)
    k4 = [float(W @ Qr[i] ** 4) - 3 * float(W @ Qr[i] ** 2) ** 2 for i in range(2)]
    e1 = max(abs(6 * np.sum(f[i] ** 2) - u / 2) for i in range(2)); e2 = max(abs(k - 3 * delta / 8) for k in k4)
    assert e1 < 1e-9 * u and e2 < 1e-8 * delta
    # gradient and Hessian pieces as arrays on the grid: grad Q_a (4 components) = 3 I_2(f_a(c,.,.)) = 3 (f_a(c,j,k) g_j g_k - tr)
    grad = [np.array([3 * (np.einsum('jk,jn,kn->n', f[a][c], G, G) - np.trace(f[a][c])) for c in range(4)]) for a in range(2)]
    # check grad by the polynomial itself (finite difference of q in direction c is exact enough for a cubic: use central difference)
    worst = dict(id8=0.0, b9=0.0)
    for trial in range(3):
        e = rng.standard_normal(4); e /= np.linalg.norm(e)
        Ge = e @ G
        A = [np.einsum('c,cjk->jk', e, f[i]) for i in range(2)]
        assert all(np.linalg.norm(A[i]) <= math.sqrt(Lam) * (1 + 1e-12) for i in range(2))
        v = [[np.einsum('jk,jkc->c', A[i], f[a]) for a in range(2)] for i in range(2)]
        coefs = {}
        for i, a, b in itertools.product(range(2), repeat=3):
            quad = np.einsum('cn,cd,dn->n', grad[a], A[i], grad[b])
            Dv = np.einsum('c,cn->n', v[i][a], grad[b])
            coefs[(i, a, b)] = 3 * quad + 18 * Dv
            assert math.sqrt(W @ coefs[(i, a, b)] ** 2) <= 27 * (math.sqrt(60) + 2 * S2) * Lam ** 1.5 * (1 + 1e-9)
        # (8) for polynomial phi = Q1^p Q2^m and for a non-polynomial one
        tests = [(3, 0), (2, 1), (1, 2), (0, 3), (4, 0), (2, 2), (1, 3)]
        for (p, m) in tests:
            lhs = float(W @ (Ge * Qr[0] ** p * Qr[1] ** m))
            rhs = 0.0
            for (i, a, b), cf in coefs.items():
                k1 = [i, a, b].count(0); k2 = 3 - k1          # derivative d_1^k1 d_2^k2 of x^p y^m
                if p >= k1 and m >= k2:
                    d = math.perm(p, k1) * math.perm(m, k2) * Qr[0] ** (p - k1) * Qr[1] ** (m - k2)
                    rhs += float(W @ (d * cf))
            scale = math.sqrt(float(W @ (Qr[0] ** (2 * p) * Qr[1] ** (2 * m))))
            worst['id8'] = max(worst['id8'], abs(lhs - rhs) / max(scale, 1e-300))
        # (9) for random symmetric A
        for _ in range(4):
            B = rng.standard_normal((4, 4)); B = (B + B.T) / 2
            for a, b in itertools.product(range(2), repeat=2):
                nrm = math.sqrt(float(W @ np.einsum('cn,cd,dn->n', grad[a], B, grad[b]) ** 2))
                worst['b9'] = max(worst['b9'], nrm / (9 * math.sqrt(60) * Lam * np.linalg.norm(B)))
    # Corollary 3: E[G_e Q1^3] = 324 <A_1, K_1>;  E[G_e Re(q|q|^2)] = (4/3) E[G_e Q1^3];  ||c[v]||^2 <= (3 sqrt6/4) delta^{3/2}
    e = np.eye(4)
    c3 = max(abs(float(W @ (G[c] * Qr[0] ** 3)) - 324 * float(np.sum(f[0][c] * K[0]))) for c in range(4))
    r34 = max(abs(float(W @ (G[c] * Qr[0] ** 3)) - 0.75 * float(W @ (G[c] * (q * np.abs(q) ** 2).real))) for c in range(4))
    cont = np.array([W @ (np.conj(X) * q * np.abs(q) ** 2), W @ (np.conj(Y) * q * np.abs(q) ** 2)]); c2 = float(np.sum(np.abs(cont) ** 2))
    realproj = sum(float(W @ (G[c] * (q * np.abs(q) ** 2).real)) ** 2 for c in range(4))
    assert abs(realproj - c2 / 2) < 1e-8 * c2 + 1e-12, 'real first-chaos projection has squared norm ||c||^2/2'
    print('%-22s u %.4f chi %7.3f | Lambda/(sqrt(3 delta/8)/36) = %.4f | (8): largest relative defect %.1e | (9): largest ratio to the bound %.3f | Cor.3: |E G Q1^3 - 324<A,K>| %.0e, 3/4 rule %.0e, ||c[v]||^2/delta^1.5 = %.4f (<= %.4f); Theorem 2 at h = v gives %.1f' % (
        label, u, delta / u ** 2, Lam / (math.sqrt(3 * delta / 8) / 36), worst['id8'], worst['b9'], c3, r34, c2 / delta ** 1.5, 3 * math.sqrt(6) / 4, 6.5 * 48))
    assert Lam <= math.sqrt(3 * delta / 8) / 36 * (1 + 1e-9) and worst['id8'] < 1e-9 and worst['b9'] <= 1 and c2 <= 3 * math.sqrt(6) / 4 * delta ** 1.5
    return f, K, Lam, u, delta

cases = [('junta X(|X|^2-2)', [S2, 0, 0, 0, 0, 0]), ('H(X)+H(Y)', [1, 1, 0, 0, 0, 0]), ('X(|Y|^2-1)', [0, 0, 0, 0, 1, 0]), ('X^2 conj(Y)', [0, 0, 1, 0, 0, 0]),
         ('Wick+shared (0.3, i)', [math.cos(0.3), 0, 0, 0, 1j * math.sin(0.3), 0])]
for _ in range(4):
    cases.append(('random', rng.standard_normal(6) + 1j * rng.standard_normal(6)))
for label, coef in cases:
    run(coef, label)

# (iv) and (v): the pointwise bound |D^3 phi|^2 <= D_h^2 for a non-polynomial h, and the inequality (6) for polynomial profiles
import sympy as sp
x, y = sp.symbols('x y', real=True); vv = x * x + y * y
vs = sp.Symbol('v', positive=True)
def Dh2(hv):
    E1 = 2 * sp.diff(hv, vs) + 4 * vs * sp.diff(hv, vs, 2); E3 = 6 * sp.diff(hv, vs) + 24 * vs * sp.diff(hv, vs, 2) + 8 * vs ** 2 * sp.diff(hv, vs, 3); E2 = 6 * sp.diff(hv, vs)
    return E1, E2, E3
for name, hv in (('1/(1+v) + cos(v)/3', 1 / (1 + vs) + sp.cos(vs) / 3), ('exp(-2v) v', sp.exp(-2 * vs) * vs), ('v^2 - v^3/5', vs ** 2 - vs ** 3 / 5)):
    hs = hv.subs(vs, vv); phi = x * hs
    d3 = {}
    for i_, a, b in itertools.product(range(2), repeat=3):
        k1 = [i_, a, b].count(0)
        d3[(i_, a, b)] = sp.lambdify((x, y), sp.diff(phi, x, k1, y, 3 - k1), 'numpy')
    E1, E2, E3 = [sp.lambdify(vs, e, 'numpy') for e in Dh2(hv)]
    pts = rng.standard_normal((2, 20000)) * 1.5
    V = pts[0] ** 2 + pts[1] ** 2; th = np.arctan2(pts[1], pts[0])
    hsq = sum(d3[k](pts[0], pts[1]) ** 2 for k in d3)
    T1 = E3(V) ** 2 + 3 * E1(V) ** 2; T2 = E2(V) ** 2 + 3 * E1(V) ** 2
    exact = np.cos(th) ** 2 * T1 + np.sin(th) ** 2 * T2
    D2 = 3 * E1(V) ** 2 + np.maximum(E3(V) ** 2, E2(V) ** 2)
    print('h = %-20s: |D^3 Re(z h)|^2 = cos^2 |T1|^2 + sin^2 |T2|^2 to %.1e (relative);  it is <= D_h^2 at all 20000 points: %s (largest ratio %.6f)' % (
        name, float(np.abs(hsq - exact).max() / np.abs(exact).max()), bool((hsq <= D2 * (1 + 1e-9) + 1e-12).all()), float((hsq / np.maximum(D2, 1e-300)).max())))
    assert np.abs(hsq - exact).max() <= 1e-9 * np.abs(exact).max() and (hsq <= D2 * (1 + 1e-9) + 1e-12).all()
print('inequality (6) for polynomial profiles (exact quadrature): ||c[h]||^2 / ((13/2) delta^1.5 E D_h^2(V))')
G, W = gh(16)
X = (G[0] + 1j * G[1]) / S2; Y = (G[2] + 1j * G[3]) / S2
for label, coef in cases[:5] + cases[5:7]:
    coef = np.asarray(coef, complex); q = cubic(coef, X, Y); V = np.abs(q) ** 2
    u = float(W @ V); delta = float(W @ V ** 2) - 2 * u * u
    line = []
    for name, hfun, D2fun in (('v', lambda v: v, lambda v: 48 + 0 * v),
                              ('v^2', lambda v: v * v, lambda v: 3 * (4 * v + 8 * v) ** 2 + np.maximum((12 * v + 48 * v) ** 2, (12 * v) ** 2)),
                              ('v - v^2/(4u)', lambda v: v - v * v / (4 * u), lambda v: 3 * (2 - v / u - 2 * v / u) ** 2 + np.maximum((6 - 3 * v / u - 12 * v / u) ** 2, (6 - 3 * v / u) ** 2))):
        cont = np.array([W @ (np.conj(X) * q * hfun(V)), W @ (np.conj(Y) * q * hfun(V))]); c2 = float(np.sum(np.abs(cont) ** 2))
        bound = 6.5 * delta ** 1.5 * float(W @ D2fun(V))
        assert c2 <= bound
        line.append('%s: %.2e' % (name, c2 / bound))
    print('   %-22s chi %7.3f | ' % (label, delta / u ** 2) + '   '.join(line))
print('constant: 1/4 (68 + 8 sqrt30)(3/8)^1.5 = %.5f < 13/2;   at h = v the theorem gives %.0f delta^1.5 against %.4f (Corollary 3)' % (0.25 * (68 + 8 * math.sqrt(30)) * (3 / 8) ** 1.5, 6.5 * 48, 3 * math.sqrt(6) / 4))
print('ALL OK')
