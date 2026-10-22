"""Numerical check of the tensor facts `GramFacts` of Grothe/LowerAnalytic/GramBudget.lean.

For explicit and random normalised circular cubics q = a + ib in k complex dimensions (d = 2k real
variables; E|q|^2 = 1, i.e. E a^2 = E b^2 = 1/2), with the standard complex structure J (pairs
(x_{2j}, x_{2j+1}), D_J = sum_j x_{2j} d_{2j+1} - x_{2j+1} d_{2j}, as in check_tensor_facts.py) and the
real kernels f = d^3 a / 6, g = d^3 b / 6 (`cubicKernel`), this computes

* the complex coefficient tensor t = 3 P+ P+ P- (f + i g), P± = (1 ∓ iJ)/2 (`cplxT`), its contractions
  N, H, B, W, Y (`ctN`, `ctH`, `ctB`, `ctW`, `ctY`) and the scalars n, h, b, y, z (`gramN`, ..., `gramZ`,
  z = Re sum_{ab} N_ab H_ab), exactly as the Lean definitions;
* the spectral norms u2 = E U2^2, u4 = E U4^2, v2 = E P2^2 + E Q2^2, v4 = E P4^2 + E Q4^2 (`specU2`, ...)
  from the explicit chaos components of Influence.lean (U2 = (gam2 a + gam2 b)/2 - 3,
  U4 = S - gam2 a - gam2 b + 3, P2 = (gam2 a - gam2 b)/2, P4 = radA - (gam2 a - gam2 b), Q2 = gam2c a b,
  Q4 = radB - 2 gam2c a b), by Gauss-Hermite quadrature (exact for the degrees involved),

and reports the worst case of every field of `GramFacts`: the four identities u2 = 16n + 4h + 16z,
u4 = 16n + 4h + 16b + 96y - 32z, v2 = 32b, v4 = 96y (relative error) and the inequalities b <= n,
y <= z, 0 <= n + b + 2T, 4T^2 <= h (n + b + 2T) with T = (3y - z)/2 (sign-normalised, <= 0 means the
fact holds).  As cross-checks it also reports the proved Cauchy-Schwarz bound z^2 <= n h, the identity
z = |W|^2, and the Lean-proved spectral layer E X^2 = (4u2 + u4)/9, P = (2u2 + u4)/3,
E|c|^2 = (4v2 + v4)/9, Q = (2v2 + v4)/3 against direct quadrature of X = S/3 - 1, c = (A + iB)/3.

Usage:  python3 tools/check_gram_facts.py k trials [seed]      (k = 1, 2, 3; k = 3 takes a minute)
"""
import sys, itertools, math
import numpy as np
from numpy.polynomial.hermite_e import hermegauss

k = int(sys.argv[1]); trials = int(sys.argv[2]); seed = int(sys.argv[3]) if len(sys.argv) > 3 else 0
d = 2 * k
rng = np.random.default_rng(seed)

J = np.zeros((d, d))
for j in range(k):
    J[2 * j, 2 * j + 1] = 1
    J[2 * j + 1, 2 * j] = -1
assert np.allclose(J @ J, -np.eye(d)) and np.allclose(J.T, -J)

nq = 8   # exact up to degree 15; the integrands have degree <= 12
xq, wq = hermegauss(nq); wq = wq / wq.sum()
grids = np.meshgrid(*([xq] * d), indexing='ij')
X = np.stack([g.ravel() for g in grids], 1)
W = np.ones(len(X))
for g in np.meshgrid(*([wq] * d), indexing='ij'):
    W = W * g.ravel()
Z = (X[:, 0::2] + 1j * X[:, 1::2]) / math.sqrt(2)
def E(v): return W @ v

zc = np.zeros((k, d), dtype=complex)
for j in range(k):
    zc[j, 2 * j] = 1 / math.sqrt(2); zc[j, 2 * j + 1] = 1j / math.sqrt(2)


