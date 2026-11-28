#!/usr/bin/env python3
"""Exact pure-stdlib algebraic, Malliavin-Stein, Wick-contraction, and nodal checks (Issue #458, tag KCS458).

Agent-ID: gemini-8732
Usage:
    python3 -IB check_identities_exact.py [--quiet]

Arithmetic discipline:
  - 100% Python 3 standard library (`ast`, `fractions`, `itertools`, `json`, `math`, `pathlib`, `random`, `sys`, `time`).
  - Zero floating-point operations or literals anywhere in this file (`self_audit_ast()`).
  - Zero `assert` statements (`-O`-safe `require(...)` throughout).

============================================================================================
WHAT THIS SCRIPT VERIFIES EXACTLY IN Q[X_1, ..., X_n]:

Part 1 — Enhanced Real Level-2+ Malliavin-Stein Identities on V_3(R^n) (`cert_v3_458.json`):
  Across 7 explicit rational symmetric 3-tensors T in R^1..R^4 (traced and untraced):
    - LF == -3F, L tau == 4(eta - tau), L eta == -2(eta - ||T||_HS^2);
    - Exact contraction formula for E[nu^2] (where nu = (1/2)<DF, D eta> = (DF)^T M X):
        E[nu^2] == 9 ||Sym_3(T M)||_HS^2 + 6 ||tr(T_. M)||_2^2
      and ||Sym_3(T M)||_HS^2 <= tr(M^3), ||tr(T_. M)||_2^4 <= ||T||_HS^4 * m^3;
    - Exact higher moments of eta - ||T||_HS^2 = I_2(M):
        E[(eta - ||T||_HS^2)^3] == 8 tr(M^3),
        E[(eta - ||T||_HS^2)^4] == 12 m^2 + 48 tr(M^4),   with (tr(M^4))^2 <= m * (tr(M^3))^2;
    - Exact algebraic tangent identity 2 u^3 - 3 a u^2 + a^3 == (u - a)^2 (2 u + a) >= 0;
    - Pointwise operator-norm inequalities w_eta^2 <= 16 m eta^2 and nu^4 <= 9 m tau^2 eta^2
      across 140 rational points X in Q^n;
    - Nodal {F = 0} positivity of RHS - r at r = 0 across all rows of `cert_v3_458.json`
      (including h_3(0), h_3(sqrt(3)), and X_1 X_2 X_3 at (1, 0, 0)).

Part 2 — Real Fifth Wiener Chaos V_5(R^n) OU Tower & Contraction Simplex (`cert_v5_458.json`):
  Across 5 explicit rational symmetric 5-tensors T in R^1..R^3 (both traced and trace-free):
    - Exact 5th Wick expansion I_5(T) in Q[X_1, ..., X_n] satisfies L(I_5(T)) == -5 I_5(T)
      and E[I_5(T) * P] == 0 for all monomials P of degree <= 4;
    - F = I_5(T)/sqrt(120), tau_1 = ||DF||^2/5, tau_2 = ||D^2 F||_HS^2/20 satisfy
        LF == -5F,      L tau_1 == 8(tau_2 - tau_1);
    - Exact chaos-norm decomposition a_k = ||J_{2k}(F)||_2^2 (k = 1, 2, 3, 4) matches exact
      multivariate Gaussian integration for:
        E[F^2], E[tau_1], E[tau_2], E[F^4] - 3||T||_HS^4 == (3/5) sum_{k=1}^4 (5 - k) a_k,
        Var(tau_1), Cov(tau_1, tau_2), Var(tau_2), E[w_1], E[w_{12}], E[w_2],
        E[F^2 (tau_1 - ||T||_HS^2)], E[F^2 (tau_2 - ||T||_HS^2)];
    - Exact zero-mean E[Br_j] == 0 for j in {1, 2, 3, 4}, pointwise sigma_1^2 <= 20 tau_1^2 tau_2
      and 3x3 Gram PSD across 100 rational points, 3-pair Frobenius submultiplicativity
      val_pi(T)^2 <= ||T||_HS^12 on loopless 5-regular matchings, and {F = 0} nodal checks
      (at X_1 = 0, X_1^2 = 5 +- sqrt(10) in Q(sqrt(10)), and X_1..X_5 at (1,1,1,1,0)) across
      all rows of `cert_v5_458.json`.

Part 3 — Complex-to-Real U(1) Phase Invariance on Quintic Chaos H_{3,2}(C^d):
  Confirms in Q[x_1..x_d, y_1..y_d] across rational phases (cos theta, sin theta) in
  {(1, 0), (3/5, 4/5), (5/13, -12/13)} that F_theta = sqrt(2) Re(e^{-i*theta} q) lies in
  V_5(R^{2d}) with E[F_theta^2] == ||q||_2^2, kappa_4(F_theta) == (3/2) chi(q), and
  E[F_theta^6] == (5/2) E|q|^6 identically for every theta.
============================================================================================
"""
import ast
from fractions import Fraction as Fr
import itertools
import json
from math import comb, factorial
import pathlib
import random
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
V3_CERT = HERE / "cert_v3_458.json"
V5_CERT = HERE / "cert_v5_458.json"


def require(cond, msg="exact identity check failed"):
    if not cond:
        raise ValueError(msg)


ALLOWED_MODULES = {"ast", "fractions", "itertools", "json", "math", "pathlib", "random", "sys", "time"}
ALLOWED_MATH_NAMES = {"comb", "factorial"}
FORBIDDEN_CALLS = {"fl" + "oat", "comp" + "lex"}


def self_audit_ast():
    src = pathlib.Path(__file__).read_text(encoding="utf-8")
    tree = ast.parse(src, filename=str(pathlib.Path(__file__)))
    for node in ast.walk(tree):
        if isinstance(node, ast.Assert):
            raise ValueError(f"Bare assert at line {node.lineno}")
        if isinstance(node, ast.Constant) and type(node.value).__name__ in FORBIDDEN_CALLS:
            raise ValueError(f"Float/complex literal {node.value!r} at line {node.lineno}")
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


# ==============================================================================
# EXACT MULTIVARIATE POLYNOMIALS OVER Q
# ==============================================================================
def qp_add(p, q, scale_q=1):
    out = dict(p)
    sq = Fr(scale_q)
    if sq == 0:
        return out
    for k, v in q.items():
        nv = out.get(k, Fr(0)) + v * sq
        if nv:
            out[k] = nv
        else:
            out.pop(k, None)
    return out


def qp_sub(p, q):
    return qp_add(p, q, -1)


def qp_scale(p, s):
    s = Fr(s)
    if s == 0 or not p:
        return {}
    return {k: v * s for k, v in p.items()}


def qp_mul(p, q):
    if not p or not q:
        return {}
    out = {}
    for k1, v1 in p.items():
        for k2, v2 in q.items():
            ek = tuple(a + b for a, b in zip(k1, k2))
            nv = out.get(ek, Fr(0)) + v1 * v2
            if nv:
                out[ek] = nv
            else:
                out.pop(ek, None)
    return out


def qp_const(c, n):
    c = Fr(c)
    return {(0,) * n: c} if c else {}


def qp_var(i, n):
    m = [0] * n
    m[i] = 1
    return {tuple(m): Fr(1)}


def qp_diff(p, i):
    out = {}
    for k, v in p.items():
        e = k[i]
        if e > 0:
            nk = list(k)
            nk[i] = e - 1
            out[tuple(nk)] = v * e
    return out


