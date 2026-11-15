# codex-c7e2-round3/odd-perturb/verify_recentered.py; Agent-ID: codex-c7e2.
"""Fresh compile, complete replay, exact cover audit, and negative controls."""
from pathlib import Path
from fractions import Fraction
import subprocess,tempfile,json,re,hashlib,sys,shutil,time

HERE=Path(__file__).resolve().parent
def require(test,message):
 if not test:raise RuntimeError(message)
compiler=shutil.which('g++')
require(compiler is not None,'g++ unavailable')
flags=[compiler,'-O2','-std=c++17','-frounding-math','-ffp-contract=off','-fno-fast-math','-I',str(HERE)]
source=HERE/'recenter_potential.cpp';start=time.time()
with tempfile.TemporaryDirectory(prefix='recenter-replay-',dir=HERE) as temporary:
 binary=Path(temporary)/'potential'
 build=subprocess.run(flags+[str(source),'-o',str(binary)],capture_output=True,text=True)
 require(build.returncode==0,'Compile failed: '+build.stderr)
 for name,extra in [('NDEBUG',['-DNDEBUG']),('fast_math',['-ffast-math'])]:
  rejected=subprocess.run(flags+extra+['-fsyntax-only',str(source)],capture_output=True,text=True)
  require(rejected.returncode!=0,'Unsafe compiler mode accepted: '+name)
 result=subprocess.run([str(binary),'--cover'],capture_output=True,text=True)
 require(result.returncode==0,'Compact cover failed: '+result.stderr+'\n'+result.stdout[-10000:])
 (HERE/'recentered_potential_fresh_replay.log').write_text(result.stdout)
 pattern=r'^PASS POTENTIAL w=\[([^,]+),([^\]]+)\] cells=(\d+)'
 matches=re.findall(pattern,result.stdout,re.M)
 intervals=[(Fraction(l),Fraction(h),int(cells)) for l,h,cells in matches]
 require(len(intervals)==600,'Unexpected accepted interval count')
 require(intervals[0][0]==0 and intervals[-1][1]==6,'Wrong cover endpoints')
 require(all(l<h for l,h,_ in intervals),'Empty cover interval')
 require(all(intervals[i][1]==intervals[i+1][0] for i in range(len(intervals)-1)),'Gap or overlap in cover')
 require('PASS RECENTERED POTENTIAL [0,6]: 600 intervals' in result.stdout,'Missing completion marker')
 require('UNRESOLVED' not in result.stdout,'Unresolved attempted interval in replay')
 scalar=subprocess.run([sys.executable,'-O',str(HERE/'verify_recenter_constants.py')],capture_output=True,text=True)
 require(scalar.returncode==0,'Exterior scalar certificate failed: '+scalar.stderr)
 tail=json.loads((HERE/'recenter_tail_certificate.json').read_text())
 require(tail['status']=='PASS','Missing exterior acceptance')
 receipt={'status':'PASS','theorem_constant':'11/10','recenter_A':'27/50','recenter_B':0,'compact_cover':[0,6],'interval_count':len(intervals),'total_source_cells':sum(c for _,_,c in intervals),'negative_controls':['NDEBUG rejected','fast-math rejected'],'scalar_checker_under_python_O':'PASS','compiler':subprocess.check_output([compiler,'--version'],text=True).splitlines()[0],'seconds':time.time()-start,'sha256':{name:hashlib.sha256((HERE/name).read_bytes()).hexdigest() for name in ['recenter_potential.cpp','interval_engine.hpp','verify_recenter_constants.py','RECENTERED_EVEN_POTENTIAL.md']}}
 (HERE/'recentered_potential_receipt.json').write_text(json.dumps(receipt,indent=2)+'\n')
 print(json.dumps(receipt,indent=2),flush=True)
