"""Exact checks (label C on instances) of two identities of REPORT.md section 6.

(LC)  For w in H_{2,0} and a polynomial H(v, c):   <w, Q (H - c2 H_v)(V, c2)> = <w, (H + V H_v)(V, c2) a + q H_c(V, c2) b>,
      Q = q^2, b = sum_j dbar_j q * d_j c2.     (Lemma 1 with G = conj(w) q H(V, c2).)
(PATH) decoupling path q_theta = <cos(theta) y + sin(theta) w, F(y)> - cos(theta) div F,  F = dbar q:
      for phi(v) = v^m:  d/d(theta) E V_theta^m = -2 sin(theta) Re E[phi''(V_theta) conj(q_theta)^2 atilde_theta],  atilde = <ytilde, (F.grad)F> - cos(theta)(F.grad)div F,
      checked as a polynomial identity in (c, s) = (cos, sin) on the circle by evaluating at rational points c^2 + s^2 = 1.
"""
import random, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
from wick_exact import *
from x01_exact_identities import power, fields, tensor

def mono(n, al, be):
    return {(tuple(al), tuple(be)): G(1)}

def check_LC(n, f, rng):
    q, qb, a, c1, c2 = fields(n, f)
    V = mul(q, qb); Q = mul(q, q)
    b = lin(*[(1, mul(db(q, j), d(c2, j))) for j in range(n)])
    # H(v,c) = v^i c^k
    for (i, k) in [(0, 0), (1, 0), (0, 1), (1, 1), (2, 0), (2, 1)]:
        Hp = mul(power(V, i, n), power(c2, k, n))
        Hv = lin((i, mul(power(V, i - 1, n), power(c2, k, n)))) if i > 0 else {}
        Hc = lin((k, mul(power(V, i, n), power(c2, k - 1, n)))) if k > 0 else {}
        lhs_fun = mul(Q, lin((1, Hp), (-1, mul(c2, Hv))))
        rhs_fun = lin((1, mul(lin((1, Hp), (1, mul(V, Hv))), a)), (1, mul(mul(q, Hc), b)))
        for al in multi(n, 2):
            w = mono(n, al, (0,) * n)
            assert E(mul(conj(w), lhs_fun)) == E(mul(conj(w), rhs_fun)), f'LC i={i} k={k}'
    return True

def check_path(n, f, m):
    """variables: y (n), w (n) -> 2n variables; q_theta = sum_k conj(c y_k + s w_k) F_k(y) - c div F(y)."""
    N = 2 * n
    q, qb, a, c1, c2 = fields(n, f)
    def lift(P):   # embed a polynomial in y into the 2n-variable ring
        return {(al + (0,) * n, be + (0,) * n): v for (al, be), v in P.items()}
    F = [lift(db(q, k)) for k in range(n)]
    zero = (0,) * N
    def var_bar(idx): return {(zero, tuple(1 if i == idx else 0 for i in range(N))): G(1)}
    divF = lin(*[(1, d(F[k], k)) for k in range(n)])
    FgradF = [lin(*[(1, mul(F[j], d(F[k], j))) for j in range(n)]) for k in range(n)]
    FgradDiv = lin(*[(1, mul(F[j], d(divF, j))) for j in range(n)])
    def EVm(c, s):
        qt = lin(*[(c, mul(var_bar(k), F[k])) for k in range(n)], *[(s, mul(var_bar(n + k), F[k])) for k in range(n)], (-c, divF))
        Vt = mul(qt, conj(qt))
        at = lin(*[(c, mul(var_bar(k), FgradF[k])) for k in range(n)], *[(s, mul(var_bar(n + k), FgradF[k])) for k in range(n)], (-c, FgradDiv))
        val = E(power(Vt, m, N))
        contr = E(mul(mul(mul(conj(qt), conj(qt)), at), power(Vt, m - 2, N)))    # E[conj(q)^2 atilde V^(m-2)]
        return val.r, contr.r
    # dE/dtheta = -2 s m(m-1) Re E[V^(m-2) conj(q)^2 atilde]; compare with a symmetric difference quotient of the polynomial E V^m in (c,s)
    # use exact differentiation: E V_theta^m is a polynomial p(c,s); d/dtheta = -s dp/dc + c dp/ds.  Fit by evaluating on rational points.
    pts = [(Fr(3, 5), Fr(4, 5)), (Fr(5, 13), Fr(12, 13)), (Fr(8, 17), Fr(15, 17))]
    for (c, s) in pts:
        h = Fr(1, 10 ** 6)
        # rational rotation by a small angle: (c', s') = rotation with t = h: cos = (1-t^2)/(1+t^2), sin = 2t/(1+t^2)
        ch, sh = (1 - h * h) / (1 + h * h), 2 * h / (1 + h * h)
        cp, sp = c * ch - s * sh, s * ch + c * sh
        cm, sm = c * ch + s * sh, s * ch - c * sh
        vp, _ = EVm(cp, sp); vm, _ = EVm(cm, sm); v0, contr = EVm(c, s)
        dtheta = 2 * h      # angle = 2 arctan h ~ 2h
        num = float(vp - vm) / (2 * float(dtheta))
        pred = float(-2 * s * m * (m - 1) * contr)
        assert abs(num - pred) <= 1e-6 * max(1.0, abs(pred)), (num, pred)
    return True

