# [copy from research/higher-degree/code/degree5-content/ or degree5-cert/content5/code/ (the content study of claude-b9ee's workers);
#  claude-b9ee worker d5newcap, 16 Nov 2026: the game constants come from the environment (D5_E1, D5_ETA) and Clarabel is
#  single-threaded; nothing else changed unless noted]
# Transfer of ledger 11.49 (shifted-resolvent content bound) to the capped A/B profiles.  N.
#   For Phi(x) = ph(x) G(|x|) (G = GA or GB) and energy u:  Psi_u = int_0^inf e^{t/3} P_t Phi dt = ph(x) psi_u(R),
#   P_t the 2-D OU semigroup with invariant complex variance u.  Then (content_sector) <= (2/3) delta sup_R N(R),
#   N = max{(3A^2 - 2AB + 3B^2)/8, B^2},  A = psi'' (from the radial resolvent ODE), B = (psi/R)'.
#   tau = e^{-t} = w^3:  psi_u(R) = int_0^1 3 w^{-2} S_{u(1-w^6)}(w^3 R) dw,  S_b2(r) = E_W[G(|r+bW|) Re ph(r+bW)].
import sys, json
import numpy as np, rowlib as R
from scipy.interpolate import CubicSpline

def smooth_charge1(G, b2, r, nth=48):
    t1, w1 = R.gl_panels(0.0, 2.0, 6); t2, w2 = R.gl_panels(2.0, 40.0, 10)
    Tw = np.concatenate([t1, t2]); ww = np.concatenate([w1, w2]) * np.exp(-Tw)
    th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
    W = (np.sqrt(Tw)[:, None] * np.exp(1j * th)[None, :]).ravel(); wq = (ww[:, None] * np.ones(nth)[None, :] / nth).ravel()
    b = np.sqrt(b2); out = np.zeros(len(r))
    for i in range(0, len(r), 128):
        a = r[i:i + 128][:, None] + b * W[None, :]; s = np.abs(a)
        out[i:i + 128] = (G(s) * np.real(a / np.maximum(s, 1e-300))) @ wq
    return out

def gamma_struct(row, G, u, Rg=None, nw=40):
    Rg = np.linspace(0, 3.0, 601) if Rg is None else Rg
    wn, wv = R.gl_panels(0.0, 1.0, nw // 8)
    psi = np.zeros(len(Rg))
    for w, wt in zip(wn, wv):
        b2 = u * (1 - w ** 6)
        S = smooth_charge1(G, b2, w ** 3 * Rg) if b2 > 1e-12 else G(w ** 3 * Rg)
        psi += wt * 3 * w ** -2 * S
    sp = CubicSpline(Rg, psi); d1 = sp(Rg, 1)
    Rs = Rg[1:]; p = psi[1:]; dp = d1[1:]
    B = dp / Rs - p / Rs ** 2
    A = (2 / u) * (Rs * dp - p / 3 - G(Rs)) - dp / Rs + p / Rs ** 2
    N = np.maximum((3 * A * A - 2 * A * B + 3 * B * B) / 8, B * B)
    i = int(np.argmax(N))
    return dict(u=u, gamma=float(2 / 3 * N[i]), Rmax=float(Rs[i]), A=float(A[i]), B=float(B[i]),
                Nprof=[float(x) for x in N[::20]], Rprof=[float(x) for x in Rs[::20]])

if __name__ == '__main__':
    k = int(sys.argv[1]); row = R.Row('out/prof_%d.npz' % k); us = [float(x) for x in sys.argv[2].split(',')] if len(sys.argv) > 2 else None
    if us is None:
        us0 = row.ustar; us = sorted(set([round(f * us0, 6) for f in (0.1, 0.25, 0.5, 0.75, 1.0, 1.25, 1.6, 2.2)]))
    res = dict(t=row.t, ustar=row.ustar, A=[], B=[])
    for u in us:
        ga = gamma_struct(row, row.ga, u); gb = gamma_struct(row, row.gb, u)
        res['A'].append(ga); res['B'].append(gb)
        j = row.junta(np.sqrt(u))
        print('t=%.3f u=%.5f  gammaA=%.5f (R=%.3f)  gammaB=%.5f (R=%.3f)  sum=%.5f | junta cA/d=%.5f cB/d=%.5f sum=%.5f' % (
            row.t, u, ga['gamma'], ga['Rmax'], gb['gamma'], gb['Rmax'], ga['gamma'] + gb['gamma'], j['cA'] / j['delta'], j['cB'] / j['delta'], (j['cA'] + j['cB']) / j['delta']), flush=True)
    json.dump(res, open('out/gres_%d.json' % k, 'w'), indent=1)
