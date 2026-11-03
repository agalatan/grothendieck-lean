#!/usr/bin/env python3
"""Opt-in source reproduction for sealed noncentre multiplier repairs.

Agent-ID: codex-15b7. Historical sources are reproduced in a temporary source
view before the effective data is considered. Only explicitly bound D modules
may differ. No Lean process, numerical search or publication runs here.
"""
import contextlib
import importlib.util
import io
from pathlib import Path
import sys
import tempfile
import warnings

import nodecaps_noncentre_repair as repair

BASE = 'data/caps-m/plan/row-certificates/'
BINDING = BASE + 'noncentre-source-binding.json'
FORMAT = 'nodecaps-noncentre-repaired-source/v1'
CURRENT_TOOLS = {'tools/gen_cap_prepared_rows.py', 'tools/nodecaps_repaired_render.py',
                 'tools/nodecaps_noncentre_repair.py'}
BASE_TOOLS = {'tools/gen_cap_prepared_rows.py', 'tools/nodecaps_row14_render.py',
              'tools/nodecaps_prepared_renderers.py', 'tools/gen_cap_pieces.py', 'scripts/caps_stamp.py'}
ARCHIVABLE = {BASE + f'row{row}-pieces.json' for row in (12, 13, 14)} | {
    BASE + 'row14-binding.json', 'tools/gen_cap_prepared_rows.py'}
SHARED = {'Grothe/LowerAnalytic/CapPieceRange.lean', 'Grothe/LowerAnalytic/CapPieceNodes.lean',
          'Grothe/LowerAnalytic/CapRows.lean'}
require, sha, encoded, decode = repair.require, repair.sha, repair.encoded, repair.decode


class Reads:
    def __init__(self, root):
        self.root = Path(root).resolve(); self.files = {}

    def read(self, name):
        repair.path(name)
        target = self.root
        for component in name.split('/'):
            target = target / component
            require(not target.is_symlink(), 'refusing source symlink: ' + name)
        if name not in self.files:
            self.files[name] = target.read_bytes()
        return self.files[name]

    def bound(self, reference):
        name, digest = repair.ref(reference); data = self.read(name)
        require(sha(data) == digest, 'source binding differs: ' + name)
        return data

    def unchanged(self):
        for name, data in self.files.items():
            require((self.root / name).read_bytes() == data, 'source changed while rendering: ' + name)


def load_module(name, path):
    spec = importlib.util.spec_from_file_location(name, path)
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
    return module


@contextlib.contextmanager
def baseline_imports(root):
    """Load the archived helper bytes without leaking their import binding."""
    name = 'nodecaps_prepared_renderers'; previous = sys.modules.pop(name, None)
    previous_path = list(sys.path)
    sys.path.insert(0, str(root / 'tools'))
    try:
        yield
    finally:
        sys.path[:] = previous_path
        sys.modules.pop(name, None)
        if previous is not None:
            sys.modules[name] = previous


def baseline_outputs(root):
    """Use original renderers and original pins, with no relaxed seal checks."""
    root = Path(root).resolve()
    with baseline_imports(root):
        prepared = load_module('_sealed_noncentre_baseline_prepared', root / 'tools/gen_cap_prepared_rows.py')
        outputs = {}
        for row in (12, 13):
            outputs.update(prepared.render(root, row))
        row14 = load_module('_sealed_noncentre_baseline_row14', root / 'tools/nodecaps_row14_render.py')
        outputs.update(row14.render_sealed(root))
        return outputs


