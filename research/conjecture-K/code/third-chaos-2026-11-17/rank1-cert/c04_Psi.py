# claude-b9ee research worker, 17 Nov 2026. Rank-one bound with the dimension-free remainder bound (REVIEW2 item G3).
# With W the maximising direction, F = a h3(W) + W Q2(W') + R3(W'), b = ||Q2||, c = ||R3||, a^2 + b^2 + c^2 = 1:
#   E|F| <= Phi(a^2, b^2, c^2),  Phi(p, t, r) = E min{ f1, f2 },
#   f1 = sqrt(p h3(W)^2 + t W^2 + r),  f2 = sqrt(p h3(W)^2 + t W^2) + K sqrt(r),
#   K = sqrt(4/(7(cos^3(pi/7) - cos^3(3pi/7)))) = 0.8906614 (E|G| <= K ||G||_2 on the third chaos, every dimension).
# Phi is jointly concave on [0, inf)^3 and Phi(0, 0, 1) = K. PROOF.md section 5 reduces "Phi < T whenever a >= a0" to
# the single slice p = a0^2, r = s - t, s = 1 - a0^2, t in [0, s] (one-sided concavity argument), and bounds the slice
# by a tangent line: for any choice i(w) of a branch and any t0 in (0, s), concavity of each branch in t gives
#   Phi(p0, t, s - t) <= V + (t - t0) G  for all t in [0, s],  V = E f_i(t0),  G = E d/dt f_i(t0),
# so the slice supremum is at most max(V - t0 G, V + (s - t0) G). t0 is the numerical maximiser and i(w) the numerically
# smaller branch at t0 (pieces with dyadic ends); neither choice affects rigour, only tightness.
# Part 2 gives certified LOWER bounds of Phi on the slice (pieces where the sign of f1 - f2 is certified by interval
# subdivision): they show where the method fails, and bracket its thresholds.
# Run: python3 -I c04_Psi.py   (python-flint 0.9.0)
import sys, flint
from flint import arb, acb, ctx, fmpq
ctx.prec = 128
S3 = arb(3).sqrt(); S6 = arb(6).sqrt(); PHI0 = 1/(2*arb.pi()).sqrt(); PI = arb.pi()
K = (4/(7*((PI/7).cos()**3 - (3*PI/7).cos()**3))).sqrt()
def h3(z): return (z**3 - 3*z)/S6
def phi(z): return (-(z*z)/2).exp()*PHI0
def ex(q):
    x = arb(q); assert x.rad() == 0, q; return x
def integ(f, a, b):
    r = acb.integral(f, ex(a), ex(b)); assert r.real.is_finite(); return r.real
FAIL = []
def check(name, cond):
    print(('PASS ' if cond else 'FAIL ') + name)
    if not cond: FAIL.append(name)
XMAX = 12
def funcs(p, t, s):
    """integrands on w >= 0 (all are even in w): values v1, v2 and t-derivatives g1, g2 of the two branches at (p, t, s - t).
    For w >= 0, sqrt(p h3^2 + t w^2) = w sqrt(p (3 - w^2)^2/6 + t), whose radicand is >= t > 0 on the real line."""
    pa, ta, sa = arb(p), arb(t), arb(s)
    Kc = K*(sa - ta).sqrt(); Kd = K/(2*(sa - ta).sqrt())
    def v1(z, an):
        h = h3(z); return (pa*h*h + sa + ta*(z*z - 1)).sqrt(analytic=an)*phi(z)
    def g1(z, an):
        h = h3(z); return (z*z - 1)*(pa*h*h + sa + ta*(z*z - 1)).rsqrt(analytic=an)*phi(z)/2
    def v2(z, an):
        u = 3 - z*z; return (z*(pa*u*u/6 + ta).sqrt(analytic=an) + Kc)*phi(z)
    def g2(z, an):
        u = 3 - z*z; return (z*(pa*u*u/6 + ta).rsqrt(analytic=an)/2 - Kd)*phi(z)
    return v1, g1, v2, g2
def dval(p, t, s, W):
    """f1 - f2 at a real point or ball W >= 0"""
    pa, ta, sa = arb(p), arb(t), arb(s); h = h3(W); u = 3 - W*W
    return (pa*h*h + sa + ta*(W*W - 1)).sqrt() - (W*(pa*u*u/6 + ta).sqrt() + K*(sa - ta).sqrt())
