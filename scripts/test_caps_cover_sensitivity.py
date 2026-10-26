#!/usr/bin/env python3
"""Small exact arithmetic and source-validity regressions for cap sensitivity."""
import copy
from fractions import Fraction as Q
import json
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
import caps_cover_sensitivity as S


class SensitivityTests(unittest.TestCase):
    @staticmethod
    def flat_chord_fixture():
        row = {'table': [['0', '1'], ['1', '1'], ['2', '1'], ['3', '1'], ['4', '1']],
               'delta': '1', 'smax': '0', 'cells': []}
        rows = [copy.deepcopy(row) for _ in range(16)]
        chords = [[] for _ in rows]
        return rows, chords

    def test_strict_reciprocal_boundary(self):
        bound, lower = S.endpoint(Q(1, 2), 1000)
        self.assertEqual(bound, Q(1, 2))
        self.assertEqual(lower, Q(1999, 1000))
        self.assertLess(bound*lower, 1)

    def test_round_bound_up(self):
        bound, lower = S.endpoint(Q(713420920821955, 10**15))
        self.assertEqual(bound, Q(356710460411, 500000000000))
        self.assertEqual(lower, Q(56067881993, 40000000000))

    def test_no_float_or_negative_increases(self):
        nodes = [{'k': 14, 'i': 200}]
        for v in [0.1, '-1/10']:
            with self.assertRaises(ValueError):
                S.increments({'format': 'caps-centre-increments/v1',
                              'increments': [{'k': 14, 'i': 200, 'increase': v}]}, nodes)

    def test_reject_duplicate_or_unknown_nodes(self):
        nodes = [{'k': 14, 'i': 200}]
        row = {'k': 14, 'i': 200, 'increase': '1/10'}
        for rows in [[row, row], [dict(row, i=201)], [dict(row, k=11)]]:
            with self.assertRaises(ValueError):
                S.increments({'format': 'caps-centre-increments/v1', 'increments': rows}, nodes)

    def test_cap_crude_mixture_weight(self):
        class Campaign:
            inh = {'boxes': ['c|unused|0,3,1/4', 's|unused|unused']}
        self.assertEqual(S.cap_weight(Campaign(), {'original': 0}), Q(1, 4))
        self.assertEqual(S.cap_weight(Campaign(), {'original': 1}), 1)
        self.assertEqual(S.cap_weight(Campaign(), {'cap_choice': [3, 4, '1/4']}), 1)
        self.assertEqual(S.cap_weight(Campaign(), {'choice': {}}), 1)

    def test_exact_padding_limits_distinguish_inclusive_and_strict_endpoints(self):
        values, weights = [Q(1, 2), Q(3, 5), Q(13, 20)], [Q(1), Q(1, 2), Q(0)]
        target, lower = Q(7, 10), Q(3, 2)
        target_limit, lower_limit = S.padding_limits(values, weights, target, lower)
        self.assertEqual(target_limit, Q(1, 5))
        self.assertEqual(lower_limit, Q(2, 15))
        self.assertEqual(max(v+target_limit*w for v, w in zip(values, weights)), target)
        self.assertEqual(lower*max(v+lower_limit*w for v, w in zip(values, weights)), 1)
        for vv, ww in [([Q(1)], [Q(-1)]), ([Q(1)], []), ([Q(1)], [Q(0)])]:
            with self.assertRaises(ValueError):
                S.padding_limits(vv, ww, 2, Q(1, 2))

    def test_raised_source_is_not_unchanged_majorant(self):
        source = S.L.source_from_table([['0', '2'], ['1', '2']], '0')
        self.assertEqual(S.check_majorant(source, 1, [Q(2), 0, 0, 0, 0])['status'], 'PASS_EXACT_MAJORANT')
        self.assertEqual(S.check_majorant(source, 1, [Q(1), 0, 0, 0, 0])['status'], 'FAILED_EXACT_PROOF_REPLAY')

    def test_majorant_uses_lean_depth_nine_not_python_default_twelve(self):
        source = S.L.source_from_table([['0', '0'], ['1', '2/3']], '0')
        # (v-1/3)^2+1e-7 is positive but needs more than nine bisections.
        polynomial = [Q(1, 9)+Q(1, 10**7), 0, 1, 0, 0]
        self.assertEqual(S.L.verify_node(source, 1, polynomial, depth=12)['intervals'], 2)
        self.assertEqual(S.MAJORANT_DEPTH, 9)
        self.assertEqual(S.check_majorant(source, 1, polynomial)['status'],
                         'FAILED_EXACT_PROOF_REPLAY')

    def test_raw_node_changes_can_break_mixed_tables(self):
        row = {'table': [['0', '1'], ['1', '1']], 'delta': '1', 'smax': '0', 'cells': []}
        rows = [copy.deepcopy(row) for _ in range(16)]
        batches = [{'i': 12, 'j': 12, 'theta': '0', 'nodes': '0:1;1:1'}]
        before = copy.deepcopy(rows)
        audit = S.per_node_audit(rows, {(12, 1): Q(1, 10)}, {}, batches)
        self.assertEqual(rows, before)
        self.assertEqual(audit['status'], 'SOURCE_REPLAY_INCOMPLETE_OR_FAILED')
        self.assertEqual(audit['mixed_table_shortfalls'][0]['shortfall']['exact'], '1/10')

    def test_increase_with_existing_table_slack(self):
        row = {'table': [['0', '1'], ['1', '1']], 'delta': '1', 'smax': '0', 'cells': []}
        rows = [copy.deepcopy(row) for _ in range(16)]
        batches = [{'i': 12, 'j': 12, 'theta': '0', 'nodes': '0:2;1:2'}]
        audit = S.per_node_audit(rows, {(12, 1): Q(1, 10)}, {}, batches,
                                 [[] for _ in rows])
        self.assertEqual(audit['status'], 'PASS_EXACT_SOURCE_DEPENDENCIES')

    def test_unchecked_chords_never_report_source_pass(self):
        rows, _ = self.flat_chord_fixture()
        audit = S.per_node_audit(rows, {}, {}, [])
        self.assertEqual(audit['chord_audit']['status'], 'NOT_CHECKED')
        self.assertNotEqual(audit['status'], 'PASS_EXACT_SOURCE_DEPENDENCIES')
        with self.assertRaises(ValueError):
            S.per_node_audit(rows, {}, {}, [], propagate_chords=True)

    def test_zero_slack_chord_breaks_after_vertex_increase(self):
        rows, chords = self.flat_chord_fixture()
        chords[12] = [(1, 0, 2)]
        audit = S.per_node_audit(rows, {(12, 2): Q(1, 10)}, {}, [], chords)
        self.assertEqual(audit['status'], 'SOURCE_REPLAY_INCOMPLETE_OR_FAILED')
        chord = audit['chord_audit']
        self.assertEqual(chord['status'], 'FAILED_EXACT_CHORDS')
        self.assertEqual(chord['remaining_shortfalls'][0]['shortfall'], '1/20')

    def test_existing_chord_slack_absorbs_vertex_change(self):
        rows, chords = self.flat_chord_fixture()
        rows[12]['table'][1][1] = '6/5'
        chords[12] = [(1, 0, 2)]
        audit, expanded = S.chord_audit(rows, {(12, 2): Q(1, 10)}, chords)
        self.assertEqual(audit['status'], 'PASS_EXACT_CHORDS')
        self.assertEqual(audit['minimal_interior_increment_plan'], [])
        self.assertEqual(expanded, {(12, 2): Q(1, 10)})

    def test_minimal_propagation_on_two_adjacent_edges_preserves_inputs(self):
        rows, chords = self.flat_chord_fixture()
        chords[12] = [(1, 0, 2), (3, 2, 4)]
        changes = {(12, 2): Q(1, 7)}
        before_rows, before_changes = copy.deepcopy(rows), dict(changes)
        audit, expanded = S.chord_audit(rows, changes, chords, propagate=True)
        self.assertEqual(expanded, {(12, 2): Q(1, 7), (12, 1): Q(1, 14), (12, 3): Q(1, 14)})
        self.assertEqual(audit['status'], 'PASS_EXACT_CHORDS')
        self.assertEqual(len(audit['requested_shortfalls']), 2)
        self.assertEqual(audit['remaining_shortfalls'], [])
        self.assertEqual(rows, before_rows)
        self.assertEqual(changes, before_changes)
        source = S.per_node_audit(rows, changes, {}, [], chords, propagate_chords=True)
        self.assertEqual(source['status'], 'PASS_EXACT_SOURCE_DEPENDENCIES')
        self.assertEqual(source['applied_changes'], S.encoded_changes(expanded))

    def test_multiple_constraints_take_maximum_required_increment(self):
        rows, chords = self.flat_chord_fixture()
        chords[12] = [(1, 0, 2), (1, 0, 4)]
        changes = {(12, 2): Q(1, 5), (12, 4): Q(4, 5)}
        audit, expanded = S.chord_audit(rows, changes, chords, propagate=True)
        self.assertEqual(expanded[12, 1], Q(1, 5))
        self.assertEqual(audit['status'], 'PASS_EXACT_CHORDS')
        self.assertEqual(audit['remaining_shortfalls'], [])

    def test_invalid_chord_endpoint_cycle_indices_or_reversed_radii_rejected(self):
        for bad in [[(1, 0, 2), (2, 0, 3)], [(1, 2, 0)], [(1, 0, 99)], [(99, 0, 2)]]:
            rows, chords = self.flat_chord_fixture()
            chords[12] = bad
            with self.assertRaises(ValueError):
                S.chord_audit(rows, {}, chords)

    def test_bounded_literal_parser_and_exact_generator_binding(self):
        text = 'def capChords : List (List (ℕ × ℕ × ℕ)) := [[], [(1, 0, 2)]]\n'
        self.assertEqual(S.parse_chord_data(text), [[], [(1, 0, 2)]])
        for body in ['[__import__("os")]', '[[[[(1, 0, 2)]]]]', '[[(-1, 0, 2)]]', '[[(1, 0, 2)]']:
            with self.assertRaises(ValueError):
                S.parse_chord_data('def capChords := '+body)
        rows = [{'table': [['0', '1'], ['1', '1'], ['2', '1']]}]
        S.validate_fixed_chords(rows, [[(1, 0, 2)]], bind_generated=True)
        with self.assertRaises(ValueError):
            S.validate_fixed_chords(rows, [[]], bind_generated=True)

    def test_real_505_chords_match_current_exact_generator(self):
        rows = []
        for k in range(1, 20):
            canonical = json.loads((S.ROOT/f'data/lower-rows/row{k:02d}.json').read_text())
            rows.append({'table': [item.split(':') for item in canonical['nodes'].split(';')]})
        chords = S.load_verified_chords(rows)
        self.assertEqual(len(chords), 19)
        self.assertEqual(sum(map(len, chords)), 505)
        audit, expanded = S.chord_audit(rows, {(12, 280): Q(1, 10**9)}, chords, propagate=True)
        self.assertEqual({i: expanded[12, i] for i in [277, 278, 279, 281]},
                         {277: Q(1, 4*10**9), 278: Q(1, 2*10**9),
                          279: Q(3, 4*10**9), 281: Q(1, 2*10**9)})
        self.assertEqual(audit['status'], 'PASS_EXACT_CHORDS')


class GeneratedBindingTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.cover = json.loads((S.DATA/'cover.json').read_text())
        cls.rows = json.loads((S.DATA/'inputs/inherited.json').read_text())['rows']
        cls.docs = {name: json.loads((S.ROOT/binding['path']).read_text())
                    for name, binding in cls.cover['u_nodes'].items()}
        cls.mixed = (S.ROOT/'data/lower-mixed/batches.json').read_bytes()
        cls.modules = {name: (S.ROOT/name).read_bytes() for name in S.GENERATED_DATA}

    def fixture(self, root):
        for name, payload in {**self.modules, 'data/lower-mixed/batches.json': self.mixed}.items():
            path = root/name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(payload)

    def test_current_generated_modules_match_exact_canonical_inputs(self):
        before = copy.deepcopy((self.rows, self.docs, self.cover))
        binding = S.bind_generated_sources(self.rows, self.docs, self.cover)
        self.assertEqual(binding['status'], 'PASS_EXACT_GENERATED_DATA_BINDING')
        self.assertEqual(set(binding['module_sha256']), set(S.GENERATED_DATA))
        self.assertEqual((self.rows, self.docs, self.cover), before)
        self.assertEqual({name: (S.ROOT/name).read_bytes() for name in S.GENERATED_DATA}, self.modules)

    def test_law_serialization_matches_canonical_generator_without_majorant_replay(self):
        import needle_unshifted_lean as exporter
        # This test compares renderings; it intentionally never verifies nodes.
        with patch.object(exporter, 'verify_unshifted', return_value=None), \
             patch.object(exporter, 'verify_mixed', side_effect=lambda p: (json.loads(p.read_text()), None)):
            _, _, canonical, _, _ = exporter.new_batches(self.cover, {'rows': self.rows}, 21)
        self.assertEqual(S.law_data_text(self.rows, self.docs, self.cover), canonical)

    def test_changed_generated_module_rejected_without_writing(self):
        for name in S.GENERATED_DATA:
            with self.subTest(name=name), tempfile.TemporaryDirectory() as tmp:
                root = Path(tmp)
                self.fixture(root)
                path = root/name
                changed = path.read_bytes()+b'\n-- foreign change\n'
                path.write_bytes(changed)
                with self.assertRaisesRegex(ValueError, 'differs from canonical'):
                    S.bind_generated_sources(self.rows, self.docs, self.cover, root)
                self.assertEqual(path.read_bytes(), changed)
                self.assertEqual((root/'data/lower-mixed/batches.json').read_bytes(), self.mixed)

    def test_changed_mixed_json_rejected(self):
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.fixture(root)
            doc = json.loads(self.mixed)
            doc['batches'][0]['nodes'] += ';999:999'
            (root/'data/lower-mixed/batches.json').write_text(json.dumps(doc))
            with self.assertRaisesRegex(AssertionError, 'declaration changed'):
                S.bind_generated_sources(self.rows, self.docs, self.cover, root)

    def test_changed_law_witness_or_unbound_identifier_rejected(self):
        docs = copy.deepcopy(self.docs)
        docs[S.PURE_NAMES[0]]['P'][0] = str(Q(docs[S.PURE_NAMES[0]]['P'][0])+1)
        with self.assertRaisesRegex(ValueError, 'LawNodeData.lean differs'):
            S.bind_generated_sources(self.rows, docs, self.cover)
        del docs[S.PURE_NAMES[0]]
        with self.assertRaisesRegex(ValueError, 'Unbound or unused'):
            S.bind_generated_sources(self.rows, docs, self.cover)

    def test_missing_or_external_generated_module_rejected(self):
        with tempfile.TemporaryDirectory() as tmp, tempfile.TemporaryDirectory() as foreign:
            root = Path(tmp)
            self.fixture(root)
            path = root/S.GENERATED_DATA[1]
            path.unlink()
            with self.assertRaises(FileNotFoundError):
                S.bind_generated_sources(self.rows, self.docs, self.cover, root)
            external = Path(foreign)/'LawNodeData.lean'
            external.write_bytes(self.modules[S.GENERATED_DATA[1]])
            path.symlink_to(external)
            with self.assertRaisesRegex(ValueError, 'escapes current checkout'):
                S.bind_generated_sources(self.rows, self.docs, self.cover, root)


if __name__ == '__main__':
    unittest.main()
