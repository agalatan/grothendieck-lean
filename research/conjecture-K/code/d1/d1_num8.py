"""D1 numerics, part 8: verify the pieces of the proof of C7 (theta_i = 2 lam_i, signs allowed; sum theta_i^2/2 = 1).
 delta_s(theta)  = theta [ p_{X_s + theta E}(0) - p_s(0) ]  (left side),  delta_s^-(theta) = theta [ p_{X_s - theta E}(0) - p_s(0) ] (right side)
 (I1)  sum_P delta_s(theta_j) - sum_N delta_s^-(theta_k) = 2 s^2 p_s'(0)
 (I2)  E[X2 delta(X_s)] = (1/2)[ sum_P theta_j delta_s(theta_j) + sum_N theta_k delta_s^-(theta_k) ]   (lhs from E[xi_i delta(X_s)] formula)
 (T)   theta -> delta_s(theta) has a single sign change (+ to -) when the mode is < 0; delta_s^- <= 0 then."""
import numpy as np, math
from scipy.integrate import quad
def run(lam, s):
    lam = np.asarray(lam, float); theta = 2*lam
    phi = lambda t: np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t))*math.exp(-s*s*t*t/2)
    I = lambda f: quad(f, 0, np.inf, limit=2000)[0]/math.pi
    p0 = I(lambda t: phi(t).real)
    dp0 = I(lambda t: t*phi(t).imag)                       # p_s'(0) = (1/pi) int t Im phi
    dens_shift = lambda th: I(lambda t: (phi(t)/(1-1j*th*t)).real)    # density of X_s + th*E at 0 (th may be negative: X_s - |th| E)
    delta = lambda th: abs(th)*(dens_shift(th) - p0)       # th>0: delta_s(th); th<0: delta_s^-(|th|)
    # (I1)
    lhs1 = sum(delta(th) if th > 0 else -delta(th) for th in theta)
    # (I2): E[X2 delta(X_s)] = sum 2 lam_i^2 E[xi_i delta(X_s)],  E[xi_i delta(X_s)] = (1/pi) int Re[2 i lam_i t phi/(1-2 i lam_i t)]
    lhs2 = sum(2*li*li*I(lambda t, li=li: (2j*li*t*phi(t)/(1-2j*li*t)).real) for li in lam)
    rhs2 = 0.5*sum(abs(th)*delta(th) for th in theta)
    print(f"lam={np.round(lam,3)} s={s}: p0={p0:.5f} p0'={dp0:+.5f} | (I1) lhs={lhs1:+.6f} 2s^2p'={2*s*s*dp0:+.6f} | (I2) lhs={lhs2:+.6f} rhs={rhs2:+.6f}")
    # (T): scan delta_s(theta) over theta > 0 and delta_s^-(theta)
    ths = np.array([0.02,0.05,0.1,0.2,0.3,0.5,0.7,1.0,1.5,2.0,3.0,5.0])
    dl = np.array([delta(th) for th in ths]); dr = np.array([delta(-th) for th in ths])
    sl = np.sign(dl); changes = np.sum(np.diff(sl) != 0)
    print(f"     delta_s(theta) signs: {''.join('+' if v>0 else '-' for v in dl)}  (changes={changes});  delta_s^-(theta) signs: {''.join('+' if v>0 else '-' for v in dr)}")
def nz(lam): lam = np.asarray(lam, float); return lam/math.sqrt(2*np.sum(lam**2))
for lam, s in [(nz([1,0.5,0.25]),0.0), (nz([1,0.5,0.25]),0.7), (nz([1,1,1,0.1,0.1]),0.3), (nz([1,-0.5,0.3]),0.5), (nz([1,-1]),0.4),
               (nz([0.567,-0.208,-0.263,0.207,0.151]),0.0), (nz([2,-1,-1]),0.2), (nz([-1,-0.6,0.2]),0.6), (nz([1]+[0.1]*12),0.1)]:
    run(lam, s)
