#!/usr/bin/env python3
"""Prepare six exact-matrix exports, using the committed CapExport functions.

Agent-ID: codex-15b7. No certificate or source-math changes are made.
"""
import argparse
import hashlib
import json
import re
from pathlib import Path


def digest(data):
    return hashlib.sha256(data).hexdigest()


def generate(output):
    root = Path(__file__).resolve().parents[2]
    export_path = root / 'Grothe/LowerAnalytic/CapExport.lean'
    original = export_path.read_bytes()
    old_import = 'import Grothe.LowerAnalytic.CapPieceNodes\n'
    source = original.decode()
    if not source.startswith(old_import):
        raise ValueError('unexpected canonical CapExport import; inspect before adapting')
    # Copy every computational definition verbatim; only replace the proof import.
    body = source[len(old_import):]
    output = output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    manifest = {'agent_id': 'codex-15b7', 'scope': 'diagnostic exact matrices only',
                'canonical_export_sha256': digest(original),
                'canonical_export_body_sha256': digest(body.encode()), 'jobs': []}
    for node in (186, 204):
        data_rel = f'Grothe/LowerAnalytic/CapPieces/D12x{node}.lean'
        data_bytes = (root / data_rel).read_bytes()
        encoded = [json.JSONDecoder().raw_decode(line.lstrip())[0]
                   for line in data_bytes.decode().splitlines()
                   if re.match(r'^\s+"[0-9]+;', line)]
        for piece in (1, 2, 3):
            grid = int(encoded[piece].split(';', 1)[0])
            if grid != 2:
                raise ValueError(f'unexpected grid for {node}:{piece}: {grid}')
            stem = f'Export{node}Piece{piece}'
            destination = output / (stem + '.jsonl')
            code = ('import Grothe.LowerAnalytic.CapPieceRange\n'
                    f'import Grothe.LowerAnalytic.CapPieces.D12x{node}\n' + body +
                    '\nopen Grothe.LowerAnalytic\n'
                    f'#eval (do\n'
                    f'  let path := {json.dumps(str(destination))}\n'
                    '  if ← System.FilePath.pathExists path then\n'
                    '    throw (IO.userError "diagnostic output already exists; preserve it")\n'
                    f'  exportPieces path pieceNode_12x{node} [{piece}]\n'
                    '  : IO Unit)\n')
            (output / (stem + '.lean')).write_text(code)
            manifest['jobs'].append({'node': node, 'piece': piece, 'grid': grid,
                                     'source': stem + '.lean', 'output': str(destination),
                                     'source_sha256': digest(code.encode()),
                                     'data_path': data_rel,
                                     'data_sha256': digest(data_bytes),
                                     'piece_encoding_sha256': digest(encoded[piece].encode())})
    (output / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n')
    return manifest


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('output', type=Path, help='new dedicated absolute output directory')
    args = parser.parse_args()
    manifest = generate(args.output)
    print(f"generated {len(manifest['jobs'])} exact-matrix exporters in {args.output.resolve()}")
