#!/usr/bin/env python3
"""Tests of tools/gen_root_imports.py: retired audit entries are still recognised after their sources left the tree.

Run: python3 scripts/test_gen_root_imports.py
"""
import importlib.util
import os
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


if __name__ == "__main__":
    unittest.main()
