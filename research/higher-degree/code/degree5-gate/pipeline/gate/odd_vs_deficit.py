# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
# Odd pointwise excess E[Emax(|q|)] against the q-only deficit for the one-spike family (c in [0,1]) at a row.  N.
import sys, os, json, math; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, spike2 as S2
k = int(sys.argv[1]); rec = json.loads(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'rows5.lines')).read().split('\n')[k - 1])
h = json.load(open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'out', 'h11c_%d.json' % k)))
S = np.array([r['s'] for r in h['pointwise']]); Em = np.array([r['Emax'] for r in h['pointwise']])
M = S2.Model(rec, ny=(24, 6, 64), nw=(20, 6)); S5, ss = M.S5()
for c in (0.0, 0.3, 0.6, 0.8, 1.0):
    for sig in (0.1, 0.2, 0.3, rec['sig']):
        Wr = M.Wr if c < 1 else np.array([0.0]); wW = M.wW if c < 1 else np.array([1.0])
        q = sig * (c * M.Hy[:, None] + math.sqrt(max(1 - c * c, 0)) * Wr[None, :]); w2 = (M.wy[:, None] * wW[None, :]).ravel(); s = np.abs(q).ravel()
        odd = float(w2 @ np.interp(s, S, Em, right=0.0)); F5 = float(w2 @ M.ps(np.minimum(s, M.S[-1]))); D = M.B5(sig * sig) - F5
        Vsl = S5 - (M.B5(sig * sig) - M.costq(sig))
        print('t=%.2f c=%.1f sig=%.3f  odd_excess=%.2e  deficit=%.2e  Vsl=%.2e  net(odd - D - Vsl)=%+.2e' % (rec['t'], c, sig, odd, D, Vsl, odd - D - Vsl), flush=True)
