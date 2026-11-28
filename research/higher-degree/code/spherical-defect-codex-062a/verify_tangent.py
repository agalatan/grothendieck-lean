"""Exact replay of the tangent-space fourth-moment estimate (#507, codex-062a)."""

from fractions import Fraction as Q
from functools import cache
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify import lower_bound as slice_floor, quadratic_dimension, require, rho


def tangent_floor(c):
    if c < 2:
        raise ValueError("expected a complex dimension of at least two")
    q = 2 * c
    p = rho(q) + 1
    baseline = Q(2*c, c+1)
    if p > q:
        return baseline
    h = p - 2
    alpha, beta = Q(h+1, p+2), Q(h+1, q+2)
    peak = 1 + (1 - alpha*beta)/(2 + alpha + beta)
    M = quadratic_dimension(p) * quadratic_dimension(q)
    N = M * peak/(h + peak)
    require(1 < peak < Q(3, 2) and N > 1, "variance denominator")
    return baseline * N/(N-1)


@cache
def sphere_moment(m, indices):
    """Integrate a coordinate monomial of degree 0, 2, or 4."""
    if not indices:
        return Q(1)
    if len(indices) == 2:
        i, j = indices
        return Q(int(i == j), m)
    i, j, k, l = indices
    pairings = sum((i == j and k == l, i == k and j == l, i == l and j == k))
    return Q(pairings, m*(m+2))


def inner(m, f, g):
    return sum(a*b*sphere_moment(m, i+j) for i, a in f.items() for j, b in g.items())


def product_inner(p, q, f, g):
    # Each item represents one separable term, coefficient times y-form times w-form.
    return sum(a*b*inner(p, fy, gy)*inner(q, fw, gw)
               for a, fy, fw in f for b, gy, gw in g)


def kernel_jet(m, axis, speed):
    # K at e_0 and its first two derivatives along the (e_0, e_axis) great circle.
    scale = m*(m+2)
    return ({(): -Q(m, 2), (0, 0): Q(scale, 2)},
            {(0, axis): scale*speed},
            {(axis, axis): scale*speed**2, (0, 0): -scale*speed**2})


def check_gram(p, q, speeds):
    """Integrate the derivative representatives before taking their average."""
    s, t = Q(2*(p+2), p+1), Q(2*(q+2), q+1)
    M = quadratic_dimension(p) * quadratic_dimension(q)
    h = len(speeds)
    require(h == p-2 and h <= q-1, "nullspace fixture dimension")
    a, b = Q(1, p+2), Q(1, q+2)
    one = {(): Q(1)}
    values = []
    functionals = []
    for axis, (y_speed, w_speed) in enumerate(speeds, 1):
        u, z = y_speed**2, w_speed**2
        require(u + z == 1, "orthonormal tangent speeds")
        ky, dy, d2y = kernel_jet(p, axis, y_speed)
        kw, dw, d2w = kernel_jet(q, axis, w_speed)
        ev = [(1, ky, kw), (-1, one, one)]
        total = s*u + t*z
        f = [(1/total, d2y, kw), (2/total, dy, dw), (1/total, ky, d2w)]
        require(product_inner(p, q, ev, ev) == M-1, "centered evaluation norm")
        require(product_inner(p, q, ev, f) == -M, "evaluation against a derivative")
        functionals.append(f)
        values.append(s*u/total)

    covariance_sum = Q(0)
    for i, x in enumerate(values):
        for j, y in enumerate(values):
            entry = product_inner(p, q, functionals[i], functionals[j])/M
            if i == j:
                predicted = 2 + 2*x*(1-x) - 2*a*x**2 - 2*b*(1-x)**2
            else:
                predicted = 1 - a*x*y - b*(1-x)*(1-y)
            require(entry == predicted, f"derivative Gram entry {i},{j} for {p},{q}")
            covariance_sum += entry

    mean = sum(values)/h
    alpha, beta = (h+1)*a, (h+1)*b
    def quad(x):
        return 1 + 2*x*(1-x) - alpha*x*x - beta*(1-x)**2

    maximizer = (1+beta)/(2+alpha+beta)
    peak = 1 + (1-alpha*beta)/(2+alpha+beta)
    require(0 < maximizer < 1 and quad(maximizer) == peak, "quadratic maximum")
    # Retain the exact Jensen difference. This also tests unequal projection lengths.
    var = sum((x-mean)**2 for x in values)/h
    require(covariance_sum/h**2 == 1+(quad(mean)-(2+a+b)*var)/h, "average covariance")
    require(peak-quad(mean) == (2+alpha+beta)*(mean-maximizer)**2, "completed square")


def main():
    expected = {
        2: Q(4, 3), 3: Q(13419, 8822), 4: Q(8, 5), 5: Q(4125, 2462),
        6: Q(2541240, 1478183), 7: Q(20433, 11644), 8: Q(3710080, 2084769),
        12: Q(176580000, 95600921), 24: Q(471284352, 245433365),
    }
    for c, target in expected.items():
        require(tangent_floor(c) == target, f"floor at c={c}")
        print(f"c={c}: lower bound {target}")
    for c in range(3, 257):
        if c != 4:
            require(tangent_floor(c) > slice_floor(c), f"strict improvement at c={c}")

    speeds = [(Q(3, 5), Q(4, 5)), (Q(1), Q(0)), (Q(0), Q(1)),
              (Q(5, 13), Q(12, 13))]
    for p, q in [(3, 6), (5, 12), (10, 16)]:
        check_gram(p, q, [speeds[i % len(speeds)] for i in range(p-2)])
    print("Exact sphere Gram matrices and quadratic maxima verified.")


if __name__ == "__main__":
    main()
