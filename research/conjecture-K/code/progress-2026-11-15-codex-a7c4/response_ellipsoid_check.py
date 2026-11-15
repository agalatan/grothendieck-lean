#!/usr/bin/env python3
"""Exact scalar consequences of the stronger common-response ellipsoid.

Agent-ID: codex-a7c4. Refs #421.
Analytic hypotheses and proof: RESPONSE_ELLIPSOID.md.
The Rice majorant constants A,B are inherited certified inputs from
reaudit-2026-11-15-codex-a7c4/FOUNDATIONS.md, not freshly proved here.
Default execution is read-only; --output saves the exact transcript.
"""
from fractions import Fraction as F
from math import isqrt
from pathlib import Path
import argparse
import json

if not __debug__:
    raise SystemExit('Refusing optimized Python: exact acceptance uses assertions.')


def atan_enclosure(x, n):
    assert 0 < x < 1 and n > 0
    s = sum(((-1)**k*x**(2*k+1)/F(2*k+1) for k in range(n)), F(0))
    e = x**(2*n+1)/F(2*n+1)
    return (s, s+e) if n % 2 == 0 else (s-e, s)


def run():
    # Machin: pi=16 atan(1/5)-4 atan(1/239). Alternating tails directed.
    a0, a1 = atan_enclosure(F(1, 5), 80)
    b0, b1 = atan_enclosure(F(1, 239), 30)
    pi0 = 16*a0-4*b1
    pi1 = 16*a1-4*b0
    scale = 10**35
    v0, v1 = pi0*scale**2, pi1*scale**2
    s0 = isqrt(v0.numerator // v0.denominator)
    s1 = isqrt(v1.numerator // v1.denominator)+1
    R0, R1 = F(s0, 2*scale), F(s1, 2*scale)
    assert 4*R0**2 <= pi0 <= pi1 <= 4*R1**2
    # g[j]=Gamma(j+1/2)/R, R=Gamma(3/2)=sqrt(pi)/2.
    g = [F(2)]
    for j in range(3):
        g.append((F(j)+F(1, 2))*g[-1])
    weights = [g[0], g[2]-2*g[1]+g[0], g[2]/2,
               g[1], g[1], (g[3]-4*g[2]+4*g[1])/2]
    assert weights == [F(2), F(3, 2), F(3, 4), F(1), F(1), F(7, 8)]
    inverse_weights = [1/c for c in weights]
    assert min(inverse_weights[1:]) == F(2, 3)
    # Existing Rice support majorant, explicitly an inherited prerequisite.
    A, B = F(886762780, 10**9), F(432306903, 10**9)
    eps = F(1891, 2500)
    rows = []
    for t in [F(21, 25), F(1057, 1250), F(851, 1000), F(427, 500)]:
        assert 0 <= t < R0 and t < A
        remote = 4*eps**2*B*(A-t)
        total = F(3, 2)*eps**2*(pi1/4-t*t)+remote/4
        old = 3*eps**2*R1*(R1-t)+remote/4
        improvement = F(3, 2)*eps**2*(R0-t)**2
        # The identity is exact for any rational stand-in for R.
        assert 3*R1*(R1-t)-F(3, 2)*(R1**2-t*t) == F(3, 2)*(R1-t)**2
        bound = F((total*10**6).__ceil__(), 10**6)
        assert total < bound
        rows.append({'t': str(t), 'remote_cap_exact': str(remote),
                     'new_total_cap_rational': str(bound),
                     'new_total_upper_exact': str(total),
                     'old_total_upper_exact': str(old),
                     'guaranteed_improvement_lower_exact': str(improvement),
                     'new_total_upper_decimal_for_display': float(total),
                     'old_total_upper_decimal_for_display': float(old),
                     'improvement_lower_decimal_for_display': float(improvement),
                     'accepted': True})
    return {'agent_id': 'codex-a7c4', 'status': 'Exact rational consequences; analytic theorem is a separate proof',
            'epsilon': str(eps), 'pi_enclosure_exact': [str(pi0), str(pi1)],
            'R_enclosure_exact': [str(R0), str(R1)],
            'gamma_half_moments_divided_by_R': [str(x) for x in g],
            'sector_weights': [str(x) for x in weights],
            'reciprocal_weights': [str(x) for x in inverse_weights],
            'inherited_prerequisites': {
                'Rice_tangent': {'A': str(A), 'B': str(B),
                                 'source': 'research/conjecture-K/sources/reaudit-2026-11-15-codex-a7c4/FOUNDATIONS.md section 2',
                                 'status': 'Existing certified rho(u)<=A+B*u input; not re-certified by this checker'},
                'response_support_and_chaos_orthogonality': 'Analytic proof in RESPONSE_ELLIPSOID.md'},
            'rows': rows}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--output', type=Path, help='Optional exact JSON transcript; default is read-only.')
    args = parser.parse_args()
    result = run()
    if args.output:
        args.output.write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps({'accepted': True, 'sector_weights': result['sector_weights'],
                      'rows': [{'t': r['t'], 'strict_cap': r['new_total_cap_rational'],
                                'improvement_lower': r['improvement_lower_decimal_for_display']}
                               for r in result['rows']]}, indent=2))


if __name__ == '__main__':
    main()
