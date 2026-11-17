#!/usr/bin/env python3
"""Second independent exact verifier of third-order complex-radius certificates (Bernstein method).

Usage:  python3 -I verify_bernstein.py CERT.json [--quiet]

Standard library only; zero floating-point decisions.  Independent of verify_cert.py in four ways:
  1. Positivity of univariate polynomials on [e_k, e_{k+1}] and on [e_K, oo) (via r = e_K + t/(1-t))
     is decided by exact integer Bernstein coefficients and de Casteljau subdivision (no Sturm chains).
  2. Knot primitives G_i(u_k) are computed independently by the trapezoid rule and cross-checked against
     both endpoints of every piece primitive.
  3. Instead of hand-expanded 3x3 adjugate formulas, the symmetric 4x4 polynomial matrix P(r) (for k=0)
     and S(r) P(r) S(r) with S(r) = diag(1, 1, r^2, r^2) (for k >= 1) is assembled directly from the
     quadratic form Q_v(c_2, c_1, rho, 1), and its four leading principal minors are computed by a
     generic recursive determinant function det_mat().
  4. Contraction expectations and dual cuts are built from named linear forms in (n, h, b, y, z), deriving
     2 E[(c_2 - 1)(c_1 - 2)] algebraically as E[(c_1 + c_2 - 3)^2] - E[(c_2 - 1)^2] - E[(c_1 - 2)^2].
"""
import json
import sys
import time
from fractions import Fraction as Fr
from math import comb, gcd

C6 = Fr(4045313, 100000)
S_COVER = Fr(42)
MAX_SUBDIV_DEPTH = 64


class VerificationError(Exception):
    pass


def require(cond, msg):
    if not cond:
        raise VerificationError(msg)


# ------------------------------------------------------------------ Polynomial class over Q
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

    def integral_from_zero(self):
        return Poly([Fr(0)] + [coef / (i + 1) for i, coef in enumerate(self.c)])

    def in_r2(self):
        out = []
        for coef in self.c:
            out.extend([coef, Fr(0)])
        return Poly(out)

    def shift_scale(self, a, w):
        """p(x) -> p(a + w * t)."""
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


def det_mat(M):
    """Generic recursive Laplace determinant of an m x m matrix of Poly objects."""
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


# ------------------------------------------------------------------ Exact integer Bernstein positivity
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


# ------------------------------------------------------------------ Named linear forms in (n, h, b, y, z)
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


