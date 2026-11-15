"""k5_sigma.py: the sigma-profile of the Gaussian ideal at a row (nu5 fixed at d5k's value): Monte Carlo (d = 1 machinery of k5_attack.py,
common samples, differences to the first point with s.e.) against d5k's quadrature at several angular resolutions.
usage: k5_sigma.py row nfresh chunk sig1,sig2,..."""
import sys, math, time, numpy as np
row, nfresh, chunk = sys.argv[1], int(sys.argv[2]), int(sys.argv[3]); sigs = [float(v) for v in sys.argv[4].split(',')]
sys.argv = ['k5_attack.py', '1', '0', '--row', row]
exec(open('k5_attack.py').read().split('# ---------------------------------------------------------------- self test')[0])
import kmodel
def build(NR, NP_, NT):
    r, wr = kmodel.gl(0, 5.5, NR, 6); w1 = wr*2*r*np.exp(-r*r); w1 /= w1.sum(); p, wp = kmodel.gl(0, 5.0, NP_, 6); w2 = wp*2*p*np.exp(-p*p); w2 /= w2.sum(); th = (np.arange(NT)+0.5)*2*np.pi/NT
    R, P, TH = np.meshgrid(r, p, th, indexing='ij'); Wt = (w1[:, None, None]*w2[None, :, None]*np.ones(NT)/NT).ravel(); z = (R*np.exp(1j*TH)).ravel(); W = P.ravel().astype(complex); U = np.abs(z)**2
    H21 = z*(U-2)/S2; H32 = z*(U*U-6*U+6)/np.sqrt(12); MA = W*(U-1); MB = np.conj(W)*z*z/S2; L = ELL*z + BETA*S2*H21; C1 = BA*MA + BB*MB
    def value(sig, nu5):
        G3 = sig*W; G5 = nu5*H32; C = sig*C1
        return Wt@(np.abs(L+G5+G3-C) + np.abs(L+G5-G3+C)) - sig*sig/E1 + sig*sig*(BA*BA + BB*BB)/ETA - nu5*nu5/ETA
    return value
quads = {f'{NR}x{NP_}x{NT}': build(NR, NP_, NT) for (NR, NP_, NT) in ((10, 6, 48), (10, 6, 192), (16, 10, 768))}
g = np.random.default_rng(4242); nch = nfresh // chunk; acc = [[] for _ in sigs]; t0 = time.time()
for c in range(nch):
    Bc, auxc = sample(chunk, g)
    for i, s in enumerate(sigs):
        a = np.zeros(M, complex); a[I_W] = s; a[I_H32] = NU50; acc[i].append(lam_and_grad(a, Bc, auxc, grad=False)[0])
ref = np.array(acc[0])
print(f'row {row} (nu5 = {NU50}): sigma-profile, MC {nfresh:,} samples vs quadrature  [{time.time()-t0:.0f}s]')
print(f'{"sigma":>7s} {"MC value":>11s} {"diff to first":>14s} {"s.e.":>8s} | ' + ' | '.join(f'{k:>12s} {"diff":>10s}' for k in quads))
for i, s in enumerate(sigs):
    v = np.array(acc[i]); dd = v - ref; se = dd.std(ddof=1)/math.sqrt(nch) if i else 0.0
    qs = [(q(s, NU50), q(s, NU50) - q(sigs[0], NU50)) for q in quads.values()]
    print(f'{s:7.4f} {v.mean():11.7f} {dd.mean():+14.3e} {se:8.1e} | ' + ' | '.join(f'{a:12.7f} {b:+10.3e}' for a, b in qs))
