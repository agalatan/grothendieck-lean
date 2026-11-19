import mpmath as mp
mp.mp.dps = 25
phi = lambda x: mp.exp(-x**2/2)/mp.sqrt(2*mp.pi)
h3 = lambda x: (x**3 - 3*x)/mp.sqrt(6)
BR = [0, mp.sqrt(3)/2, 1, mp.sqrt(3), 2.5, 4, 8, 14]
def H(a, t):            # E_W sqrt(a^2 h3^2 + t W^2 + (s - t)), s = 1 - a^2
    s = 1 - a**2
    return 2*mp.quad(lambda x: mp.sqrt(a**2*h3(x)**2 + t*x**2 + (s - t))*phi(x), BR)
def dH0(a):             # derivative in t at t = 0+
    s = 1 - a**2
    return mp.quad(lambda x: (x**2 - 1)/mp.sqrt(a**2*h3(x)**2 + s)*phi(x), BR)
T = mp.sqrt(mp.mpf(17)/25); S = mp.sqrt(2/mp.pi)
for a in ['0.853', '0.854', '0.855', '0.9', '0.95', '0.99']:
    a = mp.mpf(a); s = 1 - a**2
    print('a=%s H(0)=%s H(s)=%s dH(0+)=%s  max_t H (grid)=%s' % (mp.nstr(a, 4), mp.nstr(H(a, 0), 10), mp.nstr(H(a, s), 10), mp.nstr(dH0(a), 6),
          mp.nstr(max(H(a, s*k/20) for k in range(21)), 10)))
print('target sqrt(17/25) =', mp.nstr(T, 10))
# threshold a where H(a,0) = target, and the same for the sharp target sqrt(2/pi)
for name, tgt in [('weak', T), ('sharp', S)]:
    a0 = mp.findroot(lambda a: H(a, 0) - tgt, 0.85)
    print(name, 'threshold a* with H(a*,0) = target:', mp.nstr(a0, 8), ' a*^2 =', mp.nstr(a0**2, 6), ' dH(0+) there:', mp.nstr(dH0(a0), 6))
# sign of dH(0+) on a grid of a in [0.80, 0.999]
bad = [a for a in [mp.mpf(k)/1000 for k in range(800, 1000, 5)] if dH0(a) >= 0]
print('a in [0.800,0.995] step 0.005 with dH(0+) >= 0:', [mp.nstr(b, 3) for b in bad])
