#!/usr/bin/env python3
"""Rejection checks for the actual certificate path. codex-91d4 #430."""
import argparse,json,subprocess,sys,tempfile,resource
from pathlib import Path
HERE=Path(__file__).resolve().parent
if not __debug__:raise SystemExit('Assertions required; no -O/-OO')
pa=argparse.ArgumentParser(description=__doc__)
pa.add_argument('--dependency-dir',default='/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies')
args=pa.parse_args()
rows=[]
def no_core():resource.setrlimit(resource.RLIMIT_CORE,(0,0))
def reject(name,argv,needle=None):
    r=subprocess.run(list(map(str,argv)),cwd=HERE,text=True,capture_output=True,preexec_fn=no_core)
    body=r.stdout+r.stderr
    assert r.returncode!=0 and 'PASS RIGOROUS' not in body,(name,r.returncode,body)
    if needle:assert needle in body,(name,body)
    rows.append({'test':name,'returncode':r.returncode,'diagnostic':body[:1000]})
for name in ['make_moments.py','verify.py']:
    for flag in ['-O','-OO']:reject(name+flag,[sys.executable,flag,name],'Assertions required')
base=['clang++','-O2','-std=c++17','-frounding-math','-ffp-contract=off','-fno-fast-math']
reject('NDEBUG compile',[*base,'-DNDEBUG','-fsyntax-only','dual_verify.cpp'],'Assertions are required')
reject('fast-math compile',[*base,'-ffast-math','-fsyntax-only','dual_verify.cpp'],'Fast math invalidates')
with tempfile.TemporaryDirectory(prefix='negative-',dir=HERE) as temp:
    bad=Path(temp)/'truncated.txt';bad.write_text('\n'.join((HERE/'moments_certified.txt').read_text().splitlines()[:20])+'\n')
    reject('truncated moment coverage',[HERE/'dual_verify',bad])
    coarse=Path(temp)/'moments_80.txt'
    gen=subprocess.run([sys.executable,'-I',str(HERE/'make_moments.py'),
        '--nx','80','--ny','40','--nr','40','--dependency-dir',args.dependency_dir,
        '--output',str(coarse)],cwd=HERE,text=True,capture_output=True,check=True)
    coarse_receipt=json.loads(gen.stdout)
    assert coarse_receipt['status']=='PASS FRESH ARB MOMENTS' and coarse_receipt['grid']==[80,40,40]
    reject('coarse cover inconclusive',[HERE/'dual_verify',coarse],'INCONCLUSIVE')
out={'Agent-ID':'codex-91d4','issue':430,'status':'PASS ALL NEGATIVE CONTROLS','count':len(rows),
     'coarse_moments_generated_fresh':True,'coarse_generation_receipt':coarse_receipt,'controls':rows}
(HERE/'negative_controls.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
