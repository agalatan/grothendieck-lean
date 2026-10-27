#!/usr/bin/env python3
"""Single q=0 mode, all of J, one retained index; external Arb majorant."""

if not __debug__:
    raise SystemExit("optimized Python is unsupported: checks must remain enabled")
from flint import arb,ctx
from fractions import Fraction as Q
from pathlib import Path
import io,contextlib,runpy,sys
ctx.prec=160
with contextlib.redirect_stdout(io.StringIO()):m=runpy.run_path(str(Path(__file__).with_name('check_profile_neighborhoods.py')))
P=m['m']['P'];A=m['A']; h=A('3/10');alpha=A('41/20');eta2=A('1/10000000000000000000000000000')
indices=(range(8,17) if sys.argv[1]=='8..16' else
         range(6,9) if sys.argv[1]=='6..8' else [int(sys.argv[1])])
combined=arb(0)
for idx in indices:
 assert -220<=idx<=16
 t=(idx*h).exp();K=A('1/5');S=A('2521/100');smin=A(12);umax=t.sqrt()/(2*alpha.sqrt())
 W=sum((abs(A(c))*S**a/alpha**b*umax**n for (a,b,n),c in P.items()),arb(0))
 expmax=(-alpha*smin-alpha*smin*t/(alpha+K*K*t)).exp()
 M=h/arb.pi().sqrt()*(idx*h/2-eta2*t).exp()*K*S/alpha*W*expmax
 length=A('3')+A('13/100')+A('1/100');bound=length*M
 limits={8:Q(1,10**38),10:Q(1,10**63),12:Q(1,10**96),14:Q(1,10**133),16:Q(1,10**166)}
 if idx in limits: assert bound<A(limits[idx])
 combined+=bound
 print('m',idx,'bound for entire J',bound)
if sys.argv[1]=='8..16':
 assert combined<A(Q(1,10**38))
 print('sum of m=8..16 bounds <1e-38')
if sys.argv[1]=='6..8':
 assert combined<A(Q(3,10**21))
 print('sum of retained m=6..8 bounds <3e-21')
print('not vector, full source, or Lean proof')
