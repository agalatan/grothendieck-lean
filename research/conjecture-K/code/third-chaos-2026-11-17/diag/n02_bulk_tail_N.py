# claude-b9ee research worker, 17 Nov 2026. NUMERICS ONLY (N): bulk b(kappa) vs tail tau(kappa).
# kappa = (1 - M^2)/M^2.  b(k) = int_0^u1 (psi - e^{-u^2/2}) e^{-k u^2/2} u^{-2} du,
# tau(k) = int_u1^inf (|psi(u)| U(u)^k + e^{-(1+k)u^2/2}) u^{-2} du, U = e^{-c(u)u^2}, c = running min of -log|psi|/u^2.
import numpy as np
us, p = np.load('psi_grid_N.npy')
du = us[1] - us[0]
A0 = (8/3)**0.25*np.exp(-0.5)
with np.errstate(divide='ignore', invalid='ignore'):
    loc = -np.log(np.abs(p)) / us**2
loc[0] = 0.5
c = np.minimum.accumulate(loc)
U = np.exp(-c * us**2)
def bt(k, u1, refine=None):
    m = (us > 0) & (us <= u1)
    b = np.sum((p[m] - np.exp(-us[m]**2/2)) * np.exp(-k*us[m]**2/2) / us[m]**2) * du
    m2 = us > u1
    Uk = U[m2]**k
    if refine is not None: Uk = refine[m2]
    t = np.sum((np.abs(p[m2]) * Uk + np.exp(-(1+k)*us[m2]**2/2)) / us[m2]**2) * du
    # beyond 40: |psi| <= 0.8/sqrt u, U^k <= 1
    t += 0.8 * (2/3) * 40**-1.5
    return b, t
for u1 in [2.9, 2.95]:
    print('u1 =', u1)
    for M in [0.2, 0.3, 0.4, 0.5, 0.6, 0.65, 0.7, 0.7071, 0.72, 0.74, 0.76, 0.8, 0.85, 0.9]:
        k = (1 - M*M)/(M*M)
        b, t = bt(k, u1)
        print('  M = %.4f kappa = %.4f  b = %.6f  tau = %.6f  b - tau = %+.6f  ratio %.3f' % (M, k, b, t, b - t, t/b if b > 0 else 0))
print('c(u) at u = 1, 2, 2.9, 3, 4, 4.727, 6, 8, 10, 20, 40:', [round(float(c[int(round(x/du))]), 5) for x in [1, 2, 2.9, 3, 4, 4.727, 6, 8, 10, 20, 40]])
