#!/usr/bin/env python3
"""Second independent exact pure-stdlib verifier (Bernstein subdivision + recursive det_mat +
multivariate symbolic polynomial ring identity check) for both `cert_shifted_q_458.json` and `cert_v7_458.json`.

Agent-ID: gemini-8732
Task: #458 (tag KADS458)
Usage:
    python3 -IB verify_bernstein.py [CERT.json] [--quiet]

Arithmetic discipline:
  - 100% Python 3 standard library (`ast`, `fractions`, `json`, `math`, `pathlib`, `sys`, `time`).
  - Zero floating-point operations or literals anywhere in this file (`self_audit_ast()`).
  - Zero `assert` statements (`-O`-safe `require(...)` throughout).
  - Completely independent polynomial, determinant, and Bernstein positivity implementation (no Sturm calls).
"""
import ast
from fractions import Fraction as Fr
import json
from math import comb, gcd, isqrt
import pathlib
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import verify as V1

DEFAULT_SHIFTED_CERT = HERE / "cert_shifted_q_458.json"
DEFAULT_V7_CERT = HERE / "cert_v7_458.json"
MAX_SUBDIV_DEPTH = 64


class VerificationError(Exception):
    pass


def require(cond, msg="verification condition failed"):
    if not cond:
        raise VerificationError(msg)


ALLOWED_MODULES = {"ast", "fractions", "json", "math", "pathlib", "sys", "time", "verify"}
ALLOWED_MATH_NAMES = {"comb", "gcd", "isqrt"}
FORBIDDEN_CALLS = {"fl" + "oat", "comp" + "lex"}


def self_audit_ast():
    src = pathlib.Path(__file__).read_text(encoding="utf-8")
    tree = ast.parse(src, filename=str(pathlib.Path(__file__)))
    for node in ast.walk(tree):
        if isinstance(node, ast.Assert):
            raise VerificationError(f"Bare assert at line {node.lineno}")
        if isinstance(node, ast.Constant) and type(node.value).__name__ in FORBIDDEN_CALLS:
            raise VerificationError(f"Float/complex literal {node.value!r} at line {node.lineno}")
        if isinstance(node, ast.Import):
            for alias in node.names:
                require(alias.name in ALLOWED_MODULES, f"Disallowed import: {alias.name}")
        if isinstance(node, ast.ImportFrom):
            require(node.module in ALLOWED_MODULES, f"Disallowed from-import: {node.module}")
            if node.module == "math":
                for alias in node.names:
                    require(alias.name in ALLOWED_MATH_NAMES, f"Disallowed math symbol: {alias.name}")
        if isinstance(node.func if isinstance(node, ast.Call) else None, ast.Name):
            require(node.func.id not in FORBIDDEN_CALLS, f"Forbidden call {node.func.id} at line {node.lineno}")


class Poly:
    __slots__ = ("c",)

    def __init__(self, coeffs=()):
        c = [Fr(x) for x in coeffs]
        while c and c[-1] == 0:
            c.pop()
        self.c = c

    @staticmethod
    def wrap(x):
        return x if isinstance(x, Poly) else Poly([x])

    def __bool__(self):
        return bool(self.c)

    def __eq__(self, other):
        return self.c == Poly.wrap(other).c

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

    def integral_from(self, x0, val_x0):
        q = Poly([Fr(0)] + [coef / (i + 1) for i, coef in enumerate(self.c)])
        return q + (val_x0 - q(x0))

    def shift_scale(self, a, w):
        res = Poly()
        lin = Poly([a, w])
        for coef in reversed(self.c):
            res = res * lin + coef
        return res


X_VAR = Poly([Fr(0), Fr(1)])


def det_mat(M):
    m = len(M)
    if m == 1:
        return Poly.wrap(M[0][0])
    if m == 2:
        return Poly.wrap(M[0][0]) * Poly.wrap(M[1][1]) - Poly.wrap(M[0][1]) * Poly.wrap(M[1][0])
    acc = Poly()
    for col in range(m):
        entry = Poly.wrap(M[0][col])
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
            stats["leaves"] += 1
            if depth > stats["max_depth"]:
                stats["max_depth"] = depth
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


# ==============================================================================
# MULTIVARIATE SYMBOLIC RING Q[x][y_1, ..., y_m]
# ==============================================================================
def mv_add(A, B):
    out = dict(A)
    for k, v in B.items():
        nv = out.get(k, Poly()) + v
        if nv:
            out[k] = nv
        else:
            out.pop(k, None)
    return out


def mv_sub(A, B):
    out = dict(A)
    for k, v in B.items():
        nv = out.get(k, Poly()) - v
        if nv:
            out[k] = nv
        else:
            out.pop(k, None)
    return out


def mv_mul(A, B):
    out = {}
    for ka, va in A.items():
        for kb, vb in B.items():
            kc = tuple(ka[i] + kb[i] for i in range(len(ka)))
            nv = out.get(kc, Poly()) + va * vb
            if nv:
                out[kc] = nv
            else:
                out.pop(kc, None)
    return out


