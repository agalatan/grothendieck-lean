"""How far does the one-coordinate Jensen bound go?  (label N)

For the sqrt profile:  best_e(q) = min over unit e of E_r sqrt(Vbar_e(r)) / (sqrt(pi)/2 sqrt(u)).   best_e < 1 proves E|q| < (sqrt(pi)/2)||q||.
(1) statistics over random cubics in n = 2, 3, 4;  (2) adversarial search: maximise best_e over cubics.
usage: t08_onecoord.py <n> <nrandom> <nadv> <seed>
"""
import sys, os, math, time, json
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from scipy import optimize
from dslib import normalise, random_tensor, tensor_from_params, t_sum_monomials, t_monomial, t_item5, t_cyclic
from hyper import *

G0 = SQPI / 2

def ratio(t, e):
    return jensen_value(profile_coeffs(t, e), np.sqrt) / G0

def best_e(t, rng, nstart=8, e0=None):
    n = t.shape[0]
    f = lambda p: ratio(t, p[:n] + 1j * p[n:])
    best = (9, None)
    starts = ([e0] if e0 is not None else []) + [rng.standard_normal(2 * n) for _ in range(nstart)]
    for p0 in starts:
        r = optimize.minimize(f, p0, method='BFGS', options=dict(gtol=1e-7, maxiter=200))
        if r.fun < best[0]: best = (r.fun, r.x)
    return best

if __name__ == '__main__':
    n = int(sys.argv[1]); nrand = int(sys.argv[2]); nadv = int(sys.argv[3]); seed = int(sys.argv[4])
    rng = np.random.default_rng(seed)
    print('checks: monomial, e = X:', ratio(normalise(t_monomial(2)), [1, 0]), ' (C-S bound sqrt(7/8) =', math.sqrt(7 / 8), '; true 0.7795)')
    print('        H(X)+H(Y), e = (1,1)/sqrt2:', ratio(normalise(t_sum_monomials(2)), [1, 1]), ' true E|q|/G0 = 0.7977')
    print('        item-5 cubic, e = X:', ratio(normalise(t_item5(1j)), [1, 0]), ' true 0.8351')
    vals = []
    t0 = time.time()
    for i in range(nrand):
        t = normalise(random_tensor(n, rng))
        vals.append(best_e(t, rng)[0])
    if vals:
        vals = np.array(vals)
        print(f'n={n}: {nrand} random cubics: min_e Jensen ratio: mean {vals.mean():.4f}, max {vals.max():.4f}, fraction >= 1: {np.mean(vals >= 1):.3f}  ({time.time()-t0:.0f}s)', flush=True)
    # adversarial: maximise over t the inner minimum (Nelder-Mead on t with warm-started inner minimisation)
    m = n ** 3
    for k in range(nadv):
        p = rng.standard_normal(2 * m)
        state = {'e': None}
        def outer(p):
            t = normalise(tensor_from_params(p, n))
            v, e = best_e(t, rng, nstart=4, e0=state['e'])
            state['e'] = e
            return -v
        r = optimize.minimize(outer, p, method='Nelder-Mead', options=dict(maxiter=1500, xatol=1e-4, fatol=1e-7))
        t = normalise(tensor_from_params(r.x, n)); v, e = best_e(t, rng, nstart=24)
        print(f'n={n} adversarial start {k}: sup_t min_e Jensen ratio >= {v:.5f}   coefficients (A,B,C,L2,R2) at the best e: {np.round(profile_coeffs(t, e[:n] + 1j*e[n:]), 4)}  ({time.time()-t0:.0f}s)', flush=True)
        json.dump(dict(t_re=t.real.tolist(), t_im=t.imag.tolist(), val=v), open(f'onecoord_adv_n{n}_{seed}_{k}.json', 'w'))
