#!/usr/bin/env python3
"""Explicit-grid provenance and resume tests; no Lean, grid export or optimizer."""
import copy
import importlib.util
import json
from pathlib import Path
import shutil
import tempfile
import unittest
from unittest.mock import patch

ROOT = Path(__file__).resolve().parents[1]
spec = importlib.util.spec_from_file_location('centre_fine', ROOT/'tools/caps_centre_fine.py')
fine = importlib.util.module_from_spec(spec)
spec.loader.exec_module(fine)


class FineTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        for name in ['scripts', 'tools', 'Grothe/LowerAnalytic', 'Grothe/Lower',
                     'data/caps-m-pieces', 'data/caps-m/plan/solved']:
            (self.root/name).mkdir(parents=True)
        shutil.copyfile(ROOT/'scripts/caps_stamp.py', self.root/'scripts/caps_stamp.py')
        (self.root/'Grothe/LowerAnalytic/CapExport.lean').write_text('import Grothe.Lower.RowDataTypes\n')
        (self.root/'Grothe/Lower/RowDataTypes.lean').write_text('def capPad : ℚ := 1 / 100000000000\n')
        for name in ['GrotheCapsKernel.lean', 'lean-toolchain', 'lakefile.toml', 'lake-manifest.json']:
            (self.root/name).write_text('fixture\n')
        for name in ['caps_plan.py', 'caps_lmi.py', 'caps_centre_fine.py',
                     'caps_centre_sweep.py', 'caps_centre_repair.py']:
            shutil.copyfile(ROOT/'tools'/name, self.root/'tools'/name)
        self.nodes = [{'k': 14, 'i': 200, 's': '1/5', 'cap': '7/5', 'ds': ['1,0'],
                       'pieces': [{'nq': 256, 'slack': 1e-5, 'recipe': '1|1', 'cons': []},
                                  {'nq': 1024, 'slack': 1e-12, 'recipe': '2|1',
                                   'cons': ['0,+,-3/1000,3/1000,1/5,0']}]}]
        fine.sweep.write_json(self.root/fine.sweep.PIECES, self.nodes)
        self.grid = [1600, 1152, '1/200']

    def prepared(self):
        return fine.prepare(self.root, '14:200', 'Codex15b7Fine', self.grid)

    def exported(self, manifest):
        entry = manifest['entry']
        identity = [['1' if i == j else '0' for j in range(13)] for i in range(13)]
        zero = [['0' for _ in range(13)] for _ in range(13)]
        row = {'k': 14, 'i': 200, 'j': 1, 'grid': 3, 'grid_spec': self.grid,
               's': '1/5', 'cap': '7/5', 'capPad': '1/100000000000',
               'encl': True, 'polyOK': True, 'ok': True, 'N': identity,
               'cons': [{'lo': '-3/1000', 'hi': '3/1000', 'lam': '1/5', 'mu': '0', 'A': zero, 'B': zero}]}
        path = self.root/entry['export']
        path.write_text(json.dumps(row)+'\n')
        return path, row

    def test_grid_is_exact_and_retains_radial_range(self):
        self.assertEqual(fine.grid_spec(1600, 1152, '2/400'), self.grid)
        for spec in [[1600, 1152, 0.005], [1600, 1152, '1/400'], [0, 1, '1'], [True, 1, '8']]:
            with self.assertRaises(ValueError):
                fine.grid_spec(*spec)

    def test_prepare_uses_actual_centre_and_explicit_typed_run(self):
        manifest = self.prepared()
        entry = manifest['entry']
        self.assertEqual((entry['j'], entry['stored_grid'], entry['grid']), (1, 2, 3))
        source = (self.root/entry['module_file']).read_text()
        name = entry['module'].split('.')[-1]
        self.assertIn(f'def run_{name} : IO Unit := do', source)
        self.assertIn(f'#eval run_{name}', source)
        self.assertIn(' [1] (1600, 1152, (1 : ℚ) / 200)', source)
        self.assertIn('exportPiecesOnGrid', source)
        self.assertIn('Export already exists', source)

    def test_prepare_rejects_coarser_grid(self):
        with self.assertRaisesRegex(ValueError, 'coarsen'):
            fine.prepare(self.root, '14:200', 'Codex15b7Fine', [1600, 512, '1/200'])

    def test_preparation_and_completed_export_are_preserved(self):
        manifest = self.prepared()
        path, _ = self.exported(manifest)
        before = path.read_bytes()
        self.assertEqual(self.prepared(), manifest)
        self.assertEqual(path.read_bytes(), before)
        self.assertEqual(fine.validate(self.root, manifest)['grid'], 3)

    def test_explicit_grid_cannot_be_mistaken_for_stored_grid(self):
        manifest = self.prepared()
        path, row = self.exported(manifest)
        for bad in [dict(row, grid=2), {k: v for k, v in row.items() if k != 'grid_spec'},
                    dict(row, grid_spec=[1600, 1024, '1/200'])]:
            path.write_text(json.dumps(bad)+'\n')
            with self.assertRaises(ValueError):
                fine.validate(self.root, manifest)

    def test_partial_export_and_foreign_module_are_not_overwritten(self):
        manifest = self.prepared()
        path = self.root/manifest['entry']['export']
        path.write_text('{"k":14,')
        with self.assertRaises(ValueError):
            self.prepared()
        self.assertEqual(path.read_text(), '{"k":14,')
        path.unlink()
        module = self.root/manifest['entry']['module_file']
        module.write_text('changed\n')
        with self.assertRaisesRegex(ValueError, 'changed scratch'):
            self.prepared()

    def test_source_change_invalidates_existing_manifest(self):
        manifest = self.prepared()
        self.exported(manifest)
        path = self.root/'Grothe/LowerAnalytic/CapExport.lean'
        path.write_text(path.read_text()+'-- source changed\n')
        with self.assertRaisesRegex(ValueError, 'provenance changed'):
            fine.validate(self.root, manifest)

    def test_asymmetric_matrix_is_rejected(self):
        manifest = self.prepared()
        path, row = self.exported(manifest)
        row['N'][0][1] = '1'
        path.write_text(json.dumps(row)+'\n')
        with self.assertRaisesRegex(ValueError, 'symmetric'):
            fine.validate(self.root, manifest)

    def test_float_matrix_coefficient_is_rejected(self):
        manifest = self.prepared()
        path, row = self.exported(manifest)
        row['N'][0][0] = 1.0
        path.write_text(json.dumps(row)+'\n')
        with self.assertRaisesRegex(ValueError, 'exact rational'):
            fine.validate(self.root, manifest)

    def test_solve_and_resume_require_exact_feasibility(self):
        manifest = self.prepared()
        self.exported(manifest)
        import caps_plan
        good = {'k': 14, 'i': 200, 'j': 1, 'grid': 3, 'status': 'fixed',
                'cap_up': '0', 'lm': [['1/5', '0']], 'encl': True, 'polyOK': True}
        with patch.object(caps_plan, 'verdict', return_value=copy.deepcopy(good)) as search:
            result = fine.solve(self.root, manifest)
            self.assertEqual(result['grid_spec'], self.grid)
            self.assertEqual(fine.solve(self.root, manifest), result)
            self.assertEqual(search.call_count, 1)
        path = self.root/manifest['entry']['solved']
        bad = copy.deepcopy(result)
        bad['grid_spec'] = [1600, 1024, '1/200']
        path.write_text(json.dumps([bad])+'\n')
        with self.assertRaisesRegex(ValueError, 'grid_spec'):
            fine.solve(self.root, manifest)

    def test_changed_manifest_is_preserved(self):
        path = self.root/'manifest.json'
        path.write_text('{"foreign":true}\n')
        with self.assertRaisesRegex(ValueError, 'overwrite'):
            fine.preserve_json(path, {'other': True})
        self.assertEqual(json.loads(path.read_text()), {'foreign': True})


if __name__ == '__main__':
    unittest.main()
