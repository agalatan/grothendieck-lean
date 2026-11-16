"""Review of SHARED_BULK.md: independent exact checks (label C on instances; wick_exact.py is the antiholomorphic package's exact complex Wick calculus).

Instances (receivers first, then the block Y):
  E1: q = X(|Y|^2-1) + conj(Z) Y^2                       (distinct receivers; the package's example)
  E2: q = X1 y1 conj(y2) + X2 y3 conj(y2) + conj(X1) y3 y4 - conj(X2) y1 y4   (shared receivers, sum p_i f_i = 0; the package's second example)
  E3: q = X (y1 conj(y2)) + conj(X) y1^2                 (shared receiver, sum p f = y1^3 conj(y2) != 0: NOT in the class)
Checks, exactly:
  (a) q in H_{2,1}: E[q conj(y_j)] = 0 and E[q^2] = 0;
  (b) conditional properness: E[q^2 conj(q)^2 ...]: E|q|^4 = 2 E A^2 and E|q|^6 = 6 E A^3 with A = sum |p_i|^2 + |f_i|^2   (true iff V | Y is exponential to that order);
      and E[q^2 * conj(m(Y))] = 0 for the monomials m of sum p_i f_i (the conditional pseudo-covariance);
  (c) content: E[conj(X_i) q V^k] = (k+1)! E[p_i A^k], k = 1, 2, and E[conj(y_j) q V] = 0;
  (d) the ratio |c|^2/(delta Omega-hat) at h(v) = v (Omega-hat = 3u/4) against the coefficient (4) of SHARED_BULK.md and against 5/3.
"""
import sys, os, math
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import numpy as np
from wick_exact import *

def var(n, j, bar=False):
    z = (0,) * n; e = tuple(1 if k == j else 0 for k in range(n))
    return {(z, e): G(1)} if bar else {(e, z): G(1)}

def power(P, k, n):
    R = const(n, 1)
    for _ in range(k): R = mul(R, P)
    return R

def run(name, n, recv, ps, fs, in_class=True):
    """recv: receiver indices; ps[i], fs[i]: polynomials in Y (dicts)."""
    q = {}
    for i, r in enumerate(recv):
        q = lin((1, q), (1, mul(var(n, r), ps[i])), (1, mul(var(n, r, True), fs[i])))
    qb = conj(q); V = mul(q, qb)
    u = E(V); assert u.i == 0; u = u.r
    for j in range(n):
        assert E(mul(q, var(n, j, True))).iszero()
    assert E(mul(q, q)).iszero()
    A = {}
    for p, f in zip(ps, fs):
        A = lin((1, A), (1, mul(p, conj(p))), (1, mul(f, conj(f))))
    assert E(A) == G(u)
    pf = {}
    for p, f in zip(ps, fs): pf = lin((1, pf), (1, mul(p, f)))
    EV2 = E(mul(V, V)).r; EA2 = E(mul(A, A)).r; EV3 = E(power(V, 3, n)).r; EA3 = E(power(A, 3, n)).r
    proper = (EV2 == 2 * EA2) and (EV3 == 6 * EA3)
    print(f'{name}: u = {u}, sum p_i f_i {"== 0" if len(pf) == 0 else "!= 0"}; E V^2 = {EV2}, 2 E A^2 = {2*EA2}; E V^3 = {EV3}, 6 E A^3 = {6*EA3}; conditionally exponential to third order: {proper}')
    assert proper == in_class == (len(pf) == 0)
    delta = EV2 - 2 * u * u
    c2 = Fr(0)
    for i, r in enumerate(recv):
        for k in (1, 2):
            lhs = E(mul(mul(var(n, r, True), q), power(V, k, n)))
            rhs = math.factorial(k + 1) * E(mul(ps[i], power(A, k, n)))
            if in_class: assert lhs == rhs, (name, i, k)
            if k == 1: c2 += lhs.abs2(); c_reg = rhs
        if not in_class:
            print(f'   receiver {i}: E[conj(X) q V] = {E(mul(mul(var(n, r, True), q), V))}, regression value 2 E[p A] = {2*E(mul(ps[i], A))}')
    for j in range(n):
        if j not in recv:
            val = E(mul(mul(var(n, j, True), q), V))
            if in_class: assert val.iszero()
            else: c2 += val.abs2()
    ratio = c2 / (delta * Fr(3, 4) * u)
    print(f'   delta = {delta}; ||c[v]||^2 = {c2}; ratio ||c||^2/(delta*Omega-hat) at h = v: {ratio} = {float(ratio):.4f}')
    return float(u), float(delta), float(ratio)

