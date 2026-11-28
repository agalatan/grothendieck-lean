"""Four global linear upper prices for the full physical signed fifth energy.

Run from any directory. All decisions use outward rational arithmetic.
Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from functools import cache
from math import comb, factorial, isqrt, prod
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from one_coordinate_multiplier import pi_interval, require

LAM = Q(".34")
T0, R0 = Q(".83835"), Q(".28898")
CENTER = T0+LAM*R0
M1, M3, MK = Q(".83748"), Q("-.26331"), Q(".13637")
MEAN_BOUND = Q(".93")
PRECISION = 10**21
STEP, END = 256, 8
PLANES = [tuple(map(Q, row.split())) for row in (
    ".05 145.50 -7.25897 .21969 7.05437",
    ".10 76.22 -3.76822 .09709 3.67945",
    ".20 41.57 -2.02130 .03486 1.99514",
    ".40 24.25 -1.14602 .00193 1.16048",
)]


def add(a,b):
    return a[0]+b[0], a[1]+b[1]


def scale(c,a):
    return (c*a[0],c*a[1]) if c>=0 else (c*a[1],c*a[0])


def square(a):
    l,h=a
    return (0 if l<=0<=h else min(l*l,h*h), max(l*l,h*h))


@cache
def sqrt_interval(n):
    k=isqrt(n*PRECISION**2)
    return Q(k,PRECISION),Q(k+1,PRECISION)


def derivatives(x, mu, *, terms=49, precision=PRECISION):
    """Enclose G and its first five derivatives using the beta integral."""
    require(terms > 0 and terms % 2 == 1, "odd Taylor truncation")
    result=[]
    for n in range(6):
        l=h=precision
        low_sum=high_sum=precision
        for k in range(terms):
            num=x.numerator*(2*n+2*k+1)
            den=x.denominator*2*(k+1)*(n+k+2)
            l,h=l*num//den,-(-h*num//den)
            if k%2==0:
                low_sum-=h
                if k<terms-1:
                    high_sum-=l
            else:
                low_sum+=l
                high_sum+=h
        moment=prod((Q(2*j+1,2*(2+j)) for j in range(n)),start=Q(1))
        require(0<=low_sum<=high_sum,"alternating Taylor enclosure")
        result.append(scale((-1)**n*moment,(mu[0]*low_sum/precision,mu[1]*high_sum/precision)))
    return result


def coefficient_bounds(p,q,a,ds):
    interval=(Q(0),Q(0))
    for j in range(min(p,q+1)+1):
        multiplier=comb(p,j)*factorial(q+1)//factorial(q+1-j)
        interval=add(interval,scale(multiplier*a**(p+q+1-2*j),ds[p+q-j]))
    # 1/sqrt(n) = sqrt(n)/n
    n=factorial(p)*factorial(q)
    l,h=sqrt_interval(n)
    endpoints=[u*v/n for u in interval for v in (l,h)]
    return min(endpoints),max(endpoints)

def ordinates(y,mu):
    a=LAM*y
    ds=derivatives(a*a,mu)
    def coefficient(p,q):
        return coefficient_bounds(p,q,a,ds)
    h_upper=sum(square(coefficient(p,q))[1] for p,q in ((0,1),(1,2),(3,0),(3,2)))
    for p,q,center in ((1,0,M1),(2,1,M3)):
        h_upper+=square(add(coefficient(p,q),(-center,-center)))[1]
    k_low=Q(3,2)*(2*MK*scale(-y,coefficient(1,1))[0]-MK**2)
    rice=add(scale(1+a*a,ds[0]),scale(a*a,ds[1]))
    return h_upper,k_low,rice[1]


def main():
    pi_lo,pi_hi=pi_interval()
    mu=Q(".88622692545275"), Q(".88622692545277")
    require(4*mu[0]**2<pi_lo<pi_hi<4*mu[1]**2,"Gaussian radius")
    second=160
    for eta,K,a,b,c in PLANES:
        require(0<eta<1 and K**2>=48*(1+1/eta)**2 and b>=0 and c>=0,"price signs")
        c1,c2=4*LAM,16*LAM**2
        h2=6*(2*c1*c1+4*c2)
        k2=3*MK*(2*c1+END*c2)
        require(2*c+(1+eta)*h2+(1-eta)*k2+K*2*LAM**2<=second,"interpolation error")
        # Bessel gives the six coefficient norm <= 1. Translation by the
        # two centering constants preserves a norm bound of 2.
        require(M1**2+M3**2<=1,"template centers")
        tail_const=(1+eta)*4+(1-eta)*Q(3,2)*MK**2+K*(mu[1]-CENTER)
        tail_slope=(1-eta)*3*MK+K*LAM
        require(a+b*END+c*END**2>=tail_const+tail_slope*END and b+2*c*END>=tail_slope,
                "tail majorant")
    needed=Q(second,8*STEP**2)
    for i in range(STEP*END+1):
        y=Q(i,STEP)
        h,k,rice=ordinates(y,mu)
        for eta,K,a,b,c in PLANES:
            value=(1+eta)*h-(1-eta)*k+K*(rice-CENTER)
            require(a+b*y+c*y*y-value>=needed,f"failed at {y}, eta={eta}")
    for eta,K,a,b,c in PLANES:
        print(f"eta={eta}, full fifth difference <= {a+b*MEAN_BOUND+c} + {K}*(t0-t+.34*(tau0-tau)).")
    a,b,c=PLANES[0][2:]
    require(a+b*MEAN_BOUND+c<Q("-.00028"),"strict negative fifth energy")
    at_287=min(a+b*MEAN_BOUND+c+K*LAM*(R0-Q(".287")) for _,K,a,b,c in PLANES)
    require(at_287<Q(".03259"),"relaxed central bound")
    lam=Q(137,400)
    limit_t2=pi_lo/(4*(1+lam**2))
    require(limit_t2>T0**2 and lam**2*limit_t2>Q(".287")**2,
            "Gaussian lift does not enter the relaxed slice")
    print("At t>=.83835 and tau>=.28898 the full fifth difference is < -.00028.")
    print("At t>=.83835 and tau>=.287 it is < .03259.")


if __name__=="__main__":
    main()
