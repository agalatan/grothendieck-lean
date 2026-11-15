#!/usr/bin/env python3
"""Agent-ID: codex-6e2b. N ONLY: scalar radial-derivative majorant search.

For rho>0, w=rho*(x+iy), test b(w,rho)/rho-c*x-B*(x*x+y*y).
Adaptive floating-point quadrature/search is evidence, not a certificate.
No file is written by this program. Requires NumPy/SciPy.
"""
import sys
sys.dont_write_bytecode = True
import argparse
import math
import numpy as np
from scipy.integrate import quad
from scipy.optimize import differential_evolution, minimize
from scipy.special import ellipe, ellipkm1

a, b, d = 699/1250, 179/1250, 2/5
I0, I1, I2 = 2.863947582582862, 1.193675717354603, 1.527398493771395
c0 = (I1-d*I0)/2
theta0 = (I2-2*d*I1+d*d*I0)/2


def b_over_rho(rho, x, y, tolerance=1e-8):
    if rho == 0:
        return theta0+c0*x
    c = rho*(x-d)
    roots = np.roots([b*b, 2*a*b-rho*rho,
                      a*a-2*rho*c, -c*c-rho*rho*y*y])
    cuts = [0.] + sorted(z.real for z in roots
                        if abs(z.imag) < 1e-8 and 1e-14 < z.real < 45) + [45.]

    def f(t):
        if t == 0:
            t = 1e-300
        ell = math.sqrt(t)*(a+b*t)
        vx, vy = rho*(x+t-d), rho*y
        v = math.hypot(vx, vy)
        if v/ell < 1e-4:
            z = (v/ell)**2
            tau = (.5+z/16+3*z*z/128)/ell
        else:
            total = ell+v
            complement = ((ell-v)/total)**2
            inverse_mean = 2/math.pi*ellipkm1(max(complement,1e-300))/total
            mean = 2/math.pi*total*ellipe(1-complement)
            tau = (mean+(v*v-ell*ell)*inverse_mean)/(2*v*v)
        return (t-d)*(x+t-d)*tau*math.exp(-t)

    return sum(quad(f, lo, hi, epsabs=tolerance, epsrel=tolerance,
                    limit=150)[0] for lo, hi in zip(cuts[:-1], cuts[1:]))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--c', type=float, default=.13)
    parser.add_argument('--B', type=float, default=.04)
    parser.add_argument('--search', action='store_true')
    args = parser.parse_args()
    c, B = args.c, args.B
    print('N ONLY; Agent-ID: codex-6e2b; candidate c,B=',c,B,flush=True)
    print('rho=0 exact-formula numerical maximum',theta0+(c-c0)**2/(4*B),
          'at x=',(c0-c)/(2*B),flush=True)
    if args.search:
        def objective(z):
            rho, x, y = math.exp(z[0]), z[1], z[2]
            return -(b_over_rho(rho,x,y)-c*x-B*(x*x+y*y))
        result = differential_evolution(objective,
            [(-7,math.log(1.5)),(-6,6),(0,6)], popsize=6,
            maxiter=25, polish=False, seed=8, tol=1e-6)
        print('search',result.x,'rho',math.exp(result.x[0]),'m_required',-result.fun,flush=True)
        refined = minimize(objective,result.x,method='Nelder-Mead',
            options={'xatol':1e-6,'fatol':1e-9,'maxiter':200})
        print('refined',refined.x,'rho',math.exp(refined.x[0]),
              'm_required',-refined.fun,flush=True)


if __name__ == '__main__':
    main()
