# independent evaluation of the three-cluster model of P5 section 1 (own code; profile from the JSON table)
import json, numpy as np, math
from scipy.interpolate import CubicSpline
from scipy.stats import qmc, gamma as gam, beta as bet
from numpy.polynomial.laguerre import laggauss
R='/Users/alingalatan/workspaces/grothe/research/higher-degree/code/degree5-content/'
d=json.load(open(R+'profiles_low/band_row_0.70.json')); S=np.array(d['S'])
def run(sect, frac, c, a2, mabs, marg, sR, Glaw, seed=5, m2=20):
    G_=CubicSpline(S,np.array(d['G'+sect])+(0.4 if sect=='A' else 0.3)*np.array(d['G0']))
    def h(v):
        s=np.sqrt(np.maximum(v,1e-18)); return G_(np.minimum(s,6.0))/s
    u=frac*d['ustar']; tau,wt=laggauss(48)
    # k'(v) on a grid of sqrt v, then spline
    sg=np.linspace(0,8,1601); kk=np.array([wt@h(x*x+u*tau) for x in sg]); kp=CubicSpline(sg,(kk-h(sg*sg))/u)
    U=qmc.Sobol(7,scramble=True,seed=seed).random_base2(m2)
    Rr=-np.log1p(-U[:,0]*(1-1e-12)); Sk=[gam.ppf(U[:,1+k],c) for k in range(3)]; cosphi=np.cos(2*np.pi*U[:,4])
    B=c*bet.ppf(U[:,5],1,c-1)
    if Glaw=='beta': G=B
    elif Glaw=='exp': G=-np.log1p(-U[:,5]*(1-1e-12))
    elif Glaw=='twopoint': # H two-point with E H = 1, E H^2 = 1.2
        H=np.where(U[:,6]<0.5,1-math.sqrt(0.2),1+math.sqrt(0.2)); G=B*H
    kappa=float(np.mean(G**2))
    nrm=a2+c*sum(x*x for x in mabs)+sR; a=math.sqrt(a2/nrm); m=[x/math.sqrt(nrm)*np.exp(1j*math.pi*g) for x,g in zip(mabs,marg)]; sR=sR/nrm
    A=a*(Rr-2)/math.sqrt(2)+sum(mk*(s_-c) for mk,s_ in zip(m,Sk)); absA=np.abs(A)
    sig2=sR*Sk[0]*Sk[1]*Sk[2]/c**3
    V=u*(Rr*absA**2+sig2*G+2*np.sqrt(Rr*sig2*G)*absA*cosphi)
    cx=math.sqrt(u)*np.mean((Rr*A+(A/np.maximum(absA,1e-12))*np.sqrt(Rr*sig2*G)*cosphi)*h(V))
    K=kp(np.minimum(np.sqrt(V),8.0)); Om=1.5*np.mean(V*K*K)-0.75*np.mean(V*K)**2/u
    delta=u*u*(np.mean(Rr**2*absA**4+4*Rr*absA**2*sig2+kappa*sig2**2)-2)
    return abs(cx)**2/(delta*Om), delta/u**2, float(V.mean()/u), kappa, float(np.mean(V**2)/u**2-2)
par=dict(c=4,a2=0.052,mabs=(0.138,0.141,0.180),marg=(-0.11,-0.15,0.25),sR=0.663)
for sect in ('A','B'):
    for law in ('beta','exp','twopoint'):
        for frac in (1.612,1.449):
            r=run(sect,frac,Glaw=law,**par); print('sector %s  u=%.3f u*  G law %-8s: ratio %.4f  chi %.3f  EV/u %.4f  kappa %.4f  (sampled EV^2/u^2-2 = %.3f)'%(sect,frac,law,*r))
print('second seed, A, beta, 1.612:', run('A',1.612,Glaw='beta',seed=11,**par)[0])
# junta limit and class member
print('junta limit (a=1):', run('A',1.612,4,1.0,(0,0,0),(0,0,0),0.0,'beta')[0], run('A',1.449,4,1.0,(0,0,0),(0,0,0),0.0,'beta')[0])
r=run('A',1.612,4,0.0,(1,0,0),(0,0,0),0.0,'beta'); print('X(S-c)/sqrt c, c=4: ratio %.4f chi %.3f (class bound 77/(9(c+3)) = %.4f; chi should be 4+12/c = %.1f)'%(r[0],r[1],77/63,7.0))
