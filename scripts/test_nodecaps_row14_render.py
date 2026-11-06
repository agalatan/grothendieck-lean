#!/usr/bin/env python3
"""Synthetic source-only Row14 renderer tests. Agent-ID: codex-15b7.

No real Row14 inputs, scientific acceptance, Lean, subprocesses or remote calls.
"""
import copy
import importlib.util
from pathlib import Path
import sys
import tempfile
import unittest
from unittest.mock import patch

sys.dont_write_bytecode = True
PROJECT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(PROJECT / 'tools'))
import nodecaps_row14_render as render
from test_caps_active_registry import Fixture, stamp, RECIPE, DIRECTION, PROOF


class Row14Fixture:
    def __init__(self, root):
        self.root = root
        self.f = Fixture(root, rows=(14,), retained=True, materialize=False)
        for name in render.TOOLS:
            self.write(name, (PROJECT / name).read_bytes())
        indices = [150, *range(200, 289)]
        chords = list(range(1, 82))
        table = [[] for _ in range(19)]; table[14] = [(i, 0, 82) for i in chords]
        self.write('Grothe/LowerAnalytic/CapChordData.lean', 'def capChords := ' + repr(table) + '\n')
        self.json('data/lower-rows/row15.json', {'nodes': ';'.join(f'{i}:2' for i in range(396))})
        nodes = [{'k': 14, 'i': i, 's': str(i), 'cap': '2', 'ds': [DIRECTION]*3,
                  'pieces': [{'nq': 1024, 'recipe': RECIPE, 'cons': ['0,+,0,1,0,0']} for _ in
                             range(129 if i == 200 else (3 if i == 226 else 1))]} for i in indices]
        centres = {i: (2 if i == 226 else 0) for i in indices}
        selection = {f'14:{n["i"]}': {'chunk': 4, 'excl': [],
                     'grids': [3 if j == centres[n['i']] else 2 for j in range(len(n['pieces']))]} for n in nodes}
        self.json(render.BASE+'row14-pieces.json', nodes)
        self.json(render.BASE+'row14-selection.json', selection)
        self.json(render.BASE+'row14-generation.json', {'format': 'caps-row-generation-config/v1', 'row': 14,
                  'piece_chunk': 4, 'anchor_range_size': 16, 'certificate_grids': stamp.ACTIVE_GRIDS})
        anchors = sorted(set(range(396)) - set(indices) - set(chords))
        ranges = [{'index': j, 'lo': lo, 'hi': min(lo+16, 396),
                   'hi_lean': '(rowData.getD 14 row01).nodeList.length' if lo+16 >= 396 else str(lo+16),
                   'anchor_indices': [i for i in anchors if lo <= i < lo+16]}
                  for j, lo in enumerate(range(0, 396, 16))]
        self.json(render.BASE+'row14-anchors.json', {
            'row_index': 14, 'row_complete_research_gate': True, 'native_verified': False,
            'capPad': '1/100000000000', 'range_size': 16, 'localized_exclusions': indices,
            'chord_indices': chords, 'grids': stamp.ACTIVE_GRIDS[:2], 'ranges': ranges,
            'census': {'nodes': 396, 'chords': 81, 'vertices': 315, 'localized': 90, 'anchors': 225},
            'source_sha256': {PROOF: render.sha((root / PROOF).read_bytes())},
            'anchors': [{'node_index': i, 'grid_index': 1, 's': str(i), 'cap': '2', 'recipe': RECIPE}
                        for i in anchors]})
        self.json(render.POLICY, {'format': 'caps-coverage-slicing/v1', 'rows': [12, 13, 14],
                                 'threshold': 128, 'pieces_per_slice': 64})
        self.json(render.BASE+'row14.json', {
            'row': 14, 'row_complete_research_gate': True, 'global_capsRest_discharged': False,
            'full_snapshot_centres': 358, 'capPad': '1/100000000000', 'cap_up': '0',
            'outputs': {k: {'file': f'row14-{k}.json',
                           'sha256': render.sha((root / render.BASE / f'row14-{k}.json').read_bytes())}
                        for k in ('pieces', 'selection')},
            'centres': [{'key': f'14:{n["i"]}:{centres[n["i"]]}', 'exact_matrix_replayed': True,
                         'native_verified': False, 'unchanged_bounds_and_recipe': True,
                         'original_piece_index': centres[n['i']], 'output_piece_index': centres[n['i']],
                         'piece_count': len(n['pieces']), 'certificate_grid_index': 3,
                         'certificate_grid_spec': stamp.ACTIVE_GRIDS[3], 'best_kind': 'fine_grid'} for n in nodes]})
        self.json('data/caps-m-pieces/pieces.json', nodes)
        self.json('data/caps-m-pieces/sel.json', {'synthetic_retained_input': 2})

    def write(self, name, data):
        path = self.root / name; path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data.encode() if isinstance(data, str) else data)

    def json(self, name, value): self.write(name, render.encoded(value))
    def value(self, name): return stamp._active_json((self.root / name).read_bytes())

    def binding(self):
        reads = stamp._ActiveReads(self.root)
        retained = set(stamp._active_graph(reads, [render.RETAINED[:-5].replace('/', '.')])) | render.RETAINED_INPUTS
        return {'format': 'nodecaps-row14-source-binding/v1',
                'tools_sha256': {n: render.sha((self.root / n).read_bytes()) for n in render.TOOLS},
                'inputs_sha256': {n: render.sha((self.root / n).read_bytes()) for n in render.INPUTS | {PROOF}},
                'retained_sha256': {n: render.sha((self.root / n).read_bytes()) for n in retained}}


