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

