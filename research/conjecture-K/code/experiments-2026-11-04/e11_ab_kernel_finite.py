# Finite-amplitude A/B Hessian kernel (peak row): at the pointwise base V = R e^{i th} + x + (t-1) alpha + t e^{2i th} conj(beta)/sqrt2,
# the directional Hessian of |V| in the direction h = (t-1) a' + t e^{2 i th} conj(b')/sqrt2 is (|h|^2 - Re(h conj V / |V|)^2)/|V|.
# As a real quadratic form in (Re a', Im a', Re b', Im b') compare with the target 0.24|a'|^2 + 0.26|b'|^2 + 0.236 Re(a' conj b') (signed).
import numpy as np, itertools
a,b,eps=699/1250,179/1250,1891/2500
sG,wG=np.polynomial.legendre.leggauss(240); sG=3.25*(sG+1); wT=3.25*wG*2*sG*np.exp(-sG*sG); tT=sG*sG
th=(np.arange(2048)+0.5)*2*np.pi/2048; E1=np.exp(1j*th); E2=E1*E1
R=np.sqrt(tT)*(a+b*tT)
# target form in real coordinates (Re a, Im a, Re b, Im b): 0.24|a|^2 + 0.26|b|^2 + 0.236 Re(a conj b)
T4=np.array([[0.24,0,0.118,0],[0,0.24,0,0.118],[0.118,0,0.26,0],[0,0.118,0,0.26]])
def hess(x,alpha,beta):
    H=np.zeros((4,4))
    # basis directions e_k -> h_k(t,th)
    def hdir(ar,br): return lambda t: (t-1)*ar + t*E2*np.conj(br)/np.sqrt(2)
    dirs=[hdir(1,0),hdir(1j,0),hdir(0,1),hdir(0,1j)]
    for t,w,r in zip(tT,wT,R):
        V=r*E1+x+(t-1)*alpha+t*E2*np.conj(beta)/np.sqrt(2); aV=np.abs(V); ph=V/aV
        hs=[d(t) for d in dirs]
        for i in range(4):
            for j in range(i,4):
                val=np.mean((np.real(hs[i]*np.conj(hs[j])) - np.real(hs[i]*np.conj(ph))*np.real(hs[j]*np.conj(ph)))/aV)
                H[i,j]+=w*val; 
                if i!=j: H[j,i]+=w*val
    return H
print("worst min-eigenvalue of (eps^{-1} I - T4 - Hess) over phases, per (x,|alpha|,|beta|):")
worst=9
for x in [0,0.05,0.1,0.2,0.4]:
    for A_ in [0,0.05,0.1,0.2,0.3]:
        for B_ in [0,0.05,0.1,0.2,0.3]:
            m=9
            for pa in [0,np.pi/2,np.pi,3*np.pi/2]:
                for pb in [0,np.pi/2,np.pi,3*np.pi/2]:
                    if (A_==0 and pa>0) or (B_==0 and pb>0): continue
                    Hm=hess(x,A_*np.exp(1j*pa),B_*np.exp(1j*pb)); e=np.linalg.eigvalsh(np.eye(4)/eps-T4-Hm).min(); m=min(m,e)
            worst=min(worst,m); print(f"x={x:.2f} |alpha|={A_:.2f} |beta|={B_:.2f}: min eig = {m:+.4f}",flush=True)
print("WORST over the grid:",worst)
