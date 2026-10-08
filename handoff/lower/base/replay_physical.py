#!/usr/bin/env python3
"""Regenerate and verify all nine physical-potential certificates.

The unmodified upstream Python file is an external, SHA-256 pinned input.
All stored point bounds and physical polynomial constant terms are lifted
by exactly 1e-8. This is an explicit conservative replacement certificate.
No upstream proof gate is suppressed.
"""

if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use Python -O or -OO.')

import argparse, copy, hashlib, importlib.util, json, subprocess, sys, time
from concurrent.futures import ThreadPoolExecutor
from fractions import Fraction as Q
from pathlib import Path

SOURCE_SHA256 = '8c6105340cced0ee4b4d4977baab4c0d43f07466ce77e726eb1277b613473ac1'
LIFT = Q(1, 10**8)

def load_source(path):
    assert hashlib.sha256(path.read_bytes()).hexdigest() == SOURCE_SHA256
    spec = importlib.util.spec_from_file_location('upstream_lower', path)
    v = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(v)
    return v

def verify(source, folder):
    assert __debug__, 'Assertions are proof gates; do not use python -O'
    assert sys.float_info.radix == 2 and sys.float_info.mant_dig == 53
    assert sys.float_info.max_exp == 1024
    v = load_source(source)
    folder.mkdir(parents=True, exist_ok=True)
    started = time.time()
    print('SOURCE_SHA256', SOURCE_SHA256, flush=True)
    print('EXPLICIT_POINT_AND_POLYNOMIAL_LIFT', LIFT, flush=True)
    v.verify_symbolic_cubic_algebra()
    v.verify_elementary_constants()
    cpp = folder / 'residual.cpp'
    cpp.write_text(v.CPP_RESIDUAL)
    program = folder / 'residual'
    subprocess.run(['g++','-O3','-std=c++17','-fno-fast-math','-ffp-contract=off',
                    str(cpp),'-o',str(program)], check=True)
    grids, texts, report = {}, {}, []
    groups = copy.deepcopy(v.DATA)
    for group in groups:
        assert group['kind'] == 'residual_chord'
        p = group['profile']
        v.profile_gate(p)
        tasks = []
        for pool in group['pools']:
            key = (pool['radial_step'], pool['theta_cells'], pool['radial_end'])
            if key not in grids:
                grids[key] = v.generate(Q(key[0]), int(key[1]), Q(key[2]))
                texts[key] = v.moment_text(grids[key])
                print('PASS exact Gaussian moments', key, flush=True)
            tasks.extend((pool, recipe, grids[key], texts[key]) for recipe in pool['prices'])
        def worker(task):
            return v.replay_price(p, *task, program)
        with ThreadPoolExecutor(max_workers=4) as executor:
            qs = list(executor.map(worker, tasks))
        excess = max(v.value(qs[pt['recipe']], Q(pt['r']))-Q(pt['cap'])
                     for pt in group['points'])
        assert excess <= LIFT, (p['id'], excess)
        for pt in group['points']:
            pt['cap'] = str(Q(pt['cap']) + LIFT)
        for poly in group['polynomials']:
            poly['coefficients'][0] = str(Q(poly['coefficients'][0]) + LIFT)
        supports = v.make_supports(group, qs)
        polynomials = [v.verify_physical_polynomial(poly, supports)
                       for poly in group['polynomials']]
        group['C_cap'] = str(Q(group['C_cap']) + LIFT)
        v.verify_rectangles(group, polynomials)
        report.append(dict(id=p['id'], maximum_original_cap_excess=str(excess),
            lift=str(LIFT), prices=len(qs), polynomials=len(polynomials),
            rectangles=len(group['rectangles'])))
        print('PASS', p['id'], len(qs), 'price certificates;',len(polynomials),
              'global majorants;',len(group['rectangles']),'moment rectangles',flush=True)
    bound, intervals = v.verify_final_intervals(groups)
    result = dict(groups=report, norm_upper=str(bound), intervals=intervals,
                  elapsed_seconds=time.time()-started, source_sha256=SOURCE_SHA256)
    (folder/'physical-replay-result.json').write_text(json.dumps(result,indent=2)+'\n')
    print('ALL PHYSICAL CERTIFICATE GATES PASSED',flush=True)
    return v

def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source',type=Path,required=True)
    p.add_argument('--workdir',type=Path,required=True)
    a = p.parse_args()
    verify(a.source.resolve(),a.workdir.resolve())

if __name__ == '__main__':
    main()
