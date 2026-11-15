"""Exact full-box disjoint-driver kernel certificate, independently ported.

Agent-ID: codex-a7c4. Refs #398. Run: python3 -I remote_disjoint_cost.py.
Standard library only. Acceptance integers use denominator 2^40.
The mathematical disk/heat-kernel implication is audited in REMOTE.md.
Source algorithm: received chatgpt-thread2-verify_core.mjs, full-box section.
"""
from fractions import Fraction as Q
from math import isqrt
from pathlib import Path
import argparse
import json

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')

ONE = 1 << 40


def down(n, d):
    assert d > 0
    return n // d


def up(n, d):
    return -down(-n, d)


def sqrt_up(n):
    r = isqrt(n)
    return r if r*r == n else r+1


def rat(n, d):
    return (down(n*ONE, d), up(n*ONE, d))


def mul(a, b):
    c = [x*y for x in a for y in b]
    return down(min(c), ONE), up(max(c), ONE)


def exp_minus_upper(x, terms):
    assert x >= 0
    term = total = ONE
    for k in range(1, terms+1):
        term = down(term*x, k*ONE)
        total += term
    return up(ONE*ONE, total)


def scalar_checks():
    C = Q(237,200)
    # pi < 22/7; these verify every decimal used in the analytic argument.
    assert Q(22,7) < Q(1773,1000)**2
    exp_lower = sum((Q(3,2)**j / factorial(j) for j in range(16)), Q(0))
    assert Q(44,7)/exp_lower < C*C
    assert C < Q(19,16)
    assert (C-1)*Q(5,3)**2 > Q(1,2)
    # Tail estimate from the proof, retaining its deliberately loose constants.
    assert exp_minus_upper(16*ONE, 64) < up(13*ONE,10**8)
    assert 2*C*(Q(225,20)*16+Q(290,8))*Q(13,10**8) < Q(1,5000)
    for n,d,bn,bd in [(4,3,8,7), (7,4,10,9)]:
        x = rat(n,d)
        y = mul(mul(x,x), rat(1,4))
        term = (ONE,ONE)
        total = term
        for j in range(1,16):
            term = mul(mul(term,y), rat(1,j*j))
            total = (total[0]+term[0], total[1]+term[1])
        i0_upper = total[1]+term[1]
        root = sqrt_up(up(44*x[1]*ONE,7))
        upper = up(root*exp_minus_upper(x[0],30)*i0_upper, ONE*ONE)
        assert bd*upper < bn*ONE


def factorial(n):
    v=1
    for j in range(1,n+1):
        v*=j
    return v


def radial_cells():
    cells=[]
    for j in range(4096):
        l,r = j*ONE//1024, (j+1)*ONE//1024
        l2,r2 = l*l//ONE,r*r//ONE
        weight = max(abs(l2-ONE),abs(r2-ONE))**2*exp_minus_upper(l2,48)
        cells.append((r,l2,r2,weight))
    return cells


def disks(cells, plo, phi):
    last=0
    layers=[]
    for r,l2,r2,weight in reversed(cells):
        f = ONE+down(min(plo*(l2-2*ONE),phi*(l2-2*ONE)),ONE)
        g = ONE+down(min(plo*(3*l2-2*ONE),phi*(3*l2-2*ONE)),ONE)
        assert f>0 and g>0
        height=up(weight,f*g)
        if height<=last:
            continue
        fmax=ONE+up(max(plo*(r2-2*ONE),phi*(r2-2*ONE)),ONE)
        layers.append((height-last,up(r*fmax,ONE),max(0,ONE-r2),max(ONE,r2-ONE)))
        last=height
    return layers


def potential(layers, dlo, dhi):
    clo,chi=rat(237,200)
    bound=0
    for mass,radius,inner,outer in layers:
        z=down(dlo*inner,ONE)
        m=min(radius,down(17*z,20))
        integral=up(chi*(radius-m),ONE)+up(1773*(sqrt_up(z*z+m*m)-z),1000)
        if dhi is not None:
            far=up(5*dhi*outer,3*ONE)
            excess=max(0,radius-far)
            integral-=down((clo-ONE)*excess*excess,ONE*radius)
        bound+=mass*integral
    return up(2*bound,ONE)+up(ONE,5000)


def profile(cells, plo, phi):
    layers=disks(cells,plo,phi)
    tail=potential(layers,ONE,None)
    if 100*tail>=199*ONE:
        return None
    accepted=[(ONE,None,tail)]
    pending=[(0,ONE)]
    while pending:
        lo,hi=pending.pop()
        upper=potential(layers,lo,hi)
        if 100*upper<199*ONE:
            accepted.append((lo,hi,upper))
        elif hi-lo<=ONE//4096:
            return None
        else:
            mid=(lo+hi)//2
            pending.extend([(lo,mid),(mid,hi)])
    # Independent exact coverage of the accepted d intervals, including infinity.
    finite=sorted((lo,hi) for lo,hi,_ in accepted if hi is not None)
    cursor=0
    for lo,hi in finite:
        assert lo==cursor and hi>lo
        cursor=hi
    assert cursor==ONE
    return accepted


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true',help='Explicitly update the saved result JSON.')
    args=parser.parse_args()
    scalar_checks()
    cells=radial_cells()
    endpoints=(rat(2,15)[0],rat(4,19)[1])
    pending=[(*endpoints,0)]
    accepted=[]
    while pending:
        lo,hi,depth=pending.pop()
        result=profile(cells,lo,hi)
        if result is not None:
            accepted.append((lo,hi,result))
            continue
        assert depth<11, 'Full-box potential not certified'
        mid=(lo+hi)//2
        pending.extend([(lo,mid,depth+1),(mid,hi,depth+1)])
    cursor=endpoints[0]
    for lo,hi,_ in sorted(accepted):
        assert lo==cursor and hi>lo
        cursor=hi
    assert cursor==endpoints[1]
    worst=max(b for _,_,cells0 in accepted for _,_,b in cells0)
    assert worst==2188027284403, 'Independent port disagrees with historical output'
    assert Q(worst,ONE)<Q(199,100)
    # Cost decreases in epsilon and increases in ell. Both corner values are 19/25.
    assert Q(25,19)-Q(199,200)/Q(19,25)==Q(1,152)
    result={'agent_id':'codex-a7c4','status':'PASS',
            'profile_range':['2/15','4/19'], 'gaussian_scale_range':'[0,infinity)',
            'profile_intervals':len(accepted),
            'variance_intervals':sum(len(z) for _,_,z in accepted),
            'normalized_kernel_upper':str(Q(worst,ONE)),
            'strict_target':'199/100', 'uniform_shell_cost_lower':'1/152',
            'scope':'Numerical premise of STATUS 4.2; every shift, scale, application profile.'}
    if args.write_result:
        Path(__file__).with_name('remote_disjoint_cost_result.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))


if __name__=='__main__':
    main()
