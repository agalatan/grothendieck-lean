#!/usr/bin/env python3
# Reviewer: Theorem 1 of the shared-factors package and its two families.
#  A (exact quadrature): the moment identities (5), Var A = 2 tr J and the vector identity (2) for h = v, v^2, on random
#     Hermitian families sharing one block (d = 2 with three factors, d = 3 with two and four factors).
#  B (linear algebra, random families): e^T K e <= tr J, 4 e^T T e <= tr J, (e.v)^2 <= tr M e^T T e, lambda_max(K + 4vv^T/u) <= 2 tr J.
#  C the Hermitian-basis family: M = I, R = dI, T = (dI + tt^T)/2, v = dt, tr J, lambda_max = 1 + 7d, and
#     A = (|Y|^2 - 1)^2 + d - 1, e.P = (|Y|^2 - d)/sqrt d, N_e = [(A - u)(|Y|^2 - d) + 2(|Y|^4 - |Y|^2)]/sqrt d for e = t/sqrt d.
#  D (N) sharp profile-free constants theta* and the row profiles' ratios for the basis family (a one-dimensional law).
#  E (N) the same for n independent equal rank-one factors (lattice convolution), against (1/3)(1 + 4/n) [formula (1)],
#     (23/50 + (227/50)/n)/3 [section 2] and the 39/16 of the codex-a786 block package.
#   argv: <scripts dir> <data dir> <out json>
import sys, json, math, itertools
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L, proflib as PL
DATA = sys.argv[2]
rng = np.random.default_rng(5)

def rand_herm(d, scale=1.0, rank=None):
    Z = rng.standard_normal((d, d)) + 1j * rng.standard_normal((d, d)); H = (Z + Z.conj().T) / 2
    if rank is not None:
        w, U = np.linalg.eigh(H); w[np.argsort(np.abs(w))[:d - rank]] = 0; H = (U * w) @ U.conj().T
    return scale * H

def structure(H):
    p = len(H); tr = lambda A: float(np.trace(A).real)
    S = [[(H[i] @ H[j] + H[j] @ H[i]) / 2 for j in range(p)] for i in range(p)]
    M = np.array([[tr(H[i] @ H[j]) for j in range(p)] for i in range(p)])
    G = sum(h @ h for h in H)
    R = np.array([[tr(G @ S[i][j]) for j in range(p)] for i in range(p)])
    T = np.array([[sum(tr(S[k][i] @ S[k][j]) for k in range(p)) for j in range(p)] for i in range(p)])
    v = np.array([tr(G @ H[i]) for i in range(p)])
    return dict(S=S, M=M, R=R, T=T, v=v, J=M @ M + R + 2 * T, K=M @ M + T + 2 * R, u=float(np.trace(M)))

print('A. moment identities by exact Gauss-Hermite quadrature')
def partA(d, p, nq=9):
    H = [rand_herm(d) for _ in range(p)]; st = structure(H)
    x, w = np.polynomial.hermite_e.hermegauss(nq); w = w / w.sum()
    grids = np.array(np.meshgrid(*([x] * (2 * d)), indexing='ij')).reshape(2 * d, -1)
    W = np.ones(1)
    for _ in range(2 * d): W = np.multiply.outer(W, w)
    W = W.ravel()
    Y = (grids[0::2] + 1j * grids[1::2]) / math.sqrt(2)             # d x npts
    quad = lambda A: np.einsum('an,ab,bn->n', Y.conj(), A, Y).real
    P = np.array([quad(H[i]) - np.trace(H[i]).real for i in range(p)])
    B = [[quad(st['S'][i][j]) for j in range(p)] for i in range(p)]
    A = (P ** 2).sum(0); u = float(W @ A)
    err = {}
    err['u'] = abs(u - st['u'])
    err['E B^2'] = max(abs(float(W @ sum(B[i][k] * B[k][j] for k in range(p))) - (st['M'] @ st['M'] + st['T'])[i, j]) for i in range(p) for j in range(p))
    err['E (A-u)B'] = max(abs(float(W @ ((A - u) * B[i][j])) - 2 * st['R'][i, j]) for i in range(p) for j in range(p))
    err['E (A-u)P'] = max(abs(float(W @ ((A - u) * P[i])) - 2 * st['v'][i]) for i in range(p))
    BP = np.array([sum(B[i][j] * P[j] for j in range(p)) for i in range(p)])
    err['E BP'] = max(abs(float(W @ BP[i]) - st['v'][i]) for i in range(p))
    err['Var A'] = abs(float(W @ (A - u) ** 2) - 2 * np.trace(st['J']))
    N = P * (A - u) + 2 * BP
    err['(2), h=v'] = max(abs(2 * float(W @ (P[i] * A)) - float(W @ N[i])) for i in range(p))             # E tau^2 = 2;  k' = 1
    err['(2), h=v^2'] = max(abs(6 * float(W @ (P[i] * A * A)) - float(W @ ((4 * A + 2 * u) * N[i]))) for i in range(p))
    scale = max(1.0, float(np.trace(st['J'])))
    print('   d = %d, %d factors (random Hermitian, non-commuting): ' % (d, p) + ', '.join('%s %.0e' % (k, v / scale) for k, v in err.items()))
    assert max(err.values()) < 1e-9 * scale
