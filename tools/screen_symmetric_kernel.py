#!/usr/bin/env python3
"""FLOAT full-score screening using the original-noise replica kernel.

No coefficient fitting: |K(r)-c0*r-c1*r^3|/r^5 is a lower bound for
the omitted absolute tail. Consequently the displayed score is an UPPER
screen for one response column, never a certified achievable full score.
It cannot exclude using this column in a signed mixture with other columns.
All numbers here are floating discovery estimates, without error enclosures.
"""
import argparse
import json
from pathlib import Path

import numpy as np

from symmetric_cubic_response import basis, coeff
from symmetric_cubic_replicas import sample


def phase(B, c):
    v = B @ c
    return v / np.maximum(abs(v), 1e-300)


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--responses', type=Path, required=True)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--power', type=int, default=20)
    p.add_argument('--m', default='16,128')
    a = p.parse_args()
    selected = [r for r in json.loads(a.responses.read_text())
                if r['m'] in set(map(int, a.m.split(',')))]
    records = []
    for m in sorted({r['m'] for r in selected}):
        group = [r for r in selected if r['m'] == m]
        # Freeze the two distinct image polynomials from the discovery fit.
        # Independent scrambles for c0,c1 reduce product-estimation bias.
        for r in group:
            r['_images'] = [np.array([complex(*z) for z in cc])
                            for cc in r['two_branch_images']]
            r['_projections'] = []
            r['_kernels'] = []
        for seed in [11003, 21019]:
            B = basis(m, a.power, seed)
            for r in group:
                cf, cg = r['_images']
                r['_projections'].append((coeff(B, cf), coeff(B, cg)))
        for rho in [.5, .7, .85, .95, 1.]:
            # Use two independently scrambled evaluations and report both;
            # their spread is a diagnostic, NOT a rigorous error bound.
            values = [[] for _ in group]
            for seed in [31013, 41017]:
                B, C, _ = sample(m, rho, a.power, seed)
                for j, r in enumerate(group):
                    cf, cg = r['_images']
                    values[j].append(float(np.mean(
                        phase(B, cf).conj()*phase(C, cg)).real))
            for r, vv in zip(group, values):
                r['_kernels'].append({'rho':rho,'values':vv,'mean':sum(vv)/2})
        for r in group:
            (f0,g0),(f1,g1) = r['_projections']
            cc = (f0.conj()*g1 + f1.conj()*g0).real/2
            c0,c1 = float(cc[0]),float(cc[1:].sum())
            gates = []
            for k in r['_kernels']:
                rho = k['rho']
                tail = abs(k['mean']-c0*rho-c1*rho**3)/rho**5
                gates.append({**k,'tail_lower_screen':tail,
                              'full_score_upper_screen':c0-abs(c1)-tail})
            out = {'scope':__doc__,'m':m,'epsilon_used_to_find_response':r['epsilon'],
                   'power':a.power,'c0_cross_estimate':c0,'c1_cross_estimate':c1,
                   'degree_3_head_score_estimate':c0-abs(c1),'kernels':gates,
                   'full_score_upper_screen':min(k['full_score_upper_screen'] for k in gates),
                   'images':r['two_branch_images']}
            records.append(out)
            a.out.write_text(json.dumps(records,indent=2)+'\n')
            print(m,r['epsilon'],'head',c0-abs(c1),'full-score upper screen',
                  out['full_score_upper_screen'],flush=True)


if __name__ == '__main__':
    main()
