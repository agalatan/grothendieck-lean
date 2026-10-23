#!/usr/bin/env python3
"""Independently integrate the response-lift feature banks, exactly.

Uses only the Python standard library. The expected matrices and Gram
diagonals come from response_lift_model.py; the polynomials here are built
directly in Z, conjugate(Z), W, conjugate(W), then integrated monomial by
monomial. The model's Laguerre expansion, product, and Gram routines are not
used to construct these independent integrals.

Replay from this scratch directory with an explicit model path::

    python3 -I verify_gaussian_banks.py --model /absolute/path/response_lift_model.py

If installed beside response_lift_model.py, --model can be omitted.
The controls are actual bounded responses, with
q(W)=W(|W|^2-2)/sqrt(2), R=|Z|^2 and S=|W|^2:
    Z exp(-R), sqrt(2) W exp(-R-S), Z^2 conjugate(W) exp(-R-S).
No endpoint or Gaussian realization of arbitrary coefficient data is tested.
"""

import argparse
from fractions import Fraction as Q
import hashlib
import importlib.util
import json
from math import comb, factorial
from pathlib import Path


# a + b sqrt(2), represented as a pair of exact rational numbers.
ZERO = (Q(0), Q(0))
ONE = (Q(1), Q(0))
ROOT2 = (Q(0), Q(1))


def scalar(x):
    return x if isinstance(x, tuple) else (Q(x), Q(0))


def plus(x, y):
    return (x[0] + y[0], x[1] + y[1])


def times(x, y):
    return (x[0]*y[0] + 2*x[1]*y[1], x[0]*y[1] + x[1]*y[0])


class Poly:
    """Sparse polynomial in Z, bar Z, W, bar W over Q(sqrt(2))."""

    def __init__(self, terms=None):
        self.terms = {e: scalar(c) for e, c in (terms or {}).items()
                      if scalar(c) != ZERO}

    @staticmethod
    def coerce(p):
        return p if isinstance(p, Poly) else Poly({(0, 0, 0, 0): scalar(p)})

    def __add__(self, other):
        out = dict(self.terms)
        for e, c in self.coerce(other).terms.items():
            out[e] = plus(out.get(e, ZERO), c)
        return Poly(out)

    __radd__ = __add__

    def __neg__(self):
        return self * -1

    def __sub__(self, other):
        return self + -self.coerce(other)

    def __rsub__(self, other):
        return self.coerce(other) + -self

    def __mul__(self, other):
        out = {}
        for e, a in self.terms.items():
            for f, b in self.coerce(other).terms.items():
                g = tuple(i+j for i, j in zip(e, f))
                out[g] = plus(out.get(g, ZERO), times(a, b))
        return Poly(out)

    __rmul__ = __mul__

    def __pow__(self, power):
        if power < 0:
            raise ValueError('Polynomial power must be nonnegative')
        out = self.coerce(1)
        for _ in range(power):
            out = out * self
        return out

    def conjugate(self):
        # Coefficients in Q(sqrt(2)) are real.
        return Poly({(b, a, d, c): v for (a, b, c, d), v in self.terms.items()})


Z = Poly({(1, 0, 0, 0): ONE})
ZBAR = Z.conjugate()
W = Poly({(0, 0, 1, 0): ONE})
WBAR = W.conjugate()
R = Z * ZBAR
S = W * WBAR
QCUBIC = W * (S-2) * times(ROOT2, scalar(Q(1, 2)))
QBAR = QCUBIC.conjugate()


def laguerre(j, alpha):
    """Direct finite definition of (-1)^j L_j^alpha(R)."""
    return sum((Q((-1)**(j+k)*comb(j+alpha, j-k), factorial(k))*R**k
                for k in range(j+1)), Poly())


def integrate(polynomial, z_rate=1, w_rate=1):
    """E[P exp(-(z_rate-1)R-(w_rate-1)S)] for independent standard CNs.

    Angular integration kills unequal holomorphic/antiholomorphic powers.
    Each surviving radial integral is n! / rate^(n+1).
    """
    answer = ZERO
    for (a, b, c, d), coefficient in polynomial.terms.items():
        if a == b and c == d:
            moment = Q(factorial(a), z_rate**(a+1))*Q(factorial(c), w_rate**(c+1))
            answer = plus(answer, times(coefficient, scalar(moment)))
    return answer


