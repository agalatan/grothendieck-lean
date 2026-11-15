#!/usr/bin/env python3
"""K5 attack (claude-b9ee worker, 2026-11-04): degree-5 analogue of e4_kattack.py with FULL tensors.
Row (ours, fixed at d5k.py's optimum):  L = z1 (ell + beta(|z1|^2-2)),  C = c5 H32(z1) + bA q (|z1|^2-1) + bB conj(q) z1^2/sqrt2,
   q = the z1-free part of the adversary's cubic term G3 (its remote residual), ||C||^2 = c5^2 + (bA^2+bB^2)||q||^2.
Adversary:  G3 in H21(C^d) (+ diffuse drivers),  G5 in H32(C^d) (+ diffuse drivers); d = z1 plus d-1 ordinary coordinates.
   Lambda5(G3,G5) = E|L+G5+G3-C| + E|L+G5-G3+C| - ||G3||^2/e1 - ||G5||^2/eta + (bA^2+bB^2)||q||^2/eta ;
   row value = t^2 - 2 ell t + 2 beta^2/e1 + c5^2/eta + sup Lambda5.   (KSIDE.md section 6, d5k.py)
Wick basis: products of one-variable Wick polynomials :w^a conj(w)^b: = (-1)^b b! w^(a-b) L_b^(a-b)(|w|^2) (a >= b), norms^2 alpha! beta!.
Diffuse limit: independent standard complex (circular) Gaussians for remote chaos types (a',b'), a' != b' (conj for (b',a')),
   real Gaussians for self-conjugate types a' = b'; the W driver of q is shared with the quintic shells W(|z1|^2-1), conj(W) z1^2/sqrt2 (d5k).
   --diffuse core : W, W5, W(U-1), conj(W) z1^2/sqrt2 (d5k's family)       ext : + independent drivers for every remote type, z1-local
   --diffuse ext2 : as ext, but visible monomials in all d coordinates times far drivers.
S = sup over d5k's six-dimensional Gaussian-ideal subspace {W, H21(z1), H32(z1), W(U-1), conj(W) z1^2/sqrt2, W5} on the same samples.
Optimiser: L-BFGS (scipy) on the real parametrisation, else preconditioned adaptive gradient ascent; common random numbers;
candidates re-evaluated on fresh samples (chunked) against S on the same chunks.
usage: k5_attack.py d seed [--row peak|t76|t82|t87] [--nopt N] [--starts K] [--nfresh N] [--diffuse core|ext|ext2] [--selftest]"""
import numpy as np, math, sys, time, argparse, json, os
from collections import namedtuple
try:
    from scipy.optimize import minimize as sp_minimize
except Exception:
    sp_minimize = None

ap = argparse.ArgumentParser()
ap.add_argument('d', type=int); ap.add_argument('seed', type=int)
ap.add_argument('--row', default='peak')
ap.add_argument('--nopt', type=int, default=1_000_000)
ap.add_argument('--starts', type=int, default=12)
ap.add_argument('--iters', type=int, default=400)
ap.add_argument('--nfresh', type=int, default=20_000_000)
ap.add_argument('--chunk', type=int, default=1_000_000)
ap.add_argument('--npolish', type=int, default=2_000_000)
ap.add_argument('--top', type=int, default=3)
ap.add_argument('--diffuse', default='core')
ap.add_argument('--family', default='full')   # full | spikes (junta columns supported on z1 and at most ONE ordinary coordinate)
ap.add_argument('--selftest', action='store_true')
ap.add_argument('--out', default='.')
args = ap.parse_args()
d, seed = args.d, args.seed
E1, ETA = 0.848926, 0.281576
# rows from d5k_rows.log: t, ell, beta, c5, bA, bB, and the Gaussian-ideal adversary (sigma on W, nu5 on H32(z1))
ROWS = {'peak': (0.84, 0.8402, 0.1591, 0.0, -0.1585, -0.0965, 0.2395, 0.0408),
        't76':  (0.76, 0.7497, 0.1166, 0.0, -0.1284, -0.0768, 0.3866, 0.0244),
        't82':  (0.82, 0.8181, 0.1476, 0.0, -0.1506, -0.0912, 0.2850, 0.0360),
        't87':  (0.87, 0.8707, 0.1775, 0.0, -0.1727, -0.1064, 0.0348, 0.0537),
        't86':  (0.86, 0.8605, 0.1712, 0.0, -0.1664, -0.1020, 0.0000, 0.0540),
        't88':  (0.88, 0.8800, 0.1833, 0.0, -0.1741, -0.1101, 0.0343, 0.0537)}
