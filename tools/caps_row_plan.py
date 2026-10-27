#!/usr/bin/env python3
"""Prepare one complete row's certificate proposals from an accepted research snapshot.

Agent-ID: codex-718a, for codex-15b7. This does not prove a Lean cap, activate a
module, optimize multipliers, or change mathematical inputs. Saved matrices are
replayed exactly; later canonical CI must recompute all piece/coverage checks.
The original frozen research provenance is preserved, never rewritten to match
the public lakefile. Other rows may remain incomplete in the snapshot.
"""
from __future__ import annotations

import argparse
from collections import Counter
import copy
from fractions import Fraction as F
import hashlib
import json
import os
from pathlib import Path
import re
import sys
import tempfile

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
import caps_centre_repair as repair
import caps_centre_sweep as sweep

ROOT = Path(__file__).resolve().parents[1]
PIECES = 'data/caps-m-pieces/pieces.json'
DEFAULT_CHECKPOINT = ('data/caps-m/plan/checkpoints/'
    'centre-codex-15b7-paired-continue1-20261027T045246346384Z-n153-b8d423a6f528f31b.json')
DEFAULT_OUT = 'data/caps-m/plan/row-certificates'
BASELINE_PAD = F(1, 10**11)
GRIDS = [[400, 128, '1/50'], [1600, 256, '1/200'], [1600, 1024, '1/200'],
         [1600, 1152, '1/200'], [3200, 256, '1/400']]
NQ_GRID = {128: 0, 256: 1, 1024: 2}
OWNER = 'tools/caps_row_plan.py'
SCOPE = ('Certificate proposals only: exact saved-matrix replay does not replace canonical Lean '
         'enclosure, coverage, range, polynomial, anchor or native verification. No cap, capPad, '
         'refined-cover or endpoint change; non-centre pieces retain their original stored proposals.')


class PlanError(ValueError):
    pass


def require(ok, message):
    if not ok:
        raise PlanError(message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':')).encode()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True)+'\n').encode()


def rational(value):
    require(type(value) in (str, int, F), 'Expected an exact rational, not a float/Boolean')
    try:
        return F(value)
    except (ValueError, ZeroDivisionError) as exc:
        raise PlanError('Malformed exact rational') from exc


def key(row):
    require(all(type(row.get(k)) is int and row[k] >= 0 for k in ('k', 'i', 'j')),
            'Invalid exact centre identity')
    return ':'.join(str(row[k]) for k in ('k', 'i', 'j'))


def local(root, name):
    require(isinstance(name, str) and name and not Path(name).is_absolute() and
            '..' not in Path(name).parts and Path(name).as_posix() == name,
            'Expected a safe relative input path')
    path = (root/name).resolve(strict=True)
    require(path.is_relative_to(root) and path.is_file(), 'Input escapes repository or is not a file')
    return path


class Reader:
    """Immutable bytes and their explicit lineage, never directory discovery."""
    def __init__(self, root):
        self.root = Path(root).resolve(strict=True)
        self.bytes = {}
        self.files = {}
        self.paths = {}

    def path(self, name, expected):
        try:
            return local(self.root, name)
        except FileNotFoundError:
            # Preserve the historical logical module name in the lineage, while
            # shipping exporter bytes as inert data outside Lean's source roots.
            require(name.startswith('Grothe/LowerAnalytic/CapPlanRuns/') and
                    name.endswith('.lean') and isinstance(expected, str) and
                    re.fullmatch('[0-9a-f]{64}', expected),
                    'Missing evidence has no permitted source archive: '+name)
            return local(self.root, 'data/caps-m/plan/row-certificates/research-source-archive/'+name+'.txt')

    def read(self, name, expected=None):
        path = self.path(name, expected)
        payload = path.read_bytes()
        actual = digest(payload)
        if expected is not None:
            require(isinstance(expected, str) and re.fullmatch('[0-9a-f]{64}', expected),
                    'Malformed evidence SHA256')
            require(actual == expected, 'Evidence hash changed: '+name)
        require(name not in self.bytes or self.bytes[name] == payload, 'Input changed during conversion: '+name)
        self.bytes[name] = payload
        self.files[name] = actual
        require(name not in self.paths or self.paths[name] == path,
                'Input resolution changed during conversion: '+name)
        self.paths[name] = path
        return payload

    def json(self, name, expected=None):
        try:
            return json.loads(self.read(name, expected))
        except json.JSONDecodeError as exc:
            raise PlanError('Malformed JSON input: '+name) from exc

    def ref(self, ref):
        require(isinstance(ref, dict) and set(('path', 'sha256')) <= set(ref), 'Missing hashed evidence reference')
        return self.json(ref['path'], ref['sha256'])

    def unchanged(self):
        for name, payload in self.bytes.items():
            path = self.path(name, self.files[name])
            require(path == self.paths[name], 'Input resolution changed before output publication: '+name)
            require(path.read_bytes() == payload, 'Input changed before output publication: '+name)


