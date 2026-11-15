# Agent-ID: codex-a7c4. #431. Fresh certified tilted-A field values.
import sys,importlib.util,json,time,argparse
if not __debug__: raise RuntimeError("Assertions must be enabled")
from pathlib import Path
from fractions import Fraction as Q
parser=argparse.ArgumentParser()
parser.add_argument('--deps',type=Path)
parser.add_argument('--output',type=Path,required=True)
args=parser.parse_args()
if args.deps:sys.path.insert(0,str(args.deps.resolve()))
r=Path(__file__).resolve().parents[1]
s=importlib.util.spec_from_file_location('source',r/'tilted-sector-2026-11-15/content_next_bound.py')
m=importlib.util.module_from_spec(s);s.loader.exec_module(m)
rows=[];start=time.time()
for w in [Q(75,128),Q(79,128)]:
 h,n=m.field_point(w,tolerance=m.arb(1)/100000/m.arb(str(w)))
 v=m.arb(str(w))*(m.pr.c0+h)
 scale=10**9
 lo=int((v.lower()*scale).floor().unique_fmpz());hi=int((v.upper()*scale).ceil().unique_fmpz())
 assert m.arb(lo)/scale<=v.lower() and m.arb(hi)/scale>=v.upper()
 rows.append(dict(w=str(w),lo=lo,hi=hi,denominator=scale,cells=n))
 print(rows[-1],flush=True)
args.output.with_suffix('.json').write_text(json.dumps({'agent_id':'codex-a7c4','rows':rows,'seconds':time.time()-start},indent=2)+'\n')

args.output.write_text(''.join(f"{Q(r['w']).numerator} {Q(r['w']).denominator} {r['lo']} {r['hi']} {r['denominator']}\n" for r in rows))
