#!/usr/bin/env python3
"""Render a sealed, complete Row14 proposal while preserving node14x150.

Agent-ID: codex-15b7. This source-only API returns bytes and an inventory; it
does not publish files, run Lean, search for certificates or establish numerical
acceptance. The caller must first finish the independent exact-input planner.
"""
import contextlib
import hashlib
import importlib.util
import io
from pathlib import Path
import sys
import tempfile
import warnings

sys.dont_write_bytecode = True
from nodecaps_prepared_renderers import anchors13, assembly13, encoded

BASE = 'data/caps-m/plan/row-certificates/'
CPP = 'Grothe/LowerAnalytic/CapPieces/'
RETAINED = CPP + 'Node14x150.lean'
POLICY = BASE + 'coverage-slicing.json'
TOOLS = ('tools/gen_cap_pieces.py', 'tools/nodecaps_prepared_renderers.py',
         'tools/nodecaps_row14_render.py', 'tools/gen_cap_prepared_rows.py', 'scripts/caps_stamp.py')
INPUTS = {BASE + 'row14' + suffix + '.json' for suffix in
          ('', '-pieces', '-selection', '-anchors', '-generation')} | {
              POLICY, 'data/cap-nodes/rows.txt', 'data/lower-rows/row15.json',
              'Grothe/LowerAnalytic/CapChordData.lean', 'Grothe/Lower/RowDataTypes.lean'}
RETAINED_INPUTS = {'data/caps-m-pieces/' + name + '.json' for name in ('pieces', 'sel', 'repairs')}


def require(ok, message):
    if not ok:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


STAMP = load_module('row14_source_stamp', Path(__file__).resolve().parents[1] / 'scripts/caps_stamp.py')


def assembly(indices, ranges):
    """Retain the reviewed assembly structure and replace only node150's case."""
    require(indices == sorted(set(indices)) and len(indices) == 90 and 150 in indices,
            'Row14 needs all90 localized nodes, including150')
    text = assembly13(14, indices, ranges).decode()
    old_import = 'import Grothe.LowerAnalytic.CapPieces.N14x150\n'
    old_case = '  · simpa only [NodeCap] using (nodeCap_14x150 (by simp))'
    require(text.count(old_import) == text.count(old_case) == 1, 'assembly template changed')
    return text.replace(old_import, 'import Grothe.LowerAnalytic.CapPieces.Node14x150\n').replace(
        old_case, '  · simpa only [NodeCap] using nodeCap_14x150_done').encode()


def declaration(stamp):
    row = {'row': 14, **{key: BASE + 'row14-' + suffix + '.json' for key, suffix in
           (('generation_config', 'generation'), ('pieces', 'pieces'),
            ('selection', 'selection'), ('anchors', 'anchors'))},
           'assembly': 'Grothe/LowerAnalytic/CapRow14/Assembly.lean',
           'vertex_theorem': 'Grothe.LowerAnalytic.vertexCapsRow14',
           'retained_nodes': [{'node': 150, 'proof': 'node14x150'}]}
    return {'format': stamp.ACTIVE_FORMAT, 'legacy_rows_input': 'data/cap-nodes/rows.txt',
            'legacy_rows': list(stamp.CAP_ROWS), 'active_rows': [row],
            'retained_proofs': [{'id': 'node14x150', 'row': 14, 'node': 150, 'root': RETAINED,
                'theorem': 'Grothe.LowerAnalytic.nodeCap_14x150_done',
                'repair_input': 'data/caps-m-pieces/repairs.json'}]}


def check_pins(reads, pins, required):
    require(isinstance(pins, dict) and set(pins) >= required, 'missing source/input pins')
    for name, digest in pins.items():
        require(type(digest) is str and len(digest) == 64 and
                sha(reads.read(name)) == digest, 'source binding differs: ' + str(name))


