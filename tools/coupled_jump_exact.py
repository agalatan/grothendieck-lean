#!/usr/bin/env python3
"""Exact, stdlib replay of zero-safe finite-jump certificate algebra.

The four-point fixture is algebraic, NOT a complex Gaussian-chaos realization.
No global Grothendieck endpoint is asserted. Run without -O / -OO.
"""
from __future__ import annotations
import argparse
from dataclasses import dataclass
from fractions import Fraction as F
import json
from pathlib import Path
import sys

if not __debug__:
    raise SystemExit('Refusing optimized Python: exact checks must remain enabled.')

@dataclass(frozen=True)
class C:
    re: F = F(0)
    im: F = F(0)
    def __post_init__(self):
        object.__setattr__(self, 're', F(self.re))
        object.__setattr__(self, 'im', F(self.im))
    def __add__(self, other):
        other = cv(other)
        return C(self.re + other.re, self.im + other.im)
    __radd__ = __add__
    def __neg__(self):
        return C(-self.re, -self.im)
    def __sub__(self, other):
        return self + (-cv(other))
    def __rsub__(self, other):
        return cv(other) + (-self)
    def __mul__(self, other):
        other = cv(other)
        return C(self.re*other.re-self.im*other.im,
                 self.re*other.im+self.im*other.re)
    __rmul__ = __mul__
    def __truediv__(self, other):
        other = cv(other)
        n = other.abs2()
        if n == 0:
            raise ZeroDivisionError
        z = self * other.conj()
        return C(z.re/n, z.im/n)
    def conj(self):
        return C(self.re, -self.im)
    def abs2(self):
        return self.re*self.re+self.im*self.im


def cv(v):
    return v if isinstance(v, C) else C(v)


def require(ok, msg):
    if not ok:
        raise AssertionError(msg)


def matvec(a, x):
    return [sum((z*w for z, w in zip(row, x)), C()) for row in a]


def matmul(a, b):
    return [[sum((a[i][k]*b[k][j] for k in range(len(b))), C())
             for j in range(len(b[0]))] for i in range(len(a))]


def inner(x, y):
    return sum((z.conj()*w for z, w in zip(x,y)), C())/len(x)


def vsub(x,y):
    return [a-b for a,b in zip(x,y)]


def ldl_psd(a):
    """Exact PSD LDL certificate, including a zero final pivot."""
    n = len(a)
    z = [list(row) for row in a]
    ds=[]
    for k in range(n):
        p=z[k][k]
        require(p>=0, 'negative LDL pivot')
        ds.append(p)
        if p==0:
            require(all(z[k][j]==0 for j in range(k+1,n)),
                    'zero pivot with nonzero residual row')
            continue
        for i in range(k+1,n):
            for j in range(k+1,n):
                z[i][j]-=z[i][k]*z[k][j]/p
    return ds


def encode(x):
    if isinstance(x, F):
        return str(x)
    if isinstance(x, C):
        return {'re':str(x.re), 'im':str(x.im)}
    if isinstance(x, dict):
        return {k:encode(v) for k,v in x.items()}
    if isinstance(x,(list,tuple)):
        return [encode(v) for v in x]
    return x


