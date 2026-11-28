"""Exact Gaussian-integer checks for the dimension floor in Theorem 3.4."""

from collections import Counter, defaultdict
from fractions import Fraction
from itertools import product
from math import factorial, prod


def check(condition, message):
    if not condition:
        raise ValueError(message)


def abs_squared(phases):
    """Squared modulus of a sum of powers of i, grouped by exponent mod 4."""
    return (phases[0] - phases[2]) ** 2 + (phases[1] - phases[3]) ** 2


def top_norm(tensor):
    # T has entries i^p/sqrt(K), K = number of entries. Accumulate the
    # ordinary monomials in the two independent Bargmann variables first.
    coefficients = defaultdict(Counter)
    for ((i, j, k), p), ((l, m, h), q), ((a, b, d), r) in product(tensor.items(), repeat=3):
        hol = tuple(sorted((i, j, l, m, d)))
        anti = tuple(sorted((k, h, a, b)))
        coefficients[hol, anti][(p + q - r) % 4] += 1

    total = 0
    for (hol, anti), coefficient in coefficients.items():
        multiplicities = (*Counter(hol).values(), *Counter(anti).values())
        total += abs_squared(coefficient) * prod(factorial(n) for n in multiplicities)
    return Fraction(total, 16 * len(tensor) ** 3)


def slices_and_gram(tensor, axis):
    slices = defaultdict(dict)
    for indices, phase in tensor.items():
        other = indices[:axis] + indices[axis + 1:]
        slices[other][indices[axis]] = phase
    gram = defaultdict(Counter)
    for vector in slices.values():
        for (a, p), (b, q) in product(vector.items(), repeat=2):
            gram[a, b][(p - q) % 4] += 1
    return slices.values(), gram


def trace_terms(tensor, n):
    k = len(tensor)
    vectors, M = slices_and_gram(tensor, 0)
    _, N = slices_and_gram(tensor, 2)
    hs = wrong_hs = residual = 0
    for a in range(n):
        for b in range(n):
            twice_m = M[a, b] + M[a, b]
            hs += abs_squared(N[b, a] + twice_m)
            wrong_hs += abs_squared(N[a, b] + twice_m)
        # With D = N^T, tr(M D^2) = sum over columns v of ||D v||^2.
        for vector in vectors:
            acc = Counter()
            for b, p in vector.items():
                for phase, count in N[b, a].items():
                    acc[(phase + p) % 4] += count
            residual += abs_squared(acc)
    return Fraction(hs, k**2), Fraction(residual, k**3), Fraction(wrong_hs, k**2)


def verify(tensor, n):
    check(all(tensor.get((j, i, k)) == p for (i, j, k), p in tensor.items()), "Tensor symmetry")
    norm = top_norm(tensor)
    hs, residual, wrong_hs = trace_terms(tensor, n)
    check(norm >= 1 + hs + 4 * residual, "Bargmann floor with the covariance term")
    check(hs >= Fraction(9, n), "Trace-three dimension floor")
    return norm, hs, residual, wrong_hs


def main():
    for blocks in (1, 2, 3, 4):
        t = {}
        for j in range(blocks):
            x, y, z = 3 * j, 3 * j + 1, 3 * j + 2
            t[x, y, z] = t[y, x, z] = 0
        norm, hs, residual, _ = verify(t, 3 * blocks)
        check(norm == 1 + hs == 1 + Fraction(3, blocks) and residual == 0, "Disjoint triple equality")

    # T = v tensor v tensor v for v = (1,i)/sqrt(2).
    complex_rank_one = {(i, j, k): (i + j + k) % 4 for i, j, k in product(range(2), repeat=3)}
    norm, hs, residual, wrong_hs = verify(complex_rank_one, 2)
    check(norm == 1 + hs == 6 and residual == 0 and 1 + wrong_hs == 10, "Missing Gram transpose")

    for n in (2, 3):
        dense = {(i, j, k): (i * j + (i + j) * k + k) % 4 for i, j, k in product(range(n), repeat=3)}
        _, _, residual, _ = verify(dense, n)
        check(residual > 0, "Dense complex witness must retain positive covariance")
    print("Sharp floor attained at n=3,6,9,12. Complex transpose and positive covariance controls passed.")


if __name__ == "__main__":
    main()
