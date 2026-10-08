#!/usr/bin/env python3
"""Full lower replay: integration prerequisites, imported caps, scalar cover."""
if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use -O or -OO.')
import argparse,subprocess,sys
from pathlib import Path

def main():
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source',type=Path,required=True)
    p.add_argument('--workdir',type=Path,required=True)
    a=p.parse_args();here=Path(__file__).resolve().parent
    source=a.source.resolve();work=a.workdir.resolve();work.mkdir(parents=True,exist_ok=True)
    commands=[
      [sys.executable,str(here/'base/verify_all.py'),'--source',str(source),'--workdir',str(work/'physical')],
      [sys.executable,str(here/'verify_imported_profiles.py'),'--source',str(source),
       '--pool',str(here/'combined-polynomials.json'),'--certificate',str(here/'coupled-profiles.json')],
      [sys.executable,str(here/'verify_augmented_envelope.py'),'--source',str(source)],
      [sys.executable,str(here/'finite-dimension/certify_finite_dimension.py'),
       '--norm-cap','7138283181/10000000000','--output',str(work/'finite-dimension.json')]
    ]
    for cmd in commands:subprocess.run(cmd,check=True)
    print('FULL LOWER VERIFICATION PASSED: K_G^C > 1.4008970709',flush=True)
    print('Computational checks passed; no Lean verification is claimed.',flush=True)

if __name__=='__main__':main()
