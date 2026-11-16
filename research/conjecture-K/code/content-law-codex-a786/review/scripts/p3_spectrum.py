# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N (mpmath quadrature, 25 digits).
# P3 for two unequal eigenvalues: P = l1 (T1 - 1) + l2 (T2 - 1), l1^2 + l2^2 = 1, T_i ~ Exp(1).
# Evaluates the sign bias alpha^2 = E[E[P|P^2]^2/P^2] of (8) and the sufficient constant (8); compares alpha^2 with the
# Edgeworth guess (2/3) s3^2 (s3 = l1^3 + l2^3), which equals the package's 2/(3m) for equal eigenvalues.
# The guess is NOT proved here and is only tested on these cases.
import mpmath as mp
mp.mp.dps = 25
def dens(l1, l2):
    if l2 > 0:
        if abs(l1 - l2) < 1e-12:
            return lambda p: (lambda x: x * mp.exp(-x / l1) / l1 ** 2 if x > 0 else mp.mpf(0))(p + l1 + l2), -(l1 + l2)
        return lambda p: (lambda x: (mp.exp(-x / l1) - mp.exp(-x / l2)) / (l1 - l2) if x > 0 else mp.mpf(0))(p + l1 + l2), -(l1 + l2)
    a = -l2
    return lambda p: (lambda x: (mp.exp(-x / l1) if x > 0 else mp.exp(x / a)) / (l1 + a))(p + l1 - a), None
print('  l1      l2     | kappa=sum l^4  s3=sum l^3 | alpha^2      (2/3) s3^2   ratio | (8): theta <= ... | mass check')
worst = 0
for th in (0.0, 0.2, 0.4, 0.6, mp.pi / 4, 1.0, 1.3, 1.5, -0.1, -0.3, -0.5, -0.7, -mp.pi / 4 + 0.05):
    l1, l2 = mp.cos(th), mp.sin(th)
    if abs(l2) < 1e-12:
        f = lambda p: mp.exp(-(p + 1)) if p > -1 else mp.mpf(0); lo = -1
    else:
        f, lo = dens(l1, l2)
    cut = float(l1 + max(l2, 0)); pts = sorted(set([0, cut * 0.5, cut, cut + 1, cut + 5, cut + 20, cut + 80]))
    mass = mp.quad(f, [-80, -20, -5, -cut, 0, cut, 5, 20, 80]) if lo is None else mp.quad(f, [lo, 0, cut, 5, 20, 80])
    al = mp.quad(lambda p: (f(p) - f(-p)) ** 2 / (f(p) + f(-p)) if f(p) + f(-p) > 0 else mp.mpf(0), pts)
    kap = l1 ** 4 + l2 ** 4; s3 = l1 ** 3 + l2 ** 3
    th8 = 2 / (3 * (4 + 12 * kap)) * ((mp.sqrt(17 * al) + mp.sqrt(24 * kap)) ** 2 + 16 * s3 ** 2)
    ratio = al / (mp.mpf(2) / 3 * s3 ** 2) if abs(s3) > 1e-9 else mp.nan
    if ratio == ratio: worst = max(worst, ratio)
    print(' %7.4f %7.4f | %.4f         %+.4f    | %.6f     %.6f     %.3f | %.4f            | %.1e' % (l1, l2, kap, s3, al, 2 * s3 ** 2 / 3, ratio, th8, abs(mass - 1)))
print('largest alpha^2 / ((2/3) s3^2) on these cases: %.3f  (a value above 1 would refute the guess alpha^2 <= (2/3) s3^2)' % worst)
