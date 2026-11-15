"""Exact budgets for the sixth-audit retained A-core transfer.

Agent-ID: codex-a7c4. Refs #415. Run with python3 -I.
The newly reviewed content/deficit theorem is a named inherited premise,
not re-certified here. No files are written without --write-result.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path

if not __debug__:
    raise RuntimeError('Assertions required; do not use -O.')


def atan_bounds(x, count=30):
    assert 0 < x < 1 and count % 2 == 0
    lower = sum(((-1)**j*x**(2*j+1)/Q(2*j+1)
                 for j in range(count)), Q(0))
    return lower, lower+x**(2*count+1)/Q(2*count+1)


def verify():
    eps0, s, secant = Q(1891,2500), Q(3,5), Q(13,20)
    p = 1/eps0
    content_slope, content_error = Q(3,10), Q(3,500000)
    cost = p-s*s-secant
    kappa, eta = content_slope/cost, content_error/cost
    assert cost == Q(59009,189100)
    assert kappa == Q(56730,59009) < 1
    assert eta == Q(5673,295045000) < Q(1,50000)
    remote_upper = Q('1.373953883')
    s_lower, s_upper = Q('1.3739535256614'), Q('1.3739535256616')
    support_lower = Q('1.3739535256614828')
    assert support_lower < s_upper < remote_upper
    peak_excess = remote_upper-s_lower+eta
    assert peak_excess == Q(5778430967237,295045000000000000)
    assert peak_excess < Q(1,50000)
    # D_+ does not permit the (1-kappa) factor on a negative-deficit cap.
    # This is an exact scalar countermodel to that implication, not a cubic.
    remote_error = Q(9,25000000)
    abstract_deficit = -remote_error
    abstract_gain = eta
    assert abstract_gain <= kappa*max(abstract_deficit,Q(0))+eta
    assert remote_error+abstract_gain > (1-kappa)*remote_error+eta
    # Fresh elementary pi enclosure; gradient and benchmark data inherited
    # from STATUS 3.14's independently reviewed Rice certificate.
    a,b = atan_bounds(Q(1,5)),atan_bounds(Q(1,239))
    pi_lo,pi_hi = 16*a[0]-4*b[1],16*a[1]-4*b[0]
    sqrt_pi_hi = Q('1.772453850905517')
    assert 3 < pi_lo < pi_hi < sqrt_pi_hi**2
    ga,gb = Q('1.689944147450845'),Q('2.622896929056071')
    ca,cb = sqrt_pi_hi-ga,Q(3,2)*sqrt_pi_hi-gb
    assert ca > 0 and cb > 0
    lambda_lo,lambda_hi = Q(37,50)/eps0,Q(19,25)/eps0
    cost_min = p-lambda_hi*s*s-secant
    assert cost_min == Q(11737,37820) > content_slope
    kappa_max,eta_max = content_slope/cost_min,content_error/cost_min
    assert kappa_max < 1
    da,db = Q(1,2500),Q(1,800)
    profile_excess = lambda_hi*(remote_upper-support_lower+eta_max+ca*da+cb*db)
    assert profile_excess == Q(869040549842757089931,8877866800000000000000000)
    assert profile_excess < Q(49,500000) < Q(1,10000)
    energy = Q(463,10000)
    common_energy = lambda_lo**2*energy
    assert common_energy == Q(633847,14303524) > Q(443,10000)
    exclusions = {}
    for name,(eps,aa,bb) in {
            'flank':(Q(149,200),Q(14,25),Q(1467,10000)),
            'upper':(eps0,Q(573,1000),Q(19,125))}.items():
        scale = eps/eps0
        d0,d1 = aa/scale-Q(699,1250),bb/scale-Q(179,1250)
        assert not (0<=d0<=da and 0<=d1<=db)
        exclusions[name]=list(map(str,[d0,d1]))
    return {
        'agent_id':'codex-a7c4','task':415,'status':'PASS',
        'scope':'Exact scalar acceptance conditional on named reviewed theorem inputs; peak/scaled-profile retained A-core only.',
        'inherited_content_deficit_slope':str(content_slope),
        'inherited_content_deficit_error':str(content_error),
        'inherited_remote_upper':str(remote_upper),
        'peak_cost':str(cost),'peak_kappa':str(kappa),'peak_eta':str(eta),
        'peak_excess_upper':str(peak_excess),'peak_simple_tolerance':'1/50000',
        'positive_part_countermodel':{'D':str(abstract_deficit),'gain':str(abstract_gain),
            'scope':'Scalar nonimplication only; not a realizable-cubic counterexample.'},
        'epsilon_range':['37/50','19/25'],
        'scale_range':list(map(str,[lambda_lo,lambda_hi])),
        'recosted_minimum':str(cost_min),'maximum_kappa':str(kappa_max),
        'maximum_eta':str(eta_max),
        'normalized_a_increment':['0',str(da)],
        'normalized_b_increment':['0',str(db)],
        'energy_condition':'u <= lambda^2 * 463/10000',
        'common_energy_endpoint':str(common_energy),
        'safe_common_energy_endpoint':'443/10000',
        'one_sided_a_loss_coefficient':str(ca),
        'one_sided_b_loss_coefficient':str(cb),
        'profile_excess_upper':str(profile_excess),
        'profile_simple_tolerance':'49/500000',
        'excluded_named_profiles':exclusions,
    }


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true')
    args=parser.parse_args()
    output=json.dumps(verify(),indent=2,sort_keys=True)+'\n'
    if args.write_result:
        Path(__file__).with_name('retained_profile_transfer_result.json').write_text(output)
    print(output,end='')


if __name__=='__main__':
    main()
