#!/usr/bin/env python3
"""Directed assembly for K_C < 1.404898359045958.

Default checks pinned inputs and assembles the bound. --full reruns original
prerequisites plus the new Dirichlet integrals. New coefficient quadrature is
separate: generate_added_origin.py --source-dir SOURCE --output rebuilt.npz.
"""
import argparse,hashlib,json,subprocess,sys
from pathlib import Path
from fractions import Fraction as Q
from flint import arb,acb,arb_poly,ctx,fmpq
import numpy as np
HERE=Path(__file__).resolve().parent
N=240
WEIGHTS=tuple(map(Q,('0.983543458398378100','0.012416654023174663','0.003031585753026536','0.000593628184609741','0.000016934659448514','0.000397738981362458')))
TOTALS=(Q('1.10684082009393895861618'),Q('1.106774759136645693569585'),Q('3.504133054650557143086961'))
FINAL=Q('1.404898359045958')

def sha256(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def aq(x):return arb(fmpq(x.numerator,x.denominator))

def scalar_column(row,count):
    last=max(i for i,v in enumerate(row) if v)
    p=arb_poly([aq(v) for v in row[:last+1]]);square=p*p;power=p;answer=arb_poly();h=arb.pi()/4
    for j in range(count):
        answer=(answer+power.left_shift(j)*h).truncate(count)
        power=(power*square).truncate(count)
        h*=arb((2*j+1)**2)/(4*(j+1)*(j+2))
    return [answer[n] for n in range(count)]

def fifth_tail(count,outer=320):
    # Exact integer coefficient proof of ||rho5^20||_A<1/2, ||rho5||_A<1.
    row=source.RHO_5;den=10**12
    integers={n:int(c*den) for n,c in enumerate(row) if c}
    assert all(Q(c,den)==row[n] for n,c in integers.items())
    assert sum(map(abs,integers.values()))<den
    power_int=[1]
    for exponent in range(20):
        product=[0]*(len(power_int)+max(integers))
        for n,c in integers.items():
            for k,v in enumerate(power_int):product[n+k]+=c*v
        power_int=product
    assert 2*sum(map(abs,power_int))<den**20
    print('EXACT_FIFTH_CONTRACTION_PASS',flush=True)
    p=arb_poly([aq(x) for x in row[:38]]);square=p*p;power=p;answer=arb_poly();h=arb.pi()/4
    for j in range(outer):
        answer+=power.left_shift(j)*h;power*=square
        h*=arb((2*j+1)**2)/(4*(j+1)*(j+2))
    finite=sum((abs(answer[n]).upper() for n in range(count,len(answer))),arb(0))
    # h_j <= 1/[4j(j+1)] and grouping powers into blocks of20.
    remainder=Q(1,4*outer*2**((2*outer+1)//20))
    print('FIFTH_FINITE',finite,'FIFTH_OUTER_RESERVE',remainder,flush=True)
    return (finite+aq(remainder)).upper()

def load_origin(table):
    assert source.base.sha256(source.base.TABLE)==source.base.EXPECTED_TABLE_SHA256
    assert source.tight.sha256(source.tight.TABLE)==source.tight.EXPECTED_SHA256
    out=[list(source.tight.boxes(s)) for s in ('left','right')]
    with np.load(table,allow_pickle=False) as saved:
        assert int(saved['start'])==120 and int(saved['count'])==N and int(saved['cutoff'])==36
        for i,label in enumerate(('left','right')):
            for part in ('real','imag'):
                lo,hi=saved[f'{label}_{part}_lower'],saved[f'{label}_{part}_upper']
                assert lo.shape==hi.shape==(N-120,)
                assert np.all(np.isfinite(lo)) and np.all(np.isfinite(hi)) and np.all(lo<=hi)
            for j in range(N-120):
                out[i].append(acb(source.base.interval(saved[label+'_real_lower'][j],saved[label+'_real_upper'][j]),source.base.interval(saved[label+'_imag_lower'][j],saved[label+'_imag_upper'][j])))
    return out

def weighted_h(count,terminal=16384):
    h=arb.pi()/4;answer=arb(0)
    for n in range(terminal):
        if n>=count:answer+=h/(2*n+1)
        h*=arb((2*n+1)**2)/(4*(n+1)*(n+2))
    # h_n/(2n+1) <= (1/16)*(n^-2-(n+1)^-2), n>=1.
    return (answer+aq(Q(1,16*terminal**2))).upper()

def tail_energy(values,phase,total,joint=False):
    h=arb.pi()/4;visible=arb(0)
    for n,z in enumerate(values):
        residual=z if joint else z-phase*((-1)**n*h.sqrt())
        lower=abs(residual).lower();assert lower>=0
        visible+=(2*n+1)*lower**2
        h*=arb((2*n+1)**2)/(4*(n+1)*(n+2))
    # L2 norm of omitted s>36 integration is at most exp(-18) per phase.
    omitted=(-arb(18)).exp().upper()
    norm=visible.sqrt().lower()-(2 if joint else 1)*arb(2*N-1).sqrt().upper()*omitted
    assert norm>0
    tail=(aq(total)-norm**2).upper();assert tail>0
    return tail,(norm**2).lower()

def compose(q,eta):
    p=arb_poly([aq(x) for x in eta]);square=p*p;power=p;answer=arb_poly()
    for n,c in enumerate(q):answer+=c*power.left_shift(n);power*=square
    return answer

def main():
    if not __debug__:raise RuntimeError('Assertions required; do not use -O or -OO')
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--source-dir',required=True,type=Path);ap.add_argument('--added-table',type=Path)
    ap.add_argument('--full',action='store_true');ap.add_argument('--output',type=Path)
    args=ap.parse_args();upstream=args.source_dir.expanduser().resolve()
    manifest=json.loads((HERE/'manifest.json').read_text())
    for relative,expected in manifest['source_files'].items():
        assert sha256(upstream/relative)==expected,('Source hash mismatch',relative)
    for relative,expected in manifest['input_files'].items():assert sha256(HERE/relative)==expected,('Input hash mismatch',relative)
    print('PINNED_SOURCE_AND_INPUT_HASHES_PASS',flush=True)
    sys.path.insert(0,str(upstream));sys.path.insert(0,str(upstream/'support_compression_certificate'))
    global source
    import audit_sparse6_altgroups as source
    ctx.dps=100
    from complex_upper_origin_layer_definitions import check_origin_identity
    check_origin_identity()
    left,right=source.origin_check.LEFT,source.origin_check.RIGHT
    assert right[0]==(left[0][1],-left[0][0])
    print('EXACT_ENDPOINT_IDENTITY: beta=-i*alpha; joint constant term cancels.',flush=True)
    table=args.added_table.resolve() if args.added_table else HERE/'added_origin_120_240.npz'
    print('PINNED_TABLE_SHA256',manifest['input_files']['added_origin_120_240.npz'])
    print('SELECTED_TABLE_SHA256',sha256(table))
    if args.added_table:print('Caller-supplied table: certification requires generator provenance; hash match',sha256(table)==manifest['input_files']['added_origin_120_240.npz'])
    if args.full:
        subprocess.run([sys.executable,str(HERE/'upper_base/verify_intervals.py'),'--source',str(upstream),'--full'],check=True)
        from verify_dirichlet_energy import calculate
        regenerated=calculate(upstream)
        for label,cap in zip(('left','right','joint'),TOTALS):
            item=regenerated[label]
            assert Q(int(item['numerator']),int(item['denominator']))<=cap
        print('ORIGINAL_AND_DIRICHLET_PREREQUISITES_RERUN_PASS',flush=True)
    else:print('ASSEMBLY_ONLY: source prerequisites and total-energy integrals are previously certified inputs. --full reruns them; coefficient quadrature is separate.',flush=True)
    L,R=load_origin(table)
    alpha=source.origin_check.phase_at_zero(left);beta=source.origin_check.phase_at_zero(right)
    C=[(beta.conjugate()*a+alpha.conjugate()*b).real for a,b in zip(L,R)]
    a,va=tail_energy(L,alpha,TOTALS[0]);b,vb=tail_energy(R,beta,TOTALS[1]);c,vc=tail_energy(C,None,TOTALS[2],True)
    W=weighted_h(N);sixth=((c*W).sqrt()+(a*b).sqrt()/(2*N+1)).upper()
    rows=list(source.RHO_ROWS);rows[2]=tuple(-x for x in rows[2])
    columns=[scalar_column(row,N) for row in rows]
    for i in range(5):
        exact=source.scalar_profile(rows[i]);assert all(columns[i][n].overlaps(arb.pi()*aq(exact[n])) for n in range(120))
    columns.append([(x*y.conjugate()).real for x,y in zip(L,R)])
    tails=[aq(Q(10)*r**(-(2*N+1))/(1-r**(-2))) for r in [Q('1.2')]+[Q('1.11')]*3]
    tails.extend([fifth_tail(N),sixth])
    q=[sum((aq(WEIGHTS[i])*columns[i][n] for i in range(6)),arb(0)) for n in range(N)]
    eps=(-arb(18)).exp().upper()
    norms=[sum((abs(z).upper()**2 for z in values),arb(0)).sqrt().upper() for values in (L,R)]
    error=aq(WEIGHTS[5])*(eps*sum(norms,arb(0))+eps**2)
    tail=sum((aq(w)*t for w,t in zip(WEIGHTS,tails)),arb(0)).upper()
    def check(p):
        nonlinear=sum((abs(p[n]).upper() for n in range(1,len(p))),arb(0))
        slope=(p[0].lower()-nonlinear-error.upper()-tail.upper())/aq(sum(WEIGHTS))
        assert slope>0
        return (1/slope).upper(),slope.lower(),nonlinear
    direct,_,_=check(arb_poly(q))
    eta=list(map(Q,json.loads((HERE/'inverse_eta.json').read_text())))
    assert len(eta)==120 and eta[0]>0 and sum(map(abs,eta))==1
    p=compose(q,eta);assert len(p)==N+(2*N-1)*(len(eta)-1)
    upper,slope,nonlinear=check(p);assert upper<aq(FINAL)
    result=dict(status='PASS',count=N,claim=str(FINAL),direct_upper=str(direct),preprocessed_upper=str(upper),slope=str(slope),nonlinear=str(nonlinear),degree=len(p)-1,global_integration_error=str(error.upper()),weighted_tail=str(tail),fifth_tail=str(tails[4]),sixth_tail=str(sixth),remaining_energies=list(map(str,(a,b,c))),visible_energies=list(map(str,(va,vb,vc))),weighted_h=str(W),weights=list(map(str,WEIGHTS)))
    print(json.dumps(result,indent=2),flush=True)
    if args.output:args.output.write_text(json.dumps(result,indent=2)+'\n')
    print('PASS K_C < 1.404898359045958')

if __name__=='__main__':main()