def build_cs_splines_poly(knots_fr, c_int_list, kden):
    K = len(knots_fr) - 1
    require(len(c_int_list) == K - 1, "Invalid spline length")
    vals = [Fr(0)] + [Fr(int(v), kden) for v in c_int_list] + [Fr(0)]
    d_polys, v_polys = [], []
    cur_v = Fr(0)
    for k in range(K):
        xL, xR = knots_fr[k], knots_fr[k + 1]
        sl = (vals[k + 1] - vals[k]) / (xR - xL)
        dp = Poly([vals[k] - sl * xL, sl])
        vp = dp.integral_from(xL, cur_v)
        cur_v = vp(xR)
        d_polys.append(dp)
        v_polys.append(vp)
    require(cur_v == Fr(0), "Bernstein spline compact support integral failed")
    return v_polys, d_polys


def verify_shifted_cell_bernstein(t_fr, cell, stats):
    a = Fr(cell["a"])
    b = Fr(cell["b"])
    v_lo = Fr(cell["v_lo"])
    v_top = Fr(cell["v_top"])
    bound = Fr(cell["bound"])
    kden = int(cell["kden"])
    require(kden > 0, "kden <= 0")

    verts = V1.exact_polygon_vertices(a, b, v_lo, v_top)
    knots_fr = [-t_fr + off for off in V1.OFFSETS_SHIFTED]
    K = len(knots_fr) - 1
    require(knots_fr[11] == -t_fr, "Knot alignment failed")

    p0_v, p0_d = build_cs_splines_poly(knots_fr, cell["p0"], kden)
    p1_v, p1_d = build_cs_splines_poly(knots_fr, cell["p1"], kden)
    p2_v, p2_d = build_cs_splines_poly(knots_fr, cell["p2"], kden)
    g2_v, g2_d = build_cs_splines_poly(knots_fr, cell["g2"], kden)

    alpha_q = [Fr(int(v), kden) for v in cell["alpha"]]
    beta_q = [Fr(int(v), kden) for v in cell["beta"]]
    lam_q = [Fr(int(v), kden) for v in cell["lam"]]
    rpos_q = [Fr(int(v), kden) for v in cell["rpos"]]
    kap_q = [Fr(int(v), kden) for v in cell["kap"]]
    for arr in (alpha_q, beta_q, lam_q, rpos_q, kap_q):
        require(len(arr) == K + 1, "Knot array length mismatch")
    require(all(v >= 0 for v in lam_q) and all(v >= 0 for v in rpos_q) and all(v >= 0 for v in kap_q), "Knot nonneg failed")

    sc = cell["scalars"]
    c0, c1, c2, c3, c4, c6 = (Fr(sc[k]) for k in ("c0", "c1", "c2", "c3", "c4", "c6"))
    g0, g0_2, g1, g2_s = (Fr(sc[k]) for k in ("g0", "g0_2", "g1", "g2"))
    h0, h1 = Fr(sc["h0"]), Fr(sc["h1"])
    gc_pos, gc_neg = Fr(sc["gc_pos"]), Fr(sc["gc_neg"])
    u0_anch, v0_anch = Fr(sc["u0"]), Fr(sc["v0"])
    rL0, rL2, rR0, rR2 = (Fr(sc[k]) for k in ("rL0", "rL2", "rR0", "rR2"))
    kapL, kapR = Fr(sc["kapL"]), Fr(sc["kapR"])
    require(c6 > 0 and g0 >= 0 and g0_2 > 0 and h0 >= 0 and gc_pos >= 0 and gc_neg >= 0, "Scalar sign failed")
    require(rL0 >= 0 and rL2 >= 0 and rR0 >= 0 and rR2 >= 0 and kapL >= 0 and kapR >= 0, "Tail sign failed")
    require(-V1.RB_OUTER < u0_anch < V1.RB_OUTER, "u0_anch range failed")
    for u_v, _ in verts:
        require(-V1.RB_OUTER < u_v < V1.RB_OUTER, "Vertex m_1 range failed")

    p12_p = Poly([(gc_pos - gc_neg) / 2])
    m1_ends = [a] if a == b else [a, b]

    # Symbolic ring variables for shifted Q: (M_0, M_1, M_2)
    ONE_MV = {(0, 0, 0): Poly([Fr(1)])}
    M0_MV = {(1, 0, 0): Poly([Fr(1)])}
    M1_MV = {(0, 1, 0): Poly([Fr(1)])}
    M2_MV = {(0, 0, 1): Poly([Fr(1)])}
    M0m1_MV = mv_sub(M0_MV, ONE_MV)

    for k in range(K):
        xL, xR = knots_fr[k], knots_fr[k + 1]
        lin_kn = lambda arr, k=k, xL=xL, xR=xR: Poly([arr[k] - ((arr[k + 1] - arr[k]) / (xR - xL)) * xL, (arr[k + 1] - arr[k]) / (xR - xL)])
        al_p, be_p, la_p, rp_p, ka_p = lin_kn(alpha_q), lin_kn(beta_q), lin_kn(lam_q), lin_kn(rpos_q), lin_kn(kap_q)

        H_mat = [[al_p - 2 * la_p, Fr(1, 2) * be_p], [Fr(1, 2) * be_p, p2_d[k] + la_p]]
        require(check_pos(H_mat[1][1], xL, xR, stats) and check_pos(det_mat(H_mat), xL, xR, stats), f"Bernstein H_mat failed on {k}")

        P22 = Poly([h0]) + ka_p
        P11 = Poly([g0, Fr(0), g0_2]) - 2 * ka_p - g2_d[k]
        P01 = Poly([-g0, g1 / 2, -g0_2 + g2_s / 2]) - Fr(1, 2) * (al_p + rp_p) + Fr(1, 2) * (p0_d[k] - p1_v[k] + g2_d[k] + X_VAR * g2_v[k])
        P02 = Poly([Fr(0), h1 / 2]) - Fr(1, 2) * be_p + Fr(1, 2) * (p1_d[k] - p2_v[k] - g2_v[k])
        abs_tx = Poly([-t_fr, Fr(-1)]) if k < 11 else Poly([t_fr, Fr(1)])
        P00_base = Poly([c0 + g0, c1 - g1, c2 + g0_2 - g2_s, c3, c4, Fr(0), c6]) + p1_v[k] - X_VAR * (p0_v[k] + g2_v[k]) - abs_tx

        require(check_pos(P22, xL, xR, stats), f"Bernstein P22 failed on {k}")
        require(check_pos(det_mat([[P11, p12_p], [p12_p, P22]]), xL, xR, stats), f"Bernstein M2 failed on {k}")

        for idx_e, m1_e in enumerate(m1_ends):
            P00 = P00_base + m1_e * p2_v[k]
            P_mat = [[P00, P01, P02], [P01, P11, p12_p], [P02, p12_p, P22]]
            require(check_pos(det_mat(P_mat), xL, xR, stats), f"Bernstein M3 failed on {k}")

            # Exact multivariate symbolic identity check in Q[x][M_0, M_1, M_2] on first endpoint:
            if idx_e == 0:
                vec = [ONE_MV, M0_MV, M1_MV]
                sos_sum = {}
                for r_i in range(3):
                    for c_i in range(3):
                        sos_sum = mv_add(sos_sum, mv_mul({(0, 0, 0): P_mat[r_i][c_i]}, mv_mul(vec[r_i], vec[c_i])))
                sos_sum = mv_add(sos_sum, {(1, 0, 0): rp_p})
                sos_sum = mv_add(sos_sum, mv_mul({(0, 0, 0): ka_p}, {(2, 0, 0): Poly([Fr(2)]), (0, 2, 0): Poly([Fr(-1)])}))
                sos_sum = mv_add(sos_sum, {(1, 0, 0): al_p, (0, 1, 0): be_p, (0, 0, 1): p2_d[k]})

                M1m_MV = mv_sub(M1_MV, {(0, 0, 0): Poly([m1_e])})
                mom_mv = mv_add(
                    {(0, 0, 0): Poly([c0, c1, c2, c3, c4, Fr(0), c6]) - abs_tx},
                    mv_add(
                        mv_mul({(0, 0, 0): Poly([g0, Fr(0), g0_2])}, mv_mul(M0m1_MV, M0m1_MV)),
                        mv_add(
                            mv_mul({(0, 0, 0): Poly([Fr(0), g1, g2_s])}, M0m1_MV),
                            {(0, 1, 0): Poly([Fr(0), h1]), (0, 2, 0): Poly([h0]), (1, 1, 0): Poly([gc_pos - gc_neg])},
                        ),
                    ),
                )
                br0 = mv_sub({(0, 0, 0): X_VAR * p0_v[k]}, {(1, 0, 0): p0_d[k]})
                br1 = mv_sub(mv_mul({(0, 0, 0): p1_v[k]}, M0m1_MV), {(0, 1, 0): p1_d[k]})
                br2 = mv_sub(mv_mul({(0, 0, 0): p2_v[k]}, M1m_MV), {(0, 0, 1): p2_d[k]})
                brq = mv_add(
                    mv_sub(mv_mul({(0, 0, 0): g2_d[k]}, mv_mul(M0_MV, M0m1_MV)), mv_mul({(0, 0, 0): X_VAR * g2_v[k]}, M0m1_MV)),
                    {(0, 1, 0): g2_v[k]},
                )
                expected_mv = mv_sub(mom_mv, mv_add(mv_add(br0, br1), mv_add(br2, brq)))
                require(sos_sum == expected_mv, f"Symbolic Q[x][M_0,M_1,M_2] identity mismatch on interval {k}!")

    for side, x_end, sgn_dir, abs_tx, r0_t, r2_t, kt_t in (
        ("L", knots_fr[0], Fr(-1), Poly([-t_fr, Fr(-1)]), rL0, rL2, kapL),
        ("R", knots_fr[K], Fr(1), Poly([t_fr, Fr(1)]), rR0, rR2, kapR),
    ):
        P22_p = Poly([h0 + kt_t])
        require(h0 + kt_t > 0, "Tail P22 <= 0")
        P11_p = Poly([g0 - 2 * kt_t, Fr(0), g0_2])
        dx_p = Poly([-x_end, Fr(1)])
        r_tail_p = Poly([r0_t]) + r2_t * (dx_p * dx_p)
        P01_p = Poly([-g0, g1 / 2, -g0_2 + g2_s / 2]) - Fr(1, 2) * r_tail_p
        P02_p = Poly([Fr(0), h1 / 2])
        P00_p = Poly([c0 + g0, c1 - g1, c2 + g0_2 - g2_s, c3, c4, Fr(0), c6]) - abs_tx
        M2_u = det_mat([[P11_p, p12_p], [p12_p, P22_p]]).shift_scale(x_end, sgn_dir)
        M3_u = det_mat([[P00_p, P01_p, P02_p], [P01_p, P11_p, p12_p], [P02_p, p12_p, P22_p]]).shift_scale(x_end, sgn_dir)
        require(check_pos(M2_u, Fr(0), None, stats) and check_pos(M3_u, Fr(0), None, stats), f"Bernstein tail {side} failed")

    # Vertex expectation check:
    rb = V1.RB_OUTER
    qp = (rb * u0_anch - v0_anch) / (rb - u0_anch)
    qm = (rb * u0_anch + v0_anch) / (rb + u0_anch)
    for m1_c, m2_c in verts:
        m4_ub = V1.rat_sqrt_ceil(Fr(2) * (m2_c ** 3))
        q6_ub = Fr(15) + 90 * m2_c + 40 * m1_c * m1_c + 120 * m4_ub
        q2_m0sq_ub = m2_c + 2 * m1_c * m1_c + 6 * m4_ub
        m3_ub = rb * m2_c - 2 * qp * (rb * m1_c - m2_c) + (qp * qp) * (rb - m1_c)
        m3_lb = -rb * m2_c + 2 * qm * (rb * m1_c + m2_c) - (qm * qm) * (rb + m1_c)
        ev_ub = (
            c0 + c2 + 2 * m1_c * c3 + (3 + 6 * m2_c) * c4 + q6_ub * c6
            + m2_c * g0 + q2_m0sq_ub * g0_2 + m1_c * g1 + 2 * m2_c * g2_s
            + m2_c * h1 + (m1_c * m1_c + m4_ub) * h0
            + (m1_c + m3_ub) * gc_pos - (m1_c + m3_lb) * gc_neg
        )
        require(ev_ub <= bound, "Bernstein vertex expectation exceeded bound")
    return bound


