#!/usr/bin/env python3
"""Self-contained zero-float, -O-safe rational verifier for buffered cubic Rice bounds (Issue #784).

Agent-ID: gemini-4c4c
Usage:
    python3 -IB verify.py [CERT.json] [--quiet]
    python3 -IB -O verify.py [CERT.json] [--quiet]

Only the Python 3 standard library is imported (`bisect`, `fractions`, `json`, `math`, `pathlib`, `sys`, `time`).
Zero floating-point literals or calls occur anywhere in this file, and all checks use `require(...)` (raising
`ValueError`), remaining 100% active under `python3 -O`.

What this script verifies from first principles + reviewed `Lean` / `P` / `P + C` inputs (`3.4`, `6.3.20`, `KCR`, `3.7`):
  1. Theorem 1 (Sharp Buffered Cubic Radius through s <= 5/8 = 0.625):
       E|Z + sqrt(s) * q| <= (sqrt(pi)/2) * sqrt(1 + s)
     for every dimension n >= 1, every unit-variance q in H_{2,1}(C^n), and all 0 <= s <= 5/8 (3.75x wider than 1/6),
     via three overlapping closed regimes covering [0, 5/8] x [0, 42]:
       (a) Low s in [0, 1/6] x [0, 49]: 1-step Edgeworth on [0, 1/11], 4th-order Beta(1/2, 3/2) Rice cover on [1/11, 1],
           and log-convex Rice tangent cover on [1, 7] in sqrt(chi) (with independent strip sweep);
       (b) Near-Gaussian chi in [0, chi_OU(s)] across s in [1/6, 5/8] (with chi_OU >= 11/2000 = 0.0055 on all slabs):
           Deterministically centered smoothed two-step Ornstein-Uhlenbeck remainder at V_L = 1, proving
           -371/200 <= h_4(w) <= 3, |h_4(w) - 23/40| <= 243/100, |h_4(w) - 3| <= (17/4)*sqrt(w), and chaos-wise
           ||U||_4 <= L_{U,4}(y) * A algebraically via exact integer Sturm sequences;
       (c) Bulk & high kurtosis chi in [chi_0(s), 42] (with chi_0(s) <= chi_OU(s)) across s in [1/6, 5/8]:
           137-cell complete-monotonicity Hermite cubic + sublinear Cauchy-Schwarz Rice upper cap bank C_m(x) >= rho(x)
           on [0, oo) built from positive-term Bessel series, whole-half-line integer Sturm verification of Level-2
           Matrix Stein models in v = |q|^2, 5-scalar Lean Gram LP dual verification, and curvature-compensated
           s-chord interpolation across gap-free 2D tiles.
  2. Corollary 1a (Exact Remote-Energy Frontier on [sqrt(2*pi/13), sqrt(pi)/2] = [0.6952135979..., 0.8862269254...]):
       Verifies sqrt(2*pi/13) < 139043/200000 = 0.695215 < 7/10, so the exact remote cubic energy cap applies across
       100% of [0.751, 0.8205] in 8.13/#769 and at all 19 rationalised degree-5 row amplitudes 0.70..0.886 (#453, #751).
  3. Theorem 2 (Quantitative Buffered Rice Curve for s > 5/8 and Remote Mid-t Closure on [0, 61/100], #628 ATK P3 §5):
       Verifies rational buffered Rice upper bounds R_buf(s_j) at s_j in {1, 17/16, 5/4, 3/2, 2, 3, 9/2} across all chi in [0, 42]
       (combining Part 1b on [0, chi_OU(s_j)] with Level-2 Matrix Stein on [chi_OU(s_j), 42]), and proves
       V(f, g) <= (1 - eta)t^2 + eta + (eps - eta)*Q_rem(t) < 500/701 - 1/1000 across t = ||P_{1,0} h||_2 in [0, 61/100]
       for every unimodular pair with remote P_{2,1} k (using reviewed rho_* <= 2287/2500 on [0, 1/5] and quadratic
       response pieces on [1/5, 61/100]), plus finite-dimensional barrier verification at t = 618/1000, A = 2017/5000.
"""
import bisect
from fractions import Fraction as Fr
import json
from math import comb, factorial, gcd, isqrt
import pathlib
import sys
import time

HERE = pathlib.Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[3]
DEFAULT_CERT = HERE / "cert_buffered_rice.json"

C6 = Fr(4045313, 100000)
CHI_MAX = Fr(42)
S_SHARP_MAX = Fr(5, 8)
ADVERTISED_P3_RESERVE = Fr(1, 1000)
ADVERTISED_MIDT_NODES = [
    (Fr(1), Fr(627047, 500000)),
    (Fr(17, 16), Fr(1273809, 1000000)),
    (Fr(5, 4), Fr(1350873, 1000000)),
    (Fr(3, 2), Fr(1409699, 1000000)),
    (Fr(2), Fr(77577, 50000)),
    (Fr(3), Fr(904813, 500000)),
    (Fr(9, 2), Fr(2145169, 1000000)),
]
SCALE_DYAD = 1 << 100
S_CAP_DEN = 10**16

EROW = [Fr(32), Fr(8), Fr(32), Fr(96), Fr(0)]
S0_VEC = [Fr(8), Fr(2), Fr(8), Fr(0), Fr(8)]
H0_VEC = [Fr(8, 3), Fr(2, 3), Fr(8, 3), Fr(24), Fr(-16, 3)]
PMAX = [Fr(1, 32), Fr(1, 8), Fr(1, 32), Fr(1, 96), Fr(3, 64)]


def require(cond, msg="verification condition failed"):
    if not cond:
        raise ValueError(msg)


def _parse_lean_rat_rhs(line, marker):
    idx = line.find(marker)
    require(idx >= 0, f"missing marker {marker!r} in Lean source line")
    rhs = line[idx + len(marker):].split(":=")[0].strip()
    if ":=" in line[idx:]:
        rhs = line[idx + len(marker):].strip()
    rhs = rhs.split("--")[0].strip()
    if "/" in rhs:
        parts = rhs.split("/")
        require(len(parts) == 2, f"malformed rational {rhs!r} in Lean source")
        n_s = "".join(ch for ch in parts[0].strip() if ch.isdigit())
        d_s = "".join(ch for ch in parts[1].strip().split()[0] if ch.isdigit())
        require(bool(n_s) and bool(d_s), f"empty rational digits in {rhs!r}")
        return Fr(int(n_s), int(d_s))
    n_s = "".join(ch for ch in rhs.split()[0] if ch.isdigit())
    require(bool(n_s), f"missing integer digits in {rhs!r}")
    return Fr(int(n_s))


def verify_lean_moment_constants(repo_root=None):
    """Tie C6 and CHI_MAX directly to their Lean source definitions in Grothe/."""
    root = pathlib.Path(repo_root) if repo_root is not None else REPO_ROOT
    moment_lean = root / "Grothe" / "Lower" / "Moment.lean"
    moments_lean = root / "Grothe" / "LowerAnalytic" / "Moments.lean"
    circ4_lean = root / "Grothe" / "LowerAnalytic" / "CircularFourth.lean"
    require(moment_lean.is_file() and moments_lean.is_file() and circ4_lean.is_file(),
            "missing Lean moment source files under Grothe/")

    c6_def = None
    for ln in moment_lean.read_text(encoding="utf-8").splitlines():
        s = ln.strip()
        if s.startswith("def C6 : ℚ :="):
            c6_def = _parse_lean_rat_rhs(s, "def C6 : ℚ :=")
            break
    require(c6_def is not None, "could not locate `def C6 : ℚ :=` in Grothe/Lower/Moment.lean")

    c6_lem = None
    for ln in moments_lean.read_text(encoding="utf-8").splitlines():
        s = ln.strip()
        if s.startswith("lemma C6_eq : C6 ="):
            rhs = s.split("lemma C6_eq : C6 =", 1)[1].split(":=", 1)[0].strip()
            c6_lem = _parse_lean_rat_rhs("= " + rhs, "= ")
            break
    require(c6_lem is not None, "could not locate `lemma C6_eq` in Grothe/LowerAnalytic/Moments.lean")
    require(C6 == c6_def == c6_lem, f"C6={C6} does not match Lean source C6={c6_def} / {c6_lem}")

    m4_val = None
    chi_val = None
    c4_lines = circ4_lean.read_text(encoding="utf-8").splitlines()
    for i, ln in enumerate(c4_lines):
        s = ln.strip()
        if s.startswith("theorem Circular.fourth_moment_le_44") and "E (radU a b ^ 2) ≤" in s:
            m4_val = _parse_lean_rat_rhs(s, "E (radU a b ^ 2) ≤")
        if s.startswith("theorem Circular.gaussian_x_le_sqrt42"):
            window = " ".join(c4_lines[i:i + 6])
            pos = window.find("≤ √")
            require(pos >= 0, "missing `≤ √` in Circular.gaussian_x_le_sqrt42")
            tail = window[pos + len("≤ √"):].strip()
            digits = ""
            for ch in tail:
                if ch.isdigit():
                    digits += ch
                else:
                    break
            require(bool(digits), "missing √chi digits in CircularFourth.lean")
            chi_val = Fr(int(digits))
    require(m4_val is not None and chi_val is not None,
            "could not locate fourth-moment theorems in Grothe/LowerAnalytic/CircularFourth.lean")
    require(CHI_MAX == chi_val == m4_val - 2,
            f"CHI_MAX={CHI_MAX} does not match Lean fourth-moment bound {m4_val} - 2 = {chi_val}")


def fmt_dec(q, digits=8):
    q = Fr(q)
    neg = q < 0
    if neg:
        q = -q
    unit = 10**digits
    n = (q.numerator * unit) // q.denominator
    s = f"{n // unit}.{str(n % unit).zfill(digits)}"
    return ("-" + s) if neg else s


