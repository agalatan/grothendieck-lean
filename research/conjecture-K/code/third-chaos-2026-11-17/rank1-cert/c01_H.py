# claude-b9ee research worker, 17 Nov 2026. Rank-one bound on the real third chaos, part (ii): values of
#   H(a) = E sqrt(a^2 h3(W)^2 + 1 - a^2),  h3 = (x^3 - 3x)/sqrt6,  W ~ N(0,1),
# in Arb ball arithmetic (python-flint). Certifies H(a_w) < sqrt(17/25) at a_w = 0.7964 and H(a_s) < sqrt(2/pi) at
# a_s = 0.8362, and brackets the two threshold values (H is strictly decreasing, PROOF.md section 2).
# Run: python3 -I c01_H.py   (python-flint 0.9.0)
import sys, flint
from flint import arb, acb, ctx, fmpq
ctx.prec = 128
S6 = arb(6).sqrt(); PHI0 = 1/(2*arb.pi()).sqrt()                 # PHI0 = phi(0)
def h3(z): return (z**3 - 3*z)/S6
def phi(z): return (-(z*z)/2).exp()*PHI0
def ex(q):                                                         # exact (dyadic) endpoint
    x = arb(q); assert x.rad() == 0, q; return x
def integ(f, a, b):                                                # rigorous enclosure of int_a^b f (f real on the segment)
    r = acb.integral(f, ex(a), ex(b)); assert r.real.is_finite(); return r.real
FAIL = []
def check(name, cond):
    print(('PASS ' if cond else 'FAIL ') + name)
    if not cond: FAIL.append(name)
XMAX = 12
def H(a):
    """(lower, upper) bounds for H(a), a a rational in (0, 1)."""
    p = arb(fmpq(a)*fmpq(a))                                      # ball containing a^2
    def f(z, an):                                                  # sqrt(1 + p(h3^2 - 1)) phi: analytic where the argument avoids (-inf, 0]
        h = h3(z); return (1 + p*(h*h - 1)).sqrt(analytic=an)*phi(z)
    I = integ(f, 0, XMAX)
    X = arb(XMAX); tail = (X*X + 2)*phi(X)/S6                      # int_X^inf |h3| phi >= int_X^inf sqrt(1 + p(h3^2-1)) phi (h3^2 >= 1 there)
    return 2*I.lower(), 2*(I.upper() + tail.upper())
def show(x): return x.str(12, radius=False)
T_W = arb(fmpq(17, 25)).sqrt(); T_S = (2/arb.pi()).sqrt()
print('python-flint', flint.__version__, ' prec', ctx.prec, 'bits;  sqrt(17/25) =', T_W.str(15), ' sqrt(2/pi) =', T_S.str(15))
for name, a, T in [('a_w', fmpq(7964, 10000), T_W), ('a_s', fmpq(8362, 10000), T_S)]:
    lo, up = H(a)
    print('H(%s = %s) in [%s, %s]' % (name, float(a), lo.str(17, radius=False), up.str(17, radius=False)))
    margin = T.lower() - up
    check('H(%s) < %s, margin >= %s' % (name, 'sqrt(17/25)' if T is T_W else 'sqrt(2/pi)', margin.lower().str(6)), margin > 0)
# threshold brackets: a* with H(a*) = T lies in (lo, hi) when H(lo) > T > H(hi), since H is strictly decreasing
def bracket(T, a0, a1, digits=7):
    for _ in range(60):                                             # float bisection on the midpoint value
        m = (a0 + a1)/2
        if float((H(fmpq(int(m*10**12), 10**12))[0]).mid()) > float(T.mid()): a0 = m
        else: a1 = m
    k = int(a0*10**digits)
    lo, hi = fmpq(k, 10**digits), fmpq(k + 1, 10**digits)
    ok = H(lo)[0] > T.upper() and H(hi)[1] < T.lower()
    return lo, hi, ok
for name, T, a0, a1 in [('weak  sqrt(17/25)', T_W, 0.79, 0.80), ('sharp sqrt(2/pi) ', T_S, 0.83, 0.84)]:
    lo, hi, ok = bracket(T, a0, a1)
    check('threshold for %s: H(a) = target at a unique a* in (%s, %s)' % (name, float(lo), float(hi)), ok)
e1 = (1 + 4*arb(fmpq(-3, 2)).exp())/(3*arb.pi()).sqrt()
print('reference: H(1) = E|h3(W)| = (1 + 4 e^(-3/2))/sqrt(3 pi) =', e1.str(15))
print('RESULT:', 'ALL CHECKS PASSED' if not FAIL else 'FAILED: %s' % FAIL)
sys.exit(1 if FAIL else 0)
