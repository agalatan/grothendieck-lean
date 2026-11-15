"""k5_quad3.py: EXACT (quadrature) optimisation of the d = 3 junta family (78 Wick columns of H21(C^3) + H32(C^3), no diffuse drivers) at a
row, on a 5-dimensional tensor Gauss-Legendre grid (|z1|; |z2|, arg z2; |z3|, arg z3): arg z1 is fixed to 0 by the common-phase symmetry
(all columns and L have charge 1).  Compares the one-coordinate (z1, z2) sub-family with the full two-coordinate family on the same grid.
usage: k5_quad3.py row [NR NT]   (NR panels of 6 radial nodes on [0, 5.5] per coordinate, NT angles per ordinary coordinate)"""
import sys, math, time, numpy as np
row = sys.argv[1]; NR, NT = ([int(v) for v in sys.argv[2:4]] if len(sys.argv) > 3 else (4, 16))
sys.argv = ['k5_attack.py', '3', '0', '--row', row]
exec(open('k5_attack.py').read().split('# ---------------------------------------------------------------- self test')[0])
import kmodel
t0 = time.time()
r, w = kmodel.gl(0, 5.5, NR, 6); w = w*2*r*np.exp(-r*r); w /= w.sum(); th = (np.arange(NT)+0.5)*2*np.pi/NT
R1, R2, T2, R3, T3 = np.meshgrid(r, r, th, r, th, indexing='ij')
Z = np.stack([R1.ravel().astype(complex), (R2*np.exp(1j*T2)).ravel(), (R3*np.exp(1j*T3)).ravel()], axis=1); del R1, R2, T2, R3, T3
Wt = (w[:, None, None, None, None]*w[None, :, None, None, None]*(np.ones(NT)/NT)[None, None, :, None, None]*w[None, None, None, :, None]*(np.ones(NT)/NT)[None, None, None, None, :]).ravel()
JCOLS = [t for t in range(M) if RECIPES[t].drv is None]
nq = sum(1 for t in JCOLS if MQ[t]); n3 = sum(1 for t in JCOLS if M3[t]); K = len(JCOLS)
n = Z.shape[0]; U = np.abs(Z)**2; cache = {}
def h(c, a, b):
    k_ = (c, a, b)
    if k_ not in cache: cache[k_] = wick1(Z[:, c], U[:, c], a, b)
    return cache[k_]
Bj = np.empty((n, K), complex, order='F')
for k, t in enumerate(JCOLS):
    rr = RECIPES[t]; col = None
    for c in range(3):
        if rr.alpha[c] or rr.beta[c]:
            f = h(c, rr.alpha[c], rr.beta[c]); col = f if col is None else col*f
    Bj[:, k] = col/rr.norm
cache.clear()
z1 = Z[:, 0]; u1 = U[:, 0]; L = z1*(ELL + BETA*(u1-2)); H32n = z1*(u1*u1 - 6*u1 + 6)/math.sqrt(12.0); Lp = L - C5*H32n; Lm = L + C5*H32n; um1 = u1 - 1; z2s = z1*z1/S2
kH32 = JCOLS.index(I_H32); kJ2 = JCOLS.index(find(3, (0, 2, 0), (0, 1, 0), None)); kJ3 = JCOLS.index(find(3, (0, 0, 2), (0, 0, 1), None))
ONE = np.array([RECIPES[t].alpha[2] == 0 and RECIPES[t].beta[2] == 0 for t in JCOLS])   # columns without z3: the (z1, z2) sub-family
print(f'row {row}: grid {NR*6} (|z1|) x ({NR*6}x{NT})^2 = {n:,} points, {K} junta columns ({nq} q, {n3} cubic), {ONE.sum()} in the (z1,z2) sub-family; {Bj.nbytes/1e9:.1f} GB [{time.time()-t0:.0f}s]', flush=True)
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
def opt(a0, mask=None, iters=300):
    mask = np.ones(K, bool) if mask is None else mask; idx = np.where(mask)[0]; a = a0.copy(); a[~mask] = 0
    def fg(x):
        a[idx] = x[:len(idx)] + 1j*x[len(idx):]; v, g = fval(a); g = g[idx]; return -v, -np.concatenate([2*g.real, 2*g.imag])
    res = sp_minimize(fg, np.concatenate([a[idx].real, a[idx].imag]), jac=True, method='L-BFGS-B', options={'maxiter': iters, 'maxfun': 3*iters, 'ftol': 1e-16, 'gtol': 1e-11, 'maxcor': 30})
    a[idx] = res.x[:len(idx)] + 1j*res.x[len(idx):]; v, g = fval(a); return v, a, res.nit, float(np.linalg.norm(g[idx]))
