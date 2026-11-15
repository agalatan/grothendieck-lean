#!/usr/bin/env python3
"""Exact scalar checks for JOINT_CONTENT.md. Agent-ID: codex-a7c4; Refs #421.

Standard library, python3 -I. No numerical quadrature or saved result is used.
This checks endpoints and algebra, not the analytic Abel comparison. The old
global .007 kernel certificate and completed tilted-A theorem are inherited;
their separate replay commands are recorded in JOINT_CONTENT.md.
"""
import argparse
from fractions import Fraction as Q
import json
from pathlib import Path
import runpy

if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not use -O.')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--output', type=Path)
args = parser.parse_args()

old = Path(__file__).resolve().parent.parent / 'audit-2026-11-15-codex-a7c4' / 'odd_cost_check.py'
lib = runpy.run_path(str(old))
I, radial = lib['Interval'], lib['radial_integrals']
a, b = Q(699, 1250), Q(179, 1250)
J = radial(a, b)
A0, B0 = (J[0]-J[1])/2, J[1]/(2*I(2).sqrt())
rho, width = Q(5053, 10000), Q(7, 1000)
ratio = B0/A0
assert A0.lo > 0 and B0.lo > 0 and ratio.lo > rho
assert A0.hi < Q(41757, 50000)
centered = width/2
u = Q(463, 10000)
e2 = centered**2*u

# The completed tilted-A estimate plus ||e|| <= .0035 sqrt(u).
gamma_A, eta_A, gamma_B = Q(3,10), Q(3,500000), Q(1,10)
assert gamma_B > rho*rho*gamma_A
eta_B = gamma_B*eta_A/gamma_A + e2*gamma_B/(gamma_B-rho*rho*gamma_A)
assert eta_B < Q(443, 10**8)

# Signed favorable cost: cancel C_A^2/.24-D, then directly center the
# entire residual kernel k_B-(m/k_A)k_A instead of bounding C_A again.
ka, kb, m = Q(6,25), Q(13,50), Q(59,500)
schur = kb-m*m/ka
assert schur > 0 and rho > m/ka
residual_width = width+(rho-m/ka)*Q(41757,50000)
signed_excess = residual_width**2*u/(4*schur)
assert signed_excess < Q(19372,10**9)

alternatives = {}
for name, mixed, gamma, simple in [
    ('diagonal', Q(0), Q(3,20), Q(3593,10**9)),
    ('adverse', -m, Q(1,10), Q(17953,10**9)),
]:
    det = ka*kb-mixed*mixed
    assert det > 0
    coeff_A = (kb-2*mixed*rho+ka*rho*rho)/det
    coeff_B = (ka*rho-mixed)/det
    coeff_C = ka/det
    gap = 1/gamma-coeff_A
    assert gap > 0
    excess = e2*(coeff_C+coeff_B*coeff_B/gap)
    assert excess < simple
    alternatives[name] = {
        'content_gamma': str(gamma), 'mixed_cost_entry': str(mixed),
        'excess_bound': str(excess), 'simple_upper': str(simple),
    }

result = {
    'agent_id': 'codex-a7c4',
    'status': 'PASS; exact Fraction arithmetic and outward 220-bit intervals',
    'peak_kernel_endpoint_A': A0.enclosure(18),
    'peak_kernel_endpoint_B': B0.enclosure(18),
    'sharp_global_ratio_lower': ratio.enclosure(18),
    'rho': str(rho),
    'new_centered_alignment_constant': str(centered),
    'energy_cap': str(u),
    'tilted_B_content': {
        'tilt': str(Q(3,5)*rho), 'gamma': str(gamma_B),
        'eta_bound': str(eta_B), 'simple_eta_upper': str(Q(443,10**8)),
        'deficit': 'D_plus; every finite-dimensional cubic at the peak',
    },
    'conditional_signed_joint_budget': {
        'content_gamma': str(ka), 'residual_kernel_width': str(residual_width),
        'schur_complement': str(schur), 'excess_bound': str(signed_excess),
        'simple_upper': str(Q(19372,10**9)),
    },
    'conditional_other_joint_budgets': alternatives,
    'inherited_inputs_not_replayed_by_this_script': [
        'global peak kernel difference <.007 (third-audit kernel_alignment.py)',
        'tilted-A content <=.3 D_plus+6e-6 (sixth tilted-sector delivery)',
    ],
    'open_inputs_for_joint_gain': [
        'the corresponding finite-amplitude joint cost matrix',
        'raw A-content premise in each conditional raw joint budget',
        'odd sectors over a nonzero even core',
    ],
}
output = json.dumps(result, indent=2, sort_keys=True)+'\n'
if args.output:
    args.output.write_text(output)
print(output, end='')
