# /workspace/scratch/f307e93b3610/codex-c7e2-round2/global/certify_inverse_counterexample.py
"""codex-c7e2. Arb/Jensen all-buffer inverse-moment certificate for the Laplace counterexample."""
from fractions import Fraction as F
import math,time,json
from pathlib import Path
from flint import arb,ctx

ctx.prec=120
def require(condition,message):
    if not condition:raise RuntimeError(message)
def A(x):
    x=F(x)
    return arb(x.numerator)/x.denominator

def tail(k,t):
    if t is None:return arb(0)
    t=A(t)
    return (-t).exp()*math.factorial(k)*sum((t**j)/math.factorial(j) for j in range(k+1))

def partition():
    edges=[F(j,2) for j in range(17)]+[F(j) for j in range(9,17)]+[None]
    p=[];mom=[]
    for lo,hi in zip(edges,edges[1:]):
        mass=tail(0,lo)-tail(0,hi)
        p.append(mass)
        mom.append([arb(1)]+[(tail(k,lo)-tail(k,hi))/mass for k in range(1,4)])
    rows=[]
    for pt,mt in zip(p,mom):
        for ps,ms in zip(p,mom):
            mu=(mt[3]-4*mt[2]+4*mt[1]+mt[1]*(ms[2]-2*ms[1]+1))/3
            require(mu>0,'Nonpositive conditional moment')
            rows.append((pt*ps,mu))
    return rows

def exact_moments():
    upoly={(3,0):F(1,3),(2,0):F(-4,3),(1,0):F(5,3),(1,2):F(1,3),(1,1):F(-2,3)}
    power={(0,0):F(1)};out=[]
    for _ in range(3):
        nxt={}
        for (i,j),c in power.items():
            for (k,l),d in upoly.items():
                key=(i+k,j+l);nxt[key]=nxt.get(key,F(0))+c*d
        power=nxt
        out.append(sum(c*math.factorial(i)*math.factorial(j) for (i,j),c in power.items()))
    require(out==[F(1),F(70,3),F(32722,9)],'Exact moment enumeration failed')
    return out

rows=partition();pi=arb.pi();sqrtpi=pi.sqrt()
v0=F(1,200);vend=F(43)
low=sum(p/(mu+A(v0)).sqrt() for p,mu in rows)-2*sum(p*mu.sqrt() for p,mu in rows)-(pi*A(v0)).sqrt()
require(low>0,'Low-buffer certificate failed')
print('Low-buffer bound',str(low),flush=True)

def jensen(v):
    av=A(v);s=arb(0)
    for p,mu in rows:
        x=mu/(2*av)
        e=(-x).exp()
        # Arguments are point balls, so scaled Bessel evaluation retains precision.
        s+=p*e*((1-mu)*x.bessel_i(0)-mu*x.bessel_i(1))
    return sqrtpi/av.sqrt()*s

def lip(v):
    av=A(v)
    return sqrtpi*(1+2*av)/(2*av*av.sqrt())

cells=[];v=v0;start=time.time();min_margin=math.inf
while v<vend:
    j=jensen(v);l=lip(v)
    require(j>0,'Jensen certificate failed at '+str(v)+': '+str(j))
    guess=float(j.mid())/(2*float(l.mid()))
    exponent=math.floor(math.log2(guess))
    step=F(2)**exponent
    nxt=min(v+step,vend)
    margin=j-l*A(nxt-v)
    while not margin>0:
        step/=2;nxt=min(v+step,vend);margin=j-l*A(nxt-v)
    mf=float(margin.lower());min_margin=min(min_margin,mf)
    cells.append({'left':str(v),'right':str(nxt),'jensen':str(j),'lipschitz':str(l),'margin':str(margin)})
    v=nxt
    if len(cells)%50==0:print(len(cells),float(v),min_margin,'seconds',time.time()-start,flush=True)

# For v>=43, J_v >= sqrt(pi/v)[(64/3)/(4v)−(32722/9)/(16v²)]>0.
moments=exact_moments();delta=moments[1]-2;m3=moments[2]
require(4*delta*vend-m3>0,'Large-buffer polynomial certificate failed')
result={'status':'PASS','precision_bits':ctx.prec,'distribution_cells':len(rows),'exact_moments':list(map(str,moments)),'low_buffer_endpoint':str(v0),'low_buffer_margin':str(low),'large_buffer_endpoint':str(vend),'large_buffer_polynomial_margin':str(4*delta*vend-m3),'interval_count':len(cells),'minimum_certified_margin':min_margin,'seconds':time.time()-start,'cells':cells}
Path(__file__).with_name('inverse_counterexample_certificate.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='cells'},indent=2),flush=True)
