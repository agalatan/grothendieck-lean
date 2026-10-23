"""Rigorous (outward) Gaussian integration of the anchored-pair majorant with ARBITRARY positive cell prices on the full circle.

For cell prices A_C, B_C > 0 (any floats, i.e. exact dyadic rationals) and R_C >= |L| on the cell, the pointwise majorant of
anchored_potential_formalization.md section 2, eq. (4) (global in p, valid for every complex p) integrates to
     int (|L+p| + |L-p|) dgamma  <=  C + 2 h.y + y^T H y ,    p = B.y, y in R^12,
     H = sum_C int_C (nu G - g u u^T),  h = sum_C int_C tau u,  C = sum_C int_C (nu |L|^2 + xi)   (+ the r >= 8 tail with A = B = 1, g = 0)
with nu = (1/A + 1/B)/2, g = 8 / (S (S^2 + 4 R^2 + 4 R |A-B|)), S = A + B, tau = (1/A - 1/B)/2 + g (A^2-B^2)/4, xi = S/2 - g (A^2-B^2)^2/16,
G_ij = Re(B_i conj B_j), u_i = Re(B_i conj L)  (eq. (5) there).  No quadrant symmetry is used: the 12 x 12 matrix is computed in full.

Arithmetic: midpoint-radius intervals over IEEE double (round to nearest), class MR below; every operation adds the rounding error of its
midpoint (u |m|, u = 2^-53), propagates the input radii, and inflates the radius by FUDGE = 1 + 2^-40 (covering the <= 20 roundings made
while computing the radius itself, relative error <= 20u < 2^-48) plus ETA = 2^-1000 (underflow).  Sums of n terms use the bound
|fl(sum x_i) - sum x_i| <= (n-1)u/(1-(n-1)u) sum |x_i| (valid for every summation order).  Moments: moments_full.py (rational, outward).
The resulting enclosures are converted to exact Fractions; everything after that (Loewner upper matrix, LDL, quadratics) is exact."""
import json, math, numpy as np
from fractions import Fraction as F
U = 2.0 ** -53; FUDGE = 1.0 + 2.0 ** -40; ETA = 2.0 ** -1000
class MR:
    __slots__ = ('m', 'r')
    def __init__(s, m, r=None): s.m = np.asarray(m, float); s.r = np.zeros_like(s.m) if r is None else np.asarray(r, float)
    def __add__(a, b):
        b = b if isinstance(b, MR) else MR(b); m = a.m + b.m; return MR(m, (a.r + b.r + U * np.abs(m)) * FUDGE + ETA)
    def __neg__(a): return MR(-a.m, a.r)
    def __sub__(a, b): return a + (-(b if isinstance(b, MR) else MR(b)))
    def __mul__(a, b):
        b = b if isinstance(b, MR) else MR(b); m = a.m * b.m
        return MR(m, (np.abs(a.m) * b.r + a.r * np.abs(b.m) + a.r * b.r + U * np.abs(m)) * FUDGE + ETA)
    def recip(a):
        lo = (a.m - a.r) * (1 - 2.0 ** -50); assert np.all(lo > 0), "recip of non-positive interval"
        m = 1.0 / a.m; return MR(m, (a.r / (a.m * lo) + U * np.abs(m)) * FUDGE + ETA)
    def abs(a):
        lo = np.abs(a.m) - a.r; hi = np.abs(a.m) + a.r; lo = np.where(lo > 0, lo, 0.0)
        m = (lo + hi) / 2; return MR(m, ((hi - lo) / 2 + U * np.abs(m) + U * hi) * FUDGE + ETA)
    def halve(a): return MR(a.m / 2, a.r / 2 + ETA)
def sumax(x, axis):
    n = x.m.shape[axis]; g = 2 * n * U; m = x.m.sum(axis); am = np.abs(x.m).sum(axis); r = x.r.sum(axis)
    return MR(m, (r + g * am) * (1 + 4 * n * U) * FUDGE + n * ETA)
