#!/usr/bin/env python3
"""Zero-float, zero-assert exact rational verifier for Uncapped & Off-Peak Six-Sector Closure (#826).

Agent-ID: gemini-c1de. Closes #826, Refs #436, #177.
Python 3 standard library only (`python3 -IB` and `python3 -IB -O` execute identical checks).
Zero floating-point literals, types, or operations; zero `assert` statements.

Verifies:
  1. Source & input integrity: SHA-256 and compile-time `#ifdef NDEBUG` guard of
     `certify_uncapped_offpeak.cpp`, plus SHA-256 and exact parameter matching against
     `profile-caps.json` (STATUS 3.3) and `central_94_125_certificate.json` (STATUS 8.13(ii)).
  2. Exact zero-float symbolic & Bernstein proofs:
     - Anisotropic 2-sign potential psi(r, q) = q^2 / (mu*(mu + r)^2) identities (-psi' > 0, psi'' > 0).
     - Lemma L1 (||mu^2 D_X A(X, q)[h]||_op <= 1) and Lemma L2 (mu^3 D_X^2 A(X, q)[h, h] <= 2 I_2)
       by exact 2D Bernstein coefficients over Q.
     - Smooth-Split H_{5,delta} Lemmas S1 & S2: 0 < chi_{5,delta}(r) <= (15/8)(delta/r)^4 and
       lambda_max(D_y^2(u^T H_{5,delta}(y) u)) <= 2 phi_delta(|y|^2) by Bernstein-Mobius certificates.
     - KJSEC Theorem 2(a) rational even majorant on the entire disk x^2 + y^2 <= eta^2 for all eta in [0, 1].
  3. Target-by-target zero-float analytic exteriors & tail bounds across all 3 certified targets
     (`peak`: s_A = 1/2, c_iso = 6/25; `row7` [831/1000, 21/25]: c_iso = 23/100;
      `row6` [411/500, 831/1000]: c_iso = 11/50):
     - Exact orthogonal diagonalization of Q_0^(i) > (7/10) I_2 and retained trial cancellation
       B_P^(0)(A, B) + (1/4)|R|^2 - p_i S_r == -c_iso,i * (1 + rho_i^2) * S_r.
     - Odd quadratic budget B_odd^(i) > (3/4) I_6 with global U(1)-invariant shift c* = alpha_nu,i * nu
       and zero-mean C_inv(Q, nu) = 2*(k_comp,i - p_i*alpha_nu,i)*Re(Q conj(nu)).
     - Amplitude exterior ||v||_2 >= 7 (S_r >= 49) via Parseval on {1, T - 1, z_1^2/sqrt(2)} and q = 9/4.
     - Shift exterior w >= 12 via |L| = 6 split (H_i(8) < 36) and symmetric decreasing rearrangement:
       even < (23/48) S_r < (7/10) S_r < B_P^(0)(v) and odd < (5/12) I_6 < (3/4) I_6 < B_odd^(i).
     - Exact r >= 25 (w <= 3) and r >= 34 (w <= 12) tails and T >= 25 base curvature tails.
  4. Exact rational audit of `cert_peak.json`, `cert_row7.json`, `cert_row6.json`:
     - Binary64 outward-rounding regression controls (`t2_ring24`, `t0_sector2`).
     - Part 1 (144 slabs on [3, 12]): contiguity, Q_0 - P_re > 0, Q_0 - P_im > 0, B_3 - O_iso > 0,
       and independent w = 3 Jensen diagonal control.
     - Part 2 (252 slabs on [0, 3]): contiguity, Q_0 - E_re > 0, Q_0 - E_im > 0, B_3 - M_re > 0,
       B_3 - M_im > 0, and independent w = 0 Jensen diagonal control.
     - Part 3 (80 slabs on [0, 3]): contiguity, inner s_odd handoff to Part 2, open_boxes == 0,
       worst_margin < 0, min_odd_piv > 0, and exact Box5 leaf-count conservation.
  5. Centered alignment 7.1.6 (k_B^(i)(0)/k_A^(i)(0) > rho_i) across all 3 targets and
     energy-cap-free Peak six-sector corollaries:
     - Phase-symmetric / zero-content cubics: Lambda_hat(G) <= Lambda(q) - (6/25)(1 + rho_0^2) V
       for ALL (u, V, W) in [0, inf)^3.
     - Low remote energy 0 <= u <= 23/1000 = 0.023, ALL (V, W) in [0, inf)^2: Lambda_hat(G) < S
       (and 0 <= u <= 11/500 = 0.022 on V >= 0.080051 - u from 3.3 alone without moment boxes).
     - Full Peak response band 0 <= u <= 463/10000 = 0.0463: Lambda_hat(G) < S strictly for ALL
       V >= 57/1000 = 0.057, W >= 0 (using 11.61 on [2/125, 0.0463] with zero exempt boxes),
       and for ALL V >= 181/2500 = 0.0724, W >= 0 from 3.3 + 11.30 alone without 11.61.
     - High remote energy u >= 503/1000 = 0.503, ALL (V, W) in [0, inf)^2: Lambda_hat(G) < S
       strictly via `profile-caps.json` (3.3) + Jensen concavity of 2 E|L + sqrt(v)| (2.7).
  6. Lower-central obstructions on `8.13(ii)` (`eps = 94/125, p = 125/94`):
     - Rows 1 & 2 (`[1503/2000, 157/200]`): 220-bit zero-float proof that zero-core odd cost
       J_1(a_i, b_i) > 125/94 (1.40039 > 1.32979 and 1.35916 > 1.32979), obstructing F_joint(c*) <= 0
       at (q, A, B) = (0, 0, 0) for every c* and every zero-mean C(Q, nu).
     - Rows 3 & 4 (`[157/200, 203/250]`): exact rational audit of `cert_obstructions.json` proving
       <u, O_{sec,im}^(i)(29/64) u> > 125/94 along u = (4/5, 3/5, 0) (1.39292 > 1.32979 and
       1.35790 > 1.32979), obstructing single-pivot Smooth-Split H_{5,delta} for all (alpha_nu, k_comp).
"""

import argparse
from fractions import Fraction as F
import hashlib
import json
from math import comb, factorial, isqrt
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile

sys.dont_write_bytecode = True


class VerificationError(RuntimeError):
    """Raised whenever any exact rational, symbolic, or certificate check fails."""


def check(cond: bool, msg: str) -> None:
    if not cond:
        raise VerificationError(msg)


def fmt_dec(q: F, digits: int = 8) -> str:
    q = F(q)
    sign = "-" if q < 0 else ""
    aq = -q if q < 0 else q
    unit = 10**digits
    scaled = (aq.numerator * unit) // aq.denominator
    return f"{sign}{scaled // unit}.{str(scaled % unit).zfill(digits)}"


def parse_hex(s: str) -> F:
    """Pure integer parser for IEEE-754 hexfloats and exact rational strings (zero float)."""
    check(isinstance(s, str), f"parse_hex expects str, got {type(s)!r}")
    t = s.strip()
    check(len(t) > 0, "empty numeric string")
    sign = -1 if t.startswith("-") else 1
    if t[0] in "+-":
        t = t[1:]
    if t.startswith(("0x", "0X")):
        body = t[2:]
        check("p" in body or "P" in body, f"hexfloat missing exponent: {s!r}")
        mant_str, exp_str = body.lower().split("p", 1)
        exp = int(exp_str, 10)
        if "." in mant_str:
            ip, fp = mant_str.split(".", 1)
        else:
            ip, fp = mant_str, ""
        digits_hex = ip + fp
        check(len(digits_hex) > 0, f"empty hex mantissa: {s!r}")
        mant = int(digits_hex, 16)
        if mant == 0:
            return F(0)
        shift = exp - 4 * len(fp)
        val = F(mant << shift, 1) if shift >= 0 else F(mant, 1 << (-shift))
        return -val if sign < 0 else val
    check("." not in t and "e" not in t.lower(), f"decimal float string forbidden: {s!r}")
    val = F(t)
    return -val if sign < 0 else val


def parse_iv(pair) -> tuple[F, F]:
    check(isinstance(pair, list) and len(pair) == 2, f"expected 2-element interval list, got {pair!r}")
    lo, hi = parse_hex(pair[0]), parse_hex(pair[1])
    check(lo <= hi, f"inverted interval [{fmt_dec(lo)}, {fmt_dec(hi)}]")
    return lo, hi


# ============================================================================
# 1. 220-Bit Outward-Rounded Dyadic Rational Interval Arithmetic (Zero Float)
# ============================================================================
BITS = 220
SCALE = 1 << BITS


