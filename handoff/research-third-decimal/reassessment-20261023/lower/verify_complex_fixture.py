#!/usr/bin/env python3
"""Exact rational complex-Gram fixture, using only the standard library."""
from fractions import Fraction as F


def psd2(a,b,re,im):
    return a>=0 and b>=0 and a*b-re*re-im*im>=0


def main():
    if not __debug__:
        raise SystemExit('Reject -O/-OO: exact acceptance assertions must be enabled')
    # V=[[1,4i/5],[-4i/5,1]]. Current script keeps only Re(V)=I.
    a,b,vre,vim = F(1),F(1),F(0),F(4,5)
    c,d = F(9,20),F(1,10)
    # The old real body and stability admit this K, with H=d I.
    k11,k22,kre = F(1,2),F(1,2),-c
    assert psd2(k11,k22,kre,F(0))
    assert psd2(a-k11,b-k22,vre-kre,F(0))
    assert c+kre==0
    assert abs(2*c+vre)<=F(1)+2*d
    # Full complex structure reduces the radius from 1 to 3/5.
    radius=F(3,5)
    assert radius**2==a*b-vim**2
    assert abs(2*c+vre)>radius+2*d
    # Both endpoints of the complex interval are attained exactly.
    for sign in [-1,1]:
        kre=sign*F(3,10)
        kim=F(2,5)
        assert psd2(k11,k22,kre,kim)
        assert psd2(a-k11,b-k22,vre-kre,vim-kim)
        assert abs(2*kre-vre)==radius
    # A rational geometric proof of the new reflection inequality.
    # For complex-linear orthogonal P, R=2P-I is a self-adjoint isometry.
    # Its real pairing <Rx,y> has the imaginary pairing <Rx,ix>=0.
    # Projection of y onto i*x yields the asserted subtraction term.
    print('PASS real-only completion accepted, complex completion excluded')
    print('PASS sharp complex radius 3/5, both rational PSD endpoints')
    print('Strict exclusion: 9/10 > 4/5; old screen: 9/10 <= 6/5')
    print('Scope: exact fixture and endpoint checks; general theorem has paper proof')


if __name__=='__main__':
    main()
