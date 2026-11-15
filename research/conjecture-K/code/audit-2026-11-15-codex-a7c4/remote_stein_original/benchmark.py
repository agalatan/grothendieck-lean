# cubic-chaos-local-stability/verify-interval.py
from flint import arb, acb, ctx
from math import factorial
ctx.prec=100
a=arb(699)/1250;b=arb(179)/1250;p=arb(2500)/1891
pi=arb.pi()
T=64
intervals=[arb(j)/4 for j in range(257)]
def calc(v,derivative=False):
 def integrand(t,_):
  x=t*(a+b*t)**2/v
  z=x/2
  i=z.bessel_i(0,scaled=True)
  if derivative:return (-t).exp()*i
  # Integration by parts removes I_1; see PROOF.md, equation (23).
  A=a+b*t;B=a+3*b*t
  h=2*t*A/B
  dh=2*(a*a+2*a*b*t+3*b*b*t*t)/(B*B)
  return (-t).exp()*(1+2*x+h-dh)*i
 value=acb(0)
 for l,r in zip(intervals,intervals[1:]):
  value+=acb.integral(integrand,l,r,rel_tol=arb('1e-25'),abs_tol=arb('1e-25'),eval_limit=100000)
 if derivative:
  value=value.real*pi.sqrt()/(2*v.sqrt())-p
  tail=pi.sqrt()/(2*v.sqrt())*arb(-T).exp()
 else:
  value=value.real*(pi*v).sqrt()-p*v
  # Restore the finite-endpoint term from integration by parts.
  xT=arb(T)*(a+b*T)**2/v
  hT=2*T*(a+b*T)/(a+3*b*T)
  value+=(pi*v).sqrt()*arb(-T).exp()*hT*acb(xT/2).bessel_i(0,scaled=True).real
  tail=arb(-T).exp()*(2*a*(T+1)+2*b*(T*T+2*T+2)+(pi*v).sqrt())
 return value+arb(tail/2,tail/2)
l=arb(40344)/10**6;r=arb(40346)/10**6;m=arb(403448)/10**7
fl=calc(l,True);fr=calc(r,True);fm=calc(m);dm=calc(m,True)
print('fprime_left',fl,flush=True);print('fprime_right',fr,flush=True)
print('f_middle',fm,flush=True);print('fprime_middle',dm,flush=True)
assert fl>0 and fr<0
# Strict concavity plus this sign bracket locates every maximum inside [l,r].
upper=fm+abs(dm)*(r-l)
print('S lower',fm.lower(),flush=True); print('S upper',upper.upper(),flush=True)
assert fm>arb('1.3739535256614')
assert upper<arb('1.3739535256616')
print('PASS: 1.3739535256614 < S < 1.3739535256616',flush=True)

# Additional curvature certificate, with the I_1 term removed by integration by parts.
a=arb(699)/1250;b=arb(179)/1250;v=arb(1)/20
T=64
c=arb.pi().sqrt()/(2*v*v.sqrt())
def integrand(t,_):
 x=t*(a+b*t)**2/(2*v)
 A=a+b*t;B=a+3*b*t
 q=t*A/B
 dq=(a*a+2*a*b*t+3*b*b*t*t)/(B*B)
 return (-t).exp()*(dq-q-arb(1)/2)*x.bessel_i(0,scaled=True)
w=acb(0)
for i in range(256):
 w+=acb.integral(integrand,arb(i)/4,arb(i+1)/4,rel_tol=arb('1e-20'),abs_tol=arb('1e-20'))
def tailmoment(k):return arb(-T).exp()*factorial(k)*sum((arb(T)**j/factorial(j) for j in range(k+1)),arb(0))
tail=c*((a*a*tailmoment(1)+2*a*b*tailmoment(2)+b*b*tailmoment(3))/v+tailmoment(0)/2)
qT=T*(a+b*T)/(a+3*b*T)
xT=T*(a+b*T)**2/(2*v)
val=c*(w.real-arb(-T).exp()*qT*acb(xT).bessel_i(0,scaled=True).real)+arb(0,tail)
print('Msecond_at_one_twentieth',val)
assert val < -2
print('PASS: Msecond(1/20) < -2')
