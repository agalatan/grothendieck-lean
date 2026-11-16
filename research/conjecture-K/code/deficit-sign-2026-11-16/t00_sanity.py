"""Sanity checks of dslib (label N): moments, Theorem 5 (T1+T2 = D), item 5 of STATUS section 13, item 11.6."""
import sys, os, math, time
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import integrate, special
from dslib import *

np.set_printoptions(linewidth=200)

def one_var_reference(prof):
    """Wick monomial by 1-D adaptive quadrature in r = |X|^2 (u = prof.u)."""
    u = prof.u
    V = lambda r: u * r * (r - 2) ** 2 / 2
    pts = [0, .5, 1, 1.5, 2, 2.5, 3, 4, 6, 8, 12, 20, 45]
    Er = lambda f: sum(integrate.quad(lambda r: f(r) * math.exp(-r), a, b, limit=400, epsabs=1e-15, epsrel=1e-13)[0]
                       for a, b in zip(pts[:-1], pts[1:]))
    f1 = lambda v: float(prof.phi(np.array([v]))[0])
    kp = lambda v: float(prof.Kp(np.array([v]))[0])
    gp = lambda v: float(prof.gp(np.array([v]))[0])
    D = prof.B - Er(lambda r: f1(V(r)))
    T1 = -Er(lambda r: (u * r * r / 2 - u) * kp(V(r)))
    T2 = Er(lambda r: u * u * r * r * (r - 1) * (r - 2) ** 2 / 2 * gp(V(r)))
    return D, T1, T2

if __name__ == '__main__':
    t0 = time.time()
    g2 = Grid(2, PANELS_MED, 6, 24)
    g2f = Grid(2, PANELS_FINE, 8, 48)
    print('grid sizes', g2.W.size, g2f.W.size, 'sum of weights', g2.W.sum(), g2f.W.sum())
    rng = np.random.default_rng(1)
    profs = [SqrtProfile(1.0), ExpProfile(1.0), ExpProfile(30.0), buffer_profile(0.25), buffer_profile(4.0)]
    # moments on a random cubic
    t = normalise(random_tensor(2, rng))
    for g in (g2, g2f):
        print('random cubic moments', moments(g, t))
    # Theorem 2 identities: cov(c2,V) and E q^2 a >= 0, delta = E q2a + 2 cov(c2,V)
    m = moments(g2f, t); print('delta - (Eq2a + 2cov) =', m['delta'] - m['Eq2a'] - 2 * m['cov_c2V'])
    # monomial vs 1-D reference
    tm = normalise(t_monomial(2))
    for prof in profs:
        ref = one_var_reference(prof)
        for g, lab in ((g2, 'med'), (g2f, 'fine')):
            r = split(g, tm, prof)
            print(f"{prof.name:16s} {lab:5s} D={r['D']:+.8f} T1={r['T1']:+.8f} T2={r['T2']:+.8f} T1+T2-D={r['T1']+r['T2']-r['D']:+.2e} | 1-D ref D={ref[0]:+.8f} T1={ref[1]:+.8f} T2={ref[2]:+.8f} sum-D={ref[1]+ref[2]-ref[0]:+.1e}")
    # peak profile on the monomial, u = 0.0463
    for u in (0.0463, 0.02):
        pk = peak_profile(u)
        tmu = normalise(t_monomial(2), u)
        ref = one_var_reference(pk)
        r = split(g2f, tmu, pk)
        print(f"{pk.name:16s} fine  D={r['D']:+.8e} T1={r['T1']:+.8e} T2={r['T2']:+.8e} T1+T2-D={r['T1']+r['T2']-r['D']:+.2e} | 1-D ref D={ref[0]:+.8e} T1={ref[1]:+.8e} T2={ref[2]:+.8e} sum-D={ref[1]+ref[2]-ref[0]:+.1e};  D/delta={r['D']/(42*u*u):.4f} (package mono.log: 0.1287 at u=0.0463)")
    # item 5: E exp(-30|H|^2) < 1/31, H = X[(|X|^2-2)+i(|Y|^2-1)]/sqrt3
    t5 = normalise(t_item5(1j))
    for g, lab in ((g2, 'med'), (g2f, 'fine')):
        V, c1, c2, rhoV = stein_fields(t5, g.Y)
        print(f'item 5 [{lab}]: E|H|^2 = {g.E(V):.10f}; E exp(-30 V) = {g.E(np.exp(-30*V)):.8f} vs 1/31 = {1/31:.8f}')
    # exact 2-D quadrature for item 5: V = T[(T-2)^2 + (S-1)^2]/3
    val = integrate.dblquad(lambda S, T: math.exp(-10 * T * ((T - 2) ** 2 + (S - 1) ** 2) - T - S), 0, 40, 0, 40, epsabs=1e-12, epsrel=1e-10)[0]
    print(f'item 5 [2-D adaptive]: E exp(-30 V) = {val:.10f}; minus 1/31 = {val-1/31:+.3e}')
    for lam in (1, 3, 10, 30, 100, 300):
        r = split(g2f, t5, ExpProfile(float(lam)))
        print(f"  item-5 cubic, exp profile lam={lam:4d}: D_lam = {r['D']:+.3e}  T1 = {r['T1']:+.3e}  T2 = {r['T2']:+.3e}  (T1+T2-D = {r['T1']+r['T2']-r['D']:+.1e})")
    # item 11.6: Re E[exp(-|q|^2) conj(q)^2 a] < -1/50 for q = X[5(|X|^2-2)+6i(|Y|^2-1)]/sqrt(86)
    t116 = normalise(t_item5(6j / 5))
    V, c1, c2, rhoV = stein_fields(t116, g2f.Y)
    print('item 11.6: u =', g2f.E(V), ' Re E[exp(-V) conj(q)^2 a] =', g2f.E(np.exp(-V) * rhoV), '(claimed < -1/50)')
    for prof in profs:
        r = split(g2f, t116, prof)
        print(f"  11.6 cubic {prof.name:16s}: D={r['D']:+.6e} T1={r['T1']:+.6e} T2={r['T2']:+.6e} err={r['T1']+r['T2']-r['D']:+.1e}")
    print('time', time.time() - t0)
