# REVIEW_4 (claude-b9ee, 15 November 2026): written by the reviewer agent of the session, copied from its scratch folder; the intermediate claims of the certificate tested on 1,298 cubics of the Gaussian-to-Wick family; output check_cert.log.
# claude reviewer (N): test the certificate's intermediate claims against actual cubics of the family.
import json, sys, os, time
import numpy as np
from fractions import Fraction as Q
HERE = os.path.dirname(os.path.abspath(__file__)); sys.path.insert(0, HERE)
import fam
AUTH = '/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/'
C6 = 4045313/100000
dual = json.load(open(AUTH + 'deficit_dual_cover_witness.json'))
mv = json.load(open(AUTH + 'deficit_moment_verify_witness.json'))
mp = json.load(open(AUTH + 'deficit_moment_prefix_witness.json'))
fl = lambda s: float(Q(s))
def gamma(u):
    out = 251/5000
    for e, v in [(12e-3, 121/2500), (15e-3, 467/10000), (18e-3, 451/10000), (2e-2, 441/10000), (25e-3, 1859/43200),
                 (3e-2, 3/80), (35e-3, 71/2000), (4e-2, 17/500), (44e-3, 13/400)]:
        if u >= e - 1e-15: out = v
    return out
def H(branch, u, chi, g):
    return {'linear': g*u*u*chi, 'tensor': 3*u**3*chi**1.5, 'uniform': 1/2500, 'energy': 19321e-6*u}[branch]
HM = lambda j, u, x: [2/25*u*u*x*x, 3*u**3*x**3, 1/2500, 19321e-6*u][j]
def FP(P, chi): return P[0] + P[1] + P[2]*(2 + chi) + P[3]*(6 + 9*chi + C6*chi**1.5)
def Fcap(c, u, chi): return c[0] + c[1]*u + c[2]*u*u*(2 + chi) + c[3]*u**3*(6 + 9*chi + C6*chi**1.5)
models = {}
for m in dual['accepted_models']:
    models.setdefault(Q(m['u']), []).append((m['index'], list(map(fl, m['row']['coefficients']))))
caps = [list(map(fl, c['coefficients'])) for c in mv['caps']] + [list(map(fl, c['coefficients'])) for c in mp['caps']]
nodes = sorted(models)
# energies to sample
E = sorted(set([float(u) for u in nodes] + [float((x + y)/2) for x, y in zip(nodes, nodes[1:])]
          + [0.0005*k for k in range(1, 19)] + [0.009 + 0.0005*k + 0.00025 for k in range(14)]))
lams = sorted(set(list(np.sqrt(np.array([0.05, 0.2, 0.5, 1, 1.5, 2, 2.625, 3, 4, 5.25, 7, 8, 10.5, 12, 15.75, 18, 21, 24, 26.25, 31.5, 36, 42])/42))))
t0 = time.time(); rows = []
for u in E:
    Bu = fam.Bgauss(u)
    for lam in lams:
        F, C2, m4, m6 = fam.family(u, lam, nr=(32, 12), ng=(20, 12), nth=40)
        chi = 42*lam*lam
        rows.append(dict(u=u, lam=lam, chi=chi, F=F, C2=C2, B=Bu, D=Bu - F, EU3=m6/u**3))
print('family evaluations', len(rows), 'seconds', time.time() - t0, flush=True)
json.dump(rows, open(os.path.join(HERE, 'family_rows.json'), 'w'))
# 1. inherited sixth-moment bound on the family
worst = min(6 + 9*r['chi'] + C6*r['chi']**1.5 - r['EU3'] for r in rows)
print('1. min over family of [6+9chi+C chi^1.5 - EU^3] =', worst)
# 2. Stein node duals: F <= F_P(u_n, chi) for every accepted model at that node
sl = []
for r in rows:
    uq = Q(r['u']).limit_denominator(100000)
    if uq in models:
        for idx, P in models[uq]:
            sl.append((FP(P, r['chi']) - r['F'], idx, r['u'], r['chi']))
