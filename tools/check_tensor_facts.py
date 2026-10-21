"""Numerical check of the tensor facts `TensorFacts` of Grothe/LowerAnalytic/Circular.lean.

For random circular cubics q = a + ib in k complex dimensions (d = 2k real variables), with
the standard complex structure J (pairs (x_{2j}, x_{2j+1}), D_J = sum_j x_{2j} d_{2j+1} - x_{2j+1} d_{2j})
and the kernel f = (1/6) d^3 a, this computes the tensor contractions exactly as the Lean
definitions `kerG`, `kerC`, `kerS`, `kerS2`, `kerU`, `kerD`, `kerGa`, `kerSm`, `kerSmm` and
`tenS`, ..., `tenTT` (full ordered-index sums), the moments of `a` by Gauss-Hermite quadrature
(exact for the degrees involved), and reports the worst case of every field of `TensorFacts`:
the two Wick identities (relative error) and the inequalities (sign-normalised, <= 0 means
the fact holds).  It also checks `E a^2 = 6 |f|^2` and the circular-symmetry conversions
`E a^4 = (3/8) E U^2`, `E a^6 = (5/16) E U^3`, and reports the ratio
`(E U^3 - 9m + 12)/(m-2)^{3/2}` whose supremum is 40.2952 (k = 1), below C6 = 40.45313.

Usage:  python3 tools/check_tensor_facts.py k trials [seed]      (k = 1, 2, 3; k = 3 takes a minute)
"""
import sys, itertools, math
import numpy as np
from numpy.polynomial.hermite_e import hermegauss

k = int(sys.argv[1]); trials = int(sys.argv[2]); seed = int(sys.argv[3]) if len(sys.argv) > 3 else 0
d = 2 * k
rng = np.random.default_rng(seed)
theta = -54 / 125
kk = theta ** 2 - 2 * theta
C6 = 4045313 / 100000

# complex structure J with D_J = sum_j (x_{2j} d_{2j+1} - x_{2j+1} d_{2j}),  D_J = sum_{ij} J[j,i] x_j d_i
J = np.zeros((d, d))
for j in range(k):
    J[2 * j, 2 * j + 1] = 1
    J[2 * j + 1, 2 * j] = -1
assert np.allclose(J @ J, -np.eye(d)) and np.allclose(J.T, -J)

# Gauss-Hermite nodes (probabilists'), n = 10 exact up to degree 19
nq = 10
xq, wq = hermegauss(nq); wq = wq / wq.sum()
grids = np.meshgrid(*([xq] * d), indexing='ij')
X = np.stack([g.ravel() for g in grids], 1)
W = np.ones(len(X))
for g in np.meshgrid(*([wq] * d), indexing='ij'):
    W = W * g.ravel()
Z = (X[:, 0::2] + 1j * X[:, 1::2]) / math.sqrt(2)


def random_circular():
    """q = sum c_{jl,m} (z_j z_l conj z_m - delta_{jm} z_l - delta_{lm} z_j); returns the real kernel f of a = Re q
    (f_{abc} = (1/6) d_a d_b d_c a) and the values of a, b on the grid."""
    c = rng.standard_normal((k, k, k)) + 1j * rng.standard_normal((k, k, k))
    c = (c + c.transpose(1, 0, 2)) / 2  # symmetric in the two holomorphic slots
    if trials > 1 and rng.random() < 0.3:  # sparse variants
        mask = rng.random((k, k, k)) < 0.5
        mask = mask | mask.transpose(1, 0, 2)
        c = c * mask
    qv = np.zeros(len(X), dtype=complex)
    for j in range(k):
        for l in range(k):
            for m in range(k):
                v = Z[:, j] * Z[:, l] * np.conj(Z[:, m]) - (j == m) * Z[:, l] - (l == m) * Z[:, j]
                qv += c[j, l, m] * v
    a = qv.real; b = qv.imag
    # kernel: the cubic part of a is Re sum c z z zbar; third derivatives are constants.
    # z_j = (x_{2j} + i x_{2j+1})/sqrt2.  Build the real cubic form coefficients by expanding.
    # Represent z_j as linear forms in x: z_j = sum_p zc[j,p] x_p
    zc = np.zeros((k, d), dtype=complex)
    for j in range(k):
        zc[j, 2 * j] = 1 / math.sqrt(2); zc[j, 2 * j + 1] = 1j / math.sqrt(2)
    T = np.zeros((d, d, d), dtype=complex)  # q_cubic = sum T_{pqr} x_p x_q x_r (not symmetrised)
    for j in range(k):
        for l in range(k):
            for m in range(k):
                if c[j, l, m] != 0:
                    T += c[j, l, m] * np.einsum('p,q,r->pqr', zc[j], zc[l], np.conj(zc[m]))
    T = T.real  # a = Re q
    # symmetrise: f_{abc} = (1/6) d^3 a = average over permutations of T
    f = np.zeros((d, d, d))
    for perm in itertools.permutations(range(3)):
        f += np.transpose(T, perm)
    f /= 6
    return f, a, b


