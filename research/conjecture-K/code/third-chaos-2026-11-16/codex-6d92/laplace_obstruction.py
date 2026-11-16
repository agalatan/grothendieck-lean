# Agent-ID: codex-6d92. Refs #458. Exact rational certificate.
# F=He_3(G)/sqrt(6), p_F(0)/phi(0)=sqrt(2/3)*(1+exp(-3/2)).
# The three simple preimages of 0 are 0,+sqrt(3),-sqrt(3).
# Continuity at 0 implies sqrt(t) E exp(-t F^2) -> sqrt(pi) p_F(0).
# Thus the following strict density inequality disproves the Gaussian
# Laplace lower bound for all sufficiently large t. It does not disprove L1.
from fractions import Fraction as Q
from math import factorial
s=sum((Q(3,2)**j/factorial(j) for j in range(7)),Q(0))
assert s==Q(4585,1024)>Q(125,28)
# exp(3/2)>s>125/28, hence exp(-3/2)<28/125.
u=Q(2,3)*(1+Q(28,125))**2
assert u==Q(15606,15625)<1
print('PASS: (p_F(0)/phi(0))^2 < 15606/15625 < 1.')

# Explicit small-ball and Laplace violations. All arithmetic is rational.
# Let f(x)=(x^3-3x)/sqrt(6), eps=1/1000, phi0=1/sqrt(2*pi).
# For |y|<=eps the three inverse branches lie in
# [-9/5,-17/10], [-1/100,1/100], [17/10,9/5].
# Their endpoints bracket [-eps,eps] using 2<sqrt(6)<5/2.
eps=Q(1,1000)
fnum=lambda x:x**3-3*x
assert fnum(Q(1,100)) < -Q(5,2)*eps
assert fnum(Q(17,10)) < -Q(5,2)*eps
assert fnum(Q(9,5)) > Q(5,2)*eps
assert 3*(1-Q(1,100)**2)/Q(5,2)>1
assert 3*(Q(17,10)**2-1)/Q(5,2)>1
# On these branches |x|<=2, |f'|>=1, |f''|<=5, |f'''|<=3.
# Differentiating q(y)=phi(x(y))/|f'(x(y))| twice gives the bound
# |q''| <= phi0*((x^2+1)/|f'|^3 + 3|x*f''|/|f'|^4
#                 + |f'''|/|f'|^4 + 3*f''^2/|f'|^5).
branch_second=5+3*2*5+3+3*5**2
assert branch_second==113
M=3*branch_second
assert M==339
# p_F is even, hence p_F'(0)=0 and
# p_F(y)<=p_F(0)+(339/2)*phi0*y^2 for |y|<=eps.
# sqrt(1-v)<=1-v/2 gives p_F(0)/phi0 < 1-19/31250.
delta=(1-u)/2
assert delta==Q(19,31250)
# exp(-y^2/2)>=1-y^2/2 gives the Gaussian small-ball lower bound.
small_ball_gap_coefficient=2*eps*(delta-Q(M+1,6)*eps**2)
assert small_ball_gap_coefficient==Q(827,750000000)>0
print('PASS: P(|G|<=1/1000)-P(|F|<=1/1000) > 827*phi(0)/750000000.')

# Split E exp(-t*F^2) at |F|=eps, bound the outside by exp(-t*eps^2),
# and extend the density upper bound inside to a Gaussian integral on R.
# This gives L_F(t) <= (1/sqrt(2t))*(1-delta+339/(4t)) + exp(-t*eps^2).
# L_G(t)=(1+2t)^(-1/2) >= (1/sqrt(2t))*(1-1/(4t)).
t=10**8
assert t*eps**2==100
margin=delta-Q(M+1,4*t)
assert margin>0 and 2*t<20000**2
# e>2, so exp(-100)<2^(-100).
laplace_gap_lower=margin/20000-Q(1,2**100)
assert laplace_gap_lower>Q(3,10**8)
print('PASS: (1+2*10^8)^(-1/2)-E exp(-10^8*F^2) > 3/10^8.')
