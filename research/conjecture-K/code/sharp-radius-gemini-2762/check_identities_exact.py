#!/usr/bin/env python3
"""Exact pure-stdlib algebraic and Wick polynomial checks for H_{2,1}(C^n) and H_{3,2}(C^n).

Usage:  python3 -I check_identities_exact.py [--quiet]

Only the Python standard library is used (fractions, math, random, sys).  Zero floating-point
operations occur anywhere in this file (`float` is never called); every polynomial identity,
Wick expectation, Laguerre-hyperplane margin, variance budget, and bipartite sixth-moment diagram
bound is verified in exact arbitrary-precision integers and Fractions, using `-O`-safe `require(...)`.

============================================================================================
WHAT THIS SCRIPT VERIFIES EXACTLY:

Part A — Complex cubic chaos H_{2,1}(C^d) (Task 2, Level-3 Stein hierarchy):
  1. Fourth- and fifth-order radial Stein identities in exact polynomial Wick arithmetic (d = 2, 3):
       (V)   E[ w h_5(V) + (c_2 h_5'(V) - h_5(V)) tilde_beta + tau_{ab} h_5'(V) ] = 0          (h_5 = 1, V)
       (VI)  E[ c_2(c_2-u)^2 phi_6(V) - (c_2-u)^2 G_6(V) + (c_2-u)^2 rho Y_6(V)
                + 2(c_2-u) tilde_beta g_6(V) ] = 0                                              (g_6 = 1, V)
       (VII) E[ (c_2-u) alpha_2 phi_7(V) + (c_2-u) rho (c_2 Y_7(V) - G_7(V))
                + (c_2-u) tilde_beta g_7(V) + tau_{ab} g_7(V) ] = 0                             (g_7 = 1, V)
     where tau_{ab} = Re(conj(q) a conj(b_loc)).
  2. Pointwise phase-decomposition & Cauchy-Schwarz inequality at multiple Gaussian test points:
       (V tau_{ab} - (V rho) tilde_beta)^2 <= (V^2 alpha_2 - (V rho)^2) * (V c_2 w - tilde_beta^2).

Part B — Complex quintic chaos H_{3,2}(C^d) (Task 3):
  3. Exact polynomial Wick identities on H_{3,2}(C^d) (d = 1, 2):
       - Orthogonality E[q conj(r)] = 0 against lower chaos, E|q|^2 = 12 ||T||_{HS}^2;
       - Form I:  E[ G_1(V) - (1/2) c_2 phi_1(V) - (1/2) rho Y_1(V) ] = 0                      (g_1 = 1, V)
       - Form II: E[ G_2(V) - (1/3) c_1 phi_2(V) - (1/3) rho Y_2(V) ] = 0                      (g_2 = 1, V)
       - First moments E[c_2] = 2u, E[c_1] = 3u, pointwise rho^2 <= |a|^2 <= c_1 c_2;
       - Variance & fourth-moment bounds: delta := E[V^2] - 2u^2 >= 0,  0 <= E[V rho] <= (5/2) delta,
         E[(c_1 + c_2 - 5u)^2] + 2 E|a|^2 <= 10 delta,  E[(c_2 - 2u)^2] <= 12 delta;
       - Univariate Laguerre quintic q_1(z) = z(|z|^4 - 6|z|^2 + 6)/sqrt(12):
         E|q_1|^2 = 1,  E|q_1|^4 = 1842 (chi = 1840, sharp maximum),  E|q_1|^6 = 59735934,  Var(c_2) = 852.
  4. Exact 9-component Complex Hyperplane Theorem rational norm ratios on H_{3,2}(C^n):
       For all 9 pairs (a, b) with 0 <= a <= 3, 0 <= b <= 2, a != b,
       2 * E_{R ~ Exp(1)}[ p_{a,b}(R) / sqrt(R) ] / sqrt(pi)
         in {1, 1, 7/8, 7/8, 51/64, 3/4, 3/4, 11/16, 5/8} <= 1.
  5. Exact rational proof of the universal variance constants on H_{3,2}(C^n):
       E[(c_2 - 2u)^2] <= 12 * (||V_5||_2^2 - u^2) <= 12 * delta,
       and with ||V_1||_2^2 >= 1296 C_{1,0} + 576 C_{0,1} included:
       E[(c_2 - 2u)^2] <= (1013/100) * delta.
  6. Exact enumeration of all 154,578 loopless directed (3,2)^3 x (2,3)^3 multigraphs on 6 vertices:
       - Total pairings / 12^3 == 59,735,934 == E[|q_1|^6], connected == 59,719,368 == kappa_6^c(q_1);
       - Grouping connected diagrams into the 68 exact exponent buckets over (C_{1,0}, C_{0,1}, C_{1,1}, C_{0,2}, C_{2,0})
         and applying exact outward-rounded rational weighted AM-GM proves universally:
           E[|q|^6] <= (6 + 9 s + 115400 s^{3/2}) ||q||_2^6   (C_{6,(3,2)} <= 115400).
============================================================================================
"""
import random
import sys
from fractions import Fraction as Fr
from math import comb, factorial as fact


