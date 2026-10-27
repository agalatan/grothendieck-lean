#!/usr/bin/env python3
"""Prepare row12 anchor proposals and optional isolated sequential Lean candidates.

Agent-ID: codex-7c3e for codex-15b7. No cap is accepted by this generator.
The default output is a reproducible data plan only. --lean-out names a candidate
PROJECT ROOT under handoff/caps-centre, outside the active Grothe source tree.
Only canonical CI may verify the generated native facts or publish a cache.
"""
import argparse
from fractions import Fraction
import hashlib
import json
import os
from pathlib import Path
import re
import tempfile

ROOT = Path(__file__).resolve().parents[1]
ROW = 12
NOMINAL = '0.84'
GENERATOR = 'tools/gen_cap_row_anchors.py'
DEFAULT_OUT = 'data/caps-m/plan/row-certificates/row12-anchors.json'
MODULE_DIR = 'Grothe/LowerAnalytic/CapRow12'
MODULE_PREFIX = 'Grothe.LowerAnalytic.CapRow12'
EXPECTED = {'nodes': 396, 'chords': 85, 'vertices': 311, 'localized': 88, 'anchors': 223}
SOURCES = {
    'index': 'Grothe/Lower/RowData.lean',
    'row_lean': 'Grothe/Lower/RowData13.lean',
    'row_json': 'data/lower-rows/row13.json',
    'row_types': 'Grothe/Lower/RowDataTypes.lean',
    'pieces': 'data/caps-m-pieces/pieces.json',
    'recipes': 'data/caps-m/node-recipes/recM_0.84.json',
    'chords': 'Grothe/LowerAnalytic/CapChordData.lean',
    'range_defs': 'Grothe/LowerAnalytic/CapRangeDefs.lean',
}
SCOPE = ('Unverified anchor recipe proposals and generated Lean check source only. '
         'No numerical feasibility, accepted cap, native verification, complete row theorem '
         'or Actions cache publication is asserted.')


def require(condition, message):
    if not condition:
        raise ValueError(message)


def digest(data):
    return hashlib.sha256(data).hexdigest()


def encoded(value):
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + '\n').encode()


def rational(value):
    require(type(value) is int or isinstance(value, str), 'Rationals must be exact strings/integers, never floats')
    q = Fraction(value)
    return str(q.numerator) if q.denominator == 1 else f'{q.numerator}/{q.denominator}'


def nat(value, label):
    require(type(value) is int and value >= 0, 'Invalid natural number: ' + label)
    return value


def vector(value):
    require(isinstance(value, list) and len(value) == 12, 'Recipe vector must have exactly 12 coordinates')
    return [rational(x) for x in value]


def recipe_string(recipe):
    require(isinstance(recipe, dict), 'Recipe must be an object')
    anchor = vector(recipe['v0'])
    require(isinstance(recipe['var'], list), 'Recipe var must be a list of vectors')
    factors = [vector(v) for v in recipe['var']]
    scale = rational(recipe['scale'])
    require(Fraction(scale) > 0, 'Recipe scale must be strictly positive')
    return '|'.join([','.join(anchor)] + [','.join(v) for v in factors] + [scale])


def chord_row(source, row):
    marker = re.search(r'def capChords\s*:\s*List\s*\(List\s*\(ℕ × ℕ × ℕ\)\)\s*:=\s*\[', source)
    require(marker is not None, 'Unrecognized canonical capChords declaration')
    rows = re.findall(r'^  \[(.*?)\],?$', source[marker.end():], re.M)
    require(len(rows) == 19, 'Expected exactly 19 canonical chord rows')
    text = rows[row]
    matches = list(re.finditer(r'\((\d+),\s*(\d+),\s*(\d+)\)', text))
    residue = text
    for match in reversed(matches):
        residue = residue[:match.start()] + residue[match.end():]
    require(not residue.strip(' ,\t'), 'Unexpected chord-row syntax')
    return [tuple(map(int, match.groups())) for match in matches]


def ranges_of(length, size):
    require(type(size) is int and 0 < size <= 64, 'Range size must be between 1 and 64')
    return [(lo, min(lo + size, length)) for lo in range(0, length, size)]


