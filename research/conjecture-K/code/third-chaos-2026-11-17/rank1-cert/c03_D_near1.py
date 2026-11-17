# claude-b9ee research worker, 17 Nov 2026. Rank-one bound on the real third chaos, part (i), the range near a = 1.
# Certifies D_1(p) < 0 and D_2(p) < 0 for every p in [p1, 1), p1 = 1 - 2^-10, with the notation of c02_D_grid.py.
# Here eps = 1 - p, 1 + p(h3^2 - 1) = p h3^2 + eps, L = (1/2) ln(1/eps) >= L1 = (1/2) ln(2^10). PROOF.md section 3.2
# splits [0, inf) into A = [0, r0], M = [r0, b-], B = [b-, b+] (around sqrt3), R = [b+, inf) and proves
#   D_k(p) <= -(alpha_k - beta_k) L + K0_k   for every p in [p1, 1),
#   alpha_k = w0_k / sqrt(3/2),  w0_1 = phi(0), w0_2 = phi(0)/2                      (region A, by hand)
#   beta_k  = v_k(sqrt3) (1/k- + 1/k+),  v_k = n_k phi,  k- = sqrt(p1) c(b-),  k+ = sqrt(p1) sqrt6,
#             c(x) = x(x + sqrt3)/sqrt6                                              (region B, by hand)
#   K0_k    = A-constant + B-constant + C_rest, where C_rest bounds the integral over M and R of the larger of the
#             values at p = p1 and p = 1 (the integrand is monotone in p there and h3 has no zero there).
# The script computes all constants in Arb and checks alpha_k > beta_k and -(alpha_k - beta_k) L1 + K0_k < 0.
# Run: python3 -I c03_D_near1.py   (python-flint 0.9.0)
import sys, flint
from flint import arb, acb, ctx, fmpq
ctx.prec = 128
S3 = arb(3).sqrt(); S6 = arb(6).sqrt(); PHI0 = 1/(2*arb.pi()).sqrt()
def h3(z): return (z**3 - 3*z)/S6
def phi(z): return (-(z*z)/2).exp()*PHI0
def n1(z): return z*z - 1
def n2(z):
    u = z*z - 1; return u*u/2 - 1
def dv1(x): return x*(3 - x*x)*phi(x)                      # (n1 phi)'
def dv2(x):                                                 # (n2 phi)' = x (1 + 2u - u^2/2) phi, u = x^2 - 1
    u = x*x - 1; return x*(1 + 2*u - u*u/2)*phi(x)
NUM = {1: n1, 2: n2}; DV = {1: dv1, 2: dv2}
def ex(q):
    x = arb(q); assert x.rad() == 0, q; return x
def integ(f, a, b):
    r = acb.integral(f, ex(a), ex(b)); assert r.real.is_finite(); return r.real
FAIL = []
def check(name, cond):
    print(('PASS ' if cond else 'FAIL ') + name)
    if not cond: FAIL.append(name)
def fP(num, p):                       # n phi (1 + p(h3^2 - 1))^(-1/2), p rational in [0, 1)
    pa = arb(p)
    def f(z, an):
        h = h3(z); return num(z)*phi(z)*(1 + pa*(h*h - 1)).rsqrt(analytic=an)
    return f
def f1(num, sgn):                     # value at p = 1: n phi / |h3|, with |h3| = sgn*h3 on the piece (meromorphic)
    def f(z, an):
        return num(z)*phi(z)/(sgn*h3(z))
    return f
def sliver(fs, lo, hi):
    X = acb(ex(lo).union(ex(hi)))
    return max(f(X, False).real.upper() for f in fs)*(ex(hi) - ex(lo))
def dyadic_bracket(g, lo, hi, bits=30):
    a, b = lo, hi
    for _ in range(100):
        m = (a + b)/2
        if float(g(arb(m)).mid()) < 0: a = m
        else: b = m
    k = int(a*2**bits)
    L, R = fmpq(k, 2**bits), fmpq(k + 1, 2**bits)
    return L, R, bool(g(ex(L)) < 0 and g(ex(R)) > 0)
def sup_on(g, lo, hi, N=512):         # rigorous upper bound of g on [lo, hi] (lo, hi arb) by N sub-balls
    best = None
    for j in range(N):
        a = lo + (hi - lo)*j/N; b = lo + (hi - lo)*(j + 1)/N
        u = g(a.union(b)).upper()
        best = u if best is None or u > best else best
    return best
XS = dyadic_bracket(lambda x: h3(x)**2 - 1, 1.9, 2.2)
XI = dyadic_bracket(n2, 1.4, 1.7)
check('x* in [%s, %s], both > sqrt3' % (XS[0], XS[1]), XS[2] and ex(XS[0]) > S3)
check('xi in [%s, %s], both > 1' % (XI[0], XI[1]), XI[2] and ex(XI[0]) > 1)
XMAX = 12
def tail(k):
    X = arb(XMAX); ph = phi(X)
    return ((X + 1/X)*ph if k == 1 else (X**3 + 3*X + 3/X)*ph/2).upper()