# ------------------------------------------------------------------ Row verification
def verify_row_bernstein(row):
    e = [Fr(x) for x in row['knots']]
    K = len(e) - 1
    require(K >= 1 and e[0] == 0 and all(e[i] < e[i + 1] for i in range(K)), 'knots invalid')
    u = [x * x for x in e]
    require(isinstance(row['knot_den'], int) and row['knot_den'] > 0, 'knot_den invalid')
    kden = Fr(row['knot_den'])

    arr = {}
    for nm in ('phi1', 'phi2', 'phi3', 'phi4', 'psi_a', 'xi2', 'xi1', 'xia'):
        raw = row[nm]
        require(len(raw) == K + 1 and all(isinstance(x, int) for x in raw), 'bad knot array ' + nm)
        arr[nm] = [Fr(x, kden) for x in raw]

    lam = [Fr(x) for x in row['lam']]
    slope = [Fr(x) for x in row['slope']]
    l3 = [Fr(x) for x in row['l3']]
    m00, m01, m11 = (Fr(x) for x in row['m_ker'])
    mu_a = Fr(row['mu_a'])
    mu_rho = Fr(row['mu_rho'])
    mu_w = Fr(row['mu_w'])
    sig = Fr(row['sigma'])

    require(len(lam) == 3 and len(slope) == 2 and len(l3) == 3, 'vector lengths')
    require(all(x >= 0 for x in l3), 'l3 >= 0')
    lam3 = sum(l3)
    require(lam3 > 0, 'lam3 > 0')
    require(m00 >= 0 and m11 > 0 and m00 * m11 - m01 * m01 >= 0, 'M_ker PSD & m11 > 0')
    require(mu_a >= 0 and mu_rho > 0 and mu_w > 0, 'mu signs')

    # (C1)
    for k in range(K + 1):
        require(arr['xi2'][k] >= 0 and arr['xi1'][k] >= 0, f'xi nonneg at {k}')
        require(arr['xia'][k] ** 2 <= 4 * arr['xi1'][k] * arr['xi2'][k], f'xi SOC at {k}')
        require(arr['psi_a'][k] >= 0 and arr['psi_a'][k] + mu_a - arr['phi4'][k] >= 0, f'psi_a at {k}')
        require(m00 - arr['phi3'][k] > 0, f'D1 at {k}')
        require(m11 * (m00 - arr['phi3'][k]) - (m01 - Fr(1, 2) * arr['psi_a'][k]) ** 2 > 0, f'D2 at {k}')

    # Precompute knot values of G_1..G_4 by the exact trapezoid rule!
    G_knots = [[Fr(0)] * (K + 1) for _ in range(4)]
    for k in range(K):
        du = u[k + 1] - u[k]
        v1_lo = arr['phi1'][k] + slope[0] * u[k]
        v1_hi = arr['phi1'][k + 1] + slope[0] * u[k + 1]
        v2_lo = arr['phi2'][k] + slope[1] * u[k]
        v2_hi = arr['phi2'][k + 1] + slope[1] * u[k + 1]
        G_knots[0][k + 1] = G_knots[0][k] + Fr(1, 2) * (v1_lo + v1_hi) * du
        G_knots[1][k + 1] = G_knots[1][k] + Fr(1, 2) * (v2_lo + v2_hi) * du
        G_knots[2][k + 1] = G_knots[2][k] + Fr(1, 2) * (arr['phi3'][k] + arr['phi3'][k + 1]) * du
        G_knots[3][k + 1] = G_knots[3][k] + Fr(1, 2) * (arr['phi4'][k] + arr['phi4'][k + 1]) * du

    # (C2) Direct 4x4 matrix determinants + Bernstein subdivision
    stats = dict(leaves=0, max_depth=0)
    lam_poly = Poly([lam[0] + m00 + 4 * m01 + 4 * m11, lam[1], lam[2], lam3])

    for k in range(K + 1):
        tail = (k == K)
        u0 = u[k]
        if tail:
            pc = lambda nm: Poly([arr[nm][K]])
        else:
            u1 = u[k + 1]
            def pc(nm, k=k, u0=u0, u1=u1):
                a0, a1 = arr[nm][k], arr[nm][k + 1]
                sl = (a1 - a0) / (u1 - u0)
                return Poly([a0 - sl * u0, sl])

        ph = [pc('phi1') + slope[0] * V_VAR, pc('phi2') + slope[1] * V_VAR, pc('phi3'), pc('phi4')]
        G = []
        for idx in range(4):
            pr = ph[idx].integral_from_zero()
            gk = pr + (G_knots[idx][k] - pr(u0))
            if not tail:
                require(gk(u[k + 1]) == G_knots[idx][k + 1], f'trapezoid continuity mismatch {idx} at {k+1}')
            G.append(gk)

        psa = pc('psi_a')
        x2p, x1p, xap = pc('xi2'), pc('xi1'), pc('xia')

        M11_v = m00 - ph[2]
        M12_v = m01 - Fr(1, 2) * psa
        M22_v = Poly([m11])
        M33_v = (mu_rho + mu_a) + psa - ph[3]
        b2_v = Fr(1, 2) * ((-2 * m01 - 4 * m11) - Fr(1, 2) * ph[1] - x1p)
        q1_r = (lam_poly + G[0] + G[1] - G[2]).in_r2() - R_VAR

        if k == 0:
            g34_div_v = (G[2] + G[3]).div_xk(1)
            tau_w_v = V_VAR * (Fr(1) / (4 * mu_w)) * (g34_div_v * g34_div_v)
            Y = [(V_VAR * ph[i] - G[i]).div_xk(1) for i in range(4)]
            M13_v = Fr(-1, 2) * (Y[2] + Y[3])
            b1_v = Fr(1, 2) * (-ph[0] + ph[2] + G[2] - (2 * m00 + 4 * m01) - tau_w_v - x2p)
            b3_v = Fr(1, 2) * (-Y[0] - Fr(1, 2) * Y[1] + sig * V_VAR + Y[2] + G[3] - xap)

            P_mat = [
                [M11_v.in_r2(), M12_v.in_r2(), M13_v.in_r2(), b1_v.in_r2()],
                [M12_v.in_r2(), M22_v.in_r2(), Poly(),        b2_v.in_r2()],
                [M13_v.in_r2(), Poly(),        M33_v.in_r2(), b3_v.in_r2()],
                [b1_v.in_r2(),  b2_v.in_r2(),  b3_v.in_r2(),  q1_r],
            ]
            for m_ord in (1, 2, 3, 4):
                sub_m = [row_m[:m_ord] for row_m in P_mat[:m_ord]]
                dm = det_mat(sub_m)
                require(pos_on_segment(dm, e[0], e[1], stats), f'minor {m_ord} failed on [0, {e[1]}]')
        else:
            # S(r) P(r) S(r) with S = diag(1, 1, v, v): every entry is an exact polynomial!
            vY = [V_VAR * ph[i] - G[i] for i in range(4)]
            vM13_v = Fr(-1, 2) * (vY[2] + vY[3])
            v_tau_w = (Fr(1) / (4 * mu_w)) * ((G[2] + G[3]) * (G[2] + G[3]))
            vb1_v = Fr(1, 2) * (V_VAR * (-ph[0] + ph[2] + G[2] - (2 * m00 + 4 * m01) - x2p) - v_tau_w)
            vb2_v = V_VAR * b2_v
            vb3_v = Fr(1, 2) * (-vY[0] - Fr(1, 2) * vY[1] + V_VAR * (sig * V_VAR + G[3] - xap) + vY[2])
            v2M33_v = V_VAR * V_VAR * M33_v
            v2b3_v = V_VAR * vb3_v
            v2q1_r = Poly([Fr(0), Fr(0), Fr(0), Fr(0), Fr(1)]) * q1_r

            P_tilde = [
                [M11_v.in_r2(),   M12_v.in_r2(), vM13_v.in_r2(),  vb1_v.in_r2()],
                [M12_v.in_r2(),   M22_v.in_r2(), Poly(),          vb2_v.in_r2()],
                [vM13_v.in_r2(),  Poly(),        v2M33_v.in_r2(), v2b3_v.in_r2()],
                [vb1_v.in_r2(),   vb2_v.in_r2(), v2b3_v.in_r2(),  v2q1_r],
            ]
            for m_ord in (1, 2, 3, 4):
                sub_m = [row_m[:m_ord] for row_m in P_tilde[:m_ord]]
                dm = det_mat(sub_m)
                if m_ord == 4:
                    # det(S P S) = v^4 det(P) = r^2 * (v^3 det P); divide out r^2!
                    dm = dm.div_xk(2)
                ok = pos_on_ray(dm, e[K], stats) if tail else pos_on_segment(dm, e[k], e[k + 1], stats)
                require(ok, f'minor {m_ord} failed on piece {k} (tail={tail})')

    # (C3) Named linear forms
    d_lin = (m00 * VAR_C2 + m01 * CROSS_2_C2_C1 + m11 * VAR_C1
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
        d_J = (l3[1] * (150 * al[0] * JOINT_S0 + (198 + Fr(150) / al[0]) * JOINT_H0)
               + l3[2] * (Fr(135, 2) * al[1] * JOINT_S0 + (Fr(11781, 32) + Fr(135, 2) / al[1]) * JOINT_H0))
        sb = Fr(pd['sqrt_ub'])
        require(sb > 0 and sb * sb >= s_e, 'sqrt_ub')
        eta = Fr(pd['eta'])
        resid = d_lin + sb * d_J - eta * S_NORM
        for kind, th, mult in pd['cuts']:
            yv = Fr(mult)
            require(yv >= 0, 'cut multiplier >= 0')
            resid = resid + yv * get_cut_form(kind, None if th is None else Fr(th))
        L_e = eta + sum(max(resid.v[i], Fr(0)) * P_BOX[i] for i in range(5))
        bounds[end] = (lam[0] + lam[1] + lam[2] * (2 + s_e) + l3[0] * (6 + 9 * s_e + C6 * s_e * sb)
                       + (l3[1] + l3[2]) * (6 + 9 * s_e) + s_e * L_e)
    return dict(bound=max(bounds.values()), bounds=bounds, K=K, stats=stats)


def main():
    t0 = time.time()
    path = sys.argv[1]
    quiet = '--quiet' in sys.argv
    with open(path, encoding='utf-8') as fh:
        cert = json.load(fh)
    rows = cert['rows']
    require(len(rows) >= 1, 'no rows')
    prev = Fr(0)
    worst = None
    worst_idx = -1
    tot_leaves = 0
    max_depth = 0

    for i, row in enumerate(rows):
        s_lo, s_hi = Fr(row['s_lo']), Fr(row['s_hi'])
        require(s_lo == prev and s_hi > s_lo, f'contiguity broken at row {i}')
        prev = s_hi
        res = verify_row_bernstein(row)
        tot_leaves += res['stats']['leaves']
        max_depth = max(max_depth, res['stats']['max_depth'])
        if worst is None or res['bound'] > worst:
            worst = res['bound']
            worst_idx = i
        if not quiet:
            print('row %2d  s in [%6s, %6s]  K=%3d  PASS  bound <= %.10f  (leaves=%d, depth=%d)' % (
                i, row['s_lo'], row['s_hi'], res['K'], float(res['bound']),
                res['stats']['leaves'], res['stats']['max_depth']), flush=True)

    require(prev >= S_COVER, f'cover ends at {prev} < 42')
    claim = Fr(cert['claim'])
    require(worst < claim, f'worst bound {worst} >= claim {claim}')
    dt = time.time() - t0
    print('Bernstein verifier: covered [0, %s]; %d rows PASS; leaves=%d, max_depth=%d; [%.2fs]' % (
        prev, len(rows), tot_leaves, max_depth, dt))
    print('worst row = %d;  exact max bound = %s  (<= %.10f) < %s:  VERIFIED' % (
        worst_idx, worst, float(worst) + 1e-12, cert['claim']))


if __name__ == '__main__':
    main()
