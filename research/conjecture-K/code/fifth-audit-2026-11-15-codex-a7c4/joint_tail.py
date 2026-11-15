#!/usr/bin/env python3
"""Exact joint-box tails and sharp local spectral constants.

Agent-ID: codex-a7c4. Refs #411. python3 -I; standard library only.
Read-only by default. The compact finite-remainder inequality remains open.
"""
import argparse
from fractions import Fraction as F
import hashlib
import importlib.util
import json
from math import comb, factorial
from pathlib import Path
import sys

if not __debug__:
    raise RuntimeError('Assertions required; do not use -O.')
sys.dont_write_bytecode = True
source = Path(__file__).resolve().parents[1] / 'audit-2026-11-15-codex-a7c4/odd_cost_check.py'
spec = importlib.util.spec_from_file_location('joint_tail_intervals', source)
old = importlib.util.module_from_spec(spec)
spec.loader.exec_module(old)
I = old.Interval
ROWS = {
    'peak': (F(699,1250), F(179,1250), F(1891,2500), F(7,25)),
    'flank': (F(14,25), F(1467,10000), F(149,200), F(11,40)),
    'upper': (F(573,1000), F(19,125), F(1891,2500), F(13,50)),
}


def bernstein(poly, left, right):
    """Power coefficients on [left,right] -> degree-n Bernstein controls."""
    n = len(poly)-1
    shifted = [sum(poly[k]*comb(k,j)*left**(k-j)*(right-left)**j
                   for k in range(j,n+1)) for j in range(n+1)]
    return [sum(shifted[j]*F(comb(i,j),comb(n,j)) for j in range(i+1))
            for i in range(n+1)]


def inverse_exp(t):
    return I(1)/old.exp_positive(t)


def mass(t):
    return (F(3,2)*t*t+t+2)*inverse_exp(t)


def angular_upper(z, count):
    assert 0 <= z < 1
    # a_k=(binom(2k,k)/4^k)^2 decreases in k. The omitted sum is
    # <= a_count*z^count/(1-z); all retained terms are positive.
    coefficients = [F(comb(2*k,k)**2,16**k) for k in range(count+1)]
    out = coefficients[-1]/(1-z)
    for coefficient in reversed(coefficients[:-1]):
        out = coefficient+z*out
    return out


def spectral(k1,k2,m):
    difference = ((k2-k1)*(k2-k1)+4*m*m).sqrt()
    least = (k1+k2-difference)/2
    # The smaller eigenvector has opposite real signs when m>0.
    second_energy = (1-(k2-k1)/difference)/2
    assert difference.lo > 0 and m.lo > 0
    assert 0 < second_energy.lo < second_energy.hi < 1
    return {'least_eigenvalue':least.enclosure(),
            'second_coordinate_energy_share':second_energy.enclosure()}


