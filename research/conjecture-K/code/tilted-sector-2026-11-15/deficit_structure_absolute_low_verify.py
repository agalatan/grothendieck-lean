#!/usr/bin/env python3
"""codex-6e2b: additive fresh Arb acceptance of absolute envelopes from energies .03 and .035."""
import json
from pathlib import Path
import sys
import time
from fractions import Fraction as Q

sys.path.insert(0,str(Path(__file__).resolve().parent))
from secant_content_verify import (arb,a,b,d,pi,ar,exact_interval,radius_from_t,
    exp_moment,certify_m4,integrate,power_bern)

def outer():
    T=arb(4);p,q=a+b*T,a+3*b*T;R=b/p+3*b/q
    co=[arb(0),1+d*(1+R),1+R]
    factor=4/pi/p/q/q
    point=factor*(-T).exp()*sum(c*T**j for j,c in enumerate(co))
    tail=factor*sum(c*(a*exp_moment(T,j)+3*b*exp_moment(T,j+1))
                   /(2*T.sqrt()) for j,c in enumerate(co))
    far=radius_from_t(T)*point+tail
    assert far<ar(Q(3,5)) and radius_from_t(T)<3
    lower=arb(0);outside=arb(0)
    for j in range(150):
        x=exact_interval(ar(Q(j,50)),ar(Q(j+1,50)))
        def accepted(v):
            return bool(v>-1) and (j<50 or bool(abs(v)<ar(Q(3,5))))
        val=integrate(x,tail_x=arb(3),accept=accepted)
        lower=min(lower,val.lower())
        if j>=50:outside=max(outside,abs(val).upper())
    return {'global_positive_halfline_lower':str(lower),
            'absolute_bound_x_ge_1':str(max(far,outside)),'far_bound':str(far)}

def check_witness(tag,source):
    base=Path(__file__).resolve().parent
    data=json.loads((base/('deficit_structure_content_witness_'+tag+'.json')).read_text())
    n=data['n'];assert n==500
    us=list(map(Q,data['u']));cap=Q(data['cap']);endcap=Q(data['endcap'])
    assert us[1]==Q(463,10000) and us[0] in [Q(3,100),Q(7,200)]
    Y=list(map(Q,data['values']));D=list(map(Q,data['derivatives']))
    assert len(Y)==len(D)==n+1
    assert Y[0]==0 and Y[-1]==endcap and D[-1]>=0
    h=Q(1,n);minimum=arb('inf');actual_cap=Q(0)
    absolute=data['absolute'];signs=[1,-1] if absolute else [1]
    for i in range(n):
        x=Q(i,n)
        c=[Y[i],h*D[i],-3*Y[i]-2*h*D[i]+3*Y[i+1]-h*D[i+1],
           2*Y[i]+h*D[i]-2*Y[i+1]+h*D[i+1]]
        for value in power_bern(c):
            assert value<=cap,(tag,i,str(value),str(cap))
            if absolute:assert value>=0,(tag,i,str(value))
            actual_cap=max(actual_cap,value)
        for u in us:
            op=[]
            for j in range(4):
                val=(Q(5,3)+j)*c[j]
                if j+1<4:val+=(j+1)*x*c[j+1]/h
                if j+2<4:val-=u*(j+2)*(j+1)*c[j+2]/(2*h*h)
                op.append(ar(val))
            for sign in signs:
                src=[sign*source[i]+ar(Q(1000)*h*h/8),
                     sign*(source[i+1]-source[i]),arb(0),arb(0)]
                for val in power_bern([op[j]-src[j] for j in range(4)]):
                    assert val>0,(tag,i,str(u),sign,str(val))
                    minimum=min(minimum,val.lower())
    # The fresh outer source cap is |m''|<3/5 for x>=1.
    assert Q(5,3)*endcap>=Q(3,5)
    if not absolute:
        # Global source m''>=-1 gives k_u>=-3/5 on x>=0.
        assert cap>=Q(3,5)
    coefficient=Q(11,108)*cap*cap
    return {'tag':tag,'u':list(map(str,us)),'absolute_envelope':absolute,
        'tail_value':str(endcap),'cap':str(cap),'actual_bernstein_cap':str(actual_cap),
        'content_coefficient':str(coefficient),'residual_margin':str(minimum),'passed':True}

def main():
    start=time.time();m4=certify_m4();out=outer()
    print(json.dumps({'M4_upper':str(m4),'outer':out}),flush=True)
    source=[integrate(ar(Q(j,500))) for j in range(501)]
    for tag in ['absolute30','absolute35']:
        print(json.dumps(check_witness(tag,source)),flush=True)
    print(json.dumps({'all_passed':True,'seconds':time.time()-start}),flush=True)

if __name__=='__main__':main()
