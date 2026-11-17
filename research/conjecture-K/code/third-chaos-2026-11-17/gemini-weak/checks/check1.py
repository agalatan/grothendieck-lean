import itertools, mpmath as mp
mp.mp.dps = 30
# Theorem 1: 7-point antiperiodic rotation bound
best = -99; arg = None
for s in itertools.product([1, -1], repeat=7):
    sig = list(s) + [-x for x in s]
    S = sum(sig[r]*sig[r+1] - sig[r]*sig[r+3] for r in range(7))
    if S > best: best, arg = S, s
c1, c3 = mp.cos(mp.pi/7), mp.cos(3*mp.pi/7)
w = 1/(c1**3 - c3**3)
print('Thm1: max S =', best, 'at', arg, ' bound (E|F|)^2 <=', mp.nstr(4*w/7, 12), ' E|F| <=', mp.nstr(mp.sqrt(4*w/7), 12))
# check w*(c1^m - c3^m) >= delta_{m3} for odd m
print('  min over odd m<=99 of w(c1^m-c3^m) - [m==3]:', mp.nstr(min(w*(c1**m - c3**m) - (1 if m == 3 else 0) for m in range(1, 100, 2)), 6))

# Theorem 2(c): great-circle slicing bound, full chaos, max over p
Ct = 4*mp.sqrt(5)/(3*mp.pi)
def Phi(n, p):
    n = mp.mpf(n)
    def f(r):
        e1 = r*(r**2 - (n+2))/mp.sqrt(2*n*(n+2))
        e3 = r**3/mp.sqrt(n*(n+2)*(n+4))
        dens = 2**(1 - n/2)/mp.gamma(n/2)*r**(n-1)*mp.exp(-r**2/2)
        return mp.sqrt(p*e1**2 + (1-p)*e3**2)*dens
    return Ct*mp.quad(f, [0, mp.sqrt(n+2), mp.sqrt(n)+3, mp.sqrt(n)+8, 40])
sq2pi = mp.sqrt(2/mp.pi); target = mp.sqrt(mp.mpf(17)/25)
print('Thm 2(c): n, argmax p, max_p Phi_n(p), ratio to sqrt(2/pi)   [Gemini: 8: 0.78516, 9: 0.79424, 10: 0.80211, 11: 0.80904, 12: 0.81519]')
for n in range(3, 14):
    # golden section on concave function
    lo, hi = mp.mpf(0), mp.mpf(1)
    g = (mp.sqrt(5) - 1)/2
    for _ in range(40):
        m1, m2 = hi - g*(hi - lo), lo + g*(hi - lo)
        if Phi(n, m1) < Phi(n, m2): lo = m1
        else: hi = m2
    p = (lo + hi)/2; v = Phi(n, p)
    print('  n=%2d p*=%.4f max=%s ratio=%s  Phi(0)=%s' % (n, float(p), mp.nstr(v, 8), mp.nstr(v/sq2pi, 6), mp.nstr(Phi(n, 0), 8)))
