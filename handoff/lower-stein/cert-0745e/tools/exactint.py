"""EXACT integration of the anchored-pair majorant with arbitrary positive cell prices (standard library only: int, fractions, math).
Replaces the float midpoint-radius arithmetic of fullint.py for the REPLAY.  No floating-point rounding enters any bound:
 * prices: chosen per cell from the recipe in float (math module) and then DEFINED as the dyadic rational PA / 2^E (E = 64), PA a positive
   integer.  Any positive prices are admissible in AF eq. (4), so this choice is not an approximation step.
 * R_C = ceil(l(r_hi) 2^E) / 2^E >= |L| on the cell (l increasing; l(r_hi) computed exactly in fractions).
 * per-cell weights nu, delta-nu, g, tau, xi as exact integer enclosures [lo, lo + width] at scale 2^(E+1), from exact integer operations
   and floor/ceil divisions only;
 * angular moments and radial moments: the rational outward enclosures of moments_full.py (the stored float endpoints are exact dyadic
   rationals; check_moments.py regenerates them in fractions and compares), converted to integers at scales 2^EA, 2^ER with floor/ceil;
 * harmonic sums  sum_j W_j A_j  enclosed by  sum_j Wlo_j Alo_j +- [ (sum_j |Wlo_j|) max_j Awidth_j + (max_j Wwidth_j) sum_j |A|max_j ];
   radial sums with the sign-correct endpoint products (radial moments are >= 0);
 * the polynomial coefficients (with 1/sqrt 2 enclosed by integer square roots) and everything after: Fraction intervals.
Output: C, h, H as Fraction intervals, then the exact Loewner upper bound / LDL / S-lemma quadratic (same exact code as fullint.py)."""
import json, math
from fractions import Fraction as F

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

