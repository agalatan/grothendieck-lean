#!/usr/bin/env python3
"""Cross-check the plane certificate tables with upper gamma recurrences.

Agent-ID: codex-6d92. This re-evaluates each bin center and its padding.
"""

from fractions import Fraction
from pathlib import Path
from runpy import run_path

from flint import arb, ctx


def upper_gamma_pair(n, z):
    """Return regularized upper gamma values at shapes (n+1)/2 and (n+3)/2."""
    decay = (-z).exp()
    if n % 2:
        shape, tail, increment = Fraction(1), decay, decay*z
    else:
        root = z.sqrt()
        shape, tail = Fraction(1, 2), root.erfc()
        increment = 2*decay*root/arb.pi().sqrt()

    while 2*shape < n+1:
        tail += increment
        shape += 1
        increment *= z*shape.denominator/shape.numerator
    return tail, tail+increment


def chi_mean(n):
    result = (2/arb.pi()).sqrt() if n % 2 else (arb.pi()/2).sqrt()
    for j in range(1 if n % 2 else 2, n, 2):
        result = result*(j+1)/j
    return result


def radial_mean(n, a, b, mean):
    harmonic_factor = 1/arb(n*(n+2)*(n+4)).sqrt()
    ratio = (arb(n+4)/2).sqrt()
    xi = harmonic_factor*(a*ratio+b)
    eta = harmonic_factor*a*ratio*(n+2)
    if eta.is_zero() or xi.is_zero() or (xi > 0 and eta < 0) or (xi < 0 and eta > 0):
        return mean*((n+1)*abs(xi)+abs(eta))

    assert (xi > 0 and eta > 0) or (xi < 0 and eta < 0)
    tail1, tail3 = upper_gamma_pair(n, eta/(2*xi))
    return mean*((n+1)*abs(xi)*(2*tail3-1)+abs(eta)*(1-2*tail1))


def check_tables():
    main = run_path(str(Path(__file__).with_name("certify_planes.py")))
    scale, bins = main["SCALE"], main["BUCKETS"]
    ctx.prec = 128
    basis = main["angle_basis"]()
    for n in (11, 14, 15):
        ctx.prec = 128
        # The lookup tables are independent of the envelope weights.
        envelope = main["PlaneEnvelope"](n, (1,)*5, 0, basis)
        ctx.prec = 256
        mean = chi_mean(n)
        one, zero = arb(1), arb(0)
        mean_g, mean_h = radial_mean(n, one, zero, mean), radial_mean(n, zero, one, mean)
        assert scale*mean_g < arb(envelope.norm_g)
        assert scale*mean_h < arb(envelope.norm_h)

        for j in range(2*bins):
            center = arb(2*j+1)/(2*bins)-1
            upper_g = scale*(radial_mean(n, one, center, mean)+mean_h/(2*bins))
            upper_h = scale*(radial_mean(n, center, one, mean)+mean_g/(2*bins))
            assert upper_g < arb(int(envelope.table_g[j])), (n, j, "g", upper_g)
            assert upper_h < arb(int(envelope.table_h[j])), (n, j, "h", upper_h)

        print(f"PASS n={n}: {4*bins} table entries enclose the upper-gamma recurrence", flush=True)


if __name__ == "__main__":
    if not __debug__:
        raise RuntimeError("Run the lookup-table check with assertions enabled.")
    check_tables()
