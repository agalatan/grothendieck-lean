#!/usr/bin/env python3
"""Exact scalar part of REFORMULATIONS.md. Agent-ID: codex-a7c4. Refs #406.

Standard library, python3 -I, read-only. The paper proof supplies the
density and Jensen inequalities; this checks their strict rational margin.
"""
import json
from fractions import Fraction as Q

if not __debug__:
    raise SystemExit('Assertions required; do not use -O.')

first_summand_variance = Q(1, 9)
uniform_variance = Q(1, 3)
variance = first_summand_variance + uniform_variance
radius = Q(1, 10)
density_upper = Q(1, 2)
absolute_mean_lower = Q(1, 2)
integrand_lower = (absolute_mean_lower / 2
                   - density_upper * radius**2 / 2
                   - variance * density_upper)
interval_gap_lower = 2 * radius * integrand_lower
assert variance == Q(4, 9)
assert integrand_lower == Q(91, 3600)
assert interval_gap_lower == Q(91, 18000) > 0
print(json.dumps({
    'agent_id': 'codex-a7c4', 'status': 'PASS',
    'first_summand_variance': str(first_summand_variance),
    'uniform_variance': str(uniform_variance),
    'sum_variance': str(variance),
    'interval_radius': str(radius),
    'integrand_lower': str(integrand_lower),
    'SEI_violation_lower': str(interval_gap_lower),
    'scope': 'SEI third-chaos product plus independent uniform; sum is not cubic chaos'
}, indent=2, sort_keys=True))
