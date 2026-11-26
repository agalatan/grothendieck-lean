#!/usr/bin/env python3
"""Second independent exact pure-stdlib verifier (2x2 Block Schur + Bernstein subdivision + symbolic Q[v,c_2]).

Usage:  python3 -IB verify_bernstein.py [CERT.json] [--quiet] [--generic]

Only the Python standard library is used (bisect, fractions, json, math, pathlib, re, sys, time).
Zero floating-point operations occur anywhere in this file (`float` is never called); `-O`-safe `require(...)`.

Independent of `verify.py` on all Stein rows and on the `4.18e` sixth-moment ray (while sharing
`verify.py`'s outward OU quadrature & rational congruence `build_ou_evaluator` / `build_rotated_H_iv`
and scalar formula checks `verify_downstream` before applying an independent 2x2 block Schur PD test):
  1. OU resolvent 4x4 matrix positivity on V in [0, oo) is certified on the shared rotated enclosures
     by the 2x2 block Schur complement H_11 > 0 and S_22 := H_22 - H_12^T H_11^{-1} H_12 > 0 (instead of
     sequential 1x1 LDL^T pivots).
  2. Univariate polynomial positivity on segments [a, b] and rays [a, oo) is decided by exact integer
     Bernstein coefficients and de Casteljau subdivision (no Sturm chains).
  3. Knot primitives G_1, ..., G_7 at knots u_k are computed independently by the exact trapezoid rule
     and cross-checked against both endpoints of every piece primitive.
  4. The 6x6 block matrix [4 v D_w, V^T; V, T(v)], 3x3 A_0(v), full 5x5 P_s(v), and 4x4 P^{(0)}(r) / P(r)
     are assembled as matrices of Poly objects and checked via generic recursive Laplace det_mat().
  5. On every Damped Level-3 interval [u_k, u_{k+1}] (k = 0 .. K_0 - 1), both V(v) and the post-T(v)
     majorant are built symbolically from the raw Stein brackets (I)-(IV) and (V_eps)-(VII_eps) in
     Q[v, c_2][c_1, rho, alpha_2] and verified coefficient-by-coefficient to equal the certified blocks.
"""
import json
import pathlib
import re
import sys
import time
from fractions import Fraction as Fr
from math import comb, gcd, isqrt

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as V1

DEFAULT_CERT = HERE / 'cert_912.json'
C6 = Fr(4045313, 100000)
S_COVER = Fr(42)
MAX_SUBDIV_DEPTH = 64


class VerificationError(Exception):
    pass


def require(cond, msg='verification condition failed'):
    if not cond:
        raise VerificationError(msg)


