"""Independent directed replay for the signed-resolvent Haagerup preprocessor.

FLINT ball polynomials enclose the complete finite composition. The infinite
suffix uses an exact inverse defect and a directed Abel bound. Decreasing
first differences sharpen that unchanged certificate by a second Abel step.
No floating optimizer is trusted.
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
    c=json.loads(args.candidate.read_text());pl=list(map(Q,c['P']));q=Q(c['q']);gamma=Q(c['gamma']);K=c['K'];M=c['M'];rl=list(map(Q,c['R']));seed=c['seed_power'];eta=Q(c['defect_cap']);b=Q(c['seed_cap']);cap=Q(c['head']);tc=Q(c['tail'])
    import importlib.util
    spec=importlib.util.spec_from_file_location('generator',args.repo/'tools/gen_haagerup_power.py')
    generator=importlib.util.module_from_spec(spec);spec.loader.exec_module(generator)
    render=generator.render
    assert (args.repo/'Grothe/Haagerup/PowerCheck.lean').read_text()==render(c)
    public=(args.repo/'Grothe/Haagerup/Power.lean').read_text()
    endpoint=re.findall(r'theorem upper : IsGrothendieckBound \(([^)]+)\)',public)
    headline=re.findall(r'theorem haagerup_bound : IsGrothendieckBound \(([^)]+)\)',public)
    convex_cap=re.findall(r'^def convexTailCap : ℚ := ([0-9 /]+)$',public,re.MULTILINE)
    assert len(endpoint)==len(headline)==len(convex_cap)==1
    public_upper=Q(endpoint[0].replace(' ',''));ctc=Q(convex_cap[0].replace(' ',''))
    assert Q(headline[0].replace(' ',''))==public_upper
    certificate_upper=Q(c['upper'])
    print('PASS exact binding to unchanged Lean certificate data and current public endpoint',flush=True)
    assert K>=1 and seed<=2*K+1 and 0<=q<1 and sum(map(abs,pl))<=1
    power=[Q(1)]
    for _ in range(4):power=conv(power,pl)
    norm4=sum(map(abs,power));assert norm4<=q
    assert M>(2*K-1)*(len(pl)-1)+K-1
    print('PASS exact coefficient budget and fourth-power contraction',float(norm4),flush=True)
    d=[Q(1)]+[-x for x in conv(pl,pl)]
    defect=conv(rl,d);defect[0]-=1
    defect_norm=sum(map(abs,defect));assert defect_norm<=eta<1
    print('PASS exact inverse defect',float(defect_norm),'<',float(eta),flush=True)
    assert rl[0]==1 and 0<=eta
    r_minus_one_norm=sum(map(abs,rl[1:]))
    assert r_minus_one_norm+eta<=2
    # R*A = (R-1) + (1-R*(1-A)), for A=X*P^2: this is the
    # same inexpensive norm bound used by Power.norm_resolvent_ratio.
    ra_cap=Q(2)
    difference_ratio=Q(8*K+7,4*(K+1)*(K+2))
    assert difference_ratio==1-Q((2*K+1)**2,4*(K+1)*(K+2))
    convex_factor=Q(1,2)+ra_cap*difference_ratio/(1-eta)
    convex_upper=tc*convex_factor
    assert 0<=convex_upper<=ctc<=tc
    print('PASS second-Abel allowance from unchanged native cap',float(convex_upper),'<',float(ctc),flush=True)
    D=2**128
    def enc(x):return (x.numerator*D//x.denominator,-((-x.numerator*D)//x.denominator))
    def mul(a,b):
        v=[x*y for x in a for y in b]
        return (min(v)//D,-((-max(v))//D))
    qi=enc(q);wp=enc(Q(1))
    for _ in range((2*K+1-seed)//4):wp=mul(qi,wp)
    ti=mul(enc(2*b*gamma/Q((K+1)*(2*K+1))/(1-eta)),wp);upper=Q(ti[1],D)
    assert upper<=tc
    print('PASS original signed Abel infinite tail',float(upper),'<',float(tc),flush=True)
    from flint import arb,arb_poly,ctx,__version__ as flint_version
    ctx.prec=192
    A=lambda x:arb(x.numerator)/x.denominator
    p=arb_poly([A(x) for x in pl])
    seed_poly=arb_poly([A(x) for x in rl])*p**seed
    seed_norm=sum((abs(z) for z in seed_poly.coeffs()),arb(0))
    assert seed_norm<A(b)
    print('PASS combined seed',str(seed_norm),'<',str(b),flush=True)
    y=arb_poly([0,1])*p*p
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
    pi_lower=Q('3.14159265358979323846')
    native_den=pi_lower/4*(pl[0]-cap-tc)
    den=pi_lower/4*(pl[0]-cap-ctc)
    assert native_den>0 and 1/native_den<certificate_upper
    assert den>0 and 1/den<public_upper<=certificate_upper
    out=dict(
        status='PASS_DIRECTED_CONVEX_RESOLVENT_HAAGERUP',
        candidate_sha256=hashlib.sha256(args.candidate.read_bytes()).hexdigest(),
        source_sha256={name:hashlib.sha256((args.repo/name).read_bytes()).hexdigest() for name in [
            'Grothe/Haagerup/PowerCheck.lean','Grothe/Haagerup/Power.lean',
            'Grothe/Haagerup/Convex.lean','Grothe/Upper/ResolventTail.lean',
            'GrotheKernel/ResolventTail.lean']},
        verifier_sha256=hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        flint_version=flint_version,precision_bits=ctx.prec,
        fourth_power_norm=str(norm4),inverse_defect=str(defect_norm),
        seed_upper=str(seed_norm),head_upper=str(resup),head_cap=str(cap),
        native_abel_tail_upper=str(upper),native_abel_tail_cap=str(tc),
        certificate_baseline_upper=str(certificate_upper),
        certificate_baseline_arithmetic_endpoint=str(1/native_den),
        resolvent_minus_one_norm=str(r_minus_one_norm),resolvent_ratio_cap=str(ra_cap),
        coefficient_difference_ratio=str(difference_ratio),
        convex_tail_factor=str(convex_factor),convex_tail_upper=str(convex_upper),
        convex_tail_cap=str(ctc),unconditional_upper=str(public_upper),
        arithmetic_endpoint=str(1/den),seconds=time.time()-start)
    args.out.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2),flush=True)
if __name__=='__main__':main()
