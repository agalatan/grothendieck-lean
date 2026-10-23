#!/usr/bin/env python3
"""Certify an explicit disk response for five moments of a fixed abstract law.

The response is constant in each radial/phase cell after factoring arg(Z).
An exactly defined bounded analytic correction repairs its five moments.
No continuous optimizer or quadrature-error assertion is trusted. Requires
python-flint/Arb 0.9.0; this is not Lean formalization.
"""
import argparse
from fractions import Fraction as Q
import json
from math import factorial
from pathlib import Path
import sys
import time

from flint import arb, ctx

sys.path.insert(0, str(Path(__file__).resolve().parent))
from verify_abstract_response_support import ball, upper_moments, read_sources


def repair_gram_control():
    """Independent rational integration and inversion of the repair Gram."""
    def integral(p):
        return sum((a*Q(factorial(k), 2**(k+1)) for k, a in enumerate(p)), Q(0))
    visible = [[integral([0, 1]), integral([0, -2, 1])],
               [integral([0, -2, 1]), integral([0, 4, -4, 1])]]
    remote = [[integral([1]), integral([-1, 1])],
              [integral([-1, 1]), integral([1, -2, 1])]]
    for gram, inv in [(visible, [[12, 8], [8, 8]]),
                      (remote, [[4, 4], [4, 8]])]:
        if any(sum(gram[i][k]*inv[k][j] for k in range(2)) != int(i == j)
               for i in range(2) for j in range(2)):
            raise ArithmeticError('Exact repair Gram inverse control failed')
    if integral([0, 0, Q(1, 2)])*8 != 1:
        raise ArithmeticError('Exact conjugate-sector repair Gram control failed')


def cell_response_moments(data):
    ctx.prec = data['precision_bits']
    nr, nt = data['radial_cells'], data['phase_cells']
    if nr <= 0 or nt <= 0 or nt % 2:
        raise ValueError('Positive radial count and even positive phase count required')
    stop, y = ball(data['sqrt_radial_stop']), list(map(ball, data['phase_coefficients']))
    if len(y) != 5 or not stop > 0:
        raise ValueError('Five phase coefficients and positive radial stop required')
    step = arb.pi()/nt
    sinc = step.sin()/step
    angular = [(((2*j+1)*step).cos()*sinc,
                ((2*j+1)*step).sin()*sinc) for j in range(nt//2)]
    tails = [upper_moments(stop*i/nr) for i in range(nr+1)]
    moments = [arb(0) for _ in range(5)]
    for atom in data['support']:
        v, w = ball(atom['v']), ball(atom['weight'])
        for i in range(nr):
            m = [tails[i][j]-tails[i+1][j] for j in range(5)]
            a = [m[1]/nt, (m[3]-2*m[1])/nt,
                 v*m[0]/nt, v*(m[2]-m[0])/nt, v*m[2]/(arb(2).sqrt()*nt)]
            for co, si in angular:
                re = [a[0], a[1], a[2]*co, a[3]*co, a[4]*co]
                im = [arb(0), arb(0), a[2]*si, a[3]*si, -a[4]*si]
                pr = sum((yy*x for yy, x in zip(y, re)), arb(0))
                pi = sum((yy*x for yy, x in zip(y, im)), arb(0))
                norm2 = pr*pr+pi*pi
                if not norm2 > 0:
                    raise ArithmeticError('Cell phase was not certified nonzero')
                norm = norm2.sqrt()
                # The reflected cell conjugates both phi and F. Their
                # imaginary moments cancel exactly; integrate both at once.
                for j in range(5):
                    moments[j] += 2*w*(pr*re[j]+pi*im[j])/norm
    return moments


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('certificate', type=Path)
    p.add_argument('--audit', type=Path, required=True)
    p.add_argument('--law', type=Path, required=True)
    args = p.parse_args()
    start = time.monotonic()
    repair_gram_control()
    data, target = read_sources(args)
    ctx.prec = data['precision_bits']
    eu = sum((Q(a['weight'])*Q(a['v'])**2 for a in data['support']), Q(0))
    if eu != 1:
        raise ValueError('The explicit correction Gram requires E|q|²=1')
    t, tau, eps, beta = [Q(target[a]) for a in ['t', 'tau', 'epsilon', 'beta']]
    alpha = list(map(Q, target['gate_alpha']))
    c = list(map(ball, [t, -2*beta/eps, tau, alpha[0]*tau, alpha[1]*tau]))
    moments = cell_response_moments(data)
    amplitude_denominator = ball(data['amplitude_denominator'])
    if not amplitude_denominator > 1:
        raise ValueError('The step response needs a strict disk margin')
    delta = [target-m/amplitude_denominator for target, m in zip(c, moments)]
    # Inverse of E[e^(-R) bar(phi_i) phi_j]. Omitted cross terms
    # vanish by the two independent circular phases and E|q|²=1.
    coefficients = [12*delta[0]+8*delta[1], 8*delta[0]+8*delta[1],
                    4*delta[2]+4*delta[3], 4*delta[2]+8*delta[3], 8*delta[4]]
    vmax = ball(max(Q(a['v']) for a in data['support']))
    # Uniform feature bounds proved in the accompanying experiment note.
    repair = abs(coefficients[0])+2*abs(coefficients[1])+vmax*sum(
        (abs(a) for a in coefficients[2:]), arb(0))
    norm_upper = 1/amplitude_denominator+repair
    cap = ball(data['response_norm_upper_rational'])
    if not norm_upper < cap < 1:
        raise ValueError('The corrected response was not certified disk valued')
    print(json.dumps({'status': 'PASS', 'index': data['index'],
                     'step_moments': list(map(str, moments)),
                     'target_residuals': list(map(str, delta)),
                     'repair_coefficients': list(map(str, coefficients)),
                     'repair_norm_upper_enclosure': str(repair),
                     'response_norm_upper_enclosure': str(norm_upper),
                     'response_norm_upper_rational': data['response_norm_upper_rational'],
                     'exact_target_moments_after_repair': True,
                     'cell_count': len(data['support'])*data['radial_cells']*data['phase_cells'],
                     'seconds': time.monotonic()-start,
                     'scope': 'An actual disk-valued response pair under this abstract radial law, not a Gaussian-cubic realization, fibre maximizer, or endpoint.'}, indent=2))


if __name__ == '__main__':
    main()