def qp_ou_L(p, n):
    deg_term = {}
    lap_term = {}
    for k, v in p.items():
        deg = sum(k)
        if deg:
            deg_term[k] = -v * deg
    for i in range(n):
        lap_term = qp_add(lap_term, qp_diff(qp_diff(p, i), i))
    return qp_add(lap_term, deg_term)


def qp_eval(p, x_vec):
    tot = Fr(0)
    for k, v in p.items():
        term = v
        for xi, ei in zip(x_vec, k):
            if ei:
                term *= xi ** ei
        tot += term
    return tot


def gaussian_even_moment(k):
    if k % 2 == 1:
        return Fr(0)
    out = Fr(1)
    for j in range(1, k, 2):
        out *= j
    return out


def qp_expect(p):
    tot = Fr(0)
    for exps, coeff in p.items():
        if any(e % 2 == 1 for e in exps):
            continue
        w = coeff
        for e in exps:
            w *= gaussian_even_moment(e)
        tot += w
    return tot


# ==============================================================================
# PART 1: ENHANCED V_3(R^n) IDENTITIES, CONTRACTIONS, & NODAL CHECKS
# ==============================================================================
def sym3_from_weights(n, mono_weights):
    T = [[[Fr(0) for _ in range(n)] for _ in range(n)] for _ in range(n)]
    for (i, j, k), w in mono_weights.items():
        perms = set(itertools.permutations((i, j, k)))
        share = Fr(w) / len(perms)
        for a, b, c in perms:
            T[a][b][c] += share
    return T


def build_I3_poly(T):
    n = len(T)
    p = {}

    def add_t(exps, c):
        if not c:
            return
        nv = p.get(exps, Fr(0)) + c
        if nv:
            p[exps] = nv
        else:
            p.pop(exps, None)

    for i in range(n):
        for j in range(n):
            for k in range(n):
                c = T[i][j][k]
                if not c:
                    continue
                e3 = [0] * n
                e3[i] += 1; e3[j] += 1; e3[k] += 1
                add_t(tuple(e3), c)
                if j == k:
                    e1 = [0] * n; e1[i] = 1; add_t(tuple(e1), -c)
                if i == k:
                    e1 = [0] * n; e1[j] = 1; add_t(tuple(e1), -c)
                if i == j:
                    e1 = [0] * n; e1[k] = 1; add_t(tuple(e1), -c)
    return p


