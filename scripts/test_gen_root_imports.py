#!/usr/bin/env python3
"""Tests of tools/gen_root_imports.py: retired audit entries are still recognised after their sources left the tree.

Run: python3 scripts/test_gen_root_imports.py
"""
import importlib.util
import os
import shutil
import tempfile
import unittest

ROOT = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
spec = importlib.util.spec_from_file_location("gen_root_imports", os.path.join(ROOT, "tools", "gen_root_imports.py"))
gen = importlib.util.module_from_spec(spec)
spec.loader.exec_module(gen)


class RetiredEntries(unittest.TestCase):
    def setUp(self):
        self.names, self.mods = gen.archived()

    def test_old_audit_line_of_a_deleted_module_is_archived(self):
        # A real line of scratch/Axioms.lean at commit 36ab13004; its module was deleted from abandonware/ by #767.
        line = "#print axioms Grothe.LowerAnalytic.QuarticNewton.contraction_factor_iff"
        self.assertTrue(gen.is_archived(line, self.names, self.mods))

    def test_audited_declarations_of_the_quadratic_polynomial_modules_are_archived(self):
        # Five names that the generator recognised before #767 and a first version of the index missed (codex-a7c4);
        # momentValue_zero is line 12256 of scratch/Axioms.lean at 36ab13004.
        for name in ("Grothe.UpperChaos.QuadraticPolynomialMoments.momentValue_zero",
                     "Grothe.UpperChaos.QuadraticPolynomialMoments.integral_mixed_monomial",
                     "Grothe.UpperChaos.QuadraticPolynomialMoments.integral_finite_mixed_polynomial",
                     "Grothe.UpperChaos.QuadraticPolynomialIntegrability.quadraticForm_lower_bound",
                     "Grothe.UpperChaos.QuadraticPolynomialIntegrability.integrable_finite_mixed_polynomial"):
            self.assertTrue(gen.is_archived("#print axioms " + name, self.names, self.mods), name)
            self.assertTrue(gen.is_archived(name, self.names, self.mods), name)

    def test_import_of_a_deleted_module_is_archived(self):
        self.assertTrue(gen.is_archived("import Grothe.LowerAnalytic.QuarticNewton", self.names, self.mods))

    def test_module_still_under_abandonware_is_archived(self):
        self.assertTrue(gen.is_archived("import Grothe.TransferHilbert", self.names, self.mods))

    def test_active_declarations_are_not_archived(self):
        for line in ("#print axioms Grothe.Statement.main_bounds", "import Grothe.MainResult",
                     "Grothe.Statement.main_bounds"):
            self.assertFalse(gen.is_archived(line, self.names, self.mods))

    def test_index_is_sorted_without_duplicates_and_names_nothing_active(self):
        with open(os.path.join(ROOT, gen.RETIRED), encoding="utf-8") as f:
            lines = [l.rstrip("\n") for l in f]
        self.assertEqual(lines, sorted(set(lines)))
        for l in lines:
            self.assertRegex(l, r"^(decl|module) \S+$")

    def test_current_lists_have_no_archived_entry(self):
        self.assertEqual([p for p in gen.list_problems() if "archived" in p], [])


class MovedBack(unittest.TestCase):
    """A retired declaration that becomes active again is no longer archived, also when it is root-qualified."""

    NAME = "Grothe.LowerAnalytic.QuarticNewton.contraction_factor_iff"

    def test_root_qualified_declaration_is_read_from_the_root(self):
        with tempfile.TemporaryDirectory() as tmp:
            path = os.path.join(tmp, "X.lean")
            with open(path, "w", encoding="utf-8") as f:
                f.write("namespace Grothe.Other\n\ntheorem _root_." + self.NAME + " : True := True.intro\n\n"
                        "theorem inner : True := True.intro\n\nend Grothe.Other\n")
            self.assertEqual(gen.declarations([path]), {self.NAME, "Grothe.Other.inner"})

    def test_moving_a_retired_theorem_back_keeps_its_audit(self):
        with tempfile.TemporaryDirectory() as tmp:
            os.makedirs(os.path.join(tmp, "Grothe", "LowerAnalytic"))
            os.makedirs(os.path.join(tmp, "abandonware"))
            shutil.copy(os.path.join(ROOT, gen.RETIRED), os.path.join(tmp, gen.RETIRED))
            with open(os.path.join(tmp, "Grothe", "LowerAnalytic", "Back.lean"), "w", encoding="utf-8") as f:
                f.write("namespace Grothe.Other\n\ntheorem _root_." + self.NAME + " : True := True.intro\n\n"
                        "end Grothe.Other\n")
            old_root, gen.ROOT = gen.ROOT, tmp
            try:
                names, mods = gen.archived()
            finally:
                gen.ROOT = old_root
            self.assertFalse(gen.is_archived("#print axioms " + self.NAME, names, mods))
            self.assertFalse(gen.is_archived(self.NAME, names, mods))
            # a retired name that did not come back is still archived there
            self.assertTrue(gen.is_archived("Grothe.UpperChaos.QuadraticPolynomialMoments.momentValue_zero", names, mods))


if __name__ == "__main__":
    unittest.main()
