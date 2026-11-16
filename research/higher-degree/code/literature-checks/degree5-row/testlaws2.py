# Explicit remote laws as test points; nested optimisation: outer (nu5,a,b) by Nelder-Mead (nu3=0, optimal for Gaussian),
# inner u by bounded scalar search.  Values compared with the Gaussian benchmark computed the same way.
import sys; sys.path.insert(0,__import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np, d5row as D, json, time
from scipy.interpolate import CubicSpline
from scipy.optimize import minimize, minimize_scalar
from numpy.polynomial.laguerre import laggauss
row=sys.argv[1] if len(sys.argv)>1 else 'peak'
D.Z,D.WZ=D.zgrid(npan=40,na=192); D.T=np.abs(D.Z)**2; D.H21=D.Z*(D.T-2)/np.sqrt(2)
D.H32=D.Z*(D.T*D.T-6*D.T+6)/(2*np.sqrt(3)); D.Z2=D.Z*D.Z/np.sqrt(2)
S=np.linspace(0,9.0,361)
t,wt=laggauss(60); laws={}
laws['Gaussian Exp(1) (m=2)']=(t,wt)
laws['constant modulus U=1 (m=1, excluded by m>=2)']=(np.array([1.0]),np.array([1.0]))
laws['H(w): U=T(T-2)^2/2 (m=44)']=(t*(t-2)**2/2,wt)
T1,T2=np.meshgrid(t,t,indexing='ij'); W2=np.outer(wt,wt)
laws['X(|Y|^2-1): U=T1(T2-1)^2 (m=18)']=((T1*(T2-1)**2).ravel(),W2.ravel())
t3,w3=laggauss(30); A1,A2,A3=np.meshgrid(t3,t3,t3,indexing='ij'); W3=(w3[:,None,None]*w3[None,:,None]*w3[None,None,:])
laws['X Y conj(V): U=T1T2T3 (m=8)']=((A1*A2*A3).ravel(),W3.ravel())
laws['Gaussian scale mixture U=E*M, M in {0.5,1.5} (m=2.5)']=(np.concatenate([0.5*t,1.5*t]),np.concatenate([wt,wt])/2)
try:
    Lj=json.load(open('lp_%s.json'%row)); at=np.array(Lj['atoms'])
    laws['moment-LP extremal law (m=%.3f)'%Lj['m']]=(at[:,0],at[:,1])
except Exception as e: print('no LP law',e)
def inner(sp,U,W,nu5,a,b):
    def f(u):
        s=np.minimum(np.sqrt(u*U),S[-1]); return -((W*sp(s)).sum()-D.cost(u,row,0.0,nu5,a,b))
    r=minimize_scalar(f,bounds=(1e-4,0.2),method='bounded',options={'xatol':1e-7})
    return -r.fun,r.x
def outer(U,W,x0):
    cache={}
    def F(y):
        nu5,a,b=y; sp=CubicSpline(S,D.Psi_on(S,row,0.0,nu5,a,b)); v,u=inner(sp,U,W,nu5,a,b); cache[tuple(y)]=u; return -v
    r=minimize(F,x0,method='Nelder-Mead',options={'xatol':1e-5,'fatol':1e-10,'maxiter':120})
    return -r.fun,r.x,cache.get(tuple(r.x))
G=json.load(open('gauss_%s.json'%row)); x0=np.array(G['x'][2:])
out={}
for name,(U,W) in laws.items():
    W=W/W.sum(); U=U/(W*U).sum(); m2=(W*U*U).sum()
    t0=time.time(); v,y,u=outer(U,W,x0)
    out[name]=v
    base=out.get('Gaussian Exp(1) (m=2)',v)
    print('%-52s EU^2=%6.2f  sup=%.8f  minus Gaussian: %+.3e  (u=%.4f nu5=%.4f a=%.4f b=%.4f) %.0fs'%(name,m2,v,v-base,u if u else -1,y[0],y[1],y[2],time.time()-t0),flush=True)
