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

    def test_under_allowance_but_above_published_bound(self):
        weights = copy.deepcopy(self.weights)
        weights[0]["F_claimed"] = 4.82184
        with self.assertRaisesRegex(ValueError, "published bound"):
            replay.bind_cells(self.cfg, weights)

    def test_receipt_must_match_the_stream_and_cell(self):
        cell = replay.bind_cells(self.cfg, self.weights)[0]
        rec = {k: cell[k] for k in ("kind", "u_idx", "u_lo", "u_hi", "t_lo", "chi_lo", "chi_hi")}
        rec.update(piece=cell["piece_idx"], row=cell["row_tag"], F_certified=cell["F_claimed"],
                   worst_M_A=-0.01, worst_M_B=-0.01, g1_range_A=[-0.02, 0.10], g1_range_B=[-0.01, 0.10])
        digest = "a" * 64
        receipt = {"dat_sha256": digest, "status": "CERTIFIED", "cells": [rec]}
        with self.assertRaisesRegex(ValueError, "certificate input"):
            replay.check_receipt(receipt, [cell], "b" * 64)
        for field, value in [("kind", "INFEAS_R1"), ("u_hi", 0.5)]:
            with self.subTest(field=field), self.assertRaisesRegex(ValueError, "cell mismatch"):
                replay.check_receipt({**receipt, "cells": [{**rec, field: value}]}, [cell], digest)

        replay.check_receipt(receipt, [cell], digest)
        for field in ("g1_range_A", "g1_range_B"):
            for value in (None, [0.01, 0.10], [-1, 0.10], [-0.01, 1], [False, 0.10]):
                with self.subTest(field=field, value=value), self.assertRaisesRegex(ValueError, field):
                    replay.check_receipt({**receipt, "cells": [{**rec, field: value}]}, [cell], digest)

    def test_gap_in_either_sector(self):
        for sector in ("slicesA", "slicesB"):
            cells = replay.bind_cells(self.cfg, copy.deepcopy(self.weights))
            slices = cells[0][sector]
            slices[1]["a_r"] = (slices[0]["b_r"] + slices[1]["b_r"]) / 2
            with self.subTest(sector=sector), self.assertRaisesRegex(ValueError, "gap"):
                replay.audit_tails(self.cfg, cells)

    def test_invalid_multiplier_on_either_sector(self):
        for sector in ("slicesA", "slicesB"):
            with self.subTest(sector=sector):
                weights = copy.deepcopy(self.weights)
                weights[0][sector][0]["mu_u3"] = -1
                with self.assertRaisesRegex(ValueError, "mu_u3"):
                    replay.audit_tails(self.cfg, replay.bind_cells(self.cfg, weights))


if __name__ == "__main__":
    unittest.main()