def build_plan(root=ROOT, *, range_size=16, expected=None, pinned_sources=None):
    """Read source bytes once, verify identities/census and retain explicit proposal status."""
    root = Path(root).resolve(strict=True)
    sources = {}
    for name in SOURCES.values():
        path = (root/name).resolve(strict=True)
        require(path.is_relative_to(root) and path.is_file(), 'Input escapes repository: ' + name)
        sources[name] = path.read_bytes()
    hashes = {name: digest(data) for name, data in sources.items()}
    if pinned_sources is not None:
        require(pinned_sources == hashes, 'Pinned source hashes do not match current input bytes')
    text = lambda name: sources[SOURCES[name]].decode()
    index_match = re.search(r'def rowData\s*:\s*List Row\s*:=\s*\[([^]]*)\]', text('index'))
    require(index_match is not None, 'Unrecognized canonical rowData declaration')
    row_names = [x.strip() for x in index_match.group(1).split(',')]
    require(len(row_names) == 19 and row_names[ROW] == 'row13', 'Row12 must be zero-based rowData[12] = row13')
    require(re.search(r'def row13\s*:\s*Row\s*:=', text('row_lean')) is not None, 'Wrong canonical row declaration')
    require(re.search(r'def capPad\s*:\s*ℚ\s*:=\s*1\s*/\s*100000000000\b', text('row_types')) is not None,
            'Canonical capPad must remain exactly 1e-11')
    row = json.loads(sources[SOURCES['row_json']])
    require(row['name'] == NOMINAL, 'Row12 must use nominal 0.84, not one-based row12.json')
    require(isinstance(row['nodes'], str), 'Canonical nodes must use the encoded rational-pair string')
    require(json.dumps(row['nodes']) in text('row_lean'), 'Row JSON nodes do not match canonical Lean node bytes')
    nodes = []
    for value in row['nodes'].split(';'):
        pair = value.split(':')
        require(len(pair) == 2, 'Malformed canonical node pair')
        nodes.append(tuple(Fraction(rational(x)) for x in pair))
    require(nodes and nodes[0][0] >= 0 and all(a[0] < b[0] for a, b in zip(nodes, nodes[1:])),
            'Canonical node locations must be nonnegative and strictly increasing')
    chord_data = chord_row(text('chords'), ROW)
    chords = {t[0] for t in chord_data}
    require(len(chords) == len(chord_data), 'Duplicate chord node')
    for i, left, right in chord_data:
        require(0 <= left < i < right < len(nodes) and left not in chords and right not in chords,
                'Chord must use two existing vertex endpoints')
        a, m, b = nodes[left], nodes[i], nodes[right]
        require(a[1] + (b[1]-a[1]) / (b[0]-a[0]) * (m[0]-a[0]) <= m[1],
                'Canonical chord arithmetic does not match row data')
    pieces = json.loads(sources[SOURCES['pieces']])
    require(isinstance(pieces, list), 'Expected canonical piece-node list')
    localized = {}
    for entry in pieces:
        if entry['k'] != ROW:
            continue
        i = nat(entry['i'], 'localized node index')
        require(i < len(nodes) and i not in chords and i not in localized, 'Duplicate/nonvertex localized node')
        require((Fraction(rational(entry['s'])), Fraction(rational(entry['cap']))) == nodes[i],
                'Localized node position/cap does not match canonical row')
        require(isinstance(entry['pieces'], list) and entry['pieces'], 'Localized node has no pieces')
        localized[i] = entry
    recipes = json.loads(sources[SOURCES['recipes']])
    require(isinstance(recipes, list), 'Expected anchored recipe proposal list')
    by_index = {}
    for proposal in recipes:
        require(isinstance(proposal, dict), 'Recipe proposal must be an object')
        i = nat(proposal['k'], 'recipe node index')
        require(i < len(nodes) and i not in by_index, 'Duplicate/out-of-range recipe index')
        require(Fraction(rational(proposal['s'])) == nodes[i][0], 'Recipe node location differs from canonical row')
        grid = nat(proposal.get('g', 0), 'recipe grid')
        require(grid < 2, 'Anchor recipes use the two legacy anchor grids only')
        by_index[i] = {'node_index': i, 'grid_index': grid, 's': rational(nodes[i][0].numerator)
                       if nodes[i][0].denominator == 1 else str(nodes[i][0]),
                       'cap': str(nodes[i][1]), 'recipe': recipe_string(proposal)}
    vertices = set(range(len(nodes))) - chords
    require(set(by_index) == vertices, 'Recipes must cover every canonical nonchord vertex exactly once')
    require(set(localized) <= vertices, 'Localized exclusions must be vertex nodes')
    anchors = vertices - set(localized)
    census = {'nodes': len(nodes), 'chords': len(chords), 'vertices': len(vertices),
              'localized': len(localized), 'anchors': len(anchors)}
    require(census == (EXPECTED if expected is None else expected), 'Canonical row12 census mismatch: ' + str(census))
    partitions = ranges_of(len(nodes), range_size)
    require([i for lo, hi in partitions for i in range(lo, hi)] == list(range(len(nodes))), 'Range partition is incomplete')
    result = {
        'format': 'caps-row-anchor-candidate/v1', 'agent_id': 'codex-15b7', 'preparation_author': 'codex-7c3e',
        'scope': SCOPE, 'status': 'candidate_unverified', 'row_index': ROW,
        'canonical_row_declaration': 'row13', 'nominal_t': NOMINAL, 'capPad': '1/100000000000',
        'source_sha256': hashes, 'generator': {'path': GENERATOR, 'sha256': digest(Path(__file__).read_bytes())},
        'census': census, 'grids': [[400, 128, '1/50'], [1600, 256, '1/200']],
        'localized_exclusions': sorted(localized), 'chord_indices': sorted(chords),
        'anchors': [by_index[i] for i in sorted(anchors)], 'range_size': range_size,
        'ranges': [{'index': j, 'lo': lo, 'hi': hi,
                    'hi_lean': '(rowData.getD 12 row01).nodeList.length' if j+1 == len(partitions) else str(hi),
                    'anchor_indices': sorted(anchors & set(range(lo, hi)))}
                   for j, (lo, hi) in enumerate(partitions)],
    }
    return result


