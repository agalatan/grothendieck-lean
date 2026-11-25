#!/usr/bin/env python3
"""Rational replay of the signed cubic lift for the capped degree-five game. Agent-ID: codex-a7c4."""
from fractions import Fraction as F
from math import comb

EPS = F(39, 50)
ETA = F(779, 10000)
TARGET = F(500, 701)


def require(test, message):
    if not test:
        raise ArithmeticError(message)


def atan_bounds(n):
    x = F(1, n)
    lower = sum((-1)**j * x**(2*j+1) / (2*j+1) for j in range(16))
    return lower, lower + x**33/33


def pi_bounds():
    x, X = atan_bounds(5)
    y, Y = atan_bounds(239)
    return 16*x-4*Y, 16*X-4*y


def payoff(t, rho, mass_coefficient):
    return ETA + (EPS-ETA)*rho**2 + (1-ETA-(EPS-ETA)*mass_coefficient)*t**2


def check_endpoint(rho, cutoff, c_lower, c_upper):
    require(0 <= c_lower <= c_upper <= 1 and ETA < EPS < 1, 'payoff monotonicity')
    next_t = cutoff + F(1, 100000000)
    require(payoff(cutoff,rho,c_lower) < TARGET < payoff(next_t,rho,c_upper),
            'target must lie between the adjacent endpoint values')
    digits = cutoff * 10**8
    require(digits.denominator == 1 and 0 <= cutoff < 1, 'eight-place decimal cutoff')
    print(f'rho = {rho}, certified t <= 0.{digits.numerator:08d}; the next 10^-8 fails for this majorant.')


def main():
    lo,hi = pi_bounds()
    require(F(3141592653589793,10**15) < lo < hi < F(3141592653589794,10**15), 'pi enclosure')
    c_lo, c_hi = 2/hi, 2/lo
    reviewed, stronger = F(2287,2500), F(4571,5000)
    check_endpoint(reviewed,F('.31720829'),c_lo,c_hi)
    check_endpoint(stronger,F('.31975417'),c_lo,c_hi)
    check_endpoint(reviewed,F('.46616437'),F(1),F(1))
    check_endpoint(stronger,F('.46990576'),F(1),F(1))
    require(payoff(F('.30'),reviewed,F(0))>TARGET, 'omitting signed first-chaos gain fails at .30')
    require(payoff(F('.65'),stronger,c_hi)>TARGET, 'the raw ellipse majorant leaves the P3 endpoint open')
    # For M differences of exponentials the squared first absolute moment is rational.
    # M=1 is a variance-one Laplace law. At M=10 it alone already certifies t=.31.
    for n in (1,10):
        c = F(2*n*comb(2*n,n)**2,16**n)
        require(c<c_lo, 'finite signed carrier below its Gaussian limit')
        if n==1:
            require(c==F(1,2) and payoff(F('.31'),reviewed,c)>TARGET, 'one signed pair is insufficient at .31')
        else:
            require(payoff(F('.31'),reviewed,c)<TARGET, 'ten signed pairs suffice at .31')
    print('PASS')


if __name__ == '__main__':
    main()