def kernels(c):
    """Real kernels f, g of a = Re q, b = Im q for q = sum c_{jlm} :z_j z_l conj z_m:."""
    T = np.einsum('jlm,jp,lq,mr->pqr', c, zc, zc, np.conj(zc))
    F = np.zeros((d, d, d), dtype=complex)
    for perm in itertools.permutations(range(3)):
        F += np.transpose(T, perm)
    F /= 6
    return F.real, F.imag


def chaos_values(f):
    """a(x), its first derivatives (d, npts) and the constant second-derivative tensor (6 f)."""
    cubic = np.einsum('ijk,pi,pj,pk->p', f, X, X, X)
    lin = 3 * np.einsum('iij,pj->p', f, X)
    a = cubic - lin
    da = 3 * np.einsum('mjk,pj,pk->mp', f, X, X) - 3 * np.einsum('iim->m', f)[:, None]
    return a, da


def spectral(f, g):
    a, da = chaos_values(f); b, db = chaos_values(g)
    gaa = (da * da).sum(0); gbb = (db * db).sum(0); gab = (da * db).sum(0)
    # second derivatives d_n d_m a = 6 sum_k f_{mnk} x_k
    dda = 6 * np.einsum('mnk,pk->mnp', f, X); ddb = 6 * np.einsum('mnk,pk->mnp', g, X)
    g2a = (dda * dda).sum((0, 1)); g2b = (ddb * ddb).sum((0, 1)); g2ab = (dda * ddb).sum((0, 1))
    U = a * a + b * b; S = gaa + gbb; A = gaa - gbb; B = 2 * gab
    U2 = (g2a + g2b) / 2 - 3; U4 = S - g2a - g2b + 3
    P2 = (g2a - g2b) / 2; P4 = A - (g2a - g2b); Q2 = g2ab; Q4 = B - 2 * g2ab
    u2, u4 = E(U2 ** 2), E(U4 ** 2); v2, v4 = E(P2 ** 2) + E(Q2 ** 2), E(P4 ** 2) + E(Q4 ** 2)
    Xv = S / 3 - 1; cR, cI = A / 3, B / 3
    N = A * (a * a - b * b) + B * (2 * a * b)
    r = np.where(U > 1e-14, N / (3 * np.maximum(U, 1e-300)), 0.0)
    return dict(Ea2=E(a * a), Eb2=E(b * b), Eab=E(a * b), u2=u2, u4=u4, v2=v2, v4=v4,
                EX2=E(Xv ** 2), P=E(Xv * U), Ec2=E(cR ** 2 + cI ** 2), Q=E(r * U), Er2=E(r ** 2),
                chi=E(U ** 2) - 2, orth=E((U - 1 - U2 - U4) * U2) / max(u2, 1e-300))


def tensors(f, g):
    I = np.eye(d)
    Pp = (I - 1j * J) / 2; Pm = (I + 1j * J) / 2
    t = 3 * np.einsum('pa,qb,rc,abc->pqr', Pp, Pp, Pm, f + 1j * g)
    N = np.einsum('ajk,bjk->ab', t, np.conj(t))
    H = np.einsum('jka,jkb->ab', t, np.conj(t))
    Bt = np.einsum('abd,dea->be', t, t)
    Wt = np.einsum('abi,jic->abjc', t, t)
    Y = (Wt + Wt.transpose(0, 2, 1, 3) + Wt.transpose(1, 0, 2, 3) + Wt.transpose(1, 2, 0, 3)
         + Wt.transpose(2, 0, 1, 3) + Wt.transpose(2, 1, 0, 3)) / 6
    n = (abs(N) ** 2).sum(); h = (abs(H) ** 2).sum(); b = (abs(Bt) ** 2).sum(); y = (abs(Y) ** 2).sum()
    z = (N * H).sum().real
    return dict(n=n, h=h, b=b, y=y, z=z, w2=(abs(Wt) ** 2).sum(), tnorm=(abs(t) ** 2).sum())


def explicit(trial):
    c = np.zeros((k, k, k), dtype=complex)
    if trial == 0: c[0, 0, 0] = 1                                   # z^2 zbar
    elif trial == 1 and k >= 2: c[0, 0, 1] = 1                      # z1^2 zbar2
    elif trial == 2 and k >= 3: c[0, 1, 2] = c[1, 0, 2] = 0.5       # z1 z2 zbar3
    elif trial == 3 and k >= 2: c[0, 1, 1] = c[1, 0, 1] = 0.5; c[0, 0, 0] = 0.7   # mixed
    else: return None
    return c