def validate_plan(plan, anchor, nodes, selection, reads):
    require(type(plan.get('row')) is int and plan['row'] == 14 and
            plan.get('row_complete_research_gate') is True and
            plan.get('capPad') == '1/100000000000' and plan.get('cap_up') == '0' and
            type(plan.get('full_snapshot_centres')) is int and plan['full_snapshot_centres'] == 358,
            'incomplete exact Row14 input gate')
    require(anchor.get('row_complete_research_gate') is True and
            anchor.get('native_verified') is False and plan.get('global_capsRest_discharged') is False,
            'proposal cannot attest native/global verification')
    indices = [n['i'] for n in nodes]
    require(len(indices) == 90 and indices == sorted(set(indices)) and 150 in indices,
            'Row14 needs all90 localized nodes, including150')
    centres = plan.get('centres')
    require(isinstance(centres, list) and len(centres) == 90 and
            all(isinstance(c, dict) for c in centres) and
            {c.get('key') for c in centres} == {f'14:{i}:0' for i in indices},
            'missing or duplicate exact centre input')
    for centre in centres:
        require(centre.get('exact_matrix_replayed') is True and
                centre.get('native_verified') is False and
                centre.get('unchanged_bounds_and_recipe') is True and
                type(centre.get('original_piece_index')) is int and centre['original_piece_index'] == 0 and
                type(centre.get('output_piece_index')) is int and centre['output_piece_index'] == 0,
                'unreplayed centre or unsupported selected interval conversion')
        require(centre.get('best_kind') in {'stored_grid', 'fine_grid', 'historical_adopted'},
                'unsupported selected interval result')
        i = int(centre['key'].split(':')[1]); node = next(n for n in nodes if n['i'] == i)
        require(type(centre.get('piece_count')) is int and centre['piece_count'] == len(node['pieces']) and
                type(centre.get('certificate_grid_index')) is int and
                centre['certificate_grid_index'] == selection[f'14:{i}']['grids'][0],
                'selected centre inventory/grid differs')
        require(centre.get('certificate_grid_spec') == STAMP.ACTIVE_GRIDS[centre['certificate_grid_index']],
                'selected centre grid tuple differs')
    for key in ('pieces', 'selection'):
        output = plan.get('outputs', {}).get(key, {})
        name = f'row14-{key}.json'
        require(output.get('file') == name and output.get('sha256') == sha(reads.read(BASE + name)),
                'adopted input differs: ' + key)
    # This template has two anchor grids. A larger catalogue requires a new
    # template, never silently dropping a selected grid during reproduction.
    require(anchor.get('grids') == [[400, 128, '1/50'], [1600, 256, '1/200']],
            'unsupported anchor grid template')


def validate_unchanged_pieces(nodes, selection, reads):
    original = reads.value('data/caps-m-pieces/pieces.json')
    require(isinstance(original, list), 'original piece catalogue missing')
    original = [n for n in original if n.get('k') == 14]
    require([n['i'] for n in nodes] == [n['i'] for n in original],
            'localized inventory differs from original complete row')
    for node, before in zip(nodes, original):
        require(encoded({k: v for k, v in node.items() if k != 'pieces'}) ==
                encoded({k: v for k, v in before.items() if k != 'pieces'}),
                'node location/cap/directions changed')
        pieces, prior = node['pieces'], before['pieces']
        require(len(pieces) == len(prior) and encoded(pieces[1:]) == encoded(prior[1:]),
                'noncentre pieces changed')
        require(encoded({k: v for k, v in pieces[0].items() if k != 'cons'}) ==
                encoded({k: v for k, v in prior[0].items() if k != 'cons'}),
                'centre recipe or metadata changed')
        require([c.split(',')[:4] for c in pieces[0]['cons']] ==
                [c.split(',')[:4] for c in prior[0]['cons']],
                'centre constraint regions/order changed')
        grids = selection[f'14:{node["i"]}']['grids']
        for piece, grid in zip(prior[1:], grids[1:]):
            require(piece['nq'] in (128, 256, 1024) and grid == {128: 0, 256: 1, 1024: 2}[piece['nq']],
                    'noncentre grid changed')


