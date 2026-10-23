# Step 24 (copy of step22_boxes.py, paths only) / Step 22 (P1c) part 3c: box-level effect of the unconditional rank-one test on the CURRENT cover (cert-jointmoment-lifted-codex, master endpoint
# 1.401695322458, cap B = 0.7134218).  Each box (t, tau, x ranges, row-weight vector w_box) gets the gain g of its nearest representative mixture
# (L1 distance of row weights), min over tau in [sl, su] and x in [xl, xu] (linear interpolation in the (tau, x) gain table); 'c' (row-cap envelope)
# boxes get the cap gain of their rows (max over the (tau, x) grid of the pure-row value, before minus after).  New cap ~ max_b (v_b - g_b).  [F]
import json, sys, collections, numpy as np
from fractions import Fraction as F
D = '/home/agalatan/joint-verified-final'
d = json.load(open(D+'/cover.json')); inh = json.load(open(D+'/inherited.json')); B = float(F(d['target']))
GR = [{i: float(F(w)) for i, w in g['weights']} for g in d['groups']]
TAB = json.load(open(sys.argv[1]))            # flat list from step22_socp (tag, var, x, tau, v0, vT, gain)
VAR = sys.argv[2] if len(sys.argv) > 2 else 'cone'
MIX = {}
for r in TAB:
    if r['var'] != VAR: continue
    MIX.setdefault(r['tag'], {})[(r['x'], r['tau'])] = r
WD = {t: {int(k): v for k, v in json.load(open('step22_mix_%s.json' % t))['wd'].items()} for t in MIX}
DPR = {t: json.load(open('step22_mix_%s.json' % t))['D'] for t in MIX}
def grid(t):
    xs = sorted({k[0] for k in MIX[t]}); ts = sorted({k[1] for k in MIX[t]})
    g = np.array([[MIX[t][(x, s)]['gain'] for s in ts] for x in xs]); return np.array(xs), np.array(ts), g
GRID = {t: grid(t) for t in MIX}
def gain_box(t, sl, su, xl, xu):
    xs, ts, g = GRID[t]
    if sl < ts[0]-1e-9 or su > ts[-1]+1e-9 or xu > xs[-1]+1e-9: return None
    tq = np.unique(np.concatenate([[sl, su], ts[(ts > sl) & (ts < su)]])); xq = np.unique(np.concatenate([[xl, xu], xs[(xs > xl) & (xs < xu)]]))
    gx = np.array([[np.interp(s, ts, g[i]) for s in tq] for i in range(len(xs))])
    return max(0.0, min(np.interp(x, xs, gx[:, j]) for x in xq for j in range(len(tq))))
def rowweights(b):
    if 'original' in b:
        o = inh['boxes'][b['original']].split('|'); k = o[0]
        if k == 'c': return 'c', o[2]
        w = collections.Counter()
        if k == 's':
            i, j, th = o[2].split(','); th = float(F(th)); w[int(i)] += 1-th; w[int(j)] += th
        else:
            if k == 'j': bi, ths = [int(o[2])], [1.0]
            else:
                i, j, th = o[2].split(','); th = float(F(th)); bi, ths = [int(i), int(j)], [1-th, th]
            for b_, t_ in zip(bi, ths):
                bb = inh['batches'][b_]; th2 = float(F(bb['theta'])); w[bb['i']] += t_*(1-th2); w[bb['j']] += t_*th2
        return k, dict(w)
    ch = b['choice']; th = float(F(ch['theta'])); gs = ch['groups']; w = collections.Counter()
    for g, t_ in zip(gs, [1.0] if len(gs) == 1 else [1-th, th]):
        for i, x in GR[g].items(): w[i] += t_*x
    return 'n', dict(w)
def nearest(w):
    best = None
    for t, wd in WD.items():
        dist = sum(abs(w.get(i, 0)-wd.get(i, 0)) for i in set(w) | set(wd))
        if best is None or dist < best[0]: best = (dist, t)
    return best