def constraint_fields(value):
    require(isinstance(value, str), 'Constraint must be an encoded string')
    fields = value.split(',')
    require(len(fields) == 6 and fields[0] in ('0', '1', '2') and fields[1] in ('+', '-'),
            'Malformed ordered constraint encoding')
    lo = rational(fields[2]); hi = None if fields[3] == '*' else rational(fields[3])
    require(hi is None or lo <= hi, 'Reversed constraint bounds')
    lam, mu = rational(fields[4]), rational(fields[5])
    require(lam >= 0 and mu >= 0 and (hi is not None or lam == 0), 'Invalid stored constraint multiplier')
    return fields


def recipe_check(value):
    require(isinstance(value, str), 'Recipe must be an exact encoded string')
    parts = value.split('|')
    require(len(parts) >= 2 and all(len(part.split(',')) == 12 for part in parts[:-1]),
            'Recipe price/factor vectors must have dimension12')
    for part in parts[:-1]:
        for item in part.split(','):
            rational(item)
    rational(parts[-1])


def grid_index(spec):
    require(isinstance(spec, list) and len(spec) == 3 and
            all(type(n) is int and n > 0 for n in spec[:2]), 'Invalid explicit grid tuple')
    normalized = [spec[0], spec[1], str(rational(spec[2]))]
    require(normalized in GRIDS, 'Unsupported exact certificate grid tuple')
    return GRIDS.index(normalized)


def select_row(rows, ident, grid):
    require(isinstance(rows, list), 'Solved evidence must be a list, not a Boolean verdict')
    selected = [r for r in rows if isinstance(r, dict) and key(r) == ident and r.get('grid') == grid]
    require(len(selected) == 1, 'Selected evidence identity/grid is missing or duplicated: '+ident)
    return selected[0]


def refs_by_path(record):
    result = {}
    def visit(value):
        if isinstance(value, dict):
            if 'path' in value or 'sha256' in value:
                require('path' in value and 'sha256' in value, 'Partial evidence reference')
                require(value['path'] not in result or result[value['path']] == value['sha256'],
                        'Conflicting evidence SHA256')
                result[value['path']] = value['sha256']
            for child in value.values():
                visit(child)
        elif isinstance(value, list):
            for child in value:
                visit(child)
    visit(record)
    return result


def export_row(reader, ref, ident, grid):
    payload = reader.read(ref['path'], ref['sha256'])
    try:
        rows = [json.loads(line) for line in payload.splitlines() if line.strip()]
    except json.JSONDecodeError as exc:
        raise PlanError('Malformed/partial selected JSONL') from exc
    row = select_row(rows, ident, grid)
    # Copy before exact Fraction decoding; original bytes and their hash stay intact.
    out = copy.deepcopy(row)
    out['N'] = [[rational(x) for x in line] for line in out['N']]
    for cons in out['cons']:
        for label in ('A', 'B'):
            cons[label] = [[rational(x) for x in line] for line in cons[label]]
        for label in ('lo', 'lam', 'mu'):
            cons[label] = rational(cons[label])
        cons['hi'] = None if cons['hi'] is None else rational(cons['hi'])
    repair.validate_export(out)
    return out


