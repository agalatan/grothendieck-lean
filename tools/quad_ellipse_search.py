#!/usr/bin/env python3
"""Search the per-panel plans of the ellipse checker (claude-b9ee, #303).

A float simulation of `Grothe/UpperQuad/QuadEllipseCheck.lean` (`diskM2`, `panelErr`): for every panel
of `data/quad-checker/panels.txt` it tries the Bernstein parameters RHOS and the Mehler parameters TAUS,
covers the ellipse by m = ceil(2A/B) real-centred disks of radius R >= sqrt((A/m)^2 + B^2) and keeps the
plan with the smallest predicted error.  Output: `data/quad-checker/ellipse-plans.txt`
(`plan index rhoN rhoD m RN RD tauN tauD predicted_log_err`), read by
`tools/gen_quad_ellipse_plans.py`.  The Lean checker recomputes everything rigorously; this script only
chooses parameters.  Usage: tools/quad_ellipse_search.py [--out FILE]
"""
import mpmath as mp, numpy as np, math, sys, os
from fractions import Fraction as Fr
from fractions import Fraction as Fr
mp.mp.dps=60
HERE=os.path.dirname(os.path.abspath(__file__))
R_=os.path.join(HERE,'..','data','quad-checker')+'/'
# the profile coefficients in the power basis (true scale), from profile.txt
coef=[];aq=None
for l in open(R_+'profile.txt'):
    t=l.split()
    if t and t[0]=='coeff': coef.append(Fr(int(t[1]),int(t[2])))
    if t and t[0]=='a': aq=Fr(int(t[1]),int(t[2]))
def binHalf(j,k):
    p=mp.mpf(1)
    for i in range(j-k): p*=(k+mp.mpf(1)/2+i)/(i+1)
    return p
def nrmHalf(j): return mp.sqrt(mp.sqrt(mp.pi)*mp.factorial(2*j)/(4**j*mp.factorial(j)**2))
pc=[mp.mpf(0)]*12
for j,x in enumerate(coef):
    for k in range(j+1):
        pc[k]+=mp.mpf(x.numerator)/x.denominator*(-1)**k*binHalf(j,k)/mp.factorial(k)/nrmHalf(j)
realroots=[mp.findroot(lambda s: sum(c*s**k for k,c in enumerate(pc)), r0) for r0 in (13.8275820853,20.8199966101,25.2039347551)]
def taylor_mp(x0):
    n=len(pc); return [sum(pc[j]*mp.binomial(j,k)*x0**(j-k) for j in range(k,n)) for k in range(n)]
TR=[[float(t) for t in taylor_mp(r)] for r in realroots]
PC=[float(c) for c in pc]
import math as m_
kap2=1+float(aq)**2
N=501
lG=[0.0]
for m in range(1,N+1):
    v=[math.lgamma(m+1)-math.lgamma(c+1)-math.lgamma(m-c+1)+2*(m-c+1)*math.log(1+c/m) for c in range(m+1)]
    mx=max(v); lG.append(mx+math.log(sum(math.exp(x-mx) for x in v)))
LG=np.array([math.lgamma(m+1)+lG[m] for m in range(N+1)])
MS=np.arange(N+1)
def taylor_f(xm):
    # float Taylor coefficients of v at the mp point xm; expand about the nearest root when close
    for r,tr in zip(realroots,TR):
        if abs(xm-r)<0.3:
            h=float(xm-r)
            return [sum(math.comb(i,k)*tr[i]*h**(i-k) for i in range(k,12)) for k in range(12)]
    x=float(xm)
    return [sum(math.comb(i,k)*PC[i]*x**(i-k) for i in range(k,12)) for k in range(12)]
def logY(t):
    if t*t>400: return math.inf
    lt=0.0; terms=[]; r=0
    while True:
        if (r+1)**2>8*t*t*(502+r):
            terms.append(lt+math.log(2)); break
        terms.append(lt)
        lt+=math.log(t)+0.5*math.log(2*(502+r))-math.log(r+1); r+=1
        if r>6000: return math.inf
    mx=max(terms); return 2*(mx+math.log(sum(math.exp(x-mx) for x in terms)))
