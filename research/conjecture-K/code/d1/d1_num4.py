"""D1 numerics, part 4: the pair lemma reformulation dF/dtheta = -8ab(b-a) p'_{Xtilde}(0),
Xtilde = a(chi2_3 - 1) + b(chi2_3' - 1) + W.  Prediction: for a small pair and a large positive remainder W
(density decreasing at 0) the equal pair is a local MINIMUM of f(theta) on [pi/4, pi/2]."""
import numpy as np, math
from scipy.integrate import quad
def E_abs(lam, limit=1000):
    lam = np.asarray(lam, float)
    f = lambda t: 0.0 if t == 0 else (1 - np.prod(np.exp(-1j*lam*t)/np.sqrt(1 - 2j*lam*t)).real)/t**2
    return 2/math.pi*quad(f, 0, np.inf, limit=limit)[0]
def dens_deriv0_tilde(a, b, W, limit=1000):
    """p'_{Xtilde}(0) = (1/pi) int_0^inf Re[(-i t) phi_tilde(t)] dt = (1/pi) int_0^inf t Im phi_tilde(t) dt."""
    W = np.asarray(W, float)
    def phi(t):
        v = np.prod(np.exp(-1j*W*t)/np.sqrt(1 - 2j*W*t))
        v *= np.exp(-1j*a*t)*(1-2j*a*t)**(-1.5) * np.exp(-1j*b*t)*(1-2j*b*t)**(-1.5)
        return v
    f = lambda t: t*phi(t).imag
    return quad(f, 0, np.inf, limit=limit)[0]/math.pi
for W in [[1.0, 1.0, 1.0], [1.0], [0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3, 0.3], []]:
    for r in [0.1, 0.3, 1.0, 3.0]:
        ths = np.linspace(math.pi/4, math.pi/2, 7)
        vals = np.array([E_abs(list(W) + [r*math.cos(t), r*math.sin(t)]) for t in ths])
        a, b = r*math.cos(ths[3]), r*math.sin(ths[3])
        pd = dens_deriv0_tilde(a, b, W)
        # finite-difference check of the formula at ths[3]
        h = 1e-3
        fd = (E_abs(list(W)+[r*math.cos(ths[3]+h), r*math.sin(ths[3]+h)]) - E_abs(list(W)+[r*math.cos(ths[3]-h), r*math.sin(ths[3]-h)]))/(2*h)
        pred = -8*a*b*(b-a)*pd
        print(f"W={W} r={r}: f(theta)-f(pi/4) = {np.round(vals-vals[0],6)}  | at theta={ths[3]:.3f}: dF/dtheta FD={fd:+.6f} formula={pred:+.6f}  p'_tilde(0)={pd:+.5f}")
