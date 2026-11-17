#!/usr/bin/env python3
"""Dual exact verifier (Sturm chains + Bernstein subdivision) of cert_h32.json on H_{3,2}(C^n).

Usage:  python3 -I verify_cert_h32.py CERT_H32.json [--quiet]

Only the Python standard library is used (fractions, json, math, sys).  Zero floating-point
operations occur anywhere in this file (`float` is never called); every arithmetic operation and
comparison is performed in exact arbitrary-precision integers and Fractions, with `-O`-safe `require(...)`.
Every row is verified independently by BOTH exact integer Sturm sequences AND exact integer
Bernstein subdivision + generic Laplace determinants.

============================================================================================
ANALYTIC INPUTS ON H_{3,2}(C^n) (proved in sharp-radius-2026-11-17-gemini-2762/PROOF.md §4
and verified on exact polynomial instances & 154,578 bipartite multigraphs by check_identities_exact.py):

For every n >= 1 and every q in H_{3,2}(C^n) normalised to u = E|q|^2 = 1, with V = |q|^2 = v = r^2,
c_1 = sum_j |d_j q|^2 >= 0, c_2 = sum_k |dbar_k q|^2 >= 0, a = sum_j (d_j q)(dbar_j q),
alpha_2 = |a|^2, rho = Re(conj(q)^2 a)/V on {V > 0} (0 on {V = 0}), and s = E|q|^4 - 2:

  (Q1) Antiholomorphic Stein identities (for g_i = G_i/v in C^1[0, oo) of at most linear growth):
         Form I:   E[ G_1(V) - (1/2) c_2 phi_1(V) - (1/2) rho Y_1(V) ] = 0
         Form II:  E[ G_2(V) - (1/3) c_1 phi_2(V) - (1/3) rho Y_2(V) ] = 0.
  (Q2) Pointwise Cauchy-Schwarz:  c_1 >= 0,  c_2 >= 0,  rho^2 <= alpha_2 <= c_1 c_2.
  (Q3) Moments and variance budgets:
         E[V] = 1,   E[V^2] = 2 + s,   0 <= s <= 1840   (sharp at q_1(z) = :z^3 zbar^2:/sqrt(12)),
         0 <= E[V rho] <= (5/2) s,
         E[(c_1 + c_2 - 5)^2] + 2 E[alpha_2] <= 10 s,
         E[(c_2 - 2)^2] <= (1013/100) s   (and <= 12 s),
         E[V^3] <= 6 + 9 s + 115400 s^{3/2}.

SOUNDNESS OF EACH VERIFIED ROW ON [s_lo, s_hi].
  With mu_bud > 0, mu_c2 >= 0, sig_pos >= 0, sig_neg >= 0, psi_a(v) >= 0, and xi(v) in C*
  (xi_2 >= 0, xi_1 >= 0, xi_a^2 <= 4 xi_1 xi_2), at any point with V = v = r^2 > 0:
    RHS := lam_0 + lam_1 V + lam_2 V^2 + lam_3 V^3 + Br_1 + Br_2 + (sig_pos - sig_neg) V rho
           + mu_bud * ((c_1 + c_2 - 5)^2 + 2 alpha_2) + mu_c2 * (c_2 - 2)^2.
  Writing 2 mu_bud alpha_2 = (2 mu_bud + psi_a) alpha_2 - psi_a alpha_2 >= (2 mu_bud + psi_a) rho^2 - psi_a c_1 c_2
  and subtracting xi_2 c_2 + xi_1 c_1 + xi_a rho >= 0 gives RHS - r >= z^T P(r) z on z = (c_2, c_1, rho, 1)^T,
  where the upper-left 3x3 block of P(r) is block-diagonal:
    M(v) = diag( [ mu_bud + mu_c2,  mu_bud - psi_a(v)/2 ;  mu_bud - psi_a(v)/2,  mu_bud ],  2 mu_bud + psi_a(v) ).
  Checking D_2(u_k) = mu_bud (mu_bud + mu_c2) - (mu_bud - psi_a[k]/2)^2 > 0 at every knot certifies
  D_1 > 0, D_2(v) > 0, D_3(v) = (2 mu_bud + psi_a(v)) D_2(v) > 0 for all v >= 0 (by concavity of D_2),
  and BOTH exact integer Sturm chains AND exact integer Bernstein subdivision certify det P(r) > 0
  on every [e_k, e_{k+1}] and [e_K, oo).
  Taking expectations via (Q1)-(Q3) bounds E|q| <= f(s) on [s_lo, s_hi], where lam_3 > 0 makes f(s)
  convex on [0, oo), so max_{[s_lo, s_hi]} f(s) = max(f(s_lo), f(s_hi)).  QED
============================================================================================
"""
import json
import sys
import time
from fractions import Fraction as Fr
from math import comb, gcd

