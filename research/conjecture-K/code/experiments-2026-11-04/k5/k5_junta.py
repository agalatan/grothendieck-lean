"""k5_junta.py: one-coordinate junta residual q = c H21(z2) (fourth moment m = 44) against the diffuse Gaussian q = sigma W at a row:
quadrature (d5k's grid; z2 = rho e^{i phi}, its phase absorbed in z1's angle) profiles in c and sigma with nu5 fixed at d5k's value,
then (c, nu5) and (sigma, nu5) re-optimised; optional Monte-Carlo confirmation of the gain on common samples (d = 2 machinery).
usage: k5_junta.py row [nfresh chunk]"""
import sys, math, time, numpy as np
from scipy.optimize import minimize
row = sys.argv[1]; nfresh = int(sys.argv[2]) if len(sys.argv) > 2 else 0; chunk = int(sys.argv[3]) if len(sys.argv) > 3 else 2_000_000
sys.argv = ['k5_attack.py', '2', '0', '--row', row]
exec(open('k5_attack.py').read().split('# ---------------------------------------------------------------- self test')[0])
import kmodel
def build(NR, NP_, NT, kind):
    r, wr = kmodel.gl(0, 5.5, NR, 6); w1 = wr*2*r*np.exp(-r*r); w1 /= w1.sum(); p, wp = kmodel.gl(0, 5.5, NP_, 6); w2 = wp*2*p*np.exp(-p*p); w2 /= w2.sum(); th = (np.arange(NT)+0.5)*2*np.pi/NT
    R, P, TH = np.meshgrid(r, p, th, indexing='ij'); Wt = (w1[:, None, None]*w2[None, :, None]*np.ones(NT)/NT).ravel(); z = (R*np.exp(1j*TH)).ravel(); U = np.abs(z)**2
    W = (P if kind == 'gauss' else P*(P*P - 2)/S2).ravel().astype(complex)   # |W| Rayleigh, or |H21(z2)| with its sign
    H21 = z*(U-2)/S2; H32 = z*(U*U-6*U+6)/np.sqrt(12); MA = W*(U-1); MB = np.conj(W)*z*z/S2; L = ELL*z + BETA*S2*H21; C1 = BA*MA + BB*MB
    def value(c, nu5):
        G3 = c*W; G5 = nu5*H32; C = c*C1
        return Wt@(np.abs(L+G5+G3-C) + np.abs(L+G5-G3+C)) - c*c/E1 + c*c*(BA*BA + BB*BB)/ETA - nu5*nu5/ETA
    return value
t0 = time.time(); grids = ((10, 8, 96), (16, 12, 384))
print(f'row {row}: t={T} ell={ELL} beta={BETA} bA={BA} bB={BB}; d5k adversary sigma={SIG0} nu5={NU50}; const={CONST:.6f}')
for NR, NP_, NT in grids:
    vg, vj = build(NR, NP_, NT, 'gauss'), build(NR, NP_, NT, 'H21')
    cs = [0, 0.02, 0.04, 0.05, 0.06, 0.065, 0.07, 0.08, 0.1, 0.12, 0.15, 0.2]
    base = vg(0.0, NU50)
    print(f'  grid {NR}x{NP_}x{NT}: nu5 = {NU50} fixed; Lambda5(q = 0) = {base:.7f}')
    print('    c     : ' + ' '.join(f'{c:9.3f}' for c in cs))
    print('    gauss : ' + ' '.join(f'{vg(c, NU50)-base:+9.2e}' for c in cs) + '   (sigma W, minus Lambda5(0))')
    print('    junta : ' + ' '.join(f'{vj(c, NU50)-base:+9.2e}' for c in cs) + '   (c H21(z2), minus Lambda5(0))')
    best = {}
    for name, v in (('gauss', vg), ('junta', vj)):
        bb = None
        for x0 in ((SIG0 if SIG0 > 0.01 else 0.05, NU50), (0.065, NU50), (0.2, NU50), (0.0, NU50)):
            rs = minimize(lambda x: -v(abs(x[0]), x[1]), np.array(x0), method='Nelder-Mead', options={'xatol': 1e-6, 'fatol': 1e-12, 'maxiter': 2000})
            if bb is None or rs.fun < bb.fun: bb = rs
        best[name] = (-bb.fun, abs(bb.x[0]), bb.x[1])
        print(f'    sup over ({"sigma" if name == "gauss" else "c"}, nu5) [{name}]: {-bb.fun:.7f} (row {CONST-bb.fun:.7f}) at {abs(bb.x[0]):.4f}, nu5 = {bb.x[1]:.5f}')
    print(f'    JUNTA GAIN over the Gaussian ideal: {best["junta"][0]-best["gauss"][0]:+.3e}   [{time.time()-t0:.0f}s]', flush=True)
if nfresh > 0:
    I_J = find(3, (0, 2), (0, 1), None)
    (sg, s_, n_g), (sj, c_, n_j) = best['gauss'], best['junta']
    aG = np.zeros(M, complex); aG[I_W] = s_; aG[I_H32] = n_g
    aJ = np.zeros(M, complex); aJ[I_J] = c_; aJ[I_H32] = n_j
    aJ2 = np.zeros(M, complex); aJ2[I_J] = c_; aJ2[I_H32] = n_g
    g = np.random.default_rng(99); nch = nfresh // chunk; acc = {k: [] for k in ('G', 'J', 'J2')}
    for ch in range(nch):
        Bc, auxc = sample(chunk, g)
        for k, a in (('G', aG), ('J', aJ), ('J2', aJ2)): acc[k].append(lam_and_grad(a, Bc, auxc, grad=False)[0])
    G_ = np.array(acc['G'])
    for k in ('J', 'J2'):
        dd = np.array(acc[k]) - G_; print(f'  MC {nfresh:,} common samples: Lambda5({k}) - Lambda5(G) = {dd.mean():+.3e} +- {dd.std(ddof=1)/math.sqrt(nch):.1e}   (quadrature: {(sj if k == "J" else vj(c_, n_g)) - sg:+.3e})  [{time.time()-t0:.0f}s]')
