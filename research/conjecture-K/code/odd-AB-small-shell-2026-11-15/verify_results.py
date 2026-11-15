# shell_certificate/verify_results.py
"""Verify exact coverage and threshold comparisons for the three certificates."""
from fractions import Fraction as F
from pathlib import Path
import json,math,sys
root=Path(__file__).resolve().parent
res=Path(sys.argv[1]) if len(sys.argv)>1 else root/'results'

def verify_uniform(kind,threshold):
    rows=[]
    for line in (res/kind/'all_bounds.txt').read_text().splitlines():
        idx,lo,hi,bnd,err=line.split();i=int(idx)
        data=list(map(float,[lo,hi,bnd,err]));assert all(map(math.isfinite,data))
        lo,hi,bnd,err=map(F.from_float,data)
        assert lo<=F(i,40) and hi>=F(i+1,40)
        assert 0<=err<bnd<threshold
        rows.append((i,bnd))
    assert [r[0] for r in rows]==list(range(320))
    print(kind,'PASS:',len(rows),'intervals; largest upper bound',float(max(r[1] for r in rows)))

def verify_translated():
    rows=json.loads((res/'translated'/'all_bounds.json').read_text());expected=F(0)
    for row in rows:
        i,nw=row['i'],row['nw'];left=F(8*i,nw);right=F(8*(i+1),nw)
        assert left==expected;expected=right
        assert all(math.isfinite(row[k]) for k in ['lo','hi','bound','error'])
        assert F.from_float(row['lo'])<=left and F.from_float(row['hi'])>=right
        assert 0<=F.from_float(row['error'])<F.from_float(row['bound'])<F(33,25)
    assert expected==8
    print('translated PASS:',len(rows),'intervals; largest upper bound',max(r['bound'] for r in rows))

verify_uniform('base',F(32,25));verify_uniform('shell',F(11,10));verify_translated()
p=F(2500,1891)
assert p-F(33,25)==F(97,47275)
assert p-F(13,10)==F(417,18910)
assert F(33,4)-375*(p-F(13,10))<0
assert F(22,5)*F(1241,110000000)==F(5,100000)-F(36,100000000)
assert F(12,35)/(1+F(33,25))==F(30,203)
assert F(3,5)/(1+F(33,25))==F(15,58)
assert F(12,35)**2/(1+F(33,25))==F(72,1421)
assert F(3,5)**2/(1+F(33,25))==F(9,58)
print('All algebraic constants and the W >= 375 V implication verified exactly.')
