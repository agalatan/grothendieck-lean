#!/usr/bin/env python3
"""Export a standalone Stein or spectral batch using original source caps only.

The exact whole-half-line nodes are replayed before their JBatch strings are
emitted. Pure inherited Stein cuts use the kernel's 10^8/10^10 scales.
Spectral Gram/joint witnesses use exact rational strings without quantization.
This does not edit or import the frozen endpoint/cover modules.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from needle_rankone_nodes import verify_unshifted
from needle_mixed_nodes import FORMAT as MIXED_FORMAT, batch_key, source, verify_mixed
import rankone_law as L
from rankone_source_paths import resolve_archived_handoff_path

def integer(x):
    x=Q(x);assert x.denominator==1;return str(x.numerator)

def batch_term(row_index,row,docs):
    """Serialize an already replayed, pure-row collection at the kernel scales."""
    assert docs and all(d['row_index']==row_index for d in docs)
    delta=Q(row['delta']);smax=delta*Q(row['smax']);assert delta>0
    nodes=';'.join(str(Q(x)/delta)+':'+str(Q(y)) for x,y in row['table'])
    mesh=','.join(str(Q(x))for x in row['mesh'][1:]);wits=[]
    for d in docs:
        ci,ni=d['cut_ref'];cell=row['cells'][ci];node=cell['nodes'][ni]
        mus=[];bank=[]
        for weight,index in node['cuts']:
            assert Q(weight)>=0
            mus.append(integer(Q(weight)*10**10))
            z=cell['bank'][index];assert len(z)==len(row['mesh'])+1
            bank.append(','.join(integer(Q(v)*10**8)for v in z))
        wits.append(str(Q(d['tau']))+':'+','.join(str(Q(v))for v in d['P'])+':'+','.join(mus)+'|'+';'.join(bank))
    return '⟨'+str(row_index)+', '+str(row_index)+', 0, '+str(smax.numerator)+' / '+str(smax.denominator)+',\n   '+json.dumps(nodes)+',\n   '+json.dumps(mesh)+', false,\n   ['+',\n    '.join(json.dumps(s)for s in wits)+']⟩'


def spectral_batch_term(rows, docs):
    """Serialize replayed Gram/joint nodes sharing a potential and radial mesh."""
    assert docs and all(d['format'] == MIXED_FORMAT for d in docs)
    key = batch_key(docs[0])
    assert all(batch_key(d) == key for d in docs), 'A batch must share source and mesh'
    i, j, theta, rv = key
    src = source(docs[0], rows)
    qs = lambda value: str(Q(value))
    qterm = lambda value: f'({Q(value).numerator} : ℚ) / {Q(value).denominator}'
    wits = []
    for d in docs:
        node = d['witness']
        g = node['tensor_budget']
        gram = [g['A'], g['B']] + g['M0'] + g['M1'] + [g['alpha'], g['beta']]
        if 'sixth_joint' in node:
            joint = node['sixth_joint']
            assert joint.get('kind', 'triangle') in ('triangle', 'young')
            budget = ['j', '1' if joint.get('kind', 'triangle') == 'young' else '0']
            budget += [qs(joint[k]) for k in ('alpha', 'xmax', 'weight')]
        else:
            budget = ['g']
        budget += list(map(qs, gram))
        pars = ','.join(qs(node.get(k, '0')) for k in ('lam', 'mu', 't', 'beta', 'nu'))
        wits.append(qs(node['tau'])+':'+','.join(map(qs, node['P']))+':'+pars+':'+
                    ','.join(budget)+'|'+','.join(map(qs, node['phi'])))
    nodes = ';'.join(qs(a)+':'+qs(L.value(src.at(a), a)) for a in src.knots)
    mesh = ','.join(map(qs, rv[1:]))
    return ('⟨'+str(i)+', '+str(j)+', '+qterm(theta)+', '+qterm(src.pieces[-1][1][1])+',\n   '+
            json.dumps(nodes)+',\n   '+json.dumps(mesh)+', true,\n   ['+
            ',\n    '.join(json.dumps(s) for s in wits)+']⟩')

def main():
    if not __debug__:raise SystemExit('Reject -O/-OO: exact checks required')
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--nodes',type=Path,nargs='+',default=[Path('handoff/research-third-decimal/needle-20261023/unshifted4302-lo.json'),Path('handoff/research-third-decimal/needle-20261023/unshifted4302-hi.json')])
    p.add_argument('--out',type=Path,default=Path('handoff/research-third-decimal/needle-20261023/UnshiftedLawNodes.lean'))
    p.add_argument('--check',action='store_true');a=p.parse_args()
    docs=[]
    for path in a.nodes:
        d=json.loads(path.read_text())
        if d['format']==MIXED_FORMAT:d,_=verify_mixed(path)
        else:verify_unshifted(path)
        docs.append(d)
    assert docs and len({d['inherited_sha256']for d in docs})==1
    mixed=docs[0]['format']==MIXED_FORMAT
    assert all((d['format']==MIXED_FORMAT)==mixed for d in docs),'Different witness formats require separate batches'
    root=Path(__file__).resolve().parents[1]
    inherited=(root/docs[0]['inherited']).resolve(strict=True) if docs[0]['inherited']=='data/lower-unshifted/inputs/inherited.json' else resolve_archived_handoff_path(docs[0]['inherited'],root)
    inh=json.loads(inherited.read_text())
    if mixed:
        term=spectral_batch_term(inh['rows'],docs);row_index=None
    else:
        assert len({d['row_index']for d in docs})==1
        row_index=docs[0]['row_index'];term=batch_term(row_index,inh['rows'][row_index],docs)
    text='import Grothe.Lower.RowData\nimport Grothe.Lower.MixedData\n\n/-! Generated by tools/needle_unshifted_export.py. Existing unshifted source caps, new exact law scales. -/\n\nnamespace Grothe.Research.UnshiftedLawNodes\n\nopen Grothe.Lower\n\n'
    text+='def unshiftedBatch : JBatch :=\n  '+term+'\n\n'
    text+='#eval checkBatch rowData unshiftedBatch\n\nend Grothe.Research.UnshiftedLawNodes\n'
    if a.check:assert a.out.read_text()==text
    else:a.out.parent.mkdir(parents=True,exist_ok=True);a.out.write_text(text)
    print(json.dumps(dict(status='PASS_EXACT_UNSHIFTED_BATCH_EXPORT',nodes=len(docs),row=row_index,lean_sha256=hashlib.sha256(text.encode()).hexdigest()),indent=2))

if __name__=='__main__':main()
