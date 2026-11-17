"""Replay the high fourth-excess raw content inequality at the peak.

Agent ID: codex-6d92. Refs #509.
Requires python-flint. Run with assertions enabled.
Each successful check uses exact rational or directed interval arithmetic.
"""
from collections import defaultdict
from fractions import Fraction as Q
from functools import lru_cache
from math import comb, prod
import sys

from flint import arb, acb, arb_mat, ctx

if not __debug__:
    raise RuntimeError("Assertions must be enabled")
ctx.prec=192
A, B = arb(699)/1250, arb(179)/1250
PI=arb.pi()
D=arb(1)/3
MOMENT_TOL=arb("1e-32")

assert (A-B/2)**2/2 > D**2
assert A+B < 1 and 1-D**2 > (A+B)**2
assert 16-D**2 > 5*(A+5*B)**2
assert 1-D**2/16 > 8*(A/5+B)**2
assert arb("0.5").exp() < 2 and 3*PI.sqrt()/4 < 2

def enclosure(tail):
    """An Arb ball covering [0, tail]."""
    outer_half = tail.upper()/2
    return arb(outer_half, outer_half)


def terms(kind, count):
    out = {(1, 1): arb(1)} if kind == "D" else {(2, 0): arb(1)}
    for _ in range(count):
        stage = defaultdict(arb)
        for (p, q), value in out.items():
            stage[p+1, q+1] += value
            if p:
                stage[p+2, q+1] += value*p*B
            if q:
                stage[p+1, q+2] += value*3*q*B
        out = stage
    return out


def at_zero(kind, order):
    weights = terms(kind, order)

    def integrand(x, analytic):
        t = x*x
        a, j = A+B*t, A+3*B*t
        return (-t).exp()*sum(v*a**(-p)*j**(1-q) for (p,q),v in weights.items())

    total = sum(acb.integral(integrand, arb(k)/4, arb(k+1)/4,
                              rel_tol=MOMENT_TOL, abs_tol=MOMENT_TOL, eval_limit=100000).real
                for k in range(32))
    cap = sum(v*(3*A**(1-p) if q == 0 else A**(1-p-q)) for (p,q),v in weights.items())
    total += enclosure(cap*arb(-64).exp()/16)
    if kind == "A":
        return total*comb(2*order+2, order+1)/4**(order+1)
    return total*prod(arb(2*i+1)/(2*(i+2)) for i in range(order))

