"""Certified Arb radial coefficients for added modes, with resumable output.

Same analytic integrand and enclosures as the pinned upstream generator,
with higher precision to avoid catastrophic Laguerre cancellation at n>=120.
This file creates new data; it never overwrites either upstream table.
"""
import argparse,json,math,multiprocessing as mp,sys,time
from pathlib import Path
import numpy as np

def coefficient(task):
    side,n,cutoff,source=task
    sys.path.insert(0,str(Path(source)/'support_compression_certificate'))
    from complex_upper_origin_layer_definitions import LEFT,RIGHT
    from flint import acb,arb,ctx,fmpq
    ctx.dps=60+n//4
    p=LEFT if side==0 else RIGHT
    pr=tuple(arb(fmpq(x.numerator,x.denominator)) for x,y in p)
    pi=tuple(arb(fmpq(y.numerator,y.denominator)) for x,y in p)
    def evaluate(p,s):
        v=p[-1]
        for c in reversed(p[:-1]):v=v*s+c
        return v
    sign=-1 if n%2 else 1;normalization=arb(n+1).sqrt()
    def integrand(t,analytic):
        s=t*t;r,i=evaluate(pr,s),evaluate(pi,s)
        phase=(r+1j*i)/(r*r+i*i).sqrt(analytic=analytic)
        return 2*s*(-s).exp()*s.laguerre_l(n,1)*phase*sign/normalization
    v=acb(0)
    panels=int(math.isqrt(cutoff)*10)
    assert panels*panels==cutoff*100
    for k in range(panels):
        v+=acb.integral(integrand,arb(k)/10,arb(k+1)/10,abs_tol=arb('1e-20'),rel_tol=arb('1e-20'),eval_limit=300000,depth_limit=28,deg_limit=140)
    def endpoints(ball):
        lo=math.nextafter(float(ball.lower()),-math.inf);hi=math.nextafter(float(ball.upper()),math.inf)
        assert math.isfinite(lo) and math.isfinite(hi)
        box=arb(fmpq(*lo.as_integer_ratio())).union(arb(fmpq(*hi.as_integer_ratio())))
        assert box.contains(ball)
        return lo,hi
    rl,ru=endpoints(v.real);il,iu=endpoints(v.imag)
    assert max(ru-rl,iu-il)<1e-13,(side,n,'insufficient enclosure',str(v))
    return dict(side=side,index=n,cutoff=cutoff,real_lower=rl,real_upper=ru,imag_lower=il,imag_upper=iu,dps=ctx.dps,enclosure=str(v))

def main():
    if not __debug__:raise RuntimeError('Do not use -O')
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--source-dir',type=Path,required=True);ap.add_argument('--start',type=int,default=120);ap.add_argument('--count',type=int,default=240);ap.add_argument('--cutoff',type=int,default=36);ap.add_argument('--jobs',type=int,default=4);ap.add_argument('--output',type=Path,default=Path('rebuilt_origin_120_240.npz'));args=ap.parse_args()
    source=args.source_dir.resolve()
    assert (source/'support_compression_certificate/complex_upper_origin_layer_definitions.py').is_file()
    cache=args.output.with_suffix('');cache.mkdir(exist_ok=True)
    import hashlib
    dependencies=sorted((source/'support_compression_certificate').glob('*.py'))
    manifest=dict(cutoff=args.cutoff,start=args.start,count=args.count,
                  source_sha256={str(p.relative_to(source)):hashlib.sha256(p.read_bytes()).hexdigest() for p in dependencies},
                  generator_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    manifest_path=cache/'manifest.json'
    if manifest_path.exists():assert json.loads(manifest_path.read_text())==manifest
    else:
        assert not list(cache.glob('*.json')),'Cache needs a matching generation manifest'
        manifest_path.write_text(json.dumps(manifest,indent=2)+'\n')
    # Interleave sides so every completed initial block can be certified early.
    tasks=[(side,n,args.cutoff,str(source)) for n in range(args.start,args.count) for side in range(2) if not(cache/f'{side}_{n}.json').exists()]
    started=time.time()
    with mp.Pool(args.jobs) as pool:
        for i,row in enumerate(pool.imap_unordered(coefficient,tasks),1):
            (cache/f"{row['side']}_{row['index']}.json").write_text(json.dumps(row)+'\n')
            print(i,'/',len(tasks),'side',row['side'],'mode',row['index'],'elapsed',round(time.time()-started,1),row['enclosure'],flush=True)
    arrays={}
    for side,label in enumerate(('left','right')):
        rows=[json.loads((cache/f'{side}_{n}.json').read_text()) for n in range(args.start,args.count)]
        assert all(r['side']==side and r['index']==n and r['cutoff']==args.cutoff for n,r in zip(range(args.start,args.count),rows))
        for field in ('real_lower','real_upper','imag_lower','imag_upper'):arrays[label+'_'+field]=np.array([r[field] for r in rows])
    np.savez(args.output,**arrays,start=np.array(args.start),count=np.array(args.count),cutoff=np.array(args.cutoff))
    print('SAVED',args.output,'elapsed',time.time()-started,flush=True)

if __name__=='__main__':main()
