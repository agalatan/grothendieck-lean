"""k5_eval.py: re-evaluate the saved candidates of a k5_attack.py run on fresh common samples, pairwise against d5k's exact Gaussian argmax (G)
and against the sample-fitted Gaussian point (S), with chunk-level standard errors.   usage: k5_eval.py <cands.npz> d row diffuse nfresh chunk [seed]"""
import sys, math, time, numpy as np
npz, d_, row, diffuse, nfresh, chunk = sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], int(sys.argv[5]), int(sys.argv[6]); seed = int(sys.argv[7]) if len(sys.argv) > 7 else 777
sys.argv = ['k5_attack.py', d_, '0', '--row', row, '--diffuse', diffuse]
exec(open('k5_attack.py').read().split('# ---------------------------------------------------------------- self test')[0])
Z = np.load(npz); assert list(Z['labels']) == [r.label for r in RECIPES], 'basis mismatch'
cands = [('G: d5k exact argmax', gauss_point()), ('S: sample-fitted ideal', Z['aS'])] + [(k, Z[k]) for k in Z.files if k.startswith('cand') or k.startswith('pol')]
g = np.random.default_rng(seed); nch = nfresh // chunk; acc = [[] for _ in cands]; t0 = time.time()
for c in range(nch):
    Bc, auxc = sample(chunk, g)
    for i, (_, a) in enumerate(cands): acc[i].append(lam_and_grad(a, Bc, auxc, grad=False)[0])
accG = np.array(acc[0]); accS = np.array(acc[1])
print(f'{npz} d={d} row={row} diffuse={diffuse}: fresh {nfresh:,} samples ({nch} chunks), seed {seed}; G = {accG.mean():.7f} +- {accG.std(ddof=1)/math.sqrt(nch):.1e} (row {CONST+accG.mean():.6f}) [{time.time()-t0:.0f}s]')
for i, (name, a) in enumerate(cands):
    v = np.array(acc[i]); dG = v - accG; dS = v - accS
    seG = dG.std(ddof=1)/math.sqrt(nch) if i else 0.0; seS = dS.std(ddof=1)/math.sqrt(nch) if i != 1 else 0.0
    print(f'  {name:26s}: Lambda5 = {v.mean():.7f}  vs G = {dG.mean():+.3e} +- {seG:.1e}  vs S = {dS.mean():+.3e} +- {seS:.1e}   |W|={abs(a[I_W]):.4f} nu5={abs(a[I_H32]):.4f} |W5|={abs(a[I_W5]):.4f} shells: { {k: v for k, v in shells(a).items() if v > 1e-5} }')
