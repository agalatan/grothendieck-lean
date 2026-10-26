#!/usr/bin/env python3
"""Inventory the remaining row12–15 caps without generating or verifying them.

Only the requested inventory JSON is written. No Lean, optimizer, native fact,
build cache or campaign state is executed or modified. Write-on-import
generators are never imported.
"""
import argparse
import ast
from collections import Counter
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

sys.dont_write_bytecode = True
sys.path.insert(0, str(Path(__file__).resolve().parent))
from caps_cover_sensitivity import parse_chord_data, validate_fixed_chords

ROOT = Path(__file__).resolve().parents[1]
ROWS = {12: '0.84', 13: '0.845', 14: '0.85', 15: '0.855'}
OUTPUT = Path('data/caps-m/plan/rest-inventory-codex-15b7.json')


def require(condition, message):
    if not condition:
        raise ValueError(message)


def rational(value):
    require(type(value) in (str, int), 'Expected exact rational string or integer')
    return Q(value)


def canonical(value):
    return json.dumps(value, sort_keys=True, separators=(',', ':'), allow_nan=False).encode()


def payload_hash(value):
    return hashlib.sha256(canonical(value)).hexdigest()


def strict_json(payload):
    def object_pairs(pairs):
        value = {}
        for key, item in pairs:
            require(key not in value, 'Duplicate JSON object key')
            value[key] = item
        return value

    def reject_constant(value):
        raise ValueError('Non-finite JSON number: '+value)
    return json.loads(payload, object_pairs_hook=object_pairs, parse_constant=reject_constant)


def parse_nodes(row):
    require(isinstance(row.get('nodes'), str), 'Missing canonical node string')
    nodes = [tuple(rational(v) for v in item.split(':')) for item in row['nodes'].split(';')]
    require(nodes and all(len(pair) == 2 for pair in nodes), 'Malformed canonical nodes')
    require(nodes[0][0] == 0 and all(a[0] < b[0] for a, b in zip(nodes, nodes[1:])),
            'Canonical node radii must start at zero and strictly increase')
    return nodes


def parse_open_rows(text, row_count):
    matches = re.findall(r'^def capRowsDone : List ℕ := (\[[\d,\s]*\])$', text, re.M)
    require(len(matches) == 1, 'Unsupported capRowsDone declaration')
    done = ast.literal_eval(matches[0])
    require(len(set(done)) == len(done) and all(type(k) is int and 0 <= k < row_count for k in done),
            'Duplicate or invalid certified-row identity')
    body = re.search(r'^def CapsRest : Prop :=\s*(.*?)(?=^\S|\Z)', text, re.M | re.S)
    expected = ('(∀ k, k < rowData.length → k ∉ capRowsDone → VertexCapsRow k) ∧ '
                '∀ k ∈ capRowsDone, ExclCaps k (capExcl k)')
    require(body is not None and ' '.join(body[1].split()) == expected,
            'CapsRest interface changed; review the inventory scope')
    return sorted(set(range(row_count))-set(done))


def parse_grids(text, name):
    matches = re.findall(r'^def '+re.escape(name)+r'[^\n]*:=\s*(\[[^\n]*\])$', text, re.M)
    require(len(matches) == 1, f'Unsupported {name} declaration')
    literal = matches[0]
    pattern = r'\(\s*(\d+)\s*,\s*(\d+)\s*,\s*(\d+)\s*/\s*(\d+)\s*\)'
    grids = [[int(a), int(b), str(Q(int(c), int(d)))] for a, b, c, d in re.findall(pattern, literal)]
    require(re.sub(pattern, '', literal).replace(',', '').replace('[', '').replace(']', '').strip() == '',
            f'Unsupported expression in {name}')
    require(grids and all(a > 0 and b >= 4 and Q(h) > 0 for a, b, h in grids), 'Invalid grid dimensions')
    return grids


