#!/usr/bin/env python3
"""Fresh moment + outward-C++ replay; no saved moment premise. codex-91d4 #430."""
import argparse,hashlib,json,os,subprocess,sys,time
from pathlib import Path
if not __debug__ or sys.flags.optimize:raise SystemExit('Assertions required; no -O/-OO')
HERE=Path(__file__).resolve().parent
pa=argparse.ArgumentParser();pa.add_argument('--dependency-dir',default='/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies')
args=pa.parse_args();start=time.monotonic()
env=dict(os.environ)
for key in ['OPENBLAS_NUM_THREADS','OMP_NUM_THREADS','MKL_NUM_THREADS','VECLIB_MAXIMUM_THREADS']:env[key]='1'
flags=['-O2','-std=c++17','-frounding-math','-ffp-contract=off','-fno-fast-math']
commands=[]
def run(argv,log):
    argv=list(map(str,argv));commands.append(argv)
    r=subprocess.run(argv,cwd=HERE,env=env,text=True,capture_output=True,check=False)
    (HERE/log).write_text(r.stdout+r.stderr)
    if r.returncode:raise RuntimeError(f'Certificate command failed ({r.returncode}); see {log}')
    return r.stdout

compiler=subprocess.run(['clang++','--version'],capture_output=True,text=True,check=True).stdout
run(['clang++',*flags,'dual_verify.cpp','-o','dual_verify'],'build.log')
body=run([sys.executable,'-I','make_moments.py','--nx','320','--ny','160','--nr','160',
          '--dependency-dir',args.dependency_dir,'--output',HERE/'moments_certified.txt'],'moments_certified.log')
mom=json.loads(body);assert mom['status']=='PASS FRESH ARB MOMENTS' and mom['grid']==[320,160,160] and mom['cells']==8192000
assert mom['sha256']==hashlib.sha256((HERE/'moments_certified.txt').read_bytes()).hexdigest()
body=run([HERE/'dual_verify',HERE/'moments_certified.txt'],'dual_certified.log')
assert 'cells 8192000 ' in body
assert 'PASS RIGOROUS COMMON-TRIAL O_U COUNTEREXAMPLE: RESIDUAL > 1/10000' in body
hashfiles=['make_moments.py','dual_verify.cpp','dual_verify','verify.py','moments_certified.txt','moments_certified.log','dual_certified.log']
out={'Agent-ID':'codex-91d4','issue':430,'status':'PASS FRESH RIGOROUS COMMON-TRIAL COUNTEREXAMPLE',
     'claim':'J_odd - (1/100)||U||^2 - 1/20000 > 1/10000',
     'scope':'Fixed exact one-Y genuine polynomial candidate; common remote trial xi=-3R/5; full complex visible infimum',
     'asserted_actual_bounded_common_response':False,'asserted_absolute_K_violation':False,
     'cells':8192000,'compiler':compiler,'compiler_flags':flags,'commands':commands,
     'python_version':sys.version,'python_flint_version':mom['python_flint_version'],'arb_precision_bits':mom['arb_precision_bits'],
     'source_and_output_sha256':{name:hashlib.sha256((HERE/name).read_bytes()).hexdigest() for name in hashfiles},
     'seconds':time.monotonic()-start}
(HERE/'certificate_result.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
