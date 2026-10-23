#!/usr/bin/env python3
"""FLOAT projections with exact relative-phase averaging and exact anchors.

The conditional angular integral is analytic. The four remaining radial
integrals use scrambled Sobol estimates, NOT interval certificates. A_Y keeps
its shared |G|² term. The controls change the estimator, never the operator.
"""
import argparse
import json
from pathlib import Path

import numpy as np
from scipy.special import gammaincinv,ellipe,ellipkm1,hyp2f1
from scipy.stats import qmc


def circle_phase(a,b):
    """E phase(a+b exp(i theta)), for nonnegative real a,b."""
    a,b=np.broadcast_arrays(np.asarray(a,float),np.asarray(b,float))
    out=np.zeros_like(a);small=(a<b);large=(a>=b)&(a>0)
    t=a[small]/b[small]
    out[small]=t/2*hyp2f1(.5,.5,2,t*t)
    r=b[large]/a[large];d=1-r;chi=(d/(1+r))**2
    e=ellipe(1-chi);k=np.zeros_like(r);mask=d>0
    k[mask]=d[mask]*ellipkm1(chi[mask])
    out[large]=((1+r)*e+k)/np.pi
    assert np.all(np.isfinite(out)) and np.all(out>=-1e-14) and np.all(out<=1+1e-14)
    return out


def radial_state(m,power,seed):
    u=qmc.Sobol(4,scramble=True,seed=seed).random_base2(power)
    assert np.all((u>0)&(u<1))
    T=-np.log(u[:,0]);S=-np.log(u[:,1]);d=m*(m+1)//2
    R=gammaincinv(m,u[:,2]);V=gammaincinv(d-1,u[:,3])
    return T,(R-m)/np.sqrt(m),(S+V-d)/np.sqrt(d),R*np.sqrt(S)/np.sqrt(m*(m+1))


def coefficients(m,state,c):
    T,AX,AY,qamp=state;t=np.sqrt(T)
    b=c[0]+c[1]*(T-2)/np.sqrt(2)+c[2]*AX+c[3]*AY
    a=t*abs(b);v=abs(c[4])*qamp
    phaseb=np.divide(b,abs(b),out=np.zeros_like(b),where=abs(b)>0)
    visible=t*phaseb*circle_phase(a,v)
    anchor=c[0]/abs(c[0]) if c[0]!=0 else 0j
    diff=visible-anchor*t
    base=np.sqrt(np.pi)/2
    k=[anchor*base+np.mean(diff),-anchor*base/(2*np.sqrt(2))+np.mean(diff*(T-2)/np.sqrt(2)),
       np.mean(diff*AX),np.mean(diff*AY)]
    phaseq=c[4]/abs(c[4]) if c[4]!=0 else 0j
    k.append(phaseq*(m*base/np.sqrt(m*(m+1))+np.mean(qamp*(circle_phase(v,a)-1))))
    return np.array(k)


def controls():
    # Smooth periodic quadrature checks the analytic angular formula at
    # geometrically varied ratios, away from its non-smooth equal-radius point.
    theta=2*np.pi*(np.arange(32768)+.5)/32768
    for a,b in [(1,0),(0,1),(.1,1),(.9,1),(1,.9),(1,.1)]:
        z=a+b*np.exp(1j*theta);actual=np.mean(z/abs(z)).real
        assert abs(float(circle_phase(a,b))-actual)<2e-12,(a,b,actual)
    assert abs(float(circle_phase(1,1))-2/np.pi)<1e-14
    st=radial_state(4,12,79);base=np.sqrt(np.pi)/2
    z=coefficients(4,st,np.array([1,0,0,0,0],complex))
    q=coefficients(4,st,np.array([0,0,0,0,1],complex))
    assert np.max(abs(z-np.array([base,-base/(2*np.sqrt(2)),0,0,0])))<1e-14
    assert np.max(abs(q-np.array([0,0,0,0,4*base/np.sqrt(20)])))<1e-14
    print('PASS circle-phase formula; exact phase-Z and phase-q controls',flush=True)


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('inputs',type=Path,nargs='+')
    p.add_argument('--out',type=Path,required=True);p.add_argument('--powers',default='18,20')
    a=p.parse_args();controls();raw=sum((json.loads(f.read_text()) for f in a.inputs),[])
    rows=[r for r in raw if r['m'] in [16,128]];out=[]
    for power in map(int,a.powers.split(',')):
        for m in [16,128]:
            group=[r for r in rows if r['m']==m]
            for seed in [51031,61043]:
                state=radial_state(m,power,seed)
                for r in group:
                    cs=[np.array([complex(*z) for z in v]) for v in r['two_branch_images']]
                    kf,kg=[coefficients(m,state,c) for c in cs]
                    cc=(kf.conj()*kg).real
                    v={'m':m,'discovery_epsilon':r['epsilon'],'power':power,'seed':seed,
                       'c0':float(cc[0]),'c1':float(sum(cc[1:])),
                       'projections':[[[float(z.real),float(z.imag)] for z in kk] for kk in [kf,kg]],
                       'scope':__doc__}
                    out.append(v);print(m,r['epsilon'],power,seed,v['c0'],v['c1'],flush=True)
                a.out.write_text(json.dumps(out,indent=2)+'\n')


if __name__=='__main__':main()