class Row14RenderTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory(prefix='synthetic-row14-')
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name).resolve()
        self.f = Row14Fixture(self.root)

    def render(self): return render.render(self.root, self.f.binding())

    def mutate(self, name, fn):
        value = self.f.value(name); fn(value); self.f.json(name, value)

    def test_complete_source_reproduces_and_preserves_retained_bytes(self):
        before = {p.relative_to(self.root).as_posix(): p.read_bytes() for p in self.root.rglob('*') if p.is_file()}
        outputs, inventory = self.render()
        self.assertEqual((outputs, inventory), self.render())
        self.assertEqual(before, {p.relative_to(self.root).as_posix(): p.read_bytes() for p in self.root.rglob('*') if p.is_file()})
        self.assertFalse(set(outputs) & set(inventory['retained_sha256']))
        self.assertEqual(len([p for p in outputs if p.startswith(render.CPP+'D14x')]), 89)
        assembly = outputs['Grothe/LowerAnalytic/CapRow14/Assembly.lean'].decode()
        self.assertIn('using nodeCap_14x150_done', assembly)
        self.assertNotIn('using (nodeCap_14x150 (by simp))', assembly)
        self.assertIn('import Grothe.LowerAnalytic.CapPieces.Node14x150', assembly)
        for part in range(3):
            path = render.CPP+f'C14x200_{part}.lean'
            self.assertIn(path, outputs)
            self.assertEqual(inventory['native_declarations_by_root'][path],
                             [f'Grothe.LowerAnalytic.pieceCoverSlice_14x200_{part}'])
        self.assertNotIn(render.CPP+'C14x200.lean', inventory['native_declarations_by_root'])
        self.assertFalse(inventory['native_verified'])

    def test_incomplete_or_positive_plan_rejected_even_when_repinned(self):
        for key, value in [('row_complete_research_gate', False), ('row_complete_research_gate', 1),
                           ('full_snapshot_centres', 357), ('cap_up', '1/100000000000'),
                           ('capPad', '1/10000000000')]:
            with self.subTest(key=key, value=value):
                original = self.f.value(render.BASE+'row14.json')
                changed = copy.deepcopy(original); changed[key] = value
                self.f.json(render.BASE+'row14.json', changed)
                with self.assertRaisesRegex(ValueError, 'input gate'): self.render()
                self.f.json(render.BASE+'row14.json', original)

    def test_missing_duplicate_or_unreplayed_centre_rejected(self):
        for change in (lambda p: p['centres'].pop(),
                       lambda p: p['centres'].__setitem__(1, p['centres'][0]),
                       lambda p: p['centres'][0].update(exact_matrix_replayed=1),
                       lambda p: p['centres'][0].update(output_piece_index=True),
                       lambda p: p['centres'][0].update(certificate_grid_index=True)):
            original = self.f.value(render.BASE+'row14.json')
            changed = copy.deepcopy(original); change(changed); self.f.json(render.BASE+'row14.json', changed)
            with self.assertRaises((ValueError, render.STAMP.ClosureError)): self.render()
            self.f.json(render.BASE+'row14.json', original)

    def test_retained_source_mutation_and_incomplete_closure_rejected(self):
        binding = self.f.binding()
        self.write_append(render.CPP+'D14x150.lean', '\n-- different source\n')
        with self.assertRaisesRegex(ValueError, 'source binding differs'): render.render(self.root, binding)
        binding = self.f.binding(); del binding['retained_sha256'][PROOF]
        with self.assertRaisesRegex(ValueError, 'retained proof closure'): render.render(self.root, binding)

    def test_matrix_free_proposal_keeps_honest_flag_and_binds_exact_solution(self):
        name = 'data/caps-m/plan/solved/sol_overrides14_g2.json'
        result = {'k': 14, 'i': 280, 'j': 0, 'grid': 3, 'status': 'fixed', 'cap_up': '0', 'lm': [['0', '0']]}
        self.f.json(name, [result])
        plan = self.f.value(render.BASE+'row14.json')
        centre = next(c for c in plan['centres'] if c['key'] == '14:280:0')
        centre.update(exact_matrix_replayed=False, best_kind='historical_adopted',
                      origin='historical_adopted', historical_proposal=True,
                      solution={'path': name, 'sha256': render.sha((self.root/name).read_bytes())})
        self.f.json(render.BASE+'row14.json', plan)
        binding = self.f.binding(); binding['inputs_sha256'][name] = centre['solution']['sha256']
        outputs, inventory = render.render(self.root, binding)
        self.assertIn(render.CPP+'R14x280_0.lean', outputs)
        self.assertFalse(inventory['native_verified'])
        with self.assertRaisesRegex(ValueError, 'unbound stored proposal'): self.render()
        for update in ({'cap_up': '1/1000'}, {'lm': [['1', '0']]}, {'encl': False}, {'i': 279}):
            changed = {**result, **update}; self.f.json(name, [changed])
            centre['solution']['sha256'] = render.sha((self.root/name).read_bytes())
            self.f.json(render.BASE+'row14.json', plan)
            binding = self.f.binding(); binding['inputs_sha256'][name] = centre['solution']['sha256']
            with self.assertRaises(ValueError): render.render(self.root, binding)

    def write_append(self, name, text):
        self.f.write(name, (self.root / name).read_bytes() + text.encode())

    def test_writer_pin_cannot_be_relabelled(self):
        self.write_append(render.TOOLS[0], '\n# fixture changed writer\n')
        with self.assertRaisesRegex(ValueError, 'running renderer differs'): self.render()

    def test_changed_selected_bytes_do_not_match_adopted_plan(self):
        self.mutate(render.BASE+'row14-selection.json', lambda s: s['14:201']['grids'].__setitem__(0, 2))
        with self.assertRaisesRegex(ValueError, 'inventory/grid differs|adopted input differs'): self.render()

    def test_anchor_census_and_partition_are_checked(self):
        self.mutate(render.BASE+'row14-anchors.json', lambda a: a['anchors'].pop())
        with self.assertRaisesRegex(render.STAMP.ClosureError, 'anchor/chord/localized partition'): self.render()

    def test_missing150_not_silently_generated_or_excluded(self):
        self.mutate(render.BASE+'row14.json', lambda p: p['centres'][0].update(key='14:151:0'))
        with self.assertRaisesRegex(ValueError, 'exact centre input'): self.render()

    def test_unsupported_interval_layout_is_rejected(self):
        self.mutate(render.BASE+'row14-pieces.json', lambda nodes: nodes[1]['pieces'][0].update(children=[]))
        with self.assertRaisesRegex(render.STAMP.ClosureError, 'unsupported chosen interval'): self.render()

    def test_changed_noncentre_or_region_rejected_even_if_output_repinned(self):
        name = render.BASE+'row14-pieces.json'
        for index, value in ((1, '0,+,0,1,1,0'), (0, '0,+,0,2,0,0')):
            original = self.f.value(name)
            changed = copy.deepcopy(original); changed[1]['pieces'][index]['cons'][0] = value
            self.f.json(name, changed)
            self.mutate(render.BASE+'row14.json', lambda p: p['outputs']['pieces'].update(
                sha256=render.sha((self.root/name).read_bytes())))
            with self.assertRaisesRegex(ValueError, 'noncentre pieces changed|constraint regions/order changed'): self.render()
            self.f.json(name, original)

    def test_nonzero_centre_piece_is_used_and_other_pieces_are_preserved(self):
        name = render.BASE+'row14-pieces.json'
        nodes = self.f.value(name); node = next(n for n in nodes if n['i'] == 226)
        node['pieces'][2]['cons'][0] = '0,+,0,1,3/2,0'
        self.f.json(name, nodes)
        self.mutate(render.BASE+'row14.json', lambda p: p['outputs']['pieces'].update(
            sha256=render.sha((self.root/name).read_bytes())))
        outputs, _ = self.render()
        self.assertIn('3;'+RECIPE+';0,+,0,1,3/2,0', outputs[render.CPP+'D14x226.lean'].decode())
        node['pieces'][0]['cons'][0] = '0,+,0,1,1,0'
        self.f.json(name, nodes)
        self.mutate(render.BASE+'row14.json', lambda p: p['outputs']['pieces'].update(
            sha256=render.sha((self.root/name).read_bytes())))
        with self.assertRaisesRegex(ValueError, 'noncentre pieces changed'): self.render()

    def test_false_native_and_exact_grid_claims_are_rejected(self):
        for update in ({'native_verified': True}, {'certificate_grid_spec': [1600, 1024, '1/200']},
                       {'best_kind': 'interval_partition'}):
            original = self.f.value(render.BASE+'row14.json')
            changed = copy.deepcopy(original); changed['centres'][0].update(update)
            self.f.json(render.BASE+'row14.json', changed)
            with self.assertRaises((ValueError, render.STAMP.ClosureError)): self.render()
            self.f.json(render.BASE+'row14.json', original)

    def test_stale_input_pin_and_source_symlink_rejected(self):
        binding = self.f.binding()
        self.write_append(render.BASE+'row14-pieces.json', '\n')
        with self.assertRaisesRegex(ValueError, 'source binding differs'): render.render(self.root, binding)
        binding = self.f.binding()
        source = self.root / PROOF; data = source.read_bytes(); source.unlink()
        self.f.write(PROOF+'.real', data); source.symlink_to(source.name+'.real')
        with self.assertRaisesRegex(render.STAMP.ClosureError, 'symlink'): render.render(self.root, binding)

    def test_missing_slice_is_rejected(self):
        original = render.load_module
        def faulty(name, path):
            module = original(name, path)
            if name == 'row14_canonical_piece_writer':
                write = module.write_nodes
                def omit(*args):
                    write(*args); (Path(module.ROOT) / render.CPP / 'C14x200_1.lean').unlink()
                module.write_nodes = omit
            return module
        with patch.object(render, 'load_module', side_effect=faulty):
            with self.assertRaisesRegex(ValueError, 'missing or unexpected generated module/slice'): self.render()

    def test_published_seal_reproduces_and_rejects_changed_inventory(self):
        binding = self.f.binding()
        outputs, inventory = render.render(self.root, binding)
        self.f.json(render.BASE+'row14-source.json', inventory)
        binding['source_manifest_sha256'] = render.sha((self.root / render.BASE / 'row14-source.json').read_bytes())
        self.f.json(render.BASE+'row14-binding.json', binding)
        self.assertEqual(render.render_sealed(self.root), outputs)
        path = render.CPP+'C14x200_2.lean'
        del inventory['files_sha256'][path]
        self.f.json(render.BASE+'row14-source.json', inventory)
        with self.assertRaisesRegex(ValueError, 'source seal changed'): render.render_sealed(self.root)
        binding['source_manifest_sha256'] = render.sha((self.root / render.BASE / 'row14-source.json').read_bytes())
        self.f.json(render.BASE+'row14-binding.json', binding)
        with self.assertRaisesRegex(ValueError, 'inventory differs'): render.render_sealed(self.root)


if __name__ == '__main__': unittest.main()
