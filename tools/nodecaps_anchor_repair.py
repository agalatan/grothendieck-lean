#!/usr/bin/env python3
"""Sealed anchor-recipe repairs of the prepared rows 12–15 (source reproduction only, no Lean).

Agent-ID: claude-b9ee. The historical anchor plans (`row1k-anchors.json`, codex-7c3e / codex-15b7:
route-A proposals `v0 = m + s·a`, no variance, scale 1) are archived by content hash under
`data/caps-m/plan/anchor-repairs/original/`; the sealed baseline renderers keep reproducing the
historical sources from those archives. The effective plan at the canonical path differs from its
archive only in the `recipe` of the nodes listed in the binding (a variance factor on the fibre
coordinates (6, 7, 10), optionally a price scale, found with the checker's own exact matrix `N` on
the droplet) and in the `anchor_repairs` provenance block. The frozen renderers
(`nodecaps_prepared_renderers.anchors12/anchors13`) render the effective plan: only
`CapRow1k/Recipes.lean` and `CapRow1k/Anchors.manifest.json` may differ from the sealed baseline, and
must match the pinned effective hashes; every `AnchorRangeNN.lean` stays byte-identical. The repaired
recipes are certified only by the native range facts in CI's caps build.
"""
import hashlib
import json
from fractions import Fraction
from pathlib import Path
import re
import sys

sys.dont_write_bytecode = True
import contextlib, importlib.util, io, tempfile, warnings
from nodecaps_prepared_renderers import anchors12, anchors13, assembly12, assembly13

BASE = 'data/caps-m/plan/row-certificates/'
BINDING = BASE + 'anchor-repair-binding.json'
FORMAT = 'nodecaps-anchor-repair-binding/v1'
PLAN_FORMAT = 'caps-row-anchor-repairs/v1'
CURRENT_TOOLS = {'tools/nodecaps_anchor_repair.py', 'tools/nodecaps_prepared_renderers.py'}
RATIONAL = re.compile(r'-?(0|[1-9][0-9]*)(/[1-9][0-9]*)?')
LOC_DIR = BASE + 'localized/'     # the registry's pieces/selection of a row with extra localized nodes
REPAIRS_DIR = 'data/caps-m/plan/anchor-repairs/'
FINE_GRID = [1600, 1024, '1/200']   # the third grid of the certificate catalogue (scripts/caps_stamp.py ACTIVE_GRIDS)


def require(ok, message):
    if not ok:
        raise ValueError(message)


def sha(data):
    return hashlib.sha256(data).hexdigest()


def decode(data):
    def pairs(items):
        result = {}
        for key, value in items:
            require(key not in result, 'duplicate JSON key: ' + key)
            result[key] = value
        return result
    return json.loads(data, object_pairs_hook=pairs,
                      parse_constant=lambda value: (_ for _ in ()).throw(ValueError('invalid JSON number')))


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True) + '\n').encode()


def path(value):
    require(type(value) is str and value and '\\' not in value and not value.startswith('/') and
            all(part not in ('', '.', '..') for part in value.split('/')), 'unsafe repository-relative path')
    return value


def ref(value):
    require(type(value) is dict and set(value) == {'path', 'sha256'}, 'malformed file reference')
    name, digest = path(value['path']), value['sha256']
    require(type(digest) is str and re.fullmatch('[0-9a-f]{64}', digest), 'malformed SHA256')
    return name, digest


def read_bound(root, reference):
    name, digest = ref(reference)
    target = Path(root)
    for component in name.split('/'):
        target = target / component
        require(not target.is_symlink(), 'refusing source symlink: ' + name)
    data = target.read_bytes()
    require(sha(data) == digest, 'anchor repair source binding differs: ' + name)
    return data


def rational(value):
    require(type(value) is str and RATIONAL.fullmatch(value), 'malformed rational: ' + repr(value))
    q = Fraction(value)
    require(value in {str(q), f'{q.numerator}/{q.denominator}'}, 'noncanonical rational: ' + value)
    return q


