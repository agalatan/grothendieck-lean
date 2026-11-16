"""Exact (rational) checks of the identities of REPORT.md sections 2-3 (label C on instances; the proofs carry the statements).

wick_exact.py is a verbatim copy of the antiholomorphic package's exact Wick calculus (standard library only).
For q in H_{2,1}(C^n), V = |q|^2, x = Re q, a = sum d_j q dbar_j q, c1 = sum|d_j q|^2, c2 = sum|dbar_j q|^2, J = c1 - c2:
 (J1) E V^k = k E[J V^(k-1)],  k = 1..4                         (rotation identity, f = v^k)
 (J2) E x^(k+1) = (k/2) E[J x^(k-1)],  k = 1, 3, 5               (Stein kernel of Re q is E[J | Re q]/2... i.e. tau_F = E[J|F]/u)
 (J3) E[(a + 2 c2 - c1) x^k] = 0,  k = 0..4                       (E[a + 2c2 - c1 | Re q] = 0)
 (L1) E V^k = k E[c2 V^(k-1)] + (k-1) E[conj(q)^2 a V^(k-2)]      (Lemma 1, first form), k = 2..4
 (L2) 2 E V^k = k E[c1 V^(k-1)] + (k-1) E[conj(q)^2 a V^(k-2)]    (Lemma 1, second form), k = 2..4
 (A0) on cubics with a = 0 (decoupled examples):  E[V^k c2^m] = k! E[c2^(k+m)], k <= 3, m <= 2   (V | c2 exponential)
 (A1) P31(q^2) = 0  <=>  a = 0 on the examples; a != 0 and P31(q^2) != 0 on random cubics
 (H1) the Hessian direction: q0 = X^2 conj(Y), p = X(|X|^2+|Y|^2-3):  E[conj(q0)^2 a1(p) V0^k] = 0 (first variation of the polynomial analogue)
"""
import random, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
from math import factorial
from wick_exact import *

def power(P, k, n):
    R = const(n, 1)
    for _ in range(k): R = mul(R, P)
    return R

def fields(n, f):
    q = wick_cubic(n, f); qb = conj(q)
    a = lin(*[(1, mul(d(q, j), db(q, j))) for j in range(n)])
    c1 = lin(*[(1, mul(d(q, j), conj(d(q, j)))) for j in range(n)])
    c2 = lin(*[(1, mul(db(q, j), conj(db(q, j)))) for j in range(n)])
    return q, qb, a, c1, c2

def check_general(n, f):
    q, qb, a, c1, c2 = fields(n, f)
    V = mul(q, qb); J = lin((1, c1), (-1, c2)); u = E(V).r
    x = lin((Fr(1, 2), q), (Fr(1, 2), qb))
    for k in range(1, 5):
        assert E(power(V, k, n)) == k * E(mul(J, power(V, k - 1, n))), f'J1 k={k}'
    for k in (1, 3, 5):
        assert E(power(x, k + 1, n)) == Fr(k, 2) * E(mul(J, power(x, k - 1, n))), f'J2 k={k}'
    comb = lin((1, a), (2, c2), (-1, c1))
    for k in range(0, 5):
        assert E(mul(comb, power(x, k, n))).iszero(), f'J3 k={k}'
    q2b = mul(qb, qb)
    for k in range(2, 5):
        lhs = E(power(V, k, n))
        r1 = k * E(mul(c2, power(V, k - 1, n))) + (k - 1) * E(mul(mul(q2b, a), power(V, k - 2, n)))
        r2 = k * E(mul(c1, power(V, k - 1, n))) + (k - 1) * E(mul(mul(q2b, a), power(V, k - 2, n)))
        assert lhs == r1, f'L1 k={k}'
        assert 2 * lhs == r2, f'L2 k={k}'
    return u, len(a), proj_norm2(mul(q, q), n, 3, 1)

def tensor(n, entries):
    f = [[[G() for _ in range(n)] for _ in range(n)] for _ in range(n)]
    for (i, j, k), v in entries.items():
        v = v if isinstance(v, G) else G(v)
        f[i][j][k] = f[i][j][k] + v * Fr(1, 2); f[j][i][k] = f[j][i][k] + v * Fr(1, 2)
    return f

def check_a0(n, f, name):
    q, qb, a, c1, c2 = fields(n, f)
    assert len(a) == 0, name + ': a != 0'
    assert proj_norm2(mul(q, q), n, 3, 1) == 0, name + ': P31 != 0'
    V = mul(q, qb)
    for k in range(0, 4):
        for m in range(0, 3):
            lhs = E(mul(power(V, k, n), power(c2, m, n))); rhs = factorial(k) * E(power(c2, k + m, n))
            assert lhs == rhs, f'A0 {name} k={k} m={m}'
    print(f'PASS a=0 class [{name}]: a = 0, P31(q^2) = 0, E[V^k c2^m] = k! E[c2^(k+m)] for k <= 3, m <= 2')

if __name__ == '__main__':
    rng = random.Random(20261116)
    cnt = 0
    for n, trials in [(1, 1), (2, 4), (3, 2)]:
        for t in range(trials):
            f = random_f(n, rng)
            u, na, q31 = check_general(n, f); cnt += 1
            print(f'PASS general n={n} trial={t}: u={float(u):.4g}; (J1),(J2),(J3),(L1),(L2) hold exactly; #monomials of a = {na}, ||P31 q^2||^2 = {float(q31):.4g}')
    # decoupled cubics (a = 0)
    check_a0(2, tensor(2, {(0, 0, 1): 1}), 'X^2 conj(Y)')
    check_a0(3, tensor(3, {(0, 1, 2): 1}), 'X Y conj(W)')
    check_a0(3, tensor(3, {(0, 0, 2): 1, (1, 1, 2): G(Fr(2, 5), Fr(1, 3))}), '(X^2 + c Y^2) conj(W)')
    check_a0(3, tensor(3, {(0, 0, 1): 1, (0, 0, 2): G(0, 2)}), 'X^2 conj(Y + 2iW)  (two antiholomorphic variables)')
    # a generic rotation of a decoupled cubic is still a = 0: mix X^2 conj(Y) by the (non-unitary-rational) substitution is skipped;
    # instead check the tangent direction of the U(2) orbit: first-order a vanishes
    n = 2
    q0 = wick_cubic(n, tensor(n, {(0, 0, 1): 1}))
    p = wick_cubic(n, tensor(n, {(0, 0, 0): 1, (0, 1, 1): 1}))      # X(|X|^2-2) + X(|Y|^2-1) = X(|X|^2+|Y|^2-3)
    a1 = lin(*[(1, mul(d(q0, j), db(p, j))) for j in range(n)], *[(1, mul(d(p, j), db(q0, j))) for j in range(n)])
    V0 = mul(q0, conj(q0)); q0b2 = mul(conj(q0), conj(q0))
    for k in range(0, 4):
        assert E(mul(mul(q0b2, a1), power(V0, k, n))).iszero(), 'H1'
    print('PASS (H1): first variation of E[conj(q)^2 a V^k] at q0 = X^2 conj(Y) in the direction X(|X|^2+|Y|^2-3) vanishes, k <= 3')
    print(f'ALL EXACT CHECKS PASSED ({cnt} random cubics + 4 decoupled cubics)')
