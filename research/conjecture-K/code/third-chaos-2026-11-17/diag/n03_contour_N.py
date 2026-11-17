# claude-b9ee research worker, 17 Nov 2026. NUMERICS ONLY (N).
# Contour bound: Gamma = {x + i*eta(x)}, eta(x) = (min(x^2, X1^2) - 1)/2. On Gamma, Im h = eta*(3x^2 - eta^2 - 3)/sqrt6 >= 0.
# |psi(u)| <= Bnd(u) = int |e^{iuh(z)} phi(z)| |dz|.
import numpy as np
from n01_psi_numerics import nodes
us, p = np.load('psi_grid_N.npy'); du = us[1] - us[0]
s6 = np.sqrt(6.0); A0 = (8/3)**0.25*np.exp(-0.5)
def bnd(u, X1=2.5):
    x, w = nodes(-9.0, 9.0, 1/400)
    eta = (np.minimum(x*x, X1*X1) - 1) / 2
    imh = eta * (3*x*x - eta*eta - 3) / s6
    dz = np.where(np.abs(x) < X1, np.sqrt(1 + x*x), 1.0)
    f = np.exp(-u*imh - (x*x - eta*eta)/2) / np.sqrt(2*np.pi) * dz
    return f @ w
print('min Im h on Gamma (X1 = 2.5):', end=' ')
x = np.linspace(-9, 9, 200001); eta = (np.minimum(x*x, 6.25) - 1)/2
print(np.min(eta*(3*x*x - eta*eta - 3)/s6))
for u in [1, 2, 2.9, 3, 4, 4.727, 6, 8, 10, 15, 20, 30, 40, 60, 100, 200]:
    k = int(round(u/du))
    ps = p[k] if k < len(p) else float('nan')
    print('u = %7.3f  |psi| = %.6f  Bnd = %.6f  A0/sqrt(u) = %.6f  sqrt(u)*Bnd = %.5f' % (u, abs(ps), bnd(u), A0/np.sqrt(u), np.sqrt(u)*bnd(u)))
