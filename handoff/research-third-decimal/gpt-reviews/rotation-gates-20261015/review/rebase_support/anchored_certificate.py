#!/usr/bin/env python3
"""Exact global anchored-pair potential certificate.
The per-cell arithmetic uses outward scaled integers; final Schur complements
and LDL pivots use Fraction. No floating proof arithmetic, NumPy or SciPy.
"""
import sys,json,argparse
from pathlib import Path
from math import isqrt
from fractions import Fraction as F
sys.path.insert(0,str(Path(__file__).resolve().parent))
from exact_base import I,SQRT2,inv,ldl,matmul,transpose,madd,upper
S=10**40
Z=(0,0);ONE=(S,S)

def fi(z):
    z=z if isinstance(z,I) else I(z)
    return z.lo.numerator*S//z.lo.denominator,-((-z.hi.numerator*S)//z.hi.denominator)
def add(x,y):return x[0]+y[0],x[1]+y[1]
def neg(x):return -x[1],-x[0]
def sub(x,y):return add(x,neg(y))
def mul(x,y):
    q=[a*b for a in x for b in y];return min(q)//S,-((-max(q))//S)
def div(x,y):
    assert y[0]>0
    return min(a*S//b for a in x for b in y),max(-((-a*S)//b)for a in x for b in y)
def divn(x,n):return x[0]//n,-((-x[1])//n)
def scale(x,n):return (x[0]*n,x[1]*n) if n>=0 else (x[1]*n,x[0]*n)
def absi(x):
    return (0 if x[0]<=0<=x[1] else min(abs(x[0]),abs(x[1])),max(abs(x[0]),abs(x[1])))
def sqrt(x):
    assert x[1]>=0
    return isqrt(max(0,x[0])*S),isqrt(x[1]*S)+1
def rat(x):return I(F(x[0],S),F(x[1],S))
def plus(*xs):
    z=Z
    for x in xs:z=add(z,x)
    return z

def padd(*ps):
    o={}
    for p in ps:
        for k,v in p.items():o[k]=add(o.get(k,Z),v)
    return o
def pscale(p,c):return {k:mul(v,c)for k,v in p.items()}
def pmul(p,q):
    o={}
    for i,v in p.items():
        for j,w in q.items():o[i+j]=add(o.get(i+j,Z),mul(v,w))
    return o
def pevalint(p,mom):return plus(*(mul(v,mom[k])for k,v in p.items()))
def pconst(x):return {0:fi(x)}

def build_polys(theta):
    c=theta[13]-2*theta[14];beta=theta[14];assert c>0 and beta>0
    rt=fi(1/SQRT2);A={2:ONE,0:fi(-1)};V=[{0:ONE},A,{2:rt}]
    W=[{1:ONE},{3:rt,1:scale(rt,-2)},{1:ONE}]
    L={1:fi(c),3:fi(beta)};uE=[pmul(L,p)for p in V]
    uR=[pmul(L,p)for p in W]
    return V,W,L,uE,uR

def prices(norm0,normcross,mass,extra=Z):
    if mass[0]<=0:return ONE,ONE
    p=add(add(norm0,extra),scale(normcross,2));m=sub(add(norm0,extra),scale(normcross,2))
    def pick(x):
        x=(max(0,x[0]),max(0,x[1]));r=sqrt(div(x,mass));v=max(1,(r[0]+r[1])//2)
        return v,v
    return pick(p),pick(m)

def weights(a,b,lmax):
    sm=add(a,b);d=sub(a,b);d2=sub(mul(a,a),mul(b,b))
    nu=divn(add(div(ONE,a),div(ONE,b)),2)
    dnu=divn(sub(div(ONE,a),div(ONE,b)),2)
    den=mul(sm,plus(mul(sm,sm),scale(mul(lmax,lmax),4),scale(mul(lmax,absi(d)),4)))
    gamma=div(fi(8),den)
    tau=add(dnu,divn(mul(gamma,d2),4))
    xi=sub(divn(sm,2),divn(mul(gamma,mul(d2,d2)),16))
    return nu,gamma,tau,xi

def ldl_certificate(A):
    """Exact unit-lower L and positive diagonal d, checked by reconstruction."""
    n=len(A); assert A==transpose(A)
    L=[[F(i==j) for j in range(n)] for i in range(n)];d=[]
    for j in range(n):
        pivot=A[j][j]-sum(L[j][k]**2*d[k] for k in range(j))
        if pivot<=0:raise ValueError(f'nonpositive LDL pivot at {j}: {float(pivot):.8g}')
        d.append(pivot)
        for i in range(j+1,n):
            L[i][j]=(A[i][j]-sum(L[i][k]*L[j][k]*d[k] for k in range(j)))/pivot
    assert all(A[i][j]==sum(L[i][k]*d[k]*L[j][k] for k in range(n)) for i in range(n) for j in range(n))
    return dict(matrix=[[str(v) for v in row] for row in A],L=[[str(v) for v in row] for row in L],d=list(map(str,d)))

def factors_input(variance):
    return variance if variance and isinstance(variance[0],(list,tuple)) else [variance]

def certify(profile,s,m,tables,variance=None,price_scale=F(1),verbose=True):
    th=list(map(F,profile['theta']));eps=F(profile['eps']);s=F(s);m=list(map(F,m));price_scale=F(price_scale)
    if len(th)!=15 or len(m)!=3 or s<0 or eps<=0 or price_scale<=0:raise ValueError('invalid profile, anchor or price scale')
    V,W,L,uE,uR=build_polys(th);L2=pmul(L,L)
    a=[1+th[10],th[11],th[12]];y=[m[i]+s*a[i]for i in range(3)]
    # Anchor p=A(r)+B(r)e^{2i theta}.
    A=padd(pscale(V[0],fi(y[0])),pscale(V[1],fi(y[1])));B=pscale(V[2],fi(y[2]))
    normbase=padd(L2,pmul(A,A),pmul(B,B));normcos2=pscale(pmul(A,B),fi(2));cross=pmul(L,padd(A,B))
    extra0=extra2={}
    if variance is not None:
        factors=variance if variance and isinstance(variance[0],(list,tuple)) else [variance]
        for factor in factors:
            f=list(map(F,factor));assert len(f)==3
            FA=padd(pscale(W[0],fi(f[0])),pscale(W[1],fi(f[1])));FB=pscale(W[2],fi(f[2]))
            extra0=padd(extra0,pmul(FA,FA),pmul(FB,FB));extra2=padd(extra2,pscale(pmul(FA,FB),fi(2)))
    GP=[[pmul(V[i],V[j])for j in range(3)]for i in range(3)]
    GR=[[pmul(W[i],W[j])for j in range(3)]for i in range(3)]
    UE=[[pmul(uE[i],uE[j])for j in range(3)]for i in range(3)]
    UR=[[pmul(uR[i],uR[j])for j in range(3)]for i in range(3)]
    H=[[[Z for j in range(3)]for i in range(3)]for b in range(4)];h=[Z]*3;C=Z
    radial=tables['radial'];angles=[[fi(v)for v in row]for row in tables['angular']]
    assert len(radial)+1==len(tables['radial_nodes'])
    for ir,(mom0,rhi) in enumerate(zip(radial,tables['radial_nodes'][1:])):
        mom=list(map(fi,mom0));rhi=F(rhi)
        lm=fi(rhi*(th[13]-2*th[14]+th[14]*rhi*rhi));lm=(lm[1],lm[1])
        nb=pevalint(normbase,mom);nc=pevalint(normcos2,mom);cr=pevalint(cross,mom)
        ex0=pevalint(extra0,mom);ex2=pevalint(extra2,mom)
        # Integrated angular weights nu0,nu2,gamma0,gamma2,gamma4,tau1,xi0.
        sw=[Z]*7
        for ang in angles:
            mass=mul(mom[0],ang[0]);np=add(mul(nb,ang[0]),mul(nc,ang[2]));xc=mul(cr,ang[1])
            ex=add(mul(ex0,ang[0]),mul(ex2,ang[2]))
            pa,pb=prices(np,xc,mass,ex)
            # The rounded point price is a positive rational; choosing it is not a proof approximation.
            pa=(max(1,pa[0]*price_scale.numerator//price_scale.denominator),)*2
            pb=(max(1,pb[0]*price_scale.numerator//price_scale.denominator),)*2
            nu,gamma,tau,xi=weights(pa,pb,lm)
            vals=[mul(nu,ang[0]),mul(nu,ang[2]),mul(gamma,ang[0]),mul(gamma,ang[2]),mul(gamma,ang[4]),mul(tau,ang[1]),mul(xi,ang[0])]
            sw=[add(u,v)for u,v in zip(sw,vals)]
        nu0,nu2,g0,g2,g4,t1,xi0=sw
        C=add(C,add(mul(pevalint(L2,mom),nu0),mul(mom[0],xi0)))
        for i in range(3):
            h[i]=add(h[i],mul(pevalint(uE[i],mom),t1))
            for j in range(i,3):
                crosslast=(i==2)!=(j==2)
                ebase=mul(pevalint(GP[i][j],mom),nu2 if crosslast else nu0)
                er=mul(pevalint(UE[i][j],mom),divn(add(g0,g2),2))
                ei=mul(pevalint(UE[i][j],mom),divn(sub(g0,g2),2))
                H[0][i][j]=add(H[0][i][j],sub(ebase,er))
                H[1][i][j]=add(H[1][i][j],sub(neg(ebase) if crosslast else ebase,ei))
                rbase=mul(pevalint(GR[i][j],mom),nu2 if crosslast else nu0)
                rw=divn(add(g0,g4),2) if i==j==2 else (g2 if crosslast else g0)
                rr=mul(pevalint(UR[i][j],mom),rw)
                ri=mul(pevalint(UR[i][j],mom),divn(sub(g0,g4),2)) if i==j==2 else Z
                H[2][i][j]=add(H[2][i][j],sub(rbase,rr))
                H[3][i][j]=add(H[3][i][j],sub(rbase,ri))
    # Whole tail uses ordinary Young with a=b=1, no correction.
    tail=list(map(fi,tables['tails']))
    C=add(C,add(tail[0],pevalint(L2,tail)))
    for i in range(3):
        for j in range(i,3):
            if (i==2)==(j==2):
                ve=pevalint(GP[i][j],tail);vr=pevalint(GR[i][j],tail)
                for b in (0,1):H[b][i][j]=add(H[b][i][j],ve)
                for b in (2,3):H[b][i][j]=add(H[b][i][j],vr)
            for b in range(4):H[b][j][i]=H[b][i][j]
    E=[[th[0],th[1],th[2]],[th[1],th[3],th[4]],[th[2],th[4],th[5]]]
    for i in range(3):E[i][i]+=F(profile.get('E_repair','0'))
    R=[[th[6],th[7],F(0)],[th[7],th[8],F(0)],[F(0),F(0),eps]]
    ldl(E);ldl(R);QE=inv(E);QR=inv(R)
    aug=[[rat(C)]+[rat(v)for v in h]]+[[rat(h[i])]+[rat(v)for v in H[0][i]]for i in range(3)]
    aug=upper(aug);Cup=aug[0][0];hup=[[aug[i+1][0]]for i in range(3)];Hup=[[row[1:]for row in aug[1:]]]+[upper([[rat(v)for v in row]for row in block])for block in H[1:]]
    D=[madd(QE if i<2 else QR,Hup[i],-1)for i in range(4)]
    factors=[ldl_certificate(d)for d in D];pivots=[list(map(F,f["d"])) for f in factors]
    av=[[s*v]for v in a];force=madd(hup,matmul(Hup[0],av));cap=Cup+2*matmul(transpose(hup),av)[0][0]+matmul(transpose(av),matmul(Hup[0],av))[0][0]+matmul(transpose(force),matmul(inv(D[0]),force))[0][0]
    avec=[[v]for v in a];Di=inv(D[0]);Dih=matmul(Di,hup)
    q0=Cup+matmul(transpose(hup),Dih)[0][0]
    q1=2*matmul(transpose(avec),madd(hup,matmul(Hup[0],Dih)))[0][0]
    q2=matmul(transpose(avec),matmul(madd(Hup[0],matmul(Hup[0],matmul(Di,Hup[0]))),avec))[0][0]
    assert cap==q0+q1*s+q2*s*s
    out=dict(name=profile['name'],s=str(s),profile=profile,anchor_m=list(map(str,m)),global_quadratic=dict(q0=str(q0),q1=str(q1),q2=str(q2)),price_variance=None if variance is None else [[str(v) for v in f] for f in factors_input(variance)],price_scale=str(price_scale),radial_cells=len(radial),quarter_angular_cells=len(angles),upper=str(cap),C_upper=str(Cup),h_exact=[[str(v)for v in row]for row in hup],H_upper=[[[str(v)for v in row]for row in block]for block in Hup],LDL_pivots=[[str(v)for v in row]for row in pivots],LDL_factors=factors,gate_LDL=dict(E=ldl_certificate(E),R=ldl_certificate(R)),minimum_LDL_pivot=str(min(v for row in pivots for v in row)))
    if verbose:print('PASS global anchored certificate',profile['name'],'s',s,'upper',float(cap),'minimum LDL pivot',float(F(out['minimum_LDL_pivot'])),flush=True)
    return out

if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--input',default=str(Path(__file__).with_name('incumbent_trials.json')));p.add_argument('--profile',default='cert_0745_0.84');p.add_argument('--s',default='3/20');p.add_argument('--radial',type=int,default=1600);p.add_argument('--angular',type=int,default=64);p.add_argument('--variance');p.add_argument('--output',default=str(Path(__file__).with_name('anchored_result.json')));args=p.parse_args()
    from moments import generate
    rows=json.loads(Path(args.input).read_text());trial=next(r for r in rows if r['profile']['name']==args.profile and F(r['s'])==F(args.s))
    tables=generate(nr=args.radial,nq=args.angular)
    result=certify(trial['profile'],F(args.s),trial['m'],tables,None if args.variance is None else args.variance.split(','))
    Path(args.output).write_text(json.dumps(result,indent=2)+'\n')