def render(root, binding):
    """Return (generated bytes, source-only inventory), without changing root."""
    root = Path(root).absolute()
    project = Path(__file__).resolve().parents[1]
    stamp = STAMP
    reads = stamp._ActiveReads(root)
    require(isinstance(binding, dict) and binding.get('format') == 'nodecaps-row14-source-binding/v1',
            'unsupported Row14 source binding')
    check_pins(reads, binding.get('tools_sha256'), set(TOOLS))
    require(set(binding['tools_sha256']) == set(TOOLS), 'unexpected renderer tool')
    for name in TOOLS:
        require(sha((project / name).read_bytes()) == binding['tools_sha256'][name],
                'running renderer differs: ' + name)
    check_pins(reads, binding.get('inputs_sha256'), INPUTS)
    plan, anchor, nodes, selection = [reads.value(BASE + 'row14' + suffix + '.json')
                                    for suffix in ('', '-anchors', '-pieces', '-selection')]
    # Canonical chord, range, recipe, constraint, multiplier, partition, grid,
    # padding and retained-node checks are shared with the actual build reader.
    view = stamp.derive_active_registry(root, declaration(stamp), require_materialized=False)
    validate_plan(plan, anchor, nodes, selection, reads)
    validate_unchanged_pieces(nodes, selection, reads)
    check_pins(reads, anchor.get('source_sha256'), set())
    require(set(anchor['source_sha256']) <= set(binding['inputs_sha256']), 'unbound anchor source')
    closure = set(stamp._active_graph(reads, [RETAINED[:-5].replace('/', '.')]))
    require(set(binding.get('retained_sha256', {})) == closure | RETAINED_INPUTS,
            'retained proof closure/input inventory differs')
    check_pins(reads, binding['retained_sha256'], closure | RETAINED_INPUTS)
    require('theorem nodeCap_14x150_done : NodeCap 14 150' in
            stamp._active_code(reads.read(RETAINED).decode()), 'retained completed theorem missing')
    outputs = anchors13(anchor)
    outputs['Grothe/LowerAnalytic/CapRow14/Assembly.lean'] = assembly(
        [n['i'] for n in nodes], [(p['lo'], p['hi']) for p in anchor['ranges']])
    writer = load_module('row14_canonical_piece_writer', project / TOOLS[0])
    with tempfile.TemporaryDirectory(prefix='nodecaps14-source-') as directory:
        target = Path(directory); writer.ROOT = target
        policy = target / POLICY; policy.parent.mkdir(parents=True)
        policy.write_bytes(reads.read(POLICY))
        pieces = target / 'pieces.json'; pieces.write_bytes(reads.read(BASE + 'row14-pieces.json'))
        selected = target / 'selection.json'
        selected.write_bytes(encoded({key: value for key, value in selection.items() if key != '14:150'}))
        with warnings.catch_warnings(), contextlib.redirect_stdout(io.StringIO()):
            warnings.simplefilter('ignore', ResourceWarning)
            writer.write_nodes(str(pieces), str(selected))
        outputs.update({p.relative_to(target).as_posix(): p.read_bytes() for p in target.rglob('*.lean')})
    lean = {n for n in outputs if n.endswith('.lean')}
    require(lean == set(view['row_source_paths']), 'missing or unexpected generated module/slice')
    require(not set(outputs).intersection(closure), 'renderer would replace retained proof source')
    native = {n: facts for n, facts in view['native_declarations_by_root'].items() if n in lean}
    for name in lean:
        require(stamp._active_native_names(outputs[name]) == native.get(name, []),
                'generated native inventory differs: ' + name)
    reads.unchanged()
    inventory = {'format': 'nodecaps-row14-rendered-source/v1', 'agent_id': 'codex-15b7',
                 'files_sha256': {n: sha(v) for n, v in sorted(outputs.items())},
                 'retained_sha256': binding['retained_sha256'],
                 'native_declarations_by_root': native, 'native_verified': False,
                 'cache_uploaded': False, 'global_capsRest_discharged': False}
    return outputs, inventory


def render_sealed(root):
    """Reproduce a published source seal; never treat it as a native result."""
    reads = STAMP._ActiveReads(Path(root).absolute())
    binding = reads.value(BASE + 'row14-binding.json')
    seal_bytes = reads.read(BASE + 'row14-source.json')
    require(sha(seal_bytes) == binding.get('source_manifest_sha256'), 'Row14 source seal changed')
    seal = reads.value(BASE + 'row14-source.json')
    outputs, inventory = render(root, binding)
    require(seal == inventory, 'Row14 emitted/retained source inventory differs')
    reads.unchanged()
    return outputs
