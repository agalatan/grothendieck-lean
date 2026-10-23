#!/usr/bin/env python3
"""Independent numerical holdouts for explicit rational quintic phases.

No fitting occurs here. The finite Gaussian Mehler error is rigorous under
the separate paper proof; the Sobol integration errors remain uncertified.
Run heavy holdouts only in the task's own droplet directory.
Real spectra are realized by equal mixing with conjugation-reflected pairs.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys

import numpy as np

sys.path.insert(0, str(Path(__file__).resolve().parent))
from quintic_local_oracle import evaluate, features, grouped, known_phase_z


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', type=Path)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--logn', type=int, default=20)
    parser.add_argument('--scrambles', type=int, default=3)
    args = parser.parse_args()
    data = json.loads(args.input.read_text())
    eps, gamma = float(Q(data['epsilon'])), float(Q(data['gamma']))
    records = []
    for row in data['profiles']:
        record = {'label': row['label']}
        for name in ['f_numerator', 'g_numerator']:
            record[name] = [[float(Q(a)), float(Q(b))] for a, b in row[name]]
        records.append(record)
    output = {'status': 'NUMERICAL_ONLY', 'scope': __doc__,
              'input_sha256': hashlib.sha256(args.input.read_bytes()).hexdigest(),
              'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
              'oracle_source_sha256': hashlib.sha256(Path(__file__).with_name('quintic_local_oracle.py').read_bytes()).hexdigest(),
              'epsilon': data['epsilon'], 'gamma': data['gamma'],
              'finite_m': data['finite_m'], 'holdout_logN': args.logn,
              'profiles': data['profiles'], 'holdouts': []}
    for j in range(args.scrambles):
        seed = 9202026+j
        phi = features(args.logn, seed)
        results = []
        for record in records:
            result = evaluate(phi, record)
            result['label'] = record['label']
            result['score'] = float(np.dot(result['control_column_p_s3_s5'], [1, -eps, gamma]))
            results.append(result)
        output['holdouts'].append({'seed': seed, 'evaluations': results})
    control = grouped(known_phase_z(), known_phase_z())
    output['phase_Z_expression'] = 'pi/4-epsilon*pi/32+gamma*3*pi/256'
    output['phase_Z_value'] = float(np.dot(control, [1, -eps, gamma]))
    args.out.write_text(json.dumps(output, indent=2)+'\n')
    print(json.dumps({'status': output['status'], 'phase_Z': output['phase_Z_value'],
                      'scores': [[r['score'] for r in h['evaluations']] for h in output['holdouts']]}, indent=2))


if __name__ == '__main__':
    main()
