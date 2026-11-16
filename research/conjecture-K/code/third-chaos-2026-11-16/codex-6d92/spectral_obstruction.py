"""Agent-ID: codex-6d92. Exact finite-moment obstruction; NOT a chaos law.

Y is +/- 9/10 with total probability 2400/2419, and 5 Z with probability
19/2419.  The matrices are Theorem 7 of arXiv:1305.6579v4.
"""
import sympy as s

a=s.Rational(9,10)
p=s.Rational(19,2419)
def moment(j):
    if j%2:
        return s.S.Zero
    return (1-p)*a**j+p*5**j*(s.factorial2(j-1) if j else 1)

assert moment(0)==moment(2)==1
assert moment(6)<4**6
k4=moment(4)-3
k6=moment(6)-15*moment(4)+30
assert s.Rational(23,10)<k4<74
assert k6>0 and k6**2<68**2*k4**3
assert s.Rational(2400,2419)*a>s.Rational(8247,10000)

for k in range(2,11):
    signs=[]
    for parity in [0,1]:
        ids=list(range(parity,k+1,2))
        A=s.Matrix([[(k-s.Rational(i*j,i+j-1))*moment(i+j) for j in ids] for i in ids])
        signs.extend([s.sign(A[:j,:j].det()) for j in range(1,len(ids)+1)])
    if k<=9:
        assert all(z==1 for z in signs)
    else:
        assert -1 in signs
    print('M',k,'leading principal minor signs:',signs)

x=s.Symbol('x')
for k in range(2,10):
    poly=s.Poly((x**3-3*x)**(2*k),x)
    upper=sum(c*s.factorial2(i[0]-1) for i,c in poly.terms())/6**k
    assert moment(2*k)<upper

print('m4 =',moment(4),'m6 =',moment(6))
print('kappa4 =',k4,'kappa6 =',k6)
print('Eabs =',(1-p)*a+5*p*s.sqrt(2/s.pi))
print('All exact checks passed.')

# All-p hypercontractivity also follows analytically:
# 2<=r<=6: interpolation with ||Y||_6<4 gives
# log||Y||_r < 3(r-2)log(4)/(2r) < 3(r-2)/r
# <= (3/2)log(r-1). Last inequality is log u >= 2(u-1)/(u+1).
# r>=6: ||Y||_r <=5||Z||_r <=5sqrt(r-1)<=(r-1)^(3/2).
