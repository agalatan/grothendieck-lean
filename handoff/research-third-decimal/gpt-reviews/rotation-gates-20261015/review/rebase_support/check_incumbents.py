#!/usr/bin/env python3
"""Rigorous lower values for the fibre supremum by rotated polar-cell means.
All proof arithmetic is exact rational or integer outward arithmetic.
No numpy/scipy; module path is explicit for python -I from any directory.
"""
import argparse,json,sys,time
from pathlib import Path
from math import factorial,comb,isqrt
sys.path.insert(0,str(Path(__file__).resolve().parent))
from exact_base import F,I,PI,SQRT2,SQRTPI,inv,matmul,transpose,ldl
S=10**30

def exp_neg(q):
 q=F(q);assert 0<=q<=64
 x=q/64;p=F(1);s=p
 for k in range(1,29):p*= -x/k;s+=p
 t=s+p*(-x)/29;z=I(min(s,t),max(s,t))
 for _ in range(6):z=z*z
 return z

def convolution(a,b):
 out=[F(0)]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):out[i+j]+=x*y
 return out

def radial_moments(n,R=F(8),order=10):
 """Integrals of 2 r^(k+1)exp(-r²), k=0,1,2,3, on each cell.
 Expand exp(-2ct-t²) at cell midpoint; integrate polynomial exactly.
 Remainder <= maxY^(order+1)/(order+1)!/(1-maxY), maxY<1.
 """
 assert isinstance(n,int) and n>0 and 0<R<=8
 h=R/(2*n);out=[]
 for j in range(n):
  c=(2*j+1)*h;lo=c-h;hi=c+h;Y=2*c*h+h*h;assert Y<1
  expc=exp_neg(c*c);power=[F(1)];pol=[F(0)]*(2*order+1)
  for k in range(order+1):
   for i,v in enumerate(power):pol[i]+=v/F(factorial(k))
   if k<order:power=convolution(power,[F(0),-2*c,-F(1)])
  rem=Y**(order+1)/F(factorial(order+1))/(1-Y)
  moments=[]
  for k in range(4):
   rp=[F(comb(k+1,i))*c**(k+1-i)for i in range(k+2)]
   p=convolution(pol,rp)
   integral=sum(p[i]*2*h**(i+1)/F(i+1)for i in range(0,len(p),2))
   error=2*h*hi**(k+1)*rem
   val=2*expc*I(integral-error,integral+error)
   moments.append(I(max(F(0),val.lo),val.hi))
  out.append(moments)
 return out

def trig(theta,cos=False):
 xx=theta*theta;power=I(1) if cos else theta;s=I(0)
 for k in range(25):
  s=s+power/F(factorial(2*k+(0 if cos else 1)))*((-1)**k)
  power=power*xx
 deg=50 if cos else 51;err=theta.hi**deg/F(factorial(deg))
 return I(s.lo-err,s.hi+err)

def floor(q):return q.numerator//q.denominator
def ceil(q):return -floor(-q)
def fixed(z):return floor(z.lo*S),ceil(z.hi*S)
def add(x,y):return x[0]+y[0],x[1]+y[1]
def sub(x,y):return x[0]-y[1],x[1]-y[0]
def mul(x,y):
 v=[x[i]*y[j]for i in (0,1)for j in (0,1)]
 return min(v)//S,-((-max(v))//S)
def divint(x,n):return x[0]//n,-((-x[1])//n)
def zero_dist(x):return x[0] if x[0]>0 else (-x[1] if x[1]<0 else 0)
def abs_complex_lower(re,im):return isqrt(zero_dist(re)**2+zero_dist(im)**2)

def angular_integrals(n):
 assert isinstance(n,int) and n>0
 angles=[PI*F(k,2*n)for k in range(n+1)]
 cs=[trig(t,True)for t in angles];sn=[trig(t)for t in angles]
 return [(fixed((sn[j+1]-sn[j])*2/PI),fixed((cs[j]-cs[j+1])*2/PI))for j in range(n)]

def certify(profile,s,m,radial,angular):
 th=list(map(F,profile['theta']));s=F(s);m=list(map(F,m));nr=len(radial);nt=len(angular)
 a=[1+th[10],th[11],th[12]];y=[m[i]+s*a[i]for i in range(3)]
 E=[[th[0],th[1],th[2]],[th[1],th[3],th[4]],[th[2],th[4],th[5]]]
 repair=F(profile.get('E_repair','0'))
 for i in range(3):E[i][i]+=repair
 ldl(E);ldl([[th[6],th[7]],[th[7],th[8]]]);assert F(profile['eps'])>0
 cost=matmul([m],matmul(inv(E),[[v]for v in m]))[0][0]
 c=th[13]-2*th[14];beta=th[14];assert c>0 and beta>=0
 total=0
 for r0,r1,r2,r3 in radial:
  ar=fixed((y[0]-y[1])*r0+y[1]*r2);br=fixed(y[2]*r2/SQRT2)
  lc=divint(fixed(c*r1+beta*r3),nt)
  arpbr=add(ar,br);brmar=sub(br,ar)
  for ct,st in angular:
   pr=mul(arpbr,ct);pi=mul(brmar,st)
   nplus=abs_complex_lower(add(lc,pr),pi)
   nminus=abs_complex_lower(sub(lc,pr),pi)
   # True cell increment is nonnegative, independently of rounding.
   total+=max(0,nplus+nminus-2*lc[1])
 increment=F(total,S)-cost
 base=SQRTPI*(th[13]-beta/2)
 out=dict(name=profile['name'],s=str(s),trial_m=list(map(str,m)),lower_increment=str(increment),lower_potential=str(base.lo+increment),cell_increment_lower=str(F(total,S)),quadratic_cost=str(cost),radial_cells=nr,angular_cells=nt,radius='8',summary=dict(increment=float(increment),lower_potential=float(base.lo+increment)))
 print('PASS incumbent',profile['name'],'s',str(s),out['summary'],flush=True)
 return out

if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('--input',default=str(Path(__file__).with_name('incumbent_trials.json')));p.add_argument('--output',default=str(Path(__file__).with_name('incumbent_certificate.json')));p.add_argument('--radial',type=int,default=512);p.add_argument('--angular',type=int,default=128);args=p.parse_args()
 start=time.monotonic();rad=radial_moments(args.radial);ang=angular_integrals(args.angular)
 print('Gaussian cell integrals enclosed in',round(time.monotonic()-start,2),'seconds.',flush=True)
 inp=json.loads(Path(args.input).read_text());results=[certify(item['profile'],item['s'],item['m'],rad,ang)for item in inp]
 Path(args.output).write_text(json.dumps(dict(inputs=inp,results=results,elapsed_seconds=time.monotonic()-start),indent=2)+'\n')
 print('PASS: exact lower values; all omitted tails have nonnegative increment.',flush=True)
