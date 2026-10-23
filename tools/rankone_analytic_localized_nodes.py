#!/usr/bin/env python3
"""Merge fresh localized-piece caps into the explicit rank-one source nodes.

The exact bivariate piece quadratics are valid globally in physical r. At each
node, float candidates propose ONE common rational scalar f; all pieces are then
evaluated exactly and their maximum is rounded UP. No Gaussian integration is
repeated; the freshly replayed localized-majorant file is hash-pinned.
"""
import argparse
from fractions import Fraction as F
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from rankone_analytic_localized import propose_scalar
from rankone_analytic_transport import ceil_grid,canonical,qeval,sha
from rankone_analytic_nodes import load_bank,build


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact acceptance requires assertions')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    ap.add_argument('--base',type=Path,required=True)
    ap.add_argument('--localized',type=Path,required=True)
    ap.add_argument('--lo',default='7/20')
    ap.add_argument('--hi',default='4/5')
    ap.add_argument('--out',type=Path,required=True)
    ap.add_argument('--check',action='store_true')
    args=ap.parse_args()
    base=json.loads(args.base.read_text())
    localized=json.loads(args.localized.read_text())
    assert base['version']=='rankone-explicit-nodes-v1'
    assert localized['version']=='rankone-localized-transport-v1'
    assert localized['row']==base['row']
    assert localized['source_row_sha256']==base['source_row_sha256']
    assert localized['semiconvex_coefficient']==base['semiconvex_coefficient']
    assert localized['piece_coverage_rechecked'] and localized['original_recipe_cap_rechecked']
    bankpath=args.repo/base['bank']
    assert sha(bankpath)==base['bank_sha256']
    bank,row=load_bank(args.repo,bankpath)
    rebuilt=build(bank,row,F(base['regular_physical_mesh']),F(base['regular_mesh_limit']))
    for key in rebuilt:
        assert canonical(rebuilt[key])==canonical(base[key]),('Base table mismatch',key)
    # Authenticate every source input pinned by the completed localized replay.
    for key in ('source_row','recipe'):
        assert sha(args.repo/localized[key])==localized[key+'_sha256']
    for rec in localized['moments'].values():
        assert sha(args.repo/rec['path'])==rec['sha256']
    toolsdir=args.repo/'handoff/lower-stein/cert-0745e/tools'
    for name,digest in localized['dependencies'].items():
        assert sha(toolsdir/name)==digest
    pieces=[dict(q=list(map(F,p['q'])),b0=F(p['b0']),b1=F(p['b1']),alpha=F(p['alpha']))
            for p in localized['pieces']]
    assert len(pieces)>0
    lo,hi=F(args.lo),F(args.hi)
    assert 0<lo<hi<F(base['nodes'][-1]['r'])
    improved=0
    maximum=F(0)
    nodes=[]
    for original in base['nodes']:
        node=dict(original)
        r=F(node['r'])
        node['source']='base'
        if lo<=r<=hi:
            f=propose_scalar(pieces,r)
            values=[qeval(p['q'],r)-2*(p['b0']+p['b1']*r)*f+p['alpha']*f*f for p in pieces]
            cap=ceil_grid(max(values))
            assert cap>=max(values)
            if cap<F(node['cap']):
                saved=F(node['cap'])-cap
                maximum=max(maximum,saved)
                improved+=1
                node.update(cap=str(cap),scalar_f=str(f),bank_record=None,source='localized',
                    localized_worst_piece=max(range(len(values)),key=values.__getitem__),
                    certified_gain_at_node=str(F(node['original_effective_cap'])-cap))
        assert F(node['cap'])<=F(original['cap'])
        nodes.append(node)
    assert F(nodes[0]['scalar_f'])==F(nodes[-1]['scalar_f'])==0
    output=dict(version='rankone-explicit-nodes-localized-v1',row=base['row'],
        coordinate=base['coordinate'],epsilon=base['epsilon'],delta=base['delta'],
        semiconvex_coefficient=base['semiconvex_coefficient'],
        base=str(args.base.resolve().relative_to(args.repo.resolve())),base_sha256=sha(args.base),
        localized=str(args.localized.resolve().relative_to(args.repo.resolve())),localized_sha256=sha(args.localized),
        source_row=base['source_row'],source_row_sha256=base['source_row_sha256'],
        regular_physical_mesh=base['regular_physical_mesh'],regular_mesh_limit=base['regular_mesh_limit'],
        source_table_allowance=base['source_table_allowance'],tail=base['tail'],
        localized_active_search_interval=[str(lo),str(hi)],
        localized_proof_scope='All piece integrals, original cap, S-lemma positive definiteness and m-space coverage were exactly replayed. At a node ONE rational test is shared by all pieces. The completed replay file is inherited as a hash-pinned bivariate-majorant input here.',
        nodes=nodes,summary=dict(nodes=len(nodes),localized_improved_nodes=improved,
            maximum_additional_localized_gain_float=float(maximum),
            total_improved_nodes=sum(F(n['certified_gain_at_node'])>0 for n in nodes),
            maximum_total_node_gain_float=max(float(F(n['certified_gain_at_node'])) for n in nodes)))
    if args.check:
        assert canonical(output)==canonical(json.loads(args.out.read_text())),'Combined node-table mismatch'
    else:
        args.out.parent.mkdir(parents=True,exist_ok=True)
        args.out.write_text(json.dumps(output,indent=2)+'\n')
    print('PASS localized explicit-test source nodes',output['summary'],flush=True)
    print('Source-node caps only; no hull or moment-law cover asserted.',flush=True)


if __name__=='__main__':
    main()
