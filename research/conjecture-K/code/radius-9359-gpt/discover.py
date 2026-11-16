# /workspace/scratch/194fe87b7d8f/spline_discover.py
"""Numerical discovery, never a certificate by itself."""
import sys,json,argparse
from pathlib import Path
import numpy as np
import cvxpy as cp
from scipy.optimize import minimize_scalar

KNOTS=np.array([0,.002,.01,.03,.07,.15,.3,.5,.7,1,1.3,1.7,2.3,3,4,5.5,7,9,12,16,22,30.])

def basis(r):
    r=np.asarray(r); n=len(KNOTS)
    G=np.zeros((len(r),2*n));Der=G.copy()
    for i,x in enumerate(r):
        j=min(np.searchsorted(KNOTS,x,side='right')-1,n-1)
        if j==n-1:
            R=KNOTS[-1]
            G[i,-2]=1;G[i,-1]=(x*x-R*R)/(2*R);Der[i,-1]=x/R
        else:
            a,b=KNOTS[j:j+2];h=b-a;t=(x-a)/h
            G[i,2*j:2*j+4]=[2*t**3-3*t*t+1,h*(t**3-2*t*t+t),-2*t**3+3*t*t,h*(t**3-t*t)]
            Der[i,2*j:2*j+4]=[(6*t*t-6*t)/h,3*t*t-4*t+1,(-6*t*t+6*t)/h,3*t*t-2*t]
    K=(r[:,None]/2)*Der
    return G,G+K,K

def linear_basis(r):
    L=np.zeros((len(r),len(KNOTS)))
    for i,x in enumerate(r):
        j=min(np.searchsorted(KNOTS,x,side='right')-1,len(KNOTS)-1)
        if j==len(KNOTS)-1:L[i,j]=1
        else:
            t=(x-KNOTS[j])/(KNOTS[j+1]-KNOTS[j]);L[i,j]=1-t;L[i,j+1]=t
    return L

def gap_at(x,r):
    r=np.asarray(r);v=r*r
    G,H,K=basis(r);co=np.array(x['coef']);la=np.array(x['la']);d=x['d'];aa=x['alpha']
    g=G@co;h=H@co;k=K@co
    ww=linear_basis(r)@np.array(x['ww'])
    xd=h[:,0]-aa[0]+3*ww[:,1];xc=h[:,1]-aa[1]+(la[3]-2*la[2])*(v-1)+ww[:,0]-ww[:,1];xb=k[:,0]*2/3+k[:,1]+la[4]*v+2*ww[:,2]
    rates=[3*la[0],2*la[1]+la[3],2*la[0]/3+la[1]+la[2]+la[4]]
    return d[0]+d[1]*v+d[2]*v**2+d[3]*v**3+v*np.sum(g,axis=1)-np.sum(h,axis=1)-r-xd**2/(4*rates[0])-xc**2/(4*rates[1])-xb**2/(4*rates[2])-ww[:,0]-2*ww[:,1]

def solve(s,r):
    v=r*r; G,H,K=basis(r)
    co=cp.Variable((2*len(KNOTS),2));d=cp.Variable(4)
    la=cp.Variable(5,nonneg=True);alpha=cp.Variable(2)
    WW=cp.Variable((len(KNOTS),3));ww=linear_basis(r)@WW
    vg_h=cp.sum((v[:,None]*G-H)@co,axis=1)
    hd=H@co[:,0]-alpha[0]+3*ww[:,1]
    hc=H@co[:,1]-alpha[1]+(la[3]-2*la[2])*(v-1)+ww[:,0]-ww[:,1]
    kb=(K@co[:,0])*(2/3)+K@co[:,1]+la[4]*v+2*ww[:,2]
    rates=[3*la[0],2*la[1]+la[3],2*la[0]/3+la[1]+la[2]+la[4]]
    gap=d[0]+d[1]*v+d[2]*v**2+d[3]*v**3+vg_h-r-ww[:,0]-2*ww[:,1]
    z=cp.Variable((len(v),3));scl=np.maximum(1,v)
    con=[d[3]>=0,cp.sum(z,axis=1)<=gap,co[0:2,:]==0,cp.SOC(WW[:,0]+WW[:,1],cp.vstack([WW[:,0]-WW[:,1],2*WW[:,2]]),axis=0)]
    for i,x in enumerate([hd,hc,kb]):
        con.append(cp.SOC(z[:,i]/scl+rates[i]*scl,cp.vstack([x,z[:,i]/scl-rates[i]*scl]),axis=0))
    m3=6+9*s+40.45313*s**1.5
    obj=d[0]+d[1]+d[2]*(2+s)+d[3]*m3+sum(la[:3])*s
    prob=cp.Problem(cp.Minimize(obj),con)
    prob.solve(solver='CLARABEL',tol_gap_abs=1e-10,tol_feas=1e-10,tol_gap_rel=1e-10,max_iter=300)
    return dict(s=s,value=prob.value,status=prob.status,d=d.value.tolist(),la=la.value.tolist(),alpha=alpha.value.tolist(),coef=co.value.tolist(),ww=WW.value.tolist(),knots=KNOTS.tolist())

def refined(s):
    r=np.unique(np.concatenate([np.linspace(a,b,18) for a,b in zip(KNOTS[:-1],KNOTS[1:])]+[np.geomspace(30,100,40)]))
    for iteration in range(12):
        out=solve(s,r)
        dense=np.unique(np.concatenate([np.linspace(a,b,100) for a,b in zip(KNOTS[:-1],KNOTS[1:])]+[np.geomspace(30,100,200)]))
        gap=gap_at(out,dense)
        ids=np.where((gap[1:-1]<gap[:-2])&(gap[1:-1]<gap[2:]))[0]+1
        mins=[]
        for i in ids:
            if gap[i]<1e-3:
                z=minimize_scalar(lambda z:gap_at(out,[z])[0],bounds=(dense[i-1],dense[i+1]),method='bounded',options={'xatol':1e-11})
                mins.append((z.fun,z.x))
        mins.sort();worst=mins[0][0]
        print(f's={s} iteration={iteration} objective={out["value"]:.12f} min_gap={worst:.8g}',flush=True)
        if worst>-2e-7:break
        r=np.unique(np.r_[r,[x for val,x in mins if val<-1e-8]])
    out['numerical_min_gap']=float(worst)
    with open(OUTPUT / f'candidate_s{s:g}.json','w') as f:json.dump(out,f,indent=2)
    return out

if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('s',type=float,nargs='+')
    parser.add_argument('--fine',action='store_true',help='Bisect every radius knot interval')
    parser.add_argument('--output',default='numerical-candidates')
    args=parser.parse_args()
    OUTPUT=Path(args.output);OUTPUT.mkdir(parents=True,exist_ok=True)
    if args.fine:KNOTS=np.sort(np.r_[KNOTS,(KNOTS[:-1]+KNOTS[1:])/2])
    for s in args.s:refined(s)