m5 = np.zeros(K, bool); m5[kH32] = True; a0 = np.zeros(K, complex); a0[kH32] = NU50
V0, a_nu, _, _ = opt(a0, mask=m5); nu5s = a_nu[kH32]
print(f'  this grid: Lambda5(q=0, nu5*) = {V0:.8f} at nu5* = {nu5s.real:+.5f}{nu5s.imag:+.5f}i [{time.time()-t0:.0f}s]', flush=True)
rng = np.random.default_rng(7)
def report(tag, v, a, nit, gn):
    sh = {}
    for k, t in enumerate(JCOLS): sh[SHELL[t]] = sh.get(SHELL[t], 0.0) + abs(a[k])**2
    big = ', '.join(f'{RECIPES[JCOLS[k]].label}={abs(a[k]):.4f}' for k in np.argsort(-np.abs(a))[:6])
    print(f'  {tag:34s}: gain over (q=0,nu5*) = {v-V0:+.3e}  |q|={math.sqrt(float(np.sum(np.abs(a[:nq])**2))):.4f} nu5={abs(a[kH32]):.4f} it={nit} |g|={gn:.1e}  top: {big} [{time.time()-t0:.0f}s]', flush=True)
# one-coordinate sub-family (z1, z2 only), two starts
a = np.zeros(K, complex); a[kH32] = nu5s; a[kJ2] = 0.06; a += 0.003*(rng.standard_normal(K) + 1j*rng.standard_normal(K)); a[~ONE] = 0
v1, a1, nit, gn = opt(a, mask=ONE); report('one spike (z2), from junta 0.06', v1, a1, nit, gn)
# full two-coordinate family
starts = []
b = a1.copy(); b[kJ3] = 0.06; b += 0.003*(rng.standard_normal(K) + 1j*rng.standard_normal(K)); starts.append(('two spikes from one-spike opt', b))
b = np.zeros(K, complex); b[kH32] = nu5s; b[kJ2] = 0.045; b[kJ3] = 0.045; b += 0.005*(rng.standard_normal(K) + 1j*rng.standard_normal(K)); starts.append(('two spikes 0.045 each + noise', b))
b = a1.copy(); b += 0.003*(rng.standard_normal(K) + 1j*rng.standard_normal(K)); starts.append(('one-spike opt + noise (all cols)', b))
b = np.zeros(K, complex); b[kH32] = nu5s; b += 0.05*(rng.standard_normal(K) + 1j*rng.standard_normal(K))/math.sqrt(K)*3; starts.append(('nu5 + random', b))
best = (v1, a1, 'one spike')
for name, b in starts:
    v, a, nit, gn = opt(b); report(name, v, a, nit, gn)
    if v > best[0]: best = (v, a, name)
v, a, name = best
print(f'  BEST ({name}): gain over (q=0, nu5*) = {v-V0:+.3e}; one-spike sub-family gain = {v1-V0:+.3e}; two-coordinate improvement = {v-v1:+.3e}', flush=True)
sys.argv = ['d5k_ref.py', row, '16', '10', '768']; import d5k_ref
from scipy.optimize import minimize as spm
rsG = None
for x0 in ([SIG0 if SIG0 > 0.02 else 0.05, 0, NU50, 0, 0, 0], [0.2, 0, NU50, 0, 0, 0], [0.0, 0, NU50, 0, 0, 0]):
    rs = spm(lambda qq: -d5k_ref.value(qq, False), np.array(x0), method='L-BFGS-B', options={'maxiter': 300, 'ftol': 1e-15, 'gtol': 1e-11})
    if rsG is None or rs.fun < rsG.fun: rsG = rs
rs0 = spm(lambda qq: -d5k_ref.value([0, 0, qq[0], 0, 0, 0], False), np.array([NU50]), method='L-BFGS-B', options={'ftol': 1e-15, 'gtol': 1e-11})
gainG = -rsG.fun + rs0.fun
print(f'  Gaussian gain over (q=0, nu5*) (d5k grid 16x10x768) = {gainG:+.3e};  EXCESS over the Gaussian ideal: one spike {(v1-V0)-gainG:+.3e}, best {(v-V0)-gainG:+.3e}  [{time.time()-t0:.0f}s]')