def floor_dyad(q, scale=SCALE_DYAD):
    q = Fr(q)
    return Fr((q.numerator * scale) // q.denominator, scale)


def ceil_dyad(q, scale=SCALE_DYAD):
    q = Fr(q)
    return Fr(-((-q.numerator * scale) // q.denominator), scale)


def ceil_dec(q, unit=10**12):
    q = Fr(q)
    return Fr(-((-q.numerator * unit) // q.denominator), unit)


def floor_dec(q, unit=10**12):
    q = Fr(q)
    return Fr((q.numerator * unit) // q.denominator, unit)


def sqrt_bounds(q, scale=SCALE_DYAD):
    q = Fr(q)
    require(q >= 0, "sqrt_bounds expects nonnegative Fraction")
    if q == 0:
        return Fr(0), Fr(0)
    num = q.numerator * scale * scale
    lo_i = isqrt(num // q.denominator)
    hi_i = isqrt((num + q.denominator - 1) // q.denominator)
    if hi_i * hi_i * q.denominator < num:
        hi_i += 1
    lo = Fr(lo_i, scale)
    hi = Fr(hi_i, scale)
    require(lo >= 0 and lo * lo <= q <= hi * hi, "sqrt_bounds soundness failed")
    return lo, hi


def int_nth_root_floor(n, k):
    require(n >= 0 and k >= 1, "bad nth root args")
    if n <= 1 or k == 1:
        return n
    hi = 1 << ((n.bit_length() + k - 1) // k)
    lo = 1 << ((n.bit_length() - 1) // k)
    while lo < hi:
        mid = (lo + hi + 1) // 2
        if mid**k <= n:
            lo = mid
        else:
            hi = mid - 1
    require(lo**k <= n < (lo + 1) ** k, "nth root invariant failed")
    return lo


def rat_pow_ub(q, p_num, p_den, prec=10**8):
    q = Fr(q)
    require(q >= 0 and p_num >= 0 and p_den >= 1, "bad rat_pow_ub args")
    if p_num == 0:
        return Fr(1)
    if q == 0:
        return Fr(0)
    num_int = (q.numerator**p_num) * (prec**p_den)
    den_pow = q.denominator**p_num
    q_ceil = (num_int + den_pow - 1) // den_pow
    m = int_nth_root_floor(q_ceil - 1, p_den) + 1 if q_ceil > 0 else 1
    ub = Fr(m, prec)
    require((ub**p_den) >= (q**p_num), "rat_pow_ub soundness failed")
    return ub


def rat_pow_lb(q, p_num, p_den, prec=10**8):
    q = Fr(q)
    require(q >= 0 and p_num >= 0 and p_den >= 1, "bad rat_pow_lb args")
    if p_num == 0:
        return Fr(1)
    if q == 0:
        return Fr(0)
    num_int = (q.numerator**p_num) * (prec**p_den)
    den_pow = q.denominator**p_num
    m = int_nth_root_floor(num_int // den_pow, p_den)
    lb = Fr(m, prec)
    require(lb >= 0 and (lb**p_den) <= (q**p_num), "rat_pow_lb soundness failed")
    return lb


def verify_pi_and_r0():
    def arctan_inv(m, n_pairs):
        s = Fr(0)
        m2 = m * m
        mp = m
        for j in range(n_pairs):
            t1 = Fr(1, (4 * j + 1) * mp)
            mp *= m2
            t2 = Fr(1, (4 * j + 3) * mp)
            mp *= m2
            s += t1 - t2
        tn = Fr(1, (4 * n_pairs + 1) * mp)
        require(tn > 0, "arctan step")
        return s, s + tn

    a5_l, a5_h = arctan_inv(5, 22)
    a239_l, a239_h = arctan_inv(239, 8)
    pi_lo = floor_dyad(16 * a5_l - 4 * a239_h)
    pi_hi = ceil_dyad(16 * a5_h - 4 * a239_l)
    require(Fr(314159265358979, 10**14) < pi_lo < pi_hi < Fr(314159265358980, 10**14), "Machin pi check")
    sp_lo, _ = sqrt_bounds(pi_lo)
    _, sp_hi = sqrt_bounds(pi_hi)
    return pi_lo, pi_hi, sp_lo / 2, sp_hi / 2


# ==============================================================================
# POLYNOMIAL & EXACT INTEGER STURM UTILITIES (ASCENDING POWERS IN v)
# ==============================================================================
def ptrim(a):
    a = list(a)
    while a and a[-1] == 0:
        a.pop()
    return a


def padd(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) + (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def psub(a, b):
    n = max(len(a), len(b))
    return ptrim([(a[i] if i < len(a) else Fr(0)) - (b[i] if i < len(b) else Fr(0)) for i in range(n)])


def pscale(a, c):
    c = Fr(c)
    if c == 0 or not a:
        return []
    return ptrim([c * x for x in a])


def pmul(a, b):
    if not a or not b:
        return []
    out = [Fr(0)] * (len(a) + len(b) - 1)
    for i, x in enumerate(a):
        if x:
            for j, y in enumerate(b):
                out[i + j] += x * y
    return ptrim(out)


def ppow(p, k):
    out = [Fr(1)]
    for _ in range(k):
        out = pmul(out, p)
    return out


def peval(a, x):
    x = Fr(x)
    acc = Fr(0)
    for c in reversed(a):
        acc = acc * x + c
    return acc


def pprim(p, u0, val_u0):
    q = [Fr(0)] + [c / (i + 1) for i, c in enumerate(p)]
    q[0] = val_u0 - peval(q, u0)
    return ptrim(q)


def div_xk(p, k):
    p = ptrim(p)
    require(all(i >= len(p) or p[i] == 0 for i in range(k)), f"polynomial not divisible by x^{k}")
    return p[k:] if len(p) > k else []


def to_int_poly(a):
    a = ptrim(a)
    if not a:
        return []
    den = 1
    for x in a:
        den = (den * x.denominator) // gcd(den, x.denominator)
    ints = [int(x * den) for x in a]
    g = 0
    for x in ints:
        g = gcd(g, abs(x))
    return [x // g for x in ints]


def ieval_sign(a, x):
    p, q = x.numerator, x.denominator
    acc = 0
    n = len(a) - 1
    for i in range(n, -1, -1):
        acc = acc * p + a[i] * (q ** (n - i))
    return (acc > 0) - (acc < 0)


def irem_neg(a, b):
    a = list(a)
    lb = b[-1]
    db = len(b) - 1
    m = abs(lb)
    sg = 1 if lb > 0 else -1
    while len(a) - 1 >= db and a:
        la = a[-1]
        k = len(a) - 1 - db
        a = [m * x for x in a]
        for i, y in enumerate(b):
            a[i + k] -= sg * la * y
        a = ptrim(a)
    return to_int_poly([-x for x in a])


def sturm_chain(p):
    p0 = to_int_poly(p)
    p1 = to_int_poly([i * p0[i] for i in range(1, len(p0))])
    chain = [p0]
    if p1:
        chain.append(p1)
    while len(chain) >= 2 and len(chain[-1]) > 1:
        r = irem_neg(chain[-2], chain[-1])
        if not r:
            break
        chain.append(r)
    return chain


def sign_changes(signs):
    nz = [x for x in signs if x != 0]
    return sum(1 for i in range(len(nz) - 1) if nz[i] != nz[i + 1])


def taylor_shift(p, a):
    a = Fr(a)
    c = list(p)
    if a == 0 or len(c) <= 1:
        return c
    n = len(c)
    for k in range(n - 1):
        for i in range(n - 2, k - 1, -1):
            c[i] += a * c[i + 1]
    return ptrim(c)


def positive_on(p, a, b=None):
    p = ptrim(p)
    if not p:
        return False
    if len(p) == 1:
        return p[0] > 0
    a = Fr(a)
    if b is None:
        ps = taylor_shift(p, a)
        if not ps or ps[0] <= 0 or ps[-1] <= 0:
            return False
        if all(c >= 0 for c in ps):
            return True
    else:
        b = Fr(b)
        require(a <= b, "positive_on requires a <= b")
        if a == b:
            return peval(p, a) > 0
        ps = taylor_shift(p, a)
        if not ps or ps[0] <= 0:
            return False
        h = b - a
        d = len(ps) - 1
        if d == 0:
            return ps[0] > 0
        hp = Fr(1)
        q = []
        for c in ps:
            q.append(c * hp)
            hp *= h
        if sum(q) <= 0:
            return False
        inv_cd = [Fr(1, comb(d, j)) for j in range(d + 1)]
        ctrl = [
            sum(comb(m, j) * inv_cd[j] * q[j] for j in range(m + 1))
            for m in range(d + 1)
        ]
        stack = [(ctrl, 0)]
        unresolved = False
        while stack:
            cur, dep = stack.pop()
            if cur[0] <= 0 or cur[-1] <= 0:
                return False
            if all(v > 0 for v in cur):
                continue
            if dep >= 6:
                unresolved = True
                break
            tri = [cur]
            for _ in range(d):
                prev = tri[-1]
                tri.append([(prev[i] + prev[i + 1]) / 2 for i in range(len(prev) - 1)])
            if tri[-1][0] <= 0:
                return False
            stack.append(([tri[r][0] for r in range(d + 1)], dep + 1))
            stack.append(([tri[d - r][r] for r in range(d + 1)], dep + 1))
        if not unresolved:
            return True

    ch = sturm_chain(p)
    if ieval_sign(ch[0], a) <= 0:
        return False
    va = sign_changes([ieval_sign(c, a) for c in ch])
    if b is None:
        if ch[0][-1] <= 0:
            return False
        vb = sign_changes([(c[-1] > 0) - (c[-1] < 0) for c in ch])
    else:
        if ieval_sign(ch[0], b) <= 0:
            return False
        vb = sign_changes([ieval_sign(c, b) for c in ch])
    return va == vb


# ==============================================================================
# PART 1A: SELF-CONTAINED LOW-s REGIME [0, 1/6] x [0, 49] IN (s, chi)
# ==============================================================================
def verify_low_s_regime():
    s_top = Fr(1, 6)
    y_small = Fr(1, 11)
    y_large = Fr(1)
    y_max = Fr(7)
    c_six = Fr(40454, 1000)
    require(c_six >= C6 and y_max * y_max >= CHI_MAX, "low-s domain constants")

    moments = [Fr(1)]
    for k in range(1, 5):
        moments.append(moments[-1] * (Fr(1, 2) + k - 1) / (2 + k - 1))
    require(moments[1:4] == [Fr(1, 4), Fr(1, 8), Fr(5, 64)] and moments[4] / moments[3] == Fr(7, 10), "Beta moments")
    require(Fr(27, 25) ** 2 < 1 + s_top < Fr(1081, 1000) ** 2 and s_top < Fr(41, 100) ** 2, "low-s roots")
    require(3 + Fr(3, 2) * (y_small**2) < Fr(33, 25) ** 4, "low-s beta^4")

    fourth = 1 / (16 * (1 + s_top) * Fr(1081, 1000))
    sixth = c_six * s_top / (96 * ((1 + s_top) ** 2) * Fr(27, 25))
    rem = Fr(81, 20) * Fr(12, 7) * s_top * Fr(41, 100)
    low_margin = fourth - y_small * (sixth + rem)
    require(low_margin > Fr(1, 500), "low-s small-excess margin failed")

    def m6(y):
        return 6 + 9 * y * y + c_six * (y**3)

    def inter_lo(sl, sh, yl, yh):
        cost = sh * (9 * yh * yh + c_six * (yh**3)) / 96 + 5 * sh * sh / 128
        return yl * yl / 16 - cost + (5 * sl * sl * (m6(yl) ** 2)) / (3072 * (2 + yh * yh + 7 * sh * m6(yh) / 40))

    def large_lo(sl, sh, yl, yh):
        g_gap = 1 - 5 * sl / 6 + 5 * sl * sl / 8
        return (1 - sh / 2) * ((1 + yl * yl) ** 2) - g_gap * (1 + yh * yh + sh * (3 + 7 * yh * yh + c_six * (yh**3)) / 4)

    def sub_cover(fn, ya, yb):
        pend = [(Fr(0), s_top, ya, yb, 0)]
        out = []
        while pend:
            sl, sh, yl, yh, dep = pend.pop()
            if fn(sl, sh, yl, yh) > 0:
                out.append((sl, sh, yl, yh))
                continue
            require(dep < 28, f"low-s box subdivision exhausted at {(sl, sh, yl, yh)}")
            if dep % 2:
                m = (sl + sh) / 2
                pend.extend([(sl, m, yl, yh, dep + 1), (m, sh, yl, yh, dep + 1)])
            else:
                m = (yl + yh) / 2
                pend.extend([(sl, sh, yl, m, dep + 1), (sl, sh, m, yh, dep + 1)])
        return out

    boxes = [(Fr(0), s_top, Fr(0), y_small)] + sub_cover(inter_lo, y_small, y_large) + sub_cover(large_lo, y_large, y_max)
    y_edges = sorted({Fr(0), y_max} | {e for _, _, yl, yh in boxes for e in (yl, yh)})
    for sl, sh, yl, yh in boxes:
        require(0 <= sl < sh <= s_top and 0 <= yl < yh <= y_max, "invalid low-s box")
    for yl, yh in zip(y_edges[:-1], y_edges[1:]):
        ivs = sorted((sl, sh) for sl, sh, bl, bh in boxes if bl <= yl and yh <= bh)
        cur = Fr(0)
        for sl, sh in ivs:
            require(sl == cur, "low-s gap or overlap")
            cur = sh
        require(cur == s_top, "low-s uncovered strip")
    return len(boxes)


# ==============================================================================
# PART 1B: MIDPOINT-CENTERED SMOOTHED TWO-STEP OU REMAINDER AT V_L = 1
# ==============================================================================
def verify_ou_envelopes_and_table():
    """Verify algebraically via exact integer Sturm sequences:
       (i)   -371/200 <= h_4(w) <= 3 for all w >= 0, hence |h_4(w) - 23/40| <= 243/100;
       (ii)  |h_4(w) - 3| <= (17/4) * sqrt(w) for all w >= 0;
       (iii) KCR contraction table c_{j,k,l} and chaos-wise L_{U,4}(y) >= ||U||_4 / A on [0, 7/8].
    """
    # (i-a) h_4(w) <= 3: 3*(1 + w/2 + w^2/8 + w^3/48) - (w^2 - 6w + 3) = (w/16)*((w - 5)^2 + 95) >= 0:
    e3 = [Fr(1), Fr(1, 2), Fr(1, 8), Fr(1, 48)]
    h4_p = [Fr(3), Fr(-6), Fr(1)]
    diff_up = psub(pscale(e3, 3), h4_p)
    require(diff_up == [Fr(0), Fr(15, 2), Fr(-5, 8), Fr(1, 16)], "h_4 <= 3 polynomial identity failed")
    require(positive_on(div_xk(diff_up, 1), Fr(0), None), "h_4 <= 3 half-line check failed")

    # (i-b) h_4(w) >= -371/200 on [0, oo):
    # For w >= 6, w^2 - 6w + 3 >= 3 > 0 > -371/200. On [0, 6], exp(w/2) >= sum_{k=0}^8 (w/2)^k / k!,
    # so (w^2 - 6w + 3) + (371/200)*exp(w/2) >= h4_p(w) + (371/200)*e8(w) > 0 on [0, 6]:
    e8 = [Fr(1, (2**k) * factorial(k)) for k in range(9)]
    lb_poly = padd(h4_p, pscale(e8, Fr(371, 200)))
    require(positive_on(lb_poly, Fr(0), Fr(6)), "h_4 >= -371/200 on [0, 6] failed")
    require(peval(h4_p, Fr(6)) == 3 and Fr(3) - Fr(23, 40) <= Fr(243, 100) and Fr(23, 40) + Fr(371, 200) == Fr(243, 100),
            "midpoint 23/40 radius 243/100 check failed")

    # (ii) 3 - h_4(t^2) <= (17/4)*t for all t >= 0:
    # For t >= 24/17, 3 - h_4(t^2) <= 3 + 371/200 = 971/200 < 6 <= (17/4)*t.
    # On [0, 12/17], (17/4)t - 3 <= 0 and w = t^2/2 in [0, 72/289] subset [0, 1], so exp(t^2/2) <= sum_{j=0}^4 (t^2/2)^j/j! + (t^2/2)^5/60:
    e_ub_t = [Fr(0)] * 11
    for j in range(5):
        e_ub_t[2 * j] = Fr(1, (2**j) * factorial(j))
    e_ub_t[10] = Fr(1, (2**5) * 60)
    h4_t = [Fr(3), Fr(0), Fr(-6), Fr(0), Fr(1)]
    phi_left = padd(pmul([Fr(-3), Fr(17, 4)], e_ub_t), h4_t)
    require(positive_on(div_xk(phi_left, 1), Fr(0), Fr(12, 17)), "|h_4 - 3| <= (17/4)sqrt(w) left segment failed")

    e_lb_t = [Fr(0)] * 13
    for j in range(7):
        e_lb_t[2 * j] = Fr(1, (2**j) * factorial(j))
    phi_right = padd(pmul([Fr(-3), Fr(17, 4)], e_lb_t), h4_t)
    require(positive_on(phi_right, Fr(12, 17), Fr(24, 17)), "|h_4 - 3| <= (17/4)sqrt(w) right segment failed")

    # (iii) KCR contraction table and chaos-wise L_{U,4}(y) >= Q_{U,4}(y)^{1/4} on y in [0, 7/8]:
    upper = {
        (2, 2): [Fr(1), Fr(283, 100), Fr(245, 100), Fr(0), Fr(0)],
        (2, 4): [Fr(0), Fr(245, 100), Fr(566, 100), Fr(388, 100), Fr(0)],
        (4, 4): [Fr(1), Fr(566, 100), Fr(147, 10), Fr(179, 10), Fr(837, 100)],
    }
    for (j, k), bnds in upper.items():
        for ell in range(0, 9, 2):
            r = (j + k - ell) // 2
            val = (Fr((factorial(r) ** 2) * (comb(j, r) ** 2) * (comb(k, r) ** 2) * factorial(ell),
                      factorial(j) * factorial(k))
                   if 0 <= r <= min(j, k) else Fr(0))
            require(bnds[ell // 2] ** 2 >= val, "KCR c_{j,k,l} bound failed")
    require(Fr(3, 4) < Fr(7, 8) ** 2, "y <= sqrt(3/4) < 7/8")

    q_u4 = [Fr(0)]
    for ell_idx in range(5):
        amp = [upper[(2, 2)][ell_idx], 2 * upper[(2, 4)][ell_idx], upper[(4, 4)][ell_idx]]
        q_u4 = padd(q_u4, pmul(amp, amp))
    l_u4 = [Fr(197, 100), Fr(183, 50), Fr(93, 100)]
    require(positive_on(psub(ppow(l_u4, 4), q_u4), Fr(0), Fr(7, 8)), "L_{U,4}(y)^4 >= Q_{U,4}(y) on [0, 7/8] failed")
    return upper, l_u4


def build_ou_theta_table():
    """Precompute outward-rounded exact antiderivatives on th = u^6 across [0, 1]:
         W_{a, b}(u^6) * u^{12 + 6r} * (6 u^5 du) = (6/d) * [ (u^{5 + 6r - l} - u^{17 + 6r})/(b + 4) - (u^{11 + 6r - k} - u^{17 + 6r})/(a + 2) ] du
       for r in {0, 1/2, 1}, where every endpoint u_m in Q makes u_m^m' exact rational!
       Also verifies each cell integral against monotone Riemann sandwich bounds on (u_a, u_b).
    """
    u_knots = (
        [Fr(0)]
        + [Fr(1, 24 * (1 << j)) for j in range(4, 0, -1)]
        + [Fr(m, 24) for m in range(1, 20)]
        + [Fr(80 + m, 96) for m in range(17)]
    )
    require(u_knots[0] == 0 and u_knots[-1] == 1 and all(u_knots[i] < u_knots[i + 1] for i in range(len(u_knots) - 1)),
            "u_knots must partition [0, 1]")
    th_knots = [u**6 for u in u_knots]

    def log_rat_ub(ub_v, ua_v):
        # Exact upper bound on ln(ub_v / ua_v) = 2 * artanh(t) for 0 < t = (ub - ua)/(ub + ua) <= 1/3:
        t = (ub_v - ua_v) / (ub_v + ua_v)
        require(0 < t <= Fr(1, 3), "artanh argument out of (0, 1/3]")
        t2 = t * t
        pw = t
        s = Fr(0)
        for j in range(10):
            s += pw / (2 * j + 1)
            pw *= t2
        s += pw / (21 * (1 - t2))
        return 2 * s

    def int_r0_ub(ua, ub, k, l, al, be, d):
        # Integrate (6/d)*[ u^{5-l}/(be+4) - u^{11-k}/(al+2) ] + (1/((al+2)*(be+4))) * 6 * u^{17} on [ua, ub] (ua > 0 if l >= 6):
        t_poly = -Fr(6) / (d * (12 - k) * (al + 2)) * (ub ** (12 - k) - ua ** (12 - k)) + (ub**18 - ua**18) / (3 * (al + 2) * (be + 4))
        if l in (0, 2, 4):
            t_lead = Fr(6) / (d * (6 - l) * (be + 4)) * (ub ** (6 - l) - ua ** (6 - l))
        elif l == 6:
            t_lead = Fr(6) / (d * (be + 4)) * log_rat_ub(ub, ua)
        else:
            t_lead = Fr(3) / (d * (be + 4)) * (Fr(1) / (ua * ua) - Fr(1) / (ub * ub))
        return t_lead + t_poly

    def antideriv_half(u, k, l, al, be, d):
        return (Fr(6) / (d * (9 - l) * (be + 4))) * (u ** (9 - l)) - (Fr(6) / (d * (15 - k) * (al + 2))) * (u ** (15 - k)) + (2 * (u**21) / (7 * (al + 2) * (be + 4)))

    def antideriv_1(u, k, l, al, be, d):
        return (Fr(6) / (d * (12 - l) * (be + 4))) * (u ** (12 - l)) - (Fr(6) / (d * (18 - k) * (al + 2))) * (u ** (18 - k)) + ((u**24) / (4 * (al + 2) * (be + 4)))

    def w_exact_u(u, k, l, al, be, d):
        return (Fr(1) / d) * ((u ** (-l - 12) - 1) / (be + 4) - (u ** (-k - 6) - 1) / (al + 2))

    table = {(k, l): [] for k in (2, 4) for l in (0, 2, 4, 6, 8)}
    for ua, ub in zip(u_knots[:-1], u_knots[1:]):
        tha, thb = ua**6, ub**6
        dth = thb - tha
        for k in (2, 4):
            al = Fr(k, 3)
            for l in (0, 2, 4, 6, 8):
                be = Fr(l, 3)
                d = be + 2 - al
                ih_raw = antideriv_half(ub, k, l, al, be, d) - antideriv_half(ua, k, l, al, be, d)
                ih = ceil_dec(ih_raw)
                require(ih >= ih_raw > 0, "nonpositive ih")
                if ua == 0 and l in (6, 8):
                    i0 = None
                else:
                    i0_raw = int_r0_ub(ua, ub, k, l, al, be, d)
                    i0 = ceil_dec(i0_raw)
                    require(i0 >= i0_raw > 0, "nonpositive i0")
                if l in (2, 4):
                    i1_raw = antideriv_1(ub, k, l, al, be, d) - antideriv_1(ua, k, l, al, be, d)
                    i1 = ceil_dec(i1_raw)
                    require(i1 >= i1_raw > 0, "nonpositive i1")
                else:
                    i1 = Fr(0)
                # Monotone Riemann sandwich verification whenever 0 < ua < ub < 1:
                if ua > 0 and ub < 1:
                    wa, wb = w_exact_u(ua, k, l, al, be, d), w_exact_u(ub, k, l, al, be, d)
                    require(wb * (tha**2) * dth <= i0 <= wa * (thb**2) * dth + Fr(1, 10**11), "i0 Riemann sandwich failed")
                    require(wb * (ua**15) * dth <= ih <= wa * (ub**15) * dth + Fr(1, 10**11), "ih Riemann sandwich failed")
                    if l in (2, 4):
                        require(wb * (tha**3) * dth <= i1 <= wa * (thb**3) * dth + Fr(1, 10**11), "i1 Riemann sandwich failed")
                table[(k, l)].append((i0, ih, i1))
    return th_knots, table


def certify_ou_slab(sa, sb, chi_hi, R0_lo, R0_hi, upper_table, l_u4, th_knots, w_table):
    """Certify that on s in [sa, sb] (sa >= 0, sb > 0) and 0 < chi <= chi_hi:
         (R0 * sqrt(1 + s) - E|Z + sqrt(s) q|) / (s^2 * chi) >= margin > 0
       using midpoint-centered smoothed two-step OU remainder at V_L = 1 and exact u^6 kernel antiderivatives.
    """
    sa, sb, chi_hi = Fr(sa), Fr(sb), Fr(chi_hi)
    require(0 <= sa <= sb and (sa < sb or sa > 0) and chi_hi > 0, "invalid OU slab args")
    sp_lo, sp_hi = 2 * R0_lo, 2 * R0_hi
    beta_ub = rat_pow_ub(3 + Fr(3, 2) * chi_hi, 1, 4, prec=10**7)
    sqrt_sb = rat_pow_ub(sb, 1, 2, prec=10**8)
    a_lo_52 = rat_pow_lb(1 + sa, 5, 2, prec=10**8)

    def cell_bounds(tha, thb):
        # B_{s, th} = 1 + s*(1 - th) >= 1 + sa*(1 - thb);
        # c(s, th) = 3 * ((1 + s*(1 - th)) / (1 + s))^{5/2} is decreasing in s and in th:
        b_lo = 1 + sa * (1 - thb)
        b52_ub = ceil_dec(Fr(1) / rat_pow_lb(b_lo, 5, 2, prec=10**8))
        b3_ub = ceil_dec(Fr(1) / (b_lo**3))
        b72_ub = ceil_dec(Fr(1) / rat_pow_lb(b_lo, 7, 2, prec=10**8))
        c_min = 3 * rat_pow_lb(Fr(1 + sb * (1 - thb), 1 + sb), 5, 2, prec=10**8)
        c_max = 3 * rat_pow_ub(Fr(1 + sa * (1 - tha), 1 + sa), 5, 2, prec=10**8)
        require(0 < c_min <= c_max <= 3 * Fr(100000001, 10**8), "c_min/c_max ordering failed")
        return b52_ub, b3_ub, b72_ub, c_min, min(Fr(3), c_max)

    cells_b = [cell_bounds(tha, thb) for tha, thb in zip(th_knots[:-1], th_knots[1:])]

    u2_poly = [Fr(1), Fr(0), Fr(1, 2)]
    u4_poly = pscale(l_u4, beta_ub)
    ul_poly = {2: [Fr(1)], 4: [Fr(0), Fr(1)]}
    y_fac = {2: [Fr(1)], 4: [Fr(0), Fr(1)]}
    y_ref = Fr(1, 2)
    u2_ref = peval(u2_poly, y_ref)
    u4_ref = peval(u4_poly, y_ref)

    P_ou = [Fr(0)]
    for k in (2, 4):
        for l in (0, 2, 4, 6, 8):
            w_poly = [Fr(0)]
            for j in (2, 4):
                c_jkl = upper_table[tuple(sorted((j, k)))][l // 2]
                if c_jkl != 0:
                    w_poly = padd(w_poly, pscale(pmul(y_fac[j], y_fac[k]), c_jkl))
            if not w_poly:
                continue
            c_u2 = Fr(0)
            c_u4 = Fr(0)
            c_ul = Fr(0)

            ul_ref = Fr(1) if l == 2 else y_ref
            for idx, (i0, ih, i1) in enumerate(w_table[(k, l)]):
                b52_ub, b3_ub, b72_ub, c_min, c_max = cells_b[idx]
                term_sqrt = ih * (Fr(17, 4) * sqrt_sb * b3_ub)
                if l in (0, 6, 8):
                    if i0 is None:
                        c_u4 += ceil_dec(term_sqrt)
                    else:
                        term_const = i0 * (Fr(243, 100) * b52_ub)
                        if term_sqrt * u4_ref <= term_const * u2_ref:
                            c_u4 += ceil_dec(term_sqrt)
                        else:
                            c_u2 += ceil_dec(term_const)
                else:
                    # Three valid cell bounds on |(h_4(w)*B^{-5/2} - 3*A^{-5/2})| integrated against W*th^2:
                    #   (1) Midpoint 23/40: (h_4(w) - 23/40)*B^{-5/2} + B^{-5/2}*(23/40 - c(s, th))
                    #   (2) Direct c(s, th): B^{-5/2}*(h_4(w) - c(s, th)) -> zero U_l term!
                    #   (3) Sqrt-w branch: |h_4(w) - 3|*B^{-5/2} + 3*(B^{-5/2} - A^{-5/2})
                    t1_u2 = i0 * (Fr(243, 100) * b52_ub)
                    t1_ul = i0 * (b52_ub * max(abs(Fr(23, 40) - c_min), abs(Fr(23, 40) - c_max)))
                    t2_u2 = i0 * (b52_ub * max(3 - c_min, Fr(371, 200) + c_max))
                    t3_ul = min(i0 * (b52_ub * max(Fr(0), 3 - c_min)), i1 * (Fr(15, 2) * sb * b72_ub))

                    v1 = t1_u2 * u2_ref + t1_ul * ul_ref
                    v2 = t2_u2 * u2_ref
                    v3 = term_sqrt * u4_ref + t3_ul * ul_ref
                    if v3 <= v1 and v3 <= v2:
                        c_u4 += ceil_dec(term_sqrt)
                        c_ul += ceil_dec(t3_ul)
                    elif v1 <= v2:
                        c_u2 += ceil_dec(t1_u2)
                        c_ul += ceil_dec(t1_ul)
                    else:
                        c_u2 += ceil_dec(t2_u2)

            env_kl = padd(pscale(u2_poly, c_u2), pscale(u4_poly, c_u4))
            if l in (2, 4) and c_ul != 0:
                env_kl = padd(env_kl, pscale(ul_poly[l], c_ul))
            P_ou = padd(P_ou, pmul(env_kl, w_poly))

    # Bound R(2 E|Z + sqrt(s)q|) <= r_cap * s^3 * chi^{3/2}, so R(E|Z + sqrt(s)q|) <= (r_cap / 2) * s^3 * chi^{3/2}:
    # First find tight rational r_cap > max_{y in [0, 7/8]} (sp_hi / 54) * (3/2)^{3/2} * P_ou(y) / (1/2 + y^2)^{3/2}:
    r_est = Fr(0)
    for m in range(36):
        yv = Fr(m, 40)
        num_v = sp_hi * peval(P_ou, yv)
        # (3/2)^{3/2} / (1/2 + y^2)^{3/2} = (3 / (1 + 2 y^2))^{3/2} <= rat_pow_ub(3 / (1 + 2 y^2), 3, 2)
        fac_v = rat_pow_ub(Fr(3) / (1 + 2 * yv * yv), 3, 2, prec=10**6)
        r_est = max(r_est, (num_v * fac_v) / 54)
    r_cap = ceil_dec(r_est * Fr(1002, 1000), 10**6)
    denom_cubed = ppow([Fr(1, 2), Fr(0), Fr(1)], 3)
    p_scaled = pscale(P_ou, sp_hi)
    q10 = psub(pscale(denom_cubed, (54 * r_cap) ** 2), pscale(pmul(p_scaled, p_scaled), Fr(27, 8)))
    require(positive_on(q10, Fr(0), Fr(7, 8)), "OU r_cap Sturm positivity on [0, 7/8] failed")

    # Now check (R0*sqrt(1+s) - E|Z + sqrt(s)q|) / (s^2 * chi):
    # = -(1/8)*B''_1(s) - sqrt(chi)*s*[ (C6/72)*B'''_1(s) + r_cap/2 ], where B_1(s) = 2*R0*sqrt(1+s)!
    # Wait: 2*E|Z + sqrt(s)q| = B(s) + (delta/4)B''(s) + (kappa6/36)B'''(s) + R_2, with B(s) = sqrt(pi)*sqrt(1+s):
    #   -B''(s)/4 = (sqrt(pi)/16)*(1+s)^{-3/2} >= (sp_lo/16) / rat_pow_ub(1 + sb, 3, 2)
    #   B'''(s)/36 = (3*sqrt(pi)/(8*36))*(1+s)^{-5/2} <= (sp_hi/96) / rat_pow_lb(1 + sa, 5, 2)
    b2_term = (sp_lo / 16) / rat_pow_ub(1 + sb, 3, 2, prec=10**8)
    b3_term = C6 * (sp_hi / 96) / a_lo_52
    sqrt_chi = rat_pow_ub(chi_hi, 1, 2, prec=10**8)
    half_margin = (b2_term - sqrt_chi * sb * (b3_term + r_cap)) / 2
    require(half_margin > 0, f"OU slab [{sa}, {sb}] failed at chi_hi={chi_hi}: margin={fmt_dec(half_margin, 10)}")
    return r_cap, half_margin


# ==============================================================================
# PART 2: COMPLETE-MONOTONICITY RICE CAP BANK & LEVEL-2 MATRIX STEIN IN v
# ==============================================================================
def rice_val_and_deriv_bounds(x, R0_lo, R0_hi):
    x = Fr(x)
    require(0 <= x <= 64, "x out of [0, 64]")
    if x == 0:
        return R0_lo, R0_hi, R0_lo / 2, R0_hi / 2
    z = x / 2
    w = (x * x) / 16
    K_I = 48
    require(w < Fr(1, 8) * ((K_I + 1) ** 2), "Bessel tail ratio")
    i0_l = i0_h = Fr(1)
    i1_l = i1_h = Fr(1)
    t_l = t_h = Fr(1)
    for k in range(1, K_I + 1):
        t_l = floor_dyad(t_l * w / (k * k))
        t_h = ceil_dyad(t_h * w / (k * k))
        i0_l = floor_dyad(i0_l + t_l)
        i0_h = ceil_dyad(i0_h + t_h)
        i1_l = floor_dyad(i1_l + t_l / (k + 1))
        i1_h = ceil_dyad(i1_h + t_h / (k + 1))
    i0_h = ceil_dyad(i0_h + t_h / 7)
    i1_h = ceil_dyad(i1_h + t_h / (7 * (K_I + 2)))
    i1_l = floor_dyad((z / 2) * i1_l)
    i1_h = ceil_dyad((z / 2) * i1_h)

    K_E = 98
    require(z <= Fr(1, 3) * (K_E + 1), "exp tail ratio")
    ez_l = ez_h = Fr(1)
    et_l = et_h = Fr(1)
    for k in range(1, K_E + 1):
        et_l = floor_dyad(et_l * z / k)
        et_h = ceil_dyad(et_h * z / k)
        ez_l = floor_dyad(ez_l + et_l)
        ez_h = ceil_dyad(ez_h + et_h)
    ez_h = ceil_dyad(ez_h + et_h / 2)

    rho_lo = floor_dyad(R0_lo * ((1 + x) * i0_l + x * i1_l) / ez_h)
    rho_hi = ceil_dyad(R0_hi * ((1 + x) * i0_h + x * i1_h) / ez_l)
    dr_lo = floor_dyad((R0_lo / 2) * (i0_l + i1_l) / ez_h)
    dr_hi = ceil_dyad((R0_hi / 2) * (i0_h + i1_h) / ez_l)
    require(0 < rho_lo <= rho_hi and 0 < dr_lo <= dr_hi, "rice bounds ordering")
    return rho_lo, rho_hi, dr_lo, dr_hi


def build_rice_cap_bank(R0_lo, R0_hi):
    x_knots = (
        [Fr(k, 16) for k in range(64)]
        + [Fr(4) + Fr(k, 4) for k in range(48)]
        + [Fr(16 + 2 * k) for k in range(25)]
    )
    vals = [rice_val_and_deriv_bounds(x, R0_lo, R0_hi) for x in x_knots]
    caps = []
    for i in range(len(x_knots) - 1):
        a, b = x_knots[i], x_knots[i + 1]
        h = b - a
        _, fa_h, _, da_h = vals[i]
        _, fb_h, db_l, _ = vals[i + 1]
        d0 = fa_h
        d1 = h * da_h
        d2 = 3 * (fb_h - fa_h) - h * (2 * da_h + db_l)
        d3 = 2 * (fa_h - fb_h) + h * (da_h + db_l)
        e0, e1, e2, e3 = d0, d1 / h, d2 / (h * h), d3 / (h * h * h)
        c0 = e0 - e1 * a + e2 * a * a - e3 * a * a * a
        c1 = e1 - 2 * e2 * a + 3 * e3 * a * a
        c2 = e2 - 3 * e3 * a
        c3 = e3
        c_up = [ceil_dec(cj, S_CAP_DEN) for cj in (c0, c1, c2, c3)]
        caps.append((a, b, c_up))
    # Tail [64, oo): by Cauchy-Schwarz, rho(x) = E|Z + sqrt(x)| <= sqrt(1 + x) < sqrt(x) + 1/16 for all x >= 64
    # since (sqrt(x) + 1/16)^2 = x + sqrt(x)/8 + 1/256 >= x + 1 + 1/256 > 1 + x on [64, oo)!
    caps.append((Fr(64), None, None))
    return caps


def cut_vector(typ, theta):
    m = [Fr(1), Fr(0), Fr(1), Fr(3), Fr(-1)]
    t3 = [Fr(0), Fr(0), Fr(0), Fr(3), Fr(-1)]
    if typ in ("n", "h", "b", "y", "z"):
        a_ = [Fr(0)] * 5
        a_["nhbyz".index(typ)] = Fr(1)
        return a_
    if typ == "bn":
        return [Fr(1), Fr(0), Fr(-1), Fr(0), Fr(0)]
    if typ == "yz":
        return [Fr(0), Fr(0), Fr(0), Fr(-1), Fr(1)]
    if typ == "h0":
        return list(H0_VEC)
    if typ == "m":
        return m
    require(theta is not None and theta > 0, "theta must be positive")
    if typ == "c1":
        return [theta, Fr(1) / theta, Fr(0), Fr(0), Fr(-2)]
    if typ in ("c2+", "c2-"):
        sg = -2 if typ == "c2+" else 2
        return [m[i] / theta + (theta if i == 1 else Fr(0)) + sg * t3[i] for i in range(5)]
    raise ValueError("unknown cut: " + str(typ))


def verify_l2_model_halfline(model, rice_caps):
    """Verify 4x4 Level-2 Matrix Stein inequality q1_base(v) - C_Rice(s0 * v) - quad_form(v) > 0
       across the entire half-line v in [0, oo) via exact integer Sturm sequences.
       Returns parsed model scalars `(s0, lam, l3, dlin)`.
    """
    s0 = Fr(model["s"])
    require(s0 > 0, "model s must be positive")
    u = [Fr(x) for x in model["u_knots"]]
    K = len(u) - 1
    require(K >= 1 and u[0] == 0 and all(u[i] < u[i + 1] for i in range(K)), "invalid u_knots")
    require(isinstance(model["knot_den"], int) and model["knot_den"] > 0, "invalid knot_den")
    kden = Fr(model["knot_den"])

    def get_arr(nm):
        raw = model[nm]
        require(len(raw) == K + 1 and all(isinstance(x, int) for x in raw), "invalid knot array " + nm)
        return [Fr(x, kden) for x in raw]

    phi1, phi2 = get_arr("phi1"), get_arr("phi2")
    phi3, phi4 = get_arr("phi3"), get_arr("phi4")
    psi_a = get_arr("psi_a")
    xi2, xi1, xia = get_arr("xi2"), get_arr("xi1"), get_arr("xia")

    require(len(model["lam"]) == 3 and len(model["slope"]) == 3 and len(model["l3"]) == 3 and len(model["m_ker"]) == 3,
            "invalid model tuple lengths")
    lam0, lam1, lam2 = (Fr(x) for x in model["lam"])
    slope = [Fr(x) for x in model["slope"]]
    require(slope[2] >= 0, "xi2 linear slope must be nonnegative")
    l3 = [Fr(x) for x in model["l3"]]
    m00, m01, m11 = (Fr(x) for x in model["m_ker"])
    mu_a, mu_rho, mu_w, sig = Fr(model["mu_a"]), Fr(model["mu_rho"]), Fr(model["mu_w"]), Fr(model["sigma"])

    require(all(x >= 0 for x in l3) and sum(l3) > 0, "l3 nonnegativity failed")
    lam3 = sum(l3)
    require(m00 >= 0 and m11 > 0 and m00 * m11 - m01 * m01 >= 0, "M_ker PSD failed")
    require(mu_a >= 0 and mu_rho > 0 and mu_w > 0, "mu signs failed")

    for k in range(K + 1):
        require(xi2[k] >= 0 and xi1[k] >= 0 and xia[k] ** 2 <= 4 * xi1[k] * xi2[k], f"C* cone failed at knot {k}")
        require(psi_a[k] >= 0 and psi_a[k] + mu_a - phi4[k] >= 0, f"M33 knot check failed at {k}")
        require(m00 - phi3[k] > 0, f"D1 failed at knot {k}")
        require(m11 * (m00 - phi3[k]) - (m01 - Fr(1, 2) * psi_a[k]) ** 2 > 0, f"D2 failed at knot {k}")

    # Precompute piecewise polynomials on each Stein knot interval [u[k], u[k+1]) and [u[K], oo):
    stein_pieces = []
    G_val = [Fr(0)] * 4
    vv = [Fr(0), Fr(1)]
    vv2 = [Fr(0), Fr(0), Fr(1)]
    for k in range(K + 1):
        tail = (k == K)
        u0 = u[k]
        u1 = None if tail else u[k + 1]
        if tail:
            pc = lambda arr, K=K: ptrim([arr[K]])
        else:
            def pc(arr, k=k, u0=u0, u1=u1):
                sl = (arr[k + 1] - arr[k]) / (u1 - u0)
                return ptrim([arr[k] - sl * u0, sl])

        p1 = padd(pc(phi1), [Fr(0), slope[0]])
        p2 = padd(pc(phi2), [Fr(0), slope[1]])
        p3, p4 = pc(phi3), pc(phi4)
        psa = pc(psi_a)
        x2p, x1p, xap = padd(pc(xi2), [Fr(0), slope[2]]), pc(xi1), pc(xia)
        g1 = pprim(p1, u0, G_val[0])
        g2 = pprim(p2, u0, G_val[1])
        g3 = pprim(p3, u0, G_val[2])
        g4 = pprim(p4, u0, G_val[3])
        if not tail:
            G_val = [peval(g1, u1), peval(g2, u1), peval(g3, u1), peval(g4, u1)]

        vY1, vY2 = psub(pmul(vv, p1), g1), psub(pmul(vv, p2), g2)
        vY3, vY4 = psub(pmul(vv, p3), g3), psub(pmul(vv, p4), g4)
        M11 = psub([m00], p3)
        M12 = psub([m01], pscale(psa, Fr(1, 2)))
        M33 = psub(padd([mu_rho + mu_a], psa), p4)
        D2 = psub(pscale(M11, m11), pmul(M12, M12))
        require(positive_on(D2, u0, u1), f"D2 failed on [{u0}, {u1}] at s={s0}")
        b2_v = pscale(psub([Fr(-2) * m01 - Fr(4) * m11], padd(pscale(p2, Fr(1, 2)), x1p)), Fr(1, 2))
        q1_base = padd([lam0 + m00 + 4 * m01 + 4 * m11, lam1, lam2, lam3], psub(padd(g1, g2), g3))
        g34 = padd(g3, g4)

        vM13 = pscale(padd(vY3, vY4), Fr(-1, 2))
        v2D3 = psub(pmul(vv2, pmul(M33, D2)), pscale(pmul(vM13, vM13), m11))
        v_tau_w = pscale(pmul(g34, g34), Fr(1) / (4 * mu_w))
        vb1 = pscale(psub(pmul(vv, psub(padd(p3, g3), padd(p1, padd([2 * m00 + 4 * m01], x2p)))), v_tau_w), Fr(1, 2))
        vb3 = pscale(psub(padd(pmul(vv, padd([Fr(0), sig], g4)), vY3),
                          padd(padd(vY1, pscale(vY2, Fr(1, 2))), pmul(vv, xap))), Fr(1, 2))
        t11 = pmul(pscale(pmul(vv, M33), m11), pmul(vb1, vb1))
        v2_adj22 = psub(pmul(vv2, pmul(M11, M33)), pmul(vM13, vM13))
        t22 = pmul(vv, pmul(v2_adj22, pmul(b2_v, b2_v)))
        t33 = pmul(pmul(vv, D2), pmul(vb3, vb3))
        t12 = pscale(pmul(vv2, pmul(pmul(M12, M33), pmul(vb1, b2_v))), Fr(-2))
        t13 = pscale(pmul(vM13, pmul(vb1, vb3)), -2 * m11)
        t23 = pscale(pmul(vv, pmul(M12, pmul(vM13, pmul(b2_v, vb3)))), Fr(2))
        v3_quad = padd(padd(t11, t22), padd(t33, padd(t12, padd(t13, t23))))

        if k == 0:
            g34_d = div_xk(g34, 1)
            tau_w_v = pmul(vv, pscale(pmul(g34_d, g34_d), Fr(1) / (4 * mu_w)))
            Y1_v, Y2_v, Y3_v, Y4_v = (div_xk(vy, 1) for vy in (vY1, vY2, vY3, vY4))
            M13_v = pscale(padd(Y3_v, Y4_v), Fr(-1, 2))
            D3_v0 = psub(pmul(M33, D2), pscale(pmul(M13_v, M13_v), m11))
            require(positive_on(D3_v0, u0, u1), f"D3_v failed on [0, {u1}] at s={s0}")
            b1_v = pscale(psub(psub(padd(p3, g3), padd(p1, [2 * m00 + 4 * m01])), padd(tau_w_v, x2p)), Fr(1, 2))
            b3_v = pscale(psub(padd(padd([Fr(0), sig], Y3_v), g4),
                               padd(padd(Y1_v, pscale(Y2_v, Fr(1, 2))), xap)), Fr(1, 2))
            adj11 = pscale(M33, m11)
            adj22 = psub(pmul(M11, M33), pmul(M13_v, M13_v))
            adj33 = D2
            adj12 = pscale(pmul(M12, M33), Fr(-1))
            adj13 = pscale(M13_v, -m11)
            adj23 = pmul(M12, M13_v)
            quad_v0 = padd(
                padd(pmul(adj11, pmul(b1_v, b1_v)), pmul(adj22, pmul(b2_v, b2_v))),
                padd(pmul(adj33, pmul(b3_v, b3_v)),
                     pscale(padd(pmul(adj12, pmul(b1_v, b2_v)),
                                 padd(pmul(adj13, pmul(b1_v, b3_v)), pmul(adj23, pmul(b2_v, b3_v)))), Fr(2))),
            )
        else:
            D3_v0, quad_v0 = None, None
            require(positive_on(v2D3, u0, u1), f"v2D3 failed on [{u0}, {u1}] at s={s0}")

        stein_pieces.append((q1_base, v2D3, v3_quad, D3_v0, quad_v0))

    # Build common refinement of u_knots and scaled Rice cap starts [a / s0]:
    cap_starts = [c[0] / s0 for c in rice_caps]
    v_pts = sorted(set(u + cap_starts))
    require(v_pts[0] == 0, "v_pts must start at 0")
    segments = [(v_pts[i], v_pts[i + 1]) for i in range(len(v_pts) - 1)] + [(v_pts[-1], None)]
    _, sq_s0_hi = sqrt_bounds(s0)

    def poly_v_to_r(pv):
        pv = ptrim(pv)
        if not pv:
            return []
        out = [Fr(0)] * (2 * len(pv) - 1)
        for idx_v, cv in enumerate(pv):
            out[2 * idx_v] = cv
        return ptrim(out)

    for va, vb in segments:
        k_st = bisect.bisect_right(u, va) - 1
        k_cp = bisect.bisect_right(cap_starts, va) - 1
        require(0 <= k_st <= K and 0 <= k_cp < len(rice_caps), "segment index out of range")
        q1_base, v2D3, v3_quad, D3_v0, quad_v0 = stein_pieces[k_st]
        raw_cap = rice_caps[k_cp][2]

        if raw_cap is None:
            require(va > 0 and s0 * va >= Fr(64), "sublinear tail entered below x=64")
            r_lo, _ = sqrt_bounds(va)
            r_hi = None if vb is None else sqrt_bounds(vb)[1]
            r2_q1_net = psub(poly_v_to_r(pmul(vv, q1_base)), [Fr(0), Fr(0), Fr(1, 16), sq_s0_hi])
            r6_D4 = psub(pmul(r2_q1_net, poly_v_to_r(v2D3)), poly_v_to_r(v3_quad))
            require(positive_on(r6_D4, r_lo, r_hi), f"r6_D4 failed on tail [{va}, {vb}] at s={s0}")
        elif va == 0:
            require(k_st == 0 and vb is not None, "va=0 must lie in first finite segment")
            cap_poly = ptrim([cj * (s0**j) for j, cj in enumerate(raw_cap)])
            D4_v = psub(pmul(psub(q1_base, cap_poly), D3_v0), quad_v0)
            require(positive_on(D4_v, va, vb), f"D4_v failed on [0, {vb}] at s={s0}")
        else:
            cap_poly = ptrim([cj * (s0**j) for j, cj in enumerate(raw_cap)])
            v3D4_v = psub(pmul(pmul(vv, psub(q1_base, cap_poly)), v2D3), v3_quad)
            require(positive_on(v3D4_v, va, vb), f"v3D4_v failed on [{va}, {vb}] at s={s0}")

    dlin = [
        16 * m00 + 32 * m01 + 32 * m11,
        4 * m00 + 16 * m11,
        16 * m11 + 32 * (mu_a + mu_rho + sig),
        48 * m01 + 48 * m11 + 24 * (mu_a + mu_rho + mu_w) + 48 * sig,
        16 * m01 + 16 * m11,
    ]
    return dict(s=s0, lam=(lam0, lam1, lam2), l3=tuple(l3), dlin=tuple(dlin))


def eval_model_on_chi_interval(parsed_model, chi_lo, chi_hi, par_cert):
    """Certify an upper bound on E[rho(s0 * U)] valid across ALL chi in [chi_lo, chi_hi]."""
    chi_lo, chi_hi = Fr(chi_lo), Fr(chi_hi)
    require(0 <= chi_lo < chi_hi <= CHI_MAX, "invalid chi interval")
    lam0, lam1, lam2 = parsed_model["lam"]
    l3 = parsed_model["l3"]
    dlin = parsed_model["dlin"]

    al = [Fr(x) for x in par_cert["alpha"]]
    require(len(al) == 2 and all(x > 0 for x in al), "alpha > 0 failed")
    sb_hi = Fr(par_cert["sqrt_ub"])
    require(sb_hi > 0 and sb_hi * sb_hi >= chi_hi, "par sqrt_ub failed")
    dJ = [
        l3[1] * (150 * al[0] * S0_VEC[i] + (198 + Fr(150) / al[0]) * H0_VEC[i])
        + l3[2] * (Fr(135, 2) * al[1] * S0_VEC[i] + (Fr(11781, 32) + Fr(135, 2) / al[1]) * H0_VEC[i])
        for i in range(5)
    ]
    c = [dlin[i] + sb_hi * dJ[i] for i in range(5)]
    eta = Fr(par_cert["eta"])
    resid = [c[i] - eta * EROW[i] for i in range(5)]
    for typ, theta, yv in par_cert["cuts"]:
        yv = Fr(yv)
        require(yv >= 0, "negative cut multiplier")
        a_ = cut_vector(typ, None if theta is None else Fr(theta))
        resid = [resid[i] + yv * a_[i] for i in range(5)]
    L_slope = eta + sum(max(resid[i], Fr(0)) * PMAX[i] for i in range(5))

    # Convex in chi since l3[0] >= 0; evaluate at chi_lo and chi_hi (with upward sqrt(chi)):
    _, sq_lo_ub = sqrt_bounds(chi_lo)
    vals = []
    for ch_e, sq_e in ((chi_lo, sq_lo_ub), (chi_hi, sb_hi)):
        vals.append(
            lam0 + lam1 + lam2 * (2 + ch_e)
            + l3[0] * (6 + 9 * ch_e + C6 * ch_e * sq_e)
            + (l3[1] + l3[2]) * (6 + 9 * ch_e)
            + L_slope * ch_e
        )
    return max(vals)


def tile_curv_kh(sa, sb, ch, pi_lo, R0_lo, R0_hi):
    """Certified upper bound K_hi >= Delta_q''(xi) across all xi in [sa, sb] and chi in [0, ch]."""
    _, sq_ratio_hi = sqrt_bounds((2 + ch) / sa)
    _, sq_1sb_hi = sqrt_bounds(1 + sb)
    f2_ub = R0_hi * min(
        (2 + ch) / 8,
        Fr(43, 150) * sq_ratio_hi / pi_lo,
        Fr(30, 163) / sa,
    )
    b0_curv_lb = R0_lo / (4 * (1 + sb) * sq_1sb_hi)
    return max(f2_ub - b0_curv_lb, Fr(0))


# ==============================================================================
# PART 3: FULL CERTIFICATE VERIFICATION (THEOREMS 1 & 2 + CONSUMERS)
# ==============================================================================
_STATIC_CACHE = []
_MODEL_CACHE = {}


def verify_certificate(cert, quiet=False):
    t_start = time.monotonic()
    require(isinstance(cert, dict), "certificate must be a JSON object")
    verify_lean_moment_constants()
    require(Fr(cert["s_sharp_max"]) == S_SHARP_MAX, "s_sharp_max must equal 5/8")

    e_lb = sum(Fr(1, factorial(k)) for k in range(6))
    require(e_lb == Fr(163, 60) and (Fr(43, 100) ** 2) * 2 * e_lb > 1, "exp curvature constants")

    if not _STATIC_CACHE:
        pi_lo, pi_hi, R0_lo, R0_hi = verify_pi_and_r0()
        n_low_boxes = verify_low_s_regime()
        upper_table, l_u4 = verify_ou_envelopes_and_table()
        th_knots, w_table = build_ou_theta_table()
        rice_caps = build_rice_cap_bank(R0_lo, R0_hi)
        _STATIC_CACHE.append((pi_lo, pi_hi, R0_lo, R0_hi, n_low_boxes, upper_table, l_u4, th_knots, w_table, rice_caps))
    pi_lo, pi_hi, R0_lo, R0_hi, n_low_boxes, upper_table, l_u4, th_knots, w_table, rice_caps = _STATIC_CACHE[0]

    # 1. Verify OU slabs covering [1/6, 5/8] x (0, chi_ou]:
    ou_slabs_raw = cert["ou_slabs"]
    require(isinstance(ou_slabs_raw, list) and len(ou_slabs_raw) >= 1, "ou_slabs must be non-empty")
    ou_slabs = []
    cur_s = Fr(1, 6)
    min_ou_margin = None
    for row in ou_slabs_raw:
        sa, sb, chi_ou = Fr(row["s_lo"]), Fr(row["s_hi"]), Fr(row["chi_hi"])
        require(sa == cur_s and sa < sb <= S_SHARP_MAX and chi_ou >= Fr(11, 2000), "invalid ou_slab continuity")
        _, marg = certify_ou_slab(sa, sb, chi_ou, R0_lo, R0_hi, upper_table, l_u4, th_knots, w_table)
        min_ou_margin = marg if min_ou_margin is None else min(min_ou_margin, marg)
        ou_slabs.append((sa, sb, chi_ou))
        cur_s = sb
    require(cur_s == S_SHARP_MAX, "ou_slabs must reach 5/8")

    # 2. Verify all Level-2 Matrix Stein models on v in [0, oo):
    models_raw = cert["models"]
    require(isinstance(models_raw, dict) and len(models_raw) >= 1, "models must be non-empty dict")
    parsed_models = {}
    for mid, mdata in models_raw.items():
        require(mid not in parsed_models, f"duplicate model id {mid}")
        mkey = json.dumps(mdata, sort_keys=True)
        if mkey not in _MODEL_CACHE:
            _MODEL_CACHE[mkey] = verify_l2_model_halfline(mdata, rice_caps)
        parsed_models[mid] = _MODEL_CACHE[mkey]

    pars_raw = cert["pars"]
    require(isinstance(pars_raw, dict) and len(pars_raw) >= 1, "pars must be non-empty dict")
    used_pars = set()

    def get_par(pid):
        pid = str(pid)
        require(pid in pars_raw, f"unknown par id {pid}")
        used_pars.add(pid)
        return pars_raw[pid]

    # 3. Verify 2D Stein tiles covering [1/6, 5/8] x [chi_start(s), 42]:
    tiles_raw = cert["sharp_tiles"]
    require(isinstance(tiles_raw, list) and len(tiles_raw) >= 1, "sharp_tiles must be non-empty")
    used_models = set()
    tiles = []
    min_tile_clear = None

    def b0_lb(s_val):
        sq_l, _ = sqrt_bounds(1 + s_val)
        return R0_lo * sq_l

    for trow in tiles_raw:
        sl, sh = Fr(trow["s_lo"]), Fr(trow["s_hi"])
        cl, ch = Fr(trow["chi_lo"]), Fr(trow["chi_hi"])
        require(Fr(1, 6) <= sl < sh <= S_SHARP_MAX and 0 < cl < ch <= CHI_MAX, "invalid sharp_tile bounds")
        m_left, m_right = str(trow["model_left"]), str(trow["model_right"])
        require(m_left in parsed_models and m_right in parsed_models, "unknown model id in sharp_tile")
        used_models.update((m_left, m_right))
        sa = parsed_models[m_left]["s"]
        sb = parsed_models[m_right]["s"]
        require(sa <= sl < sh <= sb, f"model s-bracket [{sa}, {sb}] does not enclose [{sl}, {sh}]")

        ub_a = eval_model_on_chi_interval(parsed_models[m_left], cl, ch, get_par(trow["par_left"]))
        ub_b = eval_model_on_chi_interval(parsed_models[m_right], cl, ch, get_par(trow["par_right"]))
        d_a = b0_lb(sa) - ub_a
        d_b = b0_lb(sb) - ub_b
        chord_min = min(((sb - s_e) * d_a + (s_e - sa) * d_b) / (sb - sa) for s_e in (sl, sh))
        z_pk = min(sh, max(sl, (sa + sb) / 2))
        curv_loss = Fr(1, 2) * tile_curv_kh(sa, sb, ch, pi_lo, R0_lo, R0_hi) * (z_pk - sa) * (sb - z_pk)
        clear = chord_min - curv_loss
        require(clear > 0, f"nonpositive sharp_tile clearance {fmt_dec(clear, 10)} on [{sl},{sh}]x[{cl},{ch}]")
        min_tile_clear = clear if min_tile_clear is None else min(min_tile_clear, clear)
        tiles.append((sl, sh, cl, ch))

    # Independent strip-sweep verification that OU slabs + sharp_tiles cover [1/6, 5/8] x [0, 42] with no gap:
    s_cuts = sorted({Fr(1, 6), S_SHARP_MAX} | {s_e for sa, sb, _ in ou_slabs for s_e in (sa, sb)}
                    | {s_e for sl, sh, _, _ in tiles for s_e in (sl, sh)})
    for s0, s1 in zip(s_cuts[:-1], s_cuts[1:]):
        ou_chi = max((co for sa, sb, co in ou_slabs if sa <= s0 and s1 <= sb), default=Fr(0))
        require(ou_chi > 0, f"missing OU coverage on s-strip [{s0}, {s1}]")
        chi_ivs = sorted((cl, ch) for sl, sh, cl, ch in tiles if sl <= s0 and s1 <= sh)
        require(bool(chi_ivs), f"no Stein tiles on s-strip [{s0}, {s1}]")
        require(chi_ivs[0][0] <= ou_chi, f"gap between OU chi={ou_chi} and Stein chi_lo={chi_ivs[0][0]} on [{s0}, {s1}]")
        frontier = chi_ivs[0][1]
        for cl, ch in chi_ivs[1:]:
            require(cl <= frontier, f"chi gap on [{s0}, {s1}] between {frontier} and {cl}")
            if ch > frontier:
                frontier = ch
        require(frontier == CHI_MAX, f"chi cover stops at {frontier} < 42 on [{s0}, {s1}]")

    # 4. Verify Corollary 1a (Exact Remote-Energy Frontier down to sqrt(2*pi/13) < 0.695215 < 0.70):
    t_front_ub = Fr(cert["t_frontier_ub"])
    require(t_front_ub == Fr(139043, 200000), "t_frontier_ub must equal 139043/200000")
    require(2 * pi_hi < 13 * (t_front_ub**2) and t_front_ub < Fr(7, 10) and t_front_ub < Fr(751, 1000),
            "exact remote frontier threshold check failed")

    # 5. Verify Theorem 2: Mid-t buffered Rice curve R_buf(s_j) for s_j > 5/8 and #628 ATK P3 §5 closure on [0, 61/100]:
    midt_nodes_raw = cert["midt_nodes"]
    require(isinstance(midt_nodes_raw, list) and len(midt_nodes_raw) >= 1, "midt_nodes must be non-empty")
    rbuf_map = {S_SHARP_MAX: ceil_dec(R0_hi * sqrt_bounds(1 + S_SHARP_MAX)[1], 10**10)}
    min_midt_clear = None
    for nrow in midt_nodes_raw:
        sj = Fr(nrow["s"])
        rcap = Fr(nrow["r_buf"])
        chi_ou_j = Fr(nrow["chi_ou"])
        require(sj > S_SHARP_MAX and sj not in rbuf_map, f"invalid or duplicate midt_node s={sj}")
        # Check [0, chi_ou_j] has E|Z + sqrt(sj)q| < R0*sqrt(1+sj) <= rcap:
        b0_j_hi = R0_hi * sqrt_bounds(1 + sj)[1]
        require(rcap >= b0_j_hi, f"midt r_buf below Gaussian floor at s={sj}")
        certify_ou_slab(sj, sj, chi_ou_j, R0_lo, R0_hi, upper_table, l_u4, th_knots, w_table)
        # Check Stein strips cover [chi_ou_j, 42] with upper bound < rcap:
        strips = nrow["strips"]
        require(isinstance(strips, list) and len(strips) >= 1, "empty midt strips")
        cur_c = None
        for st in strips:
            cl, ch = Fr(st["chi_lo"]), Fr(st["chi_hi"])
            mid = str(st["model"])
            require(mid in parsed_models and parsed_models[mid]["s"] == sj, "midt model mismatch")
            used_models.add(mid)
            if cur_c is None:
                require(cl <= chi_ou_j, f"midt gap above chi_ou at s={sj}")
                cur_c = ch
            else:
                require(cl <= cur_c and ch > cur_c, f"midt chi gap at s={sj}")
                cur_c = ch
            ub_st = eval_model_on_chi_interval(parsed_models[mid], cl, ch, get_par(st["par"]))
            cl_margin = rcap - ub_st
            require(cl_margin > 0, f"midt strip exceeded r_buf at s={sj}, [{cl},{ch}]")
            min_midt_clear = cl_margin if min_midt_clear is None else min(min_midt_clear, cl_margin)
        require(cur_c == CHI_MAX, f"midt strips do not reach 42 at s={sj}")
        rbuf_map[sj] = rcap

    require(used_models == set(parsed_models.keys()), "unused Stein model present in certificate")
    require(used_pars == set(pars_raw.keys()), "unused par certificate present in certificate")

    # Verify #628 ATK P3 §5 remote cubic closure V(f, g) < 500/701 across ALL t in [0, 61/100]:
    p3 = cert["p3_remote_closure"]
    t_p3_max = Fr(p3["t_max"])
    require(t_p3_max == Fr(61, 100), "p3 t_max must equal 61/100")
    eps_d5, eta_d5, tau_d5 = Fr(39, 50), Fr(779, 10000), Fr(500, 701)
    rho_rev = Fr(2287, 2500)  # independently reviewed P + C global radius (STATUS 3.7)

    segs = p3["segments"]
    require(isinstance(segs, list) and len(segs) >= 2, "p3 segments must be non-empty")
    cur_t = Fr(0)
    min_p3_margin = None
    for seg in segs:
        ta, tb = Fr(seg["t_lo"]), Fr(seg["t_hi"])
        require(ta == cur_t and ta < tb <= t_p3_max, "p3 segment continuity failed")
        mode = seg["mode"]
        if mode == "unbuffered_2287_2500":
            # V <= (1 - eta)*t^2 + eta + (eps - eta)*rho_rev^2, increasing in t on [ta, tb]:
            v_hi = (1 - eta_d5) * (tb**2) + eta_d5 + (eps_d5 - eta_d5) * (rho_rev**2)
            m_seg = tau_d5 - v_hi
            require(m_seg > 0, "p3 unbuffered segment failed")
        elif mode == "buffered_rice":
            sj = Fr(seg["s"])
            require(sj in rbuf_map, f"unknown s={sj} in p3 segment")
            rb = rbuf_map[sj]
            require(tb < rb, "tb must lie below r_buf(s)")
            # On [ta, tb], Q_rem(t) <= (rb - t)^2 / sj, so V(t) <= P_quad(t) := (1 - eta)*t^2 + eta + ((eps - eta)/sj)*(rb - t)^2,
            # which is a convex quadratic in t (leading coeff (1 - eta) + (eps - eta)/sj > 0), maximized at an endpoint {ta, tb}!
            v_a = (1 - eta_d5) * (ta**2) + eta_d5 + ((eps_d5 - eta_d5) / sj) * ((rb - ta) ** 2)
            v_b = (1 - eta_d5) * (tb**2) + eta_d5 + ((eps_d5 - eta_d5) / sj) * ((rb - tb) ** 2)
            m_seg = tau_d5 - max(v_a, v_b)
            require(m_seg > 0, f"p3 buffered segment [{ta}, {tb}] at s={sj} failed")
        else:
            raise ValueError("unknown p3 segment mode: " + str(mode))
        min_p3_margin = m_seg if min_p3_margin is None else min(min_p3_margin, m_seg)
        cur_t = tb
    require(cur_t == t_p3_max, "p3 segments must reach 61/100")
    require(
        min_p3_margin is not None and min_p3_margin > ADVERTISED_P3_RESERVE,
        f"p3 minimum reserve {fmt_dec(min_p3_margin or 0, 8)} does not exceed advertised {ADVERTISED_P3_RESERVE}",
    )

    # Enforce exact Theorem 2.1 node list and rational R_buf(s_j) bounds:
    cert_node_list = [Fr(nrow["s"]) for nrow in midt_nodes_raw]
    adv_node_list = [sj for sj, _ in ADVERTISED_MIDT_NODES]
    require(cert_node_list == adv_node_list, f"midt_nodes s-list {cert_node_list} != {adv_node_list}")
    for sj, r_adv in ADVERTISED_MIDT_NODES:
        require(rbuf_map[sj] <= r_adv, f"r_buf({sj}) = {rbuf_map[sj]} exceeds advertised {r_adv}")

    # Verify finite-dimensional unimodular barrier witness at t = 618/1000, A = 2017/5000 (STATUS 3.5a):
    t_fail = Fr(618, 1000)
    a_fail = Fr(2017, 5000)
    require(t_fail**2 + a_fail < pi_lo / 4, "barrier point (0.618, 0.4034) is not strictly inside pi/4 disk")
    v_rhs_fail = (1 - eta_d5) * (t_fail**2) + eta_d5 + (eps_d5 - eta_d5) * a_fail
    require(v_rhs_fail > tau_d5, "finite-dimensional barrier tightness check at t=0.618, A=0.4034 failed")

    elapsed_ms = int((time.monotonic() - t_start) * 1000)
    if not quiet:
        print(f"PASS ({elapsed_ms} ms): Sharp buffered cubic radius on [0, 5/8] & mid-t P3 remote closure on [0, 61/100].")
        print(f"  Low-s [0, 1/6] boxes: {n_low_boxes}; OU slabs on [1/6, 5/8]: {len(ou_slabs)} (min margin/s^2*chi = {fmt_dec(min_ou_margin, 8)}).")
        print(f"  Half-line Level-2 Matrix Stein models: {len(parsed_models)}; 2D tiles: {len(tiles)} (min clearance = {fmt_dec(min_tile_clear, 10)}).")
        print(f"  Mid-t R_buf nodes: {len(midt_nodes_raw)} (min strip clearance = {fmt_dec(min_midt_clear, 10)}); P3 [0, 61/100] min reserve = {fmt_dec(min_p3_margin, 8)}.")
    return dict(
        low_boxes=n_low_boxes,
        ou_slabs=len(ou_slabs),
        models=len(parsed_models),
        tiles=len(tiles),
        min_tile_clear=min_tile_clear,
        min_p3_margin=min_p3_margin,
    )


def main():
    args = [a for a in sys.argv[1:] if a != "--quiet"]
    quiet = "--quiet" in sys.argv[1:]
    cert_path = pathlib.Path(args[0]) if args else DEFAULT_CERT
    cert = json.loads(cert_path.read_text(encoding="utf-8"))
    verify_certificate(cert, quiet=quiet)


if __name__ == "__main__":
    main()
