# claude-b9ee research worker, 17 Nov 2026. RIGOROUS (arb ball arithmetic, python-flint).
# Encloses psi(u) = E cos(u h(X)) = 2 int_0^inf cos(u h(x)) phi(x) dx,  h(x) = (x^3 - 3x)/sqrt 6,
# at the grid points u_k = k/1000, k0 <= k < k1, by
#   psi(u) = 2 int_0^8 cos(u h(x)) phi(x) dx  +  E,   |E| <= 2 int_8^inf phi = erfc(8/sqrt 2)
# (|cos| <= 1).  The integral over [0, 8] is computed by acb.integral (Petras' algorithm: rigorous enclosure for an
# integrand that is analytic near the segment; here the integrand is entire).  Optionally (method 'contour') the same
# value is enclosed through the deformed contour Gamma of c02 (independent cross-check).
# Output: one line per k: "k [mid +/- rad]" (arb's string form; parsing it back gives a ball containing the computed ball).
import sys
from flint import arb, acb, ctx, fmpq
ctx.prec = 96
S6 = arb(6).sqrt(); C0 = 1 / (2 * arb.pi()).sqrt(); I = acb(0, 1)
XT = 8
TAIL = (arb(XT) / arb(2).sqrt()).erfc()           # >= 2 int_8^inf phi(x) dx
def psi_real(u):
    def f(z, analytic):
        return (u * (z**3 - 3*z) / S6).cos() * (-(z*z) / 2).exp() * C0
    J = acb.integral(f, 0, XT)
    return 2 * J.real + arb(0, TAIL.upper())        # ball widened by the truncation error
X1 = arb(5) / 2; ETA1 = (X1*X1 - 1) / 2; XC = 8
def psi_contour(u):
    def fpar(x, analytic):     # z = x + i(x^2 - 1)/2, dz = (1 + i x) dx
        z = x + I * (x*x - 1) / 2
        return (I * u * (z**3 - 3*z) / S6).exp() * (-(z*z) / 2).exp() * C0 * (1 + I * x)
    def fhor(x, analytic):     # z = x + i*eta1
        z = x + I * ETA1
        return (I * u * (z**3 - 3*z) / S6).exp() * (-(z*z) / 2).exp() * C0
    J = acb.integral(fpar, -X1, X1) + acb.integral(fhor, X1, XC) + acb.integral(fhor, -XC, -X1)
    # beyond |x| = 8 on the horizontal lines: |integrand| <= exp(eta1^2/2) phi(x) (Im h >= 0 there), so the two
    # pieces together are at most exp(eta1^2/2) * erfc(8/sqrt 2)
    t = (ETA1 * ETA1 / 2).exp() * (arb(XC) / arb(2).sqrt()).erfc()
    return J.real + arb(0, t.upper())
if __name__ == '__main__':
    k0, k1, out = int(sys.argv[1]), int(sys.argv[2]), sys.argv[3]
    method = sys.argv[4] if len(sys.argv) > 4 else 'real'
    step = int(sys.argv[5]) if len(sys.argv) > 5 else 1
    F = psi_real if method == 'real' else psi_contour
    with open(out, 'w') as fh:
        for k in range(k0, k1, step):
            u = arb(fmpq(k, 1000))
            v = F(u)
            fh.write('%d %s\n' % (k, v.str(30, radius=True)))
