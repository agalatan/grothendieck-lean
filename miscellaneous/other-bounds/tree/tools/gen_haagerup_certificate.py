"""Generate an exact dyadic Haagerup inverse-prefix candidate.

Agent-ID: codex-aa04. Reproduce the exact inputs for the canonical bound.
No floating arithmetic or interval midpoint chooses a certificate coefficient.
The output is candidate data, not a proof that its finite checks pass.
"""
from fractions import Fraction as Q
from pathlib import Path
import argparse
import json


def multiply(a, b, length):
    """Exact polynomial multiplication modulo X^length."""
    result = [Q(0)] * min(length, len(a) + len(b) - 1)
    for i, x in enumerate(a[:length]):
        for j, y in enumerate(b[:length - i]):
            result[i + j] += x * y
    return result


def haagerup_coefficients(degree):
    coefficients = [Q(1)]
    for k in range(degree):
        coefficients.append(coefficients[-1] * Q((2*k + 1)**2, 4*(k + 1)*(k + 2)))
    return coefficients


def inverse_coefficients(degree):
    """Inverse of t H(t^2), with an independent exact composition check.

Lagrange's coefficient formula is c_n = [X^n] H(X)^(-2n-1)/(2n+1).
For H^alpha = sum f_j X^j, differentiation gives
j f_j = sum_{i=1}^j ((alpha+1)i-j) h_i f_{j-i}.
The final check directly verifies C(X) H(X C(X)^2) = 1 modulo X^(degree+1),
so producing the finite inverse does not depend on trusting that derivation.
"""
    h = haagerup_coefficients(degree)
    c = [Q(1)]
    for n in range(1, degree + 1):
        alpha = -2*n - 1
        powers = [Q(1)]
        for j in range(1, n + 1):
            powers.append(sum((((alpha + 1)*i - j)*h[i]*powers[j-i]
                               for i in range(1, j + 1)), Q(0))/j)
        c.append(powers[-1]/(2*n + 1))

    length = degree + 1
    argument = ([Q(0)] + multiply(c, c, length))[:length]
    composed = [Q(0)]
    for coefficient in reversed(h):
        composed = multiply(argument, composed, length)
        composed[0] += coefficient
    assert multiply(c, composed, length) == [Q(1)] + [Q(0)]*degree
    return c


def raw_norm(c, a):
    value = Q(0)
    for coefficient in reversed(c):
        value = abs(coefficient) + a*a*value
    return a*value


def leading_coefficient(c, bits):
    """Largest dyadic a on this grid with sum |c_j| a^(2j+1) <= 1."""
    denominator = 2**bits
    low, high = 0, denominator
    assert raw_norm(c, Q(low, denominator)) <= 1
    assert raw_norm(c, Q(high, denominator)) > 1
    while high - low > 1:
        middle = (low + high)//2
        if raw_norm(c, Q(middle, denominator)) <= 1:
            low = middle
        else:
            high = middle
    a = Q(low, denominator)
    assert raw_norm(c, a) <= 1 < raw_norm(c, Q(high, denominator))
    return a


def toward_zero(q, bits):
    """Fraction.__int__ truncates toward zero without using a float."""
    return Q(int(q * 2**bits), 2**bits)


def nearest_dyadic(q, bits):
    """Round to nearest, resolving exact ties toward the even numerator."""
    sign = -1 if q < 0 else 1
    numerator, remainder = divmod(abs(q.numerator)*2**bits, q.denominator)
    if 2*remainder > q.denominator or (2*remainder == q.denominator and numerator % 2):
        numerator += 1
    return Q(sign*numerator, 2**bits)


def reciprocal_coefficients(p, degree):
    """Reciprocal of 1-X P^2 modulo X^(degree+1), over exact Fractions."""
    length = degree + 1
    argument = ([Q(0)] + multiply(p, p, length))[:length]
    result = [Q(1)]
    for n in range(1, length):
        result.append(sum((argument[k]*result[n-k]
                           for k in range(1, min(n + 1, len(argument)))), Q(0)))
    denominator = [-coefficient for coefficient in argument]
    denominator[0] += 1
    assert multiply(denominator, result, length) == [Q(1)] + [Q(0)]*degree
    return result


def generate(recipe):
    keys = {'degree', 'leading_bits', 'coefficient_bits', 'resolvent_degree',
            'resolvent_bits', 'seed_power', 'seed_cap', 'defect_cap'}
    if set(recipe) != keys:
        raise ValueError('Recipe keys do not match the exact candidate schema')
    for name in keys - {'seed_cap', 'defect_cap'}:
        if type(recipe[name]) is not int or recipe[name] <= 0:
            raise ValueError(f'{name} must be a positive integer')
    if not 0 <= Q(recipe['defect_cap']) < 1 or Q(recipe['seed_cap']) < 0:
        raise ValueError('Invalid defect or seed cap')

    c = inverse_coefficients(recipe['degree'])
    a = leading_coefficient(c, recipe['leading_bits'])
    p = [a] + [toward_zero(coefficient*a**(2*j + 1), recipe['coefficient_bits'])
               for j, coefficient in enumerate(c[1:], 1)]
    assert sum(map(abs, p)) <= raw_norm(c, a) <= 1
    r = [nearest_dyadic(coefficient, recipe['resolvent_bits'])
         for coefficient in reciprocal_coefficients(p, recipe['resolvent_degree'])]
    assert r[0] == 1
    return dict(P=list(map(str, p)), R=list(map(str, r)), seed_power=recipe['seed_power'],
                seed_cap=str(Q(recipe['seed_cap'])), defect_cap=str(Q(recipe['defect_cap'])))


def render(recipe):
    return json.dumps(generate(recipe), indent=2) + '\n'


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    root = Path(__file__).resolve().parents[1]
    data = root / 'data/haagerup-resolvent'
    parser.add_argument('--recipe', type=Path, default=data / 'recipe.json')
    parser.add_argument('--out', type=Path, default=data / 'certificate.json')
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args()
    expected = render(json.loads(args.recipe.read_text()))
    if args.check:
        if args.out.read_text() != expected:
            raise SystemExit('Candidate differs from the exact recipe output')
        print('PASS exact recipe output')
    else:
        args.out.write_text(expected)


if __name__ == '__main__':
    main()