def verify():
    cells, count, cutoff, split = 200, 24, F(29,10), F(97,20)
    potential_cap, reserve = F(187,200), F(7,1000)
    masses = [mass(split*j/cells) for j in range(cells+1)]
    # For t=3+y, -e^t d(e^-t P(t))/dt=3/2+4y+3y^2/2>0.
    assert split >= 3
    ja,jb,cross = F(179,50),F(53,50),F(39,20)
    rows = {}
    for name,(a,b,eps,density_cap) in ROWS.items():
        # e^t >= Taylor_16(t), so positivity below gives the old B cap
        # on [0,2]. The true density decreases after t=2.
        polynomial = [F(0)]*19
        for i,c in enumerate([a*a,4*a*b,3*b*b]):
            for k in range(17):
                polynomial[i+k] += 2*density_cap*c/F(factorial(k))
        polynomial[2] -= 1
        controls = [bernstein(polynomial,F(j),F(j+1)) for j in range(2)]
        assert all(v > F(1003,100000) for cell in controls for v in cell)
        assert 2/a <= ja and 4*density_cap <= jb*jb and ja*jb <= cross*cross
        p = 1/eps
        assert p >= F(33,25)
        assert ja-(p-F(6,25)) <= F(5,2)
        assert jb-(p-F(13,50)) <= 0
        inner = I(0)
        max_z = split*(a+b*split)**2/cutoff**2
        assert max_z < 1
        for j in range(cells):
            hi = split*(j+1)/cells
            z = hi*(a+b*hi)**2/cutoff**2
            cell_mass = masses[j]-masses[j+1]
            assert cell_mass.lo > 0
            inner += cell_mass*angular_upper(z,count)/cutoff
        tail_density = inverse_exp(split)*(F(3,2)*split*split-2*split+1)/((a+b*split)*(a+3*b*split))
        outer = 2*(masses[-1]*tail_density).sqrt()
        potential = inner+outer
        assert potential.hi < potential_cap
        assert p-F(189,500)-potential_cap >= reserve
        j0,j1,j2,j3 = old.radial_integrals(a,b)
        ka = p-(j2-2*j1+j0)/2
        kb = p-j2/4
        m = (j2-j1)/(2*I(2).sqrt())
        ab = spectral(ka,kb,m)
        assert F(298364,10**6) < F(ab['least_eigenvalue'][0])
        if name=='peak':
            assert F(ab['least_eigenvalue'][1]) < F(298365,10**6)
            kq = p-j1
            knu = p-(j3-4*j2+4*j1)/2
            mqnu = -(j2-2*j1)/I(2).sqrt()
            odd = spectral(kq,knu,mqnu)
            assert F(-387102,10**6) < F(odd['least_eigenvalue'][0])
            assert F(odd['least_eigenvalue'][1]) < F(-387101,10**6)
            odd['scope'] = 'Imaginary pointwise (Q,nu) block; constant Q is not a centered remote Wick quadratic.'
        rows[name] = {
            'a':str(a),'b':str(b),'epsilon':str(eps),
            'B_density_cap':str(density_cap),
            'B_density_Bernstein_minima':[str(min(cell)) for cell in controls],
            'max_inner_squared_radius_ratio':str(max_z),
            'inner_potential_upper_expression':inner.enclosure(),
            'outer_potential_upper_expression':outer.enclosure(),
            'potential_upper_expression':potential.enclosure(),
            'local_AB':ab,
        }
    # Close the original all-shift Gaussian-amplitude reduction.
    kr,ks = F(7,2),F(15,4)
    assert kr*(kr-F(5,2)) > (cross-F(59,500))**2
    assert ks*(ks-F(5,2)) > (cross+F(59,500))**2
    w = F(113,10000)
    reserve_table = [(F(3,10),F(11,500),F(59,2500)),
                     (F(13,40),F(4,625),F(17,2500)),
                     (F(7,20),F(163,100000),F(7,4000)),
                     (F(3,8),F(371,1000000),F(199,500000)),
                     (F(2,5),F(753,10000000),F(807,10000000)),
                     (F(9,20),F(219,100000000),F(47,20000000))]
    tails = []
    for radius,eta_r,eta_s in reserve_table:
        s = radius*radius/w
        exp_lower = sum(s**k/F(factorial(k)) for k in range(161))
        delta = 2*(1+s)/exp_lower
        assert delta < 1
        assert (kr+eta_r)*delta <= eta_r
        assert (ks+eta_s)*delta <= eta_s
        tails.append({'radius':str(radius),'robust_reserve':str(eta_r),
                      'signed_reserve':str(eta_s),
                      'weighted_tail_fraction_upper':I(delta).enclosure()})
    assert F(807,10000000) < reserve
    return {
        'agent_id':'codex-a7c4','task':411,'status':'PASS',
        'scope':'Exact scalar inputs to the re-derived box reduction; all-amplitude shift tail. Compact joint inequality remains open.',
        'interval_library_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
        'rows':rows,'pointwise_imaginary_Q_nu':odd,
        'shift_cutoff':str(cutoff),'radial_split':str(split),
        'radial_cells':cells,'angular_terms':count,
        'uniform_potential_upper':str(potential_cap),
        'signed_and_robust_shift_reserve':str(reserve),
        'uniform_A_potential_cap':str(ja),'uniform_B_potential_cap':str(jb),
        'uniform_mixed_potential_cap':str(cross),
        'Gaussian_weighted_tail_reserves':tails,
    }


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true')
    args=parser.parse_args()
    output=json.dumps(verify(),indent=2,sort_keys=True)+'\n'
    if args.write_result:
        Path(__file__).with_name('joint_tail_result.json').write_text(output)
    print(output,end='')


if __name__=='__main__':
    main()
