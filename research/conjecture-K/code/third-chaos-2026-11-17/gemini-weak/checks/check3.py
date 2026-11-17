import numpy as np, mpmath as mp
rng = np.random.default_rng(1)
W = rng.standard_normal(20_000_000); h = (W**3 - 3*W)/np.sqrt(6)
a = 0.854; s = 1 - a*a
print('MC  a=0.854: E sqrt(a^2 h3^2 + s) = %.5f   E sqrt(a^2 h3^2 + s W^2) = %.5f   (Gemini: 0.82460, 0.81929)' % (np.sqrt(a*a*h*h + s).mean(), np.sqrt(a*a*h*h + s*W*W).mean()))
# small kappa_4 regime, corrected: |sqrt(2/pi) - E|F|| <= sqrt(2/pi) * (sqrt(2 k)/3) * J(k),
# J(k) = int_0^inf t (1+t^2)^(-3/2) min(1/2, (t^2/2) sqrt(k+2)) dt   [Var(e^{-t^2F^2/2}) <= 1/4 and <= (t^4/4) E(F^2-1)^2, E(F^2-1)^2 = k+2]
mp.mp.dps = 20
def J(k):
    b = mp.sqrt(k + 2)/2; X = 1 + 1/(2*b)
    return b*(mp.sqrt(X) + 1/mp.sqrt(X) - 2) + 1/(2*mp.sqrt(X))
def bound(k): return mp.sqrt(2/mp.pi)*(1 + mp.sqrt(2*k)/3*J(k))
T = mp.sqrt(mp.mpf(17)/25)
k0 = mp.findroot(lambda k: bound(k) - T, 0.02)
print('corrected small-kappa4 threshold for sqrt(17/25): kappa4 <= %s (J = %s)' % (mp.nstr(k0, 6), mp.nstr(J(k0), 6)))
# Gemini's version for comparison: uses E(F^2-1)^2 = kappa4 (false: it is kappa4 + 2) and an integral off by a factor 2
al = lambda k: mp.sqrt(k)/2
gem = lambda k: mp.sqrt(2/mp.pi)*(1 + mp.mpf(2)/3*mp.sqrt(k)*(mp.sqrt(al(k)**2 + al(k)) - al(k)))
print('Gemini formula at 0.032 and 0.0446:', mp.nstr(gem(0.032), 8), mp.nstr(gem(0.0446), 8))
# direct check of E(F^2-1)^2 = kappa4 + 2 on F = h3: E h3^4 = 93
print('E(h3^2-1)^2 = E h3^4 - 1 =', 93 - 1, ' kappa4(h3) =', 93 - 3)
