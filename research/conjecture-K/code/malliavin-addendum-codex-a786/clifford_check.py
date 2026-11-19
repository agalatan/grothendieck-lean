# claude-b9ee: independent exact check of codex-a786's Clifford cubic (addendum of 16 Nov 2026).
# Method: brute-force Wick calculus on the cubic itself, with Gaussian-integer coefficients. No trace-cumulant
# formula and no use of the law q = R W. Run: python3 -I clifford_check.py
import itertools, math, sys, time
from collections import defaultdict
t0 = time.time()
N = 16                                   # variables 0..7 = X_0..X_7, 8..15 = Y_1..Y_8
# ---- Gaussian integers as Python complex with integer parts (exact: all values stay far below 2^53)
I2 = [[1, 0], [0, 1]]; PX = [[0, 1], [1, 0]]; PY = [[0, -1j], [1j, 0]]; PZ = [[1, 0], [0, -1]]
P = {'I': I2, 'X': PX, 'Y': PY, 'Z': PZ}
def kron(A, B):
    n, m = len(A), len(B)
    return [[A[i // m][j // m] * B[i % m][j % m] for j in range(n * m)] for i in range(n * m)]
def word(w):
    M = P[w[0]]
    for ch in w[1:]: M = kron(M, P[ch])
    return M
def mul(A, B): return [[sum(A[i][k] * B[k][j] for k in range(len(B))) for j in range(len(B[0]))] for i in range(len(A))]
def add(A, B): return [[A[i][j] + B[i][j] for j in range(len(A))] for i in range(len(A))]
words = ['IIY', 'IYX', 'XYZ', 'YIZ', 'YXX', 'YZX', 'ZYZ']
A = [word(w) for w in words]
I8 = [[1 if i == j else 0 for j in range(8)] for i in range(8)]
for i, M in enumerate(A):
    assert all(M[r][c] == M[c][r].conjugate() for r in range(8) for c in range(8)), 'Hermitian'
    assert all(M[r][c] == -M[c][r] for r in range(8) for c in range(8)), 'antisymmetric'
    assert sum(M[r][r] for r in range(8)) == 0
    assert all(sum(1 for c in range(8) if M[r][c] != 0) == 1 for r in range(8)), 'one entry per row'
    for j, M2 in enumerate(A):
        S = add(mul(M, M2), mul(M2, M))
        assert S == [[(2 if i == j else 0) * I8[r][c] for c in range(8)] for r in range(8)], ('anticommutation', i, j)
print('matrices: 7 Hermitian, antisymmetric, traceless, pairwise anticommuting, squares = I  [exact]')

# ---- polynomials in z_0..z_15 and their conjugates: dict {(alpha, beta): coefficient}
Z = (0,) * N
def e(k): return tuple(1 if i == k else 0 for i in range(N))
def tadd(a, b): return tuple(x + y for x, y in zip(a, b))
def pmul(p, q):
    out = defaultdict(complex)
    for (a1, b1), c1 in p.items():
        for (a2, b2), c2 in q.items():
            out[(tadd(a1, a2), tadd(b1, b2))] += c1 * c2
    return {k: v for k, v in out.items() if v != 0}
def padd(*ps):
    out = defaultdict(complex)
    for p in ps:
        for k, v in p.items(): out[k] += v
    return {k: v for k, v in out.items() if v != 0}
def pconj(p): return {(b, a): c.conjugate() for (a, b), c in p.items()}
def pscale(p, s): return {k: v * s for k, v in p.items()}
def dhol(p, j):                           # d/dz_j
    out = {}
    for (a, b), c in p.items():
        if a[j]:
            a2 = list(a); a2[j] -= 1; out[(tuple(a2), b)] = out.get((tuple(a2), b), 0) + c * a[j]
    return out
def danti(p, j):                          # d/d conj(z_j)
    out = {}
    for (a, b), c in p.items():
        if b[j]:
            b2 = list(b); b2[j] -= 1; out[(a, tuple(b2))] = out.get((a, tuple(b2)), 0) + c * b[j]
    return out
def fact(t):
    r = 1
    for x in t: r *= math.factorial(x)
    return r
def E(p):                                 # E[z^a conj(z)^b] = [a == b] a!
    return sum(c * fact(a) for (a, b), c in p.items() if a == b)
def Eprod(p, q):                          # E[p q] without forming the product
    by = defaultdict(list)
    for (a, b), c in q.items(): by[tuple(x - y for x, y in zip(a, b))].append((a, b, c))
    tot = 0
    for (a1, b1), c1 in p.items():
        for a2, b2, c2 in by.get(tuple(y - x for x, y in zip(a1, b1)), ()):
            tot += c1 * c2 * fact(tadd(a1, a2))
    return tot
def exact_int(z):
    assert abs(z.imag) < 1e-9 and abs(z.real - round(z.real)) < 1e-9, z
    return round(z.real)

# ---- the cubic q = conj(X_0) sum_a Y_a^2 + sum_i X_i Y^* A_i Y
q = defaultdict(complex)
for a in range(8):
    q[(tadd(e(8 + a), e(8 + a)), e(0))] += 1
for i in range(7):
    for r in range(8):
        for c in range(8):
            if A[i][r][c] != 0:
                q[(tadd(e(1 + i), e(8 + c)), e(8 + r))] += A[i][r][c]      # X_i conj(Y_r) (A_i)_{rc} Y_c
q = dict(q)
assert all(sum(a) == 2 and sum(b) == 1 for a, b in q), 'bidegree (2,1)'
# Wick-ordered (in H_{2,1}): every contraction d_j dbar_j q vanishes
assert all(len(dhol(danti(q, j), j)) == 0 for j in range(N)), 'q is not Wick ordered'
print(f'q: {len(q)} monomials, bidegree (2,1), all contractions vanish (so q is in H_(2,1))')

qb = pconj(q)
u = exact_int(Eprod(q, qb))
V = pmul(q, qb)
m4 = exact_int(Eprod(V, V))
delta = m4 - 2 * u * u
print(f'u = E|q|^2 = {u};  E|q|^4 = {m4};  delta = {delta};  delta/u^2 = {delta}/{u*u} = {delta/(u*u):.6f}  (19/18 = {19/18:.6f})')
assert (u, m4, delta) == (72, 15840, 5472) and delta * 18 == 19 * u * u

dq = [dhol(q, j) for j in range(N)]; dbq = [danti(q, j) for j in range(N)]
c1 = padd(*[pmul(d, pconj(d)) for d in dq])
c2 = padd(*[pmul(d, pconj(d)) for d in dbq])
a = padd(*[pmul(dq[j], dbq[j]) for j in range(N)])
Ec1, Ec2 = exact_int(E(c1)), exact_int(E(c2))
assert (Ec1, Ec2) == (2 * u, u), (Ec1, Ec2)
A0 = padd(c1, c2, {(Z, Z): -3 * u})        # Gamma(q, conj q) - 3u
varA = exact_int(Eprod(A0, A0))
na = exact_int(Eprod(a, pconj(a)))
budget = 2 * varA + 4 * na                 # B = 2 E(Gamma(q,qbar) - 3u)^2 + E|Gamma(q,q)|^2, Gamma(q,q) = 2a
print(f'E c1 = {Ec1}, E c2 = {Ec2};  E(c1 + c2 - 3u)^2 = {varA};  E|a|^2 = {na};  budget B = {budget}')
print(f'B/delta = {budget}/{delta} = {budget/delta:.6f}  (109/19 = {109/19:.6f});  6 delta - B = {6*delta - budget}')
assert budget == 31392 and budget * 19 == 109 * delta
# the antiholomorphic identities of ledger 6.3.20-6.3.22 on this cubic
x = padd(c2, {(Z, Z): -u}); nx = exact_int(Eprod(x, x))
cross = exact_int(Eprod(padd(V, pscale(c2, -1)), x))          # <V - c2, c2 - u> = (1/4)|P31 Q|^2
P31sq = 4 * cross
P20sq = na - cross                                             # |a|^2 = |P20 Q|^2 + (1/4)|P31 Q|^2
print(f'|c2 - u|^2 = {nx};  |P31 q^2|^2 = {P31sq};  |P20 q^2|^2 = {P20sq};  T2d: {P20sq} + {P31sq} + 2*{nx} = {P20sq + P31sq + 2*nx} (delta = {delta})')
assert P20sq + P31sq + 2 * nx == delta
P22sq2 = 6 * delta - budget - P31sq                            # T2f: B = 6 delta - |P31 Q|^2 - 2 |P22 V|^2
print(f'T2f: 2|P22 V|^2 = {P22sq2}  (spectral correction R4 = {6*delta - budget} = (5/18) u^2: {(6*delta - budget) * 18 == 5 * u * u})')

# ---- the norm identity |H|^2 + sum_i Q_i^2 = |Y|^4 as polynomials (conditional variance of q given Y)
H = {(tadd(e(8 + r), e(8 + r)), Z): 1 for r in range(8)}
S0 = pmul(H, pconj(H))
for i in range(7):
    Qi = {}
    for r in range(8):
        for c in range(8):
            if A[i][r][c] != 0: Qi[(e(8 + c), e(8 + r))] = A[i][r][c]
    assert Qi == pconj(Qi), 'Q_i real'
    S0 = padd(S0, pmul(Qi, Qi))
R1 = {(e(8 + r), e(8 + r)): 1 for r in range(8)}
R2 = pmul(R1, R1)
assert S0 == R2, 'norm identity fails'
print('norm identity |Y^T Y|^2 + sum_i (Y^* A_i Y)^2 = |Y|^4: equal as polynomials, coefficient by coefficient')

# ---- the symmetries (14) fix q: Y -> A_k Y, X_0 -> -X_0, X_i -> -X_i (i != k)
def substitute(p, lin):                    # z_j -> sum_m lin[j][m] z_m  (and conjugates accordingly)
    out = {(Z, Z): 1 + 0j}; res = defaultdict(complex)
    for (al, be), c in p.items():
        term = {(Z, Z): c}
        for j in range(N):
            hol = {(e(m), Z): lin[j][m] for m in range(N) if lin[j][m] != 0}
            anti = {(Z, e(m)): lin[j][m].conjugate() for m in range(N) if lin[j][m] != 0}
            for _ in range(al[j]): term = pmul(term, hol)
            for _ in range(be[j]): term = pmul(term, anti)
        for k2, v in term.items(): res[k2] += v
    return {k2: v for k2, v in res.items() if v != 0}
for k in range(7):
    lin = [[0j] * N for _ in range(N)]
    lin[0][0] = -1
    for i in range(7): lin[1 + i][1 + i] = 1 if i == k else -1
    for r in range(8):
        for c in range(8): lin[8 + r][8 + c] = complex(A[k][r][c])
    assert substitute(q, lin) == q, ('symmetry', k)
print('the seven symmetries (14) fix q exactly; each X-coordinate is flipped by one of them, and the conjugates of two')
print('anticommuting A_k have no common fixed vector, so no coordinate vector is fixed  =>  zero content (11.31a)')
print(f'ALL CHECKS PASSED in {time.time() - t0:.1f} s')