# ---------------------------------------------------------------------------------------------------------------------------------
from operator import mul
E = 64; EA = 96; ER = 320
def ilo(x, sc): q = F(x) * (1 << sc); return q.numerator // q.denominator          # floor(x 2^sc)
def ihi(x, sc): q = F(x) * (1 << sc); return -((-q.numerator) // q.denominator)    # ceil(x 2^sc)
HK = [('c', 0), ('c', 1), ('c', 2), ('c', 3), ('c', 4), ('s', 1), ('s', 2), ('s', 3), ('s', 4)]
class ExactSetup:
    def __init__(s, row, mom):
        th = [F(v) for v in row['theta']]; s.th = th; s.eps = F(row['eps']); c = th[13] - 2 * th[14]; be = th[14]; assert c > 0 and be > 0
        s.NR, s.NQ = mom['NR'], mom['NQ']; NR, NQ = s.NR, s.NQ
        # angular: per harmonic h, integer lists Alo (scale 2^EA), widths, and sum_j |A|max
        s.Alo, s.Admax, s.Aabs = [], [], []
        for h in range(9):
            lo = [ilo(a[h][0], EA) for a in mom['ang']]; hi = [ihi(a[h][1], EA) for a in mom['ang']]
            s.Alo.append(lo); s.Admax.append(max(b - a for a, b in zip(lo, hi))); s.Aabs.append(sum(max(abs(a), abs(b)) for a, b in zip(lo, hi)))
        s.Rlo = [[ilo(r[k][0], ER) for k in range(13)] for r in mom['rad']]; s.Rhi = [[ihi(r[k][1], ER) for k in range(13)] for r in mom['rad']]
        assert all(a >= 0 for r in s.Rlo for a in r)
        s.TAIL = [(F(a), F(b)) for a, b in mom['tail']]
        s.RC = [-((-(F(8 * (i + 1), NR) * (c + be * F(8 * (i + 1), NR) ** 2) * (1 << E)).numerator) // (F(8 * (i + 1), NR) * (c + be * F(8 * (i + 1), NR) ** 2) * (1 << E)).denominator) for i in range(NR)]
        B, L = basis(c, be)
        s.G = [[realpart(pmul(B[i], B[j], True)) for j in range(12)] for i in range(12)]
        X = [pmul(B[i], L, True) for i in range(12)]; s.u = [realpart(x) for x in X]; s.UU = [[{} for j in range(12)] for i in range(12)]
        for i in range(12):
            for j in range(i, 12):
                a = realpart(pmul(X[i], X[j])); b = realpart(pmul(X[i], X[j], True)); d = {}
                for key in set(a) | set(b):
                    va = a.get(key, (F(0), F(0))); vb = b.get(key, (F(0), F(0))); d[key] = ((va[0] + vb[0]) / 2, (va[1] + vb[1]) / 2)
                s.UU[i][j] = d
        s.L2 = realpart(pmul(L, L, True))
        E3 = [[th[0], th[1], th[2]], [th[1], th[3], th[4]], [th[2], th[4], th[5]]]; Rm = [[th[6], th[7]], [th[7], th[8]]]
        M = [[F(0)] * 12 for _ in range(12)]
        for o in (0, 3):
            for i in range(3):
                for j in range(3): M[o + i][o + j] = E3[i][j]
        for o in (6, 8):
            for i in range(2):
                for j in range(2): M[o + i][o + j] = Rm[i][j]
        M[10][10] = M[11][11] = s.eps; s.M = M; s.Q = inv(M); s.a = [1 + th[10], th[11], th[12]] + [F(0)] * 9
        # float geometry, only to PROPOSE prices
        s.thf = [float(v) for v in th]; s.i2 = 1 / math.sqrt(2.0); g = 1 / math.sqrt(3.0); s.g = (-g, g)
        s.ang = []
        for j in range(NQ):
            tm = (j + 0.5) * 2 * math.pi / NQ; ht = math.pi / NQ; pts = []
            for gt in s.g:
                t = tm + gt * ht; e1 = complex(math.cos(t), math.sin(t)); pts.append((e1, e1 * e1, e1.conjugate()))
            s.ang.append(pts)
    def prices(s, y, var=(), scale=1.0, floor=1e-6):
        """proposal (math module floats): RMS over 2x2 Gauss points of |L +- p|^2 + sum_f |B.f|^2, times scale, floored; returned as
        integers PA, PB (the prices are DEFINED as PA / 2^E)."""
        NR, NQ = s.NR, s.NQ; ell, be = s.thf[13], s.thf[14]; i2 = s.i2
        def coefs(v, r):
            x2 = r * r
            A0 = complex(v[0] + v[1] * (x2 - 1), v[3] + v[4] * (x2 - 1)); A2 = x2 * i2 * complex(v[2], -v[5])
            A1 = r * complex(v[6] + v[7] * (x2 - 2) * i2, v[8] + v[9] * (x2 - 2) * i2); Am = r * complex(v[10], v[11]); return A0, A2, A1, Am
        PA, PB = [], []; two = float(1 << E)
        for i in range(NR):
            rm = (i + 0.5) * 8 / NR; hr = 4 / NR; rows = []
            for gr in s.g:
                r = rm + gr * hr; rows.append((coefs(y, r), [coefs(f, r) for f in var], r * (ell + be * (r * r - 2))))
            pa_row = [0.0] * NQ; pb_row = [0.0] * NQ
            for j in range(NQ):
                sa = sb = 0.0
                for (A0, A2, A1, Am), fv, l in rows:
                    for e1, e2, em in s.ang[j]:
                        p = A0 + A2 * e2 + A1 * e1 + Am * em; Lz = l * e1; w1 = Lz + p; w2 = Lz - p
                        ex = 0.0
                        for (B0, B2, B1, Bm) in fv:
                            q = B0 + B2 * e2 + B1 * e1 + Bm * em; ex += q.real * q.real + q.imag * q.imag
                        sa += w1.real * w1.real + w1.imag * w1.imag + ex; sb += w2.real * w2.real + w2.imag * w2.imag + ex
                pa = max(math.sqrt(sa / 4) * scale, floor); pb = max(math.sqrt(sb / 4) * scale, floor)
                pa_row[j] = max(1, int(pa * two)); pb_row[j] = max(1, int(pb * two))
            PA.append(pa_row); PB.append(pb_row)
        return PA, PB
    def integrate(s, PA, PB):
        """exact enclosures (Fraction intervals) of C, h[12], H[12][12] for the prices PA/2^E, PB/2^E."""
        NR, NQ = s.NR, s.NQ; W = E + 1; one2E = 1 << (2 * E); s3 = 1 << (4 * E + 4); x4 = 4 << (2 * E); x16 = 16 << (4 * E)
        acc = {w: [[(0, 0)] * 9 for _ in range(13)] for w in ('nu', 'g', 'tau', 'xi')}
        Alo, Admax, Aabs = s.Alo, s.Admax, s.Aabs
        Nring = {w: [] for w in acc}
        for i in range(NR):
            Rc = s.RC[i]; R4 = 4 * Rc * Rc; R4b = 4 * Rc
            nu = []; g = []; ta = []; xi = []; tw = 0; xw = 0
            for pa, pb in zip(PA[i], PB[i]):
                ia = one2E // pa; ib = one2E // pb                        # 1/p in [ia, ia+1] / 2^E
                nu.append(ia + ib)                                        # nu in [ia+ib, ia+ib+2] / 2^W
                S = pa + pb; d = pa - pb; D = S * (S * S + R4 + R4b * (d if d >= 0 else -d))     # D / 2^(3E) exact
                gl = s3 // D; g.append(gl)                                # g = 8 / D in [gl, gl+1] / 2^W   (8 * 2^(4E+1) = 2^(4E+4))
                X = (pa - pb) * S                                         # x0 = X / (4 * 2^(2E)) exact
                if X >= 0: lo_ = gl * X // x4; hi_ = -((-(gl + 1) * X) // x4)
                else: lo_ = (gl + 1) * X // x4; hi_ = -((-gl * X) // x4)
                dl = ia - ib - 1                                          # delta-nu in [ia-ib-1, ia-ib+1] / 2^W
                ta.append(dl + lo_); w_ = 2 + hi_ - lo_; tw = w_ if w_ > tw else tw
                X2 = X * X; glo = gl * X2 // x16; ghi = -((-(gl + 1) * X2) // x16)
                xi.append(S - ghi); w_ = ghi - glo; xw = w_ if w_ > xw else xw     # xi = S/2 - g x0^2 in [S - ghi, S - glo] / 2^W
            for wn, Wl, Wd in (('nu', nu, 2), ('g', g, 1), ('tau', ta, tw), ('xi', xi, xw)):
                sabs = sum(map(abs, Wl)); out = []
                for h in range(9):
                    c = sum(map(mul, Wl, Alo[h])); r = sabs * Admax[h] + Wd * Aabs[h]
                    out.append((c - r, c + r))                            # scale 2^(W+EA)
                Nring[wn].append(out)
        S = {}
        sc = F(1, 1 << (W + EA + ER))
        for wn in Nring:
            T_ = [[None] * 9 for _ in range(13)]
            for k in range(13):
                rl = [r[k] for r in s.Rlo]; rh = [r[k] for r in s.Rhi]
                for h in range(9):
                    lo = 0; hi = 0
                    for a, b, (nl, nh) in zip(rl, rh, (N[h] for N in Nring[wn])):
                        lo += a * nl if nl >= 0 else b * nl; hi += b * nh if nh >= 0 else a * nh
                    T_[k][h] = (lo * sc, hi * sc)
            S[wn] = T_
        def imul(c, x): q = [c[0] * x[0], c[0] * x[1], c[1] * x[0], c[1] * x[1]]; return (min(q), max(q))
        def iadd(x, y): return (x[0] + y[0], x[1] + y[1])
        def integ(dct, wn):
            acc_ = (F(0), F(0))
            for (k, kind, n), q in dct.items():
                if kind == 's' and n == 0: continue
                acc_ = iadd(acc_, imul(coef_iv(q), S[wn][k][HK.index((kind, n))]))
            return acc_
        def tailint(dct):
            acc_ = (F(0), F(0))
            for (k, kind, n), q in dct.items():
                if kind == 'c' and n == 0: acc_ = iadd(acc_, imul(coef_iv(q), s.TAIL[k]))
            return acc_
        H = [[None] * 12 for _ in range(12)]
        for i in range(12):
            for j in range(i, 12):
                a = integ(s.G[i][j], 'nu'); b = integ(s.UU[i][j], 'g'); t = tailint(s.G[i][j])
                H[i][j] = H[j][i] = (a[0] - b[1] + t[0], a[1] - b[0] + t[1])
        h = [integ(s.u[i], 'tau') for i in range(12)]
        C = iadd(iadd(integ(s.L2, 'nu'), S['xi'][0][0]), iadd(tailint(s.L2), s.TAIL[0]))
        return C, h, H
