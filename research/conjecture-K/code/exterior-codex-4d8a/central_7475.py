# /workspace/scratch/a2f683456ed1/grothendieck-literature-1402/existing-program/central_7475.py
"""Search and separately certify a finite conditional central-row bank at e=299/400."""
if not __debug__:
 raise RuntimeError('Run without -O; assertions are required.')
import argparse,json,math
from fractions import Fraction as F
from pathlib import Path
import certify_shoulders as cert
BASE=Path(__file__).resolve().parent

def generate():
 import shoulder_search as search
 search.e=.7475
 result=[]
 lo=F(1633,2000);stop=F(433,500)
 while lo<stop:
  hi=min(stop,lo+F(1,200))
  r=search.optimize(float(lo),float(hi))
  # These are candidate exact rationals only; the separate pass verifies them.
  row=[str(lo),str(hi),str(r['ell']),str(r['beta']),
       f"{math.floor(r['v_star_numeric']*10**7-2)/10**7:.7f}",
       f"{math.ceil(r['v_star_numeric']*10**7+2)/10**7:.7f}",
       f"{math.ceil(r['S_numeric']*10**9)/10**9:.9f}",'0.000025']
  result.append(row);lo=hi
 (BASE/'central_7475_candidates.json').write_text(json.dumps(result,indent=2))
 print('NUMERICAL candidate rows',len(result),flush=True)
 for row in result:print(row,flush=True)

def verify():
 cert.e=F(299,400)
 candidates=json.loads((BASE/'central_7475_candidates.json').read_text())
 expected=F(1633,2000);out=[]
 for row in candidates:
  assert F(row[0])==expected
  assert F(row[1])>expected
  expected=F(row[1])
  r=cert.run(row);r['epsilon']='299/400';out.append(r)
  print(json.dumps(r),flush=True)
 assert expected==F(433,500)
 minmargin=min(F(r['cap_margin_exact']) for r in out)
 assert minmargin>F(1,200000)
 (BASE/'central_7475_certificate.json').write_text(json.dumps(out,indent=2))
 print('minimum exact central margin',str(minmargin),flush=True)
 print('PASS: complete central Gaussian benchmark/conditional budget bank; ALL-SECTOR PREMISES OPEN',flush=True)

if __name__=='__main__':
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--verify',action='store_true');args=p.parse_args()
 if args.verify:verify()
 else:generate()
