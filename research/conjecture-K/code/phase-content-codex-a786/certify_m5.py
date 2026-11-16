# phase_content/certify_m5.py
"""New outward Arb certificate for the fifth derivative of the tilted scalar profile.

The implicit inverse and interval helpers are inherited from codex-6e2b.
The density derivatives are generated here by exact rational differentiation.
"""
import sys
from pathlib import Path
from fractions import Fraction as Q
import heapq
import itertools
import json
import time
sys.path.insert(0, str(Path(__file__).resolve().parent / 'upstream'))
from content_profile import arb, a, b, d, pi, root_ball, root_series, exact_interval, radius_from_t

def rational(x):
    x = Q(x)
    return arb(x.numerator) / x.denominator

# R_k satisfies d^k f/dv^k = exp(-t) R_k(t)/pi,
# with f=(t-d)exp(-t)/(pi (a+bt)(a+3bt)), v=t(a+bt)^2.
# A key (s,A,B) means t^s (a+bt)^(-A) (a+3bt)^(-B).
R = [{(1, 1, 1): Q(1), (0, 1, 1): -Q(2, 5)}]
for k in range(4):
    out = {}
    def add(key, value):
        out[key] = out.get(key, Q(0)) + value
    for (s, A, B), c in R[-1].items():
        if s:
            add((s-1, A+1, B+1), s*c)
        add((s, A+2, B+1), -A*Q(179,1250)*c)
        add((s, A+1, B+2), -3*B*Q(179,1250)*c)
        add((s, A+1, B+1), -c)
    R.append({key: value for key, value in out.items() if value})

def evaluate(k, t):
    p, q = a+b*t, a+3*b*t
    value = 0
    for (s,A,B),c in R[k].items():
        term = rational(c)*t**s
        for _ in range(A): term = term/p
        for _ in range(B): term = term/q
        value += term
    return value

def integrand(x, y, derivative=False):
    if derivative:
        from content_profile import arb_series
        y = arb_series([y,1])
    v = x*x+y*y
    t = root_series(v) if derivative else root_ball(v)
    value = 4*(-t).exp()/pi*(12*evaluate(2,t)+48*x*x*evaluate(3,t)+16*x**4*evaluate(4,t))
    return abs(value[4]) if derivative else value

def envelope(T):
    p,q = a+b*T,a+3*b*T
    coefficients = [arb(0) for _ in range(4)]
    for k, j, factor in [(2,0,12),(3,1,48),(4,2,16)]:
        for (s,A,B),c in R[k].items():
            assert A-2*j >= 1 and B >= 1 and s+j <= 3
            coefficients[s+j] += rational(abs(c)*factor) / p**(A-2*j) / q**B
    return [4*c/pi for c in coefficients]

def exp_moment(T,n):
    value=arb(1)
    for j in range(1,n+1):
        value=T**j+j*value
    return (-T).exp()*value

def tail(T):
    assert T >= 4
    coefficients=envelope(T)
    assert all(c >= 0 for c in coefficients)
    # Each t^j exp(-t), 0<=j<=3, decreases for t>=4.
    return sum(c*(a*exp_moment(T,j)+3*b*exp_moment(T,j+1))
               for j,c in enumerate(coefficients))/(2*T.sqrt())

def far_tail(limit):
    T=arb(4)
    ell=radius_from_t(T)
    bound=ell*(-T).exp()*sum(c*T**j for j,c in enumerate(envelope(T)))+tail(T)
    assert ell < 3
    assert bound < limit, str(bound)
    return {'domain':'[ell(4),infinity)', 'ell4':str(ell),'absolute_upper':str(bound),'passed':True}

def cell(x,lo,hi):
    length=hi-lo
    center=(hi+lo)/2
    off=length/(2*arb(3).sqrt())
    value=length/2*(integrand(x,center-off)+integrand(x,center+off))
    error=(length**5*integrand(x,exact_interval(lo,hi),True)/180).upper()
    return value,error

def box(lo,hi,limit):
    x=exact_interval(rational(lo),rational(hi))
    stop=radius_from_t(arb(20));omitted=tail(arb(20))
    edges=list(map(arb,['0','.125','.25','.5','1','2','4','8']))+[stop]
    assert all(l<h for l,h in zip(edges[:-1],edges[1:]))
    heap=[];counter=itertools.count()
    mid=arb(0);rad=arb(0);err=arb(0)
    def add(l,h):
        nonlocal mid,rad,err
        value,error=cell(x,l,h)
        mid+=value.mid();rad+=value.rad();err+=error
        heapq.heappush(heap,(-float(error),next(counter),l,h,value,error))
    for l,h in zip(edges[:-1],edges[1:]):add(l,h)
    while True:
        value=mid+arb(0,rad.upper()+err.upper()+omitted.upper())
        passed=bool(abs(value)<limit)
        if passed or err<arb('0.01') or len(heap)>=10000:
            return {'x':[str(lo),str(hi)],'absolute_upper':str(abs(value).upper()),
                    'enclosure':str(value),'quadrature_error':str(err),'tail':str(omitted),
                    'cells':len(heap),'passed':passed}
        _,_,l,h,value,error=heapq.heappop(heap)
        mid-=value.mid();rad-=value.rad();err-=error
        m=(l+h)/2;add(l,m);add(m,h)

def certify():
    started=time.time();limit=arb(1000)
    print(json.dumps({'far_tail':far_tail(limit)}),flush=True)
    pending=[(Q(j,80),Q(j+1,80)) for j in range(240)]
    accepted=[]
    while pending:
        lo,hi=pending.pop(0);row=box(lo,hi,limit)
        if row['passed']:
            accepted.append(row);print(json.dumps(row),flush=True)
        else:
            assert hi-lo>Q(1,1000000),row
            m=(lo+hi)/2;pending[:0]=[(lo,m),(m,hi)]
    assert Q(accepted[0]['x'][0])==0 and Q(accepted[-1]['x'][1])==3
    assert all(Q(l['x'][1])==Q(r['x'][0]) for l,r in zip(accepted[:-1],accepted[1:]))
    assert all(row['passed'] and Q(row['x'][0])<Q(row['x'][1]) for row in accepted)
    assert pi < arb(22)/7
    print(json.dumps({'claim':"sup |m^(5)| < 1000",'boxes':len(accepted),
                     'compact_max':str(max(arb(row['absolute_upper']).upper() for row in accepted)),
                     'passed':True,'seconds':time.time()-started}),flush=True)

if __name__=='__main__':
    certify()
