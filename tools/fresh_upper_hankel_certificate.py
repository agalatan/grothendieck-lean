#!/usr/bin/env python3
"""Certify the one-coordinate bilinear alternating ceiling by an HS bound.

Dependencies: python-flint (Arb). Run with `uv run --with python-flint`.
This verifies the sole numerical ingredient of the accompanying paper proof:
the squared Hilbert--Schmidt norm of a normalized Hankel kernel is < 2.
No finite-chaos cutoff, numerical eigenvalue or optimizer is trusted.
"""
import argparse
import json
from pathlib import Path
import flint
from flint import arb, ctx


def certificate(mesh=40, radius=6, bits=96):
    for name,value in [("mesh",mesh),("radius",radius),("bits",bits)]:
        if type(value) is not int or value<=0:
            raise ValueError(f"{name} must be a positive integer")
    if bits<32:
        raise ValueError("bits must be at least 32 for reliable directed evaluation")
    ctx.prec = bits
    pi = arb.pi()
    step = arb(1) / mesh
    count = mesh * radius
    # C(r) = integral_0^infty s exp(-s²/2)J1(rs) ds / r.
    # C is positive and decreasing, from its positive Laplace representation.
    def C(r):
        x = r*r/4
        return (pi/8).sqrt() * (-x).exp() * (x.bessel_i(0)-x.bessel_i(1))

    nodes = [arb(i)/mesh for i in range(count+1)]
    denominator = [C(nodes[i+1]) for i in range(count)]
    exp_bound = [(-(nodes[i]**2)/2).exp() for i in range(count)]
    finite = arb(0)
    for i in range(count):
        for j in range(i, count):
            lo = nodes[i]*nodes[j]
            hi = nodes[i+1]*nodes[j+1]
            mid, rad = (lo+hi)/2, (hi-lo)/2
            # Integral representation gives |J1|<=1, |J1'|<=1.
            # The standard Poisson representation gives |J1(x)|<=x/2.
            bessel_bound = abs(mid.bessel_j(1)).upper() + rad
            if arb(1) < bessel_bound:
                bessel_bound = arb(1)
            if hi/2 < bessel_bound:
                bessel_bound = hi/2
            cell = (step**2 * exp_bound[i]*exp_bound[j]
                    * bessel_bound**2 / (denominator[i]*denominator[j]))
            finite += cell if i == j else 2*cell

    # C(r)>=c/(1+r)^3, obtained by retaining v in [0,1/(1+r)]
    # in C(r)=sqrt(2/pi)int_0^1 v²exp(-r²v²/2)/sqrt(1-v²)dv.
    c = (2/pi).sqrt()*(-arb(1)/2).exp()/3
    T0 = 4*(pi/2).sqrt()+5
    R = arb(radius)
    TR = (-(R**2)/2).exp()*(R**2+3*R+5+4/R)
    tail = 2*T0*TR/(c*c)
    total = finite+tail
    if not total < 2:
        raise ArithmeticError(f"HS bound failed: {total}")
    return {
        "status": "PASS: rigorous Arb rectangle and analytic-tail upper bound",
        "python_flint_version": flint.__version__,
        "precision_bits": bits, "mesh_denominator": mesh,
        "radius": radius, "rectangles": count**2,
        "finite_square_upper_enclosure": str(finite),
        "tail_upper_enclosure": str(tail),
        "HS_squared_upper_enclosure": str(total),
        "certified_HS_squared_lt": 2,
        "scope": "one-coordinate, charge-one, arbitrary complex disk-valued bilinear responses; alternating functional only",
    }


if __name__ == "__main__":
    p = argparse.ArgumentParser()
    p.add_argument("--mesh", type=int, default=40)
    p.add_argument("--radius", type=int, default=6)
    p.add_argument("--bits", type=int, default=96)
    p.add_argument("--output", type=Path)
    a = p.parse_args()
    result = certificate(a.mesh, a.radius, a.bits)
    if a.output:
        a.output.write_text(json.dumps(result, indent=2)+"\n")
    print(json.dumps(result, indent=2))
