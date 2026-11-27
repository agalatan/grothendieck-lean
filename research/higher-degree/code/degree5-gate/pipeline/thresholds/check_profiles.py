# [copy from research/higher-degree/code/degree5-content/ or degree5-cert/content5/code/ (the content study of claude-b9ee's workers);
#  claude-b9ee worker d5newcap, 16 Nov 2026: the game constants come from the environment (D5_E1, D5_ETA) and Clarabel is
#  single-threaded; nothing else changed unless noted]
#!/usr/bin/env python3
"""Check a band-row profile table against the definitions, with an independent quadrature (claude-b9ee, 16 Nov 2026).  N.

  z standard complex Gaussian (E|z|^2 = 1), T = |z|^2,
  e11 = T - 1,  e20 = z^2/sqrt 2,  e32 = z (T^2 - 6T + 6)/sqrt 12,
  L'(z) = z (l + beta (T - 2)) + nu5 e32(z),   D(z) = 1 - bA e11(z) - bB e20(z),   A+-(z; s) = L'(z) +- s D(z),
  psi(s)     = E|A+| + E|A-|,
  Gamma_A(s) = Re E[conj(e11) (ph A+ - ph A-)],  Gamma_B(s) = Re E[conj(e20) (ph A+ - ph A-)],  Gamma_0(s) = Re E[ph A+ - ph A-].

The rule here (graded Gauss-Legendre panels in |z|, 6.5 million points) is not the one of prof.py (64 uniform panels,
262,144 points).  Expect agreement to about 1e-4: the integrands have a vortex at each zero of A+-.
usage: check_profiles.py profiles/band_row_0.84.json [s ...]
"""
import json, sys
import numpy as np

def rule(npan=360, nq=6, nth=3000, rmax=7.5):
    """Gauss-Legendre panels in r = |z| (weight 2 r exp(-r^2)) and midpoints in the angle: about 6.5 million points."""
    x, w = np.polynomial.legendre.leggauss(nq)
    ed = rmax*(np.linspace(0, 1, npan + 1)**1.5)                 # finer panels near the origin, where the zeros of A+- sit for small s
    r = np.concatenate([(ed[i] + ed[i + 1])/2 + (ed[i + 1] - ed[i])/2*x for i in range(npan)])
    wr = np.concatenate([(ed[i + 1] - ed[i])/2*w for i in range(npan)])*2*r*np.exp(-r*r)
    th = (np.arange(nth) + 0.5)*2*np.pi/nth
    Rm, TH = np.meshgrid(r, th, indexing='ij')
    return (Rm*np.exp(1j*TH)).ravel(), np.repeat(wr, nth)/nth

def profiles(rec, s, z, w):
    T = np.abs(z)**2
    e11, e20, e32 = T - 1, z*z/np.sqrt(2), z*(T*T - 6*T + 6)/np.sqrt(12)
    L = z*(rec['l'] + rec['beta']*(T - 2)) + rec['nu5']*e32
    D = 1 - rec['bA']*e11 - rec['bB']*e20
    Ap, Am = L + s*D, L - s*D
    dph = Ap/np.abs(Ap) - Am/np.abs(Am)
    return (float(w @ (np.abs(Ap) + np.abs(Am))), float(np.real(w @ (np.conj(e11)*dph))),
            float(np.real(w @ (np.conj(e20)*dph))), float(np.real(w @ dph)))

if __name__ == '__main__':
    tab = json.load(open(sys.argv[1])); rec = tab['row']
    S = np.array(tab['S']); z, w = rule()
    worst = 0.0
    for s in ([float(x) for x in sys.argv[2:]] or [0.05, 0.1, 0.3, 1.0, 3.0]):
        i = int(np.argmin(np.abs(S - s))); own = profiles(rec, S[i], z, w)
        stored = (tab['psi'][i], tab['GA'][i], tab['GB'][i], tab['G0'][i])
        err = max(abs(a - b) for a, b in zip(own, stored)); worst = max(worst, err)
        print('t = %s  s = %.6f  psi %.8f  Gamma_A %+.8f  Gamma_B %+.8f  Gamma_0 %+.8f   largest difference from the table %.1e'
              % (tab['t'], S[i], *own, err))
    print('largest difference: %.1e' % worst)