def recipe_metadata(recipe):
    require(isinstance(recipe, dict), 'Malformed anchored recipe')
    v0, factors = recipe.get('v0'), recipe.get('var')
    require(isinstance(v0, list) and len(v0) == 12 and isinstance(factors, list), 'Wrong recipe dimensions')
    require(all(isinstance(v, list) and len(v) == 12 for v in factors), 'Wrong variance-factor dimensions')
    for value in v0+[x for vector in factors for x in vector]:
        rational(value)
    return {'anchor_dimension': 12, 'variance_factors': len(factors),
            'scale': str(rational(recipe['scale'])), 'payload_sha256': payload_hash(recipe)}


def piece_metadata(node, grids):
    directions, pieces = node.get('ds'), node.get('pieces')
    require(isinstance(directions, list) and len(directions) == 3, 'Wrong piece direction count')
    for direction in directions:
        require(isinstance(direction, str) and len(direction.split(',')) == 12, 'Wrong direction dimensions')
        list(map(rational, direction.split(',')))
    require(isinstance(pieces, list) and pieces, 'Missing piece collection')
    counts, recipes = Counter(), set()
    for piece in pieces:
        nq = piece.get('nq')
        require(type(nq) is int, 'Invalid stored angular-grid identity')
        candidates = [i for i, grid in enumerate(grids) if grid[1] == nq]
        require(len(candidates) == 1, 'Missing or ambiguous stored piece grid')
        counts[candidates[0]] += 1
        encoded = piece.get('recipe')
        require(isinstance(encoded, str), 'Missing encoded piece recipe')
        parts = encoded.split('|')
        require(len(parts) >= 2, 'Malformed encoded piece recipe')
        metadata = recipe_metadata({'v0': parts[0].split(','),
                                    'var': [p.split(',') for p in parts[1:-1]], 'scale': parts[-1]})
        recipes.add(metadata['payload_sha256'])
        require(isinstance(piece.get('cons'), list) and piece['cons'], 'Missing piece constraints')
        for encoded_constraint in piece['cons']:
            fields = encoded_constraint.split(',')
            require(len(fields) == 6 and fields[0] in ('0', '1', '2') and fields[1] in ('+', '-'),
                    'Malformed piece constraint')
            for value in fields[2:]:
                if value != '*':
                    rational(value)
    return {'piece_count': len(pieces), 'unique_price_recipes': len(recipes),
            'directions_sha256': payload_hash(directions), 'payload_sha256': payload_hash(node),
            'stored_grids': [{'index': g, 'grid_spec': grids[g], 'piece_count': counts[g]} for g in sorted(counts)]}


