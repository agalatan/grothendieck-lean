#!/usr/bin/env python3
"""Reviewer's check of the facts (F1)-(F4) on exact cubics (label C: exact integer/rational arithmetic).

For each test tensor t (Gaussian integers, symmetric in the first two slots), q = sum t_abc :y_a y_b conj(y_c): :
  (A) q is in H_{2,1}:  N1 q = 2 q,  N2 q = q.
  (B) the Lean objects of q, built literally from the Lean definitions in real coordinates; the dictionary
      radS = Gamma(a,a) + Gamma(b,b) = c1 + c2, radA + i radB = 2 a, radN = 2 Re(conj(q)^2 a) (normalised), so that
      Lean's w = (c1 + c2)/3 and r = radN/(3U) = (2/3) rho; and
      (own_wick.real_pair, lean_*): Chaos3, Circular J, E a^2 = E b^2, E ab = 0, and
          gramX (gramT J atil btil) = 4 * X(t)        for X = N, H, B, Y, Z,
      where X(t) are the same index patterns applied to the complex tensor t (atil + i btil = sqrt(2) q, so the
      Lean tensor of the pair (atil, btil) is sqrt(2) times the embedded t, and the scalars have degree 4);
      cubicTensorNormSq (gramT) = E atil^2  (Lean: Circular.cubicTensorNormSq_eq).
  (C) with u = E|q|^2 and the unnormalised scalars (n, h, b, y, z) = X(t)   [normalised: X(t)/u^2]:
        E V^2 - 2u^2      = 32n + 8h + 32b + 96y
        E (c2 - u)^2      = 16n + 4h
        E (c1 - c2 - u)^2 = 16n + 20h + 16b
        E (c1 + c2 - 3u)^2= 80n + 20h + 16b + 96y + 32z
        E (c1 - 2u)^2     = 32n + 16h + 16b + 48y + 16z
        E |a|^2           = 32b + 24y
        E conj(q)^2 a     = 32b + 48y   (imaginary part 0)
      and the intermediate steps of the proof of the two new rows:
        |P11 V|^2 = 16n + 4h + 16z,  |P11 c2|^2 = 16n,  <P11 V, P11 c2> = 16n + 8z,  <V - c2, c2 - u> = 24y.
  (D) the identities (I), (II) for G = v^2 (and v^3 when d <= 2).
  (E) the cuts: n,h,b,y,z >= 0, b <= n, y <= z, z^2 <= n h, m = n+b+3y-z >= 0, (3y-z)^2 <= h m, h0 >= 0, s0 >= 0,
      and (not used by the certificates) n <= u^2/4, h <= u^2/4, s <= 42.
  (F) for d <= 2: E V^3 against the three sixth-moment bounds of (F4) (float comparison of exact numbers).
"""
import sys, random, time
from fractions import Fraction as Fr
from math import sqrt
import own_wick as W

C6 = Fr(4045313, 100000)


def sym_tensor(d, entries):
    t = [[[(0, 0)] * d for _ in range(d)] for _ in range(d)]
    for (a, b, c), v in entries.items():
        t[a][b][c] = v
        t[b][a][c] = v
    return t


def random_tensor(d, rng, density=0.75, amp=3):
    ent = {}
    for a in range(d):
        for b in range(a, d):
            for c in range(d):
                if rng.random() < density:
                    ent[(a, b, c)] = (rng.randint(-amp, amp), rng.randint(-amp, amp))
    if not any(v != (0, 0) for v in ent.values()):
        ent[(0, 0, 0)] = (1, 0)
    return sym_tensor(d, ent)