def real_forms(n_y, As, Fs):
    """real symmetric 2n_y x 2n_y matrices of Re/Im of p_i = Y^*A_iY - tr A_i and f_i = Y^T F_i Y, Y = (G_R + i G_I)/sqrt2."""
    Hs = []; is_p = []
    for A in As:
        B, C = A.real, A.imag
        for N in (0.5 * np.block([[B, -C], [C, B]]), 0.5 * np.block([[C, B], [-B, C]])):
            Hs.append((N + N.T) / 2); is_p.append(True)
    for F in Fs:
        F1, F2 = F.real, F.imag
        for N in (0.5 * np.block([[F1, -F2], [-F2, -F1]]), 0.5 * np.block([[F2, F1], [F1, -F2]])):
            Hs.append((N + N.T) / 2); is_p.append(False)
    keep = [i for i, H in enumerate(Hs) if np.abs(H).max() > 0]
    return [Hs[i] for i in keep], [is_p[i] for i in keep]

def theta_formula(Hs, is_p):
    r = len(Hs)
    M = np.array([[2 * np.trace(Hs[i] @ Hs[j]) for j in range(r)] for i in range(r)])
    G0 = sum(H @ H for H in Hs)
    S = [[(Hs[i] @ Hs[j] + Hs[j] @ Hs[i]) / 2 for j in range(r)] for i in range(r)]
    R = np.array([[np.trace(G0 @ S[i][j]) for j in range(r)] for i in range(r)])
    T = np.array([[sum(np.trace(S[k][i] @ S[k][j]) for k in range(r)) for j in range(r)] for i in range(r)])
    v = np.array([np.trace(G0 @ H) for H in Hs])
    J = M @ M + 8 * R + 16 * T; K = M @ M + 8 * T + 16 * R
    u = 2 * sum(np.trace(H @ H) for H in Hs); L = 2 * np.trace(J)
    idx = [i for i in range(r) if is_p[i]]
    Kp = K[np.ix_(idx, idx)] + 64 * np.outer(v[idx], v[idx]) / u
    lam = np.linalg.eigvalsh(Kp)[-1]
    theta = (1 + 4 * lam / (2 * np.trace(J))) / 3
    return u, 2 * L, theta

if __name__ == '__main__':
    # E1: variables (X, Z, Y) = (0, 1, 2)
    n = 3; Y = var(n, 2); Yb = var(n, 2, True)
    p = lin((1, mul(Y, Yb)), (-1, const(n, 1))); f = mul(Y, Y)
    u1, d1, r1 = run('E1  X(|Y|^2-1) + conj(Z) Y^2', n, [0, 1], [p, {}], [{}, f])
    Hs, isp = real_forms(1, [np.array([[1.0 + 0j]])], [np.array([[1.0 + 0j]])])
    print('   formula (4):  u, delta, theta =', theta_formula(Hs, isp), ' (35/39 =', 35 / 39, ')')
    # E2: variables (X1, X2, y1, y2, y3, y4) = (0..5)
    n = 6; y = [var(n, 2 + k) for k in range(4)]; yb = [var(n, 2 + k, True) for k in range(4)]
    p1 = mul(y[0], yb[1]); p2 = mul(y[2], yb[1]); f1 = mul(y[2], y[3]); f2 = lin((-1, mul(y[0], y[3])))
    u2, d2, r2 = run('E2  shared receivers, sum p_i f_i = 0', n, [0, 1], [p1, p2], [f1, f2])
    A1 = np.zeros((4, 4), complex); A1[1, 0] = 1      # Y^* A Y = conj(y2) y1
    A2 = np.zeros((4, 4), complex); A2[1, 2] = 1      # conj(y2) y3
    F1 = np.zeros((4, 4), complex); F1[2, 3] = F1[3, 2] = 0.5
    F2 = np.zeros((4, 4), complex); F2[0, 3] = F2[3, 0] = -0.5
    Hs, isp = real_forms(4, [A1, A2], [F1, F2])
    print('   formula (4):  u, delta, theta =', theta_formula(Hs, isp), ' against exact u, delta =', u2, d2)
    # E3: variables (X, y1, y2): NOT in the class
    n = 3; y1, y2 = var(n, 1), var(n, 2); y2b = var(n, 2, True)
    run('E3  X y1 conj(y2) + conj(X) y1^2 (pseudo-covariance != 0)', n, [0], [mul(y1, y2b)], [mul(y1, y1)], in_class=False)
    print('ALL ASSERTIONS PASSED')
