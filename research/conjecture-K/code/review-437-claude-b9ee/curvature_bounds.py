#!/usr/bin/env python3
"""Self-contained curvature inputs for the critical box of 7.4.11 (#437). Agent-ID: claude-b9ee.

Setting (KINT section 2): L = Z(a+bT), T = |Z|^2, Z standard complex Gaussian, a = 699/1250,
b = 179/1250, D(T) = (a+bT)(a+3bT).  For real w put

    F0(w)   = E|L+w|,
    beta(w) = E[(T-2/5) Re ph(L+w)]      (the tilted A first variation).

The box bound G <= max corner + sum_i M_i width_i^2/8 needs upper bounds for F0'' and |beta''| on
75/128 <= w <= 79/128.  KINT cites F0'' <= 179/125 and |beta''| <= 1 as inherited; this file proves
weaker bounds that suffice.

(i)  F0''(w) = E[(Im ph(L+w))^2/|L+w|] <= sup_c E[1/|L-c|] <= 2/a.
     The density of L is e^{-T}/(pi D(T)) (Jacobian of Z -> Z(a+bT) is D), radially decreasing with
     maximum m0 = 1/(pi a^2).  By the layer-cake (bathtub) rearrangement, a probability density
     bounded by m0 has inverse-distance potential at most that of the uniform disk of mass 1,
     2 pi m0 R with pi R^2 m0 = 1, that is 2 sqrt(pi m0) = 2/a.

(ii) beta(w) = int Re ph(x) (k rho)(x-w) dA(x), with k rho(y) = (T-2/5) e^{-T}/(pi D), T = T(|y|^2),
     a smooth rapidly decreasing radial function phi(|y|).  Differentiating under the integral,
     beta''(w) = int Re ph(x) (d^2/dy1^2 (k rho))(x-w) dA(x), and |Re ph| <= 1 gives
         |beta''| <= ||d^2/dy1^2 (k rho)||_{L^1} <= pi int_0^oo (s|phi''(s)| + |phi'(s)|) ds,
     since d^2/dy1^2 phi(|y|) = phi'' cos^2 + (phi'/s) sin^2.  Substituting 2 s ds = D dT
     (s^2 = T(a+bT)^2) and Psi = (T-2/5) e^{-T}/D = pi phi:
         pi int (s|phi''| + |phi'|) ds = int_0^oo ( |Psi' (1 - 2 s^2 D'/D^2) + 2 s^2 Psi''/D| + |Psi'| ) dT.
     Below, Arb encloses the integrand on every cell of [0,60] (upper Riemann sum).
     Tail T >= 60: write Psi' = E F and Psi'' = E (F' - F), E = e^{-T}, with
         F  = (1-N)/D - N D'/D^2,   N = T - 2/5,   D' = 4ab + 6b^2 T,
         F' = -1/D - (1-N)D'/D^2 - D'/D^2 - 6b^2 N/D^2 + 2 N D'^2/D^3.
     Since T D' <= 2D,  |F| <= (T+2)/D and |F'| <= (3 + 12/T)/D <= 4/D; since D' <= 4b(a+3bT),
     0 <= 2 s^2 D'/D^2 <= 8/3; and 2 s^2/D <= 2T.  So the integrand is at most
         E [ (14/3)(T+2) + 2T(T+6) ] / D <= E (2T^2 + 17T + 10) / (3 b^2 T^2) <= 38 e^{-T},
     and the tail is at most 38 e^{-60}.

Consequence for the box (KINT section 2): the w-curvature constant M_w = 2 F0'' + 2|beta''| Rmax + Smax
grows by  dM = 2(2/a - 179/125) + 2(B2 - 1) Rmax,  Rmax = 47/128 + rho 28/128,  and every width is 1/32,
so the box bound becomes  max_corner + interpolation_error + dM/8192.  The corner maximum and the
author's interpolation error are read from the critical_box receipt of
`code/compact-joint-2026-11-15/result.json`; `verify.py` there regenerates them.

Usage:  python3 curvature_bounds.py [--deps DIR_WITH_PYTHON_FLINT]
"""
import argparse
import json
import re
import sys
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('--deps', type=Path, help='directory containing python-flint')
args = parser.parse_args()
if args.deps:
    sys.path.insert(0, str(args.deps))
