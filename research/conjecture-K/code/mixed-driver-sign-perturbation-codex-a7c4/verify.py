"""[codex-a7c4] Exact perturbation budgets for the three Conjecture K profiles."""
from fractions import Fraction as Q
import json
from math import ceil, factorial, isqrt
from pathlib import Path

BASE = Path(__file__).resolve().parent
INPUT = BASE.parent / 'third-audit-2026-11-15-codex-a7c4/content_kernels_exact_result.json'
PROFILES = {'peak': (Q(699, 1250), Q(179, 1250)),
            'flank': (Q(14, 25), Q(1467, 10000)),
            'upper': (Q(573, 1000), Q(19, 125))}
ENERGY = Q(463, 10000)
COST = Q(6, 25)
CORE_CAPS = [Q(47, 200), Q(9, 40), Q(11, 50)]


def require(ok, description):
    if not ok:
        raise ValueError(description)


def sqrt_floor(x, scale):
    return Q(isqrt((scale**2 * x).__floor__()), scale)


def budgets():
    saved = json.loads(INPUT.read_text())['derivative_bounds']
    atom_upper = Q(447, 1000)
    partial_exp = sum(Q(3, 2)**j/factorial(j) for j in range(8))
    require(partial_exp*atom_upper > 2, 'outward bound on 2 exp(-3/2)')
    results = {}
    for row, (a, b) in PROFILES.items():
        m0 = Q(saved[row]['M_j_A'][0][1])
        centered_lipschitz = (1+atom_upper)*m0/2
        content_upper = m0*(sqrt_floor(ENERGY, 10**7) + Q(1, 10**7))/2
        # The audited peak bound d applies by monotonicity in a and b.
        require(a >= PROFILES['peak'][0] and b >= PROFILES['peak'][1], 'profile ordering')
        d = Q(1432, 1000)
        # Archimedes' lower bound 223/71 < pi.
        beta = sqrt_floor(Q(223, 71)/(4*(a*a+4*a*b+6*b*b+ENERGY)), 10**6)
        weight_hessian = Q(5, 4)/a**2
        budget = centered_lipschitz**2 + weight_hessian*content_upper + COST*(d-beta)
        denominators = [ceil(budget/(COST-cap)) for cap in CORE_CAPS]
        for cap, n in zip(CORE_CAPS, denominators):
            require((n-1)*(COST-cap) < budget <= n*(COST-cap), 'integer budget boundary')
        results[row] = {'a': str(a), 'b': str(b), 'M0_upper': str(m0),
                        'beta_lower': str(beta), 'energy_coefficient_upper': str(budget),
                        'energy_denominators': denominators}
    return results


def mixed_example():
    core_energy = Q(3, 100)
    variance_cap = (1+Q(1, 2)**4)/100
    # Lower bound on the mass of [-1/2,1/2] for a real standard Gaussian.
    require((1-Q(1, 8))**2 > 2*Q(22, 7)/9, 'box probability')
    deficit_floor = (core_energy-variance_cap)**2/18
    energy = Q(2, 5000**2)
    require(core_energy-variance_cap == Q(31, 1600), 'variance gap')
    require(core_energy+energy <= ENERGY and 167*energy < deficit_floor, 'mixed example')
    return {'core_energy': str(core_energy), 'perturbation_energy': str(energy),
            'core_deficit_lower': str(deficit_floor)}


def main():
    computed = budgets()
    saved = json.loads((BASE/'result.json').read_text())
    require(saved['core_caps'] == list(map(str, CORE_CAPS)), 'core ordering')
    require(saved['rows'] == computed, 'saved budget replay')
    require(saved['example'] == mixed_example(), 'saved mixed example')
    for row, result in computed.items():
        print(row, *result['energy_denominators'])


if __name__ == '__main__':
    main()
