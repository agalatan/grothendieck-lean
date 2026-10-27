#!/usr/bin/env python3
"""Exact rational polynomial screen for phase L² radial tails; outside Lean."""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from fractions import Fraction as Q
from math import factorial,comb,lcm,prod
from pathlib import Path
from time import perf_counter
from flint import fmpz_mpoly_ctx, arb, ctx
import json,sys,re
ctx.prec=160
root=Path(__file__).resolve().parents[2]
data=json.loads((root/'data/upper-preprocess/certificate.json').read_text()); rows=data['phase']
assert Q(data['phaseEpsQ'])==Q(21,20)
den=lcm(*(Q(x['coefficient']).denominator for x in rows))
ints={tuple(x['powers']):int(Q(x['coefficient'])*den) for x in rows}
assert len(rows)==len(ints)==1140
lean=(root/'Grothe/Upper/Data.lean').read_text()
block=lean.split('def phaseStrs : List String :=',1)[1].split('/--',1)[0]
parsed=re.findall(r'"(\d+),(\d+),(\d+):([^"]+)"',block)
assert len(parsed)==len(rows)
lean_terms={(int(a),int(b),int(c)):Q(q) for a,b,c,q in parsed}
assert len(lean_terms)==1140 and all(lean_terms[k]==Q(v,den) for k,v in ints.items())
epsblock=lean.split('def phaseEpsQ : ℚ :=',1)[1].split('/--',1)[0]
eps=re.fullmatch(r'\s*\((-?\d+)\s*:\s*ℚ\)\s*/\s*(\d+)\s*',epsblock)
assert eps and Q(int(eps[1]),int(eps[2]))==Q(data['phaseEpsQ'])
start=perf_counter(); C=fmpz_mpoly_ctx.get(('s','v','x'),'lex'); square=(C.from_dict(ints)**2).to_dict()
even=[(int(a),int(b),int(c),int(coef)) for (a,b,c),coef in square.items() if c%2==0]
K=max(b+c//2+1 for a,b,c,n in even)
# Common denominator den² * 2^K * 31^(K+1), beta=31/10.
coeff={}
for a,b,c,n in even:
 k=c//2;d=a+1+k; R=b+k+1
 wick=sum(comb(b,j)*prod(range(1,2*j+2*k,2))*prod(range(1,2*(b-j)+2,2)) for j in range(b+1))
 num=n*wick*10**(R+1)*2**(K-R)*31**(K-R)
 coeff[d]=coeff.get(d,0)+num
D=den*den*2**K*31**(K+1)
# ∫_L∞ s^d exp(-βs) ds = exp(-βL) d! ∑_{j=0}^d L^j/(j! β^(d+1-j)).
rate=Q(31,10)
zero=sum((Q(v,D)*factorial(d)/rate**(d+1) for d,v in coeff.items()),Q(0))
target=Q(json.loads((root/'data/phase-moments/targets.json').read_text())['targets']['2'])
assert zero==target
print('signed full integral matches the existing exact phi² target')
for L in [25,30,35,*range(44,51)]:
 B=sum((Q(abs(v),D)*factorial(d)*sum((Q(L**j,factorial(j))/rate**(d+1-j) for j in range(d+1)),Q(0)) for d,v in coeff.items()),Q(0))
 Bsigned=sum((Q(v,D)*factorial(d)*sum((Q(L**j,factorial(j))/rate**(d+1-j) for j in range(d+1)),Q(0)) for d,v in coeff.items()),Q(0))
 assert 0<=Bsigned<=B
 tail=arb(B.numerator)/B.denominator * (-(arb(31)*L/10)).exp()
 signed_tail=arb(Bsigned.numerator)/Bsigned.denominator * (-(arb(31)*L/10)).exp()
 assert tail>=0
 if L==50: assert tail<(arb(5)/10**15)**2
 if L==35:
  z_tail=arb(L+1)*(-arb(L)).exp()
  assert signed_tail*z_tail<(arb(1)/10**16)**2
  print('q0-specific radial tail L=35:',(signed_tail*z_tail).sqrt(),'< 1e-16')
 print('L',L,'signed L2 tail',signed_tail.sqrt(),'absolute-coefficient L2 bound',tail.sqrt(), 'first cap fraction',tail.sqrt()/(arb(4000001)/10**17),'third cap fraction',tail.sqrt()/(arb(47629771)/10**18),flush=True)
print('source monomials',len(rows),'square terms',len(square),'radial coefficients',len(coeff),'seconds',round(perf_counter()-start,2))
print('Exact rational polynomial/Arb exp, given Gaussian moment formula; no Lean theorem.')
