#!/usr/bin/env python3
"""Exact (rational) checks for the review of the 0.93462 package.  Reviewer: worker of claude-b9ee.

1. Dictionary between the package's invariants (A, B, P, Q, R) and the Lean contraction scalars
   (n, h, b, y, z):   P = 16 n,  Q = 4 h,  R = 8 z,  A = 32 b,  B = 96 y      (u = 1),
   checked with U, J computed from the package's own definitions
     U_ab = 4 sum_jk T_ajk conj(T_bjk),   J_ab = 2 sum_ij T_ijb conj(T_ija).
2. The package's (13), (14), (15), (16), (17), (19) on the same cubics, with moments computed directly
   (Gaussian expectations of polynomials), not through the scalars.
3. Section 9: the two counterexamples, including a direct computation of <P22 c1, P22 c2>.

Uses the exact polynomial code of
/Users/alingalatan/workspaces/grothe/handoff/research-degree5/radius-relaxation-2026-11-16/scripts/check_budgets_exact.py
"""
import sys, random, itertools
from fractions import Fraction as Fr
sys.path.insert(0, '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/radius-relaxation-2026-11-16/scripts')
import check_budgets_exact as X
C = X.C


def tensor(d, entries):
    """entries: {(a, b, c): complex-as-C}; symmetrised in (a, b) by the caller."""
    R = range(d)
    t = [[[C() for _ in R] for _ in R] for _ in R]
    for (a, b, c), v in entries.items():
        t[a][b][c] = v
    return t


def package_invariants(t, d):
    """u, and (P, Q, R) from the package's U, J (unnormalised: for the tensor as given)."""
    R_ = range(d)
    U = [[sum((t[a][j][k] * t[b][j][k].conj() for j in R_ for k in R_), C()).scale(4) for b in R_] for a in R_]
    J = [[sum((t[i][j][b] * t[i][j][a].conj() for i in R_ for j in R_), C()).scale(2) for b in R_] for a in R_]
    tr = lambda M1, M2: sum((M1[a][b] * M2[b][a]).re for a in R_ for b in R_)
    return U, J, tr(U, U), tr(J, J), tr(U, J)


def moments(t, d, heavy=True):
    q = X.cubic(t, d)
    qb = X.pconj(q, d)
    V = X.pmul(q, qb)
    R_ = range(d)
    dq = [X.pdiff(q, j) for j in R_]
    dbq = [X.pdiff(q, d + j) for j in R_]
    c1, c2, a = {}, {}, {}
    for j in R_:
        c1 = X.padd(c1, X.pmul(dq[j], X.pconj(dq[j], d)))
        c2 = X.padd(c2, X.pmul(dbq[j], X.pconj(dbq[j], d)))
        a = X.padd(a, X.pmul(dq[j], dbq[j]))
    E = lambda p: X.expect(p, d)
    u = E(V).re
    out = dict(u=u, Ec1=E(c1).re, Ec2=E(c2).re)
    out['Ea2'] = E(X.pmul(a, X.pconj(a, d))).re
    out['EVb'] = E(X.pmul(X.pmul(qb, qb), a)).re
    out['c2c2'] = E(X.pmul(c2, c2)).re
    out['c1c2'] = E(X.pmul(c1, c2)).re
    out['c1c1'] = E(X.pmul(c1, c1)).re
    out['Vc2'] = E(X.pmul(V, c2)).re
    if heavy:
        out['VV'] = E(X.pmul(V, V)).re
    # coefficient matrices of P11 c_i:  E[d_a dbar_b c_i]
    M1 = [[E(X.pdiff(X.pdiff(c1, a_), d + b_)) for b_ in R_] for a_ in R_]
    M2 = [[E(X.pdiff(X.pdiff(c2, a_), d + b_)) for b_ in R_] for a_ in R_]
    out['P11c1.P11c2'] = sum((M1[a_][b_].conj() * M2[a_][b_]).re for a_ in R_ for b_ in R_)
    out['M2'] = M2
    return out


