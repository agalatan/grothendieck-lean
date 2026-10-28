#!/usr/bin/env python3
"""Generate/check source-bound q0 Wick chunk candidates.

All candidate values are untrusted until the generated Lean proofs and their
assembly compile. The --check mode performs no filesystem writes.
"""
import argparse
from fractions import Fraction
from hashlib import sha256
import json
from pathlib import Path
import re
import subprocess
import sys

# Importing the helper must not create __pycache__ in --check mode.
sys.dont_write_bytecode = True
from q0_source_chunks import emit_chunk

DEFAULT_ROOT = Path(__file__).resolve().parents[1]
BASE_SIZE = 8
MAX_RAW = 550


def read_inputs(root: Path, source_json: Path):
    source_path = root / 'Grothe/Upper/Data.lean'
    source_bytes = source_path.read_bytes()
    source = source_bytes.decode('utf-8')
    block = source.split('def phaseStrs : List String :=', 1)[1].split('/--', 1)[0]
    parsed = re.findall(r'"(\d+),(\d+),(\d+):([^\"]+)"', block)
    if len(parsed) != 1140:
        raise ValueError(f'expected 1140 source terms, found {len(parsed)}')
    terms = [(int(a), int(b), int(c), Fraction(d)) for a, b, c, d in parsed]

    data = json.loads(source_json.read_text(encoding='utf-8'))
    den = data['sourceDen']
    if type(den) is not int:
        raise ValueError('sourceDen must be a JSON integer (not a string or boolean)')
    if den <= 0:
        raise ValueError('sourceDen must be positive')
    literal_path = root / 'Grothe/UpperChaos/Q0LiteralSourceData.lean'
    literal = literal_path.read_text(encoding='utf-8')
    match = re.search(r'^def sourceDen : Nat := (\d+)$', literal, re.M)
    if not match or int(match[1]) != den:
        raise ValueError('canonical Lean sourceDen differs from JSON input')
    marker = 'def sourceCoefficients : List (List (List Int)) := '
    body = literal.split(marker, 1)[1].split('\n\nend ', 1)[0]
    coefficients = data['sourceCoefficients']
    if (not isinstance(coefficients, list) or
        any(not isinstance(plane, list) or
            any(not isinstance(row, list) or
                any(type(value) is not int for value in row) for row in plane)
            for plane in coefficients)):
        raise ValueError('sourceCoefficients must be nested lists of JSON integers')
    if json.loads(body) != coefficients:
        raise ValueError('canonical Lean sourceCoefficients differ from JSON input')
    return terms, den, sha256(source_bytes).hexdigest()


def raw_count(terms, offset, count):
    return sum((c + 1) * ((2 * b + c + 2) // 2 + 1)
               for _, b, c, _ in terms[offset:offset + count])


def partition(terms):
    chunks = []

    def split(offset, count):
        n = raw_count(terms, offset, count)
        if n <= MAX_RAW:
            chunks.append((offset, count, n))
        elif count == 1:
            raise ValueError(f'one source term at {offset} exceeds {MAX_RAW}')
        else:
            first = count // 2
            split(offset, first)
            split(offset + first, count - first)

    for offset in range(0, len(terms), BASE_SIZE):
        split(offset, min(BASE_SIZE, len(terms) - offset))
    next_offset = 0
    for offset, count, _ in chunks:
        if offset != next_offset or count <= 0:
            raise AssertionError('partition has a gap or overlap')
        next_offset += count
    if next_offset != len(terms):
        raise AssertionError('partition does not cover source')
    return chunks


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--root', type=Path, default=DEFAULT_ROOT,
                        help='repository root (default: parent of tracked tools/)')
    parser.add_argument('--source-json', type=Path,
                        default=Path('data/q0_quadrature/source-polynomial.json'),
                        help='canonical candidate source JSON, absolute or relative to root')
    parser.add_argument('--check', action='store_true',
                        help='compare expected bytes without modifying files')
    args = parser.parse_args()
    root = args.root.resolve()
    json_path = args.source_json
    if not json_path.is_absolute():
        json_path = root / json_path
    terms, denominator, source_hash = read_inputs(root, json_path)
    chunks = partition(terms)
    targets = root / 'Grothe/UpperChaos'
    mismatches = []
    expected_names = set()
    files = 0
    for offset, count, expected_raw in chunks:
        rendered, actual_raw, _ = emit_chunk(terms, denominator, offset, count, source_hash)
        if actual_raw != expected_raw:
            raise AssertionError(f'raw count disagreement at offset {offset}')
        for name, content in rendered.items():
            path = targets / name
            expected = content.encode('utf-8')
            files += 1
            expected_names.add(name)
            if args.check:
                if not path.is_file() or path.read_bytes() != expected:
                    mismatches.append(name)
            else:
                path.write_bytes(expected)
    if args.check:
        # Inspect only shipped or staged files. Untracked local experiments are
        # intentionally ignored; a tracked legacy chunk must be removed or
        # incorporated in the current recipe before the check can pass.
        tracked = subprocess.check_output([
            'git', '-C', str(root), 'ls-files', '-z', '--',
            'Grothe/UpperChaos/Q0Chunk_o*.lean',
            'Grothe/UpperChaos/Q0ChunkDen_o*.lean',
        ], text=True).split('\0')
        stale = sorted(Path(name).name for name in tracked
                       if name and Path(name).name not in expected_names)
        mismatches.extend(f'stale tracked output: {name}' for name in stale)
    if mismatches:
        for name in mismatches:
            print(f'missing or changed: {name}', file=sys.stderr)
        raise SystemExit(1)
    action = 'verified' if args.check else 'wrote'
    print(f'{action} {files} Lean files from {len(chunks)} chunks; source sha256 {source_hash}')


if __name__ == '__main__':
    main()
