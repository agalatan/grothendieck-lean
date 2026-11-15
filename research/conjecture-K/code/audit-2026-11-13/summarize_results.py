#!/usr/bin/env python3
"""Collect completed numerical evidence without inventing missing results.
Agent-ID: codex-a713.
"""
import sys
sys.dont_write_bytecode=True
from pathlib import Path
import json,hashlib
ROOT=Path(__file__).resolve().parent


def records(path):
    return [json.loads(l) for l in path.read_text().splitlines()] if path.exists() else []


def main():
    status=[];values=[]
    for n in range(2,7):
        hs=ROOT/f'holdout_cv_peak_n{n}_summary.json'
        if not hs.exists():hs=ROOT/f'holdout_peak_n{n}_summary.json'
        held=json.loads(hs.read_text()) if hs.exists() else []
        vs=ROOT/f'validation_peak_n{n}_polar_p19_r8_summary.json'
        validation=json.loads(vs.read_text()) if vs.exists() else []
        for u in (.02,.03,.0463):
            tag=f'peak_n{n}_u{u:g}'
            initial={o['restart']:o for o in records(ROOT/f'optim_{tag}.jsonl')}
            refined={o['restart']:o for o in records(ROOT/f'optim_refined_{tag}.jsonl')}
            st=dict(n=n,u=u,complex_dimension=n*n*(n+1)//2,initial_starts=len(initial),
                 refined_starts=len(refined),refined_converged=sum(bool(o.get('converged')) for o in refined.values()),
                 independent_validations=sum(o['complete'] and o['u']==u for o in validation),
                 best_initial_training=max((o['R_train'] for o in initial.values()),default=None),
                 best_refined_training=max((o['R_train'] for o in refined.values()),default=None))
            status.append(st)
            for h in held:
                if h['u']==u and h['complete'] and '_polar_p19_r8_' in h.get('selection_source',''):
                    out=dict(h);out['search_status']=st
                    values.append(out)
    (ROOT/'EXPERIMENT_STATUS.json').write_text(json.dumps(status,indent=2)+'\n')
    (ROOT/'SELECTED_TENSORS.json').write_text(json.dumps(values,indent=2)+'\n')
    lines=['# Completed numerical results','',
      'Agent-ID: codex-a713. Numerical selected-candidate estimates, not global upper bounds.',
      'Intervals are approximate 95% randomized-QMC t intervals from eight independent scrambles.', '',
      '| n | u | Candidate R | SE | 95% half-width | Fourth excess (Wick formula) | Best Wick energy share |',
      '|---:|---:|---:|---:|---:|---:|---:|']
    for h in values:
        lines.append(f"| {h['n']} | {h['u']:g} | {h['R']:.9f} | {h['SE']:.2g} | {h['halfwidth95']:.2g} | {h['fourth_excess_exact_formula']:.5f} | {100*h['wick_overlap_squared']:.3f}% |")
    lines+=['','Full coefficients, index conventions, direction contents and shell decompositions are in',
      '[SELECTED_TENSORS.json]('+str(ROOT/'SELECTED_TENSORS.json')+').','',
      '| n | u | Initial starts | Continued starts | Intrinsically converged | Independently evaluated endpoints |',
      '|---:|---:|---:|---:|---:|---:|']
    for s in status:lines.append(f"| {s['n']} | {s['u']:g} | {s['initial_starts']} | {s['refined_starts']} | {s['refined_converged']} | {s['independent_validations']} |")
    (ROOT/'RESULTS.md').write_text('\n'.join(lines)+'\n')
    print(json.dumps({'initial_starts':sum(s['initial_starts'] for s in status),
         'refined_starts':sum(s['refined_starts'] for s in status),
         'validated_endpoints':sum(s['independent_validations'] for s in status),
         'holdout_cells':len(values)}))


if __name__=='__main__':main()
