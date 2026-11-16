# /workspace/scratch/a2f683456ed1/grothendieck-literature-1402/primaldual/certify_cross_gram.py
"""Exact rational certificate for the separate-response Gram improvement.
Only Python standard library. This proves scalar/matrix arithmetic, not the
Gaussian Bessel argument supplied in CROSS_GRAM_PROOF.md.
"""
from fractions import Fraction as F
from hashlib import sha256
from pathlib import Path
import json

E, BETA, ETA = F(1891,2500), F(179,1250), F(-1,35)

def inv2(a,b,d):
    det=a*d-b*b
    assert a>0 and det>0
    return (d/det,-b/det,a/det)

def quadratic_inverse(matrix,x,y):
    a,b,d=inv2(*matrix)
    return a*x*x+2*b*x*y+d*y*y

def mean(eta,t,x,y=F(0)):
    # x+iy = nu/(sqrt(2)*E); hidden variables are c/sqrt(2), alpha.
    matrix=(2*E+F(8,3),2*eta/3,F(13,6))
    real=(2*t/3+2*BETA+8*eta*x/3,2*x/3+7*eta*t/6)
    imag=(8*eta*y/3,2*y/3)
    return (7*t*t/6+8*(x*x+y*y)/3+4*eta*t*x/3+2*BETA*BETA/E
            -quadratic_inverse(matrix,*real)-quadratic_inverse(matrix,*imag))

def scalar(g,eta):
    return g-(g*eta)**2/(E+g)

def a_sector(eta):
    return 1-quadratic_inverse((E+1,eta/2,F(7,4)),eta,F(1,2))

def diff(t,x,y=F(0)):
    return mean(ETA,t,x,y)-mean(F(0),t,x,y)

# Recover and independently verify the exact quadratic polynomial.
c0=diff(F(0),F(0))
ct=(diff(F(1),F(0))-diff(F(-1),F(0)))/2
ctt=(diff(F(1),F(0))+diff(F(-1),F(0)))/2-c0
cx=(diff(F(0),F(1))-diff(F(0),F(-1)))/2
cxx=(diff(F(0),F(1))+diff(F(0),F(-1)))/2-c0
ctx=diff(F(1),F(1))-c0-ct-ctt-cx-cxx
for t,x,y in [(F(17,20),F(3,50),F(1,9)),(F(863,1000),F(7,125),F(0)),(F(-2),F(3),F(4))]:
    assert diff(t,x,y)==c0+ct*t+ctt*t*t+(cx+ctx*t)*x+cxx*(x*x+y*y)
assert ctt<0 and cxx<0

loss={
 'u':- (scalar(F(1,2),ETA)-F(1,2))/E**2,
 'A':- (a_sector(ETA)-F(6,7))/E**2,
 'B':- (scalar(F(4,3),ETA)-F(4,3))/E**2,
 'Q':- (scalar(F(1),ETA)-1)/E**2,
 'P':- (scalar(F(1),ETA)-1)/E**2,
 'nu':-cxx/(2*E**2),
}
assert all(F(0)<=v<=loss['B'] for v in loss.values())
tlo,thi=F(21,25),F(863,1000)
xlo=F(7,125)
assert cx+ctx*tlo>0 and cx+ctx*thi>0
# |Re nu|>=.06 implies |Re z|>=.056, using an exact squared comparison.
assert 2*(E*xlo)**2<F(3,50)**2
energy=F(80051,1000000)
def endpoint(t):
    return c0+ct*t+ctt*t*t+(cx+ctx*t)*xlo-loss['B']*energy
lower=min(endpoint(tlo),endpoint(thi))
assert lower==F(537363070714908327898093,1370804246385332741850000000)
assert lower>F(39,100000)

# Prove pi<22/7 by the alternating Machin series, no floating point.
def atan_bounds(x,n):
    p=sum(((-1)**k*x**(2*k+1)/F(2*k+1) for k in range(n)),F(0))
    q=p+(-1)**n*x**(2*n+1)/F(2*n+1)
    return min(p,q),max(p,q)
a,b=atan_bounds(F(1,5),12)
c,d=atan_bounds(F(1,239),4)
pi_lower,pi_upper=16*a-4*d,16*b-4*c
assert pi_upper<F(22,7)
# J1 is positive on an explicit energy subset. Nonnegative square omitted.
j1_lower=(F(851,1000)**2-F(11,14)
 +(F(3,200)+F(6,7)*F(1,50)+F(16,13)*F(9,2500))/E**2)
assert j1_lower==F(784508743371,325405171000000)
assert j1_lower>F(24,10000)
# One energy profile in the claimed subset meets the specified caps.
t,u,A,nu2=F(851,1000),F(3,100),F(1,50),F(9,2500)
assert u<=F(463,10000)
assert u+A+nu2<=energy
D=u/2+2*A/3+8*nu2/7
assert D<=E**2*(pi_lower/4-t*t)
assert nu2<F(1,50)
# Remote-response chord as provided by the current research program.
assert u<=4*E**2*F(432306903,10**9)*(F(886762780,10**9)-t)

out={
 'status':'PASS: exact rational scalar and matrix certificate',
 'eta':str(ETA),'epsilon':str(E),'beta':str(BETA),
 'uniform_gain_fraction':str(lower),'uniform_gain_gt':'39/100000',
 'positive_J1_fraction':str(j1_lower),'positive_J1_gt':'24/10000',
 'gain_polynomial':dict(zip(['constant','t','t_squared','Re_z','t_Re_z','abs_z_squared'],
                           map(str,[c0,ct,ctt,cx,ctx,cxx]))),
 'energy_loss_coefficients':{k:str(v) for k,v in loss.items()},
 'source_html_sha256':'caf53f07b82934daa1b07c265419c6c7c772134f409889ae94c77605c52bc9a1',
 'limitations':['Gaussian proof is author-derived, not Lean-checked.',
 'This improves the raw Lambda response penalty; it does not certify the raw Lambda payoff.',
 'Do not subtract full Sigma again from the retained LambdaHat bound.',
 'Energy-profile feasibility is not a construction of realizable responses.']}
print(json.dumps(out,indent=2))
Path(__file__).with_name('cross_gram_certificate.json').write_text(json.dumps(out,indent=2)+'\n')