partA(2, 3); partA(3, 2); partA(3, 4, nq=7)

print('B. the inequalities behind theta <= 5/3 on random families')
worst = dict(K=0.0, T=0.0, v=0.0, lam=0.0); nfam = 0
for d in (1, 2, 3, 5):
    for p in (1, 2, 3, 6):
        for rep in range(60):
            kind = rep % 4
            if kind == 0: H = [rand_herm(d, scale=rng.uniform(0.1, 3)) for _ in range(p)]
            elif kind == 1: H = [np.diag(rng.standard_normal(d)).astype(complex) for _ in range(p)]         # commuting
            elif kind == 2: H = [rand_herm(d, rank=1) for _ in range(p)]
            else: H = [rand_herm(d) * (10.0 ** rng.uniform(-2, 1)) for _ in range(p)]
            st = structure(H); trJ = float(np.trace(st['J'])); nfam += 1
            if trJ <= 0: continue
            for _ in range(5):
                e = rng.standard_normal(p); e /= np.linalg.norm(e)
                worst['K'] = max(worst['K'], float(e @ st['K'] @ e) / trJ)
                worst['T'] = max(worst['T'], 4 * float(e @ st['T'] @ e) / trJ)
                worst['v'] = max(worst['v'], float(e @ st['v']) ** 2 / max(st['u'] * float(e @ st['T'] @ e), 1e-300))
            worst['lam'] = max(worst['lam'], float(np.linalg.eigvalsh(st['K'] + 4 * np.outer(st['v'], st['v']) / st['u'])[-1]) / (2 * trJ))
print('   %d families: max e^T K e / tr J = %.4f, max 4 e^T T e / tr J = %.4f, max (e.v)^2/(tr M e^T T e) = %.4f, max lambda_max(K + 4vv^T/u)/(2 tr J) = %.6f  (all must be <= 1; the last is 1 at one rank-one factor)' % (
    nfam, worst['K'], worst['T'], worst['v'], worst['lam']))
assert max(worst.values()) <= 1 + 1e-9

print('C. the Hermitian-basis family')
def herm_basis(d):
    Hs = []
    for a in range(d):
        E = np.zeros((d, d), complex); E[a, a] = 1; Hs.append(E)
    for a in range(d):
        for b in range(a + 1, d):
            E = np.zeros((d, d), complex); E[a, b] = E[b, a] = 1 / math.sqrt(2); Hs.append(E)
            E = np.zeros((d, d), complex); E[a, b] = -1j / math.sqrt(2); E[b, a] = 1j / math.sqrt(2); Hs.append(E)
    return Hs
