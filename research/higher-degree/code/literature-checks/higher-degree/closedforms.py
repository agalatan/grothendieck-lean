import numpy as np
from scipy.special import i0e, i1e
# W ~ CN(0,1) density exp(-|w|^2)/pi. Check: M(rho)=E ph(rho+W), N(rho)=E 1/|rho+W|
def M(r): x=r*r/2; return np.sqrt(np.pi)/2*r*(i0e(x)+i1e(x))
def N(r): x=r*r/2; return np.sqrt(np.pi)*i0e(x)
# quadrature check
R=np.linspace(0,8,4001)[1:]; dr=R[1]-R[0]; A=np.linspace(0,2*np.pi,721)[:-1]; da=A[1]-A[0]
RR,AA=np.meshgrid(R,A,indexing='ij'); Wv=RR*np.exp(1j*AA); wt=np.exp(-RR**2)/np.pi*RR*dr*da
for rho in [0.0,0.3,1.0,2.5]:
    X=rho+Wv
    m=(wt*X/np.abs(X)).sum(); n=(wt/np.abs(X)).sum()
    print(rho, 'M num',m.real,'closed',M(rho),' N num',n,'closed',N(rho))
