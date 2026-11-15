"""d5k_ref.py: d5k.py's quadrature (standalone copy of its grid and objective; FLOAT) at the fixed peak-row point of
d5k_rows.log, as the exact reference for the Monte-Carlo evaluator of k5_attack.py; then the adversary re-optimised
with the diffuse quintic W5 switched ON (untested in d5k_rows.log).   usage: d5k_ref.py [row] [NR NP NT]"""
import numpy as np, sys, time, os
from scipy.optimize import minimize
from scipy.special import ive
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__))); import kmodel
e1, eta = 0.848926, 0.281576
ROWS = {'peak': (0.84, 0.8402, 0.1591, 0.0, -0.1585, -0.0965, 0.2395, 0.0408),
        't76':  (0.76, 0.7497, 0.1166, 0.0, -0.1284, -0.0768, 0.3866, 0.0244),
        't82':  (0.82, 0.8181, 0.1476, 0.0, -0.1506, -0.0912, 0.2850, 0.0360),
        't87':  (0.87, 0.8707, 0.1775, 0.0, -0.1727, -0.1064, 0.0348, 0.0537),
        't86':  (0.86, 0.8605, 0.1712, 0.0, -0.1664, -0.1020, 0.0000, 0.0540),
        't88':  (0.88, 0.8800, 0.1833, 0.0, -0.1741, -0.1101, 0.0343, 0.0537)}
row = sys.argv[1] if len(sys.argv) > 1 else 'peak'; t, ell, beta, c5, bA, bB, sig0, nu50 = ROWS[row]
NR, NP_, NT = [int(v) for v in sys.argv[2:5]] if len(sys.argv) > 4 else (6, 4, 32)
r, wr = kmodel.gl(0, 5.5, NR, 6); w1 = wr*2*r*np.exp(-r*r); w1 /= w1.sum(); p, wp = kmodel.gl(0, 5.0, NP_, 6); w2 = wp*2*p*np.exp(-p*p); w2 /= w2.sum(); th = (np.arange(NT)+0.5)*2*np.pi/NT
R, P, TH = np.meshgrid(r, p, th, indexing='ij'); Wt = (w1[:, None, None]*w2[None, :, None]*np.ones(NT)/NT).ravel(); z = (R*np.exp(1j*TH)).ravel(); W = P.ravel().astype(complex); U = np.abs(z)**2; s2 = np.sqrt(2.0); SP = np.sqrt(np.pi)/2
H21 = z*(U-2)/s2; H32 = z*(U*U-6*U+6)/np.sqrt(12); MA = W*(U-1); MB = np.conj(W)*z*z/s2
L = ell*z + beta*s2*H21; C0 = c5*H32; C1 = bA*MA + bB*MB
def rho(x, sg):
    """E|x + sg W5|, W5 standard complex Gaussian (Rice mean); asymptotic x (1 + 1/(4y)) for y = (x/sg)^2 > 1e8"""
    sg = abs(float(sg))
    if sg < 1e-9: return x
    y = (x/sg)**2; ys = np.minimum(y, 1e8)
    return np.where(y > 1e8, x*(1 + 1/(4*np.maximum(y, 1.0))), sg*SP*((1+ys)*ive(0, ys/2) + ys*ive(1, ys/2)))
def value(q, w5=True):
    sig, nu3, nu5, a, b, sig5 = q
    if not w5: sig5 = 0.0
    G3 = sig*W + nu3*H21; G5 = nu5*H32 + a*MA + b*MB; C = C0 + sig*C1
    return Wt@(rho(np.abs(L+G5+G3-C), sig5) + rho(np.abs(L+G5-G3+C), sig5)) - (sig*sig + nu3*nu3)/e1 + sig*sig*(bA*bA + bB*bB)/eta - (nu5*nu5 + a*a + b*b + sig5*sig5)/eta
const = t*t - 2*ell*t + 2*beta*beta/e1 + c5*c5/eta
if __name__ == '__main__':
  t0 = time.time()
  v0 = value([sig0, 0, nu50, 0, 0, 0]); print(f'row {row} grid {NR}x{NP_}x{NT}: fixed point (sigma={sig0}, nu5={nu50}, W5 off): inner = {v0:.7f}  row = {const+v0:.7f}  (d5k_rows.log row value for comparison) [{time.time()-t0:.0f}s]', flush=True)
  for q in ([sig0, 0, nu50, 0, 0, 0.1], [sig0, 0, nu50, 0, 0, 0.01], [0, 0, 0, 0, 0, 0.2]):
    print(f'  value at {q} (W5 on) = {value(q):.7f}')
  for w5 in (False, True):
    best = None
    for x0 in ([sig0, 0, nu50, 0, 0, 0.0], [sig0, 0, nu50, 0, 0, 0.1], [0.3, 0.02, 0.02, 0.05, 0.05, 0.05], [0.1, -0.02, -0.02, -0.05, -0.05, 0.1], [0.0, 0.0, 0.0, 0.0, 0.0, 0.2], [sig0, 0, nu50, 0.1, 0.1, 0.2]):
        rs = minimize(lambda q: -value(q, w5), np.array(x0), method='L-BFGS-B', options={'maxiter': 300, 'ftol': 1e-14, 'gtol': 1e-10})
        if best is None or (np.isfinite(rs.fun) and rs.fun < best.fun): best = rs
    print(f'  adversary optimised, W5 {"ON " if w5 else "off"}: inner = {-best.fun:.7f}  row = {const-best.fun:.7f}  (sigma,nu3,nu5,a,b,sigma5) = {np.round(best.x, 5)} [{time.time()-t0:.0f}s]', flush=True)