def report(name, t, d, heavy=True):
    U, J, P, Q, Rr = package_invariants(t, d)
    n, h, b, y, z, nrm = X.scalars(t, d)
    m = moments(t, d, heavy)
    u = m['u']
    assert u == nrm
    A, B = 32 * b * u ** 2, 96 * y * u ** 2
    ok = {}
    ok['dictionary P=16n, Q=4h, R=8z'] = (P == 16 * n * u ** 2 and Q == 4 * h * u ** 2 and Rr == 8 * z * u ** 2)
    ok['tr U = 2u, tr J = u'] = (sum(U[i][i].re for i in range(d)) == 2 * u and sum(J[i][i].re for i in range(d)) == u)
    ok['P11 c2 = Q_U'] = all((m['M2'][a_][b_] - U[a_][b_]).iszero() for a_ in range(d) for b_ in range(d))
    ok['(14) E c^2 = P+Q'] = (m['c2c2'] - u ** 2 == P + Q)
    ok['(14) E[c(V-1)] = P+Q+B/4'] = (m['Vc2'] - u ** 2 == P + Q + B / 4)
    ok['(14) E[Vb] = A+B/2'] = (m['EVb'] == A + B / 2)
    ok['E|a|^2 = A+B/4'] = (m['Ea2'] == A + B / 4)
    ok['(13) Cov(c1,c2) = P+R+B/4'] = (m['c1c2'] - 2 * u ** 2 == P + Rr + B / 4)
    # d = (c1+c2-3)/3, c = c2-1:  E[dc] and E d^2
    Edc = (m['c1c2'] - 2 * u ** 2 + m['c2c2'] - u ** 2) / 3
    Ed2 = (m['c1c1'] - 4 * u ** 2 + 2 * (m['c1c2'] - 2 * u ** 2) + m['c2c2'] - u ** 2) / 9
    ok['(14) E[dc]'] = (Edc == (2 * P + Q + Rr + B / 4) / 3)
    ok['(14) E d^2'] = (Ed2 == (5 * P + 5 * Q + 4 * Rr + A / 2 + B) / 9)
    ok['(16) E(c1-c2-1)^2 = P+5Q+A/2'] = (m['c1c1'] - 4 * u ** 2 - 2 * (m['c1c2'] - 2 * u ** 2) + m['c2c2'] - u ** 2 == P + 5 * Q + A / 2)
    if heavy:
        ok['s = A+B+2(P+Q)'] = (m['VV'] - 2 * u ** 2 == A + B + 2 * (P + Q))
    ok['(10) G psd, P<=4, Q<=1'] = (Rr ** 2 <= P * Q and P <= 4 * u ** 2 and Q <= u ** 2 and Rr >= 0)
    H11, H12, H22 = A / 2 + B + P + Q - 4 * Rr, Q + B / 4 - Rr, Q
    ok['(15) H psd'] = (H11 >= 0 and H22 >= 0 and H12 ** 2 <= H11 * H22)
    ok['(17) A<=2P, B<=12R'] = (A <= 2 * P and B <= 12 * Rr)
    # (19), u = 1 normalisation, for the eight alphas of the certificates and a few more
    Pn, Qn, Rn, An, Bn = (v / u ** 2 for v in (P, Q, Rr, A, B))
    ok['(19) for alpha in 1/64..64'] = all(Rn <= (1 + al) / 4 * Bn + (5 + 3 / al) * (1 - Qn)
                                         for al in [Fr(2) ** k for k in range(-6, 7)])
    direct22 = (m['c1c2'] - 2 * u ** 2) - m['P11c1.P11c2']
    ok['<P22c1,P22c2> = B/4 - R (direct)'] = (direct22 == B / 4 - Rr)
    print('%-34s d=%d u=%s  (A,B,P,Q,R)=(%s, %s, %s, %s, %s)  <P22c1,P22c2>=%s   all checks: %s' % (
        name, d, u, A, B, P, Q, Rr, direct22, all(ok.values())), flush=True)
    for k, v in ok.items():
        if not v:
            print('     FAILED:', k)
    return all(ok.values()), dict(u=u, A=A, B=B, P=P, Q=Q, R=Rr, direct22=direct22)