def check_baseline_snapshot(snapshot):
    """Check the snapshot includes each dependency required by historical pins."""
    required = BASE_TOOLS | {BASE + 'prepared-binding.json', BASE + 'row14-binding.json'}
    required |= {BASE + f'row{row}{suffix}.json' for row in (12, 13, 14)
                 for suffix in ('', '-source', '-pieces', '-selection', '-anchors', '-generation')}
    require(required <= set(snapshot), 'baseline snapshot omits required sources/inputs')
    prepared = decode(snapshot[BASE + 'prepared-binding.json'])
    require(prepared['writer_path'] == 'tools/gen_cap_pieces.py' and
            sha(snapshot[prepared['writer_path']]) == prepared['writer_sha256'], 'baseline writer differs')
    if prepared.get('coverage_policy'):
        policy = prepared['coverage_policy']
        require(policy in snapshot and sha(snapshot[policy]) == prepared['coverage_policy_sha256'],
                'baseline coverage policy differs')
    for row in (12, 13):
        name = f'row{row}-source.json'
        require(sha(snapshot[BASE + name]) == prepared['source_manifests_sha256'][name],
                'baseline historical source seal differs')
        seal = decode(snapshot[BASE + name])
        for path, digest in seal['inputs_sha256'].items():
            if path in SHARED or path == prepared['writer_path']:
                continue
            require(path in snapshot and sha(snapshot[path]) == digest, 'baseline input differs: ' + path)
    binding14 = decode(snapshot[BASE + 'row14-binding.json'])
    require(sha(snapshot[BASE + 'row14-source.json']) == binding14['source_manifest_sha256'],
            'baseline Row14 source seal differs')
    for field in ('tools_sha256', 'inputs_sha256', 'retained_sha256'):
        for path, digest in binding14[field].items():
            require(path in snapshot and sha(snapshot[path]) == digest, 'baseline Row14 pin differs: ' + path)
    return binding14


def render_pieces(baseline_root, row, pieces):
    """Rerun the unchanged canonical writer on effective multiplier data."""
    writer = load_module('_noncentre_effective_piece_writer', baseline_root / 'tools/gen_cap_pieces.py')
    selection = decode((baseline_root / BASE / f'row{row}-selection.json').read_bytes())
    if row == 14:
        selection = {key: value for key, value in selection.items() if key != '14:150'}
    with tempfile.TemporaryDirectory(prefix='nodecaps-effective-pieces-') as directory:
        target = Path(directory); writer.ROOT = target
        policy = target / BASE / 'coverage-slicing.json'; policy.parent.mkdir(parents=True)
        policy.write_bytes((baseline_root / BASE / 'coverage-slicing.json').read_bytes())
        piece_path = target / 'pieces.json'; piece_path.write_bytes(pieces)
        selected = target / 'selection.json'; selected.write_bytes(encoded(selection))
        with warnings.catch_warnings(), contextlib.redirect_stdout(io.StringIO()):
            warnings.simplefilter('ignore', ResourceWarning)
            writer.write_nodes(str(piece_path), str(selected))
        return {p.relative_to(target).as_posix(): p.read_bytes() for p in target.rglob('*.lean')}


def repair_files(reads, binding):
    names = ('baseline_archive', 'historical_provenance', 'historical_seal', 'centre_plan', 'selection', 'patches')
    pins = dict(binding['source_sha256'])
    for name in names:
        path, digest = repair.ref(binding[name])
        require(path not in pins or pins[path] == digest, 'conflicting repair input pin')
        pins[path] = digest
    return {path: reads.bound({'path': path, 'sha256': digest}) for path, digest in pins.items()}


