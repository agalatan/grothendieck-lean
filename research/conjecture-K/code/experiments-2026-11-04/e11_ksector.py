# Sector-assembly scan for Conjecture K (peak row): Lambda(G) for a general G in H_{2,1}(C^2) with all six sectors.
# Remote coordinates by scrambled Sobol QMC (smooth integrand), T by 96-point Gauss-Laguerre, phase by 48-point trapezoid.
import numpy as np, sys, time, json, os
from scipy.stats import qmc, norm
from multiprocessing import Pool
eps,ell,beta,S=1891/2500,1057/1250,179/1250,1.3739535
LOG2N=int(sys.argv[1]) if len(sys.argv)>1 else 16
N=2**LOG2N
sob=qmc.Sobol(d=6,scramble=True,seed=7).random_base2(LOG2N); g=norm.ppf(sob)/np.sqrt(2)
X=g[:,0]+1j*g[:,1]; Y=g[:,2]+1j*g[:,3]; Wg=g[:,4]+1j*g[:,5]
# T = s^2 with s ~ Rayleigh (density 2 s e^{-s^2}): Gauss-Legendre in s on [0, 6.5] (integrand smooth in s)
sG,wG=np.polynomial.legendre.leggauss(200); sG=3.25*(sG+1); wG=3.25*wG*2*sG*np.exp(-sG*sG); tT=sG*sG; wT=wG/wG.sum()
th=np.linspace(0,2*np.pi,48,endpoint=False); e1=np.exp(1j*th); e2=e1*e1; em=np.conj(e1)
SH={'q:X(|X|^2-2)':X*(abs(X)**2-2)/np.sqrt(2),'q:X(|Y|^2-1)':X*(abs(Y)**2-1),'q:XbY^2':np.conj(X)*Y*Y/np.sqrt(2),
    'q:(|X|^2-1)Y':(abs(X)**2-1)*Y,'q:X^2Yb':X*X*np.conj(Y)/np.sqrt(2),'q:Y(|Y|^2-2)':Y*(abs(Y)**2-2)/np.sqrt(2),
    'A:X':X,'A:Y':Y,'B:Xb':np.conj(X),'B:Yb':np.conj(Y),
    'Q:|X|^2-1':abs(X)**2-1,'Q:|Y|^2-1':abs(Y)**2-1,'Q:XbY':np.conj(X)*Y,'Q:XYb':X*np.conj(Y),
    'P:X^2':X*X/np.sqrt(2),'P:XY':X*Y,'P:Y^2':Y*Y/np.sqrt(2),'q:W':Wg}
NAMES=list(SH)+['d']
def parts(c):
    c=dict(zip(NAMES,c)); z=np.zeros(N,complex)
    f=lambda pre: sum((c[k]*v for k,v in SH.items() if k.startswith(pre)),z)
    return f('q'),f('A'),f('B'),f('Q'),f('P'),c['d']
def _chunk(args):
    s,e,q,a,b,Q,P,d,sign=args; acc=np.zeros(e-s)
    for t,w in zip(tT,wT):
        st=np.sqrt(t); lt=st*(ell+beta*(t-2))
        # Z-frequencies: L and Z Q and d Z(T-2) at +1; q and (T-1) rA at 0; conj(Z) P at -1; Z^2 conj(rB)/sqrt2 at +2
        g0=sign*(q+(t-1)*a); g1=sign*(st*Q+d*st*(t-2)/np.sqrt(2))
        v=np.abs(g0[:,None]+e1[None,:]*(lt+g1[:,None])+em[None,:]*(sign*st*P)[:,None]+e2[None,:]*(sign*t*b/np.sqrt(2))[:,None]).mean(1)
        acc+=w*v
    return acc.sum()
POOL=None
def Eabs(c,sign):
    q,a,b,Q,P,d=parts(c); nchunk=16; bnds=np.linspace(0,N,nchunk+1).astype(int)
    jobs=[(bnds[i],bnds[i+1],q[bnds[i]:bnds[i+1]],a[bnds[i]:bnds[i+1]],b[bnds[i]:bnds[i+1]],Q[bnds[i]:bnds[i+1]],P[bnds[i]:bnds[i+1]],d,sign) for i in range(nchunk)]
    return sum(POOL.map(_chunk,jobs))/N
