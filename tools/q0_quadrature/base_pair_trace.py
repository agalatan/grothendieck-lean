#!/usr/bin/env python3
"""Discover deterministic j=0 pair witnesses for independent Lean replay.

The transcript records the arithmetic of base_pair_probe.pair_models, including
the actual profile Horner leaves, reciprocal/exp certificates, scalar requests,
and the signed final assembly. Discovery and exact reproduction are NOT Lean
proofs. No scalar exponential or analytic reserve is trusted by this script.
Agent-ID: codex-aa04.
"""
from __future__ import annotations

import argparse
from fractions import Fraction as Q
import hashlib
import json
import math
from pathlib import Path

import base_pair_probe as bp
import rectangle_probe as rp

ROOT = Path(__file__).resolve().parents[2]
SOURCE = ROOT / 'data/q0_quadrature/source-polynomial.json'
OUTPUT = ROOT / 'data/q0_quadrature/base-pair-leaf-pilot-trace.json'
PILOTS = [
    {'chart': 'direct', 's': ['1', '1001/1000'], 'aux': ['1', '1001/1000']},
    {'chart': 'reciprocal', 's': ['1', '1001/1000'],
     'aux': ['1/2', '501/1000'], 'damping': 'reserve'},
]


def ceil_dyadic(q, bits):
    q = Q(q)
    unit = 1 << bits
    return Q(rp.ceildiv(q.numerator * unit, q.denominator), unit)


def same_model(a, b):
    """Horner IDs are transcript metadata, not part of the arithmetic model."""
    return (a.coeff, a.rem, a.degree, a.product_budget) == (
        b.coeff, b.rem, b.degree, b.product_budget)


