# Extended graded model: z (grade 1), w (grade 3, complex), xi (real Gaussian of bidegree (1,1), correlation |s|^2).
# Used to test whether "diffuse chirp" responses phase(...)*exp(i kappa r xi) raise the value of a game.
import numpy as np, sys, time
import tailmodel as tm
class Model3(tm.Model):
    def __init__(s, nT=64, nR=40, nA=40, nX=14):
        g=16
        def radial(n, rmax=7.0):
            npan=max(1,n//g); xg,wg=np.polynomial.legendre.leggauss(g); edges=np.linspace(0,1,npan+1)**1.5*rmax
            x=np.concatenate([(a+b)/2+(b-a)/2*xg for a,b in zip(edges[:-1],edges[1:])])
            wq=np.concatenate([(b-a)/2*wg for a,b in zip(edges[:-1],edges[1:])])
            return x, wq*2*x*np.exp(-x*x)
        rr,wT=radial(nT); rh,wS=radial(nR); ang=(np.arange(nA)+0.5)*2*np.pi/nA
        xx,wX=np.polynomial.hermite_e.hermegauss(nX); wX=wX/np.sqrt(2*np.pi)
        r=rr[:,None,None,None]; T=r*r; rho=rh[None,:,None,None]; ph=ang[None,None,:,None]; xi=xx[None,None,None,:]
        s.W=wT[:,None,None,None]*wS[None,:,None,None]*np.ones((1,1,nA,1))/nA*wX[None,None,None,:]
        one=np.ones(s.W.shape)+0j
        w=(rho*np.exp(1j*ph))*one; s.w=w; s.r=(r*one).real; s.xi=(xi*one).real; S=np.abs(w)**2; r=r*one; T=T*one; xi=xi*one
        p1=r*(T-2)/np.sqrt(2); p2=r*(T*T-6*T+6)/(2*np.sqrt(3)); p3=r*(T**3-12*T**2+36*T-24)/12
        h2=(xi*xi-1)/np.sqrt(2); h3=(xi**3-3*xi)/np.sqrt(6)
        s.B=[[r],
             [p1, w, r*xi],
             [p2, (T-1)*w, T*np.conj(w)/np.sqrt(2), p1*xi, w*xi, r*h2],
             [p3, (T*T-4*T+2)/2*w, T*(T-3)/np.sqrt(6)*np.conj(w), r*(S-1), r*w*w/np.sqrt(2), p2*xi, (T-1)*w*xi, T*np.conj(w)/np.sqrt(2)*xi, p1*h2, w*h2, r*h3]]
        s.Bf=[np.array([e.ravel() for e in b]) for b in s.B]; s.Wf=s.W.ravel(); s.warm={}
    def iterate(s, lam, nu, u, v, iters=500, tol=2e-12, visible=False):
        val=None
        for it in range(iters):
            u=np.exp(1j*np.angle(s.apply(lam,nu,v))); v=np.exp(1j*np.angle(s.apply(lam,nu,u)))
            new=s.value(lam,nu,u,v)
            if val is not None and abs(new-val)<tol: break
            val=new
        return val,u,v
if __name__=="__main__":
    lam=tuple(float(x) for x in sys.argv[1].split(',')); nu=float(sys.argv[2])
    M=Model3(); r=M.r.ravel(); w=M.w.ravel(); xi=M.xi.ravel(); T=r*r
    allb=np.concatenate(M.Bf); G=(allb.conj()*M.Wf)@allb.T; print('basis Gram error',np.abs(G-np.eye(len(G))).max(),flush=True)
    t0=time.time()
    for name,(u,v) in {'driver pair':(np.exp(1j*np.angle(r+0.35*w)),np.exp(1j*np.angle(r-0.35*w))),
                       'driver pair x chirp 0.15':(np.exp(1j*np.angle(r+0.35*w)+0.15j*r*xi),np.exp(1j*np.angle(r-0.35*w)-0.15j*r*xi)),
                       'driver pair x chirp 0.4':(np.exp(1j*np.angle(r+0.35*w)+0.4j*r*xi),np.exp(1j*np.angle(r-0.35*w)-0.4j*r*xi)),
                       'phase x chirp 0.3':(np.exp(0.3j*r*xi)+0j,np.exp(-0.3j*r*xi)+0j),
                       'phase x chirp 0.8':(np.exp(0.8j*xi)+0j,np.exp(-0.8j*xi)+0j),
                       'phase':(np.ones_like(w),np.ones_like(w))}.items():
        val,u,v=M.iterate(lam,nu,u,v); c,fg=M.coeffs(u,v)
        cx=abs(np.vdot(M.Bf[1][2]*M.Wf,u)); cw=abs(np.vdot(M.Bf[1][1]*M.Wf,u))
        print('%-26s value %.7f  c0..c3='%(name,val),np.round(c,5),' <f,g>=%.5f  |<f,w>|=%.4f |<f,z xi>|=%.4f  (%.0fs)'%(fg,cw,cx,time.time()-t0),flush=True)