def verify_v3_enhanced(cert_path=V3_CERT):
    # 0. Exact symbolic verification of 2 u^3 - 3 a u^2 + a^3 == (u - a)^2 (2 u + a) in Q[u, a]:
    u_v, a_v = qp_var(0, 2), qp_var(1, 2)
    lhs_tan = qp_add(qp_sub(qp_scale(qp_mul(u_v, qp_mul(u_v, u_v)), 2),
                            qp_scale(qp_mul(a_v, qp_mul(u_v, u_v)), 3)),
                     qp_mul(a_v, qp_mul(a_v, a_v)))
    u_minus_a = qp_sub(u_v, a_v)
    rhs_tan = qp_mul(qp_mul(u_minus_a, u_minus_a), qp_add(qp_scale(u_v, 2), a_v))
    require(lhs_tan == rhs_tan, "tangent polynomial identity failed")

    cases = [
        ("h_3(X_1)", 1, {(0, 0, 0): Fr(1)}),
        ("X_1 X_2 X_3", 3, {(0, 1, 2): Fr(1)}),
        ("Re((X_1+iX_2)^3)", 2, {(0, 0, 0): Fr(1), (0, 1, 1): Fr(-3)}),
        ("traced_chain_R3", 3, {(0, 0, 1): Fr(1), (1, 2, 2): Fr(1)}),
        ("generic_traced_R3", 3, {
            (0, 0, 0): Fr(3, 5), (1, 1, 1): Fr(-1, 2), (2, 2, 2): Fr(2, 7),
            (0, 0, 1): Fr(4, 5), (0, 1, 2): Fr(-7, 5), (1, 2, 2): Fr(1, 4),
        }),
        ("cartan_like_R4", 4, {(0, 1, 2): Fr(1), (0, 3, 3): Fr(-1, 2), (0, 0, 0): Fr(1, 3), (1, 1, 3): Fr(3, 4)}),
        ("generic_traced_R4", 4, {
            (0, 0, 0): Fr(2, 3), (1, 1, 1): Fr(-3, 5), (2, 2, 2): Fr(1, 4), (3, 3, 3): Fr(-1, 2),
            (0, 0, 1): Fr(1, 2), (0, 2, 3): Fr(-4, 3), (1, 2, 2): Fr(3, 5), (0, 1, 3): Fr(5, 4),
        }),
    ]

    rng = random.Random(20261128)
    n_cone = 0
    for label, n, weights in cases:
        T = sym3_from_weights(n, weights)
        norm2 = sum(T[i][j][k] ** 2 for i in range(n) for j in range(n) for k in range(n))
        M = [[sum(T[i][k][l] * T[j][k][l] for k in range(n) for l in range(n)) for j in range(n)] for i in range(n)]
        M2 = [[sum(M[i][s] * M[s][j] for s in range(n)) for j in range(n)] for i in range(n)]
        M3 = [[sum(M2[i][s] * M[s][j] for s in range(n)) for j in range(n)] for i in range(n)]
        m = sum(M[i][j] ** 2 for i in range(n) for j in range(n))
        tr_M3 = sum(M2[i][j] * M[j][i] for i in range(n) for j in range(n))
        tr_M4 = sum(M3[i][j] * M[j][i] for i in range(n) for j in range(n))

        require(tr_M3 * norm2 >= m * m and tr_M3 * tr_M3 <= m ** 3, f"{label}: tr(M^3) bounds failed")
        require(tr_M4 * tr_M4 <= m * (tr_M3 ** 2), f"{label}: tr(M^4) <= sqrt(m) tr(M^3) failed")

        F_s6 = build_I3_poly(T)
        DF_s6 = [qp_diff(F_s6, i) for i in range(n)]
        D2F_s6 = [[qp_diff(DF_s6[i], j) for j in range(n)] for i in range(n)]
        tau = {}
        eta = {}
        for i in range(n):
            tau = qp_add(tau, qp_mul(DF_s6[i], DF_s6[i]), Fr(1, 18))
            for j in range(n):
                eta = qp_add(eta, qp_mul(D2F_s6[i][j], D2F_s6[i][j]), Fr(1, 36))
        Deta = [qp_diff(eta, i) for i in range(n)]
        w_eta = {}
        nu_s6 = {}
        for i in range(n):
            w_eta = qp_add(w_eta, qp_mul(Deta[i], Deta[i]))
            nu_s6 = qp_add(nu_s6, qp_mul(DF_s6[i], Deta[i]), Fr(1, 2))

        require(qp_ou_L(F_s6, n) == qp_scale(F_s6, -3), f"{label}: LF != -3F")
        require(qp_ou_L(tau, n) == qp_scale(qp_sub(eta, tau), 4), f"{label}: Ltau != 4(eta-tau)")
        require(qp_ou_L(eta, n) == qp_scale(qp_sub(eta, qp_const(norm2, n)), -2), f"{label}: Leta failed")

        # 1. Exact Wiener-Ito contraction formula for E[nu^2]:
        #    nu = (DF)^T M X, so nu^2 = (1/6) nu_s6^2:
        nu2_poly = qp_scale(qp_mul(nu_s6, nu_s6), Fr(1, 6))
        ev_nu2 = qp_expect(nu2_poly)

        TM = [[[sum(T[i][j][r] * M[r][k] for r in range(n)) for k in range(n)] for j in range(n)] for i in range(n)]
        Sym3_TM_sq = sum(
            (Fr(1, 3) * (TM[i][j][k] + TM[i][k][j] + TM[j][k][i])) ** 2
            for i in range(n) for j in range(n) for k in range(n)
        )
        tr_TM_vec_sq = sum(
            (sum(T[i][j][k] * M[j][k] for j in range(n) for k in range(n))) ** 2
            for i in range(n)
        )
        require(ev_nu2 == 9 * Sym3_TM_sq + 6 * tr_TM_vec_sq, f"{label}: exact E[nu^2] formula failed")
        require(Sym3_TM_sq <= tr_M3, f"{label}: ||Sym_3(TM)||_HS^2 <= tr(M^3) failed")
        require((tr_TM_vec_sq ** 2) <= (norm2 ** 2) * (m ** 3), f"{label}: ||tr(T_. M)||_2^2 <= ||T||_HS m^(3/2) failed")

        # 2. Exact higher cumulants/moments of eta - norm2 = I_2(M):
        deta = qp_sub(eta, qp_const(norm2, n))
        deta2 = qp_mul(deta, deta)
        require(qp_expect(qp_mul(deta2, deta)) == 8 * tr_M3, f"{label}: E[(eta-norm2)^3] != 8 tr(M^3)")
        require(qp_expect(qp_mul(deta2, deta2)) == 12 * (m ** 2) + 48 * tr_M4,
                f"{label}: E[(eta-norm2)^4] != 12 m^2 + 48 tr(M^4)")

        # 3. Pointwise operator-norm inequalities on 20 rational vectors X in Q^n:
        for _ in range(20):
            x_vec = [Fr(rng.randint(-4, 4), rng.choice((1, 2, 3))) for _ in range(n)]
            tv = qp_eval(tau, x_vec)
            ev = qp_eval(eta, x_vec)
            we = qp_eval(w_eta, x_vec)
            nu2_v = (qp_eval(nu_s6, x_vec) ** 2) / 6
            require((we ** 2) <= 16 * m * (ev ** 2), f"{label}: w_eta <= 4 sqrt(m) eta failed")
            require((nu2_v ** 2) <= 9 * m * (tv ** 2) * (ev ** 2), f"{label}: nu^2 <= 3 sqrt(m) tau eta failed")
            n_cone += 1

    # 4. Nodal {F = 0} regression on all rows of `cert_v3_458.json` (when present):
    nodal_v3 = [
        ("h_3 at X_1=0", Fr(1, 2), Fr(0), Fr(0), Fr(0), Fr(0)),
        ("h_3 at X_1=sqrt(3)", Fr(2), Fr(3), Fr(48), Fr(24), Fr(12)),
        ("X_1 X_2 X_3 at (1,0,0)", Fr(0), Fr(1, 3), Fr(0), Fr(0), Fr(4, 9)),
    ]
    n_rows_v3 = 0
    if cert_path.exists():
        cert = json.loads(cert_path.read_text(encoding="utf-8"))
        for idx_row, row in enumerate(cert["rows"]):
            kden = Fr(row["knot_den"])
            knots = [Fr(x) for x in row["knots"]]
            K = len(knots) - 1
            phi1_0 = Fr(row["phi1"][0], kden)
            phi2_0 = Fr(row["phi2"][0], kden)
            phi3_0 = Fr(row["phi3"][0], kden)
            psi4 = [Fr(x, kden) for x in row["psi4"]]
            psi7 = [Fr(x, kden) for x in row["psi7"]]
            require(psi4[0] == 0 and psi7[0] == 0, f"V_3 row {idx_row}: psi4(0)/psi7(0) != 0")
            h4_0 = -sum(Fr(1, 2) * (psi4[j] + psi4[j + 1]) * (knots[j + 1] - knots[j]) for j in range(K))
            h7_0 = -sum(Fr(1, 2) * (psi7[j] + psi7[j + 1]) * (knots[j + 1] - knots[j]) for j in range(K))
            lam0 = Fr(row["lam"][0])
            m00, m01, m11 = (Fr(x) for x in row["m_ker"])
            mu00, mu01, mu11 = (Fr(x) for x in row["m_w"])
            lam_e3, lam_e4, _ = (Fr(x) for x in row["eta_high"])
            for st_lbl, tv, ev, wt, wte, we in nodal_v3:
                rhs_0 = (
                    lam0
                    + m00 * ((tv - 1) ** 2) + 2 * m01 * (tv - 1) * (ev - 1) + m11 * ((ev - 1) ** 2)
                    + lam_e3 * ((ev - 1) ** 3) + lam_e4 * ((ev - 1) ** 4)
                    + mu00 * wt + 2 * mu01 * wte + mu11 * we
                    + 3 * tv * phi1_0 + 3 * tv * (tv - 1) * phi2_0 + 3 * tv * (ev - 1) * phi3_0
                    - 4 * (tv - ev) * h4_0 - 2 * (ev - 1) * h7_0
                )
                require(rhs_0 > 0, f"V_3 row {idx_row} nodal RHS <= 0 on {st_lbl}: {rhs_0}")
            n_rows_v3 += 1

    return len(cases), n_cone, n_rows_v3


# ==============================================================================
# PART 2: REAL FIFTH WIENER CHAOS V_5(R^n) OU TOWER, SIMPLEX MOMENTS, & FROBENIUS
# ==============================================================================
PAIRS_5 = tuple(itertools.combinations(range(5), 2))  # 10 single pairs
DOUBLE_PAIRS_5 = []
for i1, j1 in PAIRS_5:
    rem = [x for x in range(5) if x not in (i1, j1)]
    for i2, j2 in itertools.combinations(rem, 2):
        if (i1, j1) < (i2, j2):
            e_last = [x for x in rem if x not in (i2, j2)][0]
            DOUBLE_PAIRS_5.append((i1, j1, i2, j2, e_last))
require(len(PAIRS_5) == 10 and len(DOUBLE_PAIRS_5) == 15, "Wick5 pair counts failed")


def sym5_from_weights(n, mono_weights):
    T = [[[[[Fr(0) for _ in range(n)] for _ in range(n)] for _ in range(n)] for _ in range(n)] for _ in range(n)]
    for idx5, w in mono_weights.items():
        perms = set(itertools.permutations(idx5))
        share = Fr(w) / len(perms)
        for a, b, c, d, e in perms:
            T[a][b][c][d][e] += share
    return T


def build_I5_poly(T):
    """Exact 5th multiple Wiener-Ito integral I_5(T) in Q[X_1, ..., X_n] (note F = I_5(T)/sqrt(120))."""
    n = len(T)
    p = {}

    def add_t(exps, c):
        if not c:
            return
        nv = p.get(exps, Fr(0)) + c
        if nv:
            p[exps] = nv
        else:
            p.pop(exps, None)

    for idx in itertools.product(range(n), repeat=5):
        c = T[idx[0]][idx[1]][idx[2]][idx[3]][idx[4]]
        if not c:
            continue
        e5 = [0] * n
        for u in idx:
            e5[u] += 1
        add_t(tuple(e5), c)
        for a, b in PAIRS_5:
            if idx[a] == idx[b]:
                e3 = [0] * n
                for u_pos in range(5):
                    if u_pos not in (a, b):
                        e3[idx[u_pos]] += 1
                add_t(tuple(e3), -c)
        for a, b, u, v, w_pos in DOUBLE_PAIRS_5:
            if idx[a] == idx[b] and idx[u] == idx[v]:
                e1 = [0] * n
                e1[idx[w_pos]] = 1
                add_t(tuple(e1), c)
    return p


