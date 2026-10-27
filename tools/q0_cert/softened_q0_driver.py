#!/usr/bin/env python3
"""Bounded checkpointing driver for external Arb q0 cover; not a Lean theorem.

Writes partial receipts and refuses to call the aggregate complete unless all
456 scales finish exactly once. Intended cloud OUT directory or argument 1.
"""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from pathlib import Path
from time import monotonic
import subprocess,json,sys,os,hashlib
here=Path(__file__).resolve().parent
out=Path(sys.argv[1] if len(sys.argv)>1 else os.environ['OUT'])
out.mkdir(parents=True,exist_ok=True)
time_per=int(os.environ.get('Q0_INDEX_TIMEOUT','90'))
time_total=int(os.environ.get('Q0_JOB_TIMEOUT','19800')) # 5.5 h, below 6 h runner
assert 0<time_per<=600 and 0<time_total<=20700
start=monotonic();done=[];failure=None
root=here.parents[1]
expected={
 'input_sha256':hashlib.sha256((root/'data/upper-preprocess/certificate.json').read_bytes()).hexdigest(),
 'lean_data_sha256':hashlib.sha256((root/'Grothe/Upper/Data.lean').read_bytes()).hexdigest(),
 'script_sha256':hashlib.sha256((here/'softened_q0_cover.py').read_bytes()).hexdigest(),
 'flint_version':'0.9.0','eta':'1e-14','h':'3/10','lower_index':-220,'upper_index':235,
 'normalization':'1+15e-15','omitted_root_rule':'m>=9 on J',
 'q0_omitted_root_m6to8_budget':'3e-21','outer_s_tail_budget':'1e-16','scale_budget':'1e-17'}
for file,args in [('check_center_source.py',[]),('check_profile_l2.py',[]),('check_profile_neighborhoods.py',[]),('check_soft_shared_budget.py',[]),
                  ('phase_radial_tail.py',[]),('check_root_retained_suppression.py',['6..8'])]:
 try:
  r=subprocess.run([sys.executable,str(here/file),*args],capture_output=True,text=True,timeout=60)
 except subprocess.TimeoutExpired:
  (out/'checkpoint.json').write_text(json.dumps({'status':'incomplete','finished_count':0,'failed_count':1,'failure':{'reason':'prerequisite timed out','file':file}},indent=2)+'\n')
  sys.exit(1)
 (out/(file+'.log')).write_text(r.stdout+'\n'+r.stderr)
 if r.returncode:
  (out/'checkpoint.json').write_text(json.dumps({'status':'incomplete','failure':{'reason':'prerequisite check failed','file':file}},indent=2)+'\n')
  sys.exit(1)
for i in range(-220,236):
 if monotonic()-start>=time_total:
  failure={'index':i,'reason':'job deadline reached'};break
 receipt=out/f'q0-m{i}.json'; log=out/f'q0-m{i}.log'
 # Never trust a previous receipt without validating it again in final aggregator.
 if receipt.exists():
  data=json.loads(receipt.read_text())
  if (data.get('successful') and data.get('first')==data.get('last')==data.get('expected_last')==i
      and all(data.get(k)==v for k,v in expected.items())):
   done.append(i);continue
 try:
  r=subprocess.run([sys.executable,str(here/'softened_q0_cover.py'),str(i),str(i),str(receipt)],
   text=True,capture_output=True,timeout=min(time_per,max(1,time_total-(monotonic()-start))))
  log.write_text(r.stdout+'\n'+r.stderr)
  if r.returncode:
   failure={'index':i,'reason':'scale subprocess failed','exit_code':r.returncode};break
  done.append(i)
 except subprocess.TimeoutExpired as e:
  log.write_text(str(e))
  failure={'index':i,'reason':'scale subprocess timed out'};break
 checkpoint={'status':'incomplete','finished_count':len(done),'failed_count':0,'finished_indices':done,'failure':failure,'elapsed':monotonic()-start}
 (out/'checkpoint.json.tmp').write_text(json.dumps(checkpoint,indent=2)+'\n')
 (out/'checkpoint.json.tmp').replace(out/'checkpoint.json')
 print('done',i,'elapsed',round(monotonic()-start,1),flush=True)
if len(done)==456 and failure is None:
 r=subprocess.run([sys.executable,str(here/'softened_q0_aggregate.py'),str(out)],text=True,capture_output=True)
 (out/'aggregate.txt').write_text(r.stdout+'\n'+r.stderr)
 if r.returncode:failure={'reason':'exact coverage/metadata aggregation failed','exit_code':r.returncode}
checkpoint={'status':'all_receipts_aggregated' if len(done)==456 and failure is None else 'incomplete',
 'finished_count':len(done),'failed_count':int(failure is not None),'finished_indices':done,'failure':failure,'elapsed':monotonic()-start,
 'scope':'external Arb; analytic tail/mixture inputs not Lean checked'}
(out/'checkpoint.json').write_text(json.dumps(checkpoint,indent=2)+'\n')
print(checkpoint,flush=True)
if failure or len(done)!=456:sys.exit(1)
