#!/usr/bin/env python3
# Reviewer (N): pointwise check of the limit-model kernels p(s), zp(s) of siglib.limit_kernels (panel quadrature in T,
# scipy.special.ive) against adaptive mpmath quadrature of the defining integrals (mpmath.besseli, 30 digits):
#   p(s)  = E_T[ 2 s exp(-s^2 - a^2) I_0(2 a s) ],   zp(s) = E_T[ sqrt(T)(3T^2 - 2T - 2) sgn(T-2) 2 s exp(-s^2 - a^2) I_1(2 a s) ],
#   a = rho sqrt(T)|T - 2|,  T ~ Exp(1).
# and of the junta value ||E[C_0|p]||^2 by an independent mpmath computation (roots of the cubic, no angle substitution).
import sys, math
import numpy as np
import mpmath as mp
sys.path.insert(0, sys.argv[1])
import siglib as L
mp.mp.dps = 30
def mp_kernels(rho, s):
    rho = mp.mpf(rho); s = mp.mpf(s)
    a = lambda T: rho * mp.sqrt(T) * abs(T - 2)
    def base(T, nu):
        x = 2 * a(T) * s
        return 2 * s * mp.exp(-(s - a(T)) ** 2 - T) * mp.besseli(nu, x) * mp.exp(-x)
    f0 = lambda T: base(T, 0)
    f1 = lambda T: mp.sqrt(T) * (3 * T * T - 2 * T - 2) * mp.sign(T - 2) * base(T, 1)
    # break points: T = 2/3 (local max of a), T = 2, and the solutions of a(T) = s
    pts = {mp.mpf(0), mp.mpf(2) / 3, mp.mpf(2), mp.mpf(70)}
    rs = (s / rho) ** 2
    for rt in mp.polyroots([1, -4, 4, -rs], maxsteps=200, extraprec=60):
        if abs(mp.im(rt)) < mp.mpf(10) ** -15 and mp.re(rt) > 0: pts.add(mp.re(rt))
    pts = sorted(pts); fine = []
    for lo, hi in zip(pts[:-1], pts[1:]):
        fine += [lo + (hi - lo) * k / 8 for k in range(8)]
    fine.append(pts[-1])
    return mp.quad(f0, fine), mp.quad(f1, fine)
T = L.t_grid(40.0, 0.1)
worst = 0
for rho, ss in ((0.2, [0.3, 1.0, 3.0, 8.0, 20.0]), (0.6, [0.3, 1.0, 3.0, 12.0, 45.0])):
    p, w1, zp = L.limit_kernels(rho, np.array(ss), T)
    for i, s in enumerate(ss):
        p0, z0 = mp_kernels(rho, s)
        e1 = abs(float(p0) - p[i]) / abs(float(p0)); e2 = abs(float(z0) - zp[i]) / abs(float(z0))
        worst = max(worst, e1, e2)
        print('rho = %.1f, s = %5.1f: p = %.12e (rel. diff %.1e), zp = %.12e (rel. diff %.1e), m(s) = E[C_0 conj(ph Q) | |Q| = s] = %.6f' % (rho, s, p[i], e1, zp[i], e2, zp[i] / p[i]))
print('largest relative difference: %.1e' % worst)
assert worst < 1e-8
# junta: ||E[C_0|p]||^2 = int_0^rc (sum_b n_b)^2/(sum_b d_b) dr + E[|C_0|^2; T > 8/3]
rc = mp.sqrt(mp.mpf(32) / 27)
def integrand(r):
    num = 0; den = 0
    for rt in mp.polyroots([1, -4, 4, -r * r], maxsteps=300, extraprec=80):
        Tb = mp.re(rt)
        jac = 2 * mp.sqrt(Tb) / abs(3 * Tb - 2) * mp.exp(-Tb)
        den += jac; num += jac * mp.sqrt(Tb) * (3 * Tb * Tb - 2 * Tb - 2) * mp.sign(Tb - 2)
    return num * num / den
# substitution r = rc (1 - y^2) removes the inverse square-root singularity at rc
I3 = mp.quad(lambda y: integrand(rc * (1 - y * y)) * 2 * rc * y, mp.linspace(mp.mpf(10) ** -12, 1 - mp.mpf(10) ** -12, 17))
I1 = mp.quad(lambda T: T * (3 * T * T - 2 * T - 2) ** 2 * mp.exp(-T), [mp.mpf(8) / 3, 10, 30, 80, mp.inf])
print('junta: ||E[C_0|p]||^2 = %s + %s = %s;  theta*(inf) = %s' % (mp.nstr(I3, 10), mp.nstr(I1, 10), mp.nstr(I3 + I1, 10), mp.nstr((I3 + I1 + 512) / 252, 9)))
