#!/usr/bin/env python3
"""Regressions for mismatches between Lean data parsing and the table preflight.

Agent-ID: codex-40e8. Refs #335.
"""
import importlib.util
from pathlib import Path
import re
import unittest
from unittest.mock import patch


ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location("audit_port_tables", ROOT / "tools/audit_port_tables.py")
AUDIT = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(AUDIT)


class PortTableAuditTests(unittest.TestCase):
    def test_lean_comments_preserve_strings_and_token_boundaries(self):
        source = 'def x := "a/-keep-/--keep\\\"b" /- outer /- inner -/\nend -/ ++ "c" -- discard\n'
        self.assertEqual(AUDIT.without_comments(source),
                         'def x := "a/-keep-/--keep\\\"b"  \n ++ "c" \n')
        self.assertEqual(AUDIT.without_comments('def/-x-/name'), 'def name')
        for source in ('"unfinished', '/- unfinished', '/- outer /- inner -/'):
            with self.subTest(source=source), self.assertRaises(AUDIT.AuditError):
                AUDIT.without_comments(source)

    def test_center_parser_rejects_lean_invalid_tokens(self):
        path = "Grothe/UpperChaos/TaylorFirstData.lean"
        original = (ROOT / path).read_text()
        token = re.search(r'(?<=")-?[0-9]+:[0-9]+', original).group()
        for bad in (token[:1] + "/-audit-probe-/" + token[1:],
                    token.translate(str.maketrans("0123456789", "٠١٢٣٤٥٦٧٨٩"))):
            mutated = original.replace('"' + token, '"' + bad, 1)
            inputs = AUDIT.Inputs(ROOT)
            with self.subTest(token=bad), patch.object(inputs, "read", return_value=mutated), \
                    self.assertRaisesRegex(AUDIT.AuditError, "malformed center dyadic"):
                AUDIT.center_values(inputs, 1, 91, 206)

    def test_case_parser_accepts_ascii_cases_only(self):
        self.assertEqual(AUDIT.cases("def x : Fin 2 → ℤ\n | 0 => 12\n | _ => 34", "x", 2),
                         ["12", "34"])
        with self.assertRaises(AUDIT.AuditError):
            AUDIT.cases("def x : Fin 2 → ℤ\n | ٠ => 12\n | _ => 34", "x", 2)

    def test_bound_declarations_reject_hidden_shadowing(self):
        for extra in ("private def x := 2", "protected def x := 2", "abbrev x := 2",
                      "@[irreducible] def x := 2", "def Inner.x := 2",
                      "private def «x» := 2", "def «Inner space».«x» := 2"):
            with self.subTest(extra=extra), self.assertRaises(AUDIT.AuditError):
                AUDIT.body("def x := 1\n" + extra, "x")

    def test_partition_count_tracks_the_actual_bracket_lists(self):
        inputs = AUDIT.Inputs(ROOT)
        original_read = inputs.read
        baseline = AUDIT.partition_node_count(inputs)
        self.assertGreater(baseline, 0)

        def changed_read(path):
            text = original_read(path)
            if re.fullmatch(r"Grothe/UpperChaos/Q0LegendreRule[0-9]+\.lean", path):
                # Empty every rule's bracket list: the expanded partition now
                # has zero nodes, regardless of the committed panel orders.
                text = re.sub(r"(def brackets\s*:.*?:=\s*)\[.*?\]",
                              r"\g<1>[]", text, count=1, flags=re.S)
            return text

        with patch.object(inputs, "read", side_effect=changed_read):
            self.assertEqual(AUDIT.partition_node_count(inputs), 0)


if __name__ == "__main__":
    unittest.main()