T, ELL, BETA, C5, BA, BB, SIG0, NU50 = ROWS[args.row]
CONST = T*T - 2*ELL*T + 2*BETA*BETA/E1 + C5*C5/ETA
S2 = math.sqrt(2.0)

# ---------------------------------------------------------------- basis recipes
Recipe = namedtuple('Recipe', 'deg alpha beta drv norm label')
def multi_indices(m, k):
    if m == 1: yield (k,); return
    for a0 in range(k, -1, -1):
        for rest in multi_indices(m-1, k-a0): yield (a0,) + rest
def fact_norm(alpha, beta): return math.sqrt(math.prod(math.factorial(a) for a in alpha)*math.prod(math.factorial(b) for b in beta))
def pad(v): return tuple(v) + (0,)*(d-len(v))
def mono_label(alpha, beta):
    s = ''.join(f'z{c+1}' + (f'^{a}' if a > 1 else '') for c, a in enumerate(alpha) if a)
    s += ''.join(f'z{c+1}b' + (f'^{b}' if b > 1 else '') for c, b in enumerate(beta) if b)
    return s or '1'
POOLS = {'core': {(2,1): ['W'], (3,2): ['W5']},
         'ext':  {(2,1): ['W','W2'], (3,2): ['W5'], (1,1): ['X1','X2'], (2,0): ['V1','V2'], (2,2): ['X3','X4'], (3,1): ['V3'], (3,0): ['V4'], (1,0): ['Y1','Y2']}}
POOLS['ext2'] = POOLS['ext']
def driver_recipes(deg, d_vis, pools):
    P, Q = (2, 1) if deg == 3 else (3, 2)
    for p in range(P+1):
        for q in range(Q+1):
            fa, fb = P-p, Q-q
            if fa == 0 and fb == 0: continue
            key = (fa, fb) if fa >= fb else (fb, fa); conj = fa < fb
            if key not in pools: continue
            for alpha in multi_indices(d_vis, p):
                for beta in multi_indices(d_vis, q):
                    for name in pools[key]:
                        drv = ('c' + name) if conj else name
                        yield Recipe(deg, pad(alpha), pad(beta), drv, fact_norm(alpha, beta), f'{mono_label(pad(alpha), pad(beta))}*{drv}')
def make_recipes():
    R = []
    for deg, (P, Q) in ((3, (2, 1)), (5, (3, 2))):
        for alpha in multi_indices(d, P):
            for beta in multi_indices(d, Q):
                R.append(Recipe(deg, alpha, beta, None, fact_norm(alpha, beta), mono_label(alpha, beta)))
        pools = POOLS[args.diffuse]; d_vis = d if args.diffuse == 'ext2' else 1
        R.extend(driver_recipes(deg, d_vis, pools))
    if args.family == 'spikes':
        R = [r for r in R if r.drv is not None or sum(1 for c in range(1, d) if r.alpha[c] or r.beta[c]) <= 1]
    if args.family == 'symspikes':   # symmetric N-spike family: keep the patterns supported on z1 and coordinate 1; sample() sums them over j = 1..d-1
        R = [r for r in R if r.drv is not None or all(r.alpha[c] == 0 and r.beta[c] == 0 for c in range(2, d))]
        R = [r._replace(label=('SYM:' + r.label) if (r.drv is None and (r.alpha[1] or r.beta[1])) else r.label) for r in R]
    # column order: cubic q-columns (z1-free) first, then the other cubic columns, then the quintic block (contiguous views)
    R.sort(key=lambda r: (r.deg, 0 if (r.deg == 3 and r.alpha[0] == 0 and r.beta[0] == 0) else 1))
    return R
