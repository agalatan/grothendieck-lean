"""Check whole-bin coverage, funding and witness selection on the second piece-15 band."""
from copy import deepcopy
from fractions import Fraction as Q
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parent))
import second_band as second
from second_band import first, replay


class SecondBandTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.nodes = [replay.funded_row(i)[1] for i in (1, 2)]
        cls.t_lo = first.geometry(1)[0]["t_lo"]
        cls.packages = {group: second.load_package(group) for group in second.GROUPS}

    def test_eleven_bins_on_the_entire_closed_energy_interval(self):
        covered = []
        endpoints = sorted(map(int, self.nodes[0]["theta_chi"]))
        u0, u1 = map(Q, ("0.02530638177604116", "0.02819853969330301"))
        self.assertEqual([Q(n["u"]) for n in self.nodes], [u0, u1])
        for group, package in self.packages.items():
            cells = second.bind(package, group, self.nodes, self.t_lo)
            ends = [k for k in endpoints if group[0] < k <= group[1]]
            covered.extend(ends)
            cursor = Q(0)
            for (left, right, _), c in zip(package["rectangles"], cells, strict=True):
                self.assertEqual(Q(left), cursor)
                self.assertLess(Q(left), Q(right))
                self.assertEqual((c["u_idx"], c["row_tag"], c["chi_lo"], c["chi_hi"]), (1, "0.855", *group))
                for x in (Q(left), Q(right)):
                    u = u0 + x * (u1 - u0)
                    self.assertLessEqual(Q(c["u_lo"]), u)
                    self.assertLessEqual(u, Q(c["u_hi"]))
                    for k in ends:
                        a, b = [Q(n["theta_chi"][str(k)]) for n in self.nodes]
                        self.assertLessEqual(Q(c["F_claimed"]), a + x * (b - a))
                cursor = Q(right)
            self.assertEqual(cursor, Q(1))
        self.assertEqual(covered, [1, 2, 3, 4, 6, 8, 20, 24, 30, 36, 42])

    def test_tight_right_endpoint_rejects_the_previous_50_allowance(self):
        package = deepcopy(self.packages[16, 20])
        index = package["rectangles"][-1][2]
        package["witnesses"][index]["F_claimed"] = 50
        with self.assertRaisesRegex(ValueError, "exceeds its interpolated allowance"):
            second.bind(package, (16, 20), self.nodes, self.t_lo)

    def test_out_of_range_and_negative_witness_indices(self):
        package = deepcopy(self.packages[16, 20])
        for invalid in (False, -1, len(package["witnesses"])):
            with self.subTest(index=invalid):
                package["rectangles"][-1][2] = invalid
                with self.assertRaisesRegex(ValueError, "invalid witness index"):
                    second.bind(package, (16, 20), self.nodes, self.t_lo)


if __name__ == "__main__":
    unittest.main()
