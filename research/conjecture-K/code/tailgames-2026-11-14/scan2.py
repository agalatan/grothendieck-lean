# map N(eps, mu) for the game (1, -eps, mu, mu, ...): driver (Krivine) branch vs visible branch, and the flip amplitude
import numpy as np, sys, tailmodel as tm
from multiprocessing import Pool
def one(args):
    eps,mu=args
    M=tm.Model(64,40,40)
    res=M.best((1,-eps),mu,starts=(0.15,0.4),warm=False,quiet=True)
    vis=max(t[0] for t in res if t[1].startswith('vis'))
    kr=[t for t in res if not t[1].startswith('vis')][0]
    c,fg=M.coeffs(kr[2],kr[3]); cw=abs(np.vdot(M.Bf[1][1]*M.Wf,kr[2]))   # |<f,w>|
    kk=(1-fg)/2
    return (eps,mu,vis,kr[0],cw,kk,c[0],c[1])
if __name__=="__main__":
    mus=[0.0,0.01,0.02,0.03,0.05,0.075,0.1,0.15,0.2]; epss=np.round(np.arange(0.60,1.0001,0.04),3)
    with Pool(24) as p: out=p.map(one,[(e,m) for m in mus for e in epss])
    print('  eps    mu    N_vis      N_driver   max        |<f,w>|   ||k||^2   c0       c1')
    for o in out: print('%.3f %.3f  %.6f  %.6f  %.6f  %.4f  %.4f  %.5f %.5f'%(o[0],o[1],o[2],o[3],max(o[2],o[3]),o[4],o[5],o[6],o[7]),flush=True)
    for m in mus:
        rows=[o for o in out if o[1]==m]; b=min(rows,key=lambda o:max(o[2],o[3]))
        print('mu=%.3f: min over eps grid of N = %.6f at eps=%.2f  (1/N=%.5f)  flip amplitude %.4f'%(m,max(b[2],b[3]),b[0],1/max(b[2],b[3]),b[4]))
