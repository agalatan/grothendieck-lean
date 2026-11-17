# test of poly_pos_mass against brute-force quadrature on a fine grid
import numpy as np, sys, time
sys.path.insert(0, '.')
from omega3lib import poly_pos_mass
from scipy.stats import norm
rng = np.random.default_rng(1)
g = np.linspace(-12, 12, 480001); w = norm.pdf(g)*(g[1]-g[0])
def brute(c):
    f = ((c[3]*g + c[2])*g + c[1])*g + c[0]
    return np.sum(w*(f > 0))
cases = []
for k in range(2000):
    c = rng.standard_normal(4)*np.exp(rng.uniform(-3, 3, 4))
    r = rng.integers(0, 8)
    if r == 1: c[3] = 0
    if r == 2: c[3] = 10**rng.uniform(-14, -2)*c[3]
    if r == 3: c[2] = c[3] = 0
    if r == 4: c *= np.array([1, 1, 1, 1e-6])
    if r == 5:  # near double root
        a, b = rng.standard_normal(2); c = np.array([-a*a*b, a*a + 2*a*b, -(2*a + b), 1.0]) + 1e-12*rng.standard_normal(4)
    if r == 6:  # triple-ish root
        a = rng.standard_normal(); c = np.array([-a**3, 3*a*a, -3*a, 1.0]) + 1e-10*rng.standard_normal(4)
    if r == 7: c[1] = c[2] = c[3] = 0
    cases.append(c)
C = np.array(cases)
fast = poly_pos_mass(C[:, 0], C[:, 1], C[:, 2], C[:, 3])
slow = np.array([brute(c) for c in C])
err = np.abs(fast - slow)
print('max |fast - brute| over %d cubics = %.2e (grid step %.1e)' % (len(C), err.max(), g[1]-g[0]))
i = np.argmax(err); print('worst case', C[i], fast[i], slow[i])
# speed
B = 10**6; c = rng.standard_normal((4, B))
t0 = time.time(); poly_pos_mass(c[0], c[1], c[2], c[3]); print('1e6 generic cubics: %.2f s' % (time.time()-t0))
