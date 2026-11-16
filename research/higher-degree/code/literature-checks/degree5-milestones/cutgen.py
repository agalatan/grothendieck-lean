# Cutting-plane LP for the degree-5 remote layer with Stein cuts generated for the current extremal law.
import sys,os; sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import numpy as np, json, time
from scipy.optimize import minimize
from numpy.polynomial.laguerre import laggauss
from stein_lp import LP, G_eval, load_nodes
KN=np.array(sorted(set(list(np.round(np.arange(0,1.0001,0.05),4))+list(np.arange(1.25,6.01,0.25))+[7,8,10,12,15,20,30,45,70,120])))
K=len(KN)
def basis_mats(x):
    """phi, Phi, d, A at points x for each hat-basis vector on knots KN (constant after last knot)."""
    Mp=np.zeros((len(x),K)); MP=np.zeros((len(x),K)); Md=np.zeros((len(x),K)); MA=np.zeros((len(x),K))
    for k in range(K):
        v=np.zeros(K); v[k]=1.0
        # reuse G_eval machinery pieces: compute phi, Phi via a local copy
        seg=np.clip(np.searchsorted(KN,x,side='right')-1,0,K-1)
        cum=np.concatenate([[0.0],np.cumsum(np.diff(KN)*(v[:-1]+v[1:])/2)])
        a=KN[seg]; fa=v[seg]; last=(seg==K-1)
        fb=np.where(last,fa,v[np.minimum(seg+1,K-1)]); b=np.where(last,a+1.0,KN[np.minimum(seg+1,K-1)])
        Bs=np.where(last,0.0,(fb-fa)/(b-a)); phi=fa+Bs*(x-a); Phi=cum[seg]+(x-a)*(fa+phi)/2
        with np.errstate(divide='ignore',invalid='ignore'): d=np.where(x>0,phi-Phi/x,0.0)
        Mp[:,k]=phi; MP[:,k]=Phi; Md[:,k]=d; MA[:,k]=Phi-phi
    return Mp,MP,Md,MA
def best_cut(x,w):
    m=(w*x*x).sum(); Mp,MP,Md,MA=basis_mats(x)
    def F(z):
        phi=z[:K]; beta,t,nu=z[K],z[K+1],z[K+2]
        c=-(Mp@phi+beta)/2+2*t*x; e=-(Md@phi)/2+(t-nu/2)*x; A=MA@phi
        return (2/3)*((w*c*x).sum()+np.sqrt(m*(w*c*c).sum()+1e-30))+(2/3)*((w*e*x).sum()+np.sqrt(m*(w*e*e).sum()+1e-30))+(w*A).sum()+(nu/3-2*t)*(m-2)
    best=None
    rng=np.random.default_rng(0)
    for trial in range(6):
        z0=np.concatenate([rng.uniform(-1,1,K),rng.uniform(-1,1,2),[rng.uniform(0,1)]])
        bnds=[(-1,1)]*K+[(-5,5),(-5,5),(0,5)]
        r=minimize(F,z0,method='L-BFGS-B',bounds=bnds,options={'maxiter':3000})
        if best is None or r.fun<best.fun: best=r
    z=best.x; phi=z[:K]; beta,t,nu=z[K],z[K+1],z[K+2]
    c=-(Mp@phi+beta)/2+2*t*x; e=-(Md@phi)/2+(t-nu/2)*x
    lam=max(3*np.sqrt((w*c*c).sum()/m),1e-9); mu=max(3*np.sqrt((w*e*e).sum()/m),1e-9)
    return best.fun, dict(knots=list(KN),vals=list(phi),beta=beta,t=t,lam=lam,mu=mu,nu=nu)
if __name__=='__main__':
    row=sys.argv[1] if len(sys.argv)>1 else 'peak'
    lp=LP(row)
    from numpy.polynomial.legendre import leggauss
    edges=np.unique(np.concatenate([KN,np.linspace(120,300,37)])); xg,wg=leggauss(20)
    tt=np.concatenate([(a+b)/2+(b-a)/2*xg for a,b in zip(edges[:-1],edges[1:])])
    ww=np.concatenate([(b-a)/2*wg for a,b in zip(edges[:-1],edges[1:])])*np.exp(-tt)
    us=np.linspace(0.8*lp.u0,1.3*lp.u0,21); ms=[2.0,2.002,2.005,2.01,2.02,2.04,2.08,2.15,2.3,2.6,3.0]
    NIT=int(sys.argv[2]) if len(sys.argv)>2 else 60
    us_loc=np.linspace(0.93*lp.u0,1.07*lp.u0,9); ms_loc=[2.0,2.002,2.005,2.01,2.02]
    log=[]; t0=time.time()
    g,u,m,p=lp.scan(us,ms); print('it 0: gap %+.4e at u=%.5f m=%.3f (moments only)'%(g,u,m),flush=True)
    for it in range(1,NIT+1):
        idx=np.nonzero(p>1e-12)[0]; x=lp.X[idx]; w=p[idx]
        val,cut=best_cut(x,w)
        gx=G_eval(lp.X,**cut); eexp=(ww*G_eval(tt,**cut)).sum(); viol=(w*G_eval(x,**cut)).sum()
        if viol>-1e-12:
            print('   no violated cut found for the current law (min E G = %.3e); stop'%viol); break
        if eexp<-1e-9: print('   WARNING invalid cut? E_Exp G=%.3e'%eexp)
        lp.add_cut_values(gx)
        g2,p2=lp.solve(u,m)
        g,u,m,p=lp.scan(us_loc,ms_loc) if it%5==0 else (g2,u,m,p2)
        log.append(dict(it=it,gap=g,u=u,m=m,viol=viol,eexp=eexp))
        print('it %d: cut violation %.3e (E_Exp G=%.2e) -> gap %+.4e at u=%.5f m=%.3f  [%.0fs]'%(it,viol,eexp,g,u,m,time.time()-t0),flush=True)
    g,u,m,p=lp.scan(us,ms)
    at=[(float(lp.X[i]),float(p[i])) for i in np.nonzero(p>1e-10)[0]]
    print('FINAL (moments + %d generated Stein cuts): gap %+.4e at u=%.5f m=%.3f atoms=%s'%(len(lp.cuts),g,u,m,[(round(a,4),round(b,7)) for a,b in at]))
    json.dump(dict(gap=g,u=u,m=m,atoms=at,ncuts=len(lp.cuts),log=log),open('cutgen_%s.json'%row,'w'))
