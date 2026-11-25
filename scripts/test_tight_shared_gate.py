#!/usr/bin/env python3
"""Independent exact replay of the tight circular rows with their common gate. Agent-ID: codex-a7c4."""
from fractions import Fraction as Q
import json
from pathlib import Path
import re
import unittest


ROOT = Path(__file__).resolve().parents[1]
LOWER = ROOT / 'Grothe/Lower'
EPS = Q(25, 31)
PAD = Q(1, 10**11)
CUT = Q(9, 40)
EXCESS = Q(1018, 10**7)
SAVING = EXCESS * CUT**2
CAP = Q(70636501, 10**8)
ENDPOINT = Q(200000000000, 142653086453)


def rational(value):
    return Q(str(value).replace(' ', ''))


def header(index):
    name = f'row{index:02d}'
    source = (LOWER / f'RowData{index:02d}.lean').read_text()
    data = source.split(f'def {name} : Row :=', 1)[1]
    raw_header, node_data, _ = data.split('"', 2)
    fields = [Q(int(n), int(d or 1)) for n, d in
              re.findall(r'\((-?\d+) : ℚ\)(?: / (\d+))?', raw_header)]
    if len(fields) != 15:
        raise ValueError(f'Unexpected {name} header')
    return fields, node_data


def lean_table(source, declaration):
    data = source.split(f'def {declaration} :', 1)[1].split(':= [', 1)[1].split(']', 1)[0]
    return [tuple(map(rational, row.split(','))) for row in re.findall(r'⟨([^⟩]+)⟩', data)]


def completed_gate(row):
    """Coefficients of a + 2bu + 2cv + du² + 2euv + fv² at the normalized first coordinate."""
    delta = row[2]
    n11, n12, n13, n22, n23, n33 = row[6:12]
    g1, g2, g3 = (delta * value for value in row[12:15])
    return n11 - EPS + delta + 2*g1, n12 + g2, n13 + g3, n22, n23, n33


def gate_minimum(gate):
    a, b, c, d, e, f = gate
    schur = f - e**2/d
    if d <= 0 or schur <= 0:
        raise ValueError('Trailing gate block is not positive definite')
    return a - b**2/d - (c - b*e/d)**2/schur


def line_margin(a0, a2, left, right, value, slope):
    """Minimum of a0 + a2*x² minus the affine upper line on a closed interval or ray."""
    point = max(left, slope/(2*a2))
    if right is not None:
        point = min(right, point)
    return a0 + a2*point**2 - (value + slope*(point-left))


