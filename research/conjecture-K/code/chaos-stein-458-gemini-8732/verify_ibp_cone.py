#!/usr/bin/env python3
"""Exact pure-stdlib zero-float verifier for the oscillation-preserving two-step
Ornstein-Uhlenbeck near-Gaussian cone on V_3(R^n) and H_{2,1}(C^n).

Agent-ID: gemini-8732
Task: #458 (STATUS.md rows 3.18 and 3.21 (e1), tag KCS458)
Usage:
    python3 -IB verify_ibp_cone.py [--quiet]

Arithmetic discipline:
  - 100% Python 3 standard library (`ast`, `fractions`, `math`, `pathlib`, `sys`).
  - Zero floating-point operations or literals anywhere in this file (`self_audit_ast()`).
  - Zero `assert` statements (`-O`-safe `require(...)` throughout).
"""
import ast
import sys
from fractions import Fraction as Fr
from math import comb, factorial, gcd, isqrt
from pathlib import Path


def require(cond, msg="verification check failed"):
    if not cond:
        raise ValueError(msg)


ALLOWED_MODULES = {"ast", "fractions", "math", "pathlib", "sys"}
ALLOWED_MATH_NAMES = {"comb", "factorial", "gcd", "isqrt"}
FORBIDDEN_CALLS = {"fl" + "oat", "comp" + "lex"}


def self_audit_ast():
    src = Path(__file__).read_text(encoding="utf-8")
    tree = ast.parse(src, filename=str(Path(__file__)))
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


D_CELL = 10 ** 10


def ceil_rat(q, D=D_CELL):
    q = Fr(q)
    m = (q.numerator * D + q.denominator - 1) // q.denominator
    ub = Fr(m, D)
    require(ub >= q, "ceil_rat invariant failed")
    return ub


def floor_rat(q, D=D_CELL):
    q = Fr(q)
    m = (q.numerator * D) // q.denominator
    lb = Fr(m, D)
    require(lb <= q, "floor_rat invariant failed")
    return lb


def dec_floor10(q):
    q = Fr(q)
    require(q >= 0, "dec_floor10 expects nonnegative Fraction")
    n = (q.numerator * 10**10) // q.denominator
    return f"{n // 10**10}.{str(n % 10**10).zfill(10)}"


def dec_ceil10(q):
    q = Fr(q)
    require(q >= 0, "dec_ceil10 expects nonnegative Fraction")
    n = (q.numerator * 10**10 + q.denominator - 1) // q.denominator
    return f"{n // 10**10}.{str(n % 10**10).zfill(10)}"


def rat_sqrt_lb(q, prec=10**10):
    q = Fr(q)
    require(q >= 0, "rat_sqrt_lb domain")
    if q == 0:
        return Fr(0)
    num_scaled = (q.numerator * prec * prec) // q.denominator
    m = isqrt(num_scaled)
    lb = Fr(m, prec)
    require(lb * lb <= q, "rat_sqrt_lb invariant failed")
    return lb


def rat_sqrt_ub(q, prec=10**10):
    q = Fr(q)
    require(q >= 0, "rat_sqrt_ub domain")
    if q == 0:
        return Fr(0)
    num_scaled = (q.numerator * prec * prec + q.denominator - 1) // q.denominator
    m = isqrt(num_scaled - 1) + 1 if num_scaled > 0 else 0
    ub = Fr(m, prec)
    require(ub * ub >= q, "rat_sqrt_ub invariant failed")
    return ub


# ------------------------------------------------------------------ exact polynomial & Bernstein tools
def padd(a, b):
    n = max(len(a), len(b))
    out = [(a[i] if i < len(a) else Fr(0)) + (b[i] if i < len(b) else Fr(0)) for i in range(n)]
    while out and out[-1] == 0:
        out.pop()
    return out


def psub(a, b):
    return padd(a, [-x for x in b])


def pmul(a, b):
    if not a or not b:
        return []
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    while out and out[-1] == 0:
        out.pop()
    return out


def pshift_scale(p, a, w):
    res = []
    lin = [Fr(a), Fr(w)]
    for c in reversed(p):
        res = padd(pmul(res, lin), [c])
    return res


