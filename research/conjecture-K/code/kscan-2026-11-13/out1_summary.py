#!/usr/bin/env python3
"""Summarise the kscan outputs (out1/*.jsonl, out2/*.jsonl) without the coefficient vectors.

Written on 15 November 2026 (claude-b9ee) to keep a small record of pass 1, whose 180 output files (3.6 MB) stay
outside the repository. Usage: out1_summary.py OUT1_DIR OUT2_DIR OUTPUT.json
Each input line is one optimiser run: row, n, u, seed, rs (restart), opt (training objective at the end point),
R (ratio C^2/D re-evaluated on fresh samples), se (its jackknife error), D, d4 (fourth excess), split, iters, secs,
c_re, c_im (coefficients; dropped here).
"""
import glob
import json
import os
import sys


def load(d):
    runs = []
    for p in sorted(glob.glob(os.path.join(d, '*.jsonl'))):
        for ln in open(p):
            ln = ln.strip()
            if not ln:
                continue
            r = json.loads(ln)
            runs.append({k: r[k] for k in ('row', 'n', 'u', 'seed', 'rs', 'opt', 'R', 'se', 'D', 'd4', 'iters', 'secs')
                         if k in r} | {'file': os.path.basename(p)})
    return runs


def cells(runs):
    out = {}
    for r in runs:
        out.setdefault((r['n'], r['u']), []).append(r)
    res = []
    for (n, u), rs in sorted(out.items()):
        best = max(rs, key=lambda x: x['R'])
        res.append({
            'n': n, 'u': u, 'runs': len(rs),
            'best_R': best['R'], 'best_R_se': best['se'], 'best_R_fourth_excess': best['d4'],
            'best_R_training_objective': best['opt'], 'best_R_file': best['file'], 'best_R_restart': best['rs'],
            'min_R': min(x['R'] for x in rs),
            'max_training_objective': max(x['opt'] for x in rs),
            'min_se': min(x['se'] for x in rs), 'max_se': max(x['se'] for x in rs),
        })
    return res


def main():
    out1, out2, dest = sys.argv[1:4]
    r1, r2 = load(out1), load(out2)
    doc = {
        '_note': ('Generated on 2026-11-15 from the kscan outputs of 13 Nov 2026 by dropping the coefficient vectors '
                  '(c_re, c_im) and the split vectors. R is the ratio C^2/D re-evaluated on fresh samples, se its '
                  'jackknife error, opt the training objective at the end point (biased upward: it is fitted to the '
                  'training sample). Floating-point Monte Carlo; candidate values, not bounds.'),
        '_source_out1': out1, '_source_out2': out2,
        'pass1_runs': len(r1), 'pass1_cells': cells(r1),
        'pass2_runs': len(r2), 'pass2_cells': cells(r2),
        'pass2_all_runs': sorted(({k: r[k] for k in ('n', 'u', 'seed', 'rs', 'opt', 'R', 'se', 'd4', 'file')}
                                  for r in r2), key=lambda x: (x['n'], x['seed'], x['rs'])),
    }
    with open(dest, 'w') as f:
        json.dump(doc, f, indent=1)
        f.write('\n')
    for c in doc['pass1_cells']:
        print(f"pass1 n={c['n']:>2} u={c['u']:<7} runs={c['runs']:>3} best R={c['best_R']:.4f} +-{c['best_R_se']:.4f} "
              f"d4={c['best_R_fourth_excess']:.1f}")
    for c in doc['pass2_cells']:
        print(f"pass2 n={c['n']:>2} u={c['u']:<7} runs={c['runs']:>3} R in [{c['min_R']:.4f}, {c['best_R']:.4f}]")


if __name__ == '__main__':
    main()
