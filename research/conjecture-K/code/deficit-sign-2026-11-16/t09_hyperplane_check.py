"""Numerical check of Theorem H (REPORT section 5): cubics vanishing on the hyperplane X = 0 (label N).

q = alpha X(|X|^2-2) + X^2 conj(l(Y)) + X Q(Y) + conj(X) F(Y).  For concave phi:
   D_phi(q) >= B_phi(u) - E_r phi(Vbar(r))  (Jensen)  >= A a_phi(u) + B b_phi(u)  (tangent),   Vbar(r) = r[A(r-2)^2 + B r + C].
Prints the true D (grid quadrature), the Jensen bound and the tangent bound for sqrt, Gaussian buffers and the peak row,
and the coefficients a_phi(u), b_phi(u) (which must be positive) on a range of u for the peak profile and of sigma^2 for buffers.
"""
import sys, os, math
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy.interpolate import CubicSpline
from dslib import *
from dsn import *
from hyper import *

def class_tensor(n, rng):
    """random element of the hyperplane class in C^n (coordinate 0 = X)."""
    t = random_tensor(n, rng)
    t[0, 1:, 0] = 0; t[1:, 0, 0] = 0          # (c): (|X|^2-1) L(Y)
    t[1:, 1:, 1:] = 0                          # (f): R(Y)
    return t

if __name__ == '__main__':
    rng = np.random.default_rng(3)
    d = np.load('tab_peak.npz'); Jsp = CubicSpline(d['s'], d['j']); smax = d['s'][-1]
    jpeak = lambda v: np.where(np.sqrt(v) <= smax, Jsp(np.minimum(np.sqrt(v), smax)), Jsp(smax) * smax / np.maximum(np.sqrt(v), smax))
    print('--- coefficients for the peak profile: a(u) = -E_r[r(r^2-4r+2) j(ur)], b(u) = E_r[r(2-r) j(ur)]  (both must be > 0)')
    for u in [1e-4, 1e-3, 0.005, 0.02, 0.0463, 0.1, 0.3, 1.0, 3.0, 10.0, 100.0]:
        a, b, c, dd = tangent_coeffs(jpeak, u)
        print(f'   u={u:8.4f}: a={a:+.6e} b={b:+.6e}   (c={c:+.3e}, d={dd:+.3e})   a/u={a/u:+.5f} b/u={b/u:+.5f}')
    print('--- coefficients for Gaussian buffers phi_sigma (u = 1): closed form a = pi^{-1/2} int_0^{1/s2} lam^{-1/2}(1-lam s2)^{1/2} 2 lam(2-lam)/(1+lam)^4 dlam')
    from scipy import integrate, special
    for s2 in [0.0, 1e-3, 0.01, 0.1, 0.3, 0.5, 1.0, 3.0, 10.0, 100.0]:
        if s2 == 0:
            phip = lambda v: 0.5 / np.sqrt(v)
        else:
            sg = math.sqrt(s2)
            phip = lambda v, s2=s2, sg=sg: SQPI / (2 * sg) * (special.ive(0, v / s2 / 2) + special.ive(1, v / s2 / 2))
        a, b, c, dd = tangent_coeffs(phip, 1.0)
        up = np.inf if s2 == 0 else 1 / s2
        w = (lambda lam: 1.0) if s2 == 0 else (lambda lam: math.sqrt(max(1 - lam * s2, 0.0)))
        acf = integrate.quad(lambda lam: lam ** -0.5 * w(lam) * 2 * lam * (2 - lam) / (1 + lam) ** 4, 0, up, limit=400)[0] / SQPI
        bcf = integrate.quad(lambda lam: lam ** -0.5 * w(lam) * 2 * lam / (1 + lam) ** 3, 0, up, limit=400)[0] / SQPI
        print(f'   sigma^2={s2:7.3f}: a={a:+.6f} (closed form {acf:+.6f})  b={b:+.6f} (closed form {bcf:+.6f})   c={c:+.4f} d={dd:+.4f}')
    print('--- true deficit against the two bounds, random members of the class')
    g2 = Grid(2, PANELS_FINE, 8, 48); g3 = ChunkGrid(3, [0, .5, 1, 2, 3, 5, 8, 12, 18, 28], 4, 12)
    U = 0.0463
    profs1 = [SqrtProfile(1.0), buffer_profile(0.1), buffer_profile(1.0)]
    pk = peak_profile(U)
    def phip_of(p):
        if p.name == 'sqrt': return lambda v: 0.5 / np.sqrt(v)
        s2 = float(p.name.split('=')[1].rstrip(')')); sg = math.sqrt(s2)
        return lambda v: SQPI / (2 * sg) * (special.ive(0, v / s2 / 2) + special.ive(1, v / s2 / 2))
    cases = [('monomial', normalise(t_monomial(2))), ('item-5 cubic', normalise(t_item5(1j))), ('H(X)+H(Y) in the frame (X+Y, X-Y)', None)]
    # H(X)+H(Y) rotated: [U^2 conj(U) + W^2 conj(U) + 2 U W conj(W)]/sqrt2
    t = np.zeros((2, 2, 2), complex); t[0, 0, 0] = 1; t[1, 1, 0] = 1; t[0, 1, 1] = t[1, 0, 1] = 1
    cases[2] = (cases[2][0], normalise(t))
    for i in range(4): cases.append((f'random class member n=2 #{i}', normalise(class_tensor(2, rng))))
    for i in range(3): cases.append((f'random class member n=3 #{i}', normalise(class_tensor(3, rng))))
    for name, t in cases:
        n = t.shape[0]; e = np.zeros(n); e[0] = 1
        coef = profile_coeffs(t, e)
        assert coef[3] < 1e-20 and coef[4] < 1e-20, coef
        line = f'{name:38s} (A,B,C)=({coef[0]:.3f},{coef[1]:.3f},{coef[2]:.3f}) '
        for p in profs1 + [pk]:
            tt = normalise(t, p.u); cf = profile_coeffs(tt, e)
            if n == 2: D = split(g2, tt, p)['D']
            else: D = g3.run(tt, [p])[0][0]['D']
            jb = p.B - jensen_value(cf, p.phi)
            php = jpeak if p is pk else phip_of(p)
            a, b, c, dd = tangent_coeffs(php, p.u)
            tb = cf[0] * a + cf[1] * b
            ok = (D >= jb - 2e-5 * abs(D)) and (jb >= tb - 1e-9)
            line += f"| {p.name}: D={D:.5e} >= Jensen {jb:.5e} >= tangent {tb:.5e} {'OK' if ok else 'VIOLATION'} "
        print(line, flush=True)
