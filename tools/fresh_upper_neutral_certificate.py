#!/usr/bin/env python3
"""Certify strict obstructions for neutral/even Gaussian auxiliary models.

All directed numerical inequalities use python-flint/Arb. The accompanying
paper proof explains the Hermite-block reduction. This is a restricted
rounding-class obstruction, NOT a lower bound on the Grothendieck constant.
"""
import argparse
from fractions import Fraction as F
import json
from pathlib import Path
import flint
from flint import arb,ctx
from fresh_upper_hankel_certificate import certificate as hankel_certificate


def checked(condition,message):
    if not condition:
        raise ArithmeticError(message)


def poly_mul(a,b):
    c=[F(0)]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b): c[i+j]+=x*y
    return c


def moment_bounds(mesh=1000,radius=6,bits=128):
    for name,value in [('mesh',mesh),('radius',radius),('bits',bits)]:
        if type(value) is not int or value<=0:
            raise ValueError(f'{name} must be a positive integer')
    if bits<64: raise ValueError('bits must be at least 64')
    ctx.prec=bits
    pi=arb.pi()
    def C(r):
        x=r*r/4
        return (pi/8).sqrt()*(-x).exp()*(x.bessel_i(0)-x.bessel_i(1))
    # Exact L_k^1(r²) coefficients in powers of r; k=0,1,2.
    laguerre=[[F(1)],[F(2),F(0),F(-1)],
              [F(3),F(0),F(-3),F(0),F(1,2)]]
    h=arb(1)/mesh
    finite=[arb(0) for _ in laguerre]
    for i in range(mesh*radius):
        a,b=arb(i)/mesh,arb(i+1)/mesh
        # All centres/radii/endpoints are constructed by Arb rational arithmetic.
        r=arb(2*i+1)/(2*mesh)+arb(0,1)/(2*mesh)
        x=r*r
        polys=[arb(1),2-x,3-3*x+x*x/2]
        common=h*b*b*(-3*a*a/2).exp()/C(b)
        for k,p in enumerate(polys):
            finite[k]+=2*common*abs(p).upper()**2/(k+1)

    R=arb(radius); exponential=(-3*R*R/2).exp()
    # I_m(R)=int_R^infty r^m exp(-3r²/2)dr.
    moments=[exponential/(3*R),exponential/3]
    for m in range(2,14):
        moments.append(R**(m-1)*exponential/3+(m-1)*moments[m-2]/3)
    c=(2/pi).sqrt()*(-arb(1)/2).exp()/3
    tails=[]
    for k,p in enumerate(laguerre):
        p_abs=[abs(x) for x in p]
        square=poly_mul(p_abs,p_abs)
        expanded=poly_mul([F(0),F(0),F(1)],poly_mul([F(1),F(3),F(3),F(1)],square))
        tail=arb(0)
        for m,coef in enumerate(expanded):
            tail+=(arb(coef.numerator)/coef.denominator)*moments[m]
        tails.append(2*tail/((k+1)*c))
    totals=[x+y for x,y in zip(finite,tails)]
    caps=[2,2,1]
    for k,(x,cap) in enumerate(zip(totals,caps)):
        checked(x<cap,f'zeta_{k} bound failed: {x} is not below {cap}')
    report={'precision_bits':bits,'mesh_denominator':mesh,'radius':radius,
            'rectangles_per_integral':mesh*radius,'rational_caps':caps,
            'finite_upper_enclosures':[str(x) for x in finite],
            'tail_upper_enclosures':[str(x) for x in tails],
            'zeta_upper_enclosures':[str(x) for x in totals]}
    return report


def largest2(A,B,C):
    return (A+C+((A-C)**2+4*B*B).sqrt())/2