def cases():
    rng = random.Random(987654321)          # the reviewer's seed
    out = []
    out.append(('monomial y(|y|^2-2)', 1, sym_tensor(1, {(0, 0, 0): (1, 0)})))
    out.append(('X^2 conj(Y)', 2, sym_tensor(2, {(0, 0, 1): (1, 0)})))
    out.append(('2 X(|Y|^2-1)', 2, sym_tensor(2, {(0, 1, 1): (1, 0)})))
    out.append(('H(X)+H(Y)', 2, sym_tensor(2, {(0, 0, 0): (1, 0), (1, 1, 1): (1, 0)})))
    out.append(('H(X)+i X^2conj(Y)+(2-i) 2X(|Y|^2-1)', 2,
                sym_tensor(2, {(0, 0, 0): (1, 0), (0, 0, 1): (0, 1), (0, 1, 1): (2, -1)})))
    for i in range(4):
        out.append(('random d=2 #%d' % i, 2, random_tensor(2, rng)))
    out.append(('H(y1)+2y1(|y2|^2-1)+2y1(|y3|^2-1)', 3, sym_tensor(3, {(0, 0, 0): (1, 0), (0, 1, 1): (1, 0), (0, 2, 2): (1, 0)})))
    out.append(('H(X)+H(Y)+H(Z)', 3, sym_tensor(3, {(0, 0, 0): (1, 0), (1, 1, 1): (1, 0), (2, 2, 2): (1, 0)})))
    for i in range(3):
        out.append(('random d=3 #%d' % i, 3, random_tensor(3, rng, density=0.6)))
    # d = 4 is the stable range for invariants of bidegree (2,2) of a tensor in Sym^2 V (x) V^*: at most 4 slots of
    # the same type can be antisymmetrised without hitting a symmetric pair, so a relation valid for all tensors in
    # dimension 4 is valid in every dimension (see REVIEW.md, section 2).
    for i in range(6):
        out.append(('random d=4 #%d (dense, entries up to 99)' % i, 4, random_tensor(4, rng, density=1.0, amp=99)))
    out.append(('random d=5 (sparse)', 5, random_tensor(5, rng, density=0.25, amp=5)))
    # d = 6: no relation at all between the contraction invariants of degree (2,2); light mode (second moments of
    # c1, c2, a and the Lean scalars only)
    out.append(('random d=6 (sparse, light mode)', 6, random_tensor(6, rng, density=0.3, amp=9)))
    return out


