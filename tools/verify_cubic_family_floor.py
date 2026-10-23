#!/usr/bin/env python3
"""Arb lower floor for the scalar witness family P10-epsilon*P21.

The input supplies rational phase profiles (c,b), a finite Gaussian parameter
m, and probability weights or exact cancellation of two slopes. The program
certifies the numerical integrals and exact finite correction. Invariant
projection closure and the normalized-G coefficient identity remain the
separate analytic inputs described in the accompanying audit note.

No optimizer, global maximum, or Grothendieck endpoint is asserted.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import time

from flint import acb, arb, ctx


def ball(q):
    q = Q(q)
    return arb(q.numerator)/q.denominator


def rational_bounds(value, denominator=10**16):
    """Exact outward rational rounding of Arb endpoints, without float()."""
    lo, hi = Q(str(value.lower().fmpq())), Q(str(value.upper().fmpq()))
    return (Q((lo.numerator*denominator)//lo.denominator, denominator),
            Q(-((-hi.numerator*denominator)//hi.denominator), denominator))


def coefficients(c, b, precision=128):
    c, b = Q(c), Q(b)
    if b <= 0:
        raise ValueError('A positive rational remote coefficient b is required')
    if precision < 96:
        raise ValueError('At least 96 bits of working precision are required')
    ctx.prec = precision
    cc, bb = ball(c), ball(b)
    rootpi, root2 = arb.pi().sqrt(), arb(2).sqrt()

    def integrand(r, which):
        rr = r*r
        # Signed signal is essential if 1+c*(r^2-2)/sqrt(2) changes sign.
        # psi is odd; zeta is even. These entire expressions thus also
        # handle negative or large positive rational c without abs().
        signal = r*(1+cc*(rr-2)/root2)/bb
        x = signal*signal/2
        i0 = x.bessel_i(0, scaled=True)
        if which == 2:
            return rootpi*r*(-rr).exp()*i0
        psi = rootpi*signal*(i0+x.bessel_i(1, scaled=True))/2
        value = 2*rr*(-rr).exp()*psi
        return value if which == 0 else value*(rr-2)/root2

    result = []
    for which in range(3):
        value = acb.integral(lambda r, analytic: integrand(r, which), 0, 8,
                             rel_tol=ball('1e-20'), abs_tol=ball('1e-20'),
                             eval_limit=1000000, depth_limit=40)
        if not value.is_finite() or not value.imag.contains(0):
            raise ArithmeticError('The analytic integral was not certified')
        result.append(value.real)
    e, r = arb(-64).exp(), arb(8)
    gh = rootpi*r.erfc()
    g3h = gh/2+r*e
    g5h = 3*g3h/2+r**3*e
    tails = [g3h, (g5h+2*g3h)/root2, rootpi*e/2]
    for j, tail in enumerate(tails):
        if not 0 < tail < ball('1e-24'):
            raise ArithmeticError('Explicit full Gaussian tail bound failed')
        result[j] += (-tail).union(tail)
    return result, tails


def verify(data):
    started = time.monotonic()
    m = int(data['m'])
    if str(m) != str(data['m']) or m < 1:
        raise ValueError('A positive integer Gaussian parameter m is required')
    d = m*(m+1)//2
    exact_zero = data.get('exact_zero_slope', False)
    if exact_zero:
        if len(data['profiles']) != 2 or 'weights' in data:
            raise ValueError('Exact cancellation requires two profiles and defines its own weights')
        weights = [Q(0), Q(0)]
    else:
        weights = list(map(Q, data['weights']))
        if len(weights) != len(data['profiles']) or any(w < 0 for w in weights) or sum(weights) != 1:
            raise ValueError('The profile weights must form a probability vector')
    profiles = []
    p_lo, p_hi, s_lo, s_hi = Q(0), Q(0), Q(0), Q(0)
    for weight, profile in zip(weights, data['profiles']):
        values, tails = coefficients(profile['c'], profile['b'], data.get('precision_bits', 128))
        m0, m1, mq = values
        p = rational_bounds(m0*m0)
        s = rational_bounds(m1*m1-mq*mq)
        q = rational_bounds(mq*mq)
        # The normalized-G bridge is exact, with |n|^2<=1:
        # s_finite=s_limit+mq^2/(m+1)+|n|^2/d.
        finite = (s[0], s[1]+q[1]/(m+1)+Q(1, d))
        p_lo += weight*p[0]
        p_hi += weight*p[1]
        s_lo += weight*finite[0]
        s_hi += weight*finite[1]
        profiles.append({'c': str(Q(profile['c'])), 'b': str(Q(profile['b'])),
                         'weight': str(weight),
                         'coefficients_m0_m1_mq': list(map(str, values)),
                         'full_tail_upper_enclosures': list(map(str, tails)),
                         'p_bounds': list(map(str, p)), 's_limit_bounds': list(map(str, s)),
                         'mq_squared_bounds': list(map(str, q)),
                         's_finite_bounds': list(map(str, finite))})
    weight_bounds = None
    if exact_zero:
        first, second = profiles
        s1l, s1u = map(Q, first['s_finite_bounds'])
        s2l, s2u = map(Q, second['s_finite_bounds'])
        if not s1l > 0 > s2u:
            raise ArithmeticError('The exact finite slopes did not have strict opposite signs')
        # w=-s2/(s1-s2) decreases in both s1 and s2 on this domain.
        wl = -s2u/(s1u-s2u)
        wu = -s2l/(s1l-s2l)
        if not 0 < wl <= wu < 1:
            raise ArithmeticError('The exact zero-slope mixing weight was not localized')
        p1l, p1u = map(Q, first['p_bounds'])
        p2l, p2u = map(Q, second['p_bounds'])
        p_lo = min(w*p1l+(1-w)*p2l for w in [wl, wu])
        p_hi = max(w*p1u+(1-w)*p2u for w in [wl, wu])
        s_lo = s_hi = Q(0)
        weight_bounds = [[str(wl), str(wu)], [str(1-wu), str(1-wl)]]
        for profile, interval in zip(profiles, weight_bounds):
            profile['weight'] = None
            profile['exact_weight_bounds'] = interval
    # For 0<=epsilon<=1 one may use both endpoints of the affine pairing.
    unit_floor = p_lo-max(s_hi, Q(0))
    signed_unit_floor = p_lo-max(s_hi, -s_lo, Q(0))
    nonnegative_floor = p_lo if s_hi <= 0 else None
    # For epsilon<=0 the independent response f=g=phase(Z) gives
    # J=pi/4-epsilon*pi/32>=pi/4. Its proof uses H=Z(R-2)/sqrt(2).
    pi4 = rational_bounds(arb.pi()/4)
    all_real_floor = min(nonnegative_floor, pi4[0]) if nonnegative_floor is not None else None
    requested = Q(data['uniform_floor']) if 'uniform_floor' in data else None
    domain = data.get('epsilon_domain', ['0', '1'])
    if domain == 'complex':
        if not exact_zero:
            raise ValueError('A complex epsilon domain requires exact slope cancellation')
        floor = p_lo
    elif domain == ['0', '1']:
        floor = unit_floor
    elif domain == ['-1', '1']:
        floor = max(signed_unit_floor, min(unit_floor, pi4[0]))
    elif domain == ['0', None]:
        floor = nonnegative_floor
    elif domain == [None, None]:
        floor = all_real_floor
    elif isinstance(domain, list) and len(domain) == 2 and None not in domain:
        left, right = map(Q, domain)
        if left > right:
            raise ValueError('Reversed epsilon interval')
        floor = min(p_lo-e*(s_hi if e >= 0 else s_lo) for e in [left, right])
    else:
        raise ValueError('Unsupported epsilon domain')
    if floor is None or floor <= 0 or (requested is not None and floor < requested):
        raise ArithmeticError('The requested uniform witness-norm floor was not certified')
    # A separate actual pair phase(G), -phase(G) has only the q_m cubic
    # coefficient. This controls |epsilon|>1 under spectral normalization.
    cubic_control = rational_bounds(arb.pi()*m/(4*(m+1)))
    spectral_extension = exact_zero and cubic_control[0] >= floor
    ratio_ceiling = Q(data['ratio_ceiling']) if 'ratio_ceiling' in data else None
    if ratio_ceiling is not None and not 1/floor < ratio_ceiling:
        raise ArithmeticError('The requested strict reciprocal ceiling failed')
    return {'status': 'PASS', 'm': str(m), 'symmetric_square_dimension': str(d),
            'full_complex_gaussian_dimension': str(1+m+d), 'profiles': profiles,
            'mixed_p_bounds': list(map(str, [p_lo, p_hi])),
            'mixed_s_finite_bounds': list(map(str, [s_lo, s_hi])),
            'exact_zero_slope': exact_zero,
            'exact_weight_definition': '-s2_finite/(s1_finite-s2_finite)' if exact_zero else None,
            'exact_weight_bounds': weight_bounds,
            'epsilon_domain': domain, 'certified_uniform_norm_floor': str(floor),
            'advertised_uniform_floor': None if requested is None else str(requested),
            'certified_uniform_norm_floor_float': float(floor),
            'unit_interval_floor': str(unit_floor),
            'all_nonnegative_epsilon_floor': None if nonnegative_floor is None else str(nonnegative_floor),
            'negative_epsilon_phase_z_floor': str(pi4[0]),
            'pure_cubic_pair_coefficient_bounds': list(map(str, cubic_control)),
            'dimension_uniform_spectral_ratio_ceiling_verified': spectral_extension,
            'advertised_strict_ratio_ceiling': None if ratio_ceiling is None else str(ratio_ceiling),
            'reciprocal_norm_ceiling': str(1/floor),
            'reciprocal_norm_ceiling_float': float(1/floor),
            'seconds': time.monotonic()-started,
            'proof_status': 'Arb integrals and exact rational constants; analytic invariant closure and finite-field identity are separate paper proofs. No new Lean Gaussian formalization.',
            'scope': 'Norm floor for the stated Gaussian cubic witness in the displayed finite dimension and larger. With exact cancellation and the pure-cubic control this also bounds the dimension-uniform full vector/scalar ratio by the reciprocal floor. Not an upper bound on the complex Grothendieck constant; no assertion for smaller fixed dimensions or other witnesses.'}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('certificate', type=Path)
    parser.add_argument('--out', type=Path)
    args = parser.parse_args()
    data = json.loads(args.certificate.read_text())
    result = verify(data)
    result['input_sha256'] = hashlib.sha256(args.certificate.read_bytes()).hexdigest()
    result['verifier_sha256'] = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
    text = json.dumps(result, indent=2)+'\n'
    if args.out:
        args.out.write_text(text)
    print(text, end='')


if __name__ == '__main__':
    main()
