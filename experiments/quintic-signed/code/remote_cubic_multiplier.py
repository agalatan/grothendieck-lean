"""Enclose the six remote bidegree prices for the physical signed witness. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from pathlib import Path
import sys
from math import isqrt

sys.path.insert(0,str(Path(__file__).resolve().parent))
from one_coordinate_multiplier import ALPHA, BETA, NU, evaluate, pi_interval, price_polynomial, require, tail


def polynomial_box(poly, lo, hi):
    lower = upper = Q(0)
    for coefficient in reversed(poly):
        products = [lower*lo, lower*hi, upper*lo, upper*hi]
        lower = coefficient+min(products)
        upper = coefficient+max(products)
    return max(abs(lower),abs(upper))


def upper_prices(steps=512, gamma=Q(41,100)):
    # Each term is (squared coefficient) times T^angular times polynomial(T)^2.
    shift = Q(-7,20)
    terms = {
        (0,0): [(BETA/2,1,[-2,1]),(NU/12,1,[6,-6,1])],
        (0,1): [(BETA/2,2,[1]),(NU/6,2,[-3,1])],
        (1,0): [(BETA,0,[-1-shift,1]),(NU/4,0,[2,-4,1])],
        (1,1): [(BETA,1,[1]),(NU/2,1,[-2,1])],
        (2,0): [(BETA,1,[1]),(NU/2,1,[-2,1])],
        (2,1): [(gamma,0,[1]),(NU,0,[-1,1])],
    }
    cutoff=6
    polynomials=[price_polynomial(d) for d in (Q(), NU)]
    for p in polynomials:
        require(p[0]>0 and p[2]<=0 and p[1]+2*p[2]*cutoff**2>=0,
                'radial multiplier increases on the checked window')
    require(Q(4431,5000)**2<Q('3.14159')/4,'lower bound on mu')
    # For T>=36 each visible polynomial obeys the displayed simple bound:
    # |T-2|, |T-3|, |T-1-shift|, |T-1| <= T, and
    # |T^2-6T+6|, |T^2-4T+2| <= T^2. Every numerator is <= T^5.
    require(all(sum(a for a,_,_ in row)<1 for row in terms.values()),'tail coefficients')
    scale=10**70
    cash=10**14
    totals={k:0 for k in terms}
    tangent_total=0
    tangent_gamma=Q(21,40)
    def ceil(r):return -(-r.numerator//r.denominator)
    exp_hi=scale
    for j in range(cutoff*steps):
        left=Q(j,steps);right=left+Q(1,steps)
        lo,hi=left**2,right**2
        dt=hi-lo
        denominator=2*NU+Q(4431,5000)*left*min(evaluate(p,lo) for p in polynomials)
        # Integral of e^-t is at most exp(-lo)*(hi-lo).
        price=Q(exp_hi,scale)*dt/denominator
        polys={tuple(p):polynomial_box(p,lo,hi) for row in terms.values() for _,_,p in row}
        for k,row in terms.items():
            cap=sum(a*hi**angular*polys[tuple(p)]**2 for a,angular,p in row)
            totals[k]+=ceil(cash*price*cap)
        angle_inverse=(1/denominator+1/(2*denominator-2*NU))/2
        angular_cost=tangent_gamma+NU*(polys[-1,1]**2+hi**2/2)
        tangent_total+=ceil(cash*Q(exp_hi,scale)*dt*angle_inverse*angular_cost)
        # exp(-dt) <= 1-dt+dt^2/2 by Taylor's theorem.
        exp_hi=ceil(exp_hi*(1-dt+dt*dt/2))
    tail_price=tail(5,cutoff**2)/(2*NU)
    bounds={k:Q(value,cash)+tail_price for k,value in totals.items()}
    bounds[1,0]+=BETA*shift**2/ALPHA
    bounds['tangent']=Q(tangent_total,cash)+tail_price
    return {k:Q(ceil(100000*v),100000) for k,v in bounds.items()}


def main():
    bounds=upper_prices()
    for k,v in bounds.items():
        require(v < 1,'failed remote block '+str(k))
        print(k, v, float(v))
    residual = BETA-Q(41,100)
    require(residual==Q(151,400), 'remote residual price')
    pi_lo,pi_hi=pi_interval();scale=10**30
    low=isqrt((pi_lo.numerator*scale**2)//(4*pi_lo.denominator))
    high=isqrt((pi_hi.numerator*scale**2)//(4*pi_hi.denominator))+1
    mu_lo,mu_hi=Q(low,scale),Q(high,scale)
    require(mu_lo**2<=pi_lo/4<pi_hi/4<=mu_hi**2, 'square root interval')
    for d,cut in [(Q(1,50),Q('.88514816')), (NU,Q('.88495558'))]:
        coef=ALPHA-BETA/8-3*d/64
        def price(mu,pi,t):
            return NU+pi/4*coef+residual*2*mu*(mu-t)
        require(mu_lo>cut and price(mu_hi,pi_hi,cut)+Q(2,10**54)<Q(10000,14023),'Rice high cutoff')
        require(price(mu_lo,pi_lo,cut-Q(1,10**8))>Q(10000,14023),'preceding decimal fails this price')
        print('d =', d, 'all-phase high cutoff',str(cut),float(cut))
    for d,cut in [(Q(1,50),Q('.88468058')), (NU,Q('.88440557'))]:
        coef=ALPHA-BETA/8-3*d/64
        def angle_price(mu,pi,t):
            return NU+pi/4*coef+ALPHA*(mu-t)**2+Q(21,80)*2*mu*(mu-t)
        require(angle_price(mu_hi,pi_hi,cut)+Q(2,10**54)<Q(10000,14023),'tangential high cutoff')
        require(angle_price(mu_lo,pi_lo,cut-Q(1,10**8))>Q(10000,14023),'preceding tangential decimal')
        print('d =', d, 'tangential high cutoff',float(cut))
    print('Every debit in [0,.0235] leaves only the purely remote cubic energy, priced by',residual)


if __name__=='__main__':
    main()