class Iv:
    __slots__ = ("lo", "hi")

    def __init__(self, lo, hi=None):
        lo_q = F(lo)
        hi_q = F(lo_q if hi is None else hi)
        check(lo_q <= hi_q, f"Inverted Iv [{fmt_dec(lo_q)}, {fmt_dec(hi_q)}]")
        self.lo = F((lo_q * SCALE).__floor__(), SCALE)
        self.hi = F((hi_q * SCALE).__ceil__(), SCALE)

    @staticmethod
    def lift(x):
        return x if isinstance(x, Iv) else Iv(x)

    def __add__(self, x):
        x = self.lift(x)
        return Iv(self.lo + x.lo, self.hi + x.hi)

    __radd__ = __add__

    def __neg__(self):
        return Iv(-self.hi, -self.lo)

    def __sub__(self, x):
        return self + (-self.lift(x))

    def __rsub__(self, x):
        return self.lift(x) + (-self)

    def __mul__(self, x):
        x = self.lift(x)
        ends = (self.lo * x.lo, self.lo * x.hi, self.hi * x.lo, self.hi * x.hi)
        return Iv(min(ends), max(ends))

    __rmul__ = __mul__

    def __truediv__(self, x):
        x = self.lift(x)
        check(x.lo > 0 or x.hi < 0, f"Iv division by 0: [{fmt_dec(x.lo)}, {fmt_dec(x.hi)}]")
        return self * Iv(F(1) / x.hi, F(1) / x.lo)

    def __rtruediv__(self, x):
        return self.lift(x) / self

    def sq(self):
        if self.lo <= 0 <= self.hi:
            m = max(-self.lo, self.hi)
            return Iv(F(0), m * m)
        ends = (self.lo * self.lo, self.hi * self.hi)
        return Iv(min(ends), max(ends))

    def sqrt(self):
        check(self.lo >= 0, f"sqrt of negative Iv lo={fmt_dec(self.lo)}")
        low = isqrt((self.lo.numerator << (2 * BITS)) // self.lo.denominator)
        num_scaled = self.hi.numerator << (2 * BITS)
        q_int, rem = divmod(num_scaled, self.hi.denominator)
        high = isqrt(q_int)
        if high * high < q_int or rem > 0:
            high += 1
        return Iv(F(low, SCALE), F(high, SCALE))


def atan_recip(n: int) -> Iv:
    cnt = 160
    q = F(1, n)
    tot = sum(F((-1) ** k, 2 * k + 1) * (q ** (2 * k + 1)) for k in range(cnt))
    return Iv(tot, tot + (q ** (2 * cnt + 1)) / F(2 * cnt + 1))


PI = 16 * atan_recip(5) - 4 * atan_recip(239)
SQRT_PI = PI.sqrt()
SQRT_2 = Iv(2).sqrt()


def exp_pos(r: F, cnt: int = 180) -> Iv:
    r = F(r)
    check(0 <= r < cnt // 2, f"exp_pos out of range: {fmt_dec(r)}")
    tot = sum((r**k) / F(factorial(k)) for k in range(cnt))
    first = (r**cnt) / F(factorial(cnt))
    return Iv(tot, tot + first / (1 - r / F(cnt + 1)))


def exp_neg_upper(x: F, deg: int = 48) -> F:
    """Exact rational upper bound for exp(-x) = 1 / exp(x) via truncated Taylor sum of exp(x)."""
    check(x >= 0, "exp_neg_upper expects x >= 0")
    s = F(0)
    term = F(1)
    for k in range(deg + 1):
        if k > 0:
            term = term * x / k
        s += term
    return F(1) / s


def j0_iv(a: F, b: F) -> Iv:
    """220-bit outward enclosure of J_0(a, b) = int_0^inf T^{-1/2} e^{-T} (a + b T)^{-1} dT."""
    a, b = F(a), F(b)
    check(a > 0 and b > 0, "j0_iv expects a, b > 0")
    r = a / b
    cnt = 180
    check(r < 12, "j0_iv expects a/b < 12")
    tot = sum(((-r) ** k) / F(factorial(k) * (2 * k + 1)) for k in range(cnt))
    nxt = (r**cnt) / F(factorial(cnt) * (2 * cnt + 1))
    erf_s = Iv(tot, tot + nxt)
    return exp_pos(r) * (PI / (b * Iv(r).sqrt()) - 2 * SQRT_PI * erf_s / b)


# ============================================================================
# 2. Target Specifications & Pinned Upstream Hashes
# ============================================================================
PROFILE_CAPS_SHA256 = "01c2e2a7b4af452ce8729ec47cb0cd2c3aa7e1368c6b58336270c2a19b349514"
MOMENT_BOXES_SHA256 = "cef37c2a66eacd66296add7ed2efc5a8d6afc336d2ed614102de08429d449695"
CENTRAL_94_125_SHA256 = "444cc60ae60049aa9fa24fc24a20ee108988982ccc7e3cbc1eeb19bc9abdd3c8"

TARGETS = {
    "peak": {
        "a": F(699, 1250),
        "b": F(179, 1250),
        "p": F(2500, 1891),
        "rho": F(5053, 10000),
        "sA": F(1, 2),
        "c_iso": F(6, 25),
        "alpha_nu": F(-7, 25),
        "k_comp": F(-11, 20),
        "cert_file": "cert_peak.json",
    },
    "row7": {
        "row_idx0": 6,
        "lo": F(831, 1000),
        "hi": F(21, 25),
        "a": F(5514887, 10000000),
        "b": F(1395547, 10000000),
        "p": F(125, 94),
        "rho": F(5067, 10000),
        "sA": F(1, 2),
        "c_iso": F(23, 100),
        "alpha_nu": F(-27, 100),
        "k_comp": F(-59, 100),
        "cert_file": "cert_row7.json",
    },
    "row6": {
        "row_idx0": 5,
        "lo": F(411, 500),
        "hi": F(831, 1000),
        "a": F(679519, 1250000),
        "b": F(673221, 5000000),
        "p": F(125, 94),
        "rho": F(1273, 2500),
        "sA": F(1, 2),
        "c_iso": F(11, 50),
        "alpha_nu": F(-29, 100),
        "k_comp": F(-63, 100),
        "cert_file": "cert_row6.json",
    },
}


def derived_target_constants(sp: dict) -> dict:
    p = sp["p"]
    rho = sp["rho"]
    sA = sp["sA"]
    c_iso = sp["c_iso"]
    anu = sp["alpha_nu"]
    kc = sp["k_comp"]
    check(sA == F(1, 2), "expected sA == 1/2")
    d = F(1) - sA
    c1 = sA * rho
    r2 = rho * rho
    cR = sA * sA + c_iso
    cU = c_iso
    q_AA = p - cR - cU * r2
    q_BB = p - cR * r2 - cU
    q_AB = (cU - cR) * rho
    q_min = p - cR * (1 + r2)
    gamma = kc - p * anu
    d_nu = p + 2 * kc * anu - (p + 1) * anu * anu
    return {
        "d": d,
        "c1": c1,
        "q_AA": q_AA,
        "q_BB": q_BB,
        "q_AB": q_AB,
        "q_min": q_min,
        "gamma": gamma,
        "d_nu": d_nu,
    }


# ============================================================================
# 3. Exact Symbolic & Bernstein Proofs (Lemmas L1, L2, S1, S2, psi, KJSEC 2a)
# ============================================================================
def poly_add(p: dict, q: dict) -> dict:
    out = dict(p)
    for k, v in q.items():
        out[k] = out.get(k, F(0)) + v
    return {k: v for k, v in out.items() if v != 0}


def poly_sub(p: dict, q: dict) -> dict:
    return poly_add(p, {k: -v for k, v in q.items()})


def poly_mul(p: dict, q: dict) -> dict:
    out: dict = {}
    for (i1, j1), v1 in p.items():
        for (i2, j2), v2 in q.items():
            k = (i1 + i2, j1 + j2)
            out[k] = out.get(k, F(0)) + v1 * v2
    return {k: v for k, v in out.items() if v != 0}


def bernstein_2d_min(poly: dict, dx: int, dy: int) -> F:
    mn = None
    for p in range(dx + 1):
        for q in range(dy + 1):
            val = F(0)
            for (i, j), a in poly.items():
                if i <= p and j <= q:
                    val += a * F(comb(p, i), comb(dx, i)) * F(comb(q, j), comb(dy, j))
            mn = val if mn is None else min(mn, val)
    check(mn is not None, "empty Bernstein grid")
    return mn


def poly_2d_affine(poly: dict, ax: F, wx: F, ay: F, wy: F) -> dict:
    """Exact polynomial pullback poly(ax + wx*s, ay + wy*t) on (s, t) in [0, 1]^2."""
    out: dict = {}
    for (i, j), coeff in poly.items():
        # Expand (ax + wx*s)^i * (ay + wy*t)^j
        xs = [comb(i, p) * (ax ** (i - p)) * (wx**p) for p in range(i + 1)]
        ys = [comb(j, q) * (ay ** (j - q)) * (wy**q) for q in range(j + 1)]
        for p, cx in enumerate(xs):
            if cx == 0:
                continue
            for q, cy in enumerate(ys):
                if cy == 0:
                    continue
                k = (p, q)
                out[k] = out.get(k, F(0)) + coeff * cx * cy
    return {k: v for k, v in out.items() if v != 0}


def bernstein_2d_nonneg(poly: dict, dx: int, dy: int, ax: F = F(0), bx: F = F(1), ay: F = F(0), by: F = F(1), depth: int = 10) -> bool:
    sub = poly_2d_affine(poly, ax, bx - ax, ay, by - ay)
    if bernstein_2d_min(sub, dx, dy) >= 0:
        return True
    if depth <= 0:
        return False
    mx = (ax + bx) / 2
    my = (ay + by) / 2
    return (
        bernstein_2d_nonneg(poly, dx, dy, ax, mx, ay, my, depth - 1)
        and bernstein_2d_nonneg(poly, dx, dy, mx, bx, ay, my, depth - 1)
        and bernstein_2d_nonneg(poly, dx, dy, ax, mx, my, by, depth - 1)
        and bernstein_2d_nonneg(poly, dx, dy, mx, bx, my, by, depth - 1)
    )


def bernstein_1d(poly: list[F], a: F, b: F) -> list[F]:
    n = len(poly) - 1
    d = b - a
    shifted = [
        sum(poly[j] * comb(j, i) * (a ** (j - i)) * (d**i) for j in range(i, n + 1))
        for i in range(n + 1)
    ]
    return [sum(shifted[j] * F(comb(k, j), comb(n, j)) for j in range(k + 1)) for k in range(n + 1)]


def check_symbolic_lemmas() -> None:
    """Zero-float symbolic proofs of Lemmas L1, L2, S1, S2, psi calculus, and KJSEC Thm 2(a)."""
    P1 = {(0, 0): F(1)}
    Px = {(1, 0): F(1)}
    Py = {(0, 1): F(1)}
    u = {(0, 0): F(1), (1, 0): F(1)}
    u2 = poly_mul(u, u)
    u3 = poly_mul(u2, u)
    u4 = poly_mul(u2, u2)

    # Lemma L1: ||mu^2 D_X A(X, q)[h]||_op <= 1
    p3mx = {(0, 0): F(3), (1, 0): F(-1)}
    p4mx = {(0, 0): F(4), (1, 0): F(-1)}
    l1_a = poly_sub(u4, poly_mul(Px, poly_mul(p3mx, p3mx)))
    l1_1pdet = poly_add(u2, poly_mul(Px, poly_sub(poly_mul(p4mx, Py), P1)))
    tr_fac = poly_add(p3mx, u2)
    l1_c = poly_sub(poly_mul(l1_1pdet, l1_1pdet), poly_mul(Px, poly_mul(poly_mul(tr_fac, tr_fac), Py)))
    check(bernstein_2d_min(l1_a, 6, 0) > 0, "Lemma L1a Bernstein check failed")
    check(bernstein_2d_min(l1_1pdet, 2, 1) >= 1, "Lemma L1 (1+det) Bernstein check failed")
    check(bernstein_2d_min(l1_c, 6, 2) >= 0, "Lemma L1c Bernstein check failed")

    # Lemma L2: mu^3 D_X^2 A(X, q)[h, h] <= 2 I_2
    p3xy_m1 = {(1, 1): F(3), (0, 0): F(-1)}
    g2_u3 = poly_add(
        poly_add(
            poly_mul({(1, 1): F(3, 2), (0, 0): F(-1, 2)}, u2),
            poly_mul({(1, 1): F(4), (0, 0): F(-2)}, u),
        ),
        {(1, 1): F(16)},
    )
    u_p4 = {(0, 0): F(5), (1, 0): F(1)}
    a00_u3 = poly_sub(
        poly_add(
            poly_sub(poly_mul(p3xy_m1, u3), poly_mul({(1, 0): F(2)}, g2_u3)),
            poly_mul({(1, 1): F(4)}, poly_mul(u_p4, u)),
        ),
        poly_mul({(0, 1): F(2)}, u2),
    )
    a11_u3 = poly_sub(poly_mul(p3xy_m1, u3), poly_mul({(0, 0): F(2), (0, 1): F(-2)}, u2))
    h00 = poly_sub(poly_mul({(0, 0): F(2)}, u3), a00_u3)
    h11 = poly_sub(poly_mul({(0, 0): F(2)}, u3), a11_u3)
    p_off = {(0, 0): F(1), (1, 0): F(-4), (2, 0): F(-1)}
    h01_sq = poly_mul(poly_mul({(0, 1): F(4), (0, 2): F(-4)}, u2), poly_mul(p_off, p_off))
    det_l2 = poly_sub(poly_mul(h00, h11), h01_sq)
    check(bernstein_2d_min(h00, 6, 2) > 0, "Lemma L2 H00 Bernstein check failed")
    check(bernstein_2d_min(h11, 6, 2) >= 0, "Lemma L2 H11 Bernstein check failed")
    check(bernstein_2d_min(det_l2, 8, 4) >= 0, "Lemma L2 DET Bernstein check failed")

    # C_0 potential psi(r, q) = q^2 / (mu*(mu + r)^2) = 2*mu - 2*r - q/mu
    Pr = {(1, 0): F(1)}
    Pm = {(0, 1): F(1)}
    Pq = poly_sub(poly_mul(Pm, Pm), poly_mul(Pr, Pr))
    Pm_m_r = poly_sub(Pm, Pr)
    Pm_p_r = poly_add(Pm, Pr)
    check(poly_sub(poly_mul(poly_mul(Pm_m_r, Pm_p_r), poly_mul(Pm_m_r, Pm_p_r)), poly_mul(Pq, Pq)) == {}, "psi id 1")
    check(poly_sub(poly_sub(poly_mul({(0, 1): F(2)}, Pm_m_r), Pq), poly_mul(Pm_m_r, Pm_m_r)) == {}, "psi id 2")
    lhs_d1 = poly_mul(
        poly_sub(
            poly_sub(poly_mul({(0, 3): F(2)}, P1), poly_mul({(1, 2): F(2)}, P1)),
            poly_mul(Pr, Pq),
        ),
        poly_mul(Pm_p_r, Pm_p_r),
    )
    rhs_d1 = poly_mul(poly_mul(Pq, Pq), poly_add(poly_mul({(0, 1): F(2)}, P1), Pr))
    check(poly_sub(lhs_d1, rhs_d1) == {}, "psi'(r) identity failed")
    lhs_d2 = poly_add(
        poly_mul(poly_mul({(0, 2): F(2)}, P1), Pq),
        poly_mul(Pq, poly_sub(poly_mul(Pm, Pm), poly_mul({(2, 0): F(3)}, P1))),
    )
    rhs_d2 = poly_mul({(0, 0): F(3)}, poly_mul(Pq, Pq))
    check(poly_sub(lhs_d2, rhs_d2) == {}, "psi''(r) identity failed")

    # Smooth-Split H_{5,delta} Lemmas S1 & S2
    def upoly_mul(a, b):
        res = [F(0)] * (len(a) + len(b) - 1)
        for i, x in enumerate(a):
            for j, y in enumerate(b):
                res[i + j] += x * y
        return res

    def upoly_add(a, b):
        n = max(len(a), len(b))
        return [(a[i] if i < len(a) else F(0)) + (b[i] if i < len(b) else F(0)) for i in range(n)]

    def upoly_sub(a, b):
        n = max(len(a), len(b))
        return [(a[i] if i < len(a) else F(0)) - (b[i] if i < len(b) else F(0)) for i in range(n)]

    p_1pt5 = [F(1), F(5), F(10), F(10), F(5), F(1)]
    p_lin2 = upoly_mul([F(1), F(5, 2)], [F(1), F(5, 2)])
    chi_num = upoly_sub(p_1pt5, p_lin2)
    check(chi_num == [F(0), F(0), F(15, 4), F(10), F(5), F(1)], "chi_5 numerator mismatch")
    check(F(15, 8) * F(3, 4) ** 2 == F(135, 128) > F(1), "chi_5 tail bound mismatch")
    p_rhs_bound = upoly_mul([F(1), F(0), F(-15, 8)], [F(1), F(0), F(-15, 8)])
    chi_sq_diff = upoly_sub(p_lin2, upoly_mul(p_rhs_bound, p_1pt5))
    chi_sq_u = {(k, 0): c * (F(3, 4) ** k) for k, c in enumerate(chi_sq_diff) if c != 0}
    check(bernstein_2d_min(chi_sq_u, len(chi_sq_diff) - 1, 0) >= 0, "chi_5 Bernstein check failed")

    B_h5 = [F(5), F(12), F(9), F(2)]
    p_xx0 = [F(15, 4), F(-243, 8), F(27, 4), F(3, 2)]
    p_xx1 = [F(-5, 4), F(81, 8), F(-9, 4), F(-1, 2)]
    p_yy0 = [F(15, 4), F(9, 8), F(-27, 8), F(-3, 4)]
    p_yy1 = [F(5, 4), F(45, 8), F(45, 8), F(5, 4)]
    p_xy = [F(-5, 4), F(9, 4), F(9, 2), F(1)]
    tr0 = upoly_add(p_xx0, p_yy0)
    tr1 = upoly_add(p_xx1, p_yy1)
    check(all(c >= 0 for c in upoly_sub([2 * x for x in B_h5], upoly_sub(tr0, tr1))), "H5 tr- failed")
    check(all(c >= 0 for c in upoly_sub([2 * x for x in B_h5], upoly_add(tr0, tr1))), "H5 tr+ failed")
    a0 = upoly_sub(B_h5, p_xx0)
    a1 = [-x for x in p_xx1]
    b0 = upoly_sub(B_h5, p_yy0)
    b1 = [-x for x in p_yy1]
    xy2 = upoly_mul(p_xy, p_xy)
    Q0 = upoly_sub(upoly_mul(a0, b0), xy2)
    Q1 = upoly_add(upoly_mul(a0, b1), upoly_mul(a1, b0))
    Q2 = upoly_add(upoly_mul(a1, b1), xy2)
    check(all(c >= 0 for c in upoly_add(upoly_add(Q0, Q1), Q2)), "H5 Hessian P(+1) failed")
    check(all(c >= 0 for c in upoly_sub(Q0, Q2)), "H5 Hessian Q0-Q2 failed")
    check(all(c >= 0 for c in upoly_add(upoly_sub(Q0, Q1), Q2)), "H5 Hessian P(-1) failed")

    # Exact proof of KJSEC Theorem 2(a) used in Part 2 even origin strip:
    # For ALL eta in [0, 1] and ALL (x, y) with x^2 + y^2 <= eta^2 (Y = y^2 in [0, eta^2 - x^2]),
    #   2*(sqrt((1 + x)^2 + Y) - 1 - x) <= (eta^2 * x^2 + Y) / (1 - eta + eta^2).
    # Proof: d(eta) = 1 - eta + eta^2 >= 3/4 > 0, and 1 + x >= 1 - eta >= 0.
    # Let N(eta, x, Y) := (2*d*(1 + x) + eta^2*x^2 + Y)^2 - 4*d^2*((1 + x)^2 + Y).
    # (1) N is convex quadratic in Y with d^2 N / dY^2 = 2 > 0, and unconstrained vertex
    #     Y_* = 2*d*(d - 1 - x) - eta^2 * x^2.
    # (2) At Y = 0: N(eta, x, 0) = eta^2 * x^2 * (4*d*(1 + x) + eta^2 * x^2) >= 0.
    # (3) At Y = eta^2 - x^2 (disk boundary x = eta*(2*u - 1), (eta, u) in [0, 1]^2):
    #     certified >= 0 by exact 2D Bernstein on [0, 1]^2!
    # (4) At Y = Y_*: N(eta, x, Y_*) == 4*d^2*(1 - eta)*(x + eta)*(-(1 + eta)*x - eta*(1 - eta)).
    #     Whenever Y_* >= 0, -eta*(1 - eta) - x >= eta^2*x^2/(2*d) >= 0 (so x <= 0), hence
    #     -(1 + eta)*x - eta*(1 - eta) = (-eta*(1 - eta) - x) + eta*(-x) >= 0, so N(eta, x, Y_*) >= 0!
    P_eta = {(1, 0): F(1)}
    P_u = {(0, 1): F(1)}
    P_d = {(0, 0): F(1), (1, 0): F(-1), (2, 0): F(1)}
    # Check d(eta) - 3/4 == (eta - 1/2)^2:
    eta_m_half = {(0, 0): F(-1, 2), (1, 0): F(1)}
    check(poly_sub(poly_sub(P_d, {(0, 0): F(3, 4)}), poly_mul(eta_m_half, eta_m_half)) == {}, "d(eta) >= 3/4 failed")
    # Boundary Y = eta^2 - x^2 with x = eta*(2*u - 1):
    P_x_bdry = poly_mul(P_eta, {(0, 0): F(-1), (0, 1): F(2)})
    P_x2_bdry = poly_mul(P_x_bdry, P_x_bdry)
    P_eta2 = poly_mul(P_eta, P_eta)
    P_Y_bdry = poly_sub(P_eta2, P_x2_bdry)
    P_1px_bdry = poly_add(P1, P_x_bdry)
    term_lin = poly_add(
        poly_mul({(0, 0): F(2)}, poly_mul(P_d, P_1px_bdry)),
        poly_add(poly_mul(P_eta2, P_x2_bdry), P_Y_bdry),
    )
    N_bdry = poly_sub(
        poly_mul(term_lin, term_lin),
        poly_mul({(0, 0): F(4)}, poly_mul(poly_mul(P_d, P_d), poly_add(poly_mul(P_1px_bdry, P_1px_bdry), P_Y_bdry))),
    )
    # Factor out eta^3 >= 0 on [0, 1] from N_bdry (degree (5, 4)):
    check(all(i >= 3 for (i, _j) in N_bdry), "N_bdry not divisible by eta^3")
    N_bdry_red = {(i - 3, j): c for (i, j), c in N_bdry.items()}
    check(bernstein_2d_nonneg(N_bdry_red, 5, 4), "KJSEC Thm 2(a) disk boundary Bernstein check failed")

    # Vertex identity in Q[eta, x]:
    Q_eta = {(1, 0): F(1)}
    Q_x = {(0, 1): F(1)}
    Q_d = {(0, 0): F(1), (1, 0): F(-1), (2, 0): F(1)}
    Q_eta2 = poly_mul(Q_eta, Q_eta)
    Q_x2 = poly_mul(Q_x, Q_x)
    Q_1px = poly_add(P1, Q_x)
    Y_star = poly_sub(
        poly_mul({(0, 0): F(2)}, poly_mul(Q_d, poly_sub(poly_sub(Q_d, P1), Q_x))),
        poly_mul(Q_eta2, Q_x2),
    )
    lhs_vtx_term = poly_add(
        poly_mul({(0, 0): F(2)}, poly_mul(Q_d, Q_1px)),
        poly_add(poly_mul(Q_eta2, Q_x2), Y_star),
    )
    N_vtx = poly_sub(
        poly_mul(lhs_vtx_term, lhs_vtx_term),
        poly_mul({(0, 0): F(4)}, poly_mul(poly_mul(Q_d, Q_d), poly_add(poly_mul(Q_1px, Q_1px), Y_star))),
    )
    fac1 = poly_sub(P1, Q_eta)  # 1 - eta
    fac2 = poly_add(Q_x, Q_eta)  # x + eta
    fac3 = poly_sub(
        poly_mul(poly_sub(Q_eta2, Q_eta), P1),  # -eta*(1 - eta)
        poly_mul(poly_add(P1, Q_eta), Q_x),  # -(1 + eta)*x
    )
    expected_vtx = poly_mul({(0, 0): F(4)}, poly_mul(poly_mul(Q_d, Q_d), poly_mul(fac1, poly_mul(fac2, fac3))))
    check(poly_sub(N_vtx, expected_vtx) == {}, "KJSEC Thm 2(a) vertex factorization failed")


# ============================================================================
# 4. Target Analytic Exteriors (||v||_2 >= 7, w >= 12), Tails & 7.1.6 Alignment
# ============================================================================
def check_target_foundations(name: str, sp: dict) -> dict:
    dc = derived_target_constants(sp)
    a, b, p, rho, c_iso = sp["a"], sp["b"], sp["p"], sp["rho"], sp["c_iso"]
    c1, d = dc["c1"], dc["d"]
    q_AA, q_BB, q_AB, q_min = dc["q_AA"], dc["q_BB"], dc["q_AB"], dc["q_min"]
    d_nu, kc = dc["d_nu"], sp["k_comp"]

    # 1. Exact orthogonal diagonalization of Q_0 > (7/10) I_2 and retained trial cancellation:
    check(q_min > F(7, 10), f"{name}: q_min <= 7/10")
    check(q_AA > F(7, 10) and q_BB > F(7, 10), f"{name}: Q_0 diagonal <= 7/10")
    check((q_AA - F(7, 10)) * (q_BB - F(7, 10)) > q_AB * q_AB, f"{name}: Q_0 <= (7/10) I_2")
    # Verify B_P^(0)(A, B) + (1/4)|A + rho*B|^2 - p*(|A|^2 + |B|^2) == -c_iso*(1 + rho^2)*(|A|^2 + |B|^2)
    # on a basis of rational test pairs:
    for Ar, Ai, Br, Bi in [(F(1), F(0), F(0), F(0)), (F(0), F(0), F(1), F(0)), (F(3, 7), F(-2, 5), F(4, 11), F(1, 3))]:
        Sr = Ar * Ar + Ai * Ai + Br * Br + Bi * Bi
        Rr, Ri = Ar + rho * Br, Ai + rho * Bi
        R2 = Rr * Rr + Ri * Ri
        bp0 = q_AA * (Ar * Ar + Ai * Ai) + q_BB * (Br * Br + Bi * Bi) + 2 * q_AB * (Ar * Br + Ai * Bi)
        check(bp0 + F(1, 4) * R2 - p * Sr == -c_iso * (1 + rho * rho) * Sr, f"{name}: retained cancellation failed")

    # 2. Odd quadratic budget B_odd > (3/4) I_6:
    lam_odd_lo = F(3, 4)
    check(p > lam_odd_lo and d_nu > lam_odd_lo, f"{name}: B_odd diagonal <= 3/4")
    check((p - lam_odd_lo) * (d_nu - lam_odd_lo) > kc * kc, f"{name}: B_odd <= (3/4) I_6")
    check(p + (p - 1) * sp["alpha_nu"] ** 2 + 2 * dc["gamma"] * sp["alpha_nu"] == d_nu, f"{name}: d_nu identity failed")

    # 3. Amplitude exterior ||v||_2 >= 7 (S_r >= 49) for ALL w >= 0 and ALL (Q, P, nu) in C^3:
    # K = (1/2 A + c1 B)*1 + A*(T - 1) + conj(B)*(z_1^2/sqrt(2)); {1, T-1, z_1^2/sqrt(2)} orthonormal =>
    # E|K|^2 <= (5/4 + c1^2) S_r < (23/20)^2 S_r => Rem <= 4 E|K| < (23/5)||v||_2.
    # With q = 9/4 in Theorem 1: psi <= sqrt(q) = 3/2, M_odd <= (1/sqrt(q)) I_6 = (2/3) I_6 < (3/4) I_6 < B_odd,
    # and on ||v||_2 >= 7: ((23/5)||v||_2 + 3/2) / ||v||_2^2 <= 23/35 + 3/98 = 337/490 < 7/10 < q_min!
    check(F(5, 4) + c1 * c1 < F(23, 20) ** 2, f"{name}: Parseval K norm bound failed")
    check(F(2, 3) < lam_odd_lo, f"{name}: 2/3 < 3/4 failed")
    check(F(23, 35) + F(3, 98) == F(337, 490) and F(337, 490) < F(7, 10) < q_min, f"{name}: ||v||>=7 bound failed")

    # 4. Shift exterior w >= 12 for ALL (v, Q, P, nu) in C^5:
    # Split at |L| <= 6 vs |L| > 6: H(8) = 8*(a + 8*b)^2 < 36 => {|L| > 6} subset {T > 8}.
    H8 = F(8) * (a + F(8) * b) ** 2
    check(H8 < F(36), f"{name}: H(8) >= 36")
    e8_hi = exp_neg_upper(F(8))
    denom8 = (a + F(8) * b) * (a + F(24) * b)
    # Even Region 1 (|L| <= 6 => |L + w| >= 6): (1/6) E|K|^2 < (1/6)*(529/400) S_r < (11/48) S_r.
    reg1_ev = F(1, 6) * (F(5, 4) + c1 * c1)
    check(reg1_ev < F(11, 48), f"{name}: w>=12 even reg1 failed")
    # On T >= 8: |K|^2 <= 2*((T - 1/2)^2 |A|^2 + (c1 + T/sqrt(2))^2 |B|^2) <= 3 T^2 S_r:
    s2_lo, s2_hi = SQRT_2.lo, SQRT_2.hi
    check(2 * ((F(8) - d) ** 2) <= 3 * F(64), f"{name}: T>=8 A-term > 3 T^2")
    check(2 * ((c1 + F(8) / s2_lo) ** 2) <= 3 * F(64), f"{name}: T>=8 B-term > 3 T^2")
    m0_ev = F(3 * (64 + 16 + 2)) * e8_hi  # 246 * e^{-8}
    M0_ev = F(3 * 64) * e8_hi / denom8    # 192 * e^{-8} / denom8
    check(4 * M0_ev * m0_ev < F(1, 16), f"{name}: w>=12 even layer-cake >= 1/4")
    even_w12_ub = F(11, 48) + F(1, 4)
    check(even_w12_ub == F(23, 48) < F(7, 10) < q_min, f"{name}: w>=12 even total failed")

    # Odd w >= 12: Region 1 <= (1/6) I_6; Region 2 (T > 8, ||G_iso|| <= (1/2) T^3):
    # m0_odd = (1/2)*Gamma(4, 8) = (1/2)*(512 + 192 + 48 + 6) e^{-8} = 379 e^{-8}, M0_odd = 256 e^{-8} / denom8.
    check(F(1, 2) * (8**3 + 3 * 8**2 + 6 * 8 + 6) == F(379), "Gamma(4,8) mismatch")
    m0_od = F(379) * e8_hi
    M0_od = F(256) * e8_hi / denom8
    check(4 * M0_od * m0_od < F(1, 16), f"{name}: w>=12 odd layer-cake >= 1/4")
    odd_w12_ub = F(1, 6) + F(1, 4)
    check(odd_w12_ub == F(5, 12) < lam_odd_lo, f"{name}: w>=12 odd total failed")

    # 5. Linear envelope M(T) = 3/5 + (5/4) T >= sqrt((T - 1/2)^2 + (c1 + T/sqrt(2))^2) for all T >= 0,
    #    and C++ Part 2 / Part 1 tail conditions at r_cut = 25 (w <= 3) and r_cut = 34 (w <= 12):
    check(F(3, 5) ** 2 > d * d + c1 * c1, f"{name}: M(0) envelope failed")
    check(2 * F(3, 5) * F(5, 4) > 2 * c1 / s2_lo - 2 * d, f"{name}: M'(0) envelope failed")
    check(F(5, 4) ** 2 > F(3, 2), f"{name}: M_slope envelope failed")
    check(d + c1 < F(4, 5), f"{name}: d + c1 >= 0.80")
    H25 = F(25) * (a + F(25) * b) ** 2
    check(H25 < F(22) ** 2, f"{name}: H(25) >= 22^2")
    check(F(1, 2) * F(625) + (2 * d - s2_hi * c1) * F(25) - (d * d + c1 * c1) > 0, f"{name}: T>=25 even tail quad")
    e25_hi = exp_neg_upper(F(25))
    check(F(1354, 25) * e25_hi < F(1, 10**9), f"{name}: even_tail_25 >= 1e-9")
    check(F(8828, 25) * e25_hi < F(1, 10**8), f"{name}: odd_tail_25 >= 1e-8")
    check(5 * b - F(3, 25) > F(1, 2), f"{name}: 5*b - 3/25 <= 1/2")
    check(1 + (c1 / F(25) + F(1) / s2_lo) ** 2 < F(5, 4) ** 2, f"{name}: mk_slope_25 >= 5/4")

    # Base curvature T >= 25 tail inequality:
    q_c = F(5, 2)
    m25 = F(27, 25)
    t25 = F(25)
    check(1 + b / (a + t25 * b) + 3 * b / (a + 3 * t25 * b) <= m25, f"{name}: m25 bound failed")
    coeff25 = (
        F(9) / (t25 * t25)
        + F(4) * m25 * q_c / (F(3) * t25)
        + ((m25 * m25 + F(2) / (t25 * t25)) * F(4) / (F(9) * t25) + F(2) * m25 / (F(3) * t25 * t25))
        * (F(5, 4) * t25)
    )
    check(coeff25 < 2, f"{name}: base curvature T>=25 coeff >= 2")

    # 6. Centered alignment 7.1.6: k_B(0)/k_A(0) > rho_i via 220-bit J_0(a_i, b_i) enclosure!
    # J_1 = (sqrt(pi) - a*J_0)/b, k_A(0) = (J_0 - J_1)/2, k_B(0) = J_1 / (2*sqrt(2)).
    j0 = j0_iv(a, b)
    j1 = (SQRT_PI - a * j0) / b
    kA0 = (j0 - j1) / 2
    kB0 = j1 / (2 * SQRT_2)
    ratio_kb_ka = kB0 / kA0
    check(ratio_kb_ka.lo > rho, f"{name}: k_B(0)/k_A(0)={fmt_dec(ratio_kb_ka.lo)} <= rho={fmt_dec(rho)}")
    # Global 7.1.6 centered error bound (valid on every row without a 79-cell g_B - rho*g cover):
    # 0 <= k_B(v) - rho*k_A(v) <= (1/sqrt(2) - rho)*k_A(0) => ||e^(i)(q)||_2 <= m_i * sqrt(u)
    m_i_hi = (((F(1) / SQRT_2 - rho) * kA0) / 2).hi
    check(m_i_hi < F(9, 100), f"{name}: 7.1.6 centered m_i >= 9/100")

    return {
        "q_min": fmt_dec(q_min),
        "d_nu": f"{d_nu.numerator}/{d_nu.denominator}",
        "j0_iv": [fmt_dec(j0.lo, 12), fmt_dec(j0.hi, 12)],
        "kB0_over_kA0_lo": fmt_dec(ratio_kb_ka.lo, 8),
        "rho": fmt_dec(rho, 6),
        "global_7_1_6_err_coeff_hi": fmt_dec(m_i_hi, 8),
        "c_iso_times_1_plus_rho2": fmt_dec(c_iso * (1 + rho * rho), 8),
    }


# ============================================================================
# 5. Certificate Auditing (Parts 1, 2, 3) for Each Target
# ============================================================================
def check_q0_minus_sym2(arr: list, q_AA: F, q_BB: F, q_AB: F, ctx: str) -> F:
    check(isinstance(arr, list) and len(arr) == 3, f"{ctx}: expected 3-entry Sym2")
    a00_h = parse_hex(arr[0])
    a01_l, a01_h = parse_iv(arr[1])
    a11_h = parse_hex(arr[2])
    d00 = q_AA - a00_h
    d11 = q_BB - a11_h
    d01_abs = max(abs(q_AB - a01_l), abs(q_AB - a01_h))
    check(d00 > 0 and d11 > 0, f"{ctx}: even diagonal <= 0")
    det = d00 * d11 - d01_abs * d01_abs
    check(det > 0, f"{ctx}: even 2x2 det <= 0 ({fmt_dec(det)})")
    return det


def check_b3_minus_sym3(arr: list, p: F, d_nu: F, k_comp: F, ctx: str) -> F:
    check(isinstance(arr, list) and len(arr) == 6, f"{ctx}: expected 6-entry Sym3")
    d00 = p - parse_hex(arr[0])
    iv01 = parse_iv(arr[1])
    iv02 = parse_iv(arr[2])
    d11 = p - parse_hex(arr[3])
    iv12 = parse_iv(arr[4])
    d22 = d_nu - parse_hex(arr[5])
    check(d00 > 0 and d11 > 0 and d22 > 0, f"{ctx}: odd diagonal <= 0")
    c01 = (-iv01[0], -iv01[1])
    c02 = (k_comp - iv02[0], k_comp - iv02[1])
    c12 = (-iv12[0], -iv12[1])
    min_det3 = None
    for d01 in c01:
        m2 = d00 * d11 - d01 * d01
        check(m2 > 0, f"{ctx}: odd 2x2 minor <= 0")
        for d02 in c02:
            for d12 in c12:
                det3 = (
                    d00 * (d11 * d22 - d12 * d12)
                    - d01 * (d01 * d22 - d12 * d02)
                    + d02 * (d01 * d12 - d11 * d02)
                )
                check(det3 > 0, f"{ctx}: odd 3x3 det <= 0 ({fmt_dec(det3)})")
                min_det3 = det3 if min_det3 is None else min(min_det3, det3)
    check(min_det3 is not None, f"{ctx}: empty corner loop")
    return min_det3


def verify_contiguous_arr(slabs: list, start: F, end: F, ctx: str) -> None:
    check(isinstance(slabs, list) and len(slabs) > 0, f"{ctx}: empty slab list")
    cur = start
    for idx, sl in enumerate(slabs):
        check(isinstance(sl, list) and len(sl) >= 2, f"{ctx}[{idx}]: malformed slab")
        wl, wh = parse_hex(sl[0]), parse_hex(sl[1])
        check(wl == cur, f"{ctx}[{idx}]: slab gap/overlap (expected {cur}, got {wl})")
        check(wh > wl, f"{ctx}[{idx}]: non-positive slab width")
        cur = wh
    check(cur == end, f"{ctx}: ended at {cur}, expected {end}")


def verify_single_target_cert(name: str, sp: dict, data: dict, expected_cpp_sha: str, check_hash: bool = True) -> dict:
    if check_hash:
        check(data.get("cpp_sha256") == expected_cpp_sha, f"{name}: cpp_sha256 mismatch")
    check(data.get("format") == "uncapped-six-sector-v1", f"{name}: bad format")
    check(data.get("target") == name, f"{name}: target field mismatch {data.get('target')!r}")
    check(data.get("self_tests_passed") is True, f"{name}: self_tests_passed != True")

    prm = data.get("params", {})
    for key in ("a", "b", "p", "rho", "sA", "c_iso", "alpha_nu", "k_comp"):
        check(key in prm and parse_hex(prm[key]) == sp[key], f"{name}: param {key} mismatch")

    s_even_max = parse_hex(data["even_origin_radius"])
    w_ext = parse_hex(data["shift_exterior_cutoff"])
    w_tail = parse_hex(data["analytic_tail_cutoff"])
    S_ext = parse_hex(data["amplitude_exterior_S_min"])
    check(s_even_max == F(1, 128) and w_ext == F(3) and w_tail == F(12) and S_ext == F(49), f"{name}: exterior cutoffs mismatch")

    # Rounding regression controls:
    rc = data["rounding_controls"]
    t2 = rc["t2_ring24"]
    check(isinstance(t2, list) and len(t2) == 4, f"{name}: malformed t2_ring24")
    rc_Tl, rc_Th, rc_Tm, rc_hT = (parse_hex(t2[0]), parse_hex(t2[1]), parse_hex(t2[2]), parse_hex(t2[3]))
    check(rc_Tl == F(4) and rc_Th > rc_Tl and rc_Tl <= rc_Tm <= rc_Th, f"{name}: bad t2_ring24 bounds")
    check(rc_hT >= max(rc_Tm - rc_Tl, rc_Th - rc_Tm), f"{name}: t2_ring24 hT fails midpoint enclosure")
    df_l, df_h = parse_iv(rc["t0_sector2"])
    check(df_l <= F(1, 24) <= df_h, f"{name}: t0_sector2 fails to enclose 1/24")

    dc = derived_target_constants(sp)
    q_AA, q_BB, q_AB = dc["q_AA"], dc["q_BB"], dc["q_AB"]
    p, d_nu, kc = sp["p"], dc["d_nu"], sp["k_comp"]
    a, b = sp["a"], sp["b"]

    # Part 1: Shift exterior on [3, 12]
    p1 = data["part1_shift_slabs"]
    verify_contiguous_arr(p1, w_ext, w_tail, f"{name}.part1")
    min_p1_ev_det = None
    min_p1_od_det = None
    for idx, sl in enumerate(p1):
        check(len(sl) == 5, f"{name}.part1[{idx}]: expected 5 elements")
        ev_re = check_q0_minus_sym2(sl[2], q_AA, q_BB, q_AB, f"{name}.part1[{idx}].P_re")
        ev_im = check_q0_minus_sym2(sl[3], q_AA, q_BB, q_AB, f"{name}.part1[{idx}].P_im")
        od = check_b3_minus_sym3(sl[4], p, d_nu, kc, f"{name}.part1[{idx}].O_iso")
        ev_m = min(ev_re, ev_im)
        min_p1_ev_det = ev_m if min_p1_ev_det is None else min(min_p1_ev_det, ev_m)
        min_p1_od_det = od if min_p1_od_det is None else min(min_p1_od_det, od)
    # Independent w = 3 Jensen diagonal control: O_iso[0,0](3) = E[T/|3+L|] >= 1/sqrt(9 + 2a^2 + 12ab + 24b^2)
    jensen_p1_denom = F(9) + 2 * a * a + 12 * a * b + 24 * b * b
    o00_hi = parse_hex(p1[0][4][0])
    check(o00_hi > 0 and o00_hi * o00_hi * jensen_p1_denom > F(1), f"{name}: Part 1 w=3 Jensen control failed")

    # Part 2: Self-contained even + odd origin strip on [0, 3]
    p2 = data["part2_origin_strip"]
    verify_contiguous_arr(p2, F(0), w_ext, f"{name}.part2")
    min_p2_ev_det = None
    min_p2_od_det = None
    for idx, sl in enumerate(p2):
        check(len(sl) == 11, f"{name}.part2[{idx}]: expected 11 elements")
        s_odd = parse_hex(sl[2])
        delta_s = parse_hex(sl[3])
        eps_cs = parse_hex(sl[4])
        R_in = parse_hex(sl[5])
        lam = parse_hex(sl[6])
        check(F(1, 256) <= s_odd <= F(1, 8), f"{name}.part2[{idx}]: invalid s_odd")
        check(F(0) < delta_s <= F(1, 2), f"{name}.part2[{idx}]: invalid delta")
        check(eps_cs > 0 and R_in > delta_s and lam > 0, f"{name}.part2[{idx}]: invalid R_in/eps_cs/lam")
        e_re = check_q0_minus_sym2(sl[7], q_AA, q_BB, q_AB, f"{name}.part2[{idx}].E_re")
        e_im = check_q0_minus_sym2(sl[8], q_AA, q_BB, q_AB, f"{name}.part2[{idx}].E_im")
        m_re = check_b3_minus_sym3(sl[9], p, d_nu, kc, f"{name}.part2[{idx}].M_re")
        m_im = check_b3_minus_sym3(sl[10], p, d_nu, kc, f"{name}.part2[{idx}].M_im")
        ev_m = min(e_re, e_im)
        od_m = min(m_re, m_im)
        min_p2_ev_det = ev_m if min_p2_ev_det is None else min(min_p2_ev_det, ev_m)
        min_p2_od_det = od_m if min_p2_od_det is None else min(min_p2_od_det, od_m)
    # Independent w = 0 Jensen diagonal control: M_im[0,0](0) = E[sqrt(T)/(a + bT)] >= (sqrt(pi)/2)/(a + 3b/2)
    jensen_p2_coef = F(1, 2) / (a + F(3, 2) * b)
    mim00_hi = parse_hex(p2[0][10][0])
    check(mim00_hi > jensen_p2_coef * SQRT_PI.lo, f"{name}: Part 2 w=0 Jensen control failed")

    # Part 3: 5D Box5 adaptive bulk cover on [0, 3]
    p3 = data["part3_bulk"]
    verify_contiguous_arr(p3, F(0), w_ext, f"{name}.part3")
    tot_boxes = 0
    tot_ws = 0
    worst_m = None
    min_piv = None
    for idx, sl in enumerate(p3):
        check(len(sl) == 15, f"{name}.part3[{idx}]: expected 15 elements")
        wl, wh = parse_hex(sl[0]), parse_hex(sl[1])
        so = parse_hex(sl[2])
        n_up, a2_up, b2_up = parse_hex(sl[3]), parse_hex(sl[4]), parse_hex(sl[5])
        check(so > 0 and n_up > 0 and a2_up > 0 and b2_up > 0, f"{name}.part3[{idx}]: non-positive curv/s_odd")
        overlapping = [parse_hex(s2[2]) for s2 in p2 if parse_hex(s2[1]) > wl and parse_hex(s2[0]) < wh]
        check(len(overlapping) > 0 and F(1, 256) <= so <= min(overlapping), f"{name}.part3[{idx}]: Part 3/Part 2 s_odd gap")
        c_ext, c_ori, c_piv, c_ws = int(sl[6]), int(sl[7]), int(sl[8]), int(sl[9])
        c_g = sl[10]
        check(isinstance(c_g, list) and len(c_g) == 3, f"{name}.part3[{idx}]: bad closed_g")
        c_g_ints = [int(x) for x in c_g]
        sb_boxes = int(sl[11])
        open_boxes = int(sl[12])
        wm = parse_hex(sl[13])
        mp = parse_hex(sl[14])
        check(open_boxes == 0, f"{name}.part3[{idx}]: open_boxes={open_boxes} != 0")
        check(wm < 0 and mp > 0, f"{name}.part3[{idx}]: failed box margin/piv")
        check(c_ext >= 0 and c_ori >= 0 and c_piv >= 0 and c_ws >= 0 and all(x >= 0 for x in c_g_ints), "neg counts")
        check(sum(c_g_ints) > 0, f"{name}.part3[{idx}]: zero grid-closed boxes")
        check(sb_boxes == c_ext + c_ori + c_piv + sum(c_g_ints) and sb_boxes >= 8, f"{name}.part3[{idx}]: count mismatch")
        tot_boxes += sb_boxes
        tot_ws += c_ws
        worst_m = wm if worst_m is None else max(worst_m, wm)
        min_piv = mp if min_piv is None else min(min_piv, mp)

    summ = data["summary"]
    check(tot_boxes == int(summ["total_boxes"]), f"{name}: summary total_boxes mismatch")
    check(tot_ws == int(summ["w_splits"]), f"{name}: summary w_splits mismatch")
    check(worst_m == parse_hex(summ["worst_margin"]), f"{name}: summary worst_margin mismatch")
    check(min_piv == parse_hex(summ["min_odd_piv"]), f"{name}: summary min_odd_piv mismatch")

    return {
        "part1_slabs": len(p1),
        "part1_min_even_det": fmt_dec(min_p1_ev_det),
        "part1_min_odd_det3": fmt_dec(min_p1_od_det),
        "part2_slabs": len(p2),
        "part2_min_even_det": fmt_dec(min_p2_ev_det),
        "part2_min_odd_det3": fmt_dec(min_p2_od_det),
        "part3_slabs": len(p3),
        "part3_total_boxes": tot_boxes,
        "part3_w_splits": tot_ws,
        "part3_worst_margin": fmt_dec(worst_m, 14),
        "part3_min_odd_piv": fmt_dec(min_piv, 10),
    }


# ============================================================================
# 6. Peak Energy-Cap-Free Corollaries & Lower-Central Obstructions
# ============================================================================
def verify_peak_corollaries(repo_root: Path) -> dict:
    """Zero-float verification of all energy-cap-free Peak six-sector corollaries."""
    caps_path = repo_root / "research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original/profile-caps.json"
    caps_raw = caps_path.read_bytes()
    check(hashlib.sha256(caps_raw).hexdigest() == PROFILE_CAPS_SHA256, "profile-caps.json SHA-256 mismatch")
    caps = json.loads(caps_raw.decode("utf-8"), parse_float=F)

    sp = TARGETS["peak"]
    a, b, p0, rho0, c_iso = sp["a"], sp["b"], sp["p"], sp["rho"], sp["c_iso"]
    S_LO = F(13739535256614, 10**13)          # STATUS 3.14 lower bound on S
    LAMBDA_REM_CAP = F(1373953883, 10**9)     # STATUS 3.3 all-energy remote cap (< S_LO + 3.6e-7)
    check(LAMBDA_REM_CAP - S_LO == F(3573386, 10**13) < F(36, 10**8), "3.3 remote gap mismatch")

    one_p_r2 = 1 + rho0 * rho0
    sqrt_1pr2 = Iv(one_p_r2).sqrt()
    c_shell = c_iso * one_p_r2  # (6/25)*(1 + rho_0^2) = 0.3012787416

    # 1. Exact global content coefficients at s_A = 1/2 (valid at EVERY energy u >= 0!):
    # c_{1/2}(q) = c_{3/5}(q) + (1/10)*Pi_1[q*(j_0 - j(|q|^2))].
    # - By 11.2 (P, ch20): M(w) = E|L + w| is convex, radially nondecreasing, with j_0-Lipschitz gradient,
    #   so 0 <= j(v) <= j_0 for all v >= 0; centering j_0 - j(v) at j_0/2 gives ||(1/10)Pi_1[q(j_0-j)]|| <= (j_0/20) sqrt(u).
    # - By 11.30 (P + C): ||c_{3/5}(q)||_2 <= sqrt(19321/10^6) sqrt(u) = (139/1000) sqrt(u) for all u >= 0,
    #   and ||c_{3/5}(q)||_2 <= 1/50 on u <= 463/10000.
    # - By 7.1.4 + 7.1.6 (P + C): ||e(q)||_2 = ||c_B(q) - 0.5053 c_A(q)||_2 <= (7/2000) sqrt(u) for all u >= 0.
    check(F(139, 1000) ** 2 == F(19321, 10**6), "139^2 != 19321")
    j0_pk = j0_iv(a, b)
    half_j0_20_hi = (j0_pk / 40).hi  # j_0 = J_0 / 2 => j_0 / 20 = J_0 / 40
    check(half_j0_20_hi < F(179, 2500), "j_0 / 20 >= 179/2500")
    c12_lin_hi = F(139, 1000) + F(179, 2500)  # 1053/5000 = 0.2106
    check(c12_lin_hi == F(1053, 5000), "c12_lin_hi mismatch")
    alpha_lin_hi = (sqrt_1pr2 * c12_lin_hi + F(7, 2000)).hi  # < 0.23946
    check(alpha_lin_hi < F(12, 50), "alpha_lin_hi >= 0.24")

    # All-(V, W) quadratic gain coefficient: sup_{V >= 0} {2*alpha_lin*sqrt(u*V) - c_shell*V} = (alpha_lin^2 / c_shell) * u
    kappa_uncap_hi = (alpha_lin_hi * alpha_lin_hi) / c_shell
    check(kappa_uncap_hi < F(191, 1000), "kappa_uncap_hi >= 191/1000")

    # 2. Corollary (i) — Low remote energy, ALL (V, W) in [0, inf)^2:
    # (a) Pure 3.3 + 7.5.13/KAST (no moment polynomial needed on high-V branch):
    #     For 0 <= u <= 11/500 = 0.022 and V >= V_cap - u (V_cap = 80051/10^6):
    #     sqrt(V_*) = alpha_lin * sqrt(u) / c_shell < sqrt(V_cap - u), so 2*alpha_lin*sqrt(u*V) - c_shell*V
    #     is strictly decreasing in V >= V_cap - u, and at u = 11/500, V = V_cap - 11/500:
    V_cap = F(80051, 10**6)
    u_low_pure = F(11, 500)
    V_bdy_pure = V_cap - u_low_pure
    check((alpha_lin_hi / c_shell) ** 2 * u_low_pure < V_bdy_pure, "low-u pure vertex not below V_cap - u")
    gain_pure_hi = 2 * alpha_lin_hi * Iv(u_low_pure * V_bdy_pure).sqrt().hi - c_shell * V_bdy_pure
    check(LAMBDA_REM_CAP + gain_pure_hi < S_LO, "0 <= u <= 11/500 all-V pure-3.3 check failed")

    # (b) With moment-boxes.json + 3.4 moments (STATUS 3.3, 7.2.11, Lean C_6 = 4045313/100000, chi <= 42):
    #     Verify 0 <= u <= 23/1000 = 0.023, ALL (V, W) in [0, inf)^2 has Lambda_hat(G) < S_LO!
    mb_path = repo_root / "research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original/moment-boxes.json"
    mb_raw = mb_path.read_bytes()
    check(hashlib.sha256(mb_raw).hexdigest() == MOMENT_BOXES_SHA256, "moment-boxes.json SHA-256 mismatch")
    mb_rows = json.loads(mb_raw.decode("utf-8"), parse_float=F)

    C6 = F(4045313, 100000)
    u_low_ext = F(23, 1000)
    x_cap = F(31, 4)
    check(x_cap * x_cap > F(42), "moment-boxes x_cap^2 <= 42")
    clipped_boxes = []
    area_low = F(0)
    for row in mb_rows:
        ra, rb, rc, rd = (F(z) for z in row["box"])
        check(0 <= ra < rb <= F(3, 20) and 0 <= rc < rd <= x_cap, "moment-boxes invalid rectangle")
        P = [F(c) for c in row["coefficients"]]
        check(len(P) == 4 and P[3] > 0, "invalid moment-box Hermite cubic")
        if ra >= u_low_ext:
            continue
        rb_clip = min(rb, u_low_ext)
        for oa, ob, oc, od in clipped_boxes:
            check(max(ra, oa) >= min(rb_clip, ob) or max(rc, oc) >= min(rd, od), "overlapping moment-boxes")
        clipped_boxes.append((ra, rb_clip, rc, rd))
        area_low += (rb_clip - ra) * (rd - rc)
        n_sub = max(1, int(((rb_clip - ra) * 2000).__ceil__()))
        step = (rb_clip - ra) / n_sub
        for k in range(n_sub):
            ul = ra + k * step
            ur = ra + (k + 1) * step
            # Since P[3]*C6*u^3 >= 0, M(u, x) = A_0(u) + A_2(u)*x^2 + A_3(u)*x^3 has dM/dx = x*(2*A_2 + 3*A_3*x),
            # which can only change sign from - to + on x >= 0 (quasiconvex on [rc, rd]), so max_{x in [rc, rd]} is at {rc, rd}:
            lam_q_hi = max(
                max(bernstein_1d([P[0], P[1] - p0, P[2] * (2 + x * x), P[3] * (6 + 9 * x * x + C6 * x * x * x)], ul, ur))
                for x in (rc, rd)
            )
            V_lo = V_cap - ur
            check((alpha_lin_hi / c_shell) ** 2 * ur < V_lo, "vertex check failed on sub-slab")
            sh_hi = 2 * alpha_lin_hi * Iv(ur * V_lo).sqrt().hi - c_shell * V_lo
            check(lam_q_hi + sh_hi < S_LO, f"low-u 0.023 check failed on [{fmt_dec(ul)}, {fmt_dec(ur)}]")
    check(area_low == u_low_ext * x_cap, "moment-boxes failed to partition [0, 23/1000] x [0, 31/4]")

    cells = caps["cells"]
    last_b = F(0)
    for cell in cells:
        ca, cb = F(cell["interval"][0]), F(cell["interval"][1])
        check(ca == last_b and cb > ca, "profile-caps.json cell discontinuity")
        last_b = cb
        P = [F(c) for c in cell["coefficients"]]
        check(len(P) == 4 and P[3] > 0, "invalid profile cap cubic")
    check(last_b == F(2), "profile-caps.json did not end at 2")

    # 3. Corollary (ii) — Full Peak response band 0 <= u <= 463/10000 = 0.0463, large shell energy V:
    u_band = F(463, 10000)
    sqrt_u_band_hi = Iv(u_band).sqrt().hi
    j_shift_band_hi = half_j0_20_hi * sqrt_u_band_hi
    e_band_hi = F(7, 2000) * sqrt_u_band_hi

    # (a) Pure 3.3 + 11.30 (||c_{3/5}|| <= 1/50, zero 11.61 dependency): V >= 181/2500 = 0.0724
    A_band_pure_hi = (sqrt_1pr2 * (F(1, 50) + j_shift_band_hi) + e_band_hi).hi
    V_cut_pure = F(181, 2500)
    check(A_band_pure_hi / c_shell < Iv(V_cut_pure).sqrt().lo, "pure band V vertex check")
    check(
        LAMBDA_REM_CAP + 2 * A_band_pure_hi * Iv(V_cut_pure).sqrt().hi - c_shell * V_cut_pure < S_LO,
        "pure band V >= 181/2500 check failed",
    )

    # (b) With 11.61 on u in [11/500, 463/10000] subset [2/125, 463/10000] (126 reviewed Stein boxes, ZERO exempt boxes!):
    #     For u in [0, 11/500], ALL V >= 0 is already < S_LO by Corollary (i)(a) above!
    #     For u in [11/500, 463/10000] and V >= V_cut_1161 = 1/16 = 0.0625:
    #     - Case D(q) <= 0: Lambda(q) <= LAMBDA_REM_CAP and ||c_{3/5}|| <= sqrt(6e-6).
    #     - Case D(q) >= D_cap := ((1/50)^2 - 6e-6)/(7/25) = 197/140000: ||c_{3/5}|| <= 1/50 and Lambda(q) <= S - D_cap.
    #     - Case 0 < D(q) < D_cap: f(D) := -D + 2*sqrt(1+rho_0^2)*sqrt(V)*sqrt((7/25)D + 6e-6) has
    #       f'(D) = -1 + (7/25)*sqrt(1+rho_0^2)*sqrt(V) / sqrt((7/25)D + 6e-6) >= -1 + (7/25)*sqrt(1+rho_0^2)*sqrt(V)/(1/50) > 0
    #       across ALL D in [0, D_cap] whenever V >= 1/16, so max_{D in [0, D_cap]} f(D) = f(D_cap)!
    V_cut_1161 = F(1, 16)
    sqrt_V_1161 = Iv(V_cut_1161).sqrt()
    D_cap = (F(1, 2500) - F(6, 10**6)) / F(7, 25)
    check(D_cap == F(197, 140000), "D_cap mismatch")
    # Check D <= 0 branch:
    A_d_neg_hi = (sqrt_1pr2 * (Iv(F(6, 10**6)).sqrt().hi + j_shift_band_hi) + e_band_hi).hi
    check(A_d_neg_hi / c_shell < sqrt_V_1161.lo, "11.61 D<=0 vertex check")
    check(
        LAMBDA_REM_CAP + 2 * A_d_neg_hi * sqrt_V_1161.hi - c_shell * V_cut_1161 < S_LO,
        "11.61 D<=0 check failed at V=1/16",
    )
    # Check f'(D) > 0 on [0, D_cap] (i.e. (7/25)*sqrt(1+rho0^2)*sqrt(V) > 1/50):
    check(F(7, 25) * sqrt_1pr2.lo * sqrt_V_1161.lo > F(1, 50), "11.61 monotonicity in D on [0, D_cap] failed")
    # Check D >= D_cap (including max of [0, D_cap] at D = D_cap):
    check(
        -D_cap + 2 * A_band_pure_hi * sqrt_V_1161.hi - c_shell * V_cut_1161 < 0,
        "11.61 D >= D_cap check failed at V=1/16",
    )

    # 4. Corollary (iii) — High remote energy u >= 121/200 = 0.605, ALL (V, W) in [0, inf)^2:
    # By Jensen concavity of phi(v) = 2 E_{z_1}|L + sqrt(v)| (STATUS 2.7, 11.50: phi'' <= 0 on (0, inf)),
    # 2 E|L + q| = E[phi(|q|^2)] <= phi(u) for EVERY remote cubic q (in fact every L^2 q with Pi_1 q = 0)!
    # Hence Lambda_hat(G) <= phi(u) - (p_0 - kappa_uncap_hi)*u < S_LO across u in [121/200, 2] (Bernstein on
    # profile-caps.json cells) and on u in [2, inf) (global affine tangent cap c_0 + c_1*u)!
    u_hi_cut = F(121, 200)
    p_net = p0 - kappa_uncap_hi
    for cell in cells:
        ca, cb = F(cell["interval"][0]), F(cell["interval"][1])
        if cb <= u_hi_cut:
            continue
        ul = max(ca, u_hi_cut)
        P = [F(c) for c in cell["coefficients"]]
        b_ctrl = bernstein_1d([P[0], P[1] - p_net, P[2], P[3]], ul, cb)
        check(max(b_ctrl) < S_LO, f"high-u check failed on [{fmt_dec(ul)}, {fmt_dec(cb)}]: {fmt_dec(max(b_ctrl))}")
    c0_tail, c1_tail = F(caps["tail"][0]), F(caps["tail"][1])
    check(c1_tail - p_net < 0, "high-u affine tail slope non-negative")
    check(c0_tail + 2 * (c1_tail - p_net) < S_LO, "high-u affine tail value at u=2 >= S_LO")

    return {
        "alpha_lin_hi": fmt_dec(alpha_lin_hi),
        "kappa_uncap_hi": fmt_dec(kappa_uncap_hi),
        "low_u_all_VW_pure_3_3_max": "11/500",
        "low_u_all_VW_with_moments_max": "23/1000",
        "band_u_0_0463_V_min_exempt_free": "1/16",
        "band_u_0_0463_V_min_no_11_61": "181/2500",
        "high_u_all_VW_min": "121/200",
    }


def verify_lower_central_obstructions(repo_root: Path, obs_data: dict, expected_cpp_sha: str, check_hash: bool = True) -> dict:
    """Verify exact obstructions on Rows 1-2 (zero-core odd) and Rows 3-4 (O_{sec,im}(29/64) > 125/94)."""
    cert_path = repo_root / "research/conjecture-K/code/exterior-94-125-gemini-9a4e/central_94_125_certificate.json"
    cert_raw = cert_path.read_bytes()
    check(hashlib.sha256(cert_raw).hexdigest() == CENTRAL_94_125_SHA256, "central_94_125_certificate.json SHA-256 mismatch")
    cert = json.loads(cert_raw.decode("utf-8"), parse_float=F)
    rows = cert["eps_94_125"]["rows"]
    p_94_125 = F(125, 94)

    # Cross-check row6 and row7 parameters against central_94_125_certificate.json:
    for tname in ("row6", "row7"):
        sp = TARGETS[tname]
        rw = rows[sp["row_idx0"]]
        check(F(rw["epsilon"]) == F(94, 125), f"{tname}: epsilon != 94/125")
        check(F(rw["lo"]) == sp["lo"] and F(rw["hi"]) == sp["hi"], f"{tname}: interval mismatch")
        bi = F(rw["beta"])
        ai = F(rw["ell"]) - 2 * bi
        check(ai == sp["a"] and bi == sp["b"], f"{tname}: (a, b) mismatch vs central_94_125_certificate.json")

    # 1. Rows 1 & 2 zero-core odd obstruction (220-bit zero-float): J_1(a_i, b_i) > 125/94!
    # At (q, A, B) = (0, 0, 0), taking P = 0, nu = 0 and any remote Q in H_{1,1} with E|Q|^2 = 1 gives
    # c* = 0, C(Q, nu) = 0, and E[R_joint(L, 0, z_1 Q)] = J_1(a_i, b_i) > 125/94 = p!
    zcore = {}
    for idx in (0, 1):
        rw = rows[idx]
        bi = F(rw["beta"])
        ai = F(rw["ell"]) - 2 * bi
        j0 = j0_iv(ai, bi)
        j1 = (SQRT_PI - ai * j0) / bi
        check(j1.lo > p_94_125, f"Row {idx + 1} J_1.lo <= 125/94")
        zcore[f"row{idx + 1}_J1_lo"] = fmt_dec(j1.lo)

    # 2. Rows 3 & 4 secant odd obstruction at exact dyadic w_0 = 29/64 from `cert_obstructions.json`:
    if check_hash:
        check(obs_data.get("cpp_sha256") == expected_cpp_sha, "cert_obstructions.json cpp_sha256 mismatch")
    check(obs_data.get("format") == "uncapped-obstructions-v1", "cert_obstructions.json bad format")
    check(parse_hex(obs_data["w0"]) == F(29, 64) and parse_hex(obs_data["w0_hex"]) == F(29, 64), "bad w0")
    check(parse_hex(obs_data["r_cut"]) == F(25), "bad r_cut")
    check(obs_data.get("unit_vec") == ["4/5", "3/5", "0"], "bad unit_vec")
    obs_rows = obs_data.get("rows", [])
    check(isinstance(obs_rows, list) and len(obs_rows) == 2, "expected 2 obstruction rows")

    u0, u1 = F(4, 5), F(3, 5)
    check(u0 * u0 + u1 * u1 == F(1), "u is not unit vector")
    osec = {}
    for r_entry, expected_idx0 in zip(obs_rows, (2, 3)):
        rw = rows[expected_idx0]
        bi = F(rw["beta"])
        ai = F(rw["ell"]) - 2 * bi
        check(r_entry["row_index_1based"] == expected_idx0 + 1, "obstruction row index mismatch")
        check(F(r_entry["lo"]) == F(rw["lo"]) and F(r_entry["hi"]) == F(rw["hi"]), "obstruction interval mismatch")
        check(parse_hex(r_entry["a"]) == ai and parse_hex(r_entry["b"]) == bi, "obstruction (a, b) mismatch")
        check(parse_hex(r_entry["p"]) == p_94_125, "obstruction p mismatch")
        m_im = [parse_iv(x) for x in r_entry["M0_im_0_25"]]
        check(len(m_im) == 6, "obstruction M0_im_0_25 length != 6")
        # Since u0 = 4/5 > 0 and u1 = 3/5 > 0, exact minimum of u0^2 M00 + 2 u0 u1 M01 + u1^2 M11 over the interval box:
        ray_lo = u0 * u0 * m_im[0][0] + 2 * u0 * u1 * m_im[1][0] + u1 * u1 * m_im[3][0]
        ray_rep_lo, ray_rep_hi = parse_iv(r_entry["rayleigh_4_5_3_5"])
        check(ray_rep_lo <= ray_lo <= ray_rep_hi, "reported Rayleigh interval inconsistent")
        check(ray_lo > p_94_125 + F(1, 50), f"Row {expected_idx0 + 1} Rayleigh lower bound <= p + 0.02")
        osec[f"row{expected_idx0 + 1}_osec_29_64_lo"] = fmt_dec(ray_lo)

    return {**zcore, **osec, "p_94_125": fmt_dec(p_94_125)}


# ============================================================================
# 7. Master Verification Entrypoint & CLI
# ============================================================================
def verify_bundle(code_dir: Path, repo_root: Path, check_cpp_hash: bool = True) -> dict:
    cpp_path = code_dir / "certify_uncapped_offpeak.cpp"
    check(cpp_path.is_file(), f"missing C++ source {cpp_path}")
    cpp_bytes = cpp_path.read_bytes()
    cpp_text = cpp_bytes.decode("utf-8")
    check("#ifdef NDEBUG" in cpp_text and "#error" in cpp_text, "missing compile-time #ifdef NDEBUG guard in C++")
    cpp_sha = hashlib.sha256(cpp_bytes).hexdigest()

    check_symbolic_lemmas()

    foundations = {}
    certs_summary = {}
    for name, sp in TARGETS.items():
        foundations[name] = check_target_foundations(name, sp)
        cpath = code_dir / sp["cert_file"]
        check(cpath.is_file(), f"missing certificate {cpath}")
        check(cpath.stat().st_size < 300000, f"{cpath.name} exceeds 300,000 B limit")
        cdata = json.loads(cpath.read_text(encoding="utf-8"), parse_float=F)
        certs_summary[name] = verify_single_target_cert(name, sp, cdata, cpp_sha, check_hash=check_cpp_hash)

    obs_path = code_dir / "cert_obstructions.json"
    check(obs_path.is_file(), f"missing {obs_path}")
    check(obs_path.stat().st_size < 300000, "cert_obstructions.json exceeds 300,000 B limit")
    obs_data = json.loads(obs_path.read_text(encoding="utf-8"), parse_float=F)
    obstructions = verify_lower_central_obstructions(repo_root, obs_data, cpp_sha, check_hash=check_cpp_hash)
    corollaries = verify_peak_corollaries(repo_root)

    return {
        "cpp_sha256": cpp_sha,
        "foundations": foundations,
        "certificates": certs_summary,
        "peak_uncapped_corollaries": corollaries,
        "lower_central_obstructions": obstructions,
    }


def main() -> None:
    here = Path(__file__).resolve().parent
    default_root = here.parents[3]
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--code-dir", type=Path, default=here)
    parser.add_argument("--repo-root", type=Path, default=default_root)
    parser.add_argument("--foundations-only", action="store_true")
    parser.add_argument("--replay-cpp", action="store_true")
    parser.add_argument("--quiet", action="store_true")
    args = parser.parse_args()

    if args.foundations_only:
        check_symbolic_lemmas()
        fnd = {name: check_target_foundations(name, sp) for name, sp in TARGETS.items()}
        cor = verify_peak_corollaries(args.repo_root)
        if not args.quiet:
            print(json.dumps({"foundations": fnd, "peak_uncapped_corollaries": cor}, indent=2))
            print("FOUNDATIONS & PEAK COROLLARIES PASS (zero-float, zero-assert)")
        return

    if args.replay_cpp:
        cxx = shutil.which("clang++") or shutil.which("g++")
        check(cxx is not None, "no C++17 compiler (clang++ or g++) found for --replay-cpp")
        cpp_path = args.code_dir / "certify_uncapped_offpeak.cpp"
        cpp_sha = hashlib.sha256(cpp_path.read_bytes()).hexdigest()
        with tempfile.TemporaryDirectory() as td:
            td_path = Path(td)
            exe = td_path / "certify_uncapped_offpeak"
            subprocess.run(
                [
                    cxx,
                    "-O2",
                    "-ffp-contract=off",
                    "-frounding-math",
                    "-std=c++17",
                    "-pthread",
                    "-Wall",
                    "-Wextra",
                    "-Werror",
                    str(cpp_path),
                    "-o",
                    str(exe),
                ],
                check=True,
            )
            subprocess.run([str(exe), "--all", "--control-false-hotspot"], check=True)
            subprocess.run([str(exe), "--all", "--out-dir", str(td_path)], check=True)
            shutil.copy2(cpp_path, td_path / "certify_uncapped_offpeak.cpp")
            for fn in ("cert_peak.json", "cert_row7.json", "cert_row6.json", "cert_obstructions.json"):
                p = td_path / fn
                txt = p.read_text(encoding="utf-8")
                txt = '{"cpp_sha256":"' + cpp_sha + '",' + txt[1:]
                p.write_text(txt, encoding="utf-8")
            summary = verify_bundle(td_path, args.repo_root, check_cpp_hash=True)
            if not args.quiet:
                print(json.dumps(summary, indent=2))
                print("FULL C++ REPLAY & ZERO-FLOAT AUDIT PASSED!")
            return

    summary = verify_bundle(args.code_dir, args.repo_root, check_cpp_hash=True)
    if not args.quiet:
        print(json.dumps(summary, indent=2))
        print("ALL CHECKS PASSED: Uncapped & Off-Peak Six-Sector Closure + Obstructions certified!")


if __name__ == "__main__":
    main()
