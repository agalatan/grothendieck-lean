#!/usr/bin/env python3
"""Exact envelopes and rooms from certified row constants (exact rational arithmetic; the row constants C_r are the outputs of the
law-layer covers, label C given their inputs).
  envelope_design.py CERTDIR [DESIGN.json] [targets "500/701,100000/140195,10000/14021"]
CERTDIR/out/rec_TAG.json (plain covers) and recS_TAG.json (Stein covers, preferred when present) give C_r; CERTDIR/game.json gives the
direct bound a t^2 + b (ledger 4.18 (a)).  Printed:
 (1) the min-envelope of all rows on [t1, 886227/10^6] with t1 = the crossing of the direct bound with the envelope (as assemble2c.py),
     per active piece its exact maximum and the room at each target; also t_end = the largest t (10^-6 grid) with direct bound < target;
 (2) if DESIGN.json = {"pieces": [[a, b, TAG], ...]} is given: the rooms of that assignment (a covering row may be used where it is not
     the smallest), and the checks: the pieces are contiguous from the first a to >= 886227/10^6, every room > 0."""
import sys, os, json
from fractions import Fraction as F
from math import isqrt
certd = sys.argv[1]; design = json.load(open(sys.argv[2])) if len(sys.argv) > 2 and sys.argv[2] not in ('', '-') else None
targets = [F(x) for x in (sys.argv[3] if len(sys.argv) > 3 else '500/701,100000/140195,10000/14021').split(',')]
TOP = F(886227, 10 ** 6); g = json.load(open(os.path.join(certd, 'game.json'))); spec = json.load(open(os.path.join(certd, 'rows2c.json')))
rows = {}
for r in spec['rows']:
    tag = r['tag']; C = None
    for fn in ('recS_%s.json', 'rec_%s.json'):
        p = os.path.join(certd, 'out', fn % tag)
        if os.path.exists(p):
            d = json.load(open(p))
            if d.get('C'): C = F(d['C']); break
    if C is not None: rows[tag] = (F(r['l']), C)
A, Bc = F(g['small_t']['a']), F(g['small_t']['b'])
val = lambda tag, t: t * t - 2 * rows[tag][0] * t + rows[tag][1]
def envelope(t0):
    """pieces (a, b, tag) of the lower envelope of the row parabolas (all have leading coefficient 1, so two rows cross at most once)."""
    tags = sorted(rows); cuts = {t0, TOP}
    for i, x in enumerate(tags):
        for y in tags[i + 1:]:
            (l1, c1), (l2, c2) = rows[x], rows[y]
            if l1 != l2:
                t = (c1 - c2) / (2 * (l1 - l2))
                if t0 < t < TOP: cuts.add(t)
    cs = sorted(cuts); out = []
    for a, b in zip(cs[:-1], cs[1:]):
        m = (a + b) / 2; tag = min(tags, key=lambda x: val(x, m))
        if out and out[-1][2] == tag: out[-1] = (out[-1][0], b, tag)
        else: out.append((a, b, tag))
    return out
def crossing():
    env = lambda t: min(val(x, t) for x in rows)
    lo, hi = F(0), F(1, 2)
    if not (A * lo * lo + Bc <= env(lo)): return F(0)
    for _ in range(50):
        m = (lo + hi) / 2
        if A * m * m + Bc <= env(m): lo = m
        else: hi = m
    return F(int(lo * 10 ** 6), 10 ** 6)
t1 = crossing(); res = dict(game=g['name'], rho=g['rho'], rho_table=g.get('rho_table'), direct=dict(a=str(A), b=str(Bc)), t1=str(t1), targets=[str(x) for x in targets], envelope=[], design=[])
print('game: %s; radius %s%s' % (g['name'], g['rho'], ' + table ' + g['rho_table'] if g.get('rho_table') else ''))
for tg in targets:
    x = (tg - Bc) / A; te = F(isqrt(int(x * 10 ** 12)), 10 ** 6)
    while A * te * te + Bc >= tg: te -= F(1, 10 ** 6)
    print('target %s = 1/%.5f: direct bound %s t^2 + %.9f < target for t <= %.6f (the end of the unconditional piece)' % (tg, float(1 / tg), A, float(Bc), float(te)))
    res.setdefault('t_end', {})[str(tg)] = str(te)
print('min-envelope: direct bound on [0, %.6f] (max %.7f), rows above; rooms at the targets %s' % (float(t1), float(A * t1 * t1 + Bc), ', '.join('1/%.5f' % float(1 / x) for x in targets)))
Bmax = A * t1 * t1 + Bc
for a, b, tag in envelope(t1):
    m = max(val(tag, a), val(tag, b)); Bmax = max(Bmax, m)
    print('  row %-7s active on [%.5f, %.5f]: max %.9f  rooms %s' % (tag, float(a), float(b), float(m), '  '.join('%.4e' % float(tg - m) for tg in targets)))
    res['envelope'].append(dict(tag=tag, a=str(a), b=str(b), a_float=float(a), b_float=float(b), max=str(m), max_float=float(m), rooms=[float(tg - m) for tg in targets]))
print('B = %.10f; rooms %s; the largest K with positive room on this envelope: 1/B = %.6f' % (float(Bmax), '  '.join('%.4e' % float(tg - Bmax) for tg in targets), float(1 / Bmax)))
res['B'] = str(Bmax); res['B_float'] = float(Bmax)
if design:
    ps = [(F(str(a)), F(str(b)), tag) for a, b, tag in design['pieces']]; ok = all(ps[i][1] == ps[i + 1][0] for i in range(len(ps) - 1)) and ps[-1][1] >= TOP
    print('design "%s": pieces contiguous from %.4f to %.6f: %s' % (design.get('name', ''), float(ps[0][0]), float(ps[-1][1]), ok)); worst = None
    for a, b, tag in ps:
        b_ = min(b, TOP); m = max(val(tag, a), val(tag, b_)); rm = [tg - m for tg in targets]
        print('  [%.4f, %.4f] <- row %-7s l=%s C=%.9f: max %.9f  rooms %s%s' % (float(a), float(b), tag, rows[tag][0], float(rows[tag][1]), float(m), '  '.join('%.4e' % float(x) for x in rm), '' if rm[0] > 0 else '   <-- NO ROOM'))
        res['design'].append(dict(a=str(a), b=str(b), tag=tag, l=str(rows[tag][0]), C=str(rows[tag][1]), max=str(m), rooms=[float(x) for x in rm], rooms_exact=[str(x) for x in rm]))
        if worst is None or rm[0] < worst[0]: worst = (rm[0], tag, a, b)
    print('  smallest room of the design at the first target: %.4e (row %s on [%.4f, %.4f]); all positive: %s' % (float(worst[0]), worst[1], float(worst[2]), float(worst[3]), worst[0] > 0))
    res['design_ok'] = bool(ok and worst[0] > 0)
json.dump(res, open(os.path.join(certd, 'out', 'envelope_design%s.json' % (('_' + design.get('name', 'd')) if design else '')), 'w'), indent=1)