def certificate(mesh=1000,radius=6,bits=128):
    moment_report=moment_bounds(mesh,radius,bits)
    hankel=hankel_certificate(mesh=40,radius=6,bits=bits)
    H=arb(hankel['HS_squared_upper_enclosure'])
    checked(H<arb(7)/4,'Need Hankel HS²<7/4')
    rho=arb(7)/8
    checked((H-1)<rho*rho,'Hankel nonconstant norm not below rho')
    pi=arb.pi(); half=arb(1)/2
    gamma=(pi/4)*arb(-1).hypgeom_2f1(half,half,2)
    energies=[pi/4,pi/32,3*pi/256]
    alpha2=[x/gamma for x in energies]
    caps=[arb(2),arb(2),arb(1)]
    beta2=[z-a for z,a in zip(caps,alpha2)]
    checked(all(x>0 for x in beta2),'Negative orthogonal squared-norm cap')
    alpha=[x.sqrt() for x in alpha2]; beta=[x.sqrt() for x in beta2]
    eps=arb(1)/1000; t=arb(1)/500; q=1-eps

    # j=0 block qQ + eps*u0u0* - 2t*u2u2*.
    A0=q+eps*alpha2[0]-2*t*alpha2[2]
    B0=eps*alpha[0]*beta[0]+2*t*alpha[2]*beta[2]
    C0=q*rho+eps*beta2[0]
    upper0=largest2(A0,B0,C0)
    lower_abs0=q*rho+2*t*caps[2]

    # Negative of j=1 block: qQ + 2t*u1u1*.
    A1=q+2*t*alpha2[1]
    B1=2*t*alpha[1]*beta[1]
    C1=q*rho+2*t*beta2[1]
    neg_upper1=largest2(A1,B1,C1)
    pos_upper1=q*rho

    # j=2 block qQ - 2t*u0u0*, and j>=3 blocks +/-qQ.
    upper2=q; lower_abs2=q*rho+2*t*caps[0]
    other=q
    bounds=[upper0,lower_abs0,neg_upper1,pos_upper1,upper2,lower_abs2,other]
    L=arb(99993)/100000
    for x in bounds: checked(x<L,f'Block norm exceeds selected rational bound: {x}')
    D=gamma*L
    checked(D<arb('0.711947'),'Does not beat the stated incumbent-score comparison')
    return {'status':'PASS: rigorous restricted-model operator obstruction',
            'scope':'Independent ordinary complex z of grade1, charge-one under z rotation alone; auxiliary either any finite/countable neutral Gaussian family Y correlated by t²I, or ordinary real Gaussian family V correlated by tI with responses globally even in V. Arbitrary joint radial/auxiliary dependence is allowed.',
            'python_flint_version':flint.__version__,'moments':moment_report,
            'hankel_certificate':hankel,'rho':'7/8','eps':'1/1000','t':'1/500',
            'gamma_enclosure':str(gamma),'phase_energy_enclosures':[str(x) for x in energies],
            'alpha_squared_enclosures':[str(x) for x in alpha2],
            'block_bounds':{'j0_upper':str(upper0),'j0_negative_absolute':str(lower_abs0),
                            'j1_negative_absolute':str(neg_upper1),'j1_upper':str(pos_upper1),
                            'j2_upper':str(upper2),'j2_negative_absolute':str(lower_abs2),
                            'j_ge3_norm':str(other)},
            'uniform_operator_norm_rational':'99993/100000',
            'D_ceiling_enclosure':str(D),
            'contractions':'Separate linear Gaussian contractions preserving z-charge and auxiliary parity/grade classes may be absorbed into responses; no nonlinear final correlation preprocessing',
            'included_even_images':'Arbitrary even Gaussian images Q(V), including finite quadratic drivers and arbitrary nonlinear dependence on them; radial coupling with |z| is allowed.',
            'not_claimed':'No Grothendieck endpoint, nonlinear final preprocessing, symmetry-breaking response, or arbitrary correlated driver process without the stated Gaussian representation is covered.'}


if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--mesh',type=int,default=1000)
    p.add_argument('--radius',type=int,default=6);p.add_argument('--bits',type=int,default=128)
    p.add_argument('--output',type=Path)
    a=p.parse_args();r=certificate(a.mesh,a.radius,a.bits)
    if a.output:a.output.write_text(json.dumps(r,indent=2)+'\n')
    print(json.dumps(r,indent=2))
