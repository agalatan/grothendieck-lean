#!/usr/bin/env python3
"""Isolated source-only active-registry fixtures. Agent-ID: codex-15b7.

These fixtures never invoke Lean, Git, a subprocess, a droplet or Actions.
"""
import copy
import hashlib
import importlib.util
import json
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch

MODULE_PATH = Path(__file__).with_name('caps_stamp.py')
spec = importlib.util.spec_from_file_location('caps_stamp_active_tests', MODULE_PATH)
stamp = importlib.util.module_from_spec(spec)
spec.loader.exec_module(stamp)

BASE = 'data/caps-m/plan/row-certificates/'
CPP = 'Grothe/LowerAnalytic/CapPieces/'
PROOF = 'Grothe/LowerAnalytic/UnrelatedProof.lean'
RECIPE = ','.join(['0'] * 12) + '|1'
DIRECTION = '1,' + ','.join(['0'] * 11)
DERIVED = ('compute_roots', 'direct_hash_roots', 'pure_roots', 'native_declarations_by_root',
           'input_sha256', 'computation_input_sha256', 'source_sha256', 'execution_source_sha256',
           'derived_counts', 'max_parallel_leaves', 'lean_child_threads')


class Fixture:
    def __init__(self, root, rows=(12, 13), materialize=True, retained=False):
        self.root = root
        self.registry = {'format': stamp.ACTIVE_FORMAT, 'legacy_rows_input': 'data/cap-nodes/rows.txt',
                         'legacy_rows': list(stamp.CAP_ROWS), 'active_rows': [], 'retained_proofs': []}
        self.write('data/cap-nodes/rows.txt', '--size 49 ' + ' '.join(map(str, stamp.CAP_ROWS)) + '\n')
        chord_rows = [[] for _ in range(19)]
        for row in rows: chord_rows[row] = [(1, 0, 2)]
        self.write('Grothe/LowerAnalytic/CapChordData.lean', 'def capChords := ' + repr(chord_rows) + '\n')
        self.write('Grothe/Lower/RowDataTypes.lean', 'def capPad : ℚ := 1 / 100000000000\n')
        self.write('GrotheCapsKernel.lean', 'import GrotheCapsKernel.Basic\n')
        self.write('GrotheCapsKernel/Basic.lean', 'namespace GrotheKernel\ndef scalar := 1\nend GrotheKernel\n')
        self.write('Grothe/LowerAnalytic/FixturePure.lean', 'import GrotheCapsKernel\nnamespace Grothe.LowerAnalytic\ndef pureInput := 1\nend Grothe.LowerAnalytic\n')
        self.write(PROOF, 'namespace Grothe.LowerAnalytic\ntheorem unrelated : True := by trivial\nend Grothe.LowerAnalytic\n')
        for name in stamp.ACTIVE_CONFIG + stamp.ACTIVE_EXECUTION: self.write(name, '# synthetic source/config ' + name + '\n')
        # The script under test is an execution pin, not imported from this fixture.
        for row in stamp.CAP_ROWS:
            facts = {f'capRange{row:02d}_{j}': f'rangeOK {row} (parseRecs capRecipes{row:02d}) capGrids (capExcl {row}) {49*j} ' +
                     (str(49*(j+1)) if j < 3 else f'(rowData.getD {row} row01).nodeList.length') + ' = true' for j in range(4)}
            self.native(f'Grothe/LowerAnalytic/CapRow{row:02d}.lean', facts)
        if retained: self.retained()
        for row in rows: self.row(row, materialize=materialize, retained=retained and row == 14)
        # The quadrature-checker facts are hashed alongside (stamp.TOPS) but are neither cap-row roots nor CapNodes imports.
        for name in stamp.QUAD_TOPS:
            self.write(name.replace('.', '/') + '.lean', 'namespace Grothe.UpperQuad\ndef quadFact := 1\nend Grothe.UpperQuad\n')
        imports = [*stamp.ROW_TOPS, *[v['assembly'][:-5].replace('/', '.') for v in self.registry['active_rows']]]
        self.write('Grothe/LowerAnalytic/CapNodes.lean', ''.join('import ' + n + '\n' for n in imports) +
                   'namespace Grothe.LowerAnalytic\ndef aggregateSource := 1\nend Grothe.LowerAnalytic\n')

    def write(self, name, data):
        path = self.root / name
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(data)

    def json(self, name, value): self.write(name, json.dumps(value, sort_keys=True, indent=2) + '\n')
    def value(self, name): return json.loads((self.root / name).read_text())
    def native(self, name, facts, imports=('Grothe.LowerAnalytic.FixturePure',)):
        self.write(name, ''.join('import ' + n + '\n' for n in imports) + 'namespace Grothe.LowerAnalytic\n' +
                   ''.join(f'theorem {n} : {p} := by native_decide\n' for n, p in facts.items()) + 'end Grothe.LowerAnalytic\n')

    def row(self, row, materialize, retained):
        size = 152 if retained else 6
        index = 150 if retained else 3
        chunk, span, count = (3, 16, 7) if row == 14 else ((2, 2, 5) if row == 12 else (4, 3, 3))
        item = {'row': row, **{k: BASE+f'row{row}-{suffix}.json' for k, suffix in
                    (('generation_config', 'generation'), ('pieces', 'pieces'), ('selection', 'selection'), ('anchors', 'anchors'))},
                'assembly': f'Grothe/LowerAnalytic/CapRow{row}/Assembly.lean',
                'vertex_theorem': f'Grothe.LowerAnalytic.vertexCapsRow{row}',
                'retained_nodes': [{'node': 150, 'proof': 'node14x150'}] if retained else []}
        self.registry['active_rows'].append(item)
        self.json(item['generation_config'], {'format': 'caps-row-generation-config/v1', 'row': row, 'piece_chunk': chunk,
                    'anchor_range_size': span, 'certificate_grids': stamp.ACTIVE_GRIDS, 'scope': 'synthetic declaration'})
        canonical = {'nodes': ';'.join(f'{i}:2' for i in range(size)), 'provenance': 'excluded metadata'}
        self.json(f'data/lower-rows/row{row+1:02d}.json', canonical)
        pieces = [{'k': row, 'i': index, 's': str(index), 'cap': '2', 'ds': [DIRECTION]*3,
                   'pieces': [{'nq': 1152, 'recipe': RECIPE, 'cons': ['0,+,0,1,0,0'], 'slack': 0.5} for _ in range(count)]}]
        selection = {f'{row}:{index}': {'chunk': chunk, 'excl': [], 'grids': [3]*count}}
        self.json(item['pieces'], pieces); self.json(item['selection'], selection)
        anchors = [i for i in range(size) if i not in {1, index}]
        ranges = [{'index': j, 'lo': lo, 'hi': min(lo+span, size),
                   'hi_lean': f'(rowData.getD {row} row01).nodeList.length' if min(lo+span, size) == size else str(lo+span),
                   'anchor_indices': [i for i in anchors if lo <= i < lo+span]} for j, lo in enumerate(range(0, size, span))]
        anchor = {'row_index': row, 'capPad': '1/100000000000', 'range_size': span,
                  'census': {'nodes': size, 'chords': 1, 'vertices': size-1, 'localized': 1, 'anchors': len(anchors)},
                  'localized_exclusions': [index], 'chord_indices': [1], 'grids': stamp.ACTIVE_GRIDS[:2],
                  'anchors': [{'node_index': i, 'grid_index': 1, 's': str(i), 'cap': '2', 'recipe': RECIPE} for i in anchors],
                  'ranges': ranges, 'source_sha256': {PROOF: 'f'*64}, 'status': 'UNVERIFIED candidate'}
        self.json(item['anchors'], anchor)
        if not materialize: return
        recipe_path = f'Grothe/LowerAnalytic/CapRow{row}/Recipes.lean'
        self.write(recipe_path, 'import Grothe.LowerAnalytic.FixturePure\nnamespace Grothe.LowerAnalytic\n' +
                   f'def row{row}AnchorRecipes : List (Nat × Nat × String) := ' + repr([(i, 1, RECIPE) for i in anchors]) + '\n' +
                   f'def row{row}LocalizedExclusions : List Nat := [{index}]\n' +
                   f'def row{row}AnchorGrids : List (Nat × Nat × Rat) := [(400, 128, 1 / 50), (1600, 256, 1 / 200)]\nend Grothe.LowerAnalytic\n')
        imports = []
        for part in ranges:
            path = f'Grothe/LowerAnalytic/CapRow{row}/AnchorRange{part["index"]:02d}.lean'
            self.native(path, {f'row{row}AnchorRange{part["index"]:02d}':
                        f'rangeOK {row} (parseRecs row{row}AnchorRecipes) row{row}AnchorGrids row{row}LocalizedExclusions {part["lo"]} {part["hi_lean"]} = true'},
                        imports=(recipe_path[:-5].replace('/', '.'),))
            imports.append(path)
        tag = f'{row}x{index}'
        if retained: imports.append(stamp._RETAINED_NODE)
        else:
            data = (row, index, [DIRECTION]*3, ['3;'+RECIPE+';0,+,0,1,0,0']*count)
            self.write(CPP+f'D{tag}.lean', f'namespace Grothe.LowerAnalytic\ndef pieceNode_{tag} : Nat × Nat × List String × List String := ' + repr(data) + '\nend Grothe.LowerAnalytic\n')
            compute_imports = ('Grothe.LowerAnalytic.FixturePure', (CPP+f'D{tag}.lean')[:-5].replace('/', '.'))
            self.native(CPP+f'C{tag}.lean', {f'pieceCover_{tag}': f'pieceCoverOK pieceNode_{tag} = true'}, compute_imports)
            nimports = [CPP+f'C{tag}.lean']
            for j, lo in enumerate(range(0, count, chunk)):
                path = CPP+f'R{tag}_{j}.lean'
                self.native(path, {f'pieceRange_{tag}_{j}': f'pieceRangeOK pieceNode_{tag} {lo} {min(lo+chunk,count)} = true'}, compute_imports)
                nimports.append(path)
            self.write(CPP+f'N{tag}.lean', ''.join('import '+p[:-5].replace('/', '.')+'\n' for p in nimports) +
                       f'namespace Grothe.LowerAnalytic\ntheorem nodeCap_{tag} : NodeCap {row} {index} := by exact fixture\nend Grothe.LowerAnalytic\n')
            imports.append(CPP+f'N{tag}.lean')
        self.write(item['assembly'], ''.join('import '+p[:-5].replace('/', '.')+'\n' for p in imports+[PROOF]) +
                   f'namespace Grothe.LowerAnalytic\ntheorem vertexCapsRow{row} : VertexCapsRow {row} := by exact fixture\nend Grothe.LowerAnalytic\n')

    def retained(self):
        record = {'id': 'node14x150', 'row': 14, 'node': 150, 'root': stamp._RETAINED_NODE,
                  'theorem': 'Grothe.LowerAnalytic.nodeCap_14x150_done', 'repair_input': 'data/caps-m-pieces/repairs.json'}
        self.registry['retained_proofs'] = [record]
        self.json(record['repair_input'], {'14:150': {'0': {'grid': 2, 'lm': [['3507/50000', '0']], 'cap_up': '0'}}})
        shapes = {'C14x150': ('pieceCover_14x150', 'pieceCoverOK pieceNode_14x150 = true'),
                  'R14x150_0': ('pieceRange_14x150_0', 'pieceRangeOK pieceNode_14x150 1 5 = true'),
                  'R14x150_1': ('pieceRange_14x150_1', 'pieceRangeOK pieceNode_14x150 5 9 = true'),
                  'R14x150p0Repair': ('pieceRepair_14x150p0_check', 'pieceRepairOK pieceNode_14x150 pieceRepair_14x150p0 0 0 = true')}
        self.write(CPP+'D14x150.lean', 'namespace Grothe.LowerAnalytic\ndef historicalData := 9\nend Grothe.LowerAnalytic\n')
        for stem, (name, proposition) in shapes.items():
            self.native(CPP+stem+'.lean', {name: proposition}, ('Grothe.LowerAnalytic.FixturePure', 'Grothe.LowerAnalytic.CapPieces.D14x150'))
        self.write(CPP+'N14x150.lean', ''.join('import '+(CPP+p+'.lean')[:-5].replace('/', '.')+'\n' for p in shapes) +
                   'namespace Grothe.LowerAnalytic\ntheorem nodeCap_14x150 : NodeCap 14 150 := by exact fixture\nend Grothe.LowerAnalytic\n')
        self.write(stamp._RETAINED_NODE, 'import Grothe.LowerAnalytic.CapPieces.N14x150\nimport '+PROOF[:-5].replace('/', '.')+
                   '\nnamespace Grothe.LowerAnalytic\ntheorem nodeCap_14x150_done : NodeCap 14 150 := by exact nodeCap_14x150\nend Grothe.LowerAnalytic\n')

    def view(self, **kw): return stamp.derive_active_registry(self.root, self.registry, **kw)
    def sealed(self):
        view = self.view(); return self.registry | {k: view[k] for k in DERIVED}
    def publish(self):
        value = self.sealed(); self.json(stamp.BUILD_REGISTRY, value); return value


