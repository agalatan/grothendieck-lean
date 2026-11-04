#!/usr/bin/env python3
"""Reject malformed original-row certificates before emitting Lean inputs.

Agent-ID: codex-aa04. Refs #293, #21. These tests are not Lean acceptance.
"""

from contextlib import contextmanager
import gzip
import json
import unittest

import gen_row227_certificate as cert


class Row227CertificateTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.inputs = cert.load_inputs()
        cls.packet = json.loads(gzip.decompress((cert.DATA / "certificate.json.gz").read_bytes()))

    @contextmanager
    def changed(self, field):
        packet = dict(self.packet)
        packet[field] = [list(row) if isinstance(row, list) else row for row in packet[field]]
        yield packet

    def rejects(self, packet, why):
        with self.assertRaisesRegex(ValueError, why):
            cert.verify(packet, self.inputs)

    def test_original_packet_and_nontrivial_errors(self):
        result = cert.verify(self.packet, self.inputs)
        self.assertEqual(result["triangle_entries"], 63503)
        self.assertEqual(result["selected_modes"], 31877)
        self.assertGreater(int(result["normalized_sum_sq"]), 0)
        self.assertGreater(int(result["saved_sum_sq"]), 0)

    def test_dropped_ratio(self):
        with self.changed("ratios") as packet:
            packet["ratios"].pop(2000)
            self.rejects(packet, "ratio/root coverage")

    def test_duplicate_triangle_checkpoint(self):
        with self.changed("coefficients") as packet:
            packet["coefficients"][400] = list(packet["coefficients"][399])
            self.rejects(packet, "exact triangle coverage")

    def test_inward_ratio_endpoint(self):
        with self.changed("ratios") as packet:
            packet["ratios"][0][0] += 1
            self.rejects(packet, "ratio step 0")

    def test_inward_coefficient_endpoint(self):
        with self.changed("coefficients") as packet:
            packet["coefficients"][1][2] += 1
            self.rejects(packet, "signed recurrence 0,1")

    def test_zero_row_sign_error(self):
        with self.changed("coefficients") as packet:
            row = packet["coefficients"][1]
            row[2], row[3] = -row[3], -row[2]
            self.rejects(packet, "signed recurrence 0,1")

    def test_missing_selected_mode(self):
        with self.changed("selected") as packet:
            packet["selected"].pop()
            self.rejects(packet, "exact selected coverage")

    def test_wrong_original_word(self):
        with self.changed("selected") as packet:
            packet["selected"][0][3] ^= 1
            self.rejects(packet, "original saved word")

    def test_wrong_production_rank(self):
        with self.changed("selected") as packet:
            packet["selected"][-1][2] -= 1
            self.rejects(packet, "selected rank")

    def test_changed_source_cutoff(self):
        packet = dict(self.packet, source_cutoff=502)
        self.rejects(packet, "header source_cutoff")

    def test_hidden_error_radius(self):
        with self.changed("selected") as packet:
            row = next(r for r in packet["selected"] if r[5] > 0)
            row[5] = 0
            self.rejects(packet, "selected enclosure radius")

    def test_source_ranks_at_storage_boundaries(self):
        # Independently enumerate the original diagonal storage layout.
        pairs = cert.storage_keys()
        for pair in [(0, 0), (1, 0), (0, 265), (251, 250), (266, 265)]:
            self.assertEqual(cert.rank(*pair), pairs.index(pair))
        self.assertEqual(cert.rank(251, 250), 35536)
        self.assertEqual(cert.rank(0, 1000), 0)


if __name__ == "__main__":
    unittest.main()
