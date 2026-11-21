#!/usr/bin/env python3
"""Tests of scripts/local_build_targets.py. Run: python3 scripts/test_local_build_targets.py"""
import re
import sys
import tempfile
import unittest
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import local_build_targets as lbt  # noqa: E402

LOWER_CAP_RE = re.compile(
    r'^(Grothe\.LowerAnalytic\.Cap(Nodes|Row[0-9]+|Pieces)(\.|$)'
    r'|Grothe\.Lower\.(Envelope|RowData|MassRow)'
    r'|Grothe\.Lower(Target|Result)$)'
)
UPPER_SIX_RE = re.compile(r'^(Grothe\.UpperSix(\.|$)|Grothe\.UpperSixResult$)')
UPPER_MIX_RE = re.compile(r'^(Grothe\.UpperReplacement(\.|$)|Grothe\.UpperResult$)')
UPPER_HEAVY_RE = re.compile(r'^Grothe\.Upper(Quad|Chaos)(\.|$)')


def import_closure(root: Path, start: str, imports_fn=lbt.imports_of) -> set[str]:
    seen: set[str] = set()
    stack = [start]
    while stack:
        mod = stack.pop()
        if mod in seen:
            continue
        seen.add(mod)
        path = root.joinpath(*mod.split('.')).with_suffix('.lean')
        if path.is_file():
            stack.extend(imports_fn(path))
    return seen


def endpoint_separation_violations(root: Path, imports_fn=lbt.imports_of) -> list[str]:
    violations: list[str] = []
    checks = [
        ('Grothe.UpperResult', (LOWER_CAP_RE, UPPER_SIX_RE)),
        ('Grothe.UpperSixResult', (LOWER_CAP_RE, UPPER_MIX_RE, UPPER_HEAVY_RE)),
        ('Grothe.LowerResult', (UPPER_MIX_RE, UPPER_SIX_RE, UPPER_HEAVY_RE)),
    ]
    for endpoint, forbidden in checks:
        for mod in sorted(import_closure(root, endpoint, imports_fn)):
            if any(pat.match(mod) for pat in forbidden):
                violations.append(f'{endpoint} -> {mod}')
    return violations


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

    def test_endpoint_import_graphs_are_separated(self):
        root = Path(__file__).resolve().parent.parent
        self.assertEqual(endpoint_separation_violations(root), [])

    def test_separation_catches_direct_lower_cap_row_and_piece_imports(self):
        root = Path(__file__).resolve().parent.parent
        upper_path = root / 'Grothe/UpperResult.lean'
        for injected in ('Grothe.LowerAnalytic.CapRow00.Assembly',
                         'Grothe.LowerAnalytic.CapPieces.P00'):
            with self.subTest(injected=injected):
                def fake_imports(path: Path, extra=injected):
                    mods = list(lbt.imports_of(path))
                    if path == upper_path:
                        mods.append(extra)
                    return mods
                violations = endpoint_separation_violations(root, imports_fn=fake_imports)
                self.assertIn(f'Grothe.UpperResult -> {injected}', violations)


if __name__ == '__main__':
    unittest.main()