class ActiveRegistryTests(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.root = Path(self.tmp.name).resolve()
        self.f = Fixture(self.root)
    def tearDown(self): self.tmp.cleanup()
    def reject(self, action=None):
        with self.assertRaises(stamp.ClosureError): (action or self.f.view)()
    def edit(self, field, fn, row=12):
        name = BASE+f'row{row}-{field}.json'; value = self.f.value(name); fn(value); self.f.json(name, value)

    def test_multirow_exact_module_fact_counts(self):
        view = self.f.view()
        self.assertEqual(view['derived_counts'], {'compute_modules': 26, 'native_facts': 71})
        self.assertEqual(set(view['proved_rows']), {'12', '13'})
        self.assertEqual(len(view['direct_hash_roots']), 3)
        self.assertFalse(view['native_verified']); self.assertFalse(view['cache_uploaded'])
        self.assertNotIn(PROOF, view['source_sha256'])
        self.assertIn('GrotheCapsKernel/Basic.lean', view['pure_roots'])

    def test_declaration_gate_never_accepts_missing_materialization(self):
        with tempfile.TemporaryDirectory() as directory:
            f = Fixture(Path(directory).resolve(), materialize=False)
            view = f.view(require_materialized=False)
            self.assertFalse(view['materialized']); self.assertFalse(view['source_sha256'])
            self.reject(f.view)
            self.reject(lambda: stamp.read_active_registry(f.root, f.registry))
            self.assertEqual(stamp.read_active_registry(f.root, f.registry, require_materialized=False)['compute_roots'], view['compute_roots'])

    def test_serialized_materialized_pins_required(self):
        value = self.f.sealed()
        self.assertEqual(stamp.read_active_registry(self.root, value)['derived_counts'], self.f.view()['derived_counts'])
        for field in DERIVED:
            broken = copy.deepcopy(value); del broken[field]
            with self.subTest(field=field): self.reject(lambda: stamp.read_active_registry(self.root, broken))

    def test_omitted_duplicate_extra_compute_and_native_roots(self):
        value = self.f.sealed()
        for mode in ('omit', 'duplicate', 'extra', 'native_name'):
            broken = copy.deepcopy(value)
            if mode == 'omit': broken['compute_roots'].pop()
            if mode == 'duplicate': broken['compute_roots'].append(broken['compute_roots'][0])
            if mode == 'extra': broken['compute_roots'].append('Grothe/LowerAnalytic/UnrelatedProof.lean')
            if mode == 'native_name': broken['native_declarations_by_root'][broken['compute_roots'][0]][0] += '_renamed'
            with self.subTest(mode=mode): self.reject(lambda: stamp.read_active_registry(self.root, broken))

    def test_nongenuine_cover_range_anchor_and_legacy_facts(self):
        for name in (CPP+'C12x3.lean', CPP+'R12x3_0.lean', 'Grothe/LowerAnalytic/CapRow12/AnchorRange00.lean', 'Grothe/LowerAnalytic/CapRow00.lean'):
            p = self.root/name; original=p.read_text()
            p.write_text(original.replace(original.split(' : ')[1].split(' := ')[0], 'True'))
            with self.subTest(path=name): self.reject()
            p.write_text(original)

    def test_exact_piece_range_and_anchor_range_coverage(self):
        for name, old, new in ((CPP+'R12x3_1.lean', ' 2 4 = true', ' 2 3 = true'),
                ('Grothe/LowerAnalytic/CapRow12/AnchorRange00.lean', ' 0 2 = true', ' 0 1 = true')):
            p=self.root/name; data=p.read_text(); p.write_text(data.replace(old,new)); self.reject(); p.write_text(data)
        self.edit('anchors', lambda a: a['ranges'].pop()); self.reject()

    def test_anchor_omission_duplicate_grid_recipe_cap(self):
        original=self.f.value(BASE+'row12-anchors.json')
        changes=(lambda a:a['anchors'].pop(), lambda a:a['anchors'].append(a['anchors'][0]),
                 lambda a:a['anchors'][0].update(grid_index=False), lambda a:a['anchors'][0].update(recipe='0|1'),
                 lambda a:a['anchors'][0].update(cap='3'))
        for change in changes:
            a=copy.deepcopy(original);change(a);self.f.json(BASE+'row12-anchors.json',a);self.reject()
        self.f.json(BASE+'row12-anchors.json',original)

    def test_legacy_and_active_row_identity_exact(self):
        for value in (False, 12.0, '12', 11, 16):
            original=self.f.registry['active_rows'][0]['row'];self.f.registry['active_rows'][0]['row']=value
            self.reject();self.f.registry['active_rows'][0]['row']=original
        self.f.registry['legacy_rows'].pop();self.reject()

    def test_duplicate_or_out_of_order_rows(self):
        self.f.registry['active_rows'].reverse();self.reject();self.f.registry['active_rows'].reverse()
        self.f.registry['active_rows'].append(copy.deepcopy(self.f.registry['active_rows'][0]));self.reject()

    def test_bool_float_rational_and_grid_aliases_rejected(self):
        original=self.f.value(BASE+'row12-pieces.json')
        for value in (False, 0.0, 0, '0/1', '+0', ' 0'):
            changed=copy.deepcopy(original);changed[0]['s']=value;self.f.json(BASE+'row12-pieces.json',changed);self.reject()
        self.f.json(BASE+'row12-pieces.json',original)
        self.edit('selection',lambda v:v['12:3']['grids'].__setitem__(0,3.0));self.reject()

    def test_piece_node_grid_directions_and_ordered_multipliers(self):
        original=self.f.value(BASE+'row12-pieces.json')
        for change in (lambda n:n['pieces'][0].update(nq=129),lambda n:n.update(ds=['0']*3),
                       lambda n:n['pieces'][0].update(cons=['0,+,0,1,-1,0']),lambda n:n['pieces'][0].update(children=[])):
            value=copy.deepcopy(original);change(value[0]);self.f.json(BASE+'row12-pieces.json',value);self.reject()
        self.f.json(BASE+'row12-pieces.json',original)

    def test_generated_literals_bind_exact_chosen_inputs(self):
        for name, old, new in ((CPP+'D12x3.lean','3;'+RECIPE,'2;'+RECIPE),
                              ('Grothe/LowerAnalytic/CapRow12/Recipes.lean',"(0, 1,", "(0, 0,")):
            p=self.root/name;original=p.read_text();p.write_text(original.replace(old,new,1));self.reject();p.write_text(original)

    def test_capPad_raw_caps_chord_partition_immutable(self):
        p=self.root/'Grothe/Lower/RowDataTypes.lean';original=p.read_text();p.write_text(original.replace('100000000000','10000000000'));self.reject();p.write_text(original)
        for expression in (' + 1','\n  + 1'):
            p.write_text(original.rstrip()+expression+'\n');self.reject()
        p.write_text(original)
        self.edit('anchors',lambda a:a.update(localized_exclusions=[]));self.reject()

    def test_hidden_native_fact_and_dependent_native_leaf(self):
        p=self.root/'Grothe/LowerAnalytic/FixturePure.lean';original=p.read_text()
        p.write_text(original.replace('end Grothe.LowerAnalytic','theorem ghost : True := by native_decide\nend Grothe.LowerAnalytic'));self.reject();p.write_text(original)
        p=self.root/(CPP+'R12x3_0.lean');p.write_text('import Grothe.LowerAnalytic.CapPieces.C12x3\n'+p.read_text());self.reject()

    def test_unsafe_and_comment_string_native_detection(self):
        p=self.root/'Grothe/LowerAnalytic/FixturePure.lean';original=p.read_text()
        p.write_text(original+'\n/- nested /- native_decide -/ unsafe axiom -/\ndef note := "native_decide sorry"\n');self.f.view()
        p.write_text(original+'\naxiom invented : False\n');self.reject()

    def test_project_missing_cycle_unsupported_import(self):
        p=self.root/'Grothe/LowerAnalytic/FixturePure.lean';original=p.read_text()
        for content in ('import Grothe.Missing\n','import Grothe.LowerAnalytic.FixturePure\n','import GrotheCapsKernel (only)\n'):
            p.write_text(content+original);self.reject()
        p.write_text(original)

    def test_checker_image_no_analytic_project_import(self):
        p=self.root/'GrotheCapsKernel/Basic.lean';p.write_text('import Grothe.LowerAnalytic.UnrelatedProof\n'+p.read_text());self.reject()

    def test_missing_active_assembly_and_CapNodes_import(self):
        p=self.root/'Grothe/LowerAnalytic/CapNodes.lean';p.write_text(p.read_text().replace('import Grothe.LowerAnalytic.CapRow13.Assembly\n',''));self.reject()

    def test_assembly_chosen_nodes_and_anchors_cannot_be_omitted(self):
        p=self.root/'Grothe/LowerAnalytic/CapRow12/Assembly.lean';p.write_text(p.read_text().replace('import Grothe.LowerAnalytic.CapPieces.N12x3\n',''));self.reject()

    def test_undeclared_canonical_assembly_or_extra_CapNodes_import(self):
        self.f.registry['active_rows'].pop();self.reject()
        self.f.registry['active_rows'].append({'row': 13})
        # Recreate only this isolated fixture, never touch a canonical output.
        self.f=Fixture(self.root)
        p=self.root/'Grothe/LowerAnalytic/CapNodes.lean'
        p.write_text('import Grothe.LowerAnalytic.CapRow14.Assembly\n'+p.read_text());self.reject()

    def test_native_public_namespace_is_actual_not_preceding_text(self):
        p=self.root/(CPP+'C12x3.lean');original=p.read_text()
        p.write_text(original.replace('theorem pieceCover','private theorem pieceCover'));self.reject()
        p.write_text('namespace Grothe.LowerAnalytic\nend Grothe.LowerAnalytic\ntheorem pieceCover_12x3 : pieceCoverOK pieceNode_12x3 = true := by native_decide\n');self.reject()
        p.write_text(original.replace('namespace Grothe.LowerAnalytic','namespace Elsewhere'));self.reject()
        p.write_text(original)

    def test_required_soundness_and_assembly_names_are_public(self):
        for name,theorem in ((CPP+'N12x3.lean','nodeCap_12x3'),
                             ('Grothe/LowerAnalytic/CapRow12/Assembly.lean','vertexCapsRow12')):
            p=self.root/name;original=p.read_text()
            p.write_text(original.replace('theorem '+theorem,'private theorem '+theorem));self.reject()
            p.write_text(original.replace('namespace Grothe.LowerAnalytic','namespace Different'));self.reject()
            p.write_text(original)

    def test_original_nq_metadata_is_distinct_from_selected_fine_grid(self):
        self.edit('pieces',lambda p:p[0]['pieces'][0].update(nq=1024))
        view=self.f.view();self.assertEqual(view['active_rows'][0]['pieces'],5)
        # Explicit selection and D literal continue to bind grid3=(1600,1152,1/200).
        self.edit('selection',lambda s:s['12:3']['grids'].__setitem__(0,2));self.reject()

    def test_data_literal_comment_spoof_is_rejected(self):
        p=self.root/(CPP+'D12x3.lean');original=p.read_text()
        p.write_text('/- '+original+' -/\n'+original.replace('3;'+RECIPE,'2;'+RECIPE));self.reject()

    def test_complete_literal_definitions_reject_suffix_transforms(self):
        names=((CPP+'D12x3.lean','pieceNode_12x3'),
               ('Grothe/LowerAnalytic/CapRow12/Recipes.lean','row12AnchorRecipes'),
               ('Grothe/LowerAnalytic/CapRow12/Recipes.lean','row12LocalizedExclusions'),
               ('Grothe/LowerAnalytic/CapRow12/Recipes.lean','row12AnchorGrids'))
        for path,name in names:
            p=self.root/path;original=p.read_text();literal=stamp._active_literal_text(original.encode(),name)
            for suffix in (' |> fun _ => []','\n  |> fun _ => []','\n|> fun _ => []'):
                with self.subTest(definition=name,suffix=suffix):
                    p.write_text(original.replace(literal,literal+suffix,1));self.reject()
            p.write_text(original)

    def test_cached_bytes_are_used_for_all_import_parsing(self):
        original=stamp.imports_of;seen=[]
        def transient(path, source_bytes=None):
            path=Path(path);old=path.read_bytes();seen.append(source_bytes is not None)
            path.write_bytes(b'import Grothe.MissingTransient\n'+old)
            try: return original(path,source_bytes)
            finally: path.write_bytes(old)
        with patch.object(stamp,'imports_of',transient): self.f.view()
        self.assertTrue(seen and all(seen))

    def test_registration_subset_requires_every_fact_soundness_and_print(self):
        value=self.f.sealed();view=stamp.read_active_registry(self.root,value)
        self.f.write('data/axioms/native.txt','\n'.join(view['native_axioms']+['Other.Owner.native'])+'\n')
        self.f.write('data/axioms/required.txt','\n'.join(view['required_declarations']+['Other.Owner.required'])+'\n')
        self.f.write('scratch/Axioms.lean','\n'.join('#print axioms '+n for n in view['required_axiom_prints']+['Other.Owner.print'])+'\n')
        self.assertEqual(stamp.validate_active_registrations(self.root,value)['caps_native_entries_checked'],71)
        before=self.f.view()['cache_projection']
        for path in ('data/axioms/native.txt','data/axioms/required.txt','scratch/Axioms.lean'):
            p=self.root/path;old=p.read_text();p.write_text('\n'.join(old.splitlines()[1:])+'\n')
            self.reject(lambda:stamp.validate_active_registrations(self.root,value));p.write_text(old)
        self.assertEqual(before,self.f.view()['cache_projection'])

    def test_symlink_alias_escape_fifo_and_root_alias(self):
        p=self.root/(CPP+'C12x3.lean');data=p.read_bytes();p.unlink();p.symlink_to(self.root/'Grothe/LowerAnalytic/UnrelatedProof.lean');self.reject();p.unlink();p.write_bytes(data)
        value=copy.deepcopy(self.f.registry);value['active_rows'][0]['pieces']=BASE+'../row12-pieces.json';self.reject(lambda:stamp.derive_active_registry(self.root,value))
        with tempfile.TemporaryDirectory() as d:
            alias=Path(d)/'alias';alias.symlink_to(self.root,target_is_directory=True);self.reject(lambda:stamp.derive_active_registry(alias,self.f.registry))
        import os
        p.unlink();os.mkfifo(p);self.reject()

    def test_materialized_source_and_execution_pin_changes(self):
        value=self.f.sealed()
        for name in ('GrotheCapsKernel/Basic.lean','lakefile.toml','scripts/build_caps_batches.py',CPP+'R12x3_0.lean','Grothe/LowerAnalytic/CapRow12/Assembly.lean'):
            p=self.root/name;old=p.read_text();p.write_text(old+'\n-- changed\n');self.reject(lambda:stamp.read_active_registry(self.root,value));p.write_text(old)

    def test_provenance_metadata_does_not_leak_into_heavy_projection(self):
        before=self.f.view()['cache_projection']
        self.edit('anchors',lambda a:a.update(source_sha256={PROOF:'a'*64},status='a different source-only review'))
        self.edit('generation',lambda c:c.update(scope='changed author note',canonical_base='a'*40))
        raw=self.f.value('data/lower-rows/row13.json');raw['provenance']='changed metadata';self.f.json('data/lower-rows/row13.json',raw)
        self.f.registry['provenance']={'full_source_sha256':{PROOF:'b'*64},'global_allowlist_sha256':'c'*64}
        after=self.f.view()['cache_projection'];self.assertEqual(before,after)
        self.assertNotIn('input_sha256',after);self.assertNotIn('provenance',after)

    def test_full_provenance_is_independently_checked(self):
        value=self.f.sealed();view=stamp.read_active_registry(self.root,value)
        reads=stamp._ActiveReads(self.root);roots=[v['assembly'][:-5].replace('/','.') for v in view['active_rows']]
        names=set(stamp._active_graph(reads,roots))|set(view['row_source_paths'])
        manifest={'format':'caps-active-source-provenance/v1','source_sha256':{n:hashlib.sha256((self.root/n).read_bytes()).hexdigest() for n in names}}
        self.f.json('full-provenance.json',manifest)
        checked=stamp.validate_active_provenance(self.root,value,'full-provenance.json');self.assertFalse(checked['native_verified'])
        p=self.root/PROOF;p.write_text(p.read_text()+'\n-- analytic proof changed\n')
        self.assertEqual(view['cache_projection'],self.f.view()['cache_projection'])
        self.reject(lambda:stamp.validate_active_provenance(self.root,value,'full-provenance.json'))
        del manifest['source_sha256'][PROOF];self.f.json('full-provenance.json',manifest)
        self.reject(lambda:stamp.validate_active_provenance(self.root,value,'full-provenance.json'))

    def test_false_completion_claims_and_noninteger_counts(self):
        for claim in ('native_verified','cache_uploaded','pilot_attested','global_capsRest_discharged'):
            self.f.registry['provenance']={claim:True};self.reject()
        self.f.registry.pop('provenance')
        value=self.f.sealed();value['derived_counts']['compute_modules']=26.0;self.reject(lambda:stamp.read_active_registry(self.root,value))

    def test_retained_master_proof_native_closure_and_row14_reuse(self):
        with tempfile.TemporaryDirectory() as directory:
            f=Fixture(Path(directory).resolve(),rows=(14,),retained=True);view=f.view()
            self.assertTrue(set(stamp._RETAINED_ROOTS)<=set(view['compute_roots']))
            self.assertIn(stamp._RETAINED_NODE,view['direct_hash_roots'])
            self.assertNotIn(CPP+'D14x150.lean',view['row_source_paths'])
            self.assertEqual(view['derived_counts'],{'compute_modules':29,'native_facts':74})
            f.registry['active_rows'][0]['retained_nodes']=[];self.reject(f.view)
            f.registry['active_rows'][0]['retained_nodes']=[{'node':150,'proof':'node14x150'}]
            f.registry['retained_proofs']=[];self.reject(f.view)

    def test_retained_proof_omission_and_full_analytic_closure(self):
        with tempfile.TemporaryDirectory() as directory:
            f=Fixture(Path(directory).resolve(),rows=(12,),retained=True);view=f.view()
            p=f.root/stamp._RETAINED_NODE;p.write_text(p.read_text().replace('NodeCap 14 150','NodeCap 14 151'));self.reject(f.view)
            p.write_text(p.read_text().replace('NodeCap 14 151','NodeCap 14 150'))
            value=f.sealed();manifest={'format':'caps-active-source-provenance/v1','source_sha256':{n:hashlib.sha256((f.root/n).read_bytes()).hexdigest() for n in view['row_source_paths']}}
            f.json('full.json',manifest);self.reject(lambda:stamp.validate_active_provenance(f.root,value,'full.json'))

    def test_final_source_reread_rejects_change_during_derivation(self):
        old=stamp._ActiveReads.unchanged
        def changed(reads):
            p=reads.root/'lakefile.toml';p.write_text(p.read_text()+'changed\n');old(reads)
        with patch.object(stamp._ActiveReads,'unchanged',changed): self.reject()

    def test_final_absent_source_and_registry_snapshots_are_checked(self):
        original=stamp._ActiveReads.unchanged
        def late(reads):
            self.f.write('Grothe/LowerAnalytic/CapRow14/Assembly.lean','-- newly unregistered assembly\n');original(reads)
        with patch.object(stamp._ActiveReads,'unchanged',late): self.reject()
        (self.root/'Grothe/LowerAnalytic/CapRow14/Assembly.lean').unlink()
        value=self.f.publish()
        def registry_change(reads):
            original(reads)
            self.f.json(stamp.BUILD_REGISTRY,value|{'scope':'changed during read'})
        with patch.object(stamp._ActiveReads,'unchanged',registry_change):
            self.reject(lambda:stamp.read_active_registry(self.root))

    def test_duplicate_json_keys_are_rejected(self):
        self.f.write(BASE+'row12-selection.json','{"12:3": {}, "12:3": {}}');self.reject()

    def test_stamp_v2_digest_projection_and_no_raw_provenance_hash(self):
        self.f.publish()
        with patch.object(stamp,'ROOT',str(self.root)):
            before=stamp.digest();files=stamp.source_files()
            self.assertNotIn(BASE+'row12-anchors.json',files)
            self.assertNotIn(PROOF,files)
            self.edit('anchors',lambda a:a.update(status='new metadata'))
            # Full pins must be intentionally republished, while cache math stays unchanged.
            self.f.publish();self.assertEqual(before,stamp.digest())
            p=self.root/(CPP+'R12x3_0.lean');p.write_text(p.read_text()+'\n-- computation source changed\n')
            self.f.publish();self.assertNotEqual(before,stamp.digest())

    def test_current_v1_digest_and_cli_projection_are_unchanged(self):
        # Isolated historical projection, so this regression remains valid after
        # the real checkout eventually migrates to a different source registry.
        with tempfile.TemporaryDirectory() as directory:
            f=Fixture(Path(directory).resolve(),rows=(12,));view=f.view()
            value={'format':'caps-bounded-build-v1','row':12,'compute_roots':view['compute_roots'],
                   'direct_hash_roots':view['direct_hash_roots'],'compute_count':len(view['compute_roots']),
                   'row12_compute_count':len(view['compute_roots'])-15,'source_sha256':view['source_sha256']}
            f.json(stamp.BUILD_REGISTRY,value)
            normalized=stamp.read_active_registry(f.root,value)
            self.assertEqual(normalized['compute_roots'],value['compute_roots']);self.assertIsNone(normalized['cache_projection'])
            with patch.object(stamp,'ROOT',str(f.root)):
                modules=[n[:-5].replace('/','.') for n in value['compute_roots']]
                files=[n.replace('.','/')+'.lean' for n in stamp.closure(stamp.TOPS+modules)]
                extra=stamp.EXTRA+value['direct_hash_roots']+[stamp.BUILD_REGISTRY]
                expected_files=files+list(dict.fromkeys(n for n in extra if n not in files))
                h=hashlib.sha256()
                for name in expected_files: h.update(name.encode()+b'\0');h.update((f.root/name).read_bytes())
                self.assertEqual(stamp.source_files(),expected_files)
                self.assertEqual(stamp.digest(),(h.hexdigest(),len(expected_files)))


class CoverageSliceTests(unittest.TestCase):
    """Coverage partitions are data-bound native leaves, with a pure assembly."""
    def fixture(self, root, *, sliced=True):
        f = Fixture(root, rows=(12,))
        f.json(BASE+'coverage-slicing.json', {'format':'caps-coverage-slicing/v1', 'rows':[12],
                   'threshold':1 if sliced else 128, 'pieces_per_slice':2})
        imports = ('Grothe.LowerAnalytic.FixturePure', 'Grothe.LowerAnalytic.CapPieces.D12x3')
        prefix = ''.join('import '+n+'\n' for n in imports)
        if sliced:
            for i in range(3):
                f.native(CPP+f'C12x3_{i}.lean', {f'pieceCoverSlice_12x3_{i}':f'pieceCoverSliceOK pieceNode_12x3 {i} 3 = true'}, imports)
            prefix += ''.join(f'import Grothe.LowerAnalytic.CapPieces.C12x3_{i}\n' for i in range(3))
            body = ''
        else:
            body = 'theorem pieceCoverFast_12x3 : pieceCoverFastOK pieceNode_12x3 = true := by native_decide\n'
        f.write(CPP+'C12x3.lean', prefix+'namespace Grothe.LowerAnalytic\n'+body+
                'theorem pieceCover_12x3 : pieceCoverOK pieceNode_12x3 = true := by exact fixture\nend Grothe.LowerAnalytic\n')
        return f

    def test_exact_slices_and_original_coverage_bridge_registered(self):
        with tempfile.TemporaryDirectory() as d:
            f=self.fixture(Path(d).resolve());v=f.view()
            self.assertNotIn(CPP+'C12x3.lean',v['compute_roots'])
            self.assertIn(CPP+'C12x3.lean',v['direct_hash_roots'])
            for i in range(3):self.assertEqual(v['native_declarations_by_root'][CPP+f'C12x3_{i}.lean'],[f'Grothe.LowerAnalytic.pieceCoverSlice_12x3_{i}'])
            self.assertIn('Grothe.LowerAnalytic.pieceCover_12x3',v['required_declarations'])
            self.assertIn(BASE+'coverage-slicing.json',v['computation_input_sha256'])

    def test_small_filtered_fact_and_original_bridge_required(self):
        with tempfile.TemporaryDirectory() as d:
            f=self.fixture(Path(d).resolve(),sliced=False);v=f.view()
            self.assertEqual(v['native_declarations_by_root'][CPP+'C12x3.lean'],['Grothe.LowerAnalytic.pieceCoverFast_12x3'])
            self.assertIn('Grothe.LowerAnalytic.pieceCover_12x3',v['required_declarations'])

    def test_omitted_slice_wrong_total_and_omitted_import_reject(self):
        for mutation in ('missing','total','import','bridge'):
            with self.subTest(mutation=mutation), tempfile.TemporaryDirectory() as d:
                f=self.fixture(Path(d).resolve());p=Path(d)/(CPP+'C12x3_1.lean')
                if mutation=='missing':p.unlink()
                elif mutation=='total':p.write_text(p.read_text().replace(' 1 3 = true',' 1 2 = true'))
                else:
                    p=Path(d)/(CPP+'C12x3.lean')
                    if mutation=='import':p.write_text(p.read_text().replace('import Grothe.LowerAnalytic.CapPieces.C12x3_1\n',''))
                    else:p.write_text(p.read_text().replace('pieceCoverOK pieceNode_12x3 = true','True'))
                with self.assertRaises(stamp.ClosureError):f.view()

    def test_noninteger_zero_duplicate_or_foreign_policy_rejects(self):
        for key,value in (('threshold',True),('threshold',0),('pieces_per_slice',0.5),('rows',[12,12]),('rows',[11])):
            with self.subTest(key=key,value=value), tempfile.TemporaryDirectory() as d:
                f=self.fixture(Path(d).resolve());policy=f.value(BASE+'coverage-slicing.json');policy[key]=value;f.json(BASE+'coverage-slicing.json',policy)
                with self.assertRaises(stamp.ClosureError):f.view()


if __name__ == '__main__': unittest.main()