# row caps: pure-row value function on the grid, val - D tau^2 (t-part and beta terms are constant per row)
def capgain(row):
    t = 'm%d' % row
    if t not in MIX: return None
    v0 = max(r['v0']-DPR[t]*r['tau']**2 for r in MIX[t].values()); vT = max(r['vT']-DPR[t]*r['tau']**2 for r in MIX[t].values())
    a0 = max(MIX[t].values(), key=lambda r: r['v0']-DPR[t]*r['tau']**2); aT = max(MIX[t].values(), key=lambda r: r['vT']-DPR[t]*r['tau']**2)
    return v0-vT, (a0['tau'], a0['x']), (aT['tau'], aT['x'])
if __name__ == '__main__':
    THR = float(sys.argv[3]) if len(sys.argv) > 3 else 3e-5
    MODE = sys.argv[4] if len(sys.argv) > 4 else 'linear'; SAFE = float(sys.argv[5]) if len(sys.argv) > 5 else 1.0
    out = []; miss = collections.Counter(); far = 0
    for idx, b in enumerate(d['boxes']):
        v = float(F(b['upper'])); gap = B-v
        if gap > THR: continue
        bb = [float(F(x)) for x in b['bounds']]; kind, w = rowweights(b)
        if kind == 'c':
            i, j, th = w.split(','); rows = {int(i)-1, int(j)-1}; cg = [capgain(r) for r in rows]
            g = None if any(c is None for c in cg) else min(c[0] for c in cg); near = ('cap', sorted(rows))
        else:
            dist, t = nearest(w); far += dist > 0.15
            if dist <= 0.15 or MODE == 'nearest':
                g = gain_box(t, bb[2], bb[3], bb[4], bb[5]); near = (t, round(dist, 3))
            else:   # linear in the row weights over the computed pure rows (uncomputed rows count as zero gain), times the safety factor
                parts = [(wi, gain_box('m%d' % r, bb[2], bb[3], bb[4], bb[5]) if 'm%d' % r in MIX else 0.0) for r, wi in w.items()]
                g = None if any(p[1] is None for p in parts) else SAFE*sum(wi*gi for wi, gi in parts); near = ('lin', {k: round(v, 3) for k, v in w.items() if v > 1e-6})
        if g is None: miss[str(near)] += 1
        out.append(dict(i=idx, gap=gap, g=g, b=bb, kind=kind, near=near))
    ok = [o for o in out if o['g'] is not None]
    print('boxes with gap <= %.1e: %d; evaluated %d; not covered by the (tau, x) table: %d %s; nearest-mixture distance > 0.15 (-> linear model x %.2f): %d' % (THR, len(out), len(ok), len(out)-len(ok), dict(miss), SAFE, far))
    for r in (12, 13, 15):
        c = capgain(r); print('row %d cap: gain %s' % (r, 'n/a' if c is None else '%.3e (argmax before %s, after %s)' % c))
    ok.sort(key=lambda o: o['gap']+o['g'])
    print('limiting boxes (smallest gap + gain):')
    for o in ok[:25]: print('  box %d %s gap %.2e gain %.2e -> new margin %.2e  t[%.4f,%.4f] tau[%.4f,%.4f] x[%.3f,%.3f] near %s' % (o['i'], o['kind'], o['gap'], o['g'], o['gap']+o['g'], *o['b'], o['near']))
    gmin = min(o['g'] for o in ok); bmin = min(ok, key=lambda o: o['g'])
    dB = ok[0]['gap']+ok[0]['g']; Bn = B-dB
    print('min gain over evaluated near-binding boxes: %.3e (box %d, tau[%.4f,%.4f], x[%.3f,%.3f])' % (gmin, bmin['i'], *bmin['b'][2:]))
    print('implied new cap (current cover, no re-optimisation): B = %.9f -> %.9f (dB = %.3e); K: %.9f -> %.9f (dK = %.3e)' % (B, Bn, dB, 1/B, 1/Bn, 1/Bn-1/B))
    unc = [o for o in out if o['g'] is None]
    if unc: print('UNCOVERED near-binding boxes (gain set to 0 would cap dB at their gap): min gap %.2e' % min(o['gap'] for o in unc))
    json.dump(out, open(sys.argv[6] if len(sys.argv) > 6 else 'step24_boxes_%s.json' % VAR, 'w'))
