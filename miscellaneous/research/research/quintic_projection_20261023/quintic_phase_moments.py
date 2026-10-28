#!/usr/bin/env python3
"""Seven one-dimensional moments of actual normalized-G phase responses.

Z,G are independent standard proper complex Gaussians, R=|Z|^2,
H=Z(R-2)/sqrt(2), f=phase(Z+cH+bG), g=phase(Z+cH-bG).
The displayed fifth features are H32(Z), (R-1)G, Z^2*conj(G)/sqrt(2).
They are orthonormal in this marginal Gaussian model. Replacing G by the
genuine cubic q_m gives three orthonormal original H_(3,2) polynomials;
their coefficients equal v,sqrt(m/(m+1))*A,sqrt(m/(m+1))*B exactly.
No claim is made that these exhaust the original invariant fifth sector.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import time

NAMES = ['m0', 'm1', 'mq', 'v_H32', 'A_radial_G', 'B_Z2_barG', 'n_Z_radialG']


def scipy_moments(c, b):
    import numpy as np
    from scipy.integrate import quad_vec
    from scipy.special import i0e, i1e
    c, b = float(Q(c)), float(Q(b))
    if b <= 0:
        raise ValueError('Positive b required')
    def fn(r):
        t = np.sqrt(r)*(1+c*(r-2)/np.sqrt(2))/b
        x, k = t*t/2, np.sqrt(np.pi)/2
        I0, I1 = i0e(x), i1e(x)
        psi, zeta = k*t*(I0+I1), k*I0
        chi, kappa = -k*I1, -k*t*(I0-I1)/2
        return np.exp(-r)*np.array([
            np.sqrt(r)*psi, np.sqrt(r)*(r-2)/np.sqrt(2)*psi, zeta,
            np.sqrt(r)*(r*r-6*r+6)/(2*np.sqrt(3))*psi,
            (r-1)*zeta, r/np.sqrt(2)*chi, np.sqrt(r)*kappa])
    return quad_vec(fn, 0, np.inf, epsabs=2e-13, epsrel=2e-13)


def arb_moments(c, b, precision=128, all_moments=False):
    from flint import acb, arb, ctx
    c, b = Q(c), Q(b)
    if b <= 0 or precision < 96:
        raise ValueError('Positive b and precision>=96 required')
    ctx.prec = precision
    ball = lambda q: arb(Q(q).numerator)/Q(q).denominator
    cc, bb = ball(c), ball(b)
    root2, root3, rootpi = arb(2).sqrt(), arb(3).sqrt(), arb.pi().sqrt()
    def integrand(r, which):
        R = r*r
        t = r*(1+cc*(R-2)/root2)/bb
        x, k = t*t/2, rootpi/2
        I0, I1 = x.bessel_i(0, scaled=True), x.bessel_i(1, scaled=True)
        psi, zeta = k*t*(I0+I1), k*I0
        chi, kappa = -k*I1, -k*t*(I0-I1)/2
        features = [r*psi, r*(R-2)/root2*psi, zeta,
                    r*(R*R-6*R+6)/(2*root3)*psi,
                    (R-1)*zeta, R/root2*chi, r*kappa]
        return 2*r*(-R).exp()*features[which]
    e, r = arb(-64).exp(), arb(8)
    Ghalf = rootpi*r.erfc()
    G3 = Ghalf/2+r*e
    G5 = 3*G3/2+r**3*e
    G7 = 5*G5/2+r**5*e
    tails = [G3, (G5+2*G3)/root2, rootpi*e/2,
             (G7+6*G5+6*G3)/(2*root3), rootpi*66*e/2,
             rootpi*65*e/(2*root2), G3]
    values = [None]*len(NAMES)
    for j in range(len(NAMES)) if all_moments else [3, 4, 5]:
        tail = tails[j]
        if not 0 < tail < ball('1e-20'):
            raise ArithmeticError('The Gaussian tail bound failed')
        value = acb.integral(lambda z, analytic: integrand(z, j), 0, 8,
                             abs_tol=ball('1e-20'), rel_tol=ball('1e-20'),
                             eval_limit=1000000, depth_limit=40)
        if not value.is_finite() or not value.imag.contains(0):
            raise ArithmeticError('The real analytic integral was not certified')
        values[j] = value.real+(-tail).union(tail)
    return values, tails


def bounds(value, denominator=10**16):
    lo, hi = Q(str(value.lower().fmpq())), Q(str(value.upper().fmpq()))
    return [Q((lo.numerator*denominator)//lo.denominator, denominator),
            Q(-((-hi.numerator*denominator)//hi.denominator), denominator)]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('input', type=Path)
    parser.add_argument('--backend', choices=['scipy', 'arb'], default='scipy')
    parser.add_argument('--all-moments', action='store_true',
                        help='Also integrate the linear, cubic and neutral moments.')
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    data = json.loads(args.input.read_text())
    m = int(data.get('finite_m', '1000000000000'))
    if m < 1:
        raise ValueError('Positive finite dimension parameter required')
    d = m*(m+1)//2
    lower_error = Q(m, (m+1)*(m+2))+Q(12*m, (m+1)*(m+2)*(m+3))
    upper_error = (Q(1, m+1)+Q(4*(m-1), (m+1)*(m+2))+Q(1, d)
                   +Q(24, m*(m+1)*(m+2)*(m+3)))
    started, profiles = time.monotonic(), []
    for profile in data['profiles']:
        c, b = str(Q(profile['c'])), str(Q(profile['b']))
        if args.backend == 'arb':
            values, tails = arb_moments(c, b, data.get('precision_bits', 128), args.all_moments)
            from flint import arb
            gamma = arb(m)/(m+1)
            partial = values[3]**2-values[4]**2-values[5]**2
            finite = values[3]**2-gamma*(values[4]**2+values[5]**2)
            ball = lambda q: arb(q.numerator)/q.denominator
            full_lower, full_upper = partial-ball(lower_error), partial+ball(upper_error)
            full = [bounds(full_lower)[0], bounds(full_upper)[1]]
            if 'full_fifth_requested_bounds' in profile:
                wanted_lo, wanted_hi = map(Q, profile['full_fifth_requested_bounds'])
                if not full_lower > ball(wanted_lo) or not full_upper < ball(wanted_hi):
                    raise ArithmeticError('The advertised full fifth interval failed')
            indices = [j for j in range(len(NAMES)) if values[j] is not None]
            row = {'c': c, 'b': b, 'moments': {NAMES[j]: str(values[j]) for j in indices},
                   'moment_rational_bounds': {NAMES[j]: list(map(str, bounds(values[j]))) for j in indices},
                   'full_gaussian_tail_upper': {NAMES[j]: str(tails[j]) for j in indices},
                   'selected_fifth_limit_bounds': list(map(str, bounds(partial))),
                   'selected_fifth_finite_bounds': list(map(str, bounds(finite))),
                   'full_fifth_finite_bounds': list(map(str, full)),
                   'full_fifth_requested_bounds': profile.get('full_fifth_requested_bounds'),
                   'full_fifth_interval_verified': 'full_fifth_requested_bounds' in profile}
        else:
            values, error = scipy_moments(c, b)
            partial = values[3]**2-values[4]**2-values[5]**2
            row = {'c': c, 'b': b, 'moments': dict(zip(NAMES, values.tolist())),
                   'quad_error_estimate': float(error),
                   'selected_fifth_limit': float(partial),
                   'selected_fifth_finite': float(values[3]**2-m/(m+1)*(values[4]**2+values[5]**2)),
                   'full_fifth_finite_interval_estimate': [float(partial-lower_error), float(partial+upper_error)]}
        profiles.append(row)
    result = {'status': 'PASS' if args.backend == 'arb' else 'NUMERICAL',
              'backend': args.backend, 'profiles': profiles, 'finite_m': str(m),
              'full_fifth_lower_error': str(lower_error),
              'full_fifth_upper_error': str(upper_error),
              'full_fifth_analytic_input': 'Exact normalized-G fifth-sector Mehler identity and normalized companion bounds are separate paper proofs. This script certifies their resulting integral/error envelope, not that analytic identity or a new Lean Gaussian theorem.',
              'scope': __doc__, 'seconds': time.monotonic()-started,
              'input_sha256': hashlib.sha256(args.input.read_bytes()).hexdigest(),
              'verifier_sha256': hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}
    text = json.dumps(result, indent=2)+'\n'
    if args.out:
        args.out.write_text(text)
    print(text, end='')


if __name__ == '__main__':
    main()
