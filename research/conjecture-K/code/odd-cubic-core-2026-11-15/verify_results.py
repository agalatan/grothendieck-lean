# odd_sector_certificate/verify_results.py
"""Check complete parameter coverage and compare all certified bounds exactly."""
from fractions import Fraction as F
from pathlib import Path
import math
import sys

root=Path(__file__).resolve().parent
path=Path(sys.argv[1]) if len(sys.argv)>1 else root/'results'/'all_bounds.txt'
rows=[]
for line in path.read_text().splitlines():
    fields=line.split();assert len(fields)==5
    i=int(fields[0]);numbers=[float(s) for s in fields[1:]]
    assert all(math.isfinite(x) for x in numbers)
    lo,hi,bound,error=map(F.from_float,numbers)
    assert lo<=F(i,40) and hi>=F(i+1,40)
    assert 0<=error<bound<F(32,25),(i,float(bound),float(error))
    rows.append((i,lo,hi,bound,error))
assert [r[0] for r in rows]==list(range(320))
worst=max(rows,key=lambda r:r[3])
print('PASS: all 320 intervals cover [0,8], and every bound is below 32/25.')
print('Largest certified upper bound:',float(worst[3]))
print('Its exact parameter interval:',F(worst[0],40),F(worst[0]+1,40))
