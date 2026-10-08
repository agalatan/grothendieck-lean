#!/usr/bin/env python3
"""Replay the lower-bound prerequisites, coupled profiles, and scalar cover."""

if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use Python -O or -OO.')

import argparse,subprocess,sys
from pathlib import Path

def main():
    assert __debug__, 'Run without -O; assertions are proof gates.'
    p=argparse.ArgumentParser(description=__doc__)
    p.add_argument('--source',type=Path,required=True)
    p.add_argument('--workdir',type=Path,required=True)
    a=p.parse_args();here=Path(__file__).resolve().parent
    source=a.source.resolve();work=a.workdir.resolve()
    subprocess.run([sys.executable,str(here/'base/verify_all.py'),
        '--source',str(source),'--workdir',str(work)],check=True)
    for name in ('verify_joint_profiles.py','verify_augmented_envelope.py'):
        subprocess.run([sys.executable,str(here/name),'--source',str(source)],check=True)
    print('FULL LOWER VERIFICATION PASSED: K_G^C > 1.400813971',flush=True)

if __name__=='__main__':main()
