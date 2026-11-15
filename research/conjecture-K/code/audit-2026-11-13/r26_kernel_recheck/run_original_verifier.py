# Agent ID: codex-a713. Run unmodified local copies with local flint dependency.
import sys
sys.dont_write_bytecode=True
from pathlib import Path
BASE=Path(__file__).resolve().parent
sys.path[:0]=[str(BASE.parent/'dependencies'),str(BASE)]
import runpy,json,hashlib
from flint import arb,ctx
rows=sys.argv[1:] or ['peak','flank','upper']
results={}
for row in rows:
    sys.modules.pop('kernel_enclosures',None)
    sys.argv=[str(BASE/'verify_pure.py'),row]
    runpy.run_path(str(BASE/'verify_pure.py'),run_name='__main__')
    data=json.loads((BASE/f'{row}_kernels.json').read_text())
    ctx.prec=160
    a=arb(data['profile']['a'][0])/data['profile']['a'][1]
    b=arb(data['profile']['b'][0])/data['profile']['b'][1]
    I=arb.pi()/(2*(a*b).sqrt())*(a/b).exp()*(a/b).sqrt().erfc()
    j0=arb.pi().sqrt()/b-2*(1+a/b)*I
    assert -arb(17)/10<j0<0
    results[row]={'status':'PASS','J0_ball':str(j0),
                  'kernel_data_sha256':hashlib.sha256((BASE/f'{row}_kernels.json').read_bytes()).hexdigest(),
                  'rational_certificate':json.loads((BASE/f'pure_{row}_result.json').read_text())}
(BASE/'end_to_end_result.json').write_text(json.dumps(results,indent=2)+'\n')
print(json.dumps(results),flush=True)