def lean_outputs(plan):
    require(plan['format'] == 'caps-row-anchor-candidate/v1' and plan['row_index'] == ROW,
            'Wrong candidate plan kind/row')
    header = ['/-!', '# Row12 anchor check candidates', '',
              'Generated by `tools/gen_cap_row_anchors.py`; Agent-ID: codex-7c3e for codex-15b7.',
              'Unverified proposals: these source files assert no completed certification or cache.', '-/', '']
    recipes = ['import GrotheCapsKernel.CapCheck', ''] + header + [
        'namespace Grothe.LowerAnalytic', '', 'set_option maxRecDepth 100000', '',
        f"/-- The {len(plan['anchors'])} unverified anchored recipe proposals for rowData[12]. -/",
        'def row12AnchorRecipes : List (Nat × Nat × String) := [']
    recipes += [',\n'.join(f"  ({entry['node_index']}, {entry['grid_index']}, {json.dumps(entry['recipe'])})"
                            for entry in plan['anchors']), ']', '',
                '/-- The localized nodes discharged separately by their complete piece certificates. -/',
                'def row12LocalizedExclusions : List Nat := [' + ', '.join(map(str, plan['localized_exclusions'])) + ']', '',
                '/-- Stable legacy anchor grids; independent of later piece-grid additions. -/',
                'def row12AnchorGrids : List (Nat × Nat × Rat) := [(400, 128, 1 / 50), (1600, 256, 1 / 200)]', '',
                'end Grothe.LowerAnalytic', '']
    files = {MODULE_DIR + '/Recipes.lean': '\n'.join(recipes).encode()}
    facts = []
    for part in plan['ranges']:
        tag = f"{part['index']:02d}"
        module = MODULE_PREFIX + '.AnchorRange' + tag
        fact = 'row12AnchorRange' + tag
        lines = ['import Grothe.LowerAnalytic.CapRangeDefs', 'import ' + MODULE_PREFIX + '.Recipes', ''] + header + [
            'open GrotheKernel Grothe.Lower', '', 'namespace Grothe.LowerAnalytic', '',
            f"/-- Sequential candidate range {part['lo']} ≤ i < {part['hi']}; localized nodes are excluded. -/",
            f'theorem {fact} :',
            '    rangeOK 12 (parseRecs row12AnchorRecipes) row12AnchorGrids row12LocalizedExclusions',
            f"      {part['lo']} {part['hi_lean']} = true := by", '  native_decide', '',
            'end Grothe.LowerAnalytic', '']
        path = MODULE_DIR + '/AnchorRange' + tag + '.lean'
        files[path] = '\n'.join(lines).encode()
        facts.append({'module': module, 'path': path, 'native_fact': 'Grothe.LowerAnalytic.' + fact,
                      'lo': part['lo'], 'hi': part['hi'], 'hi_lean': part['hi_lean'],
                      'anchor_indices': part['anchor_indices']})
    manifest = {'format': 'caps-row-anchor-modules/v1', 'agent_id': 'codex-15b7',
                'generator': GENERATOR, 'scope': SCOPE, 'row_index': ROW,
                'plan_sha256': digest(encoded(plan)), 'source_sha256': plan['source_sha256'],
                'recipes_module': MODULE_PREFIX + '.Recipes', 'native_facts': facts,
                'files_sha256': {name: digest(data) for name, data in sorted(files.items())}}
    files[MODULE_DIR + '/Anchors.manifest.json'] = encoded(manifest)
    return files


def confined_output(base, name):
    """Resolve every parent/final symlink before accepting a candidate output."""
    relative = Path(name)
    require(not relative.is_absolute() and '..' not in relative.parts, 'Invalid candidate relative output')
    resolved = (base/relative).resolve()
    require(resolved.is_relative_to(base) and resolved != base,
            'Candidate output escapes its isolated project root: ' + str(name))
    return resolved


