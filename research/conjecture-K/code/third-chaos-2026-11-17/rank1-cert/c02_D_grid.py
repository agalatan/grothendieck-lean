# claude-b9ee research worker, 17 Nov 2026. Rank-one bound on the real third chaos, part (i), grid range.
# With p = a^2, h3 = (x^3 - 3x)/sqrt6, phi the N(0,1) density and n1 = x^2 - 1, n2 = (x^2 - 1)^2/2 - 1 (= psi2^2 - 1):
#   D_k(p) = (1/2) E[n_k(W)/sqrt(1 + p(h3(W)^2 - 1))] = int_0^inf n_k(x) phi(x) (1 + p(h3^2 - 1))^(-1/2) dx.
# Certifies D_1(p) < 0 and D_2(p) < 0 for every p in [(79/100)^2, 1 - 2^-10], i.e. a in [0.79, 0.99951...].
# Method (PROOF.md section 3.1): for fixed x the integrand is monotone in p (increasing iff n_k(x)(h3(x)^2 - 1) < 0),
# so on [p_lo, p_hi] it is at most its value at p_lo where n_k (h3^2 - 1) > 0 and at p_hi where it is < 0. The sign
# changes are at x = 1 (n1), x = xi = sqrt(1 + sqrt2) (n2) and x = x* (h3(x*)^2 = 1, x* = 2.0484); each irrational one
# is enclosed in a dyadic interval of width 2^-30, where the larger of both endpoint values is bounded in ball arithmetic.
# Run: python3 -I c02_D_grid.py   (python-flint 0.9.0)
import sys, flint
from flint import arb, acb, ctx, fmpq
ctx.prec = 128
S3 = arb(3).sqrt(); S6 = arb(6).sqrt(); PHI0 = 1/(2*arb.pi()).sqrt()
def h3(z): return (z**3 - 3*z)/S6
def phi(z): return (-(z*z)/2).exp()*PHI0
def n1(z): return z*z - 1
def n2(z):
    u = z*z - 1; return u*u/2 - 1
NUM = {1: n1, 2: n2}
def ex(q):
    x = arb(q); assert x.rad() == 0, q; return x
def integ(f, a, b):
    r = acb.integral(f, ex(a), ex(b)); assert r.real.is_finite(); return r.real
FAIL = []
def check(name, cond):
    print(('PASS ' if cond else 'FAIL ') + name)
    if not cond: FAIL.append(name)
def fP(num, p):                       # n phi (1 + p(h3^2 - 1))^(-1/2); p rational in [0, 1)
    pa = arb(p)
    def f(z, an):
        h = h3(z); return num(z)*phi(z)*(1 + pa*(h*h - 1)).rsqrt(analytic=an)
    return f
def sliver(fs, lo, hi):               # upper bound for int_lo^hi max_j f_j (real ball evaluation on [lo, hi])
    X = acb(ex(lo).union(ex(hi)))
    return max(f(X, False).real.upper() for f in fs)*(ex(hi) - ex(lo))
def dyadic_bracket(g, lo, hi, bits=30):   # g increasing on [lo, hi] with one sign change; returns verified dyadic bracket
    a, b = lo, hi
    for _ in range(100):
        m = (a + b)/2
        if float(g(arb(m)).mid()) < 0: a = m
        else: b = m
    k = int(a*2**bits)
    L, R = fmpq(k, 2**bits), fmpq(k + 1, 2**bits)
    return L, R, bool(g(ex(L)) < 0 and g(ex(R)) > 0)
XS = dyadic_bracket(lambda x: h3(x)**2 - 1, 1.9, 2.2)
XI = dyadic_bracket(n2, 1.4, 1.7)
check('x* in [%s, %s] (h3^2 - 1 < 0 at the left end, > 0 at the right end; both > sqrt3)' % (XS[0], XS[1]), XS[2] and ex(XS[0]) > S3)
check('xi in [%s, %s] (n2 < 0 at the left end, > 0 at the right end; both > 1)' % (XI[0], XI[1]), XI[2] and ex(XI[0]) > 1)
XMAX = 12
def tail(k):                          # >= int_XMAX^inf |n_k| phi >= int of |integrand| (h3^2 >= 1 there); Q(X) <= phi(X)/X
    X = arb(XMAX); ph = phi(X)
    return ((X + 1/X)*ph if k == 1 else (X**3 + 3*X + 3/X)*ph/2).upper()
def U(k, plo, phi_):
    """upper bound for sup_{p in [plo, phi_]} D_k(p)"""
    num = NUM[k]; lo, hi = fP(num, plo), fP(num, phi_)
    xsL, xsR = XS[0], XS[1]
    if k == 1:   # [0,1]: n<0, h3^2<1 -> plo | [1,x*]: n>0, h3^2<1 -> phi_ | [x*,inf): n>0, h3^2>1 -> plo
        s = integ(lo, 0, 1).upper() + integ(hi, 1, xsL).upper() + sliver([lo, hi], xsL, xsR) + integ(lo, xsR, XMAX).upper()
    else:        # [0,xi]: plo | [xi,x*]: phi_ | [x*,inf): plo
        s = (integ(lo, 0, XI[0]).upper() + sliver([lo, hi], XI[0], XI[1]) + integ(hi, XI[1], xsL).upper()
             + sliver([lo, hi], xsL, xsR) + integ(lo, xsR, XMAX).upper())
    return s + tail(k)
P0 = fmpq(79, 100)**2
P1 = 1 - fmpq(1, 2**10)
grid = [P0] + [1 - fmpq(1, 2**j) for j in range(2, 11)]
assert grid[-1] == P1 and all(grid[i] < grid[i+1] for i in range(len(grid) - 1))
print('python-flint', flint.__version__, ' prec', ctx.prec, 'bits; p-range [%s, %s] = a in [0.79, %s]' % (P0, P1, arb(P1).sqrt().str(8)))
worst = {1: None, 2: None}
for k in (1, 2):
    stack = [(grid[i], grid[i+1], 0) for i in range(len(grid) - 1)][::-1]
    n = 0
    while stack:
        plo, phi_, depth = stack.pop()
        u = U(k, plo, phi_)
        if u < 0:
            n += 1
            print('  D%d: p in [%.8f, %.8f]  sup D%d <= %s' % (k, float(plo), float(phi_), k, u.str(6, radius=False)))
            worst[k] = u if worst[k] is None or u > worst[k] else worst[k]
        elif depth < 12:
            m = (plo + phi_)/2; stack += [(m, phi_, depth + 1), (plo, m, depth + 1)]
        else:
            check('D%d bound on [%s, %s]' % (k, plo, phi_), False); break
    check('D%d(p) < 0 for all p in [(79/100)^2, 1 - 2^-10] (%d intervals); sup D%d <= %s' % (k, n, k, worst[k].str(6, radius=False)), worst[k] is not None and worst[k] < 0)
print('RESULT:', 'ALL CHECKS PASSED' if not FAIL else 'FAILED: %s' % FAIL)
sys.exit(1 if FAIL else 0)
