import sys; sys.path.insert(0,__import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np, d5row as D, json, time
from scipy.interpolate import CubicSpline
from scipy.optimize import minimize
row=sys.argv[1] if len(sys.argv)>1 else 'peak'
S=np.linspace(0,4.5,451)
def spline(nu3,nu5,a,b): return CubicSpline(S,D.Psi_on(S,row,nu3,nu5,a,b))
def gauss_val(x):
    u,nu3,nu5,a,b=x
    if u<0: return -10
    sp=spline(nu3,nu5,a,b)
    return (D.WL*sp(np.sqrt(u*D.UL))).sum()-D.cost(u,row,nu3,nu5,a,b)
t0=time.time()
x0=np.array([0.2395**2,0.0,0.0408,0.0,0.0]) if row=='peak' else np.array([0.03,0.0,0.05,0.0,0.0])
res=minimize(lambda x:-gauss_val(x),x0,method='Nelder-Mead',options={'xatol':1e-6,'fatol':1e-10,'maxiter':600})
x=res.x; g=-res.fun
print('row %s: Gaussian benchmark S5 = %.8f at u=%.5f (sigma=%.4f) nu3=%.4f nu5=%.4f a=%.4f b=%.4f ; row value %.8f  (%.0fs)'%(row,g,x[0],np.sqrt(max(x[0],0)),x[1],x[2],x[3],x[4],g+D.rowconst(row),time.time()-t0))
json.dump(dict(row=row,S5=g,x=list(x)),open('gauss_%s.json'%row,'w'))