def bind_export(exported, node, piece, ident, expected_grid, pad):
    require(key(exported) == ident and exported['grid'] == expected_grid, 'Export identity/grid mismatch')
    require(rational(exported['capPad']) == pad == BASELINE_PAD, 'Export changed capPad')
    require(rational(exported['s']) == rational(node['s']) and
            rational(exported['cap']) == rational(node['cap']), 'Export changed node location/cap')
    require(len(exported['cons']) == len(piece['cons']), 'Export constraint count mismatch')
    for cons, source in zip(exported['cons'], piece['cons']):
        f = constraint_fields(source)
        require(cons['lo'] == rational(f[2]) and
                cons['hi'] == (None if f[3] == '*' else rational(f[3])) and
                cons['lam'] == rational(f[4]) and cons['mu'] == rational(f[5]),
                'Export changed an ordered constraint/bound/stored multiplier')


def exact_saved(exported, result):
    require(result.get('status') in sweep.SUCCESS and rational(result['cap_up']) == 0,
            'Selected result is failed, unknown or has a positive cap increase')
    checked = []
    def checker(d, candidate):
        checked.append(repair.checked_solution(d, candidate))
        return checked[-1]
    sweep.validate_solution(exported, result, checker)
    require(checked and checked[0] is not None and checked[0]['exact_ldl_ok'] is True,
            'Selected saved multipliers lack exact feasible LDL replay')
    return checked[0]


def adopted_constraints(piece, result):
    require(isinstance(result.get('lm'), list) and len(result['lm']) == len(piece['cons']),
            'Selected multiplier count differs from ordered constraints')
    encoded_cons = []
    for source, lm in zip(piece['cons'], result['lm']):
        require(isinstance(lm, (list, tuple)) and len(lm) == 2, 'Malformed multiplier pair')
        fields = constraint_fields(source)
        lam, mu = rational(lm[0]), rational(lm[1])
        require(lam >= 0 and mu >= 0 and (fields[3] != '*' or lam == 0),
                'Negative multiplier or nonzero halfspace lambda')
        encoded_cons.append(','.join(fields[:4]+[str(lam), str(mu)]))
    return encoded_cons


def validate_sidecar(reader, entry, provenance, ident, grid):
    source = reader.read(entry['module_file'], entry['module_source_sha256'])
    require(source, 'Empty research exporter source')
    expected = {'fingerprint': provenance['fingerprint'], 'key': ident, 'grid': grid,
                **{k: entry[k] for k in ('node_sha256', 'piece_sha256', 'module_source_sha256')}}
    require(reader.json(entry['export_provenance']) == expected, 'Export sidecar/source binding changed')


