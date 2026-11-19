# claude-b9ee, 16 Nov 2026: independent high-precision check of codex-6d92's He_3 obstruction (issue #458).
# F = (G^3 - 3G)/sqrt(6).  Own formulas; mpmath, 40 digits.  No use of the delivered script.
from mpmath import mp, mpf, sqrt, exp, pi, erf, findroot, quad, ncdf, linspace
mp.dps = 40
s6 = sqrt(6)
f = lambda x: (x**3 - 3*x)/s6
phi = lambda x: exp(-x*x/2)/sqrt(2*pi)
phi0 = phi(0)

# density at zero
pF0 = phi(0)/abs(-3/s6) + 2*phi(sqrt(3))/abs(6/s6)
print('p_F(0)/phi(0)          =', pF0/phi0, '  closed form', sqrt(mpf(2)/3)*(1 + exp(mpf(-3)/2)))

# E|F|
EabsF = 2*quad(lambda x: abs(f(x))*phi(x), [0, sqrt(3), 12])
print('E|F|                   =', EabsF, '  closed form', (1 + 4*exp(mpf(-3)/2))/sqrt(3*pi))

# small ball at eps = 1/1000: the preimage of [-eps, eps] is three intervals
eps = mpf(1)/1000
def root(c, x0):
    return findroot(lambda x: f(x) - c, x0)
a0, b0 = root(eps, 0), root(-eps, 0)          # middle branch is decreasing
a1, b1 = root(-eps, sqrt(3)), root(eps, sqrt(3))
PF = (ncdf(max(a0, b0)) - ncdf(min(a0, b0))) + 2*(ncdf(b1) - ncdf(a1))
PG = ncdf(eps) - ncdf(-eps)
print('P(|G|<=eps)-P(|F|<=eps) =', PG - PF, '  certified lower bound', 827*phi0/750000000)

# Laplace transform at t = 10^8: three Gaussian-like bumps of width ~ 1e-4 around 0, +-sqrt(3)
t = mpf(10)**8
def bump(c, slope):
    w = 12/(abs(slope)*sqrt(t))
    return quad(lambda x: exp(-t*f(x)**2)*phi(x), linspace(c - w, c + w, 25))
LF = bump(mpf(0), -3/s6) + 2*bump(sqrt(3), 6/s6)
LG = 1/sqrt(1 + 2*t)
print('L_G(t) - L_F(t)         =', LG - LF, '  certified lower bound 3e-8;  L_G =', LG)
print('sqrt(2t)*(L_G-L_F)      =', sqrt(2*t)*(LG - LF), '  (limit 1 - p_F(0)/phi(0) =', 1 - pF0/phi0, ')')

# the moment example Y = (2400/2419) Unif{+-9/10} + (19/2419) N(0,25)
from fractions import Fraction as Q
w1, w2 = Q(2400, 2419), Q(19, 2419)
m2 = w1*Q(81, 100) + w2*25
m4 = w1*Q(81, 100)**2 + w2*3*625
m6 = w1*Q(81, 100)**3 + w2*15*15625
k4 = m4 - 3*m2**2
k6 = m6 - 15*m4*m2 + 30*m2**3
print('Y: EY^2 =', m2, ' EY^4 =', m4, ' kappa4 =', k4, '=', float(k4), ' EY^6 =', m6, ' kappa6 =', k6, '=', float(k6))
print('Y: kappa6^2 <= 68^2 kappa4^3 :', k6**2 <= 68**2*k4**3, ' ratio', float(k6**2/(68**2*k4**3)))
EabsY = (2160 + 95*sqrt(2/pi))/2419
print('Y: E|Y| =', EabsY, '  sqrt(0.68) =', sqrt(mpf('0.68')), '  sqrt(2/pi) =', sqrt(2/pi))
# hypercontractivity ||Y||_p <= (p-1)^{3/2} for p >= 2 (variance one): scan p
from mpmath import gamma, power
def normp(p):
    gp = power(2, p/2)*gamma((p + 1)/2)/sqrt(pi)          # E|N|^p
    return power(mpf(2400)/2419*power(mpf(9)/10, p) + mpf(19)/2419*power(5, p)*gp, 1/p)
worst = max((normp(p)/power(p - 1, mpf(3)/2), p) for p in [mpf(2) + mpf(k)/20 for k in range(1, 2000)])
print('Y: max over p in (2, 102] of ||Y||_p/(p-1)^{3/2} =', worst[0], 'at p =', worst[1])
