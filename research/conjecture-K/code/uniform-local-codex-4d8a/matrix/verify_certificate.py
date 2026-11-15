# handoff/codex-4d8a-compensated-joint/matrix/verify_certificate.py — Agent-ID: codex-4d8a
"""Exact radial constants, global even potential and full tradeoff certificate coverage."""
from fractions import Fraction as F
from pathlib import Path
import sys,math,json
root=Path(__file__).resolve().parent
sys.path.insert(0,str(root))
from exact_helpers import stieltjes,sqrt_interval,atan_inv,add,mul,scale,evaluate
A,B,p,rho=F(699,1250),F(179,1250),F(2500,1891),F(5053,10000)
pi=16*atan_inv(5)-4*atan_inv(239);rtpi=sqrt_interval(pi);rt2=sqrt_interval(2)
I1=rtpi*F(1,2)/B*stieltjes(F(3,2),A/B)
I2=rtpi*F(3,4)/B*stieltjes(F(5,2),A/B)
h=(I2-2*I1)/rt2
assert F(-608079,10**6)<h.lo<h.hi<F(-608078,10**6)
delta=F(3,50000)
for fac,proxy in [(F(11,20),F(-3345,10000)),(F(1),F(-6081,10000))]:
 assert max(abs(fac*h.lo-proxy),abs(fac*h.hi-proxy))<delta
# Exact global E|K|²/|L+w| <= (217/100) S_r primitive, all w.
assert F(177,250)**2>F(1,2)
W=add(mul([-F(2,5),1],[-F(2,5),1]),mul([F(3,5)*rho,F(177,250)],[F(3,5)*rho,F(177,250)]))
D=mul([A,B],[A,3*B])
poly=add(scale(mul(D,[F(1,math.factorial(j)) for j in range(5)]),F(81,100)),scale(W,-1))
assert poly[0]==F(686323,500000000)>0
q=poly[1:];qp=[j*q[j] for j in range(1,len(q))]
assert all(v>=0 for v in q[2:])
t0=F(5,4);slope=evaluate(qp,t0);intercept=evaluate(q,t0)-t0*slope
assert slope==F(2094736121,64000000000)>0
assert intercept==F(4102880111,64000000000)>0
H2=1+F(9,25)*(1+rho*rho)
assert F(9,5)**2*H2<F(217,100)**2
m=p-F(463,5000)-F(67,100)*(1+rho*rho)
g=F(11,2)*F(217,100)-m
assert m>0
# Analytic unbounded shift tail: M_c <= M_iso, whose norm <1/2 for r>=8.
assert F(1,2)+F(6081,10000)+delta<p
path=Path(sys.argv[1]) if len(sys.argv)>1 else root/'results/all_bounds.txt'
rows=[]
for line in path.read_text().splitlines():
 fields=line.split();assert len(fields)==5
 i=int(fields[0]);values=[float(s) for s in fields[1:]]
 assert all(math.isfinite(x) for x in values)
 lo,hi,bound,error=map(F.from_float,values)
 assert lo<=F(i,40) and hi>=F(i+1,40)
 assert 0<=error<bound
 rows.append((i,lo,hi,bound,error))
assert [row[0] for row in rows]==list(range(320))
worst=max(rows,key=lambda row:row[3]);maximum=worst[3]
# State a decimal rational ceiling, derived using integer arithmetic.
cap=F((maximum*10**6).__floor__()+1,10**6)
assert maximum<cap
kappa=p-cap-delta
assert kappa>F(1,4000)
N=100*((g/(kappa-F(1,4000))).__floor__()//100+1)
assert g/F(N)<=kappa-F(1,4000)
out={'agent':'codex-4d8a','status':'PASS: exact constants and stored interval coverage; recompute proves matrix entries','h_enclosure':[str(h.lo),str(h.hi)],'proxy_error':str(delta),'max_binary64':str(maximum),'max_decimal':float(maximum),'max_interval':[str(F(worst[0],40)),str(F(worst[0]+1,40))],'matrix_cap':str(cap),'odd_slack':str(kappa),'even_residual_coefficient':str(g),'global_cone_denominator':N,'global_cone_odd_reserve':'1/4000','global_cone_quartic_reserve':'3/2 V^2'}
(root/'certificate_summary.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
