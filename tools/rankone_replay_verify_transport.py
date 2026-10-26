#!/usr/bin/env python3
"""Cross-check a localized bivariate bank against the direct shifted source engine.

No Gaussian integration is repeated. Hash-pinned raw replayed C/h/H feed the
original piece_quadratic_multi engine with external field b=r*A-v*f. Its result
must equal the separately derived bivariate formula for every fixture/piece.
"""
import argparse
from fractions import Fraction as F
import hashlib
import json
from pathlib import Path
import sys

REPO=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(Path(__file__).resolve().parent))
from rankone_source_paths import resolve_archived_handoff_path
sys.path.insert(0,str(REPO/'handoff/lower-stein/cert-0745d/tools'))


def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    if not __debug__:raise SystemExit('Reject -O/-OO')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--raw',type=Path,required=True)
    ap.add_argument('--bank',type=Path,required=True)
    ap.add_argument('--out',type=Path,required=True)
    args=ap.parse_args()
    import exactint as X
    from replay_midcaps_exact import cons_of,coverage
    raw=json.loads(args.raw.read_text());bank=json.loads(args.bank.read_text())
    assert raw['status']=='PASS'
    rp=resolve_archived_handoff_path(raw['source_recipe'],REPO)
    rowp=resolve_archived_handoff_path(raw['row'],REPO)
    assert sha(rp)==raw['source_sha256'] and sha(rowp)==raw['row_sha256']
    nd=json.loads(rp.read_text())['nodes'][raw['node_index']];assert coverage(nd)
    row=json.loads(rowp.read_text());th=list(map(F,row['theta']));eps=F(row['eps'])
    E=[[th[0],th[1],th[2]],[th[1],th[3],th[4]],[th[2],th[4],th[5]]]
    R=[[th[6],th[7]],[th[7],th[8]]];M=[[F(0)]*12 for _ in range(12)]
    for off in (0,3):
        for i in range(3):
            for j in range(3):M[off+i][off+j]=E[i][j]
    for off in (6,8):
        for i in range(2):
            for j in range(2):M[off+i][off+j]=R[i][j]
    M[10][10]=M[11][11]=eps
    Q=X.inv(M);A=[th[9]*(1+th[10]),th[9]*th[11],th[9]*th[12]]+[F(0)]*9
    v=list(map(F,raw['v']))+[F(0)]*9;d=F(raw['d']);c=F(raw['c'])
    assert len(bank['pieces'])==len(nd['pieces'])==len(raw['pieces'])
    fixtures=[(F(0),F(0)),(F(raw['physical_r']),F(-14947036109,10**12)),(F(7,10),F(-23,1000))]
    checks=0
    for p,rec,other in zip(nd['pieces'],raw['pieces'],bank['pieces']):
        Cu=F(rec['C_upper']);hu=list(map(F,rec['h_rational']));Hu=[[F(x)for x in r]for r in rec['H_upper']]
        cons=cons_of(nd,p)
        q=list(map(F,other['q']));b0,b1,alpha=map(F,[other['b0'],other['b1'],other['alpha']])
        for r,f in fixtures:
            external=[r*a-f*w for a,w in zip(A,v)]
            directq=X.piece_quadratic_multi(Q,external,Cu,hu,Hu,cons);assert directq is not None
            direct=sum(directq[:3])+d*f*f+2*c*r*f
            separate=q[0]+r*q[1]+r*r*q[2]-2*(b0+b1*r)*f+alpha*f*f
            assert direct==separate,('Transport disagreement',rec['index'],str(r),str(f))
            checks+=1
    report=dict(status='PASS',scope=__doc__,raw=str(args.raw.resolve()),raw_sha256=sha(args.raw),
                bank=str(args.bank.resolve()),bank_sha256=sha(args.bank),
                pieces=len(nd['pieces']),exact_cross_implementation_fixtures=checks,
                fixtures=[[str(r),str(f)]for r,f in fixtures])
    args.out.parent.mkdir(parents=True,exist_ok=True);args.out.write_text(json.dumps(report,indent=2)+'\n')
    print('PASS independent direct-engine/bivariate transport equality:',checks,'exact fixtures')


if __name__=='__main__':main()