def replay():
    eps=F(149,200)
    psi=[C(1),C(0,1),C(-1),C(0,-1)]
    one=[C(1)]*4
    pproj=[[a*b.conj()/4 for b in psi] for a in psi]
    qproj=[[C(F(1,4)) for _ in psi] for _ in psi]
    zero=[[C() for _ in psi] for _ in psi]
    require(matmul(pproj,pproj)==pproj, 'P not a projection')
    require(matmul(qproj,qproj)==qproj, 'Q not a projection')
    require(matmul(pproj,qproj)==zero, 'P Q nonzero')
    require(matmul(qproj,pproj)==zero, 'Q P nonzero')
    t=[[a-eps*b for a,b in zip(pr,qr)] for pr,qr in zip(pproj,qproj)]
    require(all(t[i][j]==t[j][i].conj() for i in range(4) for j in range(4)),
            'T not Hermitian')
    t2=matmul(t,t)
    require(t2==[[a+eps*eps*b for a,b in zip(pr,qr)]
                  for pr,qr in zip(pproj,qproj)], 'T^2 identity')
    require(matvec(t,psi)==psi, 'first eigenspace identity')
    require(matvec(t,one)==[-eps*z for z in one], 'cubic eigenspace identity')
    f=[-z for z in one];g=one
    p=matvec(t,g);q=matvec(t,f)
    require(p==[eps*z for z in f] and q==[eps*z for z in g],
            'not mutual best response')
    j=inner(f,p).re
    require(j==eps, 'base payoff')
    # Real phase Hessian H=(eps*||A||^2+eps*||B||^2+2<A,Re(T)B>)/4.
    phase_h=[[((eps if i==j else F(0)) if (i<4)==(j<4)
              else t[i%4][j%4].re) for j in range(8)] for i in range(8)]
    pivots=ldl_psd(phase_h)
    require(pivots.count(F(0))==1, 'unexpected Hessian nullity')
    # Re(P) has eigenvalue 1/2 on the real/imaginary parts of psi;
    # Q has eigenvalue 1 on constants; these subspaces are orthogonal.
    rp=[[z.re for z in row] for row in pproj]
    require(all(sum(rp[i][k]*rp[k][j] for k in range(4))==rp[i][j]/2
                for i in range(4) for j in range(4)), 'Re(P) spectral identity')
    gap=eps-F(1,2)
    require(gap==F(49,200), 'non-null Hessian factor')
    # Finite image shifts are held fixed as the image pair varies.
    h=[z-a for z,a in zip(psi,p)]
    k=[z-a for z,a in zip(psi,q)]
    require([a+b for a,b in zip(p,h)]==psi, 'first shifted image')
    require([a+b for a,b in zip(q,k)]==psi, 'second shifted image')
    fp=gp=psi
    df=vsub(fp,f);dg=vsub(gp,g)
    cost_f=eps*sum(z.abs2() for z in df)/8
    cost_g=eps*sum(z.abs2() for z in dg)/8
    cross=inner(df,matvec(t,dg)).re
    new=inner(fp,matvec(t,gp)).re
    gain=new-j
    require(gain==cross-cost_f-cost_g, 'finite jump identity')
    require((cost_f,cost_g,cross,new,gain)==
            (eps,eps,1+eps,F(1),1-eps), 'fixture jump values')
    eta=F(1,4);rx=ry=F(1,100)
    lip_allowance=(1+1/eta)*(rx+ry)
    box_gain=gain-lip_allowance
    require(box_gain==F(31,200)>0, 'uniform coefficient box certificate')
    # All finite jumps in this exact family satisfy the difference identity.
    phases=[C(1),C(0,1),C(-1),C(0,-1)]
    identity_tests=0
    for a in range(4):
        for b in range(4):
            for c in range(4):
                fnew=[phases[(a+i*b)%4] for i in range(4)]
                gnew=[phases[(c+i*(a+b+1))%4] for i in range(4)]
                dff=vsub(fnew,f);dgg=vsub(gnew,g)
                cf=eps*sum(z.abs2() for z in dff)/8
                cg=eps*sum(z.abs2() for z in dgg)/8
                xc=inner(dff,matvec(t,dgg)).re
                actual=inner(fnew,matvec(t,gnew)).re-j
                require(actual==xc-cf-cg, 'sample jump identity')
                identity_tests+=1
    # Clipped phase tests use rational Pythagorean directions, hence exact moduli.
    points=[(C(),F(0))]
    dirs=[C(1),C(0,1),C(F(3,5),F(4,5)),C(F(-5,13),F(12,13))]
    for r in (F(1,16),F(1,4),F(1,2),F(1),F(3)):
        points.extend((r*d,r) for d in dirs)
    clip_tests=0
    approximation_tests=0
    for e in (F(1,8),F(1,4),F(1),F(2)):
        clipped=[]
        for z,r in points:
            zz=z/max(r,e)
            clipped.append(zz)
            require(zz.abs2()<=1, 'clipped response outside disk')
            loss=r-(zz.conj()*z).re
            require(F(0)<=loss<=e/4, 'uniform clipping response loss')
            approximation_tests+=1
        for i,(z,_) in enumerate(points):
            for l,(w,_) in enumerate(points):
                require((clipped[i]-clipped[l]).abs2()<=
                        (z-w).abs2()/(e*e), 'nonexpansive projection check')
                clip_tests+=1
    # Near-maximal clipped image consistency, tested on exact phase fixtures.
    # For g=f=one, the current pair is not a mutual best response. Each image
    # is -eps*one, so clipped response is -one and the coefficient mismatch
    # has squared norm4; R_eta is0. The certified gap floor is eta/2*4.
    bad_f=bad_g=one
    bad_p=matvec(t,bad_g)
    bad_j=inner(bad_f,bad_p).re
    bad_clip=[-z for z in one]
    coord=lambda vec:[inner(psi,vec),inner(one,vec)]
    bad_x=coord(bad_f);bad_xclip=coord(bad_clip)
    mismatch2=sum((z-w).abs2() for z,w in zip(bad_x,bad_xclip))
    residual=F(0)
    consistency_gap_floor=eta*(mismatch2-residual)/2
    require(mismatch2==4 and consistency_gap_floor==F(1,2),
            'clipped coefficient consistency fixture')
    require(1-bad_j>=consistency_gap_floor, 'incorrect near-max gap direction')
    consistency_pointwise_checks=0
    for e in (F(1,8),F(1,4),F(1),F(2)):
        for z,r in points:
            zz=z/max(r,e)
            small_ball=(1-min(r/e,F(1)))**2
            for vv in dirs+[C(),C(F(1,3),F(1,5))]:
                defect=r-(vv.conj()*z).re
                require((vv-zz).abs2()<=2*defect/e+small_ball,
                        'pointwise clipped consistency bound')
                consistency_pointwise_checks+=1
    return {'status':'PASS',
            'scope':'Finite four-point algebraic projection fixture; not a Gaussian realization or endpoint certificate.',
            'epsilon':eps,'base_payoff':j,'test_payoff':new,'finite_gain':gain,
            'weighted_costs':[cost_f,cost_g],'cross_gain':cross,
            'hessian_unscaled_ldl_pivots':pivots,
            'hessian_nonzero_spectral_factor_min':gap,
            'clipped_phase_eta':eta,
            'image_coefficient_ball_radii':[rx,ry],
            'gain_lipschitz_allowance':lip_allowance,
            'uniform_box_gain_lower':box_gain,
            'sample_exact_jump_identities':identity_tests,
            'clipping_loss_checks':approximation_tests,
            'clipping_nonexpansiveness_checks':clip_tests,
            'clipped_consistency_checks':consistency_pointwise_checks,
            'nonstationary_consistency_fixture':{
                'payoff':bad_j,'coefficient_mismatch_squared':mismatch2,
                'small_image_residual':residual,
                'certified_global_gap_lower':consistency_gap_floor,
                'actual_global_gap':1-bad_j},
            'fixture':{'psi':psi,'P':pproj,'Q':qproj,'T':t,
                       'f':f,'g':g,'p':p,'q':q,'h':h,'k':k}}


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--out', type=Path)
    args=ap.parse_args()
    result=encode(replay())
    s=json.dumps(result,indent=2,sort_keys=True)+'\n'
    if args.out:
        args.out.parent.mkdir(parents=True,exist_ok=True)
        args.out.write_text(s)
    print(json.dumps({k:v for k,v in result.items() if k!='fixture'},sort_keys=True))

if __name__=='__main__':
    main()
