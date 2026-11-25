#!/usr/bin/env python3
"""Self-contained zero-float exact rational verifier for raw Conjecture K joint A/B bounds.

Agent-ID: gemini-4c4c. Closes #706, Refs #177.
Run with: python3 -I research/conjecture-K/code/raw-joint-ab-gemini-4c4c/verify.py [--replay-cpp]

Verifies in pure Python 3 standard-library exact Fraction arithmetic (zero floating-point
operations in acceptance):
  1. Source integrity: SHA-256 of certify_raw_joint_ab.cpp and compile-time -DNDEBUG guard.
  2. Exact row definitions (peak, flank, upper) matching STATUS.md §0, linear envelope
     M(T) = 1 + (5/4)T >= sqrt((T-1)^2 + T^2/2), and r >= 25 tail bound < 10^-9 * S_0.
  3. Self-contained zero-float exact rational proof of Shift Exterior |x| >= 29/10 at all
     three rows and all amplitudes: r_x(alpha, beta) <= (187/200)*S_0 < min(Q_diag, Q_{s,+}).
  4. Self-contained zero-float exact rational proof of Amplitude Exterior ||v||_inf >= 4 at
     all shifts x in C and all three rows: orthonormal Bessel inequality on {T-1, z_1^2/sqrt(2), zbar_1^2/sqrt(2)}
     gives r_x(alpha, beta) < (94/25)*sqrt(S_0) <= (47/50)*S_0 < min(Q_diag, Q_{s,+}).
  5. Part 1 (continuous rational-secant origin matrices on [0, 3]): contiguous dyadic slab
     coverage overlapping [29/10, 3] and exact rational Sylvester PSD of Q_{s,+} - K_re/im
     and Q_diag - K_re/im across every slab of every row.
  6. Part 2 (global shift curvature 680): 16 * cap_max * mass_sum < 680^2 plus exact rational
     verification of the T >= 36 and T >= 25 tail coefficients.
  7. Part 3 (3D ray-convexity cube shells on [0, 3]): contiguous dyadic slab coverage,
     exact ray-convexity discriminant ((rho - 1)/(rho + 1))^2 <= eta, inner handoff
     2*r_0 <= s_0(x) to Part 1, outer handoff r_M == 4 to the Amplitude Exterior, exact
     integer shell count over DEN = 262144, open_boxes == 0, worst_S < 0, worst_D < 0.
  8. Exact rational assembly corollaries for STATUS.md 7.4.2 (upgrading the sufficient raw
     A-content constant for unrestricted diagonal A+B gain at peak from 0.15 to 11/50 = 0.22,
     and improving the signed Q_{s,+} excess bound without amplitude or Gaussian caps).
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

if not __debug__:
    raise RuntimeError("Assertions are required; do not run with python -O.")
sys.dont_write_bytecode = True

EXPECTED_CPP_SHA256 = "2612df3565e2a457f561b7886dd620898796119c3ae326a8c731511e4b782a20"

EXPECTED_ROWS = {
    "peak": {
        "a": (699, 1250),
        "b": (179, 1250),
        "eps": (1891, 2500),
        "kappa_diag": (7, 25),
        "B_density_cap": F(7, 25),
        "zero_core_obstruction_hi": F(298365, 1000000),
    },
    "flank": {
        "a": (14, 25),
        "b": (1467, 10000),
        "eps": (149, 200),
        "kappa_diag": (3, 10),
        "B_density_cap": F(11, 40),
        "zero_core_obstruction_hi": F(323153, 1000000),
    },
    "upper": {
        "a": (573, 1000),
        "b": (19, 125),
        "eps": (1891, 2500),
        "kappa_diag": (31, 100),
        "B_density_cap": F(13, 50),
        "zero_core_obstruction_hi": F(327716, 1000000),
    },
}

SHELL_DEN = 262144  # 2^18


def parse_hexfloat(s: str) -> F:
    """Parse an exact C++ std::hexfloat string into a Fraction with zero float operations."""
    if not isinstance(s, str):
        raise ValueError(f"Expected hexfloat string, got {type(s)!r}")
    t = s.strip().lower()
    sign = -1 if t.startswith("-") else 1
    if t.startswith(("+", "-")):
        t = t[1:]
    if not t.startswith("0x") or "p" not in t:
        raise ValueError(f"Malformed hexfloat: {s!r}")
    mant_str, exp_str = t[2:].split("p", 1)
    exp = int(exp_str, 10)
    if "." in mant_str:
        int_hex, frac_hex = mant_str.split(".", 1)
    else:
        int_hex, frac_hex = mant_str, ""
    digits = int_hex + frac_hex
    if not digits:
        raise ValueError(f"Empty mantissa in hexfloat: {s!r}")
    mant = int(digits, 16)
    if mant == 0:
        return F(0)
    shift = exp - 4 * len(frac_hex)
    val = F(mant << shift, 1) if shift >= 0 else F(mant, 1 << (-shift))
    return -val if sign < 0 else val


def parse_iv(pair) -> tuple[F, F]:
    if not (isinstance(pair, list) and len(pair) == 2):
        raise ValueError(f"Expected 2-element interval list, got {pair!r}")
    lo, hi = parse_hexfloat(pair[0]), parse_hexfloat(pair[1])
    if lo > hi:
        raise ValueError(f"Inverted interval [{lo}, {hi}]")
    return lo, hi


BITS = 220
SCALE = 1 << BITS


class Interval:
    """Outward-rounded dyadic rational interval arithmetic (zero floats)."""

    def __init__(self, lo, hi=None):
        lo_f = F(lo)
        hi_f = F(lo_f if hi is None else hi)
        assert lo_f <= hi_f, f"Inverted rational interval: {lo_f} > {hi_f}"
        self.lo = F((lo_f * SCALE).__floor__(), SCALE)
        self.hi = F((hi_f * SCALE).__ceil__(), SCALE)

    @staticmethod
    def lift(x):
        return x if isinstance(x, Interval) else Interval(x)

    def __add__(self, x):
        x = self.lift(x)
        return Interval(self.lo + x.lo, self.hi + x.hi)

    __radd__ = __add__

    def __neg__(self):
        return Interval(-self.hi, -self.lo)

    def __sub__(self, x):
        return self + (-self.lift(x))

    def __rsub__(self, x):
        return self.lift(x) + (-self)

    def __mul__(self, x):
        x = self.lift(x)
        ends = [self.lo * x.lo, self.lo * x.hi, self.hi * x.lo, self.hi * x.hi]
        return Interval(min(ends), max(ends))

    __rmul__ = __mul__

    def __truediv__(self, x):
        x = self.lift(x)
        assert x.lo > 0 or x.hi < 0
        return self * Interval(F(1) / x.hi, F(1) / x.lo)

    def sqrt(self):
        assert self.lo >= 0
        low = isqrt(self.lo.numerator * SCALE * SCALE // self.lo.denominator)
        high = isqrt(self.hi.numerator * SCALE * SCALE // self.hi.denominator) + 1
        return Interval(F(low, SCALE), F(high, SCALE))


def exp_pos(r: F, terms: int = 160) -> Interval:
    assert F(0) <= r < F(terms)
    total = sum(r**k / F(factorial(k)) for k in range(terms))
    first = r**terms / F(factorial(terms))
    rem = first / (F(1) - r / F(terms + 1))
    return Interval(total, total + rem)


def inv_exp(r: F, terms: int = 160) -> Interval:
    return Interval(1) / exp_pos(r, terms=terms)


def bernstein_controls(poly: list[F], left: F, right: F) -> list[F]:
    n = len(poly) - 1
    shifted = [
        sum(poly[k] * comb(k, j) * left ** (k - j) * (right - left) ** j for k in range(j, n + 1))
        for j in range(n + 1)
    ]
    return [
        sum(shifted[j] * F(comb(i, j), comb(n, j)) for j in range(i + 1))
        for i in range(n + 1)
    ]


def angular_upper(z: F, count: int = 24) -> F:
    assert F(0) <= z < F(1)
    coeffs = [F(comb(2 * k, k) ** 2, 16**k) for k in range(count + 1)]
    out = coeffs[-1] / (F(1) - z)
    for c in reversed(coeffs[:-1]):
        out = c + z * out
    return out


def verify_exteriors_and_helpers() -> dict:
    """Prove |x| >= 29/10 and ||v||_inf >= 4 exteriors and global algebraic bounds in exact Q."""
    # 1. M(T) = 1 + (5/4)T >= sqrt((T - 1)^2 + T^2 / 2):
    # M(T)^2 - ((T - 1)^2 + T^2 / 2) = (1 + 5/2 T + 25/16 T^2) - (1 - 2 T + 3/2 T^2) = 9/2 T + 1/16 T^2 >= 0.
    assert F(5, 2) - F(-2, 1) == F(9, 2)
    assert F(25, 16) - F(3, 2) == F(1, 16)

    # 2. r_cut = 25, w_max = 3 => |y| >= 22, and (1354/25) * e^{-25} < 10^-9:
    e25_inv = inv_exp(F(25), terms=120)
    tail_25 = F(1354, 25) * e25_inv.hi
    assert tail_25 < F(1, 10**9)

    # 3. Amplitude exterior ||v||_inf >= 4 (all x = w >= 0, hence all x in C by U(1) gauge):
    # {e_A = T - 1, e_B = z_1^2/sqrt(2), e_C = zbar_1^2/sqrt(2)} are orthonormal in L^2(z_1), so:
    #   (i)  2 E|h| <= 2 sqrt(E|h|^2) = 2 sqrt(S_0),
    #   (ii) for phi = ph(L + w) (|phi| <= 1, conj(phi(zbar_1)) = phi(z_1)), |<phi, e_C>| = |<phi, e_B>| = |c_2|,
    #        so Bessel gives |c_1|^2 + 2|c_2|^2 <= 1, while |c_1| <= E|T - 1| = 2/e < 1440/1957 (e > 1957/720).
    #        Hence |c_1|^2 + |c_2|^2 <= 1/2 + |c_1|^2 / 2 < 1/2 + 2/(1957/720)^2 < (22/25)^2,
    #        giving r_w(alpha, beta) < (2 + 44/25)*sqrt(S_0) = (94/25)*sqrt(S_0).
    # For ||v||_inf >= 4, sqrt(S_0) = ||v||_2 >= ||v||_inf >= 4, so r_w(alpha, beta) < (47/50)*S_0!
    e_lo = sum(F(1, factorial(k)) for k in range(7))
    assert e_lo == F(1957, 720)
    bessel_sq_hi = F(1, 2) + F(2) / (e_lo * e_lo)
    assert bessel_sq_hi < F(22, 25) ** 2
    amp_ext_coeff = F(47, 50)
    potential_cap = F(187, 200)
    max_ext_cap = max(amp_ext_coeff, potential_cap)  # 47/50 = 0.94

    # 4. Shift exterior |x| >= 29/10 at all three rows (all amplitudes):
    cells, count, cutoff, split = 200, 24, F(29, 10), F(97, 20)
    masses = [(F(3, 2) * (split * j / cells) ** 2 + (split * j / cells) + 2) * inv_exp(split * j / cells)
              for j in range(cells + 1)]
    ext_rows = {}
    for name, spec in EXPECTED_ROWS.items():
        a = F(*spec["a"])
        b = F(*spec["b"])
        eps = F(*spec["eps"])
        kd = F(*spec["kappa_diag"])
        p = F(1) / eps
        dcap = spec["B_density_cap"]

        # Verify kd lies strictly below the sharp zero-core obstruction of 7.4.9:
        assert kd < spec["zero_core_obstruction_hi"]

        # Verify H(25) = 25*(a + 25*b)^2 < 22^2 = 484:
        assert F(25) * (a + F(25) * b) ** 2 < F(484)

        # Degree-18 Bernstein verification of B-shell radial density cap on [0, 2]:
        poly = [F(0)] * 19
        for i, c in enumerate([a * a, 4 * a * b, 3 * b * b]):
            for k in range(17):
                poly[i + k] += 2 * dcap * c / F(factorial(k))
        poly[2] -= F(1)
        for j in range(2):
            ctrl = bernstein_controls(poly, F(j), F(j + 1))
            assert all(v > F(1003, 100000) for v in ctrl)

        # 200-cell angular series on [0, 97/20] + bathtub tail on [97/20, inf):
        max_z = split * (a + b * split) ** 2 / (cutoff * cutoff)
        assert max_z < F(1)
        inner = Interval(0)
        for j in range(cells):
            hi = split * (j + 1) / cells
            z = hi * (a + b * hi) ** 2 / (cutoff * cutoff)
            dm = masses[j] - masses[j + 1]
            assert dm.lo > 0
            inner = inner + dm * angular_upper(z, count) / cutoff
        tail_dens = inv_exp(split) * (F(3, 2) * split * split - 2 * split + 1) / ((a + b * split) * (a + 3 * b * split))
        outer = F(2) * (masses[-1] * tail_dens).sqrt()
        pot = inner + outer
        assert pot.hi < potential_cap

        # Dominates BOTH Target D and Target S (Q_{s,+} = Q_s - (1/100)*S_0) on |x| >= 29/10 and ||v||_inf >= 4:
        qd_margin = (p - kd) - max_ext_cap
        assert qd_margin > F(7, 100)
        qs_d00 = (p - F(25, 100)) - max_ext_cap
        qs_d11 = (p - F(27, 100)) - max_ext_cap
        qs_d01 = F(59, 500)
        assert qs_d00 > 0 and qs_d11 > 0 and qs_d00 * qs_d11 > qs_d01 * qs_d01

        # Part 2 exact rational tail coefficients (T >= 36 and T >= 25):
        q_fac, m36, tt36, M36 = F(5, 2), F(19, 18), F(36), F(23, 18)
        assert F(1, 36) + F(5, 4) == M36
        assert F(1) + b / (a + b * tt36) + 3 * b / (a + 3 * b * tt36) <= m36
        coeff36 = (
            F(14) * M36 * q_fac / (tt36 * tt36)
            + F(8, 3) * M36 * m36 * q_fac / tt36
            + F(1, 2) * ((m36 * m36 + F(2) / (tt36 * tt36)) * F(4, 9) + F(2) * m36 / (F(3) * tt36)) * (M36 * M36)
        )
        assert coeff36 < F(1)

        m25, tt25, M25 = F(27, 25), F(25), F(33, 25)
        assert F(1, 25) + F(5, 4) < M25
        assert F(1) + b / (a + b * tt25) + 3 * b / (a + 3 * b * tt25) <= m25
        coeff25 = (
            F(9) / (tt25 * tt25)
            + F(4) * m25 * q_fac / (F(3) * tt25)
            + ((m25 * m25 + F(2) / (tt25 * tt25)) * F(4) / (F(9) * tt25) + F(2) * m25 / (F(3) * tt25 * tt25)) * (M25 * tt25)
        )
        assert coeff25 < F(2)

        ext_rows[name] = {
            "potential_hi_num_approx": str(pot.hi.numerator * 10**6 // pot.hi.denominator),
            "qd_tail_margin": str(qd_margin),
        }
    return ext_rows


def check_2x2_psd_strict(q00: F, q01: F, q11: F, block: list) -> F:
    """Verify Q - K > 0 strictly on 2x2 symmetric block in exact Fraction arithmetic; return det/(tr)."""
    if not (isinstance(block, list) and len(block) == 6):
        raise ValueError(f"Expected 6-element Sym2 hexfloat array, got {block!r}")
    k00_lo, k00_hi = parse_iv([block[0], block[1]])
    k01_lo, k01_hi = parse_iv([block[2], block[3]])
    k11_lo, k11_hi = parse_iv([block[4], block[5]])
    assert k00_lo >= 0 and k11_lo >= 0
    d00 = q00 - k00_hi
    d11 = q11 - k11_hi
    off_max = max(abs(q01 - k01_lo), abs(q01 - k01_hi))
    if not (d00 > 0 and d11 > 0):
        raise AssertionError(f"Non-positive diagonal in Q - K: d00={d00}, d11={d11}")
    det_lo = d00 * d11 - off_max * off_max
    if not (det_lo > 0):
        raise AssertionError(f"Non-positive determinant in Q - K: det_lo={det_lo}")
    return det_lo / (d00 + d11)


def expected_shell_count(r0_num: int, rho_num: int, rho_den: int, r_end_num: int) -> int:
    assert 0 < r0_num < r_end_num
    assert rho_num > rho_den > 0
    cur = r0_num
    cnt = 1
    while cur < r_end_num:
        nxt = (cur * rho_num) // rho_den
        if nxt <= cur:
            raise AssertionError(f"Stalled shell progression at cur={cur}, rho={rho_num}/{rho_den}")
        if nxt >= r_end_num:
            nxt = r_end_num
        cnt += 1
        cur = nxt
    return cnt


def verify_assembly_corollaries() -> dict:
    """Prove exact rational corollaries upgrading STATUS.md 7.4.2 at the peak row."""
    # Peak centered alignment (7.1.6): ||c_B - rho * c_A|| <= err * sqrt(u), rho = 5053/10000, err = 7/2000, u <= 463/10000.
    rho = F(5053, 10000)
    err = F(7, 2000)
    u_max = F(463, 10000)

    # For quadratic cost [[kA, m], [m, kB]] and C = ||c_A||, ||c_B|| <= rho*C + e (m = 0) or d = c_B = rho*c_A + delta_v:
    # By 7.4.1: gain(c_A, c_B) = ||c_A||^2 / kA + ||c_B - (m/kA)*c_A||^2 / (kB - m^2/kA).
    # Writing c_B - (m/kA)*c_A = (rho - m/kA)*c_A + delta_v with ||delta_v|| <= err*sqrt(u):
    # ||(rho - m/kA)*c_A + delta_v|| <= |rho - m/kA|*C + err*sqrt(u).
    # Under C^2 <= gamma * D (so D >= C^2 / gamma), gain - D <= A_coeff * C^2 + B_coeff * C * sqrt(u) + C_coeff * u,
    # where D_schur = kB - m^2 / kA > 0, lam = rho - m / kA,
    #   A_coeff = 1/kA + lam^2 / D_schur - 1/gamma,
    #   B_coeff = 2 * |lam| * err / D_schur,
    #   C_coeff = err^2 / D_schur.
    # Whenever A_coeff < 0, max_{C >= 0} (A_coeff * C^2 + B_coeff * C * sqrt(u) + C_coeff * u)
    #   = (C_coeff - B_coeff^2 / (4 * A_coeff)) * u, increasing in u, maximized at u = u_max!

    # Case 1: Global Target S (Q_{s,+} = Q_s - (1/100)*S_0 => kA = 1/4, kB = 27/100, m = +59/500) with gamma = 6/25 = 0.24:
    kA_S, kB_S, m_S, gam_S = F(1, 4), F(27, 100), F(59, 500), F(6, 25)
    D_S = kB_S - m_S * m_S / kA_S
    assert D_S > 0
    lam_S = rho - m_S / kA_S
    assert lam_S > 0
    A_S = F(1) / kA_S + lam_S * lam_S / D_S - F(1) / gam_S
    assert A_S < 0
    B_S = 2 * lam_S * err / D_S
    C_S = err * err / D_S
    excess_S = (C_S - B_S * B_S / (4 * A_S)) * u_max
    assert excess_S < F(11, 1000000)  # < 1.1e-5 << 10^-4!

    # Case 2: Global Target D (kA = kB = 7/25 = 0.28, m = 0) with gamma = 11/50 = 0.22 (consuming 6.3.3 & 6.3.13!):
    k_D, gam_D = F(7, 25), F(11, 50)
    A_D = (F(1) + rho * rho) / k_D - F(1) / gam_D
    assert A_D < 0  # (1 + 0.5053^2)/0.28 = 4.48331 < 50/11 = 4.54545!
    B_D = 2 * rho * err / k_D
    C_D = err * err / k_D
    excess_D = (C_D - B_D * B_D / (4 * A_D)) * u_max
    assert excess_D < F(35, 1000000)  # < 3.5e-5 << 10^-4!

    # Also check gamma = 3/20 = 0.15 under k_D = 7/25:
    A_D15 = (F(1) + rho * rho) / k_D - F(20, 3)
    assert A_D15 < 0
    excess_D15 = (C_D - B_D * B_D / (4 * A_D15)) * u_max
    assert excess_D15 < F(3, 1000000)  # < 3.0e-6!

    return {
        "target_S_gamma_024_excess_max": str(excess_S),
        "target_D_gamma_022_excess_max": str(excess_D),
        "target_D_gamma_015_excess_max": str(excess_D15),
    }


def verify_certificate(cert_path: Path, cpp_path: Path, check_cpp_hash: bool = True) -> dict:
    if check_cpp_hash:
        cpp_bytes = cpp_path.read_bytes()
        cpp_text = cpp_bytes.decode("utf-8")
        if "#ifdef NDEBUG" not in cpp_text or "#error" not in cpp_text:
            raise AssertionError("certify_raw_joint_ab.cpp is missing compile-time NDEBUG guard")
        actual_sha = hashlib.sha256(cpp_bytes).hexdigest()
        if actual_sha != EXPECTED_CPP_SHA256:
            raise AssertionError(
                f"CPP SHA-256 mismatch: expected {EXPECTED_CPP_SHA256}, got {actual_sha}"
            )

    data = json.loads(cert_path.read_text(encoding="utf-8"))
    if data.get("format") != "raw-joint-ab-v1":
        raise AssertionError(f"Unexpected format: {data.get('format')!r}")
    if data.get("self_tests_passed") is not True:
        raise AssertionError("self_tests_passed is not True")

    w_max = parse_hexfloat(data["slab_shift_max"])
    tail_cut = F(data["rational_tail_cutoff"][0], data["rational_tail_cutoff"][1])
    r_amp_max = parse_hexfloat(data["amplitude_shell_max"])
    s_res = F(data["signed_reserve"][0], data["signed_reserve"][1])
    if not (w_max == F(3) and tail_cut == F(29, 10) and w_max >= tail_cut):
        raise AssertionError(f"Invalid shift cutoffs: w_max={w_max}, tail_cut={tail_cut}")
    if r_amp_max != F(4):
        raise AssertionError(f"Expected amplitude_shell_max == 4, got {r_amp_max}")
    if s_res != F(1, 100):
        raise AssertionError(f"Expected signed_reserve == 1/100, got {s_res}")

    ext_info = verify_exteriors_and_helpers()
    cor_info = verify_assembly_corollaries()

    rows = data.get("rows", [])
    if [r.get("name") for r in rows] != ["peak", "flank", "upper"]:
        raise AssertionError(f"Expected rows [peak, flank, upper], got {[r.get('name') for r in rows]}")

    row_summaries = {}
    for r in rows:
        name = r["name"]
        exp = EXPECTED_ROWS[name]
        if (tuple(r["a"]), tuple(r["b"]), tuple(r["eps"]), tuple(r["kappa_diag"])) != (
            exp["a"], exp["b"], exp["eps"], exp["kappa_diag"]
        ):
            raise AssertionError(f"Row {name} parameter mismatch")

        p = F(exp["eps"][1], exp["eps"][0])
        kd = F(*exp["kappa_diag"])
        qd = p - kd
        qs_AA = p - F(24, 100) - s_res
        qs_BB = p - F(26, 100) - s_res
        qs_AB = F(-59, 500)

        # Part 1: Origin slabs on [0, 3]
        ori_slabs = r["part1_origin_slabs"]
        if not ori_slabs:
            raise AssertionError(f"Row {name}: empty part1_origin_slabs")
        cur_w = F(0)
        ori_intervals: list[tuple[F, F, F]] = []
        min_proxy_S = None
        min_proxy_D = None
        for idx, sl in enumerate(ori_slabs):
            wl = parse_hexfloat(sl["wl"])
            wh = parse_hexfloat(sl["wh"])
            s0 = parse_hexfloat(sl["s0"])
            if wl != cur_w or not (wl < wh) or s0 <= 0:
                raise AssertionError(f"Row {name} origin slab {idx} discontinuity: [{wl}, {wh}], expected {cur_w}")
            pS_re = check_2x2_psd_strict(qs_AA, qs_AB, qs_BB, sl["K_re"])
            pS_im = check_2x2_psd_strict(qs_AA, qs_AB, qs_BB, sl["K_im"])
            pD_re = check_2x2_psd_strict(qd, F(0), qd, sl["K_re"])
            pD_im = check_2x2_psd_strict(qd, F(0), qd, sl["K_im"])
            pS = min(pS_re, pS_im)
            pD = min(pD_re, pD_im)
            min_proxy_S = pS if min_proxy_S is None else min(min_proxy_S, pS)
            min_proxy_D = pD if min_proxy_D is None else min(min_proxy_D, pD)
            ori_intervals.append((wl, wh, s0))
            cur_w = wh
        if cur_w != w_max:
            raise AssertionError(f"Row {name} origin slabs end at {cur_w} != {w_max}")

        # Part 2: Global shift curvature 680
        sc = r["part2_shift_curvature"]
        if sc.get("constant") != 680:
            raise AssertionError(f"Row {name}: expected curvature constant 680, got {sc.get('constant')}")
        cap_max = parse_hexfloat(sc["cap_max"])
        mass_sum = parse_hexfloat(sc["mass_sum"])
        tail_mass = parse_hexfloat(sc["tail_mass"])
        if not (cap_max > 0 and mass_sum > tail_mass > 0):
            raise AssertionError(f"Row {name}: invalid curvature components")
        if not (F(16) * cap_max * mass_sum < F(680 * 680)):
            raise AssertionError(f"Row {name}: shift curvature 16*cap*mass >= 680^2")

        # Part 3: 3D ray-convexity shells on [0, 3]
        s3_slabs = r["part3_ray_shells"]
        if not s3_slabs:
            raise AssertionError(f"Row {name}: empty part3_ray_shells")
        cur_w3 = F(0)
        tot_S = 0
        tot_D = 0
        worst_S = None
        worst_D = None
        r_end_num = int(r_amp_max * SHELL_DEN)
        ori_ptr = 0
        for idx, sl in enumerate(s3_slabs):
            wl = parse_hexfloat(sl["wl"])
            wh = parse_hexfloat(sl["wh"])
            if wl != cur_w3 or not (wl < wh):
                raise AssertionError(f"Row {name} Part 3 slab {idx} discontinuity: [{wl}, {wh}], expected {cur_w3}")

            stages = sl.get("stages", [])
            if not stages:
                raise AssertionError(f"Row {name} Part 3 slab {idx}: empty stages")

            r0 = parse_hexfloat(stages[0][0])
            cur_r = r0
            sum_sbS = 0
            sum_sbD = 0
            max_swS = None
            max_swD = None
            for s_idx, st in enumerate(stages):
                if not (isinstance(st, list) and len(st) == 9):
                    raise ValueError(f"Row {name} Part 3 slab {idx} stage {s_idx}: expected 9-tuple")
                st_r0_s, st_r1_s, eta_pair, rho_pair, num_shells, sbS, sbD, swS_s, swD_s = st
                st_r0 = parse_hexfloat(st_r0_s)
                st_r1 = parse_hexfloat(st_r1_s)
                if st_r0 != cur_r or not (st_r0 < st_r1):
                    raise AssertionError(
                        f"Row {name} Part 3 slab {idx} stage {s_idx} discontinuity: [{st_r0}, {st_r1}], expected {cur_r}"
                    )
                r0_sc = st_r0 * SHELL_DEN
                r1_sc = st_r1 * SHELL_DEN
                if r0_sc.denominator != 1 or r1_sc.denominator != 1 or r0_sc.numerator <= 0:
                    raise AssertionError(f"Row {name} Part 3 slab {idx} stage {s_idx}: non-dyadic shell endpoint")

                eta_n, eta_d = eta_pair
                rho_n, rho_d = rho_pair
                if not (isinstance(eta_n, int) and isinstance(eta_d, int) and 0 < eta_n < eta_d):
                    raise AssertionError(f"Row {name} Part 3 slab {idx} stage {s_idx}: invalid eta {eta_pair}")
                if not (isinstance(rho_n, int) and isinstance(rho_d, int) and rho_n > rho_d > 0):
                    raise AssertionError(f"Row {name} Part 3 slab {idx} stage {s_idx}: invalid rho_max {rho_pair}")
                # Ray-convexity condition ((rho - 1)/(rho + 1))^2 <= eta:
                if not ((rho_n - rho_d) ** 2 * eta_d <= (rho_n + rho_d) ** 2 * eta_n):
                    raise AssertionError(f"Row {name} Part 3 slab {idx} stage {s_idx}: discriminant > eta")

                exp_shells = expected_shell_count(int(r0_sc), rho_n, rho_d, int(r1_sc))
                if num_shells != exp_shells:
                    raise AssertionError(
                        f"Row {name} Part 3 slab {idx} stage {s_idx}: num_shells={num_shells} != {exp_shells}"
                    )
                if not (isinstance(sbS, int) and isinstance(sbD, int) and sbS >= 7 * exp_shells and sbD >= 7 * exp_shells):
                    raise AssertionError(
                        f"Row {name} Part 3 slab {idx} stage {s_idx}: insufficient closed boxes ({sbS}, {sbD})"
                    )
                swS = parse_hexfloat(swS_s)
                swD = parse_hexfloat(swD_s)
                if not (swS < 0 and swD < 0):
                    raise AssertionError(
                        f"Row {name} Part 3 slab {idx} stage {s_idx}: non-negative worst margin ({swS}, {swD})"
                    )
                sum_sbS += sbS
                sum_sbD += sbD
                max_swS = swS if max_swS is None else max(max_swS, swS)
                max_swD = swD if max_swD is None else max(max_swD, swD)
                cur_r = st_r1

            if cur_r != r_amp_max or int(cur_r * SHELL_DEN) != r_end_num:
                raise AssertionError(f"Row {name} Part 3 slab {idx}: final stage ends at {cur_r} != {r_amp_max}")

            # Inner handoff: cover [wl, wh] by Part 1 origin slabs and check 2*r0 <= min s0:
            while ori_ptr < len(ori_intervals) and ori_intervals[ori_ptr][1] <= wl:
                ori_ptr += 1
            cov = wl
            k = ori_ptr
            min_s0 = None
            while k < len(ori_intervals) and ori_intervals[k][0] < wh:
                owl, owh, os0 = ori_intervals[k]
                if owl > cov:
                    raise AssertionError(f"Row {name} origin handoff gap at {cov}")
                cov = min(wh, owh)
                min_s0 = os0 if min_s0 is None else min(min_s0, os0)
                k += 1
            if cov != wh or min_s0 is None:
                raise AssertionError(f"Row {name} incomplete origin coverage on [{wl}, {wh}]")
            if not (2 * r0 <= min_s0):
                raise AssertionError(
                    f"Row {name} Part 3 slab {idx}: inner handoff failed: 2*r0={2*r0} > s0={min_s0}"
                )

            n_up = parse_hexfloat(sl["n_up"])
            a2_up = parse_hexfloat(sl["a2_up"])
            b2_up = parse_hexfloat(sl["b2_up"])
            if not (n_up > 0 and a2_up > 0 and b2_up > 0):
                raise AssertionError(f"Row {name} Part 3 slab {idx}: non-positive base curvature")
            if sl.get("open_boxes") != 0:
                raise AssertionError(f"Row {name} Part 3 slab {idx}: open_boxes={sl.get('open_boxes')} != 0")
            tot_S += sum_sbS
            tot_D += sum_sbD
            worst_S = max_swS if worst_S is None else max(worst_S, max_swS)
            worst_D = max_swD if worst_D is None else max(worst_D, max_swD)
            cur_w3 = wh
        if cur_w3 != w_max:
            raise AssertionError(f"Row {name} Part 3 slabs end at {cur_w3} != {w_max}")

        summ = r["summary"]
        if summ["total_boxes_S"] != tot_S or summ["total_boxes_D"] != tot_D:
            raise AssertionError(f"Row {name}: summary box count mismatch")
        if parse_hexfloat(summ["worst_S"]) != worst_S or parse_hexfloat(summ["worst_D"]) != worst_D:
            raise AssertionError(f"Row {name}: summary worst margin mismatch")

        row_summaries[name] = {
            "origin_slabs": len(ori_slabs),
            "ray_shell_slabs": len(s3_slabs),
            "total_boxes_S": tot_S,
            "total_boxes_D": tot_D,
            "worst_S_neg": bool(worst_S < 0),
            "worst_D_neg": bool(worst_D < 0),
        }

    return {
        "status": "PASS",
        "agent_id": "gemini-4c4c",
        "task": 706,
        "cpp_sha256": EXPECTED_CPP_SHA256 if check_cpp_hash else "unchecked",
        "exteriors": ext_info,
        "corollaries": cor_info,
        "rows": row_summaries,
    }


def replay_cpp(cpp_path: Path, cert_path: Path) -> None:
    cxx = shutil.which("clang++") or shutil.which("g++")
    if not cxx:
        raise RuntimeError("No C++17 compiler (clang++ or g++) found for --replay-cpp")
    with tempfile.TemporaryDirectory() as tmp:
        bin_path = Path(tmp) / "certify_raw_joint_ab"
        out_path = Path(tmp) / "replayed.json"
        cmd = [
            cxx, "-O2", "-ffp-contract=off", "-frounding-math", "-std=c++17",
            "-pthread", "-Wall", "-Wextra", "-Werror",
            str(cpp_path), "-o", str(bin_path),
        ]
        subprocess.run(cmd, check=True)
        hot = subprocess.run([str(bin_path), "--control-false-hotspot"], check=True, capture_output=True, text=True)
        assert "CONTROL_HOTSPOT" in hot.stdout
        subprocess.run([str(bin_path), "--output", str(out_path)], check=True)
        if out_path.read_text(encoding="utf-8") != cert_path.read_text(encoding="utf-8"):
            raise AssertionError("Replayed C++ certificate differs from committed result.json")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--cert", type=Path, default=Path(__file__).with_name("result.json"))
    parser.add_argument("--cpp", type=Path, default=Path(__file__).with_name("certify_raw_joint_ab.cpp"))
    parser.add_argument("--replay-cpp", action="store_true", help="Recompile C++17 certifier and verify exact match")
    args = parser.parse_args()

    res = verify_certificate(args.cert, args.cpp, check_cpp_hash=True)
    if args.replay_cpp:
        replay_cpp(args.cpp, args.cert)
        res["cpp_replay"] = "EXACT_MATCH"
    print(json.dumps(res, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
