#!/usr/bin/env python3
"""Second audit: sharp odd costs and explicit finite-amplitude counterexamples.
Agent-ID: codex-a7c4. Refs #398. Run python3 -I sectors_exact.py.

Reuses the previously audited exact-rational interval library at an explicit
repository-relative path. No saved numerical result is trusted. New acceptance
comparisons and Taylor remainder bounds use Fraction only. See SECTORS.md.
"""
from fractions import Fraction as F
from pathlib import Path
from math import factorial
import hashlib
import importlib.util
import json
import sys

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not run with -O.')
sys.dont_write_bytecode=True
source=Path(__file__).resolve().parents[1]/'audit-2026-11-15-codex-a7c4'/'odd_cost_check.py'
spec=importlib.util.spec_from_file_location('audited_odd_intervals',source)
old=importlib.util.module_from_spec(spec);spec.loader.exec_module(old)

def centred_exp_moment(k):
    from math import comb
    return sum(F(comb(k,j))*(-1)**(k-j)*factorial(j) for j in range(k+1))

def main():
    assert centred_exp_moment(2)==1
    assert centred_exp_moment(4)==9
    # Gamma(m+3/2)/sqrt(pi), m=0..4.
    gamma=[F(1,2)]
    for m in range(4):gamma.append(gamma[-1]*F(2*m+3,2))
    fourth_weight=16*gamma[0]-32*gamma[1]+24*gamma[2]-8*gamma[3]+gamma[4]
    assert fourth_weight==F(193,32)
    tau=F(1,100)
    # Genuine cubic i*tau Z(|Y|^2-1), corner of the application box.
    corner_k1,corner_k3=old.costs(F(19,25),F(19,25),F(4,25))
    assert corner_k1.hi < -F(381,5000)
    a=F(11,25)
    corner_gain=tau*tau*F(381,5000)-F(9,4)*tau**4/a**3
    assert corner_gain>F(7,10**6)
    # Genuine one-coordinate cubic i*tau Z(T-2), at the flank profile.
    _,flank_k3=old.costs(F(149,200),F(4267,5000),F(1467,10000))
    assert flank_k3.hi<F(2853,8000)
    a_flank=F(14,25)
    flank_violation=2*tau*tau*(F(9,25)-F(2853,8000))-F(193,64)*tau**4/a_flank**3
    assert flank_violation>F(5,10**7)
    # Convex endpoint reduction: the exact uniform n=1 cost is the second endpoint.
    _,other_k3=old.costs(F(19,25),F(19,25),F(3,25))
    assert corner_k3.hi<other_k3.lo
    assert corner_k3.lo>F(15167,100000)
    result={'agent_id':'codex-a7c4','status':'PASS; exact arithmetic',
            'inherited_checker_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
            'corner_profile':{'epsilon':'19/25','ell':'19/25','beta':'4/25'},
            'corner_polynomial':'(i/100) Z (|Y|^2-1)',
            'corner_k1_enclosure':corner_k1.enclosure(),
            'corner_gain_strict_lower_bound':str(corner_gain),
            'flank_polynomial':'(i/100) Z (|Z|^2-2)',
            'flank_k3_enclosure':flank_k3.enclosure(),
            'flank_point36_cost_violation_strict_lower_bound':str(flank_violation),
            'sharp_uniform_n1_cost_enclosure':corner_k3.enclosure(),
            'other_profile_endpoint_cost_enclosure':other_k3.enclosure(),
            'centred_exp_fourth_moment':9,'weighted_fourth_moment_over_sqrt_pi':'193/32',
            'scope':'Counterexamples to stated odd pure-cost extensions/rounded constant only; not Conjecture K.'}
    print(json.dumps(result,indent=2,sort_keys=True))

if __name__=='__main__':main()
