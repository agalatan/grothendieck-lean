#!/usr/bin/env python3
"""Shared j=0 kernel candidate arithmetic; not a Lean proof or domain cover.

Direct formulas are the actual existing Lean base-kernel identities. The
reciprocal chart uses x=1/u and includes the Jacobian x^-2 after symbolic
cancellation. Its production binding is a separate Lean obligation. Candidate
scalar exponentials and every generated reserve require Lean replay.
Agent-ID: codex-aa04.
"""
from fractions import Fraction as Q
from functools import lru_cache
import hashlib
import json
import os
from pathlib import Path
import time

import rectangle_probe as rp

ROOT = Path(__file__).resolve().parents[2]
RECIPE = ROOT / 'data/q0_quadrature/base-pair-recipe.json'


@lru_cache(maxsize=16384)
def _profile_cached(coefficients, denominator, slo, shi, degree, bits):
    return _profile_uncached(coefficients, denominator, slo, shi, degree, bits)


def _profile_uncached(coefficients, denominator, slo, shi, degree, bits):
    s = rp.coordinate(slo, shi, 0, degree, bits)
    return rp.horner(coefficients, s,
                     lambda pair: rp.Model.from_interval(rp.Interval.rational(
                         Q(int(pair[0]), denominator), Q(int(pair[1]), denominator), bits), degree))


def profile_model(source, sbox, degree, bits):
    # This cache changes no arithmetic. Transcript generation must still run
    # Horner so that every step is emitted, rather than reuse a cached result.
    coefficients = tuple(tuple(pair) for pair in source['profileCoefficients'])
    build = _profile_cached if rp.HORNER_RECORDS is None else _profile_uncached
    return build(coefficients, int(source['profileDen']), *map(Q, sbox), degree, bits)


def exp_model(argument, policy):
    if policy == 'taylor':
        return argument.exp()
    if policy != 'best':
        raise ValueError('unknown exponential policy')
    before = dict(rp.EXP_REQUESTS)
    upper = Q(argument.range().hi, argument.unit)
    interval_model = None
    if upper <= 0:
        scalar = rp.exp_rational(upper, argument.bits)
        bound = rp.Interval(0, scalar.hi+2, argument.bits)
        interval_model = rp.Model.from_interval(bound, argument.degree)
    try:
        taylor_model = argument.exp()
    except ValueError:
        if interval_model is None:
            raise
        taylor_model = None
    if interval_model is not None and (taylor_model is None or
            interval_model.rem.hi-interval_model.rem.lo < taylor_model.rem.hi-taylor_model.rem.lo):
        rp.EXP_REQUESTS.clear()
        rp.EXP_REQUESTS.update(before)
        rp.EXP_REQUESTS[str(upper)] = {'input': str(upper), 'lo': '0',
            'hi': str(Q(scalar.hi+2, argument.unit)),
            'status': 'LeanCert upper bound and RectangleExpCertificate.upper_model required'}
        return interval_model
    return taylor_model


def pair_models(source, cell, degree, bits, eta):
    s = rp.coordinate(*map(Q, cell['s']), 0, degree, bits)
    aux = rp.coordinate(*map(Q, cell['aux']), 1, degree, bits)
    const = lambda q: rp.Model.constant(q, degree, bits)
    k = profile_model(source, cell['s'], degree, bits)
    aux2 = aux * aux
    exponential = lambda arg: exp_model(arg, cell.get('exp_policy', 'taylor'))
    if cell['chart'] == 'direct':
        inverse = (const(1) + k * k * aux2).inverse()
        argument = aux2 * s * inverse
        damping = exponential(aux2.scale(-eta**2))
        gaussian = exponential(s.scale(-1) + argument.scale(-1))
        common = damping * gaussian * inverse * inverse
    elif cell['chart'] == 'reciprocal':
        if Q(cell['aux'][0]) <= 0:
            raise ValueError('reciprocal chart requires positive x')
        inverse = (aux2 + k * k).inverse()
        argument = s * inverse
        gaussian = exponential(s.scale(-1) + argument.scale(-1))
        if cell.get('damping', 'model') == 'reserve':
            remaining = gaussian * inverse * inverse
            # ReciprocalDamping.weighted_error, combined with a range bound
            # on A = exp(-s-s/D)/D^2. No inverse x is evaluated here.
            common = (aux2 * remaining).inflate(eta**2 * remaining.range().max_abs())
        else:
            damping = exponential(aux2.inverse().scale(-eta**2))
            common = aux2 * damping * gaussian * inverse * inverse
    else:
        raise ValueError('unknown auxiliary chart')
    first = s.scale(2) * common
    # Preserve the sign of the entire companion numerator before enclosure.
    second = k.scale(2) * (const(1) + argument.scale(-1)) * common
    return first, second


def main():
    recipe_raw = RECIPE.read_bytes()
    recipe = json.loads(recipe_raw)
    source_raw = (ROOT / recipe['profile_input']).read_bytes()
    source = json.loads(source_raw)
    outdir = Path(os.environ.get('OUT', ROOT / 'handoff/codex-aa04-q0-quadrature'))
    outdir.mkdir(parents=True, exist_ok=True)
    rp.HORNER_RECORDS = None
    results = []
    for degree in recipe['degrees']:
        for cell in recipe['cells']:
            start = time.monotonic()
            rp.EXP_REQUESTS.clear()
            entry = {'degree': degree, 'bits': recipe['bits'], 'cell': cell}
            try:
                pair = pair_models(source, cell, degree, recipe['bits'], Q(recipe['eta']))
                hs = (Q(cell['s'][1]) - Q(cell['s'][0])) / 2
                hu = (Q(cell['aux'][1]) - Q(cell['aux'][0])) / 2
                entry['models'] = [rp.model_json(m) for m in pair]
                entry['integrals'] = []
                for m in pair:
                    lo, hi = m.integral(hs, hu)
                    assert lo <= hi
                    entry['integrals'].append({'lo': str(lo), 'hi': str(hi),
                        'width': str(hi-lo), 'width_float': float(hi-lo),
                        'midpoint_float': float((lo+hi)/2)})
                entry['scalar_exp_requests'] = dict(rp.EXP_REQUESTS)
                entry['status'] = 'candidate only; Lean replay and production binding required'
            except ValueError as err:
                entry['status'] = 'model construction rejected'
                entry['reason'] = str(err)
            entry['seconds'] = time.monotonic()-start
            results.append(entry)
            print(json.dumps({k:v for k,v in entry.items()
                              if k not in ('models', 'scalar_exp_requests')}), flush=True)
    result = {'agent': 'codex-aa04', 'status': 'diagnostic; not a Lean certificate',
        'normalization': 'outer 1/sqrt(pi) excluded; reciprocal Jacobian included',
        'recipe_sha256': hashlib.sha256(recipe_raw).hexdigest(),
        'profile_input_sha256': hashlib.sha256(source_raw).hexdigest(),
        'results': results}
    (outdir/'base-pair-models.json').write_text(json.dumps(result, indent=2)+'\n')


if __name__ == '__main__':
    main()
