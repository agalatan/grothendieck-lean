"""Independent directed replay for a finite-power Haagerup preprocessor.

FLINT ball polynomials enclose the complete finite composition. The infinite
suffix uses a standard-library fixed-point telescope, matching the proved
finite-power Wiener estimate. No floating optimizer is trusted.
"""
from pathlib import Path
from fractions import Fraction as Q
import json,time,argparse,hashlib,re

def conv(a,b):
    out=[Q(0)]*(len(a)+len(b)-1)
    for i,x in enumerate(a):
        for j,y in enumerate(b):out[i+j]+=x*y
    return out

def main():
    ap=argparse.ArgumentParser();ap.add_argument('candidate',type=Path);ap.add_argument('--out',type=Path,required=True);ap.add_argument('--repo',type=Path,default=Path(__file__).resolve().parents[1]);args=ap.parse_args()
    c=json.loads(args.candidate.read_text());pl=list(map(Q,c['P']));q=Q(c['q']);gamma=Q(c['gamma']);K=c['K'];M=c['M'];N=c['tail_steps'];cap=Q(c['head']);tc=Q(c['tail'])
    source=(args.repo/'Grothe/Haagerup/PowerCheck.lean').read_text()
    def scalar(name):
        v=re.findall(r'def '+re.escape(name)+r' : [^\n]+? := ([^\n]+)',source)
        assert len(v)==1,name
        return Q(v[0].replace(' ',''))
    stored=re.findall(r'def pl : List ℚ := \[(.*?)\]',source,re.S)
    assert len(stored)==1
    assert list(map(lambda x:Q(x.replace(' ','').replace('\n','')),stored[0].split(',')))==pl
    for name,value in [('terms',K),('headCap',cap),('tailCap',tc),('gamma',gamma),('ratio',q),('slope',pl[0])]:
        assert scalar(name)==value,name
    assert f'powerTailOK terms {N} ratio gamma tailCap' in source
    assert f'haagCheck {M} pl terms slope headCap gamma' in source
    public=(args.repo/'Grothe/Haagerup/Power.lean').read_text()
    endpoint=re.findall(r'theorem upper : IsGrothendieckBound \(([^)]+)\)',public)
    assert len(endpoint)==1 and Q(endpoint[0].replace(' ',''))==Q(c['upper'])
    print('PASS exact binding to the Lean data and public endpoint',flush=True)
    assert K>=1 and N>=0 and c['block']==4 and 0<=q<1 and sum(map(abs,pl))<=1
    power=[Q(1)]
    for _ in range(4):power=conv(power,pl)
    norm4=sum(map(abs,power));assert norm4<=q
    assert M>(2*K-1)*(len(pl)-1)+K-1
    print('PASS exact coefficient budget and fourth-power contraction',float(norm4),flush=True)
    D=2**128
    def enc(x):return (x.numerator*D//x.denominator,-((-x.numerator*D)//x.denominator))
    def mul(a,b):
        v=[x*y for x in a for y in b]
        return (min(v)//D,-((-max(v))//D))
    def add(a,b):return (a[0]+b[0],a[1]+b[1])
    qi=enc(q);wp=enc(Q(1))
    for _ in range(K//2):wp=mul(qi,wp)
    ti=enc(Q(1,K+2*N))
    for j in reversed(range(N)):
        k=K+2*j;ti=add(enc(Q(1,k)-Q(1,k+2)),mul(qi,ti))
    ti=mul(enc(gamma/2),mul(wp,ti));upper=Q(ti[1],D)
    assert upper<=tc
    print('PASS weighted infinite tail',float(upper),'<',float(tc),flush=True)
    from flint import arb,arb_poly,ctx,__version__ as flint_version
    ctx.prec=192
    A=lambda x:arb(x.numerator)/x.denominator
    p=arb_poly([A(x) for x in pl]);y=arb_poly([0,1])*p*p
    rs=[arb(1)]
    for k in range(K):rs.append(rs[-1]*(2*k+1)**2/(4*(k+1)*(k+2)))
    assert rs[K]*(K+1)*(2*K+1)<A(gamma)
    start=time.time();h=arb_poly([rs[K-1]])
    for j,k in enumerate(range(K-2,-1,-1)):
        h=y*h+rs[k]
        if j and j%500==0:print('finite steps',j,'seconds',time.time()-start,flush=True)
    h=p*h-A(pl[0]);res=arb(0)
    for z in h.coeffs():res+=abs(z)
    assert res<A(cap),str(res)
    resup=Q(str(res.upper().fmpq()))
    print('PASS complete finite residual',str(res),'<',str(cap),flush=True)
    pi_lower=Q('3.14159265358979323846');den=pi_lower/4*(pl[0]-cap-tc)
    assert den>0 and 1/den<Q(c['upper'])
    out=dict(status='PASS_DIRECTED_POWER_HAAGERUP',candidate_sha256=hashlib.sha256(args.candidate.read_bytes()).hexdigest(),source_sha256={name:hashlib.sha256((args.repo/name).read_bytes()).hexdigest() for name in ['Grothe/Haagerup/PowerCheck.lean','Grothe/Haagerup/Power.lean','Grothe/Upper/PowerTail.lean','GrotheKernel/PowerTail.lean']},verifier_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),flint_version=flint_version,precision_bits=ctx.prec,fourth_power_norm=str(norm4),tail_upper=str(upper),head_upper=str(resup),head_cap=str(cap),tail_cap=str(tc),unconditional_upper=c['upper'],arithmetic_endpoint=str(1/den),seconds=time.time()-start)
    args.out.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2),flush=True)
if __name__=='__main__':main()