def dec_ceil10(q):
    q = Fr(q)
    require(q >= 0, 'dec_ceil10 expects nonnegative Fraction')
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return '%d.%010d' % (n // 10**10, n % 10**10)


# ==============================================================================
# PART 1: INDEPENDENT 2x2 BLOCK SCHUR COMPLEMENT VERIFIER FOR OU RESOLVENT
# ==============================================================================
def iv_add(a, b):
    return (a[0] + b[0], a[1] + b[1])


def iv_sub(a, b):
    return (a[0] - b[1], a[1] - b[0])


def iv_mul(a, b):
    ps = (a[0] * b[0], a[0] * b[1], a[1] * b[0], a[1] * b[1])
    return (min(ps), max(ps))


def iv_sq(a):
    sq_hi = max(a[0] * a[0], a[1] * a[1])
    sq_lo = Fr(0) if (a[0] <= 0 <= a[1]) else min(a[0] * a[0], a[1] * a[1])
    return (sq_lo, sq_hi)


def iv_div_pos(a, b):
    ps = (a[0] / b[0], a[0] / b[1], a[1] / b[0], a[1] / b[1])
    return (min(ps), max(ps))


def certify_block2_schur(H_iv):
    """Certify 4x4 interval symmetric matrix H_iv > 0 via 2x2 block Schur complement:
       H_11 > 0 and S_22 := H_22 - H_12^T H_11^{-1} H_12 > 0."""
    h00, h01, h11 = H_iv[0][0], H_iv[0][1], H_iv[1][1]
    if h00[0] <= 0:
        return False
    det11 = iv_sub(iv_mul(h00, h11), iv_sq(h01))
    if det11[0] <= 0:
        return False

    def quad_adj(c):
        x, y = H_iv[0][c], H_iv[1][c]
        return iv_add(iv_sub(iv_mul(h11, iv_sq(x)), iv_mul((Fr(2), Fr(2)), iv_mul(h01, iv_mul(x, y)))),
                      iv_mul(h00, iv_sq(y)))

    x2, y2 = H_iv[0][2], H_iv[1][2]
    x3, y3 = H_iv[0][3], H_iv[1][3]
    q23 = iv_add(
        iv_sub(iv_mul(h11, iv_mul(x2, x3)), iv_mul(h01, iv_add(iv_mul(x2, y3), iv_mul(y2, x3)))),
        iv_mul(h00, iv_mul(y2, y3)),
    )
    s22 = iv_sub(H_iv[2][2], iv_div_pos(quad_adj(2), det11))
    s33 = iv_sub(H_iv[3][3], iv_div_pos(quad_adj(3), det11))
    s23 = iv_sub(H_iv[2][3], iv_div_pos(q23, det11))
    if s22[0] <= 0 or s33[0] <= 0:
        return False
    return s22[0] * s33[0] > iv_sq(s23)[1]


def verify_ou_resolvent_block2(ou_dict, pi_hi, enclose_fn, v_knots=V1.DEFAULT_V_KNOTS, max_depth=14):
    al_fr = Fr(ou_dict['alpha'])
    ga_S_fr = Fr(ou_dict['gamma_S'])
    ga_A_fr = Fr(ou_dict['gamma_A'])
    slope_claim = Fr(ou_dict['slope_claim'])
    chi_hi = Fr(ou_dict['chi_hi'])
    bound_chi_hi = Fr(ou_dict['bound_at_chi_hi'])

    require(bound_chi_hi > 0, 'bound_at_chi_hi must be positive')
    require(chi_hi > 0, 'chi_hi must be positive')
    require(al_fr > Fr(1, 48), 'alpha must exceed 1/48')
    S_cplx = 3 * al_fr - Fr(1, 16)
    require(S_cplx > 0 and S_cplx <= slope_claim, 'S_cplx exceeds slope_claim')
    require((pi_hi / 4) * ((1 + chi_hi * S_cplx) ** 2) < bound_chi_hi * bound_chi_hi,
            'OU bound at chi_hi exceeds bound_at_chi_hi')

    require(len(v_knots) >= 2 and v_knots[0] == Fr(0) and v_knots[-1] is None, 'v_knots must cover [0, oo)')
    for a_, b_ in zip(v_knots[:-2], v_knots[1:-1]):
        require(isinstance(a_, Fr) and isinstance(b_, Fr) and a_ < b_, 'v_knots must be strictly increasing')
    require(isinstance(v_knots[-2], Fr) and v_knots[-2] > 0, 'penultimate V knot must be positive')

    leaves = 0
    max_d = 0

    def check_cell(Va, Vb, depth=0):
        nonlocal leaves, max_d
        gs_0, gs_c, gs_cc, gs_ss, gd_0, gd_c, gd_cc, gd_ss = enclose_fn(Va, Vb)
        n00 = al_fr / 2 - Fr(1, 96) + (gs_ss[0] - gd_ss[1]) / 18
        n11 = al_fr - Fr(1, 48) + (gs_ss[0] + gd_ss[0]) / 18
        n01_lo = -ga_A_fr / 2 - Fr(1, 64) + gs_ss[0] / 18
        n01_hi = -ga_A_fr / 2 - Fr(1, 64) + gs_ss[1] / 18
        if n00 > 0 and n11 > 0 and n00 * n11 > max(n01_lo * n01_lo, n01_hi * n01_hi):
            H_iv = V1.build_rotated_H_iv((gs_0, gs_c, gs_cc, gd_0, gd_c, gd_cc), al_fr, ga_S_fr, ga_A_fr)
            if certify_block2_schur(H_iv):
                leaves += 1
                if depth > max_d:
                    max_d = depth
                return
        require(Vb is not None and depth < max_depth, f'OU Block2-Schur check failed on [{Va}, {Vb}] at depth {depth}')
        Vm = (Va + Vb) / 2
        check_cell(Va, Vm, depth + 1)
        check_cell(Vm, Vb, depth + 1)

    for Va, Vb in zip(v_knots[:-1], v_knots[1:]):
        check_cell(Va, Vb, 0)
    return dict(S_cplx=S_cplx, chi_hi=chi_hi, bound_at_chi_hi=bound_chi_hi, leaves=leaves, max_depth=max_d)


# ==============================================================================
# PART 2: BERNSTEIN + LAPLACE DET_MAT + SYMBOLIC Q[v, c_2] STEIN VERIFIER
# ==============================================================================
class Poly:
    __slots__ = ('c',)

    def __init__(self, coeffs=()):
        c = [Fr(x) for x in coeffs]
        while c and c[-1] == 0:
            c.pop()
        self.c = c

    @staticmethod
    def wrap(x):
        return x if isinstance(x, Poly) else Poly([x])

    def __add__(self, other):
        o = Poly.wrap(other)
        m = max(len(self.c), len(o.c))
        return Poly([(self.c[i] if i < len(self.c) else Fr(0)) + (o.c[i] if i < len(o.c) else Fr(0)) for i in range(m)])
    __radd__ = __add__

    def __neg__(self):
        return Poly([-x for x in self.c])

    def __sub__(self, other):
        return self + (-Poly.wrap(other))

    def __rsub__(self, other):
        return Poly.wrap(other) + (-self)

    def __mul__(self, other):
        o = Poly.wrap(other)
        if not self.c or not o.c:
            return Poly()
        out = [Fr(0)] * (len(self.c) + len(o.c) - 1)
        for i, a in enumerate(self.c):
            if a:
                for j, b in enumerate(o.c):
                    out[i + j] += a * b
        return Poly(out)
    __rmul__ = __mul__

    def __call__(self, x):
        acc = Fr(0)
        for coef in reversed(self.c):
            acc = acc * x + coef
        return acc

    def integral_from(self, u0, val_u0):
        q = Poly([Fr(0)] + [coef / (i + 1) for i, coef in enumerate(self.c)])
        return q + (val_u0 - q(u0))

    def in_r2(self):
        out = []
        for coef in self.c:
            out.extend([coef, Fr(0)])
        return Poly(out)

    def shift_scale(self, a, w):
        res = Poly()
        lin = Poly([a, w])
        for coef in reversed(self.c):
            res = res * lin + coef
        return res

    def div_xk(self, k):
        require(all(i >= len(self.c) or self.c[i] == 0 for i in range(k)), f'not divisible by x^{k}')
        return Poly(self.c[k:])


V_VAR = Poly([Fr(0), Fr(1)])
R_VAR = Poly([Fr(0), Fr(1)])


def biv_add(A, B):
    m = max(len(A), len(B))
    return [(A[i] if i < len(A) else Poly()) + (B[i] if i < len(B) else Poly()) for i in range(m)]


def biv_sub(A, B):
    m = max(len(A), len(B))
    return [(A[i] if i < len(A) else Poly()) - (B[i] if i < len(B) else Poly()) for i in range(m)]


def biv_mul(A, B):
    if not A or not B:
        return []
    out = [Poly() for _ in range(len(A) + len(B) - 1)]
    for i, a in enumerate(A):
        if a.c:
            for j, b in enumerate(B):
                if b.c:
                    out[i + j] = out[i + j] + a * b
    return out


def biv_eq(A, B):
    m = max(len(A), len(B))
    return all((A[i].c if i < len(A) else []) == (B[i].c if i < len(B) else []) for i in range(m))


def det_mat(M):
    m = len(M)
    if m == 1:
        return M[0][0]
    if m == 2:
        return M[0][0] * M[1][1] - M[0][1] * M[1][0]
    acc = Poly()
    for col in range(m):
        entry = M[0][col]
        if not entry.c:
            continue
        minor = [[M[r][c] for c in range(m) if c != col] for r in range(1, m)]
        term = entry * det_mat(minor)
        acc = acc + term if col % 2 == 0 else acc - term
    return acc


def _clear_denoms(fracs):
    den = 1
    for x in fracs:
        den = den * x.denominator // gcd(den, x.denominator)
    return [int(x * den) for x in fracs]


def _bernstein_all_pos(bern, stats):
    n = len(bern) - 1
    stack = [(bern, 0)]
    while stack:
        b, depth = stack.pop()
        if min(b) > 0:
            stats['leaves'] += 1
            if depth > stats['max_depth']:
                stats['max_depth'] = depth
            continue
        if b[0] <= 0 or b[-1] <= 0 or depth >= MAX_SUBDIV_DEPTH:
            return False
        tri = [b]
        for _ in range(n):
            prev = tri[-1]
            tri.append([prev[i] + prev[i + 1] for i in range(len(prev) - 1)])
        left = [tri[k][0] << (n - k) for k in range(n + 1)]
        right = [tri[n - j][j] << j for j in range(n + 1)]
        stack.append((left, depth + 1))
        stack.append((right, depth + 1))
    return True


def pos_on_segment(p, a, b, stats):
    q = p.shift_scale(a, b - a).c
    if not q:
        return False
    n = len(q) - 1
    A = _clear_denoms(q)
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    bern = [sum(comb(i, j) * (M // comb(n, j)) * A[j] for j in range(i + 1)) for i in range(n + 1)]
    return _bernstein_all_pos(bern, stats)


def pos_on_ray(p, a, stats):
    q = p.shift_scale(a, Fr(1)).c
    if not q:
        return False
    n = len(q) - 1
    A = _clear_denoms(q)
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    bern = [A[i] * (M // comb(n, i)) for i in range(n + 1)]
    return _bernstein_all_pos(bern, stats)


def check_pos(p, lo, hi, stats):
    return pos_on_ray(p, lo, stats) if hi is None else pos_on_segment(p, lo, hi, stats)


class LinForm:
    __slots__ = ('v',)

    def __init__(self, v):
        self.v = tuple(Fr(x) for x in v)

    def __add__(self, o):
        return LinForm([a + b for a, b in zip(self.v, o.v)])

    def __sub__(self, o):
        return LinForm([a - b for a, b in zip(self.v, o.v)])

    def __mul__(self, k):
        return LinForm([a * Fr(k) for a in self.v])
    __rmul__ = __mul__


N_F, H_F, B_F, Y_F, Z_F = (LinForm([1 if i == j else 0 for j in range(5)]) for i in range(5))
S_NORM = 32 * N_F + 8 * H_F + 32 * B_F + 96 * Y_F
VAR_C2 = 16 * N_F + 4 * H_F
VAR_S = 80 * N_F + 20 * H_F + 16 * B_F + 96 * Y_F + 32 * Z_F
VAR_C1 = 32 * N_F + 16 * H_F + 16 * B_F + 48 * Y_F + 16 * Z_F
CROSS_2_C2_C1 = VAR_S - VAR_C2 - VAR_C1
E_ABS_A2 = 32 * B_F + 24 * Y_F
E_VRHO = 32 * B_F + 48 * Y_F
E_W = 24 * Y_F
JOINT_S0 = 8 * N_F + 2 * H_F + 8 * B_F + 8 * Z_F
JOINT_H0 = Fr(8, 3) * N_F + Fr(2, 3) * H_F + Fr(8, 3) * B_F + 24 * Y_F - Fr(16, 3) * Z_F
M_GRAM = N_F + B_F + 3 * Y_F - Z_F
T_GRAM = 3 * Y_F - Z_F
P_BOX = (Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64))


def get_cut_form(kind, theta):
    base = {'n': N_F, 'h': H_F, 'b': B_F, 'y': Y_F, 'z': Z_F,
            'bn': N_F - B_F, 'yz': Z_F - Y_F, 'h0': JOINT_H0, 'm': M_GRAM}
    if kind in base:
        require(theta is None, 'unexpected theta')
        return base[kind]
    require(theta is not None and theta > 0, 'theta must be > 0')
    if kind == 'c1':
        return theta * N_F + (Fr(1) / theta) * H_F - 2 * Z_F
    if kind == 'c2+':
        return theta * H_F + (Fr(1) / theta) * M_GRAM - 2 * T_GRAM
    if kind == 'c2-':
        return theta * H_F + (Fr(1) / theta) * M_GRAM + 2 * T_GRAM
    raise VerificationError('unknown cut: ' + repr(kind))


def verify_row_bernstein(row):
    e = [Fr(x) for x in row['knots']]
    K = len(e) - 1
    require(K >= 1 and e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), 'knots invalid')
    u = [x * x for x in e]
    require(isinstance(row['knot_den'], int) and row['knot_den'] > 0, 'knot_den invalid')
    kden = Fr(row['knot_den'])

    def get_arr(nm, exp_len):
        raw = row[nm]
        require(len(raw) == exp_len and all(isinstance(x, int) for x in raw), 'bad array ' + nm)
        return [Fr(x, kden) for x in raw]

    arr = {}
    for nm in ('phi1', 'phi2', 'phi3', 'phi4', 'psi_a', 'xi2', 'xi1', 'xia'):
        arr[nm] = get_arr(nm, K + 1)

    lam = [Fr(x) for x in row['lam']]
    slope = [Fr(x) for x in row['slope']]
    l3 = [Fr(x) for x in row['l3']]
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu_a, mu_rho, mu_w, sig = Fr(row['mu_a']), Fr(row['mu_rho']), Fr(row['mu_w']), Fr(row['sigma'])

    require(len(lam) == 3 and len(slope) == 2 and len(l3) == 3, 'vector lengths')
    require(all(x >= 0 for x in l3) and sum(l3) > 0, 'l3')
    lam3 = sum(l3)
    require(m00 >= 0 and m11 > 0 and m00 * m11 - m01 * m01 >= 0, 'M_ker')
    require(mu_a >= 0 and mu_rho > 0 and mu_w > 0, 'mu signs')

    use_3d = ('K0' in row)
    if use_3d:
        K0 = int(row['K0'])
        require(1 <= K0 < K, 'K0 range')
        M0 = K0 + 1
        eps = Fr(row['eps'])
        require(eps > 0, 'eps > 0')
        inv_e = Fr(1) / eps
        inv_e2, inv_e3 = inv_e * inv_e, inv_e * inv_e * inv_e
        c_1pe, c_1p2e = 1 + eps, 1 + 2 * eps
        c_1pe2 = c_1pe * c_1pe
        h5_0 = Fr(row['h5_0'])
        for nm in ('phi5', 'phi6', 'phi7'):
            arr[nm] = get_arr(nm, K0) + [Fr(0)]
        for nm in ('dw', 'dal', 'qs', 'trt1', 'trt2', 'a0_11', 'ps_11', 'ps_13', 'ps_23',
                   'a1_0', 'a1_1', 'a1_2', 'b1_0', 'b1_1', 'b1_2'):
            arr[nm] = get_arr(nm, M0)
        raw_tv = row['tv']
        require(isinstance(raw_tv, list) and len(raw_tv) == 15, 'bad tv list')
        for idx_t, sub_arr in enumerate(raw_tv):
            require(len(sub_arr) == M0 and all(isinstance(x, int) for x in sub_arr), f'bad tv[{idx_t}]')
            arr[f'tv_{idx_t}'] = [Fr(x, kden) for x in sub_arr]
    else:
        K0 = 0

    for k in range(K + 1):
        require(arr['xi2'][k] >= 0 and arr['xi1'][k] >= 0, f'xi nonneg {k}')
        require(arr['xia'][k] ** 2 <= 4 * arr['xi1'][k] * arr['xi2'][k], f'xi SOC {k}')
        require(arr['psi_a'][k] >= 0, f'psi_a {k}')
        if k >= K0:
            require(arr['psi_a'][k] + mu_a - arr['phi4'][k] >= 0, f'pa_rhs {k}')
            require(m00 - arr['phi3'][k] > 0, f'D1 {k}')
            require(m11 * (m00 - arr['phi3'][k]) - (m01 - Fr(1, 2) * arr['psi_a'][k]) ** 2 > 0, f'D2 {k}')
    if use_3d:
        for k in range(K0 + 1):
            require(0 < arr['dw'][k] <= mu_w, f'dw {k}')
            require(arr['psi_a'][k] + mu_a - arr['phi4'][k] - arr['dal'][k] >= 0, f'th_rho {k}')
            require(arr['trt1'][k] > 0 and arr['trt2'][k] > 0, f'trt {k}')
            require(arr['a1_0'][k] >= 0 and arr['a1_2'][k] >= 0 and arr['a1_1'][k] ** 2 <= arr['a1_0'][k] * arr['a1_2'][k], f'A1 {k}')
            require(arr['b1_0'][k] >= 0 and arr['b1_2'][k] >= 0 and arr['b1_1'][k] ** 2 <= arr['b1_0'][k] * arr['b1_2'][k], f'B1 {k}')
            Tk_mat = [[Poly([arr[f'tv_{max(a, b) * (max(a, b) + 1) // 2 + min(a, b)}'][k]]) for b in range(5)] for a in range(5)]
            for m_sz in range(1, 6):
                require(det_mat([r[:m_sz] for r in Tk_mat[:m_sz]])(0) > 0, f'T knot {k} minor {m_sz}')

    G_knots = [[Fr(0)] * (K + 1) for _ in range(4)]
    for k in range(K):
        du = u[k + 1] - u[k]
        for idx, nm in enumerate(('phi1', 'phi2', 'phi3', 'phi4')):
            sl_add = slope[idx] if idx in (0, 1) else Fr(0)
            G_knots[idx][k + 1] = G_knots[idx][k] + Fr(1, 2) * (arr[nm][k] + sl_add * u[k] + arr[nm][k + 1] + sl_add * u[k + 1]) * du
    if use_3d:
        G_3d = [[Fr(0)] * (K0 + 1) for _ in range(3)]
        for k in range(K0):
            du = u[k + 1] - u[k]
            for idx, nm in enumerate(('phi5', 'phi6', 'phi7')):
                G_3d[idx][k + 1] = G_3d[idx][k] + Fr(1, 2) * (arr[nm][k] + arr[nm][k + 1]) * du
        require(h5_0 + G_3d[0][K0] == 0 and G_3d[1][K0] == 0 and G_3d[2][K0] == 0, 'trapezoid compact support failed')
        C2_B = [Poly(), Poly([Fr(1)])]
        C2_M1 = [Poly([Fr(-1)]), Poly([Fr(1)])]
        C2_M1_2 = biv_mul(C2_M1, C2_M1)
        D_B = [Poly([Fr(1)]), Poly([eps])]
        D2_B = biv_mul(D_B, D_B)
        D3_B = biv_mul(D2_B, D_B)
        D4_B = biv_mul(D2_B, D2_B)
        DM1_B = [Poly(), Poly([eps])]

    stats = dict(leaves=0, max_depth=0)
    lam_poly = Poly([lam[0] + m00 + 4 * m01 + 4 * m11, lam[1], lam[2], lam3])

    for k in range(K + 1):
        tail = (k == K)
        u0 = u[k]
        u1 = None if tail else u[k + 1]
        r_lo = e[k]
        r_hi = None if tail else e[k + 1]

        if tail:
            pc = lambda nm: Poly([arr[nm][K]])
        else:
            def pc(nm, k=k, u0=u0, u1=u1):
                a0, a1 = arr[nm][k], arr[nm][k + 1]
                sl = (a1 - a0) / (u1 - u0)
                return Poly([a0 - sl * u0, sl])

        p1 = pc('phi1') + slope[0] * V_VAR
        p2 = pc('phi2') + slope[1] * V_VAR
        p3, p4 = pc('phi3'), pc('phi4')
        psa = pc('psi_a')
        x2p, x1p, xap = pc('xi2'), pc('xi1'), pc('xia')

        g1 = p1.integral_from(u0, G_knots[0][k])
        g2 = p2.integral_from(u0, G_knots[1][k])
        g3 = p3.integral_from(u0, G_knots[2][k])
        g4 = p4.integral_from(u0, G_knots[3][k])
        if not tail:
            require(g1(u1) == G_knots[0][k + 1] and g2(u1) == G_knots[1][k + 1], 'trap 1,2')
            require(g3(u1) == G_knots[2][k + 1] and g4(u1) == G_knots[3][k + 1], 'trap 3,4')

        vY1, vY2, vY3, vY4 = V_VAR * p1 - g1, V_VAR * p2 - g2, V_VAR * p3 - g3, V_VAR * p4 - g4
        M12 = Poly([m01]) - Fr(1, 2) * psa
        b2_v = Fr(1, 2) * (Poly([-2 * m01 - 4 * m11]) - Fr(1, 2) * p2 - x1p)
        q1_base = lam_poly + g1 + g2 - g3

        if k >= K0:
            M11 = Poly([m00]) - p3
            M33 = Poly([mu_rho + mu_a]) + psa - p4
            if k == 0:
                g34_d = (g3 + g4).div_xk(1)
                tau_w = Fr(1) / (4 * mu_w) * V_VAR * g34_d * g34_d
                Y1, Y2, Y3, Y4 = vY1.div_xk(1), vY2.div_xk(1), vY3.div_xk(1), vY4.div_xk(1)
                M13 = Fr(-1, 2) * (Y3 + Y4)
                b1 = Fr(1, 2) * (p3 + g3 - p1 - Poly([2 * m00 + 4 * m01]) - tau_w - x2p)
                b3 = Fr(1, 2) * (sig * V_VAR + Y3 + g4 - Y1 - Fr(1, 2) * Y2 - xap)
                P_mat = [
                    [M11.in_r2(), M12.in_r2(), M13.in_r2(), b1.in_r2()],
                    [M12.in_r2(), Poly([m11]), Poly(), b2_v.in_r2()],
                    [M13.in_r2(), Poly(), M33.in_r2(), b3.in_r2()],
                    [b1.in_r2(), b2_v.in_r2(), b3.in_r2(), q1_base.in_r2() - R_VAR],
                ]
                for m_sz in (2, 3, 4):
                    require(check_pos(det_mat([r[:m_sz] for r in P_mat[:m_sz]]), r_lo, r_hi, stats), f'L2 minor {m_sz} k=0')
            else:
                vM13 = Fr(-1, 2) * (vY3 + vY4)
                v_tau = Fr(1) / (4 * mu_w) * (g3 + g4) * (g3 + g4)
                vb1 = Fr(1, 2) * (V_VAR * (p3 + g3 - p1 - Poly([2 * m00 + 4 * m01]) - x2p) - v_tau)
                vb3 = Fr(1, 2) * (V_VAR * (sig * V_VAR + g4) + vY3 - vY1 - Fr(1, 2) * vY2 - V_VAR * xap)
                R2 = Poly([Fr(0), Fr(0), Fr(1)])
                R4 = R2 * R2
                P_mat = [
                    [M11.in_r2(), M12.in_r2(), vM13.in_r2(), vb1.in_r2()],
                    [M12.in_r2(), Poly([m11]), Poly(), (V_VAR * b2_v).in_r2()],
                    [vM13.in_r2(), Poly(), (V_VAR * V_VAR * M33).in_r2(), (V_VAR * vb3).in_r2()],
                    [vb1.in_r2(), (V_VAR * b2_v).in_r2(), (V_VAR * vb3).in_r2(), R4 * q1_base.in_r2() - R4 * R_VAR],
                ]
                for m_sz in (2, 3, 4):
                    mp = det_mat([r[:m_sz] for r in P_mat[:m_sz]])
                    if m_sz == 4:
                        mp = mp.div_xk(2)
                    require(check_pos(mp, r_lo, r_hi, stats), f'L2 minor {m_sz} k={k}')
        else:
            p5, p6, p7 = pc('phi5'), pc('phi6'), pc('phi7')
            g5 = p5.integral_from(u0, G_3d[0][k])
            g6 = p6.integral_from(u0, G_3d[1][k])
            g7 = p7.integral_from(u0, G_3d[2][k])
            require(g5(u1) == G_3d[0][k + 1] and g6(u1) == G_3d[1][k + 1] and g7(u1) == G_3d[2][k + 1], 'trap 5,6,7')
            h5 = Poly([h5_0]) + g5
            Dw = pc('dw')
            require(check_pos(Poly([mu_w]) - h5 - Dw, u0, u1, stats), f'Dw margin k={k}')

            vY6, vY7 = V_VAR * p6 - g6, V_VAR * p7 - g7
            dal_p, qs_p = pc('dal'), pc('qs')
            trt1_p, trt2_p = pc('trt1'), pc('trt2')
            a0_11_p, ps_11_p, ps_13_p, ps_23_p = pc('a0_11'), pc('ps_11'), pc('ps_13'), pc('ps_23')
            a1_0p, a1_1p, a1_2p = pc('a1_0'), pc('a1_1'), pc('a1_2')
            b1_0p, b1_1p, b1_2p = pc('b1_0'), pc('b1_1'), pc('b1_2')
            T_p = [[pc(f'tv_{max(a, b) * (max(a, b) + 1) // 2 + min(a, b)}') for b in range(5)] for a in range(5)]

            vp5 = V_VAR * p5
            V_list = [
                g3 + g4 + inv_e * (vp5 + g6 + g7),
                -inv_e * vp5 - V_VAR * h5 - (c_1pe * inv_e) * g7,
                -(c_1pe2 * inv_e) * g6,
                vp5,
                c_1pe * g7,
            ]
            if k == 0:
                Vb = [Vp.div_xk(1) for Vp in V_list]
                M6_mat = [[4 * Dw] + [V_VAR * Vb[b] for b in range(5)]] + [
                    [Vb[a]] + [T_p[a][b] for b in range(5)] for a in range(5)
                ]
            else:
                M6_mat = [[4 * V_VAR * Dw] + [V_list[b] for b in range(5)]] + [
                    [V_list[a]] + [T_p[a][b] for b in range(5)] for a in range(5)
                ]
            require(check_pos(det_mat(M6_mat), u0, u1, stats), f'M6 det k={k}')

            A0_00 = dal_p - inv_e * p7
            A0_01 = Fr(1, 2) * (c_1pe * inv_e * p7 - a1_0p - inv_e * T_p[3][3])
            A0_11 = a0_11_p
            A0_02 = Fr(1, 2) * (inv_e * (T_p[3][3] - 2 * T_p[3][4]) + a1_0p - a0_11_p - 2 * a1_1p)
            A0_12 = Fr(1, 2) * (inv_e * (2 * T_p[3][4] - T_p[4][4]) + 2 * a1_1p - a1_2p)
            A0_22 = inv_e * T_p[4][4] + a1_2p
            A0_mat = [[A0_00, A0_01, A0_02], [A0_01, A0_11, A0_12], [A0_02, A0_12, A0_22]]
            for m_sz in (1, 2, 3):
                require(check_pos(det_mat([r[:m_sz] for r in A0_mat[:m_sz]]), u0, u1, stats), f'A0 minor {m_sz} k={k}')

            P_00 = qs_p - c_1pe2 * inv_e3 * p6 - c_1p2e * inv_e2 * g6 - 2 * inv_e * T_p[0][1]
            P_01 = Fr(1, 2) * (c_1pe2 * inv_e3 * p6 + c_1pe2 * inv_e2 * g6 - b1_0p + inv_e * (2 * T_p[0][1] - T_p[1][1] - 2 * T_p[0][2]))
            P_11 = ps_11_p
            P_02 = Fr(1, 2) * (inv_e * (T_p[1][1] + 2 * T_p[0][2] - 2 * T_p[1][2]) + b1_0p - ps_11_p - 2 * b1_1p)
            P_12 = Fr(1, 2) * (inv_e * (2 * T_p[1][2] - T_p[2][2]) + 2 * b1_1p - b1_2p)
            P_22 = inv_e * T_p[2][2] + b1_2p
            U4_0 = inv_e * (T_p[0][4] + T_p[1][3] - T_p[1][4] - T_p[2][3]) - ps_13_p
            U4_1 = inv_e * (T_p[1][4] + T_p[2][3] - T_p[2][4]) - ps_23_p
            U4_2 = inv_e * T_p[2][4]
            if k == 0:
                Y6, Y7 = vY6.div_xk(1), vY7.div_xk(1)
                U3_0 = Fr(-1, 2) * (c_1pe2 * inv_e2 * Y6 + c_1pe * inv_e2 * Y7 + c_1pe * inv_e * g7) + inv_e * (T_p[0][3] - T_p[0][4] - T_p[1][3])
                U3_1, U3_2 = ps_13_p, ps_23_p
                P33 = trt1_p
            else:
                U3_0 = Fr(-1, 2) * (c_1pe2 * inv_e2 * vY6 + c_1pe * inv_e2 * vY7 + V_VAR * c_1pe * inv_e * g7) + V_VAR * inv_e * (T_p[0][3] - T_p[0][4] - T_p[1][3])
                U3_1, U3_2 = V_VAR * ps_13_p, V_VAR * ps_23_p
                P33 = V_VAR * V_VAR * trt1_p

            Ps5_mat = [
                [P_00, P_01, P_02, U3_0, U4_0],
                [P_01, P_11, P_12, U3_1, U4_1],
                [P_02, P_12, P_22, U3_2, U4_2],
                [U3_0, U3_1, U3_2, P33, Poly()],
                [U4_0, U4_1, U4_2, Poly(), trt2_p],
            ]
            for m_sz in (1, 2, 3, 4, 5):
                require(check_pos(det_mat([r[:m_sz] for r in Ps5_mat[:m_sz]]), u0, u1, stats), f'Ps5 minor {m_sz} k={k}')

            M11 = Poly([m00]) - p3 - inv_e * p6
            M33 = Poly([mu_rho + mu_a]) + psa - p4 - dal_p - trt1_p - trt2_p
            q1_rem = q1_base - qs_p
            b1 = Fr(1, 2) * (p3 + g3 + c_1p2e * inv_e2 * p6 + inv_e * g6 - p1 - Poly([2 * m00 + 4 * m01]) - x2p - T_p[0][0])

            if k == 0:
                Y1, Y2, Y3, Y4 = vY1.div_xk(1), vY2.div_xk(1), vY3.div_xk(1), vY4.div_xk(1)
                M13 = Fr(-1, 2) * (Y3 + Y4 + inv_e * (Y6 + Y7))
                b3 = Fr(1, 2) * (sig * V_VAR + Y3 + g4 + c_1p2e * inv_e2 * Y6 + c_1pe * inv_e2 * Y7 + inv_e * g7 - Y1 - Fr(1, 2) * Y2 - xap - 2 * inv_e * T_p[0][3])
                P0_mat = [
                    [M11.in_r2(), M12.in_r2(), M13.in_r2(), b1.in_r2()],
                    [M12.in_r2(), Poly([m11]), Poly(), b2_v.in_r2()],
                    [M13.in_r2(), Poly(), M33.in_r2(), b3.in_r2()],
                    [b1.in_r2(), b2_v.in_r2(), b3.in_r2(), q1_rem.in_r2() - R_VAR],
                ]
            else:
                vM13 = Fr(-1, 2) * (vY3 + vY4 + inv_e * (vY6 + vY7))
                vb3 = Fr(1, 2) * (V_VAR * (sig * V_VAR + g4 + inv_e * g7 - xap - 2 * inv_e * T_p[0][3]) + vY3 + c_1p2e * inv_e2 * vY6 + c_1pe * inv_e2 * vY7 - vY1 - Fr(1, 2) * vY2)
                P0_mat = [
                    [M11.in_r2(), M12.in_r2(), vM13.in_r2(), b1.in_r2()],
                    [M12.in_r2(), Poly([m11]), Poly(), b2_v.in_r2()],
                    [vM13.in_r2(), Poly(), (V_VAR * V_VAR * M33).in_r2(), vb3.in_r2()],
                    [b1.in_r2(), b2_v.in_r2(), vb3.in_r2(), q1_rem.in_r2() - R_VAR],
                ]
            for m_sz in (2, 3, 4):
                require(check_pos(det_mat([r[:m_sz] for r in P0_mat[:m_sz]]), r_lo, r_hi, stats), f'P0 minor {m_sz} k={k}')

            # Algebraically independent symbolic raw-bracket identity checks in Q[v, c_2]:
            lhs_vb0 = biv_add(biv_mul([V_list[0]], D2_B), biv_add(biv_mul([V_list[1]], D_B), [V_list[2]]))
            rhs_vb0 = biv_add(
                biv_mul([g3 + g4], D2_B),
                biv_add(
                    biv_mul([-V_VAR * h5, V_VAR * p5], D_B),
                    biv_add(biv_mul([inv_e * g6], biv_sub(D2_B, [Poly([c_1pe2])])), biv_mul([g7], biv_mul(D_B, C2_M1))),
                ),
            )
            require(biv_eq(lhs_vb0, rhs_vb0), f'raw V_list[0..2] mismatch k={k}')
            lhs_vb1 = biv_add(biv_mul([V_list[3]], D_B), [V_list[4]])
            rhs_vb1 = biv_add(biv_mul([V_VAR * p5], D_B), [c_1pe * g7])
            require(biv_eq(lhs_vb1, rhs_vb1), f'raw V_list[3..4] mismatch k={k}')

            T_bot_D2 = biv_add(biv_mul([T_p[3][3]], D2_B), biv_add(biv_mul([2 * T_p[3][4]], D_B), [T_p[4][4]]))
            T_top_D4 = biv_add(
                biv_mul([T_p[0][0]], D4_B),
                biv_add(biv_mul([2 * T_p[0][1]], D3_B), biv_add(biv_mul([T_p[1][1] + 2 * T_p[0][2]], D2_B),
                        biv_add(biv_mul([2 * T_p[1][2]], D_B), [T_p[2][2]]))),
            )
            T_cr_D3 = biv_add(
                biv_mul([T_p[0][3]], D3_B),
                biv_add(biv_mul([T_p[1][3] + T_p[0][4]], D2_B), biv_add(biv_mul([T_p[2][3] + T_p[1][4]], D_B), [T_p[2][4]])),
            )

            raw_al2 = biv_sub(biv_sub(biv_mul([Poly([mu_a]) - p4], D4_B), biv_mul([p7], biv_mul(D3_B, C2_M1))), biv_mul(C2_B, T_bot_D2))
            A0_D4 = biv_add(biv_mul([A0_00], D4_B), biv_add(biv_mul([2 * A0_01], D3_B),
                            biv_add(biv_mul([A0_11 + 2 * A0_02], D2_B), biv_add(biv_mul([2 * A0_12], D_B), [A0_22]))))
            A1_D2 = biv_add(biv_mul([a1_0p], D2_B), biv_add(biv_mul([2 * a1_1p], D_B), [a1_2p]))
            th_al = psa + Poly([mu_a]) - p4 - dal_p
            blk_al2 = biv_sub(biv_add(biv_add(A0_D4, biv_mul(DM1_B, A1_D2)), biv_mul([th_al], D4_B)), biv_mul([psa], D4_B))
            require(biv_eq(raw_al2, blk_al2), f'raw alpha_2 channel mismatch k={k}')

            raw_rho2 = biv_add(biv_sub(biv_mul([Poly([mu_rho])], D4_B), biv_mul(C2_B, T_bot_D2)), biv_mul(C2_B, T_bot_D2))
            blk_rho2 = biv_add(
                biv_mul([M33 - th_al], D4_B),
                biv_add(biv_mul([trt1_p], D2_B), biv_add([trt2_p], biv_add(biv_mul([trt1_p], biv_sub(D4_B, D2_B)),
                        biv_mul([trt2_p], biv_sub(D4_B, [Poly([Fr(1)])]))))),
            )
            require(biv_eq(raw_rho2, blk_rho2), f'raw rho^2 channel mismatch k={k}')

            if k == 0:
                vU3_0, vU3_1, vU3_2 = V_VAR * U3_0, V_VAR * U3_1, V_VAR * U3_2
                vM13_chk, vb3_chk = V_VAR * M13, V_VAR * b3
            else:
                vU3_0, vU3_1, vU3_2 = U3_0, U3_1, U3_2
                vM13_chk, vb3_chk = vM13, vb3
            raw_vrho = biv_sub(
                biv_sub(
                    biv_mul([V_VAR * (sig * V_VAR - xap) - vY1 - Fr(1, 2) * vY2], D4_B),
                    biv_add(biv_mul([vY3], biv_mul(D4_B, C2_M1)), biv_add(biv_mul([-V_VAR * g4, vY4], D4_B),
                            biv_add(biv_mul([vY6], biv_mul(D3_B, C2_M1_2)), biv_mul([-V_VAR * g7, vY7], biv_mul(D3_B, C2_M1))))),
                ),
                biv_mul([2 * V_VAR], biv_mul(C2_B, T_cr_D3)),
            )
            vU3_D2 = biv_add(biv_mul([vU3_0], D2_B), biv_add(biv_mul([vU3_1], D_B), [vU3_2]))
            vU4_D2 = biv_add(biv_mul([V_VAR * U4_0], D2_B), biv_add(biv_mul([V_VAR * U4_1], D_B), [V_VAR * U4_2]))
            blk_vrho = biv_add(biv_mul([Poly([Fr(2)])], biv_add(biv_mul(D_B, vU3_D2), vU4_D2)),
                               biv_mul([Poly([Fr(2)])], biv_mul(D4_B, [vb3_chk, vM13_chk])))
            require(biv_eq(raw_vrho, blk_vrho), f'raw rho channel mismatch k={k}')

            raw_c1 = [Poly([-2 * m01 - 4 * m11]) - Fr(1, 2) * p2 - x1p, Poly([2 * m01])]
            blk_c1 = [2 * b2_v, psa + 2 * M12]
            require(biv_eq(raw_c1, blk_c1), f'raw c_1 channel mismatch k={k}')

            base_c2 = [
                Poly([lam[0] + m00 + 4 * m01 + 4 * m11, lam[1], lam[2], lam3]) + g1 + g2 - g3,
                Poly([-2 * m00 - 4 * m01]) - x2p - p1 + p3 + g3,
                Poly([m00]) - p3,
            ]
            raw_1 = biv_sub(biv_sub(biv_mul(base_c2, D4_B), biv_mul([-g6, p6], biv_mul(D3_B, C2_M1_2))), biv_mul(C2_B, T_top_D4))
            Ps_top_D4 = biv_add(biv_mul([P_00], D4_B), biv_add(biv_mul([2 * P_01], D3_B),
                                biv_add(biv_mul([P_11 + 2 * P_02], D2_B), biv_add(biv_mul([2 * P_12], D_B), [P_22]))))
            B1_D2 = biv_add(biv_mul([b1_0p], D2_B), biv_add(biv_mul([2 * b1_1p], D_B), [b1_2p]))
            blk_1 = biv_add(biv_add(Ps_top_D4, biv_mul(DM1_B, B1_D2)), biv_mul([q1_rem, 2 * b1, M11], D4_B))
            require(biv_eq(raw_1, blk_1), f'raw constant/c_2 channel mismatch k={k}')

    d_lin_form = (m00 * VAR_C2 + m01 * CROSS_2_C2_C1 + m11 * VAR_C1
                  + (mu_a + mu_rho) * E_ABS_A2 + mu_w * E_W + sig * E_VRHO)
    bounds = {}
    for end in ('lo', 'hi'):
        s_e = Fr(row['s_' + end])
        if s_e == 0:
            bounds[end] = lam[0] + lam[1] + 2 * lam[2] + 6 * lam3
            continue
        pd = row['par'][end]
        al = [Fr(x) for x in pd['alpha']]
        require(len(al) == 2 and all(x > 0 for x in al), 'alpha > 0')
        sb = Fr(pd['sqrt_ub'])
        require(sb > 0 and sb * sb >= s_e, 'sqrt_ub')
        dJ_form = (l3[1] * (150 * al[0] * JOINT_S0 + (198 + Fr(150) / al[0]) * JOINT_H0)
                   + l3[2] * (Fr(135, 2) * al[1] * JOINT_S0 + (Fr(11781, 32) + Fr(135, 2) / al[1]) * JOINT_H0))
        c_form = d_lin_form + sb * dJ_form
        eta = Fr(pd['eta'])
        rem_form = c_form - eta * S_NORM
        for kind, th_str, mult_str in pd['cuts']:
            mult = Fr(mult_str)
            require(mult >= 0, 'cut mult >= 0')
            rem_form = rem_form + mult * get_cut_form(kind, None if th_str is None else Fr(th_str))
        L = eta + sum(max(rem_form.v[i], Fr(0)) * P_BOX[i] for i in range(5))
        bounds[end] = (lam[0] + lam[1] + lam[2] * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
                       + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L)

    return dict(bound=max(bounds.values()), bounds=bounds, K=K, stats=stats, level=('3d' if use_3d else '2'))


def verify_certificate_dict_bernstein(cert, generic=False, quiet=False, enclose_fn=None, foundations=None):
    require(isinstance(cert, dict), 'certificate must be a JSON object')
    claim = Fr(cert['claim'])
    require(claim > 0, 'claim must be strictly positive')

    if foundations is None:
        pi_lo, pi_hi = V1.verify_ou_foundations()
    else:
        pi_lo, pi_hi = foundations
    if enclose_fn is None:
        enclose_fn = V1.build_ou_evaluator(pi_lo, pi_hi)

    require('ou_resolvent' in cert and isinstance(cert['ou_resolvent'], dict), 'missing ou_resolvent')
    ou_dict = cert['ou_resolvent']
    chi_hi_hdr = Fr(ou_dict['chi_hi'])
    slope_hdr = Fr(ou_dict['slope_claim'])
    bound_hdr = Fr(ou_dict['bound_at_chi_hi'])
    require(chi_hi_hdr > 0 and slope_hdr > 0 and bound_hdr > 0, 'OU header fields must be strictly positive')
    require(bound_hdr < claim, 'OU bound_at_chi_hi >= claim')

    rows = cert['rows']
    require(isinstance(rows, list) and len(rows) >= 1, 'no rows')
    sharp_hi_s = Fr(cert['sharp_hi_s']) if 'sharp_hi_s' in cert else None
    sh_cap = None
    if sharp_hi_s is not None or 'sharp_hi_claim' in cert:
        require(sharp_hi_s is not None and 'sharp_hi_claim' in cert, 'incomplete sharp_hi fields')
        sh_cap = Fr(cert['sharp_hi_claim'])
        require(sh_cap > 0, 'sharp_hi_claim must be strictly positive')
        require(sh_cap * sh_cap < pi_lo / 4, 'sharp_hi_claim >= sqrt(pi)/2')

    prev = chi_hi_hdr
    found_sharp_start = False
    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        require(s_lo == prev and s_hi > s_lo, f'row {i} contiguity failed')
        if sharp_hi_s is not None and s_lo == sharp_hi_s:
            found_sharp_start = True
        prev = s_hi
    require(prev >= S_COVER, 'coverage < 42')
    if sharp_hi_s is not None:
        require(found_sharp_start, 'sharp_hi_s does not match any row start knot')

    if not generic:
        require(claim <= Fr(114, 125), 'default theorem mode requires claim <= 114/125')
        require(slope_hdr <= Fr(3299, 625000), 'default theorem mode requires slope_claim <= 3299/625000')
        require(sharp_hi_s is not None and sharp_hi_s <= Fr(25), 'default theorem mode requires sharp_hi_s <= 25')
        require(sh_cap is not None and sh_cap <= Fr(443, 500), 'default theorem mode requires sharp_hi_claim <= 443/500')
        require('downstream' in cert, 'default theorem mode requires downstream dictionary')
        # Fast syntax/cutoff check before OU loop when S_cplx == 3*alpha - 1/16:
        S_hdr = 3 * Fr(ou_dict['alpha']) - Fr(1, 16)
        if S_hdr > 0:
            V1.verify_downstream(cert['downstream'], claim, S_hdr, pi_lo, pi_hi)

    ou_res = verify_ou_resolvent_block2(ou_dict, pi_hi, enclose_fn)
    require(ou_res['bound_at_chi_hi'] < claim, 'OU bound_at_chi_hi >= claim')

    ds_res = None
    if not generic:
        ds_res = V1.verify_downstream(cert['downstream'], claim, ou_res['S_cplx'], pi_lo, pi_hi)
        # Also verify the 4.18e sixth-moment quartic independently via Bernstein on [0, oo):
        t_clip = Fr(cert['downstream']['d5_418e_sixth_moment'])
        e, eta, target, shift, nu_ell = Fr(39, 50), Fr(779, 10000), Fr(500, 701), Fr(21, 200), Fr(431, 500) ** 2
        x0 = claim * claim - nu_ell * t_clip * t_clip
        z0 = ((1 + shift) ** 2) * x0
        need0 = (eta + (1 - eta) * t_clip * t_clip + (e - eta) * x0 - target) / eta + shift * shift * x0
        sc12 = 10**12
        r_up = Fr(isqrt(int(need0 * (sc12**2))) + 1, sc12)
        tang = Fr(2181, 1250)
        d0 = 2 * z0 - 1 - r_up * (2 + tang * tang) / (2 * tang)
        d1 = z0 - r_up / (2 * tang)
        p_clip = Poly([d0 * d0 - 6 * r_up * r_up * z0, Fr(0), 2 * d0 * d1 - 9 * r_up * r_up * z0, -C6 * r_up * r_up * z0, d1 * d1])
        require(pos_on_ray(p_clip, Fr(0), dict(leaves=0, max_depth=0)), '4.18e Bernstein ray check failed')

    worst_stein = Fr(0)
    worst_idx = -1
    worst_hi = None
    tot_leaves = 0
    max_depth = 0

    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        res = verify_row_bernstein(row)
        tot_leaves += res['stats']['leaves']
        if res['stats']['max_depth'] > max_depth:
            max_depth = res['stats']['max_depth']
        if res['bound'] > worst_stein:
            worst_stein = res['bound']
            worst_idx = i
        if sharp_hi_s is not None and s_lo >= sharp_hi_s:
            if worst_hi is None or res['bound'] > worst_hi:
                worst_hi = res['bound']
        if not quiet:
            print('row %2d [L%s]  s in [%6s, %6s]  PASS (Bernstein leaves=%5d, max_depth=%2d)  bound <= %s' % (
                i, res['level'], row['s_lo'], row['s_hi'], res['stats']['leaves'], res['stats']['max_depth'],
                dec_ceil10(res['bound'])), flush=True)

    overall_worst = max(ou_res['bound_at_chi_hi'], worst_stein)
    require(overall_worst < claim, 'overall worst >= claim')
    if sh_cap is not None:
        require(worst_hi is not None and worst_hi < sh_cap, 'high-kurtosis sharp claim failed')

    return dict(
        claim=claim,
        ou=ou_res,
        worst_stein=worst_stein,
        worst_idx=worst_idx,
        tot_leaves=tot_leaves,
        max_depth=max_depth,
        worst_hi=worst_hi,
        sharp_hi_s=sharp_hi_s,
        downstream=ds_res,
    )


def main(argv=None):
    args = list(sys.argv[1:] if argv is None else argv)
    quiet = '--quiet' in args
    generic = '--generic' in args
    pos_args = [a for a in args if not a.startswith('--')]
    require(len(pos_args) <= 1, 'Usage: verify_bernstein.py [CERT.json] [--quiet] [--generic]')
    cert_path = pathlib.Path(pos_args[0]) if pos_args else DEFAULT_CERT

    t0 = time.monotonic_ns()
    cert = json.loads(cert_path.read_text(encoding='utf-8'))
    out = verify_certificate_dict_bernstein(cert, generic=generic, quiet=quiet)
    dt_ms = (time.monotonic_ns() - t0) // 1_000_000

    print('OU resolvent [0, %s] (Block2-Schur): leaves=%d, max_depth=%d, bound < %s' % (
        out['ou']['chi_hi'], out['ou']['leaves'], out['ou']['max_depth'], cert['ou_resolvent']['bound_at_chi_hi']))
    print('Bernstein Stein [%s, 42]: total_leaves=%d, max_depth=%d, worst_row=%d, max_bound <= %s [%d ms, zero floats]' % (
        out['ou']['chi_hi'], out['tot_leaves'], out['max_depth'], out['worst_idx'], dec_ceil10(out['worst_stein']), dt_ms))
    print('GLOBAL CLAIM  E|q| <= %s ||q||_2  for every q in H_{2,1}(C^n):  VERIFIED (Bernstein + Block2-Schur)' % cert['claim'])
    if out['worst_hi'] is not None:
        print('SHARP HIGH-CHI CLAIM  E|q| <= %s ||q||_2 < (sqrt(pi)/2)||q||_2  on chi in [%s, 42]:  VERIFIED (max <= %s)' % (
            cert['sharp_hi_claim'], out['sharp_hi_s'], dec_ceil10(out['worst_hi'])))


if __name__ == '__main__':
    main()