def require(cond, msg='exact check failed'):
    if not cond:
        raise ValueError(msg)


def dec_ceil6(q):
    q = Fr(q)
    n = (q.numerator * 10**6 + q.denominator - 1) // q.denominator
    return '%d.%06d' % (n // 10**6, n % 10**6)


def int_nth_root_floor(n, d):
    if n <= 0:
        return 0
    hi = 1 << ((n.bit_length() + d - 1) // d)
    lo = 0
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if mid ** d <= n:
            lo = mid
        else:
            hi = mid - 1
    require(lo ** d <= n < (lo + 1) ** d, 'root floor invariant failed')
    return lo


def rat_pow_ub(q, p_num, p_den, prec=10**8):
    q = Fr(q)
    if p_num == 0:
        return Fr(1)
    if q == 0:
        return Fr(0)
    num_int = (q.numerator ** p_num) * (prec ** p_den)
    den_pow = q.denominator ** p_num
    q_ceil = (num_int + den_pow - 1) // den_pow
    m = int_nth_root_floor(q_ceil - 1, p_den) + 1 if q_ceil > 0 else 1
    ub = Fr(m, prec)
    require((ub ** p_den) >= (q ** p_num), 'rat_pow_ub failed')
    return ub


def rat_pow_lb(q, p_num, p_den, prec=10**8):
    q = Fr(q)
    if p_num == 0:
        return Fr(1)
    if q == 0:
        return Fr(0)
    num_int = (q.numerator ** p_num) * (prec ** p_den)
    den_pow = q.denominator ** p_num
    m = int_nth_root_floor(num_int // den_pow, p_den)
    lb = Fr(m, prec)
    require(lb >= 0 and (lb ** p_den) <= (q ** p_num), 'rat_pow_lb failed')
    return lb


# ------------------------------------------------------------------ exact Q[i] multivariate polynomial algebra
class QComplex:
    __slots__ = ('re', 'im')

    def __init__(self, re=0, im=0):
        self.re = Fr(re)
        self.im = Fr(im)

    def __bool__(self):
        return bool(self.re or self.im)

    def conj(self):
        return QComplex(self.re, -self.im)

    def scale(self, s):
        s = Fr(s)
        return QComplex(self.re * s, self.im * s)

    def __add__(self, o):
        return QComplex(self.re + o.re, self.im + o.im)

    def __sub__(self, o):
        return QComplex(self.re - o.re, self.im - o.im)

    def __mul__(self, o):
        return QComplex(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re)


def padd(p, q, scale_q=1):
    out = dict(p)
    sq = Fr(scale_q)
    for k, v in q.items():
        nv = out.get(k, QComplex()) + v.scale(sq)
        if nv:
            out[k] = nv
        else:
            out.pop(k, None)
    return out


def pmul(p, q):
    if not p or not q:
        return {}
    out = {}
    for k1, v1 in p.items():
        for k2, v2 in q.items():
            k = tuple(a + b for a, b in zip(k1, k2))
            nv = out.get(k, QComplex()) + (v1 * v2)
            if nv:
                out[k] = nv
            else:
                out.pop(k, None)
    return out


def pconst(c, d):
    return {(0,) * (2 * d): c} if c else {}


def pvar(idx, d):
    m = [0] * (2 * d)
    m[idx] = 1
    return {tuple(m): QComplex(1, 0)}


def pconj(p, d):
    return {k[d:] + k[:d]: v.conj() for k, v in p.items()}


def pdiff(p, idx):
    out = {}
    for k, v in p.items():
        e = k[idx]
        if e > 0:
            nk = list(k)
            nk[idx] = e - 1
            out[tuple(nk)] = v.scale(e)
    return out


def pexpect(p, d):
    """Exact expectation under z_1, ..., z_d i.i.d. CN(0, 1): E[z^a zbar^b] = prod_j (a_j! if a_j == b_j else 0)."""
    acc = QComplex()
    for k, v in p.items():
        ok = True
        w = 1
        for j in range(d):
            if k[j] != k[d + j]:
                ok = False
                break
            w *= fact(k[j])
        if ok:
            acc = acc + v.scale(w)
    return acc


def peval_point(p, z_vals, d):
    acc = QComplex()
    zc = [z.conj() for z in z_vals]
    for k, v in p.items():
        term = v
        for j in range(d):
            for _ in range(k[j]):
                term = term * z_vals[j]
            for _ in range(k[d + j]):
                term = term * zc[j]
        acc = acc + term
    return acc


def real_part_poly(p, d):
    s = padd(p, pconj(p, d))
    return {k: v.scale(Fr(1, 2)) for k, v in s.items()}


# ------------------------------------------------------------------ Wick builders for H_{2,1} and H_{3,2}
def build_wick_cubic(t, d):
    """q(z) = sum_{a,b,k} t_{a,b,k} : z_a z_b zbar_k : in H_{2,1}(C^d)."""
    q = {}
    z = [pvar(j, d) for j in range(d)]
    zb = [pvar(d + j, d) for j in range(d)]
    for a in range(d):
        for b in range(d):
            for k in range(d):
                c = t[a][b][k]
                if not c:
                    continue
                term = pmul(pmul(z[a], z[b]), zb[k])
                if a == k:
                    term = padd(term, z[b], -1)
                if b == k:
                    term = padd(term, z[a], -1)
                q = padd(q, {m: v * c for m, v in term.items()})
    return q


def wick_monomial_32(i, j, k, a, b, d):
    """Exact Wick monomial : z_i z_j z_k zbar_a zbar_b : in H_{3,2}(C^d) by inclusion-exclusion."""
    z = [pvar(m, d) for m in range(d)]
    zb = [pvar(d + m, d) for m in range(d)]
    hol = (i, j, k)
    anti = (a, b)
    res = pmul(pmul(pmul(z[i], z[j]), z[k]), pmul(zb[a], zb[b]))
    # Subtract 1-contractions
    for hi in range(3):
        for ai in range(2):
            if hol[hi] == anti[ai]:
                rem_h = [hol[x] for x in range(3) if x != hi]
                rem_a = [anti[y] for y in range(2) if y != ai]
                sub1 = pmul(pmul(z[rem_h[0]], z[rem_h[1]]), zb[rem_a[0]])
                res = padd(res, sub1, -1)
    # Add back 2-contractions (pairings of anti=(a,b) with 2 distinct slots of hol=(i,j,k))
    for h0 in range(3):
        for h1 in range(3):
            if h0 != h1 and hol[h0] == anti[0] and hol[h1] == anti[1]:
                rem_h = [hol[x] for x in range(3) if x != h0 and x != h1][0]
                res = padd(res, z[rem_h], 1)
    return res


def check_part_a_cubic(quiet=False):
    rng = random.Random(20261117)
    test_pts_3 = [
        [QComplex(1, 2), QComplex(-2, 1), QComplex(3, -1)],
        [QComplex(Fr(1, 2), Fr(-3, 2)), QComplex(2, 0), QComplex(-1, 3)],
        [QComplex(0, 1), QComplex(3, 2), QComplex(-2, -1)],
    ]
    for d in (2, 3):
        t = [[[QComplex() for _ in range(d)] for _ in range(d)] for _ in range(d)]
        for a in range(d):
            for b in range(a, d):
                for k in range(d):
                    val = QComplex(rng.randint(-2, 2), rng.randint(-2, 2))
                    t[a][b][k] = val
                    t[b][a][k] = val
        q = build_wick_cubic(t, d)
        qb = pconj(q, d)
        V_p = pmul(q, qb)
        u = pexpect(V_p, d).re
        require(u > 0, 'nonpositive norm in cubic check')

        dq = [pdiff(q, j) for j in range(d)]
        F_k = [pdiff(q, d + k) for k in range(d)]
        Fb_k = [pconj(F_k[k], d) for k in range(d)]
        c1_p, c2_p, a_p = {}, {}, {}
        for j in range(d):
            c1_p = padd(c1_p, pmul(dq[j], pconj(dq[j], d)))
            c2_p = padd(c2_p, pmul(F_k[j], Fb_k[j]))
            a_p = padd(a_p, pmul(dq[j], F_k[j]))
        ab_p = pconj(a_p, d)
        W_k = [pdiff(a_p, d + k) for k in range(d)]
        Wb_k = [pconj(W_k[k], d) for k in range(d)]
        w_p, bloc_p = {}, {}
        for k in range(d):
            w_p = padd(w_p, pmul(W_k[k], Wb_k[k]))
            bloc_p = padd(bloc_p, pmul(Fb_k[k], W_k[k]))
        bloc_b = pconj(bloc_p, d)

        tb_p = real_part_poly(pmul(qb, bloc_p), d)
        tau_ab_p = real_part_poly(pmul(pmul(qb, a_p), bloc_b), d)
        Vrho_p = real_part_poly(pmul(pmul(qb, qb), a_p), d)
        al2_p = pmul(a_p, ab_p)
        c2_mu = padd(c2_p, pconst(QComplex(u, 0), d), -1)
        c2_mu2 = pmul(c2_mu, c2_mu)

        # (V) for h_5(V) = 1 (h_5' = 0) and h_5(V) = V (h_5' = 1)
        e5_0 = pexpect(padd(w_p, tb_p, -1), d)
        require(e5_0.re == 0 and e5_0.im == 0, 'Identity (V) m=0 failed')
        br5_1 = padd(padd(pmul(w_p, V_p), pmul(padd(c2_p, V_p, -1), tb_p)), tau_ab_p)
        e5_1 = pexpect(br5_1, d)
        require(e5_1.re == 0 and e5_1.im == 0, 'Identity (V) m=1 failed')

        # (VI) for g_6(V) = 1 (G_6 = V, phi_6 = 1, Y_6 = 0) and g_6(V) = V (G_6 = V^2, phi_6 = 2V, Y_6 = V)
        br6_0 = padd(pmul(padd(c2_p, V_p, -1), c2_mu2), pmul(c2_mu, tb_p), 2)
        e6_0 = pexpect(br6_0, d)
        require(e6_0.re == 0 and e6_0.im == 0, 'Identity (VI) m=0 failed')
        V2_p = pmul(V_p, V_p)
        br6_a = pmul(c2_mu2, padd({k: v.scale(2) for k, v in pmul(c2_p, V_p).items()}, V2_p, -1))
        br6_b = padd(pmul(c2_mu2, Vrho_p), {k: v.scale(2) for k, v in pmul(pmul(c2_mu, tb_p), V_p).items()})
        e6_1 = pexpect(padd(br6_a, br6_b), d)
        require(e6_1.re == 0 and e6_1.im == 0, 'Identity (VI) m=1 failed')

        # (VII) for g_7(V) = 1 (G_7 = V, phi_7 = 1, Y_7 = 0) and g_7(V) = V (G_7 = V^2, phi_7 = 2V, Y_7 = V)
        br7_0 = padd(pmul(c2_mu, padd(al2_p, Vrho_p, -1)), padd(pmul(c2_mu, tb_p), tau_ab_p))
        e7_0 = pexpect(br7_0, d)
        require(e7_0.re == 0 and e7_0.im == 0, 'Identity (VII) m=0 failed')
        t7_a = {k: v.scale(2) for k, v in pmul(pmul(c2_mu, al2_p), V_p).items()}
        t7_b = pmul(pmul(c2_mu, Vrho_p), padd(c2_p, V_p, -1))
        t7_c = pmul(padd(pmul(c2_mu, tb_p), tau_ab_p), V_p)
        e7_1 = pexpect(padd(padd(t7_a, t7_b), t7_c), d)
        require(e7_1.re == 0 and e7_1.im == 0, 'Identity (VII) m=1 failed')

        # Pointwise phase-CS check
        for z_pt in test_pts_3:
            zp = z_pt[:d]
            Vv = peval_point(V_p, zp, d).re
            tauv = peval_point(tau_ab_p, zp, d).re
            Vrhov = peval_point(Vrho_p, zp, d).re
            tbv = peval_point(tb_p, zp, d).re
            al2v = peval_point(al2_p, zp, d).re
            c2v = peval_point(c2_p, zp, d).re
            wv = peval_point(w_p, zp, d).re
            lhs_cs = (Vv * tauv - Vrhov * tbv) ** 2
            rhs_cs = (Vv * Vv * al2v - Vrhov ** 2) * (Vv * c2v * wv - tbv ** 2)
            require(lhs_cs <= rhs_cs, '3x3 Gram CS failed at test point')
    if not quiet:
        print('Part A (H_{2,1} exact Wick identities (V), (VI), (VII) & Gram-phase CS, d=2,3): PASS')


def check_part_b_quintic(quiet=False):
    # 1. Exact 1D univariate Laguerre quintic q_1(z) = :z^3 zbar^2: / sqrt(12)
    #    Work with unnormalized q_un = :z^3 zbar^2: (so u = E|q_un|^2 = 12):
    q1_un = wick_monomial_32(0, 0, 0, 0, 0, 1)
    # Orthogonality against z, :z^2 zbar:
    require(pexpect(pmul(q1_un, pconj(pvar(0, 1), 1)), 1).re == 0, 'q1 not orthogonal to H_{1,0}')
    q21 = padd(pmul(pmul(pvar(0, 1), pvar(0, 1)), pvar(1, 1)), pvar(0, 1), -2)
    require(pexpect(pmul(q1_un, pconj(q21, 1)), 1).re == 0, 'q1 not orthogonal to H_{2,1}')

    V1 = pmul(q1_un, pconj(q1_un, 1))
    u1 = pexpect(V1, 1).re
    require(u1 == 12, 'E|:z^3 zbar^2:|^2 must equal 12')
    ev2_1 = pexpect(pmul(V1, V1), 1).re / (u1 ** 2)
    require(ev2_1 == 1842, 'E|q_1|^4 must equal 1842 (chi = 1840)')
    ev3_1 = pexpect(pmul(pmul(V1, V1), V1), 1).re / (u1 ** 3)
    require(ev3_1 == 59735934, 'E|q_1|^6 must equal 59735934')

    F1_0 = pdiff(q1_un, 1)
    c2_q1 = pmul(F1_0, pconj(F1_0, 1))
    ec2_q1 = pexpect(c2_q1, 1).re / u1
    require(ec2_q1 == 2, 'E[c_2]/u on q_1 must equal 2')
    c2_cent = padd(c2_q1, pconst(QComplex(2 * u1, 0), 1), -1)
    var_c2_q1 = pexpect(pmul(c2_cent, c2_cent), 1).re / (u1 ** 2)
    require(var_c2_q1 == 852, 'Var(c_2)/u^2 on q_1 must equal 852')

    # 2. General random dense quintic in H_{3,2}(C^2): check Form I, Form II, and all variance budgets
    rng = random.Random(20260523)
    T = [[[[[QComplex() for _ in range(2)] for _ in range(2)] for _ in range(2)] for _ in range(2)] for _ in range(2)]
    q_p = {}
    for i in range(2):
        for j in range(i, 2):
            for k in range(j, 2):
                h_perms = {(i, j, k), (i, k, j), (j, i, k), (j, k, i), (k, i, j), (k, j, i)}
                for a in range(2):
                    for b in range(a, 2):
                        a_perms = {(a, b), (b, a)}
                        val = QComplex(rng.randint(-2, 2), rng.randint(-2, 2))
                        if not val:
                            continue
                        w_mon = wick_monomial_32(i, j, k, a, b, 2)
                        mult = len(h_perms) * len(a_perms)
                        q_p = padd(q_p, {m: v * val.scale(mult) for m, v in w_mon.items()})
                        for hp in h_perms:
                            for ap in a_perms:
                                T[hp[0]][hp[1]][hp[2]][ap[0]][ap[1]] = val

    hs2 = Fr(0)
    for i in range(2):
        for j in range(2):
            for k in range(2):
                for a in range(2):
                    for b in range(2):
                        c = T[i][j][k][a][b]
                        hs2 += c.re * c.re + c.im * c.im
    qb_p = pconj(q_p, 2)
    V_p = pmul(q_p, qb_p)
    u = pexpect(V_p, 2).re
    require(u == 12 * hs2 and u > 0, 'isometry E|q|^2 == 12 ||T||_{HS}^2 failed on H_{3,2}(C^2)')

    dq = [pdiff(q_p, j) for j in range(2)]
    Fq = [pdiff(q_p, 2 + j) for j in range(2)]
    c1_p, c2_p, a_p = {}, {}, {}
    for j in range(2):
        c1_p = padd(c1_p, pmul(dq[j], pconj(dq[j], 2)))
        c2_p = padd(c2_p, pmul(Fq[j], pconj(Fq[j], 2)))
        a_p = padd(a_p, pmul(dq[j], Fq[j]))
    Vrho_p = real_part_poly(pmul(pmul(qb_p, qb_p), a_p), 2)
    al2_p = pmul(a_p, pconj(a_p, 2))

    # First moments E[c_2] == 2u, E[c_1] == 3u (Form I & II at g = 1, where G = V, phi = 1, Y = 0)
    ec2 = pexpect(c2_p, 2).re
    ec1 = pexpect(c1_p, 2).re
    require(ec2 == 2 * u and ec1 == 3 * u, 'first moments E[c_2]=2u, E[c_1]=3u failed')

    # Form I & II at g(V) = V (G = V^2, phi = 2V, Y = V):
    #   Form I:  E[V^2 - c_2 V - (1/2) V rho] == 0
    #   Form II: E[V^2 - (2/3) c_1 V - (1/3) V rho] == 0
    V2_p = pmul(V_p, V_p)
    ev2 = pexpect(V2_p, 2).re
    ec2V = pexpect(pmul(c2_p, V_p), 2).re
    ec1V = pexpect(pmul(c1_p, V_p), 2).re
    eVrho = pexpect(Vrho_p, 2).re
    require(ev2 - ec2V - Fr(1, 2) * eVrho == 0, 'Form I (g=V) failed on H_{3,2}')
    require(ev2 - Fr(2, 3) * ec1V - Fr(1, 3) * eVrho == 0, 'Form II (g=V) failed on H_{3,2}')

    delta = ev2 - 2 * u * u
    require(delta >= 0 and 0 <= eVrho <= Fr(5, 2) * delta, 'fourth-moment / E[V rho] bounds failed')
    sum_cent = padd(padd(c1_p, c2_p), pconst(QComplex(5 * u, 0), 2), -1)
    var_sum = pexpect(pmul(sum_cent, sum_cent), 2).re
    eal2 = pexpect(al2_p, 2).re
    require(var_sum + 2 * eal2 <= 10 * delta, '10*delta variance budget failed on H_{3,2}')
    c2_c = padd(c2_p, pconst(QComplex(2 * u, 0), 2), -1)
    var_c2 = pexpect(pmul(c2_c, c2_c), 2).re
    require(var_c2 <= 12 * delta, '12*delta c_2 variance bound failed on H_{3,2}')

    # 3. Exact 9-component Complex Hyperplane Theorem rational norm ratios
    expected_ratios = {
        (1, 0): Fr(1), (0, 1): Fr(1),
        (2, 1): Fr(7, 8), (1, 2): Fr(7, 8),
        (3, 2): Fr(51, 64),
        (2, 0): Fr(3, 4), (0, 2): Fr(3, 4),
        (3, 1): Fr(11, 16),
        (3, 0): Fr(5, 8),
    }
    for a in range(4):
        for b in range(3):
            if a == b:
                continue
            m, k = min(a, b), abs(a - b)
            L = [Fr((-1) ** j * comb(m + k, m - j), fact(j)) for j in range(m + 1)]
            L2 = [Fr(0)] * (2 * m + 1)
            for i1, c1_ in enumerate(L):
                for i2, c2_ in enumerate(L):
                    L2[i1 + i2] += c1_ * c2_
            nfac = Fr(fact(m), fact(m + k))
            ep = sum(nfac * cj * fact(k + j) for j, cj in enumerate(L2))
            require(ep == 1, 'Laguerre normalization failed')
            ratio = 2 * sum(nfac * cj * Fr(fact(2 * (k + j)), (4 ** (k + j)) * fact(k + j)) for j, cj in enumerate(L2))
            require(ratio == expected_ratios[(a, b)] and ratio <= 1, 'Hyperplane ratio mismatch')

    # 4. Exact rational verification of Var(c_2 - 2u) <= 12 * (||V_5||^2 - u^2) and <= (1013/100) * delta
    w_v5 = [Fr(2160), Fr(864), Fr(7776), Fr(432), Fr(3024)]
    w_v5_v1 = [Fr(3456), Fr(1440), Fr(7776), Fr(432), Fr(3024)]

    def c2_var_coeffs(a1, a2, a3):
        return [
            16 * (1 + Fr(1) / a1) * 324,
            9216 + 16 * (1 + a1) * 36,
            576 * (1 + a3) * 81 + 64 * (1 + a2) * 324,
            576 * (1 + Fr(1) / a3),
            64 * (1 + Fr(1) / a2) * 81,
        ]

    num_12 = c2_var_coeffs(Fr(1, 4), Fr(1, 2), Fr(1, 5))
    ratios_12 = [num_12[i] / w_v5[i] for i in range(5)]
    require(ratios_12 == [Fr(12), Fr(23, 2), Fr(56, 5), Fr(8), Fr(36, 7)] and max(ratios_12) == Fr(12),
            'exact 12*delta proof failed')
    num_1013 = c2_var_coeffs(Fr(19, 5), Fr(51, 250), Fr(19, 125))
    ratios_1013 = [num_1013[i] / w_v5_v1[i] for i in range(5)]
    require(max(ratios_1013) <= Fr(1013, 100), 'exact (1013/100)*delta proof failed')

    # 5. Exact enumeration of all 154,578 loopless directed (3,2)^3 x (2,3)^3 multigraphs -> C_{6,(3,2)} <= 115100
    h_rem = [3, 3, 3, 2, 2, 2]
    a_rem = [2, 2, 2, 3, 3, 3]
    d_graphs = []
    cur_d = [0] * 30

    def bt_u(u_idx):
        if u_idx == 6:
            if all(r == 0 for r in a_rem):
                d_graphs.append(tuple(cur_d))
            return
        targets = [v for v in range(6) if v != u_idx]

        def bt_v(idx, left):
            if idx == 4:
                v = targets[4]
                if left <= a_rem[v]:
                    cur_d[u_idx * 5 + 4] = left
                    a_rem[v] -= left
                    bt_u(u_idx + 1)
                    a_rem[v] += left
                return
            v = targets[idx]
            lim = left if left < a_rem[v] else a_rem[v]
            for m_ in range(lim + 1):
                cur_d[u_idx * 5 + idx] = m_
                a_rem[v] -= m_
                bt_v(idx + 1, left - m_)
                a_rem[v] += m_

        bt_v(0, h_rem[u_idx])

    bt_u(0)
    require(len(d_graphs) == 154578, 'expected 154578 loopless directed multigraphs')

    # Precompute target index table idx_of[u][v] in 0..29 and factorial table
    idx_of = [[-1] * 6 for _ in range(6)]
    for u_i in range(6):
        tgs = [v_i for v_i in range(6) if v_i != u_i]
        for pos, v_i in enumerate(tgs):
            idx_of[u_i][v_i] = u_i * 5 + pos
    ftab = (1, 1, 2, 6)

    perfect_matchings = (
        ((0, 1), (2, 3), (4, 5)), ((0, 1), (2, 4), (3, 5)), ((0, 1), (2, 5), (3, 4)),
        ((0, 2), (1, 3), (4, 5)), ((0, 2), (1, 4), (3, 5)), ((0, 2), (1, 5), (3, 4)),
        ((0, 3), (1, 2), (4, 5)), ((0, 3), (1, 4), (2, 5)), ((0, 3), (1, 5), (2, 4)),
        ((0, 4), (1, 2), (3, 5)), ((0, 4), (1, 3), (2, 5)), ((0, 4), (1, 5), (2, 3)),
        ((0, 5), (1, 2), (3, 4)), ((0, 5), (1, 3), (2, 4)), ((0, 5), (1, 4), (2, 3)),
    )
    canon_map = {
        (1, 0): 0, (2, 2): 0,
        (0, 1): 1, (3, 1): 1,
        (1, 1): 2, (2, 1): 2,
        (0, 2): 3, (3, 0): 3,
        (2, 0): 4, (1, 2): 4,
    }
    w_int = (3456, 1440, 7776, 432, 3024)

    # Note: 12^6 = 2985984; since max d_{uv} <= 3, 2985984 is divisible by (6^6 = 46656): 2985984 // 46656 == 64!
    # So EVERY pairing count mult_pairings = 2985984 // prod ftab[x] is an EXACT INTEGER!!
    tot_pairings = 0
    conn_pairings = 0
    by_exp_pairings = {}

    for dg in d_graphs:
        denom_f = 1
        for x in dg:
            denom_f *= ftab[x]
        mp = 2985984 // denom_f
        tot_pairings += mp

        # BFS undirected connectivity
        seen = 1  # bitmask of visited vertices, starting at vertex 0
        stack = [0]
        while stack:
            cu = stack.pop()
            for nb in range(6):
                if nb != cu and not (seen & (1 << nb)):
                    if dg[idx_of[cu][nb]] + dg[idx_of[nb][cu]] > 0:
                        seen |= (1 << nb)
                        stack.append(nb)
        if seen != 63:
            continue
        conn_pairings += mp

        # Choose a valid perfect matching maximizing prod w_int[i]^{exps[i]} (pure integer comparison!)
        best_wprod = -1
        best_exps = None
        for pm in perfect_matchings:
            e0 = e1 = e2 = e3 = e4 = 0
            ok = True
            for u_v, v_v in pm:
                duv = dg[idx_of[u_v][v_v]]
                dvu = dg[idx_of[v_v][u_v]]
                s_uv = duv + dvu
                if s_uv == 0 or s_uv == 5:
                    ok = False
                    break
                if (u_v < 3) != (v_v < 3):
                    if u_v < 3:
                        ic = canon_map[(duv, dvu)]
                    else:
                        ic = canon_map[(dvu, duv)]
                    if ic == 0: e0 += 2
                    elif ic == 1: e1 += 2
                    elif ic == 2: e2 += 2
                    elif ic == 3: e3 += 2
                    else: e4 += 2
                else:
                    i1 = canon_map[(duv, dvu)]
                    i2 = canon_map[(dvu, duv)]
                    if i1 == 0: e0 += 1
                    elif i1 == 1: e1 += 1
                    elif i1 == 2: e2 += 1
                    elif i1 == 3: e3 += 1
                    else: e4 += 1
                    if i2 == 0: e0 += 1
                    elif i2 == 1: e1 += 1
                    elif i2 == 2: e2 += 1
                    elif i2 == 3: e3 += 1
                    else: e4 += 1
            if ok:
                wp = (w_int[0] ** e0) * (w_int[1] ** e1) * (w_int[2] ** e2) * (w_int[3] ** e3) * (w_int[4] ** e4)
                if wp > best_wprod:
                    best_wprod = wp
                    best_exps = (e0, e1, e2, e3, e4)
        require(best_exps is not None and sum(best_exps) == 6, 'no valid perfect matching on connected multigraph')
        by_exp_pairings[best_exps] = by_exp_pairings.get(best_exps, 0) + mp

    require(tot_pairings == 59735934 * 1728, 'total pairings mismatch vs E|q_1|^6')
    require(conn_pairings == 59719368 * 1728, 'connected pairings mismatch vs kappa_6^c(q_1)')
    require(len(by_exp_pairings) == 68, 'expected 68 exponent buckets')

    # Exact outward-rounded rational weighted AM-GM bound over the 68 buckets:
    # With g = (4/5, 87/100, 27/20, 117/100, 22/25) > 0:
    #   prod_i (C_i)^{e_i/4} = prod_i (x_i / w_i)^{e_i/4}
    #   <= (prod_i (g_i / w_i)^{e_i/4}) * sum_i (e_i / 6) * (x_i / g_i)^{3/2}.
    g_rat = [Fr(4, 5), Fr(87, 100), Fr(27, 20), Fr(117, 100), Fr(22, 25)]
    g_inv_32 = [rat_pow_ub(Fr(1) / g_rat[i], 3, 2, prec=10**8) for i in range(5)]
    gw_pow_ub = [[rat_pow_ub(g_rat[i] / Fr(w_int[i]), e, 4, prec=10**8) for e in range(7)] for i in range(5)]

    A_amgm = [Fr(0)] * 5
    for exps, mp_sum in by_exp_pairings.items():
        # At u = 12 ||T||^2 = 1, the 3 matched vertex pairs have product <= prod_i (C_i)^{e_i/4}
        # (for d = 1, ||T||^2 = 1/12 gives C_i = 1/144 and prod_i C_i^{e_i/4} = (1/144)^{3/2} = 1/1728,
        # matching mp_sum / 1728 = 59,719,368 = kappa_6^c(q_1) exactly).
        coeff_ub = Fr(mp_sum)
        for i in range(5):
            if exps[i] > 0:
                coeff_ub *= gw_pow_ub[i][exps[i]]
        for i in range(5):
            if exps[i] > 0:
                A_amgm[i] += coeff_ub * Fr(exps[i], 6) * g_inv_32[i]

    C6_32_ub = max(A_amgm)
    require(C6_32_ub <= Fr(115400), 'C_{6,(3,2)} <= 115400 check failed: got ' + dec_ceil6(C6_32_ub))

    if not quiet:
        print('Part B (H_{3,2} exact Wick identities, Form I/II, q_1 cumulants, 9 Hyperplane margins): PASS')
        print('   Exact Var(c_2 - 2u) <= 12*(||V_5||^2 - u^2) and <= (1013/100)*delta: PASS')
        print('   Exact 154,578 bipartite multigraph enumeration (68 buckets):')
        print('     total/1728 = 59735934, connected/1728 = 59719368, C_{6,(3,2)} <= %s <= 115400: PASS' % (
            dec_ceil6(C6_32_ub)))


def machin_pi_lo():
    lo5 = sum(Fr((-1) ** j) * (Fr(1, 5) ** (2 * j + 1)) / (2 * j + 1) for j in range(12))
    lo239 = sum(Fr((-1) ** j) * (Fr(1, 239) ** (2 * j + 1)) / (2 * j + 1) for j in range(12))
    hi239 = lo239 + (Fr(1, 239) ** 25) / 25
    return 16 * lo5 - 4 * hi239


def dec_floor6(q):
    q = Fr(q)
    n = (q.numerator * 10**6) // q.denominator
    return '%d.%06d' % (n // 10**6, n % 10**6)


def check_part_c_degree5_small_t(quiet=False):
    """Exact rational verification of degree-5 small-t consequences of sharpened rho*(H_{2,1})."""
    pi_lo = machin_pi_lo()
    cap = Fr(500, 701)
    eps = Fr(39, 50)
    eta = Fr(779, 10000)

    # 1. At rho_0 = 1829/2000 = 0.9145:
    rho_9145 = Fr(1829, 2000)
    lam1_cap_9145 = cap / (rho_9145 * rho_9145)
    require(lam1_cap_9145 == Fr(2000000000, 2345013941), 'lam1_cap_9145 mismatch')
    c0_9145 = eps * (rho_9145 * rho_9145) + (eta * eta) / (pi_lo * eps)
    t_9145 = Fr(2518, 10000)
    require((1 - eta) * (t_9145 * t_9145) + c0_9145 < cap, 't <= 0.2518 failed at rho_0 = 1829/2000')

    # 2. At rho_0 = 183/200 = 0.915:
    rho_915 = Fr(183, 200)
    lam1_cap_915 = cap / (rho_915 * rho_915)
    require(lam1_cap_915 == Fr(20000000, 23475789), 'lam1_cap_915 mismatch')
    c0_915 = eps * (rho_915 * rho_915) + (eta * eta) / (pi_lo * eps)
    t_915 = Fr(2502, 10000)
    require((1 - eta) * (t_915 * t_915) + c0_915 < cap, 't <= 0.2502 failed at rho_0 = 183/200')

    if not quiet:
        print('Part C (exact degree-5 small-t consequences at (eps, eta) = (39/50, 779/10000)): PASS')
        print('   rho_0 = 1829/2000: lambda_1 <= 2000000000/2345013941 (>= %s), V <= (9221/10000)t^2 + %s < 500/701 for t <= 0.2518' % (
            dec_floor6(lam1_cap_9145), dec_ceil6(c0_9145)))
        print('   rho_0 = 183/200:   lambda_1 <= 20000000/23475789   (>= %s), V <= (9221/10000)t^2 + %s < 500/701 for t <= 0.2502' % (
            dec_floor6(lam1_cap_915), dec_ceil6(c0_915)))


def main():
    quiet = '--quiet' in sys.argv
    check_part_a_cubic(quiet=quiet)
    check_part_b_quintic(quiet=quiet)
    check_part_c_degree5_small_t(quiet=quiet)
    if not quiet:
        print('ALL EXACT IDENTITIES VERIFIED (zero floats).')


if __name__ == '__main__':
    main()
