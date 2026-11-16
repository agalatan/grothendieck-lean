# Moment-LP gap of the degree-5 row functional over remote laws of U=|q|^2/u:
#   E U = 1, E U^2 = m in [2,44], E U^3 <= 9m-12+C6 (m-2)^{3/2}, C6=40.45313  (STATUS 3.4; Stein cuts NOT imposed)
import sys; sys.path.insert(0,__import__('os').path.dirname(__import__('os').path.abspath(__file__)))
import numpy as np, d5row as D, json, time
from scipy.interpolate import CubicSpline
from scipy.optimize import linprog, minimize
from numpy.polynomial.laguerre import laggauss
row=sys.argv[1] if len(sys.argv)>1 else 'peak'
G=json.load(open('gauss_%s.json'%row)); S5=G['S5']; u0,nu3,nu5,a,b=G['x']
C6=4045313/100000
S=np.linspace(0,9.0,901)
sp=CubicSpline(S,D.Psi_on(S,row,nu3,nu5,a,b))
N=900; X=440.0*(np.arange(N+1)/N)**2
def M3(m): return 9*m-12+C6*max(m-2,0)**1.5
def lp(u,m):
    f=sp(np.sqrt(u*X))
    Aeq=np.vstack([np.ones_like(X),X,X**2]); beq=[1,1,m]
    res=linprog(-f,A_ub=[X**3],b_ub=[M3(m)],A_eq=Aeq,b_eq=beq,bounds=(0,None),method='highs')
    if res.status!=0: return None,None
    return -res.fun-D.cost(u,row,nu3,nu5,a,b),res.x
t0=time.time()
us=np.linspace(max(u0*0.4,0.005),u0*2.2,23)
ms=[2.0,2.02,2.05,2.1,2.2,2.4,2.7,3.0,3.5,4,5,6,8,10,14,20,28,36,44]
best=(-9,None); table=[]
for m in ms:
    rowbest=(-9,None,None)
    for u in us:
        v,p=lp(u,m)
        if v is not None and v>rowbest[0]: rowbest=(v,u,p)
    table.append((m,rowbest[0]-S5,rowbest[1]))
    if rowbest[0]>best[0]: best=(rowbest[0],(m,rowbest[1],rowbest[2]))
print('row %s  Gaussian benchmark S5=%.8f (fixed visible params at Gaussian optimum)'%(row,S5))
for m,g,u in table: print('  m=%5.2f  best-u=%.5f  LP sup - S5 = %+.3e'%(m,u,g))
v,(m,u,p)=best
atoms=[(X[i],p[i]) for i in np.nonzero(p>1e-9)[0]]
print('MAX moment-LP gap = %+.3e at m=%.2f u=%.5f ; law atoms (U,prob): %s   (%.0fs)'%(v-S5,m,u,[(round(x,4),round(q,6)) for x,q in atoms],time.time()-t0))
json.dump(dict(gap=v-S5,m=m,u=u,atoms=[(float(x),float(q)) for x,q in atoms]),open('lp_%s.json'%row,'w'))
