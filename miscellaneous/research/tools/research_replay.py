#!/usr/bin/env python3
"""Replay the saved exact research certificates from a fresh checkout.

Standard-library Python only. Does not launch Lean builds, Gaussian discovery
searches or integration regeneration. The written analytic premises of each
certificate remain in force. --full also replays the seven frozen scalar
countermodels; they are relaxation examples, not Gaussian realizations.
"""
import argparse
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import time


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--full',action='store_true')
    parser.add_argument('--out',type=Path)
    args=parser.parse_args()
    repo=Path(__file__).resolve().parents[1]
    research='handoff/research-third-decimal/'
    manifest=repo/research/'integration-20261023/INPUTS.json'
    inputs=json.loads(manifest.read_text())['files']
    for item in inputs:
        p=(repo/item['path']).resolve()
        if not p.is_relative_to(repo) or not p.is_file():
            raise ArithmeticError('Missing or external frozen input: '+item['path'])
        if hashlib.sha256(p.read_bytes()).hexdigest()!=item['sha256']:
            raise ArithmeticError('Frozen input hash mismatch: '+item['path'])
    checks=[]
    with tempfile.TemporaryDirectory(prefix='grothe-exact-replay-') as temporary:
        output=Path(temporary)
        commands=[
            ('real-mixture',['-I','tools/coupled_preprocess_mixture_certificate.py','--output',str(output/'real.json')]),
            ('complex-mixture',['tools/coupled_preprocess_complex_certificate.py','--output',str(output/'complex.json')]),
            ('independent-complex',['-I','tools/coupled_jump_complex_price_check.py','--out',str(output/'independent.json')]),
            ('coupled-pair',['-I','tools/coupled_pair_dual_exact.py','--out',str(output/'pair.json')]),
            ('finite-jump',['-I','tools/coupled_jump_exact.py','--out',str(output/'jump.json')]),
            ('wick-identities',['-I','tools/fresh_lower_exact.py']),
            ('moment-extension',['-I','tools/fresh_barrier_moment_extension.py','--out',str(output/'moments.json')]),
            ('moment-negative-controls',['-I','tools/fresh_barrier_negative_tests.py','--out',str(output/'negative.json')]),
            ('incumbent-prefix',['-I','tools/fresh_incumbent_exact_prefix.py','--out',str(output/'incumbent.json')]),
            ('rankone-tau-a',['-I','tools/rankone_law.py','--tau-bridge',research+'rank-one-certification-20261023/law/m15-box8150-tau-bridge-a.json']),
            ('rankone-tau-b',['-I','tools/rankone_law.py','--tau-bridge',research+'rank-one-certification-20261023/law/m15-box8150-tau-bridge-b.json']),
            ('rankone-box',['-I','tools/rankone_box8150.py','--out',research+'rank-one-certification-20261023/box8150/result.json','--check']),
        ]
        if args.full:
            laws=sorted((repo/research/'fresh-eyes-20261023/barriers').glob('repair-*-law-exact.json'))
            if len(laws)!=7:
                raise ArithmeticError('Expected all seven frozen scalar countermodels')
            commands.append(('seven-scalar-countermodels',['-B','-I','tools/fresh_barrier_verify_repairs.py',
                *(str(p) for p in laws),'--out',str(output/'repairs.json')]))
        for name,command in commands:
            start=time.monotonic()
            result=subprocess.run([sys.executable,*command],cwd=repo,capture_output=True,text=True)
            if result.returncode:
                sys.stderr.write(result.stdout+result.stderr)
                raise RuntimeError('Research replay failed: '+name)
            checks.append({'check':name,'status':'PASS','seconds':time.monotonic()-start})
            print('PASS '+name,flush=True)
    report={'status':'PASS','scope':__doc__,'frozen_inputs_checked':len(inputs),
            'full':args.full,'checks':checks,
            'not_claimed':'Gaussian integrations, all-dimensional outer covers, full Lean build or a new endpoint.'}
    if args.out:
        args.out.parent.mkdir(parents=True,exist_ok=True)
        args.out.write_text(json.dumps(report,indent=2)+'\n')


if __name__=='__main__':
    main()
