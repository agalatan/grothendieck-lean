# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; can the boxes that use the unreviewed content branches be re-certified with the reviewed ones (floating point).
# claude reviewer (N): can the boxes that use the unreviewed content branches (tensor 3 delta^{3/2}, uniform 1/2500)
# be re-certified with the remaining branches (linear gamma*delta or 2/25 delta, energy 19321e-6 u), using the
# author's own accepted duals/caps and benchmark values?  Floating point only; a 'yes' would still need an exact re-run.
import json, numpy as np
from fractions import Fraction as Q
AUTH = '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/'
C6 = 4045313/100000
fl = lambda s: float(Q(s))
mid = lambda s: float(s.split('+/-')[0].strip('[ ')) - float(s.split('+/-')[1].strip('] '))   # lower end of Arb ball
dual = json.load(open(AUTH + 'deficit_dual_cover_witness.json'))
def gamma(u):
    out = 251/5000
    for e, v in [(12e-3, 121/2500), (15e-3, 467/10000), (18e-3, 451/10000), (2e-2, 441/10000), (25e-3, 1859/43200),
                 (3e-2, 3/80), (35e-3, 71/2000), (4e-2, 17/500), (44e-3, 13/400)]:
        if u >= e - 1e-15: out = v
    return out
def H(branch, u, chi, g):
    return {'linear': g*u*u*chi, 'tensor': 3*u**3*chi**1.5, 'uniform': 1/2500, 'energy': 19321e-6*u}[branch]
energies = [fl(u) for u in dual['energies']]
B = {fl(u): mid(v) for u, v in dual['benchmarks'].items()}
models = {}
for m in dual['accepted_models']:
    models.setdefault(fl(m['u']), []).append(list(map(fl, m['row']['coefficients'])))
FP = lambda P, chi: P[0] + P[1] + P[2]*(2 + chi) + P[3]*(6 + 9*chi + C6*chi**1.5)
def stein(branches, maxdepth=17):
    unc = []; nbox = 0
    for ul, uh in zip(energies, energies[1:]):
        g = gamma(ul); pend = [(0.0, 42.0, 0)]
        while pend:
            cl, ch, dep = pend.pop()
            if any(H(b_, uh, ch, g) <= 6e-6 for b_ in ['linear', 'tensor', 'uniform', 'energy'] if b_ in branches):
                nbox += 1; continue
            allow = 0.9*(2 + ch)*(uh - ul)**2/8; best = -1
            for br in branches:
                low = []
                for u in (ul, uh):
                    low.append(max(min(0.3*(B[u] - FP(P, c)) + 6e-6 - H(br, u, c, g) for c in (cl, ch)) for P in models[u]))
                best = max(best, min(low) - allow)
            if best > 0: nbox += 1
            elif dep >= maxdepth: unc.append((ul, uh, cl, ch, best))
            else:
                m_ = (cl + ch)/2; pend += [(m_, ch, dep + 1), (cl, m_, dep + 1)]
    return nbox, unc
for br in [['linear', 'tensor', 'uniform', 'energy'], ['linear', 'energy'], ['linear', 'energy', 'tensor'], ['linear', 'energy', 'uniform']]:
    n, unc = stein(br)
    print('Stein cover with branches', br, ': accepted', n, ' uncovered', len(unc))
    if unc:
        # merge uncovered chi-ranges per slab
        from collections import defaultdict
        dd = defaultdict(list)
        for ul, uh, cl, ch, bst in unc: dd[(ul, uh)].append((cl, ch, bst))
        for k in sorted(dd):
            iv = sorted(dd[k]); print('   slab', k, ' uncovered chi in [%.3g, %.3g]  worst margin %.3g' % (iv[0][0], iv[-1][1], min(x[2] for x in iv)))
# moment covers: same cap per box; try the reviewed branch 2/25 (or gamma) and energy instead of tensor
def mom(fn, gam):
    w = json.load(open(AUTH + fn)); caps = [list(map(fl, c['coefficients'])) for c in w['caps']]
    blo = {fl(k): fl(v) for k, v in w['benchmark_lower'].items()}
    out = []
    for bx in w['accepted']:
        if bx.get('exempt'):
            ul, uh, xl, xh = map(fl, bx['box'])
            ok = min(2/25*uh*uh*xh*xh, 19321e-6*uh) <= 6e-6
            if not ok: out.append(('exempt-needs-tensor', bx['box']))
            continue
        if bx['content'] != 1: continue
        ul, uh, xl, xh = map(fl, bx['box']); sl, sh = map(fl, bx['slab'])
        U, X = np.meshgrid(np.linspace(ul, uh, 41), np.linspace(xl, xh, 81)); chi = X*X
        best = -1; bestj = None
        for c in caps:
            Bl = blo[sl] + (blo[sh] - blo[sl])*(U - sl)/(sh - sl)
            Fu = c[0] + c[1]*U + c[2]*U*U*(2 + chi) + c[3]*U**3*(6 + 9*chi + C6*X**3)
            for j, Hc in [(0, 2/25*U*U*chi), (3, 19321e-6*U)]:
                v = (0.3*(Bl - Fu) + 6e-6 - Hc).min()
                if v > best: best, bestj = v, j
        out.append((bx['box'], 'best min over grid with reviewed branch', best, bestj))
    return out
for r in mom('deficit_moment_verify_witness.json', None): print('moment', r)
