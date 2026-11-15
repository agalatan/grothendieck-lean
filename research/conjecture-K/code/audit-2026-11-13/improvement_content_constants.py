"""Analytic rational bounds and independent scalar checks; codex-a713."""
import sys
sys.dont_write_bytecode=True
from fractions import Fraction as Q
import json,math
from pathlib import Path
from scipy.integrate import quad
p=Path(__file__).resolve().parent
a=Q(699,1250);b=Q(179,1250);sqrtpi_upper=Q(1773,1000)
x=b/a
L_upper=sqrtpi_upper/(4*a)*(1+x/2+3*x*x/2)
M1_upper=sqrtpi_upper*(5*a*a+12*a*b+15*b*b)/(16*a**5)
phi_prime_upper=sqrtpi_upper/(2*a)
EL2=a*a+4*a*b+6*b*b
assert L_upper<1
assert M1_upper<6
assert phi_prime_upper<Q(8,5)
assert EL2+Q(463,10000)<Q(81,100)
# B'>=.9 follows Gaussian-mixture Jensen and sqrt(pi)>81/50=1.62.
assert Q(314,100)>Q(81,50)**2
C0sq=Q(9,40)*Q(8,5)*Q(463,10000)
assert C0sq<Q(13,100)**2
extension_coefficient=1+2*5*Q(13,100)+Q(6,25)*(Q(8,5)-Q(9,10))
assert extension_coefficient<Q(5,2)
assert Q(5,2)*Q(3,500)==Q(6,25)-Q(9,40)
af,bf=float(a),float(b)
def m1_integrand(s):
 t=s*s;K=(af+bf*t)*(af+3*bf*t);Kp=4*af*bf+6*bf*bf*t
 return .25*math.exp(-t)*((2-t)/K-(t-1)*Kp/K**2)/(af+bf*t)
m1,err=quad(m1_integrand,0,10,epsabs=1e-12,epsrel=1e-12)
out={'agent':'codex-a713','exact_rational_bounds':{k:str(v) for k,v in [('L_upper',L_upper),('M1_upper',M1_upper),('phi_prime_upper',phi_prime_upper),('EL2',EL2),('C0_squared_upper',C0sq),('extension_coefficient',extension_coefficient)]},'decimal_bounds':{'L_upper':float(L_upper),'M1_upper':float(M1_upper),'phi_prime_upper':float(phi_prime_upper),'extension_coefficient':float(extension_coefficient)},'m1_independent_quad':m1,'quad_error_estimate':err,'status':'Rational inequalities exact; displayed integral floating only'}
(p/'improvement_content_constants.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