for d in (2, 3, 4, 5):
    H = herm_basis(d)
    # a random real-orthogonal change of the basis, to test basis independence
    O = np.linalg.qr(rng.standard_normal((d * d, d * d)))[0]
    H = [sum(O[i, j] * H[j] for j in range(d * d)) for i in range(d * d)]
    st = structure(H); t = np.array([np.trace(h).real for h in H]); I = np.eye(d * d)
    errs = [np.abs(st['M'] - I).max(), np.abs(st['R'] - d * I).max(), np.abs(st['T'] - (d * I + np.outer(t, t)) / 2).max(), np.abs(st['v'] - d * t).max(),
            abs(np.trace(st['J']) - (d * d * (1 + 2 * d) + d)), abs(np.linalg.eigvalsh(st['K'] + 4 * np.outer(st['v'], st['v']) / st['u'])[-1] - (1 + 7 * d))]
    Yv = (rng.standard_normal(d) + 1j * rng.standard_normal(d)) / math.sqrt(2); Rr = float(np.vdot(Yv, Yv).real)
    Pv = np.array([np.vdot(Yv, h @ Yv).real - np.trace(h).real for h in H]); Av = float(Pv @ Pv); e = t / math.sqrt(d)
    Bm = np.array([[np.vdot(Yv, st['S'][i][j] @ Yv).real for j in range(d * d)] for i in range(d * d)])
    Ne = float(e @ ((Av - d * d) * Pv + 2 * Bm @ Pv))
    errs += [abs(Av - ((Rr - 1) ** 2 + d - 1)), abs(float(e @ Pv) - (Rr - d) / math.sqrt(d)), abs(Ne - ((Av - d * d) * (Rr - d) + 2 * (Rr * Rr - Rr)) / math.sqrt(d))]
    print('   d = %d (rotated basis of %d matrices): largest defect of M, R, T, v, tr J, lambda_max and of the three closed forms at a random Y: %.1e' % (d, d * d, max(errs)))
    assert max(errs) < 1e-9 * d ** 4

# ---------------------------------------------------------------------------------------------------------------
TAU, WTAU = L.panels(list(np.linspace(0, 8, 21)) + list(np.linspace(8, 48, 11)[1:]), 8); WTAU = WTAU * np.exp(-TAU)
from scipy.interpolate import CubicSpline
_KP = {}
def kp_fun(pr, u):
    """k'(s^2) as a function of s: a spline on [0, 3.6], the frozen-profile asymptote beyond."""
    key = (id(pr), round(u, 12))
    if key not in _KP:
        sg = np.linspace(0, 3.6, 1441); kp, _ = PL.transforms(pr, u, sg ** 2); sp = CubicSpline(sg, kp)
        _KP[key] = lambda s_, sp=sp, g=pr.Ginf: np.where(s_ <= 3.6, sp(np.minimum(s_, 3.6)), -g / (2 * np.maximum(s_, 3.6) ** 3))
    return _KP[key]

def sharp(a, f, nu, u0, L0, nv=900):
    """theta* = (2/3)(int zker^2/(v p_V) dv + (int zker)^2/u0)/(2 L0) for a conditional Gaussian model:
    nodes a of the conditional variance A with masses f, and nu = E[N_e; A in da] (N_e = e.{(A-u)I + 2B}P)."""
    amax = float(a.max())
    v, wv = L.panels([0.0] + L.geom_edges(1e-7 * u0, 0.02 * u0) + list(np.linspace(0.02 * u0, 6 * u0, 301)[1:]) + list(np.geomspace(6 * u0, 80 * amax, 400)[1:]), 6)
    pV = np.zeros(len(v)); zk = np.zeros(len(v))
    for i in range(0, len(v), 200):
        E = np.exp(-v[i:i + 200][:, None] / a[None, :])
        pV[i:i + 200] = E @ (f / a); zk[i:i + 200] = v[i:i + 200] * (E @ (nu / a ** 2))
    pos = pV > 1e-300
    return dict(mass=float(wv @ pV), EV=float(wv @ (v * pV)), EZ=float(wv @ zk), proj=float(wv[pos] @ (zk[pos] ** 2 / (v[pos] * pV[pos]))),
                theta=(2 / 3) * (float(wv[pos] @ (zk[pos] ** 2 / (v[pos] * pV[pos]))) + float(wv @ zk) ** 2 / u0) / (2 * L0))

