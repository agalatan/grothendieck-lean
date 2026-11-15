#!/usr/bin/env python3
"""codex-6e2b: a rigorous obstruction to a specified moment-only relaxation.

This is NOT a cubic-chaos counterexample and NOT a full Stein-law witness.
It uses the previously certified benchmark upper S<1.3739535256616 as an
explicit inherited input. All new norm integrals are recomputed by the
independently audited directed interval source quadrature.
"""
from fractions import Fraction as F
from pathlib import Path
import json
import os
import shutil
import subprocess
import tempfile

ROOT=Path(__file__).resolve().parent
pa,pb=F(288,289),F(1,289)
aa,bb=F(11,12),F(25)
u=F(1,25)
mom=[pa*aa**k+pb*bb**k for k in range(4)]
assert mom==[F(1),F(1),F(3),F(329,6)]
chi=mom[2]-2
assert chi==1 and 0<=chi<=42
C6=F(4045313,100000)
assert mom[3]<6+9*chi+C6

delta=chi*u*u
gamma=F(1077659,27000000)
H=gamma*delta
assert gamma<F(2,25)
assert gamma*gamma<9*delta  # H < 3 delta^(3/2)
assert H<F(1,2500) and H<F(19321,10**6)*u

# Replay the exact pi enclosure that the point engine requires.
subprocess.run([os.sys.executable,'-I','-B',str(ROOT/'verify.py'),
                '--algebra-only'],cwd=ROOT,check=True,
               stdout=subprocess.PIPE,text=True)
compiler=shutil.which('clang++')
assert compiler
prefix=(ROOT/'secant_verify.cpp').read_text().rsplit('int main(',1)[0]
assert prefix and 'I fpoint(' in prefix
main=r'''
int main(){
 assert(std::fesetround(FE_UPWARD)==0);setup_secant();
 I radius=sqrtI(rat(11,300));
 double center=(radius.l+radius.h)/2;
 double error=std::max(center-radius.l,radius.h-center);
 I fs=fpoint({0,center,0},1e-5)+I(-error,error);
 I fl=fpoint({0,1,0},1e-5);
 I payoff=I(2)*(rat(288,289)*fs+rat(1,289)*fl);
 // %a represents each double exactly, without decimal-output rounding.
 std::printf("PAYOFF %a %a\n",payoff.l,payoff.h);
}
'''
with tempfile.TemporaryDirectory(prefix='deficit_audit_',dir=ROOT) as tmp:
    tmp=Path(tmp)
    source=tmp/'deficit_audit_point.cpp'
    binary=tmp/'deficit_audit_point'
    source.write_text(prefix+main)
    env=dict(os.environ,TMPDIR=str(tmp))
    subprocess.run([compiler,'-O2','-std=c++17','-frounding-math',
                    '-ffp-contract=off','-fno-fast-math','-I',str(ROOT),
                    str(source),'-o',str(binary)],cwd=ROOT,env=env,check=True)
    result=subprocess.run([str(binary)],cwd=ROOT,check=False,
                          capture_output=True,text=True)
    if result.returncode: print(result.stdout+result.stderr)
    result.check_returncode()
    line=[s.split() for s in result.stdout.splitlines() if s.startswith('PAYOFF ')][0]
    flo,fhi=map(lambda x:F.from_float(float.fromhex(x)),line[1:])
    assert flo<=fhi

# Existing interval benchmark: sup_v(B(v)-pv) < this exact rational.
Supper=F('1.3739535256616')
p=F(2500,1891)
Bupper=Supper+p*u
Dupper=Bupper-flo
rhs=F(3,10)*max(Dupper,F(0))+F(3,500000)
assert H>rhs
print(json.dumps({
    'claim':'moment-only separate-envelope relaxation violates proposed B budget',
    'scope':'abstract radial law plus surrogate content upper bound; not a tensor',
    'u':str(u),'atoms':[str(aa),str(bb)],'probabilities':[str(pa),str(pb)],
    'moments':[str(x) for x in mom], 'delta':str(delta),
    'surrogate_content_squared':str(H),
    'payoff_lower':str(flo),'payoff_upper':str(fhi),
    'inherited_S_upper':str(Supper),'deficit_upper':str(Dupper),
    'budget_upper':str(rhs),'strict_violation_margin':str(H-rhs),
    'approximate_deficit_upper':float(Dupper),
    'approximate_violation_margin':float(H-rhs),
    'passed':True},indent=2))
