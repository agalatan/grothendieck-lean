# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
# M2 numerics: contents of the degree-5 radial profiles in low remote chaoses against the fourth cumulant
# delta = E|q|^4 - 2u^2 and against the same-variance deficit D, on the one-spike family
# q = sigma (c H21(y) + sqrt(1-c^2) W) (contents and delta are additive over spikes, so the ratios hold for N equal spikes).
# Profiles (charge c_j, chaos H_j):  first-order Gamma_j of the five quintic shells (h-side) and of A/B (k-side, order 1);
# odd curvature profiles alpha, beta of z.Q (charge 0), whose sharing term with Q = i lam e11(y) is (1/2) Cov(e11^2, alpha+beta).
# Also the worst bounded profile: sup_{|r|<=1} content = (sum_bins |G_bin|)^2.  N.
import sys, os, json, math, time; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, spike2 as S2, d5eng as D
from scipy.interpolate import CubicSpline
FIRST = ['p10', 'p01', 'p21', 'p12', 'p30', 'rA', 'rB']
def run(rec, cs, sigs, nbins=400):
    M = S2.Model(rec, ny=(24, 6, 64), nw=(20, 6)); S5, ss = M.S5()
    idx = {n: i for i, n in enumerate(M.names)}; irz = idx['rz']
    al = CubicSpline(M.S, M.P[:, irz, irz]); be = CubicSpline(M.S, M.Q[:, irz, irz])
    gsp = {n: CubicSpline(M.S, M.G[:, idx[n]]) for n in FIRST}
    e11 = D.e_ab(1, 1, M.y); e22 = D.e_ab(2, 2, M.y)
    p1 = 1 / M.e1; out = dict(rec=rec, S5=S5, sstar=ss, pts=[])
    for c in cs:
        for sig in sigs:
            Wr = M.Wr if c < 1 else np.array([0.0]); wW = M.wW if c < 1 else np.array([1.0])
            q = sig * (c * M.Hy[:, None] + math.sqrt(max(1 - c * c, 0)) * Wr[None, :])
            w2 = (M.wy[:, None] * wW[None, :]).ravel(); q = q.ravel(); s = np.abs(q); sc = np.minimum(s, M.S[-1])
            ph = np.where(s > 0, q / np.maximum(s, 1e-300), 1.0); yi = np.repeat(np.arange(len(M.y)), len(Wr))
            F5 = w2 @ M.ps(sc); Dsv = M.B5(sig * sig) - F5; Vsl = S5 - (M.B5(sig * sig) - M.costq(sig))
            delta = 42 * c ** 4 * sig ** 4
            rec_pt = dict(c=c, sig=sig, delta=delta, D=Dsv, Vsl=Vsl, content={}, worst={})
            bins = np.minimum((sc / M.S[-1] * nbins).astype(int), nbins - 1)
            for n in FIRST:
                j = idx[n]; cj = M.ch[j]; h = M.h[j][yi]
                g = ph ** cj * np.conj(h)
                val = gsp[n](sc); cont = abs(w2 @ (val * g)) ** 2
                # worst bounded profile with the same oscillation as Gamma_j around its mean (|r - mean| <= osc)
                Gb = np.zeros(nbins, complex); np.add.at(Gb, bins, w2 * g)
                osc = float(np.max(np.abs(gsp[n](M.S[:121]) - gsp[n](M.S[0]))))
                rec_pt['content'][n] = float(cont); rec_pt['worst'][n] = float((np.abs(Gb).sum() * osc) ** 2)
            # odd sharing with the spike coordinate: Q = i lam e11(y)
            a_b = al(sc) + be(sc); m11 = w2 @ (np.abs(e11[yi]) ** 2)
            cov = w2 @ (np.abs(e11[yi]) ** 2 * a_b) - m11 * (w2 @ a_b)
            rec_pt['odd'] = dict(ratio_shared=float(0.5 * (w2 @ (np.abs(e11[yi]) ** 2 * a_b)) / m11 / p1),
                                 ratio_mean=float(0.5 * (w2 @ a_b) / p1), cov=float(cov),
                                 c11a=float(abs(w2 @ (al(sc) * e11[yi])) ** 2), c22a=float(abs(w2 @ (al(sc) * np.conj(e22[yi]))) ** 2))
            out['pts'].append(rec_pt)
    return out
if __name__ == '__main__':
    rec = json.loads(sys.argv[1]); cs = [float(x) for x in sys.argv[3].split(',')]; sigs = [float(x) for x in sys.argv[4].split(',')]
    t0 = time.time(); o = run(rec, cs, sigs); o['secs'] = time.time() - t0
    json.dump(o, open(sys.argv[2], 'w'), indent=1); print('done t=%.3f %.0fs' % (rec['t'], o['secs']))