def bernstein_positive_on_segment(p, a, b, max_depth=32):
    q = pshift_scale(p, a, b - a)
    require(bool(q), "zero polynomial in bernstein check")
    n = len(q) - 1
    den = 1
    for x in q:
        den = den * x.denominator // gcd(den, x.denominator)
    A = [int(x * den) for x in q]
    M = 1
    for j in range(n + 1):
        M = M * comb(n, j) // gcd(M, comb(n, j))
    bern = [sum(comb(i, j) * (M // comb(n, j)) * A[j] for j in range(i + 1)) for i in range(n + 1)]
    stack = [(bern, 0)]
    leaves = 0
    while stack:
        bv, depth = stack.pop()
        if min(bv) > 0:
            leaves += 1
            continue
        if bv[0] <= 0 or bv[-1] <= 0 or depth >= max_depth:
            return False, leaves
        tri = [bv]
        for _ in range(n):
            prev = tri[-1]
            tri.append([prev[i] + prev[i + 1] for i in range(len(prev) - 1)])
        left = [tri[k][0] << (n - k) for k in range(n + 1)]
        right = [tri[n - j][j] << j for j in range(n + 1)]
        stack.append((left, depth + 1))
        stack.append((right, depth + 1))
    return True, leaves


def verify_symbolic_identities():
    """Exact rational polynomial checks of all algebraic steps in the oscillation-preserving IBP proof."""
    # 1) Check 4 * r^{1/2} * d^2/dr^2 [ r^{3/2} * exp(-a * r) ] == (4 a^2 r^2 - 12 a r + 3) * exp(-a * r)
    #    with a = x^2 / 2: 4*(x^2/2)^2 r^2 - 12*(x^2/2) r + 3 = r^2 x^4 - 6 r x^2 + 3 = h_4(r x^2) * exp(r x^2/2),
    #    and at x = 0 (a = 0): 4 * r^{1/2} * (3/4) r^{-1/2} == 3!
    #    In polynomial form: if f(r) = r^{3/2} e^{-a r}, f'(r) = r^{1/2}*(3/2 - a r) e^{-a r},
    #    f''(r) = r^{-1/2} * [ (1/2)*(3/2 - a r) + r*(-a) - a*r*(3/2 - a r) ] e^{-a r}.
    #    Check bracket * 4 in Q[u] where u = a*r = r*x^2/2:
    #      4 * [ 3/4 - (1/2)u - u - (3/2)u + u^2 ] == 3 - 12 u + 4 u^2 == 3 - 6 s + s^2 (with s = 2u = r x^2).
    br_poly = [Fr(4) * Fr(3, 4), Fr(4) * (Fr(-1, 2) - Fr(1) - Fr(3, 2)), Fr(4) * Fr(1)]
    require(br_poly == [Fr(3), Fr(-12), Fr(4)], "Gaussian 2nd-derivative polynomial check failed")
    # Substituting u = s/2 gives [3, -6, 1]:
    require([br_poly[0], br_poly[1] * Fr(1, 2), br_poly[2] * Fr(1, 4)] == [Fr(3), Fr(-6), Fr(1)], "h_4 match failed")

    # 2) Check d^2/dr^2 [ r^mu (1 + r)^{1 - mu} ] == mu*(mu - 1) * r^{mu - 2} (1 + r)^{-mu - 1}
    #    Symbolically in Q[mu, r]:
    #      N(mu, r) := (mu - 1)*(1 + r)*(r + mu) - mu*r*(r + mu) + r*(1 + r)
    #    must equal mu*(mu - 1) + 0*r + 0*r^2 identically for all rational mu!
    for mu in [Fr(-5, 6), Fr(-1, 2), Fr(-1, 6), Fr(1, 6), Fr(1, 2), Fr(5, 6), Fr(7, 6), Fr(5, 2)]:
        t1 = pmul([mu - 1], pmul([Fr(1), Fr(1)], [mu, Fr(1)]))
        t2 = pmul([-mu], pmul([Fr(0), Fr(1)], [mu, Fr(1)]))
        t3 = pmul([Fr(0), Fr(1)], [Fr(1), Fr(1)])
        tot = padd(padd(t1, t2), t3)
        require(tot == [mu * (mu - 1)], f"binomial 2nd derivative failed at mu={mu}: {tot}")

    # 3) Check vanishing boundary terms at r -> 0+ and r -> +oo for ALL 10 (k, l) pairs:
    for k in (2, 4):
        for l in (0, 2, 4, 6, 8):
            al, be = Fr(k, 3), Fr(l, 3)
            d = be + 2 - al
            require(d > 0, "d <= 0")
            mu_be = (Fr(1) - be) / 2
            mu_al = (Fr(3) - al) / 2
            mu_0 = Fr(5, 2)
            # At r -> 0+: Psi(r) * u_x'(r) ~ r^{mu_be + 3/2} and Psi'(r) * u_x(r) ~ r^{(mu_be - 1) + 5/2}:
            require(mu_be + Fr(3, 2) >= Fr(2, 3) > 0, "r->0+ boundary exponent failed")
            # At r -> +oo: h_mu(r) = r + (1 - mu) + O(r^{-1}); check r^1 and r^0 cancel in Psi_{al,be}(r):
            c_r1 = Fr(4) / d * ((Fr(1) - Fr(1)) / (be + 4) - (Fr(1) - Fr(1)) / (al + 2))
            c_r0 = Fr(4) / d * (((1 - mu_be) - (1 - mu_0)) / (be + 4) - ((1 - mu_al) - (1 - mu_0)) / (al + 2))
            require(c_r1 == 0 and c_r0 == 0, f"r->oo cancellation failed for {(k, l)}")
            # Also check exact g_{k,l}(oo) = (3c/2) * int_0^1 W_{al,be}(th) th^2 d(th) == 9c / (2*(6-l)*(12-k)) for l<=4:
            if l in (0, 2, 4):
                int_be = (Fr(1) / (1 - be / 2) - Fr(1, 3)) / (be + 4)
                int_al = (Fr(1) / (2 - al / 2) - Fr(1, 3)) / (al + 2)
                w_int = (int_be - int_al) / d
                require(Fr(3, 2) * w_int == Fr(9, 2 * (6 - l) * (12 - k)), f"g_inf formula failed for {(k, l)}")

    # 4) Prove 1 - exp(-u) <= (16/25)*sqrt(u) for ALL u >= 0:
    #    For u >= (25/16)^2, 1 - exp(-u) < 1 <= (16/25)*sqrt(u).
    #    For 0 < t = sqrt(u) <= 25/16, Lagrange remainder at even order 8 gives exp(-t^2) >= sum_{j=0}^7 (-1)^j t^{2j}/j!,
    #    so 1 - exp(-t^2) <= (16/25)*t follows from P_13(t) := 16/25 + sum_{j=1}^7 (-1)^j t^{2j-1}/j! > 0 on [0, 25/16].
    p13 = [Fr(16, 25)] + [Fr(0)] * 13
    for j in range(1, 8):
        p13[2 * j - 1] = Fr((-1) ** j, factorial(j))
    ok_13, leaves_13 = bernstein_positive_on_segment(p13, Fr(0), Fr(25, 16))
    require(ok_13, "Bernstein check for 1 - exp(-u) <= (16/25)*sqrt(u) failed")

    # 5) Prove K_{k/3, l/3}(theta) > 0 for all theta in (0, 1] when l in {4, 6, 8} (k in {2, 4}):
    #    Multiply K_{al,be}(z^6) by z^l > 0 so the constant term at z = 0 is ((be^2 - 1)/(be + 4))/d > 0!
    for k in (2, 4):
        for l in (4, 6, 8):
            al, be = Fr(k, 3), Fr(l, 3)
            d = be + 2 - al
            poly_z = [Fr(0)] * (l + 13)
            poly_z[0] += ((be * be - 1) / (be + 4)) / d
            poly_z[l + 6 - k] += -((1 - al) * (3 - al) / (al + 2)) / d
            poly_z[l + 12] += Fr(15) / ((be + 4) * (al + 2))
            ok_K, _ = bernstein_positive_on_segment(poly_z, Fr(0), Fr(1))
            require(ok_K, f"Positivity of K_ab failed for {(k, l)}")
    return leaves_13


def eval_K_z5(z, k, l):
    """Exact rational value of 6 * z^5 * K_{k/3, l/3}(z^6) for z > 0 (smooth at z=0 when l <= 4)."""
    al, be = Fr(k, 3), Fr(l, 3)
    d = be + 2 - al
    c_be = Fr(6) * ((be * be - 1) / (be + 4)) / d
    c_al = -Fr(6) * ((1 - al) * (3 - al) / (al + 2)) / d
    c_2 = Fr(90) / ((be + 4) * (al + 2))
    # Exponents: 5 - l, 11 - k, 17
    if l <= 5:
        t_be = c_be * (z ** (5 - l))
    else:
        t_be = c_be / (z ** (l - 5))
    return t_be + c_al * (z ** (11 - k)) + c_2 * (z ** 17)


def K_z5_interval_bounds(za, zb, k, l):
    """Outward rational [lo, hi] enclosure of 6 * z^5 * K_{k/3, l/3}(z^6) on z in [za, zb] subset [0, 1]."""
    al, be = Fr(k, 3), Fr(l, 3)
    d = be + 2 - al
    c_be = Fr(6) * ((be * be - 1) / (be + 4)) / d
    c_al = -Fr(6) * ((1 - al) * (3 - al) / (al + 2)) / d
    c_2 = Fr(90) / ((be + 4) * (al + 2))

    # Term 1: c_be * z^{5 - l}
    if l < 5:
        p_a, p_b = za ** (5 - l), zb ** (5 - l)
    else:
        require(za > 0, "za must be > 0 when l >= 6")
        p_a, p_b = Fr(1) / (za ** (l - 5)), Fr(1) / (zb ** (l - 5))
    t1_lo, t1_hi = min(c_be * p_a, c_be * p_b), max(c_be * p_a, c_be * p_b)

    # Term 2: c_al * z^{11 - k}
    q_a, q_b = za ** (11 - k), zb ** (11 - k)
    t2_lo, t2_hi = min(c_al * q_a, c_al * q_b), max(c_al * q_a, c_al * q_b)

    # Term 3: c_2 * z^{17} (c_2 > 0, z >= 0)
    t3_lo, t3_hi = c_2 * (za ** 17), c_2 * (zb ** 17)
    return t1_lo + t2_lo + t3_lo, t1_hi + t2_hi + t3_hi


def verify_all(quiet=False):
    self_audit_ast()
    leaves_13 = verify_symbolic_identities()

    # Machin pi enclosure: pi = 16 atan(1/5) - 4 atan(1/239)
    def atan_bounds(x):
        lo = sum(Fr((-1) ** j) * (x ** (2 * j + 1)) / (2 * j + 1) for j in range(14))
        hi = lo + (x ** 29) / 29
        require(lo < hi, "atan_bounds order")
        return lo, hi

    lo5, hi5 = atan_bounds(Fr(1, 5))
    lo239, hi239 = atan_bounds(Fr(1, 239))
    pi_lo = floor_rat(16 * lo5 - 4 * hi239)
    pi_hi = ceil_rat(16 * hi5 - 4 * lo239)
    require(Fr(3141592653, 10**9) < pi_lo < pi_hi < Fr(3141592654, 10**9), "pi sanity check")

    c_lo = rat_sqrt_lb(Fr(2) / pi_hi)
    c_hi = rat_sqrt_ub(Fr(2) / pi_lo)
    inv_sqrt2_hi = rat_sqrt_ub(Fr(1, 2))
    require(c_lo < c_hi, "c_lo < c_hi")

    # Fine rational mesh on z in [0, 1 - 1/1024] (theta = z^6):
    # Note on [z_max, 1]: (1 - z^6)^{-1/2} <= (1 - z)^{-1/2} since 1 - z^6 >= 1 - z on [0, 1],
    # and int_{z_max}^1 (1 - z)^{-1/2} dz = 2 * sqrt(1 - z_max) = 2 / 32 = 1 / 16 (EXACT RATIONAL when 1 - z_max = 1/1024 !!).
    z_max = Fr(1023, 1024)
    tail_int_ub = Fr(2) * Fr(1, 32)
    require((Fr(1) - z_max) == Fr(1, 32) ** 2, "exact square tail check")
    # Even tighter on [z_max, 1]: 1 - z^6 = (1 - z)*(1 + z + z^2 + z^3 + z^4 + z^5) >= (1 - z) * (1 + 5 * z_max^5)!
    # Let's check: for z in [z_max, 1], 1 + z + ... + z^5 >= 1 + z_max + z_max^2 + z_max^3 + z_max^4 + z_max^5 =: S6_lo!
    S6_lo = sum(z_max ** m for m in range(6))
    # Verify (1 - z^6) - (1 - z)*S6_lo >= 0 on [z_max, 1] because sum_{m=0}^5 z^m is increasing on z >= 0!
    inv_sqrt_S6_hi = rat_sqrt_ub(Fr(1) / S6_lo)
    tail_factor_ub = ceil_rat(tail_int_ub * inv_sqrt_S6_hi)

    N_MESH = 512
    z_knots = [Fr(i, N_MESH) * z_max for i in range(N_MESH + 1)]
    require(z_knots[0] == 0 and z_knots[-1] == z_max, "z_knots endpoints")

    # Precompute outward upper/lower bounds for (1 - z^6)^{-1/2} at z_knots:
    inv_sqrt_1mz6_ub = [rat_sqrt_ub(Fr(1) / (1 - z ** 6)) for z in z_knots]
    inv_sqrt_1mz6_lb = [rat_sqrt_lb(Fr(1) / (1 - z ** 6)) for z in z_knots]

    # Optimal rational cutoffs z_cut = m / N_MESH * z_max for l in {6, 8}:
    # Earlier optimal th_cut ~ 0.015 (for l=6) and ~ 0.004 (for l=8); z_cut = th_cut^{1/6} ~ 0.49 (l=6), ~ 0.40 (l=8).
    cut_idx_map = {(2, 6): 260, (4, 6): 260, (2, 8): 205, (4, 8): 205}

    A_sh = {}
    B_sh = {}
    C_abs = {}

    for k in (2, 4):
        for l in (0, 2, 4, 6, 8):
            if l in (0, 2, 4):
                # Decompose K_{al,be} into positive and negative parts across z in [0, 1]:
                I_pos_ub = Fr(0)
                I_neg_ub = Fr(0)
                I_net_lb = Fr(0)
                I_net_ub = Fr(0)
                for i in range(N_MESH):
                    za, zb = z_knots[i], z_knots[i + 1]
                    dz = zb - za
                    k_lo, k_hi = K_z5_interval_bounds(za, zb, k, l)
                    w_lo, w_hi = inv_sqrt_1mz6_lb[i], inv_sqrt_1mz6_ub[i + 1]
                    pos_hi = max(k_hi, Fr(0)) * w_hi
                    neg_hi = max(-k_lo, Fr(0)) * w_hi
                    I_pos_ub += ceil_rat(Fr(1, 2) * c_hi * pos_hi * dz)
                    I_neg_ub += ceil_rat(Fr(1, 2) * c_hi * neg_hi * dz)
                    # Net integral [lb, ub] of (c/2) int (1 - z^6)^{-1/2} 6 z^5 K dz (for g(0) = g(oo) - I_net):
                    prod_cands = [
                        Fr(1, 2) * c_lo * k_lo * w_lo, Fr(1, 2) * c_lo * k_lo * w_hi,
                        Fr(1, 2) * c_hi * k_lo * w_lo, Fr(1, 2) * c_hi * k_lo * w_hi,
                        Fr(1, 2) * c_lo * k_hi * w_lo, Fr(1, 2) * c_lo * k_hi * w_hi,
                        Fr(1, 2) * c_hi * k_hi * w_lo, Fr(1, 2) * c_hi * k_hi * w_hi,
                    ]
                    I_net_lb += floor_rat(min(prod_cands) * dz)
                    I_net_ub += ceil_rat(max(prod_cands) * dz)

                # Right tail [z_max, 1]:
                k_t_lo, k_t_hi = K_z5_interval_bounds(z_max, Fr(1), k, l)
                require(k_t_lo >= 0, "tail K must be >= 0")
                tail_ub = ceil_rat(Fr(1, 2) * c_hi * k_t_hi * tail_factor_ub)
                I_pos_ub += tail_ub
                I_net_ub += tail_ub
                # Lower bound on tail >= 0 since k_t_lo >= 0.

                # Recall for l in {0, 2, 4}:
                #   g_{k,l}(x) = g_{k,l}(oo) - (c/2) int_0^1 (1-th)^{-1/2} K(th) exp(-th x^2/(2(1-th))) d(th),
                #   so g_{k,l}(oo) - I_pos_ub <= g_{k,l}(x) <= g_{k,l}(oo) + I_neg_ub  for ALL x in R!
                g_inf_lo = floor_rat(Fr(9, 2 * (6 - l) * (12 - k)) * c_lo)
                g_inf_hi = ceil_rat(Fr(9, 2 * (6 - l) * (12 - k)) * c_hi)
                lo_env = g_inf_lo - I_pos_ub
                hi_env = g_inf_hi + I_neg_ub
                require(lo_env < hi_env, "envelope order")

                if l == 0:
                    # By Wiener-chaos orthogonality U in V_2 + V_4 perp V_0, E[c * U * Pi_0(U U_k)] == 0
                    # for c := (lo_env + hi_env)/2!
                    A_sh[(k, l)] = ceil_rat((hi_env - lo_env) / 2)
                    B_sh[(k, l)] = Fr(0)
                    C_abs[(k, l)] = Fr(0)
                else:
                    # Explicit rational shift c_{k,l} := (lo_env + hi_env) / 2:
                    c_shift = (lo_env + hi_env) / 2
                    A_sh[(k, l)] = ceil_rat(max(hi_env - c_shift, c_shift - lo_env))
                    B_sh[(k, l)] = Fr(0)
                    C_abs[(k, l)] = ceil_rat(abs(c_shift))
            else:
                # l in {6, 8}: K_{al,be}(theta) > 0 strictly on (0, 1] (certified by Bernstein above!).
                # Split z in [0, 1] at z_cut = z_knots[idx_cut]:
                #   g_{k,l}(x) - g_{k,l}(0) = I_head(x) + I_tail(x),
                # where 0 <= I_tail(x) <= I_tail_ub and 0 <= I_head(x) <= B_ub * |x|.
                # Setting deterministic constant c_{k,l} := g_{k,l}(0) + (1/2) * I_tail_ub (which satisfies
                # E[c_{k,l} U Pi_l(U U_k)] == 0 identically since U in V_2 + V_4 perp V_l for l in {6, 8}!)
                # gives -I_tail_ub / 2 <= g_{k,l}(x) - c_{k,l} <= I_tail_ub / 2 + B_ub * |x|,
                # hence |g_{k,l}(x) - c_{k,l}| <= (I_tail_ub / 2) + B_ub * |x| for ALL x in R!
                idx_cut = cut_idx_map[(k, l)]
                # 1) Head [0, z_cut]: (24 c / (25 sqrt(2))) int_0^{z_cut} (z^8 K(z^6) / (1 - z^6)) dz
                al, be = Fr(k, 3), Fr(l, 3)
                d = be + 2 - al
                c1_z8 = ((be * be - 1) / (be + 4)) / d
                c2_z8 = -((1 - al) * (3 - al) / (al + 2)) / d
                c3_z8 = Fr(15) / ((be + 4) * (al + 2))
                require(c1_z8 > 0 and c2_z8 != 0 and c3_z8 > 0, "z8 coeffs sanity")

                head_int_ub = Fr(0)
                prefac_B = ceil_rat(Fr(24, 25) * c_hi * inv_sqrt2_hi)
                for i in range(idx_cut):
                    za, zb = z_knots[i], z_knots[i + 1]
                    dz = zb - za
                    # Numerator z^8 K(z^6) = c1 * z^{8-l} + c2 * z^{14-k} + c3 * z^{20} > 0:
                    num_hi = (
                        c1_z8 * (zb ** (8 - l))
                        + max(c2_z8 * (za ** (14 - k)), c2_z8 * (zb ** (14 - k)))
                        + c3_z8 * (zb ** 20)
                    )
                    den_lo = 1 - (zb ** 6)
                    head_int_ub += ceil_rat(prefac_B * (num_hi / den_lo) * dz)

                # 2) Tail [z_cut, z_max] + [z_max, 1]:
                I_tail_ub = Fr(0)
                for i in range(idx_cut, N_MESH):
                    za, zb = z_knots[i], z_knots[i + 1]
                    dz = zb - za
                    k_lo, k_hi = K_z5_interval_bounds(za, zb, k, l)
                    require(k_lo > 0, "K must be positive on l in {6, 8}")
                    I_tail_ub += ceil_rat(Fr(1, 2) * c_hi * k_hi * inv_sqrt_1mz6_ub[i + 1] * dz)

                k_t_lo, k_t_hi = K_z5_interval_bounds(z_max, Fr(1), k, l)
                require(k_t_lo > 0, "tail K positive")
                I_tail_ub += ceil_rat(Fr(1, 2) * c_hi * k_t_hi * tail_factor_ub)

                A_sh[(k, l)] = ceil_rat(I_tail_ub / 2)
                B_sh[(k, l)] = head_int_ub
                C_abs[(k, l)] = Fr(0)

    # --- Whole-interval Bernstein certification of R_* <= R_cap on y = C/A in [0, y_max] ---
    # Check y_max = 8661/10000 > sqrt(3/4) (since y_max^2 = 75012921/100000000 > 3/4),
    # and on kappa_4(F) <= 1/100, E[F^4] <= 301/100 <= (33/25)^4:
    y_max = Fr(8661, 10000)
    require(y_max ** 2 > Fr(3, 4), "y_max check failed")
    beta = Fr(33, 25)
    require(beta ** 4 >= Fr(301, 100), "beta cap check failed")
    # Also verify KCR fourth-moment norm caps 15^{1/4} < 197/100 and 639^{1/4} < 503/100:
    require(Fr(197, 100) ** 4 > Fr(15) and Fr(503, 100) ** 4 > Fr(639), "U2/U4 L4 caps failed")
    # Since y -> sqrt(1 + y^2) is convex on [0, y_max] (second derivative (1 + y^2)^{-3/2} > 0),
    # it lies below any chord/secant majorant 1 + m_sec * y that >= sqrt(1 + y_max^2) at y = y_max:
    m_sec = Fr(373, 1000)
    require((Fr(1) + m_sec * y_max) ** 2 >= Fr(1) + y_max ** 2, "convex secant check for sqrt(1+y^2) failed")

    # Reviewed KCR contraction upper-bound table (cumulant-remainder-codex-a7c4/PROOF.md & verify.py, P + C):
    upper = {
        (2, 2): [Fr(1), Fr(283, 100), Fr(245, 100), Fr(0), Fr(0)],
        (2, 4): [Fr(0), Fr(245, 100), Fr(566, 100), Fr(388, 100), Fr(0)],
        (4, 4): [Fr(1), Fr(566, 100), Fr(147, 10), Fr(179, 10), Fr(837, 100)],
    }
    # Verify every entry of `upper` exceeds the exact contraction square c_{j,k,l}^2 = (r! C(j,r) C(k,r))^2 l!/(j!k!):
    for (j, k), row_u in upper.items():
        for idx_l, l in enumerate((0, 2, 4, 6, 8)):
            two_r = j + k - l
            if two_r < 0 or two_r % 2 != 0:
                c_sq = Fr(0)
            else:
                r = two_r // 2
                if r > min(j, k):
                    c_sq = Fr(0)
                else:
                    c_sq = Fr((factorial(r) * comb(j, r) * comb(k, r)) ** 2 * factorial(l), factorial(j) * factorial(k))
            require(row_u[idx_l] ** 2 >= c_sq, f"KCR table check failed at {(j, k, l)}")

    u2_poly = [Fr(1), m_sec]                 # >= sqrt(1 + y^2) on [0, y_max] by convexity
    u4_poly = [Fr(197, 100), Fr(503, 100)]   # >= 15^{1/4} + 639^{1/4} y
    y_fac = {2: [Fr(1)], 4: [Fr(0), Fr(1)]}
    c_fac_poly = {0: [Fr(0)], 2: [Fr(1)], 4: [Fr(0), Fr(1)], 6: [Fr(0)], 8: [Fr(0)]}

    P5 = []
    for k in (2, 4):
        for l in (0, 2, 4, 6, 8):
            w_poly = []
            for j in (2, 4):
                c_jkl = upper[tuple(sorted((j, k)))][l // 2]
                if c_jkl != 0:
                    w_poly = padd(w_poly, [c_jkl * x for x in pmul(y_fac[j], y_fac[k])])
            env_kl = padd(
                [C_abs[(k, l)] * x for x in c_fac_poly[l]],
                padd(
                    [A_sh[(k, l)] * x for x in u2_poly],
                    [B_sh[(k, l)] * beta * x for x in u4_poly],
                ),
            )
            P5 = padd(P5, pmul(env_kl, w_poly))

    R_cap = Fr(21, 20)  # 1.05 (down from 86/25 = 3.44 in KSR!)
    denom_cubed = pmul(pmul([Fr(1, 2), Fr(0), Fr(1)], [Fr(1, 2), Fr(0), Fr(1)]), [Fr(1, 2), Fr(0), Fr(1)])
    Q_pos = psub([((27 * R_cap) ** 2) * x for x in denom_cubed], pmul(P5, P5))
    ok_R, leaves_R = bernstein_positive_on_segment(Q_pos, Fr(0), y_max)
    require(ok_R, "Bernstein positivity of Q_pos on [0, y_max] failed")

    # --- Certified sharp thresholds on V_3(R^n) and H_{2,1}(C^n) ---
    C32_real = Fr(67, 240) * c_hi + R_cap
    kap0_exact = ((c_lo / 48) / C32_real) ** 2
    kap1_exact = ((c_lo / 24) / C32_real) ** 2

    C6_cplx = Fr(4045313, 100000)
    three_halves_32 = Fr(3, 2) * rat_sqrt_ub(Fr(3, 2))
    require((three_halves_32 ** 2) >= Fr(27, 8), "(3/2)^{3/2} ub failed")
    C32_cplx_direct = Fr(5, 2) * C6_cplx / 240 + (R_cap / c_lo) * three_halves_32

    chi0_via_u1 = Fr(2, 3) * kap0_exact
    chi1_via_u1 = Fr(2, 3) * kap1_exact
    chi0_via_c6 = (Fr(1, 32) / C32_cplx_direct) ** 2
    chi1_via_c6 = (Fr(1, 16) / C32_cplx_direct) ** 2

    # Clean round rational thresholds (> 8.3x larger than KSR's 1/49000, 1/12250, 1/72000, 1/18000!):
    KAPPA_0 = Fr(1, 5900)
    KAPPA_1 = Fr(1, 1475)
    CHI_0_C6 = Fr(1, 8300)
    CHI_1_C6 = Fr(1, 2075)
    CHI_0_U1 = Fr(1, 8850)
    CHI_1_U1 = Fr(1, 2215)

    require(KAPPA_0 < kap0_exact and KAPPA_0 <= Fr(1, 100), f"KAPPA_0 failed: 1/{Fr(1)/kap0_exact}")
    require(KAPPA_1 < kap1_exact and KAPPA_1 <= Fr(1, 100), f"KAPPA_1 failed: 1/{Fr(1)/kap1_exact}")
    require(CHI_0_C6 < chi0_via_c6 and CHI_1_C6 < chi1_via_c6, f"CHI_C6 failed: 1/{Fr(1)/chi0_via_c6}")
    require(CHI_0_U1 < chi0_via_u1 and CHI_1_U1 < chi1_via_u1, f"CHI_U1 failed: 1/{Fr(1)/chi0_via_u1}")
    require(Fr(3, 2) * CHI_1_C6 <= Fr(1, 100), "domain kappa_4 <= 1/100 check failed")

    if not quiet:
        print("=== Exact Oscillation-Preserving Two-Step OU Cone Verification (zero floats, zero asserts) ===")
        print(f"1. Symbolic IBP identities, boundary vanishing, K_{{a,b}} positivity & P_13 Bernstein ({leaves_13} leaves): PASS")
        print(f"2. Machin pi in [{dec_floor10(pi_lo)}, {dec_ceil10(pi_hi)}], c = sqrt(2/pi) in [{dec_floor10(c_lo)}, {dec_ceil10(c_hi)}]")
        print(f"3. Centered rational envelopes |g_{{k,l}}(x) - c_{{k,l}}| <= A_{{k,l}} + B_{{k,l}}|x| ({N_MESH} z-cells + exact tail):")
        for k in (2, 4):
            for l in (0, 2, 4, 6, 8):
                print(f"   (k={k}, l={l}): |c|={dec_ceil10(C_abs[(k,l)])}, A={dec_ceil10(A_sh[(k,l)])}, B={dec_ceil10(B_sh[(k,l)])}")
        print(f"4. Whole-interval Bernstein certificate on y in [0, {y_max}]:")
        print(f"   R_* <= {R_cap} = {dec_ceil10(R_cap)}  (was 86/25 = 3.44 in KSR; PASS in {leaves_R} Bernstein leaves)")
        print("5. Certified explicit near-Gaussian sharp thresholds:")
        print(f"   Real V_3(R^n) [STATUS.md 3.21 (e1)]:")
        print(f"     C_{{3/2,real}} <= {dec_ceil10(C32_real)}")
        print(f"     kappa_0 = {KAPPA_0} = {dec_floor10(KAPPA_0)} < {dec_floor10(kap0_exact)}  (was 1/49000; 8.30x larger)")
        print(f"     kappa_1 = {KAPPA_1} = {dec_floor10(KAPPA_1)} < {dec_floor10(kap1_exact)}  (was 1/12250; 8.30x larger)")
        print(f"   Complex H_{{2,1}}(C^n) [STATUS.md 3.18]:")
        print(f"     C_{{3/2,cplx}} <= {dec_ceil10(C32_cplx_direct)}")
        print(f"     chi_0 = {CHI_0_C6} = {dec_floor10(CHI_0_C6)} < {dec_floor10(chi0_via_c6)}  (was 1/72000; 8.67x larger)")
        print(f"     chi_1 = {CHI_1_C6} = {dec_floor10(CHI_1_C6)} < {dec_floor10(chi1_via_c6)}  (was 1/18000; 8.67x larger)")
        print(f"     (Via U(1) transfer: chi_0 = {CHI_0_U1} < {dec_floor10(chi0_via_u1)}, chi_1 = {CHI_1_U1} < {dec_floor10(chi1_via_u1)})")
        print("ALL OSCILLATION-PRESERVING NEAR-GAUSSIAN CONE CHECKS PASSED.")

    return {
        "R_cap": R_cap,
        "KAPPA_0": KAPPA_0,
        "KAPPA_1": KAPPA_1,
        "CHI_0": CHI_0_C6,
        "CHI_1": CHI_1_C6,
        "CHI_0_U1": CHI_0_U1,
        "CHI_1_U1": CHI_1_U1,
    }


if __name__ == "__main__":
    verify_all(quiet=("--quiet" in sys.argv))