def audit(rows, reference_tables, chords, pieces, recipes, anchored_grids, piece_grids):
    """Pure completeness/data-binding audit; recipe quality is never evaluated."""
    tables = [parse_nodes(row) for row in rows]
    require(len(reference_tables) == len(rows), 'Reference row count changed')
    for k, (table, reference) in enumerate(zip(tables, reference_tables)):
        require(table == [tuple(map(rational, pair)) for pair in reference],
                f'Row {k}: canonical radii/caps differ from the current refined source')
    validate_fixed_chords([{'table': table} for table in tables], chords, bind_generated=True)
    require(set(recipes) == set(ROWS), 'Missing or unexpected recipe row')
    by_piece = {}
    for node in pieces:
        k, i = node.get('k'), node.get('i')
        require(type(k) is int and k in ROWS and type(i) is int and 0 <= i < len(tables[k]),
                'Invalid piece-node identity')
        require((k, i) not in by_piece, 'Duplicate piece-node identity')
        require((rational(node['s']), rational(node['cap'])) == tables[k][i],
                f'Piece {k}:{i}: radius/cap mismatch')
        by_piece[k, i] = node
    result = []
    for k in ROWS:
        require(rows[k]['name'] == ROWS[k], f'Row {k}: canonical name changed')
        chord_nodes = {m for m, _, _ in chords[k]}
        vertices = set(range(len(tables[k])))-chord_nodes
        localised = {i for row, i in by_piece if row == k}
        require(localised <= vertices, f'Row {k}: piece identity is not an open vertex')
        indexed = {}
        for position, recipe in enumerate(recipes[k]):
            i = recipe.get('k')
            require(type(i) is int and 0 <= i < len(tables[k]), f'Row {k}: out-of-range recipe identity')
            require(i not in indexed, f'Row {k}: duplicate recipe identity')
            require(i in vertices, f'Row {k}: recipe is not an open vertex')
            require(rational(recipe['s']) == tables[k][i][0], f'Recipe {k}:{i}: radius mismatch')
            if 'cap' in recipe:
                require(rational(recipe['cap']) == tables[k][i][1], f'Recipe {k}:{i}: cap mismatch')
            g = recipe.get('g')
            require(type(g) is int and 0 <= g < len(anchored_grids), f'Recipe {k}:{i}: invalid grid identity')
            indexed[i] = (position, recipe, g, recipe_metadata(recipe))
        require(set(indexed) == vertices, f'Row {k}: missing vertex recipe identities')
        anchors = vertices-localised
        require(not anchors.intersection(localised) and anchors | localised == vertices,
                f'Row {k}: overlapping or missing obligations')
        piece_nodes, anchored = [], []
        for i in sorted(vertices):
            radius, cap = tables[k][i]
            common = {'k': k, 'i': i, 's': str(radius), 'cap': str(cap)}
            if i in localised:
                piece_nodes.append(dict(common, candidate_status='UNVERIFIED_PIECE_COLLECTION',
                                        **piece_metadata(by_piece[k, i], piece_grids)))
            else:
                position, recipe, g, metadata = indexed[i]
                anchored.append(dict(common, candidate_status='UNVERIFIED_ANCHORED_CANDIDATE',
                                     recipe_entry_index=position, grid_index=g, grid_spec=anchored_grids[g],
                                     recipe=metadata))
        result.append({'k': k, 'name': ROWS[k], 'canonical_nodes': len(tables[k]),
                       'chord_nodes': len(chord_nodes), 'open_vertices': len(vertices),
                       'piece_node_count': len(piece_nodes), 'anchored_candidate_count': len(anchored),
                       'piece_nodes': piece_nodes, 'anchored_candidates': anchored,
                       'recipe_records': len(indexed),
                       'recipe_source': f'data/caps-m/node-recipes/recM_{ROWS[k]}.json'})
    return result


