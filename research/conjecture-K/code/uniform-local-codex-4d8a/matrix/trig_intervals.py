# handoff/codex-4d8a-compensated-joint/matrix/trig_intervals.py — Agent-ID: codex-4d8a; verbatim inherited checker follows
# odd_sector_certificate/trig_intervals.py
"""Generate or independently verify trigonometric enclosures using exact rationals."""
import argparse
from fractions import Fraction as F
import math
from pathlib import Path

def arctan_bounds(x, n=48):
    total = sum(((-1)**k * x**(2*k+1) / (2*k+1) for k in range(n)), F(0))
    remainder = (-1)**n * x**(2*n+1) / (2*n+1)
    return min(total,total+remainder), max(total,total+remainder)

alo,ahi=arctan_bounds(F(1,5)); blo,bhi=arctan_bounds(F(1,239))
_pi_lo=16*alo-4*bhi; _pi_hi=16*ahi-4*blo
_decimal=10**30
PI_LO=F((_pi_lo*_decimal).__floor__(),_decimal)
PI_HI=F((_pi_hi*_decimal).__ceil__(),_decimal)

def scalar_bounds(r, cosine):
    """Enclose cos(pi*r) or sin(pi*r), with 0<=r<=1."""
    if r==0: return (F(1),F(1)) if cosine else (F(0),F(0))
    if r==1: return (F(-1),F(-1)) if cosine else (F(0),F(0))
    if r==F(1,2): return (F(0),F(0)) if cosine else (F(1),F(1))
    x=r*(PI_LO+PI_HI)/2; radius=r*(PI_HI-PI_LO)/2
    # Consecutive Taylor truncations bracket the value: the alternating tail
    # decreases after these orders, even when the initial terms increase.
    term=F(1) if cosine else x
    total=term
    for k in range(1,32):
        denominator=(2*k-1)*(2*k) if cosine else (2*k)*(2*k+1)
        term=-term*x*x/denominator
        total+=term
    denominator=63*64 if cosine else 64*65
    next_term=-term*x*x/denominator
    return min(total,total+next_term)-radius, max(total,total+next_term)+radius

def exact_row(j,n):
    lo=F(j,n); hi=F(j+1,n); mid=F(2*j+1,2*n)
    cl,ch=scalar_bounds(hi,True)[0],scalar_bounds(lo,True)[1]
    left,right=scalar_bounds(lo,False),scalar_bounds(hi,False)
    sl=min(left[0],right[0]);sh=F(1) if lo<=F(1,2)<=hi else max(left[1],right[1])
    return cl,ch,sl,sh,*scalar_bounds(mid,True),*scalar_bounds(mid,False)

def outward(value,upper):
    number=float(value)
    return math.nextafter(number,math.inf if upper else -math.inf)

def verify(path):
    lines=Path(path).read_text().splitlines();n=int(lines[0]);assert len(lines)==n+1
    for j,line in enumerate(lines[1:]):
        actual=[F.from_float(float(s)) for s in line.split()]
        exact=exact_row(j,n)
        assert len(actual)==8
        for k,(got,need) in enumerate(zip(actual,exact)):
            assert (got>=need if k%2 else got<=need),(j,k,float(got),float(need))
    assert F.from_float(3.141592653589793) < PI_LO
    assert F.from_float(3.1415926535897936) > PI_HI
    print(f'Verified {n} trigonometric cells and pi enclosure by exact rational arithmetic.')

def generate(n,path):
    with open(path,'w') as f:
        f.write(str(n)+'\n')
        for j in range(n):
            f.write(' '.join(format(outward(q,k%2),'.17g') for k,q in enumerate(exact_row(j,n)))+'\n')
    verify(path)

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('action',choices=['verify','generate']);parser.add_argument('path');parser.add_argument('--n',type=int,default=128);args=parser.parse_args()
    if args.action=='verify':verify(args.path)
    else:generate(args.n,args.path)