def matmul(A, B):                       # MR (p x n) @ MR (n x q) -> MR (p x q)
    n = A.m.shape[-1]; g = 2 * n * U; m = A.m @ B.m; am = np.abs(A.m) @ np.abs(B.m)
    r = np.abs(A.m) @ B.r + A.r @ np.abs(B.m) + A.r @ B.r
    return MR(m, (r + g * am + U * am) * (1 + 4 * n * U) * FUDGE + n * ETA)
# ---------- exact symbolic basis: Q[s2]-coefficients (s2 = 1/sqrt 2, s2^2 = 1/2), complex, terms r^k e^{i n theta} ----------
def qmul(a, b):                         # (a0 + a1 s2)(b0 + b1 s2), complex Fractions as pairs
    def cm(x, y): return (x[0] * y[0] - x[1] * y[1], x[0] * y[1] + x[1] * y[0])
    def ca(x, y): return (x[0] + y[0], x[1] + y[1])
    def ch(x): return (x[0] / 2, x[1] / 2)
    return (ca(cm(a[0], b[0]), ch(cm(a[1], b[1]))), ca(cm(a[0], b[1]), cm(a[1], b[0])))
def qconj(a): return ((a[0][0], -a[0][1]), (a[1][0], -a[1][1]))
def qadd(a, b): return ((a[0][0] + b[0][0], a[0][1] + b[0][1]), (a[1][0] + b[1][0], a[1][1] + b[1][1]))
Z = ((F(0), F(0)), (F(0), F(0)))
def T(re=0, im=0, s2=False): c = (F(re), F(im)); return (((F(0), F(0)), c) if s2 else (c, (F(0), F(0))))
def poly(terms):                        # dict (k, n) -> Q[s2] complex
    d = {}
    for c, rad, n in terms:
        for k, v in rad.items(): d[(k, n)] = qadd(d.get((k, n), Z), qmul(c, T(v)))
    return d
def pmul(X, Y, conjY=False):
    d = {}
    for (k1, n1), a in X.items():
        for (k2, n2), b in Y.items():
            bb = qconj(b) if conjY else b; key = (k1 + k2, n1 - n2 if conjY else n1 + n2); d[key] = qadd(d.get(key, Z), qmul(a, bb))
    return d
def realpart(X):                        # Re(sum c r^k e^{in th}) -> dict (k, kind, |n|) -> real Q[s2] (pair of Fractions)
    d = {}
    def put(key, v): o = d.get(key, (F(0), F(0))); d[key] = (o[0] + v[0], o[1] + v[1])
    for (k, n), c in X.items():
        re = (c[0][0], c[1][0]); im = (c[0][1], c[1][1])
        put((k, 'c', abs(n)), re)
        if n != 0: put((k, 's', abs(n)), (-im[0], -im[1]) if n > 0 else im)
    return d
def basis(c, be):
    r1 = {0: 1}; r2 = {2: 1, 0: -1}; z2 = {2: 1}; z1 = {1: 1}; z3 = {3: 1, 1: -2}
    B = [poly([(T(1), r1, 0)]), poly([(T(1), r2, 0)]), poly([(T(1, s2=True), z2, 2)]), poly([(T(0, 1), r1, 0)]), poly([(T(0, 1), r2, 0)]),
         poly([(T(0, -1, s2=True), z2, 2)]), poly([(T(1), z1, 1)]), poly([(T(1, s2=True), z3, 1)]), poly([(T(0, 1), z1, 1)]),
         poly([(T(0, 1, s2=True), z3, 1)]), poly([(T(1), z1, -1)]), poly([(T(0, 1), z1, -1)])]
    L = poly([(T(1), {1: c, 3: be}, 1)]); return B, L
