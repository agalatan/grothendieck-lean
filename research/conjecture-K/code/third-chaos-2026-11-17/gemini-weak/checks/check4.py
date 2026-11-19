# Prop 4.3(b) of the refined note: E|F| <= E_x sqrt(a^2 h3^2 + g2 psi2^2 + g1 x^2 + g0), g0+g1+g2 = 1-a^2 (any direction v).
# Concave in (g0,g1,g2); the vertex g0 = 1-a^2 is the max iff both directional derivatives there are <= 0.
import mpmath as mp
mp.mp.dps = 20
phi = lambda x: mp.exp(-x**2/2)/mp.sqrt(2*mp.pi)
h3 = lambda x: (x**3 - 3*x)/mp.sqrt(6); p2sq = lambda x: (x**2 - 1)**2/2
BR = [0, mp.sqrt(3)/2, 1, mp.sqrt(3), 2.5, 4, 8, 14]
def E(f): return 2*mp.quad(lambda x: f(x)*phi(x), BR)
for a in ['0.75', '0.7963', '0.80', '0.8362', '0.84', '0.9', '0.97']:
    a = mp.mpf(a); s = 1 - a**2; den = lambda x: mp.sqrt(a**2*h3(x)**2 + s)
    d1 = E(lambda x: (x**2 - 1)/den(x))/2; d2 = E(lambda x: (p2sq(x) - 1)/den(x))/2
    print('a=%s  vertex value %s   d/dg1 %s   d/dg2 %s' % (mp.nstr(a, 5), mp.nstr(E(den), 7), mp.nstr(d1, 5), mp.nstr(d2, 5)))
