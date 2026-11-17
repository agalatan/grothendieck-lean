# claude-b9ee research worker, 17 Nov 2026. NUMERICS ONLY (N): an independent float re-implementation of the bounds
# B(kappa), T(kappa) of c03_main.py from the midpoints of psi_grid.txt, written without reusing c03's code, to catch
# logic slips (cell indices, weights, envelope). Expected: values slightly above c03's B and slightly below its T.
import numpy as np, re
k = []; v = []
for line in open('psi_grid.txt'):
    a, s = line.split(' ', 1); m = re.match(r'\[([-0-9.e+]+)', s.strip()); k.append(int(a)); v.append(float(m.group(1)))
k = np.array(k); v = np.array(v); u = k / 1000.0
L = 632 / 1024; d = 1e-3
i1 = np.searchsorted(k, 2900)
# bulk cells k = 200..2899
G = np.minimum(v[:i1], v[1:i1+1]) - L*d/2 - np.exp(-u[:i1]**2/2)
wB = 1/u[:i1] - 1/u[1:i1+1]
# envelope over all cells k = 200..39999
P = np.maximum(np.abs(v[:-1]), np.abs(v[1:])) + L*d/2
loc = -np.log(P) / u[1:]**2
C = np.minimum.accumulate(np.minimum(loc, 0.2))
Ct = C[i1:]; Pt = P[i1:]; wT = 1/u[i1:-1] - 1/u[i1+1:]
beta = -np.log(0.123883458161583); Utail = max(np.exp(-C[-1]*1600), np.exp(-beta))
def B(kap): return np.sum(G*wB*np.exp(-kap*u[1:i1+1]**2/2)) + 917/450000*np.exp(-kap/50)
def T(kap): return np.sum(Pt*wT*np.exp(-kap*Ct*u[i1:-1]**2)) + np.exp(-beta)*Utail**kap/40 + np.exp(-(1+kap)*2.9**2/2)/((1+kap)*2.9**3)
for kap in [0, 0.05, 1, 4, 8]:
    print('kappa = %4.2f: B = %.8f  T = %.9f' % (kap, B(kap), T(kap)))
print('min G = %.7f; U* = %.6f; C_last = %.10f' % (G.min(), max(np.exp(-C[i1-1:]*u[i1-1:-1]**2).max(), Utail), C[-1]))
