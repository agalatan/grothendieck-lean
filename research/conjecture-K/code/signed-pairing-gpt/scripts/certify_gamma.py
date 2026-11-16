# scripts/certify_gamma.py
"""C: Arb enclosures for the finite gamma-shape checks in PROOFS.md."""
import json, math
from pathlib import Path
from flint import arb, ctx

ctx.prec=160
ROOT=Path(__file__).resolve().parents[1]

def affinity(m):
    if m%2==0:
        k=m//2
        return arb(m)*arb.pi()*arb(-m).exp()*arb(m)**m/(arb(2)**m*arb(math.factorial(k))**2)
    k=(m-1)//2
    return (arb(-m).exp()*arb(m)**m*arb(4)**(k+1)*arb(math.factorial(k))*arb(math.factorial(k+1))
            /(arb(math.factorial(2*k))*arb(math.factorial(2*k+2))))

jobs=[('7/20',7,20,range(22,34)),('3/5',3,5,range(12,19)),('13/10',13,10,range(4,8))]
checks=[]
for name,num,den,ms in jobs:
    cap=arb(num)/den
    for m in ms:
        a=affinity(m)
        theta=(34*m*(1-a)+40)/(6*(m+3))
        if not (a>0 and a<1 and theta<cap):
            raise RuntimeError(f'certificate failed: m={m}, theta={theta}, cap={cap}')
        checks.append(dict(m=m,target=name,affinity=str(a),theta_enclosure=str(theta),status='C'))
# Two algebraically different forms of the first two cases.
if not affinity(1).overlaps(2*arb(-1).exp()):raise RuntimeError('m=1 normalization')
if not affinity(2).overlaps(2*arb.pi()*arb(-2).exp()):raise RuntimeError('m=2 normalization')
output=dict(status='C: PASS',precision_bits=ctx.prec,checks=len(checks),results=checks)
(ROOT/'results'/'gamma_intervals.json').write_text(json.dumps(output,indent=2)+'\n')
print(json.dumps(output,indent=2))
