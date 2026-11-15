# /workspace/scratch/f307e93b3610/codex-c7e2-round2/global/certify_inverse_neighborhood.py
"""codex-c7e2. Arb/Jensen all-buffer inverse-moment certificate for a complex coefficient neighborhood of the Laplace counterexample."""
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

zr=arb(0,arb(1)/500)
zi=arb(1,arb(1)/500)
zsq=zr*zr+zi*zi
zden=2+zsq

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
            mu=(mt[3]-4*mt[2]+4*mt[1]+2*zr*(mt[2]-2*mt[1])*(ms[1]-1)+zsq*mt[1]*(ms[2]-2*ms[1]+1))/zden
            mu=arb(mu.upper()) # f_v is decreasing: a uniform upper conditional mean is valid
            require(mu>0,'Nonpositive conditional moment')
            rows.append((pt*ps,mu))
    return rows

def exact_moments():
    x=zr;k=zsq
    m2=(18*k**2+16*k*x+16*k+32*(x*x)+176)/zden**2
    m3=(1590*k**3+3168*k**2*x+1296*k**2+5184*k*(x*x)+5760*k*x+4464*k+3840*(x*x*x)+17856*(x*x)+90816)/zden**3
    return [arb(1),m2,m3]

rows=partition();pi=arb.pi();sqrtpi=pi.sqrt()
v0=F(1,200);vend=F(50)
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

# For every parameter in the coefficient box and v>=50,
# J_v >= sqrt(pi/v)[delta/(4v)−m3/(16v²)]>0 by interval moment enclosures.
moments=exact_moments();delta=moments[1]-2;m3=moments[2]
require(4*delta*A(vend)-m3>0,'Large-buffer polynomial certificate failed')
result={'status':'PASS','precision_bits':ctx.prec,'distribution_cells':len(rows),'coefficient_box':'|Re z|<=1/500, |Im z-1|<=1/500','moment_enclosures':list(map(str,moments)),'low_buffer_endpoint':str(v0),'low_buffer_margin':str(low),'large_buffer_endpoint':str(vend),'large_buffer_polynomial_margin':str(4*delta*A(vend)-m3),'interval_count':len(cells),'minimum_certified_margin':min_margin,'seconds':time.time()-start,'cells':cells}
Path(__file__).with_name('inverse_neighborhood_certificate.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:v for k,v in result.items() if k!='cells'},indent=2),flush=True)
