#!/usr/bin/env python3
"""Table entries of the cap moment integrals for `Grothe/LowerAnalytic/CapTables.lean`.

The one-dimensional integrals of the polar grid of `Grothe/LowerAnalytic/CapGrid.lean`

    radI a b m = int_a^b 2 r^(m+1) e^(-r^2) dr          (ring [i h, (i+1) h], i < Nr)
    tailI R m  = int_R^oo 2 r^(m+1) e^(-r^2) dr         (R = Nr h)
    angC/angS  = (1/2pi) int cos / sin (n t) dt         (cell [thN N j, thN N (j+1)], j < N)

are enclosed by an exact (fractions.Fraction) mirror of the computable Lean enclosures
`CapTab.radEncList`, `CapTab.tailEnc`, `GrotheKernel.angEnc`; each enclosure is then rounded outward
to the dyadic grid 2^-bits, so the Lean checker `CapTab.tablesOK` accepts the printed entries
(it recomputes the enclosures and checks `lo <= enc.lo` and `enc.hi <= hi`).

Output: one entry per line, in the format read by `CapTab.parseEntries`:

    r <a> <b> <m> <lo> <hi>       radI a b m
    t <R> <m> <lo> <hi>           tailI R m
    c <N> <j> <n> <lo> <hi>       angC (thN N j) (thN N (j+1)) n
    s <N> <j> <n> <lo> <hi>       angS (thN N j) (thN N (j+1)) n

with rationals written `p/q` (or `p`).  The radial entries of one ring are consecutive (the Lean
checker caches the shared work of a ring and the ball table of one N).

Usage:
    python3 tools/gen_cap_tables.py --h 1/200 --Nr 1600 --N 1024 [--mmax 16] [--nmax 12]
        [--nonneg] [--bits 110] [--out FILE] [--lean NAME] [--selftest]
    python3 tools/gen_cap_tables.py --pi        (the witnesses of `pi_gt_d30`, `pi_lt_d30`)

`--lean NAME` writes a Lean declaration `def NAME : String := "..."` instead of the plain list.
Constraints checked by Lean: 0 <= a <= b <= 8, 1 <= R <= 16, m <= 16, 4 <= N <= 4096, |n| <= 12.
"""

import argparse
import math
import sys
from fractions import Fraction as Q

# ---------------------------------------------------------------- the exact mirror of CapTab

PREC = 260
ANGP = 128


def floorq(q):
    return q.numerator // q.denominator