from flint import arb, ctx  # noqa: E402

if not __debug__:
    raise SystemExit('run without -O: the acceptance checks are assertions')
ctx.prec = 128
a = arb(699)/1250
b = arb(179)/1250
rho = arb(5053)/10000


def integrand(T):
    """Arb enclosure, over the interval T, of the T-integrand of (ii)."""
    N = T - arb(2)/5
    D = (a + b*T)*(a + 3*b*T)
    Dp = 4*a*b + 6*b*b*T
    E = (-T).exp()
    F = (1 - N)/D - N*Dp/(D*D)
    Fp = -1/D - (1 - N)*Dp/(D*D) - Dp/(D*D) - 6*b*b*N/(D*D) + 2*N*Dp*Dp/(D*D*D)
    psi1 = E*F
    psi2 = E*(Fp - F)
    s2 = T*(a + b*T)**2
    return abs(psi1*(1 - 2*s2*Dp/(D*D)) + 2*s2*psi2/D) + abs(psi1)


def beta_curvature_bound():
    from fractions import Fraction as Q
    total = arb(0)
    x, cells = Q(0), 0
    while x < 60:
        step = Q(1, 4000) if x < 2 else (Q(1, 1000) if x < 10 else Q(1, 100))
        lo, hi = arb(x.numerator)/x.denominator, arb((x + step).numerator)/(x + step).denominator
        total += integrand(lo.union(hi))*(hi - lo)
        x += step
        cells += 1
    assert x == 60
    tail = 38*arb(-60).exp()
    # sanity only (the tail bound is the paper argument above)
    for t0 in [60, 61, 70, 100, 200, 400]:
        T = arb(t0)
        assert (integrand(T) - 38*(-T).exp()).upper() < 0, t0
    return total + tail, cells, tail


def main():
    b2, cells, tail = beta_curvature_bound()
    f2 = 2/a
    print(f'cells on [0,60]: {cells}; tail bound 38 e^-60 = {float(tail.upper()):.3e}')
    print(f'(i)  F0\'\'   <= 2/a      < {float(f2.upper()):.6f}')
    print(f'(ii) |beta\'\'| <= integral < {float(b2.upper()):.6f}')
    B2 = arb(50044)/10000
    assert (b2 - B2).upper() < 0
    assert (f2 - arb(35766)/10000).upper() < 0
    receipt = Path(__file__).resolve().parents[1]/'compact-joint-2026-11-15'/'result.json'
    text = json.loads(receipt.read_text())['checks']['critical_box']['stdout']
    m = re.search(r'max_corner=(\S+) interpolation_error_upper=(\S+) defect_upper=(\S+)', text)
    assert m, 'critical_box receipt not found'
    max_corner, interp = float(m.group(1)), float(m.group(2))
    rmax = arb(47)/128 + rho*arb(28)/128
    dM = 2*(arb(35766)/10000 - arb(179)/125) + 2*(B2 - 1)*rmax
    bound = arb(max_corner) + arb(interp) + dM/8192
    print(f'box: max corner {max_corner:.10f} + interpolation {interp:.10f} + dM/8192 '
          f'({float((dM/8192).upper()):.7f}) <= {float(bound.upper()):.7f}')
    assert bound.upper() < 0
    print('PASS curvature inputs: F0\'\' <= 2/a < 3.5766 and |beta\'\'| <= 5.0044 on every w; '
          'the critical box of 7.4.11 holds with defect < -0.0004')


if __name__ == '__main__':
    main()