if __name__ == '__main__':
    good = True
    one = C(1)
    # Wick monomial
    g, v = report('Wick monomial', tensor(1, {(0, 0, 0): one}), 1)
    good &= g and (v['A'], v['B'], v['P'], v['Q'], v['R']) == (8 * v['u'] ** 2, 24 * v['u'] ** 2, 4 * v['u'] ** 2, v['u'] ** 2, 2 * v['u'] ** 2)
    # section 9, second example:  q = conj(y1)(y1^2 + y2^2) - 2 conj(y2) y1 y2
    t = tensor(2, {(0, 0, 0): one, (1, 1, 0): one, (0, 1, 1): C(-1), (1, 0, 1): C(-1)})
    g, v = report('sec. 9, two-variable cubic', t, 2)
    good &= g and (v['u'], v['A'], v['B'], v['P'], v['Q'], v['R']) == (8, 256, 256, 128, 32, 64)
    An, Bn, Qn = v['A'] / 64, v['B'] / 64, v['Q'] / 64
    print('     normalised (A,B,P,Q,R) = (%s, %s, %s, %s, %s);  A <= 2 + B/4: %s;  A + 2Q <= 2 + B/3: %s  (both must be False)' % (
        An, Bn, v['P'] / 64, Qn, v['R'] / 64, An <= 2 + Bn / 4, An + 2 * Qn <= 2 + Bn / 3))
    good &= (not (An <= 2 + Bn / 4)) and (not (An + 2 * Qn <= 2 + Bn / 3))
    # section 9, first example (six variables):
    # q = conj(y3) y1^2 + conj(y4) y1 y2 + conj(y5) y2^2 + conj(y6)(y2 y3 - y1 y4)
    hf = C(Fr(1, 2))
    mh = C(Fr(-1, 2))
    t = tensor(6, {(0, 0, 2): one, (0, 1, 3): hf, (1, 0, 3): hf, (1, 1, 4): one, (1, 2, 5): hf, (2, 1, 5): hf,
                   (0, 3, 5): mh, (3, 0, 5): mh})
    g, v = report('sec. 9, six-variable cubic', t, 6, heavy=False)
    good &= g and (v['u'], v['A'], v['B'], v['P'], v['Q'], v['R']) == (7, 0, 0, 74, 13, 3) and v['direct22'] == -3
    U, J, P, Q, Rr = package_invariants(t, 6)
    print('     U diag =', [str(U[i][i].re) for i in range(6)], ' J diag =', [str(J[i][i].re) for i in range(6)],
          ' off-diagonal zero:', all(U[i][j].iszero() and J[i][j].iszero() for i in range(6) for j in range(6) if i != j),
          ' B >= 4R:', v['B'] >= 4 * v['R'], '(must be False)')
    # random cubics
    rng = random.Random(93462)
    for d, reps in ((2, 5), (3, 3)):
        for it in range(reps):
            ent = {}
            for a_ in range(d):
                for b_ in range(a_, d):
                    for c_ in range(d):
                        if rng.random() < 0.75:
                            val = C(rng.randint(-3, 3), rng.randint(-3, 3))
                            ent[(a_, b_, c_)] = val
                            ent[(b_, a_, c_)] = val
            if not ent:
                ent[(0, 0, 0)] = one
            g, v = report('random Gaussian-integer tensor', tensor(d, ent), d, heavy=(d <= 2))
            good &= g
    print('ALL EXACT CHECKS PASS' if good else 'SOME CHECK FAILED')
    sys.exit(0 if good else 1)