def energy(c): return float(sum(abs(x)**2 for x in c))
def Lambda(c): return Eabs(c,1)+Eabs(c,-1)-energy(c)/eps
def vec(**kw): return np.array([complex(kw.get(k,0)) for k in NAMES])
if __name__=="__main__":
    POOL=Pool(int(os.environ.get('NPROC','8'))); t0=time.time(); out={}
    def rep(tag,c,extra=""):
        L=Lambda(c); out[tag]=(L,energy(c)); print(f"{tag:58s} E={energy(c):.4f}  Lambda={L:.6f}  Lambda-S={L-S:+.2e} {extra} [{time.time()-t0:.0f}s]",flush=True)
        return L
    print("N=",N)
    rep("zero adversary (2E|L| = 1.371880 exact)",vec())
    if os.environ.get('CALIB'):
        for sig in [0.15,0.2009,0.25]: rep(f"diffuse Gaussian sigma={sig} (exact S(sigma): 1.37395 at 0.2009)",vec(**{'q:W':sig}))
        sys.exit(0)
    # core worst: Wick monomial u=0.0463 + A-shell on the same driver, w=0.0113, 8 phases
    u,w=0.0463,0.0113; best=None
    for k in range(8):
        ph=np.exp(1j*np.pi*k/4); L=rep(f"core: q=Wick(u={u}) + A:X w={w} phase {k}pi/4",vec(**{'q:X(|X|^2-2)':np.sqrt(u),'A:X':np.sqrt(w)*ph}))
        if best is None or L>best[0]: best=(L,ph)
    core=vec(**{'q:X(|X|^2-2)':np.sqrt(u),'A:X':np.sqrt(w)*best[1]}); print("best core phase",best[1])
    rep("core without A (q=Wick alone, u=0.0463)",vec(**{'q:X(|X|^2-2)':np.sqrt(u)}))
    # add each other sector to the best core, amplitude sqrt(0.0113), 4 phases; same driver X and the other driver Y
    for name in ['B:Xb','B:Yb','Q:|X|^2-1','Q:|Y|^2-1','Q:XbY','P:X^2','P:XY','d','A:Y']:
        for k in range(4):
            c=core.copy(); c[NAMES.index(name)]=np.sqrt(0.0113)*np.exp(1j*np.pi*k/2); rep(f"core + {name} (w=0.0113) phase {k}pi/2",c)
    # hill-climb from the best core over ALL 18 coefficients at fixed total energy 0.0576 = u+w
    rng=np.random.default_rng(3); E0=energy(core); c=core.copy(); Lc=out[[k for k in out if k.startswith('core: q=Wick') and k.endswith(f"phase {int(np.round(np.angle(best[1])/(np.pi/4)))}pi/4")][0]][0]
    step=0.4
    for it in range(60):
        c2=c+step*np.sqrt(E0)*(rng.standard_normal(len(NAMES))+1j*rng.standard_normal(len(NAMES)))/np.sqrt(len(NAMES)); c2=c2*np.sqrt(E0/energy(c2))
        L2=Lambda(c2)
        if L2>Lc: c,Lc=c2,L2; print(f"  climb {it}: Lambda={Lc:.6f} Lambda-S={Lc-S:+.2e} | sector energies: q={sum(abs(c[i])**2 for i,n in enumerate(NAMES) if n.startswith('q')):.4f} A={sum(abs(c[i])**2 for i,n in enumerate(NAMES) if n.startswith('A')):.4f} B={sum(abs(c[i])**2 for i,n in enumerate(NAMES) if n.startswith('B')):.4f} Q={sum(abs(c[i])**2 for i,n in enumerate(NAMES) if n.startswith('Q')):.4f} P={sum(abs(c[i])**2 for i,n in enumerate(NAMES) if n.startswith('P')):.4f} d={abs(c[-1])**2:.4f}",flush=True)
        else: step*=0.9
    print("final climb point:",{n:f"{c[i]:.4f}" for i,n in enumerate(NAMES) if abs(c[i])>1e-3})
    # random mixtures of all sectors at energies 0.03 and 0.06
    for E in [0.03,0.06]:
        worst=-9
        for r in range(12):
            c=rng.standard_normal(len(NAMES))+1j*rng.standard_normal(len(NAMES)); c=c*np.sqrt(E/energy(c)); L=Lambda(c); worst=max(worst,L)
        print(f"random 18-shell mixtures at E={E}: max Lambda-S = {worst-S:+.2e} [{time.time()-t0:.0f}s]",flush=True)
    json.dump({k:v for k,v in out.items()},open('ksector_results.json','w'),indent=1)
