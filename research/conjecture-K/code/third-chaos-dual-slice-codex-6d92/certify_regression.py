#!/usr/bin/env python3
"""Outward-rounded quadratic regression estimate.

Agent-ID: codex-6d92. Adapted from the audit_diagonal certificate.
"""

from fractions import Fraction as Q

from flint import arb, ctx, fmpq


def ball(value):
    value = Q(value)
    return arb(fmpq(value.numerator, value.denominator))


def certify_derivative(pi, mean):
    test_limit = ball("0.5")
    lower, upper = ball(Q(-1, 8)), ball(Q(3, 200))
    sqrt2 = arb(2).sqrt()
    normalizer = (pi/2).sqrt()
    end, stop = 14, 20
    mesh = 10000
    step = ball(Q(1, mesh))
    partial_step = ball(0).union(step)

    def kernel(x):
        return 1-x*normalizer*(x*x/2).exp()*(x/sqrt2).erfc()

    assert test_limit > mean
    assert ball(Q(-2, end**2)) > lower
    assert ball(Q(2, end**2))+(test_limit-mean)/(1+end**2) < upper

    tail_values = (test_limit-mean-ball(Q(2, stop**2))).union(test_limit-mean)
    integral = tail_values*normalizer*(arb(stop)/sqrt2).erfc()
    kernel_right = kernel(arb(stop))
    quadratic_right = stop**2*kernel_right
    for j in range(stop*mesh-1, -1, -1):
        x_left = ball(Q(j, mesh))
        x = x_left.union(ball(Q(j+1, mesh)))
        kernel_left = kernel(x_left)
        quadratic_left = x_left*x_left*kernel_left
        k = kernel_left.union(kernel_right)
        z = quadratic_left.union(quadratic_right)
        test = (k-test_limit)**2+(z-k)/4
        integrand = (test-mean)*(-x*x/2).exp()
        if j < end*mesh:
            derivative = test-mean-x*(x*x/2).exp()*(integral+partial_step*integrand)
            assert lower < derivative < upper, (j, derivative)
        integral += step*integrand
        kernel_right = kernel_left
        quadratic_right = quadratic_left
    print(f"PASS -1/8 < Stein derivative < 3/200: {end*mesh} compact cells and analytic tails")


def certify_threshold(pi, variance):
    cumulant = Q(89, 500)
    tilt = Q(7, 100)
    assert (Q(3, 200)+Q(1, 8))/2 == tilt
    assert variance > ball(cumulant/32)
    gamma_sq = 2*cumulant/9
    gamma = ball(gamma_sq).sqrt()
    gaussian = (2/pi).sqrt()
    bound = gaussian*(1-ball(cumulant/24)
                      + gamma*(variance+ball(cumulant/64)+ball(tilt)*gamma).sqrt())
    assert bound < ball(Q(17, 25)).sqrt()
    assert -ball(Q(1, 24))+arb(2).sqrt()/48 < 0
    assert gamma_sq == Q(89, 2250)
    print("PASS kappa <= 89/500 or Var(tau) <= 89/2250: bound < sqrt(17/25)")


if __name__ == "__main__":
    if not __debug__:
        raise RuntimeError("Run the certificate with assertions enabled.")
    ctx.prec = 150
    pi, log2 = arb.pi(), arb(2).log()
    certify_derivative(pi, ball(Q(11, 16))-log2)
    certify_threshold(pi, ball(Q(23, 32))-log2)