# parameters
E1 = fmpq(1, 2**10); P1 = 1 - E1
R0, BM, BP = fmpq(1, 2), fmpq(13, 8), fmpq(15, 8)
check('parameters: 0 < r0 <= 1/2 < 1, r0^2 <= 3/4, xi < b- < sqrt3 < b+ < x*', R0 <= fmpq(1, 2) and ex(XI[1]) < ex(BM) and ex(BM) < S3 and S3 < ex(BP) and ex(BP) < ex(XS[0]))
print('python-flint', flint.__version__, ' prec', ctx.prec, 'bits;  p1 = 1 - 2^-10, r0 = %s, b- = %s, b+ = %s' % (R0, BM, BP))
sq15 = arb(fmpq(3, 2)).sqrt()
L1 = (1/ex(E1)).log()/2
sp1 = ex(P1).sqrt()
km = sp1*ex(BM)*(ex(BM) + S3)/S6; kp = sp1*S6
lm = S3 - ex(BM); lp = ex(BP) - S3
zm = km*lm/ex(E1).sqrt(); zp = kp*lp/ex(E1).sqrt()       # asinh arguments at eps = eps1 (they grow as eps decreases)
for k in (1, 2):
    num = NUM[k]
    # region A = [0, r0]: n_k < 0; contribution <= -alpha (ln(2 r0 sqrt(3/2)) + L) + R_A
    w0 = PHI0 if k == 1 else PHI0/2
    alpha = w0/sq15
    RA = PHI0*sq15*ex(R0)**2/2 if k == 1 else arb(0)        # D1: w >= phi(0)(1 - 3x^2/2); D2: w >= w(0) for x^2 <= 3/4
    Aconst = -alpha*(2*ex(R0)*sq15).log() + RA
    # region B = [b-, b+]: n_k > 0; v = n_k phi <= v(sqrt3) + V'- (sqrt3 - x) on the left, + V'+ (x - sqrt3) on the right
    vs = num(S3)*phi(S3)
    Vm = max(arb(0), sup_on(lambda x: -DV[k](x), ex(BM), S3.upper()))
    Vp = max(arb(0), sup_on(lambda x: DV[k](x), S3.lower(), ex(BP)))
    beta = vs*(1/km + 1/kp)
    Bconst = (vs*(((2*km*lm).log() + 1/(4*zm*zm))/km + ((2*kp*lp).log() + 1/(4*zp*zp))/kp)
              + Vm*lm/km + Vp*lp/kp)
    # rest M = [r0, b-] and R = [b+, inf): larger of the values at p1 and at p = 1
    lo1 = fP(num, P1)
    if k == 1:   # [r0,1]: n<0,h3^2<1 -> p1 | [1,b-]: n>0,h3^2<1 -> 1 | [b+,x*]: -> 1 | [x*,inf): n>0,h3^2>1 -> p1
        parts = [integ(lo1, R0, 1).upper(), integ(f1(num, -1), 1, BM).upper(), integ(f1(num, +1), BP, XS[0]).upper(),
                 sliver([lo1, f1(num, +1)], XS[0], XS[1]), integ(lo1, XS[1], XMAX).upper(), tail(1)]
    else:        # [r0,xi]: p1 | [xi,b-]: 1 | [b+,x*]: 1 | [x*,inf): p1
        parts = [integ(lo1, R0, XI[0]).upper(), sliver([lo1, f1(num, -1)], XI[0], XI[1]), integ(f1(num, -1), XI[1], BM).upper(),
                 integ(f1(num, +1), BP, XS[0]).upper(), sliver([lo1, f1(num, +1)], XS[0], XS[1]),
                 integ(lo1, XS[1], XMAX).upper(), tail(2)]
    Crest = sum(parts[1:], parts[0])
    K0 = Aconst + Bconst + Crest
    bound = (-(alpha - beta)*L1 + K0).upper()
    print('D%d: alpha = %s  beta = %s  A-const = %s  B-const = %s (V\'- = %s, V\'+ = %s)  C_rest = %s  K0 = %s  L1 = %s' % (
        k, alpha.str(8), beta.str(8), Aconst.str(6), Bconst.str(6), Vm.str(3, radius=False), Vp.str(3, radius=False), Crest.str(6), K0.str(6), L1.str(8)))
    check('D%d: alpha > beta' % k, alpha > beta)
    check('D%d(p) <= -(alpha - beta) L1 + K0 <= %s < 0 for every p in [1 - 2^-10, 1)' % (k, bound.str(6, radius=False)), bound < 0)
print('RESULT:', 'ALL CHECKS PASSED' if not FAIL else 'FAILED: %s' % FAIL)
sys.exit(1 if FAIL else 0)
