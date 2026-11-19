#!/usr/bin/env python3
"""Tests of scripts/local_build_targets.py. Run: python3 scripts/test_local_build_targets.py"""
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import local_build_targets as lbt  # noqa: E402


def write(root: Path, rel: str, text: str) -> None:
    p = root / rel
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(text, encoding='utf-8')


class ImportsOf(unittest.TestCase):
    def test_header_only(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            write(root, 'M.lean', '-- a comment\n/- a block\nimport Not.This\n-/\nimport Mathlib\nimport Grothe.A\n\n'
                                  '/-!\n# Doc\nimport Grothe.InDoc\n-/\nimport Grothe.B\ntheorem t : True := trivial\n'
                                  'import Grothe.Late\n')
            self.assertEqual(lbt.imports_of(root / 'M.lean'), ['Mathlib', 'Grothe.A', 'Grothe.B'])

    def test_one_line_block_comment(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            write(root, 'M.lean', '/- one line -/\nimport Grothe.A\n')
            self.assertEqual(lbt.imports_of(root / 'M.lean'), ['Grothe.A'])


class Plan(unittest.TestCase):
    def tree(self, root: Path) -> None:
        write(root, 'data/local-build-exclude.txt', '# comment\n\nGrothe\\.Heavy\\..*\nGrothe\\.Caps[0-9]+(\\..*)?\n')
        write(root, 'Grothe.lean', 'import Grothe.A\nimport Grothe.B\nimport Grothe.Heavy.H\nimport Grothe.C\n'
                                   'import Grothe.D\nimport Grothe.Caps12\nimport Grothe.Caps12.Piece\nimport Grothe.E\n')
        write(root, 'Grothe/A.lean', 'import Mathlib\n')
        write(root, 'Grothe/B.lean', 'import Grothe.A\n')
        write(root, 'Grothe/Heavy/H.lean', 'import Grothe.A\n')
        write(root, 'Grothe/C.lean', 'import Grothe.Heavy.H\n')           # imports a skipped module
        write(root, 'Grothe/D.lean', 'import Grothe.C\nimport Grothe.B\n')  # imports it through C
        write(root, 'Grothe/Caps12.lean', 'import Grothe.A\n')
        write(root, 'Grothe/Caps12/Piece.lean', 'import Grothe.A\n')
        write(root, 'Grothe/E.lean', 'import Grothe.Hidden\n')            # through a module the root does not import
        write(root, 'Grothe/Hidden.lean', 'import Grothe.Caps12.Piece\n')

    def test_plan(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            self.tree(root)
            roots, matched, dependents, targets = lbt.plan(root)
            self.assertEqual(len(roots), 8)
            self.assertEqual(matched, ['Grothe.Heavy.H', 'Grothe.Caps12', 'Grothe.Caps12.Piece'])
            self.assertEqual(dependents, ['Grothe.C', 'Grothe.D', 'Grothe.E'])
            self.assertEqual(targets, ['Grothe.A', 'Grothe.B'])

    def test_patterns_match_the_whole_name(self):
        with tempfile.TemporaryDirectory() as d:
            root = Path(d)
            write(root, 'data/local-build-exclude.txt', 'Grothe\\.Cap\n')
            write(root, 'Grothe.lean', 'import Grothe.Cap\nimport Grothe.CapMajorant\n')
            write(root, 'Grothe/Cap.lean', '')
            write(root, 'Grothe/CapMajorant.lean', '')
            _, matched, dependents, targets = lbt.plan(root)
            self.assertEqual((matched, dependents, targets), (['Grothe.Cap'], [], ['Grothe.CapMajorant']))


class Repository(unittest.TestCase):
    """The real tree: the node caps and the upper-bound trees are skipped, the lower chain is built."""

    def test_repository(self):
        root = Path(__file__).resolve().parent.parent
        roots, matched, dependents, targets = lbt.plan(root)
        self.assertEqual(len(roots), len(matched) + len(dependents) + len(targets))
        t = set(targets)
        for needed in ['Grothe.LowerAnalytic.CapMajorant', 'Grothe.LowerAnalytic.CapPiece',
                       'Grothe.LowerAnalytic.Witness', 'Grothe.Lower.RowDataTypes']:
            self.assertIn(needed, t)
        for skipped in ['Grothe.LowerAnalytic.CapNodes', 'Grothe.MainResult']:
            self.assertNotIn(skipped, t)
        self.assertFalse([m for m in targets if '.CapPieces.' in m or m.startswith('Grothe.UpperChaos.')])
        self.assertLess(len(targets), 1000)


if __name__ == '__main__':
    unittest.main()
