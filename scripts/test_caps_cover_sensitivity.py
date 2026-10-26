#!/usr/bin/env python3
"""Small exact arithmetic and source-validity regressions for cap sensitivity."""
import copy
from fractions import Fraction as Q
from pathlib import Path
import sys
import unittest

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parents[1]/'tools'))
import caps_cover_sensitivity as S


class SensitivityTests(unittest.TestCase):
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

    def test_raised_source_is_not_unchanged_majorant(self):
        source = S.L.source_from_table([['0', '2'], ['1', '2']], '0')
        self.assertEqual(S.check_majorant(source, 1, [Q(2), 0, 0, 0, 0])['status'], 'PASS_EXACT_MAJORANT')
        self.assertEqual(S.check_majorant(source, 1, [Q(1), 0, 0, 0, 0])['status'], 'FAILED_EXACT_PROOF_REPLAY')

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
        audit = S.per_node_audit(rows, {(12, 1): Q(1, 10)}, {}, batches)
        self.assertEqual(audit['status'], 'PASS_EXACT_SOURCE_DEPENDENCIES')


if __name__ == '__main__':
    unittest.main()
