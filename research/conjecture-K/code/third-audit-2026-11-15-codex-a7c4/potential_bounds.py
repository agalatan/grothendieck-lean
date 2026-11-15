"""Exact compact certificates for sharper inverse-radius kernel bounds.

Agent-ID: codex-a7c4. Refs #400. Run with python3 -I.
Standard library only; no writes unless --write-result is given.
The analytic reduction and infinite-ray argument are in POTENTIAL.md.
"""
import argparse
from fractions import Fraction as Q
from math import comb, factorial
from pathlib import Path
import json

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')


def add(a, b):
    out = [Q(0)] * max(len(a), len(b))
    for i, v in enumerate(a):
        out[i] += v
    for i, v in enumerate(b):
        out[i] += v
    return out


def mul(a, b):
    out = [Q(0)] * (len(a) + len(b) - 1)
    for i, v in enumerate(a):
        for j, w in enumerate(b):
            out[i+j] += v*w
    return out


def scale(a, s):
    return [s*v for v in a]


def i0_upper(k, radius):
    """On [0,radius], upper polynomial via the geometric series tail."""
    rho = Q(radius)**2 / (4*(k+2)**2)
    assert 0 < rho < 1
    out = [Q(0)] * (2*k+3)
    for j in range(k+1):
        out[2*j] = Q(1, 4**j * factorial(j)**2)
    out[2*k+2] = Q(1, 4**(k+1)*factorial(k+1)**2)/(1-rho)
    return out


def exp_lower(n):
    return [Q(2**j, factorial(j)) for j in range(n+1)]


def bernstein(poly, left, right):
    n = len(poly)-1
    powers = [sum((poly[j]*comb(j,k)*left**(j-k)*(right-left)**k
                   for j in range(k,n+1)), Q(0)) for k in range(n+1)]
    return [sum((powers[k]*Q(comb(i,k),comb(n,k))
                 for k in range(i+1)), Q(0)) for i in range(n+1)]


def verify():
    C = Q(147,125)
    # 22/7-pi = integral_0^1 x^4(1-x)^4/(1+x^2) dx > 0.
    # Exact division: numerator = (x^2+1)*quotient - 4.
    quotient = [Q(4), Q(0), Q(-4), Q(0), Q(5), Q(-4), Q(1)]
    numerator = [Q(0)]*4 + [Q(1), Q(-4), Q(6), Q(-4), Q(1)]
    assert add(mul([Q(1),Q(0),Q(1)],quotient),[Q(-4)]) == numerator
    assert sum((v/Q(i+1) for i,v in enumerate(quotient)),Q(0)) == Q(22,7)
    # C^2 e^(2x) - 2*pi*x*I0(x)^2 > 0 on [0,1].
    I = i0_upper(4,1)
    P = add(scale(exp_lower(21),C*C), [Q(0)]+scale(mul(I,I),-Q(44,7)))
    cells = [(Q(0),Q(1,2)),(Q(1,2),Q(3,4)),(Q(3,4),Q(1))]
    mins = [min(bernstein(P,l,r)) for l,r in cells]
    assert all(v>0 for v in mins)
    assert cells[0][0]==0 and cells[-1][1]==1
    assert all(a[1]==b[0] for a,b in zip(cells,cells[1:]))
    # (x+1/5)^2 e^(2x) - 2*pi*x^3*I0(x)^2 > 0 on [1,3].
    c = Q(1,5)
    I = i0_upper(10,3)
    P = add(mul([c*c,2*c,Q(1)],exp_lower(42)),
            [Q(0)]*3+scale(mul(I,I),-Q(44,7)))
    ray_min = min(bernstein(P,Q(1),Q(3)))
    assert ray_min>Q(9,20)
    assert C<1+c
    # L(1+c/x) = ((1-8c)x+9c)/(4x^3) <= 0 for x>=3.
    assert 1-8*c<0 and (1-8*c)*3+9*c==0
    # Revised far-radius cutoff F=(38/25)*dmax.
    assert (C-1)*Q(38,25)**2 > 2*c
    # Rounding m down increases the disk majorant on 0<=m<=17*z/20.
    assert C*C*(1+Q(17,20)**2) > Q(1773,1000)**2*Q(17,20)**2
    return {'agent_id':'codex-a7c4','status':'PASS',
            'constant_cap':str(C),'far_field_x_coefficient':str(c),
            'far_field_w_over_r2_coefficient':str(2*c),
            'constant_cells':[[str(l),str(r)] for l,r in cells],
            'constant_bernstein_minima':[str(v) for v in mins],
            'far_field_compact_interval':['1','3'],
            'far_field_bernstein_minimum':str(ray_min),
            'far_field_infinite_ray_start':'3',
            'new_disk_far_factor':'38/25',
            'scope':'Exact polynomial premises only; analytic kernel and infinite-ray proofs are in POTENTIAL.md.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result', action='store_true')
    args = parser.parse_args()
    result = verify()
    data = json.dumps(result,indent=2)+'\n'
    if args.write_result:
        Path(__file__).with_name('potential_bounds_result.json').write_text(data)
    print(data,end='')


if __name__=='__main__':
    main()
