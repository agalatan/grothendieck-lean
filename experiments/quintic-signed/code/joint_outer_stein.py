"""Replay a common-shape 06/07 price on six closed amplitude intervals.

Run from the repository root with python3 -IB -O. Agent-ID: codex-a7c4
"""
from fractions import Fraction as Q
from math import ceil, floor
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from joint_outer_schedule import LAMBDAS, MU_UP, checked, factor, first, header, outer_pieces, segment
from outer67_bank import outer67_prices
from tilted_signed_schedule import envelope, high

SHOULDER = Q('.88575')
FLOOR = Q('.023')
RESIDUAL = Q('.149')
DEN = 10**13
# Cell number and the row-07 weight in thousandths at equal subdivisions.
MIXES = {12:(0,0), 13:(0,98), 14:(98,186,274,362,450), 15:(450,626,802),
         16:(802,979,1000), 17:(1000,1000)}


def joint_pieces(previous):
    source = first.curved.sparse.base.TestWeightedTightGate
    source.setUpClass()
    source = source()
    delta = header(6)[0][2]
    price = outer67_prices(Path.cwd())
    pieces = [s for s in previous if s.cell not in MIXES]
    for n,nums in MIXES.items():
        lo,hi,i,j,_ = source.cells[n]
        checked({i,j} <= {6,7}, 'unexpected source row')
        step = (hi-lo)/(len(nums)-1)
        for k,(w,z) in enumerate(zip(nums,nums[1:])):
            l,h = lo+k*step,lo+(k+1)*step
            tau = min((MU_UP*factor(lam)-l)/lam for lam in LAMBDAS)
            cut = Q(ceil(10000*delta*tau),10000)
            wl,wh = Q(w,1000),Q(z,1000)
            pieces.append(segment(source,n,l,h,6,7,wl,wh,price(wl,cut),price(wh,cut)))
    pieces.sort(key=lambda s:s.low)
    first.check_partition(pieces,source.cells)
    checked(len(pieces)==len(previous)==126, 'unexpected number of pieces')
    return pieces


def two_contacts(pieces,t1,t2,d):
    """Low cost and the cheaper of the two allowed high costs, for every mix/switch."""
    s1, = [s for s in pieces if s.low<t1<s.high]
    s2, = [s for s in pieces if s.low<t2<s.high]
    def costs(w):
        a,b,c = first.physical_scales(w)
        return (s1.at(t1,(a,b-Q(41,20)*d,c+Q(3371,2000)*d)),
                s2.at(t2,(a,b,c-FLOOR*d)), high(w,d,t2,residual=RESIDUAL))
    origins = costs(0)
    slopes = [y-x for x,y in zip(origins,costs(1))]
    mix = {Q(0),Q(1)}
    for i in range(3):
        for j in range(i):
            if slopes[i]!=slopes[j]:
                x=(origins[i]-origins[j])/(slopes[j]-slopes[i])
                if 0<=x<=1:
                    mix.add(x)
    return min(max(a,min(b,c)) for a,b,c in map(costs,mix))


def main():
    from joint_cubic_schedule import replay as cubic_receipt
    from sixth_rice_support import main as sixth_receipt
    sixth_receipt()
    cubic_receipt()
    previous = outer_pieces()
    pieces = joint_pieces(previous)
    contact = Q('0.837432861328125')
    for label,w,d,switch,num,claim in (
        ('signed',Q(1790505041,50000000000000),Q(1,10**8),Q('.885773796378757'),7132510993179,Q('1.402030786852')),
        ('zero debit',Q(894439399,25000000000000),Q(0),Q('.885773796896554'),7132510972283,Q('1.402030790959')),
    ):
        config = dict(residual=RESIDUAL,radial_start=SHOULDER,radial_floor=FLOOR)
        price = envelope(pieces,w,d,switch,**config)
        checked(ceil(DEN*price)==num and Q(DEN,num)>claim, 'full profile cap')
        checked(envelope(previous,w,d,switch,**config)>Q(num,DEN),'predecessor passes stronger cap')
        lower = max(two_contacts(pieces,contact+Q(sign,10**16),switch,d) for sign in (-1,1))
        checked(floor(DEN*lower)==num-1, 'two-contact lower price')
        print(f'126 pieces, {label}: cap {num}/{DEN}, reciprocal > {claim}; '
              f'any mix and high switch require this ceiling at scale {DEN}.')


if __name__=='__main__':
    main()
