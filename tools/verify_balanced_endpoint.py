#!/usr/bin/env python3
"""Arb monotone-rectangle upper certificate for E(conj(f)g).

For proper independent Gaussians Z,G and H=Z(|Z|^2-2)/sqrt(2), set
f=phase(Z+cH+cG), g=phase(Z+cH-cG), 0<c<1/sqrt(2).
Write R=|Z|^2,T=|G|^2, u=R*(1/c+(R-2)/sqrt(2))^2,
d=(u-T)/(u+T). The angular mean is C(d)=d/AGM(1,|d|).
It increases in d: before angular integration its derivative is
sin(theta)^2/(sin(theta)^2+d^2*cos(theta)^2)^(3/2)>=0.
Also u increases with R, decreases with c; d decreases with T.
Hence the smallest supplied c bounds all the supplied profiles above.

An n by n exponential-quantile grid has cell masses exactly 1/n^2.
Exclude the last R-bin and the first T-bin, bounding their union by 1
with exact mass 2/n-1/n^2. In each remaining cell evaluate the upper
R/lower T corner. Two AGM steps have g2<=AGM<=a2. Thus C(d)<=d/g2
for d>0, C(d)<=d/a2 for d<0. If the Arb sign is unclear use 1.
All logs, square roots, and sums are Arb interval operations. There is
no numerical quadrature error, truncation, or unbounded-cell omission.
The analytic monotonicity and Gaussian/angular identities are paper
arguments explicitly displayed here, not completed Lean formalization.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import time

from flint import arb, ctx


def ball(q):
    q = Q(q)
    return arb(q.numerator)/q.denominator


def rational_upper(value, denominator=10**12):
    q = Q(str(value.upper().fmpq()))
    return Q(-((-q.numerator*denominator)//q.denominator), denominator)


def verify(data):
    started = time.monotonic()
    n, precision = data['n'], data.get('precision_bits', 128)
    if type(n) is not int or n < 16:
        raise ValueError('An integer quantile-grid size >=16 is required')
    if type(precision) is not int or precision < 96:
        raise ValueError('At least 96 bits are required')
    ctx.prec = precision
    profiles = data['profiles']
    if not profiles:
        raise ValueError('At least one balanced rational profile is required')
    cs = []
    for profile in profiles:
        c, b = Q(profile['c']), Q(profile['b'])
        if not c == b or c <= 0 or not ball(c)*arb(2).sqrt() < 1:
            raise ValueError('Each balanced profile requires 0<c=b<1/sqrt(2)')
        cs.append(c)
    c = min(cs)
    root2 = arb(2).sqrt()
    # q[i-1] is exactly -log(1-i/n), enclosed by Arb.
    quantiles = [-(ball(Q(n-i, n))).log() for i in range(1, n)]
    us = [r*(1/ball(c)+(r-2)/root2)**2 for r in quantiles]
    total, ambiguous = arb(0), 0
    for u in us:
        row = arb(0)
        for t in quantiles:
            d = (u-t)/(u+t)
            if d > 0:
                a, g = arb(1), d
                for _ in range(2):
                    a, g = (a+g)/2, (a*g).sqrt()
                value = d/g
            elif d < 0:
                a, g = arb(1), -d
                for _ in range(2):
                    a, g = (a+g)/2, (a*g).sqrt()
                value = d/a
            else:
                value = arb(1)
                ambiguous += 1
            if not value.is_finite():
                raise ArithmeticError('A corner bound was not finite')
            row += value
        total += row
    boundary_mass = Q(2, n)-Q(1, n*n)
    upper = total/(n*n)+ball(boundary_mass)
    requested = Q(data['endpoint_cap'])
    if not upper < ball(requested):
        raise ArithmeticError('The requested endpoint cap was not proved: '+str(upper))
    rounded = rational_upper(upper)
    return {'status': 'PASS', 'profiles': profiles, 'maximizing_c': str(c),
            'n': n, 'precision_bits': precision, 'interior_cells': (n-1)**2,
            'boundary_union_mass': str(boundary_mass),
            'ambiguous_corner_signs_bounded_by_one': ambiguous,
            'sum_upper_ball': str(upper), 'endpoint_upper_rational': str(rounded),
            'endpoint_upper_float': float(rounded),
            'requested_strict_endpoint_cap': str(requested),
            'seconds': time.monotonic()-started,
            'proof_status': __doc__}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('certificate', type=Path)
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    result = verify(json.loads(args.certificate.read_text()))
    result['input_sha256'] = hashlib.sha256(args.certificate.read_bytes()).hexdigest()
    result['verifier_sha256'] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    text = json.dumps(result, indent=2)+'\n'
    if args.out:
        args.out.write_text(text)
    print(text, end='')


if __name__ == '__main__':
    main()
