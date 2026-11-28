"""Check piece 15's middle-bin claim against the funded table and submitted intervals."""
from copy import deepcopy
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys
import tempfile
import unittest

sys.path.insert(0, str(Path(__file__).resolve().parent))
import middle_prefix as mid


class MiddlePrefixTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.groups = json.loads((mid.replay.HERE / "middle_prefix.json").read_text())

    def test_exact_funding_at_each_rectangle_corner(self):
        nodes = [mid.replay.funded_row(i)[1] for i in (1, 2)]
        energies = [Q(n["u"]) for n in nodes]
        self.assertEqual(energies, [Q("0.02530638177604116"), Q("0.02819853969330301")])
        cells = iter(mid.bind(self.groups))
        for group in self.groups:
            lo, hi = group["chi"]
            prices = [Q(n["theta_chi"][str(hi)]) for n in nodes]
            left = Q(0)
            for right, price, _, _ in group["intervals"]:
                c = next(cells)
                self.assertEqual((c["piece_idx"], c["u_idx"], c["row_tag"], c["chi_lo"], c["chi_hi"]),
                                 (15, 1, "0.855", lo, hi))
                right = Q(right)
                self.assertLess(left, right)
                self.assertEqual(Q(c["F_claimed"]), Q(price))
                for x in (left, right):
                    u = energies[0] + x * (energies[1] - energies[0])
                    self.assertLessEqual(Q(c["u_lo"]), u)
                    self.assertLessEqual(u, Q(c["u_hi"]))
                    self.assertLessEqual(Q(price), prices[0] + x * (prices[1] - prices[0]))
                left = right
            self.assertEqual(left, Q(group["through"]))
        self.assertIsNone(next(cells, None))

    def test_published_endpoints_and_stream(self):
        self.assertEqual([g["through"] for g in self.groups], ["13/64", "63/256", "83/256", "139/256"])
        cells = mid.bind(self.groups)
        cfg = mid.replay.original.load_full_cfg(str(mid.replay.SOURCE / "dual_certs.json"))
        with tempfile.TemporaryDirectory() as directory:
            data = Path(directory) / "middle.dat"
            stream = mid.replay.original.emit_dat_from_json(dict(cfg, cells=cells), data)
            self.assertEqual(data.read_bytes(), stream)
        self.assertEqual(hashlib.sha256(stream).hexdigest(),
                         "c0b585465ceb78f96395ba22a93d7be566500e20b0b77a6bbb3dbbc145d8cd4a")

    def test_original_40_rectangles_and_extension_sources(self):
        original = deepcopy(self.groups)
        donors = set()
        for group, count in zip(original, [15, 11, 7, 7]):
            for _, _, a, b in group["intervals"][count:]:
                donors.update([a, b])
            group["intervals"] = group["intervals"][:count]
            group["through"] = group["intervals"][-1][0]
        self.assertEqual(donors, set(mid.load_fits()))
        cfg = mid.replay.original.load_full_cfg(str(mid.replay.SOURCE / "dual_certs.json"))
        stream = mid.replay.original.emit_dat_bytes(dict(cfg, cells=mid.bind(original)))
        self.assertEqual(hashlib.sha256(stream).hexdigest(),
                         "d5f214e862f259850007d5946ef2233ec12edc54ba3b62e853ecd2d4a3306c5b")

    def test_truncated_last_rectangle(self):
        rows = deepcopy(self.groups)
        rows[0]["intervals"].pop()
        with self.assertRaisesRegex(ValueError, "wrong endpoint"):
            mid.bind(rows)

    def test_price_and_witness_must_be_valid(self):
        for column, value, reason in [(1, "100", "unfunded"), (1, "1/3", "non-dyadic"),
                                      (2, "unpublished", "unknown published")]:
            with self.subTest(value=value):
                rows = deepcopy(self.groups)
                rows[0]["intervals"][0][column] = value
                with self.assertRaisesRegex(ValueError, reason):
                    mid.bind(rows)


if __name__ == "__main__":
    unittest.main()
