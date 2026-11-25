# [stage 2c copy of degree5-cert/cert/crosscheck.py: only the row and the nodes changed]
# Independent cross-check (N, high precision) of the psi5 enclosures: polar coordinates, mpmath tanh-sinh
# quadrature, radial split at the zero radius r0 of A+ and angular split at theta = pi (where the zero lies).
# Psi5 = 2 E|A+| = (4/pi) int_0^oo int_0^pi |A+(r e^{i theta})| e^{-r^2} r dtheta dr.   claude-b9ee d5cert, 16 Nov 2026.
import sys, subprocess, os
from mpmath import mp, mpf, sqrt, exp, cos, sin, pi, quad, findroot
from fractions import Fraction as F
mp.dps = 25
HERE = os.path.dirname(os.path.abspath(__file__))

def psi_mp(l, beta, bA, bB, s, nu):
    k12 = 1 / sqrt(12); c = s * bB / sqrt(2)
    def absA(r, th):
        T = r * r; x = r * cos(th); y = r * sin(th)
        g = l + beta * (T - 2) + nu * k12 * (T * T - 6 * T + 6)
        h = 1 - bA * (T - 1)
        R = x * g + s * h - c * (x * x - y * y)
        I = y * g - 2 * c * x * y
        return sqrt(R * R + I * I)
    # zero of A+ on the negative real axis: x g(x^2) + s(h(x^2) - c' x^2) = 0 at x = -r
    def a_real(r):
        x = -r; T = r * r
        return x * (l + beta * (T - 2) + nu * k12 * (T * T - 6 * T + 6)) + s * (1 - bA * (T - 1)) - c * T
    pts = [0, 7]
    if s > 0:
        r0 = findroot(a_real, mpf(1.6) * s)
        pts = [0, r0, 7]
    inner = lambda r: quad(lambda th: absA(r, th), [0, pi / 2, pi]) * exp(-r * r) * r
    return 4 / pi * quad(inner, pts)

if __name__ == '__main__':
    # stage 2c (claude-b9ee worker d5newcap): a row of the game (1, -161/200, 3/20) near the peak, and nodes that include the
    # new, larger nu-nodes (1/10, 1/8, 3/20) and a negative one
    row = (F(851090, 10 ** 6), F(156000, 10 ** 6), F(-95100, 10 ** 6), F(-53670, 10 ** 6))
    nodes = [(F(0), F(23, 1000)), (F(1, 5), F(23, 1000)), (F(1, 2), F(1, 10)), (F(3, 2), F(3, 20)), (F(3, 10), F(1, 8)), (F(1, 5), F(-1, 40)), (F(4), F(1, 20))]
    inp = '%d %d %d %d %d %d %d %d\n' % tuple(v for q in row for v in (q.numerator, q.denominator))
    inp += ''.join('%d %d %d %d\n' % (s.numerator, s.denominator, n.numerator, n.denominator) for s, n in nodes)
    out = subprocess.run([os.path.join(HERE, 'psi5'), '1e-12'], input=inp, capture_output=True, text=True, check=True).stdout.split('\n')
    for (s, nu), line in zip(nodes, out):
        p = line.split(); lo = F(float.fromhex(p[2])); hi = F(float.fromhex(p[3]))
        v = psi_mp(*(mpf(q.numerator) / q.denominator for q in row), mpf(s.numerator) / s.denominator, mpf(nu.numerator) / nu.denominator)
        vq = F(str(v))
        print('s=%s nu=%s  mpmath %s  psi5 [%.15f, %.15f]  inside: %s  (tail of |z|>7 ignored, < 1e-18)' % (s, nu, mp.nstr(v, 18), lo, hi, lo <= vq <= hi), flush=True)
