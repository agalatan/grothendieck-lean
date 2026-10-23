#!/usr/bin/env python3
"""Negative controls for source binding, scalar coverage and cached integrals."""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import tempfile
from types import SimpleNamespace

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_joint_fibre_upper import line_cover
from verify_joint_fibre_moments import verify_cache
from verify_abstract_response_support import read_sources
from verify_joint_fibre_response import joint_source
from joint_fibre_majorizer import piece_quadratic_multi


def rejects(fn):
    try:
        fn()
    except (ValueError, ArithmeticError):
        return
    raise ArithmeticError('A corrupted or incomplete certificate was accepted')


def paired_majorizer_identity():
    """Exact four-variable polynomial proof of the paired-price SOS identity.

    For S=A+B, D=A-B, d=a-b and G=(a-A)^2/(2A)+(b-B)^2/(2B),
      4AB[2S(S²+d²+2Dd)G-e²]
      = [(S²+Dd)(a+b-S)-S(D+d)(d-D)]²,
    where e=a²-b²-A²+B². The triangle inequality |d|<=2R then gives
    the arbitrary-positive-price majorizer used by the integrator.
    """
    def add(*items):
        out = {}
        for p in items:
            for key, value in p.items():
                out[key] = out.get(key, 0)+value
        return {key: value for key, value in out.items() if value}
    def mul(*items):
        out = {(0, 0, 0, 0): 1}
        for p in items:
            result = {}
            for k, x in out.items():
                for l, y in p.items():
                    key = tuple(a+b for a, b in zip(k, l))
                    result[key] = result.get(key, 0)+x*y
            out = result
        return out
    def scale(p, c):
        return {key: c*value for key, value in p.items()}
    def sq(p):
        return mul(p, p)
    variables = [{tuple(int(i == j) for i in range(4)): 1} for j in range(4)]
    A, B, a, b = variables
    S, D, d = add(A, B), add(A, scale(B, -1)), add(a, scale(b, -1))
    dt, dd = add(a, b, scale(S, -1)), add(d, scale(D, -1))
    e = add(sq(a), scale(sq(b), -1), scale(sq(A), -1), sq(B))
    T = add(sq(S), sq(d), scale(mul(D, d), 2))
    numerator = add(mul(B, sq(add(a, scale(A, -1)))),
                    mul(A, sq(add(b, scale(B, -1)))))
    rhs = sq(add(mul(add(sq(S), mul(D, d)), dt),
                 scale(mul(S, add(D, d), dd), -1)))
    difference = add(scale(mul(S, T, numerator), 4),
                     scale(mul(A, B, sq(e)), -4), scale(rhs, -1))
    if difference:
        raise ArithmeticError('Arbitrary-price paired-majorizer SOS identity failed')


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--certificate', type=Path, required=True)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--law', type=Path, required=True)
    p.add_argument('--profiles', type=Path, required=True)
    p.add_argument('--moments', type=Path, default=Path(__file__).with_name('joint_fibre_moments_1600_256.json'))
    a = p.parse_args()
    count = 0
    paired_majorizer_identity()
    count += 1
    for good in [[(None, Q(0)), (Q(0), None)], [(None, None)],
                 [(Q(-1), Q(1)), (None, Q(0)), (Q(1), None)]]:
        line_cover(good)
        count += 1
    for bad in [[], [(Q(0), None)], [(None, Q(0))],
                [(None, Q(0)), (Q(1, 1000000), None)]]:
        rejects(lambda bad=bad: line_cover(bad))
        count += 1
    data = json.loads(a.certificate.read_text())
    # The majorizer is a polynomial in y=m+s*a, but Bessel restricts m.
    # With Q=qI, H=0 and eta=1, the valid addition is 1-m^T Q²m.
    # Subtracting Q² from H instead adds 1-(m+s*a)^T Q²(m+s*a).
    # Its advertised global cap is negative in both examples, even though
    # the original quadratic is zero at the feasible point m=0.
    for q, radius in [(Q(1), Q(2)), (Q(2), Q(1))]:
        ident = [[Q(int(i == j)) for j in range(12)] for i in range(12)]
        original_q = [[q*x for x in row] for row in ident]
        effective_q = [[(q+q*q)*x for x in row] for row in ident]
        zero = [[Q(0)]*12 for _ in range(12)]
        shifted_h = [[-q*q*x for x in row] for row in ident]
        direction, h = [Q(1)]+[Q(0)]*11, [Q(0)]*12
        correct = piece_quadratic_multi(effective_q, direction, Q(1), h, zero, [])
        wrong = piece_quadratic_multi(original_q, direction, Q(1), h, shifted_h, [])
        cap = lambda r: r[0]+r[1]*radius+r[2]*radius*radius
        if correct is None or wrong is None or cap(correct) != 1 or not cap(wrong) < 0:
            raise ArithmeticError('Bessel multiplier translation regression failed')
        count += 1
    law = json.loads(a.law.read_text())
    joint_source(data, data['target'], law, a.profiles)
    count += 1
    with tempfile.TemporaryDirectory() as folder:
        path = Path(folder)/'corrupt.json'
        for field in ['target', 'support', 'audit_sha256', 'law_sha256']:
            copy = json.loads(json.dumps(data))
            if field == 'target':
                copy[field]['tau'] = '0'
            elif field == 'support':
                copy[field][0]['v'] = '0'
            else:
                copy[field] = '0'*64
            path.write_text(json.dumps(copy))
            rejects(lambda: read_sources(SimpleNamespace(certificate=path, audit=a.audit, law=a.law)))
            count += 1
        target = json.loads(json.dumps(data['target']))
        target['gate_alpha'][0] = str(Q(target['gate_alpha'][0])+1)
        rejects(lambda: joint_source(data, target, law, a.profiles))
        count += 1
        for field in ['price', 'epsilon']:
            changed = json.loads(json.dumps(law))
            if field == 'price':
                changed['row_parameters']['price'] = str(Q(changed['row_parameters']['price'])+1)
            else:
                changed['witness_epsilon'] = '0'
            rejects(lambda changed=changed: joint_source(data, data['target'], changed, a.profiles))
            count += 1
        changed = json.loads(a.profiles.read_text())
        changed[int(data['source_row_weights'][0][0])]['eps'] = '0'
        path.write_text(json.dumps(changed))
        rebound = json.loads(json.dumps(data))
        rebound['profiles_sha256'] = hashlib.sha256(path.read_bytes()).hexdigest()
        rejects(lambda: joint_source(rebound, data['target'], law, path))
        count += 1
        moments = json.loads(a.moments.read_text())
        moments['rad'][0][0] = [0.0, 0.0]
        path.write_text(json.dumps(moments))
        rejects(lambda: verify_cache(path))
        count += 1
    print(json.dumps({'status': 'PASS', 'controls': count,
        'checks': ['exact whole-line coverage', 'uncovered tails', 'microscopic gap',
                   'target and law binding', 'source hashes', 'false cached integral',
                   'Bessel multiplier uses unshifted m', 'exact gate minimizer and Schur price',
                   'witness and source profile epsilon consistency',
                   'arbitrary-positive-price paired-majorizer polynomial SOS']}, indent=2))


if __name__ == '__main__':
    main()