def recipe(value):
    """`v0|f1|…|scale`: twelve rationals per vector, a positive scale."""
    require(type(value) is str, 'recipe must be a string')
    parts = value.split('|')
    require(len(parts) >= 2, 'recipe needs an anchor and a scale')
    for vector in parts[:-1]:
        coordinates = vector.split(',')
        require(len(coordinates) == 12, 'recipe vector must have 12 coordinates')
        for x in coordinates:
            rational(x)
    require(rational(parts[-1]) > 0, 'recipe scale must be positive')


def localize_plan(plan, nodes):
    """The plan with the anchor nodes `nodes` moved to the localized set (a copy)."""
    plan = decode(encoded(plan)); nodes = set(nodes)
    plan['anchors'] = [a for a in plan['anchors'] if a['node_index'] not in nodes]
    plan['localized_exclusions'] = sorted(set(plan['localized_exclusions']) | nodes)
    plan['census'] = dict(plan['census'], localized=plan['census']['localized'] + len(nodes), anchors=plan['census']['anchors'] - len(nodes))
    for part in plan['ranges']:
        part['anchor_indices'] = [i for i in part['anchor_indices'] if i not in nodes]
    return plan


def effective_plan(original, effective, nodes, localized=()):
    """The effective plan equals the archived one except the repaired recipes/grids, the nodes moved to the
    localized set (removed from the anchors, added to the exclusions, census and ranges adjusted) and the
    provenance block."""
    require(isinstance(original, dict) and isinstance(effective, dict), 'anchor plans must be objects')
    require(set(effective) == set(original) | {'anchor_repairs'}, 'effective anchor plan adds or drops a field')
    localized = sorted(set(localized)); nodes = sorted(set(nodes))
    require(not set(localized) & set(nodes), 'a node is both re-anchored and localized')
    base = localize_plan(original, localized) if localized else original
    require(set(localized) <= {a['node_index'] for a in original['anchors']}, 'localized node is not a historical anchor')
    for key in original:
        if key == 'grids':
            # the stable two legacy grids, optionally followed by the fine grid of the piece catalogue
            require(effective[key][:len(original[key])] == original[key] and
                    effective[key] in (original[key], original[key] + [FINE_GRID]), 'effective anchor plan changes the grid catalogue')
        elif key != 'anchors':
            require(effective[key] == base[key], 'effective anchor plan changes a sealed field: ' + key)
    a, b = base['anchors'], effective['anchors']
    require(isinstance(a, list) and isinstance(b, list) and len(a) == len(b), 'anchor inventory differs')
    repaired = set()
    for x, y in zip(a, b):
        require(isinstance(x, dict) and isinstance(y, dict) and set(x) == set(y), 'anchor entry fields differ')
        for key in x:
            if key in ('recipe', 'grid_index') and x[key] != y[key]:
                require(type(y['node_index']) is int and y['node_index'] in nodes, 'unlisted anchor change: node ' + str(y.get('node_index')))
                recipe(y['recipe'])
                require(type(y['grid_index']) is int and 0 <= y['grid_index'] < len(effective['grids']), 'repaired anchor names a grid outside the catalogue')
                repaired.add(y['node_index'])
            else:
                require(x[key] == y[key], 'repaired anchor changes more than its recipe and grid')
    require(repaired == set(nodes), 'listed repaired node keeps its historical recipe and grid')
    block = effective['anchor_repairs']
    require(isinstance(block, dict) and block.get('format') == PLAN_FORMAT and block.get('nodes') == nodes
            and type(block.get('agent_id')) is str and type(block.get('baseline_sha256')) is str
            and type(block.get('method')) is str and block.get('localized_nodes', []) == localized, 'malformed anchor repair provenance block')
    return repaired


