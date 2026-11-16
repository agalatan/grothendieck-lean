# Intended filepath: six_dimensional_certificate.py
"""Exact-arithmetic radial certificate for all cubics in at most six Gaussians.

For T~Gamma(3,1), prove uniformly over 0<=lambda<=1 that
 E sqrt(lambda*T^3/60 + (1-lambda)*T*(T-4)^2/12) < 83/100.

The analytic reduction is in six_dimensional_proof.tex. No numerical
quadrature or floating-point arithmetic is used by this verifier.
"""

from fractions import Fraction as Q
from math import factorial

# Positive Taylor series for exp(2); after term 40, successive term ratios
# are <= 2/42. Taking reciprocals encloses q=exp(-2).
exp_two_lower = sum(Q(2**j, factorial(j)) for j in range(41))
exp_two_upper = exp_two_lower + Q(2**41, factorial(41)) / (1-Q(2, 42))
q_lower = 1 / exp_two_upper
q_upper = 1 / exp_two_lower

def survival_polynomials(t):
    """p=P(T>=t), a=E[K3;T>=t], b=E[K1;T>=t], each divided by exp(-t)."""
    t=Q(t)
    p=1+t+t*t/2
    a=sum(t**j/factorial(j) for j in range(6))
    b=(t**5-3*t**4+4*t**3+12*t*t+24*t+24)/24
    assert p>0 and a>0 and b>0
    return p,a,b

# Partition [0,2),[2,4),...,[22,24),[24,infinity).
# Each tau is an arbitrary positive rational chosen near the cell's
# Cauchy contribution at lambda=901/2000. Its origin is irrelevant to
# validity: sqrt(z) <= (z/tau+tau)/2 for every z>=0 and tau>0.
tau_numerators = [
    209348125670, 269171624541, 185197047213, 107072713153,
    41670053327, 12718770633, 3329218641, 784596676,
    171348368, 35321389, 6958708, 1321845, 297387,
]
taus=[Q(v,10**12) for v in tau_numerators]

p_upper=[]
a_upper=[]
b_upper=[]
for j in range(13):
    left=survival_polynomials(2*j)
    if j<12:
        right=survival_polynomials(2*j+2)
        upper=[q_upper**j*x-q_lower**(j+1)*y for x,y in zip(left,right)]
    else:
        upper=[q_upper**j*x for x in left]
    assert all(x>0 for x in upper)
    p_upper.append(upper[0]); a_upper.append(upper[1]); b_upper.append(upper[2])

# Cellwise Cauchy and the elementary tangent inequality show that the
# uniform radial upper bound is at most max(endpoint_a,endpoint_b).
tau_sum=sum(taus,Q(0))
endpoint_a=(tau_sum+sum((p*a/t for p,a,t in zip(p_upper,a_upper,taus)),Q(0)))/2
endpoint_b=(tau_sum+sum((p*b/t for p,b,t in zip(p_upper,b_upper,taus)),Q(0)))/2
assert endpoint_a < Q(82951,100000)
assert endpoint_b < Q(82951,100000)
assert Q(82951,100000)<Q(83,100)

# The angular constant is sqrt(80)/(3*pi). Consequently multiplying the
# certified radial constant 83/100 gives 83*sqrt(5)/(75*pi).
# It is less than sqrt(2/pi) whenever pi > 6889/2250. Archimedes suffices.
assert Q(223,71)>Q(6889,2250)

print('PASS: both affine endpoint bounds are below 82951/100000 < 83/100.')
print('PASS: 83*sqrt(5)/(75*pi) < sqrt(2/pi), using pi > 223/71.')
