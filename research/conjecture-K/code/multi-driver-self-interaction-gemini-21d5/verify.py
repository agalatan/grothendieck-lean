#!/usr/bin/env python3
"""Zero-float pure-stdlib verifier for multi-driver self-interaction (6.3.17, 6.3.10)
and sharpened unitary/real character perturbation bounds (6.3.9c, 6.3.9d).

Agent-ID: gemini-21d5
Task: #726 (Refs #509, part of #34)

Modes:
  python3 -IB verify.py
      Fast (< 2 s) zero-float audit: AST self-check (zero floats, zero asserts),
      from-scratch 640-bit recomputation of single-pole integrals, M_0^A, M_1^A
      (cross-checked against SHA-256-pinned content_kernels_exact_result.json),
      phi'(0), -phi''(0), Theorem 3 shared-bath budgets, Theorem 4 sharp integer
      denominators, 7.4.17 joint A+B corollaries, full contiguity/bound audit and
      640-bit binding-slab spot-verification of result.json, plus 15 adversarial
      negative/corruption controls.
  python3 -IB -O verify.py --recompute [--write-result]
      Full (~105 s) zero-float recomputation of all Jet1 Bessel-moment tables,
      positivity cover on (0, 4], tau-panel midpoint-tangent and convexity-secant
      quadratures, all u-slabs across (0, 463/10000] at peak/flank/upper, and the
      two-sided enclosure of C^2/D for the Wick monomial at u = 463/10000, checking
      exact equality against result.json (or writing result.json with --write-result).
"""

import ast
import copy
import hashlib
import json
import math
import sys
import time
from fractions import Fraction as Q
from pathlib import Path

P = 640
ONE = 1 << P

HERE = Path(__file__).resolve().parent
CK_ROOT = HERE.parent.parent
UPSTREAM_JSON = CK_ROOT / "code/third-audit-2026-11-15-codex-a7c4/content_kernels_exact_result.json"
RESULT_JSON = HERE / "result.json"

PROFILES = {
    "peak": (Q(699, 1250), Q(179, 1250)),
    "flank": (Q(14, 25), Q(1467, 10000)),
    "upper": (Q(573, 1000), Q(19, 125)),
}
U_MAX = Q(463, 10000)
U_SMALL = Q(1, 2000)


def require(cond: bool, msg: str) -> None:
    if not cond:
        raise RuntimeError(f"CERTIFICATION FAILURE: {msg}")


def q_str(q: Q) -> str:
    return f"{q.numerator}/{q.denominator}" if q.denominator != 1 else str(q.numerator)