def render_assembly(row, indices, ranges):
    """The whole-row assembly of the frozen renderers for an extended localized set (row 14 keeps its
    retained node-150 proof exactly as nodecaps_row14_render.assembly substitutes it)."""
    require(indices == sorted(set(indices)), 'localized indices must be sorted and distinct')
    if row == 12:
        return assembly12(indices, ranges)
    text = assembly13(row, indices, ranges)
    if row == 14:
        text = text.decode()
        old_import = 'import Grothe.LowerAnalytic.CapPieces.N14x150\n'
        old_case = '  · simpa only [NodeCap] using (nodeCap_14x150 (by simp))'
        require(text.count(old_import) == text.count(old_case) == 1, 'assembly template changed')
        text = text.replace(old_import, 'import Grothe.LowerAnalytic.CapPieces.Node14x150\n').replace(
            old_case, '  · simpa only [NodeCap] using nodeCap_14x150_done').encode()
    return text


def render_new_nodes(root, pieces_bytes, selection_bytes):
    """The D/C/R/N modules of the new localized nodes, rendered by the repository's piece writer on an
    isolated root (the coverage policy is the repository's)."""
    root = Path(root).resolve()
    spec = importlib.util.spec_from_file_location('anchor_repair_piece_writer', root / 'tools/gen_cap_pieces.py')
    module = importlib.util.module_from_spec(spec); spec.loader.exec_module(module)
    with tempfile.TemporaryDirectory(prefix='nodecaps-localized-') as directory:
        target = Path(directory).resolve(); module.ROOT = str(target)
        policy = target / BASE / 'coverage-slicing.json'; policy.parent.mkdir(parents=True)
        policy.write_bytes((root / BASE / 'coverage-slicing.json').read_bytes())
        (target / 'pieces.json').write_bytes(pieces_bytes); (target / 'selection.json').write_bytes(selection_bytes)
        with warnings.catch_warnings(), contextlib.redirect_stdout(io.StringIO()):
            warnings.simplefilter('ignore', ResourceWarning)
            module.write_nodes(str(target / 'pieces.json'), str(target / 'selection.json'))
        return {p.relative_to(target).as_posix(): p.read_bytes() for p in target.rglob('*.lean')}


def combined_inputs(root, row, new_pieces, new_selection):
    """The registry's pieces and selection of a row: the canonical (repaired) localized nodes plus the new ones."""
    base = decode((root / BASE / f'row{row}-pieces.json').read_bytes())
    sel = decode((root / BASE / f'row{row}-selection.json').read_bytes())
    old = {n['i'] for n in base}; new = {n['i'] for n in new_pieces}
    require(all(n['k'] == row for n in new_pieces) and not (old & new), 'new localized node collides with a canonical one')
    require(set(new_selection) == {f'{row}:{i}' for i in new}, 'new selection does not match the new nodes')
    pieces = sorted(base + new_pieces, key=lambda n: n['i'])
    selection = {**sel, **new_selection}
    selection = {k: selection[k] for k in sorted(selection, key=lambda x: int(x.split(':')[1]))}
    return encoded(pieces), encoded(selection)


def grid_literal(grids):
    return '[' + ', '.join(f'({g[0]}, {g[1]}, {Fraction(g[2]).numerator} / {Fraction(g[2]).denominator})' for g in grids) + ']'


def render_effective(renderer, plan, row):
    """The frozen renderer's sources for the effective plan; its two-grid literal is replaced by the
    plan's catalogue when the fine grid was added, and the manifest hash of Recipes.lean follows."""
    outputs = renderer(plan)
    directory = f'Grothe/LowerAnalytic/CapRow{row}/'
    if len(plan['grids']) > 2:
        name = directory + 'Recipes.lean'; text = outputs[name].decode()
        old = f'def row{row}AnchorGrids : List (Nat × Nat × Rat) := ' + grid_literal(plan['grids'][:2]) + '\n'
        require(text.count(old) == 1, 'frozen anchor grid literal not found')
        outputs[name] = text.replace(old, f'def row{row}AnchorGrids : List (Nat × Nat × Rat) := ' + grid_literal(plan['grids']) + '\n').encode()
        manifest = decode(outputs[directory + 'Anchors.manifest.json'])
        manifest['files_sha256'][name] = sha(outputs[name])
        outputs[directory + 'Anchors.manifest.json'] = encoded(manifest)
    return outputs


