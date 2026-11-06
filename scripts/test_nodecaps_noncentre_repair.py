#!/usr/bin/env python3
"""Synthetic pure repair-layer tests. Agent-ID: codex-15b7.

No actual certificate data, Lean, remote calls, solvers or filesystem writes.
"""
import copy
import importlib.util
import json
from pathlib import Path
import unittest

SPEC = importlib.util.spec_from_file_location('noncentre', Path(__file__).resolve().parents[1] /
                                              'tools/nodecaps_noncentre_repair.py')
repair = importlib.util.module_from_spec(SPEC); SPEC.loader.exec_module(repair)


def diagonal(q):
    return [[str(q if i == j else 0) for j in range(13)] for i in range(13)]


def jsonline(value):
    return (json.dumps(value, sort_keys=True, separators=(',', ':')) + '\n').encode()


class Fixture:
    def __init__(self, row=12, node=186):
        self.row, self.node = row, node
        self.active = f'data/caps-m/plan/row-certificates/row{row}-pieces.json'
        self.baseline = [{'k': row, 'i': node, 's': '1/4', 'cap': '3/4', 'ds': ['direction-A', 'direction-B'],
                         'pieces': [{'nq': 1024, 'recipe': 'untouched recipe', 'metadata': {'float': 2.5},
                                     'cons': ['0,+,0,1,4,0', '1,+,-1,2,0,0']} for _ in range(4)]}]
        self.plan = {'row': row, 'row_complete_research_gate': True, 'capPad': '1/100000000000',
                     'cap_up': '0', 'centres': [{'key': f'{row}:{node}:2',
                                               'original_piece_index': 2, 'output_piece_index': 2}]}
        self.selection = {f'{row}:{node}': {'grids': [2, 2, 3, 2], 'chunk': 4, 'excl': []}}
        witness = {'k': row, 'i': node, 'j': 1, 'grid': 2, 'cap': '3/4', 's': '1/4',
                   'capPad': '1/100000000000', 'polyOK': True, 'encl': True, 'ok': False,
                   'N': diagonal(3), 'cons': [
                       {'lo': '0', 'hi': '1', 'lam': '4', 'mu': '0', 'A': diagonal(1), 'B': diagonal(0)},
                       {'lo': '-1', 'hi': '2', 'lam': '0', 'mu': '0', 'A': diagonal(0), 'B': diagonal(0)}]}
        self.files = {'data/evidence/matrix.jsonl': jsonline(witness), 'tools/source.lean': b'source bytes\n'}
        self.binding = {'format': repair.FORMAT, 'row': row, 'source_sha256': {
            name: repair.sha(data) for name, data in self.files.items()}}
        self.bind('baseline_archive', f'data/baseline/row{row}-pieces.json', self.baseline)
        self.bind('centre_plan', f'data/baseline/row{row}.json', self.plan)
        self.bind('selection', f'data/baseline/row{row}-selection.json', self.selection)
        self.refresh_provenance()
        node_context = {k: v for k, v in self.baseline[0].items() if k != 'pieces'}
        self.patches = {'format': repair.PATCH_FORMAT, 'row': row,
                        'baseline_sha256': self.binding['baseline_archive']['sha256'],
                        'selection_sha256': self.binding['selection']['sha256'],
                        'centre_plan_sha256': self.binding['centre_plan']['sha256'],
                        'capPad': '1/100000000000', 'cap_up': '0', 'repairs': [{
                            'key': f'{row}:{node}:1', 'grid': 2,
                            'baseline_piece_sha256': repair.sha(repair.encoded(self.baseline[0]['pieces'][1])),
                            'node_context_sha256': repair.sha(repair.encoded(node_context)),
                            'multipliers': [['1', '0'], ['0', '0']],
                            'matrix_source_provenance': 'unverified',
                            'evidence': {'path': 'data/evidence/matrix.jsonl',
                                         'sha256': repair.sha(self.files['data/evidence/matrix.jsonl'])}}]}
        self.bind('patches', 'data/patches.json', self.patches)
        effective = copy.deepcopy(self.baseline)
        effective[0]['pieces'][1]['cons'][0] = '0,+,0,1,1,0'
        self.effective = repair.encoded(effective)
        self.binding['effective'] = {'path': self.active, 'sha256': repair.sha(self.effective)}

    def bind(self, key, name, value):
        self.files[name] = repair.encoded(value)
        self.binding[key] = {'path': name, 'sha256': repair.sha(self.files[name])}

    def repatch(self):
        self.bind('patches', self.binding['patches']['path'], self.patches)

    def refresh_provenance(self):
        canonical = f'data/caps-m/plan/row-certificates/row{self.row}'
        inputs = {self.active: self.binding['baseline_archive']['sha256'],
                  canonical + '.json': self.binding['centre_plan']['sha256'],
                  canonical + '-selection.json': self.binding['selection']['sha256']}
        seal = {'files_sha256': {'D.lean': 'f'*64}}
        if self.row in (12, 13):
            seal['inputs_sha256'] = inputs
        self.bind('historical_seal', 'data/baseline/source-seal.json', seal)
        provenance = seal if self.row in (12, 13) else {
            'inputs_sha256': inputs, 'source_manifest_sha256': self.binding['historical_seal']['sha256']}
        self.bind('historical_provenance', 'data/baseline/input-seal.json', provenance)

    def witness(self, fn):
        name = 'data/evidence/matrix.jsonl'; value = repair.decode(self.files[name]); fn(value)
        self.files[name] = jsonline(value)
        digest = repair.sha(self.files[name]); self.binding['source_sha256'][name] = digest
        self.patches['repairs'][0]['evidence']['sha256'] = digest; self.repatch()

    def run(self):
        return repair.derive(self.binding, self.files, effective_bytes=self.effective)


