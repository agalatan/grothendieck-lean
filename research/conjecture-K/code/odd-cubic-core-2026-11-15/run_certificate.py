# odd_sector_certificate/run_certificate.py
"""Recompute the interval proof. Requires Python 3, g++, and IEEE binary64."""
import argparse
import concurrent.futures
from pathlib import Path
import subprocess
import time

root=Path(__file__).resolve().parent
parser=argparse.ArgumentParser();parser.add_argument('--workers',type=int,default=8);args=parser.parse_args()
assert 1<=args.workers<=32
subprocess.run(['python3',str(root/'trig_intervals.py'),'verify',str(root/'trig128.txt')],check=True)
subprocess.run(['g++','-O3','-std=c++17','-fno-fast-math','-ffp-contract=off',str(root/'certify.cpp'),'-o',str(root/'certify')],check=True)
out=root/'recomputed_results';out.mkdir(exist_ok=True)

def run(k):
    with open(out/f'part_{k}.log','w') as log:
        subprocess.run([str(root/'certify'),'512','128','320',str(k*40),str((k+1)*40),str(root/'trig128.txt'),str(out/f'part_{k}.txt')],stdout=log,stderr=subprocess.STDOUT,check=True)
    return k

started=time.time()
with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:
    futures=[pool.submit(run,k) for k in range(8)]
    for fut in concurrent.futures.as_completed(futures):
        print('Completed block',fut.result(),'elapsed seconds',round(time.time()-started,1),flush=True)
all_text=''.join((out/f'part_{k}.txt').read_text() for k in range(8))
(out/'all_bounds.txt').write_text(all_text)
subprocess.run(['python3',str(root/'verify_results.py'),str(out/'all_bounds.txt')],check=True)
