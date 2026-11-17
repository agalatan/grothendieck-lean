# claude-b9ee research worker, 17 Nov 2026. FLOATING-POINT cross-checks (label N), independent of the Arb scripts:
# mpmath tanh-sinh quadrature (30 digits) of H, D1, D2, their behaviour near a = 1, and the t-profile of the G3 bound
# Psi(a, t) = Phi(a^2, t, 1 - a^2 - t). Nothing here is a proof step.  Run: python3 -I n01_floats.py   (mpmath 1.3.0)
import mpmath as mp
mp.mp.dps = 30
phi = lambda x: mp.exp(-x**2/2)/mp.sqrt(2*mp.pi)
h3 = lambda x: (x**3 - 3*x)/mp.sqrt(6)
S3 = mp.sqrt(3)
def E(f, extra=()):                       # E f(W) for even f, with breakpoints at 1, sqrt3 and near the zeros of h3
    pts = sorted(set([mp.mpf(0), mp.mpf(1), S3, mp.mpf(3), mp.mpf(5), mp.mpf(8), mp.mpf(14)] + [mp.mpf(e) for e in extra]))
    return 2*mp.quad(lambda x: f(x)*phi(x), pts)
def H(a): return E(lambda x: mp.sqrt(a**2*h3(x)**2 + 1 - a**2))
def D(k, a, extra=()):
    num = (lambda x: x**2 - 1) if k == 1 else (lambda x: (x**2 - 1)**2/2 - 1)
    return E(lambda x: num(x)/mp.sqrt(a**2*h3(x)**2 + 1 - a**2), extra)/2
T_W = mp.sqrt(mp.mpf(17)/25); T_S = mp.sqrt(2/mp.pi)
print('H(0.7964) = %s   sqrt(17/25) - H = %s' % (mp.nstr(H(mp.mpf('0.7964')), 15), mp.nstr(T_W - H(mp.mpf('0.7964')), 6)))
print('H(0.8362) = %s   sqrt(2/pi)  - H = %s' % (mp.nstr(H(mp.mpf('0.8362')), 15), mp.nstr(T_S - H(mp.mpf('0.8362')), 6)))
print('thresholds (findroot): weak %s, sharp %s' % (mp.nstr(mp.findroot(lambda a: H(a) - T_W, 0.796), 10), mp.nstr(mp.findroot(lambda a: H(a) - T_S, 0.836), 10)))
print('D1, D2 on a grid of a (compare: c02 certifies sup D1 <= -0.0804, sup D2 <= -0.2287 on [0.79, 0.9995])')
for a in ['0.79', '0.7964', '0.8', '0.8362', '0.85', '0.9', '0.95', '0.99']:
    a = mp.mpf(a); print('   a = %s  D1 = %s  D2 = %s' % (mp.nstr(a, 5), mp.nstr(D(1, a), 10), mp.nstr(D(2, a), 10)))
print('near a = 1 (eps = 1 - a^2): D_k ~ -(alpha_k - beta_k) L + const, L = ln(1/eps)/2; slopes per unit of L')
prev = None
for j in [3, 4, 5, 6, 7, 8]:
    eps = mp.mpf(10)**(-j); a = mp.sqrt(1 - eps); w = mp.sqrt(eps)
    ex = [w, 10*w, 100*w, S3 - 10*w, S3 - w, S3 + w, S3 + 10*w]
    d1, d2 = D(1, a, ex), D(2, a, ex); L = mp.log(1/eps)/2
    s = '' if prev is None else '  slopes %s %s' % (mp.nstr((d1 - prev[0])/(L - prev[2]), 5), mp.nstr((d2 - prev[1])/(L - prev[2]), 5))
    print('   eps = 1e-%d  D1 = %s  D2 = %s%s' % (j, mp.nstr(d1, 8), mp.nstr(d2, 8), s)); prev = (d1, d2, L)
print('   predicted slopes alpha - beta (ideal, r -> 0): D1 %s, D2 %s' % (
    mp.nstr(phi(0)*mp.sqrt(6)/3 - 2*2*phi(S3)/mp.sqrt(6), 5), mp.nstr(phi(0)/2*mp.sqrt(6)/3 - 2*phi(S3)/mp.sqrt(6), 5)))
K7 = mp.sqrt(4/(7*(mp.cos(mp.pi/7)**3 - mp.cos(3*mp.pi/7)**3)))
def Psi(a, t):
    s = 1 - a**2; c2 = s - t; c = mp.sqrt(c2)
    f = lambda x: min(mp.sqrt(a**2*h3(x)**2 + t*x**2 + c2), mp.sqrt(a**2*h3(x)**2 + t*x**2) + K7*c)
    ex = [mp.mpf('0.05'), mp.mpf('0.1'), S3 - mp.mpf('0.05'), S3 - mp.mpf('0.01'), S3 + mp.mpf('0.01'), S3 + mp.mpf('0.05')]
    return E(f, ex)
print('G3 bound: t-profile of Psi(a, t) (brute force with min; the Arb tangent bound of c04 is the last column)')
for a, T, cert in [('0.7931', T_W, '0.824604926754'), ('0.8339', T_S, '0.797873708193')]:
    a = mp.mpf(a); best = (None, -1)
    for t in ['0', '1e-6', '1e-5', '1e-4', '5e-4', '1e-3', '1.2e-3', '1.4e-3', '1.6e-3', '2e-3', '5e-3', '2e-2', '1e-1']:
        v = Psi(a, mp.mpf(t)); best = max(best, (v, t), key=lambda z: z[0] if z[0] is not None else -1)
        print('   a = %s  t = %-7s Psi = %s  target - Psi = %s' % (mp.nstr(a, 5), t, mp.nstr(v, 12), mp.nstr(T - v, 4)))
    print('   max over the listed t: %s at t = %s;  c04 certified sup over all t <= %s' % (mp.nstr(best[0], 12), best[1], cert))
