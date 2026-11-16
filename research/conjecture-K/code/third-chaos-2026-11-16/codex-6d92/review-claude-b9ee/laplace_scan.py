# claude-b9ee, 16 Nov 2026: where does the Gaussian Laplace comparison fail for F = He_3(G)/sqrt(6)?
# L_F(t) = E exp(-t F^2) against L_G(t) = (1+2t)^(-1/2); also C(s) = E[(Gamma-1) exp(-s F^2)], Gamma = (G^2-1)^2/2.
from mpmath import mp, mpf, sqrt, exp, pi, quad, findroot, linspace
mp.dps = 30
s6 = sqrt(6)
f = lambda x: (x**3 - 3*x)/s6
phi = lambda x: exp(-x*x/2)/sqrt(2*pi)
pts = [mpf(0), mpf('0.5'), mpf(1), mpf('1.4'), sqrt(3), mpf(2), mpf('2.5'), mpf(3), mpf(4), mpf(6), mpf(10)]
def refine(t):
    # extra break points around the roots 0 and sqrt(3), where exp(-t f^2) has width ~ t^(-1/2)
    w = 8/sqrt(t)
    extra = [w/ (3/s6)* k/4 for k in range(1, 5)] + [sqrt(3) + d*w/(6/s6)*k/4 for k in range(1, 5) for d in (-1, 1)]
    return sorted(set(p for p in pts + extra if 0 <= p <= 10))
def LF(t):
    return 2*quad(lambda x: exp(-t*f(x)**2)*phi(x), refine(t))
def C(s):
    return 2*quad(lambda x: ((x*x - 1)**2/2 - 1)*exp(-s*f(x)**2)*phi(x), refine(max(s, mpf(1))))
print('   t        L_F - L_G        sqrt(2t)(L_G-L_F)      C(t)')
for t in [mpf(x) for x in ('0.1', '1', '10', '30', '100', '200', '300', '500', '1000', '1e4', '1e6')]:
    d = LF(t) - 1/sqrt(1 + 2*t)
    print(f'{float(t):9.4g}  {float(d):+.6e}   {float(-sqrt(2*t)*d):+.6e}   {float(C(t)):+.6e}')
t0 = findroot(lambda t: LF(t) - 1/sqrt(1 + 2*t), mpf(200))
print('sign change of L_F - L_G at t =', t0)
# the weighted integral of C against (1+2s)^(-3/2): must equal E|F|/sqrt(2/pi) - 1
I = quad(lambda s: C(s)/(1 + 2*s)**mpf('1.5'), [0, 1, 10, 100, 1000, mpf(10)**5, mp.inf])
print('int C(s)(1+2s)^(-3/2) ds =', I, '   E|F|/sqrt(2/pi) - 1 =', (1 + 4*exp(mpf(-3)/2))/sqrt(3*pi)/sqrt(2/pi) - 1)
