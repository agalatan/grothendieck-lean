#!/usr/bin/env python3
"""codex-6e2b: exact global acceptance of new spectral-cut dual candidates.

The archive's already certified profile-caps.json is an explicit dependency.
This program rechecks the entire half-line polynomial inequality and freshly
integrates the Gaussian benchmark. It does not trust optimizer objectives.
Requires python-flint. A finite collection of fixed-energy/kurtosis nodes
is not a full parameter cover.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import sys
import time
from flint import arb,acb,ctx

ROOT=Path(__file__).resolve().parent
ARCHIVE=ROOT.parents[2]/'research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original'
sys.path.insert(0,str(ARCHIVE))
from check_stein import check_node,load_caps
from exact import test_pieces,cut_numerator,add,shift,scale,positive,tail_positive
from bisect import bisect_right
import importlib.util
ctx.prec=120

def ar(x):
    x=Q(x);return arb(x.numerator)/x.denominator


def gaussian_B(u):
    a,b,v=ar(Q(699,1250)),ar(Q(179,1250)),ar(u)
    def integrand(t,_):
        A=a+b*t;B=a+3*b*t;x=t*A*A/v
        h=2*t*A/B;dh=2*(a*a+2*a*b*t+3*b*b*t*t)/(B*B)
        return (-t).exp()*(1+2*x+h-dh)*(x/2).bessel_i(0,scaled=True)
    value=acb(0)
    for j in range(256):
        value+=acb.integral(integrand,ar(Q(j,4)),ar(Q(j+1,4)),
                            rel_tol=arb('1e-20'),abs_tol=arb('1e-20'),eval_limit=100000)
    T=arb(64);x=T*(a+b*T)**2/v;h=2*T*(a+b*T)/(a+3*b*T)
    value=value.real*(arb.pi()*v).sqrt()
    value+=(arb.pi()*v).sqrt()*(-T).exp()*h*acb(x/2).bessel_i(0,scaled=True).real
    tail=(-T).exp()*(2*a*(T+1)+2*b*(T*T+2*T+2)+(arb.pi()*v).sqrt())
    result=value+arb(tail/2,tail/2)
    assert result.is_finite()
    return result


def extended_caps():
    spec=importlib.util.spec_from_file_location('deficit_dual_profile_caps',ROOT/'deficit_dual_profile_caps.py')
    module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
    extra=module.generate()
    caps=load_caps()[:-1]
    for c in extra['cells']:
        caps.append((Q(c['interval'][0]),Q(c['interval'][1]),list(map(Q,c['coefficients']))))
    caps.append((caps[-1][1],None,list(map(Q,extra['tail']))))
    assert caps[0][0]==0 and all(l[1]==r[0] for l,r in zip(caps,caps[1:]))
    return caps


def check_node_long(row,caps,depth=20):
    v=Q(row['v']);knots=list(map(Q,row['knots']));values=list(map(Q,row['phi']))
    beta,t,lam,mu,nu=(Q(row[k]) for k in ['beta','t','lam','mu','nu'])
    assert lam>0 and mu>0 and nu>=0 and knots[0]==0
    assert len(knots)==len(values) and all(l<r for l,r in zip(knots,knots[1:]))
    P=list(map(Q,row['coefficients']));assert len(P)==4 and P[3]>=0
    pieces=test_pieces(knots,values);starts=[c[0]/v for c in caps]
    tail=Q(128)
    while tail<=max(knots[-1],starts[-1]):tail*=2
    pts=sorted(set(knots+starts+[tail]))
    for l,r in zip(pts,pts[1:]):
        j=bisect_right(knots,l)-1;k=bisect_right(starts,l)-1
        _,_,A,B,e=pieces[j]
        cap=[c*v**i for i,c in enumerate(caps[k][2])]
        R=add(shift(add(P,scale(cap,-1)),2),scale(cut_numerator(A,B,e,beta,t,lam,mu,nu),-1))
        if l==0:
            assert R[0]==R[1]==0;R=R[2:]
        if not positive(R,l,r,depth):return False,('finite',str(l),str(r))
    _,_,A,B,e=pieces[-1];cap=[c*v**i for i,c in enumerate(caps[-1][2])]
    R=add(shift(add(P,scale(cap,-1)),2),scale(cut_numerator(A,B,e,beta,t,lam,mu,nu),-1))
    return tail_positive(R,tail),('tail',str(tail))


def decimal(x):return str(Q(format(float(x),'.17f')))


def convert(candidate,slack):
    assert not candidate.get('psd'), 'PSD duals require the extended polynomial checker'
    u=Q(str(candidate['u']));u2=float(u*u)
    # These floating values merely propose rational coefficients. Their
    # complete half-line inequality is accepted using exact arithmetic.
    import math
    a,b=699/1250,179/1250
    h0=math.sqrt(math.pi)*(a+1.5*b)
    I0=math.pi/math.sqrt(a*b)*math.exp(a/b)*math.erfc(math.sqrt(a/b))
    P=[u2*x for x in candidate['P_scaled']]
    P[0]+=h0+float(slack);P[1]+=I0*float(u)
    row={'v':str(u),'knots':[str(Q(str(x))) for x in candidate['knots']],
         'phi':[decimal(u2*x) for x in candidate['phi_scaled']],
         'coefficients':[decimal(x) for x in P]}
    for name in ['beta','t','lam','mu','nu']:
        row[name]=decimal(u2*candidate[name+'_scaled'])
    return row


def certify(candidate,caps,B):
    accepted=None
    for slack in [Q(1,10**8),Q(3,10**8),Q(1,10**7),Q(3,10**7),Q(1,10**6),Q(3,10**6),Q(1,10**5)]:
        row=convert(candidate,slack)
        ok,detail=check_node_long(row,caps,depth=20)
        if ok:accepted=row;break
    assert accepted is not None,('polynomial acceptance failed',candidate['chi'],detail)
    u,chi=Q(row['v']),Q(str(candidate['chi']))
    assert 0<u<=Q(463,10000) and 0<chi<=42
    P=list(map(Q,row['coefficients']))
    assert P[3]>=0
    chiA=ar(chi)
    moment3=6+9*chiA+ar(Q(4045313,100000))*chiA*chiA.sqrt()
    Fbound=ar(P[0]+P[1]+P[2]*(2+chi))+ar(P[3])*moment3
    delta=ar(chi*u*u)
    contents=[ar(Q(2,25))*delta,3*delta*delta.sqrt(),ar(Q(1,2500)),ar(Q(19321,10**6))*ar(u)]
    if u>=Q(9,1000):contents.append(ar(Q(11,192))*delta)
    if u>=Q(2,100):contents.append(ar(Q(539,10800))*delta)
    if u>=Q(3,100):contents.append(ar(Q(1077659,27000000))*delta)
    if u>=Q(4,100):contents.append(ar(Q(17,500))*delta)
    if u>=Q(44,1000):contents.append(ar(Q(13,400))*delta)
    G=min(x.upper() for x in contents)
    D=B-Fbound
    target=ar(Q(3,10))*D+ar(Q(6,10**6))
    passed=bool(G<target)
    result={'u':str(u),'chi':str(chi),'polynomial_global_halfline':True,
            'profile_caps_dependency':'archived previously certified profile-caps.json',
            'P0_inflation':str(slack),'B':str(B),'F_upper':str(Fbound),
            'D_lower':str(D),'content_upper':str(G),'target_margin':str(target-G),
            'passes_content_deficit_node':passed,'witness':accepted}
    print(json.dumps({k:v for k,v in result.items() if k!='witness'}),flush=True)
    return result


def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--input',default='deficit_dual_candidates.json')
    parser.add_argument('--chi',type=float,nargs='+',default=[.1,.3,1.])
    parser.add_argument('--output',default='deficit_dual_certified_nodes.json')
    args=parser.parse_args()
    assert Path(args.input).name==args.input and args.input.startswith('deficit_dual')
    candidates=json.loads((ROOT/args.input).read_text())['results']
    caps=extended_caps() if any(c.get('extended_profile') for c in candidates) else load_caps()
    start=time.time();benchmarks={};results=[]
    for candidate in candidates:
        if candidate['chi'] not in args.chi:continue
        u=Q(str(candidate['u']))
        if u not in benchmarks:benchmarks[u]=gaussian_B(u)
        results.append(certify(candidate,caps,benchmarks[u]))
    assert results and all(r['passes_content_deficit_node'] for r in results)
    assert args.output.startswith('deficit_dual') and Path(args.output).name==args.output
    (ROOT/args.output).write_text(json.dumps({
        'Agent-ID':'codex-6e2b','status':'C nodes conditional on archived certified profile caps',
        'results':results},indent=2)+'\n')
    print('PASS fixed-node global dual certificates; no full parameter cover claimed. Seconds:',time.time()-start,flush=True)


if __name__=='__main__':main()
