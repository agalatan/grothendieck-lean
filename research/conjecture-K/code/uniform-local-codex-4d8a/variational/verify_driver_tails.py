# handoff/codex-4d8a-compensated-joint/variational/verify_driver_tails.py
"""Agent-ID: codex-4d8a. Exact arithmetic for DRIVER_TAILS.md; no numerics enter acceptance."""
from fractions import Fraction as F
from math import factorial
import json

def require(ok, message):
    if not ok:
        raise ArithmeticError(message)

def add(a, b):
    return [
        (a[i] if i < len(a) else F(0)) + (b[i] if i < len(b) else F(0))
        for i in range(max(len(a), len(b)))]

def scale(a, c):
    return [c*x for x in a]

def tail_poly(poly):
    """integral_x^infinity poly(t)e^-t dt = e^-x times returned polynomial."""
    return [sum(poly[k]*F(factorial(k),factorial(j)) for k in range(j,len(poly)))
            for j in range(len(poly))]

S = lambda n: [F(1,factorial(j)) for j in range(n+1)]
T11 = tail_poly([F(0),F(2),F(-2),F(1,2)])
T21 = tail_poly([F(0),F(0),F(3,2),F(-1),F(1,6)])
require(T11 == [F(1),F(1),F(-1,2),F(1,2)], 'H11 trace radial tail')
require(T21 == [F(1),F(1),F(1,2),F(-1,3),F(1,6)], 'H21 trace radial tail')
require(add(T11,scale(S(3),-1)) == [0,0,-1,F(1,3)], 'Q crossing at x=3')
require(add(T21,scale(S(4),-1)) == [0,0,0,F(-1,2),F(1,8)], 'q crossing at x=4')
require(add(S(4),scale(T11,-1)) == [0,0,1,F(-1,3),F(1,24)], 'lower driver block dominance')
require(F(1,3)**2-4*F(1,24)<0, 'positive lower-block dominance quadratic')

p=F(2500,1891)
rho=F(5053,10000)
m=p-F(463,5000)-F(67,100)*(1+rho*rho)
g=F(217,100)-m
c=1/(p-F(61,100))
M=g*g/4+c
require(m>0 and g>0 and p>F(61,100), 'coercive parameters')
require(M<F(11,5), 'global positive-part cap')

def exp_tail_upper(x, count=100):
    # exp(x) exceeds its finite positive Taylor sum, so this is a strict upper bound for exp(-x).
    require(x>0,'positive exponential argument')
    return 1/sum((F(x)**j/F(factorial(j)) for j in range(count)),F(0))

receipts={}
for x, target in [(15,F(7,10**7)),(16,F(1,4*10**6)),(17,F(1,10**7)),(18,F(7,2*10**8)),(20,F(1,2*10**8))]:
    upper=M*exp_tail_upper(x)
    require(upper<target,'tail budget at x='+str(x))
    receipts[str(x)]={'threshold':'S_r >= '+str(x)+' V', 'proved_upper':str(upper), 'safe_budget':str(target)}

Vmax=F(80051,10**6)-F(1,25)
require(Vmax==F(40051,10**6),'near-peak shell budget')
require(16*Vmax==F(40051,62500),'near-peak threshold')
require(F(50,10**6)-F(1,4*10**6)==F(199,4*10**6),'remaining compact budget')

print(json.dumps({
    'agent_id':'codex-4d8a',
    'status':'PASS exact constants and radial-tail identities; analytic implications in DRIVER_TAILS.md',
    'm':str(m),'g':str(g),'M':str(M),'M_upper':'11/5',
    'H11_trace_tail_polynomial':list(map(str,T11)),
    'H21_trace_tail_polynomial':list(map(str,T21)),
    'driver_tail_budgets':receipts,
    'u_ge_1_25_driver_cut':str(16*Vmax),
    'remaining_compact_budget':'199/4000000',
    'full_conjecture_K_proved':False,
},indent=2))