def row_ratio(a, f, pi, u0, L0, pr, u):
    """||c||^2/(delta Omega_hat) for the model scaled to energy u, profile pr (PL.Prof):  c_e = sigma E[(e.P) tau h(sigma^2 A tau)]."""
    sig2 = u / u0
    V = sig2 * a[:, None] * TAU[None, :]                                 # (na, ntau)
    s = np.sqrt(V)
    Gs = pr.G(s.ravel()).reshape(s.shape)
    c = float(pi @ ((np.sqrt(TAU)[None, :] / np.sqrt(a)[:, None] * Gs) @ WTAU))       # sigma tau h(V) = sqrt(tau/a) G(s)
    kp = kp_fun(pr, u)(s)
    EVk2 = float(f @ ((V * kp * kp) @ WTAU)); EVk = float(f @ ((V * kp) @ WTAU))
    Om = 1.5 * EVk2 - 0.75 * EVk * EVk / u
    return c * c / (sig2 ** 2 * 2 * L0 * Om)

profs = {}
for t in ('0.80', '0.82', '0.84', '0.845', '0.85', '0.855'):
    npz = np.load('%s/prof_jets_%s.npz' % (DATA, t)); profs[t] = (float(npz['ustar']), float(npz['theta']), PL.Prof(npz, 0), PL.Prof(npz, 1))

out = dict(basis=[], rank1=[])
print('D. the Hermitian-basis family (N): chi, sharp theta*, formula (1), and the largest ratio of the row profiles over u/u* in {0.5, 0.75, 1, 1.3}')
print('   %3s %7s | %9s %9s | %s' % ('d', 'chi', 'theta*', 'thm 1', '  '.join('t=%s' % t for t in profs)))
for d in (2, 4, 7, 8, 12, 20):
    from scipy.special import gammaln
    Rn, wR = L.panels(np.linspace(0, d + 14 * math.sqrt(d) + 30, 1401), 8); wR = wR * np.exp((d - 1) * np.log(Rn) - Rn - gammaln(d))
    Rc, wc = L.panels(np.linspace(0, d + 14 * math.sqrt(d) + 30, 141), 6); wc = wc * np.exp((d - 1) * np.log(Rc) - Rc - gammaln(d)); ac = (Rc - 1) ** 2 + d - 1
    a = (Rn - 1) ** 2 + d - 1; u0 = d * d; L0 = 2 * (d * d * (1 + 2 * d) + d)
    pi = wR * (Rn - d) / math.sqrt(d); nu = wR * ((a - u0) * (Rn - d) + 2 * (Rn * Rn - Rn)) / math.sqrt(d)
    sh = sharp(a, wR, nu, u0, L0)
    assert abs(sh['mass'] - 1) < 1e-6 and abs(sh['EV'] / u0 - 1) < 1e-6 and abs(sh['EZ'] - 4 * d * math.sqrt(d)) < 1e-5 * d * d, sh
    th1 = (1 + 2 * (1 + 7 * d) / (d * d * (1 + 2 * d) + d)) / 3
    rr = []
    for t, (us, th, pA, pB) in profs.items():
        rr.append(max(row_ratio(ac, wc, wc * (Rc - d) / math.sqrt(d), u0, L0, pr, fr * us) for pr in (pA, pB) for fr in (0.5, 0.75, 1.0, 1.3)))
    print('   %3d %7.4f | %9.5f %9.5f | %s' % (d, 2 * L0 / u0 ** 2, sh['theta'], th1, '  '.join('%.4f' % x for x in rr)), flush=True)
    assert sh['theta'] <= th1 and max(rr) <= sh['theta'] * (1 + 1e-3)
    out['basis'].append(dict(d=d, chi=2 * L0 / u0 ** 2, tstar=sh['theta'], thm1=th1, rows=rr))

