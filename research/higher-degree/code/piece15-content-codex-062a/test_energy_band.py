"""Check binding of continuous energy certificates to the interpolated funded table."""
from copy import deepcopy
from fractions import Fraction as Q
import json
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parent))
import energy_band as band


class BandTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.nodes = [band.replay.funded_row(i)[1] for i in (0, 1)]
        cls.t_lo = band.first.geometry(0)[0]["t_lo"]
        cls.rows = json.loads((band.replay.HERE / "energy_band_0_4.json").read_text())

    def bind(self, rows):
        return band.bind(rows, (0, 4), self.nodes, self.t_lo)

    def test_enclosures_and_funding_at_every_endpoint(self):
        cells = self.bind(self.rows)
        self.assertEqual(len(cells), 8)
        us = [Q(n["u"]) for n in self.nodes]
        for i, c in enumerate(cells):
            for edge in (i, i + 1):
                ratio = Q(edge, 8)
                u = us[0] + (us[1] - us[0]) * ratio
                self.assertLessEqual(Q(c["u_lo"]), u)
                self.assertGreaterEqual(Q(c["u_hi"]), u)
                for endpoint in ("1", "2", "3", "4"):
                    v0, v1 = [Q(node["theta_chi"][endpoint]) for node in self.nodes]
                    self.assertLessEqual(Q(c["F_claimed"]), v0 + (v1 - v0) * ratio)
        public_bounds = [Q(25, 2), Q(95, 8), Q(179, 16), Q(169, 16),
                         Q(159, 16), Q(37, 4), Q(69, 8), Q(127, 16)]
        self.assertEqual([Q(c["F_claimed"]) for c in cells], public_bounds)

    def test_every_funded_bin_is_claimed_exactly_once(self):
        table_ends = sorted(map(int, self.nodes[0]["theta_chi"]))
        bins = list(zip([0] + table_ends[:-1], table_ends))
        covered = [interval for lo, hi in band.GROUPS for interval in bins
                   if lo <= interval[0] and interval[1] <= hi]
        self.assertEqual(covered, bins)

    def test_every_published_bound_matches_the_witness_on_its_whole_interval(self):
        note = band.replay.HERE.parents[1] / "sources/piece15-content-codex-062a/ENERGY_BAND.md"
        weights = [json.loads((band.replay.HERE / f"energy_band_{lo}_{hi}.json").read_text())
                   for lo, hi in band.GROUPS]
        cursor = Q(0)
        for line in note.read_text().splitlines():
            if not line.startswith("| ["):
                continue
            interval, *prices = (v.strip() for v in line.strip("|").split("|"))
            left, right = (Q(x.strip()) for x in interval.strip("[]").split(","))
            self.assertEqual(left, cursor)
            self.assertLess(left, right)
            for rows, price in zip(weights, prices, strict=True):
                witness, = [r for r in rows if Q(r["left"]) <= left < right <= Q(r["right"])]
                self.assertEqual(Q(price), Q(witness["F_claimed"]))
            cursor = right
        self.assertEqual(cursor, Q(1))

    def test_subdivisions_cover_the_declared_bins_and_energy_band(self):
        for lo, hi, count in [(4, 10, 26), (10, 16, 18), (16, 42, 84)]:
            with self.subTest(lo=lo, hi=hi):
                rows = json.loads((band.replay.HERE / f"energy_band_{lo}_{hi}.json").read_text())
                cells = band.bind(rows, (lo, hi), self.nodes, self.t_lo)
                self.assertEqual(len(cells), count)
                self.assertEqual({(c["chi_lo"], c["chi_hi"]) for c in cells}, {(lo, hi)})
                self.assertLessEqual(cells[0]["u_lo"], Q(self.nodes[0]["u"]))
                self.assertGreaterEqual(cells[-1]["u_hi"], Q(self.nodes[1]["u"]))
                for a, b in zip(cells, cells[1:]):
                    self.assertLess(a["u_lo"], b["u_lo"])
                    self.assertGreaterEqual(a["u_hi"], b["u_lo"])
                if lo == 16:
                    self.assertEqual({Q(c["F_claimed"]) for c in cells}, {Q(24)})
                    for node in self.nodes:
                        self.assertEqual({Q(node["theta_chi"][str(k)]) for k in (20, 24, 30, 36, 42)}, {Q(50)})

    def test_singletons_gaps_and_overlaps_do_not_cover_the_band(self):
        for i, field, value, msg in [(0, "right", "0", "outside"), (0, "right", "1/16", "gap"),
                                     (1, "left", "1/16", "overlap")]:
            with self.subTest(value=value):
                rows = deepcopy(self.rows)
                rows[i][field] = value
                with self.assertRaisesRegex(ValueError, msg):
                    self.bind(rows)
        with self.assertRaisesRegex(ValueError, "ends before"):
            self.bind(self.rows[:-1])

    def test_binding_checks_both_energy_endpoints_and_the_chi_bins(self):
        # The upper-energy endpoint has the smaller allowance in the last segment.
        rows = deepcopy(self.rows)
        rows[-1]["F_claimed"] = 8.0
        with self.assertRaisesRegex(ValueError, "allowance"):
            self.bind(rows)
        for change, msg in [({"chi_hi": 3}, "fourth-excess"), ({"u_lo": 0.023}, "fields"),
                            ({"parts": 0}, "subintervals"), ({"parts": 1.5}, "subintervals")]:
            rows = deepcopy(self.rows)
            rows[-1].update(change)
            with self.assertRaisesRegex(ValueError, msg):
                self.bind(rows)


if __name__ == "__main__":
    unittest.main()