S2LO, S2HI = None, None
def s2iv():
    global S2LO, S2HI
    if S2LO is None:
        N = 10 ** 40; lo = F(math.isqrt(N * N // 2), N); hi = lo + F(1, N); assert lo * lo <= F(1, 2) <= hi * hi; S2LO, S2HI = lo, hi
    return S2LO, S2HI
def coef_iv(q):                         # real Q[s2] element -> Fraction interval
    lo, hi = s2iv(); a = q[0] + q[1] * lo; b = q[0] + q[1] * hi; return (min(a, b), max(a, b))
HIDX = {('c', 0): 0, ('c', 1): 1, ('c', 2): 2, ('c', 3): 3, ('c', 4): 4, ('s', 1): 5, ('s', 2): 6, ('s', 3): 7, ('s', 4): 8}
def tof(iv):                            # Fraction interval -> MR scalar (outward)
    m = float((iv[0] + iv[1]) / 2); r = max(abs(F(m) - iv[0]), abs(iv[1] - F(m))); rf = float(r)
    if F(rf) < r: rf = math.nextafter(rf, math.inf)
    return MR(m, rf)
class Setup:
    def __init__(s, row, mom):
        th = [F(v) for v in row['theta']]; s.th = th; s.eps = F(row['eps']); c = th[13] - 2 * th[14]; be = th[14]; assert c > 0 and be > 0
        s.NR, s.NQ = mom['NR'], mom['NQ']
        rad = np.array(mom['rad']); s.RAD = MR((rad[:, :, 0] + rad[:, :, 1]) / 2, None); s.RAD.r = np.maximum(rad[:, :, 1] - s.RAD.m, s.RAD.m - rad[:, :, 0]) * (1 + 4 * U)
        ang = np.array(mom['ang']); s.ANG = MR((ang[:, :, 0] + ang[:, :, 1]) / 2, None); s.ANG.r = np.maximum(ang[:, :, 1] - s.ANG.m, s.ANG.m - ang[:, :, 0]) * (1 + 4 * U)
        tl = np.array(mom['tail']); s.TAIL = MR((tl[:, 0] + tl[:, 1]) / 2, None); s.TAIL.r = np.maximum(tl[:, 1] - s.TAIL.m, s.TAIL.m - tl[:, 0]) * (1 + 4 * U)
        # R_C = l(r_hi) rounded up (l increasing since c, beta > 0)
        s.RC = np.array([float(v) for v in [F(8 * (i + 1), s.NR) * (c + be * F(8 * (i + 1), s.NR) ** 2) for i in range(s.NR)]])
        exact = [F(8 * (i + 1), s.NR) * (c + be * F(8 * (i + 1), s.NR) ** 2) for i in range(s.NR)]
        s.RC = np.array([v if F(v) >= e else math.nextafter(v, math.inf) for v, e in zip(s.RC, exact)])
        B, L = basis(c, be); s.B = B; s.L = L
        s.G = [[realpart(pmul(B[i], B[j], True)) for j in range(12)] for i in range(12)]
        X = [pmul(B[i], L, True) for i in range(12)]                    # B_i conj L ;  u_i = Re X_i
        s.u = [realpart(x) for x in X]
        s.UU = [[{} for j in range(12)] for i in range(12)]
        for i in range(12):
            for j in range(i, 12):                                      # u_i u_j = (Re(X_i X_j) + Re(X_i conj X_j)) / 2
                a = realpart(pmul(X[i], X[j])); b = realpart(pmul(X[i], X[j], True)); d = {}
                for key in set(a) | set(b):
                    va = a.get(key, (F(0), F(0))); vb = b.get(key, (F(0), F(0))); d[key] = ((va[0] + vb[0]) / 2, (va[1] + vb[1]) / 2)
                s.UU[i][j] = d
        s.L2 = realpart(pmul(L, L, True))
        # exact gate matrices
        E = [[th[0], th[1], th[2]], [th[1], th[3], th[4]], [th[2], th[4], th[5]]]; Rm = [[th[6], th[7]], [th[7], th[8]]]
        M = [[F(0)] * 12 for _ in range(12)]
        for o in (0, 3):
            for i in range(3):
                for j in range(3): M[o + i][o + j] = E[i][j]
        for o in (6, 8):
            for i in range(2):
                for j in range(2): M[o + i][o + j] = Rm[i][j]
        M[10][10] = M[11][11] = s.eps; s.M = M; s.Q = inv(M)
        s.a = [1 + th[10], th[11], th[12]] + [F(0)] * 9
        # grid geometry (floats; used only to PROPOSE prices)
        s.rm = (np.arange(s.NR) + 0.5) * 8 / s.NR; s.tm = (np.arange(s.NQ) + 0.5) * 2 * np.pi / s.NQ
        s.thf = [float(v) for v in th]; s.Qf = np.array([[float(v) for v in r] for r in s.Q]); s.af = np.array([float(v) for v in s.a])
    def cellvals(s, y, r, t):           # float p(z) = B.y and L(z) at points (r, t)
        z = r * np.exp(1j * t); x2 = r * r; i2 = 1 / np.sqrt(2)
        Bv = [np.ones_like(z), x2 - 1 + 0j, z * z * i2, 1j * np.ones_like(z), 1j * (x2 - 1), -1j * z * z * i2, z, z * (x2 - 2) * i2, 1j * z, 1j * z * (x2 - 2) * i2, np.conj(z), 1j * np.conj(z)]
        p = sum(y[j] * Bv[j] for j in range(12) if y[j] != 0) if np.any(y != 0) else np.zeros_like(z)
        L = z * (s.thf[13] + s.thf[14] * (x2 - 2)); return p, L, Bv
    def prices(s, y0, var=(), scale=1.0, floor=1e-6):
        """PROPOSAL (float, any positive output is admissible): RMS of |L +- p0| over the cell (2x2 Gauss points) plus sum_f |B.f|^2."""
        g = np.array([-1, 1]) / np.sqrt(3); hr = 4 / s.NR; ht = np.pi / s.NQ; pa = np.zeros((s.NR, s.NQ)); pb = np.zeros((s.NR, s.NQ))
        for gr in g:
            for gt in g:
                r = (s.rm + gr * hr)[:, None] * np.ones(s.NQ)[None, :]; t = np.ones(s.NR)[:, None] * (s.tm + gt * ht)[None, :]
                p, L, Bv = s.cellvals(np.asarray(y0, float), r, t); ex = 0
                for f in var: ex = ex + np.abs(sum(f[j] * Bv[j] for j in range(12) if f[j] != 0)) ** 2
                pa += (np.abs(L + p) ** 2 + ex) / 4; pb += (np.abs(L - p) ** 2 + ex) / 4
        return np.maximum(np.sqrt(pa) * scale, floor), np.maximum(np.sqrt(pb) * scale, floor)
    def integrate(s, pa, pb):
        """-> (C, h[12], H[12][12]) as Fraction intervals (lo, hi), for the given float prices (exact dyadics)."""
        A = MR(pa); B_ = MR(pb); Rc = MR(s.RC[:, None] * np.ones(s.NQ)[None, :])
        Sm = A + B_; d = A - B_; ia = A.recip(); ib = B_.recip(); nu = (ia + ib).halve(); dnu = (ia - ib).halve()
        D = Sm * (Sm * Sm + MR(4.0) * Rc * Rc + MR(4.0) * Rc * d.abs()); g = MR(8.0) * D.recip(); d2 = A * A - B_ * B_; x0 = MR(d2.m / 4, d2.r / 4 + ETA)
        tau = dnu + g * x0; xi = Sm.halve() - g * x0 * x0
        S = {}
        for name, W in (('nu', nu), ('g', g), ('tau', tau), ('xi', xi)):
            N = matmul(W, s.ANG)                                        # NR x 9 harmonic sums over the angular cells
            S[name] = matmul(MR(s.RAD.m.T, s.RAD.r.T), N)               # 13 x 9
        def integ(dct, Wn):
            acc = MR(0.0)
            for (k, kind, n), q in dct.items():
                cf = tof(coef_iv(q))
                if kind == 's' and n == 0: continue
                hh = HIDX[(kind, n)]; acc = acc + cf * MR(S[Wn].m[k, hh], S[Wn].r[k, hh])
            return acc
        def tailint(dct):
            acc = MR(0.0)
            for (k, kind, n), q in dct.items():
                if kind == 'c' and n == 0: acc = acc + tof(coef_iv(q)) * MR(s.TAIL.m[k], s.TAIL.r[k])
            return acc
        out = {}
        H = [[None] * 12 for _ in range(12)]
        for i in range(12):
            for j in range(i, 12):
                v = integ(s.G[i][j], 'nu') - integ(s.UU[i][j], 'g') + tailint(s.G[i][j]); H[i][j] = H[j][i] = v
        h = [integ(s.u[i], 'tau') for i in range(12)]
        C = integ(s.L2, 'nu') + MR(S['xi'].m[0, 0], S['xi'].r[0, 0]) + tailint(s.L2) + MR(s.TAIL.m[0], s.TAIL.r[0])
        fr = lambda x: (F(float(x.m)) - F(float(x.r)), F(float(x.m)) + F(float(x.r)))
        return fr(C), [fr(v) for v in h], [[fr(v) for v in row] for row in H]
    def integrate_float(s, pa, pb):     # fast float midpoints only (search)
        C, h, H = s.integrate(pa, pb); mid = lambda iv: float((iv[0] + iv[1]) / 2)
        return mid(C), np.array([mid(v) for v in h]), np.array([[mid(v) for v in r] for r in H])
def inv(M):
    n = len(M); A = [list(r) + [F(int(i == j)) for j in range(n)] for i, r in enumerate(M)]
    for i in range(n):
        p = next(k for k in range(i, n) if A[k][i] != 0); A[i], A[p] = A[p], A[i]; v = A[i][i]; A[i] = [x / v for x in A[i]]
        for k in range(n):
            if k != i and A[k][i] != 0: f = A[k][i]; A[k] = [x - f * y for x, y in zip(A[k], A[i])]
    return [r[n:] for r in A]
def upper(C, h, H):
    """Loewner upper bound of the augmented interval matrix [[C, h^T], [h, H]] (formalization section 5): mid + rho I."""
    n = 13; lo = [[None] * n for _ in range(n)]; hi = [[None] * n for _ in range(n)]
    for i in range(n):
        for j in range(n):
            iv = C if i == j == 0 else (h[j - 1] if i == 0 else (h[i - 1] if j == 0 else H[i - 1][j - 1])); lo[i][j], hi[i][j] = iv
    mid = [[(lo[i][j] + hi[i][j]) / 2 for j in range(n)] for i in range(n)]
    rho = max(sum((hi[i][j] - lo[i][j]) / 2 for j in range(n)) for i in range(n))
    for i in range(n): mid[i][i] += rho
    return mid[0][0], [mid[0][j] for j in range(1, n)], [[mid[i][j] for j in range(1, n)] for i in range(1, n)], rho
def ldl(A):
    n = len(A); L = [[F(int(i == j)) for j in range(n)] for i in range(n)]; d = []
    for j in range(n):
        p = A[j][j] - sum(L[j][k] ** 2 * d[k] for k in range(j))
        if p <= 0: return None
        d.append(p)
        for i in range(j + 1, n): L[i][j] = (A[i][j] - sum(L[i][k] * L[j][k] * d[k] for k in range(j))) / p
    return L, d
def solve_ldl(L, d, b):
    n = len(b); y = list(b)
    for i in range(n): y[i] = b[i] - sum(L[i][k] * y[k] for k in range(i))
    z = [y[i] / d[i] for i in range(n)]; x = [F(0)] * n
    for i in reversed(range(n)): x[i] = z[i] - sum(L[k][i] * x[k] for k in range(i + 1, n))
    return x
def piece_quadratic(Q, a, Cu, hu, Hu, v, lo, hi, lam, mu):
    """Exact: on the region {m : lo <= v.m <= hi} (hi = None: halfspace v.m >= lo, then lam must be 0; lo = None: whole space, lam = mu = 0)
         J_s(m) <= Maj(m) + lam (v.m - lo)(hi - v.m) + mu (v.m - lo)  =  -m^T K m + 2 l(s)^T m + c(s),   K = Q - Hu + lam v v^T
       sup_m = c(s) + l(s)^T K^{-1} l(s) = q0 + q1 s + q2 s^2.   Returns (q0, q1, q2, minimal LDL pivot) or None if K is not positive definite."""
    n = 12; K = [[Q[i][j] - Hu[i][j] + (lam * v[i] * v[j] if lam else 0) for j in range(n)] for i in range(n)]
    f = ldl(K)
    if f is None: return None
    L, d = f
    Ha = [sum(Hu[i][j] * a[j] for j in range(n)) for i in range(n)]
    if lo is None: assert lam == 0 and mu == 0; w0 = [F(0)] * n; cst = F(0)
    elif hi is None: assert lam == 0; w0 = [mu * v[i] / 2 for i in range(n)]; cst = -mu * lo
    else: w0 = [(lam * (lo + hi) + mu) * v[i] / 2 for i in range(n)]; cst = -lam * lo * hi - mu * lo
    l0 = [hu[i] + w0[i] for i in range(n)]                              # l(s) = l0 + s Ha
    x0 = solve_ldl(L, d, l0); x1 = solve_ldl(L, d, Ha)
    ha = sum(hu[i] * a[i] for i in range(n)); aHa = sum(a[i] * Ha[i] for i in range(n))
    q0 = Cu + cst + sum(l0[i] * x0[i] for i in range(n)); q1 = 2 * ha + 2 * sum(l0[i] * x1[i] for i in range(n)); q2 = aHa + sum(Ha[i] * x1[i] for i in range(n))
    return q0, q1, q2, min(d)
def piece_quadratic_multi(Q, a, Cu, hu, Hu, cons):
    """Exact.  cons = list of (v, lo, hi, lam, mu) describing the region {m : lo <= v.m <= hi for every constraint} (hi = None: v.m >= lo, lam = 0).
       On the region  J_s(m) <= Maj(m) + sum_c [lam (v.m - lo)(hi - v.m) + mu (v.m - lo)]  (each added term >= 0 there)
                    = -m^T K m + 2 l(s)^T m + c(s),  K = Q - Hu + sum lam v v^T;  sup_m = q0 + q1 s + q2 s^2 if K > 0 (exact LDL)."""
    n = 12; K = [[Q[i][j] - Hu[i][j] for j in range(n)] for i in range(n)]; w0 = [F(0)] * n; cst = F(0)
    for v, lo, hi, lam, mu in cons:
        assert lam >= 0 and mu >= 0 and (hi is not None or lam == 0)
        for i in range(n):
            if v[i]:
                for j in range(n):
                    if v[j] and lam: K[i][j] += lam * v[i] * v[j]
        coef = (lam * (lo + hi) if lam else F(0)) + mu
        for i in range(n): w0[i] += coef * v[i] / 2
        cst -= (lam * lo * hi if lam else F(0)) + mu * lo
    f = ldl(K)
    if f is None: return None
    L, d = f
    Ha = [sum(Hu[i][j] * a[j] for j in range(n)) for i in range(n)]
    l0 = [hu[i] + w0[i] for i in range(n)]
    x0 = solve_ldl(L, d, l0); x1 = solve_ldl(L, d, Ha)
    ha = sum(hu[i] * a[i] for i in range(n)); aHa = sum(a[i] * Ha[i] for i in range(n))
    q0 = Cu + cst + sum(l0[i] * x0[i] for i in range(n)); q1 = 2 * ha + 2 * sum(l0[i] * x1[i] for i in range(n)); q2 = aHa + sum(Ha[i] * x1[i] for i in range(n))
    return q0, q1, q2, min(d)
