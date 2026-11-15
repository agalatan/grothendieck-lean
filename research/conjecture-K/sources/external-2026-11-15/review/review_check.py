# claude-b9ee, 15 Nov 2026: independent floating-point check of the "retained first-chaos penalty" note.
# (1) the scalar integrals and the local A/B matrix; (2) the local expansion by finite differences of the exact
# functional; (3) the global inequality  Lambda_hat(q) <= Lambda(q) - |P m(q)|^2/(1+j0)  on Wick monomials.
import numpy as np
from scipy import integrate, special, optimize
a,b,p=699/1250,179/1250,2500/1891
ell=lambda T: np.sqrt(T)*(a+b*T)
def mabs(x,s):                                   # E_theta |x + s e^{i theta}|
    x=np.asarray(x,float); s=np.asarray(s,float); d=x+s
    with np.errstate(divide='ignore',invalid='ignore'):
        m=np.where(d>0,4*x*s/np.where(d>0,d,1)**2,0.0)
    return (2/np.pi)*d*special.ellipe(np.clip(m,0,1))
# Gauss-Laguerre in T for smooth pieces is inaccurate near sqrt(T): use composite Gauss-Legendre in r=sqrt(T)
def radial(n=40,pan=30,rmax=7.5):
    xg,wg=np.polynomial.legendre.leggauss(n); e=np.linspace(0,1,pan+1)**1.5*rmax
    r=np.concatenate([(u+v)/2+(v-u)/2*xg for u,v in zip(e[:-1],e[1:])]); w=np.concatenate([(v-u)/2*wg for u,v in zip(e[:-1],e[1:])])
    return r*r, w*2*r*np.exp(-r*r)               # nodes T, weights of Exp(1)
T,W=radial()
E=lambda F: float(np.sum(W*F))
I=[E(T**k/ell(T)) for k in range(3)]
I0c=np.pi/np.sqrt(a*b)*np.exp(a/b)*special.erfc(np.sqrt(a/b)); I1c=(np.sqrt(np.pi)-a*I0c)/b; I2c=(np.sqrt(np.pi)/2-a*I1c)/b
print('I_k quadrature :',['%.12f'%x for x in I]); print('I_k closed form:',['%.12f'%x for x in (I0c,I1c,I2c)])
j0=I[0]/2; g0=(I[1]-I[0])/2; d0=-I[1]/(2*np.sqrt(2)); kA=p-(I[2]-2*I[1]+I[0])/2; kB=p-I[2]/4; m0=(I[2]-I[1])/(2*np.sqrt(2))
nA=kA+g0*g0/(1+j0); nB=kB+d0*d0/(1+j0); nM=m0+g0*d0/(1+j0)
print('j0=%.12f  1/(1+j0)=%.12f'%(j0,1/(1+j0)))
print('original  A,B,off = %.10f %.10f %.10f'%(kA,kB,m0)); print('corrected A,B,off = %.10f %.10f %.10f   min eig %.8f'%(nA,nB,nM,(nA+nB-np.hypot(nA-nB,2*nM))/2))
# (2) exact functional for H = alphaA (T-1) y + alphaB Z^2 conj(y)/sqrt2 - gamma y  (y a remote coordinate), real coefficients:
# in the frame of Z the perturbation is  X = c1 w + c2 conj(w),  c1 = s(alphaA (T-1) - gamma), c2 = s alphaB T/sqrt2,
# an improper complex Gaussian with Re X ~ N(0,(c1+c2)^2/2), Im X ~ N(0,(c1-c2)^2/2).
gh_x,gh_w=np.polynomial.hermite_e.hermegauss(120); gh_w=gh_w/np.sqrt(2*np.pi)
def F_L(s,aA,aB,gam):
    c1=s*(aA*(T-1)-gam); c2=s*aB*T/np.sqrt(2); l=ell(T)
    re=(c1+c2)[:,None,None]*gh_x[None,:,None]/np.sqrt(2); im=(c1-c2)[:,None,None]*gh_x[None,None,:]/np.sqrt(2)
    val=np.sqrt((l[:,None,None]+re)**2+im**2)
    return 2*float(np.sum(W[:,None,None]*gh_w[None,:,None]*gh_w[None,None,:]*val))
normH2=lambda aA,aB: aA*aA+aB*aB                 # E(T-1)^2 = 1,  E T^2/2 = 1, cross term 0
base=2*E(ell(T))
print('\nlocal expansion, finite differences of the exact functional (should approach the quadratic forms):')
for (aA,aB) in ((1,0),(0,1),(1,1),(1,-1)):
    Qorig=kA*aA*aA+kB*aB*aB+2*m0*aA*aB; Qhat=nA*aA*aA+nB*aB*aB+2*nM*aA*aB
    row=[]
    for s in (0.02,0.01,0.005):
        lam=F_L(s,aA,aB,0.0)-p*s*s*normH2(aA,aB)
        hat=optimize.minimize_scalar(lambda g: s*s*g*g+F_L(s,aA,aB,g),bounds=(-3,3),method='bounded',options=dict(xatol=1e-10)).fun-p*s*s*normH2(aA,aB)
        row.append((s,(base-lam)/s**2,(base-hat)/s**2))
    print(' (alphaA,alphaB)=(%2d,%2d): predicted %.6f / %.6f ;'%(aA,aB,Qorig,Qhat),'  '.join('s=%.3f: %.6f / %.6f'%r for r in row))
# (3) global inequality on the remote Wick monomial q = c y(|y|^2-2)/sqrt2 (||q||^2 = c^2), u = gamma y
sgrid=np.concatenate([np.linspace(0,0.5,2001),np.linspace(0.5,40,4001)[1:]])
Mtab=np.array([E(mabs(ell(T),s)) for s in sgrid])            # M(s) = E_Z |L + s e^{i theta}|
M=lambda s: np.interp(s,sgrid,Mtab)
dM=np.gradient(Mtab,sgrid); Mp=lambda s: np.interp(s,sgrid,dM)
Ty,Wy=radial(); Ey=lambda F: float(np.sum(Wy*F))
print('\nglobal inequality on q = c y(|y|^2-2)/sqrt2 :   Lambda_hat   <=   Lambda - mu^2/(1+j0)      (Lambda, mu)')
for c in (0.05,0.1,0.2152,0.4,0.8,1.5):
    amp=lambda g: np.sqrt(Ty)*np.abs(c*(Ty-2)/np.sqrt(2)-g)
    Lam=2*Ey(M(amp(0.0)))-p*c*c
    hat=optimize.minimize_scalar(lambda g: g*g+2*Ey(M(amp(g))),bounds=(-2,2),method='bounded',options=dict(xatol=1e-11)).fun-p*c*c
    mu=Ey(Mp(amp(0.0))*np.sign(c*(Ty-2))*np.sqrt(Ty))
    rhs=Lam-mu*mu/(1+j0)
    print('  c=%.4f (u=%.4f):  %.8f  <=  %.8f   margin %.2e    (Lambda=%.8f, mu=%.5f, first-order penalty mu^2=%.6f)'%(c,c*c,hat,rhs,rhs-hat,Lam,mu,mu*mu))
