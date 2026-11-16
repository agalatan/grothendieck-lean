# cubic_l1_gram_certificate/discover.py
"""Numerical exploration only: retain the complete Gram moment identities."""
import sys,json
import numpy as np
import cvxpy as cp
from scipy.optimize import minimize_scalar
from basis import basis,linear_basis,KNOTS

def gap_at(x,r):
    r=np.asarray(r);v=r*r;G,H,K=basis(r);co=np.array(x['coef']);ww=linear_basis(r)@x['ww'];h=H@co;k=K@co
    hd=h[:,0]-x['alpha'][0]+3*ww[:,1]
    hc=h[:,1]-x['alpha'][1]-x['kc']*(v-1)+ww[:,0]-ww[:,1]
    hb=k[:,0]*2/3+k[:,1]-x['kb']*v+2*ww[:,2]
    m=np.array(x['mat']);pen=(m[1,1]*hd**2-2*m[0,1]*hd*hc+m[0,0]*hc**2)/(4*np.linalg.det(m))+hb**2/(4*x['zeta'])
    d=x['d'];return d[0]+d[1]*v+d[2]*v**2+d[3]*v**3+np.sum((v[:,None]*G-H)@co,axis=1)-r-ww[:,0]-2*ww[:,1]-pen

def solve(s,r):
    v=r*r;G,H,K=basis(r);co=cp.Variable((2*len(KNOTS),2));d=cp.Variable(4);alpha=cp.Variable(2)
    WW=cp.Variable((len(KNOTS),3));ww=linear_basis(r)@WW
    M=cp.Variable((2,2),PSD=True);zeta=cp.Variable(nonneg=True);nu=cp.Variable();mu=cp.Variable(2,nonneg=True);tau=cp.Variable(nonneg=True);L=cp.Variable((2,2),PSD=True);kc=cp.Variable();kb=cp.Variable()
    m11,m12,m22=M[0,0],M[0,1],M[1,1]
    N=cp.Variable((2,2),PSD=True);psi=cp.Variable(nonneg=True)
    ac=np.array([.25,.5,1,2,4,8,16,32]);kcaps=5+3/ac;bcaps=(1+ac)/4;chi=cp.Variable(len(ac),nonneg=True)
    ca=m11/18+zeta+kb
    cb=m11/9+m12/6+zeta/4+kc/4+kb/2
    cp_=5*m11/9+4*m12/3+m22+kc
    cq=5*m11/9+2*m12/3+m22+kc
    cr=4*m11/9+2*m12/3
    con=[ca+N[0,0]/2<=nu+tau,cb+N[0,0]+N[0,1]/2<=nu+psi-(bcaps/kcaps)@chi,cp_+2*tau+L[0,0]+N[0,0]<=2*nu+mu[0],cq+L[1,1]+N[0,0]+2*N[0,1]+N[1,1]<=2*nu+mu[1]+cp.sum(chi),cr+2*L[0,1]-4*N[0,0]-2*N[0,1]+12*psi<=(1/kcaps)@chi]
    hd=H@co[:,0]-alpha[0]+3*ww[:,1]
    hc=H@co[:,1]-alpha[1]-kc*(v-1)+ww[:,0]-ww[:,1]
    hb=(K@co[:,0])*(2/3)+K@co[:,1]-kb*v+2*ww[:,2]
    gap=d[0]+d[1]*v+d[2]*v**2+d[3]*v**3+cp.sum((v[:,None]*G-H)@co,axis=1)-r-ww[:,0]-2*ww[:,1]
    pen=cp.Variable((len(r),2));scl=np.maximum(1,v)
    con +=[d[3]>=0,cp.sum(pen,axis=1)<=gap,co[:2,:]==0,cp.SOC(WW[:,0]+WW[:,1],cp.vstack([WW[:,0]-WW[:,1],2*WW[:,2]]),axis=0)]
    con.append(cp.SOC(pen[:,1]/scl+zeta*scl,cp.vstack([hb,pen[:,1]/scl-zeta*scl]),axis=0))
    for i in range(len(r)):
        hv=cp.reshape(cp.hstack([hd[i],hc[i]]),(2,1),order='C')
        con.append(cp.bmat([[4*M*scl[i],hv],[hv.T,cp.reshape(pen[i,0]/scl[i],(1,1),order='C')]])>>0)
    obj=d[0]+d[1]+d[2]*(2+s)+d[3]*(6+9*s+40.45313*s**1.5)+nu*s+4*mu[0]+mu[1]+cp.sum(chi)
    prob=cp.Problem(cp.Minimize(obj),con)
    prob.solve(solver='CLARABEL',tol_gap_abs=1e-9,tol_feas=1e-9,tol_gap_rel=1e-9,max_iter=300)
    return dict(s=s,value=prob.value,status=prob.status,d=d.value.tolist(),mat=M.value.tolist(),zeta=zeta.value,nu=nu.value,mu=mu.value.tolist(),tau=tau.value,gram=L.value.tolist(),gramN=N.value.tolist(),psi=psi.value,chi=chi.value.tolist(),latent=[c.dual_value for c in con[:5]],kc=kc.value,kb=kb.value,alpha=alpha.value.tolist(),coef=co.value.tolist(),ww=WW.value.tolist(),knots=KNOTS.tolist())

def refined(s):
    r=np.unique(np.concatenate([np.linspace(a,b,7) for a,b in zip(KNOTS[:-1],KNOTS[1:])]+[np.geomspace(30,100,20)]))
    for iteration in range(10):
        out=solve(s,r)
        dense=np.unique(np.concatenate([np.linspace(a,b,100) for a,b in zip(KNOTS[:-1],KNOTS[1:])]+[np.geomspace(30,100,200)]))
        gap=gap_at(out,dense);ids=np.where((gap[1:-1]<gap[:-2])&(gap[1:-1]<gap[2:]))[0]+1
        mins=[]
        for i in ids:
            if gap[i]<1e-3:
                z=minimize_scalar(lambda z:gap_at(out,[z])[0],bounds=(dense[i-1],dense[i+1]),method='bounded',options={'xatol':1e-11});mins.append((z.fun,z.x))
        mins.sort();worst=mins[0][0];print(f's={s} iteration={iteration} objective={out["value"]:.12f} min_gap={worst:.8g}',flush=True)
        if worst>-2e-7:break
        r=np.unique(np.r_[r,[x for val,x in mins if val<-1e-8]])
    out['numerical_min_gap']=float(worst)
    with open(f'candidate_s{s:g}.json','w') as f:json.dump(out,f,default=lambda x:x.tolist())
    return out

if __name__=='__main__':
    for s in map(float,sys.argv[1:] or ['6.5']):refined(s)
