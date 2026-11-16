import sys,os; sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from numpy.polynomial.legendre import leggauss
from numpy.polynomial.laguerre import laggauss
from stein_lp import G_eval
from cutgen import KN, best_cut
rng=np.random.default_rng(3)
x=np.array([0.0003,1.907,2.0048,116.699]); w=np.array([0.4956165,0.1172392,0.3871429,1.3e-06]); w=w/w.sum()
val,cut=best_cut(x,w)
# accurate E_Exp via Gauss-Legendre panels aligned with knots, up to 300, plus tail beyond 300 (G constant phi there)
edges=np.unique(np.concatenate([KN,np.linspace(120,300,37)]))
xg,wg=leggauss(20); pts=[];wts=[]
for a,b in zip(edges[:-1],edges[1:]):
    pts.append((a+b)/2+(b-a)/2*xg); wts.append((b-a)/2*wg)
pts=np.concatenate(pts); wts=np.concatenate(wts)*np.exp(-np.concatenate([(a+b)/2+(b-a)/2*xg for a,b in zip(edges[:-1],edges[1:])]))
acc=(wts*G_eval(pts,**cut)).sum()
tt,ww=laggauss(150); lag=(ww*G_eval(tt,**cut)).sum()
# components
def comps(u):
    knots=np.array(cut['knots']); vals=np.array(cut['vals'])
    return G_eval(u,**cut)
print('cut violation on law: %.4e'%(w*G_eval(x,**cut)).sum())
print('E_Exp G: accurate panels %.6e   Gauss-Laguerre(150) %.6e'%(acc,lag))
print('lam=%.3e mu=%.3e nu=%.3f t=%.3f beta=%.3f'%(cut['lam'],cut['mu'],cut['nu'],cut['t'],cut['beta']))
