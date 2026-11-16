# Structure of the W3-model best responses at a game lam [N]: generator h_f = T g by sector, sign-flip test,
# kernel coefficients, energies.  Usage: python structure.py K 'lam' n1,n2 [nstarts]
import sys, json, numpy as np
sys.path.insert(0, __import__('os').path.dirname(__import__('os').path.abspath(__file__)))
from gm import *
from richer import build

def main():
    K = int(sys.argv[1]); lam = json.loads(sys.argv[2]); n1, n2 = (int(x) for x in sys.argv[3].split(','))
    ns = int(sys.argv[4]) if len(sys.argv) > 4 else 16
    M = build(['W3'], K, n1, n2); rng = np.random.default_rng(7); res = []
    for s in range(ns):
        sc = [0.3, 1.0, 3.0][s % 3]
        c0 = sc * (rng.normal(size=M.nb) + 1j * rng.normal(size=M.nb)); c0[0] += 2
        res.append(alternate(M, lam, c0, iters=3000, tol=1e-14))
    vals = sorted(r['value'] for r in res)[::-1]
    print('K', K, 'lam', lam, 'grid', n1, n2, 'nb', M.nb)
    print('values of', ns, 'random starts (distinct):', sorted(set(round(v, 8) for v in vals))[::-1])
    best = max(res, key=lambda r: r['value'])
    cf, cg = best['cf'], best['cg']
    # normalise the phase so that the z coefficient is real positive
    ph0 = cf[0] / abs(cf[0]); cf = cf / ph0; cg = cg / (cg[0] / abs(cg[0]))
    flip = np.array([(-1) ** (sum(cmb[1])) for (k, cmb) in M.basis])   # W -> -W multiplies H_{c,d}(W) by (-1)^{c+d}
    print('value', best['value'], ' 1/v', 1 / best['value'])
    print('pair coefficients c_k:', np.round(best['c'], 7))
    print('|| h_g - flip(h_f) || / ||h_f|| =', np.linalg.norm(cg - flip * cf) / np.linalg.norm(cf),
          '   || h_g - h_f || / ||h_f|| =', np.linalg.norm(cg - cf) / np.linalg.norm(cf))
    print('energies ||P_k f||^2:', np.round(M.energies(best['fhat']), 6), ' ||P_k g||^2:', np.round(M.energies(best['ghat']), 6))
    print('generator h_f = T g (coefficient / coefficient of z), by sector  [basis: (k, ((a,b) of z, (c,d) of W))]')
    for (k, cmb), a in zip(M.basis, cf):
        if abs(a) > 2e-3 * abs(cf[0]):
            (za, zb), (wc, wd) = cmb
            name = f'H{za}{zb}(z)' + (f'*H{wc}{wd}(W)' if wc + wd else '')
            print(f'   k={k}  {name:22s} {a.real / abs(cf[0]):+.5f}{a.imag / abs(cf[0]):+.5f}i')
    # sector energies of f
    sec = {}
    for (k, cmb), a in zip(M.basis, best['fhat']):
        d = sum(cmb[1]); sec[(k, d)] = sec.get((k, d), 0) + abs(a) ** 2
    print('energy of f by (k, W-degree):', {f'k{k}/W{d}': round(v, 6) for (k, d), v in sorted(sec.items())})

if __name__ == '__main__':
    main()