def apply(root, outputs, binding):
    """Return the prepared sources with the effective anchor recipes; no writes to root."""
    root = Path(root).resolve(); project = Path(__file__).resolve().parents[1]
    require(type(binding) is dict and set(binding) == {'format', 'agent_id', 'current_tools_sha256', 'rows'}
            and binding['format'] == FORMAT, 'unsupported anchor repair binding')
    require(type(binding['current_tools_sha256']) is dict and set(binding['current_tools_sha256']) == CURRENT_TOOLS,
            'wrong anchor repair tool inventory')
    for name, digest in binding['current_tools_sha256'].items():
        require(sha((project / name).read_bytes()) == digest, 'running anchor repair tool differs: ' + name)
        require(sha((root / name).read_bytes()) == digest, 'anchor repair tool differs in root: ' + name)
    rows = binding['rows']
    require(type(rows) is dict and rows and set(rows) <= {'12', '13', '14', '15'}, 'invalid repaired row set')
    receipts = {}
    for row_text, item in sorted(rows.items()):
        row = int(row_text)
        require(type(item) is dict and set(item) - {'localized'} == {'baseline_archive', 'effective', 'repaired_nodes', 'effective_sources_sha256'},
                'malformed anchor repair row binding')
        canonical = BASE + f'row{row}-anchors.json'
        archive_name, archive_digest = ref(item['baseline_archive'])
        require(archive_name != canonical and archive_name.startswith('data/caps-m/plan/anchor-repairs/original/')
                and archive_digest in archive_name, 'historical anchor plan must be archived by content hash')
        effective_name, _ = ref(item['effective'])
        require(effective_name == canonical, 'effective anchor plan must be the canonical row input')
        original = decode(read_bound(root, item['baseline_archive']))
        effective = decode(read_bound(root, item['effective']))
        nodes = item['repaired_nodes']
        require(type(nodes) is list and all(type(i) is int for i in nodes) and nodes == sorted(set(nodes)),
                'repaired nodes must be a sorted list of distinct indices')
        require(effective['anchor_repairs'].get('baseline_sha256') == archive_digest, 'provenance names another baseline')
        loc = item.get('localized')
        localized = []
        if loc is not None:
            require(type(loc) is dict and set(loc) == {'pieces', 'selection', 'nodes', 'registry_pieces', 'registry_selection'},
                    'malformed localized-node binding')
            localized = loc['nodes']
            require(type(localized) is list and localized and all(type(i) is int for i in localized)
                    and localized == sorted(set(localized)), 'localized nodes must be a sorted list of distinct indices')
        repaired = effective_plan(original, effective, nodes, localized)
        renderer = anchors12 if row == 12 else anchors13
        baseline = renderer(original)
        rendered = render_effective(renderer, effective, row)
        require(set(baseline) == set(rendered) and set(rendered) <= set(outputs), 'anchor renderer inventory differs')
        for name, data in baseline.items():
            require(outputs[name] == data, 'sealed baseline does not reproduce the archived anchor plan: ' + name)
        directory = f'Grothe/LowerAnalytic/CapRow{row}/'
        changeable = {directory + 'Recipes.lean', directory + 'Anchors.manifest.json'}
        if loc is not None:
            new_pieces_bytes = read_bound(root, loc['pieces']); new_selection_bytes = read_bound(root, loc['selection'])
            new_pieces = decode(new_pieces_bytes); new_selection = decode(new_selection_bytes)
            require(isinstance(new_pieces, list) and sorted(n['i'] for n in new_pieces) == localized, 'new pieces do not list the localized nodes')
            archived = {a['node_index']: a for a in original['anchors']}
            for n in new_pieces:
                require((n['s'], n['cap']) == (archived[n['i']]['s'], archived[n['i']]['cap']), 'localized node position/cap differs from the row')
            pieces_bytes, selection_bytes = combined_inputs(root, row, new_pieces, new_selection)
            rp, _ = ref(loc['registry_pieces']); rs, _ = ref(loc['registry_selection'])
            require(rp == LOC_DIR + f'row{row}-pieces.json' and rs == LOC_DIR + f'row{row}-selection.json', 'wrong registry input paths')
            require(read_bound(root, loc['registry_pieces']) == pieces_bytes and read_bound(root, loc['registry_selection']) == selection_bytes,
                    'registry pieces/selection differ from the canonical nodes plus the new ones')
            modules = render_new_nodes(root, new_pieces_bytes, new_selection_bytes)
            require(modules and not set(modules) & set(outputs), 'new localized node module collides with a prepared source')
            ranges = [(part['lo'], part['hi']) for part in effective['ranges']]
            rendered[directory + 'Assembly.lean'] = render_assembly(row, effective['localized_exclusions'], ranges)
            rendered.update(modules)
            changeable |= {directory + 'Assembly.lean'} | set(modules)
        expected = item['effective_sources_sha256']
        require(type(expected) is dict and set(expected) == changeable, 'wrong effective anchor source inventory')
        for name, data in rendered.items():
            if name in changeable:
                require(name not in outputs or data != outputs[name], 'listed effective source is unchanged: ' + name)
                require(sha(data) == expected[name], 'effective anchor source hash differs: ' + name)
            else:
                require(data == outputs[name], 'anchor repair changed a range module: ' + name)
        outputs = dict(outputs); outputs.update(rendered)
        receipts[row_text] = {'repaired_nodes': sorted(repaired), 'localized_nodes': localized, 'changed': sorted(changeable)}
    return outputs, {'format': FORMAT, 'receipts': receipts, 'historical_sources_reproduced': True,
                     'native_verified': False, 'cache_uploaded': False}


