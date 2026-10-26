#!/usr/bin/env python3
"""Completeness and exact data-binding regressions; no Lean or optimizer runs."""
import copy
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
import caps_rest_inventory as I


class InventoryTests(unittest.TestCase):
    def setUp(self):
        self.rows = [{'name': I.ROWS.get(k, str(k)), 'nodes': '0:1;1:1;2:1'} for k in range(19)]
        self.reference = [[['0', '1'], ['1', '1'], ['2', '1']] for _ in self.rows]
        self.chords = [[(1, 0, 2)] for _ in self.rows]
        self.grids = [[400, 128, '1/50'], [1600, 256, '1/200'], [1600, 1024, '1/200']]
        self.recipes, self.pieces = {}, []
        for k in I.ROWS:
            self.recipes[k] = [{'k': i, 's': str(i), 'g': 1, 'v0': ['0']*12,
                                'var': [], 'scale': '1'} for i in (0, 2)]
            self.pieces.append({'k': k, 'i': 2, 's': '2', 'cap': '1', 'ds': [','.join(['0']*12)]*3,
                                'pieces': [{'nq': 256, 'recipe': ','.join(['0']*12)+'|1',
                                            'cons': ['2,+,-1,1,0,0']}]})

    def run_audit(self):
        return I.audit(self.rows, self.reference, self.chords, self.pieces, self.recipes,
                       self.grids[:2], self.grids)

    def test_exact_partition_has_no_acceptance_claim_and_preserves_inputs(self):
        before = copy.deepcopy((self.rows, self.reference, self.chords, self.pieces, self.recipes))
        result = self.run_audit()
        for row in result:
            self.assertEqual(row['open_vertices'], 2)
            self.assertEqual(row['piece_node_count'], 1)
            self.assertEqual(row['anchored_candidate_count'], 1)
            self.assertEqual(row['anchored_candidates'][0]['i'], 0)
            self.assertEqual(row['anchored_candidates'][0]['candidate_status'], 'UNVERIFIED_ANCHORED_CANDIDATE')
            self.assertEqual(row['anchored_candidates'][0]['grid_spec'], [1600, 256, '1/200'])
            self.assertEqual(row['piece_nodes'][0]['candidate_status'], 'UNVERIFIED_PIECE_COLLECTION')
            self.assertEqual(row['piece_nodes'][0]['stored_grids'][0]['index'], 1)
        self.assertEqual((self.rows, self.reference, self.chords, self.pieces, self.recipes), before)
        self.assertEqual(result, self.run_audit())

    def test_missing_vertex_recipe_rejected_even_when_piece_exists(self):
        self.recipes[12].pop()
        with self.assertRaisesRegex(ValueError, 'missing vertex recipe'):
            self.run_audit()

    def test_duplicate_recipe_or_piece_identity_rejected(self):
        self.recipes[12].append(copy.deepcopy(self.recipes[12][0]))
        with self.assertRaisesRegex(ValueError, 'duplicate recipe'):
            self.run_audit()
        self.recipes[12].pop()
        self.pieces.append(copy.deepcopy(self.pieces[0]))
        with self.assertRaisesRegex(ValueError, 'Duplicate piece-node'):
            self.run_audit()

    def test_invalid_recipe_identities_and_nonvertex_rejected(self):
        for index in (-1, 3, True, '0', 1):
            with self.subTest(index=index):
                self.recipes[12][0]['k'] = index
                with self.assertRaises(ValueError):
                    self.run_audit()

    def test_invalid_or_chord_piece_identity_rejected(self):
        for k, i in [(11, 2), (12, 3), (True, 2), (12, True), (12, 1)]:
            with self.subTest(k=k, i=i):
                self.pieces[0].update(k=k, i=i, s=str(i))
                with self.assertRaises(ValueError):
                    self.run_audit()

    def test_piece_radius_or_cap_mismatch_rejected(self):
        for field, value in [('s', '21/10'), ('cap', '1001/1000'), ('cap', 1.0)]:
            with self.subTest(field=field):
                original = self.pieces[0][field]
                self.pieces[0][field] = value
                with self.assertRaises(ValueError):
                    self.run_audit()
                self.pieces[0][field] = original

    def test_canonical_change_cannot_silently_change_anchored_cap(self):
        self.rows[12]['nodes'] = '0:1001/1000;1:1;2:1'
        with self.assertRaisesRegex(ValueError, 'radii/caps differ'):
            self.run_audit()

    def test_anchored_radius_and_optional_cap_must_bind_exactly(self):
        self.recipes[12][0]['s'] = '1/1000'
        with self.assertRaisesRegex(ValueError, 'radius mismatch'):
            self.run_audit()
        self.recipes[12][0]['s'] = '0'
        self.recipes[12][0]['cap'] = '2'
        with self.assertRaisesRegex(ValueError, 'cap mismatch'):
            self.run_audit()

    def test_grid_and_recipe_dimensions_rejected(self):
        self.recipes[12][0]['g'] = 5
        with self.assertRaisesRegex(ValueError, 'invalid grid'):
            self.run_audit()
        self.recipes[12][0]['g'] = 1
        self.recipes[12][0]['v0'].pop()
        with self.assertRaisesRegex(ValueError, 'dimensions'):
            self.run_audit()

    def test_chord_data_is_bound_to_exact_generator_and_baseline_inequalities(self):
        self.chords[12] = []
        with self.assertRaisesRegex(ValueError, 'lower-hull generator'):
            self.run_audit()

    def test_scope_and_grid_parsers_reject_changed_declarations(self):
        text = ('def capRowsDone : List ℕ := [0]\n\ndef CapsRest : Prop :=\n'
                '  (∀ k, k < rowData.length → k ∉ capRowsDone → VertexCapsRow k) ∧\n'
                '    ∀ k ∈ capRowsDone, ExclCaps k (capExcl k)\n\ntheorem test := 0\n')
        self.assertEqual(I.parse_open_rows(text, 3), [1, 2])
        for changed in [text.replace('[0]', '[0, 0]'), text.replace('CapsRest : Prop :=', 'Other : Prop :='),
                        text.replace('VertexCapsRow k', 'True')]:
            with self.assertRaises(ValueError):
                I.parse_open_rows(changed, 3)
        grids = I.parse_grids('def capGrids : List X := [(400, 128, 1 / 50)]\n', 'capGrids')
        self.assertEqual(grids, [[400, 128, '1/50']])
        with self.assertRaises(ValueError):
            I.parse_grids('def capGrids : List X := [arbitrary]\n', 'capGrids')

    def test_duplicate_json_keys_and_inexact_rationals_rejected(self):
        for data in ['{"k":12,"k":13}', '{"k":NaN}']:
            with self.assertRaises(ValueError):
                I.strict_json(data)
        for number in [0.1, True]:
            with self.assertRaises(ValueError):
                I.rational(number)

    def test_cli_only_writes_owned_inventory_and_check_is_read_only(self):
        report = {'status': 'PASS_PREPARATION_INVENTORY', 'counts': {'open_vertices': 8}}
        with tempfile.TemporaryDirectory() as tmp, patch.object(I, 'build_inventory', return_value=report):
            root = Path(tmp)
            I.main(['--root', str(root)])
            path = root/I.OUTPUT
            before = path.read_bytes()
            I.main(['--root', str(root), '--check'])
            self.assertEqual(path.read_bytes(), before)
            path.write_text('{}\n')
            with self.assertRaisesRegex(ValueError, 'differs'):
                I.main(['--root', str(root), '--check'])
            self.assertEqual(path.read_text(), '{}\n')
            for output in ['data/caps-m-pieces/pieces.json', '../escape.json', 'data/caps-m/plan/other.json']:
                with self.assertRaisesRegex(ValueError, 'Only a rest-inventory'):
                    I.main(['--root', str(root), '--output', output])

    def test_optimized_python_rejected_before_reading_or_writing(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            result = subprocess.run([sys.executable, '-O', str(Path(I.__file__)), '--root', str(root)],
                                    capture_output=True, text=True)
            self.assertNotEqual(result.returncode, 0)
            self.assertIn('Reject optimized Python', result.stderr)
            self.assertEqual(list(root.iterdir()), [])


if __name__ == '__main__':
    unittest.main()
