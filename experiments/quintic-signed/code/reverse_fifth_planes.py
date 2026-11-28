"""Lower estimates for the full fifth difference near a remote cubic support.

Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from math import ceil
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from full_fifth_planes import add, square, coefficient_bounds, derivatives, require
from gaussian_quadrature_rice import MU_UP, MU_LO, polynomial, majorant, check_support

LAM=Q(".3425")
SUP=Q(".936766750")
CENTERS=tuple(map(Q,[".29154",".09513",".07767"]))
H=Q(".14231")
# Quadratic and quartic coefficients of a global upper bound for -Delta*.
ROWS=[tuple(map(Q,s.split())) for s in [
    ".015 -.03362 .01615 .02737 .000263",
    ".06 -.03207 .01660 .02756 .000289",
    ".15 -.02898 .01749 .02793 .000343",
    ".30 -.02382 .01900 .02852 .000437",
]]


def template(y,lam,centers,h):
    a=lam*y
    n=max(61,2*ceil(2*a*a)+61)
    ds=derivatives(a*a,(MU_LO,MU_UP),terms=n,precision=10**125)
    def coeff(i,j):
        return coefficient_bounds(i,j,a,ds)
    uk=sum(square(coeff(i,j))[1] for i,j in [(0,2),(1,1),(2,0)])
    for (i,j),v in zip([(0,0),(2,2),(3,1)],centers):
        uk+=square(add(coeff(i,j),(-v*y,-v*y)))[1]
    lh=2*h*coeff(3,2)[0]-h**2
    return uk,lh


def proof_rows(lam=LAM,centers=CENTERS,h=H,rows=ROWS,
               ranges=((0,2,512),(2,12,128),(12,32,8)),m=Q(".32")):
    for lo,hi,step in ranges:
        # The upper bound on the second derivative of polynomial minus profile
        # bounds its loss from linear interpolation on each closed cell.
        d1,d2=4*lam,16*lam**2
        uk2=3*(2*d1**2+2*d2)+sum(2*(d1+v)**2+2*(1+hi*v)*d2 for v in centers)
        lh2=2*h*d2
        margins=[(2*c+12*e*hi**2+(1+eta)*uk2+(1-eta)*lh2)/(8*step**2)
                 for eta,a,b,c,e in rows]
        for i in range(lo*step,hi*step+1):
            y=Q(i,step)
            uk,lh=template(y,lam,centers,h)
            for (eta,a,b,c,e),margin in zip(rows,margins):
                require(a+b*y+c*y*y+e*y**4-((1+eta)*uk-(1-eta)*lh)>=margin,
                        f"reverse fifth interpolation at y={y}, eta={eta}")
    radius=Q(ranges[-1][1])
    require(sum(x*x for x in centers)<=m*m,"subtraction norm")
    for eta,a,b,c,e in rows:
        # For y>=32, bound U_k by (1+m*y)^2 by Bessel, and
        # -L_h by 2H+H². Check all translated coefficients nonnegative.
        p=[a-(1+eta)-(1-eta)*(2*h+h**2), b-2*(1+eta)*m,
           c-(1+eta)*m**2, 0, e]
        from math import comb
        for j in range(5):
            require(sum(p[i]*comb(i,j)*radius**(i-j) for i in range(j,5))>=0,
                    "large-radius reverse template")
    print(f"{len(rows)} reverse fifth templates certified for all remote radii.")


def exclude_shapes(low, support, lam=LAM):
    queue=[(low,Q(42))]
    count=0
    while queue:
        l,h=queue.pop();m=(l+h)/2
        poly=polynomial(lam,m)
        if MU_UP*max(majorant(poly,l),majorant(poly,h))<support:
            count+=1
        else:
            require(h-l>Q(1,10**8),"shape threshold below the achievable support")
            queue.extend([(l,m),(m,h)])
    return count


def floor(t,tau,shape, *, lam=LAM, sup=SUP, rows=ROWS):
    slack=sup-t-lam*tau
    prices=[]
    for eta,a,b,c,e in rows:
        # Upper bound 4 sqrt(3) (1+1/eta).
        loss=Q(692821,100000)*(1+1/eta)
        require(Q(692821,100000)**2>48 and slack>=0,"stability price")
        prices.append(-(a+Q(".93")*b+c+e*(2+shape)+loss*slack))
    return max(prices)


def main():
    proof_rows()
    check_support(LAM,SUP)
    for t,r,shape,lower in [
        (Q(".83835"),Q(".2873455"),Q(".002"),Q("-.009726")),
        (Q(".83835"),Q(".287345"),Q(".002"),Q("-.009806")),
        (Q(".83835"),Q(".28732"),Q(".02"),Q("-.012693")),
        (Q(".83835"),Q(".287"),Q(".4"),Q("-.022374")),
        (Q(27441,32768),Q(".290007"),Q(".02"),Q("-.012307")),
    ]:
        n=exclude_shapes(shape,t+LAM*r)
        bound=floor(t,r,shape)
        require(bound>lower,f"contact floor {float(bound)} at {r}")
        print(f"t>={t}, tau>={r}: full fifth difference > {lower}; {n} shape cells.")


if __name__=="__main__":
    main()
