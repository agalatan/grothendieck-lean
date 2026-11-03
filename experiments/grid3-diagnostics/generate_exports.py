#!/usr/bin/env python3
"""Prepare diagnostic exact-matrix exports using the committed CapExport functions.

Agent-ID: codex-15b7. No certificate or source-math changes are made.
"""
import argparse
import hashlib
import json
import re
from fractions import Fraction
from pathlib import Path


ROW12_INPUTS = {
    'row12.json': 'ec298c5a67a3a5809a45c45f2d2217024f30d5eb2bf59139febcf63a12de13f4',
    'row12-pieces.json': 'f3956d00e65917f2c1cc895d9fc283c02403d3234c30d5ed2376bf51d22e42e8',
    'row12-selection.json': 'fee1d8784d19b7761f9522a558d1e48d49a704bd56c8878157f02d0570c48f76',
}
KNOWN_FAILED_NODES = tuple(range(183, 213)) + (215,)
COMPLETED_SIX = frozenset((node, piece) for node in (186, 204) for piece in (1, 2, 3))


def digest(data):
    return hashlib.sha256(data).hexdigest()


def encoded_pieces(data_bytes):
    return [json.JSONDecoder().raw_decode(line.lstrip())[0]
            for line in data_bytes.decode().splitlines()
            if re.match(r'^\s+"[0-9]+;', line)]


def has_centre_interval(piece):
    """Select the two-sided interval itself, independently of its multipliers."""
    for constraint in piece['cons']:
        fields = constraint.split(',')
        if len(fields) != 6:
            raise ValueError('unexpected constraint encoding')
        if (fields[3] != '*' and Fraction(fields[2]) == Fraction(-3, 1000)
                and Fraction(fields[3]) == Fraction(3, 1000)):
            return True
    return False


def known_failure_jobs(root):
    """Read the pinned source data; this selects candidates, not false verdicts."""
    input_dir = Path('data/caps-m/plan/row-certificates')
    inputs, hashes = {}, {}
    for name, expected in ROW12_INPUTS.items():
        path = input_dir / name
        data = (root / path).read_bytes()
        actual = digest(data)
        if actual != expected:
            raise ValueError(f'changed diagnostic input: {path}; expected {expected}, got {actual}')
        inputs[name] = json.loads(data)
        hashes[str(path)] = actual
    plan, selection = inputs['row12.json'], inputs['row12-selection.json']
    if plan['row'] != 12 or plan['capPad'] != '1/100000000000' or plan['cap_up'] != '0':
        raise ValueError('unexpected row or cap in pinned plan')
    for key, name in (('pieces', 'row12-pieces.json'), ('selection', 'row12-selection.json')):
        if plan['outputs'][key] != {'file': name, 'sha256': ROW12_INPUTS[name]}:
            raise ValueError(f'plan does not bind {name}')
    nodes = {(node['k'], node['i']): node for node in inputs['row12-pieces.json']}
    centres = {}
    for centre in plan['centres']:
        row, node, original_piece = map(int, centre['key'].split(':'))
        if original_piece != centre['original_piece_index']:
            raise ValueError('inconsistent original centre index')
        output_piece = centre['output_piece_index']
        if (type(output_piece) is not int or not 0 <= output_piece < centre['piece_count']
                or centre['piece_count'] != len(nodes[row, node]['pieces'])):
            raise ValueError('inconsistent output centre index')
        if (row, node) in centres:
            raise ValueError('duplicate centre node')
        centres[row, node] = output_piece

    jobs, data_sources, skipped = [], {}, []
    for node in KNOWN_FAILED_NODES:
        source = nodes[12, node]
        chosen = selection[f'12:{node}']
        grids = chosen['grids']
        if chosen['excl'] or len(grids) != len(source['pieces']):
            raise ValueError(f'unexpected exclusions or piece count at 12:{node}')
        data_rel = f'Grothe/LowerAnalytic/CapPieces/D12x{node}.lean'
        data_bytes = (root / data_rel).read_bytes()
        encoded = encoded_pieces(data_bytes)
        expected = [f"{grid};{piece['recipe']};" + ';'.join(piece['cons'])
                    for grid, piece in zip(grids, source['pieces'])]
        header = re.search(r'\(12, (\d+), (\[.*\]), \[\n', data_bytes.decode())
        if (encoded != expected or header is None or int(header[1]) != node
                or json.loads(header[2]) != source['ds']):
            raise ValueError(f'D module differs from pinned recipes or directions: {data_rel}')
        hashes[data_rel] = digest(data_bytes)
        data_sources[node] = (data_rel, data_bytes, encoded)
        centre_piece = centres[12, node]
        skipped.append({'node': node, 'piece': centre_piece})
        for piece, original in enumerate(source['pieces']):
            if (piece == centre_piece or (node, piece) in COMPLETED_SIX
                    or not has_centre_interval(original)):
                continue
            grid = grids[piece]
            if type(grid) is not int or grid not in (1, 2):
                raise ValueError(f'unexpected candidate grid at 12:{node}:{piece}: {grid}')
            jobs.append((node, piece))
    metadata = {
        'mode': 'known-failed-nodes-centre-interval-neighbours',
        'selection_rule': 'noncentre piece with a two-sided [-3/1000, 3/1000] constraint',
        'candidate_verdicts': 'unmeasured; a failing node does not imply every candidate is false',
        'known_failed_nodes': list(KNOWN_FAILED_NODES),
        'skipped_planned_centres': skipped,
        'excluded_completed_six': [{'node': n, 'piece': p} for n, p in sorted(COMPLETED_SIX)],
        'input_sha256': hashes,
    }
    return jobs, data_sources, metadata


def generate(output, known_failures=False):
    root = Path(__file__).resolve().parents[2]
    export_path = root / 'Grothe/LowerAnalytic/CapExport.lean'
    original = export_path.read_bytes()
    old_import = 'import Grothe.LowerAnalytic.CapPieceNodes\n'
    source = original.decode()
    if not source.startswith(old_import):
        raise ValueError('unexpected canonical CapExport import; inspect before adapting')
    # Copy every computational definition verbatim; only replace the proof import.
    body = source[len(old_import):]
    if known_failures:
        jobs, data_sources, metadata = known_failure_jobs(root)
    else:
        jobs = [(node, piece) for node in (186, 204) for piece in (1, 2, 3)]
        data_sources, metadata = {}, {}
    output = output.resolve()
    output.mkdir(parents=True, exist_ok=False)
    manifest = {'agent_id': 'codex-15b7', 'scope': 'diagnostic exact matrices only',
                'canonical_export_sha256': digest(original),
                'canonical_export_body_sha256': digest(body.encode()), 'jobs': []}
    manifest.update(metadata)
    for node, piece in jobs:
        data_rel = f'Grothe/LowerAnalytic/CapPieces/D12x{node}.lean'
        if node not in data_sources:
            data_bytes = (root / data_rel).read_bytes()
            data_sources[node] = (data_rel, data_bytes, encoded_pieces(data_bytes))
        data_rel, data_bytes, encoded = data_sources[node]
        grid = int(encoded[piece].split(';', 1)[0])
        if not known_failures and grid != 2:
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
    parser.add_argument('--known-failures', action='store_true',
                        help='export only remaining centre-interval neighbours of the 31 failed row12 nodes')
    args = parser.parse_args()
    manifest = generate(args.output, known_failures=args.known_failures)
    print(f"generated {len(manifest['jobs'])} exact-matrix exporters in {args.output.resolve()}")
