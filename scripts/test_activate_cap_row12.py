#!/usr/bin/env python3
"""Row12 activation boundaries and current-source reproducibility; no Lean builds.

Agent-ID: codex-0e12.
"""
import contextlib
import importlib.util
import io
from pathlib import Path
import tempfile
import unittest
import warnings
from unittest.mock import patch

SPEC = importlib.util.spec_from_file_location(
    "row12_activation_test", Path(__file__).resolve().parents[1] / "tools/activate_cap_row12.py")
ACTIVATE = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(ACTIVATE)


class ActivationTests(unittest.TestCase):
    def test_default_cli_regenerates_without_consulting_a_historical_candidate(self):
        with patch.object(ACTIVATE, "activation_plan", return_value=({}, {}, {"canonical_base": "fixture"})) as plan, \
                contextlib.redirect_stdout(io.StringIO()):
            self.assertEqual(ACTIVATE.main(["--check"]), 0)
        plan.assert_called_once_with(None)

    def test_explicit_missing_candidate_fails_before_regeneration(self):
        with tempfile.TemporaryDirectory() as temp, patch.object(ACTIVATE, "activation_plan") as plan, \
                contextlib.redirect_stderr(io.StringIO()):
            self.assertEqual(ACTIVATE.main(["--candidate", str(Path(temp) / "missing")]), 1)
        plan.assert_not_called()

    def test_exact_shared_hunks_preserve_later_source(self):
        for name, (old, new) in ACTIVATE.SHARED.items():
            with self.subTest(name=name):
                before = ("-- later header\n" + old + "\n-- later proof\n").encode()
                after = ACTIVATE.patched_shared(name, before)
                self.assertIn(new.encode(), after)
                self.assertTrue(after.startswith(b"-- later header\n"))
                self.assertTrue(after.endswith(b"-- later proof\n"))
                self.assertEqual(ACTIVATE.patched_shared(name, after), after)

    def test_shared_hunks_fail_closed_on_unknown_or_ambiguous_source(self):
        for name, (old, _) in ACTIVATE.SHARED.items():
            for source in ["changed definition", old + "\n" + old]:
                with self.subTest(name=name, source=source):
                    with self.assertRaises(ValueError):
                        ACTIVATE.patched_shared(name, source.encode())

    def test_registry_union_preserves_existing_names_and_comments(self):
        actual = ACTIVATE.registered_list(b"# existing policy\nForeign.z\nForeign.a\n",
                                          additions=["Row12.fact"], removals=["Foreign.z"])
        self.assertEqual(actual, b"# existing policy\nForeign.a\nRow12.fact\n")

    def test_report_preserves_existing_theorems_and_rejects_unexpected_body(self):
        actual = ACTIVATE.registered_report(b"import Grothe\n\n#print axioms Foreign.fact\n", ["Row12.fact"])
        self.assertEqual(actual, b"import Grothe\n\n#print axioms Foreign.fact\n#print axioms Row12.fact\n")
        for source in [b"import Other\n", b"import Grothe\n\nset_option autoImplicit false\n"]:
            with self.assertRaises(ValueError):
                ACTIVATE.registered_report(source, ["Row12.fact"])

    def test_paths_cannot_escape_through_parent_absolute_or_symlink(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            (root / "link").symlink_to(root.parent)
            for name in ["../foreign.lean", "/tmp/foreign.lean", "link/foreign.lean"]:
                with self.subTest(name=name), self.assertRaises(ValueError):
                    ACTIVATE.safe_path(root, name)

    def test_concurrent_source_change_prevents_every_publication(self):
        with tempfile.TemporaryDirectory() as temp:
            root = Path(temp)
            (root / "first").write_bytes(b"old")
            (root / "second").write_bytes(b"foreign change")
            with patch.object(ACTIVATE, "ROOT", root), self.assertRaises(ValueError):
                ACTIVATE.publish({"first": b"new", "second": b"new"},
                                 {"first": b"old", "second": b"old"})
            self.assertEqual((root / "first").read_bytes(), b"old")
            self.assertEqual((root / "second").read_bytes(), b"foreign change")

    def test_active_sources_and_strict_audit_match_full_regeneration(self):
        # The inherited generator opens short-lived text files without context
        # managers; suppress its ResourceWarning noise, preserving source bytes.
        with warnings.catch_warnings():
            warnings.simplefilter("ignore", ResourceWarning)
            desired, observed, metadata = ACTIVATE.activation_plan()
        self.assertEqual(desired, observed)
        self.assertEqual(len(metadata["native_declarations"]), 1307)
        self.assertEqual(len(metadata["compute_roots"]), 1307)
        self.assertEqual(metadata["remaining_global_rows"], [13, 14, 15])
        native = desired["data/axioms/native.txt"].decode().splitlines()
        required = desired["data/axioms/required.txt"].decode().splitlines()
        prints = desired["scratch/Axioms.lean"].decode().splitlines()
        for theorem in metadata["native_declarations"]:
            self.assertIn(theorem + ACTIVATE.NATIVE_SUFFIX, native)
            self.assertIn(theorem, required)
            self.assertIn("#print axioms " + theorem, prints)


if __name__ == "__main__":
    unittest.main()