if __name__ == '__main__':
    rng = random.Random(7)
    for n in (1, 2):
        for tr in range(2):
            f = random_f(n, rng, den=3, size=3)
            check_LC(n, f, rng)
            print(f'PASS (LC) n={n} trial={tr}: <w, Q(H - c2 H_v)> = <w, (H + V H_v) a + q H_c b> for H = v^i c^k, (i,k) in (0,0),(1,0),(0,1),(1,1),(2,0),(2,1), all w in H20')
    for n, m in [(1, 2), (1, 3), (2, 2)]:
        f = random_f(n, rng, den=2, size=2)
        check_path(n, f, m)
        print(f'PASS (PATH) n={n}, phi = v^{m}: d/dtheta E V_theta^m = -2 sin(theta) m(m-1) Re E[V^(m-2) conj(q_theta)^2 atilde_theta] at three rational angles (difference quotient, rel. tol. 1e-6)')

# ---------------------------------------------------------------------------------------------------------------
# (LOC) local form of Theorem 5 (REPORT section 6.4), exact for phi = v^m:
#   Delta = E B(c2) - E phi(V) = E[conj(q)^2 a (d_v gamma_c)(V)] + E[conj(q) b (d_c gamma_c)(V)]  at c = c2,
#   gamma_c(v) = (K_c(0) - K_c(v))/v, K_c(v) = E (v + c tau)^m, B(c) = m! c^m.
def check_LOC(n, f):
    q, qb, a, c1, c2 = fields(n, f)
    V = mul(q, qb); q2b = mul(qb, qb)
    b = lin(*[(1, mul(db(q, j), d(c2, j))) for j in range(n)])
    one = const(n, 1)
    # m = 2: gamma = -(v + 2c);  m = 3: gamma = -(v^2 + 3vc + 6c^2)
    for m, dv, dc, fact_m in [(2, lin((-1, one)), lin((-2, one)), 2),
                              (3, lin((-2, V), (-3, c2)), lin((-3, V), (-12, c2)), 6)]:
        lhs = fact_m * E(power(c2, m, n)) - E(power(V, m, n))
        rhs = E(mul(mul(q2b, a), dv)) + E(mul(mul(qb, b), dc))
        assert lhs == rhs, f'LOC m={m}'
    # E[conj(q) b] = sum_k ||W_k||^2 = ||P31 q^2||^2/4
    assert E(mul(qb, b)) == G(proj_norm2(mul(q, q), n, 3, 1) / 4), 'E[conj(q) b]'
    return True

if __name__ == '__main__':
    rng = random.Random(11)
    for n in (1, 2, 2, 3):
        f = random_f(n, rng, den=3, size=3)
        check_LOC(n, f)
        print(f'PASS (LOC) n={n}: m! E c2^m - E V^m = E[conj(q)^2 a d_v gamma] + E[conj(q) b d_c gamma] for m = 2, 3; E[conj(q) b] = ||P31 q^2||^2/4')

# ---------------------------------------------------------------------------------------------------------------
# (LCON) local-variance content representation (REPORT section 6.6), exact for h = v^m:
#   E[conj(y_j) q h(V)] = E[conj(y_j) (k_v(V,c2) conj(q) a + k_c(V,c2) b)],  k(v,c) = E (v + c tau)^m.
def check_LCON(n, f):
    q, qb, a, c1, c2 = fields(n, f)
    V = mul(q, qb)
    b = lin(*[(1, mul(db(q, j), d(c2, j))) for j in range(n)])
    one = const(n, 1); zero = (0,) * n
    for m, kv, kc in [(1, one, one), (2, lin((2, V), (2, c2)), lin((2, V), (4, c2))),
                      (3, lin((3, mul(V, V)), (6, mul(V, c2)), (6, mul(c2, c2))), lin((3, mul(V, V)), (12, mul(V, c2)), (18, mul(c2, c2))))]:
        for j in range(n):
            yjb = {(zero, tuple(1 if i == j else 0 for i in range(n))): G(1)}
            lhs = E(mul(mul(yjb, q), power(V, m, n)))
            rhs = E(mul(yjb, lin((1, mul(mul(kv, qb), a)), (1, mul(kc, b)))))
            assert lhs == rhs, f'LCON m={m} j={j}'
    return True

if __name__ == '__main__':
    rng = random.Random(13)
    for n in (1, 2, 2, 3):
        f = random_f(n, rng, den=3, size=3)
        check_LCON(n, f)
        print(f'PASS (LCON) n={n}: E[conj(y_j) q V^m] = E[conj(y_j)(k_v conj(q) a + k_c b)], m = 1, 2, 3, all j')
