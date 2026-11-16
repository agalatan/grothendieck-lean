# cubic_l1_gram_certificate/verify.py
"""Exact, optimizer-free verification. Standard Python library only."""
from fractions import Fraction as Q
from math import comb, isqrt
import json,sys,time

def add(a,b):
    c=[Q(0)]*max(len(a),len(b))
    for i,x in enumerate(a):c[i]+=x
    for i,x in enumerate(b):c[i]+=x
    while len(c)>1 and not c[-1]:c.pop()
    return c
def scale(a,b):return [x*b for x in a]
def mul(a,b):
    c=[Q(0)]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):c[i+j]+=x*y
    while len(c)>1 and not c[-1]:c.pop()
    return c
def power(a,n):
    c=[Q(1)]
    for _ in range(n):c=mul(c,a)
    return c
def deriv(a):return [i*x for i,x in enumerate(a)][1:] or [Q(0)]
def summ(*ps):
    c=[Q(0)]
    for p in ps:c=add(c,p)
    return c

def segment_poly(x,j):
    knots=list(map(Q,x['knots']));co=[[Q(v) for v in row] for row in x['coef']]
    ww=[[Q(v) for v in row] for row in x['ww']]
    last=j==len(knots)-1
    if last:
        R=knots[-1];r=[R,Q(1)];r2=mul(r,r)
        gs=[add([co[-2][k]],scale(add(r2,[-R*R]),co[-1][k]/(2*R))) for k in range(2)]
        ks=[scale(mul(r,deriv(g)),Q(1,2)) for g in gs]
        ws=[[w] for w in ww[-1]]
    else:
        a,b=knots[j:j+2];length=b-a;r=[a,length]
        hb=[[Q(1),Q(0),Q(-3),Q(2)],[Q(0),length,-2*length,length],
            [Q(0),Q(0),Q(3),Q(-2)],[Q(0),Q(0),-length,length]]
        gs=[summ(*(scale(p,co[2*j+i][k]) for i,p in enumerate(hb))) for k in range(2)]
        ks=[scale(mul(r,deriv(g)),1/(2*length)) for g in gs]
        ws=[[ww[j][k],ww[j+1][k]-ww[j][k]] for k in range(3)]
    r2=mul(r,r);hs=[add(g,k) for g,k in zip(gs,ks)]
    alpha=list(map(Q,x['alpha']));d=list(map(Q,x['d']))
    M=[[Q(v) for v in row] for row in x['mat']];zeta=Q(x['zeta'])
    det=M[0][0]*M[1][1]-M[0][1]**2
    assert det>0 and M[0][0]>0 and zeta>0 and d[3]>=0
    xd=summ(hs[0],[-alpha[0]],scale(ws[1],3))
    xc=summ(hs[1],[-alpha[1]],scale(add(r2,[-1]),-Q(x['kc'])),ws[0],scale(ws[1],-1))
    xb=summ(scale(ks[0],Q(2,3)),ks[1],scale(r2,-Q(x['kb'])),scale(ws[2],2))
    poly=summ(*[scale(power(r2,k),v) for k,v in enumerate(d)],mul(r2,add(*gs)),scale(add(*hs),-1),scale(r,-1),scale(ws[0],-1),scale(ws[1],-2))
    numerator=summ(scale(mul(xd,xd),M[1][1]),scale(mul(xd,xc),-2*M[0][1]),scale(mul(xc,xc),M[0][0]))
    poly=summ(poly,scale(numerator,-1/(4*det)),scale(mul(xb,xb),-1/(4*zeta)))
    return poly,last

def nonnegative(poly,tail=False):
    n=len(poly)-1
    if tail:
        # (1-t)^n P(t/(1-t)): Bernstein coefficients p_i / binom(n,i).
        b=[p/Q(comb(n,i)) for i,p in enumerate(poly)]
    else:
        b=[sum((poly[j]*Q(comb(i,j),comb(n,j)) for j in range(i+1)),Q(0)) for i in range(n+1)]
    stack=[(b,0)];leaves=0
    while stack:
        row,depth=stack.pop()
        if min(row)>=0:leaves+=1;continue
        assert row[0]>=0 and row[-1]>=0, 'Negative polynomial endpoint'
        assert depth<45,'Unable to certify polynomial'
        left=[row[0]];right=[row[-1]]
        while len(row)>1:
            row=[(a+b)/2 for a,b in zip(row[:-1],row[1:])]
            left.append(row[0]);right.append(row[-1])
        stack.append((left,depth+1));stack.append((right[::-1],depth+1))
    return leaves

