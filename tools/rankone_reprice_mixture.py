#!/usr/bin/env python3
"""Reprice an explicit pure-row rank-one test for a shared mixture completion.

Only one source row is activated. Its original rational affine tests are kept;
the common completion changes c, so each upper cap changes by 2*(c'-c)*r*f(r).
All geometry and identities below use Fraction arithmetic. This exports source
algebra, conditional on the rank-one mixture lemma and the recorded Gaussian
majorants; it does not certify a whole box or a new lower endpoint.
"""
import argparse
import copy
from fractions import Fraction as F
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
from rankone_analytic_transport import dot, inv, mv, psd


def sha(path):
    return hashlib.sha256(Path(path).read_bytes()).hexdigest()


def matrix(raw):
    e,n1,n2,c1,c2,c3=map(F,raw)
    return [[e,n1,n2],[n1,c1,c2],[n2,c2,c3]]


def reprice(repo, bank_path, weights, active):
    assert weights and all(v>0 for v in weights.values()) and sum(weights.values())==1
    assert active in weights
    inherited_path=repo/'handoff/lower-stein/cert-jointmoment-lifted-codex/inherited.json'
    inherited=json.loads(inherited_path.read_text())
    bank=json.loads(bank_path.read_text())
    assert bank['version']=='rankone-anchor-bank-v1'
    assert sha(repo/bank['source_row'])==bank['source_row_sha256']
    source=json.loads((repo/bank['source_row']).read_text())
    rows=inherited['rows'];eps=F(inherited['eps'])
    assert matrix(rows[active]['E'])==matrix(source['theta'][:6])
    assert F(rows[active]['delta'])==F(bank['delta'])
    Es={i:matrix(rows[i]['E']) for i in weights}
    As={i:[F(rows[i]['delta'])*(F(j==0)+F(rows[i]['b'][j])) for j in range(3)] for i in weights}
    E=[[sum(weights[i]*Es[i][j][k] for i in weights) for k in range(3)] for j in range(3)]
    A=[sum(weights[i]*As[i][j] for i in weights) for j in range(3)]
    C=[row[1:] for row in E[1:]]
    h=[E[j][0]+A[j] for j in (1,2)]
    w=list(map(F,bank['w']));v=mv(Es[active],w);d=dot(w,v)
    assert v==list(map(F,bank['v'])) and d==F(bank['d']) and d>0
    c=v[0]-dot(h,mv(inv(C),v[1:]));change=c-F(bank['c'])
    lam=weights[active];vb=[lam*x for x in v];db=lam*d
    S=[[E[i][j]-(F(-1) if i==0 else eps) if i==j else E[i][j] for j in range(3)] for i in range(3)]
    psd(E);psd(S)
    delta=sum(weights[i]*F(rows[i]['delta']) for i in weights)
    N=[[E[i][j]-(eps-delta if i==j==0 else 0) for j in range(3)] for i in range(3)]
    psd(N)
    block=[S[i]+[-vb[i]] for i in range(3)]+[[-x for x in vb]+[db]]
    psd(block)
    young_residual=db-dot(vb,mv(inv(E),vb))
    l21_residual=db-dot(vb[1:],mv(inv(C),vb[1:]))
    assert young_residual>=0 and l21_residual>0
    assert lam*c==vb[0]-dot(h,mv(inv(C),vb[1:]))
    report=copy.deepcopy(bank)
    report['c']=str(c)
    report['semiconvex_coefficient']=str(c*c/d)
    report['Gaussian_majorant_dependency']=bank['Gaussian_majorant_dependency']+'; shared-mixture completion repricing keeps the same explicit tests'
    report['mixture_repricing']={
        'scope':__doc__, 'weights':{str(i):str(wt) for i,wt in weights.items()},
        'active_row':active,'parent_bank':str(bank_path.relative_to(repo)),
        'parent_bank_sha256':sha(bank_path),'inherited':str(inherited_path.relative_to(repo)),
        'inherited_sha256':sha(inherited_path),
        'old_c':bank['c'],'new_c':str(c),'delta_c':str(change),
        'bar_E':[[str(x)for x in row] for row in E],
        'bar_A':list(map(str,A)),'bar_h':list(map(str,h)),
        'bar_v':list(map(str,vb)),'bar_d':str(db),
        'generalized_Young_residual':str(young_residual),
        'L21_discarded_square_coefficient_negative_of':str(l21_residual),
        'shared_semiconvex_coefficient':str(lam*c*c/d),
        'profile_rule':'Keep the active-row affine f; every other source row uses f=0. Use the unchanged shared pin price, and multiply the active-row source bound by its weight.',
        'proof_obligation':'The generalized rank-one response reduction for a Young cost dbar >= vbar^T Ebar^-1 vbar, with the checked L10 block. Numerical checks alone do not establish this analytic lemma.'}
    for rec,original in zip(report['records'],bank['records']):
        q=list(map(F,original['quadratic']));f0,f1=map(F,original['scalar_profile_affine'])
        q[1]+=2*change*f0;q[2]+=2*change*f1
        rec['quadratic']=list(map(str,q))
        rec['pure_row_quadratic']=original['quadratic']
        rec['exact_gain_quadratic']=[str(a-b) for a,b in zip(map(F,original['original_quadratic']),q)]
        rec['profile_status']='Explicit unchanged affine test; no claim it minimizes the repriced majorant.'
        # Coefficient identity certifies every r, rather than sampled equality.
        assert q==[F(original['quadratic'][0]),F(original['quadratic'][1])+2*change*f0,F(original['quadratic'][2])+2*change*f1]
    return report


