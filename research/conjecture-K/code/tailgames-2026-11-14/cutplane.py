# claude-b9ee, 14 Nov 2026.  min over games (1, l1..lD, nu, nu, ...) of the model norm, by cutting planes:
# LP over the game against a pool of response pairs; best responses by alternating maximisation from many starts.
import numpy as np, sys, time
from scipy.optimize import linprog
from multiprocessing import Pool
import tailmodel as tm
D=int(sys.argv[1]); TAIL=sys.argv[2]            # TAIL: 'free' | 'zero' | 'nonneg' | 'nonpos'
grid=tuple(int(a) for a in sys.argv[3:6]) if len(sys.argv)>=6 else (96,48,48)
NPROC=int(sys.argv[6]) if len(sys.argv)>6 else 8
M=None
def init():
    global M; M=tm.Model(*grid)
def respond(args):
    lam,nu,kind,u0,v0=args
    val,u,v=M.iterate(lam,nu,u0,v0,visible=(kind=='vis'),iters=600)
    c,fg=M.coeffs(u,v)
    return val,c,fg,u,v,kind
def starts(M0,rng,pool):
    r=M0.r.ravel(); w=M0.w.ravel(); T=r*r; one=np.ones_like(w)
    S=[('vis',one,one),('vis',np.sign(2.5-T)+0j,np.sign(2.5-T)+0j),('vis',np.sign(1.0-T)+0j,np.sign(1.0-T)+0j),('vis',np.exp(0.5j*T),np.exp(-0.5j*T))]
    for st in (0.15,0.3,0.5,0.8):
        S.append(('full',np.exp(1j*np.angle(r+st*w)),np.exp(1j*np.angle(r-st*w))))
    for st in (0.3,0.6):   # Davie-like: disagreement in the core
        S.append(('full',np.exp(1j*np.angle(r+st*w)),np.exp(1j*np.angle((r-st*w)*(T-0.2)))))
    for _ in range(3):     # random smooth asymmetric starts
        a,b,c,d=rng.normal(size=4)*0.4
        S.append(('full',np.exp(1j*np.angle(r*(1+a*(T-1))+(0.4+b)*w+0.2*c*T*np.conj(w))),np.exp(1j*np.angle(r*(1+d*(T-1))-(0.4-b)*w+0.2*c*T*np.conj(w)))))
    for (u,v,kind) in pool[-12:]: S.append((kind,u,v))
    return S
if __name__=="__main__":
    t0=time.time(); M0=tm.Model(*grid); rng=np.random.default_rng(1)
    lam=np.array([1.0]+[0.0]*D); nu=0.0
    if D>=1: lam[1]=-0.75
    pool=[]; rows=[]   # rows: (c0..cD, tailsum)
    with Pool(NPROC,initializer=init) as P:
        for rnd in range(60):
            res=P.map(respond,[(tuple(lam),nu,k,u,v) for (k,u,v) in starts(M0,rng,pool)])
            res.sort(key=lambda t:-t[0]); best=res[0][0]
            added=0
            for val,c,fg,u,v,kind in res:
                row=np.array(list(c[:D+1])+[fg-sum(c[:D+1])])
                if val>best-3e-4 and not any(np.abs(row-q).max()<2e-6 for q in rows):
                    rows.append(row); pool.append((u,v,kind)); added+=1
                if added>=4: break
            # LP: variables (l1..lD, nu, t): minimise t s.t. c0 + sum l_k c_k + nu*tail <= t
            A=np.array([list(q[1:D+1])+[q[D+1],-1.0] for q in rows]); b=np.array([-q[0] for q in rows])
            nb={'free':(-1,1),'zero':(0,0),'nonneg':(0,1),'nonpos':(-1,0)}[TAIL]
            sol=linprog([0]*(D+1)+[1],A_ub=A,b_ub=b,bounds=[(-1,1)]*D+[nb,(None,None)],method='highs')
            x=sol.x; lp=x[-1]
            print('round %2d  pool %3d  best response %.7f  LP value %.7f  gap %.2e  game'%(rnd,len(rows),best,lp,best-lp),np.round(x[:D],5),'tail %.5f'%x[D],' (%.0fs)'%(time.time()-t0),flush=True)
            if rnd>0 and best-lp<2e-7 and np.abs(np.array(list(lam[1:])+[nu])-x[:D+1]).max()<1e-9: break
            if rnd>0 and best-lp<1e-7: 
                print('converged'); break
            # damped step towards the LP game (stabilisation)
            new=np.array(list(x[:D+1])); cur=np.array(list(lam[1:])+[nu]); step=0.7 if rnd>2 else 1.0
            cur=cur+step*(new-cur); lam[1:]=cur[:D]; nu=cur[D]
    print('RESULT D=%d tail=%s: N=%.7f  1/N=%.6f  game'%(D,TAIL,lp,1/lp),np.round(x[:D],5),'tail %.5f'%x[D])
    w_=sol.ineqlin.marginals if hasattr(sol,'ineqlin') else None
    if w_ is not None:
        print('optimal mixture (weight, c0..cD, tail):')
        for q,wt in zip(rows,-w_):
            if wt>1e-6: print('   %.4f '%wt, np.round(q,5))