class Recorder:
    def __init__(self, degree, bits):
        self.degree, self.bits = degree, bits
        self.models = {}
        self.operations = []
        self.reciprocals = []
        self.exponentials = []

    def put(self, name, value):
        if name in self.models:
            raise ValueError(f'duplicate node {name}')
        self.models[name] = value
        return value

    def event(self, op, inputs, output, scope='top', **fields):
        self.operations.append(dict(op=op, inputs=inputs, output=output,
                                    scope=scope, **fields))

    def constant(self, name, value):
        self.put(name, rp.Model.constant(value, self.degree, self.bits))
        self.event('constant', [], name, scalar=str(Q(value)), budget='0')
        return name

    def add(self, name, left, right, scope='top'):
        self.put(name, self.models[left] + self.models[right])
        self.event('add', [left, right], name, scope, budget='0')
        return name

    def mul(self, name, left, right, scope='top'):
        value = self.put(name, self.models[left] * self.models[right])
        self.event('mul', [left, right], name, scope, budget=str(value.product_budget))
        return name

    def scale(self, name, source, scalar, scope='top'):
        value = self.put(name, self.models[source].scale(scalar))
        self.event('scale', [source], name, scope, scalar=str(Q(scalar)),
                   budget=str(value.product_budget))
        return name

    def inflate(self, name, source, radius, scope='top'):
        self.put(name, self.models[source].inflate(radius))
        self.event('inflate', [source], name, scope, radius=str(Q(radius)),
                   error=str(ceil_dyadic(radius, self.bits)), budget='0')
        return name

    def horner(self, name, values, variable, leaf):
        if rp.HORNER_RECORDS is None:
            raise RuntimeError('Horner capture was disabled')
        before = len(rp.HORNER_RECORDS)
        value = self.put(name, rp.horner(values, self.models[variable], leaf))
        if len(rp.HORNER_RECORDS) != before + 1:
            raise RuntimeError('unexpected nested Horner capture')
        return value, rp.HORNER_RECORDS[-1]

    def inverse(self, name, input_name):
        source = self.models[input_name]
        center = Q(source.coeff.get((0, 0), 0), source.unit)
        if center <= 0:
            raise ValueError('the reciprocal certificate requires a positive center')
        scaled = self.scale(name + 'Scaled', input_name, 1 / center, name)
        self.put(name + 'MinusOne', source.one().scale(-1))
        self.event('constant', [], name + 'MinusOne', name, scalar='-1', budget='0')
        delta = self.add(name + 'Delta', scaled, name + 'MinusOne', name)
        radius = self.models[delta].range().max_abs()
        if radius >= 1:
            raise rp.ModelConstructionError('reciprocal relative radius is not below one', radius)
        argument = self.scale(name + 'Argument', delta, -1, name)
        _, trace = self.horner(name + 'Series', [1] * (self.degree + 1), argument,
            lambda c: rp.Model.constant(c, self.degree, self.bits))
        geometric = self.scale(name + 'Geometric', name + 'Series', 1 / center, name)
        analytic = abs(1 / center) * radius ** (self.degree + 1) / (1 - radius)
        error = ceil_dyadic(analytic, self.bits)
        self.inflate(name, geometric, analytic, name)
        certificate = dict(input=input_name, center=str(center), radius=str(radius),
            error=str(error), terms=self.degree + 1, scaled=scaled, delta=delta,
            argument=argument, geometric=geometric, output=name, trace=trace,
            scaledBudget=str(self.models[scaled].product_budget),
            argumentBudget=str(self.models[argument].product_budget),
            geometricBudget=str(self.models[geometric].product_budget))
        index = len(self.reciprocals)
        self.reciprocals.append(certificate)
        self.event('inverse', [input_name], name, certificate=index)
        return name

    def exponential(self, name, input_name, policy='taylor'):
        if policy == 'taylor':
            return self.taylor_exponential(name, input_name)
        if policy != 'best':
            raise ValueError(f'unknown exponential policy: {policy}')
        source = self.models[input_name]
        # Let the original chooser select its exact arithmetic branch, without
        # retaining speculative Taylor Horner steps or scalar requests. Only
        # the selected proof obligation enters the public transcript.
        old_records, old_requests = rp.HORNER_RECORDS, dict(rp.EXP_REQUESTS)
        rp.HORNER_RECORDS = None
        rp.EXP_REQUESTS.clear()
        try:
            selected = bp.exp_model(source, policy)
            selected_requests = dict(rp.EXP_REQUESTS)
        finally:
            rp.HORNER_RECORDS = old_records
            rp.EXP_REQUESTS.clear()
            rp.EXP_REQUESTS.update(old_requests)
        upper_requests = [r for r in selected_requests.values()
            if r['status'] == 'LeanCert upper bound and RectangleExpCertificate.upper_model required']
        if not upper_requests:
            self.taylor_exponential(name, input_name)
            if not same_model(self.models[name], selected):
                raise AssertionError('selected Taylor exponential differs from exp_model')
            return name
        if len(upper_requests) != 1 or len(selected_requests) != 1:
            raise AssertionError('unexpected monotone exponential requests')
        scalar_request = upper_requests[0]
        upper = Q(source.range().hi, source.unit)
        if Q(scalar_request['input']) != upper or Q(scalar_request['lo']) != 0:
            raise AssertionError('monotone exponential request does not match argument range')
        scalar_interval = dict(lo=scalar_request['lo'], hi=scalar_request['hi'])
        value = rp.Model.from_interval(rp.Interval.rational(
            Q(scalar_interval['lo']), Q(scalar_interval['hi']), self.bits), self.degree)
        if not same_model(value, selected):
            raise AssertionError('monotone exponential interval differs from exp_model')
        self.put(name, value)
        rp.EXP_REQUESTS[str(upper)] = scalar_request
        certificate = dict(kind='upper', input=input_name, upper=str(upper),
            scalarInterval=scalar_interval,
            centerApprox=str(Q(value.coeff.get((0, 0), 0), source.unit)),
            output=name, budget='0', scalarRequest=scalar_request)
        index = len(self.exponentials)
        self.exponentials.append(certificate)
        self.event('expUpper', [input_name], name, certificate=index)
        return name

    def taylor_exponential(self, name, input_name):
        source = self.models[input_name]
        center = Q(source.coeff.get((0, 0), 0), source.unit)
        self.put(name + 'Shift', source.one().scale(-center))
        self.event('constant', [], name + 'Shift', name, scalar=str(-center), budget='0')
        delta = self.add(name + 'Delta', input_name, name + 'Shift', name)
        radius = self.models[delta].range().max_abs()
        factorial = math.factorial(self.degree)
        coefficients = [factorial // math.factorial(n) for n in range(self.degree + 1)]
        _, trace = self.horner(name + 'IntegerSeries', coefficients, delta,
            lambda c: rp.Model.constant(c, self.degree, self.bits))
        series = self.scale(name + 'Series', name + 'IntegerSeries', Q(1, factorial), name)
        ceil_radius = rp.ceildiv(radius.numerator, radius.denominator)
        if ceil_radius > 1024:
            raise rp.ModelConstructionError('exponential variation requires a smaller rectangle',
                                            Q(ceil_radius, 1024))
        analytic = 3 ** (ceil_radius + 1) * radius ** (self.degree + 1) / math.factorial(self.degree + 1)
        error = ceil_dyadic(analytic, self.bits)
        centered = self.inflate(name + 'Centered', series, analytic, name)
        scalar = rp.exp_rational(center, self.bits)
        if center:
            scalar = rp.Interval(scalar.lo - 2, scalar.hi + 2, self.bits)
        scalar_request = dict(input=str(center), lo=str(Q(scalar.lo, source.unit)),
                              hi=str(Q(scalar.hi, source.unit)), status='LeanCert replay required')
        rp.EXP_REQUESTS[str(center)] = scalar_request
        value_name = name + 'CenterValue'
        value = self.put(value_name, rp.Model.from_interval(scalar, self.degree))
        approximate = Q(value.coeff.get((0, 0), 0), source.unit)
        self.event('intervalInput', [], value_name, name,
            interval=dict(lo=scalar_request['lo'], hi=scalar_request['hi']),
            center=str(approximate), budget='0')
        self.mul(name, centered, value_name, name)
        certificate = dict(input=input_name, center=str(center), degree=self.degree,
            error=str(error), delta=delta, series=series, centered=centered,
            centerInterval=dict(lo=scalar_request['lo'], hi=scalar_request['hi']),
            centerApprox=str(approximate), centerValue=value_name, output=name,
            trace=trace, deltaBudget='0', seriesBudget=str(self.models[series].product_budget),
            productBudget=str(self.models[name].product_budget), scalarRequest=scalar_request)
        index = len(self.exponentials)
        self.exponentials.append(certificate)
        self.event('exp', [input_name], name, certificate=index)
        return name


def record_cell(source, cell, degree, bits, eta, cell_id):
    exp_policy = cell.get('exp_policy', 'taylor')
    if exp_policy not in ('taylor', 'best'):
        raise ValueError(f'unknown exponential policy: {exp_policy}')
    if cell['chart'] == 'reciprocal' and cell.get('damping', 'model') != 'reserve':
        raise ValueError('reciprocal replay currently requires damping=reserve')
    sbox, auxbox = tuple(map(Q, cell['s'])), tuple(map(Q, cell['aux']))
    if sbox[0] >= sbox[1] or auxbox[0] >= auxbox[1]:
        raise ValueError('cell intervals must have positive width')
    if cell['chart'] == 'reciprocal' and auxbox[0] <= 0:
        raise ValueError('reciprocal chart requires positive auxiliary coordinate')
    rp.HORNER_RECORDS = []
    rp.EXP_REQUESTS.clear()
    rec = Recorder(degree, bits)
    coordinates = {}
    for name, box, axis in [('s', sbox, 0), ('aux', auxbox, 1)]:
        rec.put(name, rp.coordinate(*box, axis, degree, bits))
        coordinates[name] = dict(axis=axis, lo=str(box[0]), hi=str(box[1]),
                                 center=str(sum(box) / 2), halfwidth=str((box[1] - box[0]) / 2))
        rec.event('coordinate', [], name, coordinate=name)
    denominator = int(source['profileDen'])
    _, profile_trace = rec.horner('profile', source['profileCoefficients'], 's',
        lambda pair: rp.Model.from_interval(rp.Interval.rational(
            Q(int(pair[0]), denominator), Q(int(pair[1]), denominator), bits), degree))
    rec.event('profile', ['s'], 'profile')
    rec.constant('one', 1)
    rec.mul('aux2', 'aux', 'aux')
    rec.mul('profile2', 'profile', 'profile')
    if cell['chart'] == 'direct':
        rec.mul('denominatorProduct', 'profile2', 'aux2')
        rec.add('denominator', 'one', 'denominatorProduct')
        rec.inverse('inverse', 'denominator')
        rec.mul('argumentProduct', 'aux2', 's')
        rec.mul('argument', 'argumentProduct', 'inverse')
        rec.scale('dampingArgument', 'aux2', -eta ** 2)
        rec.exponential('damping', 'dampingArgument', exp_policy)
    elif cell['chart'] == 'reciprocal':
        rec.add('denominator', 'aux2', 'profile2')
        rec.inverse('inverse', 'denominator')
        rec.mul('argument', 's', 'inverse')
    else:
        raise ValueError('unknown chart')
    rec.scale('negS', 's', -1)
    rec.scale('negArgumentForGaussian', 'argument', -1)
    rec.add('gaussianArgument', 'negS', 'negArgumentForGaussian')
    rec.exponential('gaussian', 'gaussianArgument', exp_policy)
    damping_reserve = None
    if cell['chart'] == 'direct':
        rec.mul('commonProduct1', 'damping', 'gaussian')
        rec.mul('commonProduct2', 'commonProduct1', 'inverse')
        rec.mul('common', 'commonProduct2', 'inverse')
    else:
        rec.mul('remainingProduct', 'gaussian', 'inverse')
        rec.mul('remaining', 'remainingProduct', 'inverse')
        rec.mul('undampedCommon', 'aux2', 'remaining')
        envelope = rec.models['remaining'].range().max_abs()
        radius = eta ** 2 * envelope
        rec.inflate('common', 'undampedCommon', radius, 'dampingReserve')
        damping_reserve = dict(remaining='remaining', undamped='undampedCommon',
            output='common', remainingRange=dict(
                lo=str(Q(rec.models['remaining'].range().lo, 1 << bits)),
                hi=str(Q(rec.models['remaining'].range().hi, 1 << bits))),
            envelope=str(envelope), eta=str(eta), radius=str(radius),
            error=str(ceil_dyadic(radius, bits)), budget='0')
        rec.event('dampingReserve', ['remaining', 'undampedCommon'], 'common')
    rec.scale('twiceRadial', 's', 2)
    rec.mul('firstOutput', 'twiceRadial', 'common')
    rec.scale('twiceProfile', 'profile', 2)
    rec.scale('negArgument', 'argument', -1)
    rec.add('companionFactor', 'one', 'negArgument')
    rec.mul('companionNumerator', 'twiceProfile', 'companionFactor')
    rec.mul('companionOutput', 'companionNumerator', 'common')
    budget_nodes = dict(twiceRadialBudget='twiceRadial', firstBudget='firstOutput',
        twiceProfileBudget='twiceProfile', negArgumentBudget='negArgument',
        factorBudget='companionFactor', numeratorBudget='companionNumerator',
        companionBudget='companionOutput')
    assembly = dict(radial='s', profile='profile', argument='argument', commonModel='common')
    assembly.update({name: name for name in budget_nodes.values()})
    assembly.update({key: str(rec.models[value].product_budget)
                     for key, value in budget_nodes.items()})
    requests = dict(rp.EXP_REQUESTS)
    # This independent call exercises the original implementation, with its
    # normal untraced cache path. No transcript metadata enters the comparison.
    rp.HORNER_RECORDS = None
    rp.EXP_REQUESTS.clear()
    expected = bp.pair_models(source, cell, degree, bits, eta)
    actual = [rec.models[name] for name in ['firstOutput', 'companionOutput']]
    if not all(same_model(a, b) for a, b in zip(actual, expected)):
        raise AssertionError('transcript arithmetic differs from pair_models')
    if requests != rp.EXP_REQUESTS:
        raise AssertionError('scalar exponential requests differ from pair_models')
    hs, ha = (sbox[1] - sbox[0]) / 2, (auxbox[1] - auxbox[0]) / 2
    integrals = []
    for value in actual:
        lo, hi = value.integral(hs, ha)
        integrals.append(dict(lo=str(lo), hi=str(hi), width=str(hi - lo)))
    return dict(id=cell_id, cell=cell, degree=degree, bits=bits, coordinates=coordinates,
        nodes={name: rp.model_json(value) for name, value in rec.models.items()},
        operations=rec.operations, profile=dict(variable='s', output='profile', trace=profile_trace),
        reciprocals=rec.reciprocals, exponentials=rec.exponentials,
        dampingReserve=damping_reserve, assembly=assembly, scalarExpRequests=requests,
        outputs=dict(first='firstOutput', companion='companionOutput'), integrals=integrals,
        reproduction='exact arithmetic outputs and scalar requests match pair_models')


def discover(cells=None, degree=6, bits=160, eta=Q(1, 10 ** 15)):
    if degree < 1 or bits < 1:
        raise ValueError('degree and bits must be positive')
    cells = PILOTS if cells is None else cells
    raw = SOURCE.read_bytes()
    source = json.loads(raw)
    old_records, old_requests = rp.HORNER_RECORDS, dict(rp.EXP_REQUESTS)
    try:
        rows = [record_cell(source, cell, degree, bits, Q(eta), f'cell{i}')
                for i, cell in enumerate(cells)]
    finally:
        rp.HORNER_RECORDS = old_records
        rp.EXP_REQUESTS.clear()
        rp.EXP_REQUESTS.update(old_requests)
    result = dict(schemaVersion=1, agent='codex-aa04',
        status='untrusted witnesses; full Lean replay and actual integral binding required',
        normalization='outer 1/sqrt(pi) excluded; reciprocal Jacobian included',
        degree=degree, bits=bits, eta=str(Q(eta)), profileInput=str(SOURCE.relative_to(ROOT)),
        profileInputSha256=hashlib.sha256(raw).hexdigest(),
        profileDen=source['profileDen'], profileCoefficients=source['profileCoefficients'], cells=rows)
    return json.dumps(result, indent=2) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true', help='check exact byte reproduction')
    parser.add_argument('--output', type=Path, default=OUTPUT)
    parser.add_argument('--cell', action='append', help='JSON cell object or path to a JSON cell object')
    parser.add_argument('--degree', type=int, default=6)
    parser.add_argument('--bits', type=int, default=160)
    parser.add_argument('--eta', default='1/1000000000000000')
    args = parser.parse_args()
    cells = None
    if args.cell:
        cells = [json.loads(value if value.lstrip().startswith('{') else Path(value).read_text())
                 for value in args.cell]
    text = discover(cells, args.degree, args.bits, Q(args.eta))
    if args.check:
        if args.output.read_text() != text:
            raise SystemExit('base pair leaf transcript differs from generated output')
        print(f'checked exact transcript reproduction: {args.output}')
    else:
        args.output.write_text(text)
        print(f'wrote {args.output}')


if __name__ == '__main__':
    main()
