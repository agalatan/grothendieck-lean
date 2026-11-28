#!/usr/bin/env python3
"""Second independent exact pure-stdlib verifier (Bernstein subdivision + Laplace det_mat + 8-var symbolic check)
for both `cert_v3_458.json` and `cert_v5_458.json`.

Agent-ID: gemini-8732
Task: #458 (tag KCS458)
Usage:
    python3 -IB verify_bernstein.py [CERT.json] [--quiet] [--generic]

Arithmetic discipline:
  - 100% Python 3 standard library (`ast`, `fractions`, `json`, `math`, `pathlib`, `sys`, `time`).
  - Zero floating-point operations or literals anywhere in this file (`self_audit_ast()`).
  - Zero `assert` statements (`-O`-safe `require(...)` throughout).
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

DEFAULT_V3_CERT = HERE / "cert_v3_458.json"
DEFAULT_V5_CERT = HERE / "cert_v5_458.json"
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
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name):
            require(node.func.id not in FORBIDDEN_CALLS, f"Forbidden call {node.func.id} at line {node.lineno}")


def dec_ceil10(q):
    q = Fr(q)
    require(q >= 0, "dec_ceil10 expects nonnegative Fraction")
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return "%d.%010d" % (n // 10**10, n % 10**10)


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

    def integral_from(self, r0, val_r0):
        q = Poly([Fr(0)] + [coef / (i + 1) for i, coef in enumerate(self.c)])
        return q + (val_r0 - q(r0))

    def shift_scale(self, a, w):
        res = Poly()
        lin = Poly([a, w])
        for coef in reversed(self.c):
            res = res * lin + coef
        return res


R_VAR = Poly([Fr(0), Fr(1)])


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
# MULTIVARIATE POLYNOMIAL RING Q[r][tau, eta, sigma_r, nu_r, w_tau, w_teta, w_eta]
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
    if not A or not B:
        return {}
    out = {}
    for k1, v1 in A.items():
        for k2, v2 in B.items():
            ek = tuple(a + b for a, b in zip(k1, k2))
            nv = out.get(ek, Poly()) + (v1 * v2)
            if nv:
                out[ek] = nv
            else:
                out.pop(ek, None)
    return out


def mv_poly(p):
    p = Poly.wrap(p)
    return {(0, 0, 0, 0, 0, 0, 0): p} if p else {}


def mv_var(idx):
    e = [0] * 7
    e[idx] = 1
    return {tuple(e): Poly([Fr(1)])}


MV_ONE = mv_poly(Fr(1))
MV_TAU, MV_ETA, MV_SIG, MV_NU, MV_WT, MV_WTE, MV_WE = (mv_var(i) for i in range(7))


# ==============================================================================
# INDEPENDENT BERNSTEIN + SYMBOLIC MULTIVARIATE VERIFIER FOR V_3 (`cert_v3_458.json`)
# ==============================================================================
def verify_v3_row_bernstein(row):
    try:
        V1.verify_structural_constants_v3()
    except ValueError as exc:
        raise VerificationError(str(exc)) from exc
    stats = {"leaves": 0, "max_depth": 0}
    s_lo, s_hi = Fr(row["s_lo"]), Fr(row["s_hi"])
    require(0 <= s_lo < s_hi <= V1.S_COVER_V3, f"invalid slab [{s_lo}, {s_hi}]")
    B_bound = Fr(row["bound"])
    require(B_bound > 0, "row bound <= 0")

    knots = [Fr(x) for x in row["knots"]]
    K = len(knots) - 1
    require(K >= 2 and knots[0] == 0 and all(knots[i] < knots[i + 1] for i in range(K)), "invalid knots")
    kden = Fr(row["knot_den"])

    def get_int_arr(nm, exp_len):
        raw = row[nm]
        require(isinstance(raw, list) and len(raw) == exp_len and all(isinstance(x, int) for x in raw), f"bad {nm}")
        return [Fr(x, kden) for x in raw]

    phi1 = get_int_arr("phi1", K + 1)
    phi2 = get_int_arr("phi2", K + 1)
    phi3 = get_int_arr("phi3", K + 1)
    psi4 = get_int_arr("psi4", K + 1)
    psi7 = get_int_arr("psi7", K + 1)
    lB = get_int_arr("lB", K + 1)
    Ae = get_int_arr("Ae", K + 1)
    t2 = get_int_arr("t2", K + 1)
    xe = get_int_arr("xe", K + 1)
    xte = get_int_arr("xte", K + 1)
    lnu0 = get_int_arr("lnu0", K + 1)
    lnu_op = get_int_arr("lnu_op", K + 1)
    alpha_op = get_int_arr("alpha_op", K + 1)

    tau3 = [[Fr(x, kden) for x in sub] for sub in row["tau3"]]
    nu0_sq = [[Fr(x, kden) for x in sub] for sub in row["nu0_sq"]]
    op_c = [[Fr(x, kden) for x in sub] for sub in row["op_c"]]
    xt0_tail, xt2_tail, xe0_tail, xe2_tail = (Fr(x) for x in row["tail_xi"])

    lam0, lam1, lam2, lam3 = (Fr(x) for x in row["lam"])
    m00, m01, m11 = (Fr(x) for x in row["m_ker"])
    mu00, mu01, mu11 = (Fr(x) for x in row["m_w"])
    gvt, gve = (Fr(x) for x in row["gam"])
    lam_nu2 = Fr(row["lam_nu2"])
    sqrt_m_ub = Fr(row["sqrt_m_ub"])
    lam_e3, lam_e4, delta_m11 = (Fr(x) for x in row["eta_high"])

    require(lam3 > 0 and lam_nu2 > 0 and sqrt_m_ub > 0 and 36 * sqrt_m_ub * sqrt_m_ub >= s_hi, "params failed")
    require(lam_e4 > 0 and lam_e3 <= 0 and delta_m11 >= 0, "eta_high signs failed")
    eta_high_mat = [[Poly([lam_e4]), Poly([lam_e3 / 2])], [Poly([lam_e3 / 2]), Poly([delta_m11])]]
    require(det_mat(eta_high_mat)(Fr(0)) >= 0, "eta_high PSD failed")

    m11_eff = m11 - delta_m11
    M_ker_mat = [[Poly([m00]), Poly([m01])], [Poly([m01]), Poly([m11])]]
    M_w_mat = [[Poly([mu00]), Poly([mu01])], [Poly([mu01]), Poly([mu11])]]
    require(m00 > 0 and m11_eff > 0 and det_mat(M_ker_mat)(Fr(0)) > 0, "M_ker not PD")
    Dw = det_mat(M_w_mat)(Fr(0))
    require(mu00 > 0 and Dw > 0, "M_w not PD")
    require(xt0_tail >= 0 and xt2_tail >= 0 and xe0_tail >= 0 and xe2_tail >= 0, "negative tail_xi")
    require(phi2[K] == 0 and phi3[K] == 0, "phi2(r_K) or phi3(r_K) nonzero")
    require(psi4[0] == 0 and psi4[K] == 0, "psi4 boundary failed")
    require(psi7[0] == 0 and psi7[K] == 0, "psi7 boundary failed")
    for k in range(K + 1):
        require(Ae[k] > 0 and t2[k] > 0 and alpha_op[k] > 0, f"Ae, t2 or alpha_op <= 0 at knot {k}")
        require(xe[k] >= 0 and xte[k] >= 0, f"xe or xte < 0 at knot {k}")

    def trap_forward(arr):
        out = [Fr(0)]
        for j in range(K):
            out.append(out[-1] + Fr(1, 2) * (arr[j] + arr[j + 1]) * (knots[j + 1] - knots[j]))
        return out

    G1_kn, G2_kn, G3_kn = trap_forward(phi1), trap_forward(phi2), trap_forward(phi3)
    require(G2_kn[K] == 0 and G3_kn[K] == 0, "compact support failed")
    psi4_int, psi7_int = trap_forward(psi4), trap_forward(psi7)
    H4_kn = [psi4_int[j] - psi4_int[K] for j in range(K + 1)]
    H7_kn = [psi7_int[j] - psi7_int[K] for j in range(K + 1)]

    V_POLY = R_VAR * R_VAR
    MV_DT = mv_sub(MV_TAU, MV_ONE)
    MV_DE = mv_sub(MV_ETA, MV_ONE)
    MV_DE2 = mv_mul(MV_DE, MV_DE)
    MV_DE3 = mv_mul(MV_DE2, MV_DE)
    MV_DE4 = mv_mul(MV_DE2, MV_DE2)

    raw_moments_base = mv_poly(lam0 + lam1 * V_POLY + lam2 * (V_POLY * V_POLY) + lam3 * (V_POLY * V_POLY * V_POLY))
    raw_moments_base = mv_add(raw_moments_base, mv_mul(mv_poly(m00), mv_mul(MV_DT, MV_DT)))
    raw_moments_base = mv_add(raw_moments_base, mv_mul(mv_poly(2 * m01), mv_mul(MV_DT, MV_DE)))
    raw_moments_base = mv_add(raw_moments_base, mv_mul(mv_poly(m11), MV_DE2))
    raw_moments_base = mv_add(raw_moments_base, mv_add(mv_mul(mv_poly(lam_e3), MV_DE3), mv_mul(mv_poly(lam_e4), MV_DE4)))
    raw_moments_base = mv_add(
        raw_moments_base,
        mv_add(mv_mul(mv_poly(mu00), MV_WT), mv_add(mv_mul(mv_poly(2 * mu01), MV_WTE), mv_mul(mv_poly(mu11), MV_WE))),
    )
    raw_moments_base = mv_add(
        raw_moments_base,
        mv_add(mv_mul(mv_poly(gvt * V_POLY), MV_DT), mv_mul(mv_poly(gve * V_POLY), MV_DE)),
    )

    for k in range(K + 1):
        tail = (k == K)
        a_lo = knots[k]
        b_hi = None if tail else knots[k + 1]

        def lin_poly(arr, k=k, tail=tail, a_lo=a_lo, b_hi=b_hi):
            if tail:
                return Poly([arr[K]])
            sl = (arr[k + 1] - arr[k]) / (b_hi - a_lo)
            return Poly([arr[k] - sl * a_lo, sl])

        p1, xte_p = lin_poly(phi1), lin_poly(xte)
        g1 = p1.integral_from(a_lo, G1_kn[k])
        if not tail:
            require(g1(b_hi) == G1_kn[k + 1], "G1 mismatch")
            p2, p3, ps4, ps7 = lin_poly(phi2), lin_poly(phi3), lin_poly(psi4), lin_poly(psi7)
            lb_p, ae_p, t2_p, xe_p = lin_poly(lB), lin_poly(Ae), lin_poly(t2), lin_poly(xe)
            lnu0_p, lnu_op_p, alpha_p = lin_poly(lnu0), lin_poly(lnu_op), lin_poly(alpha_op)
            g2, g3 = p2.integral_from(a_lo, G2_kn[k]), p3.integral_from(a_lo, G3_kn[k])
            h4, h7 = ps4.integral_from(a_lo, H4_kn[k]), ps7.integral_from(a_lo, H7_kn[k])
            require(g2(b_hi) == G2_kn[k + 1] and g3(b_hi) == G3_kn[k + 1], "G2/G3 mismatch")
            require(h4(b_hi) == H4_kn[k + 1] and h7(b_hi) == H7_kn[k + 1], "H4/H7 mismatch")

            B_mat = [[ae_p, lb_p], [V1.SIGMA_SQ_COEFF_V3 * lb_p, t2_p]]
            require(check_pos(det_mat(B_mat), a_lo, b_hi, stats), f"Bernstein D_B failed at {k}")

            p_w1 = Poly([-a_lo, Fr(1)]) * (Fr(1) / (b_hi - a_lo))

            def w1_poly(coeffs):
                acc, pw = Poly(), Poly([Fr(1)])
                for c_ in coeffs:
                    acc = acc + c_ * pw
                    pw = pw * p_w1
                return acc

            nu0_sq_p, op_c_p, T3_p = w1_poly(nu0_sq[k]), w1_poly(op_c[k]), w1_poly(tau3[k])

            nu0_mat = [[Poly([lam_nu2]), Fr(1, 2) * lnu0_p], [Fr(1, 2) * lnu0_p, nu0_sq_p]]
            op_mat = [[alpha_p, Fr(1, 2) * lnu_op_p], [Fr(1, 2) * lnu_op_p, op_c_p]]
            require(check_pos(det_mat(nu0_mat), a_lo, b_hi, stats), f"Bernstein D_nu0 failed at {k}")
            require(check_pos(det_mat(op_mat), a_lo, b_hi, stats), f"Bernstein D_op failed at {k}")

            Lsig = 2 * (g2 + ps4)
            Lnu = 2 * (g3 + ps7)
            Lnu_rem = Lnu - lnu0_p - lnu_op_p
            lA_p = Lsig - lb_p
            T3_exact = (V1.GRAM_COEFF_V3 / Dw) * (mu11 * lA_p * lA_p - 2 * mu01 * lA_p * Lnu_rem + mu00 * Lnu_rem * Lnu_rem)
            require(check_pos(T3_p - T3_exact, a_lo, b_hi, stats), f"Bernstein tau3 failed at {k}")
            xt_p = Poly()
            lam_nu2_here = Poly([lam_nu2])
        else:
            p2 = p3 = ps4 = ps7 = g2 = g3 = h4 = h7 = lb_p = ae_p = t2_p = lA_p = Lnu_rem = T3_exact = T3_p = Poly()
            lnu0_p = lnu_op_p = alpha_p = nu0_sq_p = op_c_p = lam_nu2_here = Poly()
            rK2 = knots[K] * knots[K]
            xt_p = Poly([xt0_tail - xt2_tail * rK2, Fr(0), xt2_tail])
            xe_p = Poly([xe0_tail - xe2_tail * rK2, Fr(0), xe2_tail])

        P12 = Poly([m01]) + Fr(3, 2) * p3 - Fr(1, 2) * xte_p - Fr(1, 2) * V1.OP_COEFF_V3 * sqrt_m_ub * alpha_p
        P11 = Poly([m00]) + 3 * p2 - t2_p
        P02 = Fr(1, 2) * (Poly([-2 * m01 - 2 * m11_eff, Fr(0), gve]) - 3 * R_VAR * g3 + 4 * h4 - 2 * h7 - ae_p - xe_p)
        P01 = Fr(1, 2) * (Poly([-2 * m00 - 2 * m01, Fr(0), gvt]) + 3 * (p1 - p2 - p3) - 3 * R_VAR * g2 - 4 * h4 - T3_p - xt_p)
        P00 = (
            Poly([lam0 + m00 + 2 * m01 + m11_eff, Fr(-1), lam1 - gvt - gve, Fr(0), lam2, Fr(0), lam3])
            + 3 * R_VAR * (g2 + g3 - g1) + 2 * h7 - nu0_sq_p - op_c_p
        )

        P_ord = [[Poly([m11_eff]), P12, P02], [P12, P11, P01], [P02, P01, P00]]
        require(det_mat([[P_ord[0][0]]])(Fr(0)) > 0, f"m11_eff <= 0 at {k}")
        require(check_pos(det_mat([r[:2] for r in P_ord[:2]]), a_lo, b_hi, stats), f"Bernstein M2 failed at {k}")
        require(check_pos(det_mat(P_ord), a_lo, b_hi, stats), f"Bernstein M3 failed at {k}")

        # --- EXACT 8-VARIABLE SYMBOLIC IDENTITY CHECK OF RAW RHS - r ---
        raw_moments = mv_add(raw_moments_base, mv_mul(mv_poly(lam_nu2_here), mv_mul(MV_NU, MV_NU)))
        Br1 = mv_sub(mv_mul(mv_poly(3 * p1), MV_TAU), mv_poly(3 * R_VAR * g1))
        Br2 = mv_add(
            mv_sub(mv_mul(mv_poly(3 * p2), mv_mul(MV_TAU, MV_DT)), mv_mul(mv_poly(3 * R_VAR * g2), MV_DT)),
            mv_mul(mv_poly(2 * g2), MV_SIG),
        )
        Br3 = mv_add(
            mv_sub(mv_mul(mv_poly(3 * p3), mv_mul(MV_TAU, MV_DE)), mv_mul(mv_poly(3 * R_VAR * g3), MV_DE)),
            mv_mul(mv_poly(2 * g3), MV_NU),
        )
        Br4 = mv_sub(mv_mul(mv_poly(2 * ps4), MV_SIG), mv_mul(mv_poly(4 * h4), mv_sub(MV_TAU, MV_ETA)))
        Br7 = mv_sub(mv_mul(mv_poly(2 * ps7), MV_NU), mv_mul(mv_poly(2 * h7), MV_DE))

        rhs_minus_r = mv_sub(
            mv_add(raw_moments, mv_add(Br1, mv_add(Br2, mv_add(Br3, mv_add(Br4, Br7))))),
            mv_poly(R_VAR),
        )

        # Sum of all certified nonnegative cones (Note on tail k==K, lam_nu2 * nu_r^2 >= 0 is dropped, so lam_nu2_here=0):
        C1 = mv_add(
            mv_add(mv_mul(mv_poly(mu00), MV_WT), mv_add(mv_mul(mv_poly(2 * mu01), MV_WTE), mv_mul(mv_poly(mu11), MV_WE))),
            mv_add(mv_mul(mv_poly(lA_p), MV_SIG), mv_add(mv_mul(mv_poly(Lnu_rem), MV_NU), mv_mul(mv_poly(T3_exact), MV_TAU))),
        )
        C2 = mv_mul(mv_poly((T3_p - T3_exact) + xt_p), MV_TAU)
        C3 = mv_add(mv_mul(mv_poly(ae_p), MV_ETA), mv_add(mv_mul(mv_poly(lb_p), MV_SIG), mv_mul(mv_poly(t2_p), mv_mul(MV_TAU, MV_TAU))))
        C4 = mv_add(mv_mul(mv_poly(xe_p), MV_ETA), mv_mul(mv_poly(xte_p), mv_mul(MV_TAU, MV_ETA)))
        # Cone nu0: lam_nu2 * nu_r^2 + lnu0 * nu_r + nu0_sq >= 0
        C_nu0 = mv_add(mv_mul(mv_poly(lam_nu2_here), mv_mul(MV_NU, MV_NU)),
                       mv_add(mv_mul(mv_poly(lnu0_p), MV_NU), mv_poly(nu0_sq_p)))
        # Cone op: (3 * sqrt_m_ub * alpha) * tau * eta + lnu_op * nu_r + op_c >= alpha * nu_r^2 + lnu_op * nu_r + op_c >= 0
        C_op = mv_add(mv_mul(mv_poly(V1.OP_COEFF_V3 * sqrt_m_ub * alpha_p), mv_mul(MV_TAU, MV_ETA)),
                      mv_add(mv_mul(mv_poly(lnu_op_p), MV_NU), mv_poly(op_c_p)))
        # Cone eta_high: delta_m11 * (eta-1)^2 + lam_e3 * (eta-1)^3 + lam_e4 * (eta-1)^4 >= 0
        C_eh = mv_add(mv_mul(mv_poly(delta_m11), MV_DE2), mv_add(mv_mul(mv_poly(lam_e3), MV_DE3), mv_mul(mv_poly(lam_e4), MV_DE4)))

        C5 = mv_poly(P00)
        C5 = mv_add(C5, mv_mul(mv_poly(2 * P01), MV_TAU))
        C5 = mv_add(C5, mv_mul(mv_poly(2 * P02), MV_ETA))
        C5 = mv_add(C5, mv_mul(mv_poly(P11), mv_mul(MV_TAU, MV_TAU)))
        C5 = mv_add(C5, mv_mul(mv_poly(2 * P12), mv_mul(MV_TAU, MV_ETA)))
        C5 = mv_add(C5, mv_mul(mv_poly(m11_eff), mv_mul(MV_ETA, MV_ETA)))

        cones_sum = mv_add(C1, mv_add(C2, mv_add(C3, mv_add(C4, mv_add(C_nu0, mv_add(C_op, mv_add(C_eh, C5)))))))
        require(rhs_minus_r == cones_sum, f"V_3 8-variable symbolic identity failed on interval {k}")

    # Independent Bernstein check of the 4-corner (s_*, theta_*) moment polynomials on [x_lo, 1]:
    sig_lo, sig_hi, r_anch, x_lo = Fr(row["sig_lo"]), Fr(row["sig_hi"]), Fr(row["r_anch"]), Fr(row["x_lo"])
    require(sig_lo >= 0 and sig_lo * sig_lo >= s_lo ** 3 and sig_hi > 0 and sig_hi * sig_hi >= s_hi ** 3, "sig failed")
    require(r_anch >= 0 and s_lo <= r_anch * r_anch <= s_hi, "r_anch failed")
    require(0 <= x_lo < 1, "invalid x_lo")
    if s_lo <= 36:
        require(x_lo == 0, "x_lo must be 0 when s_lo <= 36")
    else:
        require(36 + 54 * x_lo * x_lo <= s_lo, "36 + 54 x_lo^2 > s_lo")
    s_mid = (s_lo + s_hi) / 2
    C0 = lam0 + lam1 + 3 * lam2 + 15 * lam3
    Cs = lam2 + 15 * lam3 + gvt / 3
    Cm = 8 * m00 + 8 * m01 + 2 * m11 + 16 * mu00 + 16 * mu01 + 4 * mu11 + 6 * gve
    Cu = 6 * m00 + 24 * mu00
    qx = Poly([Fr(36), Fr(0), Fr(54)])
    qx2, qx3 = qx * qx, qx * qx * qx
    P6x = Poly([Fr(0), Fr(32400), Fr(9720), Fr(14580)])

    for s_ep, sig_sec in ((s_lo, sig_lo), (s_hi, sig_hi)):
        sig_tan = Fr(3, 2) * r_anch * s_ep - Fr(1, 2) * (r_anch ** 3)
        ssq_sec = (s_lo + s_hi) * s_ep - s_lo * s_hi
        ssq_tan = 2 * s_mid * s_ep - s_mid * s_mid
        s52_sec = s_ep * sig_sec
        for theta in (0, 1):
            c_q1_pos = (1 - theta) * (V1.WICK6_NEG_COEFF_V3 * lam3 - V1.ETA3_COEFF_V3 * lam_e3) * ssq_tan
            c_q1_neg = ((1 - theta) * V1.NU2_T3_COEFF_V3 * lam_nu2 + (V1.ETA4_M2_COEFF_V3 + theta * V1.ETA4_T3_COEFF_V3) * lam_e4) * ssq_sec
            Nx = (B_bound - C0 - s_ep * Cs) * qx3 - Poly([s_ep * Cm, Fr(0), s_ep * Cu]) * qx2 + (c_q1_pos - c_q1_neg) * qx
            r_q1 = (lam3 * sig_sec) * P6x + Poly([
                lam_nu2 * (V1.NU2_M32_COEFF_V3 + theta * V1.NU2_T3_COEFF_V3) * sig_sec
                - theta * (V1.WICK6_NEG_COEFF_V3 * lam3 - V1.ETA3_COEFF_V3 * lam_e3) * sig_tan
            ])
            Rx = r_q1 * qx + Poly([(1 - theta) * V1.ETA4_T3_COEFF_V3 * lam_e4 * s52_sec])
            require(pos_on_segment(Nx, x_lo, Fr(1), stats), "Bernstein V_3 Nx failed")
            require(pos_on_segment(Nx * Nx - Rx * Rx * qx, x_lo, Fr(1), stats), "Bernstein V_3 sq failed")

    return dict(ok=True, K=K, bound=B_bound, s_lo=s_lo, s_hi=s_hi, stats=stats)


# ==============================================================================
# INDEPENDENT BERNSTEIN + SYMBOLIC MULTIVARIATE VERIFIER FOR V_5 (`cert_v5_458.json`)
# ==============================================================================
def verify_v5_row_bernstein(row):
    try:
        V1.verify_structural_constants_v5()
    except ValueError as exc:
        raise VerificationError(str(exc)) from exc
    stats = {"leaves": 0, "max_depth": 0}
    s_lo, s_hi = Fr(row["s_lo"]), Fr(row["s_hi"])
    m6_cap = Fr(row["m6_cap"])
    B_bound = Fr(row["bound"])
    require(0 <= s_lo < s_hi <= V1.S_COVER_V5 and m6_cap > 0 and B_bound > 0, "invalid V_5 row header")
    knots = [Fr(x) for x in row["knots"]]
    K = len(knots) - 1
    require(K >= 2 and knots[0] == 0 and all(knots[i] < knots[i + 1] for i in range(K)), "invalid V_5 knots")
    kden = Fr(row["knot_den"])

    def get_int_arr(nm, exp_len):
        raw = row[nm]
        require(isinstance(raw, list) and len(raw) == exp_len and all(isinstance(x, int) for x in raw), f"bad V_5 {nm}")
        return [Fr(x, kden) for x in raw]

    phi1 = get_int_arr("phi1", K + 1)
    phi2 = get_int_arr("phi2", K + 1)
    phi3 = get_int_arr("phi3", K + 1)
    psi4 = get_int_arr("psi4", K + 1)
    lB = get_int_arr("lB", K + 1)
    Ae = get_int_arr("Ae", K + 1)
    t2 = get_int_arr("t2", K + 1)
    xe = get_int_arr("xe", K + 1)
    xte = get_int_arr("xte", K + 1)
    tau3 = [[Fr(x, kden) for x in sub] for sub in row["tau3"]]
    xt0_tail, xt2_tail, xe0_tail, xe2_tail = (Fr(x) for x in row["tail_xi"])

    lam0, lam1, lam2, lam3 = (Fr(x) for x in row["lam"])
    m00, m01, m11 = (Fr(x) for x in row["m_ker"])
    mu00, mu01, mu11 = (Fr(x) for x in row["m_w"])
    gvt1, gvt2 = (Fr(x) for x in row["gam"])

    M_ker_mat = [[Poly([m00]), Poly([m01])], [Poly([m01]), Poly([m11])]]
    M_w_mat = [[Poly([mu00]), Poly([mu01])], [Poly([mu01]), Poly([mu11])]]
    require(lam3 > 0 and m00 > 0 and det_mat(M_ker_mat)(Fr(0)) > 0, "V_5 M_ker failed")
    Dw = det_mat(M_w_mat)(Fr(0))
    require(mu00 > 0 and Dw > 0, "V_5 M_w failed")
    require(xt0_tail >= 0 and xt2_tail >= 0 and xe0_tail >= 0 and xe2_tail >= 0, "V_5 negative tail_xi")
    require(phi2[K] == 0 and phi3[K] == 0, "V_5 phi2/phi3(r_K) != 0")
    require(psi4[0] == 0 and psi4[K] == 0, "V_5 psi4 boundary != 0")
    for k in range(K + 1):
        require(Ae[k] > 0 and t2[k] > 0 and xe[k] >= 0 and xte[k] >= 0, f"V_5 knot sign failed at {k}")

    def trap_forward(arr):
        out = [Fr(0)]
        for j in range(K):
            out.append(out[-1] + Fr(1, 2) * (arr[j] + arr[j + 1]) * (knots[j + 1] - knots[j]))
        return out

    G1_kn, G2_kn, G3_kn = trap_forward(phi1), trap_forward(phi2), trap_forward(phi3)
    require(G2_kn[K] == 0 and G3_kn[K] == 0, "V_5 compact support failed")
    psi4_int = trap_forward(psi4)
    H4_kn = [psi4_int[j] - psi4_int[K] for j in range(K + 1)]

    V_POLY = R_VAR * R_VAR
    MV_DT = mv_sub(MV_TAU, MV_ONE)
    MV_DE = mv_sub(MV_ETA, MV_ONE)

    raw_moments = mv_poly(lam0 + lam1 * V_POLY + lam2 * (V_POLY * V_POLY) + lam3 * (V_POLY * V_POLY * V_POLY))
    raw_moments = mv_add(raw_moments, mv_mul(mv_poly(m00), mv_mul(MV_DT, MV_DT)))
    raw_moments = mv_add(raw_moments, mv_mul(mv_poly(2 * m01), mv_mul(MV_DT, MV_DE)))
    raw_moments = mv_add(raw_moments, mv_mul(mv_poly(m11), mv_mul(MV_DE, MV_DE)))
    raw_moments = mv_add(raw_moments, mv_add(mv_mul(mv_poly(mu00), MV_WT),
                                             mv_add(mv_mul(mv_poly(2 * mu01), MV_WTE), mv_mul(mv_poly(mu11), MV_WE))))
    raw_moments = mv_add(raw_moments, mv_add(mv_mul(mv_poly(gvt1 * V_POLY), MV_DT), mv_mul(mv_poly(gvt2 * V_POLY), MV_DE)))

    for k in range(K + 1):
        tail = (k == K)
        a_lo = knots[k]
        b_hi = None if tail else knots[k + 1]
        lin_poly = lambda arr, k=k, tail=tail, a_lo=a_lo, b_hi=b_hi: Poly([arr[K]]) if tail else Poly(
            [arr[k] - ((arr[k + 1] - arr[k]) / (b_hi - a_lo)) * a_lo, (arr[k + 1] - arr[k]) / (b_hi - a_lo)]
        )
        p1, xte_p = lin_poly(phi1), lin_poly(xte)
        g1 = p1.integral_from(a_lo, G1_kn[k])
        if not tail:
            p2, p3, ps4 = lin_poly(phi2), lin_poly(phi3), lin_poly(psi4)
            lb_p, ae_p, t2_p, xe_p = lin_poly(lB), lin_poly(Ae), lin_poly(t2), lin_poly(xe)
            g2, g3, h4 = p2.integral_from(a_lo, G2_kn[k]), p3.integral_from(a_lo, G3_kn[k]), ps4.integral_from(a_lo, H4_kn[k])
            B_mat = [[ae_p, lb_p], [V1.SIGMA_SQ_COEFF_V5 * lb_p, t2_p]]
            require(check_pos(det_mat(B_mat), a_lo, b_hi, stats), "Bernstein V_5 D_B failed")

            Lsig, Lnu = 2 * (g2 + ps4), 2 * g3
            lA_p = Lsig - lb_p
            T3_exact = (V1.GRAM_COEFF_V5 / Dw) * (mu11 * lA_p * lA_p - 2 * mu01 * lA_p * Lnu + mu00 * Lnu * Lnu)
            p_w1 = Poly([-a_lo, Fr(1)]) * (Fr(1) / (b_hi - a_lo))
            T3_p, pw = Poly(), Poly([Fr(1)])
            for m in range(5):
                T3_p = T3_p + tau3[k][m] * pw
                pw = pw * p_w1
            require(check_pos(T3_p - T3_exact, a_lo, b_hi, stats), "Bernstein V_5 tau3 failed")
            xt_p = Poly()
        else:
            p2 = p3 = ps4 = g2 = g3 = h4 = lb_p = ae_p = t2_p = lA_p = Lnu = T3_exact = T3_p = Poly()
            rK2 = knots[K] * knots[K]
            xt_p = Poly([xt0_tail - xt2_tail * rK2, Fr(0), xt2_tail])
            xe_p = Poly([xe0_tail - xe2_tail * rK2, Fr(0), xe2_tail])

        P12 = Poly([m01]) + Fr(5, 2) * p3 - Fr(1, 2) * xte_p
        P11 = Poly([m00]) + 5 * p2 - t2_p
        P02 = Fr(1, 2) * (Poly([-2 * m01 - 2 * m11, Fr(0), gvt2]) - 5 * R_VAR * g3 + 8 * h4 - ae_p - xe_p)
        P01 = Fr(1, 2) * (Poly([-2 * m00 - 2 * m01, Fr(0), gvt1]) + 5 * (p1 - p2 - p3) - 5 * R_VAR * g2 - 8 * h4 - T3_p - xt_p)
        P00 = Poly([lam0 + m00 + 2 * m01 + m11, Fr(-1), lam1 - gvt1 - gvt2, Fr(0), lam2, Fr(0), lam3]) + 5 * R_VAR * (g2 + g3 - g1)

        P_ord = [[Poly([m11]), P12, P02], [P12, P11, P01], [P02, P01, P00]]
        require(det_mat([[P_ord[0][0]]])(Fr(0)) > 0, "V_5 m11 <= 0")
        require(check_pos(det_mat([r[:2] for r in P_ord[:2]]), a_lo, b_hi, stats), "V_5 M2 failed")
        require(check_pos(det_mat(P_ord), a_lo, b_hi, stats), "V_5 M3 failed")

        # 8-variable symbolic check on V_5:
        Br1 = mv_sub(mv_mul(mv_poly(5 * p1), MV_TAU), mv_poly(5 * R_VAR * g1))
        Br2 = mv_add(
            mv_sub(mv_mul(mv_poly(5 * p2), mv_mul(MV_TAU, MV_DT)), mv_mul(mv_poly(5 * R_VAR * g2), MV_DT)),
            mv_mul(mv_poly(2 * g2), MV_SIG),
        )
        Br3 = mv_add(
            mv_sub(mv_mul(mv_poly(5 * p3), mv_mul(MV_TAU, MV_DE)), mv_mul(mv_poly(5 * R_VAR * g3), MV_DE)),
            mv_mul(mv_poly(2 * g3), MV_NU),
        )
        Br4 = mv_sub(mv_mul(mv_poly(2 * ps4), MV_SIG), mv_mul(mv_poly(8 * h4), mv_sub(MV_TAU, MV_ETA)))
        rhs_minus_r = mv_sub(mv_add(raw_moments, mv_add(Br1, mv_add(Br2, mv_add(Br3, Br4)))), mv_poly(R_VAR))

        C1 = mv_add(
            mv_add(mv_mul(mv_poly(mu00), MV_WT), mv_add(mv_mul(mv_poly(2 * mu01), MV_WTE), mv_mul(mv_poly(mu11), MV_WE))),
            mv_add(mv_mul(mv_poly(lA_p), MV_SIG), mv_add(mv_mul(mv_poly(Lnu), MV_NU), mv_mul(mv_poly(T3_exact), MV_TAU))),
        )
        C2 = mv_mul(mv_poly((T3_p - T3_exact) + xt_p), MV_TAU)
        C3 = mv_add(mv_mul(mv_poly(ae_p), MV_ETA), mv_add(mv_mul(mv_poly(lb_p), MV_SIG), mv_mul(mv_poly(t2_p), mv_mul(MV_TAU, MV_TAU))))
        C4 = mv_add(mv_mul(mv_poly(xe_p), MV_ETA), mv_mul(mv_poly(xte_p), mv_mul(MV_TAU, MV_ETA)))
        C5 = mv_poly(P00)
        C5 = mv_add(C5, mv_mul(mv_poly(2 * P01), MV_TAU))
        C5 = mv_add(C5, mv_mul(mv_poly(2 * P02), MV_ETA))
        C5 = mv_add(C5, mv_mul(mv_poly(P11), mv_mul(MV_TAU, MV_TAU)))
        C5 = mv_add(C5, mv_mul(mv_poly(2 * P12), mv_mul(MV_TAU, MV_ETA)))
        C5 = mv_add(C5, mv_mul(mv_poly(m11), mv_mul(MV_ETA, MV_ETA)))
        require(rhs_minus_r == mv_add(C1, mv_add(C2, mv_add(C3, mv_add(C4, C5)))), f"V_5 symbolic check failed at {k}")

    for s_ep in (s_lo, s_hi):
        for kc in (1, 2, 3, 4):
            ak = Fr(5) * s_ep / (3 * (5 - kc))
            c1_k = Fr(5 - kc, 5)
            c2_k = Fr((5 - kc) * (4 - kc), 20)
            ev_tot = (
                lam0 + lam1 + lam2 * (3 + s_ep) + lam3 * m6_cap
                + gvt1 * (c1_k * ak) + gvt2 * (c2_k * ak)
                + m00 * (c1_k * c1_k * ak) + 2 * m01 * (c1_k * c2_k * ak) + m11 * (c2_k * c2_k * ak)
                + (2 * kc) * (mu00 * (c1_k * c1_k * ak) + 2 * mu01 * (c1_k * c2_k * ak) + mu11 * (c2_k * c2_k * ak))
            )
            require(ev_tot < B_bound, "V_5 Bernstein vertex check failed")

    return dict(ok=True, K=K, bound=B_bound, stats=stats)


def verify_certificate_dict_bernstein(cert, generic=False, quiet=False):
    self_audit_ast()
    require(isinstance(cert, dict) and "kind" in cert, "missing kind")
    try:
        V1.verify_certificate_dict(cert, generic=generic, quiet=True)
    except ValueError as exc:
        raise VerificationError(str(exc)) from exc

    tot_leaves, max_d = 0, 0
    if cert["kind"] == "v3_enhanced":
        for i, r in enumerate(cert["rows"]):
            res = verify_v3_row_bernstein(r)
            tot_leaves += res["stats"]["leaves"]
            max_d = max(max_d, res["stats"]["max_depth"])
            if not quiet:
                print(f"[Bern V_3] row {i:2d}  [{r['s_lo']:>6s}, {r['s_hi']:>6s}]  PASS  leaves={res['stats']['leaves']:4d}  bound <= {dec_ceil10(res['bound'])}")
        if not generic:
            # Independent Bernstein ray check on 4.18e sixth-moment clipping polynomial:
            ds = cert["downstream"]
            rho, t_clip, tang = Fr(cert["claim_complex"]), Fr(ds["d5_418e_sixth_moment"]), Fr(ds["d5_418e_sixth_tang"])
            e, eta, target, carrier, shift = Fr(39, 50), Fr(779, 10000), Fr(500, 701), Fr(431, 500), Fr(21, 200)
            x0 = rho * rho - (carrier * t_clip) ** 2
            z0 = ((1 + shift) ** 2) * x0
            upper0 = eta + (1 - eta) * t_clip * t_clip + (e - eta) * x0
            need0 = (upper0 - target) / eta + shift * shift * x0
            sc12 = 10**12
            r_up = Fr(isqrt(int(need0 * (sc12 ** 2))) + 1, sc12)
            d0 = 2 * z0 - 1 - r_up * (2 + tang * tang) / (2 * tang)
            d1 = z0 - r_up / (2 * tang)
            p_clip = Poly([d0 * d0 - 6 * r_up * r_up * z0, Fr(0), 2 * d0 * d1 - 9 * r_up * r_up * z0, -V1.C6_CPLX * r_up * r_up * z0, d1 * d1])
            st_clip = {"leaves": 0, "max_depth": 0}
            require(pos_on_ray(p_clip, Fr(0), st_clip), "Bernstein 4.18e clipping ray failed")
            tot_leaves += st_clip["leaves"]
        return dict(kind="v3_enhanced", leaves=tot_leaves, max_depth=max_d)

    if cert["kind"] == "v5_tower":
        for i, r in enumerate(cert["rows_v5"]):
            res = verify_v5_row_bernstein(r)
            tot_leaves += res["stats"]["leaves"]
            max_d = max(max_d, res["stats"]["max_depth"])
            if not quiet:
                print(f"[Bern V_5] row {i:2d}  [{r['s_lo']:>6s}, {r['s_hi']:>6s}]  PASS  leaves={res['stats']['leaves']:4d}  bound <= {dec_ceil10(res['bound'])}")
        for r in cert["rows_h32_slice"]:
            res = verify_v5_row_bernstein(r)
            tot_leaves += res["stats"]["leaves"]
            max_d = max(max_d, res["stats"]["max_depth"])
        # Independent Bernstein ray check on H_{3,2} and V_5 closed-form degree-6 polynomials:
        for B_p in (Fr(cert["h32_tail_B"]), Fr(26500)):
            eps_p = Fr(1) / (2 * ((B_p + 1) ** 2))
            eta_p = eps_p * ((B_p * B_p - 1) ** 2) / (B_p ** 6)
            p6 = Poly([Fr(1, 2) - eps_p, Fr(-1), Fr(1, 2) + 2 * eps_p, Fr(0), -eps_p, Fr(0), eta_p])
            st_p = {"leaves": 0, "max_depth": 0}
            require(pos_on_ray(p6, Fr(0), st_p), "Bernstein degree-6 ray check failed")
            tot_leaves += st_p["leaves"]
        return dict(kind="v5_tower", leaves=tot_leaves, max_depth=max_d)

    raise VerificationError(f"Unknown kind: {cert['kind']!r}")


def main(argv=None):
    self_audit_ast()
    args = list(sys.argv[1:] if argv is None else argv)
    quiet = "--quiet" in args
    generic = "--generic" in args
    pos_args = [a for a in args if not a.startswith("--")]
    targets = [pathlib.Path(a) for a in pos_args] if pos_args else [p for p in (DEFAULT_V3_CERT, DEFAULT_V5_CERT) if p.exists()]
    require(bool(targets), "No certificate files found")

    for p in targets:
        t0 = time.monotonic_ns()
        cert = json.loads(p.read_text(encoding="utf-8"))
        out = verify_certificate_dict_bernstein(cert, generic=generic, quiet=quiet)
        dt_ms = (time.monotonic_ns() - t0) // 1_000_000
        print(f"[Bernstein + Symbolic 8-var] {p.name} ({out['kind']}): PASS ({out['leaves']} Bernstein leaves, max_depth={out['max_depth']}, {dt_ms} ms)")


if __name__ == "__main__":
    main()
