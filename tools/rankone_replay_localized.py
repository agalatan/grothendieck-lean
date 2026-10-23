#!/usr/bin/env python3
"""Replay a single localized cap node, then apply one common rank-one shift.

All Gaussian enclosures and acceptance arithmetic use the archived exact-int
engine. Floats choose positive rational cell prices only. This never evaluates
min_f max_piece by separately minimizing different pieces.
"""
import argparse
from fractions import Fraction as F
import hashlib
import json
from pathlib import Path
import sys
import time

REPO = Path(__file__).resolve().parents[1]
DEFAULT_TOOLS = REPO/'handoff/lower-stein/cert-0745d/tools'
sys.path.insert(0, str(DEFAULT_TOOLS))
sys.path.insert(0, str(Path(__file__).resolve().parent))
import exactint as X
from replay_midcaps_exact import cons_of, coverage, pf
from rankone_analytic_transport import row_geometry


def sha(p):
    return hashlib.sha256(p.read_bytes()).hexdigest()


def strings(x):
    if isinstance(x, F):
        return str(x)
    if isinstance(x, (list, tuple)):
        return [strings(y) for y in x]
    if isinstance(x, dict):
        return {k: strings(v) for k,v in x.items()}
    return x


def evalq(q, s):
    return q[0]+q[1]*s+q[2]*s*s


def ceil_grid(x, den=10**12):
    return F(-((-x.numerator*den)//x.denominator), den)


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact assertions must be enabled')
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--recipe', type=Path, default=REPO/'handoff/lower-stein/cert-0745d/midcaps/mc_a_0.855.json')
    ap.add_argument('--rowdir', type=Path, default=REPO/'handoff/lower-stein/cert-0745d')
    ap.add_argument('--momentdir', type=Path, default=DEFAULT_TOOLS)
    ap.add_argument('--node', type=int, default=28)
    ap.add_argument('--choice', default='m15')
    ap.add_argument('--f', default='-621/20000')
    ap.add_argument('--out', type=Path, required=True)
    args = ap.parse_args()
    start = time.monotonic()
    data = json.loads(args.recipe.read_text())
    nd = data['nodes'][args.node]
    assert coverage(nd)
    rowpath = args.rowdir/f"row_{data['t']}.json"
    row = json.loads(rowpath.read_text())
    th = list(map(F, row['theta']))
    eps = F(row['eps'])
    s = F(nd['s'])
    r = s/th[9]
    f = F(args.f)
    choicepath = REPO/f'handoff/research-third-decimal/attack-20261022/step22_mix_{args.choice}.json'
    choice = json.loads(choicepath.read_text())
    w = [F(str(x)) for x in choice['res']['cone']['w']]
    A, v, d, c, minor = row_geometry(th, eps, w)
    assert all(A[i] == th[9]*((F(1) if i == 0 else F(0))+th[10+i]) for i in range(3))
    extra = d*f*f+2*c*r*f
    report = dict(status='RUNNING', scope=__doc__, source_recipe=str(args.recipe.resolve()),
                  source_sha256=sha(args.recipe), node_index=args.node, source_s=str(s),
                  row=str(rowpath), row_sha256=sha(rowpath), choice=args.choice,
                  choice_sha256=sha(choicepath), physical_r=str(r), common_f=str(f),
                  v=list(map(str,v)), d=str(d), c=str(c), external_shift_cost=str(extra),
                  cone_minimum_principal_minor=str(minor), coverage_checked=True,
                  dependencies={p.name:sha(p) for p in [DEFAULT_TOOLS/'exactint.py', DEFAULT_TOOLS/'replay_midcaps_exact.py', DEFAULT_TOOLS/'moments_full.py']},
                  moment_sha256={}, pieces=[])
    args.out.parent.mkdir(parents=True, exist_ok=True)
    setups = {}
    for pi, p in enumerate(nd['pieces']):
        piece_start = time.monotonic()
        nq = p.get('nq', data['NQ'])
        if nq not in setups:
            momentpath = args.momentdir/f'moments_1600_{nq}.json'
            setups[nq] = X.ExactSetup(row, json.loads(momentpath.read_text()))
            report['moment_sha256'][str(momentpath)] = sha(momentpath)
        setup = setups[nq]
        PA, PB = setup.prices([pf(x) for x in p['anchor']],
                              [[pf(x) for x in fac] for fac in p['var']],
                              float(F(p.get('scale', '1'))))
        C, h, H = setup.integrate(PA, PB)
        Cu, hu, Hu, rho = X.upper(C, h, H)
        cons = cons_of(nd, p)
        oldq = X.piece_quadratic_multi(setup.Q, setup.a, Cu, hu, Hu, cons)
        assert oldq is not None
        effective_a = [setup.a[i]-(v[i]*f/s if i < 3 else F(0)) for i in range(12)]
        shiftedq = X.piece_quadratic_multi(setup.Q, effective_a, Cu, hu, Hu, cons)
        assert shiftedq is not None and shiftedq[3] == oldq[3]
        oldcap, shiftedcap = evalq(oldq, s), evalq(shiftedq, s)+extra
        entry = dict(index=pi, kind=p['kind'], NQ=nq,
                     old_quadratic=list(oldq[:3]), old_cap=oldcap,
                     shifted_quadratic=list(shiftedq[:3]), shifted_cap=shiftedcap,
                     minimum_LDL_pivot=oldq[3], loewner_rho=rho,
                     C_interval=C, h_interval=h, H_interval=H,
                     C_upper=Cu, h_rational=hu, H_upper=Hu,
                     seconds=round(time.monotonic()-piece_start,3))
        report['pieces'].append(strings(entry))
        args.out.write_text(json.dumps(report, indent=2)+'\n')
        print('PASS piece',pi,'NQ',nq,'old',float(oldcap),'shifted',float(shiftedcap),'sec',entry['seconds'],flush=True)
    old_max = max(F(p['old_cap']) for p in report['pieces'])
    new_max = max(F(p['shifted_cap']) for p in report['pieces'])
    source_cap = F(nd['cap'])
    assert old_max <= source_cap, ('Original source cap not reproduced',float(old_max-source_cap))
    report.update(status='PASS', source_cap=str(source_cap), old_max=str(old_max),
                  shifted_max=str(new_max), shifted_cap_rounded_up=str(ceil_grid(new_max)),
                  exact_gain_from_replayed_old=str(old_max-new_max),
                  exact_gain_from_stored_old=str(source_cap-new_max),
                  improvement=new_max<old_max, seconds=round(time.monotonic()-start,3),
                  remaining_hypotheses=[
                      'The elementary moment table enclosure theorems and source scalar/Gaussian/S-lemma/symmetry analysis are not formalized by this Python run.',
                      'The rank-one reduction identifying this shifted potential with a useful response bound must be justified separately.',
                      'This is one localized source node and one physical r; no complete row/envelope certificate is asserted.'
                  ])
    args.out.write_text(json.dumps(report,indent=2)+'\n')
    print('PASS localized node replay: sourcecap',float(source_cap),'oldmax',float(old_max),
          'newmax',float(new_max),'gain',float(old_max-new_max),'seconds',report['seconds'],flush=True)


if __name__ == '__main__':
    main()
