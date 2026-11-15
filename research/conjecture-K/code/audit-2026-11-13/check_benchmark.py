"""Independent Rice-kernel benchmark check, codex-a713."""
import sys
sys.dont_write_bytecode=True
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
import math,json
from scipy import integrate,special
from kernels import Kernels,ROOT
k=Kernels()

def rice_B(u):
 def integrand(s):
  r=s*(k.a+k.b*s*s); x=r*r/(2*u)
  return 2*s*math.exp(-s*s)*math.sqrt(math.pi*u)*((1+2*x)*special.i0e(x)+2*x*special.i1e(x))
 return integrate.quad(integrand,0,10,epsabs=2e-13,epsrel=2e-13,limit=300)[0]
I=math.pi/(2*math.sqrt(k.a*k.b))*special.erfcx(math.sqrt(k.a/k.b))
g0=math.sqrt(math.pi)/(2*k.b)-(1+k.a/k.b)*I
out={'agent':'codex-a713','g0_erfc':g0,'g0_quad':k.g0,'phip0_erfc':I,'B_checks':[]}
for u in [.00551,.02,.03,.0463]:
 b=rice_B(u);out['B_checks'].append({'u':u,'B_Rice':b,'B_table':k.B(u),'difference':k.B(u)-b})
(ROOT/'benchmark_independent.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