def tensors(f):
    G = np.einsum('abc,abd->cd', f, f)
    Cm = np.einsum('abe,cde->abcd', f, f)
    S = (Cm + np.einsum('acbd->abcd', Cm) + np.einsum('adbc->abcd', Cm)) / 3
    # S_{abcd} = (C_{ab,cd} + C_{ac,bd} + C_{ad,bc})/3 ; check full symmetry
    for perm in itertools.permutations(range(4)):
        assert np.allclose(S, np.transpose(S, perm))
    s = (G ** 2).sum(); h = (S ** 2).sum()
    V = np.einsum('ab,bc,ca->', G, G, G)
    S2 = np.einsum('abcd,cdef->abef', S, S)
    T3 = np.einsum('abcd,cdab->', S2, S)
    T4 = (S2 ** 2).sum()
    Q = np.einsum('ab,abcd,cd->', G, S, G)
    U = np.einsum('abde,dec->abc', S, f)
    U2 = (U ** 2).sum()
    D = np.einsum('abe,ec->abc', f, G)
    DU = (D * U).sum()
    JGJ = np.einsum('ce,ef,fd->cd', J, G, J)
    G2 = (G + JGJ) / 2
    Ga = (G2 ** 2).sum()
    # charge +-2 projector on 2-tensors: P_- M = (M - (J (x) J) M)/2, ((J(x)J)M)_{ab} = sum J_ac J_bd M_cd
    JJS = np.einsum('ac,bd,cdef->abef', J, J, S)
    Sm = (S - JJS) / 2  # on first pair
    JJSm = np.einsum('ce,df,abef->abcd', J, J, Sm)
    Smm = (Sm - JJSm) / 2  # on second pair
    tt = (Smm ** 2).sum() / 2
    return dict(G=G, S=S, s=s, h=h, V=V, T3=T3, T4=T4, Q=Q, U2=U2, DU=DU, Ga=Ga, tt=tt, Smm=Smm, S2=S2)


def complex_blocks(f, S, Smm):
    """Cross-check tt against the genuine (+2,+2) block via the complex projector."""
    JS = np.einsum('ae,ebcd->abcd', J, Smm)  # (J (x) 1) on first pair
    Pp = (Smm - 1j * JS) / 2  # charge +2 on the first pair
    JS2 = np.einsum('ce,abed->abcd', J, Pp)
    Ppp = (Pp - 1j * JS2) / 2  # charge +2 on the second pair
    Ppm = (Pp + 1j * JS2) / 2  # charge -2 on the second pair
    return (abs(Ppp) ** 2).sum(), (abs(Ppm) ** 2).sum()


worst = {}
def rec(name, val):
    worst[name] = max(worst.get(name, -np.inf), val)

