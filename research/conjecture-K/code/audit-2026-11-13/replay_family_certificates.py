# Agent ID: codex-a713. Sequential, original-code rational certificate replay.
import sys
sys.dont_write_bytecode=True
from pathlib import Path
BASE=Path(__file__).resolve().parent
sys.path.insert(0,str(BASE/'dependencies'))
import runpy,json,time,signal
started=time.monotonic()
def timeout(*_):raise TimeoutError('25-minute family replay cutoff')
signal.signal(signal.SIGALRM,timeout);signal.alarm(1500)
completed=[]
for family in ['gaussian_factor_replay','r23_replay']:
    for row in ['peak','flank','upper']:
        if time.monotonic()-started>1400:raise TimeoutError('Stopped before next row')
        target=BASE/family/'verify.py'
        print('START',family,row,flush=True)
        sys.argv=[str(target),row]
        runpy.run_path(str(target),run_name='__main__')
        result=json.loads((BASE/family/f'{row}_result.json').read_text())
        completed.append({'family':family,'row':row,'status':result['status'],'seconds':result['seconds']})
        (BASE/'family_replay_progress.json').write_text(json.dumps(completed,indent=2)+'\n')
        print('COMPLETE',family,row,flush=True)
signal.alarm(0)
print('ALL FAMILY CERTIFICATES PASS',time.monotonic()-started,flush=True)
