# Gemini's martingale-isoperimetric bound (End-to-End exposition, Thm 8.2), on P = h3(X), d = 3, n = 1.
# N_t = T_{sqrt t} sign P, I(s) = phi(Phi^{-1}((1+s)/2)), mu(t) = E I(N_t), Wbar = int_0^1 d t^{d-1} I(N_t)/mu(t) dt,
# Gamma = |P'|^2/d.  Claim: E|P| <= B(P) <= R(P) = sqrt(2/pi) sqrt(E[Wbar Gamma]), and E Wbar = E Gamma = 1,
# so R(P) <= sqrt(2/pi) iff Cov(Wbar, Gamma) <= 0  (condition Omega_3).
import numpy as np
from scipy.stats import norm
from scipy.special import ndtri
x = np.linspace(-12, 12, 240001); w = norm.pdf(x)*(x[1]-x[0])
s3 = np.sqrt(3.0)
def N(t):
    m, sg = np.sqrt(t)*x, np.sqrt(1-t)
    pos = norm.cdf(-m/sg) - norm.cdf((-s3-m)/sg) + norm.sf((s3-m)/sg)   # P(sqrt t x + sqrt(1-t) G in {h3 > 0})
    return 2*pos - 1
def I(s):
    u = np.clip((1+s)/2, 1e-300, 1-1e-16)
    return norm.pdf(ndtri(u))
d = 3
ts = np.linspace(0, 1, 4001)[1:-1]
Gam = (x**2 - 1)**2/2
Wbar = np.zeros_like(x); mus = []; Bint = []
dt = ts[1]-ts[0]
for t in ts:
    It = I(N(t)); mu = np.sum(It*w); mus.append(mu)
    Wbar += d*t**(d-1)*It/mu*dt
    Bint.append(np.sum(It*Gam*d*w))      # E[I(N_t) |grad P|^2]
mus = np.array(mus); Bint = np.array(Bint)
dmu = np.gradient(mus, ts)
B = np.sum(np.sqrt(np.maximum(-dmu, 0))*np.sqrt(8*ts**(d-1)*Bint))*dt
EP = np.sum(np.abs((x**3-3*x)/np.sqrt(6))*w)
print('E|h3| = %.6f   B = %.6f   E Wbar = %.6f (should be 1)   E Gamma = %.6f' % (EP, B, np.sum(Wbar*w), np.sum(Gam*w)))
cov = np.sum(Wbar*Gam*w) - np.sum(Wbar*w)*np.sum(Gam*w)
R = np.sqrt(2/np.pi)*np.sqrt(np.sum(Wbar*Gam*w))
print('Cov(Wbar, Gamma) = %.6f   R = %.6f   sqrt(2/pi) = %.6f   mu(0+) = %.6f (1/sqrt(2 pi) = %.6f)' % (cov, R, np.sqrt(2/np.pi), mus[0], 1/np.sqrt(2*np.pi)))
