# /workspace/scratch/a2f683456ed1/grothendieck-literature-1402/existing-program/certify_shoulders.py
"""Arb Rice-benchmark enclosures + rational endpoint budgets; all-sector premises remain OPEN."""
if not __debug__:
 raise RuntimeError('Run without -O; assertions are required.')
import json
from fractions import Fraction as F
from flint import arb, acb, ctx
ctx.prec=100
e=F(1891,2500)
target=F(500,701)
rows=[
 ('.81','.83','.8157145','.13489','.0545636','.0545639','1.330001610','.00034'),
 ('.83','.84','.835','.1402446','.0453099','.0453102','1.358309611','.00015'),
 ('.851','.86','.8579534','.1465599','.0345552','.0345556','1.392331071','.00017'),
 ('.856','.863','.8684666','.1494296','.0297248','.0297252','1.408031355','.00027')
]

def A(q):
 q=F(q);return arb(q.numerator)/q.denominator

def calc(ell,beta,v,derivative=False):
 a=A(ell)-2*A(beta);b=A(beta);p=1/A(e);v=A(v)
 def integrand(t,_):
  x=t*(a+b*t)**2/v
  zi=x/2
  i=zi.bessel_i(0,scaled=True)
  if derivative:return (-t).exp()*i
  aa=a+b*t;bb=a+3*b*t
  h=2*t*aa/bb
  dh=2*(a*a+2*a*b*t+3*b*b*t*t)/(bb*bb)
  return (-t).exp()*(1+2*x+h-dh)*i
 value=acb(0)
 for j in range(256):
  value+=acb.integral(integrand,arb(j)/4,arb(j+1)/4,
      rel_tol=arb('1e-23'),abs_tol=arb('1e-23'),eval_limit=100000)
 if derivative:
  value=value.real*arb.pi().sqrt()/(2*v.sqrt())-p
  tail=arb.pi().sqrt()/(2*v.sqrt())*arb(-64).exp()
 else:
  value=value.real*(arb.pi()*v).sqrt()-p*v
  xT=arb(64)*(a+b*64)**2/v
  hT=128*(a+b*64)/(a+3*b*64)
  value+=(arb.pi()*v).sqrt()*arb(-64).exp()*hT*acb(xT/2).bessel_i(0,scaled=True).real
  tail=arb(-64).exp()*(130*a+2*b*(64*64+128+2)+(arb.pi()*v).sqrt())
 # Exact bound [0,tail.upper()] on the omitted nonnegative integral.
 return value+arb(tail/2,tail/2)

def run(row):
 lo,hi,ell,beta,vl,vr,shi,eta=map(F,row)
 vm=(vl+vr)/2
 dl=calc(ell,beta,vl,True);dr=calc(ell,beta,vr,True)
 assert dl>0 and dr<0
 jm=calc(ell,beta,vm);dm=calc(ell,beta,vm,True)
 upper=jm+abs(dm)*(A(vr)-A(vl))
 assert upper<A(shi)
 env=max(t*t-2*ell*t+2*beta*beta/e for t in [lo,hi])
 eta_max=target-env-shi
 assert eta<eta_max
 # Caps valid throughout [lo,hi] because both displayed functions decrease.
 ucap=4*A(e)**2*A('0.432306903')*(A('0.886762780')-A(lo))
 totalcap=A(e)**2*(arb(3)/2*(arb.pi()/4-A(lo)**2)+A('.432306903')*(A('.886762780')-A(lo)))
 return {'lo':str(lo),'hi':str(hi),'ell':str(ell),'beta':str(beta),
 'S_lower_interval':str(jm),'S_upper_interval':str(upper),'S_upper_accepted':str(shi),
 'v_lower':str(vl),'v_upper':str(vr),'derivative_lower':str(dl),'derivative_upper':str(dr),
 'eta_max_exact':str(eta_max),'eta_max_decimal':float(eta_max),
 'eta_requested':str(eta),'cap_margin_exact':str(eta_max-eta),
 'remote_cap_interval':str(ucap),'total_cap_interval':str(totalcap),
 'status':'CERTIFIED benchmark/budget; OPEN universal all-sector inequality'}

if __name__=='__main__':
 out=[]
 for row in rows:
  result=run(row);out.append(result);print(json.dumps(result),flush=True)
 with open('certified_shoulders.json','w') as f:json.dump(out,f,indent=2)
 print('PASS: four benchmark bounds and exact conditional consumer budgets')