def crossings(p, t, s):
    """numerical sign changes of f1 - f2 on (0, XMAX), as dyadic rationals (2^-40); also the branch on the first piece"""
    df = lambda w: float(dval(p, t, s, arb(w)).mid())
    grid = sorted(set([j*0.002 for j in range(1, 6000)] + [1.65 + j*1e-4 for j in range(1701)]))
    vals = [df(w) for w in grid]
    cr = []
    for j in range(len(grid) - 1):
        if (vals[j] < 0) != (vals[j + 1] < 0):
            a, b, fa = grid[j], grid[j + 1], vals[j]
            for _ in range(50):
                m = (a + b)/2; fm = df(m)
                if (fm < 0) == (fa < 0): a, fa = m, fm
                else: b = m
            cr.append(fmpq(int(round(a*2**40)), 2**40))
    first = 1 if df(1e-9) < 0 else 2                                 # f1 < f2 means branch 1 is the smaller one
    return cr, first
def tangent(p, t0, s, cr, first):
    """enclosures of V = E f_i(t0) and G = E d/dt f_i(t0) for the branch choice (cr, first); tail [XMAX, inf) on branch 1"""
    v1, g1, v2, g2 = funcs(p, t0, s)
    pts = [fmpq(0)] + cr + [fmpq(XMAX)]
    V = arb(0); G = arb(0); br = first
    for j in range(len(pts) - 1):
        V += integ(v1 if br == 1 else v2, pts[j], pts[j + 1]); G += integ(g1 if br == 1 else g2, pts[j], pts[j + 1])
        br = 3 - br
    assert br == 2, 'the last piece must be on branch 1 (the tail bounds are for branch 1)'
    X = arb(XMAX); ph = phi(X)
    tv = (X*X + 2)*ph                                                # f1 <= w^3 for w >= 12
    tg = (X + 1/X)*ph/(2*(arb(s) - arb(t0)).sqrt())                  # |d/dt f1| <= w^2/(2 sqrt(s - t0))
    return 2*V.lower(), 2*(V.upper() + tv.upper()), 2*(G.lower() - tg.upper()), 2*(G.upper() + tg.upper())
def tmax(p, s, lo=1e-5, hi=0.01):
    """numerical maximiser of t -> Phi(p, t, s - t): bisection on the sign of G (concave, so G is decreasing)"""
    def Gm(t):
        tq = fmpq(int(t*2**40), 2**40); cr, first = crossings(p, tq, s)
        r = tangent(p, tq, s, cr, first); return float(((r[2] + r[3])/2).mid())
    assert Gm(lo) > 0 and Gm(hi) < 0
    for _ in range(36):
        m = (lo + hi)/2
        if Gm(m) > 0: lo = m
        else: hi = m
    return fmpq(int(round((lo + hi)/2*2**40)), 2**40)
def slice_upper(a0):
    """certified upper bound for sup_{t in [0, s]} Phi(a0^2, t, s - t); returns (bound, t0, V_up, G enclosure)"""
    p = fmpq(a0)*fmpq(a0); s = 1 - p
    t0 = tmax(p, s); cr, first = crossings(p, t0, s)
    Vlo, Vup, Glo, Gup = tangent(p, t0, s, cr, first)
    b0 = (Vup - ex(t0)*Glo).upper()                                  # line at t = 0 (exact upper end)
    bs = (Vup + (arb(s) - ex(t0))*Gup).upper()                       # line at t = s (exact upper end)
    return (b0 if b0 > bs else bs), t0, Vup, Glo, Gup, cr, first     # comparison of exact numbers is decisive
def sign_on(p, t, s, lo, hi, depth=0):
    """certified constant sign of f1 - f2 on [lo, hi] (exact arbs): +1, -1, or None"""
    d = dval(p, t, s, lo.union(hi))
    if d > 0: return 1
    if d < 0: return -1
    if depth >= 44: return None
    m = (lo + hi)/2
    a = sign_on(p, t, s, lo, m, depth + 1); b = sign_on(p, t, s, m, hi, depth + 1)
    return a if (a is not None and a == b) else (None if (a is None or b is None) else 0)
