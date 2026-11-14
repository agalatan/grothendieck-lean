# r26_reweighted_certificate/check_kernels.py
"""Recompute every inherited kernel enclosure at higher precision with Arb."""
from pathlib import Path
import json,sys,time
from concurrent.futures import ProcessPoolExecutor
from flint import arb,acb,ctx

BASE=Path(__file__).resolve().parent

def recompute(args):
    name,profile,node,xd,vd=args
    ctx.prec=160
    a=arb(profile['a'][0])/profile['a'][1]
    b=arb(profile['b'][0])/profile['b'][1]
    v=arb(node['x'])/xd
    if node['x']==0:
        def f(z,analytic):
            t=z*z;D=(a+b*t)*(a+3*b*t);Dt=4*a*b+6*b*b*t
            aa=(1/D+Dt/D**2)/(2*(a+b*t))
            hh=3*(a+b*t+2*b)/(2*(a+b*t)**4)
            return (-t).exp()*(aa+acb(0,1)*hh)
        ans=acb.integral(f,0,8,abs_tol=1e-15,rel_tol=1e-15,eval_limit=100000,depth_limit=40)
        aa=arb(ans.real,arb('1e-20'));hh=arb(ans.imag,arb('1e-20'))
    else:
        ca=arb.pi().sqrt()/(4*v*v.sqrt());ch=3*arb.pi().sqrt()/(8*v*v*v.sqrt())
        def f(t,analytic):
            k=a+b*t;D=k*(a+3*b*t);Dt=4*a*b+6*b*b*t;s=t*k*k;z=-s/v
            aa=ca*s*(1/D+Dt/D**2)*z.hypgeom_1f1(arb(3)/2,2)
            hh=ch*t*t*(k*k+2*b*k)*z.hypgeom_1f1(arb(5)/2,3)
            return (-t).exp()*(aa+acb(0,1)*hh)
        ans=acb.integral(f,0,64,abs_tol=1e-20,rel_tol=1e-20,eval_limit=100000,depth_limit=40)
        R=arb(64);E=(-R).exp()
        ia=ca*E*((1+4*b/a)*(R+1)+(6*b*b/(a*a))*(R*R+2*R+2))
        def tail(k):
            import math
            return E*sum((arb(math.factorial(k))/math.factorial(j)*R**j for j in range(k+1)),arb(0))
        ih=ch*((a*a+2*a*b)*tail(2)+(2*a*b+2*b*b)*tail(3)+b*b*tail(4))
        aa=arb(ans.real,ia);hh=arb(ans.imag,ih)
    assert aa.is_finite() and hh.is_finite(),(name,node['x'],'nonfinite')
    for key,val in [('A',aa),('H',hh)]:
        lo,hi=node[key]
        assert arb(lo)/vd <= val.lower(),(name,node['x'],key,'lower',val)
        assert val.upper() <= arb(hi)/vd,(name,node['x'],key,'upper',val)
    return name,node['x']

if __name__=='__main__':
    rows=sys.argv[1:] or ['peak','flank','upper'];args=[]
    for row in rows:
        data=json.loads((BASE/f'{row}_kernels.json').read_text())
        args.extend((row,data['profile'],node,data['x_denominator'],data['value_denominator']) for node in data['rows'])
    start=time.time();counts={row:0 for row in rows}
    # Audit copy: strictly sequential; no worker pool.
    for name,x in map(recompute,args):
        counts[name]+=1
        if counts[name]%32==0:print(name,counts[name],'kernel nodes verified',flush=True)
    result={'status':'PASS','nodes':counts,'precision_bits':160,'seconds':time.time()-start}
    (BASE/'kernel_recheck.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result),flush=True)
