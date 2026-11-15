"""Global peak-row A/B kernel comparison, with an exact covering argument.

Agent-ID: codex-a7c4. Refs #400. Python -I; optional --dependency-dir DIR.
Angular formulas/quadrature adapted from the first audit's claims_kernels.py.
No stored numerical inputs are used. The continuum bridge uses the complete
monotonicity proved in CONTENT_KERNELS.md; see ALIGNMENT.md for the proof.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import sys

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')
sys.dont_write_bytecode = True
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--dependency-dir', type=Path)
parser.add_argument('--write-result', action='store_true')
args = parser.parse_args()
if args.dependency_dir:
    sys.path.insert(0, str(args.dependency_dir.resolve(strict=True)))
from flint import arb, acb, ctx
ctx.prec = 100

def ball(q):
    q = Q(q)
    return arb(q.numerator) / q.denominator

aq, bq, rhoq = Q(699,1250), Q(179,1250), Q(5053,10000)
a, b, rho = map(ball, (aq,bq,rhoq))
sqrt2 = arb(2).sqrt()

def integral(f, lo, hi):
    z = acb.integral(f, lo, hi, abs_tol=arb('1e-10'),
                     rel_tol=arb('1e-10'), eval_limit=100000, depth_limit=45)
    assert z.is_finite() and z.imag.contains(0), z
    return z.real

j0 = arb.pi()*(a/b).exp()*(a/b).sqrt().erfc()/(2*(a*b).sqrt())
j2 = (arb.pi().sqrt()/2-a*j0)/b
A0, B0 = j0-j2, j2/sqrt2
assert 0 < A0 < 1 and 0 < B0 < 1

# Positive recurrence for (−d/ds)^2 f_A and (−d/ds) f_B, s=t(a+bt)^2.
def step(terms):
    out = {}
    for (p,q), c in terms.items():
        for pair, coeff in [((p+1,q+1),c), ((p+2,q+1),c*p*bq),
                            ((p+1,q+2),c*3*q*bq)]:
            out[pair] = out.get(pair,Q(0)) + coeff
    return {pq:c for pq,c in out.items() if c}

def moment(terms, factor):
    def f(r, analytic):
        t=r*r; aa=a+b*t; bb=a+3*b*t
        return 2*(-t).exp()*sum(ball(c)*aa**(-p)*bb**(1-q)
                                for (p,q),c in terms.items())
    val = integral(f,0,10)
    # For t>=100, each denominator increases; q>=1 in these recurrences.
    at100 = sum(ball(c)*(a+100*b)**(-p)*(a+300*b)**(1-q)
                for (p,q),c in terms.items())
    tail = at100*arb(-100).exp()/10
    return factor*(val+arb(tail/2,tail/2))

M2A = moment(step(step({(2,0):Q(1)})), ball(Q(5,32)))
M2B = moment(step({(3,1):Q(1)}), ball(Q(5,32))/sqrt2)
assert M2A > 0 and M2B > 0
M2 = rho*M2A+M2B

cache = {Q(0):B0-rho*A0}
def value(vq, individual=False):
    if not individual and vq in cache:
        return cache[vq]
    x=ball(vq).sqrt()
    lo,hi=Q(0),Q(10)
    for _ in range(48):
        mid=(lo+hi)/2
        if mid*mid*(aq+bq*mid*mid)**2>vq: hi=mid
        else: lo=mid
    def integrate_sector(which):
        def f(r, analytic, outer=False):
            R=r*(a+b*r*r)
            z=(x/R)**2 if outer else (R/x)**2
            if analytic and not z.real<1: return acb('nan')
            if outer:
                ga=z.hypgeom_2f1(ball(Q(1,2)),ball(Q(1,2)),2)/(2*R)
                gb=-z.hypgeom_2f1(ball(Q(-1,2)),ball(Q(3,2)),2)/(2*R)
            else:
                ga=z.hypgeom_2f1(ball(Q(-1,2)),ball(Q(1,2)),1)/x
                gb=-z*z.hypgeom_2f1(ball(Q(1,2)),ball(Q(3,2)),3)/(8*x)
            wa=(r*r-1)*ga; wb=r*r*gb/sqrt2
            term=rho*wa-wb if which=='R' else (-wa if which=='A' else -wb)
            return 2*r*(-r*r).exp()*term
        val=integral(f,0,ball(lo))+integral(lambda r,analytic:f(r,analytic,True),ball(hi),10)
        # |angular phase coefficients|<=1; omitted root interval and t>=100.
        rmax=ball(hi)
        weight=(rho*(rmax*rmax+1)+rmax*rmax/sqrt2 if which=='R'
                else (rmax*rmax+1 if which=='A' else rmax*rmax/sqrt2))
        tailweight=rho*102+101/sqrt2 if which=='R' else (102 if which=='A' else 101/sqrt2)
        error=ball(hi-lo)*2*rmax*weight/x+tailweight*arb(-100).exp()/x
        return val+arb(0,error.abs_upper())
    if individual:
        return integrate_sector('A'),integrate_sector('B')
    cache[vq]=integrate_sector('R')
    return cache[vq]

limit=ball(Q(7,1000))
tail_start=Q(16)
At,Bt=value(tail_start,True)
assert At>0 and Bt>0 and rho*At<limit and Bt<limit
# A,B are nonnegative decreasing: B−rho*A lies in [−rho*A(16),B(16)] thereafter.

pending=[(Q(0),tail_start)]
accepted=[]
while pending:
    lo,hi=pending.pop()
    vl,vh=value(lo),value(hi)
    curvature=M2
    if lo>0:
        # max_{lambda>=0} lambda^2 exp(−lambda*lo)=4 exp(−2)/lo^2.
        cm=4*arb(-2).exp()*(rho*A0+B0)/ball(lo)**2
        if cm.abs_upper()<curvature.abs_upper(): curvature=cm
    error=curvature*ball(hi-lo)**2/8
    upper=max(abs(vl).abs_upper(),abs(vh).abs_upper())+error.abs_upper()
    if upper<limit:
        accepted.append((lo,hi,str(upper),str(error)))
    else:
        assert hi-lo>Q(1,2**18), (lo,hi,vl,vh,error)
        mid=(lo+hi)/2
        pending.extend([(lo,mid),(mid,hi)])
accepted.sort()
assert accepted[0][0]==0 and accepted[-1][1]==tail_start
assert all(x[1]==y[0] for x,y in zip(accepted,accepted[1:]))
result={'agent_id':'codex-a7c4','status':'PASS','scope':'all real v>=0; peak row only',
        'rho':'5053/10000','bound':'7/1000','precision_bits':ctx.prec,
        'A0':str(A0),'B0':str(B0),'M2A':str(M2A),'M2B':str(M2B),
        'tail_start':str(tail_start),'tail_A':str(At),'tail_B':str(Bt),
        'evaluated_nodes':len(cache),'certified_cells':len(accepted),
        'node_enclosures':{str(k):str(v) for k,v in sorted(cache.items())},
        'cells':[{'lo':str(lo),'hi':str(hi),'abs_upper':upper,'interpolation_error':error}
                 for lo,hi,upper,error in accepted]}
if args.write_result:
    Path(__file__).with_name('kernel_alignment_result.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps(result,indent=2))
