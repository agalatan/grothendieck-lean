#!/usr/bin/env python3
"""Exact scalar witness for the two Q/nu coupling channels.

Agent-ID: codex-a7c4. Refs #415. Run with python3 -I.
Standard library only; read-only unless --write-result is explicit.
The accompanying JOINT.md supplies the Gaussian integral and remainder proof.
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
spec = importlib.util.spec_from_file_location('odd_coupling_intervals', source)
old = importlib.util.module_from_spec(spec)
spec.loader.exec_module(old)
I = old.Interval


def verify():
    a, b, c = F(699,1250), F(179,1250), F(1,1000)
    j0, j1, _, _ = old.radial_integrals(a,b)
    # K_j^m = integral t^(j-1/2)e^-t/(a+bt)^m dt.
    # Integration by parts of sqrt(t)e^-t/(a+bt)^m gives these recurrences.
    k02 = (j1+j0/2)/a
    k12 = (j0-a*k02)/b
    k03 = (F(3,2)*k02+k12)/(2*a)
    k13 = (k02-a*k03)/b
    moment = k13-2*k03
    sqrt2 = I(2).sqrt()
    slope_real = moment/sqrt2
    slope_imag = -moment/(2*sqrt2)
    ef3 = sum(comb(3,k)*(-1)**(3-k)*factorial(k) for k in range(4))
    ef4 = sum(comb(4,k)*(-1)**(4-k)*factorial(k) for k in range(5))
    assert ef3 == 2 and ef4 == 9
    # Uniform integrated O(v^(3/2)) bounds, then E|f|^4=9.
    error_real = F(171,2)*sqrt2*c**3/a**4
    error_imag = F(81,4)*sqrt2*c**3/a**4
    coupling_real = slope_real*c*c + I(-error_real.hi,error_real.hi)
    coupling_imag = slope_imag*c*c + I(-error_imag.hi,error_imag.hi)
    assert slope_real.hi < -9 and slope_imag.lo > F(9,2)
    assert coupling_real.hi < F(-8,10**6)
    assert coupling_imag.lo > F(4,10**6)
    difference = coupling_imag-coupling_real
    assert difference.lo > F(12,10**6)
    return {
        'agent_id':'codex-a7c4','task':415,'status':'PASS',
        'profile':{'a':str(a),'b':str(b)},'remote_amplitude':str(c),
        'remote_energy':str(c*c),
        'family':'q=c X f(Y), f(Y)=|Y|^2-1; X,Y independent remote standard complex Gaussians',
        'normalization':'Q direction ZQ; nu direction nu Z(T-2)/sqrt(2). Mixed second derivative is twice the reported coupling.',
        'integral_M':moment.enclosure(),
        'small_c_slopes':{'real_pair':slope_real.enclosure(),'imaginary_pair':slope_imag.enclosure()},
        'centered_exponential_moments':{'third':ef3,'fourth':ef4},
        'explicit_remainder_bounds':{'real_pair':error_real.enclosure(),'imaginary_pair':error_imag.enclosure()},
        'finite_coupling_enclosures':{'Q=f_nu=1':coupling_real.enclosure(),
                                     'Q=i_f_nu=i':coupling_imag.enclosure()},
        'imaginary_minus_real':difference.enclosure(),
        'accepted_bounds':{'real_pair_upper':'-1/125000','imaginary_pair_lower':'1/250000'},
        'interval_helper_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),
        'scope':'Refutes a single Hermitian scalar-kernel representation of this mixed Hessian; not K, pure odd cost, or a finite-amplitude joint inequality.'
    }


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--write-result',action='store_true')
    args=parser.parse_args()
    output=json.dumps(verify(),indent=2,sort_keys=True)+'\n'
    if args.write_result:
        Path(__file__).with_name('odd_coupling_result.json').write_text(output)
    print(output,end='')


if __name__=='__main__':
    main()
