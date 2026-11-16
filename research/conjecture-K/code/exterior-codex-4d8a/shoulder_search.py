# /workspace/scratch/a2f683456ed1/grothendieck-literature-1402/existing-program/shoulder_search.py
"""Numerical row searches only; no universal all-sector theorem is assumed proved."""
import json
import numpy as np
from scipy.special import i0e, i1e, roots_legendre
from scipy.optimize import brentq, minimize

e=1891/2500
target=500/701
z,w=roots_legendre(500)
r=(z+1)*4
weights=w*8*r*np.exp(-r*r)
T=r*r

def benchmark(ell,beta):
    a=ell-2*beta
    if a<=0 or beta<0: return 1e3,0
    L2=T*(a+beta*T)**2
    def Jp(v):
        return np.sqrt(np.pi)/(2*np.sqrt(v))*np.dot(weights,i0e(L2/(2*v)))-1/e
    if Jp(1e-10)<=0:
        return np.sqrt(np.pi)*(ell-beta/2),0
    hi=1.
    while Jp(hi)>0: hi*=2
    v=brentq(Jp,1e-10,hi,xtol=1e-14)
    x=L2/v
    val=np.sqrt(np.pi*v)*np.dot(weights,(1+x)*i0e(x/2)+x*i1e(x/2))-v/e
    return val,v

def optimize(lo,hi):
    def objective(par):
        ell,beta=par
        S,v=benchmark(ell,beta)
        return max(lo*lo-2*ell*lo,hi*hi-2*ell*hi)+2*beta*beta/e+S
    ans=minimize(objective,[(lo+hi)/2,.1432],method='Nelder-Mead',
                 options={'xatol':1e-12,'fatol':1e-13,'maxiter':1000})
    ell,beta=(round(float(x),7) for x in ans.x)
    S,v=benchmark(ell,beta)
    cap=objective([ell,beta])
    ulo=4*e*e*.432306903*(.886762780-lo)
    elo=e*e*(1.5*(np.pi/4-lo*lo)+.432306903*(.886762780-lo))
    return {'lo':lo,'hi':hi,'ell':ell,'beta':beta,'a':ell-2*beta,
            'S_numeric':S,'v_star_numeric':v,'cap_numeric':cap,
            'eta_max_numeric':target-cap,'remote_cap_numeric':ulo,'total_cap_numeric':elo}

if __name__=='__main__':
    intervals=[(0,.418),(.618,.664),(.696,.72),(.72,.75),(.75,.78),(.78,.80),
               (.80,.82),(.82,.835),(.835,.84),(.84,.851),(.851,.856),(.856,.863),
               (.81,.83),(.83,.84),(.851,.86),(.86,.87)]
    result={'status':'NUMERICAL ONLY; benchmarks do not establish all-sector inequalities',
            'epsilon':e,'target':target,'rows':[optimize(*p) for p in intervals]}
    print(json.dumps(result,indent=2))
