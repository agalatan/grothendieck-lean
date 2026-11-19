# claude-b9ee research worker, 17 Nov 2026. RIGOROUS (arb): the contour bound Bnd(u) >= |psi(u)| at u = 40 (and a few
# other u, for the record).  Gamma: z(x) = x + i eta(x), eta(x) = (min(x^2, X1^2) - 1)/2, X1 = 5/2, eta1 = 21/8.
# On Gamma, Im h(z) = eta (3x^2 - eta^2 - 3)/sqrt6 >= 0 (proof in PROOF_DIAGONAL.md), so
#   |psi(u)| = |int_Gamma e^{iuh(z)} phi(z) dz| <= Bnd(u) := int |e^{iuh(z(x))} phi(z(x)) z'(x)| dx,
# Bnd is nonincreasing in u, and the integrand is exp(-u Im h - Re(z^2)/2)/sqrt(2 pi) * |z'(x)|.
import sys
from flint import arb, acb, ctx, fmpq
ctx.prec = 96
S6 = arb(6).sqrt(); C0 = 1 / (2 * arb.pi()).sqrt()
X1 = arb(5) / 2; ETA1 = arb(21) / 8; XC = 8
def bnd(u):
    u = arb(u)
    def fpar(x, analytic):          # |x| <= X1: eta = (x^2 - 1)/2, Im h = eta^2 (6 - eta)/sqrt6, Re z^2 = x^2 - eta^2
        eta = (x*x - 1) / 2
        imh = eta * eta * (6 - eta) / S6
        dz = (1 + x*x).sqrt(analytic=analytic)
        return (-u * imh - (x*x - eta*eta) / 2).exp() * C0 * dz
    def fhor(x, analytic):          # |x| >= X1: eta = eta1
        imh = ETA1 * (3*x*x - ETA1*ETA1 - 3) / S6
        return (-u * imh - (x*x - ETA1*ETA1) / 2).exp() * C0
    J = acb.integral(fpar, -X1, X1) + acb.integral(fhor, X1, XC) + acb.integral(fhor, -XC, -X1)
    t = (ETA1 * ETA1 / 2).exp() * (arb(XC) / arb(2).sqrt()).erfc()   # both pieces beyond |x| = 8
    return J.real + t                                               # upper bound (t >= the tails)
if __name__ == '__main__':
    # Im h >= 0 on Gamma: parabola part eta <= eta1 = 21/8 < 6; horizontal part 3x^2 - eta1^2 - 3 >= 75/4 - 441/64 - 3 > 0
    from fractions import Fraction as Fr
    assert Fr(21, 8) < 6 and Fr(75, 4) - Fr(441, 64) - 3 == Fr(567, 64) > 0
    print('Im h >= 0 on Gamma: eta1 = 21/8 < 6 and 3*X1^2 - eta1^2 - 3 = 567/64 > 0')
    for u in ['4.727', '10', '20', '40']:
        b = bnd(arb(u)); print('Bnd(%s) = %s   (upper endpoint %s)' % (u, b.str(15, radius=True), b.upper().str(15)))
    b40 = bnd(arb(40))
    with open('bnd40.txt', 'w') as fh: fh.write(b40.str(30, radius=True) + '\n')
