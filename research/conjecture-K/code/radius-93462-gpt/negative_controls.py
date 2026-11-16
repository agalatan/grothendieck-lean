# cubic_l1_gram_certificate/negative_controls.py
"""Check that both proof verifiers reject corrupted certificates."""
import copy,json,subprocess,sys,tempfile
from pathlib import Path
root=Path(__file__).resolve().parent
pack=json.loads((root/'certificates.json').read_text())
variants=[]
x=copy.deepcopy(pack);x['certificates'][0]['d'][0]='-100';variants.append(('negative majorant',x))
x=copy.deepcopy(pack);x['certificates'][0]['ww'][0]=['1','1','2'];variants.append(('indefinite nodal matrix',x))
x=copy.deepcopy(pack);x['certificates'][0]['gramN']=[['0','0'],['0','0']];variants.append(('invalid support budget',x))
x=copy.deepcopy(pack);x['certificates'][0]['interval'][0]='1';variants.append(('uncovered s interval',x))
with tempfile.TemporaryDirectory() as tmp:
    for name,x in variants:
        p=Path(tmp)/'bad.json';p.write_text(json.dumps(x))
        for command in [['node',str(root/'verify.mjs'),str(p)],[sys.executable,str(root/'verify.py'),str(p)]]:
            r=subprocess.run(command,capture_output=True,text=True)
            assert r.returncode!=0,(name,command,r.stdout)
        print('PASS: both verifiers reject',name)
