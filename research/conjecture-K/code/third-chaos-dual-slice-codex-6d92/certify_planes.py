#!/usr/bin/env python3
"""Replay the full Stiefel envelope using Arb and checked fixed-point integers.

Agent-ID: codex-6d92. See the proof note for the analytic reduction.
"""

import heapq
from fractions import Fraction
from itertools import product

from flint import arb, ctx, fmpq
import numpy as np


SCALE = 2**26
BUCKETS = 8192
ANGLES = 2048
WEIGHT_SCALE = 10000


def ball(q):
    q = Fraction(q)
    return arb(fmpq(q.numerator, q.denominator))


def down_scaled(x):
    return int((x * SCALE).lower().floor().unique_fmpz())


def up_scaled(x):
    return int((x * SCALE).upper().ceil().unique_fmpz())


class RadialMean:
    def __init__(self, n):
        self.n = n
        nn = arb(n)
        self.fg = 1 / (2 * nn * (nn + 2)).sqrt()
        self.fh = 1 / (nn * (nn + 2) * (nn + 4)).sqrt()
        normalizer = (nn / 2).gamma()
        self.er1 = arb(2).sqrt() * ((nn + 1) / 2).gamma() / normalizer
        self.er3 = (nn + 1) * self.er1

    def __call__(self, a, b):
        eta = (self.n + 2) * a * self.fg
        xi = a * self.fg + b * self.fh
        if a.is_zero():
            return abs(xi) * self.er3
        if xi.is_zero():
            return abs(eta) * self.er1
        assert xi > 0 or xi < 0, (self.n, a, b, xi)
        assert eta > 0 or eta < 0, (self.n, a, b, eta)
        if (xi > 0) != (eta > 0):
            return abs(xi) * self.er3 + abs(eta) * self.er1
        # Use the chi moments at the positive root, with gamma's argument R^2/2.
        cut = eta / (2 * xi)
        p1 = cut.gamma_lower(arb(self.n + 1) / 2, regularized=1)
        p3 = cut.gamma_lower(arb(self.n + 3) / 2, regularized=1)
        return abs(xi) * self.er3 * (1 - 2 * p3) + abs(eta) * self.er1 * (2 * p1 - 1)


def angle_basis():
    lo, hi = [], []
    for frequency, trig in ((1, arb.cos_pi), (1, arb.sin_pi),
                            (3, arb.cos_pi), (3, arb.sin_pi)):
        values = [arb(2).sqrt() * trig(ball(Fraction(frequency*j, ANGLES)))
                  for j in range(ANGLES)]
        lo.append(np.array([down_scaled(x) for x in values], dtype=np.int64))
        hi.append(np.array([up_scaled(x) for x in values], dtype=np.int64))
    for lower, upper in zip(lo, hi):
        assert np.all(lower >= -2*SCALE) and np.all(upper <= 2*SCALE)
        assert np.all((0 <= upper-lower) & (upper-lower <= 2))
    return lo, hi


