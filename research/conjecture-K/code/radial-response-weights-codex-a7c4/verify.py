"""Exact radial-weight feasibility cuts for Conjecture K. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from functools import cache
from math import factorial, isqrt

RADII = {
    # E[w], M1, M0, M2-2M1+M0, M2/2, (M3-4M2+4M1)/2, rounded up.
    Q('.1'): '894465 878576 1588929 1156745 662484 765587',
    Q('.2'): '916975 859617 1433950 1027115 656200 743072',
    Q('.3'): '951022 833838 1302044 927264 646448 714870',
    Q('.4'): '994471 804240 1188941 848373 633956 684792',
}
SCALE = 2**80


def require(ok, message):
    if not ok:
        raise ValueError(message)


def down(x):
    return Q((x*SCALE).__floor__(), SCALE)


def up(x):
    return Q((x*SCALE).__ceil__(), SCALE)


def root_lo(x):
    return Q(isqrt(x.numerator*SCALE**2//x.denominator), SCALE)


def atan_bounds(d):
    value = sum(Q((-1)**j, (2*j+1)*d**(2*j+1)) for j in range(20))
    return value, value + Q(1, 41*d**41)


a, b = atan_bounds(5)
c, d = atan_bounds(239)
PI_LO, PI_HI = 16*a-4*d, 16*b-4*c  # Machin's identity


def sector_bounds(weight_hi, moments):
    (l0,h0), (l1,h1), (l2,h2), (l3,h3) = moments
    require(all(0 < lo <= hi for lo,hi in moments), 'invalid radial moments')
    return (weight_hi, h1, h0, h2-2*l1+h0, h2/2, (h3-4*l2+4*h1)/2)


def smooth_moments(r):
    """Integrate w=sqrt(T+r²) using the alternating Gaussian integral."""
    z = r*r
    require(0 < r <= Q('.4'), 'unsupported radius')
    gauss_lo = sum((-1)**j*r**(2*j+1)/((2*j+1)*factorial(j)) for j in range(20))
    gauss_hi = gauss_lo+r**41/(41*factorial(20))
    exp_lo = sum(z**j/factorial(j) for j in range(20))
    exp_hi = exp_lo+z**20/factorial(20)/(1-z/21)
    m0 = (down(exp_lo*(root_lo(PI_LO)-2*gauss_hi)),
          up(exp_hi*(root_lo(PI_HI)+Q(1,SCALE)-2*gauss_lo)))
    w_hi = r+m0[1]/2
    moments = [m0, tuple(r+(Q(1,2)-z)*x for x in m0)]
    for j in (1,2):
        moments.append(tuple((j+Q(1,2)-z)*x+j*z*y
                             for x,y in zip(moments[j],moments[j-1])))
    return w_hi, moments


def smooth_bounds(r):
    return sector_bounds(*smooth_moments(r))


def checked_row(r, entries):
    row = tuple(Q(int(x),10**6) for x in entries.split())
    bounds = smooth_bounds(r)
    require(len(row)==len(bounds) and all(b<=v for b,v in zip(bounds,row)),
            'inward or missing published coefficient')
    return row


@cache
def tail_moments():
    """Enclose the integrals of T^j exp(-T) over each of 257 intervals."""
    step = Q(1,16)
    rate_hi = sum((-step)**j/factorial(j) for j in range(17))
    rate_lo = rate_hi-step**17/factorial(17)
    tails = []
    lo = hi = Q(1)
    for i in range(257):
        t = i*step
        polys = [Q(1)]
        for j in (1,2,3):
            polys.append(t**j+j*polys[-1])
        tails.append([(lo*p,hi*p) for p in polys])
        lo,hi = down(lo*rate_lo), up(hi*rate_hi)
    tails.append([(Q(0),Q(0))]*4)  # exactly at infinity
    return [[(a-d,b-c) for (a,b),(c,d) in zip(left,right)]
            for left,right in zip(tails,tails[1:])]


def shell_weight_bounds(offset, curvature):
    moments = [[Q(0),Q(0)] for j in range(4)]
    weight_hi = Q(0)
    for i,cell in enumerate(tail_moments()):
        t = Q(2*i+1,32) if i<256 else Q(17)
        w = root_lo(t+offset+curvature*(t-1)**2)
        require(w>0, 'zero interval weight')
        weight_hi += up(w*cell[0][1])
        for pair,(lo,hi) in zip(moments,cell):
            pair[0] += down(lo/w)
            pair[1] += up(hi/w)
    return sector_bounds(weight_hi, moments)


def verify():
    rows = {r:checked_row(r,s) for r,s in RADII.items()}
    weight,first,remote,even_a,even_b,visible = rows[Q('.3')]
    require(even_a>even_b and first>visible, 'wrong sector ordering')
    # D = epsilon²(pi/4-t²). Each left-minus-right expression is affine in t².
    for t in (Q(0),Q('.8393')):
        unit = PI_LO/4-t*t
        require(t*t/first+unit*(Q('.95')/remote+Q('.54')/even_a)>weight,
                'uniform high-remote cut')
    for t in (Q(0),Q('.826')):
        unit = PI_LO/4-t*t
        base = t*t/first+unit*(Q('.95')/remote+Q('.50')/even_a)
        require(base+unit*Q('.041')*(1/even_b-1/even_a)>weight,'B-sector cut')
        require(base+unit*Q('.016')/first>weight,'odd-sector cut')
    eps,t = Q('.752'),Q('.826')
    eq,v,w = Q('.04'),Q('.04'),Q('.005')
    require(3*(eps**2*(PI_LO/4-t*t)-eq/2)/2>Q('.05747'),'old even-energy cap')
    require(eps**2*(PI_LO/4-t*t)-eq/2-2*v/3-w>Q('.00664'),'old ellipsoid comparison')
    require(eq/remote+v/even_a+w/first-eps**2*(weight-t*t/first)>Q('.00476'),
            'three-sector exclusion')
    for e,s,k,bound in [('.02','.02','.15','.05384'),('.03','.05','.10','.04711'),
                        ('.04','.05','.10','.04031'),('.05','.05','.075','.03347')]:
        weight,first,remote,ea,eb,_ = shell_weight_bounds(Q(s),Q(k))
        vcap = max(ea,eb)*(eps**2*(weight-t*t/first)-Q(e)/remote)
        require(vcap < Q(bound), 'piecewise-weight even cap')
    # A single inward unit in a well-formed row must be caught by the replay.
    altered = RADII[Q('.3')].replace('1302044','1302043')
    try:
        checked_row(Q('.3'),altered)
    except ValueError as error:
        require(str(error)=='inward or missing published coefficient','wrong rejection')
    else:
        raise ValueError('accepted inward rounding')
    print('Verified four smooth weights, four even-energy caps, two sector cuts,')
    print('the uniform high-remote cut and the three-sector exclusion; rejected inward rounding.')


if __name__=='__main__':
    verify()
