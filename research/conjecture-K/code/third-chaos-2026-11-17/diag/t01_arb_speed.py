# claude-b9ee research worker: speed test of arb (python-flint) rigorous integration for psi(u).
import time
from flint import arb, acb, ctx
ctx.prec = 64
s6 = arb(6).sqrt(); c0 = 1 / (2 * arb.pi()).sqrt()
def psi_real(u, X=8):
    u = arb(u)
    def f(z, an):
        hz = (z**3 - 3*z) / s6
        return (u * hz).cos() * (-(z*z) / 2).exp() * c0
    I = acb.integral(f, 0, X)
    tail = 2 * (arb(X) / arb(2).sqrt()).erfc() / 2  # 2 * P(X > x) bound for 2*int_X^inf phi
    return 2 * I.real, tail
X1 = arb(5) / 2; eta1 = (X1*X1 - 1) / 2
def psi_contour(u, X2=8):
    u = arb(u)
    def fpar(x, an):   # parabola z = x + i(x^2-1)/2, dz = (1 + i x) dx
        z = x + acb(0, 1) * (x*x - 1) / 2
        hz = (z**3 - 3*z) / s6
        return (acb(0, 1) * u * hz).exp() * (-(z*z) / 2).exp() * c0 * (1 + acb(0, 1) * x)
    def fhor(x, an):
        z = x + acb(0, 1) * eta1
        hz = (z**3 - 3*z) / s6
        return (acb(0, 1) * u * hz).exp() * (-(z*z) / 2).exp() * c0
    I = acb.integral(fpar, -X1, X1) + acb.integral(fhor, X1, X2) + acb.integral(fhor, -X2, -X1)
    return I
for u in [1, 3, 4.727, 10, 40, 100]:
    t = time.time(); r = psi_real(u); t1 = time.time() - t
    t = time.time(); c = psi_contour(u); t2 = time.time() - t
    print('u = %s real-line: %s (+-%s tail) %.2fs | contour: %s %.2fs' % (u, r[0].str(12, radius=True), r[1].str(3), t1, c.str(12, radius=True), t2))