class PlaneEnvelope:
    def __init__(self, n, diagonal, cross, basis):
        # The quadratic form has diagonal entries (a,b,b,c,c) and term 2*d*v0*v1.
        self.weights = diagonal
        self.cross = cross
        assert min(diagonal) > 0 and cross**2 < diagonal[0] * diagonal[1]
        self.lo, self.hi = basis
        phi = RadialMean(n)
        mean_g, mean_h = phi(arb(1), arb(0)), phi(arb(0), arb(1))
        self.norm_g, self.norm_h = up_scaled(mean_g), up_scaled(mean_h)
        # Bound the error of the coefficient chord on each angular interval.
        # The affine interpolation error averages to h^2 * sup |f''| / 12.
        chord_factor = arb(2).sqrt() * arb.pi()**2 / (12*ANGLES**2)
        self.rem_g = up_scaled(chord_factor * mean_g)
        self.rem_h = up_scaled(chord_factor * mean_h)
        assert max(self.norm_g, self.norm_h) <= SCALE
        table_g, table_h = [], []
        for j in range(2*BUCKETS):
            center = ball(Fraction(2*j + 1, 2*BUCKETS) - 1)
            table_g.append(up_scaled(phi(arb(1), center) + mean_h/(2*BUCKETS)))
            table_h.append(up_scaled(phi(center, arb(1)) + mean_g/(2*BUCKETS)))
        self.table_g = np.array(table_g, dtype=np.int64)
        self.table_h = np.array(table_h, dtype=np.int64)
        assert all(np.all((0 < t) & (t <= 3*SCALE)) for t in (self.table_g, self.table_h))
        # v/SCALE and all basis values are respectively bounded by 1 and 2.
        # The four harmonic terms sum to at most 8*SCALE. A midpoint moves by
        # at most 16 integer units. These conservative bounds cover every
        # array product, addition and reduction below before any int64 work.
        assert max(100*SCALE**2, 20*BUCKETS*SCALE, 100*ANGLES*SCALE) < 2**63
        self.den = WEIGHT_SCALE * (ANGLES * SCALE**2)**2
        self.quad_multiplier = (ANGLES * SCALE)**2
        self.cache = {}

    def scaled_basis(self, c, k):
        lo, hi = self.lo[k], self.hi[k]
        if c < 0:
            lo, hi = hi, lo
        return (c*lo) // SCALE, (c*hi + SCALE-1) // SCALE

    def corner(self, v):
        cached = self.cache.get(v)
        if cached is not None:
            return cached
        assert all(-SCALE <= x <= SCALE for x in v)
        a_lo, a_hi = self.scaled_basis(v[0], 0)
        b_lo = np.zeros(ANGLES, dtype=np.int64)
        b_hi = b_lo.copy()
        for c, k in zip(v[1:], (0, 1, 2, 3)):
            lo, hi = self.scaled_basis(c, k)
            b_lo += lo
            b_hi += hi

        a, b = (a_lo + a_hi) // 2, (b_lo + b_hi) // 2
        ea, eb = np.maximum(a-a_lo, a_hi-a), np.maximum(b-b_lo, b_hi-b)
        abs_a, abs_b = np.abs(a), np.abs(b)
        values = np.zeros(ANGLES, dtype=np.int64)
        for dominant, other, choose, table in (
            (a, b, (abs_a >= abs_b) & (abs_a > 0), self.table_g),
            (b, a, abs_b > abs_a, self.table_h),
        ):
            den = np.abs(dominant[choose])
            shifted = np.where(dominant[choose] > 0,
                               dominant[choose] + other[choose],
                               -dominant[choose] - other[choose])
            j = np.minimum(2*BUCKETS-1, (BUCKETS*shifted) // den)
            assert np.all((0 <= j) & (j < 2*BUCKETS))
            values[choose] = (den*table[j] + SCALE-1) // SCALE
        error = (self.norm_g*ea + self.norm_h*eb + SCALE-1) // SCALE
        l1_num = SCALE*int(np.sum(values + error, dtype=np.int64))
        l1_num += ANGLES * (self.rem_g*abs(v[0]) + self.rem_h *
                            (abs(v[1]) + abs(v[2]) + 9*abs(v[3]) + 9*abs(v[4])))
        quad_num = sum(w*x*x for w, x in zip(self.weights, v))
        quad_num += 2*self.cross*v[0]*v[1]
        result = WEIGHT_SCALE*l1_num**2 - self.quad_multiplier*quad_num
        self.cache[v] = result
        return result

    def box(self, box):
        widths = [hi-lo for lo, hi in box]
        assert all(width % 2 == 0 for width in widths)
        radii = [width//2 for width in widths]
        penalty = sum(w*r*r for w, r in zip(self.weights, radii))
        return max(self.corner(v) for v in product(*[tuple(set(x)) for x in box])) + \
            self.quad_multiplier*penalty

    def certify(self):
        todo = []
        whole = ((0, SCALE), (-SCALE, SCALE), (0, SCALE), (-SCALE, SCALE), (-SCALE, SCALE))
        for k, (lo, hi) in enumerate(whole):
            for fixed in (lo, hi) if lo == -SCALE else (hi,):
                box = whole[:k] + ((fixed, fixed),) + whole[k+1:]
                heapq.heappush(todo, (-self.box(box), box))
        assert len(todo) == 8
        leaves, worst = 0, -self.den
        while todo:
            neg_bound, box = heapq.heappop(todo)
            bound = -neg_bound
            if bound < 0:
                worst = max(worst, bound)
                leaves += 1
                continue
            assert len(self.cache) < 80000, ("coverage limit reached", box)
            axis = max(range(5), key=lambda k: self.weights[k]*(box[k][1]-box[k][0])**2)
            lo, hi = box[axis]
            assert hi-lo >= 4
            mid = (lo+hi)//2
            for ends in ((lo, mid), (mid, hi)):
                child = box[:axis] + (ends,) + box[axis+1:]
                heapq.heappush(todo, (-self.box(child), child))
        assert leaves >= 8 and worst < 0
        return leaves, len(self.cache), Fraction(worst, self.den)


def verify(n, a, b, c, d, target, basis):
    tau = Fraction(n+2, 4*(n-1))
    squared_bound = max(Fraction(a), (1-tau)*b + tau*c) / WEIGHT_SCALE
    assert ball(squared_bound) < target
    checker = PlaneEnvelope(n, (a, b, b, c, c), d, basis)
    leaves, corners, excess = checker.certify()
    # These displays are diagnostics. Certifying signs above use exact integers.
    print(f"PASS n={n}, squared bound {squared_bound}, {leaves} leaves, "
          f"{corners} corners, maximum certified excess {float(excess):.8g}",
          flush=True)


if __name__ == "__main__":
    if not __debug__:
        raise RuntimeError("Run the certificate with assertions enabled.")
    ctx.prec = 128
    basis = angle_basis()
    verify(11, 6344, 6605, 5802, -600, 2/arb.pi(), basis)
    verify(14, 6695, 6937, 6151, -925, ball(Fraction(17, 25)), basis)
    verify(15, 6793, 7032, 6246, -1017, ball(Fraction(17, 25)), basis)
