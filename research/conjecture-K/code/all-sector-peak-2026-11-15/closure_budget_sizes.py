#!/usr/bin/env python3
"""Exact size comparisons for a failed sufficient recipe, codex-91d4.

No norm integral, Gaussian probability, or averaged premise is certified.
Only the rational comparisons from AVERAGED_CLOSURE_ATTEMPT.md are checked.
"""
import sys
if not __debug__ or sys.flags.optimize:
    raise SystemExit('Assertions required; reject -O/-OO')
from fractions import Fraction as F
from decimal import Decimal, localcontext
from pathlib import Path
import argparse
import json


def check():
    u=F(50431,1250000); x=y=F(1,200); W=x+y
    a=F(699,1250); p=F(2500,1891); eta=F(1,20000); k=F(891,500)
    strip=F(1241,50000000)**2
    assert 2*F(1241,50000000)==eta-F(9,25000000)
    assert u<F(463,10000) and u+W<F(80051,1000000)
    eps=F(1891,2500)
    assert u/2+W<eps**2*(F(314,400)-F(21,25)**2)
    m4=18*x*x+12*y*y+56*x*y
    assert m4==F(43,20000)
    b_ext=11*u*u/(k*k)
    assert b_ext<1 and b_ext<(u/2)/k
    mixed=u*(17*x+12*y)/(2*k)
    assert mixed<W
    min_floor_fourth=256*W**3/(27*a*a)
    assert W<3*a*a and a*a>W
    assert min_floor_fourth>F(74,1000)**4
    coarse_budget=p*(u+W)+F(1,250)+eta
    assert coarse_budget<F(71,1000)
    critical_cube=eta**4/(16*m4)
    assert critical_cube==F(1,5504000000000000)
    assert F(566,100000000)**3<critical_cube<F(567,100000000)**3
    with localcontext() as ctx:
        ctx.prec=45
        def dec(q): return Decimal(q.numerator)/Decimal(q.denominator)
        def fourthroot(q): return dec(q).sqrt().sqrt()
        return {
            'Agent-ID':'codex-91d4', 'issue':436,
            'status':'PASS RATIONAL SIZE COMPARISONS ONLY',
            'averaged_Psi_premise_proved':False,
            'counterexample_to_Psi_premise':False,
            'uniform_small_W_strip_exact':str(strip),
            'u':str(u), 'W':str(W), 'M4':str(m4),
            'optimized_floor_upper_estimate_fourth_power':str(min_floor_fourth),
            'optimized_floor_upper_estimate_decimal':str(fourthroot(min_floor_fourth)),
            'coarse_rigorous_target_budget_upper':str(coarse_budget),
            'coarse_budget_decimal':str(dec(coarse_budget)),
            'exterior_mass_upper_exact':str(b_ext),
            'exterior_odd_energy_upper_exact':str(mixed),
            'exterior_mixed_tail_upper_decimal':str(2*dec(b_ext*mixed).sqrt()),
            'exterior_fourth_moment_tail_upper_decimal':str(2*fourthroot(m4*b_ext**3)),
            'critical_smallball_mass_cube_exact':str(critical_cube),
        }


if __name__=='__main__':
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output',type=Path)
    args=parser.parse_args()
    body=json.dumps(check(),indent=2)+'\n'
    if args.output:
        args.output.write_text(body)
    print(body,end='')
