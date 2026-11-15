#!/usr/bin/env python3
"""Fresh Arb rectangular Gaussian moments for the odd dual. codex-91d4 #430."""
import argparse,sys,math,struct,json,hashlib,time
from fractions import Fraction as Q
from pathlib import Path
if not __debug__:raise SystemExit('Assertions required; no -O/-OO')
HERE=Path(__file__).resolve().parent
pa=argparse.ArgumentParser();pa.add_argument('--nx',type=int,default=80);pa.add_argument('--ny',type=int,default=40);pa.add_argument('--nr',type=int,default=40)
pa.add_argument('--dependency-dir',default='/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/dependencies')
pa.add_argument('--output',type=Path,default=HERE/'moments.txt');args=pa.parse_args()
assert 0<args.nx<=4000 and 0<args.ny<=2000 and 0<args.nr<=2000
sys.path.insert(0,args.dependency_dir)
from flint import arb,ctx
import flint
ctx.prec=160
def ar(q):q=Q(q);return arb(q.numerator)/q.denominator
def exact(a):
    assert a.is_exact();m,e=a.man_exp();return Q(int(m))*Q(2)**int(e)
def endpoint(q,up):
    f=float(q);fq=Q.from_float(f)
    if (up and fq<q) or (not up and fq>q):f=math.nextafter(f,math.inf if up else -math.inf)
    assert (Q.from_float(f)>=q) if up else (Q.from_float(f)<=q)
    return struct.unpack('Q',struct.pack('d',f))[0]
def bits(a):return [endpoint(exact(a.lower()),False),endpoint(exact(a.upper()),True)]
pi=arb.pi();sp=pi.sqrt()
def moments(l,h,radial):
    l,h=ar(l),ar(h);el,eh=(-l*l).exp(),(-h*h).exp()
    erf=h.erf()-l.erf()
    if radial:
        m=[el-eh,l*el-h*eh+sp*erf/2]
        for n in range(2,7):m.append(l**n*el-h**n*eh+ar(Q(n,2))*m[n-2])
    else:
        m=[erf/2,(el-eh)/(2*sp)]
        for n in range(2,7):m.append((l**(n-1)*el-h**(n-1)*eh)/(2*sp)+ar(Q(n-1,2))*m[n-2])
    assert m[0]>0
    return [m[0]]+[x/m[0] for x in m]

# Tail |X| bound uses a triangle inequality over its eleven real monomials
# and a union bound for |x|>5, |y|>5, or r>5. No norm tail is discarded.
a,b,c,al,be,rho=map(ar,[Q(699,1250),Q(179,1250),Q(57,5000),Q(133,1000),Q(21,200),Q(5053,10000)])
k0=-2*c-al+ar(Q(3,5))*(al+rho*arb(2).sqrt()*be)
terms=[(b,3,0,0),(b,1,2,0),(a,1,0,0),(c,0,0,3),(k0,0,0,1),
       (al+be,2,0,1),(al-be,0,2,1),(a,0,1,0),(b,2,1,0),(b,0,3,0),(2*be,1,1,1)]
G=[arb(1),1/sp];R=[arb(1),sp/2]
for n in range(2,4):G.append(ar(Q(n-1,2))*G[n-2]);R.append(ar(Q(n,2))*R[n-2])
ex=arb(-25).exp();eg=arb(5).erfc()
GT=[eg,ex/sp];RT=[ex,5*ex+sp*eg/2]
for n in range(2,4):GT.append(5**(n-1)*ex/sp+ar(Q(n-1,2))*GT[n-2]);RT.append(5**n*ex+ar(Q(n,2))*RT[n-2])
tail=sum(abs(co)*(GT[i]*G[j]*R[k]+G[i]*GT[j]*R[k]+G[i]*G[j]*RT[k]) for co,i,j,k in terms)
assert tail<ar(Q(1,10**7))
start=time.monotonic();lines=[f'{args.nx} {args.ny} {args.nr}',' '.join(map(str,bits(tail)))]
for count,l,h,radial in [(args.nx,Q(-5),Q(5),False),(args.ny,Q(0),Q(5),False),(args.nr,Q(0),Q(5),True)]:
    for j in range(count):
        ml=l+(h-l)*j/count;mh=l+(h-l)*(j+1)/count
        vals=moments(ml,mh,radial)
        lines.append(' '.join(str(z) for v in vals for z in bits(v)))
args.output.write_text('\n'.join(lines)+'\n')
print(json.dumps({'Agent-ID':'codex-91d4','issue':430,'status':'PASS FRESH ARB MOMENTS',
    'python_version':sys.version,'python_flint_version':flint.__version__,'arb_precision_bits':ctx.prec,
    'grid':[args.nx,args.ny,args.nr],'cells':args.nx*args.ny*args.nr,'tail_baseline_norm_upper':str(tail),
    'moment_file':str(args.output),'sha256':hashlib.sha256(args.output.read_bytes()).hexdigest(),
    'seconds':time.monotonic()-start}),flush=True)