class Trapezoid:
    def __init__(self, scale, stop, angles, order):
        self.h = arb(1)/scale
        self.order = order
        self.x2 = [(j*self.h)**2 for j in range(scale*stop+1)]
        self.angles = [(i, (PI*i/angles).cos()**2)
                       for i in range((angles+1)//2)]
        self.angles = [(1 if i == 0 else 2, c) for i,c in self.angles]
        # The omitted node at pi/2 has cos(theta)=0 and zero integrand.
        self.angle_count = angles
        self.terms = [terms("A", j) for j in range(order+1)]
        self.denominator_base = (A/(3*B)).sqrt()
        self.denominator_scale = 2*B*self.denominator_base**3
        y = (arb(2)/3*arb(stop).log()).exp()
        self.errors = []
        for j,weights in enumerate(self.terms):
            cap = sum(v*(A-B/2)**(-p)*(A-3*B/2)**(-q)
                      for (p,q),v in weights.items())
            radial = 16*cap/((2*PI*D/self.h).exp()-1)
            angular = 16*cap*D.cosh()**(2*j+2)/((2*D*angles).exp()-1)
            tail = (arb(3)/2)*cap*(y+arb(1)/2)*(-2*y).exp()
            self.errors.append((radial+angular+tail)/2)

    @lru_cache(maxsize=None)
    def evaluate(self, r):
        r = ball(r)
        values = [arb(0) for _ in self.terms]
        for theta_weight, c in self.angles:
            shift = r*c
            sums = [arb(0) for _ in self.terms]
            for i,x2 in enumerate(self.x2):
                z = (x2+shift).sqrt()/self.denominator_scale
                t = (2*self.denominator_base*(z.asinh()/3).sinh())**2
                ai = 1/(A+B*t)
                ji = 1/(A+3*B*t)
                ap = [arb(1), ai]
                jp = [arb(1), ji]
                for p in range(2, 3+2*self.order):
                    ap.append(ap[-1]*ai)
                    jp.append(jp[-1]*ji)
                weight = (-t).exp()*(1 if i == 0 else 2)
                for j,weights in enumerate(self.terms):
                    sums[j] += weight*sum(v*ap[p]*jp[q] for (p,q),v in weights.items())
            for j, val in enumerate(sums):
                values[j] += val*theta_weight*c**(j+1)
        return tuple((-1)**(j+1)*s*self.h/(2*self.angle_count)
                     +arb(0, self.errors[j]) for j,s in enumerate(values))


def radial_upper():
    # The radial strip is unchanged. At complex angular height 1/7,
    # 4 sinh(1/7)^2 < 1/9 gives the same safe half-plane for r <= 4.
    angular_strip=arb(1)/7
    assert 4*angular_strip.sinh()**2<arb(1)/9
    rule=Trapezoid(scale=12,stop=64,angles=100,order=1)
    stop=arb(64)
    y=(arb(2)/3*stop.log()).exp()
    errors=[]
    for j,weights in enumerate(rule.terms):
        cap=sum(v*(A-B/2)**(-p)*(A-3*B/2)**(-q)
                for (p,q),v in weights.items())
        radial=16*cap/((2*PI*D/rule.h).exp()-1)
        angular=16*cap*angular_strip.cosh()**(2*j+2)/((2*angular_strip*rule.angle_count).exp()-1)
        tail=arb(3)/2*cap*(y+arb(1)/2)*(-2*y).exp()
        errors.append((radial+angular+tail)/2)
    rule.errors=errors
    target=ball(Q(".17"))
    g08=rule.evaluate(Q(4,5))[0]
    assert -g08*arb(5)/2*ball(Q(-7,5)).exp()<target
    margins=[]
    def cover(a,b,level):
        assert level<20
        upper=rule.evaluate(b)[0]+2*ball(b)*rule.evaluate(a)[1]
        if upper<target:
            margins.append((target-upper).lower())
        else:
            c=(a+b)/2
            cover(a,c,level+1)
            cover(c,b,level+1)
    cover(Q(0),Q(4),0)
    print(len(margins), min(margins))

def ball(x):
    x=Q(x)
    return arb(x.numerator)/x.denominator

PAYOFF_RATES = ('1.19659606','5.42440031','13.75410379','27.27492038','47.74648592','79.53672839')
GAUSS_DEFICIT_RATES=('0.3101346787','3.0745343881','9.7762311115','21.6590300620','40.5019394030','70.5883144254')
GAUSS_RATES = ('.86371218','4.00957199','10.93944405','22.95932274','41.88772117','72.03098301')
RADAU_RATES = ('1.71826851','6.18991022','14.66698046','28.2791023','48.80952901','80.64024084')
N=6
@lru_cache(None)
def moment(kind,j):
    return at_zero(kind,j)

def rule(kind, centers, pinned):
    # The monic polynomial is orthogonal for t^pinned times the kernel measure.
    n=len(centers)
    p=int(pinned)
    m=[moment(kind,j) for j in range(2*n+p)]
    matrix=arb_mat([[m[i+j+p] for j in range(n)] for i in range(n)])
    coefficients=matrix.solve(arb_mat(n,1,[-m[n+i+p] for i in range(n)]))
    def polynomial(x):
        return x**n+sum(coefficients[j,0]*x**j for j in range(n))
    radius=Q(1,100000)
    centers=tuple(map(Q,centers))
    assert centers[0]>radius and all(y-x>2*radius for x,y in zip(centers,centers[1:]))
    rates=[arb(0)] if pinned else []
    for i,x in enumerate(centers):
        lo,hi=x-radius,x+radius
        sign=(-1)**(n-i-1)
        assert sign*polynomial(ball(lo))<0<sign*polynomial(ball(hi))
        # Bisection only tightens the already validated root bracket.
        for _ in range(44):
            mid=(lo+hi)/2
            value=sign*polynomial(ball(mid))
            if value<0:
                lo=mid
            elif value>0:
                hi=mid
            else:
                break
        rates.append(ball(lo).union(ball(hi)))
    weights=[]
    for i,rate in enumerate(rates):
        denom=arb(1)
        cardinal=[arb(1)]
        for j,other in enumerate(rates):
            if j==i:
                continue
            denom*=rate-other
            cardinal=[arb(0)]+cardinal
            for k in range(len(cardinal)-1):
                cardinal[k]-=other*cardinal[k+1]
        weight=sum(c*m[j] for j,c in enumerate(cardinal))/denom
        assert weight>0, weight
        weights.append(weight)
    return tuple(zip(rates,weights))

@lru_cache(None)
def setup():
    return rule('D',PAYOFF_RATES,True),rule('A',GAUSS_RATES,False),rule('A',RADAU_RATES,True)

STOP=arb(16)
STOP_TAIL=(-STOP).exp()
V0=arb.pi().sqrt()*(ball('0.5592')+ball('0.1432')*3/2)
M0=moment('A',0)
D0=moment('D',0)
L=ball('.50514')
SHIFT=ball('.33')
FRACTION=Q(sys.argv[1]) if len(sys.argv)>1 else Q("0.07")
WEIGHT=ball("1.662")
H=ball('2.6857')
D_CAP=ball('1.432')
K=ball('.24')
TOL=arb('1e-13')

def append_tail(v, signed, cap):
    assert cap>0
    upper=cap.upper()
    return v+arb(0 if signed else upper/2,upper if signed else upper/2)

def expectation(f,start,stop):
    # Polynomial-exponential integrands are entire in t at fixed real w.
    v=acb.integral(f,arb(start),arb(stop),rel_tol=TOL,abs_tol=TOL,eval_limit=60000).real
    assert v.is_finite()
    return v

@lru_cache(None)
def wick(w):
    w=ball(w)
    vrule,grule_lo,grule_hi=setup()
    # f(x)=(1-exp(-x*r))/x is a Laplace transform, interpreted as r at x=0.
    # Gauss–Radau error for an odd derivative gives the upper payoff.
    def payoff_integrand(t,_):
        x=w*t*(t-2)**2/2
        return (-t).exp()*(vrule[0][1]*x+sum(weight*(1-(-rate*x).exp())/rate for rate,weight in vrule[1:]))
    # Integral of e^-t t(t-2)^2/2 over t>=16.
    m1=STOP+1
    m2=STOP**2+2*STOP+2
    m3=STOP**3+3*STOP**2+6*STOP+6
    tail=D0*w*STOP_TAIL*(m3-4*m2+4*m1)/2
    payoff=V0+append_tail(expectation(payoff_integrand,0,16),False,tail)

    def content_part(rule,left,right):
        # Use weights summing to M0 to form h=g-g(0) without cancellation.
        def integrand(t,_):
            x=w*t*(t-2)**2/2
            return (-t).exp()*t*(t-2)*sum(weight*(1-(-rate*x).exp()) for rate,weight in rule)
        return expectation(integrand,left,right)

    # Positive/negative integrals are monotone separately in w. Return
    # the signed parts for both Gaussian quadratures, and the positive tail.
    # Left Radau for exp(-lambda*x) is an upper rule, hence a lower rule for h.
    pos_lower=content_part(grule_hi,2,16)
    pos_upper=append_tail(content_part(grule_lo,2,16),False,M0*STOP_TAIL*STOP**2)
    neg_lower=-content_part(grule_hi,0,2)
    neg_upper=-content_part(grule_lo,0,2)
    return payoff,pos_lower,pos_upper,neg_lower,neg_upper

def check():
    assert 0<M0 and 0<D0<D_CAP
    assert 2*(M0*moment("A",1)).sqrt()<H
    assert M0-SHIFT<L and ball(".17")+SHIFT<L
    assert N==len(PAYOFF_RATES)==len(GAUSS_RATES)==len(RADAU_RATES)
    assert 15*arb.pi().sqrt()/16<WEIGHT
    assert moment("A",1)*arb(57).sqrt()<ball("16.31")
    assert 3+arb(32)/27*arb(-1).exp()<arb(7)/2
    assert 0 <= FRACTION <= Q(1,10)
    assert all(x for x in setup())
    rule_b=rule('D',GAUSS_DEFICIT_RATES,False)
    high_b=ball(Q(463,10000))
    derivative=sum(weight/(1+rate*high_b)**2 for rate,weight in rule_b).lower()
    def benchmark(w):
        return V0+w*sum(weight/(1+rate*w) for rate,weight in rule_b)
    low,high=Q(551,100000)*(1-FRACTION),Q(463,10000)
    # The Gaussian lower payoff minus the Wick upper payoff is increasing.
    payoff_rule=setup()[0]
    def payoff_derivative(t,_):
        W=t*(t-2)**2/2
        return (-t).exp()*W*sum(weight*(-rate*ball(low)*W).exp() for rate,weight in payoff_rule)
    m1=STOP+1
    m2=STOP**2+2*STOP+2
    m3=STOP**3+3*STOP**2+6*STOP+6
    tail=D0*STOP_TAIL*(m3-4*m2+4*m1)/2
    fprime=append_tail(expectation(payoff_derivative,0,16),False,tail)
    assert fprime<derivative,(fprime,derivative)
    step=Q(1,10000)
    min_strong=arb(1)
    cells=0
    a=low
    while a<high:
        b=min(a+step,high)
        fu,pl,_,nl,_=wick(a)
        _,_,pu,_,nu=wick(b)
        ca=(ball(b)/2).sqrt()*max((pu-nl).upper(),(nu-pl).upper())
        e=ball(min(b*FRACTION/(1-FRACTION),high-a))
        linearized=(ball("16.31")*ball(b)+(H/2)*(44*e).sqrt())**2
        projection_cost=min(L**2,arb(linearized.upper()))
        local_u=ball(min(high,b/(1-FRACTION)))
        local_derivative=sum(weight/(1+rate*local_u)**2 for rate,weight in rule_b).lower()
        strong_cost=projection_cost+WEIGHT*H*ca+K*(D_CAP-local_derivative)
        strong=K*(benchmark(ball(a))-fu)-ca**2-strong_cost*e
        if strong.lower()<min_strong:
            minimum_w=a
            min_strong=strong.lower()
        cells+=1
        a=b
    assert min_strong>0,(min_strong,minimum_w)
    print('High-excess content proof, chi >=',42-24*FRACTION,',',cells, 'subintervals')
    print('High-excess strong margin >=',min_strong)
    print('Bprime lower bound',derivative)

if __name__=='__main__':
    radial_upper()
    check()
