# r26_reweighted_certificate/verify_pure.py
"""Exact rational continuum certificate for a redistributed-deficit envelope.

Inherits Arb kernel enclosures and convexity from the R23 certificate.
No floating-point comparison accepts a box.
"""
from pathlib import Path
import sys,time,json,math
base=Path(__file__).resolve().parent
from kernel_enclosures import *
ap=data["profile"]["a"];bp=data["profile"]["b"]
a=arb(ap[0])/ap[1];b=arb(bp[0])/bp[1]
I=arb.pi()/(2*(a*b).sqrt())*(a/b).exp()*(a/b).sqrt().erfc()
j0=arb.pi().sqrt()/b-2*(1+a/b)*I
assert -arb(17)/10<j0<0
BRIDGE='--bridge' in sys.argv
K=Q(47,200) if BRIDGE else Q(11,50)
GAP=Q(1,500) if BRIDGE else Q(0)
qa=Q(59,500);qb=Q(35 if row=="upper" else 37,1000);qd=Q(21,200000)
qc=[-qa+2*qb+68*qd,qa,-qb-37*qd,qd]
w0=Q(3,10);w1=Q(7,10);U0=Q(551,100000);U1=Q(463,10000);YCUT=Q(400)
# Tail uses |J(v)-J(u)| <= |J(0)| < 17/10, inherited from R23.
# The denominator w(y)>=7y/10 makes the normalized numerator <=289/(280*u).
# Delta's pointwise Bregman term is nonnegative.
tail=Q(289,280)/U0
assert poly_lower(qc,YCUT,YCUT)>tail+GAP
assert qc[1]+2*qc[2]*YCUT+3*qc[3]*YCUT**2>0
assert 2*qc[2]+6*qc[3]*YCUT>0
stack=[(U0,U1,Q(0),Q(1),0),(U0,U1,Q(1),YCUT,0)]
count=leaves=depthmax=0;t0=time.time();last=t0
while stack:
 u0,u1,y0,y1,depth=stack.pop();count+=1;depthmax=max(depthmax,depth)
 assert depth<55,(row, str(u0),str(u1),str(y0),str(y1))
 aa=aavg(u1,y1);hh=havg(u0,y0);assert aa>0
 bracket=K*aa-u1*y1*hh*hh/(4*(w0+w1*y0))
 square=min((y0-1)**2,(y1-1)**2) if bracket>=0 else max((y0-1)**2,(y1-1)**2)
 lower=bracket*square+poly_lower(qc,y0,y1)
 if lower>=GAP:leaves+=1;continue
 if (u1-u0)*max(Q(1),y0)>(y1-y0)*u0:
  mid=(u0+u1)/2;stack.extend([(u0,mid,y0,y1,depth+1),(mid,u1,y0,y1,depth+1)])
 else:
  mid=(y0+y1)/2;stack.extend([(u0,u1,y0,mid,depth+1),(u0,u1,mid,y1,depth+1)])
 if time.time()-last>20:
  print(row,'boxes',count,'pending',len(stack),'depth',depthmax,'seconds',round(time.time()-t0),flush=True);last=time.time()
answer={'row':row,'status':'PASS','constant':str(K),'normalized_gap':str(GAP),'weight':['3/10','7/10'],'Q_parameters':[str(qa),str(qb),str(qd)],'u':[str(U0),str(U1)],'y_cut':str(YCUT),'boxes':count,'leaves':leaves,'depth':depthmax,'seconds':time.time()-t0}
(base/f'{"bridge" if BRIDGE else "pure"}_{row}_result.json').write_text(json.dumps(answer,indent=2)+'\n');print(json.dumps(answer),flush=True)
