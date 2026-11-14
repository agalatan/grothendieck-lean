"""k5_quad2.py: EXACT (quadrature) optimisation of the d = 2 junta family at a row: the 18 Wick columns of H21(C^2) + H32(C^2), no diffuse
drivers, on a tensor Gauss-Legendre grid in (|z1|, arg z1, |z2|, arg z2) with the Gaussian radial weights; the objective is deterministic,
so there is no sample noise and no overfitting.  Excess over the Gaussian ideal:
   [Lambda5(best) - Lambda5(q=0, nu5*)] on this grid  -  [Lambda5(G) - Lambda5(q=0, nu5*)] on d5k_ref's (z1, W) grid (16x10x768).
usage: k5_quad2.py row [NR1 NT1 NR2 NT2] [cands.npz key]"""
import sys, math, time, numpy as np
row = sys.argv[1]; NR1, NT1, NR2, NT2 = ([int(v) for v in sys.argv[2:6]] if len(sys.argv) > 5 else (10, 48, 10, 48))
npz = sys.argv[6] if len(sys.argv) > 6 else None; key = sys.argv[7] if len(sys.argv) > 7 else 'cand0'
sys.argv = ['k5_attack.py', '2', '0', '--row', row]
exec(open('k5_attack.py').read().split('# ---------------------------------------------------------------- self test')[0])
import kmodel
t0 = time.time()
r1, w1 = kmodel.gl(0, 5.5, NR1, 6); w1 = w1*2*r1*np.exp(-r1*r1); w1 /= w1.sum()
r2, w2 = kmodel.gl(0, 5.5, NR2, 6); w2 = w2*2*r2*np.exp(-r2*r2); w2 /= w2.sum()
t1 = (np.arange(NT1)+0.5)*2*np.pi/NT1; t2 = (np.arange(NT2)+0.5)*2*np.pi/NT2
R1, T1, R2, T2 = np.meshgrid(r1, t1, r2, t2, indexing='ij')
Z = np.stack([(R1*np.exp(1j*T1)).ravel(), (R2*np.exp(1j*T2)).ravel()], axis=1); del R1, T1, R2, T2
Wt = (w1[:, None, None, None]*(np.ones(NT1)/NT1)[None, :, None, None]*w2[None, None, :, None]*(np.ones(NT2)/NT2)[None, None, None, :]).ravel()
JCOLS = [t for t in range(M) if RECIPES[t].drv is None]           # order preserved: q-junta, other cubic, quintic
nq = sum(1 for t in JCOLS if MQ[t]); n3 = sum(1 for t in JCOLS if M3[t]); K = len(JCOLS)
n = Z.shape[0]; U = np.abs(Z)**2; cache = {}
def h(c, a, b):
    k_ = (c, a, b)
    if k_ not in cache: cache[k_] = wick1(Z[:, c], U[:, c], a, b)
    return cache[k_]
Bj = np.empty((n, K), complex, order='F')
for k, t in enumerate(JCOLS):
    r = RECIPES[t]; col = None
    for c in range(2):
        if r.alpha[c] or r.beta[c]:
            f = h(c, r.alpha[c], r.beta[c]); col = f if col is None else col*f
    Bj[:, k] = col/r.norm
cache.clear()
z1 = Z[:, 0]; u1 = U[:, 0]; L = z1*(ELL + BETA*(u1-2)); H32n = z1*(u1*u1 - 6*u1 + 6)/math.sqrt(12.0); Lp = L - C5*H32n; Lm = L + C5*H32n; um1 = u1 - 1; z2s = z1*z1/S2
kH32 = JCOLS.index(I_H32); kJ = JCOLS.index(find(3, (0, 2), (0, 1), None))
print(f'row {row}: grid {NR1*6}x{NT1} (z1) x {NR2*6}x{NT2} (z2) = {n:,} points, {K} junta columns ({nq} q, {n3} cubic); weights sum {Wt.sum():.12f} [{time.time()-t0:.0f}s]', flush=True)
def fval(a, grad=True):
    G3 = Bj[:, :n3] @ a[:n3]; G5 = Bj[:, n3:] @ a[n3:]; q = Bj[:, :nq] @ a[:nq]
    Cq = BA*um1*q + BB*z2s*np.conj(q); p = Lp + G5 + G3 - Cq; m = Lm + G5 - G3 + Cq; ap_ = np.abs(p); am_ = np.abs(m)
    val = Wt@ap_ + Wt@am_ - float(np.sum(np.abs(a[:n3])**2))/E1 - float(np.sum(np.abs(a[n3:])**2))/ETA + (BA*BA + BB*BB)*float(np.sum(np.abs(a[:nq])**2))/ETA
    if not grad: return val, None
    php = p/np.maximum(ap_, 1e-300); phm = m/np.maximum(am_, 1e-300); D = (php - phm)*Wt; Sm = (php + phm)*Wt
    g = np.empty(K, complex); g[:n3] = (Bj[:, :n3].conj().T @ D)/2; g[n3:] = (Bj[:, n3:].conj().T @ Sm)/2
    g[:nq] += (Bj[:, :nq].conj().T @ (-BA*um1*D - BB*z2s*np.conj(D)))/2
    g[:n3] -= a[:n3]/E1; g[n3:] -= a[n3:]/ETA; g[:nq] += (BA*BA + BB*BB)*a[:nq]/ETA
    return val, g