def build_inventory(root=ROOT):
    if not __debug__:
        raise ValueError('Reject optimized Python: canonical source checks require assertions')
    root, snapshots = Path(root).resolve(strict=True), {}

    def read(name):
        path = (root/name).resolve(strict=True)
        require(path.is_relative_to(root) and path.is_file(), f'Input escapes repository: {name}')
        payload = path.read_bytes()
        snapshots[name] = payload
        return payload

    def document(name):
        return strict_json(read(name))

    rows = [document(f'data/lower-rows/row{k:02d}.json') for k in range(1, 20)]
    open_rows = parse_open_rows(read('Grothe/LowerAnalytic/CapNodes.lean').decode(), len(rows))
    require(open_rows == list(ROWS), 'Open-row scope changed; review the inventory')
    inherited_path = 'data/lower-unshifted/inputs/inherited.json'
    inherited = document(inherited_path)
    ledger = document('data/lower-unshifted/cover-ledger.json')
    require(hashlib.sha256(snapshots[inherited_path]).hexdigest() == ledger['source_sha256'][inherited_path],
            'Refined-cover source hash changed')
    chords = parse_chord_data(read('Grothe/LowerAnalytic/CapChordData.lean').decode())
    pieces = document('data/caps-m-pieces/pieces.json')
    recipes = {k: document(f'data/caps-m/node-recipes/recM_{label}.json') for k, label in ROWS.items()}
    anchored_grids = parse_grids(read('Grothe/LowerAnalytic/CapRecipeData.lean').decode(), 'capGrids')
    piece_grids = parse_grids(read('Grothe/LowerAnalytic/CapPieceRange.lean').decode(), 'pieceGrids')
    inventory = audit(rows, [row['table'] for row in inherited['rows']], chords, pieces, recipes,
                      anchored_grids, piece_grids)
    # This generator executes on import, so invoke only its read-only CLI mode.
    check = subprocess.run([sys.executable, '-B', str(root/'tools/gen_lower_data.py'), '--check'],
                           cwd=root, capture_output=True, text=True)
    require(check.returncode == 0, 'Canonical Lean row binding failed: '+(check.stdout+check.stderr)[-2000:])
    pins = ['tools/caps_rest_inventory.py', 'tools/caps_cover_sensitivity.py', 'tools/gen_lower_data.py',
            'tools/gen_cap_chords.py', 'tools/gen_cap_pieces.py', 'lean-toolchain',
            'Grothe/Lower/RowData.lean', 'Grothe/Lower/RowDataTypes.lean',
            'Grothe/LowerAnalytic/CapChords.lean', 'Grothe/LowerAnalytic/CapRows.lean',
            'Grothe/LowerAnalytic/CapPieceNodes.lean']
    pins += [f'Grothe/Lower/RowData{k:02d}.lean' for k in range(1, 20)]
    for name in pins:
        read(name)
    pad = re.findall(r'^def capPad : ℚ := ([\d /]+)$', snapshots['Grothe/Lower/RowDataTypes.lean'].decode(), re.M)
    require(len(pad) == 1, 'Unsupported capPad definition')
    pad_value = Q(re.sub(r'\s', '', pad[0]))
    require(pad_value == rational(inherited['pad']), 'capPad differs from the current refined-cover source')
    require(all((root/name).read_bytes() == payload for name, payload in snapshots.items()),
            'Inventory input changed during the audit')
    counts = {'open_vertices': sum(row['open_vertices'] for row in inventory),
              'piece_nodes': sum(len(row['piece_nodes']) for row in inventory),
              'pieces': sum(node['piece_count'] for row in inventory for node in row['piece_nodes']),
              'anchored_candidates': sum(len(row['anchored_candidates']) for row in inventory)}
    require(counts == {'open_vertices': 1258, 'piece_nodes': 358, 'pieces': 16719, 'anchored_candidates': 900},
            'Current preparation census changed; review the inventory')
    return {'format': 'caps-rest-inventory/v1', 'agent_id': 'codex-15b7',
            'status': 'PASS_PREPARATION_INVENTORY', 'scope': 'Rows12–15 open vertex obligations only.',
            'baseline_capPad': str(pad_value),
            'bindings': {'canonical_lean_row_modules_checked': len(rows),
                         'baseline_chords_checked': sum(map(len, chords)),
                         'refined_source': inherited_path,
                         'refined_source_sha256': hashlib.sha256(snapshots[inherited_path]).hexdigest()},
            'acceptance': 'No recipe, piece or node acceptance is proved by this inventory. '
                          'All anchored candidates remain unverified. No CapsRest wiring is generated.',
            'recipe_cap_binding': 'recM records have no cap field; exact caps come from canonical row data, '
                                  'bound to the unchanged hash-pinned refined-cover source.',
            'counts': counts, 'rows': inventory,
            'source_sha256': {name: hashlib.sha256(payload).hexdigest() for name, payload in sorted(snapshots.items())}}


def main(argv=None):
    if not __debug__:
        raise ValueError('Reject optimized Python: canonical source checks require assertions')
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=ROOT)
    parser.add_argument('--output', type=Path, default=OUTPUT)
    parser.add_argument('--check', action='store_true', help='Compare the existing inventory without writing')
    args = parser.parse_args(argv)
    root = args.root.resolve(strict=True)
    output = (root/args.output).resolve()
    require(output.is_relative_to(root/'data/caps-m/plan') and
            re.fullmatch(r'rest-inventory-[A-Za-z0-9_-]+\.json', output.name),
            'Only a rest-inventory JSON under data/caps-m/plan may be written')
    report = build_inventory(root)
    payload = (json.dumps(report, indent=2, sort_keys=True, allow_nan=False)+'\n').encode()
    if args.check:
        require(output.read_bytes() == payload, 'Inventory differs from current reproducible inputs')
    else:
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_bytes(payload)
    print(json.dumps({'status': report['status'], 'output': str(output.relative_to(root)), **report['counts']}))


if __name__ == '__main__':
    main()
