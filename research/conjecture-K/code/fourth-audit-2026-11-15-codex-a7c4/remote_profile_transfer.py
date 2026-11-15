"""Exact scalar budget for a one-sided remote-profile transfer.

Agent-ID: codex-a7c4. Refs #406. Run with python3 -I.
The inherited remote cap and Rice support are named premises, not recomputed
here. REMOTE.md audits/replays their implementation and proves the transfer.
Standard library only; read-only unless --write-result is explicit.
"""
from fractions import Fraction as Q
from pathlib import Path
import argparse
import json

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')


def atan_enclosure(x, terms=30):
    assert 0 < x < 1 and terms % 2 == 0
    lower = sum(((-1)**j*x**(2*j+1)/Q(2*j+1)
                 for j in range(terms)), Q(0))
    return lower, lower+x**(2*terms+1)/Q(2*terms+1)


def verify():
    # Machin: pi = 16 atan(1/5)-4 atan(1/239).
    a, b = atan_enclosure(Q(1,5)), atan_enclosure(Q(1,239))
    pi_lo, pi_hi = 16*a[0]-4*b[1], 16*a[1]-4*b[0]
    sqrt_pi_hi = Q(1772453850905517,10**15)
    assert 3 < pi_lo < pi_hi < sqrt_pi_hi**2
    cap = Q(1373953883,10**9)
    support = Q(13739535256614828,10**16)
    ga = Q(1689944147450845,10**15)
    gb = Q(2622896929056071,10**15)
    ca, cb = sqrt_pi_hi-ga, Q(3,2)*sqrt_pi_hi-gb
    assert ca>0 and cb>0
    eps0 = Q(1891,2500)
    max_scale = Q(19,25)/eps0
    da, db = Q(1,2000), Q(1,625)
    bound = max_scale*(cap-support+ca*da+cb*db)
    assert bound == Q(2348075715791501,23637500000000000000)
    assert bound < Q(1,10000)
    # Smaller rectangle supplies a rounder strict tolerance.
    smaller = max_scale*(cap-support+ca*da+cb*Q(3,2000))
    assert smaller == Q(7241885051036049,75640000000000000000)
    assert smaller < Q(96,10**6)
    # These other named profiles are not claimed by the new rectangle.
    named = {'flank': (Q(149,200),Q(14,25),Q(1467,10000)),
             'upper': (eps0,Q(573,1000),Q(19,125))}
    exclusions = {}
    for name,(eps,aa,bb) in named.items():
        scale=eps/eps0
        d0,d1=aa/scale-Q(699,1250),bb/scale-Q(179,1250)
        assert not (0<=d0<=da and 0<=d1<=db)
        exclusions[name]=[str(d0),str(d1)]
    # Merged #408: reviewed peak tilted secant and central content premises.
    gamma=Q(1077659,27000000)
    cost=Q(59009,189100)
    umax=Q(463,10000)
    chi=Q(7,100)
    remote_error=Q(9,25000000)
    tilted_error=remote_error+gamma*chi*umax**2/cost
    assert cost==1/eps0-Q(3,5)**2-Q(13,20)>0
    assert tilted_error==Q(3115324569897527,159324300000000000000)
    assert tilted_error<Q(1,50000)
    return {'agent_id':'codex-a7c4','task':406,'status':'PASS',
            'arithmetic':'exact Fraction; Machin alternating-series pi enclosure',
            'inherited_remote_cap':str(cap),'inherited_support_lower':str(support),
            'sqrt_pi_upper':str(sqrt_pi_hi),
            'one_sided_a_coefficient_upper':str(ca),
            'one_sided_b_coefficient_upper':str(cb),
            'epsilon_range':['37/50','19/25'],
            'normalized_a_increment_range':['0',str(da)],
            'normalized_b_increment_range':['0',str(db)],
            'uniform_excess_upper':str(bound),'simple_uniform_tolerance':'1/10000',
            'smaller_b_increment_upper':'3/2000','smaller_excess_upper':str(smaller),
            'smaller_simple_tolerance':'96/1000000',
            'excluded_named_profile_increments':exclusions,
            'central_tilted_subclass':{
                'profile':'peak only; NOT transferred to the profile rectangle',
                'energy_range':['3/100','463/10000'],
                'normalized_fourth_excess_upper':str(chi),
                'inherited_content_coefficient':str(gamma),
                'inherited_global_cost':str(cost),
                'inherited_remote_error':str(remote_error),
                'retained_core_excess_upper':str(tilted_error),
                'simple_tolerance':'1/50000'},
            'scope':'Every remote cubic and every variance/dimension; a one-sided scaled-peak rectangle, not the full box or other named rows.'}


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true')
    args=parser.parse_args()
    output=json.dumps(verify(),indent=2)+'\n'
    if args.write_result:
        Path(__file__).with_name('remote_profile_transfer_result.json').write_text(output)
    print(output,end='')


if __name__=='__main__':
    main()
