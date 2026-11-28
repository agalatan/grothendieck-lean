"""Enclose the tilted radial prices in all fresh Hermite sectors. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import ceil
from one_coordinate_multiplier import ALPHA, BETA, NU, evaluate, pi_interval, require, tail
from remote_cubic_multiplier import polynomial_box


def check_prices(s,u,d,gamma,*,uniform=False):
    """Uniform mode checks every effective debit in [0,d] by affine interpolation."""
    debits = (0,d) if uniform else (d,)
    ps = [[ALPHA-s-BETA*u/2-3*x/8,BETA*u/4+3*x/8,-x/16] for x in debits]
    scale,cash,steps = 10**70,10**14,512
    shift = Q(-7,20)
    terms = {
        "00":[(BETA/2,1,[-2,1]),(d/12,1,[6,-6,1])],
        "01":[(BETA/2,2,[1]),(d/6,2,[-3,1])],
        "10":[(BETA,0,[-1-shift,1]),(d/4,0,[2,-4,1])],
        "11 or 20":[(BETA,1,[1]),(d/2,1,[-2,1])]}
    require(all(p[0]>0 and p[2]<=0 and p[1]+72*p[2]>=0 for p in ps),"window monotonicity")
    require(all(min(evaluate(p,0),evaluate(p,140))>0 for p in ps),"positive before tail")
    require(max(sum(map(abs,p)) for p in ps)<1 and 4*tail(3,140)<Q(1,10**52),"phase sign tail")
    require(all(sum(x[0] for x in row)<1 for row in terms.values()) and gamma+3*d/2<1,"tail prices")
    mu_lo = Q(".886226925452757")
    require(4*mu_lo**2<pi_interval()[0],"mean rounded upward")
    totals = {k:0 for k in terms}
    tangent,exp = 0,scale
    for j in range(6*steps):
        left,right = Q(j,steps),Q(j+1,steps)
        lo,hi = left**2,right**2
        dt = hi-lo
        den = 2*NU+mu_lo*left*min(evaluate(p,lo) for p in ps)
        mass = Q(exp,scale)*dt
        for key,row in terms.items():
            numer = sum(a*hi**n*polynomial_box(poly,lo,hi)**2 for a,n,poly in row)
            totals[key] += ceil(cash*mass*numer/den)
        cost = gamma+d*(max(abs(lo-1),abs(hi-1))**2+hi**2/2)
        tangent += ceil(cash*mass*cost*(1/den+1/(2*den-2*NU))/2)
        exp = ceil(exp*(1-dt+dt*dt/2))
    tail_price = tail(5,36)/(2*NU)
    bounds = {k:Q(v,cash)+tail_price for k,v in totals.items()}
    bounds["10"] += BETA*shift**2/ALPHA
    bounds["21 and 12"] = Q(tangent,cash)+tail_price
    require(max(bounds.values())<1 and d<=NU,"whole-block price")
    return {k:Q(ceil(100000*v),100000) for k,v in bounds.items()}