C6_H32 = Fr(115400)
K2_H32 = Fr(1013, 100)
S_MAX_H32 = Fr(1840)
MAX_SUBDIV_DEPTH = 64


def require(cond, msg='verification condition failed'):
    if not cond:
        raise ValueError(msg)


def dec_ceil10(q):
    q = Fr(q)
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return '%d.%010d' % (n // 10**10, n % 10**10)


# ------------------------------------------------------------------ polynomial helpers
def ptrim(a):
    a = list(a)
    while a and a[-1] == 0:
        a.pop()
    return a


def padd(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) + (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def psub(a, b):
    return padd(a, [-x for x in b])


def pscale(a, c):
    if c == 0 or not a:
        return []
    return ptrim([c * x for x in a])


def pmul(a, b):
    if not a or not b:
        return []
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    return ptrim(out)


def peval(a, x):
    acc = Fr(0)
    for c in reversed(a):
        acc = acc * x + c
    return acc


def pprim(p, u0, val_u0):
    q = [Fr(0)] + [c / (i + 1) for i, c in enumerate(p)]
    q[0] = val_u0 - peval(q, u0)
    return ptrim(q)


def compose_r2(pv):
    out = []
    for c in pv:
        out.extend([c, Fr(0)])
    return ptrim(out)


def pshift_scale(p, a, w):
    res = []
    lin = [Fr(a), Fr(w)]
    for c in reversed(p):
        res = padd(pmul(res, lin), [c])
    return res


def div_xk(p, k):
    p = ptrim(p)
    require(all(i >= len(p) or p[i] == 0 for i in range(k)), 'not divisible by x^%d' % k)
    return p[k:] if len(p) > k else []


# ------------------------------------------------------------------ Method 1: Exact integer Sturm chains
def to_int_poly(a):
    a = ptrim(a)
    if not a:
        return []
    den = 1
    for x in a:
        den = den * x.denominator // gcd(den, x.denominator)
    ints = [int(x * den) for x in a]
    g = 0
    for x in ints:
        g = gcd(g, abs(x))
    return [x // g for x in ints]


def ieval_sign(a, x):
    p, q = x.numerator, x.denominator
    acc = 0
    n = len(a) - 1
    for i in range(n, -1, -1):
        acc = acc * p + a[i] * (q ** (n - i))
    return (acc > 0) - (acc < 0)


def irem_neg(a, b):
    a = list(a)
    lb = b[-1]
    db = len(b) - 1
    m = abs(lb)
    sg = 1 if lb > 0 else -1
    while len(a) - 1 >= db and a:
        la = a[-1]
        k = len(a) - 1 - db
        a = [m * x for x in a]
        for i, y in enumerate(b):
            a[i + k] -= sg * la * y
        a = ptrim(a)
    return to_int_poly([-x for x in a])


def sturm_positive_on(p, a, b=None):
    p = ptrim(p)
    if not p:
        return False
    if len(p) == 1:
        return p[0] > 0
    p0 = to_int_poly(p)
    p1 = to_int_poly([i * p0[i] for i in range(1, len(p0))])
    ch = [p0] + ([p1] if p1 else [])
    while len(ch) >= 2 and len(ch[-1]) > 1:
        r = irem_neg(ch[-2], ch[-1])
        if not r:
            break
        ch.append(r)
    if ieval_sign(ch[0], a) <= 0:
        return False
    nz_a = [s for s in (ieval_sign(c, a) for c in ch) if s != 0]
    va = sum(1 for i in range(len(nz_a) - 1) if nz_a[i] != nz_a[i + 1])
    if b is None:
        if ch[0][-1] <= 0:
            return False
        nz_b = [s for s in ((c[-1] > 0) - (c[-1] < 0) for c in ch) if s != 0]
    else:
        if ieval_sign(ch[0], b) <= 0:
            return False
        nz_b = [s for s in (ieval_sign(c, b) for c in ch) if s != 0]
    vb = sum(1 for i in range(len(nz_b) - 1) if nz_b[i] != nz_b[i + 1])
    return va == vb


# ------------------------------------------------------------------ Method 2: Generic det_mat + Bernstein
def det_mat(M):
    m = len(M)
    if m == 1:
        return M[0][0]
    if m == 2:
        return psub(pmul(M[0][0], M[1][1]), pmul(M[0][1], M[1][0]))
    acc = []
    for col in range(m):
        entry = M[0][col]
        if not entry:
            continue
        minor = [[M[r][c] for c in range(m) if c != col] for r in range(1, m)]
        term = pmul(entry, det_mat(minor))
        acc = padd(acc, term) if col % 2 == 0 else psub(acc, term)
    return acc


def bernstein_positive_on(p, a, b=None):
    q = pshift_scale(p, a, Fr(1) if b is None else (b - a))
    if not q:
        return False
    n = len(q) - 1
    den = 1
    for x in q:
        den = den * x.denominator // gcd(den, x.denominator)
    A = [int(x * den) for x in q]
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    if b is None:
        bern = [A[i] * (M // comb(n, i)) for i in range(n + 1)]
    else:
        bern = [sum(comb(i, j) * (M // comb(n, j)) * A[j] for j in range(i + 1)) for i in range(n + 1)]
    stack = [(bern, 0)]
    leaves = 0
    while stack:
        bv, depth = stack.pop()
        if min(bv) > 0:
            leaves += 1
            continue
        if bv[0] <= 0 or bv[-1] <= 0 or depth >= MAX_SUBDIV_DEPTH:
            return False, leaves
        tri = [bv]
        for _ in range(n):
            prev = tri[-1]
            tri.append([prev[i] + prev[i + 1] for i in range(len(prev) - 1)])
        stack.append(([tri[k][0] << (n - k) for k in range(n + 1)], depth + 1))
        stack.append(([tri[n - j][j] << j for j in range(n + 1)], depth + 1))
    return True, leaves


def verify_row(row):
    e = [Fr(x) for x in row['knots']]
    K = len(e) - 1
    require(K >= 1 and e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), 'invalid knots')
    u = [x * x for x in e]
    require(isinstance(row['knot_den'], int) and row['knot_den'] > 0, 'invalid knot_den')
    kden = Fr(row['knot_den'])

    def get_karr(nm):
        raw = row[nm]
        require(len(raw) == K + 1 and all(isinstance(x, int) for x in raw), 'invalid array ' + nm)
        return [Fr(x, kden) for x in raw]

    phi1, phi2 = get_karr('phi1'), get_karr('phi2')
    psi_a = get_karr('psi_a')
    xi2, xi1, xia = get_karr('xi2'), get_karr('xi1'), get_karr('xia')

    lam0, lam1, lam2 = (Fr(x) for x in row['lam'])
    lam3 = Fr(row['l3'])
    slope = [Fr(x) for x in row['slope']]
    mu_bud = Fr(row['mu_bud'])
    mu_c2 = Fr(row['mu_c2'])
    sig_pos = Fr(row['sig_pos'])
    sig_neg = Fr(row['sig_neg'])

    require(lam3 > 0 and mu_bud > 0 and mu_c2 >= 0 and sig_pos >= 0 and sig_neg >= 0, 'scalar signs failed')

    M11_c = mu_bud + mu_c2
    M22_c = mu_bud
    for k in range(K + 1):
        require(xi2[k] >= 0 and xi1[k] >= 0 and xia[k] ** 2 <= 4 * xi1[k] * xi2[k], 'xi SOC failed')
        require(psi_a[k] >= 0, 'psi_a < 0')
        d2k = M11_c * M22_c - (mu_bud - Fr(1, 2) * psi_a[k]) ** 2
        require(d2k > 0, 'D2 <= 0 at knot %d' % k)

    G_val = [Fr(0), Fr(0)]
    vv = [Fr(0), Fr(1)]
    tot_leaves = 0

    for k in range(K + 1):
        tail = (k == K)
        u0 = u[k]
        u1 = None if tail else u[k + 1]
        a_lo = e[k]
        b_hi = None if tail else e[k + 1]

        if tail:
            pc = lambda arr: ptrim([arr[K]])
        else:
            def pc(arr, k=k, u0=u0, u1=u1):
                sl = (arr[k + 1] - arr[k]) / (u1 - u0)
                return ptrim([arr[k] - sl * u0, sl])

        p1 = padd(pc(phi1), [Fr(0), slope[0]])
        p2 = padd(pc(phi2), [Fr(0), slope[1]])
        psa = pc(psi_a)
        x2p, x1p, xap = pc(xi2), pc(xi1), pc(xia)

        g1 = pprim(p1, u0, G_val[0])
        g2 = pprim(p2, u0, G_val[1])
        vY1 = psub(pmul(vv, p1), g1)
        vY2 = psub(pmul(vv, p2), g2)

        M12 = psub([mu_bud], pscale(psa, Fr(1, 2)))
        M33 = padd([2 * mu_bud], psa)
        D2 = psub([M11_c * M22_c], pmul(M12, M12))
        b1_v = psub([Fr(-5) * mu_bud - Fr(2) * mu_c2], padd(pscale(p1, Fr(1, 4)), pscale(x2p, Fr(1, 2))))
        b2_v = psub([Fr(-5) * mu_bud], padd(pscale(p2, Fr(1, 6)), pscale(x1p, Fr(1, 2))))
        q1_v = padd([lam0 + 25 * mu_bud + 4 * mu_c2, lam1, lam2, lam3], padd(g1, g2))

        if k == 0:
            Y1_v, Y2_v = div_xk(vY1, 1), div_xk(vY2, 1)
            b3_v = psub([Fr(0), Fr(1, 2) * (sig_neg - sig_pos)],
                        padd(pscale(Y1_v, Fr(1, 4)), padd(pscale(Y2_v, Fr(1, 6)), pscale(xap, Fr(1, 2)))))
            # Method 1 (Sturm via block-diagonal Schur formula)
            quad_12 = padd(pscale(pmul(b1_v, b1_v), M22_c),
                           psub(pscale(pmul(b2_v, b2_v), M11_c), pscale(pmul(M12, pmul(b1_v, b2_v)), Fr(2))))
            D3_v = pmul(M33, D2)
            quad_v = padd(pmul(M33, quad_12), pmul(D2, pmul(b3_v, b3_v)))
            D4_sturm = psub(pmul(psub(compose_r2(q1_v), [Fr(0), Fr(1)]), compose_r2(D3_v)), compose_r2(quad_v))
            require(sturm_positive_on(D4_sturm, a_lo, b_hi), f'Sturm D4 failed k=0')

            # Method 2 (Bernstein via generic 4x4 Laplace det_mat)
            P_mat = [
                [[M11_c], compose_r2(M12), [], compose_r2(b1_v)],
                [compose_r2(M12), [M22_c], [], compose_r2(b2_v)],
                [[], [], compose_r2(M33), compose_r2(b3_v)],
                [compose_r2(b1_v), compose_r2(b2_v), compose_r2(b3_v), psub(compose_r2(q1_v), [Fr(0), Fr(1)])],
            ]
            ok_b, lv = bernstein_positive_on(det_mat(P_mat), a_lo, b_hi)
            require(ok_b, f'Bernstein D4 failed k=0')
            tot_leaves += lv
        else:
            vb3 = psub([Fr(0), Fr(0), Fr(1, 2) * (sig_neg - sig_pos)],
                       padd(pscale(vY1, Fr(1, 4)), padd(pscale(vY2, Fr(1, 6)), pscale(pmul(vv, xap), Fr(1, 2)))))
            quad_12 = padd(pscale(pmul(b1_v, b1_v), M22_c),
                           psub(pscale(pmul(b2_v, b2_v), M11_c), pscale(pmul(M12, pmul(b1_v, b2_v)), Fr(2))))
            vD3 = pmul(vv, pmul(M33, D2))
            v2_quad = padd(pmul(pmul(vv, vv), pmul(M33, quad_12)), pmul(D2, pmul(vb3, vb3)))
            vq1_r = psub(compose_r2(pmul(vv, q1_v)), [Fr(0), Fr(0), Fr(0), Fr(1)])
            D4_sturm = psub(pmul(vq1_r, compose_r2(vD3)), compose_r2(v2_quad))
            require(sturm_positive_on(D4_sturm, a_lo, b_hi), f'Sturm D4 failed k={k}')

            # S = diag(1, 1, v, v) on P(r), with common r^4 = v^2 divided out:
            r2 = [Fr(0), Fr(0), Fr(1)]
            r4 = pmul(r2, r2)
            P_mat = [
                [[M11_c], compose_r2(M12), [], compose_r2(pmul(vv, b1_v))],
                [compose_r2(M12), [M22_c], [], compose_r2(pmul(vv, b2_v))],
                [[], [], compose_r2(pmul(vv, pmul(vv, M33))), compose_r2(pmul(vv, vb3))],
                [compose_r2(pmul(vv, b1_v)), compose_r2(pmul(vv, b2_v)), compose_r2(pmul(vv, vb3)),
                 psub(pmul(r4, compose_r2(q1_v)), pmul(r4, [Fr(0), Fr(1)]))],
            ]
            det_bern = div_xk(det_mat(P_mat), 4)
            require(det_bern == D4_sturm, f'Sturm vs Laplace polynomial mismatch k={k}')
            ok_b, lv = bernstein_positive_on(det_bern, a_lo, b_hi)
            require(ok_b, f'Bernstein D4 failed k={k}')
            tot_leaves += lv

        if not tail:
            G_val = [peval(g1, u1), peval(g2, u1)]

    bounds = {}
    lin_s = 10 * mu_bud + K2_H32 * mu_c2 + Fr(5, 2) * sig_pos
    for end in ('lo', 'hi'):
        s_e = Fr(row['s_' + end])
        if s_e == 0:
            bounds[end] = lam0 + lam1 + 2 * lam2 + 6 * lam3
        else:
            sb = Fr(row['sqrt_ub_' + end])
            require(sb > 0 and sb * sb >= s_e, 'sqrt_ub failed')
            m3_ub = 6 + 9 * s_e + C6_H32 * s_e * sb
            bounds[end] = lam0 + lam1 + lam2 * (2 + s_e) + lam3 * m3_ub + lin_s * s_e

    return dict(bound=max(bounds.values()), bounds=bounds, K=K, leaves=tot_leaves)


def main():
    t0 = time.time()
    path = sys.argv[1]
    quiet = '--quiet' in sys.argv
    with open(path, encoding='utf-8') as fh:
        cert = json.load(fh)
    rows = cert['rows']
    require(len(rows) >= 1, 'empty rows')

    prev = Fr(0)
    worst = Fr(0)
    worst_idx = -1
    tot_leaves = 0

    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        require(s_lo == prev and s_hi > s_lo, f'row {i} contiguity failed')
        prev = s_hi
        res = verify_row(row)
        tot_leaves += res['leaves']
        if res['bound'] > worst:
            worst = res['bound']
            worst_idx = i
        if not quiet:
            print('row %2d  s in [%7s, %7s]  K=%2d  PASS (Sturm+Bernstein, leaves=%4d)  bound <= %s' % (
                i, row['s_lo'], row['s_hi'], res['K'], res['leaves'], dec_ceil10(res['bound'])), flush=True)

    require(prev >= S_MAX_H32, 'coverage < 1840')
    target = Fr(cert['claim'])
    require(target < 1 and worst < target, 'claim >= 1 or worst >= claim')
    dt = time.time() - t0
    print('H_{3,2} dual verifier (Sturm + Bernstein): covered [0, %s], leaves=%d, worst_row=%d, max_bound <= %s [%.2fs]' % (
        prev, tot_leaves, worst_idx, dec_ceil10(worst), dt))
    print('claim  E|q| <= %s ||q||_2 < ||q||_2  for every q in H_{3,2}(C^n):  VERIFIED' % cert['claim'])


if __name__ == '__main__':
    main()
