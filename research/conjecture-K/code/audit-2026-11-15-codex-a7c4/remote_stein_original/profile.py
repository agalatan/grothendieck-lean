from flint import arb, acb, ctx
ctx.prec=100
a=arb(699)/1250;b=arb(179)/1250
def evaluate(s):
 s=arb(s);r=s.sqrt();eps=arb(1)/10**14
 # Enclose the unique positive solution t(a+bt)^2=s by bisection.
 lo=arb(0);hi=1+s/a**2
 for _ in range(130):
  mid=(lo+hi)/2
  d=mid*(a+b*mid)**2-s
  if d>0:hi=mid
  elif d<0:lo=mid
  else:break
 root=(lo+hi)/2
 l=root-eps;u=root+eps
 assert eps<l and u<64
 assert l*(a+b*l)**2<s and u*(a+b*u)**2>s
 def fun(t,analytic,deriv):
  R=t.sqrt(analytic=analytic)*(a+b*t)
  small=abs(R)<r
  large=abs(R)>r
  if analytic:
   if not (small or large):return acb('nan')
   # Positive hypergeometric coefficients give |A(z)|<=A(1)=4/pi<2
   # and |A'(z)|<=A'(1)=1/pi<1 for |z|<=1.
   bound=((4/r if small else 2/abs(R)) if deriv else (4*r if small else 4*abs(R)))
   bound*=(-t.real).exp()
   return acb(arb(0,bound.upper()),arb(0,bound.upper()))
  if not (small or large):
   if t.imag.is_zero() and t.real>=0:
    upper=(-t.real).exp()*(1/r if deriv else 2*(R.real+r))
    return acb(arb(upper.upper()/2,upper.upper()/2))
   return acb('nan')
  y=R**2/s if small else s/R**2
  A=y.hypgeom_2f1(-arb(1)/2,-arb(1)/2,1)
  if deriv:
   D=y.hypgeom_2f1(arb(1)/2,arb(1)/2,2)/4
   val=(A-2*y*D)/r if small else 2*D/R
  else:val=2*(r if small else R)*A
  return (-t).exp()*val
 nodes1=[eps,l]
 nodes2=[u]+[arb(i) for i in range(int(float(u))+1,65)]
 vals=[]
 for d in [False,True]:
  val=acb(0)
  for nodes in [nodes1,nodes2]:
   for ll,rr in zip(nodes,nodes[1:]):
    assert ll<rr
    val+=acb.integral(lambda t,z:fun(t,z,d),ll,rr,rel_tol=arb('1e-17'),abs_tol=arb('1e-17'),eval_limit=100000)
  # We removed intervals [0,eps] and [l,u]. Their total contribution
  # is nonnegative and bounded pointwise by 2(R+r), or 1/r for h'.
  if d:err=(eps+u-l)/r+arb(-64).exp()/r
  else:err=2*eps*((eps.sqrt()*(a+b*eps))+r)+2*(u-l)*(u.sqrt()*(a+b*u)+r)+2*arb(-64).exp()*(a*65+b*(64**2+128+2)+r)
  enclosure=val.real+arb(err/2,err/2)
  assert enclosure.is_finite()
  vals.append(enclosure)
 return vals
if __name__=='__main__':
 for s in ['.02','.15','.8','5']:
  print(s,evaluate(s),flush=True)
