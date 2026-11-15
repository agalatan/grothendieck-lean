#!/usr/bin/env python3
"""Exact zero-base sector forms, obstructions, and smaller shift cutoff.

Agent-ID: codex-a7c4. Refs #406. Run with python3 -I.
No compact joint-remainder inequality is assumed to pass here.
"""
from fractions import Fraction as F
from pathlib import Path
import argparse
import hashlib
import importlib.util
import json
import sys

if not __debug__:
    raise RuntimeError('Do not disable assertions with -O.')
sys.dont_write_bytecode = True
source = Path(__file__).resolve().parents[1] / 'audit-2026-11-15-codex-a7c4' / 'odd_cost_check.py'
spec = importlib.util.spec_from_file_location('joint_intervals', source)
old = importlib.util.module_from_spec(spec)
spec.loader.exec_module(old)
I = old.Interval


def exp_minus(x):
    return I(1) / old.exp_positive(x)


def tail_mass(t):
    # integral_t^infinity (3s^2/2-2s+1) exp(-s) ds.
    return (F(3, 2)*t*t+t+2)*exp_minus(t)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result', action='store_true')
    args = parser.parse_args()
    rows = {
        'peak': (F(1891,2500), F(1057,1250), F(179,1250)),
        'flank': (F(149,200), F(4267,5000), F(1467,10000)),
        'upper': (F(1891,2500), F(877,1000), F(19,125)),
    }
    cells, cutoff, split = 200, F(17,4), F(21,4)
    common_cap, common_reserve = F(183,200), F(27,1000)
    assert split >= 3
    # The paper proves the tail density decreases for t>=3 by expanding
    # -exp(t)*d/dt(exp(-t)P(t)) at t=3+y as 3/2+4y+3y^2/2.
    masses = [tail_mass(split*j/cells) for j in range(cells+1)]
    result_rows = {}
    for name, (eps, ell, b) in rows.items():
        a, p = ell-2*b, 1/eps
        j0,j1,j2,j3 = old.radial_integrals(a,b)
        ka = p-(j2-2*j1+j0)/2
        kb = p-j2/4
        mixed = (j2-j1)/(2*I(2).sqrt())
        da, db, dm = ka-F(8,25), kb-F(17,50), mixed-F(59,500)
        assert da.lo > 0 and db.lo > 0
        determinant = da*db-dm*dm
        assert determinant.lo > 0
        # A positive-definite residual proves Q0 >= target + .08 I.
        assert F(6,25)+F(2,25) == F(8,25)
        assert F(13,50)+F(2,25) == F(17,50)
        total = I(0)
        for j in range(cells):
            hi = split*(j+1)/cells
            denominator = cutoff-I(hi).sqrt()*(a+b*hi)
            assert denominator.lo > 0
            mass = masses[j]-masses[j+1]
            assert mass.lo > 0
            total += mass/denominator
        p_split = F(3,2)*split*split-2*split+1
        density_cap = exp_minus(split)*p_split/((a+b*split)*(a+3*b*split))
        tail = 2*(masses[-1]*density_cap).sqrt()
        cap = total+tail
        assert cap.hi < common_cap
        assert p >= F(33,25)
        assert p-F(189,500)-common_cap >= common_reserve
        result_rows[name] = {
            'epsilon': str(eps), 'ell': str(ell), 'beta': str(b),
            'local_A_cost': ka.enclosure(), 'local_B_cost': kb.enclosure(),
            'local_mixed_matrix_entry': mixed.enclosure(),
            'local_residual_determinant_after_0.08': determinant.enclosure(),
            'large_shift_inner_upper_interval': total.enclosure(),
            'large_shift_outer_upper_interval': tail.enclosure(),
            'large_shift_upper_interval': cap.enclosure(),
        }
        if name == 'peak':
            # (A,B)=(1,-1/5): the norm is 26/25, and the local
            # cost rules out the newly proposed exact .300 margin.
            ab_test = (ka+kb/25-2*mixed/5)/F(26,25)
            assert ab_test.hi < F(3,10)
            # Pointwise odd coefficients (kQ,nu)=(i,-i), kP=0.
            # This Q is a constant, NOT an admissible Wick quadratic.
            q_cost = p-j1
            nu_cost = p-(j3-4*j2+4*j1)/2
            q_nu_mixed = -(j2-2*j1)/I(2).sqrt()
            odd_test = (q_cost+nu_cost-2*q_nu_mixed)/2
            assert odd_test.hi < -F(3,8)
            # secant_joint.py uses angle/(pi/2), not energy share.
            share_375 = (1-(2-I(2).sqrt()).sqrt()/2)/2
            share_125 = (1-(2+I(2).sqrt()).sqrt()/2)/2
            assert F(308658,10**6) < share_375.lo < share_375.hi < F(308659,10**6)
            assert F(38060,10**6) < share_125.lo < share_125.hi < F(38061,10**6)
            obstructions = {
                'AB_direction': '(1,-1/5)',
                'AB_normalized_local_cost': ab_test.enclosure(),
                'AB_exact_margin_refuted': '3/10',
                'AB_cubic_scope': 'q=0, r_A=sX, r_B=-sX/5; X remote standard complex Gaussian',
                'pointwise_odd_direction': '(kQ,kP,nu)=(i,0,-i)',
                'pointwise_Q_cost': q_cost.enclosure(),
                'pointwise_nu_cost': nu_cost.enclosure(),
                'pointwise_Q_nu_matrix_entry': q_nu_mixed.enclosure(),
                'pointwise_odd_normalized_local_cost': odd_test.enclosure(),
                'pointwise_odd_scope': 'Constant Q violates the genuine cubic condition E Q=0; no counterexample to K.',
                'joint_grid_angle_0.375_B_energy_share': share_375.enclosure(),
                'joint_grid_angle_0.125_B_energy_share': share_125.enclosure(),
            }
    result = {
        'agent_id': 'codex-a7c4', 'status': 'PASS; exact rational arithmetic',
        'scope': 'Local at zero base; exact .300-margin and pointwise-five-sector obstructions; all-amplitude large-shift tail. The compact joint bound remains open.',
        'interval_library_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
        'rows': result_rows,
        'obstructions_and_grid_interpretation': obstructions,
        'local_common_extra_diagonal_reserve': '2/25',
        'large_shift_cutoff': str(cutoff), 'radial_split': str(split),
        'radial_cells': cells, 'large_shift_potential_upper': str(common_cap),
        'large_shift_signed_and_robust_reserve': str(common_reserve),
        'compact_region_still_open': '0 <= x <= 17/4, |alpha|,|beta| <= 2/5',
    }
    output = json.dumps(result, indent=2, sort_keys=True)+'\n'
    if args.write_result:
        Path(__file__).with_name('joint_reduction_result.json').write_text(output)
    print(output, end='')


if __name__ == '__main__':
    main()