def compute_v5_chaos_norms(T):
    """Compute exact a_k = ||J_{2k}(F)||_2^2 (k = 1, 2, 3, 4) for F = I_5(T)/sqrt(120):
    In F^2 = (1/120) I_5(T)^2 = ||T||_HS^2 + sum_{r=1}^4 (r! C(5,r)^2 / 120) I_{10-2r}(T otimes~_r T) + (1/120) I_{10}(T otimes~ T),
    put k = 5 - r in {1, 2, 3, 4} (so r = 5 - k in {4, 3, 2, 1}, chaos order 2k in {2, 4, 6, 8}):
      a_k = (2k)! * ((5-k)! * C(5, 5-k)^2 / 120)^2 * ||Sym_{2k}(T otimes_{5-k} T)||_HS^2."""
    n = len(T)
    norm2 = sum(T[i0][i1][i2][i3][i4] ** 2 for i0, i1, i2, i3, i4 in itertools.product(range(n), repeat=5))
    a_dict = {}
    for k in (1, 2, 3, 4):
        r = 5 - k
        deg = 2 * k
        # Compute raw contraction C_{a_1..a_k, b_1..b_k} = sum_{s_1..s_r} T_{a_1..a_k, s_1..s_r} T_{b_1..b_k, s_1..s_r}:
        raw = {}
        for ab in itertools.product(range(n), repeat=deg):
            a_part, b_part = ab[:k], ab[k:]
            s_val = Fr(0)
            for s_tup in itertools.product(range(n), repeat=r):
                v1 = T[a_part[0]] if k >= 1 else None
                t1 = T
                for ix in a_part + s_tup:
                    t1 = t1[ix]
                if not t1:
                    continue
                t2 = T
                for ix in b_part + s_tup:
                    t2 = t2[ix]
                s_val += t1 * t2
            if s_val:
                raw[ab] = s_val

        # Symmetrize raw over all (2k)! permutations (using C(2k, k) subset choices since a_part and b_part are already symmetric!):
        # Specifically, T is symmetric in its 5 slots, so raw[a_part, b_part] depends ONLY on the multiset of a_part and multiset of b_part!
        # Thus Sym_{2k}(raw)[idx_{1..2k}] = (1 / C(2k, k)) * sum_{S subset {0..2k-1}, |S|=k} raw[idx_S, idx_{S^c}]!
        subsets_k = list(itertools.combinations(range(deg), k))
        inv_choose = Fr(1, len(subsets_k))
        sym_hs2 = Fr(0)
        for idx_all in itertools.product(range(n), repeat=deg):
            tot_sym = Fr(0)
            for sub in subsets_k:
                sub_set = set(sub)
                ap = tuple(idx_all[p] for p in sub)
                bp = tuple(idx_all[p] for p in range(deg) if p not in sub_set)
                tot_sym += raw.get(ap + bp, Fr(0))
            sym_val = tot_sym * inv_choose
            sym_hs2 += sym_val * sym_val

        coeff_I = Fr(factorial(r) * (comb(5, r) ** 2), 120)
        a_dict[k] = Fr(factorial(deg)) * (coeff_I ** 2) * sym_hs2
    return norm2, a_dict


def build_v5_carre_polys(T):
    n = len(T)
    F_s120 = build_I5_poly(T)
    DF_s120 = [qp_diff(F_s120, i) for i in range(n)]
    D2F_s120 = [[qp_diff(DF_s120[i], j) for j in range(n)] for i in range(n)]
    V = qp_scale(qp_mul(F_s120, F_s120), Fr(1, 120))
    tau1, tau2 = {}, {}
    for i in range(n):
        tau1 = qp_add(tau1, qp_mul(DF_s120[i], DF_s120[i]), Fr(1, 600))
        for j in range(n):
            tau2 = qp_add(tau2, qp_mul(D2F_s120[i][j], D2F_s120[i][j]), Fr(1, 2400))
    Dt1 = [qp_diff(tau1, i) for i in range(n)]
    Dt2 = [qp_diff(tau2, i) for i in range(n)]
    w1, w12, w2 = {}, {}, {}
    sig1_s120, nu12_s120 = {}, {}
    for i in range(n):
        w1 = qp_add(w1, qp_mul(Dt1[i], Dt1[i]))
        w12 = qp_add(w12, qp_mul(Dt1[i], Dt2[i]))
        w2 = qp_add(w2, qp_mul(Dt2[i], Dt2[i]))
        sig1_s120 = qp_add(sig1_s120, qp_mul(DF_s120[i], Dt1[i]), Fr(1, 2))
        nu12_s120 = qp_add(nu12_s120, qp_mul(DF_s120[i], Dt2[i]), Fr(1, 2))
    return dict(
        F_s120=F_s120, DF_s120=DF_s120, D2F_s120=D2F_s120,
        V=V, tau1=tau1, tau2=tau2, w1=w1, w12=w12, w2=w2,
        sig1_s120=sig1_s120, nu12_s120=nu12_s120,
    )


