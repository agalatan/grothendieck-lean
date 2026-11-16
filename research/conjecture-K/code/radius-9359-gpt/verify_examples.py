# cubic_l1_certificate/verify_examples.py
"""Exact moment-law and symbolic polynomial checks, standard library only."""
from fractions import Fraction as Q
from math import comb,factorial
from verify import add,scale,mul,power

# The moment-only counterexample.
prob=[Q(600,601),Q(1,601)]
vals=[Q(9,10),Q(61)]
mom=[sum((p*v**k for p,v in zip(prob,vals)),Q(0)) for k in range(1,4)]
assert mom==[Q(1),Q(7),Q(1892,5)]
assert Q(9486,10000)**2<vals[0] and Q(781,100)**2<vals[1]
lower=prob[0]*Q(9486,10000)+prob[1]*Q(781,100)
assert lower>Q(96,100)
assert Q(51)+10*Q(4045313,100000)>mom[2]
assert mom[1]+2*(mom[1]-1)==19
print('PASS: moment law has s=5, satisfies the given moment ceilings, and E sqrt(V)>0.96.')
print('PASS: its radial Stein budget would be at least 19, exceeding s=5.')

# Polynomials are in the symbolic variable n, represented by ascending coefficients.
# E[T^k (T+S)^j] = k! (n+k)_j, with T~Exp(1), S~Gamma(n-1,1).
def rising(k,j):
    out=[Q(1)]
    for i in range(j):out=mul(out,[Q(k+i),Q(1)])
    return out

def q_moment(k):
    out=[Q(0)]
    for j in range(2*k+1):
        term=mul(power([Q(-1),Q(-1)],2*k-j),rising(k,j))
        out=add(out,scale(term,Q(comb(2*k,j)*factorial(k))))
    return out

u=q_moment(1)
fourth=q_moment(2)
delta=add(fourth,scale(mul(u,u),-2))
A=scale(power([Q(3),Q(1)],2),2)
B=[Q(64),Q(32)]
t=add(scale(mul([Q(2),Q(1)],[Q(3),Q(1)]),2),scale(mul(u,u),-1))
assert u==[Q(1),Q(1)]
assert fourth==[Q(106),Q(64),Q(6)]
assert delta==[Q(104),Q(60),Q(4)]
assert A==[Q(18),Q(12),Q(2)]
assert t==[Q(11),Q(8),Q(1)]
assert delta==add(add(A,B),scale(t,2))
assert scale(add(A,scale(B,Q(1,4))),Q(1,2))==[Q(17),Q(10),Q(1)]
assert scale(add(A,scale(B,Q(1,2))),Q(1,2))==[Q(25),Q(14),Q(1)]
print('PASS: the q_n moment and projection formulas hold as exact polynomial identities in n.')
print('PASS: E|a|^2 / E[Vb] = (n^2+10n+17)/(n^2+14n+25), tending to 1.')