def verify_v7_row_bernstein(row, m6_cap, stats):
    s_lo, s_hi, bound = Fr(row["s_lo"]), Fr(row["s_hi"]), Fr(row["bound"])
    kden = int(row["kden"])
    require(Fr(0) <= s_lo < s_hi <= V1.S_COVER_V7 and kden > 0, "Invalid V_7 slab")
    knots_fr = V1.R_KNOTS_V7
    K = len(knots_fr) - 1

    phi1_q = [Fr(int(x), kden) for x in row["phi1"]]
    phi2_q = [Fr(int(x), kden) for x in row["phi2"]]
    phi3_q = [Fr(int(x), kden) for x in row["phi3"]]
    psi4_q = [Fr(int(x), kden) for x in row["psi4"]]
    lB_q = [Fr(int(x), kden) for x in row["lB"]]
    Ae_q = [Fr(int(x), kden) for x in row["Ae"]]
    t2_q = [Fr(int(x), kden) for x in row["t2"]]
    xe_q = [Fr(int(x), kden) for x in row["xe"]]
    xte_q = [Fr(int(x), kden) for x in row["xte"]]
    tau3_q = [[Fr(int(x), kden) for x in sub] for sub in row["tau3"]]

    for arr in (phi1_q, phi2_q, phi3_q, psi4_q, lB_q, Ae_q, t2_q, xe_q, xte_q):
        require(len(arr) == K + 1, "V_7 array length mismatch")
    require(len(tau3_q) == K and all(len(sub) == 5 for sub in tau3_q), "V_7 tau3 shape mismatch")
    require(phi2_q[K] == 0 and phi3_q[K] == 0 and psi4_q[0] == 0 and psi4_q[K] == 0, "V_7 boundary zeros failed")
    require(all(x > 0 for x in Ae_q) and all(x > 0 for x in t2_q) and all(x >= 0 for x in xe_q) and all(x >= 0 for x in xte_q), "V_7 sign failed")

    lam0_q, lam1_q, lam2_q, lam3_q = (Fr(x) for x in row["lam"])
    m00_q, m01_q, m11_q = (Fr(x) for x in row["M_mat"])
    mu00_q, mu01_q, mu11_q = (Fr(x) for x in row["Mw_mat"])
    gvt1_q, gvt2_q = (Fr(x) for x in row["gam_v"])
    xt0_q, xt2_q, xe0_q, xe2_q = (Fr(x) for x in row["tail_xi"])
    require(lam3_q > 0 and m00_q > 0 and m11_q > 0 and m00_q * m11_q - m01_q * m01_q > 0, "M_mat invalid")
    Dw = mu00_q * mu11_q - mu01_q * mu01_q
    require(mu00_q > 0 and mu11_q > 0 and Dw > 0, "Mw_mat invalid")
    require(xt0_q >= 0 and xt2_q >= 0 and xe0_q >= 0 and xe2_q >= 0, "tail_xi < 0")

    h4_0 = -sum(Fr(1, 2) * (psi4_q[j] + psi4_q[j + 1]) * (knots_fr[j + 1] - knots_fr[j]) for j in range(K))
    G1_v, G2_v, G3_v, H4_v = Fr(0), Fr(0), Fr(0), h4_0

    for k in range(K + 1):
        tail = (k == K)
        a_lo = knots_fr[k]
        b_hi = None if tail else knots_fr[k + 1]
        lin_p = (lambda arr: Poly([arr[K]])) if tail else (
            lambda arr, k=k, a_lo=a_lo, b_hi=b_hi: Poly([arr[k] - ((arr[k + 1] - arr[k]) / (b_hi - a_lo)) * a_lo, (arr[k + 1] - arr[k]) / (b_hi - a_lo)])
        )
        p1, xte_p = lin_p(phi1_q), lin_p(xte_q)
        g1 = p1.integral_from(a_lo, G1_v)
        if not tail:
            p2, p3, ps4 = lin_p(phi2_q), lin_p(phi3_q), lin_p(psi4_q)
            lb_p, ae_p, t2_p, xe_p = lin_p(lB_q), lin_p(Ae_q), lin_p(t2_q), lin_p(xe_q)
            g2, g3, h4 = p2.integral_from(a_lo, G2_v), p3.integral_from(a_lo, G3_v), ps4.integral_from(a_lo, H4_v)
            require(check_pos(ae_p * t2_p - V1.SIGMA_SQ_COEFF_V7 * (lb_p * lb_p), a_lo, b_hi, stats), "Bernstein V_7 sig1 failed")
            Lsig, Lnu = Fr(2) * (g2 + ps4), Fr(2) * g3
            lA_p = Lsig - lb_p
            q_form = mu11_q * (lA_p * lA_p) - (2 * mu01_q) * (lA_p * Lnu) + mu00_q * (Lnu * Lnu)
            T3_exact = (V1.GRAM_COEFF_V7 / Dw) * q_form
            p_w1 = (Fr(1) / (b_hi - a_lo)) * Poly([-a_lo, Fr(1)])
            T3_p, pw = Poly(), Poly([Fr(1)])
            for m in range(5):
                T3_p = T3_p + tau3_q[k][m] * pw
                pw = pw * p_w1
            require(check_pos(T3_p - T3_exact, a_lo, b_hi, stats), "Bernstein V_7 Gram failed")
            xt_p = Poly()
            G1_v, G2_v, G3_v, H4_v = g1(b_hi), g2(b_hi), g3(b_hi), h4(b_hi)
            if k == K - 1:
                require(G2_v == 0 and G3_v == 0 and H4_v == 0, "Bernstein V_7 support failed")
        else:
            p2 = p3 = g2 = g3 = h4 = ae_p = t2_p = T3_p = Poly()
            rK2 = knots_fr[K] ** 2
            xt_p = Poly([xt0_q - xt2_q * rK2, Fr(0), xt2_q])
            xe_p = Poly([xe0_q - xe2_q * rK2, Fr(0), xe2_q])

        P12 = Poly([m01_q]) + Fr(7, 2) * p3 - Fr(1, 2) * xte_p
        P11 = Poly([m00_q]) + Fr(7) * p2 - t2_p
        P02 = Fr(1, 2) * (Poly([-2 * m01_q - 2 * m11_q, Fr(0), gvt2_q]) - Fr(7) * (X_VAR * g3) + Fr(12) * h4 - ae_p - xe_p)
        P01 = Fr(1, 2) * (Poly([-2 * m00_q - 2 * m01_q, Fr(0), gvt1_q]) + Fr(7) * (p1 - p2 - p3) - Fr(7) * (X_VAR * g2) - Fr(12) * h4 - T3_p - xt_p)
        P00 = Poly([lam0_q + m00_q + 2 * m01_q + m11_q, Fr(-1), lam1_q - gvt1_q - gvt2_q, Fr(0), lam2_q, Fr(0), lam3_q]) + Fr(7) * (X_VAR * (g2 + g3 - g1))

        P22 = Poly([m11_q])
        P_mat = [[P00, P01, P02], [P01, P11, P12], [P02, P12, P22]]
        require(check_pos(det_mat([[P11, P12], [P12, P22]]), a_lo, b_hi, stats), f"Bernstein V_7 M2 failed at {k}")
        require(check_pos(det_mat(P_mat), a_lo, b_hi, stats), f"Bernstein V_7 M3 failed at {k}")

        # Exact multivariate symbolic identity check in Q[r][tau_1, tau_2, sig_1, nu]:
        ONE_4 = {(0, 0, 0, 0): Poly([Fr(1)])}
        T1_4 = {(1, 0, 0, 0): Poly([Fr(1)])}
        T2_4 = {(0, 1, 0, 0): Poly([Fr(1)])}
        S1_4 = {(0, 0, 1, 0): Poly([Fr(1)])}
        NU_4 = {(0, 0, 0, 1): Poly([Fr(1)])}
        vec3 = [ONE_4, T1_4, T2_4]
        sos_v7 = {}
        for ri in range(3):
            for ci in range(3):
                sos_v7 = mv_add(sos_v7, mv_mul({(0, 0, 0, 0): P_mat[ri][ci]}, mv_mul(vec3[ri], vec3[ci])))
        if not tail:
            sos_v7 = mv_add(sos_v7, {(0, 1, 0, 0): ae_p, (2, 0, 0, 0): t2_p, (0, 0, 1, 0): lb_p})
            sos_v7 = mv_add(sos_v7, {(1, 0, 0, 0): T3_p, (0, 0, 1, 0): lA_p, (0, 0, 0, 1): Lnu})
            sos_v7 = mv_add(sos_v7, {(0, 1, 0, 0): xe_p, (1, 1, 0, 0): xte_p})
        else:
            sos_v7 = mv_add(sos_v7, {(1, 0, 0, 0): xt_p, (0, 1, 0, 0): xe_p, (1, 1, 0, 0): xte_p})

        T1m1 = mv_sub(T1_4, ONE_4)
        T2m1 = mv_sub(T2_4, ONE_4)
        raw_v7 = {(0, 0, 0, 0): Poly([lam0_q, Fr(-1), lam1_q, Fr(0), lam2_q, Fr(0), lam3_q])}
        raw_v7 = mv_add(raw_v7, mv_mul({(0, 0, 0, 0): Poly([m00_q])}, mv_mul(T1m1, T1m1)))
        raw_v7 = mv_add(raw_v7, mv_mul({(0, 0, 0, 0): Poly([2 * m01_q])}, mv_mul(T1m1, T2m1)))
        raw_v7 = mv_add(raw_v7, mv_mul({(0, 0, 0, 0): Poly([m11_q])}, mv_mul(T2m1, T2m1)))
        raw_v7 = mv_add(raw_v7, mv_mul({(0, 0, 0, 0): Poly([Fr(0), Fr(0), gvt1_q])}, T1m1))
        raw_v7 = mv_add(raw_v7, mv_mul({(0, 0, 0, 0): Poly([Fr(0), Fr(0), gvt2_q])}, T2m1))
        raw_v7 = mv_add(raw_v7, {(1, 0, 0, 0): Fr(7) * p1, (0, 0, 0, 0): -Fr(7) * (X_VAR * g1)})
        if not tail:
            br2 = mv_sub(mv_mul(T1m1, {(0, 0, 0, 0): Fr(7) * (X_VAR * g2), (1, 0, 0, 0): -Fr(7) * p2}), {(0, 0, 1, 0): Fr(2) * g2})
            br3 = mv_sub(mv_mul(T2m1, {(0, 0, 0, 0): Fr(7) * (X_VAR * g3), (1, 0, 0, 0): -Fr(7) * p3}), {(0, 0, 0, 1): Fr(2) * g3})
            br4 = mv_add(mv_mul({(0, 0, 0, 0): Fr(12) * h4}, mv_sub(T2_4, T1_4)), {(0, 0, 1, 0): Fr(2) * ps4})
            raw_v7 = mv_add(mv_sub(mv_sub(raw_v7, br2), br3), br4)
        require(sos_v7 == raw_v7, f"Symbolic Q[r][tau_1,tau_2,sig_1,nu] identity mismatch on V_7 interval {k}")

    for s_ep in (s_lo, s_hi):
        for kc in (1, 2, 3, 4, 5, 6):
            ak = Fr(7) * s_ep / (3 * (7 - kc))
            c1_k, c2_k = Fr(7 - kc, 7), Fr((7 - kc) * (6 - kc), 42)
            ev_tot = (
                lam0_q + lam1_q + lam2_q * (3 + s_ep) + lam3_q * m6_cap
                + gvt1_q * (c1_k * ak) + gvt2_q * (c2_k * ak)
                + m00_q * (c1_k * c1_k * ak) + 2 * m01_q * (c1_k * c2_k * ak) + m11_q * (c2_k * c2_k * ak)
                + (2 * kc) * (mu00_q * (c1_k * c1_k * ak) + 2 * mu01_q * (c1_k * c2_k * ak) + mu11_q * (c2_k * c2_k * ak))
            )
            require(ev_tot <= bound, "Bernstein V_7 vertex bound failed")
    return bound


