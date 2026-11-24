import sys; import os; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import d5, numpy as np, math
from numpy.polynomial.laguerre import laggauss
from scipy.optimize import minimize
rows, st = d5.rows2b(); print(st)
z, w = d5.zgrid(npan=40, nth=128)
tau, wt = laggauss(48)
for r in rows:
    if r['t'] not in (0.8, 0.85, 0.7, 0.886): continue
    l, b, bA, bB = [float(r[k]) for k in ('l','beta','bA','bB')]
    D = d5.Dz(z, bA, bB); kap = 1/d5.E1 - (bA*bA+bB*bB)/d5.ETA
    def val(x):
        sig, nu = abs(x[0]), x[1]
        B = d5.base(z, l, b, nu)
        s = sig*np.sqrt(tau)
        ps = np.array([(np.abs(B+si*D)+np.abs(B-si*D))@w for si in s])
        return -(wt@ps - kap*sig*sig - nu*nu/d5.ETA)
    best = min((minimize(val, [s0, 0.01], method='Nelder-Mead', options={'xatol':1e-6,'fatol':1e-10}) for s0 in (0.05,0.3)), key=lambda q:q.fun)
    t = r['t']; G = -best.fun
    print(r['tag'], 'Gaussian row at t: %.7f'%(t*t-2*l*t+2*b*b/d5.E1+G), 'sigma*,nu*', abs(best.x[0]), best.x[1], ' certified row at t: %.7f'%(t*t-2*l*t+float(r['C'])), 'u*=%.6f'%(best.x[0]**2), flush=True)