def apply_sealed(root, outputs):
    root = Path(root).resolve()
    binding = decode((root / BINDING).read_bytes())
    result, _ = apply(root, outputs, binding)
    return result



def repin(root, rows):
    """Relocate the historical anchor plans in the sealed baselines; re-pin the current wrapper tools."""
    for name, owned in ((BASE + 'noncentre-source-binding.json', ('12', '13', '14')),
                        (BASE + 'row15-repaired-source-binding.json', ('15',))):
        target = root / name
        raw = target.read_bytes(); binding = decode(raw)
        require(encoded(binding) == raw, 'unexpected binding serialisation: ' + name)
        for row_text in owned:
            if row_text not in rows:
                continue
            canonical = BASE + f'row{row_text}-anchors.json'
            pin = binding['baseline_files'][canonical]
            require(pin['sha256'] == rows[row_text]['baseline_archive']['sha256'],
                    'sealed baseline pins another historical anchor plan: ' + canonical)
            binding['baseline_files'][canonical] = dict(rows[row_text]['baseline_archive'])
        for tool in binding['current_tools_sha256']:
            binding['current_tools_sha256'][tool] = sha((root / tool).read_bytes())
        target.write_bytes(encoded(binding))


def bind(root, repairs_path):
    """Write the archives, the effective plans, the localized inputs and the binding from a repairs input file."""
    root = Path(root).resolve()
    repairs_bytes = (root / path(repairs_path)).read_bytes(); repairs = decode(repairs_bytes)
    require(isinstance(repairs, dict) and repairs.get('format') == 'caps-row-anchor-repairs-input/v1'
            and type(repairs.get('agent_id')) is str and type(repairs.get('method')) is str
            and type(repairs.get('rows')) is dict and type(repairs.get('localized_rows', {})) is dict, 'malformed anchor repairs input')
    localized_rows = repairs.get('localized_rows', {})
    binding_path = root / BINDING
    previous = decode(binding_path.read_bytes()) if binding_path.exists() else None
    rows = {}
    registry = decode((root / BASE / 'row12-build.json').read_bytes())
    for row_text in sorted(set(repairs['rows']) | set(localized_rows)):
        nodes = repairs['rows'].get(row_text, {})
        require(row_text in ('12', '13', '14', '15') and type(nodes) is dict, 'invalid repaired row')
        row = int(row_text); canonical = BASE + f'row{row}-anchors.json'
        if previous is not None and row_text in previous['rows']:
            original_bytes = read_bound(root, previous['rows'][row_text]['baseline_archive'])
        else:
            original_bytes = (root / canonical).read_bytes()
            require('anchor_repairs' not in decode(original_bytes), 'canonical anchor plan already repaired without a binding')
        digest = sha(original_bytes)
        archive = f'data/caps-m/plan/anchor-repairs/original/{digest}/row{row}-anchors.json'
        target = root / archive; target.parent.mkdir(parents=True, exist_ok=True)
        if target.exists():
            require(target.read_bytes() == original_bytes, 'archive differs from the historical plan: ' + archive)
        else:
            target.write_bytes(original_bytes)
        original = decode(original_bytes); effective = decode(original_bytes)
        index = {a['node_index']: a for a in effective['anchors']}
        repaired = []
        for node_text, item in sorted(nodes.items(), key=lambda kv: int(kv[0])):
            i = int(node_text)
            require(i in index and type(item) is dict and type(item.get('recipe')) is str, 'repair names a non-anchor node: ' + node_text)
            recipe(item['recipe'])
            grid = item.get('grid_index', index[i]['grid_index'])
            require(type(grid) is int and 0 <= grid <= 2, 'repair names an unsupported grid: ' + node_text)
            require((item['recipe'], grid) != (index[i]['recipe'], index[i]['grid_index']), 'repair repeats the historical anchor: ' + node_text)
            if grid == 2 and len(effective['grids']) == 2:
                effective['grids'] = effective['grids'] + [FINE_GRID]
            index[i]['recipe'] = item['recipe']; index[i]['grid_index'] = grid; repaired.append(i)
        block = {'format': PLAN_FORMAT, 'agent_id': repairs['agent_id'], 'baseline_sha256': digest,
                 'nodes': sorted(repaired), 'method': repairs['method'], 'input': {'path': repairs_path, 'sha256': sha(repairs_bytes)}}
        entry = {'baseline_archive': {'path': archive, 'sha256': digest}, 'repaired_nodes': sorted(repaired)}
        directory = f'Grothe/LowerAnalytic/CapRow{row}/'
        changed = {}
        localized = []
        if row_text in localized_rows:
            spec = localized_rows[row_text]
            require(type(spec) is dict and type(spec.get('pieces')) is str, 'malformed localized row input')
            new_pieces_bytes = (root / path(spec['pieces'])).read_bytes(); new_pieces = decode(new_pieces_bytes)
            require(isinstance(new_pieces, list) and new_pieces and all(n['k'] == row and n['i'] in index for n in new_pieces),
                    'localized pieces must belong to historical anchors of the row')
            localized = sorted(n['i'] for n in new_pieces)
            require(len(set(localized)) == len(localized) and not set(localized) & set(repaired), 'localized node repeated or also re-anchored')
            for n in new_pieces:
                require((n['s'], n['cap']) == (index[n['i']]['s'], index[n['i']]['cap']), 'localized node position/cap differs from the row')
            grid_of = {256: 1, 1024: 2}
            new_selection = {f'{row}:{n["i"]}': {'chunk': 4, 'excl': [], 'grids': [grid_of.get(q['nq'], 0) for q in n['pieces']]} for n in new_pieces}
            new_selection_bytes = encoded(new_selection)
            selection_path = REPAIRS_DIR + f'localized/row{row}-selection.json'
            (root / selection_path).parent.mkdir(parents=True, exist_ok=True); (root / selection_path).write_bytes(new_selection_bytes)
            effective = localize_plan(effective, localized)
            block['localized_nodes'] = localized
            block['localized_input'] = {'path': spec['pieces'], 'sha256': sha(new_pieces_bytes)}
            pieces_bytes, selection_bytes = combined_inputs(root, row, new_pieces, new_selection)
            rp, rs = LOC_DIR + f'row{row}-pieces.json', LOC_DIR + f'row{row}-selection.json'
            (root / rp).parent.mkdir(parents=True, exist_ok=True); (root / rp).write_bytes(pieces_bytes); (root / rs).write_bytes(selection_bytes)
            entry['localized'] = {'pieces': {'path': spec['pieces'], 'sha256': sha(new_pieces_bytes)},
                                  'selection': {'path': selection_path, 'sha256': sha(new_selection_bytes)}, 'nodes': localized,
                                  'registry_pieces': {'path': rp, 'sha256': sha(pieces_bytes)},
                                  'registry_selection': {'path': rs, 'sha256': sha(selection_bytes)}}
            for item in registry['active_rows']:
                if item['row'] == row:
                    item['pieces'] = rp; item['selection'] = rs
            modules = render_new_nodes(root, new_pieces_bytes, new_selection_bytes)
            ranges = [(part['lo'], part['hi']) for part in effective['ranges']]
            changed[directory + 'Assembly.lean'] = render_assembly(row, effective['localized_exclusions'], ranges)
            changed.update(modules)
        effective['anchor_repairs'] = block
        effective_plan(original, effective, sorted(repaired), localized)
        effective_bytes = encoded(effective)
        (root / canonical).write_bytes(effective_bytes)
        rendered = render_effective(anchors12 if row == 12 else anchors13, effective, row)
        changed[directory + 'Recipes.lean'] = rendered[directory + 'Recipes.lean']
        changed[directory + 'Anchors.manifest.json'] = rendered[directory + 'Anchors.manifest.json']
        entry['effective'] = {'path': canonical, 'sha256': sha(effective_bytes)}
        entry['effective_sources_sha256'] = {n: sha(d) for n, d in sorted(changed.items())}
        rows[row_text] = entry
    binding = {'format': FORMAT, 'agent_id': repairs['agent_id'],
               'current_tools_sha256': {n: sha((root / n).read_bytes()) for n in CURRENT_TOOLS}, 'rows': rows}
    binding_path.write_bytes(encoded(binding))
    (root / BASE / 'row12-build.json').write_bytes(encoded(registry))
    repin(root, rows)
    return rows