def fmt_dec_floor(q: Q, digits: int = 7) -> str:
    scale = 10 ** digits
    if q >= 0:
        n = (q.numerator * scale) // q.denominator
        return f"{n // scale}.{n % scale:0{digits}d}"
    n = -(((-q.numerator) * scale) // q.denominator)
    return f"-{n // scale}.{n % scale:0{digits}d}"


def fmt_dec_ceil(q: Q, digits: int = 7) -> str:
    scale = 10 ** digits
    if q >= 0:
        n = -(((-q.numerator) * scale) // q.denominator)
        return f"{n // scale}.{n % scale:0{digits}d}"
    n = ((-q.numerator) * scale) // q.denominator
    return f"-{n // scale}.{n % scale:0{digits}d}"


# ---------------------------------------------------------------------------
# 1. AST self-audit: zero float literals/calls and zero assert statements
# ---------------------------------------------------------------------------

def audit_ast_source(src: str, label: str = "verify.py") -> None:
    tree = ast.parse(src, filename=label)
    for node in ast.walk(tree):
        if isinstance(node, ast.Assert):
            raise RuntimeError(f"CERTIFICATION FAILURE: bare assert forbidden in {label} (line {node.lineno})")
        if isinstance(node, ast.Constant) and type(node.value).__name__ == "float":
            raise RuntimeError(f"CERTIFICATION FAILURE: float literal forbidden in {label} (line {node.lineno})")
        if isinstance(node, ast.Call) and isinstance(node.func, ast.Name) and node.func.id == "float":
            raise RuntimeError(f"CERTIFICATION FAILURE: float() call forbidden in {label} (line {node.lineno})")


# ---------------------------------------------------------------------------
# 2. Outward-rounded 640-bit fixed-point integer interval arithmetic
# ---------------------------------------------------------------------------

def q_to_iv(q: Q):
    num, den = q.numerator, q.denominator
    return ((num << P) // den, -(((-num) << P) // den))


def iv_add(x, y):
    return (x[0] + y[0], x[1] + y[1])


def iv_sub(x, y):
    return (x[0] - y[1], x[1] - y[0])


def iv_mul(x, y):
    p1 = x[0] * y[0]
    p2 = x[0] * y[1]
    p3 = x[1] * y[0]
    p4 = x[1] * y[1]
    return (min(p1, p2, p3, p4) >> P, -((-max(p1, p2, p3, p4)) >> P))


def iv_div_int(x, d: int):
    require(d > 0, "iv_div_int expects d > 0")
    return (x[0] // d, -((-x[1]) // d))


def iv_div_pos(x, y):
    require(y[0] > 0, "iv_div_pos expects strictly positive denominator interval")
    lo = min((n << P) // d for n in x for d in y)
    hi = max(-(((-n) << P) // d) for n in x for d in y)
    return (lo, hi)


def iv_sqrt_pos(x):
    require(x[0] >= 0, "iv_sqrt_pos expects non-negative interval")
    lo = math.isqrt(x[0] << P)
    rad = x[1] << P
    hi = math.isqrt(rad)
    if hi * hi < rad:
        hi += 1
    return (lo, hi)


def atan_recip_iv(m: int):
    require(m >= 5, "atan_recip_iv expects m >= 5")
    m2 = m * m
    term = iv_div_int((ONE, ONE), m)
    acc = term
    for k in range(1, 100):
        term = iv_div_int(term, m2)
        t_div = iv_div_int(term, 2 * k + 1)
        acc = iv_sub(acc, t_div) if (k & 1) else iv_add(acc, t_div)
    rem = iv_div_int(iv_div_int(term, m2), 201)
    return (acc[0], acc[1] + rem[1])


def compute_pi_iv():
    a5 = atan_recip_iv(5)
    a239 = atan_recip_iv(239)
    p4 = iv_sub((4 * a5[0], 4 * a5[1]), a239)
    return (4 * p4[0], 4 * p4[1])


def exp_neg_iv(y: Q):
    require(y >= 0, "exp_neg_iv expects y >= 0")
    if y == 0:
        return (ONE, ONE)
    m = 0
    yt = y
    while yt > Q(1, 2):
        yt /= 2
        m += 1
    yv = q_to_iv(yt)
    term = acc = (ONE, ONE)
    for k in range(1, 72):
        term = iv_div_int(iv_mul(term, yv), k)
        acc = iv_sub(acc, term) if (k & 1) else iv_add(acc, term)
    rem = iv_div_int(iv_mul(term, yv), 72)
    res = (acc[0], acc[1] + rem[1])
    for _ in range(m):
        res = iv_mul(res, res)
    return res


def exp_pos_iv(y: Q):
    return iv_div_pos((ONE, ONE), exp_neg_iv(y))


# ---------------------------------------------------------------------------
# 3. Single-pole integrals, -phi''(0), Theorem 3 and Theorem 4 budgets
# ---------------------------------------------------------------------------

def single_pole_table(a: Q, b: Q, sqpi_iv, n_max: int = 6):
    """Encloses I_k(a, b) = int_0^inf e^{-r^2} (a + b r^2)^{-k} dr for k = 0..n_max."""
    c = a / b
    require(0 < c < 8, "c = a/b in (0, 8)")
    cv = q_to_iv(c)
    pow_c = (ONE, ONE)
    acc = (ONE, ONE)
    fact = 1
    k_erf = 90
    for k in range(1, k_erf):
        pow_c = iv_mul(pow_c, cv)
        fact *= k
        tk = iv_div_int(pow_c, fact * (2 * k + 1))
        acc = iv_sub(acc, tk) if (k & 1) else iv_add(acc, tk)
    rem = iv_div_int(iv_mul(pow_c, cv), fact * k_erf * (2 * k_erf + 1))
    ser_iv = (acc[0], acc[1] + rem[1])
    erf_part = iv_mul(iv_sqrt_pos(cv), ser_iv)
    erfc_int = iv_sub(iv_div_int(sqpi_iv, 2), erf_part)
    pref = iv_mul(iv_div_pos(sqpi_iv, iv_sqrt_pos(q_to_iv(a * b))), exp_pos_iv(c))
    i1 = iv_mul(pref, erfc_int)
    out = [iv_div_int(sqpi_iv, 2), i1]
    for k in range(1, n_max):
        c1 = q_to_iv(Q(2 * k - 1) - 2 * a / b)
        c0 = q_to_iv(Q(2) / b)
        num = iv_add(iv_mul(c1, out[k]), iv_mul(c0, out[k - 1]))
        out.append(iv_div_pos(num, q_to_iv(2 * k * a)))
    return out


def mixed_pole_int(p: int, q_deg: int, a: Q, ia, ib):
    """Partial-fraction reduction of int_0^inf e^{-r^2} A(r^2)^{-p} J(r^2)^{-q_deg} dr."""
    if q_deg == 0:
        return ia[p]
    if p == 0:
        return ib[q_deg]
    res = (0, 0)
    for i in range(1, p + 1):
        ca = Q((-1) ** q_deg) * math.comb(q_deg + p - i - 1, p - i) * (3 ** (p - i)) / ((2 * a) ** (q_deg + p - i))
        res = iv_add(res, iv_mul(q_to_iv(ca), ia[i]))
    for j in range(1, q_deg + 1):
        cb = Q((3 ** p) * ((-1) ** (q_deg - j))) * math.comb(p + q_deg - j - 1, q_deg - j) / ((2 * a) ** (p + q_deg - j))
        res = iv_add(res, iv_mul(q_to_iv(cb), ib[j]))
    return res


def compute_scalar_and_perturbation_tables():
    """Computes M_0^A, M_1^A, phi'(0), -phi''(0), Theorem 3 and Theorem 4 tables from scratch."""
    require(UPSTREAM_JSON.is_file(), f"missing upstream {UPSTREAM_JSON}")
    up_bytes = UPSTREAM_JSON.read_bytes()
    up_sha = hashlib.sha256(up_bytes).hexdigest()
    ck = json.loads(up_bytes.decode("utf-8"))["derivative_bounds"]

    pi_iv = compute_pi_iv()
    sqpi_iv = iv_sqrt_pos(pi_iv)
    # Verify 173/100 < sqrt(3) and 8 e^{-2} < 11/10 and 124 e^{-2} - 8 < 44/5 and 1 + e^{-4} < 51/50:
    require(173 * 173 < 3 * 100 * 100, "173/100 < sqrt(3)")
    e_neg_2 = exp_neg_iv(Q(2))
    require(8 * e_neg_2[1] < q_to_iv(Q(11, 10))[0], "8 e^{-2} < 11/10")
    require(124 * e_neg_2[1] - 8 * ONE < q_to_iv(Q(44, 5))[0], "124 e^{-2} - 8 < 44/5")
    require(ONE + exp_neg_iv(Q(4))[1] < q_to_iv(Q(51, 50))[0], "1 + e^{-4} < 51/50")
    require(Q(929, 100) ** 2 < Q(4) / U_MAX, "(929/100)^2 < 4 / u_max")

    atom_r_hi = iv_mul((2 * ONE, 2 * ONE), exp_neg_iv(Q(3, 2)))[1]  # 2 e^{-3/2}
    require(atom_r_hi < q_to_iv(Q(447, 1000))[0], "2 e^{-3/2} < 447/1000")

    scalars = {}
    thm3_out = {}
    thm4_out = {}

    for row, (a, b) in PROFILES.items():
        require(a > 3 * b > 0, f"{row}: a > 3b > 0 required for Pick disk")
        require((a - b) ** 2 < Q(4) * (a ** 3) / (27 * b), f"{row}: sigma_0 < 4 a^3 / (27 b)")

        ia = single_pole_table(a, b, sqpi_iv, 6)
        ib = single_pole_table(a, 3 * b, sqpi_iv, 6)

        m0_a = iv_div_int(iv_sub((3 * ia[1][0], 3 * ia[1][1]), iv_mul(q_to_iv(2 * a), ia[2])), 2)
        m1_a = iv_mul(q_to_iv(Q(3, 8)), iv_add(ia[3], iv_mul(q_to_iv(2 * b), ia[4])))
        ck_m0 = (q_to_iv(Q(ck[row]["M_j_A"][0][0]))[0], q_to_iv(Q(ck[row]["M_j_A"][0][1]))[1])
        ck_m1 = (q_to_iv(Q(ck[row]["M_j_A"][1][0]))[0], q_to_iv(Q(ck[row]["M_j_A"][1][1]))[1])
        require(m0_a[0] >= ck_m0[0] and m0_a[1] <= ck_m0[1], f"{row} M_0^A containment in upstream")
        require(m1_a[0] >= ck_m1[0] and m1_a[1] <= ck_m1[1], f"{row} M_1^A containment in upstream")

        phi1 = ia[1]
        phi2 = iv_div_int(
            iv_add(
                mixed_pole_int(2, 1, a, ia, ib),
                iv_add(
                    iv_mul(q_to_iv(b), mixed_pole_int(3, 1, a, ia, ib)),
                    iv_mul(q_to_iv(3 * b), mixed_pole_int(2, 2, a, ia, ib)),
                ),
            ),
            4,
        )

        # Outward rational caps at 10^{-9} resolution for human-readable ledger constants:
        SCALE9 = 10 ** 9
        m0_hi_q = Q(-(((-m0_a[1]) * SCALE9) >> P), SCALE9)
        phi1_hi_q = Q(-(((-phi1[1]) * SCALE9) >> P), SCALE9)
        phi2_lo_q = Q((phi2[0] * SCALE9) >> P, SCALE9)
        phi2_hi_q = Q(-(((-phi2[1]) * SCALE9) >> P), SCALE9)
        require(q_to_iv(phi2_lo_q)[0] <= phi2[0] and phi2[1] <= q_to_iv(phi2_hi_q)[1], "phi2 rational enclosure")

        scalars[row] = {
            "M0_A_hi": q_str(m0_hi_q),
            "phi1_0_hi": q_str(phi1_hi_q),
            "neg_phi2_0_lo": q_str(phi2_lo_q),
            "neg_phi2_0_hi": q_str(phi2_hi_q),
            "slope_loss_umax_hi": q_str(2 * phi2_hi_q * U_MAX),
        }

        # Theorem 4: sharpened unitary/real character perturbation denominators:
        l_lip_hi = iv_div_int(iv_mul((ONE + atom_r_hi, ONE + atom_r_hi), (0, m0_a[1])), 2)[1]
        l2_hi = iv_mul((0, l_lip_hi), (0, l_lip_hi))[1]
        wh_hi = q_to_iv(Q(5, 4) / (a * a))[1]
        slope_loss_hi = iv_mul((0, 2 * phi2[1]), q_to_iv(U_MAX))[1]

        row_thm4 = {}
        for k_target, k_lbl in [(Q(6, 25), "6/25"), (Q(11, 50), "11/50")]:
            sub = {}
            for kap, kap_lbl in [
                (Q(9, 100), "9/100"),
                (Q(1, 10), "1/10"),
                (Q(11, 50), "11/50"),
                (Q(9, 40), "9/40"),
                (Q(47, 200), "47/200"),
            ]:
                if kap >= k_target:
                    continue
                # D_0 <= B(u_0) - B(0) <= phi'(0) u_0 <= phi'(0) u_max by concavity of B and E[Phi(p)] >= B(0):
                c_up1 = iv_sqrt_pos(iv_mul(q_to_iv(kap * U_MAX), (0, phi1[1])))[1]
                c_up2 = iv_div_int(iv_mul((0, m0_a[1]), iv_sqrt_pos(q_to_iv(U_MAX))), 2)[1]
                c_up = min(c_up1, c_up2)
                bud_hi = l2_hi + iv_mul((0, wh_hi), (0, c_up))[1] + iv_mul(q_to_iv(k_target), (0, slope_loss_hi))[1]
                gap_q = k_target - kap
                ratio_q = Q(bud_hi, ONE) / gap_q
                n_int = math.ceil(ratio_q)
                require((n_int - 1) * gap_q < Q(bud_hi, ONE) <= n_int * gap_q, f"{row} Thm4 sharp boundary {k_lbl} {kap_lbl}")
                sub[kap_lbl] = n_int
            row_thm4[k_lbl] = sub
        thm4_out[row] = row_thm4

        # Theorem 3: shared-bath multi-driver self-interaction q = q_0(X) + sum_j [X_j P_j(Y) + bar(X_j) H_j(Y)]
        # Using certified core constants kappa_0 = 9/100 and kappa_D = 11/2 (peak, flank) or 53/10 (upper):
        kap_d = Q(11, 2) if row != "upper" else Q(53, 10)
        row_thm3 = {"kappa_0": "9/100", "kappa_D": q_str(kap_d), "targets": {}}
        for k_target, k_lbl, beta_q in [
            (Q(6, 25), "6/25", Q(1, 5)),
            (Q(11, 50), "11/50", Q(1, 6)),
            (Q(3, 20), "3/20", Q(1, 10)),
        ]:
            t1 = q_to_iv(Q(3, 10))[1] + iv_div_pos(q_to_iv(beta_q / (2 * a * a)), iv_sqrt_pos(q_to_iv(kap_d)))[1]
            term1 = iv_mul((0, t1), (0, t1))[1]
            term2 = iv_mul((0, 2 * phi2[1]), q_to_iv(k_target * beta_q * (1 + beta_q) / kap_d))[1]
            lhs_q = Q(term1 + term2, ONE)
            require(lhs_q < k_target, f"{row} Thm3 {k_lbl} beta={beta_q} failed")
            SCALE6 = 10 ** 6
            lhs_ceil_q = Q(-(((-lhs_q.numerator) * SCALE6) // lhs_q.denominator), SCALE6)
            require(lhs_q <= lhs_ceil_q <= k_target, f"{row} Thm3 {k_lbl} outward cap")
            row_thm3["targets"][k_lbl] = {
                "beta": q_str(beta_q),
                "lhs_upper": q_str(lhs_ceil_q),
            }
        thm3_out[row] = row_thm3

    # Verify 7.4.17 peak joint A+B excess corollaries for C(q)^2 <= K D(q):
    # From 7.4.2 / 7.4.17: centered alignment ||c_B - 0.5053 c_A|| <= 0.0035 sqrt(u):
    # Under Target D (kappa_diag = 7/25, m = 0) with K = 11/50:
    # (||c_A||^2 + ||c_B||^2) / (7/25) <= D(q) + 3.18e-5 on u <= 463/10000:
    # Check exact rational Cauchy-Schwarz bound: for any t > 0, ||c_B||^2 <= (1 + t)*(0.5053)^2 ||c_A||^2 + (1 + 1/t)*(0.0035)^2 u!
    rho_align = Q(5053, 10000)
    eps_align = Q(35, 10000)
    kap_diag = Q(7, 25)
    # Maximize over t > 0 so (1 + (1 + t)*rho_align^2) * (11/50) <= 7/25:
    t_opt = (kap_diag / Q(11, 50) - 1) / (rho_align * rho_align) - 1
    require(t_opt > 0, "Target D has positive alignment slack for K = 11/50")
    excess_target_d = (1 + Q(1) / t_opt) * (eps_align * eps_align) * U_MAX / kap_diag
    require(excess_target_d < Q(318, 10_000_000), "Target D peak excess < 3.18e-5 at K = 11/50")

    return up_sha, scalars, thm3_out, thm4_out


# ---------------------------------------------------------------------------
# 4. Incomplete Gamma & Wick / Profile Bessel engines (Theorem 2)
# ---------------------------------------------------------------------------

def inc_gamma_table(S_trunc: int, max_n: int):
    e_neg_S = exp_neg_iv(Q(S_trunc))
    n_top = max(max_n, 3 * S_trunc)
    require(2 * S_trunc <= n_top + 2, "2S <= N + 2")
    s_pow_top = S_trunc ** (n_top + 1)
    term = iv_div_int((s_pow_top * e_neg_S[0], s_pow_top * e_neg_S[1]), n_top + 1)
    acc = term
    for m in range(1, 85):
        term = iv_div_int((S_trunc * term[0], S_trunc * term[1]), n_top + 1 + m)
        acc = iv_add(acc, term)
    tail_hi = iv_div_int((2 * S_trunc * term[1], 2 * S_trunc * term[1]), n_top + 1 + 85)[1]
    cur = (acc[0], acc[1] + tail_hi)
    table = [None] * (n_top + 1)
    table[n_top] = cur
    sn = S_trunc ** n_top
    for n in range(n_top, 0, -1):
        cur = iv_div_int(iv_add(cur, (sn * e_neg_S[0], sn * e_neg_S[1])), n)
        table[n - 1] = cur
        sn //= S_trunc
    return table[: max_n + 1], e_neg_S


def upper_gamma_int(S_trunc: int, k: int, e_neg_S):
    fk = math.factorial(k)
    poly = sum((fk // math.factorial(j)) * (S_trunc ** j) for j in range(k + 1))
    return (poly * e_neg_S[0], poly * e_neg_S[1])


def choose_k(x_q: Q, k_cap: int) -> int:
    if x_q == 0:
        return 2
    sq = math.isqrt(int(x_q) + 1) + 1
    return min(k_cap, max(28, 3 * sq + 35))


def build_slab_edges():
    """Deterministic three-tier rational u-grid covering [1/2000, 463/10000]."""
    edges = [U_SMALL]
    while edges[-1] < Q(1, 50):
        edges.append(min(Q(1, 50), edges[-1] * Q(31, 30)))
    while edges[-1] < Q(3, 100):
        edges.append(min(Q(3, 100), edges[-1] * Q(126, 125)))
    while edges[-1] < Q(19, 500):
        edges.append(min(Q(19, 500), edges[-1] * Q(301, 300)))
    while edges[-1] < U_MAX:
        edges.append(min(U_MAX, edges[-1] * Q(601, 600)))
    return edges


class WickBesselContext:
    """Holds incomplete Gamma moments and Wick Bessel series coefficients."""

    def __init__(self):
        s0 = 14
        i_tab_s0, _ = inc_gamma_table(s0, 12)
        w2_s0 = (0, 0)
        for j in range(5):
            c = math.comb(4, j) * ((-2) ** (4 - j))
            iv = i_tab_s0[2 + j]
            w2_s0 = iv_add(w2_s0, (c * iv[0], c * iv[1]) if c >= 0 else (c * iv[1], c * iv[0]))
        w3_s0 = (0, 0)
        for j in range(7):
            c = math.comb(6, j) * ((-2) ** (6 - j))
            iv = i_tab_s0[3 + j]
            w3_s0 = iv_add(w3_s0, (c * iv[0], c * iv[1]) if c >= 0 else (c * iv[1], c * iv[0]))
        self.c2_small_lo = w2_s0[0] // 16 - (ONE >> 1)
        self.c3_small_hi = -((-w3_s0[1]) // 288)
        self.pos_small_z2_coef = self.c2_small_lo - iv_div_int((self.c3_small_hi,) * 2, 50)[1]
        require(100 * self.pos_small_z2_coef > 505 * ONE, "positivity > 505/100 on (0, 1/50]")

        self.S = 18
        self.max_k = 410
        self.I_tab, self.eS = inc_gamma_table(self.S, 3 * self.max_k + 8)
        self.FACT = [math.factorial(k) for k in range(self.max_k + 3)]

        self.K_W = 395
        poly_r2 = [1]
        self.w_wick = []
        self.m_wick = []
        for m_deg in range(2 * self.K_W + 2):
            if m_deg % 2 == 0:
                k = m_deg // 2
                acc = (0, 0)
                for j, c in enumerate(poly_r2):
                    iv = self.I_tab[k + j]
                    acc = iv_add(acc, (c * iv[0], c * iv[1]) if c >= 0 else (c * iv[1], c * iv[0]))
                self.w_wick.append(acc)
            else:
                k = (m_deg - 1) // 2
                acc = (0, 0)
                for j, c in enumerate(poly_r2):
                    iv = self.I_tab[k + 1 + j]
                    acc = iv_add(acc, (c * iv[0], c * iv[1]) if c >= 0 else (c * iv[1], c * iv[0]))
                self.m_wick.append(acc)
            nxt = [0] * (len(poly_r2) + 1)
            for j, c in enumerate(poly_r2):
                nxt[j] -= 2 * c
                nxt[j + 1] += c
            poly_r2 = nxt

        self.sw_max = self.S * ((self.S - 2) ** 2)
        self.ug2_S = upper_gamma_int(self.S, 2, self.eS)[1]
        self.ug3_S = upper_gamma_int(self.S, 3, self.eS)[1]
        self.ug5_S = upper_gamma_int(self.S, 5, self.eS)[1]
        self.e_pos_1 = exp_pos_iv(Q(1))

    def eval_wick_jet1(self, z_q: Q):
        x_q = (z_q / 2) * self.sw_max
        k_use = choose_k(x_q, self.K_W - 2)
        require(x_q < k_use * k_use, "eval_wick_jet1 series convergence")
        zhalf = q_to_iv(z_q / 2)
        pow_z = (ONE, ONE)
        acc_psi = acc_dpsi = acc_m = acc_dm = (0, 0)
        for k in range(k_use):
            if k > 0:
                pow_z = iv_mul(pow_z, zhalf)
            fk = self.FACT[k]
            fk2 = fk * fk
            fk_k1 = fk2 * (k + 1)
            fk_k2 = fk_k1 * (k + 2)
            tp = iv_div_int(iv_mul(pow_z, self.w_wick[k]), fk2)
            tdp = iv_div_int(iv_mul(pow_z, self.w_wick[k + 1]), fk_k1)
            tm = iv_div_int(iv_mul(pow_z, self.m_wick[k]), fk_k1)
            tdm = iv_div_int(iv_mul(pow_z, self.m_wick[k + 1]), fk_k2)
            if k & 1:
                acc_psi = iv_sub(acc_psi, tp)
                acc_dpsi = iv_sub(acc_dpsi, tdp)
                acc_m = iv_sub(acc_m, tm)
                acc_dm = iv_sub(acc_dm, tdm)
            else:
                acc_psi = iv_add(acc_psi, tp)
                acc_dpsi = iv_add(acc_dpsi, tdp)
                acc_m = iv_add(acc_m, tm)
                acc_dm = iv_add(acc_dm, tdm)
        pow_k = iv_mul(pow_z, zhalf)
        sw_pow = q_to_iv(Q(self.sw_max ** k_use))
        trunc_p = iv_div_int(iv_mul(pow_k, sw_pow), self.FACT[k_use] ** 2)
        err_p = self.eS[1] + trunc_p[1]
        psi_iv = (acc_psi[0] - err_p, acc_psi[1] + err_p)
        ez = exp_neg_iv(z_q)
        diff_iv = iv_sub(psi_iv, ez)

        trunc_dp = iv_div_int(iv_mul(pow_k, sw_pow), self.FACT[k_use] * self.FACT[k_use + 1])
        err_dp = (self.ug3_S + trunc_dp[1] * self.sw_max + 1) // 2
        dpsi_iv = (-((acc_dpsi[1] + 1) // 2) - err_dp, -(acc_dpsi[0] // 2) + err_dp)
        ddiff_iv = iv_add(dpsi_iv, ez)

        err_m = self.ug2_S + trunc_dp[1] * self.S * (self.S - 2)
        m_iv = (acc_m[0] - err_m, acc_m[1] + err_m)

        trunc_dm = iv_div_int(iv_mul(pow_k, sw_pow), self.FACT[k_use] * self.FACT[k_use + 2])
        err_dm = (self.ug5_S + trunc_dm[1] * (self.S * self.S * ((self.S - 2) ** 3)) + 1) // 2
        dm_iv = (-((acc_dm[1] + 1) // 2) - err_dm, -(acc_dm[0] // 2) + err_dm)
        return diff_iv, ddiff_iv, m_iv, dm_iv

    def build_profile_moments(self, a: Q, b: Q, k_l_cap: int = 380, k_a_cap: int = 370):
        d_ab = math.lcm(a.denominator, b.denominator)
        a_int = int(a * d_ab)
        b_int = int(b * d_ab)
        poly_int = [1]
        d_pow = 1
        c_l, c_a = [], []
        for m_deg in range(2 * max(k_a_cap, k_l_cap + 1) + 3):
            if m_deg % 2 == 0 and (m_deg // 2) <= k_l_cap + 1:
                k = m_deg // 2
                lo_s = sum(ci * self.I_tab[k + j][0] for j, ci in enumerate(poly_int))
                hi_s = sum(ci * self.I_tab[k + j][1] for j, ci in enumerate(poly_int))
                c_l.append(iv_div_int((lo_s, hi_s), d_pow))
            if m_deg % 2 == 1 and ((m_deg - 1) // 2) <= k_a_cap:
                k = (m_deg - 1) // 2
                lo_s = sum(
                    a_int * ci * self.I_tab[k + 1 + j][0] + 3 * b_int * ci * self.I_tab[k + 2 + j][0]
                    for j, ci in enumerate(poly_int)
                )
                hi_s = sum(
                    a_int * ci * self.I_tab[k + 1 + j][1] + 3 * b_int * ci * self.I_tab[k + 2 + j][1]
                    for j, ci in enumerate(poly_int)
                )
                c_a.append(iv_div_int((lo_s, hi_s), d_pow * d_ab))
            nxt_int = [0] * (len(poly_int) + 1)
            for j, ci in enumerate(poly_int):
                nxt_int[j] += a_int * ci
                nxt_int[j + 1] += b_int * ci
            poly_int = nxt_int
            d_pow *= d_ab
        return c_l, c_a


def taylor_curv_delta(z0: Q, za: Q, zb: Q, m2_override=None) -> Q:
    """Decreasing upper bound min(23, 1/zeta + 1) on |Delta_Wick''(zeta)| over hull({z0}, [za, zb])."""
    require(z0 >= 0 and 0 <= za <= zb, "invalid Taylor segment endpoints for Delta_Wick")
    z_seg_lo = min(z0, za)
    req = min(Q(23), Q(1) / z_seg_lo + 1) if z_seg_lo > 0 else Q(23)
    if m2_override is not None:
        require(
            m2_override >= req,
            f"Delta_Wick Taylor curvature {m2_override} < segment supremum {req} on [{z_seg_lo}, {max(z0, zb)}]",
        )
        return m2_override
    return req


def taylor_curv_m(z0: Q, za: Q, zb: Q, m2_override=None) -> Q:
    """Decreasing upper bound min(453, 12/zeta) on |M_Wick''(zeta)| over hull({z0}, [za, zb])."""
    require(z0 >= 0 and 0 <= za <= zb, "invalid Taylor segment endpoints for M_Wick")
    z_seg_lo = min(z0, za)
    req = min(Q(453), Q(12) / z_seg_lo) if z_seg_lo > 0 else Q(453)
    if m2_override is not None:
        require(
            m2_override >= req,
            f"M_Wick Taylor curvature {m2_override} < segment supremum {req} on [{z_seg_lo}, {max(z0, zb)}]",
        )
        return m2_override
    return req


def mono_panel_c_lo_contrib(za: Q, zb: Q, alp_lo: int, bet_lo: int, wc_2, wc_4) -> int:
    """Panel contribution to lower bound on int tau^2 chi_A(tau^2) (-M_Wick(u_max tau^2)) dtau.
    Whenever the affine minorant is negative at an endpoint of [za, zb], clamping to 0 requires
    -M_Wick(zeta) >= 0 throughout [za, zb], certified by M_Wick(0) = 0, M_Wick'(0) = -8, and
    |M_Wick''| <= 453 => -M_Wick(zeta) >= zeta * (8 - 453 * zeta / 2) >= 0 for 0 <= za <= zb <= 16/453.
    """
    va_lo = alp_lo + iv_mul((bet_lo, bet_lo), q_to_iv(za))[0]
    vb_lo = alp_lo + iv_mul((bet_lo, bet_lo), q_to_iv(zb))[0]
    if va_lo >= 0 and vb_lo >= 0:
        return max(0, iv_add(iv_mul((alp_lo,) * 2, wc_2), iv_mul((bet_lo,) * 2, iv_mul(q_to_iv(U_MAX), wc_4)))[0])
    require(
        0 <= za <= zb and Q(16) - Q(453) * zb >= 0,
        f"unjustified zero clamp on monomial C_lo panel [{za}, {zb}] (zb > 16/453)",
    )
    return 0


def recompute_theorem2_full(ctx: WickBesselContext):
    """Full zero-float continuum certification of Theorem 2 across all 3 rows + peak monomial enclosure."""
    n_fine = 400
    dz_fine = Q(2, 5) / n_fine
    tab_fine = [ctx.eval_wick_jet1(i * dz_fine) for i in range(n_fine + 1)]

    n_tab = 615
    dz = Q(123, 20) / n_tab
    tab_jet = [ctx.eval_wick_jet1(i * dz) for i in range(n_tab + 1)]

    # Certify Delta_Wick(zeta) >= c_pos * min(zeta^2, 1) > 0 strictly across (0, 4]:
    # - On (0, 1/50]: Delta_Wick(zeta) / zeta^2 >= c2_small_lo - c3_small_hi / 50 > 505/100 > 0;
    # - On [1/50, 4]: Delta_Wick(zeta) >= compact_pos_min > 0, and min(zeta^2, 1) <= 1.
    pos_small_z2_coef = ctx.pos_small_z2_coef
    require(100 * pos_small_z2_coef > 505 * ONE, "positivity of Delta_Wick(zeta)/zeta^2 > 505/100 on (0, 1/50]")
    compact_pos_min = pos_small_z2_coef
    for i in range(20, n_fine + 1):
        zb = i * dz_fine + dz_fine / 2
        mrg = tab_fine[i][0][0] - q_to_iv(Q(23) * zb * (dz_fine / 2))[1]
        require(mrg > 0, f"positivity fine {i}")
        compact_pos_min = min(compact_pos_min, mrg)
    for i in range(40, 401):
        zb = i * dz + dz / 2
        lip_z = min(Q(2), Q(23) * zb)
        mrg = tab_jet[i][0][0] - q_to_iv(lip_z * (dz / 2))[1]
        require(mrg > 0, f"positivity coarse {i}")
        compact_pos_min = min(compact_pos_min, mrg)
    min_pos_scaled = min(pos_small_z2_coef, compact_pos_min)

    def delta_affine_lb(za: Q, zb: Q):
        zm = (za + zb) / 2
        if zb <= Q(2, 5):
            idx = max(1, min(n_fine, int((zm / dz_fine).__round__())))
            z0 = idx * dz_fine
            d_iv, dd_iv, _, _ = tab_fine[idx]
        else:
            idx = max(1, min(400, int((zm / dz).__round__())))
            z0 = idx * dz
            d_iv, dd_iv, _, _ = tab_jet[idx]
        rad = max(abs(za - z0), abs(zb - z0))
        m2 = taylor_curv_delta(z0, za, zb)
        quad_rem = q_to_iv(Q(1, 2) * m2 * rad * rad)[1]
        beta = (dd_iv[0] + dd_iv[1]) // 2
        slope_rad = (dd_iv[1] - dd_iv[0] + 1) // 2
        lin_rem = iv_mul((0, slope_rad), q_to_iv(rad))[1]
        bz0_hi = iv_mul((beta, beta), q_to_iv(z0))[1]
        alpha = d_iv[0] - bz0_hi - lin_rem - quad_rem
        va = alpha + iv_mul((beta, beta), q_to_iv(za))[0]
        vb = alpha + iv_mul((beta, beta), q_to_iv(zb))[0]
        if va >= 0 and vb >= 0:
            return (alpha, beta)
        return (max(0, min(va, vb)), 0)

    def abs_m_affine_ub(za: Q, zb: Q):
        if zb <= Q(1, 500):
            return (0, q_to_iv(Q(44, 5))[1])
        zm = (za + zb) / 2
        if zb <= Q(2, 5):
            idx = max(1, min(n_fine, int((zm / dz_fine).__round__())))
            z0 = idx * dz_fine
            _, _, m_iv, dm_iv = tab_fine[idx]
        else:
            idx = max(1, min(n_tab, int((zm / dz).__round__())))
            z0 = idx * dz
            _, _, m_iv, dm_iv = tab_jet[idx]
        rad = max(abs(za - z0), abs(zb - z0))
        m2_m = taylor_curv_m(z0, za, zb)
        quad_rem = q_to_iv(Q(1, 2) * m2_m * rad * rad)[1]
        dm_mid = (dm_iv[0] + dm_iv[1]) // 2
        dm_rad = (dm_iv[1] - dm_iv[0] + 1) // 2
        lin_rem = iv_mul((0, dm_rad), q_to_iv(rad))[1]
        dm_z0_lo = iv_mul((dm_mid, dm_mid), q_to_iv(z0))[0]
        up_const = m_iv[1] - dm_z0_lo + lin_rem + quad_rem
        up_a = up_const + iv_mul((dm_mid, dm_mid), q_to_iv(za))[1]
        up_b = up_const + iv_mul((dm_mid, dm_mid), q_to_iv(zb))[1]
        if max(up_a, up_b) <= 0:
            dm_z0_hi = iv_mul((dm_mid, dm_mid), q_to_iv(z0))[1]
            alpha = -m_iv[0] + dm_z0_hi + lin_rem + quad_rem
            beta = -dm_mid
            return (alpha, beta)
        lo_const = m_iv[0] - iv_mul((dm_mid, dm_mid), q_to_iv(z0))[1] - lin_rem - quad_rem
        lo_min = min(
            lo_const + iv_mul((dm_mid, dm_mid), q_to_iv(za))[0],
            lo_const + iv_mul((dm_mid, dm_mid), q_to_iv(zb))[0],
        )
        c_ub = min(q_to_iv(Q(44, 5) * zb)[1], max(abs(lo_min), abs(max(up_a, up_b))))
        return (c_ub, 0)

    n_tau_d = 340
    dtau_d = Q(17, 2) / n_tau_d
    n_tau_c = 575
    dtau_c = Q(23, 2) / n_tau_c

    edges = build_slab_edges()
    m_m2 = [0] + [Q(1) / (k * dtau_d) - Q(1) / ((k + 1) * dtau_d) for k in range(1, n_tau_d)]
    m_0 = [dtau_d for _ in range(n_tau_d)]
    m_2d = [(((k + 1) * dtau_d) ** 3 - (k * dtau_d) ** 3) / 3 for k in range(n_tau_d)]
    m_4d = [(((k + 1) * dtau_d) ** 5 - (k * dtau_d) ** 5) / 5 for k in range(n_tau_d)]

    w_sec0_2, w_sec1_2, w_sec0_4, w_sec1_4 = [], [], [], []
    for k in range(n_tau_c):
        tk = k * dtau_c
        tk1 = (k + 1) * dtau_c
        xik = tk * tk
        xik1 = tk1 * tk1
        p2 = (tk1 ** 3 - tk ** 3) / 3
        p4 = (tk1 ** 5 - tk ** 5) / 5
        p6 = (tk1 ** 7 - tk ** 7) / 7
        w0_2 = (xik1 * p2 - p4) / (xik1 - xik)
        w1_2 = (p4 - xik * p2) / (xik1 - xik)
        w0_4 = (xik1 * p4 - p6) / (xik1 - xik)
        w1_4 = (p6 - xik * p4) / (xik1 - xik)
        require(w0_2 > 0 and w1_2 > 0 and w0_4 > 0 and w1_4 > 0, "positive secant moments")
        w_sec0_2.append(q_to_iv(w0_2))
        w_sec1_2.append(q_to_iv(w1_2))
        w_sec0_4.append(q_to_iv(w0_4))
        w_sec1_4.append(q_to_iv(w1_4))

    slab_d_data, slab_c_data = [], []
    for s_idx in range(len(edges) - 1):
        ulo, uhi = edges[s_idx], edges[s_idx + 1]
        ulo_iv = q_to_iv(ulo)
        uhi_iv = q_to_iv(uhi)
        ulo2_iv = q_to_iv(ulo * ulo)
        ebase = exp_neg_iv((U_MAX - ulo) * (dtau_d * dtau_d))
        ebase2 = iv_mul(ebase, ebase)
        ek = ebase
        e2k1 = iv_mul(ebase2, ebase)
        row_d = []
        for k in range(n_tau_d):
            if k > 0:
                ek = iv_mul(ek, e2k1)
                e2k1 = iv_mul(e2k1, ebase2)
            tk = k * dtau_d
            tk1 = (k + 1) * dtau_d
            za = (tk * tk) * ulo
            zb = (tk1 * tk1) * uhi
            brk = ctx.c2_small_lo - iv_mul((ctx.c3_small_hi,) * 2, q_to_iv(zb))[1]
            poly_c = iv_mul((brk, brk), ulo2_iv)[0] if brk > 0 else 0
            alp, bet = (0, 0) if k == 0 else delta_affine_lb(za, zb)
            row_d.append((ek[0], poly_c, alp, bet))
        slab_d_data.append((ulo_iv, uhi_iv, row_d))

        row_c = []
        for k in range(n_tau_c):
            tk = k * dtau_c
            tk1 = (k + 1) * dtau_c
            row_c.append(abs_m_affine_ub((tk * tk) * ulo, (tk1 * tk1) * uhi))
        slab_c_data.append((ulo_iv, uhi_iv, row_c))

    thm2_rows = {}
    peak_mono_enclosure = None

    for row, (a, b) in PROFILES.items():
        hs_q = Q(ctx.S) * ((a + b * ctx.S) ** 2)
        k_l_cap = 380
        k_a_cap = 370
        alpha_q = Q(173, 100) * (a - b)
        c_l, c_a = ctx.build_profile_moments(a, b, k_l_cap, k_a_cap)

        ug1 = upper_gamma_int(ctx.S, 1, ctx.eS)[1]
        ug2 = upper_gamma_int(ctx.S, 2, ctx.eS)[1]
        ug3 = upper_gamma_int(ctx.S, 3, ctx.eS)[1]
        tail_t_dl = iv_mul(q_to_iv(a * a), (0, ug1))[1] + iv_mul(q_to_iv(2 * a * b), (0, ug2))[1] + iv_mul(q_to_iv(b * b), (0, ug3))[1]
        tail_t_a = iv_mul(q_to_iv(a * a), (0, ug1))[1] + iv_mul(q_to_iv(4 * a * b), (0, ug2))[1] + iv_mul(q_to_iv(3 * b * b), (0, ug3))[1]

        def eval_psil_jet1(xi_q: Q):
            x_q = xi_q * hs_q
            k_l = choose_k(x_q, k_l_cap)
            require(x_q < k_l * k_l, "K_L conv")
            xiv = q_to_iv(xi_q)
            pow_x = (ONE, ONE)
            acc = (0, 0)
            acc_d = (0, 0)
            for k in range(k_l):
                if k > 0:
                    pow_x = iv_mul(pow_x, xiv)
                fk = ctx.FACT[k]
                fk2 = fk * fk
                fk_k1 = fk2 * (k + 1)
                tp = iv_div_int(iv_mul(pow_x, c_l[k]), fk2)
                td = iv_div_int(iv_mul(pow_x, c_l[k + 1]), fk_k1)
                if k & 1:
                    acc = iv_sub(acc, tp)
                    acc_d = iv_sub(acc_d, td)
                else:
                    acc = iv_add(acc, tp)
                    acc_d = iv_add(acc_d, td)
            pow_k = iv_mul(pow_x, xiv)
            hs_pow = q_to_iv(hs_q ** k_l)
            trunc = iv_div_int(iv_mul(pow_k, hs_pow), ctx.FACT[k_l] ** 2)
            psi_iv = (max(0, acc[0] - ctx.eS[1] - trunc[1]), acc[1] + ctx.eS[1] + trunc[1])
            trunc_d = iv_div_int(iv_mul(pow_k, iv_mul(hs_pow, c_l[1])), ctx.FACT[k_l] * ctx.FACT[k_l + 1])
            err_d = tail_t_dl + trunc_d[1]
            return psi_iv, (max(0, acc_d[0] - err_d), acc_d[1] + err_d)

        def eval_chia_iv_any(tau_q: Q):
            xi_q = tau_q * tau_q
            pick_ub = None
            if tau_q > 0:
                pick_ub = iv_mul(
                    iv_div_pos(q_to_iv(Q(64) / ((a - b) ** 2 * (xi_q * xi_q))), ctx.e_pos_1),
                    exp_neg_iv(alpha_q * tau_q),
                )[1]
            if tau_q > Q(87, 10):
                return (0, pick_ub)
            x_q = xi_q * hs_q
            k_a = choose_k(x_q, k_a_cap)
            require(x_q < k_a * k_a, "K_A conv")
            xiv = q_to_iv(xi_q)
            pow_x = (ONE, ONE)
            acc = (0, 0)
            for k in range(k_a):
                if k > 0:
                    pow_x = iv_mul(pow_x, xiv)
                tp = iv_div_int(iv_mul(pow_x, c_a[k]), ctx.FACT[k] * ctx.FACT[k + 1])
                acc = iv_sub(acc, tp) if (k & 1) else iv_add(acc, tp)
            pow_k = iv_mul(pow_x, xiv)
            trunc = iv_div_int(iv_mul(pow_k, iv_mul(q_to_iv(hs_q ** k_a), c_a[0])), ctx.FACT[k_a] * ctx.FACT[k_a + 1])
            lo = max(0, acc[0] - tail_t_a - trunc[1])
            hi = acc[1] + tail_t_a + trunc[1]
            if pick_ub is not None:
                hi = min(hi, pick_ub)
            return (lo, hi)

        wd_poly, wd_m2, wd_0 = [], [], []
        psil_pts_ub = []
        for k in range(n_tau_d):
            tk = k * dtau_d
            tk1 = (k + 1) * dtau_d
            xik = tk * tk
            xik1 = tk1 * tk1
            xim = (xik + xik1) / 2
            rho = (xik1 - xik) / 2
            psi_m_iv, (dm_lo, dm_hi) = eval_psil_jet1(xim)
            qk = (dm_lo + dm_hi + 1) // 2
            dm_rad = (dm_hi - dm_lo + 1) // 2
            pk = psi_m_iv[0] + iv_mul((dm_lo, dm_lo), q_to_iv(xim))[0] - iv_mul((0, dm_rad), q_to_iv(rho))[1]
            val_r = pk - iv_mul((qk, qk), q_to_iv(xik1))[1]
            if val_r < 0:
                r_iv, _ = eval_psil_jet1(xik1)
                pk, qk = r_iv[0], 0
            p_poly_iv = iv_sub(iv_mul((pk,) * 2, q_to_iv(m_2d[k])), iv_mul((qk,) * 2, q_to_iv(m_4d[k])))
            wd_poly.append(max(0, p_poly_iv[0]))
            if k == 0:
                wd_m2.append((0, 0))
            else:
                m2_iv = iv_sub(iv_mul((pk,) * 2, q_to_iv(m_m2[k])), iv_mul((qk,) * 2, q_to_iv(m_0[k])))
                wd_m2.append((max(0, m2_iv[0]), max(0, m2_iv[1])))
            m0_iv = iv_sub(iv_mul((pk,) * 2, q_to_iv(m_0[k])), iv_mul((qk,) * 2, q_to_iv(m_2d[k])))
            wd_0.append((max(0, m0_iv[0]), max(0, m0_iv[1])))
            if row == "peak":
                p_k_iv, _ = eval_psil_jet1(xik)
                psil_pts_ub.append(p_k_iv[1])
        if row == "peak":
            p_end_iv, _ = eval_psil_jet1((n_tau_d * dtau_d) ** 2)
            psil_pts_ub.append(p_end_iv[1])

        chia_ivs = [eval_chia_iv_any(k * dtau_c) for k in range(n_tau_c + 1)]
        chia_pts = [iv[1] for iv in chia_ivs]
        v_c2 = [iv_add(iv_mul((chia_pts[k],) * 2, w_sec0_2[k]), iv_mul((chia_pts[k + 1],) * 2, w_sec1_2[k])) for k in range(n_tau_c)]
        v_c4 = [iv_add(iv_mul((chia_pts[k],) * 2, w_sec0_4[k]), iv_mul((chia_pts[k + 1],) * 2, w_sec1_4[k])) for k in range(n_tau_c)]

        tau_star = Q(929, 100)
        tail_d_u2_hi = iv_mul(q_to_iv(Q(51, 200) / ((a - b) * (a - 3 * b) * alpha_q)), exp_neg_iv(tau_star * alpha_q))[1]
        e_neg_tca = exp_neg_iv(Q(23, 2) * alpha_q)
        tail_c_lin_iv = iv_mul(iv_div_pos(q_to_iv(Q(44 * 64, 5) / ((a - b) ** 2 * alpha_q)), ctx.e_pos_1), e_neg_tca)
        tail_c_cst_iv = iv_mul(iv_div_pos(q_to_iv(Q(11 * 64, 10) / ((a - b) ** 2 * (Q(23, 2) ** 2) * alpha_q)), ctx.e_pos_1), e_neg_tca)

        worst_ratio = Q(0)
        worst_idx = 0
        worst_d_lb = 0
        worst_csq_hi = 0
        min_d_over_u2 = Q(1000)

        for s_idx in range(len(edges) - 1):
            ulo, uhi = edges[s_idx], edges[s_idx + 1]
            ulo_iv, uhi_iv, row_d = slab_d_data[s_idx]
            _, _, row_c = slab_c_data[s_idx]
            d_acc = 0
            for k, (eb0, poly_c, alp, bet) in enumerate(row_d):
                p_val = iv_mul((poly_c,) * 2, (wd_poly[k],) * 2)[0] if poly_c > 0 else 0
                j_val = 0
                if k > 0 and (alp != 0 or bet != 0):
                    t_alp = iv_mul((alp,) * 2, wd_m2[k])[0]
                    u_pick = ulo_iv if bet >= 0 else uhi_iv
                    j_val = max(0, t_alp + iv_mul((bet,) * 2, iv_mul(u_pick, wd_0[k]))[0])
                best_k = max(p_val, j_val)
                d_acc += iv_mul((eb0,) * 2, (best_k,) * 2)[0]
            d_lb_iv = d_acc - iv_mul((0, tail_d_u2_hi), q_to_iv(uhi * uhi))[1]
            require(d_lb_iv > 0, f"{row} D_lb <= 0 on slab {s_idx}")
            min_d_over_u2 = min(min_d_over_u2, Q(d_lb_iv, ONE) / (uhi * uhi))

            c_int_hi = 0
            for k, (alp_m, bet_m) in enumerate(row_c):
                t_a = iv_mul((alp_m,) * 2, v_c2[k])[1]
                u_pick = uhi_iv if bet_m >= 0 else ulo_iv
                c_int_hi += t_a + iv_mul((bet_m,) * 2, iv_mul(u_pick, v_c4[k]))[1]
            c_int_hi += min(iv_mul(tail_c_lin_iv, uhi_iv)[1], tail_c_cst_iv[1])
            c_sq_hi = iv_mul(q_to_iv(uhi / 2), iv_mul((0, c_int_hi), (0, c_int_hi)))[1]
            ratio_q = Q(c_sq_hi, d_lb_iv)
            if ratio_q > worst_ratio:
                worst_ratio = ratio_q
                worst_idx = s_idx
                worst_d_lb = d_lb_iv
                worst_csq_hi = c_sq_hi

        n_smd = 200
        d_sm_coef = 0
        for k in range(n_smd):
            tk1 = (k + 1) * dtau_d
            ebuf = exp_neg_iv(U_MAX * tk1 * tk1)[0]
            brk = ctx.c2_small_lo - iv_mul((ctx.c3_small_hi,) * 2, q_to_iv(tk1 * tk1 * U_SMALL))[1]
            require(brk > 0, "small-u bracket positive")
            fac = iv_mul((brk,) * 2, (wd_poly[k],) * 2)[0]
            d_sm_coef += iv_mul((ebuf,) * 2, (fac,) * 2)[0]
        d_sm_coef -= tail_d_u2_hi

        c_sm_coef = tail_c_lin_iv[1]
        for k in range(n_tau_c):
            c_sm_coef += iv_mul(q_to_iv(Q(44, 5)), v_c4[k])[1]
        c2_sm_coef = iv_mul(q_to_iv(Q(1, 2)), iv_mul((0, c_sm_coef), (0, c_sm_coef)))[1]
        sm_ratio = Q(c2_sm_coef, d_sm_coef) * U_SMALL
        min_d_u2_all = min(min_d_over_u2, Q(d_sm_coef, ONE))

        require(worst_ratio < Q(9, 100), f"{row}: worst_ratio >= 9/100 ({fmt_dec_ceil(worst_ratio)})")
        require(sm_ratio < Q(9, 100), f"{row}: small_u_ratio >= 9/100")
        kap_d_req = Q(11, 2) if row != "upper" else Q(53, 10)
        require(min_d_u2_all >= kap_d_req, f"{row}: min(D/u_j^2) < {kap_d_req}")

        SCALE8 = 10 ** 8
        worst_ceil_q = Q(-(((-worst_ratio.numerator) * SCALE8) // worst_ratio.denominator), SCALE8)
        sm_ceil_q = Q(-(((-sm_ratio.numerator) * SCALE8) // sm_ratio.denominator), SCALE8)
        min_d_floor_q = Q((min_d_u2_all.numerator * SCALE8) // min_d_u2_all.denominator, SCALE8)
        require(worst_ratio <= worst_ceil_q < Q(9, 100), f"{row}: outward worst_ceil_q < 9/100")
        require(min_d_u2_all >= min_d_floor_q >= kap_d_req, f"{row}: outward min_d_floor_q >= {kap_d_req}")

        thm2_rows[row] = {
            "num_slabs": len(edges) - 1,
            "max_slab_ratio_upper": q_str(worst_ceil_q),
            "small_u_ratio_upper": q_str(sm_ceil_q),
            "min_D_over_u2_lower": q_str(min_d_floor_q),
            "binding_slab_index": worst_idx,
            "binding_slab_u": [q_str(edges[worst_idx]), q_str(edges[worst_idx + 1])],
            "binding_slab_D_lb_scaled": str(worst_d_lb),
            "binding_slab_Csq_hi_scaled": str(worst_csq_hi),
        }

        # Certified two-sided enclosure of C^2/D for the single Wick monomial at peak, u = 463/10000:
        if row == "peak":
            d_mono_hi = iv_mul(
                (psil_pts_ub[0],) * 2,
                q_to_iv(Q(21, 2) * (U_MAX ** 2) * (dtau_d ** 3) / 3 + Q(1, 6) * (U_MAX ** 3) * (dtau_d ** 5) / 5),
            )[1]
            for k in range(1, n_tau_d):
                tk = k * dtau_d
                tk1 = (k + 1) * dtau_d
                xik = tk * tk
                xik1 = tk1 * tk1
                za = xik * U_MAX
                zb = xik1 * U_MAX
                zm = (za + zb) / 2
                if zb <= Q(2, 5):
                    idx = max(1, min(n_fine, int((zm / dz_fine).__round__())))
                    z0 = idx * dz_fine
                    d_iv, dd_iv, _, _ = tab_fine[idx]
                else:
                    idx = max(1, min(400, int((zm / dz).__round__())))
                    z0 = idx * dz
                    d_iv, dd_iv, _, _ = tab_jet[idx]
                rad = max(abs(za - z0), abs(zb - z0))
                m2 = taylor_curv_delta(z0, za, zb)
                qrem = q_to_iv(Q(1, 2) * m2 * rad * rad)[1]
                dd_mid = (dd_iv[0] + dd_iv[1]) // 2
                dd_rad = (dd_iv[1] - dd_iv[0] + 1) // 2
                lrem = iv_mul((0, dd_rad), q_to_iv(rad))[1]
                alp_hi = d_iv[1] - iv_mul((dd_mid, dd_mid), q_to_iv(z0))[0] + lrem + qrem
                bet_hi = dd_mid
                inv_m = Q(1) / tk - Q(1) / tk1
                p0_m = tk1 - tk
                p2_m = (tk1 ** 3 - tk ** 3) / 3
                ws0_m2 = q_to_iv((xik1 * inv_m - p0_m) / (xik1 - xik))
                ws1_m2 = q_to_iv((p0_m - xik * inv_m) / (xik1 - xik))
                ws0_0 = q_to_iv((xik1 * p0_m - p2_m) / (xik1 - xik))
                ws1_0 = q_to_iv((p2_m - xik * p0_m) / (xik1 - xik))
                vd_m2 = iv_add(iv_mul((psil_pts_ub[k],) * 2, ws0_m2), iv_mul((psil_pts_ub[k + 1],) * 2, ws1_m2))
                vd_0 = iv_add(iv_mul((psil_pts_ub[k],) * 2, ws0_0), iv_mul((psil_pts_ub[k + 1],) * 2, ws1_0))
                jet_k_hi = iv_add(iv_mul((alp_hi,) * 2, vd_m2), iv_mul((bet_hi,) * 2, iv_mul(q_to_iv(U_MAX), vd_0)))[1]
                poly_k_hi = iv_mul(
                    (psil_pts_ub[k],) * 2,
                    q_to_iv(Q(21, 2) * (U_MAX ** 2) * p2_m + Q(1, 6) * (U_MAX ** 3) * ((tk1 ** 5 - tk ** 5) / 5)),
                )[1]
                d_mono_hi += min(jet_k_hi, poly_k_hi)
            d_mono_hi += iv_mul(q_to_iv(Q(4) / ((a - b) * (a - 3 * b) * (Q(17, 2) ** 4) * alpha_q)), exp_neg_iv(Q(17, 2) * alpha_q))[1]

            n_c_lo = 435  # 435 * 0.02 = 8.70
            for k in range(n_c_lo, n_tau_c):
                tk = k * dtau_c
                tk1 = (k + 1) * dtau_c
                za = (tk * tk) * U_MAX
                zb = (tk1 * tk1) * U_MAX
                zm = (za + zb) / 2
                idx = max(1, min(n_tab, int((zm / dz).__round__())))
                z0 = idx * dz
                _, _, m_iv, dm_iv = tab_jet[idx]
                rad = max(abs(za - z0), abs(zb - z0))
                m2_tail = taylor_curv_m(z0, za, zb)
                qrem = q_to_iv(Q(1, 2) * m2_tail * rad * rad)[1]
                ua = m_iv[1] + iv_mul(dm_iv, q_to_iv(za - z0))[1] + qrem
                ub = m_iv[1] + iv_mul(dm_iv, q_to_iv(zb - z0))[1] + qrem
                require(max(ua, ub) <= 0, f"M_Wick <= 0 check failed on tail panel {k}")

            c_mono_lo = 0
            for k in range(n_c_lo):
                tk = k * dtau_c
                tk1 = (k + 1) * dtau_c
                chi_r = chia_ivs[k + 1][0]
                wc_2 = iv_mul((chi_r,) * 2, q_to_iv((tk1 ** 3 - tk ** 3) / 3))
                wc_4 = iv_mul((chi_r,) * 2, q_to_iv((tk1 ** 5 - tk ** 5) / 5))
                za = (tk * tk) * U_MAX
                zb = (tk1 * tk1) * U_MAX
                zm = (za + zb) / 2
                if zb <= Q(2, 5):
                    idx = max(1, min(n_fine, int((zm / dz_fine).__round__())))
                    z0 = idx * dz_fine
                    _, _, m_iv, dm_iv = tab_fine[idx]
                else:
                    idx = max(1, min(n_tab, int((zm / dz).__round__())))
                    z0 = idx * dz
                    _, _, m_iv, dm_iv = tab_jet[idx]
                rad = max(abs(za - z0), abs(zb - z0))
                m2_m = taylor_curv_m(z0, za, zb)
                qrem = q_to_iv(Q(1, 2) * m2_m * rad * rad)[1]
                dm_mid = (dm_iv[0] + dm_iv[1]) // 2
                dm_rad = (dm_iv[1] - dm_iv[0] + 1) // 2
                lrem = iv_mul((0, dm_rad), q_to_iv(rad))[1]
                alp_lo = -m_iv[1] + iv_mul((dm_mid, dm_mid), q_to_iv(z0))[0] - lrem - qrem
                bet_lo = -dm_mid
                c_mono_lo += mono_panel_c_lo_contrib(za, zb, alp_lo, bet_lo, wc_2, wc_4)
            c_mono_lo = max(0, c_mono_lo - tail_c_cst_iv[1])
            csq_mono_lo = iv_mul(q_to_iv(U_MAX / 2), iv_mul((c_mono_lo,) * 2, (c_mono_lo,) * 2))[0]

            c_mono_hi = 0
            for k in range(n_tau_c):
                tk = k * dtau_c
                tk1 = (k + 1) * dtau_c
                alp_m, bet_m = abs_m_affine_ub((tk * tk) * U_MAX, (tk1 * tk1) * U_MAX)
                c_mono_hi += iv_add(iv_mul((alp_m,) * 2, v_c2[k]), iv_mul((bet_m,) * 2, iv_mul(q_to_iv(U_MAX), v_c4[k])))[1]
            c_mono_hi += tail_c_cst_iv[1]
            csq_mono_hi = iv_mul(q_to_iv(U_MAX / 2), iv_mul((0, c_mono_hi), (0, c_mono_hi)))[1]

            d_mono_lo = 0
            u_iv_ex = q_to_iv(U_MAX)
            u2_iv_ex = q_to_iv(U_MAX * U_MAX)
            for k in range(n_tau_d):
                tk = k * dtau_d
                tk1 = (k + 1) * dtau_d
                za = (tk * tk) * U_MAX
                zb = (tk1 * tk1) * U_MAX
                brk = ctx.c2_small_lo - iv_mul((ctx.c3_small_hi,) * 2, q_to_iv(zb))[1]
                p_val = iv_mul((iv_mul((brk,) * 2, u2_iv_ex)[0],) * 2, (wd_poly[k],) * 2)[0] if brk > 0 else 0
                j_val = 0
                if k > 0:
                    alp, bet = delta_affine_lb(za, zb)
                    j_val = max(0, iv_add(iv_mul((alp,) * 2, wd_m2[k]), iv_mul((bet,) * 2, iv_mul(u_iv_ex, wd_0[k])))[0])
                d_mono_lo += max(p_val, j_val)
            d_mono_lo -= iv_mul((0, tail_d_u2_hi), u2_iv_ex)[1]

            ratio_lo_q = Q(csq_mono_lo, d_mono_hi)
            ratio_hi_q = Q(csq_mono_hi, d_mono_lo)
            SCALE7 = 10 ** 7
            r_lo_dec = Q((ratio_lo_q.numerator * SCALE7) // ratio_lo_q.denominator, SCALE7)
            r_hi_dec = Q(-(((-ratio_hi_q.numerator) * SCALE7) // ratio_hi_q.denominator), SCALE7)
            require(
                Q(83, 1000) < r_lo_dec <= ratio_lo_q < ratio_hi_q <= r_hi_dec < Q(9, 100),
                f"peak Wick monomial enclosure [{fmt_dec_floor(r_lo_dec)}, {fmt_dec_ceil(r_hi_dec)}]",
            )
            peak_mono_enclosure = [q_str(r_lo_dec), q_str(r_hi_dec)]

    pos_floor_q = Q((min_pos_scaled * (10 ** 9)) >> P, 10 ** 9)
    require(pos_floor_q >= Q(2509689, 10 ** 9) > 0, "positive scaled min_pos_margin")
    return {
        "slab_edges_count": len(edges),
        "slab_u_range": [q_str(edges[0]), q_str(edges[-1])],
        "psi_wick_minus_exp_scaled_lb_min_zeta2_1_on_0_4": q_str(pos_floor_q),
        "peak_wick_monomial_u0463_ratio_enclosure": peak_mono_enclosure,
        "rows": thm2_rows,
    }


# ---------------------------------------------------------------------------
# 5. Fast (< 2 s) audit of saved result.json + 15 adversarial controls
# ---------------------------------------------------------------------------

def audit_result_dict(res: dict, up_sha: str, scalars: dict, thm3: dict, thm4: dict, spot_ctx=None) -> None:
    require(res.get("schema") == "multi-driver-self-interaction-v1", "unexpected schema")
    require(res.get("agent_id") == "gemini-21d5", "unexpected agent_id")
    require(res.get("precision_bits") == P, "unexpected precision_bits")
    require(res.get("upstream_sha256") == up_sha, "upstream SHA-256 mismatch")
    require(res.get("scalars") == scalars, "scalar table mismatch vs live 640-bit recomputation")
    require(res.get("theorem3_shared_bath") == thm3, "Theorem 3 table mismatch vs live recomputation")
    require(res.get("theorem4_character_denominators") == thm4, "Theorem 4 table mismatch vs live recomputation")

    t2 = res.get("theorem2_multi_driver_wick", {})
    edges = build_slab_edges()
    require(t2.get("slab_edges_count") == len(edges), "slab_edges_count mismatch")
    require(t2.get("slab_u_range") == [q_str(U_SMALL), q_str(U_MAX)], "slab_u_range mismatch")
    for idx in range(len(edges) - 1):
        require(edges[idx] < edges[idx + 1], f"non-increasing slab edge at {idx}")
    require(edges[0] == U_SMALL and edges[-1] == U_MAX, "slab endpoints do not cover [1/2000, 463/10000]")

    require("psi_wick_minus_exp_min_margin_on_0_4" not in t2, "legacy unscaled positivity key forbidden")
    pos_mrg = Q(t2.get("psi_wick_minus_exp_scaled_lb_min_zeta2_1_on_0_4", "0"))
    require(pos_mrg >= Q(2509689, 10 ** 9) > 0, "scaled positivity coefficient on (0, 4] must be >= 2509689/10^9")

    mono_enc = [Q(x) for x in t2.get("peak_wick_monomial_u0463_ratio_enclosure", ["0", "0"])]
    require(Q(83, 1000) < mono_enc[0] < mono_enc[1] < Q(9, 100), "invalid peak Wick monomial enclosure")

    rows = t2.get("rows", {})
    require(set(rows.keys()) == set(PROFILES.keys()), "missing profile rows in theorem2")
    for row in PROFILES:
        r = rows[row]
        require(r.get("num_slabs") == len(edges) - 1, f"{row}: num_slabs mismatch")
        max_r = Q(r["max_slab_ratio_upper"])
        sm_r = Q(r["small_u_ratio_upper"])
        min_d = Q(r["min_D_over_u2_lower"])
        require(0 < max_r < Q(9, 100), f"{row}: max_slab_ratio_upper >= 9/100")
        require(0 < sm_r < Q(9, 100), f"{row}: small_u_ratio_upper >= 9/100")
        kap_d_req = Q(11, 2) if row != "upper" else Q(53, 10)
        require(min_d >= kap_d_req, f"{row}: min_D_over_u2_lower < {kap_d_req}")

        b_idx = r["binding_slab_index"]
        require(0 <= b_idx < len(edges) - 1, f"{row}: binding_slab_index out of range")
        require(r["binding_slab_u"] == [q_str(edges[b_idx]), q_str(edges[b_idx + 1])], f"{row}: binding_slab_u mismatch")
        d_lb_sc = int(r["binding_slab_D_lb_scaled"])
        csq_hi_sc = int(r["binding_slab_Csq_hi_scaled"])
        require(d_lb_sc > 0 and csq_hi_sc > 0, f"{row}: non-positive scaled binding slab bounds")
        exact_bind_ratio = Q(csq_hi_sc, d_lb_sc)
        require(exact_bind_ratio <= max_r < Q(9, 100), f"{row}: binding ratio exceeds max_slab_ratio_upper")

    if spot_ctx is not None:
        # Spot-verify Delta_Wick(zeta) >= pos_mrg * min(zeta^2, 1) and M_Wick(zeta) < 0 in 640-bit arithmetic:
        for z_test in [Q(1, 1000), Q(1, 50), Q(1, 5), Q(2), Q(4)]:
            d_iv, _, m_iv, _ = spot_ctx.eval_wick_jet1(z_test)
            req_lb = q_to_iv(pos_mrg * min(z_test * z_test, Q(1)))[1]
            require(d_iv[0] >= req_lb > 0, f"spot scaled positivity failed at zeta={z_test}")
            require(m_iv[1] < 0, f"spot M_Wick < 0 failed at zeta={z_test}")


def expect_failure(fn, control_name: str) -> None:
    failed = False
    try:
        fn()
    except RuntimeError:
        failed = True
    require(failed, f"adversarial control '{control_name}' failed to trigger")


def run_adversarial_controls(res: dict, up_sha: str, scalars: dict, thm3: dict, thm4: dict, ctx: WickBesselContext) -> int:
    # 1. AST rejects float literal / float() call:
    expect_failure(lambda: audit_ast_source("x = 0.25\n", "ctrl1_lit"), "ctrl1_float_literal")
    expect_failure(lambda: audit_ast_source("x = float(1)\n", "ctrl1_call"), "ctrl1_float_call")

    # 2. AST rejects bare assert statement:
    expect_failure(lambda: audit_ast_source("assert 1 == 1\n", "ctrl2_assert"), "ctrl2_bare_assert")

    # 3. High-zeta sign flip: psi_Wick(49/10) - exp(-49/10) < 0 strictly (showing (0, 4] cannot extend naively to R_+):
    d_49, _, _, _ = ctx.eval_wick_jet1(Q(49, 10))
    require(d_49[1] < 0, "ctrl3: psi_Wick(4.9) - exp(-4.9) must be strictly negative")

    # 4. False Wick ratio kappa = 83/1000 = 0.083 is strictly below certified peak Wick monomial lower bound at u = 0.0463:
    mono_lo = Q(res["theorem2_multi_driver_wick"]["peak_wick_monomial_u0463_ratio_enclosure"][0])
    require(Q(83, 1000) < mono_lo, "ctrl4: false target 83/1000 must fail against certified peak monomial lower bound")

    # 5. Sharpness of (3*sqrt(pi)/4) * e in Theorem 3: h = X_1 P_1(Y), Z_alpha = X_1 gives E[|X_1| |h|^2] = (3*sqrt(pi)/4)*e > (37*sqrt(pi)/50)*e:
    sqpi_iv = iv_sqrt_pos(compute_pi_iv())
    sharp_w = iv_mul(q_to_iv(Q(3, 4)), sqpi_iv)[0]
    false_w = iv_mul(q_to_iv(Q(37, 50)), sqpi_iv)[1]
    require(sharp_w > false_w, "ctrl5: 3*sqrt(pi)/4 > 37*sqrt(pi)/50 sharpness")

    # 6. Necessity of global U(1) charge-2 cancellation in Theorem 3: at X = 1, P_1 = H_1 = 1, |X P_1 + bar(X) H_1|^2 = 4 > 2 = |P_1|^2 + |H_1|^2:
    require(abs(1 * 1 + 1 * 1) ** 2 == 4 > 1 ** 2 + 1 ** 2, "ctrl6: unaveraged charge-2 cross term doubles energy")

    # 7. Necessity of H_{2,1} in Theorem 4 vs L^2 cofactor freedom in Theorem 3 (indicator witness h_R = Y_1 1_{|X_1|>3} / exp(-9/2)):
    w_cubic_max = iv_mul(q_to_iv(Q(15, 16)), sqpi_iv)[1]
    require(3 * ONE > w_cubic_max, "ctrl7: non-cubic indicator witness exceeds 15*sqrt(pi)/16")

    # 8. Sharpness of every integer denominator n in Theorem 4 (n - 1 already verified inside compute_scalar_and_perturbation_tables; mutate one cell):
    bad_thm4 = copy.deepcopy(res)
    bad_thm4["theorem4_character_denominators"]["peak"]["6/25"]["9/100"] -= 1
    expect_failure(lambda: audit_result_dict(bad_thm4, up_sha, scalars, thm3, thm4), "ctrl8_thm4_n_minus_1")

    # 9. Tampered max_slab_ratio_upper >= 9/100 in result.json:
    bad_ratio = copy.deepcopy(res)
    bad_ratio["theorem2_multi_driver_wick"]["rows"]["peak"]["max_slab_ratio_upper"] = "9/100"
    expect_failure(lambda: audit_result_dict(bad_ratio, up_sha, scalars, thm3, thm4), "ctrl9_bad_max_ratio")

    # 10. Tampered slab count / broken contiguity in result.json:
    bad_slabs = copy.deepcopy(res)
    bad_slabs["theorem2_multi_driver_wick"]["slab_edges_count"] += 1
    expect_failure(lambda: audit_result_dict(bad_slabs, up_sha, scalars, thm3, thm4), "ctrl10_slab_count")

    # 11. Tampered upstream SHA-256 in result.json:
    bad_sha = copy.deepcopy(res)
    bad_sha["upstream_sha256"] = "0" * 64
    expect_failure(lambda: audit_result_dict(bad_sha, up_sha, scalars, thm3, thm4), "ctrl11_upstream_sha")

    # 12. Tampered binding_slab_D_lb_scaled violating ratio <= max_slab_ratio_upper:
    bad_bind = copy.deepcopy(res)
    bad_bind["theorem2_multi_driver_wick"]["rows"]["flank"]["binding_slab_D_lb_scaled"] = "1"
    expect_failure(lambda: audit_result_dict(bad_bind, up_sha, scalars, thm3, thm4), "ctrl12_binding_slab_tamper")

    # 13. Jet node z0 below panel left endpoint za (slab 113, deficit panel 179 & mark panel 224 + 1/zeta witness):
    edges = build_slab_edges()
    ulo_113, uhi_113 = edges[113], edges[114]
    dtau_d = Q(17, 2) / 340
    dtau_c = Q(23, 2) / 575
    za_179, zb_179 = (179 * dtau_d) ** 2 * ulo_113, (180 * dtau_d) ** 2 * uhi_113
    dz_coarse = Q(123, 20) / 615
    z0_179 = max(1, min(400, int((((za_179 + zb_179) / 2) / dz_coarse).__round__()))) * dz_coarse
    require(z0_179 == Q(2, 5) < za_179 == Q(32041, 80000), "ctrl13: slab 113 deficit panel 179 has z0 < za")
    require(taylor_curv_delta(z0_179, za_179, zb_179) == Q(7, 2) > Q(1) / za_179 + 1, "ctrl13: full-segment Delta curvature > za curvature")
    expect_failure(
        lambda: taylor_curv_delta(z0_179, za_179, zb_179, m2_override=Q(1) / za_179 + 1),
        "ctrl13_naive_za_curv_delta",
    )
    za_224, zb_224 = (224 * dtau_c) ** 2 * ulo_113, (225 * dtau_c) ** 2 * uhi_113
    z0_224 = max(1, min(615, int((((za_224 + zb_224) / 2) / dz_coarse).__round__()))) * dz_coarse
    require(z0_224 == Q(2, 5) < za_224, "ctrl13: slab 113 mark panel 224 has z0 < za")
    require(taylor_curv_m(z0_224, za_224, zb_224) == Q(30) > Q(12) / za_224, "ctrl13: full-segment M curvature > za curvature")
    expect_failure(
        lambda: taylor_curv_m(z0_224, za_224, zb_224, m2_override=Q(12) / za_224),
        "ctrl13_naive_za_curv_m",
    )
    # Exact convex witness g(z) = 1/z (g''(z) = 2/z^3) with z0 = 1/2 < za = 1 <= zb = 2:
    z0_w, za_w = Q(1, 2), Q(1)
    g_za_true = Q(1) / za_w
    g_lin_at_za = (Q(1) / z0_w) + (-Q(1) / (z0_w * z0_w)) * (za_w - z0_w)
    g_ub_naive_za = g_lin_at_za + Q(1, 2) * (Q(2) / (za_w ** 3)) * ((za_w - z0_w) ** 2)
    g_ub_seg_min = g_lin_at_za + Q(1, 2) * (Q(2) / (min(z0_w, za_w) ** 3)) * ((za_w - z0_w) ** 2)
    require(g_ub_naive_za < g_za_true <= g_ub_seg_min, "ctrl13: 1/z witness breaks under za curvature and holds under min(z0, za)")

    # 14. Monomial C_lo zero-clamp endpoint check rejects negative-endpoint panels beyond zb = 16/453:
    require(
        mono_panel_c_lo_contrib(Q(0), Q(463, 25_000_000), -ONE, 0, (ONE, ONE), (ONE, ONE)) == 0,
        "ctrl14: k=0 panel [0, 463/25000000] <= 16/453 validly clamps to 0",
    )
    expect_failure(
        lambda: mono_panel_c_lo_contrib(Q(16, 453), Q(17, 453), -ONE, 0, (ONE, ONE), (ONE, ONE)),
        "ctrl14_unjustified_zero_clamp_above_16_453",
    )

    # 15. Unscaled positivity infimum on (0, 4] is 0 (Delta_Wick(1/1000) < pos_mrg), and legacy unscaled key is rejected:
    pos_c = Q(res["theorem2_multi_driver_wick"]["psi_wick_minus_exp_scaled_lb_min_zeta2_1_on_0_4"])
    d_tiny, _, _, _ = ctx.eval_wick_jet1(Q(1, 1000))
    require(d_tiny[1] < q_to_iv(pos_c)[0], "ctrl15: unscaled Delta_Wick(1/1000) < pos_c confirms min(zeta^2, 1) scaling is essential")
    bad_pos_key = copy.deepcopy(res)
    bad_pos_key["theorem2_multi_driver_wick"]["psi_wick_minus_exp_min_margin_on_0_4"] = q_str(pos_c)
    expect_failure(lambda: audit_result_dict(bad_pos_key, up_sha, scalars, thm3, thm4), "ctrl15_legacy_unscaled_pos_key")

    return 15


def main(argv: list[str]) -> int:
    t0 = time.time()
    recompute = "--recompute" in argv
    write_result = "--write-result" in argv
    unknown = [a for a in argv if a not in ("--recompute", "--write-result")]
    require(not unknown, f"unknown CLI flags: {unknown}")
    if write_result:
        require(recompute, "--write-result requires --recompute")

    # Self-audit verify.py AST:
    audit_ast_source(Path(__file__).read_text(encoding="utf-8"), "verify.py")

    up_sha, scalars, thm3, thm4 = compute_scalar_and_perturbation_tables()
    ctx = WickBesselContext()

    if recompute:
        thm2 = recompute_theorem2_full(ctx)
        fresh = {
            "schema": "multi-driver-self-interaction-v1",
            "agent_id": "gemini-21d5",
            "task_issue": 726,
            "precision_bits": P,
            "upstream_sha256": up_sha,
            "scalars": scalars,
            "theorem2_multi_driver_wick": thm2,
            "theorem3_shared_bath": thm3,
            "theorem4_character_denominators": thm4,
        }
        if write_result:
            RESULT_JSON.write_text(json.dumps(fresh, indent=2, sort_keys=True) + "\n", encoding="utf-8")
            print(f"[write] Wrote {RESULT_JSON} ({RESULT_JSON.stat().st_size} bytes)")
        require(RESULT_JSON.is_file(), f"missing {RESULT_JSON}")
        saved = json.loads(RESULT_JSON.read_text(encoding="utf-8"))
        require(saved == fresh, "recomputed certificate differs from committed result.json")
        audit_result_dict(saved, up_sha, scalars, thm3, thm4, spot_ctx=ctx)
        n_ctrl = run_adversarial_controls(saved, up_sha, scalars, thm3, thm4, ctx)
        mode_lbl = "FULL 640-BIT RECOMPUTE"
    else:
        require(RESULT_JSON.is_file(), f"missing {RESULT_JSON}; run with --recompute --write-result first")
        saved = json.loads(RESULT_JSON.read_text(encoding="utf-8"))
        audit_result_dict(saved, up_sha, scalars, thm3, thm4, spot_ctx=ctx)
        n_ctrl = run_adversarial_controls(saved, up_sha, scalars, thm3, thm4, ctx)
        mode_lbl = "FAST AUDIT + FROM-SCRATCH SCALARS"

    t2 = saved["theorem2_multi_driver_wick"]
    mono_lo, mono_hi = [Q(x) for x in t2["peak_wick_monomial_u0463_ratio_enclosure"]]
    dt_ms = int((time.time() - t0) * 1000)
    print(f"=== PASS [{mode_lbl}] ({dt_ms} ms, {n_ctrl} adversarial controls passed) ===")
    print(f"  Peak Wick monomial C^2/D at u=0.0463 : [{fmt_dec_floor(mono_lo, 7)}, {fmt_dec_ceil(mono_hi, 7)}]")
    for row in ("peak", "flank", "upper"):
        r = t2["rows"][row]
        mr = Q(r["max_slab_ratio_upper"])
        md = Q(r["min_D_over_u2_lower"])
        t4_625 = saved["theorem4_character_denominators"][row]["6/25"]
        t4_1150 = saved["theorem4_character_denominators"][row]["11/50"]
        print(
            f"  {row:5s}: Thm2 C^2/D <= {fmt_dec_ceil(mr, 7)} < 9/100, min(D/u_j^2) >= {fmt_dec_floor(md, 6)} | "
            f"Thm4 (K=6/25): n(9/100,1/10,11/50,9/40,47/200)="
            f"({t4_625['9/100']},{t4_625['1/10']},{t4_625['11/50']},{t4_625['9/40']},{t4_625['47/200']}), "
            f"(K=11/50): n(9/100)={t4_1150['9/100']}"
        )
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))
