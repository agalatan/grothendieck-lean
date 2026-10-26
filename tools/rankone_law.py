#!/usr/bin/env python3
"""Exact finite law layer for rational rank-one source majorants.

Standard library only. Acceptance is conditional on the explicitly identified
source-node and affine-tail cap proofs; this tool does not integrate Gaussians.
Run --self-test for an independently proved toy source and an inherited-node
compatibility replay. No repository certificate is changed.
"""
from __future__ import annotations
import argparse
from bisect import bisect_right
from fractions import Fraction as Q
import hashlib
import json
from math import comb
from pathlib import Path
import sys

RHO = Q(973612157, 10**9)
C6 = Q(4045313, 100000)


def require(ok, reason):
    if not ok:
        raise ValueError(reason)


def trim(p):
    p = list(map(Q, p))
    while len(p) > 1 and p[-1] == 0:
        p.pop()
    return p or [Q(0)]


def add(*pp):
    out = [Q(0)] * max(map(len, pp))
    for p in pp:
        for i, x in enumerate(p):
            out[i] += x
    return trim(out)


def scale(p, a):
    return trim([a*x for x in p])


def mul(p, q):
    out = [Q(0)] * (len(p)+len(q)-1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            out[i+j] += a*b
    return trim(out)


def power(p, n):
    out = [Q(1)]
    for _ in range(n):
        out = mul(out, p)
    return out


def value(p, x):
    out = Q(0)
    for a in reversed(p):
        out = a + x*out
    return out


def affine(p, a, b):
    """Coefficients of p(a+b*t)."""
    out = [Q(0)] * len(p)
    for i, c in enumerate(p):
        for j in range(i+1):
            out[j] += c*comb(i,j)*a**(i-j)*b**j
    return trim(out)


def bernstein(p, lo, hi):
    n = len(p)-1
    c = affine(p, lo, hi-lo) + [Q(0)]*len(p)
    return [sum((c[j]*Q(comb(i,j),comb(n,j)) for j in range(i+1)),Q(0)) for i in range(n+1)]


def positive(p, lo, hi, depth=12):
    b = bernstein(p,lo,hi)
    if min(b) >= 0:
        return 1
    require(b[0] >= 0 and b[-1] >= 0 and depth > 0,
            f'nonnegative polynomial not certified on [{lo},{hi}]')
    mid = (lo+hi)/2
    return positive(p,lo,mid,depth-1) + positive(p,mid,hi,depth-1)


def lower_bound(p, lo, hi, depth=6):
    if not depth or lo == hi:
        return min(bernstein(p,lo,hi))
    mid = (lo+hi)/2
    return min(lower_bound(p,lo,mid,depth-1),lower_bound(p,mid,hi,depth-1))


def tail_positive(p, lo):
    """All coefficients in p(lo+t) nonnegative imply p>=0 for t>=0."""
    require(all(x >= 0 for x in affine(p,lo,Q(1))), 'tail polynomial fails Taylor certificate')
    return 1


def qmax(p, lo, hi):
    p = list(p)+[Q(0)]*3
    require(all(x == 0 for x in p[3:]), 'qmax expects degree<=2')
    c0,c1,c2 = p[:3]
    out = max(value(p,lo),value(p,hi))
    if c2 < 0:
        vertex = -c1/(2*c2)
        if lo <= vertex <= hi:
            out = max(out,value(p,vertex))
    return out


class Source:
    """Whole-half-line piecewise quadratic in physical r=tau*sqrt(U).

    Each (knot,coefficients) is used up to the next knot; the last piece is
    used forever. Endpoint discontinuities are safe: both adjacent formulae
    are checked on the closed cell when verifying a minorant or majorant.
    """
    def __init__(self, pieces):
        self.pieces = [(Q(x),trim(p)) for x,p in pieces]
        self.knots = [x for x,p in self.pieces]
        require(self.knots and self.knots[0] == 0 and all(x<y for x,y in zip(self.knots,self.knots[1:])), 'source knots must increase from zero')
        require(all(len(p)<=3 for x,p in self.pieces),'source must be piecewise quadratic')

    def at(self, r):
        require(r >= 0,'negative source magnitude')
        return self.pieces[bisect_right(self.knots,r)-1][1]

    def encode(self):
        return [[str(x),list(map(str,p))] for x,p in self.pieces]


def lifted_source(raw):
    """Exact lower hull of certified (r,G+A*r^2), followed by explicit tail.

    The finite hull is ONLY a cap after invoking the joint convexity theorem
    for F(r,f)+A*r^2 and interpolating the listed scalar endpoint tests. Its
    last piece is never extrapolated. Source proof references are metadata,
    not evaluated by this finite checker.
    """
    A = Q(raw['A']);require(A >= 0,'negative semiconvex correction')
    nodes = [(Q(n['r']),Q(n['G']),Q(n['f'])) for n in raw['nodes']]
    require(nodes and nodes[0][0] == 0 and len(nodes)>=2,'source nodes must start at zero')
    require(all(x[0]<y[0] for x,y in zip(nodes,nodes[1:])),'unordered source nodes')
    hull = []
    for r,G,f in nodes:
        p = (r,G+A*r*r,f)
        while len(hull)>=2:
            a,b = hull[-2:]
            if (b[1]-a[1])*(p[0]-b[0]) < (p[1]-b[1])*(b[0]-a[0]):
                break
            hull.pop()
        hull.append(p)
    pieces = []
    for a,b in zip(hull,hull[1:]):
        slope = (b[1]-a[1])/(b[0]-a[0])
        pieces.append((a[0],[a[1]-slope*a[0],slope,-A]))
    tail = raw['tail']
    require(Q(tail['start'])==nodes[-1][0], 'tail must start at final source node')
    require(Q(tail.get('f','0'))==0 and nodes[-1][2]==0,'tail switches test off at the join')
    pieces.append((Q(tail['start']),list(map(Q,tail['coefficients']))))
    return Source(pieces),hull


def source_from_table(table, slope, physical_scale=Q(1)):
    nodes = [(Q(x)/physical_scale,Q(y)) for x,y in table]
    pieces = []
    for (a,ga),(b,gb) in zip(nodes,nodes[1:]):
        m=(gb-ga)/(b-a);pieces.append((a,[ga-m*a,m]))
    m=Q(slope)*physical_scale
    pieces.append((nodes[-1][0],[nodes[-1][1]-m*nodes[-1][0],m]))
    return Source(pieces)


def mixture_source(parts):
    knots=sorted(set(x for w,s in parts for x in s.knots))
    require(all(w>=0 for w,s in parts) and sum(w for w,s in parts)==1,'invalid mixture')
    return Source([(x,add(*[scale(s.at(x),w) for w,s in parts])) for x in knots])


def spectral_pieces(n):
    """Recompute the same Stein budget polynomials as the archived checker.

    Returns rv and coefficients of U^2*G(U). Tensor-budget nodes receive the
    exact 2x2 PSD/residual checks; the analytic law-budget theorem remains an
    inherited mathematical premise, as in the original certificate.
    """
    rv=list(map(Q,n['rv']));mesh=[x*x for x in rv]
    ph=list(map(Q,n['phi']))+[Q(0)]
    beta,t,lam,mu=[Q(n[k]) for k in ['beta','t','lam','mu']]
    nu=Q(n.get('nu','0'))
    require(lam>0 and mu>0 and nu>=0 and len(ph)==len(mesh),'invalid spectral parameters')
    require(rv[0]==0 and all(a<b for a,b in zip(rv,rv[1:])),'invalid spectral mesh')
    require(n.get('eta') is None,'eta is unsupported')
    extras=[(Q(r),Q(e)) for r,e in n.get('extra_budgets',[])]
    require(all(r>=2 and e>=0 for r,e in extras) and sum(e for r,e in extras)<=lam,'invalid extra budget')
    af=sum(e*(r-1)/18 for r,e in extras)
    ag=sum(e*(r+Q(1,2)-3/r)/18 for r,e in extras)
    if 'sixth_joint' in n:
        require('tensor_budget' in n,'joint sixth requires tensor budget')
    if 'tensor_budget' in n:
        ac,bc=verify_tensor_budget(n)
        af,ag=ac/2-lam/3,mu/3-bc/2
    out=[];primitive=Q(0);up=[Q(0),Q(1)]
    for k,lo in enumerate(mesh):
        if k+1<len(mesh):
            hi=mesh[k+1];b=(ph[k+1]-ph[k])/(hi-lo);a=ph[k]-b*lo
        else:
            a=b=Q(0)
        e=primitive-a*lo-b*lo*lo/2
        phi=[a,b];Phi=[e,a,b/2]
        uPhi=add(mul(up,phi),scale(Phi,-1))
        uf=add(scale(mul(up,add(phi,[beta])),-Q(1,2)),[0,0,2*t+lam/3+af])
        ug=add(scale(uPhi,-Q(1,2)),[0,0,t+mu/3-nu/2-ag])
        joint=Q(n.get('sixth_joint',{}).get('weight','0'))
        inner=add(Phi,scale(phi,-1),scale([-2,0,1],nu/3-2*t),scale([-12,0,9,-1],joint))
        out.append(add(scale(power(uf,2),1/lam),scale(power(ug,2),1/mu),mul([0,0,1],inner)))
        if k+1<len(mesh):
            primitive+=(ph[k]+ph[k+1])*(hi-lo)/2
    require(out[0][0]==0 and (len(out[0])<2 or out[0][1]==0),'first cut has singular numerator')
    return rv,out


def verify_tensor_budget(n):
    d=n['tensor_budget'];lam,mu=Q(n['lam']),Q(n['mu'])
    A,B=Q(d['A']),Q(d['B'])
    a,b,c=map(Q,d['M0']);dd,e,f=map(Q,d['M1'])
    alpha,beta=Q(d['alpha']),Q(d['beta'])
    require(nu_zero(n) and not n.get('extra_budgets'),'incompatible tensor options')
    require(a>=0 and c>=0 and a*c>=b*b and dd>=0 and f>=0 and dd*f>=e*e,'tensor matrix is not PSD')
    require(alpha>=0 and beta>=0,'negative tensor multiplier')
    PC=[16,4,Q(16,3),32,0];QC=[0,0,Q(64,3),32,0]
    XC=[Q(80,9),Q(20,9),Q(16,9),Q(96,9),Q(32,9)];CC=[0,0,Q(128,9),Q(96,9),0]
    sos=[a+f/4+alpha,c+dd,f/4-alpha,3*e+3*f/4-beta,2*b-e-f/4+beta]
    joint=[Q(0)]*5
    if 'sixth_joint' in n:
        j=n['sixth_joint'];al,xb,w=map(Q,[j['alpha'],j['xmax'],j['weight']])
        require(al>0 and xb>0 and w>=0,'invalid joint sixth multiplier')
        kind=j.get('kind','triangle');require(kind in ('triangle','young'),'invalid joint sixth kind')
        aa,bb=(150*al,198+150/al) if kind=='triangle' else (Q(135,2)*al,Q(11781,32)+Q(135,2)/al)
        SC=[8,2,8,0,8];HC=[Q(8,3),Q(2,3),Q(8,3),24,-Q(16,3)]
        joint=[w*xb*(aa*s+bb*h) for s,h in zip(SC,HC)]
    require(all(A*p+B*q-lam*x-mu*y-z-j>=0 for p,q,x,y,z,j in zip(PC,QC,XC,CC,sos,joint)),'negative tensor residual')
    return A,B


def nu_zero(n):
    return Q(n.get('nu','0'))==0


def law_polynomial(P):
    require(len(P)==5,'expected P=(a0,a1,a2,a4,a6)')
    a0,a1,a2,a4,a6=map(Q,P)
    return [a0,a1,a2,Q(0),a4,Q(0),a6]


def verify_node(source, tau, P, rv=None, cuts=None, depth=12):
    """Checks P(v)-source(tau*v)-G(v²)>=0 for every v>=0."""
    tau=Q(tau);require(tau>0,'tau must be positive')
    ps=list(map(Q,P));require(ps[1]>=0 and ps[4]>=0,'upper moment signs fail')
    rv=[Q(0)] if rv is None else list(map(Q,rv))
    cuts=[[Q(0)]] if cuts is None else cuts
    require(rv and rv[0]==0 and all(a<b for a,b in zip(rv,rv[1:])) and len(rv)==len(cuts),'invalid cut cells')
    knots=sorted(set([r/tau for r in source.knots]+rv))
    Ppoly=law_polynomial(ps);counts=0;degree=0
    for k,lo in enumerate(knots):
        hi=knots[k+1] if k+1<len(knots) else None
        s=affine(source.at(tau*lo),Q(0),tau)
        ci=bisect_right(rv,lo)-1
        cu=cuts[ci];cv=[Q(0)]*(2*len(cu)-1)
        for j,c in enumerate(cu):cv[2*j]=c
        pol=add(mul(add(Ppoly,scale(s,-1)),[0,0,0,0,1]),scale(cv,-1))
        if ci==0:
            require(all(x==0 for x in pol[:4]),'uncancelled singularity at zero')
            pol=trim(pol[4:])
        degree=max(degree,len(pol)-1)
        counts += tail_positive(pol,lo) if hi is None else positive(pol,lo,hi,depth)
    return {'intervals':len(knots),'bernstein_leaves':counts,'max_degree':degree}


def gain_minorant(old, new, coefficients, depth=14):
    """Check max(0, old(r)-new(r)) >= q(r), r>=0.

    On each rational subinterval, either -q>=0 or old-new-q>=0 suffices.
    This certifies decline-the-test source min(old,new), and does not assume
    the tested profile improves every source point.
    """
    c=list(map(Q,coefficients));require(len(c)==5 and c[1]<=0 and c[4]<=0,'lower moment signs fail')
    q=law_polynomial(c);zero_case=scale(q,-1)
    knots=sorted(set(old.knots+new.knots));leaves=0
    def either(p1,p2,lo,hi,dep):
        if min(bernstein(p1,lo,hi))>=0 or min(bernstein(p2,lo,hi))>=0:
            return 1
        require(all(max(value(p1,x),value(p2,x))>=0 for x in (lo,hi,(lo+hi)/2)),
                'gain minorant has an exact negative witness')
        require(dep>0,'gain minorant not certified')
        mid=(lo+hi)/2
        return either(p1,p2,lo,mid,dep-1)+either(p1,p2,mid,hi,dep-1)
    for k,lo in enumerate(knots):
        diff=add(old.at(lo),scale(new.at(lo),-1),scale(q,-1))
        if k+1<len(knots):
            leaves+=either(zero_case,diff,lo,knots[k+1],depth)
        else:
            require(all(x>=0 for x in affine(zero_case,lo,Q(1))) or all(x>=0 for x in affine(diff,lo,Q(1))), 'gain minorant tail not certified')
            leaves+=1
    return {'cells':len(knots),'bernstein_leaves':leaves}


def stein_pieces(row, cell, node):
    """Inherited bank cut: coefficients of U²*sum(mu_j*G_j(U))."""
    rv=list(map(Q,row['mesh']));mesh=[x*x for x in rv]
    total=[[Q(0)]*5 for _ in rv]
    for weight,index in node['cuts']:
        weight=Q(weight);require(weight>=0,'negative Stein multiplier')
        z=list(map(Q,cell['bank'][index]));K=len(mesh)-1
        require(len(z)==K+2,'wrong Stein bank dimension')
        ph=z[:K]+[Q(0)];beta,alpha=z[K:];primitive=Q(0)
        for k,lo in enumerate(mesh):
            if k<K:
                b=(ph[k+1]-ph[k])/(mesh[k+1]-lo);a=ph[k]-b*lo
            else:a=b=Q(0)
            e=primitive-a*lo-b*lo*lo/2
            p=[2*e*e,Q(0),(a+beta)**2-2*b*e+2*alpha*(e-a)-2*alpha*alpha/3,
               2*(a+beta)*b+2*alpha*(a-b),Q(3,2)*b*b+alpha*b+alpha*alpha/3]
            total[k]=add(total[k],scale(p,weight))+[Q(0)]*5
            total[k]=total[k][:5]
            if k<K:primitive+=(ph[k]+ph[k+1])*(mesh[k+1]-lo)/2
    return rv,total


def verify_min_node(old,new,tau,P,rv,cuts,depth=14):
    """Whole-half-line P>=min(old,new)(tau*v)+G(v²).

    Each rational leaf proves one of the two candidate gap polynomials
    nonnegative. No approximate quadratic roots enter the proof.
    """
    tau=Q(tau);ps=list(map(Q,P));require(tau>0 and ps[1]>=0 and ps[4]>=0,'invalid law node')
    require(rv[0]==0 and len(rv)==len(cuts) and all(a<b for a,b in zip(rv,rv[1:])),'invalid cut mesh')
    knots=sorted(set([r/tau for s in (old,new) for r in s.knots]+rv))
    poly=law_polynomial(ps);leaves=0;degree=0
    def either(p1,p2,lo,hi,dep):
        if min(bernstein(p1,lo,hi))>=0 or min(bernstein(p2,lo,hi))>=0:return 1
        require(all(max(value(p1,x),value(p2,x))>=0 for x in (lo,hi,(lo+hi)/2)),
                'min-source law node has an exact negative witness')
        require(dep>0,'min-source law node not certified')
        mid=(lo+hi)/2
        return either(p1,p2,lo,mid,dep-1)+either(p1,p2,mid,hi,dep-1)
    for k,lo in enumerate(knots):
        hi=knots[k+1] if k+1<len(knots) else None
        ci=bisect_right(rv,lo)-1
        cu=cuts[ci];cv=[Q(0)]*(2*len(cu)-1)
        for j,c in enumerate(cu):cv[2*j]=c
        pp=[]
        for source in (old,new):
            src=affine(source.at(tau*lo),Q(0),tau)
            gap=add(mul(add(poly,scale(src,-1)),[0,0,0,0,1]),scale(cv,-1))
            if ci==0:
                require(all(x==0 for x in gap[:4]),'singular first cut')
                gap=trim(gap[4:])
            degree=max(degree,len(gap)-1);pp.append(gap)
        if hi is None:
            require(any(all(c>=0 for c in affine(gap,lo,Q(1))) for gap in pp),'min-source tail not certified')
            leaves+=1
        else:leaves+=either(*pp,lo,hi,depth)
    return {'intervals':len(knots),'bernstein_leaves':leaves,'max_degree':degree}


def gain_floor(coefficients, tau_interval, x_interval, depth=6):
    """Uniform E q(tau*sqrt(U)) lower bound from inherited moments.

    a1,a6<=0 use upper bounds on E sqrt(U),E U³; U,U² are exact.
    The x-polynomial's cubic coefficient is nonpositive, so its minimum
    on a nonnegative x interval occurs at an endpoint (a stationary point
    in the interior can only be a maximum). Tau is checked by Bernstein.
    """
    a0,a1,a2,a4,a6=map(Q,coefficients)
    require(a1<=0 and a6<=0,'gain lower-moment signs fail')
    ta,tb=map(Q,tau_interval);xa,xb=map(Q,x_interval)
    require(0<=ta<=tb and 0<=xa<=xb<=Q(31,4),'invalid law rectangle')
    pp=[[a0,a1*RHO,a2,Q(0),a4*(2+x*x),Q(0),a6*(6+9*x*x+C6*x**3)] for x in (xa,xb)]
    floor=min(lower_bound(trim(p),ta,tb,depth) for p in pp)
    return floor


def expectation_upper(P,x):
    a0,a1,a2,a4,a6=map(Q,P);x=Q(x)
    require(a1>=0 and a6>=0,'upper moment signs fail')
    return a0+a1*RHO+a2+a4*(2+x*x)+a6*(6+9*x*x+C6*x**3)


def tau_box(a,b,Wa,Wb,D,A):
    """Maximum of endpoint chord-D*tau²+A*(tau-a)*(b-tau)."""
    a,b,Wa,Wb,D,A=map(Q,(a,b,Wa,Wb,D,A))
    require(a<b and A>=0,'invalid tau chord')
    slope=(Wb-Wa)/(b-a)
    poly=[Wa-slope*a-A*a*b,slope+A*(a+b),-(D+A)]
    return qmax(poly,a,b),poly


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def write_json(path,obj):
    Path(path).write_text(json.dumps(obj,indent=2,sort_keys=True)+'\n')


def self_test(out):
    # Exact toy: Psi(r;f)=|r-f|, d=1, c=-1/2, A=1/4.
    # F+A*r²=|r-f|+(f-r/2)² is jointly convex.
    raw={'A':'1/4','nodes':[{'r':'0','G':'0','f':'0'},{'r':'1','G':'0','f':'1'},{'r':'2','G':'2','f':'0'}],
         'tail':{'start':'2','coefficients':['0','1'],'f':'0'}}
    source,hull=lifted_source(raw)
    old=Source([(Q(0),[0,1])])
    # F on [0,1] with f=r is zero; on [1,2] with f=2-r it is 2(r-1)².
    positive(add(source.at(Q(0)),[0]),Q(0),Q(1))
    positive(add(source.at(Q(1)),[-2,4,-2]),Q(1),Q(2))
    require(value(source.at(Q(2)),Q(2))==2,'toy tail join')
    minorant=['0','0','1/8','-1/32','0']
    minorant_result=gain_minorant(old,source,minorant)
    tau_interval=['1/5','21/100'];x_interval=['0','1']
    floor=gain_floor(minorant,tau_interval,x_interval)
    require(floor>Q(48,10000),'toy uniform saving too small')
    tau=Q(1,5)
    oldP=[Q(0),tau,Q(0),Q(0),Q(0)]
    # Source min(old,new) is bounded by old-q. New law P=oldP-q(tau*v).
    q=law_polynomial(minorant)
    newP=[oldP[i]-Q(minorant[i])*tau**[0,1,2,4,6][i] for i in range(5)]
    # Check direct new cap in this toy: the lifted source already<=old.
    direct=verify_node(source,tau,newP)
    box,poly=tau_box(Q(1,5),Q(21,100),Q(1),Q(1),Q(1,2),Q(1,4))
    require(box==Q(49,50),'tau corrected maximum mismatch')
    # A counterexample catches dropping the semiconvex cost.
    no_correction=qmax([1,0,-Q(1,2)],Q(1,5),Q(21,100))
    require(box>=no_correction,'corrected chord must dominate uncorrected')
    # Sharp nonzero interpolation-cost fixture: zero endpoints with A=1
    # attain (b-a)^2/4 strictly inside, whereas an uncorrected chord is zero.
    sharp,unused=tau_box(Q(1,5),Q(21,100),Q(0),Q(0),Q(0),Q(1))
    require(sharp==Q(1,40000),'missing semiconvex interpolation cost')
    result={'status':'PASS_EXACT_TOY_SOURCE_AND_LAW','source':raw,'source_pieces':source.encode(),
            'minorant_coefficients':minorant,'gain_check':minorant_result,
            'tau_interval':tau_interval,'x_interval':x_interval,'gain_floor':str(floor),
            'direct_law_node':direct,'corrected_tau_box_max':str(box),
            'sharp_nonzero_chord_cost':str(sharp),
            'scope':'Synthetic source proven algebraically; compatibility and source input checks are separate.'}
    if out:write_json(out,result)
    return result


def replay_inherited(certdir, names, out):
    """Replay named real spectral nodes with exactly their archived source.

    This verifies compatibility of polynomial arithmetic and whole-half-line
    coverage. It is deliberately restricted to named nodes, not a full cover.
    """
    certdir=Path(certdir);cover=json.loads((certdir/'cover.json').read_text())
    inherited=json.loads((certdir/'inherited.json').read_text())
    results=[]
    for name in names:
        n=cover['newnodes'][name]
        if 'weights' in n:
            weights=[(int(i),Q(w)) for i,w in n['weights']]
        else:
            i,j=n['i'],n['j'];th=Q(n['theta']);wd={i:1-th};wd[j]=wd.get(j,Q(0))+th
            weights=[(i,w) for i,w in wd.items() if w]
        parts=[]
        for i,w in weights:
            row=inherited['rows'][i]
            parts.append((w,source_from_table(row['table'],row['smax'],Q(row['delta']))))
        source=mixture_source(parts)
        rv,pcs=spectral_pieces(n)
        check=verify_node(source,Q(n['tau']),n['P'],rv,pcs)
        results.append({'node':name,'tau':n['tau'],'weights':[[i,str(w)] for i,w in weights],**check})
    result={'status':'PASS_INHERITED_NODES_ONLY','nodes':results,
            'inputs':{x:sha(certdir/x) for x in ('cover.json','inherited.json')},
            'scope':'Replays finite law majorants against inherited source tables; no new source cap or endpoint improvement is asserted.'}
    if out:write_json(out,result)
    return result


def verify_gain_input(path,out):
    doc=json.loads(Path(path).read_text())
    require(doc['format']=='rankone-gain/v1','unknown input format')
    if 'construction' in doc:
        old,new,bank=verify_source_selection(doc)
    else:
        old=Source(doc['old_source_pieces'])
    if 'lifted_source' in doc:
        new,hull=lifted_source(doc['lifted_source'])
    elif 'construction' not in doc:
        new=Source(doc['new_source_pieces'])
    check=gain_minorant(old,new,doc['minorant'])
    floor=gain_floor(doc['minorant'],doc['tau_interval'],doc['x_interval'])
    require(floor>=Q(doc.get('claimed_gain','0')),'claimed gain exceeds checked floor')
    result={'status':'PASS_SIGNED_MINORANT_NO_POSITIVE_MOMENT_GAIN' if floor<=0 else 'PASS_FINITE_GAIN_CONDITIONAL_ON_SOURCE_CAPS','gain_floor':str(floor),
            'input_sha256':sha(path),'source_proof_obligations':doc.get('source_proof_obligations',[]),**check}
    if 'old_box_upper' in doc:
        result['revised_box_upper']=str(Q(doc['old_box_upper'])-floor)
    if out:write_json(out,result)
    return result


def verify_source_selection(doc):
    """Check an explicit selected cap against its exact inherited bank.

    This binds every quadratic to a hashed source bank; it does not replace
    that bank's Gaussian integration premise with an unevaluated Boolean.
    """
    c=doc['construction'];bankpath=Path(c['bank'])
    require(sha(bankpath)==c['bank_sha256'],'anchor bank hash mismatch')
    bank=json.loads(bankpath.read_text())
    require(sha(bank['source_row'])==bank['source_row_sha256'],'anchor source row hash mismatch')
    require(all(sha(r['bundle'])==r['bundle_sha256'] for r in bank['records']),'Gaussian majorant bundle hash mismatch')
    inherited=Path(c['inherited'])
    require(sha(inherited)==c['inherited_sha256'],'inherited source table hash mismatch')
    inh=json.loads(inherited.read_text());row=inh['rows'][doc['row_index']]
    require(Q(bank['delta'])==Q(row['delta']),'source scale mismatch')
    old=source_from_table(row['table'],row['smax'],Q(row['delta']))
    require(old.encode()==doc['old_source_pieces'],'old source differs from inherited table')
    if c.get('kind')=='lifted-node-table':
        tablepath=Path(c['node_table']);require(sha(tablepath)==c['node_table_sha256'],'explicit node table hash mismatch')
        table=json.loads(tablepath.read_text())
        require(Q(table['delta'])==Q(bank['delta']) and Q(table['semiconvex_coefficient'])==Q(bank['semiconvex_coefficient']),'node table geometry mismatch')
        PAD=Q(1,10**11)
        raw={'A':bank['semiconvex_coefficient'],
             'nodes':[{'r':n['r'],'G':str(Q(n['cap'])-PAD),'f':n['scalar_f']} for n in table['nodes']],
             'tail':{'start':table['nodes'][-1]['r'],'coefficients':list(map(str,old.at(Q(table['nodes'][-1]['r'])))),'f':'0'}}
        new,hull=lifted_source(raw)
        require(new.encode()==doc['new_source_pieces'],'lifted source differs from exact node hull')
        return old,new,bank
    new=Source(doc['new_source_pieces']);choices=c['source_piece_bank_record']
    require(len(choices)==len(new.pieces) and choices[0]==choices[-1]==-1,'invalid cap selections or endpoint phases')
    require(set(old.knots)<=set(new.knots),'selected source crosses an unchecked inherited breakpoint')
    for (lo,p),j in zip(new.pieces,choices):
        if j==-1:
            require(p==old.at(lo),'f=0 selection differs from inherited cap')
        else:
            require(0<=j<len(bank['records']),'invalid anchor selection')
            q=list(map(Q,bank['records'][j]['quadratic']))
            require(len(p)==len(q) and all(a>=b for a,b in zip(p,q)),'selected polynomial is below archived global cap')
    return old,new,bank


def node_negative_witness(source,tau,P,rv,cuts):
    """Return an explicit rational counterexample, or None (inconclusive)."""
    knots=sorted(set([r/tau for r in source.knots]+rv))
    points=sorted(set(knots+[(a+b)/2 for a,b in zip(knots,knots[1:])]))
    for v in points:
        ci=bisect_right(rv,v)-1
        if v:G=value(cuts[ci],v*v)/v**4
        else:
            require(cuts[0][0]==cuts[0][1]==0,'singular Stein origin')
            G=cuts[0][2]
        gap=value(law_polynomial(P),v)-value(source.at(tau*v),tau*v)-G
        if gap<0:
            return {'v':str(v),'physical_r':str(tau*v),'gap':str(gap),'gap_display':float(gap)}
    return None


def verify_reused_stein(path,out):
    doc=json.loads(Path(path).read_text())
    require(doc['format']=='rankone-reused-stein/v1','invalid reused-node format')
    selection=Path(doc['source_selection'])
    require(sha(selection)==doc['source_selection_sha256'],'source selection hash mismatch')
    source_doc=json.loads(selection.read_text())
    old,new,bank=verify_source_selection(source_doc)
    inherited=Path(source_doc['construction']['inherited'])
    inh=json.loads(inherited.read_text())
    i,ci,ni=doc['node_ref'];require(i==source_doc['row_index'],'row/node mismatch')
    row=inh['rows'][i];cell=row['cells'][ci];node=cell['nodes'][ni]
    tau=Q(node['tau'])/Q(row['delta']);rv,cuts=stein_pieces(row,cell,node)
    P=list(map(Q,doc['new_P']));gain=None
    if 'gain' in doc:
        gain=Q(doc['gain']);require(gain>0,'reuse gain must be positive')
        direct=list(map(Q,node['P']));direct[0]-=gain
        require(P==direct,'new P differs from exact constant decrement')
    result=verify_min_node(old,new,tau,P,rv,cuts)
    # An exact negative rational point, not Bernstein non-acceptance, proves
    # that the same decrement is invalid with the original source/cuts.
    witness=node_negative_witness(old,tau,P,rv,cuts)
    require(witness is not None,'no exact negative witness against the same old-source decrement was found')
    answer={'status':'PASS_REAL_REUSED_STEIN_NODE_CONDITIONAL_ON_SOURCE_CAPS',
            'row':bank['row'],'node_ref':doc['node_ref'],'tau':str(tau),'tau_display':float(tau),
            'coefficient_context':'mixture-repriced active row' if 'mixture_repricing' in bank else 'pure row',
            'P0_decrement':None if gain is None else str(gain),'new_P':list(map(str,P)),
            'old_source_exact_negative_witness':witness,
            **result,'input_sha256':sha(path),
            'source_pad_ledger':{'external_PAD':'1/100000000000','multiplicity':1,
                'inequality':'actual selected F <= min(raw inherited table, selected raw cap) + PAD; the inherited row evaluator retains this single external PAD. For effective node tables the selected raw cap is the cap for H=F-PAD.'},
            'scope':'Exact local law-node improvement with unchanged old Stein cuts and inherited external PAD retained once. Anchor/source Gaussian bounds and the rank-one reduction remain analytic premises. No tau interpolation or full-cover endpoint is asserted.'}
    if 'x_interval' in doc:
        xa,xb=map(Q,doc['x_interval']);require(0<=xa<=xb<=Q(31,4),'invalid x interval')
        delta=[a-b for a,b in zip(map(Q,node['P']),P)]
        a0,a1,a2,a4,a6=delta
        saving_poly=[a0+a1*RHO+a2+2*a4+6*a6,0,a4+9*a6,C6*a6]
        saving=lower_bound(trim(saving_poly),xa,xb)
        require(saving>0,'new moment upper bound has no checked positive uniform saving')
        answer['x_interval']=list(map(str,[xa,xb]))
        answer['moment_bound_saving_polynomial_in_x']=list(map(str,saving_poly))
        answer['uniform_moment_bound_saving']=str(saving)
    if out:write_json(out,answer)
    return answer


def verify_tau_interval(path,out):
    """Replay two node certificates and the exact endpoint-profile bridge."""
    doc=json.loads(Path(path).read_text())
    require(doc['format']=='rankone-tau-bridge/v1','invalid tau bridge format')
    endpoints=[];banks=[]
    for ref in doc['endpoints']:
        p=Path(ref['path']);require(sha(p)==ref['sha256'],'tau endpoint hash mismatch')
        result=verify_reused_stein(p,None);endpoints.append(result)
        n=json.loads(p.read_text());s=json.loads(Path(n['source_selection']).read_text())
        banks.append(json.loads(Path(s['construction']['bank']).read_text()))
    require(len(endpoints)==2 and banks[0]==banks[1],'tau endpoints must share one pure-row geometry and test vector')
    require(endpoints[0]['x_interval']==endpoints[1]['x_interval'],'tau endpoint x domains differ')
    a,b=map(Q,[e['tau'] for e in endpoints]);require(a<b,'tau nodes out of order')
    sa,sb=map(Q,[e['uniform_moment_bound_saving'] for e in endpoints])
    bank=banks[0];A=Q(bank['c'])**2/Q(bank['d'])
    require(A==Q(bank['semiconvex_coefficient']) and A>=0,'semiconvex coefficient mismatch')
    m=(sb-sa)/(b-a)
    saving_poly=[sa-m*a+A*a*b,m-A*(a+b),A]
    saving=-qmax(scale(saving_poly,-1),a,b)
    require(saving>0 and saving>=Q(doc['claimed_uniform_saving']),'tau interval has insufficient saving')
    answer={'status':'PASS_REAL_TAU_INTERVAL_CONDITIONAL_ON_SOURCE_CAPS',
            'row':bank['row'],'tau_interval':list(map(str,[a,b])),
            'coefficient_context':'mixture-repriced active row' if 'mixture_repricing' in bank else 'pure row',
            'x_interval':endpoints[0]['x_interval'],
            'endpoint_savings':list(map(str,[sa,sb])),
            'semiconvex_coefficient':str(A),
            'maximum_chord_allowance':str(A*(b-a)**2/4),
            'uniform_saving':str(saving),'uniform_saving_display':float(saving),
            'claimed_uniform_saving':doc['claimed_uniform_saving'],
            'input_sha256':sha(path),
            'source_pad_ledger':{'external_PAD':'1/100000000000','multiplicity':1},
            'scope':'Strict improvement of this pure-row interpolated law bound on a closed tau/x rectangle. The endpoint-profile semiconvex theorem supplies the interior tests. Source Gaussian bounds and response reduction remain analytic premises; no entire row cap, mixture box, full cover or global lower endpoint is asserted.'}
    if out:write_json(out,answer)
    return answer


def main():
    require(__debug__,'Do not use -O or -OO')
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--self-test',action='store_true')
    p.add_argument('--inherited-dir',type=Path)
    p.add_argument('--node',action='append')
    p.add_argument('--gain-input',type=Path)
    p.add_argument('--reused-stein',type=Path)
    p.add_argument('--tau-bridge',type=Path)
    p.add_argument('--out',type=Path)
    a=p.parse_args()
    require(sum([a.self_test,a.inherited_dir is not None,a.gain_input is not None,a.reused_stein is not None,a.tau_bridge is not None])==1,'choose exactly one mode')
    if a.self_test:r=self_test(a.out)
    elif a.inherited_dir:r=replay_inherited(a.inherited_dir,a.node or ['b3-232.json'],a.out)
    elif a.gain_input:r=verify_gain_input(a.gain_input,a.out)
    elif a.reused_stein:r=verify_reused_stein(a.reused_stein,a.out)
    else:r=verify_tau_interval(a.tau_bridge,a.out)
    print(json.dumps(r,indent=2,sort_keys=True))


if __name__=='__main__':
    main()