def verify_v5_tower_and_frobenius(cert_path=V5_CERT):
    cases_v5 = [
        ("h_5(X_1)", 1, {(0, 0, 0, 0, 0): Fr(1)}),
        ("Re((X_1+iX_2)^5)", 2, {(0, 0, 0, 0, 0): Fr(1), (0, 0, 0, 1, 1): Fr(-10), (0, 1, 1, 1, 1): Fr(5)}),
        ("traced_R2", 2, {(0, 0, 0, 0, 1): Fr(3, 4), (0, 0, 1, 1, 1): Fr(-2, 3), (1, 1, 1, 1, 1): Fr(1, 2)}),
        ("untraced_like_R3", 3, {(0, 0, 1, 1, 2): Fr(1), (0, 1, 2, 2, 2): Fr(-1, 2)}),
        ("generic_traced_R3", 3, {
            (0, 0, 0, 0, 0): Fr(2, 5), (1, 1, 1, 1, 1): Fr(-1, 3), (0, 0, 0, 1, 2): Fr(3, 4),
            (0, 1, 1, 2, 2): Fr(-4, 5), (0, 2, 2, 2, 2): Fr(1, 2),
        }),
    ]

    rng = random.Random(4582026)
    n_br_v5 = 0
    n_cone_v5 = 0
    n_frob_checks = 0

    for label, n, weights in cases_v5:
        T = sym5_from_weights(n, weights)
        norm2, a_dict = compute_v5_chaos_norms(T)
        cp = build_v5_carre_polys(T)
        F_s120, V, tau1, tau2 = cp["F_s120"], cp["V"], cp["tau1"], cp["tau2"]

        # 1. Confirm L(I_5(T)) == -5 I_5(T) AND orthogonality against all monomials of degree <= 4:
        require(qp_ou_L(F_s120, n) == qp_scale(F_s120, -5), f"{label}: L F != -5 F")
        for deg_m in range(5):
            for mono_vars in itertools.combinations_with_replacement(range(n), deg_m):
                ex = [0] * n
                for v_i in mono_vars:
                    ex[v_i] += 1
                require(qp_expect(qp_mul(F_s120, {tuple(ex): Fr(1)})) == 0, f"{label}: I_5 not perp deg {deg_m}")

        # 2. Exact OU generator identity L tau_1 == 8 (tau_2 - tau_1):
        require(qp_ou_L(tau1, n) == qp_scale(qp_sub(tau2, tau1), 8), f"{label}: L tau_1 != 8(tau_2 - tau_1)")

        # 3. Exact moment identities vs a_k = ||J_{2k}(F)||_2^2 (k = 1, 2, 3, 4):
        require(qp_expect(V) == norm2 and qp_expect(tau1) == norm2 and qp_expect(tau2) == norm2, f"{label}: mean failed")
        V2 = qp_mul(V, V)
        require(qp_expect(V2) - 3 * (norm2 ** 2) == Fr(3, 5) * sum((5 - k) * a_dict[k] for k in (1, 2, 3, 4)),
                f"{label}: V_5 fourth cumulant formula failed")

        c1 = {k: Fr(5 - k, 5) for k in (1, 2, 3, 4)}
        c2 = {k: Fr((5 - k) * (4 - k), 20) for k in (1, 2, 3, 4)}
        dt1 = qp_sub(tau1, qp_const(norm2, n))
        dt2 = qp_sub(tau2, qp_const(norm2, n))
        require(qp_expect(qp_mul(dt1, dt1)) == sum((c1[k] ** 2) * a_dict[k] for k in (1, 2, 3, 4)), f"{label}: Var(tau1)")
        require(qp_expect(qp_mul(dt1, dt2)) == sum(c1[k] * c2[k] * a_dict[k] for k in (1, 2, 3, 4)), f"{label}: Cov(tau1,tau2)")
        require(qp_expect(qp_mul(dt2, dt2)) == sum((c2[k] ** 2) * a_dict[k] for k in (1, 2, 3, 4)), f"{label}: Var(tau2)")
        require(qp_expect(cp["w1"]) == sum((2 * k) * (c1[k] ** 2) * a_dict[k] for k in (1, 2, 3, 4)), f"{label}: E[w1]")
        require(qp_expect(cp["w12"]) == sum((2 * k) * c1[k] * c2[k] * a_dict[k] for k in (1, 2, 3, 4)), f"{label}: E[w12]")
        require(qp_expect(cp["w2"]) == sum((2 * k) * (c2[k] ** 2) * a_dict[k] for k in (1, 2, 3, 4)), f"{label}: E[w2]")
        require(qp_expect(qp_mul(V, dt1)) == sum(c1[k] * a_dict[k] for k in (1, 2, 3, 4)), f"{label}: E[V dt1]")
        require(qp_expect(qp_mul(V, dt2)) == sum(c2[k] * a_dict[k] for k in (1, 2, 3, 4)), f"{label}: E[V dt2]")

        # 4. Exact zero-mean of Br_1..Br_4 on polynomial profiles (for n <= 2 or degree <= 1 to keep fast):
        F_sig1 = qp_scale(qp_mul(F_s120, cp["sig1_s120"]), Fr(1, 120))
        F_nu12 = qp_scale(qp_mul(F_s120, cp["nu12_s120"]), Fr(1, 120))
        for d in (0, 1):
            Vd = qp_const(1, n) if d == 0 else V
            Vd1 = qp_mul(Vd, V)
            inv_2d1 = Fr(1, 2 * d + 1)
            br1 = qp_sub(qp_scale(qp_mul(tau1, Vd), 5), qp_scale(Vd1, 5 * inv_2d1))
            br2 = qp_add(qp_sub(qp_scale(qp_mul(qp_mul(tau1, dt1), Vd), 5), qp_scale(qp_mul(dt1, Vd1), 5 * inv_2d1)),
                         qp_scale(qp_mul(F_sig1, Vd), 2 * inv_2d1))
            br3 = qp_add(qp_sub(qp_scale(qp_mul(qp_mul(tau1, dt2), Vd), 5), qp_scale(qp_mul(dt2, Vd1), 5 * inv_2d1)),
                         qp_scale(qp_mul(F_nu12, Vd), 2 * inv_2d1))
            require(qp_expect(br1) == 0 and qp_expect(br2) == 0 and qp_expect(br3) == 0, f"{label}: V_5 Br1-3 != 0")
            n_br_v5 += 3
            if d == 1:
                Hj = qp_sub(V, qp_const(1, n))
                br4 = qp_sub(qp_scale(F_sig1, 4), qp_scale(qp_mul(qp_sub(tau1, tau2), Hj), 8))
                require(qp_expect(br4) == 0, f"{label}: V_5 Br4 != 0")
                n_br_v5 += 1

        # 5. Pointwise cones sigma_1^2 <= 20 tau_1^2 tau_2 and 3x3 Gram PSD on 20 rational vectors:
        for _ in range(20):
            x_vec = [Fr(rng.randint(-4, 4), rng.choice((1, 2, 3))) for _ in range(n)]
            t1v, t2v = qp_eval(tau1, x_vec), qp_eval(tau2, x_vec)
            w1v, w12v, w2v = qp_eval(cp["w1"], x_vec), qp_eval(cp["w12"], x_vec), qp_eval(cp["w2"], x_vec)
            s2 = (qp_eval(cp["sig1_s120"], x_vec) ** 2) / 120
            nu2 = (qp_eval(cp["nu12_s120"], x_vec) ** 2) / 120
            s_nu = (qp_eval(cp["sig1_s120"], x_vec) * qp_eval(cp["nu12_s120"], x_vec)) / 120
            require(20 * (t1v ** 2) * t2v - s2 >= 0, f"{label}: sigma_1^2 <= 20 tau_1^2 tau_2 failed")
            require(t1v * w1v - Fr(4, 5) * s2 >= 0 and t1v * w2v - Fr(4, 5) * nu2 >= 0, f"{label}: V_5 Gram2 failed")
            det_g3 = t1v * (w1v * w2v - w12v * w12v) - Fr(4, 5) * s2 * w2v + Fr(8, 5) * s_nu * w12v - Fr(4, 5) * nu2 * w1v
            require(det_g3 >= 0, f"{label}: V_5 Gram3 PSD failed")
            n_cone_v5 += 1

        # 6. Direct 3-pair Frobenius submultiplicativity check on representative loopless 5-regular 6-vertex multigraphs:
        if n <= 2:
            loopless_graphs = [
                # Complete bipartite-style & prism-style 5-regular 6-vertex multigraphs (15 edges):
                ((0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 4), (3, 5), (4, 5)),
                ((0, 1), (0, 1), (0, 1), (0, 2), (0, 2), (1, 3), (1, 3), (2, 4), (2, 4), (2, 5), (3, 4), (3, 5), (3, 5), (4, 5), (4, 5)),
                ((0, 1), (0, 1), (0, 1), (0, 1), (0, 2), (1, 3), (2, 3), (2, 4), (2, 4), (2, 5), (3, 4), (3, 5), (3, 5), (4, 5), (4, 5)),
            ]
            for edges15 in loopless_graphs:
                inc = [[] for _ in range(6)]
                for e_idx, (u_, v_) in enumerate(edges15):
                    inc[u_].append(e_idx); inc[v_].append(e_idx)
                require(all(len(inc[v]) == 5 for v in range(6)), "not 5-regular")
                val_g = Fr(0)
                for col in itertools.product(range(n), repeat=15):
                    pr = Fr(1)
                    for v in range(6):
                        i0, i1, i2, i3, i4 = (col[e] for e in inc[v])
                        tv = T[i0][i1][i2][i3][i4]
                        if not tv:
                            pr = Fr(0)
                            break
                        pr *= tv
                    val_g += pr
                require(val_g * val_g <= norm2 ** 6, f"{label}: 5-regular graph exceeded ||T||_HS^6")
                n_frob_checks += 1

    # 7. Exact {F = 0} nodal checks for V_5 across all rows of `cert_v5_458.json`:
    #    (a) h_5(0)/sqrt(120): X_1 = 0 => tau_1 = 15^2/600 = 3/8, tau_2 = 0, w_1 = w_{12} = w_2 = 0.
    #    (b) X_1 X_2 X_3 X_4 X_5 at (1, 1, 1, 1, 0): F = 0, DF = (0,0,0,0,1) => tau_1 = 1/5;
    #        D^2 F has 4 entries equal to 1 in row/col 5 (times 2 = 8 entries) => ||D^2 F||_HS^2 = 8 => tau_2 = 8/20 = 2/5;
    #        D tau_1 = (2/5)(D^2 F) DF = (2/5)*(1,1,1,1,0) => w_1 = 4*(4/25) = 16/25;
    #        (D^3 F)_{ab5} = 1 for distinct a,b in {1..4} (12 entries); D tau_2_m = (1/10) sum_{i,j} (D^2 F)_{ij}(D^3 F)_{ijm}:
    #        for m in {1..4}, pairs (i,5) and (5,i) with i in {1..4}\{m} (6 pairs) give (1/10)*6 = 3/5 => w_2 = 4*(9/25) = 36/25,
    #        w_{12} = 4*(2/5)*(3/5) = 24/25!
    #    (c) h_5(X_1)/sqrt(120) at X_1^2 = 5 + sqrt(10) and 5 - sqrt(10) in Q(sqrt(10))!
    #        Check in exact Q(sqrt(10)) (pairs (a, b) = a + b*sqrt(10)):
    T_h5 = sym5_from_weights(1, {(0, 0, 0, 0, 0): Fr(1)})
    cp_h5 = build_v5_carre_polys(T_h5)
    require((qp_eval(cp_h5["tau1"], [Fr(0)]), qp_eval(cp_h5["tau2"], [Fr(0)])) == (Fr(3, 8), Fr(0)),
            "h_5(0) nodal values mismatch")

    def q10_mul(x, y):
        return (x[0] * y[0] + 10 * x[1] * y[1], x[0] * y[1] + x[1] * y[0])

    def q10_eval_even(p, x2_q10):
        acc = (Fr(0), Fr(0))
        for (e,), c in p.items():
            require(e % 2 == 0, "expected even polynomial")
            pw = (Fr(1), Fr(0))
            for _ in range(e // 2):
                pw = q10_mul(pw, x2_q10)
            acc = (acc[0] + c * pw[0], acc[1] + c * pw[1])
        return acc

    for sgn10 in (1, -1):
        x2_root = (Fr(5), Fr(sgn10))
        require(q10_eval_even(cp_h5["V"], x2_root) == (Fr(0), Fr(0)), "h_5 root check in Q(sqrt(10)) failed")

    nodal_v5_rat = [
        ("h_5 at X_1=0", Fr(3, 8), Fr(0), Fr(0), Fr(0), Fr(0)),
        ("X_1..X_5 at (1,1,1,1,0)", Fr(1, 5), Fr(2, 5), Fr(16, 25), Fr(24, 25), Fr(36, 25)),
    ]

    n_rows_v5 = 0
    if cert_path.exists():
        cert = json.loads(cert_path.read_text(encoding="utf-8"))
        for idx_row, row in enumerate(cert["rows_v5"] + cert["rows_h32_slice"]):
            kden = Fr(row["knot_den"])
            knots = [Fr(x) for x in row["knots"]]
            K = len(knots) - 1
            phi1_0 = Fr(row["phi1"][0], kden)
            phi2_0 = Fr(row["phi2"][0], kden)
            phi3_0 = Fr(row["phi3"][0], kden)
            psi4 = [Fr(x, kden) for x in row["psi4"]]
            require(psi4[0] == 0, f"V_5 row {idx_row}: psi4(0) != 0")
            h4_0 = -sum(Fr(1, 2) * (psi4[j] + psi4[j + 1]) * (knots[j + 1] - knots[j]) for j in range(K))
            lam0 = Fr(row["lam"][0])
            m00, m01, m11 = (Fr(x) for x in row["m_ker"])
            mu00, mu01, mu11 = (Fr(x) for x in row["m_w"])
            for st_lbl, t1v, t2v, w1v, w12v, w2v in nodal_v5_rat:
                rhs_0 = (
                    lam0
                    + m00 * ((t1v - 1) ** 2) + 2 * m01 * (t1v - 1) * (t2v - 1) + m11 * ((t2v - 1) ** 2)
                    + mu00 * w1v + 2 * mu01 * w12v + mu11 * w2v
                    + 5 * t1v * phi1_0 + 5 * t1v * (t1v - 1) * phi2_0 + 5 * t1v * (t2v - 1) * phi3_0
                    - 8 * (t1v - t2v) * h4_0
                )
                require(rhs_0 > 0, f"V_5 row {idx_row} nodal RHS <= 0 on {st_lbl}: {rhs_0}")

            # Also check BOTH irrational roots X_1^2 = 5 +- sqrt(10) in exact Q(sqrt(10))!
            for sgn10 in (1, -1):
                x2_r = (Fr(5), Fr(sgn10))
                t1_q = q10_eval_even(cp_h5["tau1"], x2_r)
                t2_q = q10_eval_even(cp_h5["tau2"], x2_r)
                w1_q = q10_eval_even(cp_h5["w1"], x2_r)
                w12_q = q10_eval_even(cp_h5["w12"], x2_r)
                w2_q = q10_eval_even(cp_h5["w2"], x2_r)
                dt1_q = (t1_q[0] - 1, t1_q[1])
                dt2_q = (t2_q[0] - 1, t2_q[1])
                dt1_sq, dt12_pr, dt2_sq = q10_mul(dt1_q, dt1_q), q10_mul(dt1_q, dt2_q), q10_mul(dt2_q, dt2_q)
                t1_dt1, t1_dt2 = q10_mul(t1_q, dt1_q), q10_mul(t1_q, dt2_q)
                a_part = (
                    lam0 + m00 * dt1_sq[0] + 2 * m01 * dt12_pr[0] + m11 * dt2_sq[0]
                    + mu00 * w1_q[0] + 2 * mu01 * w12_q[0] + mu11 * w2_q[0]
                    + 5 * phi1_0 * t1_q[0] + 5 * phi2_0 * t1_dt1[0] + 5 * phi3_0 * t1_dt2[0]
                    - 8 * h4_0 * (t1_q[0] - t2_q[0])
                )
                b_part = (
                    m00 * dt1_sq[1] + 2 * m01 * dt12_pr[1] + m11 * dt2_sq[1]
                    + mu00 * w1_q[1] + 2 * mu01 * w12_q[1] + mu11 * w2_q[1]
                    + 5 * phi1_0 * t1_q[1] + 5 * phi2_0 * t1_dt1[1] + 5 * phi3_0 * t1_dt2[1]
                    - 8 * h4_0 * (t1_q[1] - t2_q[1])
                )
                # Verify a_part + b_part * sqrt(10) > 0 strictly without floats:
                # If b_part >= 0: need a_part > 0 OR (a_part <= 0 and 10 * b_part^2 > a_part^2 and b_part > 0);
                # If b_part < 0: need a_part > 0 and a_part^2 > 10 * b_part^2!
                if b_part >= 0:
                    ok_q10 = (a_part > 0) or (b_part > 0 and 10 * b_part * b_part > a_part * a_part)
                else:
                    ok_q10 = (a_part > 0) and (a_part * a_part > 10 * b_part * b_part)
                require(ok_q10, f"V_5 row {idx_row} Q(sqrt(10)) nodal check failed at sgn={sgn10}")
            n_rows_v5 += 1

    return len(cases_v5), n_br_v5, n_cone_v5, n_frob_checks, n_rows_v5


# ==============================================================================
# PART 3: COMPLEX-TO-REAL U(1) PHASE TRANSFER ON QUINTIC CHAOS H_{3,2}(C^d)
# ==============================================================================
class QComplex:
    __slots__ = ("re", "im")

    def __init__(self, re=0, im=0):
        self.re = Fr(re)
        self.im = Fr(im)

    def __bool__(self):
        return bool(self.re or self.im)

    def conj(self):
        return QComplex(self.re, -self.im)

    def __add__(self, o):
        return QComplex(self.re + o.re, self.im + o.im)

    def __mul__(self, o):
        return QComplex(self.re * o.re - self.im * o.im, self.re * o.im + self.im * o.re)


def cp_add(p, q):
    out = dict(p)
    for k, v in q.items():
        nv = out.get(k, QComplex()) + v
        if nv:
            out[k] = nv
        else:
            out.pop(k, None)
    return out


def cp_mul(p, q):
    if not p or not q:
        return {}
    out = {}
    for k1, v1 in p.items():
        for k2, v2 in q.items():
            ek = tuple(a + b for a, b in zip(k1, k2))
            nv = out.get(ek, QComplex()) + (v1 * v2)
            if nv:
                out[ek] = nv
            else:
                out.pop(ek, None)
    return out


def build_h32_real_poly(d, mono_terms):
    """Build Q_sc := 4*sqrt(2) * q((x + i y)/sqrt(2)) in Q(i)[x_1..x_d, y_1..y_d].
    For z_j = (x_j + i y_j)/sqrt(2) = Z_j / sqrt(2) (E|z_j|^2 = 1, E[z_j zbar_k] = delta_{jk}):
      :z_a z_b z_c zbar_u zbar_v: = z_a z_b z_c zbar_u zbar_v
        - sum_{(p in {a,b,c}, q in {u,v})} delta_{pq} (prod remaining 3 z/zbar)
        + sum_{2 disjoint (p,q) pairs} delta_{p1 q1} delta_{p2 q2} (remaining z_rem).
    Multiplying by 2^(5/2) = 4*sqrt(2) replaces z -> Z = x + i y, single contraction -1 -> -2, double +1 -> +4!
    And 4 * F_theta = 4 * sqrt(2) Re(e^{-i*theta} q) = Re(e^{-i*theta} Q_sc) in Q[x, y]!"""
    n = 2 * d
    hol_slots = (0, 1, 2)
    anti_slots = (3, 4)
    single_pairs = [(p, q) for p in hol_slots for q in anti_slots]  # 6 pairs
    double_pairs = []
    for idx1, (p1, q1) in enumerate(single_pairs):
        for p2, q2 in single_pairs[idx1 + 1:]:
            if p1 != p2 and q1 != q2:
                p_rem = [p for p in hol_slots if p not in (p1, p2)][0]
                double_pairs.append((p1, q1, p2, q2, p_rem))
    require(len(single_pairs) == 6 and len(double_pairs) == 6, "H_{3,2} Wick pair counts failed")

    def Z_plus(a):
        mx = [0] * n; mx[a] = 1
        my = [0] * n; my[d + a] = 1
        return {tuple(mx): QComplex(1, 0), tuple(my): QComplex(0, 1)}

    def Z_minus(a):
        mx = [0] * n; mx[a] = 1
        my = [0] * n; my[d + a] = 1
        return {tuple(mx): QComplex(1, 0), tuple(my): QComplex(0, -1)}

    Q_sc = {}
    for idx5, coeff in mono_terms:
        factors = [Z_plus(idx5[0]), Z_plus(idx5[1]), Z_plus(idx5[2]), Z_minus(idx5[3]), Z_minus(idx5[4])]
        w = factors[0]
        for f_ in factors[1:]:
            w = cp_mul(w, f_)
        for p_s, q_s in single_pairs:
            if idx5[p_s] == idx5[q_s]:
                rem_f = [factors[m] for m in range(5) if m not in (p_s, q_s)]
                t3 = cp_mul(cp_mul(rem_f[0], rem_f[1]), rem_f[2])
                w = cp_add(w, cp_mul({(0,) * n: QComplex(-2, 0)}, t3))
        for p1, q1, p2, q2, p_rem in double_pairs:
            if idx5[p1] == idx5[q1] and idx5[p2] == idx5[q2]:
                w = cp_add(w, cp_mul({(0,) * n: QComplex(4, 0)}, factors[p_rem]))
        Q_sc = cp_add(Q_sc, cp_mul({(0,) * n: coeff}, w))
    return Q_sc


def verify_h32_phase_transfer():
    h32_cases = [
        ("q_1_C1", 1, [((0, 0, 0, 0, 0), QComplex(1, 0))]),
        ("Mixed_H32_C2", 2, [
            ((0, 0, 0, 0, 0), QComplex(1, 1)),
            ((0, 0, 1, 0, 1), QComplex(-2, 1)),
            ((1, 1, 1, 0, 1), QComplex(1, -1)),
        ]),
    ]
    phases = [(Fr(1), Fr(0)), (Fr(3, 5), Fr(4, 5)), (Fr(5, 13), Fr(-12, 13))]
    n_checks = 0
    for label, d, terms in h32_cases:
        n = 2 * d
        Q_sc = build_h32_real_poly(d, terms)
        # |Q_sc|^2 = 32 |q|^2:
        Q_conj = {k: v.conj() for k, v in Q_sc.items()}
        abs_Q2_c = cp_mul(Q_sc, Q_conj)
        require(all(v.im == 0 for v in abs_Q2_c.values()), f"{label}: |Q|^2 not real")
        abs_q2 = {k: v.re / 32 for k, v in abs_Q2_c.items() if v.re}
        u_q = qp_expect(abs_q2)
        abs_q4 = qp_mul(abs_q2, abs_q2)
        eq4 = qp_expect(abs_q4)
        eq6 = qp_expect(qp_mul(abs_q4, abs_q2))
        chi_q = eq4 / (u_q ** 2) - 2

        for c_th, s_th in phases:
            rot = QComplex(c_th, -s_th)
            # F_theta = (1/4) Re(rot * Q_sc):
            F_th = {}
            for k, v in Q_sc.items():
                rv = (rot * v).re / 4
                if rv:
                    F_th[k] = rv
            require(qp_ou_L(F_th, n) == qp_scale(F_th, -5), f"{label}: F_theta not in V_5(R^{2 * d})")
            F2 = qp_mul(F_th, F_th)
            ef2 = qp_expect(F2)
            require(ef2 == u_q, f"{label}: E[F_theta^2] != ||q||_2^2")
            F4 = qp_mul(F2, F2)
            ef4 = qp_expect(F4)
            require(ef4 / (ef2 ** 2) - 3 == Fr(3, 2) * chi_q, f"{label}: kappa_4(F_theta) != (3/2) chi(q)")
            ef6 = qp_expect(qp_mul(F4, F2))
            require(ef6 == Fr(5, 2) * eq6, f"{label}: E[F_theta^6] != (5/2) E|q|^6")
            n_checks += 1

    # Also verify 3-pair conjugate Frobenius submultiplicativity |val_pi(A)|^2 <= ||A||_HS^12
    # on loopless directed (3, 2) bipartite matchings for a multi-coordinate complex tensor in C^2:
    d_c = 2
    A_c = {}
    for idx in itertools.product(range(d_c), repeat=5):
        h_s, a_s = sum(idx[:3]), sum(idx[3:])
        if (h_s, a_s) == (0, 0):
            A_c[idx] = QComplex(2, 1)
        elif (h_s, a_s) == (1, 1):
            A_c[idx] = QComplex(-1, 2)
        elif (h_s, a_s) == (3, 1):
            A_c[idx] = QComplex(1, -1)
        elif (h_s, a_s) == (2, 2):
            A_c[idx] = QComplex(3, 0)
        else:
            A_c[idx] = QComplex(0, 1)
    hs2_A = sum(v.re * v.re + v.im * v.im for v in A_c.values())

    # Vertices 0, 2, 4 are u_1, u_2, u_3 (A, slots 0..2 are '+', slots 3..4 are '-');
    # Vertices 1, 3, 5 are w_1, w_2, w_3 (conj(A), slots 3..4 are '+', slots 0..2 are '-').
    plus_he = [(2 * a, s) for a in range(3) for s in (0, 1, 2)] + [(2 * a + 1, s) for a in range(3) for s in (3, 4)]
    minus_he = [(2 * a, s) for a in range(3) for s in (3, 4)] + [(2 * a + 1, s) for a in range(3) for s in (0, 1, 2)]
    require(len(plus_he) == 15 and len(minus_he) == 15, "bad H_{3,2} half-edge counts")

    # Build 6 distinct loopless directed matchings via deterministic shifts & permutations:
    rng_c = random.Random(45832)
    tested_c = 0
    while tested_c < 6:
        perm_m = list(minus_he)
        rng_c.shuffle(perm_m)
        if any(p[0] == m[0] for p, m in zip(plus_he, perm_m)):
            continue
        edges = list(zip(plus_he, perm_m))
        # Contract inside each conjugate pair P_a = {2*a, 2*a+1} first, then contract external edges:
        int_edges = {0: [], 1: [], 2: []}
        ext_edges = []
        for idx_e, (p_h, m_h) in enumerate(edges):
            if p_h[0] // 2 == m_h[0] // 2:
                int_edges[p_h[0] // 2].append((idx_e, p_h, m_h))
            else:
                ext_edges.append((idx_e, p_h, m_h))
        # Check Lemma 4.3 structural invariant: internal edges in P_a touch u_a once and w_a once!
        for a in range(3):
            for _, p_h, m_h in int_edges[a]:
                require({p_h[0], m_h[0]} == {2 * a, 2 * a + 1}, "self-loop in P_a")

        # Compute K^{(a)} on external edge assignments of P_a and verify ||K^{(a)}||_F^2 <= ||A||_HS^4:
        ext_by_pair = {0: [], 1: [], 2: []}
        for idx_e, p_h, m_h in ext_edges:
            ext_by_pair[p_h[0] // 2].append((idx_e, p_h))
            ext_by_pair[m_h[0] // 2].append((idx_e, m_h))
        K_tables = {}
        for a in range(3):
            ext_list = ext_by_pair[a]
            int_list = int_edges[a]
            K_a = {}
            for ext_vals in itertools.product(range(d_c), repeat=len(ext_list)):
                slot_map = {}
                for ( _, h_), val in zip(ext_list, ext_vals):
                    slot_map[h_] = val
                acc = QComplex(0, 0)
                for int_vals in itertools.product(range(d_c), repeat=len(int_list)):
                    for (_, ph, mh), val in zip(int_list, int_vals):
                        slot_map[ph] = val
                        slot_map[mh] = val
                    u_tup = tuple(slot_map[(2 * a, s)] for s in range(5))
                    w_tup = tuple(slot_map[(2 * a + 1, s)] for s in range(5))
                    acc = acc + A_c[u_tup] * A_c[w_tup].conj()
                K_a[ext_vals] = acc
            frob2_Ka = sum(v.re * v.re + v.im * v.im for v in K_a.values())
            require(frob2_Ka <= hs2_A * hs2_A, "||K^{(a)}||_F^2 > ||A||_HS^4")
            K_tables[a] = (ext_list, K_a)

        # Contract external edges across P_0, P_1, P_2:
        val_pi = QComplex(0, 0)
        ext_ids = [idx_e for idx_e, _, _ in ext_edges]
        for glob_ext in itertools.product(range(d_c), repeat=len(ext_ids)):
            emap = dict(zip(ext_ids, glob_ext))
            prod = QComplex(1, 0)
            for a in range(3):
                ext_list, K_a = K_tables[a]
                key_a = tuple(emap[idx_e] for idx_e, _ in ext_list)
                prod = prod * K_a[key_a]
            val_pi = val_pi + prod
        require(val_pi.re * val_pi.re + val_pi.im * val_pi.im <= hs2_A ** 6, "H_{3,2} |val_pi|^2 > ||A||_HS^12")
        tested_c += 1
        n_checks += 1
    return n_checks


def main(argv=None):
    self_audit_ast()
    args = list(sys.argv[1:] if argv is None else argv)
    quiet = "--quiet" in args
    t0 = time.monotonic_ns()

    n_v3, n_cone3, n_rows3 = verify_v3_enhanced()
    n_v5, n_br5, n_cone5, n_frob5, n_rows5 = verify_v5_tower_and_frobenius()
    n_h32 = verify_h32_phase_transfer()
    dt_ms = (time.monotonic_ns() - t0) // 1_000_000

    if not quiet:
        print(f"[Part 1] Enhanced V_3(R^n): E[nu^2], E[(eta-1)^3,4], op-norm ({n_cone3} pts) & nodal ({n_rows3} rows) across {n_v3} tensors: PASS")
        print(f"[Part 2] Fifth chaos V_5(R^n): L tau_1=8(tau_2-tau_1), a_k moments, {n_br5} Br, {n_cone5} cones, {n_frob5} Frob & nodal ({n_rows5} rows): PASS")
        print(f"[Part 3] Complex quintic H_{{3,2}}(C^d): F_theta in V_5, kappa_4=(3/2)chi, E[F_theta^6]=(5/2)E|q|^6 ({n_h32} checks): PASS")
    print(f"ALL EXACT IDENTITY CHECKS PASSED  [{dt_ms} ms, zero floats, zero asserts]")


if __name__ == "__main__":
    main()
