#!/usr/bin/env python3
"""Independent Arb replay of the normalized-G genuine quintic coefficient.

The finite fifth-chaos identity and the Hermite Bessel budget are analytic
inputs stated in MEHLER_AUDIT.md. This script certifies the three main
one-dimensional integrals and all rational finite-error constants.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from math import factorial
from pathlib import Path
import time

from flint import acb, arb, ctx


def ball(q):
    q=Q(q)
    return arb(q.numerator)/q.denominator


def bounds(value, denominator=10**16):
    lo,hi=Q(str(value.lower().fmpq())),Q(str(value.upper().fmpq()))
    return [Q((lo.numerator*denominator)//lo.denominator,denominator),
            Q(-((-hi.numerator*denominator)//hi.denominator),denominator)]


def constants(m):
    if type(m) is not int or m<1:
        raise ValueError('Positive integer m required')
    return {'kappa_squared':Q(m,m+1), 'A4':Q(m,(m+1)*(m+2)),
            'inverse_d':Q(2,m*(m+1)), 'B2':Q(4*(m-1),(m+1)*(m+2)),
            'C2':Q(12*m,(m+1)*(m+2)*(m+3)),
            'D0':Q(24,m*(m+1)*(m+2)*(m+3))}


def rising(m,k):
    result=1
    for j in range(k):result*=m+j
    return result


def taylor_controls():
    output=[]
    for m in [1,2,3,7,65536,1048576,10**12]:
        moment=lambda k:Q(factorial(k),rising(m,k))
        cc=constants(m)
        a2=Q(m*m,2)*moment(2)
        e_j2=m*m*moment(2)
        e_d2j2=(m**3-2*rising(m,2)*m)*moment(2)
        e_j4=4*rising(m,2)**2*moment(3)
        a4=e_j2+e_d2j2/2+e_j4/24
        b2=-m*moment(2)+m*m*moment(3)
        c2=Q(m*m,2)*moment(4)
        d0=moment(4)
        checks=[a2==cc['kappa_squared'],a4==cc['A4'],b2==cc['B2'],
                c2==cc['C2'],d0==cc['D0'],
                all(0<=v<=Q(4,m)for k,v in cc.items()if k!='kappa_squared')]
        if not all(checks):raise ArithmeticError('Exact angular/radial Taylor control failed')
        output.append({'m':str(m),'checks':len(checks),'constants':{k:str(v)for k,v in cc.items()}})
    return output


def main_moments(c,b,precision):
    c,b=Q(c),Q(b)
    if b<=0:raise ValueError('Positive rational b required')
    if type(precision)is not int or precision<96:raise ValueError('At least 96 bits required')
    ctx.prec=precision
    cc,bb=ball(c),ball(b)
    rootpi,root2,root12=arb.pi().sqrt(),arb(2).sqrt(),arb(12).sqrt()

    def integrand(r,which):
        rr=r*r;t=r*(1+cc*(rr-2)/root2)/bb;x=t*t/2
        i0,i1=x.bessel_i(0,scaled=True),x.bessel_i(1,scaled=True)
        if which==0:
            psi=rootpi*t*(i0+i1)/2
            return 2*rr*(-rr).exp()*(rr*rr-6*rr+6)/root12*psi
        if which==1:
            return rootpi*r*(-rr).exp()*(rr-1)*i0
        return -rootpi/root2*r**3*(-rr).exp()*i1

    values=[]
    for which in range(3):
        value=acb.integral(lambda r,analytic:integrand(r,which),0,8,
                           rel_tol=ball('1e-20'),abs_tol=ball('1e-20'),
                           eval_limit=1000000,depth_limit=40)
        if not value.is_finite()or not value.imag.contains(0):
            raise ArithmeticError('Main-moment integral was not certified')
        values.append(value.real)
    r,e=arb(8),arb(-64).exp();g1=e;g2=(1+r*r)*e
    gh=rootpi*r.erfc();g3h=gh/2+r*e;g5h=3*g3h/2+r**3*e
    g7h=5*g5h/2+r**5*e
    tails=[(g7h+6*g5h+6*g3h)/root12,
           rootpi*(g2+g1)/2,rootpi*g2/(2*root2)]
    for j,tail in enumerate(tails):
        if not 0<tail<ball('1e-22'):raise ArithmeticError('Full Gaussian tail bound failed')
        values[j]+=(-tail).union(tail)
    return values,tails


def verify(data):
    started=time.monotonic();m=int(data['m'])
    if str(m)!=str(data['m']):raise ValueError('Integer m required')
    if not data['profiles']:
        raise ValueError('At least one actual profile is required')
    cc=constants(m)
    positive=max(Q(1,m+1),cc['inverse_d'],cc['B2'],cc['D0'])
    negative=max(cc['A4'],cc['C2'])
    output=[]
    for profile in data['profiles']:
        values,tails=main_moments(profile['c'],profile['b'],data.get('precision_bits',128))
        v,a,b=values;limit=v*v-a*a-b*b;lo,hi=bounds(limit)
        finite=[lo-negative,hi+positive]
        if 'coefficient_lower'in data and not finite[0]>Q(data['coefficient_lower']):
            raise ArithmeticError('Requested finite quintic lower bound failed')
        if 'coefficient_upper'in data and not finite[1]<Q(data['coefficient_upper']):
            raise ArithmeticError('Requested finite quintic upper bound failed')
        output.append({'c':str(Q(profile['c'])),'b':str(Q(profile['b'])),
                       'v_A_B_intervals':list(map(str,values)),
                       'full_tail_intervals':list(map(str,tails)),
                       'limit_coefficient_interval':str(limit),
                       'limit_rational_bounds':list(map(str,[lo,hi])),
                       'finite_rational_bounds':list(map(str,finite))})
    return {'status':'PASS','m':str(m),'profiles':output,
            'finite_constants':{k:str(v)for k,v in cc.items()},
            'positive_error_upper':str(positive),'negative_error_upper':str(negative),
            'universal_absolute_error_upper':str(Q(4,m)),
            'angular_radial_taylor_controls':taylor_controls(),
            'seconds':time.monotonic()-started,
            'scope':__doc__}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('certificate',type=Path);parser.add_argument('--out',type=Path)
    args=parser.parse_args();result=verify(json.loads(args.certificate.read_text()))
    result['input_sha256']=hashlib.sha256(args.certificate.read_bytes()).hexdigest()
    result['verifier_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    text=json.dumps(result,indent=2)+'\n'
    if args.out:args.out.write_text(text)
    print(text,end='')


if __name__=='__main__':main()
