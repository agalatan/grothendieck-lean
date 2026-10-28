#!/usr/bin/env python3
"""Total-degree rectangle experiment, Agent-ID: codex-aa04.

Consumes the canonical integer polynomial exported by Lean, never reconstructs
the Wick/source compiler. Arithmetic is outward dyadic; truncation and rounding
losses are recorded explicitly. This Python program is an untrusted generator
experiment, NOT a Lean certificate or an enclosure of a whole coefficient.
The model operations still require their corresponding Lean replay proofs.
"""
from __future__ import annotations

import argparse
from dataclasses import dataclass
from fractions import Fraction as Q
import hashlib
import json
import math
from pathlib import Path
import time

EXP_REQUESTS: dict[str, dict[str, str]] = {}
HORNER_RECORDS: list[dict] | None = None


class ModelConstructionError(ValueError):
    """A failed candidate with an exact heuristic severity for subdivision.

    Severity affects search order only; it is never a numerical certificate.
    """
    def __init__(self, message, severity):
        super().__init__(message)
        self.severity = Q(severity)


def ceildiv(a: int, b: int) -> int:
    return -((-a) // b)


@dataclass(frozen=True)
class Interval:
    lo: int
    hi: int
    bits: int

    def __post_init__(self):
        if self.lo > self.hi:
            raise ValueError("unordered interval")

    @property
    def unit(self):
        return 1 << self.bits

    @classmethod
    def rational(cls, lo, hi, bits):
        lo, hi = Q(lo), Q(hi)
        d = 1 << bits
        return cls((lo.numerator * d) // lo.denominator,
                   ceildiv(hi.numerator * d, hi.denominator), bits)

    def __add__(self, other):
        assert self.bits == other.bits
        return Interval(self.lo + other.lo, self.hi + other.hi, self.bits)

    def __mul__(self, other):
        assert self.bits == other.bits
        v = [a * b for a in (self.lo, self.hi) for b in (other.lo, other.hi)]
        return Interval(min(v) // self.unit, ceildiv(max(v), self.unit), self.bits)

    def scale(self, q):
        q = Q(q)
        a, b = sorted((self.lo * q.numerator, self.hi * q.numerator))
        return Interval(a // q.denominator, ceildiv(b, q.denominator), self.bits)

    def inverse(self):
        if self.lo <= 0 <= self.hi:
            raise ValueError("reciprocal domain contains zero")
        return Interval.rational(Q(self.unit, self.hi), Q(self.unit, self.lo), self.bits)

    def max_abs(self):
        return Q(max(abs(self.lo), abs(self.hi)), self.unit)


def exp_rational(q: Q, bits: int) -> Interval:
    """Outward scalar exponential using a positive Taylor series and squaring.

    Its mathematical justification is not yet replayed in Lean. Production
    certificates must use the pinned LeanCert exponential evaluator instead.
    """
    q = Q(q)
    if q == 0:
        return Interval(1 << bits, 1 << bits, bits)
    if q < 0:
        if q <= -bits:
            # e > 2 implies exp(-bits) < 2^(-bits).
            return Interval(0, 1, bits)
        return exp_rational(-q, bits).inverse()
    steps = 0
    x = q
    while x > Q(1, 2):
        x /= 2
        steps += 1
        if steps > 20:
            raise ValueError("exponential range reduction too large for this pilot")
    term = total = Q(1)
    target = Q(1, 1 << (bits + 16 + steps))
    n = 0
    while True:
        tail = (term * x / (n + 1)) / (1 - x / (n + 2))
        if tail < target:
            break
        n += 1
        term *= x / n
        total += term
    result = Interval.rational(total, total + tail, bits)
    for _ in range(steps):
        result = result * result
    return result


@dataclass
class Model:
    """Polynomial in normalized x,y plus an interval remainder on [-1,1]^2."""
    coeff: dict[tuple[int, int], int]
    rem: Interval
    degree: int
    product_budget: Q = Q(0)
    horner_id: int | None = None

    @property
    def bits(self):
        return self.rem.bits

    @property
    def unit(self):
        return self.rem.unit

    @classmethod
    def constant(cls, q, degree, bits):
        return cls.from_interval(Interval.rational(q, q, bits), degree)

    @classmethod
    def from_interval(cls, interval, degree):
        midpoint = (interval.lo + interval.hi) // 2
        return cls({(0, 0): midpoint} if midpoint else {},
                   Interval(interval.lo - midpoint, interval.hi - midpoint, interval.bits), degree)

    def zero(self):
        return Model.constant(0, self.degree, self.bits)

    def one(self):
        return Model.constant(1, self.degree, self.bits)

    def poly_range(self):
        center = self.coeff.get((0, 0), 0)
        radius = sum(abs(v) for k, v in self.coeff.items() if k != (0, 0))
        return Interval(center - radius, center + radius, self.bits)

    def range(self):
        return self.poly_range() + self.rem

    def inflate(self, radius: Q):
        assert radius >= 0
        r = ceildiv(radius.numerator * self.unit, radius.denominator)
        return Model(self.coeff, self.rem + Interval(-r, r, self.bits), self.degree)

    def __add__(self, other):
        assert self.degree == other.degree and self.bits == other.bits
        result = self.coeff.copy()
        for k, v in other.coeff.items():
            result[k] = result.get(k, 0) + v
        return Model({k: v for k, v in result.items() if v}, self.rem + other.rem, self.degree)

    def scale(self, q):
        q = Q(q)
        out, loss = {}, 0
        for k, value in self.coeff.items():
            raw = value * q.numerator
            rounded = (raw + q.denominator // 2) // q.denominator
            if rounded:
                out[k] = rounded
            loss += abs(raw - rounded * q.denominator)
        error = ceildiv(loss, q.denominator)
        return Model(out, self.rem.scale(q) + Interval(-error, error, self.bits),
                     self.degree, Q(error, self.unit))

    def __mul__(self, other):
        assert self.degree == other.degree and self.bits == other.bits
        raw = {}
        for (i, j), a in self.coeff.items():
            for (k, l), b in other.coeff.items():
                key = (i + k, j + l)
                raw[key] = raw.get(key, 0) + a * b
        out, loss, discarded = {}, 0, 0
        for key, value in raw.items():
            if sum(key) > self.degree:
                discarded += abs(value)
            else:
                rounded = (value + self.unit // 2) // self.unit
                if rounded:
                    out[key] = rounded
                loss += abs(value - rounded * self.unit)
        error = ceildiv(loss + discarded, self.unit)
        rem = (self.rem * other.poly_range() + other.rem * self.poly_range()
               + self.rem * other.rem + Interval(-error, error, self.bits))
        return Model(out, rem, self.degree, Q(error, self.unit))

    def inverse(self):
        center = Q(self.coeff.get((0, 0), 0), self.unit)
        if not center:
            raise ValueError("zero reciprocal center")
        delta = self.scale(1 / center) + self.one().scale(-1)
        q = delta.range().max_abs()
        if q >= 1:
            raise ModelConstructionError(f"reciprocal relative radius is {float(q)}", q)
        total = horner([1] * (self.degree + 1), delta.scale(-1),
                       lambda c: Model.constant(c, self.degree, self.bits))
        analytic = abs(1 / center) * q ** (self.degree + 1) / (1 - q)
        return total.scale(1 / center).inflate(analytic)

    def exp(self):
        center = Q(self.coeff.get((0, 0), 0), self.unit)
        delta = self + self.one().scale(-center)
        q = delta.range().max_abs()
        # Integer coefficients keep all Horner leaves exact; the single final
        # division also has a recorded coefficient rounding reserve.
        factorial = math.factorial(self.degree)
        total = horner([factorial // math.factorial(n) for n in range(self.degree + 1)],
                       delta, lambda c: Model.constant(c, self.degree, self.bits))
        total = total.scale(Q(1, factorial))
        # Exactly LeanCert TaylorModel.expRemainderBound on [-q,q].
        # The center exponential is a separate scalar certificate obligation.
        ceil_q = ceildiv(q.numerator, q.denominator)
        if ceil_q > 1024:
            raise ModelConstructionError('exponential variation requires a smaller rectangle',
                                         Q(ceil_q, 1024))
        analytic = 3 ** (ceil_q + 1) * q ** (self.degree + 1) / math.factorial(self.degree + 1)
        centered = total.inflate(analytic)
        scalar = exp_rational(center, self.bits)
        if center:
            # Guard ulps allow an independent, higher-precision LeanCert
            # evaluation to fit the same claimed interval at replay time.
            scalar = Interval(scalar.lo - 2, scalar.hi + 2, self.bits)
        EXP_REQUESTS[str(center)] = {
            'input': str(center), 'lo': str(Q(scalar.lo, self.unit)),
            'hi': str(Q(scalar.hi, self.unit)), 'status': 'LeanCert replay required'}
        return centered * Model.from_interval(scalar, self.degree)

    def integral(self, half_s: Q, half_u: Q):
        value = sum((Q(4 * c, self.unit * (i + 1) * (j + 1))
                     for (i, j), c in self.coeff.items() if i % 2 == 0 and j % 2 == 0), Q(0))
        area = 4 * half_s * half_u
        return (value * half_s * half_u + Q(self.rem.lo, self.unit) * area,
                value * half_s * half_u + Q(self.rem.hi, self.unit) * area)


def coordinate(lo, hi, axis, degree, bits):
    lo, hi = Q(lo), Q(hi)
    out = Model.constant((lo + hi) / 2, degree, bits)
    raw = Model.constant((hi - lo) / 2, degree, bits)
    key = (1, 0) if axis == 0 else (0, 1)
    c = raw.coeff.get((0, 0), 0)
    out.coeff[key] = c
    # The coefficient uncertainty multiplies a variable with modulus ≤ 1.
    return out.inflate(raw.rem.max_abs())


def horner(values, variable, leaf):
    acc = variable.zero()
    inputs, steps = [], []
    for value in reversed(values):
        item = leaf(value)
        product = acc * variable
        acc = product + item
        if HORNER_RECORDS is not None:
            inputs.append(model_json(item))
            steps.append({'product': model_json(product), 'result': model_json(acc),
                          'mulBudget': str(product.product_budget), 'addBudget': '0'})
    if HORNER_RECORDS is not None:
        record_id = len(HORNER_RECORDS)
        HORNER_RECORDS.append({'id': record_id, 'variable': model_json(variable),
                               'inputs': list(reversed(inputs)),
                               'steps': list(reversed(steps)),
                               'values': values, 'output': model_json(acc)})
        acc.horner_id = record_id
    return acc


def model_json(model):
    return {'bits': model.bits,
            'coefficients': [[i, j, str(c)] for (i, j), c in sorted(model.coeff.items())],
            'remainder': [str(model.rem.lo), str(model.rem.hi)],
            'hornerRecord': model.horner_id}


def kernel_model(data, sbox, ubox, degree, bits):
    s = coordinate(*sbox, 0, degree, bits)
    u = coordinate(*ubox, 1, degree, bits)
    const = lambda q: Model.constant(q, degree, bits)
    profile_den = int(data['profileDen'])
    kappa = horner(data['profileCoefficients'], s,
                   lambda pair: Model.from_interval(Interval.rational(
                       Q(int(pair[0]), profile_den), Q(int(pair[1]), profile_den), bits), degree))
    t = u * u
    beta = const(Q(41, 20)) + kappa * kappa * t
    inv_beta = beta.inverse()
    v = kappa * t * inv_beta
    dense = horner(data['sourceCoefficients'], s,
                   lambda row: horner(row, inv_beta,
                       lambda col: horner(col, v, lambda z: const(int(z)))))
    numerator = dense.scale(Q(1, int(data['sourceDen'])))
    damping = (t.scale(-Q(1, 10 ** 30))).exp()
    gaussian = (s.scale(-Q(41, 20)) + t * s * inv_beta.scale(-Q(41, 20))).exp()
    return damping.scale(2) * kappa.scale(-1) * s * gaussian * numerator


def self_test():
    bits, degree = 80, 4
    one = Model.constant(1, degree, bits)
    x = coordinate(-1, 1, 0, degree, bits)
    y = coordinate(-1, 1, 1, degree, bits)
    p = (one + x) * (one + y)
    assert p.integral(Q(1), Q(1)) == (Q(4), Q(4))
    square = (one + x) * (one + x)
    assert square.integral(Q(1), Q(1)) == (Q(16, 3), Q(16, 3))
    assert Model.constant(2, degree, bits).inverse().integral(Q(1), Q(1)) == (Q(2), Q(2))
    assert Model.constant(0, degree, bits).exp().integral(Q(1), Q(1)) == (Q(4), Q(4))
    a = Interval.rational(-Q(1, 3), Q(2, 3), bits)
    b = a * a
    assert Q(b.lo, b.unit) <= -Q(2, 9) and Q(4, 9) <= Q(b.hi, b.unit)
    assert exp_rational(Q(1), bits).lo > 2 * (1 << bits)
    assert exp_rational(Q(1), bits).hi < 3 * (1 << bits)
    truncated = Model({(4, 0): 1 << bits}, Interval(0, 0, bits), degree)
    truncated = truncated * truncated
    assert truncated.rem.lo <= -(1 << bits) and truncated.rem.hi >= 1 << bits
    print('exact arithmetic model smoke tests passed', flush=True)


def main():
    global HORNER_RECORDS
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', type=Path, nargs='?')
    parser.add_argument('output', type=Path, nargs='?')
    parser.add_argument('--degrees', default='4,6,8')
    parser.add_argument('--bits', type=int, default=160)
    parser.add_argument('--self-test', action='store_true')
    parser.add_argument('--trace-degree', type=int,
                        help='export every rounded Horner product and sum at this degree')
    args = parser.parse_args()
    self_test()
    if args.self_test:
        return
    if args.input is None or args.output is None:
        parser.error('input and output are required')
    raw = args.input.read_bytes()
    data = json.loads(raw)
    sbox, ubox = (Q(1), Q(1001, 1000)), (Q(1), Q(1001, 1000))
    report = {'agent': 'codex-aa04', 'status': 'untrusted numerical experiment; Lean replay pending',
              'inputSha256': hashlib.sha256(raw).hexdigest(), 'bits': args.bits,
              'source': 'canonical Lean q0RawWickDense, general-u kernel',
              's': list(map(str, sbox)), 'u': list(map(str, ubox)), 'eta': '1/1000000000000000',
              'outerInvSqrtPiIncluded': False, 'rows': []}
    for degree in map(int, args.degrees.split(',')):
        EXP_REQUESTS.clear()
        HORNER_RECORDS = [] if degree == args.trace_degree else None
        start = time.monotonic()
        model = kernel_model(data, sbox, ubox, degree, args.bits)
        lo, hi = model.integral((sbox[1] - sbox[0]) / 2, (ubox[1] - ubox[0]) / 2)
        row = {'degree': degree, 'seconds': time.monotonic() - start,
               'lo': str(lo), 'hi': str(hi), 'width': str(hi - lo),
               'remainderLo': str(Q(model.rem.lo, model.unit)),
               'remainderHi': str(Q(model.rem.hi, model.unit)),
               'scalarExponentialObligations': list(EXP_REQUESTS.values()),
               'exponentialRemainder': 'LeanCert expRemainderBound([-q,q], degree)',
               'polynomial': [[i, j, str(Q(c, model.unit))] for (i, j), c in sorted(model.coeff.items())]}
        report['rows'].append(row)
        args.output.write_text(json.dumps(report, indent=2) + '\n')
        if HORNER_RECORDS is not None:
            trace_path = args.output.with_name(f'q0-horner-traces-degree{degree}.json')
            trace_path.write_text(json.dumps({'sourceSha256': report['inputSha256'],
                'status': 'untrusted transcript; all checks require Lean replay',
                'degree': degree, 'bits': args.bits, 'records': HORNER_RECORDS},
                separators=(',', ':')) + '\n')
            print(f'exported {len(HORNER_RECORDS)} Horner transcripts to {trace_path}', flush=True)
        print(f'degree={degree} seconds={row["seconds"]:.3f} '
              f'mid={float((lo+hi)/2):.17g} width={float(hi-lo):.6g}', flush=True)


if __name__ == '__main__':
    main()
