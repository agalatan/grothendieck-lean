#!/usr/bin/env python3
"""Independently validate every cached polar Gaussian moment with Arb.

The archived full-circle majorizer uses binary-float interval endpoints.
They are interpreted here as exact dyadic rationals, not decimal guesses.
Requires python-flint==0.9.0; no cached moment enclosure is assumed true.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import time

from flint import arb, ctx

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_abstract_response_support import ball


def tail(r, degree):
    e = (-r*r).exp()
    values = [e, arb.pi().sqrt()*r.erfc()/2+r*e]
    for k in range(2, degree+1):
        values.append(k*values[k-2]/2+r**k*e)
    return values[:degree+1]


def check_interval(value, endpoints, label):
    lo, hi = map(lambda x: ball(Q(x)), endpoints)
    if not lo <= value <= hi:
        raise ArithmeticError('Cached moment was not independently enclosed: '+label+
                              ' value='+str(value)+' interval='+str(endpoints))


def verify_cache(path, precision_bits=512):
    start = time.monotonic()
    ctx.prec = precision_bits
    data = json.loads(path.read_text())
    nr, nt = data['NR'], data['NQ']
    if nr <= 0 or nt <= 0 or len(data['rad']) != nr or len(data['ang']) != nt:
        raise ValueError('Invalid cache dimensions')
    degree = len(data['tail'])-1
    if degree != 12 or any(len(row) != 13 for row in data['rad']) or any(
            len(row) != 9 for row in data['ang']):
        raise ValueError('The majorizer requires radial degrees 0..12 and harmonics 0..4')
    tails = [tail(arb(8)*i/nr, degree) for i in range(nr+1)]
    count = 0
    for i in range(nr):
        for k in range(degree+1):
            check_interval(tails[i][k]-tails[i+1][k], data['rad'][i][k], f'rad[{i},{k}]')
            count += 1
    for k in range(degree+1):
        check_interval(tails[-1][k], data['tail'][k], f'tail[{k}]')
        count += 1
    for j in range(nt):
        values = [arb(1)/nt]
        for k in range(1, 5):
            lo, hi = arb(2*k)*j/nt, arb(2*k)*(j+1)/nt
            values.append((hi.sin_pi()-lo.sin_pi())/(2*arb.pi()*k))
        for k in range(1, 5):
            lo, hi = arb(2*k)*j/nt, arb(2*k)*(j+1)/nt
            values.append((lo.cos_pi()-hi.cos_pi())/(2*arb.pi()*k))
        for k, value in enumerate(values):
            check_interval(value, data['ang'][j][k], f'ang[{j},{k}]')
            count += 1
    return {'status': 'PASS', 'independently_checked_intervals': count,
                     'radial_cells': nr, 'phase_cells': nt, 'precision_bits': ctx.prec,
                     'sha256': hashlib.sha256(path.read_bytes()).hexdigest(),
                     'seconds': time.monotonic()-start}


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('moments', type=Path)
    p.add_argument('--precision-bits', type=int, default=512)
    args = p.parse_args()
    print(json.dumps(verify_cache(args.moments, args.precision_bits), indent=2))


if __name__ == '__main__':
    main()
