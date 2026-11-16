# Intended filepath: seven_dimensional_certificate.py
"""Exact radial certificate for cubic chaos in at most seven dimensions.

For T~Gamma(7/2,1), verify uniformly in lambda in [0,1] that
 E sqrt(lambda*T^3/(693/8)+(1-lambda)*T*(T-9/2)^2/(63/4)) < 21/25.
Only Python integers and exact Fraction arithmetic are used.
"""
from fractions import Fraction as Q
from math import isqrt

def atan_bounds(reciprocal, pairs=40):
    x=Q(1,reciprocal)
    # Sum through even index 2*pairs is an upper bound; the next odd
    # partial sum is a lower bound by the alternating series theorem.
    upper=sum(((-1)**j*x**(2*j+1)/Q(2*j+1) for j in range(2*pairs+1)),Q(0))
    lower=upper-x**(4*pairs+3)/Q(4*pairs+3)
    return lower,upper

a_lo,a_hi=atan_bounds(5)
b_lo,b_hi=atan_bounds(239)
# Machin's exact identity pi = 16 atan(1/5)-4 atan(1/239).
pi_lo=16*a_lo-4*b_hi
pi_hi=16*a_hi-4*b_lo
assert Q(223,71)<pi_lo<pi_hi<Q(22,7)
scale=10**40
inv_sqrt_pi_lo=Q(isqrt(scale**2*pi_hi.denominator//pi_hi.numerator),scale)
inv_sqrt_pi_hi=Q(isqrt(scale**2*pi_lo.denominator//pi_lo.numerator)+1,scale)
assert inv_sqrt_pi_lo**2*pi_hi<=1
assert inv_sqrt_pi_hi**2*pi_lo>=1
c_lo=Q(16,15)*inv_sqrt_pi_lo
c_hi=Q(16,15)*inv_sqrt_pi_hi

def integral_bounds(m,b):
    """Bounds for integral_0^b u^m exp(-u^2) du.

    Taylor's remainder sign for exp(-x), x>=0, gives even truncations
    above and odd truncations below the exponential, pointwise. Integrate.
    """
    b=Q(b)
    if not b:return Q(0),Q(0)
    term=b**(m+1)/Q(m+1)
    total=term
    upper=None
    for j in range(1,202):
        term *= -b*b*Q(m+2*j-1,j*(m+2*j+1))
        total += term
        if j==200:upper=total
    lower=total
    assert upper is not None and 0<lower<upper
    return lower,upper

degrees=[6,8,10,12]
grid=[Q(j,4) for j in range(25)]
integrals=[{m:integral_bounds(m,b) for m in degrees} for b in grid]
den_a=Q(693,8)
den_b=Q(63,4)

tau_numerators=[
    856494485,181486197548,3256704895835,19051058330250,
    55981248517335,100084383674746,121988320436227,
    117487825445534,113159109881164,109352251245082,
    89203429181985,58170779601674,30521438091590,
    13085246056237,4646341831946,1380990757967,
    346399682672,73799708108,13422601148,2092736763,
    280645907,32463257,3246714,281313,22632,
]
taus=[Q(v,10**15) for v in tau_numerators]

p_upper=[];a_upper=[];b_upper=[]
for j in range(24):
    left,right=integrals[j],integrals[j+1]
    i_lo={m:right[m][0]-left[m][1] for m in degrees}
    i_hi={m:right[m][1]-left[m][0] for m in degrees}
    assert all(i_lo[m]>0 for m in degrees)
    p_upper.append(c_hi*i_hi[6])
    a_upper.append(c_hi*i_hi[12]/den_a)
    b_upper.append(c_hi*(i_hi[12]-9*i_lo[10]+Q(81,4)*i_hi[8])/den_b)

# The remaining interval is sqrt(T)>=6. Each whole normalized moment is1.
tail=integrals[-1]
p_upper.append(1-c_lo*tail[6][0])
a_upper.append(1-c_lo*tail[12][0]/den_a)
tail_b_cdf_lower=tail[12][0]-9*tail[10][1]+Q(81,4)*tail[8][0]
assert tail_b_cdf_lower>0
b_upper.append(1-c_lo*tail_b_cdf_lower/den_b)
assert all(x>0 for x in p_upper+a_upper+b_upper)

tau_sum=sum(taus,Q(0))
endpoint_a=(tau_sum+sum((p*a/t for p,a,t in zip(p_upper,a_upper,taus)),Q(0)))/2
endpoint_b=(tau_sum+sum((p*b/t for p,b,t in zip(p_upper,b_upper,taus)),Q(0)))/2
assert endpoint_a<Q(839,1000)
assert endpoint_b<Q(839,1000)
assert Q(839,1000)<Q(21,25)

# Multiplying radial 21/25 by angular sqrt(80)/(3*pi) gives
# 28 sqrt(5)/(25*pi), which is <sqrt(2/pi) iff pi>392/125.
assert Q(223,71)>Q(392,125)
print('PASS: both affine endpoint bounds are below 839/1000 < 21/25.')
print('PASS: 28*sqrt(5)/(25*pi) < sqrt(2/pi), using pi > 223/71.')
