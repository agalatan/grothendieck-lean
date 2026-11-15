# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; 288 random two-variable cubics against (1), the gamma rows, the Stein duals and the sixth-moment bound; output two_var.log.
# claude reviewer (N): random two-variable genuine (2,1) Wick cubics; F, D, chi, true content; tests against
# (1), the gamma rows, the Stein duals at the nodes, and the inherited sixth-moment bound.
import numpy as np, json, os, sys
from fractions import Fraction as Q
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE)
import fam
AUTH = '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/'
C6 = 4045313/100000
r, wr = fam.radial(24, 10)
nd = 48; Dl = 2*np.pi*np.arange(nd)/nd
R1, R2, DD = np.meshgrid(r, r, Dl, indexing='ij'); W = (wr[:, None, None]*wr[None, :, None])/nd
y1 = R1.astype(complex); y2 = R2*np.exp(1j*DD)
basis = [y1*y1*np.conj(y1) - 2*y1, y1*y1*np.conj(y2), y2*(np.abs(y1)**2 - 1), y1*(np.abs(y2)**2 - 1), y2*y2*np.conj(y1), y2*y2*np.conj(y2) - 2*y2]
def evaluate(c, u):
    q = sum(ci*e for ci, e in zip(c, basis)); m2 = np.sum(W*np.abs(q)**2); q = q*np.sqrt(u/m2)
    A = np.abs(q); m4 = np.sum(W*A**4); m6 = np.sum(W*A**6)
    F = np.sum(W*2*fam.EN(A)); Ph = fam.Phi(q)
    b1 = np.sum(W*Ph*np.conj(y1)); b2 = np.sum(W*Ph*np.conj(y2))
    return dict(u=u, chi=m4/u**2 - 2, F=float(F), C2=float(abs(b1)**2 + abs(b2)**2), EU3=m6/u**3)
dual = json.load(open(AUTH + 'deficit_dual_cover_witness.json'))
models = {}
for m in dual['accepted_models']:
    models.setdefault(float(Q(m['u'])), []).append(list(map(lambda s: float(Q(s)), m['row']['coefficients'])))
FP = lambda P, chi: P[0] + P[1] + P[2]*(2 + chi) + P[3]*(6 + 9*chi + C6*chi**1.5)
def gamma(u):
    out = 251/5000
    for e, v in [(12e-3, 121/2500), (15e-3, 467/10000), (18e-3, 451/10000), (2e-2, 441/10000), (25e-3, 1859/43200),
                 (3e-2, 3/80), (35e-3, 71/2000), (4e-2, 17/500), (44e-3, 13/400)]:
        if u >= e - 1e-15: out = v
    return out
rng = np.random.default_rng(20261115)
# sanity: pure monomial e1 has chi = 42, EU3 = 11352
print('monomial check', evaluate([1, 0, 0, 0, 0, 0], 0.0463))
print('y1^2 conj(y2) check (chi 10)', evaluate([0, 1, 0, 0, 0, 0], 0.0463)['chi'], '  y2(|y1|^2-1) (chi 16)', evaluate([0, 0, 1, 0, 0, 0], 0.0463)['chi'])
worst = dict(dual=(9, None), eq1=(9, None), ratio=(0, None), m6=(1e9, None))
for trial in range(36):
    c = rng.normal(size=6) + 1j*rng.normal(size=6)
    if trial % 3 == 0: c[rng.integers(6)] *= 4
    for u in sorted(models)[::2] + [0.0463]:
        rr = evaluate(c, u); Bu = fam.Bgauss(u); D = Bu - rr['F']
        e1 = 0.3*max(D, 0) + 6e-6 - rr['C2']
        if e1 < worst['eq1'][0]: worst['eq1'] = (e1, rr, D)
        ratio = rr['C2']/(rr['chi']*u*u)/gamma(u)
        if ratio > worst['ratio'][0]: worst['ratio'] = (ratio, rr)
        m6 = 6 + 9*rr['chi'] + C6*rr['chi']**1.5 - rr['EU3']
        if m6 < worst['m6'][0]: worst['m6'] = (m6, rr)
        if u in models:
            s = min(FP(P, rr['chi']) for P in models[u]) - rr['F']
            if s < worst['dual'][0]: worst['dual'] = (s, rr)
for k, v in worst.items(): print(k, v)