def opt(a0, mask=None, iters=400):
    mask = np.ones(K, bool) if mask is None else mask; idx = np.where(mask)[0]; a = a0.copy(); a[~mask] = 0
    def fg(x):
        a[idx] = x[:len(idx)] + 1j*x[len(idx):]; v, g = fval(a); g = g[idx]; return -v, -np.concatenate([2*g.real, 2*g.imag])
    res = sp_minimize(fg, np.concatenate([a[idx].real, a[idx].imag]), jac=True, method='L-BFGS-B', options={'maxiter': iters, 'maxfun': 3*iters, 'ftol': 1e-16, 'gtol': 1e-11, 'maxcor': 30})
    a[idx] = res.x[:len(idx)] + 1j*res.x[len(idx):]; v, g = fval(a); return v, a, res.nit, float(np.linalg.norm(g[idx]))
# baseline on this grid: q = 0, nu5 optimised (1-D)
m5 = np.zeros(K, bool); m5[kH32] = True; a0 = np.zeros(K, complex); a0[kH32] = NU50
V0, a_nu, _, _ = opt(a0, mask=m5); nu5s = a_nu[kH32]
print(f'  this grid: Lambda5(q=0, nu5*) = {V0:.8f} at nu5* = {nu5s.real:+.5f}{nu5s.imag:+.5f}i;  at d5k nu5: {fval(a0, grad=False)[0]:.8f}', flush=True)
rng = np.random.default_rng(5); starts = []
a = np.zeros(K, complex); a[kH32] = nu5s; a[kJ] = 0.065; a += 0.003*(rng.standard_normal(K) + 1j*rng.standard_normal(K)); starts.append(('junta 0.065 + nu5 + noise', a))
a = np.zeros(K, complex); a[kH32] = nu5s; a[kJ] = 0.1; a += 0.01*(rng.standard_normal(K) + 1j*rng.standard_normal(K)); starts.append(('junta 0.10 + nu5 + noise', a))
a = np.zeros(K, complex); a[kH32] = nu5s; a += 0.03*(rng.standard_normal(K) + 1j*rng.standard_normal(K)); starts.append(('nu5 + random 0.03', a))
a = 0.08*(rng.standard_normal(K) + 1j*rng.standard_normal(K))/math.sqrt(K); starts.append(('random 0.08', a))
a = np.zeros(K, complex); a[kH32] = nu5s; a[kJ] = 0.2; starts.append(('junta 0.20 + nu5', a))
if npz:
    Zc = np.load(npz); cand = Zc[key]; a = np.array([cand[t] for t in JCOLS]); starts.append((f'npz {key} (junta part)', a))
best = None
for name, a_ in starts:
    v, a, nit, gn = opt(a_)
    print(f'  start {name:28s}: Lambda5 = {v:.8f}  gain over (q=0,nu5*) = {v-V0:+.3e}  |q|={math.sqrt(float(np.sum(np.abs(a[:nq])**2))):.4f} nu5={abs(a[kH32]):.4f} it={nit} |g|={gn:.1e} [{time.time()-t0:.0f}s]', flush=True)
    if best is None or v > best[0]: best = (v, a, name)
v, a, name = best
sh = {}
for k, t in enumerate(JCOLS): sh[SHELL[t]] = sh.get(SHELL[t], 0.0) + abs(a[k])**2
print(f'  BEST ({name}): gain over (q=0, nu5*) on this grid = {v-V0:+.3e}; shells |a|^2: ' + ', '.join(f'{s[0]}:({s[1]},{s[2]})={m_:.2e}' for s, m_ in sorted(sh.items()) if m_ > 1e-9), flush=True)
print('  largest coefficients: ' + ', '.join(f'{RECIPES[JCOLS[k]].label}={abs(a[k]):.4f}' for k in np.argsort(-np.abs(a))[:8]), flush=True)
# Gaussian ideal gain on d5k_ref's grid
sys.argv = ['d5k_ref.py', row, '16', '10', '768']; import d5k_ref
from scipy.optimize import minimize as spm
rsG = None
for x0 in ([SIG0 if SIG0 > 0.02 else 0.05, 0, NU50, 0, 0, 0], [0.2, 0, NU50, 0, 0, 0], [0.0, 0, NU50, 0, 0, 0]):
    rs = spm(lambda qq: -d5k_ref.value(qq, False), np.array(x0), method='L-BFGS-B', options={'maxiter': 300, 'ftol': 1e-15, 'gtol': 1e-11})
    if rsG is None or rs.fun < rsG.fun: rsG = rs
rs0 = spm(lambda qq: -d5k_ref.value([0, 0, qq[0], 0, 0, 0], False), np.array([NU50]), method='L-BFGS-B', options={'ftol': 1e-15, 'gtol': 1e-11})
gainG = -rsG.fun + rs0.fun
print(f'  d5k grid 16x10x768: Lambda5(G) = {-rsG.fun:.8f} at (sigma, nu5) = ({abs(rsG.x[0]):.4f}, {rsG.x[2]:.5f}); Lambda5(q=0, nu5*) = {-rs0.fun:.8f} (nu5* = {rs0.x[0]:.5f}); Gaussian gain = {gainG:+.3e}')
print(f'  EXCESS of the d=2 junta family over the Gaussian ideal (quadrature): {(v-V0)-gainG:+.3e}   row value: Gaussian {CONST-rsG.fun:.7f} -> junta {CONST-rsG.fun+(v-V0)-gainG:.7f}  [{time.time()-t0:.0f}s]')
