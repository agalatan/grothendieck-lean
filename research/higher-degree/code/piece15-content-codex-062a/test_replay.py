"""Fast negative controls for the piece-15 funding and tail checks."""
import copy
import json
from pathlib import Path
import sys
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parent))
import replay


class WitnessTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.cfg = replay.original.load_full_cfg(str(replay.SOURCE / "dual_certs.json"))
        cls.weights = json.loads((replay.HERE / "cells.json").read_text())

    def test_funded_bins_and_both_tails(self):
        cells = replay.bind_cells(self.cfg, self.weights)
        replay.audit_tails(self.cfg, cells)

    def test_single_point_leaves_a_bin_uncovered(self):
        weights = copy.deepcopy(self.weights)
        weights[0]["chi_lo"] = weights[0]["chi_hi"]
        with self.assertRaisesRegex(ValueError, "intervals"):
            replay.bind_cells(self.cfg, weights)

    def test_over_budget_and_wrong_energy(self):
        for change, msg in [({"F_claimed": 8.4}, "allowance"), ({"u_lo": 0.02}, "fields")]:
            with self.subTest(change=change):
                weights = copy.deepcopy(self.weights)
                weights[0].update(change)
                with self.assertRaisesRegex(ValueError, msg):
                    replay.bind_cells(self.cfg, weights)

    def test_invalid_multiplier_on_either_sector(self):
        for sector in ("slicesA", "slicesB"):
            with self.subTest(sector=sector):
                weights = copy.deepcopy(self.weights)
                weights[0][sector][0]["mu_u3"] = -1
                with self.assertRaisesRegex(ValueError, "mu_u3"):
                    replay.audit_tails(self.cfg, replay.bind_cells(self.cfg, weights))


if __name__ == "__main__":
    unittest.main()
