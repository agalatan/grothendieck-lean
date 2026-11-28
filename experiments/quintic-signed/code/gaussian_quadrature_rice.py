"""Enclose the Gaussian-shift support from the first three radial moments.

The two nodes of each Hermite interpolant are proposals. Their majorant is
valid at every nonnegative shift, without an optimality assumption.
Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from math import isqrt
from functools import cache
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from sixth_rice_support import C6, MU_UP, MU_LO, require
from one_coordinate_multiplier import pi_interval

SCALE=10**66


def low_sqrt(x,scale):
    return Q(isqrt(x.numerator*scale**2//x.denominator),scale)


def add(a,b):
    return a[0]+b[0],a[1]+b[1]


def mul(c,p):
    return (c*p[0],c*p[1]) if c>=0 else (c*p[1],c*p[0])


@cache
def normalized_values(u,x):
    """Value and derivative in x of F(u*x) from two alternating Taylor sums."""
    v=u*x
    # F'(v)=(1/2) E exp(-v B), B~Beta(1/2,3/2). Integrating in v
    # divides its kth Taylor coefficient by k+1 to obtain F(v).
    l=h=SCALE
    pl=ph=SCALE
    gl=gh=SCALE
    for k in range(256):
        n=v.numerator*(2*k+1)
        d=v.denominator*2*(k+1)*(k+2)
        l,h=l*n//d,-(-h*n//d)
        if k%2==0:
            pl-=h
            gl-=-(-h//(k+2))
            lower_p,lower_g=pl,gl
            ph-=l
            gh-=l//(k+2)
        else:
            pl+=l
            ph+=h
            gl+=l//(k+2)
            gh+=-(-h//(k+2))
    # After the last (positive) term the even partial sum is the upper bound;
    # the preceding odd partial sum, with its own rounding, is the lower.
    return (1+v*lower_g/(2*SCALE),1+v*gh/(2*SCALE)), (u*lower_p/(2*SCALE),u*ph/(2*SCALE))


def polynomial(lam,shape):
    m2=2+shape; m3=6+9*shape+C6*shape*low_sqrt(shape,10**10)
    total=(m3-m2)/(m2-1)
    product=(m3-m2*m2)/(m2-1)
    upper=(total+low_sqrt(total*total-4*product,10**10))/2
    a=Q(round(1000*product/upper),1000)
    b=Q(round(1000*upper),1000)
    require(0<=a<b,"invalid interpolation proposal")
    u=lam**2
    fa,pa=normalized_values(u,a)
    fb,pb=normalized_values(u,b)
    width=b-a
    second=mul(1/width**2,add(fb,add(mul(-1,fa),mul(-width,pa))))
    third=mul(1/width**2,add(pb,add(mul(-1,pa),mul(-2*width,second))))
    # Exact coefficient >=0 by F'''>0. Its lower enclosure can be clipped.
    third=(max(0,third[0]),third[1])
    require(third[0]<=third[1],"cubic coefficient")
    return a,b,fa,pa,second,third


def majorant(poly,s):
    a,b,fa,pa,second,third=poly
    m2=2+s
    m3=6+9*s+C6*s*(low_sqrt(s,10**12)+Q(1,10**12))
    return (fa[1]+mul(1-a,pa)[1]+mul(m2-2*a+a*a,second)[1]
            +mul(m3-(2*a+b)*m2+a*a+2*a*b-a*a*b,third)[1])


def check_support(lam,cap):
    # A fixed cubic price as a function of shape s is const+B*s+C*s^(3/2)
    # with C>=0, so the two shape endpoints control the entire interval.
    todo=[(Q(0),Q(42))]
    boxes=0
    while todo:
        l,h=todo.pop()
        m=(l+h)/2
        poly=polynomial(lam,m)
        if MU_UP*max(majorant(poly,l),majorant(poly,h))<=cap:
            boxes+=1
        else:
            require(h-l>Q(1,10**9),"claimed support bound is too small")
            todo.extend([(l,m),(m,h)])
    return boxes


if __name__=="__main__":
    pi_lo,pi_hi=pi_interval()
    require(4*MU_LO**2<pi_lo<pi_hi<4*MU_UP**2,"Gaussian radius envelope")
    # Slightly above the two-node Gaussian price at zero fourth excess.
    for lam,cap in [(Q(".24"),Q(".911393002")), (Q(".3425"),Q(".936766750")),
                    (Q(".345"),Q(".937487036")), (Q(".44"),Q(".968226456"))]:
        print(lam,cap,check_support(lam,cap),flush=True)
    require((Q(".936766750")-Q(".83835"))/Q(".3425")<Q(".28734818"),
            "central sharp support")
    require(Q(".83835")**2+Q(".2873455")**2<MU_LO**2,"realizable Gaussian lower control")
    print("At t>=.83835 the supremal remote cubic norm lies between .2873455 and .28734818.")