def sqrt_upper(q):
    q=Q(q);D=10**12
    n=isqrt(q.numerator*D*D//q.denominator)
    if n*n*q.denominator<q.numerator*D*D:n+=1
    return Q(n,D)

def bound(x,s):
    s=Q(s);d=list(map(Q,x['d']));mu=list(map(Q,x['mu']))
    return d[0]+d[1]+d[2]*(2+s)+d[3]*(6+9*s+Q(4045313,100000)*s*sqrt_upper(s))+Q(x['nu'])*s+4*mu[0]+mu[1]+sum(map(Q,x['chi']))

def psd(M):
    a,b,c=Q(M[0][0]),Q(M[0][1]),Q(M[1][1])
    assert Q(M[1][0])==b and a>=0 and c>=0 and a*c>=b*b, 'Matrix is not PSD'

def budget_check(x):
    for k in ['mat','gram','gramN']:psd(x[k])
    m11,m12,m22=Q(x['mat'][0][0]),Q(x['mat'][0][1]),Q(x['mat'][1][1])
    L=[[Q(v) for v in row] for row in x['gram']];N=[[Q(v) for v in row] for row in x['gramN']]
    z,kc,kb,nu,tau,psi=[Q(x[k]) for k in ['zeta','kc','kb','nu','tau','psi']]
    mu=list(map(Q,x['mu']));chi=list(map(Q,x['chi']))
    assert z>0 and tau>=0 and psi>=0 and all(v>=0 for v in mu+chi)
    aa=[Q(1,4),Q(1,2),Q(1),Q(2),Q(4),Q(8),Q(16),Q(32)]
    kk=[5+3/a for a in aa];bb=[(1+a)/4 for a in aa]
    assert len(chi)==len(aa)
    ca=m11/18+z+kb
    cb=m11/9+m12/6+z/4+kc/4+kb/2
    cp=5*m11/9+4*m12/3+m22+kc
    cq=5*m11/9+2*m12/3+m22+kc
    cr=4*m11/9+2*m12/3
    assert ca+N[0][0]/2<=nu+tau, 'A budget'
    assert cb+N[0][0]+N[0][1]/2<=nu+psi-sum(b*c/k for b,c,k in zip(bb,chi,kk)), 'B budget'
    assert cp+2*tau+L[0][0]+N[0][0]<=2*nu+mu[0], 'P budget'
    assert cq+L[1][1]+N[0][0]+2*N[0][1]+N[1][1]<=2*nu+mu[1]+sum(chi), 'Q budget'
    assert cr+2*L[0][1]-4*N[0][0]-2*N[0][1]+12*psi<=sum(c/k for c,k in zip(chi,kk)), 'R budget'

def verify(x):
    budget_check(x)
    knots=list(map(Q,x['knots']))
    assert knots[0]==0 and all(a<b for a,b in zip(knots[:-1],knots[1:]))
    assert len(x['coef'])==2*len(knots) and len(x['ww'])==len(knots)
    assert all(Q(v)==0 for row in x['coef'][:2] for v in row)
    for row in x['ww']:
        a,b,c=map(Q,row);assert a>=0 and b>=0 and a*b>=c*c,'Matrix is not PSD'
    count=0
    for j in range(len(knots)):
        p,tail=segment_poly(x,j)
        try:count+=nonnegative(p,tail)
        except AssertionError as exc:raise AssertionError(f'segment {j}: {exc}')
    return count

if __name__=='__main__':
    pack=json.load(open(sys.argv[1]));rho=Q(pack['rho']);last=Q(0);t=time.time()
    assert pack['format']=='cubic-l1-gram-v2'
    assert Q(pack['C6'])==Q(4045313,100000)
    assert pack['s_range']==['0','42']
    for x in pack['certificates']:
        lo,hi=map(Q,x['interval']);assert 0<=lo<=last and last<hi<=42
        assert bound(x,lo)<=rho and bound(x,hi)<=rho
        leaves=verify(x);last=max(last,hi)
        print(x['id'],x['interval'],f'{float(max(bound(x,lo),bound(x,hi))):.12f}',leaves,flush=True)
    assert last>=42
    print(f'PASS: rho={rho}; complete coverage [0,42]; {time.time()-t:.2f}s')
