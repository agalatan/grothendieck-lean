"""D1 numerics, part 3: stress test of the two-factor route E|X| = 2 tau(0) p(0):
is p_X(0) <= 1/sqrt(2 pi) and tau(0) <= 1 for every POSITIVE spectrum (||X||_2 = 1)?"""
import numpy as np, math
from scipy.integrate import quad
def E_abs(lam, limit=1000):
    lam = np.asarray(lam, float)
    f = lambda t: 0.0 if t == 0 else (1 - np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t)).real)/t**2
    return 2/math.pi*quad(f, 0, np.inf, limit=limit)[0]
def density0(lam, limit=1000):
    lam = np.asarray(lam, float)
    f = lambda t: np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t)).real
    return quad(f, 0, np.inf, limit=limit)[0]/math.pi
def nz(lam): lam = np.asarray(lam, float); return lam/math.sqrt(2*np.sum(lam**2))
g0 = 1/math.sqrt(2*math.pi)
print(f"1/sqrt(2pi) = {g0:.5f}")
print("spectra (1,...,1 [k], eps,...,eps [m]) with eps^2 m = s (k+... ) :")
worst_p = 0; worst_tau = 0
for k in [1, 2, 3, 5]:
    for m in [4, 16, 64]:
        for s in [0.05, 0.1, 0.2, 0.4, 1.0, 3.0]:
            eps = math.sqrt(s*k/m)
            lam = nz([1.0]*k + [eps]*m)
            if len(lam) > 40 and k == 1: pass
            e = E_abs(lam); p0 = density0(lam); tau = e/(2*p0)
            worst_p = max(worst_p, p0); worst_tau = max(worst_tau, tau)
            flag = " <-- p(0) > Gaussian" if p0 > g0 else ""
            print(f"  k={k} m={m:2d} s={s:4.2f}: E|X|={e:.5f} p(0)={p0:.5f} tau(0)={tau:.4f} 2*tau*p0={2*tau*p0:.5f}{flag}")
print(f"worst p(0) = {worst_p:.5f}  worst tau(0) = {worst_tau:.4f}")
print("\ngeometric spectra lam_i = q^i, i<d:")
for d in [3, 5, 10, 30]:
    for q in [0.5, 0.7, 0.9, 0.97]:
        lam = nz([q**i for i in range(d)]); e = E_abs(lam); p0 = density0(lam)
        flag = " <-- p(0) > Gaussian" if p0 > g0 else ""
        print(f"  d={d:2d} q={q}: E|X|={e:.5f} p(0)={p0:.5f} tau(0)={e/(2*p0):.4f}{flag}")
