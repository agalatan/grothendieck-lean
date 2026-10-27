"""Exact arithmetic and reproducibility checks for the candidate recipe."""
from fractions import Fraction as Q
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest


ROOT = Path(__file__).resolve().parents[1]
SCRIPT = ROOT / "tools/gen_haagerup_certificate.py"
spec = importlib.util.spec_from_file_location("haagerup_certificate", SCRIPT)
candidate = importlib.util.module_from_spec(spec)
spec.loader.exec_module(candidate)


class ExactCertificateTests(unittest.TestCase):
    def recipe(self):
        return dict(degree=3, leading_bits=8, coefficient_bits=8,
                    resolvent_degree=8, resolvent_bits=8, seed_power=17,
                    seed_cap="249/500", defect_cap="1/1000000000000")

    def test_first_inverse_coefficients(self):
        self.assertEqual(candidate.inverse_coefficients(3),
                         [Q(1), -Q(1, 8), Q(0), -Q(1, 1024)])

    def test_geometric_reciprocal(self):
        self.assertEqual(candidate.reciprocal_coefficients([Q(1)], 4),
                         [Q(1)] * 5)

    def test_leading_grid_endpoint(self):
        self.assertEqual(candidate.leading_coefficient([Q(1), Q(1, 8)], 4), Q(7, 8))

    def test_nearest_dyadic_ties_to_even(self):
        for source, expected in [(Q(5, 8), Q(1, 2)), (Q(7, 8), Q(1)),
                                 (-Q(5, 8), -Q(1, 2)), (-Q(7, 8), -Q(1))]:
            self.assertEqual(candidate.nearest_dyadic(source, 2), expected)

    def test_toward_zero_for_both_signs(self):
        self.assertEqual(candidate.toward_zero(Q(7, 8), 2), Q(3, 4))
        self.assertEqual(candidate.toward_zero(-Q(7, 8), 2), -Q(3, 4))

    def test_rejects_noninteger_bit_count(self):
        recipe = self.recipe()
        recipe["leading_bits"] = True
        with self.assertRaises(ValueError):
            candidate.generate(recipe)

    def test_rejects_noncontractive_defect(self):
        recipe = self.recipe()
        recipe["defect_cap"] = "1"
        with self.assertRaises(ValueError):
            candidate.generate(recipe)

    def test_cli_check_rejects_tamper_without_writing(self):
        with tempfile.TemporaryDirectory(prefix="haagerup-recipe-") as temporary:
            directory = Path(temporary)
            recipe, output = directory / "recipe.json", directory / "certificate.json"
            recipe.write_text(json.dumps(self.recipe()))
            command = [sys.executable, str(SCRIPT), "--recipe", str(recipe), "--out", str(output)]
            subprocess.run(command, check=True, capture_output=True, text=True)
            subprocess.run(command + ["--check"], check=True, capture_output=True, text=True)
            altered = output.read_text().replace('"seed_power": 17', '"seed_power": 19')
            output.write_text(altered)
            result = subprocess.run(command + ["--check"], capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertEqual(output.read_text(), altered)


if __name__ == "__main__":
    unittest.main()