def choose(reader, manifest, entry, record, node, piece, frozen_helpers):
    ident = key(entry)
    require(record.get('status') == 'complete' and record.get('residual_accepted') is True and
            rational(record['best_residual']) == 0, 'Entire selected row must be complete at zero increase')
    kind = record.get('best_kind')
    require(kind in ('stored_grid', 'fine_grid', 'historical_adopted'),
            'Unsupported selected kind (interval partitions require a complete leaf converter)')
    evidence = refs_by_path(record)
    common = {'key': ident, 'best_kind': kind, 'origin': record.get('origin'),
              'research_record_sha256': digest(canonical(record)),
              'node_sha256': entry['node_sha256'], 'piece_sha256': entry['piece_sha256'],
              'native_verified': False, 'scope': 'Bound research proposal; canonical native recomputation pending'}
    if kind == 'fine_grid':
        candidates = [r for r in record.get('evidence', [])
                      if r.get('kind') == 'independently_pinned_fine_manifest']
        require(len(candidates) == 1, 'Fine selection needs one independently pinned manifest')
        ref = candidates[0]; fm = reader.ref(ref); fe, prov = fm['entry'], fm['provenance']
        require(key(fe) == ident and fe['grid'] == 3 and fe['stored_grid'] == entry['grid'] and
                all(fe[k] == entry[k] for k in ('node_sha256', 'piece_sha256', 'nq')),
                'Fine manifest changed source identity or stored grid')
        require(prov['grid'] == 3 and prov['grid_spec'] == fe['grid_spec'] == record['fine_grid_spec'] and
                rational(prov['baseline_capPad']) == BASELINE_PAD, 'Fine grid/padding binding changed')
        # Preserve frozen provenance; compare shared pins to the frozen manifest,
        # never replace them with the public checkout's different lakefile bytes.
        require(all(prov['files'].get(n) == h for n,h in manifest['provenance']['files'].items()),
                'Fine frozen scientific lineage differs from the stored manifest')
        require(all(prov['files'].get('tools/'+name) == frozen_helpers.get(name)
                    for name in ('caps_centre_fine.py','caps_centre_sweep.py','caps_centre_repair.py')),
                'Fine implementation lineage differs from the observed campaign helpers')
        require(digest(canonical({k:v for k,v in prov.items() if k != 'fingerprint'})) == prov['fingerprint'],
                'Fine provenance fingerprint changed')
        validate_sidecar(reader, fe, prov, ident, 3)
        require(fe['export'] in evidence, 'Fine export lacks completed-record hash')
        export_ref = {'path': fe['export'], 'sha256': evidence[fe['export']]}
        exported = export_row(reader, export_ref, ident, 3)
        require(exported.get('grid_spec') == fe['grid_spec'], 'Fine export tuple differs from manifest')
        cert_grid = grid_index(fe['grid_spec'])
        require(fe['grid_spec'][0] >= 1600 and fe['grid_spec'][1] >= entry['nq'] and
                fe['grid_spec'][0] * rational(fe['grid_spec'][2]) == 8,
                'Selected fine grid coarsens the stored grid or changes radial extent')
        solution_ref = ref.get('solution')
        require(solution_ref is not None, 'Fine adopted solution is not explicitly selected')
        result = select_row(reader.ref(solution_ref), ident, 3)
        require(result.get('grid_spec') == fe['grid_spec'], 'Chosen fine solution uses a different tuple')
        expected_prov = {'fingerprint': prov['fingerprint'], 'export_sha256': export_ref['sha256'],
                         'grid_spec': fe['grid_spec'], 'baseline_capPad': prov['baseline_capPad'],
                         'cap_up_convention': prov['cap_up_convention']}
        require(result.get('provenance') == expected_prov, 'Chosen fine result has stale provenance')
        common.update(fine_manifest={'path': ref['path'], 'sha256': ref['sha256']},
                      frozen_fine_provenance=prov, export=export_ref,
                      solution={'path': solution_ref['path'], 'sha256': solution_ref['sha256']},
                      historical_proposal=record.get('origin') == 'historical_adopted')
    else:
        solution_ref = record['raw_result']
        result = select_row(reader.ref(solution_ref), ident, entry['grid'])
        cert_grid = entry['grid']
        require(cert_grid in range(3), 'Stored grid must retain its legacy certificate index')
        common.update(solution=solution_ref, historical_proposal=kind == 'historical_adopted')
        if record.get('raw_export') is None:
            require(kind == 'historical_adopted' and record.get('raw_exact_replayed') is False,
                    'Nonhistorical accepted result lacks hashed matrices')
            old = entry.get('historical')
            require(old and old['file'] == solution_ref['path'] and
                    old['file_sha256'] == solution_ref['sha256'] and
                    old['result_sha256'] == digest(canonical(result)) and manifest.get('historical_review_note'),
                    'Historical proposal is not bound to its reviewed result')
            require(result.get('status') in sweep.SUCCESS and rational(result['cap_up']) == 0,
                    'Historical proposal has no accepted zero result')
            require(result.get('encl') is not False and result.get('polyOK') is not False,
                    'Historical proposal records failed numerical guards')
            common.update(exact_matrix_replayed=False,
                          scope='Historical research proposal only: no independently bound matrices; canonical native check required')
            return cert_grid, adopted_constraints(piece, result), common
        export_ref = record['raw_export']
        exported = export_row(reader, export_ref, ident, entry['grid'])
        common['export'] = export_ref
        if kind == 'historical_adopted':
            old = entry.get('historical')
            require(old and old['file'] == solution_ref['path'] and
                    old['file_sha256'] == solution_ref['sha256'] and
                    old['result_sha256'] == digest(canonical(result)) and manifest.get('historical_review_note'),
                    'Historical result/source review binding changed')
        else:
            require(export_ref['path'] == entry['export'] and solution_ref['path'] == entry['solved'],
                    'Stored selection does not use its manifest paths')
            validate_sidecar(reader, entry, manifest['provenance'], ident, entry['grid'])
            expected_prov = {'fingerprint': manifest['provenance']['fingerprint'],
                             'export_sha256': export_ref['sha256'],
                             'baseline_capPad': manifest['provenance']['baseline_capPad'],
                             'cap_up_convention': manifest['provenance']['cap_up_convention']}
            require(result.get('provenance') == expected_prov, 'Stored result has stale provenance')
    bind_export(exported, node, piece, ident, 3 if kind == 'fine_grid' else entry['grid'], BASELINE_PAD)
    certificate = exact_saved(exported, result)
    common.update(exact_matrix_replayed=True, selected_result_sha256=digest(canonical(result)),
                  exact_ldl_pivots=certificate['ldl_pivots'])
    return cert_grid, adopted_constraints(piece, result), common