print('E. n independent equal rank-one factors X_j(|Y_j|^2 - 1) (N): chi = 16/n')
print('   %3s %7s | %9s %11s %12s %8s | %s' % ('n', 'chi', 'theta*', '(1+4/n)/3', 'section 2', 'codex', '  '.join('t=%s' % t for t in profs)))
hgrid = 0.004; ncell = 1 << 19
edges = np.arange(ncell + 1) * hgrid; sq = np.sqrt(edges)
lo = np.maximum(1 - sq, 0.0)
Fcdf = np.exp(-lo) - np.exp(-(1 + sq))                       # P((T-1)^2 <= r)
Gcdf = -(1 + sq) * np.exp(-(1 + sq)) + lo * np.exp(-lo)      # E[(T-1); (T-1)^2 <= r]
mf = np.diff(Fcdf); mg = np.diff(Gcdf)
mf[-1] += 1 - Fcdf[-1]
FF = np.fft.rfft(mf, 2 * ncell); FG = np.fft.rfft(mg, 2 * ncell)
for n in (1, 2, 3, 4, 5, 6, 7, 8, 10, 16):
    mA = np.fft.irfft(FF ** n, 2 * ncell); sg = n * np.fft.irfft(FG * FF ** (n - 1), 2 * ncell)
    # a sum of n cell midpoints: (k + n/2) h
    acell = (np.arange(2 * ncell) + n / 2) * hgrid
    keep = mA > 1e-14
    # coarsen to bins of relative width 0.4 % (mass-weighted centroids)
    idx = np.floor(np.log(np.maximum(acell, hgrid) / hgrid) / 0.004).astype(int); idx[~keep] = -1
    nb = idx.max() + 1; sel = idx >= 0
    m_b = np.bincount(idx[sel], weights=mA[sel], minlength=nb); s_b = np.bincount(idx[sel], weights=sg[sel], minlength=nb)
    a_b = np.bincount(idx[sel], weights=(mA * acell)[sel], minlength=nb) / np.maximum(m_b, 1e-300)
    ok = m_b > 1e-25; a, f, sgm = a_b[ok], m_b[ok], s_b[ok]
    idc = idx // 5; selc = idc >= 0; nbc = idc.max() + 1                      # bins of relative width 2 % for the row profiles
    mc = np.bincount(idc[selc], weights=mA[selc], minlength=nbc); sc = np.bincount(idc[selc], weights=sg[selc], minlength=nbc)
    acn = np.bincount(idc[selc], weights=(mA * acell)[selc], minlength=nbc) / np.maximum(mc, 1e-300); okc = mc > 1e-25
    acn, mc, sc = acn[okc], mc[okc], sc[okc]
    u0 = float(n); L0 = 8.0 * n
    pi = sgm / math.sqrt(n); nu = ((a - n + 2) * sgm + 2 * a * f) / math.sqrt(n)
    chk = (float(f.sum()), float(f @ a) / n, float(f @ a * 0 + (f @ (a - n) ** 2)) / (8 * n), float(pi @ a) * math.sqrt(n) / (2 * n))    # mass, E A/n, Var A/(8n), E[S1 A]/(2n)
    sh = sharp(a, f, nu, u0, L0)
    th1 = (1 + 4 / n) / 3; th2 = (23 / 50 + (227 / 50) / n) / 3
    rr = []
    for t, (us, th, pA, pB) in profs.items():
        rr.append(max(row_ratio(acn, mc, sc / math.sqrt(n), u0, L0, pr, fr * us) for pr in (pA, pB) for fr in (0.5, 0.75, 1.0, 1.3)))
    print('   %3d %7.3f | %9.5f %11.5f %12.5f %8.4f | %s   [checks: mass %.6f, E A/n %.5f, Var A/8n %.4f, E[S A]/2n %.4f, int zker/(4 sqrt n) %.5f]' % (
        n, 16 / n, sh['theta'], th1, th2, 39 / 16, '  '.join('%.4f' % x for x in rr), chk[0], chk[1], chk[2], chk[3], sh['EZ'] / (4 * math.sqrt(n))), flush=True)
    assert sh['theta'] <= min(th1, th2) * (1 + 2e-3) and max(rr) <= sh['theta'] * (1 + 2e-3)
    out['rank1'].append(dict(n=n, chi=16 / n, tstar=sh['theta'], thm1=th1, sec2=th2, rows=rr))
json.dump(out, open(sys.argv[3], 'w'), indent=1)
print('ALL OK')
