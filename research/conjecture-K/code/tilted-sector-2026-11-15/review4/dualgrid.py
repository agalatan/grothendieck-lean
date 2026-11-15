# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; the 119 Stein duals checked on a grid up to 10^4, with G rebuilt from the proof and the reviewer's own h.
# claude reviewer (N): Q(x) - h(u x) - G(x) >= 0 on a grid, G rebuilt from the proof's formula (deficit_dual_proof.md (4)),
# h from my own first-principles table (not the author's caps).
import json, numpy as np, os, sys
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE)
import fam
AUTH = '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/'
w = json.load(open(AUTH + 'deficit_dual_cover_witness.json'))
x = np.concatenate([np.linspace(0, 4, 40001)[1:], np.linspace(4, 100, 9601)[1:], np.geomspace(100, 1e4, 2001)[1:]])
worst = []
for m in w['accepted_models']:
    r = m['row']; f = lambda s: float(Fr(s))
    u = f(r['v']); kn = np.array([f(k) for k in r['knots']]); ph = np.array([f(p) for p in r['phi']])
    P = [f(c) for c in r['coefficients']]; beta, t, lam, mu, nu = (f(r[k]) for k in ['beta', 't', 'lam', 'mu', 'nu'])
    phi = np.interp(x, kn, ph)                       # constant after last knot
    # Phi(x) = int_0^x phi: exact for piecewise affine
    seg = np.concatenate([[0], np.cumsum(np.diff(kn)*(ph[1:] + ph[:-1])/2)])
    j = np.clip(np.searchsorted(kn, x, side='right') - 1, 0, len(kn) - 1)
    Phi = seg[j] + (phi + ph[j])/2*(x - kn[j])
    d = phi - Phi/x
    f0 = -(phi + beta)/2 + (2*t + lam/3)*x; g0 = -d/2 + (t + mu/3 - nu/2)*x
    G = f0**2/lam + g0**2/mu + Phi - phi + (nu/3 - 2*t)*(x*x - 2)
    Qx = P[0] + P[1]*x + P[2]*x*x + P[3]*x**3
    gap = Qx - 2*fam.EN(np.sqrt(u*x)) - G
    i = gap.argmin(); worst.append((gap[i], m['index'], u, x[i]))
worst.sort(); print('min over 119 duals of min_x [Q - h(ux) - G] =', worst[0], '  #negative', sum(g[0] < 0 for g in worst))
print('five smallest:', [(round(g[0], 9), g[1], g[2], round(g[3], 3)) for g in worst[:5]])