def render(root, binding):
    """Return all prepared source bytes and limited repair receipts; no writes to root."""
    require(type(binding) is dict and set(binding) == {'format', 'baseline_files', 'current_tools_sha256',
            'repair_bindings', 'effective_sources_sha256'} and binding['format'] == FORMAT,
            'unsupported repaired source binding')
    reads = Reads(root); project = Path(__file__).resolve().parents[1]
    require(type(binding['current_tools_sha256']) is dict and
            set(binding['current_tools_sha256']) == CURRENT_TOOLS, 'wrong current tool inventory')
    for name, digest in binding['current_tools_sha256'].items():
        reads.bound({'path': name, 'sha256': digest})
        require(sha((project / name).read_bytes()) == digest, 'running tool differs: ' + name)
    mapping = binding['baseline_files']
    require(type(mapping) is dict, 'missing baseline file mapping')
    snapshot = {}
    for name, reference in mapping.items():
        repair.path(name)
        actual, _ = repair.ref(reference)
        require(actual == name or name in ARCHIVABLE, 'unreviewed baseline path replacement: ' + name)
        snapshot[name] = reads.bound(reference)
    for name in ('tools/gen_cap_prepared_rows.py', BASE + 'row14-binding.json'):
        require(name in mapping and mapping[name]['path'] != name, 'historical tool/binding must be archived')
    binding14 = check_baseline_snapshot(snapshot)
    # The original binding remains historical metadata at its canonical path;
    # the current wrapper tools have their own independently named pins above.
    require(reads.read(BASE + 'row14-binding.json') == snapshot[BASE + 'row14-binding.json'],
            'historical Row14 binding was rewritten')
    repairs = binding['repair_bindings']
    require(type(repairs) is dict and repairs and set(repairs) <= {'12', '13', '14'}, 'invalid repaired row set')
    for row in (12, 13, 14):
        if str(row) not in repairs:
            name = BASE + f'row{row}-pieces.json'
            require(reads.read(name) == snapshot[name], 'unrepaired active pieces differ from baseline: ' + name)
    expected = binding['effective_sources_sha256']
    require(type(expected) is dict, 'missing effective D-source pins')
    with tempfile.TemporaryDirectory(prefix='nodecaps-sealed-baseline-') as directory:
        baseline_root = Path(directory).resolve()
        for name, data in snapshot.items():
            target = baseline_root / name; target.parent.mkdir(parents=True, exist_ok=True); target.write_bytes(data)
        outputs = baseline_outputs(baseline_root)
        original = dict(outputs); affected = set(); receipts = {}
        for row_text, reference in sorted(repairs.items()):
            row = int(row_text); item = decode(reads.bound(reference))
            require(item.get('row') == row and type(item.get('row')) is int, 'repair binding row differs')
            canonical = BASE + f'row{row}'
            require(mapping[canonical + '-pieces.json'] == item['baseline_archive'] and
                    item['baseline_archive']['path'] != canonical + '-pieces.json', 'repair archive differs from baseline')
            for field, target in (('centre_plan', canonical + '.json'), ('selection', canonical + '-selection.json'),
                                  ('historical_seal', canonical + '-source.json'),
                                  ('historical_provenance', canonical + ('-source.json' if row != 14 else '-binding.json'))):
                require(reads.bound(item[field]) == snapshot[target], 'repair historical reference differs: ' + field)
            effective = reads.read(canonical + '-pieces.json')
            pieces, receipt = repair.derive(item, repair_files(reads, item), effective_bytes=effective)
            receipts[row_text] = receipt
            changed = {f'Grothe/LowerAnalytic/CapPieces/D{row}x{key.split(":")[1]}.lean'
                       for key in receipt['repaired_keys']}
            generated = render_pieces(baseline_root, row, pieces)
            prefix = f'Grothe/LowerAnalytic/CapPieces/'
            wanted = {name for name in original if name.startswith(prefix) and
                      name[len(prefix):].startswith(tuple(f'{letter}{row}x' for letter in 'DCRN'))}
            require(set(generated) == wanted, 'effective writer added or omitted a node module')
            for name, data in generated.items():
                if name in changed:
                    require(data != original[name], 'named D repair did not change source')
                    require(name in expected and sha(data) == expected[name], 'effective D-source hash differs: ' + name)
                else:
                    require(data == original[name], 'repair changed non-D or unlisted source: ' + name)
            outputs.update(generated); affected.update(changed)
        require(set(expected) == affected, 'unbound or extra effective D-source pin')
        require(set(outputs) == set(original) and all(outputs[name] == data for name, data in original.items()
                                                     if name not in affected), 'unlisted prepared source changed')
        for name, digest in binding14['retained_sha256'].items():
            require(sha(reads.read(name)) == digest and name not in affected, 'retained14x150 source/input changed')
    reads.unchanged()
    return outputs, {'format': FORMAT, 'repair_receipts': receipts, 'changed_data_modules': sorted(affected),
                     'historical_sources_reproduced': True, 'native_verified': False, 'cache_uploaded': False}


def render_sealed(root):
    reads = Reads(root); binding = decode(reads.read(BINDING))
    outputs, _ = render(root, binding)
    reads.unchanged()
    return outputs
