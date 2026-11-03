#!/usr/bin/env python3
"""Replay centered ProfileRootScreen.evalRow on the three source blocks.

The generated JSON is exact external evidence, not a Lean proof. A Lean
certificate must bind these intervals to the actual production profile and
source panel blocks. Agent-ID: codex-aa04.
"""
from fractions import Fraction
from hashlib import sha256
from math import comb
from pathlib import Path
import argparse
import json
import re

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / 'data/q0_quadrature/source-profile-ratio/centered-blocks.json'
INPUTS = {
    'data/q0_quadrature/conditional_source/exception-selection.json': '2e60b2f6ed08495047f67709a7589ad8962d2abc73062a6e3c819c8888d147a0',
    'Grothe/UpperChaos/ProfileRootScreen.lean': '57df2f9ee89502a235691edb544b7a544dd69c07e67f842d3b22952baa1bde46',
    'GrotheCapsKernel/Basic.lean': 'd4a738a79075cd3742dada74bf7c51bc7adc6b246f13f2a7fdecf9192a5e9fb5',
    'GrotheKernel/HardyArc.lean': '0970820cdfd4c056b12952a0f9fe97cbdb374aa1a2666f483b0138b7ba17b610',
}
BLOCKS = ((146, 274), (557, 684), (964, 1087))
D = 2**128


def input_bytes(name):
    raw = (ROOT / name).read_bytes()
    if sha256(raw).hexdigest() != INPUTS[name]:
        raise ValueError(f'input hash mismatch: {name}')
    return raw


def floor(x):
    return x.numerator // x.denominator


def ceil(x):
    return -floor(-x)


def of_rat(x):
    return floor(x * D), ceil(x * D)


def add(a, b):
    return a[0] + b[0], a[1] + b[1]


def mul(a, b):
    products = [x * y for x in a for y in b]
    return min(products) // D, -((-max(products)) // D)


def pow_i(a, n):
    result = (D, D)
    for _ in range(n):
        result = mul(result, a)
    return result


def eval_row(lo, hi, coefficients):
    """Exact translation of rowOffset, shiftedCoeff and CI.horner's real part."""
    midpoint = (lo + hi) / 2
    radius = (hi - lo) / 2
    x = (floor(-radius * D), ceil(radius * D))
    center_i = of_rat(midpoint)
    shifted = []
    for j in range(12):
        result = (0, 0)
        for i in range(12 - j):
            k = i + j
            choose = comb(k, j) * D
            term = mul(mul(coefficients[k], (choose, choose)), pow_i(center_i, i))
            result = add(result, term)
        shifted.append(result)
    result = (0, 0)
    for c in reversed(shifted):
        result = add(c, mul(x, result))
    return result


def generate():
    selection = json.loads(input_bytes('data/q0_quadrature/conditional_source/exception-selection.json'))
    source = input_bytes('Grothe/UpperChaos/ProfileRootScreen.lean').decode()
    input_bytes('GrotheCapsKernel/Basic.lean')
    input_bytes('GrotheKernel/HardyArc.lean')
    body = source.split('def coeffs : List Ival := [', 1)[1].split(']', 1)[0]
    coefficients = [tuple(map(int, pair)) for pair in
                    re.findall(r'⟨(-?\d+),\s*(-?\d+)⟩', body)]
    if selection['precision_bits'] != 128 or len(coefficients) != 12 or \
            coefficients != [tuple(pair) for pair in selection['screen_coefficients']]:
        raise ValueError('selected screen does not match Lean profile coefficients')
    panels = selection['panels']
    result = []
    for first, last in BLOCKS:
        lo = Fraction(panels[first][0])
        hi = Fraction(panels[last][1])
        if not (Fraction(13) <= lo < hi):
            raise ValueError(f'invalid source block {first}–{last}')
        lower, upper = eval_row(lo, hi, coefficients)
        # |κ| < 1/(2*10^14), expressed as strict integer comparisons.
        if not (-D < lower * 2 * 10**14 and upper * 2 * 10**14 < D):
            raise ValueError(f'profile cap fails on block {first}–{last}')
        result.append({'first_panel': first, 'last_panel_inclusive': last,
                       'lo': str(lo), 'hi': str(hi),
                       'value_lo_scaled': str(lower), 'value_hi_scaled': str(upper)})
    document = {
        'schema': 1,
        'agent_id': 'codex-aa04',
        'status': 'EXACT_EXTERNAL_REPLAY_NOT_LEAN_VERIFIED',
        'source_sha256': INPUTS,
        'scale': str(D),
        'profile_quantity': 'sqrt(1+aQ^2) * vprof(s)',
        'strict_abs_profile_cap': '1/200000000000000',
        'blocks': result,
    }
    return (json.dumps(document, indent=2) + '\n').encode()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    generated = generate()
    if args.check:
        if OUT.read_bytes() != generated:
            raise ValueError(f'generated file differs: {OUT}')
    else:
        OUT.parent.mkdir(parents=True, exist_ok=True)
        OUT.write_bytes(generated)
    print(f'3 exact centered blocks, {len(generated)} bytes; Lean check pending')


if __name__ == '__main__':
    main()
