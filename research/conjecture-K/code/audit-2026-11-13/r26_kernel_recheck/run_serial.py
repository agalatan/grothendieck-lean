# Agent ID: codex-a713. Single-process resumable Arb recheck.
# Original recompute() must prove NEW Arb balls fit ORIGINAL stored endpoints.
import sys
sys.dont_write_bytecode=True
from pathlib import Path
BASE=Path(__file__).resolve().parent
sys.path.insert(0,str(BASE.parent/'dependencies'))
import json,hashlib,time,signal,traceback
source=(BASE/'check_kernels.py').read_text()
assert source.count("    return name,node['x']")==1
source=source.replace("    return name,node['x']", "    return name,node['x'],str(aa),str(hh)")
ns={'__name__':'audit_kernel_functions','__file__':str(BASE/'check_kernels.py')}
exec(compile(source,str(BASE/'check_kernels.py'),'exec'),ns)
rows=sys.argv[1:] or ['peak','flank','upper']
version=__import__('flint').__version__
log=BASE/'nodes.jsonl'
old=[json.loads(s) for s in log.read_text().splitlines()] if log.exists() else []
done={(r['row'],r['x'],r['data_sha256']) for r in old if r.get('status')=='PASS'}
start=time.monotonic()
def timed_out(*_):raise TimeoutError('25-minute per-run cutoff')
signal.signal(signal.SIGALRM,timed_out);signal.alarm(1500)
counts={};failure=None
try:
    for row in rows:
        raw=(BASE/f'{row}_kernels.json').read_bytes()
        digest=hashlib.sha256(raw).hexdigest()
        data=json.loads(raw);counts[row]={'total':len(data['rows']),'newly_verified':0,'previously_verified':0}
        for node in data['rows']:
            if (row,node['x'],digest) in done:
                counts[row]['previously_verified']+=1;continue
            if time.monotonic()-start>1450:
                raise TimeoutError('25-minute cutoff approaching; stopped before next node')
            began=time.monotonic()
            name,x,aa,hh=ns['recompute']((row,data['profile'],node,data['x_denominator'],data['value_denominator']))
            record={'row':name,'x':x,'status':'PASS','data_sha256':digest,'precision_bits':160,
                    'flint_version':version,'new_A_ball':aa,'new_H_ball':hh,
                    'stored_A':node['A'],'stored_H':node['H'],'value_denominator':data['value_denominator'],
                    'seconds':time.monotonic()-began}
            with log.open('a') as f:f.write(json.dumps(record)+'\n');f.flush()
            counts[row]['newly_verified']+=1
            done.add((row,x,digest))
            print(row,counts[row]['newly_verified']+counts[row]['previously_verified'],'/',len(data['rows']),
                  'PASS original enclosures; seconds',round(record['seconds'],3),flush=True)
except BaseException as e:
    failure=f'{type(e).__name__}: {e}'
    traceback.print_exc()
finally:
    signal.alarm(0)
    result={'agent':'codex-a713','status':'PASS' if failure is None else 'INCOMPLETE',
            'rows':counts,'seconds':time.monotonic()-start,'failure':failure,'flint_version':version,
            'check':'Every recomputed Arb ball must be a subset of the original stored rational interval',
            'processes':1,'precision_bits':160}
    (BASE/('result_'+ '_'.join(rows)+'.json')).write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result),flush=True)
if failure:sys.exit(1)
