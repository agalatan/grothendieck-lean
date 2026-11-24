# explicit pairs f = ph(z + c W), g = ph(z - c W), W an independent standard complex Gaussian standing for a diffuse cubic
import numpy as np, math
from numpy.polynomial.laguerre import laggauss
from numpy.polynomial.legendre import leggauss
E1, ETA = 0.78, 0.0779
def panel(a,b,n):
    x,w=leggauss(n); return (b-a)/2*x+(a+b)/2,(b-a)/2*w
def expnodes():
    T=[];W=[]
    for a,b in zip([0,.25,.5,1,1.5,2,3,4,6,9,14,22],[.25,.5,1,1.5,2,3,4,6,9,14,22,40]):
        t,w=panel(a,b,12); T.append(t); W.append(w*np.exp(-t))
    return np.concatenate(T),np.concatenate(W)
T,WT=expnodes(); nth=256; th=(np.arange(nth)+0.5)*2*np.pi/nth
TT,UU,TH=np.meshgrid(T,T,th,indexing='ij'); WW=(WT[:,None,None]*WT[None,:,None]*np.ones(nth)[None,None,:]/nth)
r=np.sqrt(TT); s=np.sqrt(UU); z=r+0j; W=s*np.exp(1j*TH)
basis={'z':z,'H':z*(TT-2)/math.sqrt(2),'W':W,'e32':z*(TT*TT-6*TT+6)/math.sqrt(12),'e11W':(TT-1)*W,'e20Wb':z*z/math.sqrt(2)*np.conj(W)}
print('norm check', {k:float((np.abs(v)**2*WW).sum()) for k,v in basis.items()})
out=[]
for c in (0.0,0.1,0.2,0.29,0.4,0.6,0.8,1.0,1.3,1.7,2.3,3.2,5,8,20,1e6):
    f=z+c*W; f=f/np.abs(f)
    co={k:(np.conj(v)*f*WW).sum() for k,v in basis.items()}
    t=abs(co['z'])
    V=abs(co['z'])**2-E1*(abs(co['H'])**2-abs(co['W'])**2)+ETA*(abs(co['e32'])**2-abs(co['e11W'])**2-abs(co['e20Wb'])**2)
    out.append((c,t,V)); print('c=%8.2f t=%.4f V=%.6f  500/701-V=%.5f'%(c,t,V,500/701-V))
