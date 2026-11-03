#!/usr/bin/env python3
"""Export exact matrices for the known-failing Row14×280 range slices.

Agent-ID: codex-15b7. Research only; no certificate or mathematical changes.
"""
import argparse
import hashlib
import json
import re
from pathlib import Path


SCOPE_SHA = '935757b21666861c80095cef7971b6c13bd5eb95ecef6b07fa23b24353d50b07'


def digest(data):
    return hashlib.sha256(data).hexdigest()


def require(ok, message):
    if not ok:
        raise ValueError(message)


def generate(output):
    root = Path(__file__).resolve().parents[2]
    scope_path = Path(__file__).with_name('row14-failed-range-scope.json')
    scope_bytes = scope_path.read_bytes()
    require(digest(scope_bytes) == SCOPE_SHA, 'scope changed; inspect the new native failure evidence')
    scope = json.loads(scope_bytes)
    for name, expected in {**scope['baseline_files_sha256'], **scope['computation_files_sha256']}.items():
        require(digest((root / name).read_bytes()) == expected, 'pinned source changed: ' + name)
    require((scope['row'], scope['node']) == (14, 280), 'unexpected target')
    pieces = []
    for name in scope['range_modules']:
        match = re.search(r'pieceRangeOK pieceNode_14x280 (\d+) (\d+) = true', (root / name).read_text())
        require(match is not None, 'unrecognized range statement')
        lo, hi = map(int, match.groups())
        require(hi - lo == 4, 'range size changed')
        pieces.extend(range(lo, hi))
    require(pieces == scope['candidate_pieces'] and len(set(pieces)) == len(pieces) == 64,
            'candidate census changed')
    data_root = root / 'data/caps-m/plan/row-certificates'
    plan = json.loads((data_root / 'row14.json').read_text())
    nodes = json.loads((data_root / 'row14-pieces.json').read_text())
    selection = json.loads((data_root / 'row14-selection.json').read_text())
    require(plan['row'] == 14 and plan['capPad'] == '1/100000000000' and plan['cap_up'] == '0',
            'plan row/cap/padding differs')
    for key, name in [('pieces', 'row14-pieces.json'), ('selection', 'row14-selection.json')]:
        require(plan['outputs'][key] == {'file': name, 'sha256': digest((data_root / name).read_bytes())},
                'plan does not bind ' + name)
    source = next(n for n in nodes if (n['k'], n['i']) == (14, 280))
    chosen = selection['14:280']
    require(not chosen['excl'] and len(chosen['grids']) == len(source['pieces']), 'selection differs')
    centres = [c for c in plan['centres'] if c['key'].startswith('14:280:')]
    require(len(centres) == 1 and type(centres[0]['output_piece_index']) is int, 'centre identity differs')
    require(centres[0]['output_piece_index'] not in pieces, 'protected centre selected')
    require(not set(pieces) & {5, 98, 103}, 'already repaired piece selected')
    data_name = 'Grothe/LowerAnalytic/CapPieces/D14x280.lean'
    data = (root / data_name).read_bytes()
    encoded = [json.JSONDecoder().raw_decode(line.lstrip())[0] for line in data.decode().splitlines()
               if re.match(r'^\s+"[0-9]+;', line)]
    expected = [f"{grid};{piece['recipe']};" + ';'.join(piece['cons'])
                for grid, piece in zip(chosen['grids'], source['pieces'])]
    header = re.search(r'\(14, 280, (\[.*\]), \[\n', data.decode())
    require(encoded == expected and header is not None and json.loads(header[1]) == source['ds'],
            'D module does not match recipe/directions/ordered constraints')
    for j in pieces:
        require(digest(encoded[j].encode()) == scope['checked_tree_piece_sha256'][str(j)],
                'piece differs from the native failure tree')
    original = (root / 'Grothe/LowerAnalytic/CapExport.lean').read_text()
    proof_import = 'import Grothe.LowerAnalytic.CapPieceNodes\n'
    require(original.startswith(proof_import), 'canonical exporter import changed')
    body = original[len(proof_import):]
    require(output.is_absolute(), 'use a new absolute output directory')
    output = output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    manifest = {'agent_id': 'codex-15b7', 'scope': scope, 'scope_sha256': SCOPE_SHA,
                'canonical_export_sha256': digest(original.encode()),
                'canonical_export_body_sha256': digest(body.encode()), 'jobs': []}
    for j in pieces:
        stem = f'Export14x280Piece{j}'
        destination = output / (stem + '.jsonl')
        code = ('import Grothe.LowerAnalytic.CapPieceRange\n'
                'import Grothe.LowerAnalytic.CapPieces.D14x280\n' + body +
                '\nopen Grothe.LowerAnalytic\n#eval (do\n'
                f'  let path := {json.dumps(str(destination))}\n'
                '  if ← System.FilePath.pathExists path then\n'
                '    throw (IO.userError "diagnostic output already exists; preserve it")\n'
                f'  exportPieces path pieceNode_14x280 [{j}]\n  : IO Unit)\n')
        (output / (stem + '.lean')).write_text(code)
        manifest['jobs'].append({'row': 14, 'node': 280, 'piece': j, 'grid': chosen['grids'][j],
            'source': stem + '.lean', 'source_sha256': digest(code.encode()), 'output': str(destination),
            'data_path': data_name, 'data_sha256': digest(data),
            'piece_encoding_sha256': digest(encoded[j].encode())})
    (output / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    return manifest


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('output', type=Path, help='new absolute output directory')
    args = parser.parse_args()
    print(f"generated {len(generate(args.output)['jobs'])} diagnostic exporters")
