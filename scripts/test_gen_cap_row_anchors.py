#!/usr/bin/env python3
"""Fixture checks for isolated row12 anchor preparation; Agent-ID: codex-7c3e.

No Lean, optimizer, SSH, CI, worker or live research source is invoked.
"""
import copy
from fractions import Fraction
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest

ROOT = Path(__file__).resolve().parents[1]
SPEC = importlib.util.spec_from_file_location('row_anchor_generator', ROOT/'tools/gen_cap_row_anchors.py')
G = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(G)


class AnchorPlanTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.expected = {'nodes': 8, 'chords': 1, 'vertices': 7, 'localized': 1, 'anchors': 6}
        self.nodes = ';'.join(f'{Fraction(i, 8)}:2' for i in range(8))
        self.rows = {'name': '0.84', 'nodes': self.nodes}
        self.pieces = [{'k': 12, 'i': 3, 's': '3/8', 'cap': '2', 'pieces': [{}]}]
        self.recipes = [{'k': i, 'g': 1, 's': str(Fraction(i, 8)), 'v0': ['0'] * 12,
                         'var': [], 'scale': '1'} for i in range(8) if i != 1]
        self.put(G.SOURCES['index'], 'def rowData : List Row :=\n  [' +
                 ', '.join(f'row{i:02d}' for i in range(1, 20)) + ']\n')
        self.put(G.SOURCES['row_lean'], 'def row13 : Row :=\n  ' + json.dumps(self.nodes) + '\n')
        self.put(G.SOURCES['row_types'], 'def capPad : ℚ := 1 / 100000000000\n')
        self.put(G.SOURCES['chords'], self.chord_source('(1, 0, 2)'))
        self.put(G.SOURCES['range_defs'], '-- exact source pin for the existing range predicate\n')
        self.save()

    def put(self, name, data):
        path = self.root/name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data.encode() if isinstance(data, str) else data)

    def save(self):
        for name, value in [('row_json', self.rows), ('pieces', self.pieces), ('recipes', self.recipes)]:
            self.put(G.SOURCES[name], json.dumps(value))

    def chord_source(self, selected):
        rows = ['  [],'] * 19
        rows[12] = '  [' + selected + '],'
        return 'def capChords : List (List (ℕ × ℕ × ℕ)) := [\n' + '\n'.join(rows) + '\n]\n'

    def plan(self, **kwargs):
        return G.build_plan(self.root, expected=self.expected, range_size=3, **kwargs)

    def candidate(self, name='candidate'):
        return self.root/'handoff/caps-centre'/name

    def test_exact_disjoint_census_and_deterministic_data(self):
        a, b = self.plan(), self.plan()
        self.assertEqual(G.encoded(a), G.encoded(b))
        self.assertEqual(a['census'], self.expected)
        self.assertEqual(a['localized_exclusions'], [3])
        anchors = {p['node_index'] for p in a['anchors']}
        self.assertEqual(anchors, {0, 2, 4, 5, 6, 7})
        self.assertEqual(anchors | set(a['localized_exclusions']) | set(a['chord_indices']), set(range(8)))
        self.assertEqual(a['status'], 'candidate_unverified')
        self.assertEqual(a['capPad'], '1/100000000000')

    def test_duplicate_recipe_is_rejected(self):
        self.recipes.append(copy.deepcopy(self.recipes[0])); self.save()
        with self.assertRaisesRegex(ValueError, 'Duplicate/out-of-range recipe'):
            self.plan()

    def test_missing_or_chord_recipe_is_rejected(self):
        original = copy.deepcopy(self.recipes)
        self.recipes.pop(); self.save()
        with self.assertRaisesRegex(ValueError, 'every canonical nonchord'):
            self.plan()
        self.recipes = original + [{**copy.deepcopy(original[0]), 'k': 1, 's': '1/8'}]; self.save()
        with self.assertRaisesRegex(ValueError, 'every canonical nonchord'):
            self.plan()

    def test_vector_dimension_and_float_arithmetic_are_rejected(self):
        self.recipes[0]['v0'] = ['0'] * 11; self.save()
        with self.assertRaisesRegex(ValueError, 'exactly 12'):
            self.plan()
        self.recipes[0]['v0'] = ['0'] * 11 + [0.1]; self.save()
        with self.assertRaisesRegex(ValueError, 'never floats'):
            self.plan()

    def test_var_dimension_and_nonpositive_scale_are_rejected(self):
        self.recipes[0]['var'] = [['0'] * 13]; self.save()
        with self.assertRaisesRegex(ValueError, 'exactly 12'):
            self.plan()
        self.recipes[0]['var'] = []; self.recipes[0]['scale'] = '0'; self.save()
        with self.assertRaisesRegex(ValueError, 'strictly positive'):
            self.plan()

    def test_recipe_location_and_grid_are_bound(self):
        self.recipes[0]['s'] = '1/8'; self.save()
        with self.assertRaisesRegex(ValueError, 'location differs'):
            self.plan()
        self.recipes[0]['s'] = '0'; self.recipes[0]['g'] = 2; self.save()
        with self.assertRaisesRegex(ValueError, 'legacy anchor grids'):
            self.plan()

    def test_zero_based_row_identity_and_lean_nodes_are_bound(self):
        self.rows['name'] = '0.83'; self.save()
        with self.assertRaisesRegex(ValueError, 'nominal 0.84'):
            self.plan()
        self.rows['name'] = '0.84'; self.save()
        self.put(G.SOURCES['index'], (self.root/G.SOURCES['index']).read_text().replace('row13,', 'row12,'))
        with self.assertRaisesRegex(ValueError, r'rowData\[12\] = row13'):
            self.plan()

    def test_localized_caps_and_chord_support_are_bound(self):
        self.pieces[0]['cap'] = '3'; self.save()
        with self.assertRaisesRegex(ValueError, 'position/cap'):
            self.plan()
        self.pieces[0]['cap'] = '2'; self.save()
        self.put(G.SOURCES['chords'], self.chord_source('(1, 1, 2)'))
        with self.assertRaisesRegex(ValueError, 'vertex endpoints'):
            self.plan()

    def test_changed_pinned_input_is_rejected_even_if_json_equivalent(self):
        p = self.plan()
        name = G.SOURCES['recipes']; self.put(name, (self.root/name).read_text() + '\n')
        with self.assertRaisesRegex(ValueError, 'Pinned source hashes'):
            self.plan(pinned_sources=p['source_sha256'])

    def test_census_mismatch_and_invalid_range_sizes_are_rejected(self):
        with self.assertRaisesRegex(ValueError, 'census mismatch'):
            G.build_plan(self.root, expected={**self.expected, 'anchors': 5})
        for size in [0, -1, 65, True]:
            with self.assertRaisesRegex(ValueError, 'Range size'):
                G.ranges_of(8, size)

    def test_lean_range_partition_and_symbolic_last_endpoint(self):
        p = self.plan(); outputs = G.lean_outputs(p)
        ranges = p['ranges']
        self.assertEqual([(r['lo'], r['hi']) for r in ranges], [(0, 3), (3, 6), (6, 8)])
        self.assertEqual([i for r in ranges for i in range(r['lo'], r['hi'])], list(range(8)))
        self.assertEqual(ranges[-1]['hi_lean'], '(rowData.getD 12 row01).nodeList.length')
        manifest = json.loads(outputs[G.MODULE_DIR + '/Anchors.manifest.json'])
        self.assertEqual(len(manifest['native_facts']), 3)
        self.assertEqual(manifest['native_facts'][-1]['native_fact'], 'Grothe.LowerAnalytic.row12AnchorRange02')
        body = outputs[G.MODULE_DIR + '/AnchorRange02.lean'].decode()
        self.assertIn('6 (rowData.getD 12 row01).nodeList.length = true', body)
        self.assertIn('native_decide', body)
        self.assertNotIn('Task.spawn', body)

    def test_candidate_generation_and_check_are_reproducible(self):
        p = self.plan(); target = self.candidate()
        G.write_lean(self.root, target, p)
        before = {str(f.relative_to(target)): f.read_bytes() for f in target.rglob('*') if f.is_file()}
        G.write_lean(self.root, target, p, check=True)
        G.write_lean(self.root, target, p)
        self.assertEqual(before, {str(f.relative_to(target)): f.read_bytes() for f in target.rglob('*') if f.is_file()})
        path = target/G.MODULE_DIR/'Recipes.lean'; path.write_text(path.read_text() + '-- foreign mutation\n')
        with self.assertRaisesRegex(ValueError, 'changed externally'):
            G.write_lean(self.root, target, p)

    def test_unowned_candidate_and_active_grothe_outputs_are_rejected(self):
        p = self.plan(); target = self.candidate()
        path = target/G.MODULE_DIR/'Recipes.lean'; path.parent.mkdir(parents=True); path.write_text('not mine')
        with self.assertRaisesRegex(ValueError, 'unowned candidate'):
            G.write_lean(self.root, target, p)
        self.assertEqual(path.read_text(), 'not mine')
        with self.assertRaisesRegex(ValueError, 'isolated candidate project root'):
            G.write_lean(self.root, self.root/'Grothe', p)

    def test_nested_candidate_symlinks_cannot_write_active_or_outside_sources(self):
        p = self.plan()
        for component in ['Grothe', 'Grothe/LowerAnalytic/CapRow12']:
            with self.subTest(component=component):
                target = self.candidate('symlink-' + str(len(component)))
                outside = self.root/'active-source'/str(len(component))
                outside.mkdir(parents=True)
                parent = (target/component).parent; parent.mkdir(parents=True)
                (target/component).symlink_to(outside, target_is_directory=True)
                before = list(outside.rglob('*'))
                with self.assertRaisesRegex(ValueError, 'escapes its isolated project root'):
                    G.write_lean(self.root, target, p)
                self.assertEqual(before, list(outside.rglob('*')))
                self.assertFalse(list(target.rglob('*.lean')))

    def test_plan_check_and_foreign_plan_protection(self):
        p = self.plan(); output = self.root/G.DEFAULT_OUT
        G.write_plan(output, p); original = output.read_bytes()
        G.write_plan(output, p, check=True)
        self.assertEqual(output.read_bytes(), original)
        output.write_text('{"format":"somebody-elses-file"}')
        with self.assertRaisesRegex(ValueError, 'unowned data plan'):
            G.write_plan(output, p)
        self.assertEqual(output.read_text(), '{"format":"somebody-elses-file"}')

    def test_internal_output_alias_is_rejected_before_any_source_write(self):
        p = self.plan(); target = self.candidate()
        folder = target/G.MODULE_DIR; folder.mkdir(parents=True)
        (folder/'Recipes.lean').symlink_to(folder/'AnchorRange00.lean')
        with self.assertRaisesRegex(ValueError, 'paths alias each other'):
            G.write_lean(self.root, target, p)
        self.assertFalse((folder/'AnchorRange00.lean').exists())
        self.assertFalse((folder/'Anchors.manifest.json').exists())


if __name__ == '__main__':
    unittest.main()
