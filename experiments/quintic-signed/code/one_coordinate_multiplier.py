"""A radial multiplication price for both signs, uniformly in d. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from math import factorial, prod


E, NU = Q(191, 250), Q(47, 2000)
ALPHA, BETA = 1 - NU, E + NU
C, B = Q(9, 16), Q(5, 32)


def require(test, message):
    if not test:
        raise ArithmeticError(message)


def add(p, q, scale=Q(1)):
    n = max(len(p), len(q))
    return [a + scale * b for a, b in zip(p + [0] * (n - len(p)), q + [0] * (n - len(q)))]


def multiply(p, q):
    result = [Q()] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            result[i+j] += a*b
    return result


def evaluate(p, x):
    return sum(a*x**i for i, a in enumerate(p))


def price_polynomial(d):
    return [ALPHA-BETA/2-3*d/8, BETA/4+3*d/8, -d/16]


def tail(k, r):
    """Upper bound on the kth moment after r for an Exp(1) variable."""
    exp_lower = Q(2718, 1000)
    require(exp_lower < sum(Q(1, factorial(j)) for j in range(8)), 'exponential series')
    return sum(Q(factorial(k), factorial(j))*r**j for j in range(k+1)) / exp_lower**r


def trace_bound():
    # The numerator bounds both rank-one costs for every d <= NU.
    q = [-2, 1]
    v = [6, -6, 1]
    numerator = add([BETA*x/2 for x in multiply(q, q)], multiply(v, v), NU/12)
    # (C+Bt) H(t)-N(t) = gamma times t(t-2)^2(t-5)^2 with gamma>0.
    remainder = [0, 1]
    for r in [2, 5]:
        remainder = multiply(remainder, multiply([-r, 1], [-r, 1]))
    root = -C/B
    gamma = -evaluate(numerator, root)/evaluate(remainder, root)
    require(gamma > 0, 'nonnegative majorant remainder')
    dividend = add(numerator, remainder, gamma)
    quotient_desc = []
    for a in reversed(dividend):
        quotient_desc.append((a - (C*quotient_desc[-1] if quotient_desc else 0))/B)
    require(quotient_desc.pop() == 0, 'polynomial division remainder')
    quotient = quotient_desc[::-1]
    require(multiply([C, B], quotient) == dividend, 'majorant identity')
    def moment(j):
        return prod((Q(2*i+3, 2) for i in range(j)), start=Q(1))
    small = sum(a*moment(i) for i, a in enumerate(quotient))
    require(small == Q(188217137, 202272000), 'Gamma(3/2) polynomial moment')
    for d in [Q(0), NU]:
        difference = add(price_polynomial(d), [C, B], -1)
        require(difference[2] <= 0 and min(evaluate(difference,0),evaluate(difference,32)) >= 0,
                'concave denominator bound through 32')
    require(BETA/2 + NU/12 <= 1, 'tail numerator is bounded by t^5')
    require(small + tail(5,32)/(2*NU) < Q(931,1000), 'negative operator trace < 0.931')


def positive_price(limit, epsilon, debits):
    for d in debits:
        p = price_polynomial(d)
        require(p[2] <= 0 and min(evaluate(p,0),evaluate(p,limit)) >= 0, 'positive radial part')
        # For t >= limit >= 1, |p(t)| <= t^2 sum |p_i|, and sqrt(t) <= t.
        require(sum(map(abs,p)) < 1, 'absolute polynomial tail')
        require(Q(3,4)*(ALPHA-BETA/8-3*d/64) > Q(1,2), 'M > 1/2 by pi>3')
    require(2*tail(3,limit) < epsilon/2, 'the absolute value fits under (1+epsilon)M')
    require((2+epsilon)*Q(11,14) < 2, 'price minus B(d) < 2 epsilon by pi<22/7')


def pi_interval():
    def atan(x):
        values=[(-1)**j*x**(2*j+1)/(2*j+1) for j in range(30)]
        return sum(values),sum(values[:-1])
    a,b=atan(Q(1,5)); c,d=atan(Q(1,239))
    return 16*a-4*d,16*b-4*c


def main():
    trace_bound()
    positive_price(142,Q(1,10**54),[Q(),NU])
    positive_price(166,Q(1,10**64),[Q(1,50)])
    pi_lo, pi_hi = pi_interval()
    require(3 < pi_lo < pi_hi < Q(22,7), 'Machin interval')
    for d, eps, cap, reciprocal in [(Q(1,50),Q(1,10**64),Q('.712392364069987'),Q('1.40372082918867')),
                                      (NU,Q(1,10**54),Q('.712263509683805'),Q('1.40397477394838'))]:
        price=NU+pi_hi/4*(ALPHA-BETA/8-3*d/64)+2*eps
        require(price<cap and price*reciprocal<1, 'displayed one-coordinate enclosure')
    near=Q('.000394')
    require(NU+pi_hi/4*(ALPHA-BETA/8-3*near/64)+Q(2,10**54)<Q(10000,14023),
            'uniform sufficient debit for the 1.4023 test')
    require(NU+pi_lo/4*(ALPHA-BETA/8-3*Q('.00039399')/64)>Q(10000,14023),
            'visible phase exceeds 1.4023 cap at adjoining smaller decimal')
    print('Uniform negative trace < 0.931. For every 0 <= d <= .0235 the two-sided price is < B(d)+2e-54.')
    print('At d=.02 the price is < .712392364069987 and its reciprocal exceeds 1.40372082918867.')
    print('Any one-coordinate response, unrestricted other response, passes 1.4023 at d >= .000394.')


if __name__ == '__main__':
    main()