RECIPES = make_recipes(); M = len(RECIPES)
DEG = np.array([r.deg for r in RECIPES]); M3 = DEG == 3; M5 = DEG == 5
MQ = np.array([r.deg == 3 and r.alpha[0] == 0 and r.beta[0] == 0 for r in RECIPES])
NQ = int(MQ.sum()); N3 = int(M3.sum())
assert MQ[:NQ].all() and M3[:N3].all() and M5[N3:].all()
def find(deg, alpha, beta, drv):
    for t, r in enumerate(RECIPES):
        if r.deg == deg and r.alpha == pad(alpha) and r.beta == pad(beta) and r.drv == drv: return t
    raise KeyError((deg, alpha, beta, drv))
I_W = find(3, (), (), 'W'); I_H21 = find(3, (2,), (1,), None); I_H32 = find(5, (3,), (2,), None)
I_MA = find(5, (1,), (1,), 'W'); I_MB = find(5, (2,), (), 'cW'); I_W5 = find(5, (), (), 'W5')
IDEAL = np.zeros(M, bool); IDEAL[[I_W, I_H21, I_H32, I_MA, I_MB, I_W5]] = True
IDEAL0 = IDEAL.copy(); IDEAL0[I_W5] = False
DRIVER_NAMES = sorted({r.drv.lstrip('c') if r.drv[0] == 'c' and r.drv[1] in 'WVY' else r.drv for r in RECIPES if r.drv})
# shells for reporting: (deg, local (a0,b0))
SHELL = [(r.deg, r.alpha[0], r.beta[0]) for r in RECIPES]

# ---------------------------------------------------------------- sampling
def wick1(w, U, a, b):
    if a < b: return np.conj(wick1(w, U, b, a))
    k = a - b
    if b == 0: return w**a if a > 0 else np.ones_like(w)
    if b == 1: lag = -U + (k + 1)
    elif b == 2: lag = U*U/2 - (k + 2)*U + (k + 1)*(k + 2)/2
    else: raise ValueError
    return (-1)**b*math.factorial(b)*(w**k if k else 1.0)*lag
def sample(n, g):
    Z = (g.standard_normal((n, d)) + 1j*g.standard_normal((n, d)))/S2
    drv = {}
    for name in DRIVER_NAMES:
        if name[0] == 'X': drv[name] = g.standard_normal(n).astype(complex)
        else:
            v = (g.standard_normal(n) + 1j*g.standard_normal(n))/S2; drv[name] = v; drv['c' + name] = np.conj(v)
    U = np.abs(Z)**2
    cache = {}
    def h(c, a, b):
        key = (c, a, b)
        if key not in cache: cache[key] = wick1(Z[:, c], U[:, c], a, b)
        return cache[key]
    B = np.empty((n, M), complex, order='F')   # column blocks are contiguous views
    SYM = [t for t, r in enumerate(RECIPES) if r.label.startswith('SYM:')]
    if SYM:                                      # symmetrised over the ordinary coordinates, norm kept at 1; coordinate by coordinate (memory)
        for t in SYM: B[:, t] = 0
        for j in range(1, d):
            for t in SYM:
                r = RECIPES[t]; f = h(0, r.alpha[0], r.beta[0]) if (r.alpha[0] or r.beta[0]) else 1.0
                B[:, t] += f*h(j, r.alpha[1], r.beta[1])
            for key in [k for k in cache if k[0] == j]: del cache[key]
        for t in SYM: B[:, t] /= RECIPES[t].norm*math.sqrt(d-1)
    for t, r in enumerate(RECIPES):
        if r.label.startswith('SYM:'): continue
        col = None
        for c in range(d):
            if r.alpha[c] or r.beta[c]:
                f = h(c, r.alpha[c], r.beta[c]); col = f if col is None else col*f
        if r.drv is not None:
            gcol = drv[r.drv]; col = gcol if col is None else col*gcol
        B[:, t] = col/r.norm
    u1 = U[:, 0]; z1 = Z[:, 0]
    L = z1*(ELL + BETA*(u1 - 2)); H32n = z1*(u1*u1 - 6*u1 + 6)/math.sqrt(12.0)
    aux = (u1 - 1.0, z1*z1/S2, L - C5*H32n, L + C5*H32n)   # (U-1), z1^2/sqrt2, L for the + term, L for the - term
    return B, aux

