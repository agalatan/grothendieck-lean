# /workspace/scratch/a2f683456ed1/grothendieck-literature-1402/existing-program/certify_exterior_7475.py
"""Unconditional new-epsilon exterior bound from inherited Lean rows, exact rational arithmetic."""
if not __debug__:
 raise RuntimeError('Run without -O; assertions are required.')
import json,hashlib,argparse,re
from pathlib import Path
from fractions import Fraction as F
import exterior_transfer as ex
parser=argparse.ArgumentParser(description=__doc__)
parser.add_argument('--repo',type=Path,help='Optionally verify frozen input hashes and header fractions against a checkout')
args=parser.parse_args()
if args.repo:
 for r in ex.DATA['rows']:
  p=args.repo/r['path'];blob=p.read_bytes()
  assert hashlib.sha256(blob).hexdigest()==r['sha256'],p
  s=blob.decode().split('def row',1)[1].split('\u27e8',1)[1]
  vals=re.findall(r'\((\d+) : ℚ\)(?: / (\d+))?',s)[:6]
  vals=[F(int(a),int(b or 1)) for a,b in vals]
  assert [vals[0],vals[1],vals[5]]==[F(r['ell']),F(r['beta']),F(r['cap'])]
 print('PASS optional checkout hashes and rational headers')
ex.e=F(299,400)
ex.de=ex.e-ex.old
rho=F(973612157,10**9)
result=ex.cover(rho)
assert result['gaps']==[['1633/2000','433/500']]
assert ex.pi_hi/4<F(1773,2000)**2
result.update({'epsilon':str(ex.e),'norm_target':str(ex.target),
 'proved_region':'0 <= t <= 1633/2000 OR 433/500 <= t <= sqrt(pi)/2',
 'status':'EXACT unconditional exterior consequence of inherited Lean row bounds and response-energy theorem',
 'pi_upper':str(ex.pi_hi),
 'source_commit':ex.DATA['source_commit'],
 'source_sha256':{r['path']:r['sha256'] for r in ex.DATA['rows']},
 'lean_theorems':ex.DATA['lean_theorems']})
maxcap=max(F(cell['bound']) for cell in result['cells'])
assert maxcap<ex.target
assert maxcap<F(713263,1000000)<ex.target
result['max_accepted_cap']=str(maxcap)
result['uniform_margin']=str(ex.target-maxcap)
result['simple_norm_bound']='713263/1000000'
Path('exterior_7475_certificate.json').write_text(json.dumps(result,indent=2))
print('PASS',result['proved_region'])
print('accepted cells',result['accepted_cells'])
print('maximum cap',str(maxcap),float(maxcap))
print('uniform margin',str(ex.target-maxcap),float(ex.target-maxcap))