def main():
    assert __debug__,'Do not use -O or -OO'
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1])
    ap.add_argument('--bank',type=Path,required=True)
    ap.add_argument('--weights',default='{"12":"133952501/1000000000","15":"866047499/1000000000"}')
    ap.add_argument('--active',type=int,default=15)
    ap.add_argument('--nodes',type=Path,help='also reprice this explicit node table')
    ap.add_argument('--nodes-out',type=Path)
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args();bank_path=args.bank.resolve()
    weights={int(i):F(x) for i,x in json.loads(args.weights).items()}
    report=reprice(args.repo,bank_path,weights,args.active)
    args.out.parent.mkdir(parents=True,exist_ok=True)
    args.out.write_text(json.dumps(report,indent=2)+'\n')
    if args.nodes:
        assert args.nodes_out is not None,'--nodes-out is required with --nodes'
        table=json.loads(args.nodes.read_text());parent=copy.deepcopy(table)
        assert table['row']==report['row'] and F(table['delta'])==F(report['delta'])
        change=F(report['mixture_repricing']['delta_c'])
        table['semiconvex_coefficient']=report['semiconvex_coefficient']
        table['version']='rankone-explicit-nodes-mixture-repriced-v1'
        table['mixture_repricing']={
            'parent_node_table':str(args.nodes.relative_to(args.repo)) if args.nodes.is_absolute() else str(args.nodes),
            'parent_node_table_sha256':sha(args.nodes),
            'repriced_bank':str(args.out),'repriced_bank_sha256':sha(args.out),
            'identity':'F_new(r,f)=F_pure(r,f)+2*delta_c*r*f. The explicit rational f is kept, or replaced by the inherited zero test.',
            'delta_c':str(change)}
        changed=zeroed=0
        for n,oldn in zip(table['nodes'],parent['nodes']):
            r,f=F(n['r']),F(n['scalar_f'])
            q=F(n['cap'])+2*change*r*f
            # Upward rounding is an acceptance operation, not a float proposal.
            q=F(-((-q.numerator*10**12)//q.denominator),10**12)
            baseline=F(n['original_effective_cap'])
            if q>=baseline:
                q=baseline;n['scalar_f']='0';n['bank_record']=None
                n['source']='inherited-zero-test';zeroed+=1
            else:
                n['source']='repriced-'+n.get('source','parent-test')
            changed+=q!=F(oldn['cap'])
            n['parent_cap']=oldn['cap'];n['parent_scalar_f']=oldn['scalar_f']
            n['cap']=str(q);n['certified_gain_at_node']=str(baseline-q)
        assert table['nodes'][0]['scalar_f']==table['nodes'][-1]['scalar_f']=='0'
        table['summary']={'nodes':len(table['nodes']),'repriced_caps':changed,
            'zero_tests':zeroed,'improved_nodes':sum(F(n['certified_gain_at_node'])>0 for n in table['nodes'])}
        args.nodes_out.parent.mkdir(parents=True,exist_ok=True)
        args.nodes_out.write_text(json.dumps(table,indent=2)+'\n')
    print(json.dumps({'status':'PASS_EXACT_MIXTURE_SOURCE_REPRICING',
        'records':len(report['records']),'weights':report['mixture_repricing']['weights'],
        'active_row':args.active,'old_c':float(F(report['mixture_repricing']['old_c'])),
        'new_c':float(F(report['c'])),'delta_c':float(F(report['mixture_repricing']['delta_c'])),
        'semiconvex_coefficient':float(F(report['semiconvex_coefficient'])),
        'scope':__doc__},indent=2))


if __name__=='__main__':main()