def canonical_row(reader, row, manifest):
    """Bind zero-based rowData[row], its one-based source module, and exact nodes."""
    order_name = 'Grothe/Lower/RowData.lean'
    order = reader.read(order_name, manifest['provenance']['files'][order_name]).decode()
    found = re.search(r'def rowData : List Row :=\s*\[([^\]]+)\]', order)
    require(found is not None, 'Cannot bind canonical rowData order')
    rows = [x.strip() for x in found[1].split(',')]
    require(0 <= row < len(rows) and rows[row] == f'row{row+1:02d}', 'Unexpected zero-based row binding')
    module_name = f'Grothe/Lower/RowData{row+1:02d}.lean'
    source = reader.read(module_name, manifest['provenance']['files'][module_name]).decode()
    data_name = f'data/lower-rows/row{row+1:02d}.json'
    data = reader.json(data_name)
    require(f'def row{row+1:02d} : Row :=' in source and json.dumps(data['nodes']) in source,
            'Canonical row JSON nodes do not match the actual rowData module')
    nodes = []
    for cell in data['nodes'].split(';'):
        fields = cell.split(':')
        require(len(fields) == 2, 'Malformed canonical node cap')
        nodes.append(tuple(rational(x) for x in fields))
    return nodes, {'zero_based_index': row, 'rowData_declaration': rows[row],
                   'nominal_name': data['name'], 'source_json': data_name,
                   'source_lean': module_name, 'node_count': len(nodes)}


