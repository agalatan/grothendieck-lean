"""One-coordinate Jensen bound on all of H_{2,1}(C^2): sup over cubics of min over directions (label N).

ratio_phi(t) = min_e E_r phi(Vbar_e(r)) / B_phi(u).   ratio < 1 proves D_phi(q) > 0 by Theorem H' (REPORT section 5).
Inner minimum: grid on CP^1 (e = (cos a, sin a e^{ib})) + local polish.  Outer: random sampling, then Nelder-Mead from the worst samples.
usage: t08b_onecoord_n2.py <profile: sqrt | peak:<u> | buf:<s2>> <nrandom> <nlocal> <seed>
"""
import sys, os, math, time, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import optimize, special
from scipy.interpolate import CubicSpline
from dslib import normalise, random_tensor, tensor_from_params, SqrtProfile, peak_profile, buffer_profile
from hyper import *

def make(spec):
    if spec == 'sqrt':
        return (lambda v: np.sqrt(v)), (lambda u: G0 * math.sqrt(u)), 1.0
    k, v = spec.split(':'); v = float(v)
    if k == 'buf':
        sg = math.sqrt(v)
        phi = lambda x: sg * SQPI * ((1 + x / v) * special.ive(0, x / v / 2) + x / v * special.ive(1, x / v / 2))
        return phi, (lambda u: SQPI * math.sqrt(v + u)), 1.0
    if k == 'peak':
        p = peak_profile(v)
        return p.phi, (lambda u, p=p: p.B), v
G0 = SQPI / 2
AA, BB = np.meshgrid(np.linspace(0, np.pi / 2, 25), np.linspace(0, 2 * np.pi, 33)[:-1], indexing='ij')
EGRID = np.stack([np.cos(AA).ravel() + 0j, (np.sin(AA) * np.exp(1j * BB)).ravel()], axis=1)

def coeffs_many(t, E):
    """profile coefficients for many unit vectors E (m,2) at once (n = 2): second basis vector f = (-conj(e1), conj(e0))."""
    F = np.stack([-np.conj(E[:, 1]), np.conj(E[:, 0])], axis=1)
    def comp(a, b, c):   # t'(a,b,c) with slots: a,b holomorphic vectors, c antiholomorphic
        return np.einsum('ijk,mi,mj,mk->m', t, a, b, np.conj(c), optimize=True)
    t000 = comp(E, E, E); t001 = comp(E, E, F); t010 = comp(E, F, E); t011 = comp(E, F, F); t110 = comp(F, F, E); t111 = comp(F, F, F)
    A = abs(t000) ** 2; B = abs(t001) ** 2; L2 = 4 * abs(t010) ** 2; C = 4 * abs(t011) ** 2 + 2 * abs(t110) ** 2; R2 = 2 * abs(t111) ** 2
    return A, B, C, L2, R2

def inner(t, phi, Bu):
    A, B, C, L2, R2 = coeffs_many(t, EGRID)
    r = R_NODES[None, :]
    V = r * (A[:, None] * (r - 2) ** 2 + B[:, None] * r + C[:, None]) + L2[:, None] * (r - 1) ** 2 + R2[:, None]
    vals = (phi(V) * R_W[None, :]).sum(axis=1)
    i = int(np.argmin(vals))
    a0, b0 = AA.ravel()[i], BB.ravel()[i]
    def f(p):
        e = np.array([[math.cos(p[0]) + 0j, math.sin(p[0]) * np.exp(1j * p[1])]])
        cf = [c[0] for c in coeffs_many(t, e)]
        return jensen_value(cf, phi)
    res = optimize.minimize(f, [a0, b0], method='Nelder-Mead', options=dict(xatol=1e-7, fatol=1e-12, maxiter=400))
    return min(res.fun, vals[i]) / Bu, res.x

if __name__ == '__main__':
    spec = sys.argv[1]; nrand = int(sys.argv[2]); nloc = int(sys.argv[3]); seed = int(sys.argv[4])
    phi, Bfun, u = make(spec); Bu = Bfun(u)
    rng = np.random.default_rng(seed)
    t0 = time.time(); samples = []
    for i in range(nrand):
        p = rng.standard_normal(16)
        if i % 4 == 1: p *= rng.random(16) < 0.4      # sparse tensors
        t = normalise(tensor_from_params(p, 2), u)
        samples.append((inner(t, phi, Bu)[0], p))
    samples.sort(key=lambda s: -s[0])
    vals = np.array([s[0] for s in samples])
    print(f'{spec}: {nrand} random cubics: ratio mean {vals.mean():.4f} max {vals.max():.5f} fraction >= 1: {np.mean(vals >= 1):.4f} ({time.time()-t0:.0f}s)', flush=True)
    best = samples[0]
    for k in range(nloc):
        p0 = samples[k][1]
        f = lambda p: -inner(normalise(tensor_from_params(p, 2), u), phi, Bu)[0]
        r = optimize.minimize(f, p0, method='Nelder-Mead', options=dict(maxiter=4000, xatol=1e-5, fatol=1e-9, adaptive=True))
        t = normalise(tensor_from_params(r.x, 2), u); v, ex = inner(t, phi, Bu)
        e = np.array([[math.cos(ex[0]) + 0j, math.sin(ex[0]) * np.exp(1j * ex[1])]])
        print(f'  local search {k}: start {samples[k][0]:.5f} -> sup_t min_e ratio >= {v:.6f}; (A,B,C,L2,R2)/u at best e: {np.round(np.array([c[0] for c in coeffs_many(t, e)])/u, 4)} ({time.time()-t0:.0f}s)', flush=True)
        if v > best[0]: best = (v, r.x)
        json.dump(dict(spec=spec, val=best[0], p=list(map(float, best[1]))), open(f'onecoord_n2_{spec.replace(":", "")}_{seed}.json', 'w'))
    print('BEST', best[0])
