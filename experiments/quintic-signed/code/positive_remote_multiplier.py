"""Rational positive-fifth radial prices, including the original pure witness. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from math import prod, isqrt
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from one_coordinate_multiplier import add, multiply, evaluate, pi_interval, require


def laguerre(n, shape):
    previous, current = [Q(1)], [-shape,Q(1)]
    if n==0:
        return previous
    for j in range(1,n):
        previous,current=current,add(multiply([-(2*j+shape),1],current),previous,-j*(j+shape-1))
    return current


def radial_majorant(numerator, c, b):
    """Bound E[N(T)/(mu sqrt(T)(c+bT))], T exponential."""
    x=-c/b
    # Force N+gamma*J to vanish at x; J is nonnegative on the integration interval.
    positive = evaluate(numerator,x)>=0
    poly=laguerre(4,Q(3,2) if positive else Q(1,2))
    J=multiply([0,1] if positive else [1],multiply(poly,poly))
    gamma=-evaluate(numerator,x)/evaluate(J,x)
    require(gamma>=0,'polynomial remainder sign')
    dividend=add(numerator,J,gamma)
    quotient=[]
    for a in reversed(dividend):
        quotient.append((a-(c*quotient[-1] if quotient else 0))/b)
    require(quotient.pop()==0,'exact division')
    quotient=quotient[::-1]
    require(multiply([c,b],quotient)==dividend,'polynomial identity')
    def moment(j):return 2*prod((Q(2*k+1,2) for k in range(j)),start=Q(1))
    return sum(a*moment(j) for j,a in enumerate(quotient))


def square(p):return multiply(p,p)


def scaled(a,p):return [a*x for x in p]


def price(e,nu,s,bonus,ordinary_cut,angular_cut,one_coordinate_kg):
    pi_lo,pi_hi=pi_interval()
    scale=10**30
    mu_lo=Q(isqrt((pi_lo.numerator*scale**2)//(4*pi_lo.denominator)),scale)
    mu_hi=Q(isqrt((pi_hi.numerator*scale**2)//(4*pi_hi.denominator))+1,scale)
    require(mu_lo**2<=pi_lo/4<pi_hi/4<=mu_hi**2,'Gaussian mean bracket')
    alpha,beta=1-nu,e+nu
    c0=alpha-beta/2+3*s/8;linear=beta/4-3*s/8;c=c0+bonus
    require(c0>=Q(9,16) and linear>0 and s>0,'positive signed-phase price')
    # For every r>=0: r*(s*r^4/16-bonus)+2nu/mu >= 0 by minimizing the fifth power.
    require(5**5*(2*nu/mu_hi)**4*(s/16)>=4**4*bonus**5,'linear denominator bonus for W')
    require(0<2*s/c0<1,'pure fifth form is paid off the visible line')
    # E_{Gamma(3/2)}[(T^2-6T+21/4)^2]/12 = 3/4.
    raw=square([Q(21,4),-6,1]); perpendicular_moment=sum(a*prod((Q(2*k+3,2) for k in range(j)),start=Q(1)) for j,a in enumerate(raw))/12
    require(perpendicular_moment==Q(3,4) and s*perpendicular_moment/c0<1,'second visible positive mode')
    sh=Q(-2,5); sf=Q(-1,25)
    # Q=T-1 and F=(T^2-4T+2)/2 in the fresh (1,0) block.
    shifted=add([-1-sh,1],[1,-2,Q(1,2)],-sf)
    numerators=[scaled(Q(1,2),multiply([0,1],square([-2,1]))),[0,0,Q(1,2)],square(shifted),[0,1]]
    rows=[beta*radial_majorant(p,c,linear)+(beta*(sh**2/alpha+sf**2/s) if j==2 else 0) for j,p in enumerate(numerators)]
    require(max(rows)<1,'all good fresh bidegrees')
    kappa=1-2*s/c0
    ordinary=radial_majorant([1],c,linear)
    angular=(ordinary+radial_majorant([1],c0,linear)/(1+kappa))/2
    eta,eta2=beta-1/ordinary,beta-1/angular
    require(0<eta2<eta,'cost of the uncovered pure remote cubic')
    coefficient=alpha-beta/8+3*s/64
    B_hi=nu+(pi_hi/4)*coefficient; B_lo=nu+(pi_lo/4)*coefficient
    require(e*Q(93,100)**2<B_lo,'the certified negative diagonal lies under B')
    overlap={Q('.78'):Q('.99869821'),Q('.784'):Q('.99956676'),Q('.804'):Q('.99914232')}[e]
    target=Q(10000,14023)
    require(B_hi**2+e*(1-overlap**2)<target**2,'overlap cap for arbitrary pairs')
    require(B_lo**2+e*(1-(overlap-Q(1,10**8))**2)>target**2,'preceding overlap value fails')
    require(B_hi*one_coordinate_kg<1,'exact reciprocal lower decimal')
    target=Q(10000,14023)
    def arm(t,angular,upper):
        mu = mu_hi if upper else mu_lo
        B = B_hi if upper else B_lo
        return B+2*mu*(mu-t)*(eta2 if angular else eta)+(alpha*(mu-t)**2 if angular else 0)
    for cut,is_angular in [(ordinary_cut,False),(angular_cut,True)]:
        require(mu_lo>cut and arm(cut,is_angular,True)<target,'stated cutoff passes')
        require(arm(cut-Q(1,10**8),is_angular,False)>target,'previous decimal fails the same scalar rule')
    print('e,nu,s =',e,nu,s,'one-coordinate reciprocal >',one_coordinate_kg,'high cuts',float(ordinary_cut),float(angular_cut))
    print('  good-block charges <', ' '.join(str(Q(-(-z.numerator*10**5//z.denominator),10**5)) for z in rows),
          'remote prices',float(eta),float(eta2))


def main():
    price(Q(39,50),Q(),Q(779,10000),Q(),Q('.88434007'),Q('.88379261'),Q('1.40510660404579'))
    price(Q('.784'),Q('.0235'),Q('.04'),Q('.047'),Q('.88563226'),Q('.88547304'),Q('1.40323737893542'))
    price(Q('.804'),Q('.0235'),Q('.08'),Q('.054'),Q('.88505990'),Q('.88481150'),Q('1.40420461267805'))


if __name__=='__main__':main()