def build_plan(root, checkpoint_path=DEFAULT_CHECKPOINT, *, row=12, chunk=4):
    require(type(row) is int and row == 12, 'This first per-row converter currently supports row12 only')
    require(type(chunk) is int and chunk > 0, 'Chunk size must be positive')
    reader = Reader(root); checkpoint = reader.json(checkpoint_path)
    require(checkpoint.get('format') == 'caps-centre-backup/v1' and
            checkpoint.get('agent_id') == 'codex-15b7', 'Unexpected immutable checkpoint identity')
    state = checkpoint['progress_snapshot']; fp = state['fingerprint']
    require(state.get('agent_id') == 'codex-15b7' and rational(state['capPad_unchanged']) == BASELINE_PAD,
            'Checkpoint changed owner or padding')
    manifest = reader.json(checkpoint['manifest'], fp['manifest_sha256'])
    require(rational(manifest['provenance']['baseline_capPad']) == BASELINE_PAD and
            digest(canonical(manifest['provenance']['files'])) == manifest['provenance']['fingerprint'],
            'Frozen manifest fingerprint/padding changed')
    for name,module in (('caps_centre_repair.py',repair),('caps_centre_sweep.py',sweep),('caps_lmi.py',repair.caps_lmi)):
        require(digest(Path(module.__file__).read_bytes()) == fp['helpers_sha256'].get(name),
                'Exact replay implementation differs from frozen checkpoint helper: '+name)
    require(digest(Path(repair.__file__).with_name('caps_centre_fine.py').read_bytes()) ==
            fp['helpers_sha256'].get('caps_centre_fine.py'), 'Fine helper differs from frozen checkpoint')
    nodes = reader.json(PIECES, manifest['provenance']['files'][PIECES])
    all_source = sweep.centres(nodes)
    expected = {key(e):e for e in all_source if e['k'] == row}
    require(len(expected) == 88, 'Row12 must contain exactly88 localized centres')
    entries = {}
    for entry in manifest['entries']:
        ident = key(entry)
        require(ident not in entries, 'Duplicate manifest centre identity')
        entries[ident] = entry
    require(set(entries) == {key(e) for e in all_source} == set(state['centres']),
            'Snapshot/manifest must retain the complete source centre inventory')
    pad_source = 'Grothe/Lower/RowDataTypes.lean'
    reader.read(pad_source, manifest['provenance']['files'][pad_source])
    require(F(sweep.baseline_cap_pad(reader.root)) == BASELINE_PAD, 'Canonical capPad changed')
    observed = {k:v for k,v in state['centres'].items() if k.startswith(str(row)+':')}
    require(set(observed) == set(expected) == {k for k,e in entries.items() if e['k'] == row},
            'Row12 checkpoint/manifest/source inventory is missing or has extra centres')
    canonical_nodes, row_binding = canonical_row(reader, row, manifest)
    source_nodes = {(n['k'],n['i']):n for n in nodes if n['k'] == row}
    require(len(source_nodes) == 88, 'Duplicate or missing localized nodes')
    output_nodes, selection, adoption = [], {}, []
    total_native_ranges = 0
    for ident in sorted(expected, key=lambda k:tuple(map(int,k.split(':')))):
        orig, entry, record = expected[ident], entries[ident], observed[ident]
        require(all(entry.get(k) == v for k,v in orig.items()), 'Manifest source/centre hash mismatch: '+ident)
        n = source_nodes[(entry['k'],entry['i'])]
        require(0 <= n['i'] < len(canonical_nodes) and
                canonical_nodes[n['i']] == (rational(n['s']),rational(n['cap'])),
                'Localized cap/location differs from canonical rowData[row]')
        require(len(n['ds']) == 3 and all(len(d.split(',')) == 12 for d in n['ds']), 'Directions must be three12-vectors')
        for d in n['ds']:
            for q in d.split(','): rational(q)
        copy_node = copy.deepcopy(n); grids = []
        for p in copy_node['pieces']:
            require(type(p.get('nq')) is int and p['nq'] in NQ_GRID, 'Unsupported conservative stored grid')
            recipe_check(p['recipe'])
            for c in p['cons']:constraint_fields(c)
            grids.append(NQ_GRID[p['nq']])
        centre = entry['j']
        require(0 <= centre < len(copy_node['pieces']), 'Centre index outside full piece inventory')
        adopted_grid, constraints, proof = choose(reader, manifest, entry, record, n, n['pieces'][centre],
                                                  fp['helpers_sha256'])
        copy_node['pieces'][centre]['cons'] = constraints
        grids[centre] = adopted_grid
        proof.update(certificate_grid_index=adopted_grid, certificate_grid_spec=GRIDS[adopted_grid],
                     original_piece_index=centre, output_piece_index=centre,
                     piece_count=len(n['pieces']), unchanged_bounds_and_recipe=True)
        adoption.append(proof);output_nodes.append(copy_node)
        selection[f'{row}:{entry["i"]}'] = {'excl': [], 'chunk': chunk, 'grids': grids}
        total_native_ranges += (len(grids)+chunk-1)//chunk
    counts = Counter(a['best_kind'] for a in adoption)
    plan = {'format':'caps-row-certificate-plan/v1','generator':OWNER,'agent_id':'codex-718a',
            'scope':SCOPE,'row':row,'row_binding':row_binding,'capPad':str(BASELINE_PAD),
            'cap_up':'0','status':'prepared_proposals_not_native_verified',
            'row_complete_research_gate':True,'other_rows_required_for_this_preparation':False,
            'global_capsRest_discharged':False,'anchors_in_this_piece_plan':0,
            'research_checkpoint':{'path':checkpoint_path,'sha256':reader.files[checkpoint_path],
                'actual_source_head':checkpoint.get('actual_source_head'),
                'integrated_master':checkpoint.get('integrated_master'),
                'scope':checkpoint.get('scope'),'progress_observation':checkpoint['progress_observation']},
            'frozen_research_provenance':manifest['provenance'],
            'source_semantics':'Do not relabel frozen research as canonical. Later CI recomputes each proposed native certificate against current mathematical source.',
            'grid_catalogue':{'append_only_legacy_indices':3,
                'entries':[{'index':i,'tuple':g} for i,g in enumerate(GRIDS)],
                'research_label3_is_not_certificate_index':True},
            'summary':{'localized_nodes':len(output_nodes),'pieces':sum(len(n['pieces']) for n in output_nodes),
                'selected_centres':len(adoption),'best_kind_counts':dict(sorted(counts.items())),
                'historical_origins':sum(a['origin']=='historical_adopted' for a in adoption),
                'exact_saved_matrix_replays':sum(a['exact_matrix_replayed'] for a in adoption),
                'centres_without_bound_matrices':sum(not a['exact_matrix_replayed'] for a in adoption),
                'noncentre_pieces_unchanged':sum(len(n['pieces']) for n in output_nodes)-len(adoption),
                'planned_coverage_native_facts':len(output_nodes),'planned_range_native_facts':total_native_ranges,
                'planned_node_soundness_modules':len(output_nodes),'native_facts_verified':0},
            'centres':adoption,'lineage_files':dict(sorted(reader.files.items())),
            'outputs':{'pieces':{'file':f'row{row}-pieces.json','sha256':digest(encoded(output_nodes))},
                       'selection':{'file':f'row{row}-selection.json','sha256':digest(encoded(selection))}},
            'replay_helpers_sha256':{n:fp['helpers_sha256'][n] for n in
                ('caps_centre_repair.py','caps_centre_sweep.py','caps_centre_fine.py','caps_lmi.py')},
            'generator_sha256':digest(Path(__file__).read_bytes())}
    reader.unchanged()
    return plan, output_nodes, selection