def disk(xm,R,pos,taus):
    t=taylor_f(xm); t0=t[0] if pos else -t[0]
    x=float(xm)
    e=sum(abs(t[k])*R**k for k in range(1,12))
    vlo=t0-e; vhi=t0+e
    if vlo<=0: return None
    zhi=abs(x)+R; zlo=max(0.0,abs(x)-R)
    a2hi=zhi/(kap2*vlo*vlo); a2lo=zlo/(kap2*vhi*vhi)
    kp=None
    if R<x:
        r1=R/x; r2=e/t0
        if r2<1:
            k_=(r1+r2*(2+r2))/(1-r2)**2
            if k_<1: kp=k_
    b2=a2hi*kp*kp/2 if kp is not None else a2hi
    lu=logY(math.sqrt(b2)+2**-40)
    if kp is not None and a2lo>0:
        c2=math.sqrt(1-kp*kp); th=1/c2
        vals=LG+MS*math.log(th*th/a2lo); mx=vals.max()
        lu=min(lu, math.log(th)+mx+math.log(np.exp(vals-mx).sum()))
    if lu==math.inf: return None
    x2=(abs(x)+R+x+R)/2
    y2=R*R/(2*(x-R)) if R<x else (abs(x)+R-(x-R))/2
    T=np.array(taus)
    lm=-N*np.log(T)-np.log(1-T*T)+2*T*x2/(1+T)+2*T*y2/(1-T)
    return -2*(x-R)+lm+lu   # array over taus
def panel(lo,hi,n,rho,NS=1,taus=None):
    lo=mp.mpf(lo.numerator)/lo.denominator; hi=mp.mpf(hi.numerator)/hi.denominator
    c0=(lo+hi)/2; r=(hi-lo)/2; rho=mp.mpf(rho)
    A=r*(rho+1/rho)/2; B=r*(rho-1/rho)/2
    m=max(1,int(mp.ceil(NS*2*A/B))); h=2*A/m
    R=float(mp.sqrt((A/m)**2+B*B)*(1+mp.mpf(10)**-9))
    t0=taylor_f(c0)[0]; pos=t0>0
    acc=None
    for j in range(m):
        xj=c0-A+h*(j+0.5)
        b=disk(xj,R,pos,taus)
        if b is None: return None
        acc=b if acc is None else np.logaddexp(acc,b)
    k=int(np.argmin(acc))
    lerr=float(mp.log(4*(hi-lo)))+0.5*acc[k]-2*n*float(mp.log(rho))-float(mp.log(1-1/rho))
    return lerr,m,R,taus[k]
TAUSF=[1-10**(-k/6) for k in range(3,40)]
TAUQ=[Fr(t).limit_denominator(10**9) for t in TAUSF]
TAUS=[float(t) for t in TAUQ]
RHOQ=[Fr(5,4),Fr(3,2),Fr(7,4),Fr(2),Fr(5,2),Fr(3),Fr(4),Fr(5),Fr(6),Fr(8),Fr(12),Fr(16)]
RHOS=[float(r) for r in RHOQ]
panels=[]
for l in open(R_+'panels.txt'):
    t=l.split()
    if t and t[0]=='panel': panels.append((Fr(int(t[2]),int(t[3])),Fr(int(t[4]),int(t[5])),int(t[6])))
def exactR(lo,hi,rho,m):
    r=(hi-lo)/2; A=r*(rho+1/rho)/2; B=r*(rho-1/rho)/2
    r2=(A/m)**2+B*B
    # R = ceil(sqrt(r2) 2^s)/2^s with s chosen for 64 significant bits
    s=64+max(0,-(r2.numerator.bit_length()-r2.denominator.bit_length())//2+2)
    num=math.isqrt((r2*4**s).__ceil__())+1
    R=Fr(num,2**s)
    assert R*R>=r2
    return R
out=sys.argv[sys.argv.index('--out')+1] if '--out' in sys.argv else R_+'ellipse-plans.txt'
tot=0.0
lines=['# per-panel plans of Grothe/UpperQuad/QuadEllipseCheck.lean: index rhoN rhoD m RN RD tauN tauD log_err',
       '# generated by tools/quad_ellipse_search.py (claude-b9ee, #303)']
for i,(lo,hi,n) in enumerate(panels):
    best=None
    for rq,rho in zip(RHOQ,RHOS):
        res=panel(lo,hi,n,rho,1,TAUS)
        if res is None: continue
        if best is None or res[0]<best[0]: best=(res[0],rq,res[1],res[3])
    assert best is not None, i
    le,rq,m,tf=best
    tq=TAUQ[TAUS.index(tf)]
    R=exactR(lo,hi,rq,m)
    lines.append('plan %d %d %d %d %d %d %d %d %.3f'%(i,rq.numerator,rq.denominator,m,R.numerator,R.denominator,tq.numerator,tq.denominator,le))
    tot+=math.exp(le)
open(out,'w').write('\n'.join(lines)+'\n')
print('panels',len(panels),'predicted total',tot)
