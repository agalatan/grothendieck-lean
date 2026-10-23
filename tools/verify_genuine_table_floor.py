#!/usr/bin/env python3
"""Directed all-row floor for FIXED TABLES using a genuine finite Wick cubic.

This is NOT a witness norm lower bound: the radial cubic need not be generated
by the same bounded response pair and it lower-bounds stored upper tables, not
the exact Gaussian fibre potential. It locates the loss of this architecture.
Discovery (--propose) needs numpy/scipy; acceptance uses python-flint only.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path

SOURCE_SHA256='5423b8631f4e1bc5cbe76054663712551106c2ff88c40bcb8803bfad84e979de'


def minorant(row):
    xy=[(Q(a),Q(b)) for a,b in row['table']]
    assert xy[0][0]==0 and all(a[0]<b[0] for a,b in zip(xy,xy[1:]))
    tail=Q(row['smax']);assert tail>=0
    slopes={Q(0),tail}
    slopes.update((yb-ya)/(xb-xa) for (xa,ya),(xb,yb) in zip(xy,xy[1:]))
    lines=[]
    for slope in sorted(s for s in slopes if 0<=s<=tail):
        intercept=min(y-slope*x for x,y in xy)
        # This single exact condition proves the line is below every table cell
        # and its entire final ray, not just at sampled arguments.
        assert all(intercept+slope*x<=y for x,y in xy)
        while lines:
            cross=(lines[-1][1]-intercept)/(slope-lines[-1][0])
            if len(lines)>1 and cross<=lines[-1][2]:lines.pop()
            else:break
        start=None if not lines else (lines[-1][1]-intercept)/(slope-lines[-1][0])
        lines.append((slope,intercept,start))
    while len(lines)>1 and lines[1][2]<=0:lines.pop(0)
    s0,b0,_=lines[0]
    kinks=[(t,s-lines[j-1][0]) for j,(s,b,t) in enumerate(lines) if j>0]
    assert all(t>0 and delta>0 for t,delta in kinks)
    # Independently verify the COMPILED hinge formula on the exact common
    # partition. This does not trust the envelope construction as a proof.
    knots=sorted(set(x for x,y in xy)|set(t for t,delta in kinks))
    intercept,slope=b0,s0; j=0;k=0
    for x in knots:
        while k<len(kinks) and kinks[k][0]<=x:
            t,delta=kinks[k];intercept-=delta*t;slope+=delta;k+=1
        while j+1<len(xy) and xy[j+1][0]<=x:j+=1
        table_slope=tail if j+1==len(xy) else (xy[j+1][1]-xy[j][1])/(xy[j+1][0]-xy[j][0])
        assert intercept+slope*x<=xy[j][1]+table_slope*(x-xy[j][0])
    assert slope<=tail
    return {'value0':str(b0),'slope0':str(s0),
        'kinks':[[str(t),str(delta)] for t,delta in kinks]}


def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('rows',type=Path)
    p.add_argument('discovery',type=Path);p.add_argument('--out',type=Path,required=True)
    p.add_argument('--propose',action='store_true');a=p.parse_args()
    assert hashlib.sha256(a.rows.read_bytes()).hexdigest()==SOURCE_SHA256,'source table hash changed'
    rows=json.loads(a.rows.read_text());data=json.loads(a.discovery.read_text())
    assert len(rows)==19
    discovery=isinstance(data,list)
    if discovery:data=data[-1]
    m=int(data['m']);assert m==128
    t,tau=Q(341,400),Q(239818283,10**9)
    beta0=Q(float(data['beta0'])).limit_denominator(10**7) if discovery else Q(data['beta0'])
    z1,z2=[Q(float(v)).limit_denominator(10**7) if discovery else Q(v) for v in data['z']]
    eps=Q(149,200)
    if a.propose:
        import numpy as np
        from scipy.special import erfc,gammaincc
        av=float
        ends=[0]+list(range(64,194,2))+[None]
        cells=[]
        for left,right in zip(ends,ends[1:]):
            sf=lambda shape,t:0 if t is None else gammaincc(shape,t)
            mass=sf(m,left)-sf(m,right)
            mean=m*(sf(m+1,left)-sf(m+1,right))/mass
            cells.append((mass,mean))
        ans=[]
        for i,row in enumerate(rows):
            f=minorant(row);h=0.
            for mass,mean in cells:
                sig=av(Q(row['delta'])*tau)*mean/np.sqrt(m*(m+1))
                h+=mass*(av(Q(f['value0']))+np.sqrt(np.pi)*sig/2*(av(Q(f['slope0']))+
                   sum(av(Q(d))*erfc(av(Q(k))/sig) for k,d in f['kinks'])))
            E=list(map(Q,row['E']));b=list(map(Q,row['b']));de=Q(row['delta'])
            kk=E[0]-eps+2*de*(1+b[0]);h1,h2=E[1]+de*b[1],E[2]+de*b[2]
            other=t*t-2*beta0*beta0/eps-2*t*Q(row['ell'])-tau*tau*kk+4*beta0/eps*Q(row['beta'])
            other+=tau*tau*(2*z1*h1+2*z2*h2-E[3]*z1*z1-2*E[4]*z1*z2-E[5]*z2*z2)
            ans.append(h+av(other))
        a.out.write_text(json.dumps({'floors':ans,'minimum':min(ans),'beta0':str(beta0),'z':[str(z1),str(z2)]},indent=2)+'\n')
        print('FLOAT Jensen table-floor',min(ans),flush=True);return
    from flint import arb,ctx
    ctx.prec=256
    ball=lambda q:arb(Q(q).numerator)/arb(Q(q).denominator)
    floor=Q(14267,20000) # 0.71335, a conservative all-row table floor.
    def survival(shape,t):
        if t is None:return arb(0)
        term=arb(1);total=arb(1)
        for j in range(1,shape):term=term*t/j;total+=term
        return total*(-arb(t)).exp()
    ends=[0]+list(range(64,194,2))+[None];cells=[]
    for left,right in zip(ends,ends[1:]):
        mass=survival(m,left)-survival(m,right)
        moment=m*(survival(m+1,left)-survival(m+1,right))
        assert mass>0 and moment>0
        cells.append((mass,moment/mass))
    results=[]
    for i,row in enumerate(rows):
        f=minorant(row);h=arb(0)
        for mass,mean in cells:
            sig=ball(Q(row['delta'])*tau)*mean/(arb(m*(m+1)).sqrt())
            h+=mass*(ball(f['value0'])+arb.pi().sqrt()*sig/2*(ball(f['slope0'])+
                  sum((ball(d)*(ball(k)/sig).erfc() for k,d in f['kinks']),arb(0))))
        E=list(map(Q,row['E']));b=list(map(Q,row['b']));de=Q(row['delta'])
        c1,c2,c3=E[3:];assert c1>0 and c1*c3-c2*c2>0
        kk=E[0]-eps+2*de*(1+b[0]);h1,h2=E[1]+de*b[1],E[2]+de*b[2]
        other=t*t-2*beta0*beta0/eps-2*t*Q(row['ell'])-tau*tau*kk+4*beta0/eps*Q(row['beta'])
        other+=tau*tau*(2*z1*h1+2*z2*h2-c1*z1*z1-2*c2*z1*z2-c3*z2*z2)
        bound=h+ball(other)
        assert bound>ball(floor),(i,str(bound))
        results.append({'row':i,'lower_interval':str(bound),'minorant':f})
    assert floor>Q(500,701)
    result={'scope':__doc__,'source_sha256':hashlib.sha256(a.rows.read_bytes()).hexdigest(),
        'm':m,'dimensions':m+m*(m+1)//2,'t':str(t),'tau':str(tau),'epsilon':str(eps),
        'beta0':str(beta0),'z':[str(z1),str(z2)],'floor':str(floor),'comparison':'500/701','rows':results}
    a.out.write_text(json.dumps(result,indent=2)+'\n')
    print('PASS directed all-row TABLE floor',str(floor),'> 500/701, rows',len(rows),flush=True)


if __name__=='__main__':main()