def verify_certificate_dict_bernstein(cert, quiet=False):
    _, pi_hi = V1.verify_pi_bounds()
    stats = {"leaves": 0, "max_depth": 0}
    kind = cert.get("kind")
    if kind == "shifted_q_458":
        V1.verify_shifted_structural_constants()
        var_claim = Fr(cert["var_claim_sharp"])
        c_claim = Fr(1) - var_claim
        cubic_claim = Fr(cert["cubic_mixed_claim"])
        require(Fr(1, 3) < var_claim < Fr(1) and cubic_claim > 0, "Invalid shifted claim bounds")
        # Independent symbolic SOS check: 256 + 256 u + 27 u^4 == (3 u + 4)^2 * (3 (u - 4/3)^2 + 32/3) >= 0:
        lin_3u4 = Poly([Fr(4), Fr(3)])
        lin_um43 = Poly([Fr(-4, 3), Fr(1)])
        sos_rhs = (lin_3u4 * lin_3u4) * (Fr(3) * (lin_um43 * lin_um43) + Poly([Fr(32, 3)]))
        require(Poly([Fr(256), Fr(256), Fr(0), Fr(0), Fr(27)]) == sos_rhs, "Bernstein |t|>=16/5 SOS failed")
        t_cut = V1.T_TAIL_CUT
        tail_diff = Fr(405, 64) / (t_cut ** 2) + Fr(405 * 405, 16384) / (t_cut ** 6)
        require(tail_diff <= c_claim, "Bernstein |t|>=16/5 tail exceeds c_claim")
        require(Fr(225, 343) <= c_claim and (Fr(6) * c_claim) ** 2 <= Fr(35) * (cubic_claim ** 4) < Fr(16),
                "Bernstein mixed cubic claim failed")
        t_rows = cert["t_rows"]
        require(len(t_rows) >= 2 and Fr(t_rows[0]["t"]) == 0 and Fr(t_rows[-1]["t"]) == V1.T_TAIL_CUT, "t_rows range failed")
        t_knots, t_bounds = [], []
        for idx_t, trow in enumerate(t_rows):
            t_fr = Fr(trow["t"])
            if idx_t > 0:
                require(t_fr > t_knots[-1], "t_knots order failed")
            slabs = trow["slabs"]
            require(slabs and Fr(slabs[0]["v_lo"]) == 0 and Fr(slabs[-1]["v_hi"]) == 2, "slab range failed")
            prev_v = Fr(0)
            max_u = Fr(0)
            for slab in slabs:
                v_lo, v_hi = Fr(slab["v_lo"]), Fr(slab["v_hi"])
                require(v_lo == prev_v and v_hi > v_lo, "slab continuity failed")
                prev_v = v_hi
                u_min, u_max = Fr(slab["u_min"]), Fr(slab["u_max"])
                V1.verify_hole_lower_bound(v_lo, u_min)
                require(u_max * u_max >= v_hi, "u_max failed")
                cells = slab["cells"]
                require(bool(cells), "empty cells")
                if t_fr == 0:
                    cur = u_min
                    for c in cells:
                        require(Fr(c["a"]) <= cur <= Fr(c["b"]), "t=0 cover gap")
                        cur = Fr(c["b"])
                    require(cur >= u_max, "t=0 top gap")
                elif u_min == 0:
                    cur = -u_max
                    for c in cells:
                        require(Fr(c["a"]) <= cur <= Fr(c["b"]), "cover gap")
                        cur = Fr(c["b"])
                    require(cur >= u_max, "top gap")
                else:
                    nc = [c for c in cells if Fr(c["b"]) <= 0]
                    pc = [c for c in cells if Fr(c["a"]) >= 0]
                    require(len(nc) + len(pc) == len(cells) and nc and pc, "branch split failed")
                    cur = -u_max
                    for c in nc:
                        require(Fr(c["a"]) <= cur <= Fr(c["b"]), "neg gap")
                        cur = Fr(c["b"])
                    require(cur >= -u_min, "neg inner gap")
                    cur = u_min
                    for c in pc:
                        require(Fr(c["a"]) <= cur <= Fr(c["b"]), "pos gap")
                        cur = Fr(c["b"])
                    require(cur >= u_max, "pos outer gap")
                for c in cells:
                    require(Fr(c["v_lo"]) == v_lo, "cell v_lo mismatch")
                    V1.verify_vtop_cap(max(abs(Fr(c["a"])), abs(Fr(c["b"]))), Fr(c["v_top"]), v_hi)
                    ub = verify_shifted_cell_bernstein(t_fr, c, stats)
                    if ub > max_u:
                        max_u = ub
            require(max_u <= Fr(trow["bound"]), "trow bound exceeded")
            t_knots.append(t_fr)
            t_bounds.append(Fr(trow["bound"]))
        secants = cert["secants"]
        require(len(secants) == len(t_knots) - 1, "secants length failed")
        for k, sec in enumerate(secants):
            Ak, Bk = Fr(sec["A"]), Fr(sec["B"])
            require(Ak >= 0 and Fr(0) <= Bk < 1 and Ak * Ak + c_claim * Bk * Bk <= c_claim, "secant invalid")
            require(t_bounds[k] <= Ak + Bk * t_knots[k] and t_bounds[k + 1] <= Ak + Bk * t_knots[k + 1], "secant bound failed")
        if not quiet:
            print(f"  [OK] Bernstein + Symbolic Q[x][M_0,M_1,M_2] check of `cert_shifted_q_458.json` passed "
                  f"({stats['leaves']} Bernstein leaves, max depth {stats['max_depth']})!")
    elif kind == "v7_tower":
        V1.verify_structural_constants_v7()
        s_cut = Fr(cert["v7_s_cut"])
        rows_v7 = cert["rows_v7"]
        require(rows_v7 and Fr(rows_v7[0]["s_lo"]) == 0 and Fr(rows_v7[-1]["s_hi"]) == s_cut, "V_7 cover failed")
        prev, max_low = Fr(0), Fr(0)
        for r in rows_v7:
            require(Fr(r["s_lo"]) == prev, "V_7 gap")
            prev = Fr(r["s_hi"])
            b = verify_v7_row_bernstein(r, V1.M6_REAL_V7, stats)
            if b > max_low:
                max_low = b
        Bv7 = Fr(cert["v7_tail_B"])
        require(Bv7 >= 2, "Bv7 < 2")
        eps_v7 = Fr(1, 2) / ((Bv7 + 1) ** 2)
        eta_v7 = eps_v7 * ((Bv7 * Bv7 - 1) ** 2) / (Bv7 ** 6)
        require(check_pos(Poly([Fr(1, 2) - eps_v7, Fr(-1), Fr(1, 2) + 2 * eps_v7, Fr(0), -eps_v7, Fr(0), eta_v7]), Fr(0), None, stats),
                "Bernstein V_7 tail poly failed")
        ub_tail = Fr(1) - (2 + s_cut) * eps_v7 + V1.M6_REAL_V7 * eta_v7
        require(max_low <= Fr(cert["claim_v7_low"]) <= Fr(cert["claim_v7_global"]) and ub_tail <= Fr(cert["claim_v7_global"]) < 1,
                "Bernstein V_7 global bound failed")

        chi_cut = Fr(cert["h43_chi_cut"])
        rows_h = cert["rows_h43_slice"]
        require(rows_h and Fr(rows_h[0]["s_lo"]) == 0 and Fr(rows_h[-1]["s_hi"]) == Fr(3, 2) * chi_cut, "H_{4,3} cover failed")
        prev_h, max_sl = Fr(0), Fr(0)
        for r in rows_h:
            require(Fr(r["s_lo"]) == prev_h, "H_{4,3} gap")
            prev_h = Fr(r["s_hi"])
            b = verify_v7_row_bernstein(r, Fr(5, 2) * V1.M6_CPLX_H43, stats)
            if b > max_sl:
                max_sl = b
        require((pi_hi ** 2) * (max_sl ** 2) <= 8 * (Fr(cert["claim_h43_low"]) ** 2), "Bernstein H_{4,3} low failed")
        Bh = Fr(cert["h43_tail_B"])
        require(Bh >= 2, "Bh < 2")
        eps_h = Fr(1, 2) / ((Bh + 1) ** 2)
        eta_h = eps_h * ((Bh * Bh - 1) ** 2) / (Bh ** 6)
        require(check_pos(Poly([Fr(1, 2) - eps_h, Fr(-1), Fr(1, 2) + 2 * eps_h, Fr(0), -eps_h, Fr(0), eta_h]), Fr(0), None, stats),
                "Bernstein H_{4,3} tail poly failed")
        ub_ht = Fr(1) - (1 + chi_cut) * eps_h + V1.M6_CPLX_H43 * eta_h
        require(Fr(cert["claim_h43_low"]) <= Fr(cert["claim_h43_global"]) and ub_ht <= Fr(cert["claim_h43_global"]) < 1,
                "Bernstein H_{4,3} global failed")
        if not quiet:
            print(f"  [OK] Bernstein check of `cert_v7_458.json` passed ({stats['leaves']} Bernstein leaves, max depth {stats['max_depth']})!")
    else:
        raise VerificationError(f"Unknown certificate kind: {kind!r}")


def main(argv=None):
    t0 = time.monotonic_ns()
    self_audit_ast()
    argv = list(sys.argv[1:] if argv is None else argv)
    quiet = "--quiet" in argv
    args = [a for a in argv if not a.startswith("--")]

    paths = [pathlib.Path(a) for a in args] if args else [DEFAULT_SHIFTED_CERT, DEFAULT_V7_CERT]
    for p in paths:
        cert = json.loads(p.read_text(encoding="utf-8"))
        verify_certificate_dict_bernstein(cert, quiet=quiet)

    dt_ms = (time.monotonic_ns() - t0) // 1_000_000
    if not quiet:
        print(f"ALL KADS458 SECONDARY BERNSTEIN VERIFICATIONS PASSED IN {dt_ms} ms (0 floats, 0 asserts).")


if __name__ == "__main__":
    main()
