#!/usr/bin/env python3
"""Reject a modified source table and an invalid rational tangent price."""
import argparse
import json
from pathlib import Path
import subprocess
import sys
import tempfile

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('verifier',type=Path);p.add_argument('rows',type=Path);p.add_argument('prices',type=Path)
    a=p.parse_args();verifier,rows,prices=[x.resolve() for x in [a.verifier,a.rows,a.prices]]
    with tempfile.TemporaryDirectory(prefix='grothe-common-stein-controls-') as tmp:
        tmp=Path(tmp);badrows=tmp/'badrows.json';badprices=tmp/'badprices.json'
        d=json.loads(rows.read_text());d[0]['ell']='999999999'
        badrows.write_text(json.dumps(d))
        d=json.loads(prices.read_text());d['beta0']='1000000'
        badprices.write_text(json.dumps(d))
        for r,c,reason in [(badrows,prices,'source table hash changed'),(rows,badprices,'AssertionError: (0,')]:
            run=subprocess.run([sys.executable,'-I',str(verifier),str(r),str(c),'--out',str(tmp/'out.json')],
                               cwd=tmp,capture_output=True,text=True)
            assert run.returncode!=0 and reason in run.stderr,run.stderr
            print('PASS deliberate corruption rejected:',reason,flush=True)

if __name__=='__main__':main()
