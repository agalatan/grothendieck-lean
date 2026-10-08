#!/usr/bin/env python3
"""Portable exact C6 audit and rational conditional-first-moment helpers.

Standard library only. The Gaussian/Wick analytic reduction is an explicit
external prerequisite; this verifies its finite scalar refinement. No
floating-point calculation participates in these proof gates.
"""
if not __debug__:
    raise RuntimeError('Do not use Python -O or -OO: assertions are proof gates.')

import json
from fractions import Fraction as Q
from math import comb
from pathlib import Path

C6 = Q(4942288923,100000000)
RHO = Q(977459,1000000)
HERE = Path(__file__).resolve().parent

def multiply(p,q):
    answer=[Q(0)]*(len(p)+len(q)-1)
    for i,a in enumerate(p):
        for j,b in enumerate(q):answer[i+j]+=a*b
    return answer

def bernstein_on_interval(coefficients,left,right):
    """Horner substitution, followed by power-to-Bernstein conversion."""
    assert left<right
    # This uses a different polynomial transformation implementation from
    # the certificate generator in the earlier lower package.
    power=[]
    for a in reversed(coefficients):
        if power:power=multiply(power,[left,right-left])
        else:power=[Q(0)]
        power[0]+=a
    n=len(coefficients)-1
    assert len(power)==n+1
    return [sum((power[j]*Q(comb(k,j),comb(n,j))
                 for j in range(k+1)),Q(0)) for k in range(n+1)]

def verify_c6(path=HERE/'sharper_c6.json'):
    record=json.loads(Path(path).read_text())
    assert Q(record['sixth_coefficient'])==C6
    # Explicit independent expansions of (1+3y^2/2)^3 and N(y)^2.
    denominator=[Q(1),Q(0),Q(9,2),Q(0),Q(27,4),Q(0),Q(27,8)]
    numerator=list(map(Q,['9025/4','15675/2','44325/4','27675/2',
                          '26325/2','6075','18225/4']))
    gap=[Q(50,27)*C6*C6*a-b for a,b in zip(denominator,numerator)]
    assert list(map(Q,record['polynomial']))==gap
    right=Q(0);count=0
    for row in record['intervals']:
        lo,hi,saved_lower=map(Q,row)
        assert lo==right and lo<hi<=1
        lower=min(bernstein_on_interval(gap,lo,hi))
        assert lower==saved_lower and lower>0
        right=hi;count+=1
    assert right==1 and count>0
    return count

def contact_majorant(a,b):
    """Exact P_ab(y)>=y on y>=0; coefficient array has length seven."""
    a,b=Q(a),Q(b)
    assert a>0 and b>0
    s,p=a+b,a*b;den=2*p*s**3
    coefficients=[p*p*(s*s+p)/den,Q(0),
                  (s**4-p*s*s+3*p*p)/den,Q(0),
                  (3*p-2*s*s)/den,Q(0),Q(1)/den]
    factored=multiply(multiply([a*a,-2*a,Q(1)],[b*b,-2*b,Q(1)]),
                       [s*s+p,2*s,Q(1)])
    expected=coefficients.copy();expected[1]-=1
    assert [x/den for x in factored]==expected
    assert coefficients[6]>0
    return coefficients

def conditional_first_coefficients(a,b,sixth=C6):
    """E|q| <= r0+r2*x²+r3*x³, x²=E|q|⁴−2, ||q||₂=1."""
    sixth=Q(sixth)
    assert sixth>=C6  # a weaker proved sixth coefficient is also allowed
    p=contact_majorant(a,b)
    r=[p[0]+p[2]+2*p[4]+6*p[6],Q(0),p[4]+9*p[6],sixth*p[6]]
    assert r[3]>0
    return r

def evaluate(p,x):
    result=Q(0)
    for a in reversed(p):result=result*x+a
    return result

def physical_moment_coefficients(p,scale,x,contacts=None,sixth=C6):
    """u-polynomial at one x endpoint, before gain/actual penalty.

    If contacts is supplied it MUST stay fixed across the entire rectangle.
    Each endpoint uses that same polynomial first-moment bound. Do not take
    independent minima with RHO at the two endpoints: the endpoint-max
    theorem applies to a fixed cubic in x, not an arbitrary lower envelope.
    """
    p=list(map(Q,p));scale,x,sixth=Q(scale),Q(x),Q(sixth)
    assert len(p)==7 and p[3]==p[5]==0 and p[1]>=0 and p[6]>=0
    assert scale>=0 and x>=0 and sixth>=C6
    rr=RHO if contacts is None else evaluate(conditional_first_coefficients(*contacts,sixth),x)
    return [p[0],rr*p[1]*scale,p[2]*scale**2,Q(0),
            p[4]*scale**4*(2+x*x),Q(0),
            p[6]*scale**6*(6+9*x*x+sixth*x**3)]

if __name__=='__main__':
    count=verify_c6()
    # Fixed examples exercise the identity and the conditional-moment bridge.
    for contacts in [(Q(1,2),Q(2)),(Q(9,10),Q(4)),(Q(1),Q(1))]:
        conditional_first_coefficients(*contacts)
    print('PASS sixth-moment coefficient',C6,'on',count,'exact rational intervals')
    print('PASS exact contact-factorization identities and sign checks')
