# shell_certificate/run_certificate.py
"""Recompute all three interval certificates with Python 3 and a C++17 compiler."""
from concurrent.futures import ThreadPoolExecutor,as_completed
from pathlib import Path
import argparse,json,subprocess,time
root=Path(__file__).resolve().parent
parser=argparse.ArgumentParser();parser.add_argument('--workers',type=int,default=8);args=parser.parse_args();assert 1<=args.workers<=32
subprocess.run(['python3',str(root/'trig_intervals.py'),'verify',str(root/'trig128.txt')],check=True)
out=root/'recomputed_results';out.mkdir(exist_ok=True)
sources={'base':'certify_odd_base.cpp','shell':'certify_shell.cpp','translated':'certify_odd_translated.cpp'}
for kind,source in sources.items():
    (out/kind).mkdir(exist_ok=True)
    subprocess.run(['g++','-O3','-std=c++17','-fno-fast-math','-ffp-contract=off',str(root/source),'-o',str(out/kind/'checker')],check=True)
jobs=[]
for kind in ['base','shell']:
    jobs += [(kind,512,320,40*k,40*(k+1),f'part_{k}') for k in range(8)]
for k in range(8):
    start,end=40*k,40*(k+1)
    for lo,hi in [(start,min(end,10)),(max(start,32),end)]:
        if lo<hi:jobs.append(('translated',512,320,lo,hi,f'coarse_{lo}_{hi}'))
for start in range(20,64,11):jobs.append(('translated',1024,640,start,min(start+11,64),f'fine_{start}_{min(start+11,64)}'))

def run(job):
    kind,nr,nw,start,end,name=job
    with open(out/kind/(name+'.log'),'w') as log:
        subprocess.run([str(out/kind/'checker'),str(nr),'128',str(nw),str(start),str(end),str(root/'trig128.txt'),str(out/kind/(name+'.txt'))],stdout=log,stderr=subprocess.STDOUT,check=True)
    return kind,name

started=time.time()
with ThreadPoolExecutor(max_workers=args.workers) as pool:
    for fut in as_completed([pool.submit(run,j) for j in jobs]):print('Finished',fut.result(),'elapsed',round(time.time()-started,1),flush=True)
for kind in sources:
    records=[]
    for k,nr,nw,start,end,name in jobs:
        if k!=kind:continue
        for line in (out/kind/(name+'.txt')).read_text().splitlines():
            i,lo,hi,bnd,err=line.split()
            records.append(dict(i=int(i),nw=nw,lo=float(lo),hi=float(hi),bound=float(bnd),error=float(err)))
    records.sort(key=lambda r:r['i']/r['nw'])
    if kind=='translated':(out/kind/'all_bounds.json').write_text(json.dumps(records,indent=2)+'\n')
    else:(out/kind/'all_bounds.txt').write_text(''.join(' '.join(map(str,[r['i'],r['lo'],r['hi'],r['bound'],r['error']]))+'\n' for r in records))
subprocess.run(['python3',str(root/'verify_results.py'),str(out)],check=True)
