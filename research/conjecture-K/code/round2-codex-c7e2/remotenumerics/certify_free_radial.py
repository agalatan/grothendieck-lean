# codex-c7e2-round2/remotenumerics/certify_free_radial.py; Agent-ID: codex-c7e2.
"""Arb certificate: piecewise-constant radial weights, exact Gamma cell moments."""
from fractions import Fraction as F
from pathlib import Path
from flint import arb,ctx
import argparse,math,json,time

parser=argparse.ArgumentParser()
parser.add_argument('--n',type=int,required=True)
parser.add_argument('--den',type=int,default=4)
args=parser.parse_args();n=args.n;m=n-1;ctx.prec=160
def require(test,msg):
    if not test:raise RuntimeError(msg)
def A(x):
    x=F(x);return arb(x.numerator)/x.denominator
def tail(k,t):
    if t is None:return arb(0)
    t=A(t)
    return math.factorial(k)*(-t).exp()*sum(t**j/math.factorial(j) for j in range(k+1))
def intervals(shape,edges):
    vals=[]
    tails=[[tail(shape-1+k,e)/math.factorial(shape-1) for k in range(4)] for e in edges]
    for j in range(len(edges)-1):
        mom=[tails[j][k]-tails[j+1][k] for k in range(4)]
        require(mom[0]>0,'Nonpositive cell mass')
        vals.append((mom[0],[arb(1)]+[x/mom[0] for x in mom[1:]]))
    return vals

Tedges=[F(j,args.den) for j in range(12*args.den+1)]+[F(j,2) for j in range(25,49)]+[F(j) for j in range(26,49,2)]+[None]
Sedges=[F(j,args.den) for j in range(16*args.den+1)]+[F(j,2) for j in range(33,65)]+[F(j) for j in range(34,65,2)]+[None]
Ts=intervals(1,Tedges);Ss=intervals(m,Sedges)
source=Path(__file__).with_name('free_radial_witness_manifest.json')
record=json.loads(source.read_text())[str(n)]
# These are arbitrary exact rational choices. Their numerical discovery is not a proof input.
cs=F(record['cos_rational']);sn=F(record['sin_rational'])
weights=[F(z) for z in record['mixture_weights']]
require(all(z>=0 for z in weights),'Negative proposed weight')
require(weights[0]>0 and weights[-1]>0,'Degenerate proposed radial weight')
witness_path=Path(__file__).with_name(f'free_radial_weights_n{n}_den{args.den}.json')
frozen=None
if witness_path.exists():
    frozen=json.loads(witness_path.read_text())
    require(frozen['n']==n and frozen['den']==args.den,'Frozen witness header mismatch')
    require(frozen['common_denominator']==10**8,'Frozen witness denominator mismatch')
    require(len(frozen['numerators'])==len(Ts)*len(Ss),'Frozen witness cell count mismatch')
    require(all(type(z) is int and z>0 for z in frozen['numerators']),'Invalid frozen rational weight')
rational_numerators=[]
sqrt2m=A(2*m).sqrt();total_mass=arb(0);ER=arb(0)
integrals=[arb(0) for _ in range(7)]
unweighted=[arb(0) for _ in range(7)]
start=time.time();cells=0
for pt,t in Ts:
 for ps,s in Ss:
    prob=pt*ps
    aa=(t[3]-4*t[2]+4*t[1])/2
    bb=t[1]*(s[2]-2*m*s[1]+m*m)/m
    ab=(t[2]-2*t[1])*(s[1]-m)/sqrt2m
    PB=t[2]*s[1]/(2*m)
    PQ=t[1]*s[2]/(m*(m+1))
    PA=(s[3]-2*(m+1)*t[1]*s[2]+(m+1)**2*t[2]*s[1])/(m*(m+1)*(m+2))
    PH=s[3]/(m*(m+1)*(m+2))
    vals=[aa,bb,ab,PB,PQ,PA,PH]
    combo=A(weights[0])*(A(cs*cs)*aa+A(sn*sn)*bb+2*A(cs*sn)*ab)+sum(A(w)*p for w,p in zip(weights[1:],[PB,PQ,PA,PH]))
    require(combo>0,'Nonpositive proposed weight square')
    # R is defined to be this positive rational on the whole cell, including tails.
    numer=frozen['numerators'][cells] if frozen else max(1,round(math.sqrt(float(combo.mid()))*10**8))
    rational_numerators.append(numer)
    R=A(F(numer,10**8))
    total_mass+=prob;ER+=prob*R
    for j,val in enumerate(vals):
        integrals[j]+=prob*val/R
        unweighted[j]+=prob*val
    cells+=1
require(total_mass.contains(1),'Partition mass does not contain one')
for j,z in enumerate(unweighted):
    require(z.contains(0 if j==2 else 1),'Unweighted normalization failed at '+str(j))
aa,bb,ab,PB,PQ,PA,PH=[ER*x for x in integrals]
target=A(F(1569,2000))
require(target<arb.pi()/4,'Clean rational constant is not below pi/4')
eig=(aa+bb+((aa-bb)**2+4*ab*ab).sqrt())/2
print(json.dumps({'precheck_n':n,'cells':cells,'nu_Q_eigenvalue':str(eig),'B':str(PB),'Q0_P':str(PQ),'trace_A':str(PA),'remote_harmonic':str(PH),'seconds':time.time()-start}),flush=True)
require(target-aa>0 and target-bb>0,'Nu-Q diagonal PSD failed')
require((target-aa)*(target-bb)-ab*ab>0,'Nu-Q determinant PSD failed')
for label,val in [('B',PB),('Q0/P',PQ),('trace/A',PA),('remote harmonic',PH)]:
    require(target-val>0,'Scalar PSD failed '+label)
out={'status':'PASS','n':n,'precision_bits':ctx.prec,'grid_denominator':args.den,'cells':cells,'T_cells':len(Ts),'S_cells':len(Ss),'cos_rational':str(cs),'sin_rational':str(sn),'mixture_weights':list(map(str,weights)),'target_rational':'1569/2000','target_ball':str(target),'nu_Q_eigenvalue':str(eig),'blocks':{'B':str(PB),'Q0_P':str(PQ),'trace_A':str(PA),'remote_harmonic':str(PH)},'nu_Q_determinant_margin':str((target-aa)*(target-bb)-ab*ab),'mass':str(total_mass),'seconds':time.time()-start}
if frozen is None:
    witness_path.write_text(json.dumps({'n':n,'den':args.den,'common_denominator':10**8,'numerators':rational_numerators},separators=(',',':'))+'\n')
Path(__file__).with_name(f'free_radial_certificate_n{n}.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2),flush=True)
