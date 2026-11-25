#!/usr/bin/env python3
"""Exact rational replay for the cubic Schur bound. Agent-ID: codex-a7c4.

Run without arguments for the two-row positive-u theorem, or with --all-rows
for all 18 row signs. Python standard library only; reads the committed exact row multipliers.
"""
import argparse
import json
from pathlib import Path
from fractions import Fraction as F
from math import factorial

EPS = F(39, 50)
ETA = F(779, 10000)
LIMIT = F(500, 701)
MU_LO = F('0.8862')
MU_HI = F('0.886227')
N = 16384
SCALE = 2**68
RADIUS = 8

def require(test, message):
    if not test:
        raise ArithmeticError(message)


def ceil_div(a, b):
    return -((-a) // b)


def exp_grid():
    """Bracket SCALE exp(−(j/N)^2), using alternating Taylor and integer rounding."""
    lo, hi = [SCALE], [SCALE]
    d = N*N
    for j in range(N*RADIUS):
        u = 2*j + 1
        require(u < d, 'Taylor argument out of range')
        # exp(-u/d) lies between its degree-3 and degree-2 partial sums.
        degree2 = 2*d*d - 2*u*d + u*u
        lo.append(lo[-1] * (3*d*degree2-u**3) // (6*d**3))
        hi.append(ceil_div(hi[-1] * degree2, 2*d*d))
    return lo, hi


def radial_moments(ell, beta, elo, ehi):
    """Bracket J_k=2∫ exp(−r²) r^(2k)/g(r²) dr for k=0,1,2,3."""
    a = ell - 2*beta
    xl, xh = ETA*MU_LO/16, ETA*MU_HI/16
    # g=a+6x+(beta-6x)T+xT². Coefficients positive, hence g increases.
    lo = [(SCALE*v).__floor__() for v in (a+6*xl, beta-6*xh, xl)]
    hi = [(SCALE*v).__ceil__() for v in (a+6*xh, beta-6*xl, xh)]
    require(a > 0 and min(lo) > 0, 'nonpositive lower coefficient')
    require(2*MU_HI/a < 1/ETA, 'full quintic not absorbed')

    def polynomial(j, coeff):
        return coeff[0]*N**4 + coeff[1]*j*j*N*N + coeff[2]*j**4

    lower, upper = [0]*4, [0]*4
    left = polynomial(0, lo)
    for j in range(N*RADIUS):
        k = j+1
        # Each factor is bounded on the entire cell by its monotone endpoints.
        nl, nh = 2*elo[k]*SCALE*N**4, 2*ehi[j]*SCALE*N**4
        dl, dh = N*polynomial(k, hi), N*left
        for h in range(4):
            lower[h] += nl // dl
            upper[h] += ceil_div(nh, dh)
            nl *= j*j
            nh *= k*k
            dl *= N*N
            dh *= N*N
        left = polynomial(k, lo)
    # At T>=64, T^(h-1/2)<=T^h, g>=a, e^(-64)<2^(-64).
    tails = [F(factorial(h), 2**64)/a * sum(F(64**i,factorial(i)) for i in range(h+1))
             for h in range(4)]
    return [F(z,SCALE) for z in lower], [F(z,SCALE)+t for z,t in zip(upper,tails)]


def abs_bounds(l,h):
    require(l <= h, 'unordered interval')
    return max(l,-h,0), max(abs(l),abs(h))


def residuals(ell, beta, ba, bb, elo, ehi):
    l,h = radial_moments(ell,beta,elo,ehi)
    al,ah = abs_bounds(l[1]-h[0],h[1]-l[0])
    vl,vh = abs_bounds(l[2]-2*h[1],h[2]-2*l[1])
    c0, c1, c2 = (1+ba)**2, -2*(1+ba)*ba, ba**2+bb**2/2
    require(min(c0,c1,c2) >= 0, 'q polynomial signs')
    penalty = (ba**2+bb**2)/ETA
    coeffs = [
        (c0*l[0]+c1*l[1]+c2*l[2]+penalty, c0*h[0]+c1*h[1]+c2*h[2]+penalty),
        (l[2]-2*h[1]+l[0]-ah**2/(1+l[0]), h[2]-2*l[1]+h[0]-al**2/(1+h[0])),
        ((l[3]-4*h[2]+4*l[1]-vh**2/(1+l[1]))/2, (h[3]-4*l[2]+4*h[1]-vl**2/(1+h[1]))/2),
        (l[1],h[1]), (l[2]/2,h[2]/2),
    ]
    return [(u-1/EPS,v-1/EPS) for u,v in coeffs]


def intercept(mu,ell,beta):
    return 2*mu*(ell-beta/2) + ETA*3*mu**2/64 + 2*beta**2/EPS


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--all-rows',action='store_true')
    args = parser.parse_args()
    require(4*MU_LO**2 < F(333,106) and F(355,113) < 4*MU_HI**2, 'pi bounds')
    rows_path = Path(__file__).resolve().parents[1] / 'degree5-attack' / 'rows2b.json'
    rows = json.loads(rows_path.read_text(), parse_float=F)['rows']
    selected = [(F(row['t']), row['row']) for row in rows if F(row['t']) >= F('.740')]
    require(len(selected) == len(set(t for t, _ in selected)) == 18, 'expected eighteen distinct rows')
    elo,ehi = exp_grid()
    for t_label, multipliers in selected:
        tag = f'{int(t_label * 1000):03d}'
        require(F(tag) / 1000 == t_label, 'row label precision')
        tag = '0.' + tag
        if tag not in ('0.845','0.860') and not args.all_rows:
            continue
        ell,beta,ba,bb = map(F, multipliers.split(','))
        bounds = residuals(ell,beta,ba,bb,elo,ehi)
        q,A,V,Z,B = bounds
        require(q[0]>F('1.27') and V[1]<F('-.29') and B[1]<F('-.32'), tag+' universal signs')
        require(A[1]<0 if F(tag)>=F('.845') else A[0]>0,tag+' A sign')
        require(Z[1]<0 if F(tag)>=F('.810') else Z[0]>0,tag+' Z sign')
        units = 100000
        pairs = [(int((u*units).__floor__()),int((v*units).__ceil__())) for u,v in bounds]
        print(f'{tag} residual enclosures in 1/{units}: {pairs}')
        if tag in ('0.845','0.860'):
            require(q[1]<F('1.431') and max(v for _,v in bounds[1:])<0,tag+' absorption')
            ends = (F('.81'),F('.86')) if tag=='0.845' else (F('.86'),MU_HI)
            margin = LIMIT-intercept(MU_HI,ell,beta)-max(t*t-2*ell*t for t in ends)-q[1]*F('.0006')
            minimum = F(1,100000) if tag=='0.845' else F(8,100000)
            require(margin>minimum,tag+' positive-u endpoint check')
            print(f'{tag} interval {ends}: margin > {minimum} at u <= 3/5000')
        if tag=='0.845':
            t = F('.81')
            lower = t*t-2*ell*t+intercept(MU_LO,ell,beta)+q[0]*F('.001')
            require(lower>LIMIT,'increased u must fail the .845 tangent test at .81')
    print('PASS')


if __name__=='__main__':
    main()
