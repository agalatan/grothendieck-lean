# claude-b9ee research worker (fourpartite): N-level look at the one-parameter function
#   K(s) = int_0^inf [ r_s(t) C(Th_s(t)) - e^{-t^2/2} ] t^{-2} dt,
#   r_s(t) = (1+s t^2)^{-1/2} exp(-(1-s) t^2 / (2(1+s t^2))),  Th_s(t) = ((1-s)/2) sqrt(s) t^3/(1+s t^2),
#   C(th) = cos(th) for th <= pi, -1 for th > pi.
# K(s) is a lower bound for (pi/2)(sqrt(2/pi) - E|aX+bY+cXY|) at a^2+b^2+c^2 = 1, s = c^2.
import numpy as np
from scipy import integrate

def r(s, t):
    return (1 + s*t*t)**-0.5*np.exp(-(1 - s)*t*t/(2*(1 + s*t*t)))

def Th(s, t):
    return (1 - s)/2*np.sqrt(s)*t**3/(1 + s*t*t)

def Cf(th):
    return np.cos(th) if th <= np.pi else -1.0

def integrand(t, s, ctrick=True):
    th = Th(s, t)
    cc = Cf(th) if ctrick else np.cos(th)
    return (r(s, t)*cc - np.exp(-t*t/2))/(t*t)

def K(s, ctrick=True, T=2000.0):
    # break points: where Th = pi (if any), plus a log grid
    pts = sorted(set([1e-9, 0.5, 1, 1.5, 2, 2.5, 3, 4, 5, 6, 8, 10, 15, 20, 30, 50, 80, 120, 200, 400, 800, 1200, T]))
    if 0 < s < 1:
        # solve Th = pi by bisection on [0, T]
        lo, hi = 0.0, T
        if Th(s, T) > np.pi:
            for _ in range(200):
                mid = (lo + hi)/2
                if Th(s, mid) > np.pi: hi = mid
                else: lo = mid
            pts = sorted(set(pts + [hi]))
    tot = 0.0
    for lo, hi in zip(pts[:-1], pts[1:]):
        v, e = integrate.quad(integrand, lo, hi, args=(s, ctrick), limit=400, epsabs=1e-15, epsrel=1e-11)
        tot += v
    # tail beyond T: |integrand| <= (s^{-1/2} t^{-1} + e^{-t^2/2}) t^{-2}
    tail = s**-0.5/(2*T*T)
    return tot, tail

def sign_changes(s, ctrick=True, tmax=60.0, n=200000):
    ts = np.linspace(1e-4, tmax, n)
    v = np.array([integrand(t, s, ctrick) for t in ts])
    sg = np.sign(v)
    ch = np.where(sg[1:] != sg[:-1])[0]
    return [round(ts[i], 4) for i in ch]

if __name__ == '__main__':
    print('   s        K(s) [C-trick]    K/s        J(a=b) [cos]     tail bound   sign changes of the C-trick integrand')
    for s in [1e-4, 1e-3, 3e-3, 0.01, 0.02, 0.05, 0.1, 0.15, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 0.95, 0.99, 1.0]:
        k, tl = K(s)
        j, _ = K(s, ctrick=False)
        sc = sign_changes(s, tmax=40.0, n=40000)
        print('%8.4g  %.10e  %.5f  %.10e  %.1e  %s' % (s, k, k/s, j, tl, sc[:6]))
