# handoff/codex-4d8a-compensated-joint/matrix/run_certificate.py — Agent-ID: codex-4d8a
"""Full isolated recompute of the c=9/20 shifted odd-sector matrices."""
import argparse,concurrent.futures,subprocess,time
from pathlib import Path
root=Path(__file__).resolve().parent
parser=argparse.ArgumentParser();parser.add_argument('--workers',type=int,default=4);args=parser.parse_args()
assert 1<=args.workers<=8
subprocess.run(['node',str(root/'verify_tradeoff.mjs')],check=True)
subprocess.run(['python3','-I',str(root/'trig_intervals.py'),'verify',str(root/'trig128.txt')],check=True)
subprocess.run(['g++','-O3','-std=c++17','-fno-fast-math','-ffp-contract=off',str(root/'certify_tradeoff.cpp'),'-o',str(root/'certify_tradeoff')],check=True)
out=root/'recomputed_results';out.mkdir(exist_ok=True);start=time.monotonic()
def run(k):
 with (out/f'part_{k}.log').open('w') as log:
  subprocess.run([str(root/'certify_tradeoff'),'512','128','320',str(k*40),str((k+1)*40),str(root/'trig128.txt'),str(out/f'part_{k}.txt')],stdout=log,stderr=subprocess.STDOUT,check=True)
 print('Completed',k,'elapsed',round(time.monotonic()-start,1),flush=True)
with concurrent.futures.ThreadPoolExecutor(max_workers=args.workers) as pool:list(pool.map(run,range(8)))
(out/'all_bounds.txt').write_text(''.join((out/f'part_{k}.txt').read_text() for k in range(8)))
subprocess.run(['python3','-I',str(root/'verify_certificate.py'),str(out/'all_bounds.txt')],check=True)
