"""E4: attack Conjecture K with FULL tensors in d complex coordinates (z1 + d-1 ordinary) plus a diffuse Gaussian W.
Lambda(G) = E|L+G| + E|L-G| - ||G||^2/eps,  L = z1 (ell + beta(|z1|^2-2)),  G in H_{2,1}(C^d) + C.W.
Wick basis :w_i w_j conj(w_k): (i<=j), exact norms 1+delta_ij; W has norm 1.  Wirtinger ascent with common random numbers;
candidates re-evaluated with many samples against S = sup_sigma Lambda(sigma W) on the SAME samples.
usage: e4_kattack.py d eps ell beta seed [nopt] [starts]"""
import numpy as np, math, sys, time
d = int(sys.argv[1]); eps = float(sys.argv[2]); ell = float(sys.argv[3]); beta = float(sys.argv[4]); seed = int(sys.argv[5])
nopt = int(sys.argv[6]) if len(sys.argv) > 6 else 1_000_000
nstarts = int(sys.argv[7]) if len(sys.argv) > 7 else 10
rng = np.random.default_rng(seed)
idx = [(i, j, k) for i in range(d) for j in range(i, d) for k in range(d)]
M = len(idx) + 1                                    # + W
D = np.array([1.0 + (1.0 if i == j else 0.0) for (i, j, k) in idx] + [1.0])   # exact squared norms of the basis
def sample(n, g):
    Z = (g.standard_normal((n, d)) + 1j*g.standard_normal((n, d)))/math.sqrt(2)
    W = (g.standard_normal(n) + 1j*g.standard_normal(n))/math.sqrt(2)
    B = np.empty((n, M), complex)
    for t, (i, j, k) in enumerate(idx):
        v = Z[:, i]*Z[:, j]*np.conj(Z[:, k])
        if k == i: v = v - Z[:, j]
        if k == j: v = v - Z[:, i]
        B[:, t] = v
    B[:, -1] = W
    u = np.abs(Z[:, 0])**2
    L = Z[:, 0]*(ell + beta*(u - 2))
    return B, L
def lam_and_grad(a, B, L):
    G = B @ a; p = L + G; m = L - G
    ap = np.abs(p); am = np.abs(m)
    php = p/np.maximum(ap, 1e-300); phm = m/np.maximum(am, 1e-300)
    val = np.mean(ap) + np.mean(am) - float(np.sum(D*np.abs(a)**2))/eps
    grad = (B.conj().T @ (php - phm))/(2*B.shape[0]) - D*a/eps
    return val, grad
def lam_only(a, B, L):
    G = B @ a; return np.mean(np.abs(L + G)) + np.mean(np.abs(L - G)) - float(np.sum(D*np.abs(a)**2))/eps
# S on the optimisation sample: 1-D search over sigma (W only)
B, L = sample(nopt, rng)
def S_of(B, L):
    best = (-1, 0)
    for s in np.linspace(0.12, 0.30, 37):
        a = np.zeros(M, complex); a[-1] = s; v = lam_only(a, B, L)
        if v > best[0]: best = (v, s)
    # refine
    s0 = best[1]
    for s in np.linspace(s0 - 0.005, s0 + 0.005, 21):
        a = np.zeros(M, complex); a[-1] = s; v = lam_only(a, B, L)
        if v > best[0]: best = (v, s)
    return best
S, sig = S_of(B, L)
print(f"d={d} eps={eps} (ell,beta)=({ell},{beta}) seed={seed} nopt={nopt}: S(sample) = {S:.7f} at sigma = {sig:.4f}; basis size {M}", flush=True)
results = []
t0 = time.time()
for st in range(nstarts):
    a = np.zeros(M, complex)
    kind = st % 5
    if kind == 0:    # Gaussian point + small random mixed tensor
        a[-1] = sig; a[:-1] = 0.05*(rng.standard_normal(M-1) + 1j*rng.standard_normal(M-1))/math.sqrt(M-1)*math.sqrt(2)
    elif kind == 1:  # pure random tensor, no W
        a[:-1] = (rng.standard_normal(M-1) + 1j*rng.standard_normal(M-1)); a *= 0.2/math.sqrt(np.sum(D*np.abs(a)**2))
    elif kind == 2:  # the L4-counterexample structure: i*c*z1*(|z_j|^2-1) summed, plus W
        for t, (i, j, k) in enumerate(idx):
            if i == 0 and j == k and j > 0: a[t] = 0.12j/math.sqrt(d-1)
        a[-1] = 0.15
    elif kind == 3:  # junta cubic in one ordinary coordinate + W (known near-maximiser family)
        for t, (i, j, k) in enumerate(idx):
            if i == j == k == 1: a[t] = 0.08
        a[-1] = 0.17; a[:-1] += 0.02*(rng.standard_normal(M-1) + 1j*rng.standard_normal(M-1))/math.sqrt(M-1)
    else:            # random tensor of comparable influence in all ordinary coords, moderate W
        a[:-1] = (rng.standard_normal(M-1) + 1j*rng.standard_normal(M-1)); a[:-1] *= 0.12/math.sqrt(np.sum(D[:-1]*np.abs(a[:-1])**2)); a[-1] = 0.12
    v, g = lam_and_grad(a, B, L); lr = 0.05
    for it in range(400):
        a2 = a + lr*g; v2, g2 = lam_and_grad(a2, B, L)
        if v2 > v: a, v, g = a2, v2, g2; lr = min(lr*1.15, 0.5)
        else: lr *= 0.5
        if lr < 1e-7: break
    mixed = math.sqrt(float(np.sum(D[:-1]*np.abs(a[:-1])**2)))
    results.append((v, a.copy()))
    print(f"  start {st:2d} (kind {kind}): Lambda = {v:.7f}  excess over S = {v-S:+.2e}  |W|={abs(a[-1]):.4f} |tensor|={mixed:.4f}  [{time.time()-t0:.0f}s]", flush=True)
# re-evaluate the top 3 and the Gaussian point on fresh large samples (chunked), common random numbers
results.sort(key=lambda r: -r[0])
nfresh = 20_000_000; chunk = 2_000_000; g2 = np.random.default_rng(seed + 1000)
acc = np.zeros(4); accS = 0.0; aS = np.zeros(M, complex); aS[-1] = sig
sq = np.zeros(4)
for c in range(nfresh // chunk):
    Bc, Lc = sample(chunk, g2)
    vS = lam_only(aS, Bc, Lc); accS += vS
    for r in range(min(3, len(results))):
        v = lam_only(results[r][1], Bc, Lc); acc[r] += v; sq[r] += (v - vS)**2
nch = nfresh // chunk
print(f"fresh {nfresh:,} samples: S = {accS/nch:.7f}")
for r in range(min(3, len(results))):
    diff = acc[r]/nch - accS/nch
    se = math.sqrt(max(sq[r]/nch - diff**2, 0)/nch)
    print(f"  candidate {r}: Lambda = {acc[r]/nch:.7f}  Lambda - S = {diff:+.3e} +- {se:.1e} (chunk-level s.e.)")