class NoncentreTests(unittest.TestCase):
    def test_repairs_only_named_multipliers_without_mutating_inputs(self):
        f = Fixture(); before = copy.deepcopy((f.binding, f.files))
        result, receipt = f.run()
        self.assertEqual(result, f.effective)
        self.assertEqual((f.binding, f.files), before)
        self.assertTrue(receipt['stored_matrix_ldl_replayed'])
        self.assertFalse(receipt['source_provenance_verified'])
        self.assertFalse(receipt['current_source_feasibility_verified'])
        self.assertFalse(receipt['native_verified'])
        self.assertFalse(receipt['cache_uploaded'])
        self.assertIn('lack source provenance', receipt['limitation'])
        self.assertEqual(repair.decode(result)[0]['pieces'][0], f.baseline[0]['pieces'][0])
        self.assertEqual(repair.decode(result)[0]['pieces'][2:], f.baseline[0]['pieces'][2:])

    def test_nonzero_centre_index_excluded(self):
        f = Fixture(); f.patches['repairs'][0]['key'] = '12:186:2'; f.repatch()
        with self.assertRaisesRegex(ValueError, 'planned centre'): f.run()

    def test_zero_is_not_assumed_to_be_centre(self):
        f = Fixture(); f.patches['repairs'][0]['key'] = '12:186:0'
        f.witness(lambda w: w.update(j=0))
        effective = copy.deepcopy(f.baseline); effective[0]['pieces'][0]['cons'][0] = '0,+,0,1,1,0'
        f.effective = repair.encoded(effective); f.binding['effective']['sha256'] = repair.sha(f.effective)
        self.assertEqual(f.run()[1]['repaired_keys'], ['12:186:0'])

    def test_retained_node_excluded(self):
        f = Fixture(row=14, node=150)
        with self.assertRaisesRegex(ValueError, 'retained node14x150'): f.run()

    def test_all_three_historical_seal_shapes_are_supported(self):
        for row in (12, 13, 14):
            f = Fixture(row=row, node=200)
            self.assertEqual(f.run()[1]['row'], row)

    def test_repinned_centre_plan_cannot_change_historically_protected_index(self):
        for row in (12, 13, 14):
            f = Fixture(row=row)
            f.plan['centres'][0].update(key=f'{row}:186:0', original_piece_index=0, output_piece_index=0)
            f.bind('centre_plan', f.binding['centre_plan']['path'], f.plan)
            f.patches['centre_plan_sha256'] = f.binding['centre_plan']['sha256']
            f.patches['repairs'][0].update(key=f'{row}:186:2', grid=3)
            f.witness(lambda w: w.update(j=2, grid=3))
            effective = copy.deepcopy(f.baseline); effective[0]['pieces'][2]['cons'][0] = '0,+,0,1,1,0'
            f.effective = repair.encoded(effective); f.binding['effective']['sha256'] = repair.sha(f.effective)
            with self.assertRaisesRegex(ValueError, 'centre plan does not match historical input seal'): f.run()

    def test_repinned_selection_cannot_change_historical_grid(self):
        for row in (12, 13, 14):
            f = Fixture(row=row); f.selection[f'{row}:186']['grids'][1] = 3
            f.bind('selection', f.binding['selection']['path'], f.selection)
            f.patches['selection_sha256'] = f.binding['selection']['sha256']
            f.patches['repairs'][0]['grid'] = 3; f.witness(lambda w: w.update(grid=3))
            with self.assertRaisesRegex(ValueError, 'selection does not match historical input seal'): f.run()

    def test_repinned_unrelated_source_seal_cannot_replace_bound_seal(self):
        for row in (12, 13, 14):
            f = Fixture(row=row)
            seal = repair.decode(f.files[f.binding['historical_seal']['path']])
            seal['files_sha256']['D.lean'] = 'a'*64
            f.bind('historical_seal', f.binding['historical_seal']['path'], seal)
            with self.assertRaisesRegex(ValueError, 'source seal is not linked'): f.run()

    def test_centre_plan_missing_duplicate_and_wrong_census(self):
        for change in (lambda p: p['centres'].clear(),
                       lambda p: p['centres'].append(copy.deepcopy(p['centres'][0])),
                       lambda p: p['centres'][0].update(output_piece_index=0),
                       lambda p: p['centres'][0].update(original_piece_index=True)):
            f = Fixture(); change(f.plan); f.bind('centre_plan', f.binding['centre_plan']['path'], f.plan)
            f.patches['centre_plan_sha256'] = f.binding['centre_plan']['sha256']; f.repatch()
            with self.assertRaises(ValueError): f.run()

    def test_cap_pad_and_extra_changes_rejected_even_if_patch_repinned(self):
        for change in (lambda p: p.update(cap_up='1/1000'),
                       lambda p: p.update(capPad='1/10000000000'),
                       lambda p: p['repairs'][0].update(cap='7/8'),
                       lambda p: p['repairs'][0].update(recipe='changed'),
                       lambda p: p['repairs'][0].update(grid=3),
                       lambda p: p['repairs'][0].update(grid=True)):
            f = Fixture(); change(f.patches); f.repatch()
            with self.assertRaises(ValueError): f.run()

    def test_noncanonical_negative_and_nonstring_multipliers_rejected(self):
        for value in (True, 1.0, 1, '-1', '2/2', '01', '1.0', '-0', '0/2'):
            f = Fixture(); f.patches['repairs'][0]['multipliers'][0][0] = value; f.repatch()
            with self.assertRaises(ValueError): f.run()

    def test_wrong_multiplier_count_duplicate_unknown_noop_rejected(self):
        for change in (lambda p: p['repairs'][0]['multipliers'].pop(),
                       lambda p: p['repairs'].append(copy.deepcopy(p['repairs'][0])),
                       lambda p: p['repairs'][0].update(key='12:999:1'),
                       lambda p: p['repairs'][0].update(multipliers=[['4', '0'], ['0', '0']])):
            f = Fixture(); change(f.patches); f.repatch()
            with self.assertRaises(ValueError): f.run()

    def test_fraction_spelling_change_is_not_a_repair(self):
        f = Fixture(); f.baseline[0]['pieces'][1]['cons'][0] = '0,+,0,1,4/1,0/1'
        f.bind('baseline_archive', f.binding['baseline_archive']['path'], f.baseline)
        f.refresh_provenance()
        f.patches['baseline_sha256'] = f.binding['baseline_archive']['sha256']
        f.patches['repairs'][0]['baseline_piece_sha256'] = repair.sha(repair.encoded(f.baseline[0]['pieces'][1]))
        f.patches['repairs'][0]['multipliers'] = [['4', '0'], ['0', '0']]; f.repatch()
        with self.assertRaisesRegex(ValueError, 'multiplier value'): f.run()

    def test_stale_baseline_patch_source_seal_and_witness_hashes(self):
        for key in ('baseline_archive', 'patches', 'historical_provenance', 'historical_seal', 'centre_plan', 'selection'):
            f = Fixture(); f.files[f.binding[key]['path']] += b' '
            with self.assertRaisesRegex(ValueError, 'hash differs'): f.run()
        for name in ('tools/source.lean', 'data/evidence/matrix.jsonl'):
            f = Fixture(); f.files[name] += b' '
            with self.assertRaisesRegex(ValueError, 'hash differs'): f.run()

    def test_archive_must_match_original_input_seal(self):
        f = Fixture(); f.bind('historical_provenance', f.binding['historical_provenance']['path'], {
            'inputs_sha256': {f.active: 'f'*64}})
        with self.assertRaisesRegex(ValueError, 'historical input seal'): f.run()

    def test_effective_hash_and_bytes_both_checked(self):
        f = Fixture(); f.binding['effective']['sha256'] = 'f'*64
        with self.assertRaisesRegex(ValueError, 'effective pieces hash'): f.run()
        f = Fixture(); f.effective += b' '
        with self.assertRaisesRegex(ValueError, 'effective pieces bytes'): f.run()

    def test_unbound_missing_and_unsafe_paths_rejected(self):
        f = Fixture(); f.files['extra'] = b''
        with self.assertRaisesRegex(ValueError, 'unbound input'): f.run()
        f = Fixture(); del f.files['tools/source.lean']
        with self.assertRaisesRegex(ValueError, 'unbound input'): f.run()
        for value in ('/absolute', '../escape', 'data//x', './x', 'x\\y'):
            f = Fixture(); f.binding['baseline_archive']['path'] = value
            with self.assertRaisesRegex(ValueError, 'unsafe'): f.run()
        f = Fixture(); f.patches['repairs'][0]['evidence']['path'] = 'data/unbound.jsonl'; f.repatch()
        with self.assertRaisesRegex(ValueError, 'unbound matrix'): f.run()

    def test_context_and_piece_hashes_protect_unchanged_fields(self):
        for key in ('baseline_piece_sha256', 'node_context_sha256'):
            f = Fixture(); f.patches['repairs'][0][key] = 'f'*64; f.repatch()
            with self.assertRaisesRegex(ValueError, 'context differs'): f.run()

    def test_repinning_effective_output_cannot_change_recipe_region_order_or_direction(self):
        for change in (lambda n: n['pieces'][1].update(recipe='changed recipe'),
                       lambda n: n['pieces'][1]['cons'].__setitem__(0, '0,+,0,2,1,0'),
                       lambda n: n['pieces'][1]['cons'].reverse(),
                       lambda n: n['ds'].reverse(), lambda n: n.update(cap='4/5')):
            f = Fixture(); effective = repair.decode(f.effective); change(effective[0])
            f.effective = repair.encoded(effective); f.binding['effective']['sha256'] = repair.sha(f.effective)
            with self.assertRaisesRegex(ValueError, 'effective pieces hash'): f.run()

    def test_halfspace_lambda_must_be_zero(self):
        f = Fixture(); f.baseline[0]['pieces'][1]['cons'][0] = '0,+,0,*,0,0'
        f.bind('baseline_archive', f.binding['baseline_archive']['path'], f.baseline)
        f.refresh_provenance()
        f.patches['baseline_sha256'] = f.binding['baseline_archive']['sha256']
        f.patches['repairs'][0]['baseline_piece_sha256'] = repair.sha(repair.encoded(f.baseline[0]['pieces'][1]))
        f.repatch()
        with self.assertRaisesRegex(ValueError, 'halfspace multiplier'): f.run()

    def test_false_native_or_source_provenance_claim_rejected(self):
        f = Fixture(); f.patches['repairs'][0]['matrix_source_provenance'] = 'verified'; f.repatch()
        with self.assertRaisesRegex(ValueError, 'cannot attest'): f.run()
        f = Fixture(); f.patches['repairs'][0]['native_verified'] = True; f.repatch()
        with self.assertRaisesRegex(ValueError, 'unsupported repair fields'): f.run()

    def test_witness_identity_flags_cap_interval_and_multiplier_tampering(self):
        for change in (lambda w: w.update(grid=3), lambda w: w.update(j=True),
                       lambda w: w.update(cap='4/5'), lambda w: w.update(capPad='1/1000'),
                       lambda w: w.update(polyOK=1), lambda w: w.update(encl=False),
                       lambda w: w['cons'][0].update(hi='2'),
                       lambda w: w['cons'].reverse(), lambda w: w['cons'][0].update(lam='3')):
            f = Fixture(); f.witness(change)
            with self.assertRaises(ValueError): f.run()

    def test_exact_matrix_failure_and_malformed_matrix_rejected(self):
        for change in (lambda w: w.update(N=diagonal(0)),
                       lambda w: w['N'][0].pop(), lambda w: w['N'][0].__setitem__(1, '1'),
                       lambda w: w['N'][0].__setitem__(0, True)):
            f = Fixture(); f.witness(change)
            with self.assertRaises(ValueError): f.run()

    def test_duplicate_witness_and_duplicate_json_key_rejected(self):
        f = Fixture(); name = 'data/evidence/matrix.jsonl'; f.files[name] *= 2
        digest = repair.sha(f.files[name]); f.binding['source_sha256'][name] = digest
        f.patches['repairs'][0]['evidence']['sha256'] = digest; f.repatch()
        with self.assertRaisesRegex(ValueError, 'duplicate matrix'): f.run()
        with self.assertRaisesRegex(ValueError, 'duplicate JSON'): repair.decode(b'{"x":1,"x":2}')

    def test_zero_pivot_requires_zero_column(self):
        from fractions import Fraction as F
        self.assertTrue(repair.ldl_ok([[F(0), F(0)], [F(0), F(1)]]))
        self.assertFalse(repair.ldl_ok([[F(0), F(1)], [F(1), F(1)]]))


if __name__ == '__main__':
    unittest.main()