def atomic_write(path, payload, *, boundary=None, relative_name=None):
    if boundary is not None:
        path = confined_output(boundary, relative_name)
    path.parent.mkdir(parents=True, exist_ok=True)
    if boundary is not None:
        # mkdir may traverse pre-existing parents. Resolve and check again before
        # creating any temporary bytes, then again immediately before publishing.
        path = confined_output(boundary, relative_name)
    fd, temp = tempfile.mkstemp(prefix='.' + path.name, dir=path.parent)
    try:
        with os.fdopen(fd, 'wb') as stream:
            stream.write(payload); stream.flush(); os.fsync(stream.fileno())
        if boundary is not None:
            require(confined_output(boundary, relative_name) == path,
                    'Candidate output changed during publication')
        os.replace(temp, path)
    finally:
        if os.path.exists(temp):
            os.unlink(temp)


def write_plan(path, plan, *, check=False):
    payload = encoded(plan)
    if check:
        require(path.is_file() and path.read_bytes() == payload, 'Generated data plan differs: ' + str(path))
        return
    if path.exists():
        old = json.loads(path.read_bytes())
        require(old.get('format') == plan['format'] and old.get('agent_id') == plan['agent_id']
                and old.get('generator', {}).get('path') == GENERATOR and old.get('row_index') == ROW,
                'Refuse to overwrite an unowned data plan')
    atomic_write(path, payload)


def write_lean(root, target, plan, *, check=False):
    """Only owned candidate output under handoff, never an active Grothe source tree."""
    root = Path(root).resolve(strict=True)
    target = Path(target).resolve()
    require(target.is_relative_to(root/'handoff/caps-centre') and target != root/'handoff/caps-centre',
            '--lean-out must be an isolated candidate project root under handoff/caps-centre')
    files = lean_outputs(plan)
    # Preflight EVERY fully resolved output before any directory or file write.
    targets = {name: confined_output(target, name) for name in files}
    require(len(set(targets.values())) == len(targets), 'Candidate output paths alias each other')
    manifest_path = targets[MODULE_DIR + '/Anchors.manifest.json']
    if check:
        for name, data in files.items():
            require(targets[name].is_file() and targets[name].read_bytes() == data, 'Generated Lean candidate differs: ' + name)
        return
    old_files = {}
    if manifest_path.exists():
        old = json.loads(manifest_path.read_bytes())
        require(old.get('format') == 'caps-row-anchor-modules/v1' and old.get('agent_id') == 'codex-15b7'
                and old.get('generator') == GENERATOR and old.get('row_index') == ROW,
                'Refuse to overwrite an unowned candidate manifest')
        old_files = old['files_sha256']
        require(set(old_files) == set(files) - {MODULE_DIR + '/Anchors.manifest.json'},
                'Candidate range partition changed; select a NEW candidate project root')
        for name, expected in old_files.items():
            require(name in files and targets[name].is_file() and digest(targets[name].read_bytes()) == expected,
                    'Owned candidate bytes were changed externally: ' + name)
    else:
        require(not any(path.exists() for path in targets.values()), 'Refuse to overwrite existing unowned candidate files')
    for name, data in files.items():
        atomic_write(targets[name], data, boundary=target, relative_name=name)


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--plan', '--out', dest='out', type=Path, default=Path(DEFAULT_OUT))
    parser.add_argument('--lean-out', type=Path, help='Isolated candidate PROJECT ROOT under handoff/caps-centre')
    parser.add_argument('--range-size', type=int, default=16)
    parser.add_argument('--check', action='store_true')
    args = parser.parse_args(argv)
    out = (ROOT/args.out).resolve()
    require(out == ROOT/DEFAULT_OUT, 'Only the owned row12-anchors.json plan may be written')
    prior = json.loads(out.read_bytes()) if args.check and out.is_file() else None
    plan = build_plan(ROOT, range_size=args.range_size, pinned_sources=prior['source_sha256'] if prior else None)
    # Preflight candidate ownership/output bytes before the data plan is written.
    if args.lean_out:
        write_lean(ROOT, ROOT/args.lean_out, plan, check=args.check)
    write_plan(out, plan, check=args.check)
    print(json.dumps({'agent_id': 'codex-15b7', 'prepared_by': 'codex-7c3e', 'check': args.check,
                      'output': out.relative_to(ROOT).as_posix(), 'census': plan['census'],
                      'native_range_candidates': len(plan['ranges']) if args.lean_out else 0,
                      'scope': SCOPE}, sort_keys=True))


if __name__ == '__main__':
    try:
        main()
    except (ValueError, KeyError, OSError, TypeError, json.JSONDecodeError) as exc:
        raise SystemExit('FAIL: ' + str(exc))
