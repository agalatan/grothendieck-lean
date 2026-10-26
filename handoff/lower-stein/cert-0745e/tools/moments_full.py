"""Rigorous polar Gaussian cell moments for the FULL circle (standard library only: integers / fractions).
dgamma = (2 r e^{-r^2} dr) x (dtheta / 2 pi).
  RAD[i][k] = int_{r_i}^{r_{i+1}} 2 r^{k+1} e^{-r^2} dr,  r_i = 8 i / NR,  k = 0..12          (local Taylor enclosure, remainder bound)
  TAIL[k]   = int_8^inf 2 r^{k+1} e^{-r^2} dr                                                   (exact recurrence + erfc bound)
  ANG[j]    = (1/2pi) int_{th_j}^{th_{j+1}} (1, cos th, cos 2th, cos 3th, cos 4th, sin th, sin 2th, sin 3th, sin 4th) dth,  th_j = 2 pi j / NQ
Every value is an interval [lo, hi] of rationals with lo <= true <= hi; written out as float pairs rounded OUTWARD (lo down, hi up).
usage: moments_full.py NR NQ out.json"""
import sys, json, math
from fractions import Fraction as F
P = 2 ** 220                                   # working grid for outward rounding of intermediate rationals
def dn(x): return F(math.floor(x * P), P)
def up(x): return F(math.ceil(x * P), P)
def exp_neg(q):
    """[lo, hi] containing e^{-q}, q >= 0 rational: e^{-q} = (e^{-x})^(2^k), x = q / 2^k <= 1/2, alternating Taylor bounds."""
    k = 0
    while q / 2 ** k > F(1, 2): k += 1
    x = q / 2 ** k; term = F(1); s = F(1); lo = hi = None; n = 0
    while True:
        n += 1; term = -term * x / n; s2 = s + term
        if n >= 30:                                 # alternating series with decreasing terms: the sum lies between consecutive partial sums
            lo, hi = (s2, s) if term < 0 else (s, s2); break
        s = s2
    lo, hi = dn(lo), up(hi); assert 0 < lo <= hi
    for _ in range(k): lo, hi = dn(lo * lo), up(hi * hi)
    return lo, hi
def atan_inv(n, terms=80):
    """atan(1/n) in [lo, hi] (alternating series, decreasing terms)."""
    x = F(1, n); s = F(0); p = x; prev = None
    for j in range(terms):
        t = p / (2 * j + 1); prev = s; s = s + (t if j % 2 == 0 else -t); p = p * x * x
    return (min(s, prev), max(s, prev))
a5, a239 = atan_inv(5), atan_inv(239)
PI = (dn(16 * a5[0] - 4 * a239[1]), up(16 * a5[1] - 4 * a239[0])); assert F(314159265, 10**8) < PI[0] < PI[1] < F(314159266, 10**8)
def sin_cos_pt(x):
    """sin x, cos x for rational 0 <= x <= 1: alternating Taylor series (terms decrease), every term and partial sum enclosed by
    outward rounding to the 2^-220 grid; the value lies between the last two partial sums."""
    x2 = x * x
    def ser(start):
        tl = th = F(x ** start) / math.factorial(start); tl, th = dn(tl), up(th); sl = sh = F(0); prev = None
        for j in range(30):
            prev = (sl, sh)
            if j % 2 == 0: sl, sh = dn(sl + tl), up(sh + th)
            else: sl, sh = dn(sl - th), up(sh - tl)
            k = start + 2 * j; tl, th = dn(tl * x2 / ((k + 1) * (k + 2))), up(th * x2 / ((k + 1) * (k + 2)))
        return (min(sl, prev[0]), max(sh, prev[1]))
    return ser(1), ser(0)
def sincos_2pi_frac(f):
    """[lo,hi] of sin(2 pi f), cos(2 pi f) for rational f in [0,1): reduce to x = 2 pi g, g in [0, 1/8], using exact symmetries."""
    f = f % 1; q = int(f * 4); g = f - F(q, 4)                         # f = q/4 + g, g in [0, 1/4)
    sw = g > F(1, 8)
    if sw: g = F(1, 4) - g                                              # sin(2pi(1/4 - g)) = cos(2pi g)
    xlo, xhi = dn(2 * PI[0] * g), up(2 * PI[1] * g)                            # x in [xlo, xhi] subset [0, pi/4 + tiny] ; sin increasing, cos decreasing there
    (sl, _), (_, ch) = sin_cos_pt(xlo); (_, sh), (cl, _) = sin_cos_pt(xhi)
    S, C = (sl, sh), (cl, ch)
    if sw: S, C = C, S
    for _ in range(q): S, C = C, (-S[1], -S[0])                          # rotate by pi/2: sin(a + pi/2) = cos a, cos(a + pi/2) = -sin a
    return (dn(S[0]), up(S[1])), (dn(C[0]), up(C[1]))
