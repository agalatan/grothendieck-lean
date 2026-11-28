"""Rational certificate for two mixed fifth modes forced by a large remote cubic.
Agent-ID: codex-a7c4.
"""
from fractions import Fraction as Q
from math import ceil, factorial, floor, isqrt
from pathlib import Path
import sys

sys.path.insert(0,str(Path(__file__).resolve().parent))
from one_coordinate_multiplier import pi_interval, require

R, J, K, N = 6, 96, 16, 64
D, CASH = 10**9, 10**24
A,C = Q('.88645'),Q('.04855')
B,G = Q('.052'),Q('.030')
L = B+G


def trig():
    low,high = pi_interval()
    require(3<low<high<Q(22,7),"angular window")
    result=[]
    for i in range(N+1):
        x=i*low/N
        err=high-low+Q(22,7)**41/factorial(41)
        cos=sum((-1)**k*x**(2*k)/factorial(2*k) for k in range(21))
        sin=sum((-1)**k*x**(2*k+1)/factorial(2*k+1) for k in range(20))
        result.append((floor(D*(cos-err)),ceil(D*(cos+err)),ceil(D*(sin+err))))
    return result


def radial_masses():
    lo=hi=CASH
    result=[]
    for j in range(R*J):
        dt=Q(2*j+1,J**2)
        pl=1-dt+dt**2/2-dt**3/6
        ph=pl+dt**4/24
        require(0<pl<=ph<=1,"exponential step")
        newlo=floor(lo*pl); newhi=ceil(hi*ph)
        result.append(hi-newlo)
        lo,hi=newlo,newhi
    require(Q(hi,CASH)<Q(1,10**15),"radial tail")
    return result


def check():
    require(B*1000==52 and G*1000==30 and (Q('.37')-B)*1000==318,"test coefficients")
    loc=trig()
    masses=radial_masses()
    denom=K*1000*J*J
    # Each entry is the numerator of one component over denom*D.
    coeffs=[]
    for j in range(R*J+1):
        rr=j*K*1000*J*D
        a=318*J**2+82*j*j
        b=318*J**2+22*j*j
        coeffs.append([(rr,a*lo,a*hi,b*sn) for lo,hi,sn in loc])
    pi_hi=Q(22,7)
    worst=(Q(-1),None)
    for k in range(9*K+1):
        y=Q(k,K)
        angular=[]
        for pts in coeffs:
            total=0
            for i,(offset,c0,c1,s1) in enumerate(pts):
                x=max(abs(offset+k*c0),abs(offset+k*c1))
                n=isqrt(x*x+(k*s1)**2)+1
                v=(n+denom-1)//denom
                total+=v if i in (0,N) else 2*v
            angular.append(total)
        sample=Q(sum(m*(l+h) for m,l,h in zip(masses,angular,angular[1:])),4*N*D*CASH)
        # On an angular panel interpolation of the vector costs sup|v''| h²/8.
        angular_error=y*Q(2,5)*pi_hi**2/(8*N*N)
        # For radial density p(r)=2r exp(-r²), |p'|<=2.  Its covariance
        # with a linear interpolant costs h² |f(r+h)-f(r)|/6 per panel.
        radial_error=R*(1+2*y*L*R)/(6*J*J)+y*L/(4*J*J)
        tail=(37+y*(Q('.318')+37*L))/10**15
        cap=sample+angular_error+radial_error+tail
        extra=cap-(A+C*y*y)
        worst=max(worst,(extra,k))
        # S(y) is convex. Its chord between adjacent ordinates exceeds the
        # polynomial A+Cy² by at most C/(4 K²) beyond the endpoint errors.
        require(extra+C/(4*K*K)<0,f"magnitude {y}, excess {float(extra):.10g}")
    require(C*9>=Q(2,5) and A*A>pi_interval()[1]/4,"linear large-shift estimate")
    print('Integrated angular and radial prices pass at all',9*K+1,'magnitude ordinates.',
          'Worst outward excess before magnitude interpolation',float(worst[0]),'at',Q(worst[1],K))
    for tau,norm in [(Q('.27'),Q('.048')),(Q('.28'),Q('.103')),(Q('.285'),Q('.130'))]:
        gap=Q('.83835')+Q('.37')*tau-(A+C)
        require(gap>0 and gap**2>(B**2+2*G**2)*norm**2,'forced fifth projection')
        print(f't ≥ .83835, tau ≥ {tau}: mixed fifth norm > {norm}, energy > {norm**2}.')


if __name__=='__main__':
    check()