def write_outputs(root, out_dir, row, values, *, check=False):
    root = Path(root).resolve(strict=True)
    relative = Path(out_dir)
    require(not relative.is_absolute() and '..' not in relative.parts and
            relative.as_posix().startswith('data/caps-m/plan/row-certificates'),
            'Outputs must be new owned row-certificate data, not source/active progress')
    target = (root/relative).resolve()
    require(target.is_relative_to(root/'data/caps-m/plan/row-certificates'), 'Output directory escapes owned data')
    names = (f'row{row}.json',f'row{row}-pieces.json',f'row{row}-selection.json')
    outputs = [(target/name,encoded(value)) for name,value in zip(names,values)]
    # Refuse any changed existing destination. Use a new out directory for a
    # different checkpoint/generator; never mutate an adopted input in place.
    for path,data in outputs:
        require(not path.exists() or path.read_bytes() == data, 'Existing prepared bytes differ; preserve them and choose a NEW out-dir: '+str(path))
        require(not check or path.exists(), 'Missing generated output: '+str(path))
    if check:return
    target.mkdir(parents=True,exist_ok=True)
    staged=[]
    try:
        for path,data in outputs:
            if path.exists():continue
            fd,tmp=tempfile.mkstemp(prefix='.'+path.name,dir=target)
            with os.fdopen(fd,'wb') as stream:stream.write(data);stream.flush();os.fsync(stream.fileno())
            staged.append((Path(tmp),path))
        # Data first, descriptive plan last; a partial failure never yields a
        # plan claiming that missing piece/selection bytes have been prepared.
        for temp,path in sorted(staged,key=lambda x:x[1].name==names[0]):
            os.link(temp,path)
    finally:
        for temp,_ in staged:
            if temp.exists():temp.unlink()


def main(argv=None):
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--checkpoint',default=DEFAULT_CHECKPOINT)
    p.add_argument('--row',type=int,default=12)
    p.add_argument('--row12',dest='row',action='store_const',const=12,
                   help='Prepare zero-based row12 (the default row)')
    p.add_argument('--out-dir',default=DEFAULT_OUT)
    p.add_argument('--chunk',type=int,default=4)
    p.add_argument('--check',action='store_true')
    args=p.parse_args(argv)
    try:
        values=build_plan(ROOT,args.checkpoint,row=args.row,chunk=args.chunk)
        write_outputs(ROOT,args.out_dir,args.row,values,check=args.check)
    except (ValueError,KeyError,TypeError,OSError) as exc:
        p.exit(1,'FAIL: '+str(exc)+'\n')
    print(json.dumps({'row':args.row,'mode':'check' if args.check else 'prepare',
                      **values[0]['summary'],'scope':SCOPE},sort_keys=True))


if __name__=='__main__':main()