def independent_banks(order):
    d = order+1
    u = [laguerre(j, 0) for j in range(d)]
    v1 = [laguerre(j, 1) for j in range(d)]
    v2 = [laguerre(j, 2) for j in range(d)]
    half_root2 = times(ROOT2, scalar(Q(1, 2)))
    return [
        (u, [ZBAR*x for x in v1] + [QBAR*x for x in u]
            + [QCUBIC*ZBAR**2*x*half_root2 for x in v2]),
        ([Z*x for x in v1], u + [QCUBIC*ZBAR*x*ROOT2 for x in v1]
            + [QBAR*Z*x for x in v1]),
        ([Z**2*x for x in v2], [Z] + [QCUBIC*x*ROOT2 for x in u]
            + [Z**2*QBAR*x for x in v2]),
    ]


def control_values(name, sizes):
    values = {a: [Q(0)]*n for a, n in sizes.items()}
    if name == 'visible':
        values['m'] = [Q((-1)**j*(j+1), 2**(j+2)) for j in range(sizes['m'])]
    elif name == 'remote':
        values['b'] = [Q((-1)**(j+1), 2**(j+3)) for j in range(sizes['b'])]
    elif name == 'conjugate':
        values['n'] = [Q((-1)**(j+1)*comb(j+2, 2), 2**(j+5))
                       for j in range(sizes['n'])]
    else:
        raise ValueError('Unknown actual-response control')
    return values


def require_equal(actual, expected, context):
    if actual != scalar(expected):
        raise AssertionError(f'{context}: integrated {actual}, expected {expected}')


def run(model, orders):
    checks = 0
    gram_checks = 0
    cross_checks = 0
    controls = [('visible', Z, 2, 1),
                ('remote', W*ROOT2, 2, 2),
                ('conjugate', Z**2*WBAR, 2, 2)]
    for order in orders:
        independent = independent_banks(order)
        sizes = model.lengths(order)
        for control, response, z_rate, w_rate in controls:
            values = control_values(control, sizes)
            expected_banks = model.banks(values, order)
            if len(independent) != len(expected_banks):
                raise AssertionError('Bank count mismatch')
            for sector, ((outputs, inputs), (_, gout, gin, cross)) in enumerate(
                    zip(independent, expected_banks)):
                if (len(outputs) != len(gout) or len(inputs) != len(gin)
                        or len(cross) != len(outputs)
                        or any(len(row) != len(inputs) for row in cross)):
                    raise AssertionError('Bank dimensions mismatch')
                for i, output in enumerate(outputs):
                    for j, input_feature in enumerate(inputs):
                        actual = integrate(output.conjugate()*response*input_feature,
                                           z_rate, w_rate)
                        require_equal(actual, cross[i][j],
                                      (order, control, sector, 'cross', i, j))
                        checks += 1
                        cross_checks += 1
                # Check each Gram bank only once; it is independent of response.
                if control == 'visible':
                    for side, features, diagonal in [('output', outputs, gout),
                                                      ('input', inputs, gin)]:
                        for i, first in enumerate(features):
                            for j, second in enumerate(features):
                                actual = integrate(first.conjugate()*second)
                                require_equal(actual, diagonal[i] if i == j else Q(0),
                                              (order, sector, 'Gram', side, i, j))
                                checks += 1
                                gram_checks += 1
    return {'status': 'PASS', 'exact_checks': checks, 'gram_checks': gram_checks,
            'cross_checks': cross_checks, 'orders': orders,
            'arithmetic': 'standard-library Fraction over Q(sqrt(2))',
            'scope': 'Actual Gaussian controls and bank identities; no endpoint claim.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--model', type=Path,
                        default=Path(__file__).with_name('response_lift_model.py'))
    parser.add_argument('--orders', default='0,1,2')
    args = parser.parse_args()
    if not args.model.is_file():
        parser.error('Pass --model /absolute/path/response_lift_model.py')
    spec = importlib.util.spec_from_file_location('audited_response_lift_model', args.model)
    model = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(model)
    result = run(model, list(map(int, args.orders.split(','))))
    result['model_sha256'] = hashlib.sha256(args.model.read_bytes()).hexdigest()
    print(json.dumps(result, sort_keys=True))


if __name__ == '__main__':
    main()
