"""k5_verify.py: the Monte-Carlo evaluator of k5_attack.py (d = 1: z1 plus the diffuse drivers = d5k's Gaussian family) against d5k's
quadrature (d5k_ref.py, grid 10x6x48) at several points of the family, on common samples: values and differences to the first point.
usage: k5_verify.py row nfresh chunk"""
import sys, math, time, numpy as np
row, nfresh, chunk = sys.argv[1], int(sys.argv[2]), int(sys.argv[3])
sys.argv = ['k5_attack.py', '1', '99', '--row', row]
exec(open('k5_attack.py').read().split('# ---------------------------------------------------------------- self test')[0])
sys.argv = ['d5k_ref.py', row, '10', '6', '48']; import d5k_ref
pts = {'P0 d5k argmax (sig0,nu5)': [SIG0, 0, NU50, 0, 0, 0], 'P1 nu5=0': [SIG0, 0, 0, 0, 0, 0], 'P2 sigma=0.20': [0.20, 0, NU50, 0, 0, 0],
       'P3 sigma=0.30': [0.30, 0, NU50, 0, 0, 0], 'P4 sigma5=0.10': [SIG0, 0, NU50, 0, 0, 0.10], 'P5 a=0.10': [SIG0, 0, NU50, 0.10, 0, 0],
       'P6 b=0.10': [SIG0, 0, NU50, 0, 0.10, 0], 'P7 nu3=0.05': [SIG0, 0.05, NU50, 0, 0, 0], 'P8 G=0': [0, 0, 0, 0, 0, 0], 'P9 sigma5=0.20 only': [0, 0, 0, 0, 0, 0.20],
       'P10 nu5=0.0408i': [SIG0, 0, 1j*NU50, 0, 0, 0]}
def coef(q):
    a = np.zeros(M, complex); a[I_W], a[I_H21], a[I_H32], a[I_MA], a[I_MB], a[I_W5] = q; return a
quad = {k: (d5k_ref.value([abs(v) if i == 2 else v for i, v in enumerate(q)]) if abs(q[2].imag if isinstance(q[2], complex) else 0) == 0 else float('nan')) for k, q in pts.items()}
g = np.random.default_rng(2026); nch = nfresh // chunk; acc = {k: [] for k in pts}; t0 = time.time()
for c in range(nch):
    Bc, auxc = sample(chunk, g)
    for k, q in pts.items(): acc[k].append(lam_and_grad(coef(q), Bc, auxc, grad=False)[0])
ref = np.array(acc['P0 d5k argmax (sig0,nu5)'])
print(f'row {row}: MC {nfresh:,} samples ({nch} chunks) vs quadrature 10x6x48  [{time.time()-t0:.0f}s]')
print(f'{"point":28s} {"MC value":>11s} {"s.e.":>8s} {"quadrature":>11s} {"MC-quad":>9s} | {"MC diff to P0":>13s} {"s.e.":>8s} {"quad diff":>10s} {"MC-quad":>9s}')
for k, q in pts.items():
    v = np.array(acc[k]); m = v.mean(); se = v.std(ddof=1)/math.sqrt(nch); dd = v - ref; dm = dd.mean(); dse = dd.std(ddof=1)/math.sqrt(nch) if k != 'P0 d5k argmax (sig0,nu5)' else 0.0
    qd = quad[k] - quad['P0 d5k argmax (sig0,nu5)']
    print(f'{k:28s} {m:11.7f} {se:8.1e} {quad[k]:11.7f} {m-quad[k]:+9.1e} | {dm:+13.3e} {dse:8.1e} {qd:+10.3e} {dm-qd:+9.1e}')
