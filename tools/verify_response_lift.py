#!/usr/bin/env python3
"""Standard-library exact replay of source-bound response-lift completions."""
import argparse
import hashlib
import json
from pathlib import Path
import sys
sys.path.insert(0, str(Path(__file__).resolve().parent))
from response_lift_model import targets, check_completion, controls


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('certificate', type=Path)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--orders', default='1,2')
    p.add_argument('--indices', default='')
    args = p.parse_args()
    data = json.loads(args.certificate.read_text())
    if hashlib.sha256(args.audit.read_bytes()).hexdigest() != data['source_sha256']:
        raise ValueError('Source audit hash mismatch')
    expected = {r['index']: targets(r) for r in json.loads(args.audit.read_text())['selected']}
    wanted_indices = set(map(int, args.indices.split(','))) if args.indices else set(expected)
    if not wanted_indices <= set(expected):
        raise ValueError('Requested contact missing from source audit')
    wanted = {(i, n) for i in wanted_indices for n in map(int, args.orders.split(','))}
    print(json.dumps(controls()))
    verified = []
    seen = set()
    for row in data['results']:
        key = (row['target']['index'], row['order'])
        if key in seen or expected.get(key[0]) != row['target']:
            raise ValueError('Duplicate case or source target mismatch')
        seen.add(key)
        result = check_completion(row)
        verified.append(result)
        print(json.dumps({'index': key[0], 'order': key[1], 'exact_minimum_penalty': '0',
                          'max_displayed_energy': max(x['energy_float'] for x in result['responses'])}))
    if not verified:
        raise ValueError('No exact completions checked')
    if seen != wanted:
        raise ValueError('The declared contact/order coverage is incomplete')
    print(f'PASS: {len(verified)} source-bound exact zero-penalty completions; no endpoint asserted.')


if __name__ == '__main__':
    main()