def run_case(name, d, t, real_side=True):
    R = range(d)
    res = {}
    light = d >= 6          # skip E V^2, conj(q)^2 a and the dictionary polynomials (sizes)
    q = W.wick_cubic(t, d)
    n1, n2 = W.number_ops(q, d)
    res['A: N1 q = 2q, N2 q = q'] = (W.p_add(n1, q, -2) == {} and W.p_add(n2, q, -1) == {})
    qb, V, c1, c2, a = W.stein_objects(q, d)
    E = lambda p: W.p_E(p, d)
    u = E(V)[0]
    assert E(V)[1] == 0
    res['E|q|^2 = 2 sum|t|^2, E c1 = 2u, E c2 = u'] = (u == 2 * W.tensor_norm_sq(t, R) and E(c1) == (2 * u, 0)
                                                    and E(c2) == (u, 0))
    tc = W.to_fr_tensor(t, d)
    n, h, b, y, z = W.lean_contractions(tc, R)
    # ---------------- (B) real side
    if real_side:
        m = 2 * d
        at, bt = W.real_pair(q, d)
        J = W.lean_J(d)
        anti = all(J[i][j] == -J[j][i] for i in range(m) for j in range(m))
        sq = all(sum(J[i][j] * J[j][k] for j in range(m)) == (-1 if i == k else 0) for i in range(m) for k in range(m))
        circ = (W.lean_rotD(J, at, m) == W.r_add({}, bt, -1) and W.lean_rotD(J, bt, m) == at)
        chaos = (W.lean_ouL(at, m) == W.r_add({}, at, -3) and W.lean_ouL(bt, m) == W.r_add({}, bt, -3))
        Eaa, Ebb, Eab = W.r_E(W.r_mul(at, at)), W.r_E(W.r_mul(bt, bt)), W.r_E(W.r_mul(at, bt))
        res['B: Circular J, Chaos3, E a^2 = E b^2 = u, E ab = 0'] = (anti and sq and circ and chaos and Eaa == u
                                                                  and Ebb == u and Eab == 0)
        f, g = W.lean_cubicKernel(at, m), W.lean_cubicKernel(bt, m)
        tL = W.lean_gramT(J, f, g, m)
        nL, hL, bL, yL, zL = W.lean_contractions(tL, range(m))
        res['B: gram(gramT J a b) = 4 X(t) for N,H,B,Y,Z'] = ((nL, hL, bL, yL, zL) == (4 * n, 4 * h, 4 * b, 4 * y, 4 * z))
        res['B: cubicTensorNormSq(gramT) = E a^2'] = (W.tensor_norm_sq(tL, range(m)) == Eaa)
        symL = all(tL[i][j][k] == tL[j][i][k] for i in range(m) for j in range(m) for k in range(m))
        res['B: gramT symmetric in slots 1,2'] = symL
        # the dictionary between Lean's (S, A + iB, N) and (c1, c2, a):  with atil + i btil = sqrt(2) q,
        # radS = 2 (c1 + c2),  radA + i radB = 4 a,  radN = radA (a^2 - b^2) + radB (2ab) = 8 Re(conj(q)^2 a)
        assert W.complex_to_real(q, d, 1) == (at, bt)
    if real_side and not light:
        gaa, gbb, gab = W.lean_gam(at, at, m), W.lean_gam(bt, bt, m), W.lean_gam(at, bt, m)
        radS, radA, radB = W.r_add(gaa, gbb), W.r_add(gaa, gbb, -1), W.r_add({}, gab, 2)
        res['B: radS = 2(c1+c2), radA + i radB = 4a'] = (
            W.complex_to_real(W.p_add(c1, c2), d, 2) == (radS, {}) and W.complex_to_real(a, d, 4) == (radA, radB))
        # the rotation form of c1 - c2 (the identity 2(II) - (I) reads E G(V) = E[(c1 - c2) phi(V)]):
        # for the normalised pair c1 - c2 = 2 sum_ij J_ij d_i a d_j b; here (atil, btil) = sqrt(2)(a, b)
        PJ = {}
        for i_ in range(m):
            for j_ in range(m):
                if J[i_][j_] != 0:
                    PJ = W.r_add(PJ, W.r_mul(W.r_d(at, i_), W.r_d(bt, j_)), J[i_][j_])
        res['B: c1 - c2 = 2 sum_ij J_ij d_i a d_j b'] = (W.complex_to_real(W.p_add(c1, c2, -1), d, 2) == (W.r_add({}, PJ, 2), {}))
        if d <= 2:
            radN = W.r_add(W.r_mul(radA, W.r_add(W.r_mul(at, at), W.r_mul(bt, bt), -1)),
                           W.r_mul(radB, W.r_mul(at, bt)), 2)
            res['B: radN = 8 Re(conj(q)^2 a)'] = (W.complex_to_real(W.p_mul(W.p_mul(qb, qb), a), d, 6)[0] == radN)
        if d <= 2:
            Ut = W.r_add(W.r_mul(at, at), W.r_mul(bt, bt))
            EU2 = W.r_E(W.r_mul(Ut, Ut))
            # Lean: Circular.fourth_moment_contractions, E U^2 - 8 (E a^2)^2 = 32N + 8H + 32B + 96Y  (for atil, btil)
            res['B: Lean fourth_moment_contractions (real side)'] = (EU2 - 8 * Eaa ** 2 == 32 * nL + 8 * hL + 32 * bL + 96 * yL)
    # ---------------- (C) second moments
    cu = lambda x: W.p_const((x, 0), d)
    sqE = lambda p: E(W.p_mul(p, p))
    if not light:
        V2 = W.p_mul(V, V)
        EV2 = E(V2)[0]
        qb2a = W.p_mul(W.p_mul(qb, qb), a)
        res['C: s  = 32n+8h+32b+96y'] = (EV2 - 2 * u * u == 32 * n + 8 * h + 32 * b + 96 * y)
    res['C: E(c2-u)^2 = 16n+4h'] = (sqE(W.p_add(c2, cu(u), -1)) == (16 * n + 4 * h, 0))
    res['C: E(c1-c2-u)^2 = 16n+20h+16b   [new]'] = (sqE(W.p_add(W.p_add(c1, c2, -1), cu(u), -1)) == (16 * n + 20 * h + 16 * b, 0))
    res['C: E(c1+c2-3u)^2 = 80n+20h+16b+96y+32z'] = (sqE(W.p_add(W.p_add(c1, c2), cu(3 * u), -1))
                                                    == (80 * n + 20 * h + 16 * b + 96 * y + 32 * z, 0))
    res['C: E(c1-2u)^2 = 32n+16h+16b+48y+16z   [new]'] = (sqE(W.p_add(c1, cu(2 * u), -1))
                                                        == (32 * n + 16 * h + 16 * b + 48 * y + 16 * z, 0))
    res['C: E|a|^2 = 32b+24y'] = (E(W.p_mul(a, W.p_conj(a, d))) == (32 * b + 24 * y, 0))
    if not light:
        res['C: E conj(q)^2 a = 32b+48y (real)'] = (E(qb2a) == (32 * b + 48 * y, 0))
    # intermediate steps
    def m11(F):
        return [[E(W.p_d(W.p_d(F, j), d + k)) for k in R] for j in R]
    mV, mc2 = m11(V), m11(c2)
    nV = sum(W.cabs2(mV[j][k]) for j in R for k in R)
    nc = sum(W.cabs2(mc2[j][k]) for j in R for k in R)
    cross = sum(W.cmul(W.cconj(mV[j][k]), mc2[j][k])[0] for j in R for k in R)
    res['C: |P11 V|^2 = 16n+4h+16z, |P11 c2|^2 = 16n, <P11V,P11c2> = 16n+8z'] = (
        nV == 16 * n + 4 * h + 16 * z and nc == 16 * n and cross == 16 * n + 8 * z)
    res['C: <V-c2, c2-u> = 24y'] = (E(W.p_mul(W.p_add(V, c2, -1), W.p_add(c2, cu(u), -1))) == (24 * y, 0))
    # ---------------- (D) identities with polynomial tests
    if not light:
        EVc2, EVc1, Eq = E(W.p_mul(V, c2))[0], E(W.p_mul(V, c1))[0], E(qb2a)[0]
        res['D: (I),(II) for G = v^2'] = (EV2 == 2 * EVc2 + Eq and 2 * EV2 == 2 * EVc1 + Eq)
    EV3 = None
    if d <= 2:
        EV3 = E(W.p_mul(V2, V))[0]
        EqV = E(W.p_mul(qb2a, V))[0]
        res['D: (I),(II) for G = v^3'] = (EV3 == 3 * E(W.p_mul(V2, c2))[0] + 2 * EqV
                                          and 2 * EV3 == 3 * E(W.p_mul(V2, c1))[0] + 2 * EqV)
    # ---------------- (E) cuts (normalised scalars)
    N_, H_, B_, Y_, Z_ = (x / Fr(u * u) for x in (n, h, b, y, z))
    s = 32 * N_ + 8 * H_ + 32 * B_ + 96 * Y_
    mm = N_ + B_ + 3 * Y_ - Z_
    s0, h0 = W.jointS0(N_, H_, B_, Y_, Z_), W.jointH0(N_, H_, B_, Y_, Z_)
    res['E: cuts'] = (min(N_, H_, B_, Y_, Z_) >= 0 and B_ <= N_ and Y_ <= Z_ and Z_ ** 2 <= N_ * H_ and mm >= 0
                      and (3 * Y_ - Z_) ** 2 <= H_ * mm and h0 >= 0 and s0 >= 0)
    res['E: n <= 1/4, h <= 1/4, 0 < s <= 42, s = (8/3)s0 + 4 h0'] = (N_ <= Fr(1, 4) and H_ <= Fr(1, 4) and 0 < s <= 42
                                                                 and s == Fr(8, 3) * s0 + 4 * h0)
    # ---------------- (F) sixth moment
    extra = ''
    if EV3 is not None:
        M3 = Fr(EV3, u ** 3)
        sf = float(s)
        b_scalar = 6 + 9 * sf + float(C6) * sf ** 1.5
        s0f, h0f = float(s0), float(h0)
        b_j2 = 6 + 9 * sf + sqrt(sf) * (198 * h0f + 300 * sqrt(s0f * h0f))
        b_j3 = 6 + 9 * sf + sqrt(sf) * (11781 / 32 * h0f + 135 * sqrt(s0f * h0f))
        res['F: E V^3 <= scalar, J2, J3 bounds (floats of exact numbers)'] = (float(M3) <= b_scalar and float(M3) <= b_j2
                                                                          and float(M3) <= b_j3)
        extra = '  EV^3=%.4f  scalar %.4f  J2 %.4f  J3 %.4f' % (float(M3), b_scalar, b_j2, b_j3)
    ok = all(res.values())
    print('%-42s d=%d u=%-5s (n,h,b,y,z)=(%s)  s=%.5f%s  %s' % (
        name, d, u, ', '.join('%.5f' % float(x) for x in (N_, H_, B_, Y_, Z_)), float(s), extra,
        'ALL OK' if ok else 'FAIL'), flush=True)
    for k, v in res.items():
        if not v:
            print('      FAILED:', k)
    return ok, res, (N_, H_, B_, Y_, Z_)


if __name__ == '__main__':
    t0 = time.time()
    bad = 0
    names = None
    for name, d, t in cases():
        ok, res, _ = run_case(name, d, t)
        names = names or list(res.keys())
        bad += not ok
    print()
    print('checks per case:')
    for k in names:
        print('   ', k)
    print('%d cases, %d failures, %.1f s' % (len(cases()), bad, time.time() - t0))
    sys.exit(1 if bad else 0)
