"""k5_decomp.py: decompose a saved candidate by shells on fresh common samples: value of the candidate restricted to groups of shells,
and leave-one-shell-out, all as differences to d5k's exact Gaussian argmax G with chunk-level s.e.
usage: k5_decomp.py <cands.npz> d row diffuse nfresh chunk [key]"""
import sys, math, time, numpy as np
npz, d_, row, diffuse, nfresh, chunk = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], int(sys.argv[5]), int(sys.argv[6]); key = sys.argv[7] if len(sys.argv) > 7 else 'cand0'
sys.argv = ['k5_attack.py', d_, '0', '--row', row, '--diffuse', diffuse]
exec(open('k5_attack.py').read().split('# ---------------------------------------------------------------- self test')[0])
Z = np.load(npz); assert list(Z['labels']) == [r.label for r in RECIPES]; cand = Z[key]
def restrict(mask): a = cand.copy(); a[~mask] = 0; return a
variants = [('G (d5k exact argmax)', gauss_point()), ('full candidate', cand), ('ideal-6 part only', restrict(IDEAL)), ('ideal-6 + remote junta q', restrict(IDEAL | MQ)),
            ('ideal-6 + all cubic', restrict(IDEAL | M3)), ('ideal-6 + q + all quintic', restrict(IDEAL | MQ | M5))]
mass = {}
for t in range(M):
    if not IDEAL[t]: mass[SHELL[t]] = mass.get(SHELL[t], 0.0) + abs(cand[t])**2
for sh, m_ in sorted(mass.items()):
    if m_ > 1e-7:
        mask = np.array([SHELL[t] != sh or IDEAL[t] for t in range(M)]); variants.append((f'full minus shell {sh[0]}:({sh[1]},{sh[2]}) [|a|^2={m_:.1e}]', restrict(mask)))
if d == 2:
    a = np.zeros(M, complex); a[find(3, (0, 2), (0, 1), None)] = 0.065; a[I_H32] = NU50; variants.append(('junta c=0.065 H21(z2) + nu5 (quadrature: -8.0e-5 vs q=0)', a))
    a = np.zeros(M, complex); a[I_H32] = NU50; variants.append(('q = 0, nu5 = d5k', a))
g = np.random.default_rng(31337); nch = nfresh // chunk; acc = [[] for _ in variants]; t0 = time.time()
for c in range(nch):
    Bc, auxc = sample(chunk, g)
    for i, (_, a) in enumerate(variants): acc[i].append(lam_and_grad(a, Bc, auxc, grad=False)[0])
G_ = np.array(acc[0])
print(f'{npz} [{key}] d={d} row={row}: fresh {nfresh:,} samples; differences to G with s.e.  [{time.time()-t0:.0f}s]')
print(f'  candidate: |W|={abs(cand[I_W]):.4f} nu5={abs(cand[I_H32]):.4f} |W5|={abs(cand[I_W5]):.4f} |a|={abs(cand[I_MA]):.4f} |b|={abs(cand[I_MB]):.4f} nu3={abs(cand[I_H21]):.4f}; shells {shells(cand)}')
for i, (name, a) in enumerate(variants):
    dd = np.array(acc[i]) - G_; se = dd.std(ddof=1)/math.sqrt(nch) if i else 0.0
    print(f'  {name:62s}: {dd.mean():+.3e} +- {se:.1e}')
