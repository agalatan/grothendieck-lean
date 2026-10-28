#!/usr/bin/env python3
"""Exact preflight of exported Horner witnesses, Agent-ID: codex-aa04.

This mirrors the *specification* of the Lean checker, independently of the
generator's rounding operations. It is diagnostic only; acceptance in Lean is
still required. A mutated addition witness must be rejected as a negative control.
"""
import argparse
import copy
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path


def poly(m):
    return {(i, j): int(c) for i, j, c in m['coefficients']}


def remainder(m):
    d = 1 << m['bits']
    return tuple(Q(int(v), d) for v in m['remainder'])


def poly_range(m):
    p = poly(m)
    c = p.pop((0, 0), 0)
    radius = sum(abs(v) for v in p.values())
    d = 1 << m['bits']
    return Q(c - radius, d), Q(c + radius, d)


def add_interval(a, b):
    return a[0] + b[0], a[1] + b[1]


def mul_interval(a, b):
    values = [x * y for x in a for y in b]
    return min(values), max(values)


def subset(a, b):
    return b[0] <= a[0] and a[1] <= b[1]


def mul_ok(a, b, out, budget):
    assert a['bits'] == b['bits'] == out['bits']
    d = 1 << a['bits']
    raw = {}
    for (i, j), x in poly(a).items():
        for (k, l), y in poly(b).items():
            key = i + k, j + l
            raw[key] = raw.get(key, 0) + x * y
    for key, value in poly(out).items():
        raw[key] = raw.get(key, 0) - value * d
    residual = Q(sum(abs(v) for v in raw.values()), d * d)
    budget = abs(Q(budget))
    R = (-budget, budget)
    for term in [mul_interval(remainder(a), poly_range(b)),
                 mul_interval(remainder(b), poly_range(a)),
                 mul_interval(remainder(a), remainder(b))]:
        R = add_interval(R, term)
    return residual <= budget and subset(R, remainder(out))


def add_ok(a, b, out, budget):
    assert a['bits'] == b['bits'] == out['bits']
    raw = poly(a)
    for key, value in poly(b).items():
        raw[key] = raw.get(key, 0) + value
    for key, value in poly(out).items():
        raw[key] = raw.get(key, 0) - value
    residual = Q(sum(abs(v) for v in raw.values()), 1 << out['bits'])
    budget = abs(Q(budget))
    R = add_interval(add_interval(remainder(a), remainder(b)), (-budget, budget))
    return residual <= budget and subset(R, remainder(out))


def check(record):
    if len(record['inputs']) != len(record['steps']):
        return False
    acc = {'bits': record['variable']['bits'], 'coefficients': [], 'remainder': ['0', '0']}
    for a, step in reversed(list(zip(record['inputs'], record['steps']))):
        if not mul_ok(acc, record['variable'], step['product'], step['mulBudget']):
            return False
        if not add_ok(step['product'], a, step['result'], step['addBudget']):
            return False
        acc = step['result']
    return poly(acc) == poly(record['output']) and remainder(acc) == remainder(record['output'])


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', type=Path)
    parser.add_argument('output', type=Path)
    args = parser.parse_args()
    raw = args.input.read_bytes()
    data = json.loads(raw)
    for i, record in enumerate(data['records']):
        if not check(record):
            raise SystemExit(f'exact preflight rejected Horner record {i}')
    bad = copy.deepcopy(data['records'][0])
    bad['steps'][0]['result']['coefficients'][0][2] = str(
        int(bad['steps'][0]['result']['coefficients'][0][2]) + 1)
    if check(bad):
        raise SystemExit('negative control was incorrectly accepted')
    result = {'status': 'exact external preflight passed; Lean replay still required',
              'sha256': hashlib.sha256(raw).hexdigest(),
              'records': len(data['records']),
              'products': sum(len(r['steps']) for r in data['records']),
              'sums': sum(len(r['steps']) for r in data['records']),
              'mutatedAdditionRejected': True}
    args.output.write_text(json.dumps(result, indent=2) + '\n')
    print(json.dumps(result))


if __name__ == '__main__':
    main()