# ---------------------------------------------------------------- objective
def lam_and_grad(a, B, aux, grad=True):
    um1, z2s, Lp, Lm = aux; n = B.shape[0]
    B3 = B[:, :N3]; B5 = B[:, N3:]; Bq = B[:, :NQ]
    G3 = B3 @ a[:N3]; G5 = B5 @ a[N3:]; q = Bq @ a[:NQ]
    Cq = BA*um1*q + BB*z2s*np.conj(q)
    p = Lp + G5 + G3 - Cq; m = Lm + G5 - G3 + Cq
    ap_ = np.abs(p); am_ = np.abs(m)
    val = ap_.mean() + am_.mean() - float(np.sum(np.abs(a[M3])**2))/E1 - float(np.sum(np.abs(a[M5])**2))/ETA + (BA*BA + BB*BB)*float(np.sum(np.abs(a[MQ])**2))/ETA
    if not grad: return val, None
    php = p/np.maximum(ap_, 1e-300); phm = m/np.maximum(am_, 1e-300)
    D = php - phm; Sm = php + phm
    g = np.empty(M, complex)
    g[:N3] = (B3.conj().T @ D)/(2*n)
    g[N3:] = (B5.conj().T @ Sm)/(2*n)
    g[:NQ] += (Bq.conj().T @ (-BA*um1*D - BB*z2s*np.conj(D)))/(2*n)
    g[:N3] -= a[:N3]/E1; g[N3:] -= a[N3:]/ETA; g[:NQ] += (BA*BA + BB*BB)*a[:NQ]/ETA
    return val, g
PREC = np.where(M3, E1, ETA)
def ascend(a0, B, aux, mask=None, iters=None, tag=''):
    """maximise over the columns in mask (default all); returns (value, a, iterations, |precond grad|)"""
    mask = np.ones(M, bool) if mask is None else mask; idx = np.where(mask)[0]; iters = iters or args.iters
    a = a0.copy(); a[~mask] = 0
    if sp_minimize is not None:
        def fg(x):
            a[idx] = x[:len(idx)] + 1j*x[len(idx):]
            v, g = lam_and_grad(a, B, aux); g = g[idx]
            return -v, -np.concatenate([2*g.real, 2*g.imag])
        x0 = np.concatenate([a[idx].real, a[idx].imag])
        res = sp_minimize(fg, x0, jac=True, method='L-BFGS-B', options={'maxiter': iters, 'maxfun': 3*iters, 'ftol': 1e-15, 'gtol': 1e-9, 'maxcor': 30})
        a[idx] = res.x[:len(idx)] + 1j*res.x[len(idx):]; v, g = lam_and_grad(a, B, aux)
        return v, a, res.nit, float(np.linalg.norm((PREC*g)[idx]))
    v, g = lam_and_grad(a, B, aux); lr = 0.3
    for it in range(iters):
        a2 = a + lr*PREC*g*mask; v2, g2 = lam_and_grad(a2, B, aux)
        if v2 > v: a, v, g = a2, v2, g2; lr = min(lr*1.15, 1.5)
        else: lr *= 0.5
        if lr < 1e-8: break
    return v, a, it + 1, float(np.linalg.norm((PREC*g)[mask]))
def shells(a):
    out = {}
    for t in range(M):
        if abs(a[t]) > 0: out[SHELL[t]] = out.get(SHELL[t], 0.0) + abs(a[t])**2
    return {f'{k[0]}:({k[1]},{k[2]})': round(float(v), 6) for k, v in sorted(out.items()) if v > 1e-9}
def gauss_point():
    a = np.zeros(M, complex); a[I_W] = SIG0; a[I_H32] = NU50; return a

