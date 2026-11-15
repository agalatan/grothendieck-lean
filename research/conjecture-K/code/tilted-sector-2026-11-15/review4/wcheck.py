# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; the shape envelopes W of the last four rows against |k_u| (runs the first part of kcheck2.py).
import numpy as np, sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
src = open(os.path.join(os.path.dirname(os.path.abspath(__file__)), 'kcheck2.py')).read().split('xg = np.linspace')[0]
exec(src)
xg = np.concatenate([np.linspace(1e-4, 0.02, 200), np.linspace(0.02, 6, 3000)])
for tag, u in [('absolute30', 0.03), ('absolute35', 0.035), ('absolute', 0.04), ('absolute44', 0.044)]:
    W, w = hermite_W('deficit_structure_content_witness_%s.json' % tag)
    for uu in (u, 0.0463):
        k = k_u(uu, xg); g = W(xg) - np.abs(k); i = g.argmin(); rel = g/np.maximum(W(xg), 1e-12)
        print(tag, 'u=%.4f' % uu, ' min_{x>0}(W-|k|)=%.2e at x=%.4f  min rel gap=%.2e at x=%.4f  W(0.999)=%.4f |k(1)|=%.4f sup_{x>=1}|k|=%.4f'
              % (g.min(), xg[i], rel.min(), xg[rel.argmin()], W(np.array([0.999]))[0], abs(k_u(uu, np.array([1.0]))[0]), np.abs(k[xg >= 1]).max()))
    D0 = float(Q(w['derivatives'][0]))
    print("   W'(0)=%.5f   k_u'(0) at u_lo ~ %.5f" % (D0, k_u(u, np.array([1e-5]))[0]/1e-5))
