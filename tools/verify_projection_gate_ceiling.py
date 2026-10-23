#!/usr/bin/env python3
"""Exact finite-matrix controls for the free-projector gate ceiling.

The general complex Hilbert theorem is ProjectionGateCeiling.lean. These
rational controls bind its Cholesky coordinates to the actual 7234 gate and
show that merely prescribing projection rank does not remove the control.
"""
from fractions import Fraction as Q
import argparse, hashlib, json, math
from pathlib import Path


def dot(x, y):
    return sum((a*b for a,b in zip(x,y)), Q())


def add(x, y):
    return [a+b for a,b in zip(x,y)]


def smul(a, x):
    return [a*b for b in x]


def proj(basis, x):
    out = [Q() for _ in x]
    for b in basis:
        out = add(out, smul(dot(b,x), b))
    return out


def energy(C, x, y):
    a,b,c=C
    return a*dot(x,x)+2*b*dot(x,y)+c*dot(y,y)


def exp_moment(n, rate):
    """Exact integral of s**n exp(-rate*s) on [0,infinity)."""
    return Q(math.factorial(n), rate**(n+1))


def actual_gaussian_countercontrols(C):
    # R,S are independent Exp(1), q=W(S-2)/sqrt(2),
    # g0=W(1-2S) exp(-S)/3, a=(R-1)exp(-R).
    # Quantities containing sqrt(2) are recorded after multiplying by sqrt(2).
    q_norm2=(exp_moment(3,1)-4*exp_moment(2,1)+4*exp_moment(1,1))/2
    q_g0_times_sqrt2=(-2*exp_moment(3,2)+5*exp_moment(2,2)-2*exp_moment(1,2))/3
    g0_norm2=(exp_moment(1,3)-4*exp_moment(2,3)+4*exp_moment(3,3))/9
    a_mean=exp_moment(1,2)-exp_moment(0,2)
    a_Rminus1=exp_moment(2,2)-2*exp_moment(1,2)+exp_moment(0,2)
    q_W_exp_times_sqrt2=exp_moment(2,2)-2*exp_moment(1,2)
    assert q_norm2==1 and q_g0_times_sqrt2==0
    assert g0_norm2==Q(1,81)
    assert a_mean==-Q(1,4) and a_Rminus1==Q(1,4)
    assert q_W_exp_times_sqrt2==-Q(1,4)
    # tau-zero: f=a*g0, g=-f, c1=g0/4. Both true projected gate
    # fields vanish, whereas the raw c1 squared norm is positive.
    assert a_Rminus1*a_Rminus1*g0_norm2==Q(1,1296)
    # Positive tau: k=(W exp(-S)+a*g0)/2. Then p=-q/(8 sqrt2),
    # ||p||²=1/128, c1=g0/8, c2=0. The g0 part is orthogonal to p.
    tau2=(q_W_exp_times_sqrt2/2)**2/2
    raw_projected_gap=C[0]*a_Rminus1*a_Rminus1*g0_norm2/4
    assert tau2==Q(1,128) and raw_projected_gap==C[0]/5184
    return {'q_norm_squared':str(q_norm2),'q_g0_inner_times_sqrt2':'0',
            'g0_norm_squared':str(g0_norm2),'a_mean':str(a_mean),
            'a_Rminus1_inner':str(a_Rminus1),'tau_zero_c1_norm_squared':'1/1296',
            'positive_tau_squared':'1/128',
            'positive_tau_raw_minus_projected_gate_cost':str(raw_projected_gap),
            'scope':'Actual one-remote-Gaussian bounded response; analytic disk bounds explained in README.'}


def main():
    if not __debug__:
        raise RuntimeError("Exact checker requires assertions enabled; omit -O/-OO")
    p=argparse.ArgumentParser()
    p.add_argument('--audit',type=Path,required=True)
    p.add_argument('--out',type=Path)
    args=p.parse_args()
    source=args.audit.read_bytes(); audit=json.loads(source)
    row=next(r for r in audit['selected'] if r['index']==7234)
    C=list(map(Q,row['retained_squares']['C']))
    a,b,c=C; d=c-b*b/a
    assert a>0 and d>0
    q=list(map(Q,[1,0,0,0,0]))
    v=[Q(),Q(3,5),Q(4,5),Q(),Q()]
    dummy=list(map(Q,[0,0,0,0,1]))
    assert dot(q,q)==dot(v,v)==dot(dummy,dummy)==1
    assert dot(q,v)==dot(q,dummy)==dot(v,dummy)==0
    tau=Q(row['envelope_argmax']['tau'])
    c0=[tau,Q(4),Q(-3),Q(7),Q()]
    for basis in [[q],[q,v],[q,dummy]]:
        assert proj(basis,c0)==smul(tau,q)
    controls=[]
    for k in range(19):
        x=[Q(2*k-13,31),Q(3*k+1,17),Q(1-k,13),Q(k+5,29),Q()]
        y=[Q(7-k,23),Q(2-k,11),Q(3*k-4,37),Q(1-2*k,19),Q()]
        selected=energy(C,[x[0]],[y[0]])
        assert energy(C,proj([q],x),proj([q],y))==selected
        assert energy(C,proj([q,dummy],x),proj([q,dummy],y))==selected
        total=energy(C,proj([q,v],x),proj([q,v],y))
        assert total>=selected
        px=proj([q,v],x);py=proj([q,v],y)
        factor=a*dot(add(px,smul(b/a,py)),add(px,smul(b/a,py)))+d*dot(py,py)
        assert total==factor
        controls.append({'id':k,'selected_energy':str(selected),
                         'nontrivial_projector_excess':str(total-selected)})
    x=list(map(Q,[0,4,-3,7,0]));y=list(map(Q,[0,2,9,-1,0]))
    assert energy(C,x,y)>0
    assert energy(C,proj([q],x),proj([q],y))==0
    assert energy(C,proj([q,dummy],x),proj([q,dummy],y))==0
    result={'status':'PASS: exact rational controls; generic theorem separately compiled in Lean',
            'source_sha256':hashlib.sha256(source).hexdigest(),'index':7234,
            'controls':controls,'number_parameter_controls':len(controls),
            'raw_field_zero_moment_control_energy':str(energy(C,x,y)),
            'projected_control_energy':'0','same_rank_two_projected_control_energy':'0',
            'scope':'Free-projector controls plus separately labelled actual one-Gaussian countercontrols.',
            'actual_gaussian_countercontrols':actual_gaussian_countercontrols(C)}
    if args.out: args.out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({k:v for k,v in result.items() if k!='controls'},indent=2))

if __name__=='__main__':main()
