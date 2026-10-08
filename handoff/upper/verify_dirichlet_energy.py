#!/usr/bin/env python3
"""Directed first-order energies for two radial remainders and their joint form.

Analytic input: Gaussian number-operator Dirichlet identity and the pinned
source's nonvanishing/phase-derivative bounds. Writes only an explicit output.
"""
import argparse,json,sys
from pathlib import Path
from fractions import Fraction as Q
from flint import arb,acb,ctx,fmpq

def aq(q):return arb(fmpq(q.numerator,q.denominator))

def ceilq(x,places=24):
    r=x.upper().fmpq();q=Q(int(r.p),int(r.q));s=10**places
    return Q(-((-q.numerator*s)//q.denominator),s)

def amplitude(coefficients):
    pairs=[(aq(r),aq(i)) for r,i in coefficients]
    r0,i0=pairs[0];norm=(r0*r0+i0*i0).sqrt();phase=(r0/norm,i0/norm)
    def values(s,analytic):
        r,i=pairs[-1];dr,di=acb(0),acb(0)
        for rr,ii in reversed(pairs[:-1]):
            dr,di=dr*s+r,di*s+i;r,i=r*s+rr,i*s+ii
        q=r*r+i*i;root=q.sqrt(analytic=analytic)
        a=(r*dr+i*di)/q
        return r/root,i/root,(dr-a*r)/root,(di-a*i)/root
    return phase,values

def calculate(source,kind='all'):
    sys.path.insert(0,str(source/'support_compression_certificate'))
    from complex_upper_origin_layer_definitions import LEFT,RIGHT,A,B,DELTA,check_origin_identity
    ctx.dps=100;check_origin_identity();assert RIGHT[0]==(LEFT[0][1],-LEFT[0][0])
    alpha,u=amplitude(LEFT);beta,v=amplitude(RIGHT)
    eps=arb(1)/10**12;cut=arb(80)
    edges=[arb(1)/10**k for k in range(12,-1,-1)]+[arb(k) for k in range(2,81)]
    def separate(s,analytic,phase,f):
        r,i,dr,di=f(s,analytic)
        return (-s).exp()*(2*s*(dr*dr+di*di)+((r-phase[0])**2+(i-phase[1])**2)/(2*s))
    def joint(s,analytic):
        ur,ui,dur,dui=u(s,analytic);vr,vi,dvr,dvi=v(s,analytic)
        c=beta[0]*(ur-alpha[0])+beta[1]*(ui-alpha[1])+alpha[0]*(vr-beta[0])+alpha[1]*(vi-beta[1])
        dc=beta[0]*dur+beta[1]*dui+alpha[0]*dvr+alpha[1]*dvi
        return (-s).exp()*(2*s*dc*dc+c*c/(2*s))
    def outside(layer):
        L=arb(12)+1/aq(DELTA*abs(layer[1]))
        return (arb(5)/4*L*L*eps*eps).upper(),((-cut).exp()*(2*L*L*(cut+1)+2/cut)).upper()
    outside_l,outside_r=outside(A),outside(B)
    out={}
    kinds=['left','right','joint'] if kind=='all' else [kind]
    for label in kinds:
        integrand=(lambda s,a:separate(s,a,alpha,u)) if label=='left' else ((lambda s,a:separate(s,a,beta,v)) if label=='right' else joint)
        middle=acb(0)
        for index,(lo,hi) in enumerate(zip(edges,edges[1:])):
            middle+=acb.integral(integrand,lo,hi,abs_tol=arb('1e-25'),rel_tol=arb('1e-25'),eval_limit=500000,depth_limit=30,deg_limit=160)
            if index%15==0:print(label,'panel',index,'middle',middle,flush=True)
        assert middle.is_finite() and middle.imag.contains(0)
        if label=='joint':near=2*(outside_l[0]+outside_r[0]);far=2*(outside_l[1]+outside_r[1])
        else:near,far=outside_l if label=='left' else outside_r
        bound=(middle.real.upper()+near.upper()+far.upper()).upper();cap=ceilq(bound)
        assert bound<=aq(cap)
        out[label]=dict(numerator=str(cap.numerator),denominator=str(cap.denominator),middle=str(middle),near=str(near),far=str(far),interval_upper=str(bound))
        print(label,'DIRECTED_ENERGY',bound,'RATIONAL_CAP',cap,flush=True)
    return dict(status='PASS',epsilon='1/1000000000000',cutoff=80,**out)

def main():
    if not __debug__:raise RuntimeError('Assertions required; no -O or -OO')
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--source-dir',type=Path,required=True);ap.add_argument('--kind',choices=['all','left','right','joint'],default='all');ap.add_argument('--output',type=Path,required=True);args=ap.parse_args()
    result=calculate(args.source_dir.resolve(),args.kind);args.output.write_text(json.dumps(result,indent=2)+'\n')

if __name__=='__main__':main()
