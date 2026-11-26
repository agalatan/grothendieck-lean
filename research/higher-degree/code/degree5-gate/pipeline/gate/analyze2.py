# [copy from degree5-cert/{gate/code,share/code,capgate}; claude-b9ee worker d5newcap, 16 Nov 2026: module path made local,
#  game constants from the environment D5_E1, D5_ETA (d5eng.py); nothing else changed]
# Item 2 analysis, refined: nu5 (the 'const' group) is a scalar of the potential and is excluded from the content
# accounting; flank scans at the plain-branch nu5 are restricted to sigma <= smax.  Lemma forms as in analyze_sp2.py.  N.
import sys, json
import numpy as np
def run(path, smax=9.0):
    o = json.load(open(path)); allp = [p for p in o['pts'] if p['D'] > 0 and p['sig'] <= smax]
    import math
    pts = [p for p in allp if all(math.isfinite(v) for v in p['groups'].values())]
    skipped = [(p['c'], p['sig'], round(p['Vsl'], 6), [g for g, v in p['groups'].items() if not math.isfinite(v)]) for p in allp if p not in pts]
    G = [g for g in pts[0]['groups'] if g != 'const']
    for p in pts:
        p['gnc'] = sum(p['groups'][g] for g in G); p['exc'] = p['gnc'] - p['D'] - p['Vsl']
    true_exc = max(p['exc'] for p in pts); eta1 = max(p['gnc'] - p['D'] for p in pts)
    kstar = {g: max(p['groups'][g] / p['D'] for p in pts) for g in G}
    act = [g for g in G if max(p['groups'][g] for p in pts) > 1e-12]
    grid = np.linspace(0, 1, 101)
    etag = {g: np.array([max(max(p['groups'][g] - k * p['D'] for p in pts), 0.0) for k in grid]) for g in act}
    alloc = {g: 0 for g in act}
    for _ in range(len(grid) - 1):
        cand = [(etag[g][alloc[g]] - etag[g][alloc[g] + 1], g) for g in act if alloc[g] + 1 < len(grid)]
        if not cand: break
        d, g = max(cand)
        if d <= 0: break
        alloc[g] += 1
    eta2 = sum(etag[g][alloc[g]] for g in act)
    # sigma-dependent allowance (the certificate covers sigma-boxes, so V_sl(sigma) can be spent): per point,
    # sum_g (gain_g - k_g D)_+ - Vsl with the allocation above; and the excess-weighted additive N-spike estimate
    kap = {g: float(grid[alloc[g]]) for g in act}
    eta2s = max(sum(max(p['groups'][g] - kap[g] * p['D'], 0.0) for g in act) - p['Vsl'] for p in pts)
    nsp2 = max([((1 / p['c'] ** 2) * p['exc'], p['c'], p['sig']) for p in pts if p['exc'] > 0] or [(0.0, None, None)])
    ratios = sorted(((p['gnc'] / p['D'], p['c'], p['sig']) for p in pts), reverse=True)[:3]
    nsp = max([((1 / p['c'] ** 2) * (p['gnc'] - p['D']), p['c'], p['sig']) for p in pts if p['gnc'] > p['D']] or [(0.0, None, None)])
    return dict(eta2s=eta2s, nsp2=nsp2, skipped=skipped, t=o['rec']['t'], branch=o['rec'].get('branch'), true_exc=true_exc, eta_L1=eta1, eta_L2=eta2, kstar=kstar,
                sumk=sum(kstar.values()), alloc={g: float(grid[alloc[g]]) for g in act}, top_ratio=ratios, nspike=nsp)
if __name__ == '__main__':
    for arg in sys.argv[1:]:
        path, _, sm = arg.partition(':'); r = run(path, float(sm) if sm else 9.0)
        print('   sigma-dependent: eta_L2s = %.2e ; additive N-spike from the true one-spike excess ~ %.2e at c=%s sig=%s' % (r['eta2s'], r['nsp2'][0], r['nsp2'][1], r['nsp2'][2]))
        print('t=%.2f %-7s true_exc=%+.2e eta_L1(k=1)=%.2e eta_L2=%.2e sum_k*=%.2f top ratio %s | N-spike(additive)~%.2e at c=%s | k*: %s | alloc: %s' % (
            r['t'], (r['branch'] or '')[:7], r['true_exc'], r['eta_L1'], r['eta_L2'], r['sumk'], ['%.2f(c%.2f,s%.3f)' % x for x in r['top_ratio'][:2]],
            r['nspike'][0], r['nspike'][1], ' '.join('%s %.2f' % (k, v) for k, v in r['kstar'].items() if v > 1e-6),
            ' '.join('%s %.2f' % (k, v) for k, v in r['alloc'].items())))
        if r['skipped']: print('   non-concave (unbounded quadratic model) points skipped: %s' % r['skipped'])
