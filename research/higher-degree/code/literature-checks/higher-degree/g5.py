import sys,os
sys.path.insert(0,os.path.dirname(os.path.abspath(__file__)))
import numpy as np, time
from game5 import Grid, respond, value
KK=[0,1,1,2,2,2,2]
def br(G,eps,gam,init,iters=600,tol=1e-12):
    q=np.array([1.0,-eps,-eps,gam,gam,gam,gam])
    pg=respond(G,np.array(init,complex)); vold=-1
    for it in range(iters):
        pf=respond(G,q*pg); pg=respond(G,q*pf)
        v=float(np.real((q*pf*np.conj(pg)).sum()))
        if abs(v-vold)<tol: break
        vold=v
    return v,q*pg,q*pf,it
def inits():
    return [[1,-0.24,-0.24,0,0,0,0],[1,-0.24,-0.24,0.05,-0.05,0.05,0.1],[1,-0.24,-0.24,0.05,-0.05,0.05,0.0],
            [1,-0.24,-0.24,-0.05,0.05,-0.05,0.1],[1,-0.3,-0.3,0.1,-0.1,0.1j,0.2],[1,-0.2,-0.3j,0.05,0.05j,-0.05,0.1]]
if __name__=='__main__':
    sizes=[(16,6,12,6,32),(24,6,18,6,48)]
    eps,gam=float(sys.argv[1]),float(sys.argv[2])
    for (npr,nqr,npw,nqw,na) in sizes:
        G=Grid(npr,nqr,npw,nqw,na); t0=time.time(); res=[]
        for i,ini in enumerate(inits()):
            v,cg,cf,it=br(G,eps,gam,ini)
            res.append((v,i,it,cf))
        res.sort(key=lambda t:-t[0])
        v,i,it,cf=res[0]
        print('grid',(npr*nqr,npw*nqw,na),'eps=%.4f gam=%.4f  best v=%.8f 1/v=%.7f (init %d, %d it)  all=%s  t=%.0fs'%(eps,gam,v,1/v,i,it,[round(r[0],7) for r in res],time.time()-t0))
        print('   f coeffs/c0:',np.round(cf/cf[0],4))