def ceilq(q):
    return -((-q.numerator) // q.denominator)


def rd_down(q, p):
    return Q(floorq(q * 2 ** p), 2 ** p)


def rd_up(q, p):
    return Q(ceilq(q * 2 ** p), 2 ** p)


def padd(p, q):
    n = max(len(p), len(q))
    p = p + [Q(0)] * (n - len(p))
    q = q + [Q(0)] * (n - len(q))
    return [x + y for x, y in zip(p, q)]


def psmul(c, p):
    return [c * x for x in p]


def pmul(p, q):
    if not p:
        return []
    return padd(psmul(p[0], q), [Q(0)] + pmul(p[1:], q))


def pint(p, d, al, be):
    s = Q(0)
    for i, a in enumerate(p):
        e = d + i + 1
        s += a * (be ** e - al ** e) / e
    return s


def exp_poly(u, n):
    r1, r2 = [], [Q(1)]
    for k in range(n):
        r1, r2 = padd(r1, r2), psmul(Q(1, k + 1), pmul(r2, u))
    return r1, r2


def exp_tay(x, n):
    s, t = Q(0), Q(1)
    for k in range(n):
        s, t = s + t, t * x / (k + 1)
    return s, t


def exp_rem(y, n):
    return y ** n * (Q(n + 1) / (math.factorial(n) * n))


def exp_neg_enc(x):
    y = x / 2 ** 10
    T = exp_tay(-y, 30)[0]
    E = exp_rem(y, 30)
    lo, hi = max(Q(0), rd_down(T - E, PREC)), rd_up(T + E, PREC)
    for _ in range(10):
        lo, hi = rd_down(lo ** 2, PREC), rd_up(hi ** 2, PREC)
    return lo, hi


def rad_terms(U):
    return 16 if U <= Q(1, 16) else (30 if U <= Q(1, 2) else 40)


def rad_enc_list(a, b):
    c = (a + b) / 2
    h = (b - a) / 2
    U = 2 * c * h + h ** 2
    if not U <= 1:
        return [(Q(0), 2 * (b - a) * b ** (k + 1)) for k in range(17)]
    n = rad_terms(U)
    S = exp_poly([Q(0), -2 * c, Q(-1)], n)[0]
    E = exp_rem(U, n)
    X = exp_neg_enc(c ** 2)
    Ms = [pint(S, p, -h, h) for p in range(18)]
    out = []
    for k in range(17):
        base = 2 * sum(math.comb(k + 1, p) * c ** (k + 1 - p) * Ms[p] for p in range(k + 2))
        rem = E * (2 * (b ** (k + 2) - a ** (k + 2)) / (k + 2))
        jl, jh = base - rem, base + rem
        out.append((rd_down(X[0] * jl if jl >= 0 else X[1] * jl, PREC),
                    rd_up(X[1] * jh if jh >= 0 else X[0] * jh, PREC)))
    return out


def tail_enc(R, k):
    X = exp_neg_enc(R ** 2)
    p1, p2 = (Q(0), X[1] / R), X
    for m in range(k + 1):
        p1, p2 = p2, (R ** (m + 1) * X[0] + Q(m + 1, 2) * p1[0],
                      R ** (m + 1) * X[1] + Q(m + 1, 2) * p1[1])
    return rd_down(p1[0], PREC), rd_up(p1[1], PREC)


PI_LO = Q(3141592653589793238462643383279, 10 ** 30)
PI_HI = Q(3141592653589793238462643383280, 10 ** 30)


def nrm1(B):
    return abs(B[0]) + abs(B[1])


def cmul(A, B):
    return (A[0] * B[0] - A[1] * B[1], A[0] * B[1] + A[1] * B[0],
            A[2] * (nrm1(B) + B[2]) + B[2] * nrm1(A))


def cround(B):
    r, i = rd_down(B[0], ANGP), rd_down(B[1], ANGP)
    return (r, i, rd_up(B[2] + (B[0] - r) + (B[1] - i), ANGP))


def exp_i_ball(y):
    sr, si, tr, ti = Q(0), Q(0), Q(1), Q(0)
    for k in range(30):
        sr, si, tr, ti = sr + tr, si + ti, -ti * y / (k + 1), tr * y / (k + 1)
    return (sr, si, exp_rem(abs(y), 30))


def unit_ball(N, m):
    yr = 2 * PI_LO * m / (8 * N)
    y0 = rd_down(yr, ANGP)
    d = (yr - y0) + 2 * (PI_HI - PI_LO) * m / (8 * N)
    B0 = exp_i_ball(y0)
    B = (B0[0], B0[1], rd_up(B0[2] + d, ANGP))
    B2 = cround(cmul(B, B))
    B4 = cround(cmul(B2, B2))
    return cround(cmul(B4, B4))


def mulq(x, y):
    ps = [x[0] * y[0], x[0] * y[1], x[1] * y[0], x[1] * y[1]]
    return (min(min(ps[0], ps[1]), min(ps[2], ps[3])), max(max(ps[0], ps[1]), max(ps[2], ps[3])))


def ang_from(N, n, Ba, Bb):
    sg = Q((-1) ** n)
    dsin = (Bb[1] - Bb[2] - (Ba[1] + Ba[2]), Bb[1] + Bb[2] - (Ba[1] - Ba[2]))
    dcos = (Ba[0] - Ba[2] - (Bb[0] + Bb[2]), Ba[0] + Ba[2] - (Bb[0] - Bb[2]))
    f = (1 / (2 * PI_HI * n), 1 / (2 * PI_LO * n))
    c = mulq(mulq((sg, sg), dsin), f)
    s = mulq(mulq((sg, sg), dcos), f)
    return ((rd_down(c[0], ANGP), rd_up(c[1], ANGP)), (rd_down(s[0], ANGP), rd_up(s[1], ANGP)))


def ang_enc(table, N, j, n):
    """`GrotheKernel.angEnc N j n` from `table = [unit_ball(N, m) for m < N]`."""
    k = abs(n)
    if k == 0:
        e = ((Q(1, N), Q(1, N)), (Q(0), Q(0)))
    else:
        e = ang_from(N, k, table[k * j % N], table[k * (j + 1) % N])
    if n >= 0:
        return e
    return (e[0], (-e[1][1], -e[1][0]))

# ---------------------------------------------------------------- output


def fq(q):
    return str(q.numerator) if q.denominator == 1 else f"{q.numerator}/{q.denominator}"


def outward(e, bits):
    return rd_down(e[0], bits), rd_up(e[1], bits)


def entries(h, Nr, N, mmax, nmax, nonneg, bits, log=None):
    assert 0 < h and Nr * h <= 8 and 4 <= N <= 4096 and mmax <= 16 and nmax <= 12
    lines = []
    for i in range(Nr):
        a, b = i * h, (i + 1) * h
        L = rad_enc_list(a, b)
        for m in range(mmax + 1):
            lo, hi = outward(L[m], bits)
            lines.append(f"r {fq(a)} {fq(b)} {m} {fq(lo)} {fq(hi)}")
        if log and i % 100 == 99:
            print(f"  ring {i + 1}/{Nr}", file=log)
    R = Nr * h
    if R >= 1:
        for m in range(mmax + 1):
            lo, hi = outward(tail_enc(R, m), bits)
            lines.append(f"t {fq(R)} {m} {fq(lo)} {fq(hi)}")
    table = [unit_ball(N, m) for m in range(N)]
    ns = range(0, nmax + 1) if nonneg else range(-nmax, nmax + 1)
    for j in range(N):
        for n in ns:
            e = ang_enc(table, N, j, n)
            lo, hi = outward(e[0], bits)
            lines.append(f"c {N} {j} {n} {fq(lo)} {fq(hi)}")
            lo, hi = outward(e[1], bits)
            lines.append(f"s {N} {j} {n} {fq(lo)} {fq(hi)}")
    return lines

# ---------------------------------------------------------------- sanity check (floats)


def simpson(f, a, b, k=2000):
    s = f(a) + f(b)
    hh = (b - a) / k
    for i in range(1, k):
        s += (4 if i % 2 else 2) * f(a + i * hh)
    return s * hh / 3


def selftest(lines):
    bad = 0
    for ln in lines[::max(1, len(lines) // 400)]:
        w = ln.split()
        lo, hi = float(Q(w[-2])), float(Q(w[-1]))
        if w[0] == 'r':
            a, b, m = float(Q(w[1])), float(Q(w[2])), int(w[3])
            v = simpson(lambda r: 2 * r ** (m + 1) * math.exp(-r * r), a, b)
        elif w[0] == 't':
            R, m = float(Q(w[1])), int(w[2])
            v = simpson(lambda r: 2 * r ** (m + 1) * math.exp(-r * r), R, R + 12, 20000)
        else:
            N, j, n = int(w[1]), int(w[2]), int(w[3])
            ta, tb = -math.pi + 2 * math.pi * j / N, -math.pi + 2 * math.pi * (j + 1) / N
            g = math.cos if w[0] == 'c' else math.sin
            v = simpson(lambda t: g(n * t), ta, tb) / (2 * math.pi)
        tol = 1e-10 * max(1.0, abs(v)) + 1e-14
        if not (lo - tol <= v <= hi + tol):
            bad += 1
            print("SELFTEST MISMATCH", ln[:120], v, file=sys.stderr)
    print(f"selftest: {bad} mismatches", file=sys.stderr)
    return bad == 0

# ---------------------------------------------------------------- the pi witnesses


def pi_witnesses(n=55, digits=140):
    P = 10 ** digits

    def sqrt_round(fr, up):
        v = fr * P * P
        r = math.isqrt(floorq(v))
        if up:
            while Q(r * r) < v:
                r += 1
        return Q(r, P)
    lo_w, hi_w, x, y = [], [], Q(0), Q(0)
    for _ in range(n):
        x = sqrt_round(2 + x, True)
        lo_w.append(x)
        y = sqrt_round(2 + y, False)
        hi_w.append(y)
    assert lo_w[-1] <= 2 - (PI_LO / 2 ** (n + 1)) ** 2
    assert 2 - ((PI_HI - Q(1, 4 ** n)) / 2 ** (n + 1)) ** 2 <= hi_w[-1] and Q(1, 4 ** n) <= PI_HI
    print("pi_lower_bound [\n    " + ",\n    ".join(map(fq, lo_w)) + "]")
    print("pi_upper_bound [\n    " + ",\n    ".join(map(fq, hi_w)) + "]")


def main():
    ap = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument('--h', type=Q, help='radial step (rational, e.g. 1/200)')
    ap.add_argument('--Nr', type=int, help='number of rings')
    ap.add_argument('--N', type=int, help='number of angular cells')
    ap.add_argument('--mmax', type=int, default=16)
    ap.add_argument('--nmax', type=int, default=12)
    ap.add_argument('--nonneg', action='store_true', help='only n >= 0')
    ap.add_argument('--bits', type=int, default=110, help='outward rounding to 2^-bits')
    ap.add_argument('--out', default='-')
    ap.add_argument('--lean', default=None, help='emit `def NAME : String := "..."`')
    ap.add_argument('--selftest', action='store_true')
    ap.add_argument('--pi', action='store_true')
    a = ap.parse_args()
    if a.pi:
        pi_witnesses()
        return
    lines = entries(a.h, a.Nr, a.N, a.mmax, a.nmax, a.nonneg, a.bits, log=sys.stderr)
    if a.selftest and not selftest(lines):
        sys.exit(1)
    text = "\n".join(lines) + "\n"
    if a.lean:
        text = f"def {a.lean} : String := \"\n" + text + "\"\n"
    if a.out == '-':
        sys.stdout.write(text)
    else:
        with open(a.out, 'w') as f:
            f.write(text)
    print(f"{len(lines)} entries", file=sys.stderr)


if __name__ == '__main__':
    main()
