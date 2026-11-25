#!/usr/bin/env python3
"""Replay the weighted two-row bound directly from the raw rational row data.

Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
import json
from math import ceil
from pathlib import Path
import sys
import unittest

# Support running the file under python -I as well as unittest discovery.
sys.path.insert(0, str(Path(__file__).resolve().parent))
from test_tight_shared_gate import EPS, LOWER, PAD, ROOT, gate_minimum, lean_table, rational


CAP = Q(176590771, 250000000)
ROUNDING_UNIT = Q(1, 10**10)


def raw_rows(pieces, data):
    rows, gates = {}, {}
    for piece in pieces:
        if piece['kind'] == 'mass':
            mass = rational(piece['S'])
            continue
        index = piece['index'] + 1
        theta = list(map(rational, piece['theta']))
        ell, beta = theta[13:15]
        beta_cost = 2*beta**2/EPS
        # The row writer rounds the cap of the uncompleted row upwards at 10^-15.
        raw_cap = rational(piece['C']) - PAD - beta_cost
        cap = Q(ceil(raw_cap * 10**15), 10**15)
        if index in (8, 9):
            cap = rational(data[f'cap{index:02d}'])
            delta, kappa = theta[9], rational(piece['kappa'])
            baseline = kappa*delta**2 - delta
            gates[index] = (theta[0] - EPS + delta + 2*delta*theta[10] - baseline,
                            theta[1] + delta*theta[11], theta[2] + delta*theta[12],
                            *theta[3:6])
            if index == 8:
                headroom = cap - Q(1339829981, 10**9)
                curvature = (Q(11331869, 10**7) - kappa)*delta**2
        rows[index] = (ell, beta, cap + PAD + beta_cost)
    return rows, gates, mass, headroom, curvature


def quadratic_maximum(coefficients, lo, hi, vertices):
    a, b, c = coefficients
    candidates = [(a*t*t+b*t+c, t) for t in (lo, hi)]
    if vertices and a < 0:
        t = -b/(2*a)
        if lo < t < hi:
            candidates.append((c-b*b/(4*a), t))
    return max(candidates)


class TestWeightedTightGate(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        data = json.loads((ROOT / 'data/antistein-rows/env_tight.json').read_text())
        pieces = json.loads((ROOT / 'data/tail-caps/row_set.json').read_text())['pieces']
        cls.rows, cls.gates, cls.mass, cls.headroom, cls.curvature = raw_rows(pieces, data)
        cls.cells = [(rational(lo), rational(hi), i, j, rational(w))
                     for lo, hi, i, j, w in data['cells']]

    def discount(self, w):
        gate = tuple((1-w)*x+w*y for x, y in zip(self.gates[8], self.gates[9]))
        return min((1-w)*self.headroom, gate_minimum(gate)*self.headroom/self.curvature)

    def clipped_segments(self, lo, hi):
        ell8, beta8, c8 = self.rows[8]
        ell9, beta9, c9 = self.rows[9]
        penalty = 2*(beta9-beta8)**2/EPS
        # The minimizer of the uncorrected quadratic in w is offset + speed*t.
        offset, speed = (c8-c9+penalty)/(2*penalty), (ell9-ell8)/penalty
        knots = [lo, *sorted(t for t in (-offset/speed, (1-offset)/speed) if lo < t < hi), hi]
        for left, right in zip(knots, knots[1:]):
            mid_weight = offset + speed*(left+right)/2
            if mid_weight <= 0:
                yield left, right, Q(0), Q(0)
            elif mid_weight >= 1:
                yield left, right, Q(1), Q(0)
            else:
                yield left, right, offset, speed

    def cell_maxima(self, *, discount=True, vertices=True):
        maxima = []
        for index, (lo, hi, i, j, weight) in enumerate(self.cells):
            midpoint = (lo+hi)/2
            rows = dict(self.rows)
            rows[0] = (midpoint/2, Q(0), Q(1, 2)+self.mass+midpoint**2/2)
            central = {i, j} <= {8, 9}
            if central:
                i, j = 8, 9
                segments = self.clipped_segments(lo, hi)
            else:
                segments = [(lo, hi, weight, Q(0))]
            ell, beta, cap = rows[i]
            ell2, beta2, cap2 = rows[j]
            delta_ell, delta_cap = ell2-ell, cap2-cap
            penalty = 2*(beta2-beta)**2/EPS
            for left, right, offset, speed in segments:
                # Subtract the chord through the endpoint discounts. Concavity
                # bounds it above by the available discount throughout the segment.
                d0 = self.discount(offset+speed*left) if central and discount else Q(0)
                d1 = self.discount(offset+speed*right) if central and discount else Q(0)
                chord_slope = (d1-d0)/(right-left)
                chord_intercept = d0-left*chord_slope
                # Substitute w(t) into t² - 2(ell+w*delta_ell)t + cap+w*delta_cap
                # - penalty*w*(1-w) and subtract the chord.
                a = 1-2*speed*delta_ell+penalty*speed**2
                b = (-2*(ell+offset*delta_ell)+speed*delta_cap
                     + penalty*speed*(2*offset-1)-chord_slope)
                c = cap+offset*delta_cap-penalty*offset*(1-offset)-chord_intercept
                value, t = quadratic_maximum((a, b, c), left, right, vertices)
                maxima.append((value, index, t))
        return maxima

    def test_raw_rows_partition_and_cutoff(self):
        source = (LOWER / 'EnvelopeTight.lean').read_text()
        self.assertEqual([self.rows[i] for i in range(1, 15)], lean_table(source, 'envRowsTight'))
        self.assertEqual(self.cells, lean_table(source, 'envCellsTight'))
        self.assertEqual(len(self.cells), 38)
        previous = Q(0)
        segments = 0
        for lo, hi, i, j, _ in self.cells:
            self.assertEqual(lo, previous)
            self.assertGreater(hi, lo)
            if {i, j} <= {8, 9}:
                segments += len(list(self.clipped_segments(lo, hi)))
            previous = hi
        self.assertEqual(previous, Q(9, 10))
        self.assertEqual(segments, 12)
        cutoff_squared = self.headroom/self.curvature
        self.assertLess(Q(9, 40)**2, cutoff_squared)
        self.assertLess(cutoff_squared, Q(4649, 20000)**2)

    def test_outward_rounding_and_endpoint(self):
        value, cell, t = max(self.cell_maxima())
        lo, hi = self.cells[cell][:2]
        self.assertEqual(cell, 23)
        self.assertLess(lo, t)
        self.assertLess(t, hi)
        self.assertLess(CAP-ROUNDING_UNIT, value)
        self.assertLess(value, CAP)
        self.assertEqual(ceil(value/ROUNDING_UNIT)*ROUNDING_UNIT, CAP)
        self.assertEqual(1/(Q(1953, 2000)*CAP+Q(47, 2000)), Q(500000000000, 356631775763))

    def test_omitting_vertex_or_discount_changes_the_cap(self):
        endpoints, cell, _ = max(self.cell_maxima(vertices=False))
        self.assertEqual(cell, 24)
        endpoint_cap = ceil(endpoints/ROUNDING_UNIT)*ROUNDING_UNIT
        self.assertEqual(endpoint_cap, 7063630115*ROUNDING_UNIT)
        self.assertLess(endpoint_cap, max(self.cell_maxima())[0])
        self.assertGreater(max(self.cell_maxima(discount=False))[0], CAP)


if __name__ == '__main__':
    unittest.main()
