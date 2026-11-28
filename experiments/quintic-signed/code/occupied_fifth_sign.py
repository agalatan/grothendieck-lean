"""A strict upper bound for the full signed fifth energy on an occupied central slice.

Run with python3 -IB -O from the repository root. Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from functools import cache
from math import comb, factorial
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from full_fifth_planes import add, derivatives, scale, square, sqrt_interval
from gaussian_quadrature_rice import MU_LO, MU_UP, C6, majorant, polynomial
from one_coordinate_multiplier import pi_interval, require

ETA, PRICE, MK = Q(".012"), Q(585), Q(".1285")
MU = (MU_LO, MU_UP)
FITS = [(p,q,Q(a),Q(b)) for p,q,a,b in (
    (1,0,"-.04401",".88243"), (2,1,".04178","-.30708"),
    (0,1,"-.02201","0"), (1,2,".02089","0"), (3,0,".01206","0"),
)]
SHAPE_COST = 5 * sum((Q(3,2) if p==q+1 else 3) * a*a for p,q,a,b in FITS)
STEP, END = 512, 8


def shape_cut(lam,center):
    todo = [(Q(".002"), Q(42))]
    boxes = 0
    while todo:
        l,h = todo.pop()
        m = (l+h)/2
        poly = polynomial(lam,m)
        if MU_UP*max(majorant(poly,l),majorant(poly,h)) < center:
            boxes += 1
        else:
            require(h-l>Q(1,10**9),"claimed shape restriction fails")
            todo.extend([(l,m),(m,h)])
    return boxes


@cache
def gap(lam,center,poly,y):
    a = lam*y
    ds = derivatives(a*a,MU)
    def coefficient(p,q):
        out = Q(0),Q(0)
        for j in range(min(p,q+1)+1):
            f = comb(p,j)*factorial(q+1)//factorial(q+1-j)
            out = add(out,scale(f*a**(p+q+1-2*j),ds[p+q-j]))
        n = factorial(p)*factorial(q)
        values = [u*v/n for u in out for v in sqrt_interval(n)]
        return min(values),max(values)
    e = sum(square(add(coefficient(p,q),(-s*y*y-b,)*2))[1] for p,q,s,b in FITS)
    h = square(coefficient(3,2))[1] + Q(5,4)*e
    k = Q(3,2)*(2*MK*scale(-y,coefficient(1,1))[0]-MK**2)
    rice = add(scale(1+a*a,ds[0]),scale(a*a,ds[1]))[1]
    price = sum(coef*y**(2*j) for j,coef in enumerate(poly))
    return price-(1+ETA)*h+(1-ETA)*k-PRICE*(rice-center)


def gap_curvature(lam,poly,hi):
    first,second = 4*lam,16*lam**2
    base = 2*(first**2+second)
    for _,_,a,b in FITS:
        base += Q(5,2)*((first+2*abs(a)*hi)**2
                        +(1+abs(b)+abs(a)*hi**2)*(second+2*abs(a)))
    # Only an upper second derivative is needed. The Rice term is subtracted and convex.
    return (2*poly[1]+30*poly[3]*hi**4+(1+ETA)*base
            +(1-ETA)*3*MK*(2*first+hi*second))


def tail(lam,center,poly):
    # Uniform Bessel on five normalized visible coefficients, followed by the triangle inequality.
    slope = Q(".07")
    require(sum(a*a for _,_,a,_ in FITS)<=slope**2 and sum(b*b for _,_,_,b in FITS)<=1,
            "tail residual radius")
    coef = [Q(0)]*7
    for i,v in enumerate(poly):
        coef[2*i] = v
    coef[0] -= (1+ETA)*6+(1-ETA)*Q(3,2)*MK*MK+PRICE*(MU_UP-center)
    coef[1] -= (1-ETA)*3*MK+PRICE*lam
    coef[2] -= (1+ETA)*5*slope
    coef[4] -= (1+ETA)*Q(5,4)*slope*slope
    # All coefficients in powers of y-END are nonnegative.
    for j in range(7):
        require(sum(v*comb(i,j)*END**(i-j) for i,v in enumerate(coef) if i>=j)>=0,
                "tail on the positive ray")


def check(first,remote,lam,poly,threshold):
    center=first+lam*remote
    pl,ph = pi_interval()
    require(4*MU_LO**2<pl<ph<4*MU_UP**2,"Gaussian mean")
    require(PRICE**2>=48*(1+1/ETA)**2,"Young price")
    require(first**2+remote**2<MU_LO**2,"realizable slice")
    print("Excluded fourth-excess intervals:",shape_cut(lam,center),flush=True)
    require(poly[2]<=0<=poly[3],"curvature signs")
    tail(lam,center,poly)
    for i in range(STEP*END):
        l,h = Q(i,STEP),Q(i+1,STEP)
        require(min(gap(lam,center,poly,l),gap(lam,center,poly,h))>=gap_curvature(lam,poly,h)/(8*STEP**2),f"scalar gap at {l}")
    # sqrt(.002)<.045. The cubic coefficient poly[3] is positive.
    require(Q(".045")**2>Q(".002") and poly[3]>=0 and
            poly[2]+poly[3]*(9+C6*Q(".045"))+(1+ETA)*SHAPE_COST<=0,"fourth excess price")
    price = poly[0]+poly[1]+2*poly[2]+6*poly[3]
    require(price<threshold,"strict sign threshold")
    print(f"On the occupied slice t >= {first}, tau >= {remote}, the full fifth difference <= {price}.")


if __name__=="__main__":
    for t,tau,lam,p0,p1,p2,p3,limit in (
        (".83835",".287345",".3425","-29.50291","30.327419","-.4337458",".00702658","-.0008"),
        (".837432861328125",".290007",".3463","-30.144389","31.0046040","-.45320789",".00747215","-.00136"),
    ):
        check(Q(t),Q(tau),Q(lam),tuple(map(Q,(p0,p1,p2,p3))),Q(limit))