worst = {}
def rec(name, val):
    worst[name] = max(worst.get(name, -np.inf), val)

for trial in range(trials):
    c = explicit(trial)
    if c is None:
        c = rng.standard_normal((k, k, k)) + 1j * rng.standard_normal((k, k, k))
        if rng.random() < 0.3:
            mask = rng.random((k, k, k)) < 0.5
            c = c * (mask | mask.transpose(1, 0, 2))
    c = (c + c.transpose(1, 0, 2)) / 2
    f, g = kernels(c)
    s = spectral(f, g)
    if s['Ea2'] < 1e-9:
        continue
    scale = 1 / math.sqrt(2 * s['Ea2'])          # normalise E|q|^2 = 1
    f, g = f * scale, g * scale
    s = spectral(f, g); t = tensors(f, g)
    assert abs(s['Ea2'] - 0.5) < 1e-9 and abs(s['Eb2'] - 0.5) < 1e-9 and abs(s['Eab']) < 1e-9
    assert abs(2 * t['tnorm'] - 1) < 1e-9, t['tnorm']          # E|q|^2 = 2 |t|^2
    n, h, b, y, z = [t[v] for v in 'nhbyz']
    T = (3 * y - z) / 2
    scale4 = max(n, 1e-300)
    rec('u2 - (16n+4h+16z) relerr', abs(s['u2'] - (16 * n + 4 * h + 16 * z)) / max(s['u2'], 1e-300))
    rec('u4 - (16n+4h+16b+96y-32z) relerr', abs(s['u4'] - (16 * n + 4 * h + 16 * b + 96 * y - 32 * z)) / max(s['u4'], 1e-300))
    rec('v2 - 32b abserr/n', abs(s['v2'] - 32 * b) / scale4)
    rec('v4 - 96y abserr/n', abs(s['v4'] - 96 * y) / scale4)
    rec('schatten b-n', (b - n) / scale4)
    rec('symm y-z', (y - z) / scale4)
    rec('gram1a -(n+b+2T)', -(n + b + 2 * T) / scale4)
    rec('gram1b 4T^2-h(n+b+2T)', (4 * T ** 2 - h * (n + b + 2 * T)) / scale4 ** 2)
    rec('gram0 z^2-nh (proved)', (z ** 2 - n * h) / scale4 ** 2)
    rec('z-|W|^2 abserr/n (identity)', abs(z - t['w2']) / scale4)
    rec('orth (U-1-U2-U4) _|_ U2', abs(s['orth']))
    # the Lean-proved spectral layer
    rec('EX2-(4u2+u4)/9 relerr', abs(s['EX2'] - (4 * s['u2'] + s['u4']) / 9) / s['EX2'])
    rec('P-(2u2+u4)/3 relerr', abs(s['P'] - (2 * s['u2'] + s['u4']) / 3) / s['P'])
    rec('Ec2-(4v2+v4)/9 abserr', abs(s['Ec2'] - (4 * s['v2'] + s['v4']) / 9))
    rec('Q-(2v2+v4)/3 abserr', abs(s['Q'] - (2 * s['v2'] + s['v4']) / 3))
    rec('2P+Q-chi abserr', abs(2 * s['P'] + s['Q'] - s['chi']))
    rec('Er2-Ec2 (<=0)', s['Er2'] - s['Ec2'])
    # the explicit instance E X^2 + E r^2/10 <= 34P/45 - Q/18 and the coupled family at s = 4
    rec('EX2+Er2/10-(34P/45-Q/18)', s['EX2'] + s['Er2'] / 10 - (34 * s['P'] / 45 - s['Q'] / 18))
    rec('EX2-(P-5Q/12) (s=4)', s['EX2'] - (s['P'] - 5 * s['Q'] / 12))

for name, v in worst.items():
    print(f"{name:36s} worst = {v:+.6e}")
