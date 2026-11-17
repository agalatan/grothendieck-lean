import mpmath as mp
mp.mp.dps = 30
S2P = mp.sqrt(2/mp.pi); T = mp.sqrt(mp.mpf(17)/25)
phi = lambda x: mp.exp(-x**2/2)/mp.sqrt(2*mp.pi)
h3 = lambda x: (x**3 - 3*x)/mp.sqrt(6)
BR = [0, mp.sqrt(3)/2, 1, mp.sqrt(3), 2.5, 4, 8, 14]
E = lambda f: 2*mp.quad(lambda x: f(x)*phi(x), BR)
# ---- G1: small kappa_4 via Wasserstein-Lipschitz control of Var(e^{-s^2F^2/2})
def G1bound(k):
    k = mp.mpf(k); d = 2*mp.sqrt(k)/(3*mp.sqrt(mp.pi))           # d_W(F,G) <= sqrt(2/pi) sqrt((2/9)k)
    def V(s):
        up = 1/mp.sqrt(1 + 2*s**2) + s*mp.sqrt(2/mp.e)*d            # E e^{-s^2F^2} upper
        lo = max(mp.exp(-s**2/2), 1/mp.sqrt(1 + s**2) - s*mp.exp(-0.5)*d)   # E e^{-s^2F^2/2} lower (> 0)
        return min(mp.mpf(1)/4, max(0, up - lo**2))
    I = mp.quad(lambda s: s/(1 + s**2)**1.5*mp.sqrt(V(s)), [0, 0.5, 1, 2, 4, 10, 40, mp.inf])
    return S2P*(1 + mp.sqrt(2*k)/3*I), I
b0, I0 = G1bound('1e-12'); print('G1: I_* (k->0) = %s   [Gemini: 0.2520636]' % mp.nstr(I0, 8))
kT = mp.findroot(lambda k: G1bound(k)[0] - T, 0.05); print('G1: (T) holds for kappa_4 <= %s   [Gemini: 0.0735; my earlier 0.0268]' % mp.nstr(kT, 6))
# ---- G3: rank-one with the dimension-free bound on the remainder: min{sqrt(a^2h3^2+b^2w^2+c^2), sqrt(a^2h3^2+b^2w^2)+K c}
K7 = mp.sqrt(4/(7*(mp.cos(mp.pi/7)**3 - mp.cos(3*mp.pi/7)**3)))
def Psi(a, t):   # t = b^2, c^2 = 1-a^2-t
    c2 = 1 - a**2 - t; c = mp.sqrt(max(c2, 0))
    return E(lambda x: min(mp.sqrt(a**2*h3(x)**2 + t*x**2 + c2), mp.sqrt(a**2*h3(x)**2 + t*x**2) + K7*c))
def Pmax(a):
    s = 1 - a**2; return max(Psi(a, s*j/16) for j in range(17))
for tgt, name, a0 in [(T, 'weak', 0.77), (S2P, 'sharp', 0.82)]:
    lo, hi = mp.mpf(0.6), mp.mpf(0.86)
    for _ in range(22):
        m = (lo + hi)/2
        if Pmax(m) < tgt: hi = m
        else: lo = m
    j = max(range(17), key=lambda j: Psi(hi, (1 - hi**2)*j/16))
    print('G3 %s: threshold a = %s (grid max over b^2 at j/16, argmax j = %d)   [plain bound: weak 0.79635, sharp 0.83616; Gemini: 0.833]' % (name, mp.nstr(hi, 6), j))
# ---- G4: tau_3(n) = (n+2)/(4(n-1)); weighted angular lemma at gamma = 8/9; per-radius optimal gamma >= 8/9
Ct = 4*mp.sqrt(5)/(3*mp.pi)
def an(n): return 2**mp.mpf(1.5)*mp.gamma(mp.mpf(n+3)/2)/mp.gamma(mp.mpf(n)/2)/mp.sqrt(n*(n+2)*(n+4))
def Cst(n): return mp.sqrt(mp.mpf(35*n - 38)/(n - 1))/(2*mp.pi)
print('G4 harmonic: n, a_n*C_trig, a_n*C_Stief(n)   [Gemini: 12: 0.796448, 15: 0.816306, 16: 0.821523, 17: 0.826156]')
for n in range(11, 18):
    v = an(n)*Cst(n); print('   n=%2d  %s  %s  %s' % (n, mp.nstr(an(n)*Ct, 9), mp.nstr(v, 9), '< sqrt(2/pi)' if v < S2P else ('< sqrt(17/25)' if v < T else '')))
def radial(n, p):
    n = mp.mpf(n); t3 = (n + 2)/(4*(n - 1)); t1 = 1 - t3
    def f(r):
        e1 = r**2*(r**2 - (n+2))**2/(2*n*(n+2)); e3 = r**6/(n*(n+2)*(n+4))
        A = p*e1 + (1-p)*t1*e3; B = (1-p)*t3*e3                      # frequency-1 and frequency-3 circle energies
        g = mp.sqrt(A/B)/3 if B > 0 else mp.inf
        val = (2*mp.sqrt(2)/mp.pi)*(mp.sqrt(A) + mp.sqrt(B)/3) if g >= mp.mpf(8)/9 else (3/mp.pi)*mp.sqrt(A + 8*B/9)
        val = min(val, Ct*mp.sqrt(A + B))
        dens = 2**(1 - n/2)/mp.gamma(n/2)*r**(n-1)*mp.exp(-r**2/2)
        return val*dens
    return mp.quad(f, [0, mp.sqrt(n+2), mp.sqrt(n)+3, mp.sqrt(n)+8, 40])
print('G4 full V_3(n), per-radius optimal gamma: n, max_p bound   [Gemini: 9: 0.79081, 10: 0.79781, 12: 0.81014, 13: 0.81549, 14: 0.82034, 15: 0.82477]')
for n in [7, 8, 9, 10, 11, 12, 13, 14, 15]:
    lo, hi = mp.mpf(0), mp.mpf(1); g = (mp.sqrt(5) - 1)/2
    for _ in range(30):
        m1, m2 = hi - g*(hi - lo), lo + g*(hi - lo)
        if radial(n, m1) < radial(n, m2): lo = m1
        else: hi = m2
    v = radial(n, (lo + hi)/2)
    print('   n=%2d  p*=%.3f  %s  %s' % (n, float((lo+hi)/2), mp.nstr(v, 9), '< sqrt(2/pi)' if v < S2P else ('< sqrt(17/25)' if v < T else '')))
