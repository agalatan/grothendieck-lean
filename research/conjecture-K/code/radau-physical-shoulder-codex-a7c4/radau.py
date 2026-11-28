"""Peak curvature from Gauss–Radau quadrature of its Laplace measure. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
from functools import cache
from math import ceil, factorial, floor


def solve_hankel(matrix):
    rows = [row[:] for row in matrix]
    for k, row in enumerate(rows):
        pivot = row[k]
        if pivot.lo <= 0:
            raise ValueError('positive Hankel pivot')
        row[:] = [x/pivot for x in row]
        for j, other in enumerate(rows):
            if j != k:
                coefficient = other[k]
                other[:] = [x-coefficient*y for x,y in zip(other,row)]
    return [row[-1] for row in rows]


def checked_bound(derivatives):
    moments = [derivatives[j]*(-1)**(j+1) for j in range(2,9)]
    interval = type(moments[0])
    degree = 3
    matrix = [[moments[i+j+1] for j in range(degree)] + [-moments[i+degree+1]]
              for i in range(degree)]
    coefficients = solve_hankel(matrix)

    def sign(r):
        value = interval(1)  # the orthogonal cubic is monic
        for c in reversed(coefficients):
            value = value*r+c
        if value.hi < 0:
            return -1
        if value.lo > 0:
            return 1
        raise ArithmeticError('ambiguous root probe')

    points = [Q(j,2) for j in range(401)]
    signs = [sign(p) for p in points]
    brackets = [(l,h) for l,h,sl,sh in zip(points,points[1:],signs,signs[1:]) if sl != sh]
    if len(brackets) != degree:
        raise ValueError('Gauss–Radau did not isolate three distinct roots')
    roots = []
    for lo, hi in brackets:
        left_sign = sign(lo)
        for _ in range(38):
            mid = (lo+hi)/2
            if sign(mid) == left_sign:
                lo = mid
            else:
                hi = mid
        roots.append(interval(lo,hi))

    weights = []
    for j, root in enumerate(roots):
        # Integrate the cardinal polynomial of root against t dμ, then divide by root.
        numerator = [interval(1)]
        denominator = root
        for i, other in enumerate(roots):
            if i == j:
                continue
            product = [interval(0)]*(len(numerator)+1)
            for k,c in enumerate(numerator):
                product[k] -= other*c
                product[k+1] += c
            numerator = product
            denominator *= root-other
        weights.append(sum(c*moments[k+1] for k,c in enumerate(numerator))/denominator)
    weights.insert(0,moments[0]-sum(weights))
    if min(w.lo for w in weights) <= 0 or min(r.lo for r in roots) <= 0:
        raise ValueError('invalid curvature quadrature')
    nodes = tuple(Q(floor(r.lo*10**10),10**10) for r in roots)
    weights = tuple(Q(ceil(w.hi*10**10),10**10) for w in weights)

    # Every z exp(-rate z) is decreasing beyond 1/rate. All terms see the same z.
    stop = max(1/rate for rate in nodes)
    grid = [stop*i/32 for i in range(33)]
    def cell_upper(lo,hi):
        total = Q(0)
        for rate,weight in zip(nodes,weights[1:]):
            z = max(lo,min(hi,1/rate))
            exp_lower = sum((rate*z)**j/factorial(j) for j in range(14))
            total += weight*z/exp_lower
        return total
    supremum = max(cell_upper(lo,hi) for lo,hi in zip(grid,grid[1:]))
    supremum = Q(ceil(supremum*10**12),10**12)

    @cache
    def bound(u,k):
        if u < 0 or k < 1:
            raise ValueError('curvature domain')
        total_mass = k*sum(weights)
        return min(total_mass,weights[0]*k+supremum/u) if u else total_mass

    bound.mixture_max = supremum
    return bound,nodes,weights
