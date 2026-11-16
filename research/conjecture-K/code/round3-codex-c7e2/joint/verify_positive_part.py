# /workspace/scratch/f307e93b3610/codex-c7e2-round3/joint/verify_positive_part.py
"""Agent-ID codex-c7e2. Exact consumer deductions; not a new matrix quadrature."""
import argparse, hashlib, importlib.util, json, math, sys
from fractions import Fraction as F
from pathlib import Path

if not __debug__:
    raise RuntimeError('Assertions must be enabled.')
sys.dont_write_bytecode=True

def main():
    ap=argparse.ArgumentParser();ap.add_argument('--repo',required=True,type=Path);args=ap.parse_args()
    root=args.repo/'research/conjecture-K/code'
    src=root/'audit-2026-11-15-codex-a7c4/odd_cost_check.py'
    spec=importlib.util.spec_from_file_location('exact_radial',src)
    old=importlib.util.module_from_spec(spec);spec.loader.exec_module(old)
    I=old.Interval
    p=F(2500,1891);k=F(32,25);alpha=F(217,100);rho=F(5053,10000)
    j=old.radial_integrals(F(699,1250),F(179,1250))
    h=(j[2]-2*j[1])/I(2).sqrt()
    assert -F(61,100)<h.lo<=h.hi<-F(3,5)
    m=p-F(463,5000)-F(67,100)*(1+rho*rho)
    assert m>0
    # Eigenvalues in the Q+nu, Q-nu, P coordinates of each real/imaginary block.
    def eigen_pairs(kappa):
        return [(I(kappa-F(3,10)),I(p-kappa+F(3,10))+F(11,20)*h),
                (I(kappa+F(3,10)),I(p-kappa-F(3,10))-F(11,20)*h),
                (I(kappa-F(3,5)),I(p-kappa+F(3,5))+h),
                (I(kappa+F(3,5)),I(p-kappa-F(3,5))-h),
                (I(kappa),I(p-kappa))]
    for g,d in eigen_pairs(k):
        assert g.lo>0 and d.lo>F(19,2500)
        assert (129*d-g).lo>0
    nu_zero_coefficient=alpha*p/(p-k)-m
    assert nu_zero_coefficient>0
    base=root/'odd-cubic-core-2026-11-15'
    paths=[base/'results/all_bounds.txt',base/'review-claude-b9ee/recomputed_all_bounds_gcc13.txt']
    banks=[]
    for path in paths:
        rows=[]
        for line in path.read_text().splitlines():
            cols=line.split();assert len(cols)==5
            idx=int(cols[0]);vals=[float(x) for x in cols[1:]]
            assert all(map(math.isfinite,vals))
            lo,hi,bound,err=map(F.from_float,vals)
            assert lo<=F(idx,40) and hi>=F(idx+1,40)
            assert 0<=err<bound<k and bound>F(3,5)
            rows.append((idx,bound))
        assert [i for i,bound in rows]==list(range(320))
        banks.append(rows)
    upper_rows=[]
    for idx in range(320):
        kap=max(bank[idx][1] for bank in banks)
        w=F(idx,40)
        for tau in (F(121),F(17)+607*w*w,F(67)+296*w*w):
            for g,d in eigen_pairs(kap):
                assert d.lo>0 and (tau*d-g).lo>0,(idx,tau)
        upper_rows.append(kap)
    # Reviewed analytic tail M-C0 < 11/10 I applies for every w>=8.
    for tau in (F(121),F(17)+607*64,F(67)+296*64):
        for g,d in eigen_pairs(F(11,10)):
            assert d.lo>0 and (tau*d-g).lo>0
    def coeff(t0,t2,u):
        return alpha*(1+t0)-m+4*u*max(F(0),alpha*t2-F(1,2))
    profiles={}
    for name,u in [('global_cap',F(463,10000)),('near_u_star',F(50431,1250000)),('small_u',F(1,100)),('zero_u',F(0))]:
        choices=[coeff(F(121),F(0),u),coeff(F(17),F(607),u),coeff(F(67),F(296),u)]
        best=min(choices);vcap=F(1,20000)/best
        profiles[name]={'u':str(u),'coefficient':str(best),'coefficient_display':float(best),
                        'V_cap':str(vcap),'V_cap_display':float(vcap),'selected':choices.index(best)}
    recentered=[]
    for beta,shift in [(F(7,4),'q_prime=q+(15159/50000)B; H=(T-2/5)A+Z^2 conjugate(B)/sqrt(2)'),
                       (F(11,10),'q_prime=q+(7/50)A+(15159/50000)B; H=(T-27/50)A+Z^2 conjugate(B)/sqrt(2)')]:
        general_coefficient=alpha+122*beta-m
        no_nu_coefficient=alpha+beta*p/(p-k)-m
        assert general_coefficient>no_nu_coefficient>0
        recentered.append({'beta':str(beta),'identity':shift,
                           'general_coefficient':str(general_coefficient),'general_coefficient_display':float(general_coefficient),
                           'general_V_cap':str(F(1,20000)/general_coefficient),'general_V_cap_display':float(F(1,20000)/general_coefficient),
                           'nu_zero_coefficient':str(no_nu_coefficient),'nu_zero_coefficient_display':float(no_nu_coefficient),
                           'nu_zero_V_cap':str(F(1,20000)/no_nu_coefficient),'nu_zero_V_cap_display':float(F(1,20000)/no_nu_coefficient)})
    result={'agent_id':'codex-c7e2','status':'PASS','h_interval':h.enclosure(20),
            'inherited_matrix_certificate':'PR447 full interval rows and analytic tail; source quadrature not regenerated here',
            'source_sha256':{str(x.relative_to(args.repo)):hashlib.sha256(x.read_bytes()).hexdigest() for x in [src]+paths},
            'pointwise_odd_margin':'19/2500','basic_generalized_ratio':'129',
            'certified_ratio_envelopes':[['121','0'],['17','607'],['67','296']],
            'm':str(m),'m_display':float(m),'basic_V_cap':str(F(1,20000)/(130*alpha-m)),
            'basic_V_cap_display':float(F(1,20000)/(130*alpha-m)),
            'nu_zero':{'coefficient':str(nu_zero_coefficient),'coefficient_display':float(nu_zero_coefficient),
                       'V_cap':str(F(1,20000)/nu_zero_coefficient),'V_cap_display':float(F(1,20000)/nu_zero_coefficient)},
            'sqrt_region_constants':{'linear_V':str(alpha-m),'mixed_VW':'2*sqrt((1736/625)*V*W)'},
            'recentered_corollaries':recentered,
            'recentered_inputs':'beta=7/4 and beta=11/10 are separate new inverse-potential theorems; this checker verifies their scalar consumers only',
            'profiles':profiles}
    out=Path(__file__).with_name('positive_part_result.json');out.write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(result,indent=2))

if __name__=='__main__':main()