for trial in range(trials):
    f, a, b = random_circular()
    # sanity: a, b are the chaos with kernel f; b = -D_J a. Check E a^2 = E b^2, E ab = 0
    Ea2 = W @ (a * a); Eb2 = W @ (b * b); Eab = W @ (a * b)
    if Ea2 < 1e-6:
        continue
    assert abs(Ea2 - Eb2) < 1e-9 * Ea2 and abs(Eab) < 1e-9 * Ea2
    assert abs(Ea2 - 6 * (f ** 2).sum()) < 1e-9 * Ea2, (Ea2, 6 * (f ** 2).sum())
    Ea4 = W @ a ** 4; Ea6 = W @ a ** 6
    U = a * a + b * b
    m2 = W @ U ** 2; m3 = W @ U ** 3
    # circular symmetry
    assert abs(Ea4 - 3 / 8 * m2) < 1e-9 * m2
    assert abs(Ea6 - 5 / 16 * m3) < 1e-9 * m3
    k4 = Ea4 - 3 * Ea2 ** 2
    k6 = Ea6 - 15 * Ea4 * Ea2 + 30 * Ea2 ** 3
    t = tensors(f)
    s, h, V, T3, T4, Q, U2, DU, Ga, tt = [t[n] for n in ['s', 'h', 'V', 'T3', 'T4', 'Q', 'U2', 'DU', 'Ga', 'tt']]
    # Wick identities
    w4 = 1296 * (s + 3 * h / 2)
    w6 = 46656 * (135 / 2 * T3 - 20 * V + 135 / 2 * Q + 165 / 2 * DU + 45 * U2)
    rec('W4 relerr', abs(k4 - w4) / abs(w4))
    rec('W6 relerr', abs(k6 - w6) / abs(w6))
    # charge block check
    pp, pm = complex_blocks(f, t['S'], t['Smm'])
    rec('tt vs (+2,+2) relerr', abs(pp - tt) / tt)
    rec('(+2,-2) block / tt', pm / tt)
    # inequalities (all normalised so that <= 0 means OK)
    rec('I1 h-37s/39', (h - 37 / 39 * s) / s)
    rec('I2 27h-5s+8Ga-216tt', (27 * h - 5 * s + 8 * Ga - 216 * tt) / s)
    rec('I3 Ga-s/2', (Ga - s / 2) / s)
    wv = Ga / s
    rec('I4 V^2 - s^3(..)', (V ** 2 - s ** 3 * ((1 + 2 * wv) ** 2 * (1 - wv) / 2)) / s ** 3)
    rec('I5 tt-h/6', (tt - h / 6) / h)
    rec('I6 T3 - sqrt(tt)(9h/2-17tt)', (T3 - math.sqrt(tt) * (9 * h / 2 - 17 * tt)) / h ** 1.5)
    rec('I7 T4 - (h^2/2+8h tt-48tt^2)', (T4 - (h ** 2 / 2 + 8 * h * tt - 48 * tt ** 2)) / h ** 2)
    rec('I8 Q - coupled', (Q - ((2 * s - Ga) * math.sqrt(tt) + math.sqrt(max(0, 2 * Ga * (s - Ga) * (h - 6 * tt))))) / (s * math.sqrt(h)))
    rec('I9 U2 - sqrt(s T4)', (U2 - math.sqrt(s * T4)) / (h * math.sqrt(s)))
    A0 = 2 * s / 3 - 2 * h + (18 + 6 * kk) * tt
    A2 = s / 3 + (2 + kk) * h - (18 + 6 * kk) * tt
    rec('I10a -A0', -A0 / s); rec('I10b -A2', -A2 / s)
    B0 = 3 * h ** 2 / 8 + h * tt / 2 + 3 * tt ** 2 / 2
    B2 = 9 * h * tt - 54 * tt ** 2
    rec('I10c U2 - charge split', (U2 - (theta * T3 + math.sqrt(max(0, A0 * B0)) + math.sqrt(max(0, A2 * B2)))) / (h * math.sqrt(s)))
    rec('I11 DU - sqrt(V U2)', (DU - math.sqrt(V * U2)) / (h * s))
    rec('-V', -V / s ** 1.5); rec('-T4', -T4); rec('-U2', -U2); rec('-B2', -B2 / h ** 2)
    # final inequality
    m = m2 / Ea2 ** 2 * (1 / 4)  # normalise E|q|^2 = 1: U/(2 Ea2)
    e = 2 * Ea2
    mm = m2 / e ** 2; M6 = m3 / e ** 3
    rec('final ratio', (M6 - 9 * mm + 12) / (mm - 2) ** 1.5)

for n, v in worst.items():
    print(f"{n:32s} worst = {v:+.6e}")
