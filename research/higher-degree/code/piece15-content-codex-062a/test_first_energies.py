"""Regression tests for the first two funded rows on piece 15."""
import copy
from fractions import Fraction
import json
import math
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parent))
import first_energies as first
import replay


class FirstEnergiesTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.weights = json.loads((replay.HERE / "first_energies.json").read_text())

    def test_certificates_cover_the_exact_energy_nodes(self):
        cells = first.bind(self.weights)
        self.assertEqual([(c["u_idx"], c["chi_lo"], c["chi_hi"], c["F_claimed"]) for c in cells],
                         [(0, 0, 10, 11), (0, 10, 42, 32), (1, 0, 16, 6.375), (1, 16, 42, 32)])
        for index, active_count in enumerate((7, 10)):
            row = cells[2 * index]
            t, node = replay.funded_row(index)
            u = Fraction(node["u"])
            self.assertLessEqual(Fraction(row["u_lo"]), u)
            self.assertLessEqual(u, Fraction(row["u_hi"]))
            self.assertEqual(math.nextafter(row["u_lo"], math.inf), row["u_hi"])
            self.assertLessEqual(Fraction(row["t_lo"]), t)
            self.assertGreater(Fraction(math.nextafter(row["t_lo"], math.inf)), t)
            allowances = [Fraction(value) for value in node["theta_chi"].values()]
            self.assertEqual((len(allowances), sum(value < 50 for value in allowances)), (15, active_count))

    def test_both_rows_are_required_and_bound_to_the_correct_bins(self):
        with self.assertRaisesRegex(ValueError, "energy rows"):
            first.bind({"0.60": self.weights["0.60"]})
        with self.assertRaisesRegex(ValueError, "intervals"):
            first.bind({"0.60": self.weights["0.70"], "0.70": self.weights["0.60"]})
        weights = copy.deepcopy(self.weights)
        weights["0.70"][1]["chi_lo"] = 20
        with self.assertRaisesRegex(ValueError, "intervals"):
            first.bind(weights)

    def test_witness_cannot_override_geometry_or_exceed_either_limit(self):
        for change, reason in [({"u_idx": 2}, "fields"), ({"t_lo": 1}, "fields"),
                               ({"F_claimed": 6.4}, "allowance"), ({"F_claimed": 6.38}, "published bound")]:
            with self.subTest(change=change):
                weights = copy.deepcopy(self.weights)
                weights["0.70"][0].update(change)
                with self.assertRaisesRegex(ValueError, reason):
                    first.bind(weights)


if __name__ == "__main__":
    unittest.main()