def phi_lower(a, t):
    """certified LOWER bound of Phi(a^2, t, s - t): on pieces where the sign of f1 - f2 is certified the min is the
    smaller branch; the slivers (width 2^-36) around the crossings and the tail contribute >= 0"""
    p = fmpq(a)*fmpq(a); s = 1 - p
    cr, first = crossings(p, t, s)
    v1, g1, v2, g2 = funcs(p, t, s)
    eps = fmpq(1, 2**36)
    ends = [fmpq(0)]
    for c in cr: ends += [c - eps, c + eps]
    ends.append(fmpq(XMAX))
    total = arb(0)
    for j in range(0, len(ends) - 1, 2):                             # pieces [ends[j], ends[j+1]] avoid the slivers
        lo, hi = ex(ends[j]), ex(ends[j + 1])
        sg = None
        # split each piece into 64 parts for the sign check (sign_on refines further where needed)
        parts = [lo + (hi - lo)*k/64 for k in range(65)]
        sgs = [sign_on(p, t, s, parts[k], parts[k + 1]) for k in range(64)]
        if any(x is None or x == 0 for x in sgs) or len(set(sgs)) != 1: return None
        sg = sgs[0]
        total += integ(v2 if sg > 0 else v1, ends[j], ends[j + 1]).lower()   # f1 - f2 > 0: min is f2
    return 2*total
T_W = arb(fmpq(17, 25)).sqrt(); T_S = (2/arb.pi()).sqrt()
print('python-flint', flint.__version__, ' prec', ctx.prec, 'bits;  K =', K.str(15), ' K^2 =', (K*K).str(12))
check('K > sqrt(17/25) and K > sqrt(2/pi) (the vertex (0,0,1) is above both targets)', K > T_W and K > T_S)
TARGETS = [('weak  sqrt(17/25)', T_W, fmpq(7931, 10000), fmpq(7930, 10000), fmpq(79264, 100000)),
           ('sharp sqrt(2/pi) ', T_S, fmpq(8339, 10000), fmpq(8338, 10000), fmpq(83362, 100000))]
print('Part 1: certified slice suprema at the clean values (tangent line at the numerical maximiser t0)')
for name, T, a0, a_fail, a_rev in TARGETS:
    bd, t0, Vup, Glo, Gup, cr, first = slice_upper(a0)
    print('  %s: a0 = %s, t0 = %.7f, first piece on branch %d, crossings %s' % (name, float(a0), float(t0), first, ['%.6f' % float(c) for c in cr]))
    print('     V <= %s, G in [%s, %s], sup_t Phi(a0^2, t, s - t) <= %s, target %s' % (Vup.str(12, radius=False), Glo.str(4, radius=False), Gup.str(4, radius=False), bd.str(12, radius=False), T.str(12)))
    check('%s: sup over the slice a = %s is < target, margin >= %s' % (name, float(a0), (T.lower() - bd).str(4, radius=False)), bd < T.lower())
print('Part 2: certified lower bounds at the values of REVIEW2 item G3 (where the bound fails)')
for name, T, a0, a_fail, a_rev in TARGETS:
    p = a_rev*a_rev; t1 = tmax(p, 1 - p)
    lb = phi_lower(a_rev, t1)
    check('%s: at a = %s, Phi(a^2, t, s - t) >= %s > target for t = %.7f (b^2 = t, c^2 = s - t)' % (
        name, float(a_rev), lb.str(10, radius=False) if lb is not None else '?', float(t1)), lb is not None and lb > T.upper())
print('Part 3: brackets of the thresholds of this bound (slice supremum = target), resolution 1e-5')
for name, T, a0, a_fail, a_rev in TARGETS:
    lo, hi = a_fail, a0                                              # float bisection on the certified upper bound
    while hi - lo > fmpq(1, 10**5):
        m = fmpq(int((lo + hi)*10**5/2), 10**5)
        if m == lo: m = lo + fmpq(1, 10**5)
        if m >= hi: break
        if slice_upper(m)[0] < T.lower(): hi = m
        else: lo = m
    p = lo*lo; t1 = tmax(p, 1 - p)
    lb = phi_lower(lo, t1); ub = slice_upper(hi)[0]
    check('%s: the threshold lies in (%s, %s]: sup over the slice >= %s > target at a = %s, <= %s < target at a = %s' % (
        name, float(lo), float(hi), lb.str(10, radius=False) if lb is not None else '?', float(lo), ub.str(10, radius=False), float(hi)),
        lb is not None and lb > T.upper() and ub < T.lower())
print('RESULT:', 'ALL CHECKS PASSED' if not FAIL else 'FAILED: %s' % FAIL)
sys.exit(1 if FAIL else 0)
