"""Three-node Hermite upper bounds for the physical Gaussian-shift mean.

Every moment bound, interpolation coefficient, and shape interval comparison in
this replay is outward rational. Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from functools import cache
from math import ceil
from pathlib import Path
import sys
sys.path.insert(0,str(Path(__file__).resolve().parent))

from gaussian_quadrature_rice import (
    C6, MU_LO, MU_UP, add, low_sqrt, majorant, mul, normalized_values, polynomial, require,
)

# Proposals for squared remote radii. Each triple proves an upper bound at
# every radius; the shape mesh only selects a favorable upper bound.
NODES = tuple(tuple(map(Q,row.split())) for row in [
    ".416 2.294 6.29", ".48 2.72 9", ".52 2.98 12", ".548 3.173 17",
    ".559 3.251 24", ".566 3.29 30", ".571 3.33 41", ".578 3.37 70",
    ".582 3.40 120",
])
ZERO = (Q(0),Q(0))


@cache
def coefficients(lam,nodes):
    """Complex-Gaussian Rice interpolant in monomials of the squared shift."""
    xs=[x for x in nodes for _ in range(2)]
    vals=[normalized_values(lam*lam,x) for x in xs]
    cols=[[v[0] for v in vals]]
    for k in range(1,len(xs)):
        prev=cols[-1]
        cols.append([vals[i][1] if xs[i]==xs[i+k] else
                     mul(1/(xs[i+k]-xs[i]),add(prev[i+1],mul(-1,prev[i])))
                     for i in range(len(xs)-k)])
    out=[cols[-1][0]]
    for i in reversed(range(len(xs)-1)):
        out=[add(p,q) for p,q in zip([ZERO]+out,[mul(-xs[i],v) for v in out]+[ZERO])]
        out[0]=add(out[0],cols[i][0])
    require(all((v[0]>0 if i==0 or i%2 else v[1]<0) for i,v in enumerate(out)),
            "signs of all moment prices")
    return out


def root_upper(prev, k, bracket):
    """If E X^(2k)=x^k, Gaussian integration by parts bounds x by this root."""
    a=(2*k-1)*(k-1)**2*bracket
    b=(2*k-1)*prev
    # Check x^k-a*x^(k-1)-b >= 0 beyond its unique positive root.
    den=10**8
    lo,hi=0,den
    def valid(j):
        x=Q(j,den)
        return x>=a and (x-a)*x**(k-1)>=b
    while not valid(hi):
        hi*=2
    while lo+1<hi:
        mid=(lo+hi)//2
        if valid(mid):hi=mid
        else:lo=mid
    return Q(hi,den)**k


@cache
def radial_upper(s):
    scale=10**12
    rs=low_sqrt(s,scale)+1/Q(scale)
    bracket=low_sqrt(s/3,scale)+1/Q(scale)
    m3=6+9*s+C6*s*rs
    m8=root_upper(Q(5,2)*m3,4,bracket)
    m10=root_upper(m8,5,bracket)
    return m3,Q(8,63)*m10


def small_price(lam,low,high):
    m3,m5=radial_upper(high)
    values=(1,1,2+low,m3,24,m5)
    return MU_UP*min(sum(v[1]*z for v,z in zip(coefficients(lam,ns),values)) for ns in NODES)


def certify(lam,cap):
    todo=[(Q(0),Q(42))]
    counts=[0,0]
    while todo:
        lo,hi=todo.pop()
        if hi<=Q(1,100) and small_price(lam,lo,hi)<=cap:
            counts[0]+=1
            continue
        p=polynomial(lam,(lo+hi)/2)
        if MU_UP*max(majorant(p,lo),majorant(p,hi))<=cap:
            counts[1]+=1
            continue
        require(hi-lo>Q(1,10**9),"three-node support cap too small")
        mid=(lo+hi)/2
        todo.extend([(lo,mid),(mid,hi)])
    return counts


def main():
    for lam,cap in [(Q(".3463"),Q(".937862576")),(Q(".3425"),Q(".936765955"))]:
        print(lam, cap, certify(lam,cap),flush=True)


if __name__=="__main__":
    main()