class TestTightSharedGate(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.data = json.loads((ROOT / 'data/antistein-rows/env_tight.json').read_text())
        cls.raw = [header(i)[0] for i in range(1, 15)]
        cls.tight_caps = {8: rational(cls.data['cap08']), 9: rational(cls.data['cap09'])}
        cls.source = (LOWER / 'EnvelopeTight.lean').read_text()
        mass = (LOWER / 'MassNodes.lean').read_text()
        cls.mass = rational(re.search(r'^def massS : ℚ := (.+)$', mass, re.M)[1])
        cls.rows = []
        for number, row in enumerate(cls.raw, 1):
            ell, beta = row[:2]
            cap = cls.tight_caps.get(number, row[5])
            cls.rows.append((ell, beta, 2*beta**2/EPS + cap + PAD))
        cls.cells = [(rational(lo), rational(hi), i, j, rational(weight))
                     for lo, hi, i, j, weight in cls.data['cells']]

    def test_row_names_indices_caps_and_cell_partition(self):
        self.assertEqual(self.tight_caps, {8: Q(1675841, 1250000), 9: Q(6809419, 5000000)})
        order = self.source.split('def rowDataTight : List Row := [', 1)[1].split(']', 1)[0]
        self.assertEqual(re.findall(r'\brow(\d\d)\b', order), [f'{i:02d}' for i in range(1, 15)])
        self.assertEqual(re.findall(r'\{ row(\d\d) with cap := cap(\d\d)Tight \}', order),
                         [('08', '08'), ('09', '09')])
        self.assertEqual(self.rows, lean_table(self.source, 'envRowsTight'))
        self.assertEqual(self.cells, lean_table(self.source, 'envCellsTight'))
        self.assertEqual(len(self.cells), 38)
        right = Q(0)
        for lo, hi, i, j, weight in self.cells:
            self.assertEqual(lo, right)
            self.assertGreater(hi, lo)
            self.assertTrue(0 <= i <= 14 and 0 <= j <= 14 and 0 <= weight <= 1)
            right = hi
        self.assertEqual(right, Q(9, 10))
        self.assertEqual([k for k, (_, _, i, j, _) in enumerate(self.cells) if {i, j} == {8, 9}],
                         list(range(20, 27)))

    def test_gate_surplus_is_joint(self):
        row8, row9 = self.raw[7:9]
        gate8, gate9 = completed_gate(row8), completed_gate(row9)
        baseline8, baseline9 = (r[3]*r[2]**2-r[2] for r in (row8, row9))
        self.assertGreaterEqual(gate_minimum(gate8), baseline8)
        self.assertGreaterEqual(gate_minimum(gate9), baseline9)
        joint = gate_minimum(tuple(x+y for x, y in zip(gate8, gate9))) - baseline8 - baseline9
        self.assertGreaterEqual(joint, EXCESS)
        self.assertLess(gate_minimum(gate8) + gate_minimum(gate9) - baseline8 - baseline9, EXCESS)
        self.assertEqual(SAVING, Q(41229, 8000000000))

    def test_small_scale_polynomial_against_the_raw_nodes_and_tight_cap(self):
        row, encoded = header(8)
        delta, kappa, smax = row[2:5]
        nodes = [tuple(map(Q, pair.split(':'))) for pair in encoded.split(';')]
        a0, a2 = Q(1339829981, 10**9), Q(11331869, 10**7)
        self.assertEqual(nodes[0][0], 0)
        self.assertEqual(len(nodes), 171)  # potential-cap knots, before the per-cell Stein mesh
        margins = []
        for (x, y), (xx, yy) in zip(nodes, nodes[1:]):
            self.assertGreater(xx, x)
            margins.append(line_margin(a0, a2, x, xx, y, (yy-y)/(xx-x)))
        x, y = nodes[-1]
        margins.append(line_margin(a0, a2, x, None, y, smax))
        self.assertGreaterEqual(min(margins), 0)
        self.assertLess(min(margins), Q(1, 100000))  # lowering the whole majorant by this much fails
        self.assertGreater(a2, kappa)
        # The moment bound is independent of x; it increases throughout 0 ≤ sigma ≤ delta*CUT.
        headroom = self.tight_caps[8] - (a0 + (a2-kappa)*(delta*CUT)**2)
        self.assertGreaterEqual(headroom, SAVING)
        self.assertLess(headroom, 2*SAVING)  # the rectangle cannot fund a double deduction

    def cell_caps(self, saving, active=(8, 9)):
        values = []
        for lo, hi, i, j, theta in self.cells:
            mid = (lo+hi)/2
            # Index zero is a cell-dependent mass tangent. Raw rowNN occupies index NN.
            rows = [(mid/2, Q(0), Q(1, 2)+self.mass+mid**2/2), *self.rows]
            ell1, beta1, c1 = rows[i]
            ell2, beta2, c2 = rows[j]
            weighted_cap = (1-theta)*c1 + theta*c2 - 2*(1-theta)*theta*(beta1-beta2)**2/EPS
            if {i, j} == set(active):
                # Either row can absorb the whole saving. The worse choice has the smaller weight.
                weighted_cap = max(weighted_cap-(1-theta)*saving, weighted_cap-theta*saving)
            ell = (1-theta)*ell1 + theta*ell2
            values.append(max(t*t-2*ell*t+weighted_cap for t in (lo, hi)))
        return values

    def test_all_38_caps_and_outward_rounding(self):
        original = self.cell_caps(Q(0))
        improved = self.cell_caps(SAVING)
        self.assertEqual(max(original), rational(self.data['worst']))
        self.assertEqual(original.index(max(original)), 23)
        self.assertEqual(improved.index(max(improved)), 26)
        self.assertEqual(self.cells[26][2:], (8, 9, Q(7, 8)))
        self.assertEqual(improved[26], original[26] - SAVING/8)
        self.assertTrue(CAP-Q(1, 10**10) < max(improved) <= CAP)
        self.assertGreater(max(original), CAP)
        self.assertGreater(max(self.cell_caps(SAVING, (7, 8))), CAP)
        self.assertEqual(1/((1-Q(47, 2000))*CAP+Q(47, 2000)), ENDPOINT)


if __name__ == '__main__':
    unittest.main()