def radial(NR, N=12, deg=12):
    R = F(8); h = R / (2 * NR); out = []
    for j in range(NR):
        c = (2 * j + 1) * h; Y = 2 * c * h + h * h; assert Y < 1
        el, eh = exp_neg(c * c)
        # P_N(t) = sum_{n<=N} x^n/n!, x = -2ct - t^2  (polynomial in t)
        pol = [F(0)] * (2 * N + 1); pw = [F(1)]
        for n in range(N + 1):
            for i, v in enumerate(pw): pol[i] += v / math.factorial(n)
            nw = [F(0)] * (len(pw) + 2)
            for i, v in enumerate(pw): nw[i + 1] += -2 * c * v; nw[i + 2] += -v
            pw = nw
        rem = Y ** (N + 1) / math.factorial(N + 1) / (1 - Y)
        row = []
        for k in range(deg + 1):
            if k == 0: cur = [c, F(1)]                                       # cur = coefficients of (c + t)^{k+1} in t
            else:
                cur = [F(0)] * (len(prevp) + 1)
                for i, v in enumerate(prevp): cur[i] += c * v; cur[i + 1] += v
            prevp = cur
            prod = [F(0)] * (len(pol) + len(cur) - 1)
            for i, a in enumerate(pol):
                if a:
                    for jj, b in enumerate(cur): prod[i + jj] += a * b
            integ = sum(2 * prod[i] * 2 * h ** (i + 1) / (i + 1) for i in range(0, len(prod), 2))       # int_{-h}^{h} 2 * prod(t) dt
            err = 2 * (2 * h) * (c + h) ** (k + 1) * rem                    # times e^{-c^2} (upper) below
            lo = el * integ - eh * err if integ >= 0 else eh * integ - eh * err
            hi = eh * integ + eh * err if integ >= 0 else el * integ + eh * err
            row.append((max(F(0), dn(lo)), up(hi)))
        out.append(row)
    return out
def tail(deg=12):
    R = F(8); el, eh = exp_neg(R * R); g = (F(0), eh / (2 * R)); J = [(el, eh), (R * el + g[0], R * eh + g[1])]
    for k in range(2, deg + 1): J.append((R ** k * el + F(k, 2) * J[k - 2][0], R ** k * eh + F(k, 2) * J[k - 2][1]))
    return [(dn(a), up(b)) for a, b in J]
def angular(NQ):
    tab = [sincos_2pi_frac(F(k, NQ)) for k in range(NQ)]
    def sc(n, j): return tab[(n * j) % NQ]
    rows = []
    for j in range(NQ):
        row = [(F(1, NQ), F(1, NQ))]
        for n in range(1, 5):                                               # (1/2pi) int cos(n th) = (sin(n th1) - sin(n th0)) / (2 pi n)
            (s1, _), (s0, _) = sc(n, j + 1), sc(n, j); num = (s1[0] - s0[1], s1[1] - s0[0])
            row.append(idiv(num, (2 * n * PI[0], 2 * n * PI[1])))
        for n in range(1, 5):                                               # (1/2pi) int sin(n th) = (cos(n th0) - cos(n th1)) / (2 pi n)
            (_, c1), (_, c0) = sc(n, j + 1), sc(n, j); num = (c0[0] - c1[1], c0[1] - c1[0])
            row.append(idiv(num, (2 * n * PI[0], 2 * n * PI[1])))
        rows.append([(dn(a), up(b)) for a, b in row])
    return rows
def idiv(a, b):
    q = [x / y for x in a for y in b]; return (min(q), max(q))
def fdn(x):
    f = float(x); return f if F(f) <= x else math.nextafter(f, -math.inf)
def fup(x):
    f = float(x); return f if F(f) >= x else math.nextafter(f, math.inf)
def ff(iv): return [fdn(iv[0]), fup(iv[1])]
if __name__ == "__main__":
    NR, NQ, out = int(sys.argv[1]), int(sys.argv[2]), sys.argv[3]
    rad = radial(NR); tl = tail(); ang = angular(NQ)
    for k in range(13):                                                     # normalization: sum = Gamma(1 + k/2)
        lo = sum(r[k][0] for r in rad) + tl[k][0]; hi = sum(r[k][1] for r in rad) + tl[k][1]
        tgt = math.gamma(1 + k / 2); assert float(lo) - 1e-12 * tgt <= tgt <= float(hi) + 1e-12 * tgt, (k, float(lo), tgt, float(hi))
    for n in range(9):
        lo = sum(a[n][0] for a in ang); hi = sum(a[n][1] for a in ang); tgt = 1.0 if n == 0 else 0.0; assert float(lo) - 1e-14 <= tgt <= float(hi) + 1e-14
    json.dump(dict(NR=NR, NQ=NQ, rad=[[ff(v) for v in r] for r in rad], tail=[ff(v) for v in tl], ang=[[ff(v) for v in a] for a in ang],
                   note="intervals [lo, hi] (floats, outward); RAD over r in [8i/NR, 8(i+1)/NR]; ANG cos0..4, sin1..4 over [2pi j/NQ, 2pi (j+1)/NQ] normalised by 1/2pi"), open(out, 'w'))
    print(f"moments NR={NR} NQ={NQ}: normalization checks passed; max radial width {max(v[1]-v[0] for r in rad for v in r):.2e}; written {out}")
