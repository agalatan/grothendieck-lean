#!/usr/bin/env python3
"""Necessary full-tail budget tests for a supplied response-column bank.

Input columns are [p,s3,s5,C1]. These can be estimates or certified data;
this floating LP is a numerical screen only. For complete real chaos
coefficients, the direct score is at most
p-|s3|-|s5|-|C1-p-s3-s5|. No assumption that these moments determine the
tail is made: the bound follows from Parseval and the triangle inequality.
"""
import argparse
import hashlib
import json
from pathlib import Path

import numpy as np
from scipy.optimize import linprog


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('columns', type=Path)
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    data = json.loads(args.columns.read_text())
    columns = np.array(data['columns_p_s3_s5_C1'], dtype=float)
    if columns.ndim != 2 or columns.shape[1] != 4 or not np.isfinite(columns).all():
        raise ValueError('Finite [p,s3,s5,C1] columns are required')
    n = len(columns)
    equalities = np.vstack([np.ones(n), columns[:, 1], columns[:, 2]])
    signed = columns[:, 3]-columns[:, 0]
    zero = linprog(signed, A_eq=equalities, b_eq=[1, 0, 0],
                   bounds=[(0, None)]*n, method='highs')
    zero_result = {'status': zero.message}
    if zero.success:
        zero_result.update(minimum_signed_tail=float(zero.fun),
                           weights=zero.x.tolist())
    rows = []
    residuals = [columns[:, 1], columns[:, 2],
                 columns[:, 3]-columns[:, 0]-columns[:, 1]-columns[:, 2]]
    for k, residual in enumerate(residuals):
        for sign in [1, -1]:
            row = np.r_[sign*residual, np.zeros(3)]
            row[n+k] = -1
            rows.append(row)
    relaxed = linprog(np.r_[-columns[:, 0], np.ones(3)],
                      A_ub=rows, b_ub=np.zeros(6),
                      A_eq=[np.r_[np.ones(n), np.zeros(3)]], b_eq=[1],
                      bounds=[(0, None)]*(n+3), method='highs')
    relaxation_result = {'status': relaxed.message}
    if relaxed.success:
        relaxation_result.update(score_upper_diagnostic=float(-relaxed.fun),
                                 weights=relaxed.x[:n].tolist(),
                                 absolute_penalties=relaxed.x[n:].tolist(),
                                 inequality_duals=relaxed.ineqlin.marginals.tolist())
    output = {'status': 'NUMERICAL_ONLY', 'scope': __doc__,
              'columns_p_s3_s5_C1': columns.tolist(),
              'zero_cubic_quintic_test': zero_result,
              'full_tail_necessary_score_relaxation': relaxation_result,
              'input_sha256': hashlib.sha256(args.columns.read_bytes()).hexdigest(),
              'source_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
    args.out.write_text(json.dumps(output, indent=2)+'\n')
    print(json.dumps({'status': output['status'], 'zero_test': zero_result,
                      'score_relaxation': relaxation_result}, indent=2))


if __name__ == '__main__':
    main()
