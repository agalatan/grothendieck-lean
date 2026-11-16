# Degree-5 row functional with a remote driver q (law of |q| only), repository conventions (k5 RESULTS.md):
#  Lambda5 = E|A+B| + E|A-B| - (u+nu3^2)/eps1 - (nu5^2 + (a^2+b^2) u)/eta + (bA^2+bB^2) u/eta,
#  A = L + nu5*H32(z) + q(a(T-1)) + b*conj(q) z^2/sqrt2 ,  B = q + nu3*H21(z) - bA*q(T-1) - bB*conj(q) z^2/sqrt2,
#  L = z(l + beta(|z|^2-2)), T=|z|^2, u = E|q|^2.  By joint rotation E_z[...] depends only on s=|q|: Psi(s).
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.interpolate import CubicSpline
eps1,eta=0.848926,0.281576
ROWS={'peak':dict(t=0.84,l=0.8402,beta=0.1591,bA=-0.1585,bB=-0.0965),
      't87':dict(t=0.87,l=0.8707,beta=0.1775,bA=-0.1727,bB=-0.1064),
      't76':dict(t=0.76,l=0.7497,beta=0.1166,bA=-0.1284,bB=-0.0768)}
def zgrid(npan=60,nq=8,na=256,Lmax=7.0):
    x,w=leggauss(nq); e=np.linspace(0,Lmax,npan+1)
    r=np.concatenate([(a+b)/2+(b-a)/2*x for a,b in zip(e[:-1],e[1:])])
    wr=np.concatenate([(b-a)/2*w for a,b in zip(e[:-1],e[1:])])*2*r*np.exp(-r*r)
    th=2*np.pi*(np.arange(na)+0.5)/na
    R,TH=np.meshgrid(r,th,indexing='ij'); Z=R*np.exp(1j*TH); W=(wr[:,None]*np.ones(na)[None,:])/na
    return Z.ravel(),W.ravel()
Z,WZ=zgrid()
T=np.abs(Z)**2; H21=Z*(T-2)/np.sqrt(2); H32=Z*(T*T-6*T+6)/(2*np.sqrt(3)); Z2=Z*Z/np.sqrt(2)
def Psi_on(svals,row,nu3=0.0,nu5=0.0,a=0.0,b=0.0):
    p=ROWS[row]; L=Z*(p['l']+p['beta']*(T-2))
    A0=L+nu5*H32; Bc=1-p['bA']*(T-1)-p['bB']*Z2; Ac=a*(T-1)+b*Z2
    out=np.empty(len(svals))
    for i,s in enumerate(svals):
        A=A0+s*Ac; B=s*Bc+nu3*H21
        out[i]=(WZ*(np.abs(A+B)+np.abs(A-B))).sum()
    return out
def cost(u,row,nu3=0.0,nu5=0.0,a=0.0,b=0.0):
    p=ROWS[row]; return (u+nu3**2)/eps1+(nu5**2+(a*a+b*b)*u)/eta-(p['bA']**2+p['bB']**2)*u/eta
def rowconst(row):
    p=ROWS[row]; return p['t']**2-2*p['l']*p['t']+2*p['beta']**2/eps1
# Exp(1) quadrature for U (Gaussian q): Gauss-Laguerre
from numpy.polynomial.laguerre import laggauss
UL,WL=laggauss(80)
if __name__=='__main__':
    s=np.linspace(0,4.5,451); ps=Psi_on(s,'peak',nu5=0.0408); sp=CubicSpline(s,ps)
    sig=0.2395; u=sig**2
    g=(WL*sp(np.sqrt(u*UL))).sum()-cost(u,'peak',nu5=0.0408)
    print('Gaussian family value at (sigma,nu5)=(0.2395,0.0408): Lambda5=%.7f (repo 1.3587334); row=%.7f (repo 0.7124323)'%(g,g+rowconst('peak')))