sl.sort(); print('2. Stein duals: checks', len(sl), ' min slack F_P - F_actual =', sl[0], ' #negative', sum(s[0] < 0 for s in sl))
# 3. moment caps (global): F <= E P(uU) bound
cs = sorted((Fcap(c, r['u'], r['chi']) - r['F'], k, r['u'], r['chi']) for k, c in enumerate(caps) for r in rows)
print('3. moment caps: checks', len(cs), ' min slack =', cs[0], ' #negative', sum(s[0] < 0 for s in cs))
# 4. benchmarks
bd = [(fam.Bgauss(fl(u)) - float(v.split('+/-')[0].strip('[ ')), u) for u, v in dual['benchmarks'].items()]
bm = [(fam.Bgauss(fl(u)) - fl(v), u) for w in (mv, mp) for u, v in w['benchmark_lower'].items() if fl(u) > 0]
print('4. B(mine) - B(author, Stein mid) range', min(bd)[0], max(bd)[0], ';  B(mine) - B_lower(moment) min', min(bm))
# 5. Stein boxes: actual budget Q(u) >= certified margin for family points in the box
worst5 = []
for bx in dual['boxes']:
    ul, uh = map(fl, bx['u']); cl, ch = map(fl, bx['chi'])
    for r in rows:
        if ul - 1e-12 <= r['u'] <= uh + 1e-12 and cl <= r['chi'] <= ch:
            g = fl(bx['coefficient']) if bx.get('coefficient') else gamma(ul)
            Qact = 0.3*(r['B'] - r['F']) + 6e-6 - H(bx['content_branch'], r['u'], r['chi'], g)
            cert = float(bx['margin'].split('+/-')[0].strip('[ ')) if not bx['exempt'] else 0
            worst5.append((Qact - cert, Qact, cert, bx['u'], bx['chi'], r['u'], r['chi']))
worst5.sort(); print('5. Stein boxes: family points', len(worst5), ' min(actual budget - certified margin) =', worst5[0][:3], worst5[0][3:], ' #violations', sum(w[0] < 0 for w in worst5))
# 6. moment boxes: actual budget >= certified polynomial >= 0
worst6 = []
for w in (mv, mp):
    blo = {Q(k): fl(v) for k, v in w['benchmark_lower'].items()}
    wcaps = [list(map(fl, c['coefficients'])) for c in w['caps']]
    for bx in w['accepted']:
        ul, uh, xl, xh = map(fl, bx['box'])
        for r in rows:
            x = np.sqrt(r['chi'])
            if ul - 1e-12 <= r['u'] <= uh + 1e-12 and xl <= x <= xh:
                if bx.get('exempt'):
                    continue
                j = bx['content']; sll, slh = map(Q, bx['slab'])
                if j == 4: Hc = fl(bx['gamma'])*r['u']**2*r['chi']
                else: Hc = HM(j, r['u'], x)
                Blow = blo[sll] + (blo[slh] - blo[sll])*(r['u'] - float(sll))/float(slh - sll)
                poly = 0.3*(Blow - Fcap(wcaps[bx['cap']], r['u'], r['chi'])) + 6e-6 - Hc
                act = 0.3*(r['B'] - r['F']) + 6e-6 - Hc
                worst6.append((act - poly, poly, act, bx['box'], r['u'], r['chi']))
worst6.sort(key=lambda t: t[1]); print('6. moment boxes: family points', len(worst6), ' min certified poly value', worst6[0][1], ' min(act-poly)', min(t[0] for t in worst6), ' #poly<0', sum(t[1] < 0 for t in worst6))
# 7. claim (1) with the true content, and the content claim C^2 <= gamma delta
m7 = sorted((0.3*max(r['D'], 0) + 6e-6 - r['C2'], r['u'], r['chi'], r['C2'], r['D']) for r in rows)
print('7. claim (1): min margin', m7[0], ' #violations', sum(m[0] < 0 for m in m7))
rat = sorted(((r['C2']/(r['chi']*r['u']**2) if r['chi'] > 0 else 0), r['u'], r['chi']) for r in rows)[-3:]
print('   largest C^2/delta on the family', rat, ' (gamma >= 0.0325)')
neg = [r for r in rows if r['D'] < 0]; print('   rows with D<0:', len(neg))
