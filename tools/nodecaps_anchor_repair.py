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
from nodecaps_prepared_renderers import anchors12, anchors13

BASE = 'data/caps-m/plan/row-certificates/'
BINDING = BASE + 'anchor-repair-binding.json'
FORMAT = 'nodecaps-anchor-repair-binding/v1'
PLAN_FORMAT = 'caps-row-anchor-repairs/v1'
CURRENT_TOOLS = {'tools/nodecaps_anchor_repair.py', 'tools/nodecaps_prepared_renderers.py'}
RATIONAL = re.compile(r'-?(0|[1-9][0-9]*)(/[1-9][0-9]*)?')
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


def effective_plan(original, effective, nodes):
    """The effective plan equals the archived one except the repaired recipes and the provenance block."""
    require(isinstance(original, dict) and isinstance(effective, dict), 'anchor plans must be objects')
    require(set(effective) == set(original) | {'anchor_repairs'}, 'effective anchor plan adds or drops a field')
    for key in original:
        if key == 'grids':
            # the stable two legacy grids, optionally followed by the fine grid of the piece catalogue
            require(effective[key][:len(original[key])] == original[key] and
                    effective[key] in (original[key], original[key] + [FINE_GRID]), 'effective anchor plan changes the grid catalogue')
        elif key != 'anchors':
            require(effective[key] == original[key], 'effective anchor plan changes a sealed field: ' + key)
    a, b = original['anchors'], effective['anchors']
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
    require(isinstance(block, dict) and block.get('format') == PLAN_FORMAT and block.get('nodes') == sorted(nodes)
            and type(block.get('agent_id')) is str and type(block.get('baseline_sha256')) is str
            and type(block.get('method')) is str, 'malformed anchor repair provenance block')
    return repaired


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
        require(type(item) is dict and set(item) == {'baseline_archive', 'effective', 'repaired_nodes', 'effective_sources_sha256'},
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
        require(type(nodes) is list and nodes and all(type(i) is int for i in nodes) and nodes == sorted(set(nodes)),
                'repaired nodes must be a sorted list of distinct indices')
        require(effective['anchor_repairs'].get('baseline_sha256') == archive_digest, 'provenance names another baseline')
        repaired = effective_plan(original, effective, nodes)
        renderer = anchors12 if row == 12 else anchors13
        baseline = renderer(original)
        rendered = render_effective(renderer, effective, row)
        require(set(baseline) == set(rendered) and set(rendered) <= set(outputs), 'anchor renderer inventory differs')
        for name, data in baseline.items():
            require(outputs[name] == data, 'sealed baseline does not reproduce the archived anchor plan: ' + name)
        directory = f'Grothe/LowerAnalytic/CapRow{row}/'
        changeable = {directory + 'Recipes.lean', directory + 'Anchors.manifest.json'}
        expected = item['effective_sources_sha256']
        require(type(expected) is dict and set(expected) == changeable, 'wrong effective anchor source inventory')
        for name, data in rendered.items():
            if name in changeable:
                require(data != outputs[name] and sha(data) == expected[name], 'effective anchor source hash differs: ' + name)
            else:
                require(data == outputs[name], 'anchor repair changed a range module: ' + name)
        outputs = dict(outputs); outputs.update(rendered)
        receipts[row_text] = {'repaired_nodes': sorted(repaired), 'changed': sorted(changeable)}
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
    """Write the archives, the effective plans and the binding from a repairs input file."""
    root = Path(root).resolve()
    repairs_bytes = (root / path(repairs_path)).read_bytes(); repairs = decode(repairs_bytes)
    require(isinstance(repairs, dict) and repairs.get('format') == 'caps-row-anchor-repairs-input/v1'
            and type(repairs.get('agent_id')) is str and type(repairs.get('method')) is str
            and type(repairs.get('rows')) is dict and repairs['rows'], 'malformed anchor repairs input')
    binding_path = root / BINDING
    previous = decode(binding_path.read_bytes()) if binding_path.exists() else None
    rows = {}
    for row_text, nodes in sorted(repairs['rows'].items()):
        require(row_text in ('12', '13', '14', '15') and type(nodes) is dict and nodes, 'invalid repaired row')
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
        effective['anchor_repairs'] = {'format': PLAN_FORMAT, 'agent_id': repairs['agent_id'], 'baseline_sha256': digest,
                                       'nodes': sorted(repaired), 'method': repairs['method'],
                                       'input': {'path': repairs_path, 'sha256': sha(repairs_bytes)}}
        effective_plan(original, effective, sorted(repaired))
        effective_bytes = encoded(effective)
        (root / canonical).write_bytes(effective_bytes)
        rendered = render_effective(anchors12 if row == 12 else anchors13, effective, row)
        directory = f'Grothe/LowerAnalytic/CapRow{row}/'
        rows[row_text] = {'baseline_archive': {'path': archive, 'sha256': digest},
                          'effective': {'path': canonical, 'sha256': sha(effective_bytes)},
                          'repaired_nodes': sorted(repaired),
                          'effective_sources_sha256': {n: sha(rendered[n]) for n in (directory + 'Recipes.lean', directory + 'Anchors.manifest.json')}}
    binding = {'format': FORMAT, 'agent_id': repairs['agent_id'],
               'current_tools_sha256': {n: sha((root / n).read_bytes()) for n in CURRENT_TOOLS}, 'rows': rows}
    binding_path.write_bytes(encoded(binding))
    repin(root, rows)
    return rows


def main(argv=None):
    import argparse
    parser = argparse.ArgumentParser(description=__doc__, allow_abbrev=False, formatter_class=argparse.RawDescriptionHelpFormatter)
    sub = parser.add_subparsers(dest='command', required=True)
    b = sub.add_parser('bind', help='write the archives, effective anchor plans and binding from a repairs input; then run tools/gen_cap_prepared_rows.py')
    b.add_argument('repairs', help='repository-relative repairs input (caps-row-anchor-repairs-input/v1)')
    args = parser.parse_args(argv)
    root = Path(__file__).resolve().parents[1]
    try:
        rows = bind(root, args.repairs)
    except (ValueError, KeyError, OSError) as error:
        parser.exit(1, 'FAIL: ' + str(error) + '\n')
    for row_text, item in rows.items():
        print(f"row {row_text}: {len(item['repaired_nodes'])} repaired anchors {item['repaired_nodes']}")
    print('effective anchor plans written; regenerate with tools/gen_cap_prepared_rows.py and scripts/build_caps_batches.py --write-registry')


if __name__ == '__main__':
    main()