def register(root):
    """Add the caps-owned native facts, required declarations and axiom prints of the active registry to
    data/axioms/native.txt, data/axioms/required.txt and scratch/Axioms.lean (then run tools/gen_root_imports.py)."""
    sys.path.insert(0, str(Path(root) / 'scripts'))
    import caps_stamp
    view = caps_stamp.read_active_registry(Path(root))
    added = {}
    for name, wanted, fmt in (('data/axioms/native.txt', view['native_axioms'], '{}'),
                              ('data/axioms/required.txt', view['required_declarations'], '{}'),
                              ('scratch/Axioms.lean', view['required_axiom_prints'], '#print axioms {}')):
        target = Path(root) / name; lines = target.read_text().splitlines()
        present = set(l.strip() for l in lines)
        missing = [fmt.format(x) for x in sorted(wanted) if fmt.format(x) not in present]
        if missing:
            target.write_text('\n'.join(lines + missing) + '\n')
        added[name] = len(missing)
    return added


def main(argv=None):
    import argparse
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest='command', required=True)
    b = sub.add_parser('bind', help='write the archives, effective anchor plans, localized inputs and binding from a repairs input; then run tools/gen_cap_prepared_rows.py')
    b.add_argument('repairs', help='repository-relative repairs input (caps-row-anchor-repairs-input/v1)')
    sub.add_parser('register', help='add the caps-owned native facts, required declarations and axiom prints to the axiom lists')
    args = parser.parse_args(argv)
    root = Path(__file__).resolve().parents[1]
    try:
        if args.command == 'register':
            added = register(root)
            print('registered: ' + ', '.join(f'{k}: +{v}' for k, v in added.items()) + '; now run tools/gen_root_imports.py')
            return
        rows = bind(root, args.repairs)
    except (ValueError, KeyError, OSError) as error:
        parser.exit(1, 'FAIL: ' + str(error) + '\n')
    for row_text, item in rows.items():
        print(f"row {row_text}: {len(item['repaired_nodes'])} repaired anchors {item['repaired_nodes']}" +
              (f"; {len(item['localized']['nodes'])} localized nodes {item['localized']['nodes']}" if 'localized' in item else ''))
    print('effective anchor plans written; regenerate with tools/gen_cap_prepared_rows.py and scripts/build_caps_batches.py --write-registry')


if __name__ == '__main__':
    main()