# ---------------------------------------------------------------- self test
if args.selftest:
    g = np.random.default_rng(seed); n = 200_000
    B, aux = sample(n, g)
    Gm = (B.conj().T @ B)/n
    print(f'selftest d={d} diffuse={args.diffuse}: M={M} columns (cubic {M3.sum()}, quintic {M5.sum()}, q-columns {MQ.sum()}); drivers {DRIVER_NAMES}')
    print(f'  Gram - I: max |offdiag| = {np.max(np.abs(Gm - np.diag(np.diag(Gm)))):.4f}, diag in [{np.min(np.diag(Gm).real):.4f}, {np.max(np.diag(Gm).real):.4f}]  (expected ~ 1/sqrt(n)=0.002 noise)')
    z1 = aux[2]/(ELL + BETA*(aux[0] - 1.0))   # recover z1 from L = z1 (ell + beta (U-2)), U-1 = aux[0]
    print(f'  means: max |E B_t| = {np.max(np.abs(B.mean(0))):.4f}; max |E B_t conj(z1)| = {np.max(np.abs((B.conj()*z1[:, None]).mean(0))):.4f}  (MC noise of heavy-tailed polynomials; exact check below)')
    # exact orthonormality of the one-variable Wick polynomials by Gauss-Laguerre in U = |w|^2 (angular integral exact by charge)
    xg, wg = np.polynomial.laguerre.laggauss(12); worst = 0.0
    pairs = [(a, b) for a in range(4) for b in range(3)]
    for (a, b) in pairs:
        for (a2, b2) in pairs:
            if a - b != a2 - b2: continue      # different charge: orthogonal by the angular integral
            k = a - b; r = np.sqrt(xg)
            def rad(a_, b_):   # radial part of :w^a conj(w)^b: at |w| = r (phase stripped)
                h = wick1(r.astype(complex), xg, max(a_, b_), min(a_, b_)); return h.real
            ip = float(np.sum(wg*rad(a, b)*rad(a2, b2))); ex = math.factorial(a)*math.factorial(b) if (a, b) == (a2, b2) else 0.0
            worst = max(worst, abs(ip - ex))
    print(f'  exact Gauss-Laguerre check of E[h_ab conj(h_a2b2)] = delta a! b! over a<=3, b<=2: max error {worst:.1e}')
    # gradient check
    rng = np.random.default_rng(1); a = 0.1*(rng.standard_normal(M) + 1j*rng.standard_normal(M))/math.sqrt(M); a[I_W] += 0.2
    Bs, auxs = B[:5000], tuple(x[:5000] for x in aux)
    v, gr = lam_and_grad(a, Bs, auxs); eps = 1e-6; errs = []
    for t in list(range(0, M, max(1, M//12))) + [I_W, I_H32, I_MA, I_MB]:
        for dirn in (1.0, 1j):
            a2 = a.copy(); a2[t] += eps*dirn; a1 = a.copy(); a1[t] -= eps*dirn
            fd = (lam_and_grad(a2, Bs, auxs, grad=False)[0] - lam_and_grad(a1, Bs, auxs, grad=False)[0])/(2*eps)
            an = 2*(gr[t].real if dirn == 1.0 else gr[t].imag)   # df/dx = 2 Re g, df/dy = 2 Im g
            errs.append(abs(fd - an))
    print(f'  gradient check (finite differences, 5000 samples): max abs error {max(errs):.2e}')
    aG = gauss_point(); vG = lam_and_grad(aG, B, aux, grad=False)[0]
    print(f'  Gaussian point (sigma={SIG0}, nu5={NU50}): Lambda5 = {vG:.5f}  -> row = {CONST + vG:.5f} (d5k: see d5k_rows.log) [n={n}]')
    sys.exit(0)

# ---------------------------------------------------------------- main
t0 = time.time(); rng = np.random.default_rng(seed)
print(f'K5 attack d={d} seed={seed} row={args.row} (t={T}, ell={ELL}, beta={BETA}, bA={BA}, bB={BB}, c5={C5}) e1={E1} eta={ETA} diffuse={args.diffuse} family={args.family}', flush=True)
print(f'  basis: M={M} complex columns (cubic {M3.sum()} incl. {MQ.sum()} q-columns; quintic {M5.sum()}); drivers {DRIVER_NAMES}; nopt={args.nopt:,}; const={CONST:.6f}', flush=True)
B, aux = sample(args.nopt, rng)
print(f'  sampled ({time.time()-t0:.0f}s, {B.nbytes/1e9:.1f} GB)', flush=True)
# Gaussian ideal on the sample: d5k's family (W5 off), and with W5
aG = gauss_point(); vG0 = lam_and_grad(aG, B, aux, grad=False)[0]
S0, aS0, _, _ = ascend(aG, B, aux, mask=IDEAL0, iters=200)
S, aS, _, _ = ascend(aS0, B, aux, mask=IDEAL, iters=200)
print(f'  Gaussian point (d5k argmax): Lambda5 = {vG0:.7f} (row {CONST+vG0:.6f}); S0 (ideal, W5 off) = {S0:.7f} (row {CONST+S0:.6f}) at sigma={abs(aS0[I_W]):.4f} nu5={aS0[I_H32].real:+.4f}{aS0[I_H32].imag:+.4f}i a={abs(aS0[I_MA]):.4f} b={abs(aS0[I_MB]):.4f} nu3={abs(aS0[I_H21]):.4f}', flush=True)
print(f'  S (ideal with W5) = {S:.7f} (row {CONST+S:.6f}) at sigma={abs(aS[I_W]):.4f} nu5={aS[I_H32].real:+.4f}{aS[I_H32].imag:+.4f}i sigma5={abs(aS[I_W5]):.4f} a={abs(aS[I_MA]):.4f} b={abs(aS[I_MB]):.4f} [{time.time()-t0:.0f}s]', flush=True)

def rnd(k, scale):
    v = rng.standard_normal(k) + 1j*rng.standard_normal(k); return v*scale/math.sqrt(k)
def random_tensor(mask, norm):
    a = np.zeros(M, complex); k = int(mask.sum()); a[mask] = rnd(k, norm); return a
JUNTA3 = M3 & ~np.array([r.drv is not None for r in RECIPES]); JUNTA5 = M5 & ~np.array([r.drv is not None for r in RECIPES])
REMOTE3 = JUNTA3 & MQ; REMOTE5 = JUNTA5 & np.array([r.alpha[0] == 0 and r.beta[0] == 0 for r in RECIPES])
def start(kind):
    a = np.zeros(M, complex); G = gauss_point()
    if args.family == 'symspikes':
        kJ = [t for t in range(M) if RECIPES[t].label == 'SYM:z2^2z2b'][0]
        if kind % 3 == 0: a[I_H32] = NU50; a[kJ] = 0.065*math.sqrt(d-1)*(0.8 + 0.4*rng.random()); a += random_tensor(np.ones(M, bool), 0.01)
        elif kind % 3 == 1: a = random_tensor(np.ones(M, bool), 0.15); a[I_H32] = NU50
        else: a[I_H32] = NU50; a[kJ] = 0.03*math.sqrt(d-1); a += random_tensor(np.ones(M, bool), 0.02)
        return a
    if kind == 0:    # Gaussian point + small random cubic and quintic tensors
        a = G + random_tensor(JUNTA3, 0.03) + random_tensor(JUNTA5, 0.03)
    elif kind == 1:  # pure random tensors, no W
        a = random_tensor(JUNTA3, 0.2) + random_tensor(JUNTA5, 0.05)
    elif kind == 2:  # L4-counterexample structure i c z1(|z_j|^2-1) + W + nu5
        for j in range(1, d):
            al = [0]*d; be = [0]*d; al[0] = 1; al[j] += 1; be[j] = 1; a[find(3, al, be, None)] = 0.12j/math.sqrt(max(d-1, 1))
        a[I_W] = 0.15; a[I_H32] = NU50
    elif kind == 3:  # junta cubic + quintic in one ordinary coordinate + W (+ noise)
        if d > 1:
            al = [0]*d; be = [0]*d; al[1] = 2; be[1] = 1; a[find(3, al, be, None)] = 0.08
            al = [0]*d; be = [0]*d; al[1] = 3; be[1] = 2; a[find(5, al, be, None)] = 0.03
        a[I_W] = 0.17; a[I_H32] = NU50; a += random_tensor(JUNTA3, 0.02) + random_tensor(JUNTA5, 0.01)
    elif kind == 4:  # comparable influence in all ordinary coordinates, moderate W, W5
        a = random_tensor(REMOTE3, 0.12) + random_tensor(REMOTE5, 0.04); a[I_W] = 0.12; a[I_W5] = 0.03; a[I_H32] = NU50
    elif kind == 5:  # quintic L4-analogue: i c z1 :|z_j|^4:/2 (local (1,0) x remote (2,2)) + Gaussian point
        for j in range(1, d):
            al = [0]*d; be = [0]*d; al[0] = 1; al[j] += 2; be[j] = 2; a[find(5, al, be, None)] = 0.06j/math.sqrt(max(d-1, 1))
        a += G
    elif kind == 6:  # quintic (1,1)x(2,1) junta analogue of W(U-1): (U-1) H21(z_j), + Gaussian point
        for j in range(1, d):
            al = [0]*d; be = [0]*d; al[0] = 1; be[0] = 1; al[j] += 2; be[j] += 1; a[find(5, al, be, None)] = 0.06/math.sqrt(max(d-1, 1))
        a += G
    elif kind == 7:  # Gaussian point with the W-coupled quintic companions a, b on + noise
        a = G.copy(); a[I_MA] = 0.1; a[I_MB] = 0.1; a += random_tensor(JUNTA3, 0.02) + random_tensor(JUNTA5, 0.02)
    elif kind == 8:  # pure random quintic tensor, nothing cubic
        a = random_tensor(JUNTA5, 0.15)
    elif kind == 9:  # Gaussian point + random remote quintic junta
        a = G + random_tensor(REMOTE5, 0.1)
    elif kind == 10: # everything random moderate
        a = random_tensor(JUNTA3, 0.15) + random_tensor(JUNTA5, 0.1); a[I_W] = 0.1; a[I_W5] = 0.05
    elif kind == 11: # near zero
        a = random_tensor(np.ones(M, bool), 1e-3)
    elif kind == 12: # Gaussian point rescaled, nu5 flipped, + noise
        a = G.copy(); a[I_W] *= 1.5; a[I_H32] *= -1; a += random_tensor(np.ones(M, bool), 0.03)
    elif kind == 13: # junta in two ordinary coordinates (cubic + quintic) + W
        for j in range(1, min(d, 3)):
            al = [0]*d; be = [0]*d; al[j] = 2; be[j] = 1; a[find(3, al, be, None)] = 0.07
            al = [0]*d; be = [0]*d; al[j] = 3; be[j] = 2; a[find(5, al, be, None)] = 0.03
        a[I_W] = 0.15; a[I_H32] = NU50
    else:            # mixed cubic shells r_A (z1^2 conj z_j), r_B ((U-1) z_j) + W + nu5
        for j in range(1, d):
            al = [0]*d; be = [0]*d; al[0] = 2; be[j] = 1; a[find(3, al, be, None)] = 0.1/math.sqrt(max(d-1, 1))
            al = [0]*d; be = [0]*d; al[0] = 1; be[0] = 1; al[j] = 1; a[find(3, al, be, None)] = 0.1j/math.sqrt(max(d-1, 1))
        a[I_W] = 0.15; a[I_H32] = NU50
    if args.diffuse != 'core' and kind in (4, 10):   # also switch on the extra diffuse drivers
        a += random_tensor(np.array([r.drv is not None for r in RECIPES]), 0.05)
    return a
results = []
for st in range(args.starts):
    kind = st % 15
    a0 = start(kind); v, a, nit, gn = ascend(a0, B, aux)
    results.append((v, a.copy(), kind))
    print(f'  start {st:2d} (kind {kind:2d}): Lambda5 = {v:.7f}  in-sample excess over S = {v-S:+.2e}  |W|={abs(a[I_W]):.4f} nu5={abs(a[I_H32]):.4f} |W5|={abs(a[I_W5]):.4f} |cubic junta|={math.sqrt(float(np.sum(np.abs(a[JUNTA3])**2))):.4f} |quintic junta|={math.sqrt(float(np.sum(np.abs(a[JUNTA5])**2))):.4f} it={nit} |g|={gn:.1e} [{time.time()-t0:.0f}s]', flush=True)
results.sort(key=lambda r: -r[0])
top = results[:args.top]
for r, (v, a, kind) in enumerate(top):
    print(f'  candidate {r} (kind {kind}): in-sample {v:.7f} ({v-S:+.2e}); shells |a|^2: {shells(a)}', flush=True)
del B, aux
# polish the top candidates on a second, larger sample (reduces the noise fitted on the first sample)
g2 = np.random.default_rng(seed + 500)
Bp, auxp = sample(args.npolish, g2)
Sp, aSp, _, _ = ascend(aS, Bp, auxp, mask=IDEAL, iters=200)
polished = []
for r, (v, a, kind) in enumerate(top):
    vp, apol, nit, gn = ascend(a, Bp, auxp, iters=args.iters)
    polished.append((vp, apol, kind))
    print(f'  polish candidate {r} on {args.npolish:,} fresh samples: Lambda5 = {vp:.7f}  excess over S(polish sample)={vp-Sp:+.2e}  |W|={abs(apol[I_W]):.4f} nu5={abs(apol[I_H32]):.4f} |W5|={abs(apol[I_W5]):.4f} it={nit} |g|={gn:.1e} [{time.time()-t0:.0f}s]', flush=True)
del Bp, auxp
# fresh evaluation, common random numbers, chunk-level standard errors
cands = [('S0 (d5k ideal, W5 off)', aS0), ('Gauss point (d5k argmax)', aG)] + [(f'cand {r} raw (kind {k})', a) for r, (v, a, k) in enumerate(top)] + [(f'cand {r} polished (kind {k})', a) for r, (v, a, k) in enumerate(polished)]
g3 = np.random.default_rng(seed + 1000); nch = args.nfresh // args.chunk
accS = []; acc = [[] for _ in cands]
for c in range(nch):
    Bc, auxc = sample(args.chunk, g3)
    vS = lam_and_grad(aS, Bc, auxc, grad=False)[0]; accS.append(vS)
    for i, (_, a) in enumerate(cands): acc[i].append(lam_and_grad(a, Bc, auxc, grad=False)[0])
    del Bc, auxc
accS = np.array(accS); Sf = accS.mean(); seS = accS.std(ddof=1)/math.sqrt(nch)
print(f'fresh {args.nfresh:,} samples ({nch} chunks): S = {Sf:.7f} +- {seS:.1e} (row {CONST+Sf:.6f})  [{time.time()-t0:.0f}s]', flush=True)
summary = {'d': d, 'seed': seed, 'row': args.row, 'diffuse': args.diffuse, 'M': int(M), 'nopt': args.nopt, 'nfresh': args.nfresh, 'S_fresh': Sf, 'S_fresh_se': seS, 'S_sample': S, 'S0_sample': S0, 'row_const': CONST, 'cands': []}
accG = np.array(acc[1])   # the exact Gaussian-ideal argmax of d5k (sample-independent): the primary baseline
print('  (excess vs S: against the Gaussian point fitted on the optimisation sample; excess vs G: against d5k\'s exact Gaussian argmax, the primary baseline)')
for i, (name, a) in enumerate(cands):
    v = np.array(acc[i]); diff = v - accS; dm = diff.mean(); se = diff.std(ddof=1)/math.sqrt(nch)
    dG = v - accG; dGm = dG.mean(); seG = dG.std(ddof=1)/math.sqrt(nch)
    print(f'  {name:28s}: Lambda5 = {v.mean():.7f}  vs S = {dm:+.3e} +- {se:.1e}  vs G = {dGm:+.3e} +- {seG:.1e} ({dGm/seG if seG > 0 else 0:+.1f} s.e.)', flush=True)
    summary['cands'].append({'name': name, 'value': v.mean(), 'excess_vs_S': dm, 'se_S': se, 'excess_vs_G': dGm, 'se_G': seG, 'shells': shells(a)})
os.makedirs(args.out, exist_ok=True)
tag = f'd{d}_{args.row}_{args.diffuse}_{args.family}_s{seed}'
with open(os.path.join(args.out, f'k5_{tag}.json'), 'w') as f: json.dump(summary, f, indent=1, default=float)
np.savez(os.path.join(args.out, f'k5_{tag}_cands.npz'), labels=np.array([r.label for r in RECIPES]), aS=aS, aS0=aS0, **{f'cand{r}': a for r, (v, a, k) in enumerate(top)}, **{f'pol{r}': a for r, (v, a, k) in enumerate(polished)})
print(f'done [{time.time()-t0:.0f}s]')
