"""collect_gate.py -- tables of the model gate for the game of D5_E1, D5_ETA (claude-b9ee worker d5newcap, 16 Nov 2026; after
capgate/collect_capgate.py).  N.   Inputs: rows5.lines; out/{lp,h11c,hab,abfin,lawodd,sp2,sp2big,cs}_k.json; out/zero_core.json,
out/crude_h.json; rooms.json (optional: {t: room}, the certified or estimated room per row).   usage: collect_gate.py [section]"""
import sys, os, json, math
here = os.path.dirname(os.path.abspath(__file__)); O = os.path.join(here, 'out'); sys.path.insert(0, here)
import numpy as np
E1, ETA = float(os.environ['D5_E1']), float(os.environ['D5_ETA']); P1, P2 = 1 / E1, 1 / ETA
T1402 = 500 / 701
rows = [json.loads(l) for l in open(os.path.join(here, 'rows5.lines')).read().split('\n') if l.strip()]
def J(*p):
    f = os.path.join(O, *p)
    try: return json.load(open(f)) if os.path.exists(f) and os.path.getsize(f) > 0 else None
    except Exception: return None
rooms = {}
if os.path.exists(os.path.join(here, 'rooms.json')): rooms = {round(float(k), 3): v for k, v in json.load(open(os.path.join(here, 'rooms.json'))).items()}
zc = {r['k']: r for r in (J('zero_core.json') or [])}
ch = {round(r['t'], 3): r for r in (J('crude_h.json') or [])}
sec = sys.argv[1] if len(sys.argv) > 1 else 'all'
def room(r): return rooms.get(round(r['t'], 3), T1402 - r['row'])
if sec in ('rows', 'all'):
    print('| t | row (Gaussian ideal) | room to 500/701 | sigma* (nu5*) | law layer: moment LP - S5 (law at the LP optimum) | room used below |')
    print('|---|---|---|---|---|---|')
    for k, r in enumerate(rows, 1):
        lp = J('lp_%d.json' % k)
        s = '| %.3f | %.7f | %.2e | %.3f (%.4f) | ' % (r['t'], r['row'], T1402 - r['row'], r['sig'], r['nu5'])
        if lp:
            u, m, nu = lp['lp_at']; s += '%.1e (m = %g, u = %.3f) | ' % (max(lp['loss'], 0.0), m, u)
        else: s += '- | '
        print(s + '%.2e |' % room(r))
    print()
if sec in ('exact', 'all'):
    import analyze2 as A2
    print('| t | largest one-spike excess (c, sigma/sigma*) | theta = max excess/delta (c, sigma/sigma*) | kappa*_g: H22 / H11 / H31 / H10-H01 / H20-H02 | sum kappa* | one inequality: max gain/(D + V_sl) | eta with sum kappa_g = 1 | non-concave points |')
    print('|---|---|---|---|---|---|---|---|')
    for k, r in enumerate(rows, 1):
        allpts = []
        for nm in ('sp2_%d.json', 'sp2big_%d.json'):
            o = J(nm % k)
            if o: allpts += o['pts']
        if not allpts: continue
        p = os.path.join(O, 'sp2all_%d.json' % k); o0 = J('sp2_%d.json' % k); o0 = dict(o0, pts=allpts); json.dump(o0, open(p, 'w'))
        fin = [q for q in allpts if q['D'] > 0 and all(math.isfinite(v) for v in q['groups'].values())]
        for q in fin: q['exc'] = sum(v for g, v in q['groups'].items() if g != 'const') - q['D'] - q['Vsl']     # nu5/nu3 shift excluded, as analyze2
        a = A2.run(p); kk = a['kstar']
        best = max(fin, key=lambda q: q['exc']); th = max(fin, key=lambda q: q['exc'] / (q['m2'] * q['sig'] ** 4))
        ss = r['sig'] if r['sig'] > 0 else 1.0
        kc = max((q['exc'] + q['D'] + q['Vsl']) / (q['D'] + q['Vsl']) for q in fin)
        sg = (lambda q: '%.2f' % (q['sig'] / ss)) if r['sig'] > 0 else (lambda q: 'sigma = %.2f' % q['sig'])
        print('| %.3f | %+.1e (%.2g, %s) | %+.3f (%.2g, %s) | %.2f / %.2f / %.2f / %.2f / %.2f | %.2f | %.2f | %s | %d |' % (r['t'], best['exc'], best['c'], sg(best),
              th['exc'] / (th['m2'] * th['sig'] ** 4), th['c'], sg(th), kk.get('H22', 0), kk.get('H11', 0), kk.get('H31', 0), kk.get('H10/H01', 0), kk.get('H20/H02', 0),
              a['sumk'], kc, '0' if a['eta_L2'] <= 0 else '%.1e' % a['eta_L2'], len(allpts) - len(fin)))
    print()
if sec in ('h11', 'all'):
    print('| t | eps1 E_z[|z|/|g|] (s = 0) | s = 0.1 | s = 0.2 | Emax(0) | arbitrary-sharing allowance: Gaussian law / moment LP | averaged: tau -> 0 / 0.3 / 1 | room |')
    print('|---|---|---|---|---|---|---|---|')
    for k, r in enumerate(rows, 1):
        h = J('h11c_%d.json' % k); z = zc.get(k)
        if not z: continue
        lo = J('lawodd_%d.json' % k)
        if h:
            av = h['averaged']; at = lambda x: min(av['curve'], key=lambda ab: abs(ab[0] - x))[1]
            avs = '%.3f / %.3f / %.3f' % (av['ratio_inf'], at(0.316), at(1.0)); e0 = h['pointwise'][0]['Emax']; em = ('%.1e' % e0) if e0 > 0 else '0'
            ga = h.get('allow_gauss_law', 0.0); la = lo['allowance'] if lo else 0.0
            al = '%s / %s' % (('%.1e' % ga) if ga > 0 else '0', ('%.1e' % la) if la > 1e-9 else '0')
        else: avs, em, al = '-', '0' if z['closed'] < 1 else '-', '0 / 0' if z['closed'] < 1 else '-'
        print('| %.3f | **%.4f** | %.4f | %.4f | %s | %s | %s | %.2e |' % (r['t'], z['closed'], z['r01'], z['r02'], em, al, avs, room(r)))
    print()
if sec in ('ab', 'all'):
    print('| t | A/B pair: s = 0 / 0.2 / 0.5 | A/B max over s (at s) | A/B, finite amplitude | quintic first-order sectors, s = 0 | quintic, elementary majorant |')
    print('|---|---|---|---|---|---|')
    for k, r in enumerate(rows, 1):
        h = J('hab_%d.json' % k)
        if not h: continue
        ab = dict(zip([round(s, 2) for s in h['S']], h['AB(k)'])); af = J('abfin_%d.json' % k); c = ch.get(round(r['t'], 3))
        im = int(np.argmax(h['AB(k)']))
        print('| %.3f | %.3f / %.3f / %.3f | %.3f (%.1f) | %s | %.3f | %s |' % (r['t'], ab[0.0], ab[0.2], ab[0.5], h['AB(k)'][im], h['S'][im], ('%.3f' % max(x[2] for x in af['rows'])) if af else '-',
              h['h-first(p10,p01,p21,p12,p30)'][0], ('%.3f' % c['crude']) if c else '-'))
    print()
if sec in ('chain', 'all'):
    H = ['p10', 'p01', 'p21', 'p12', 'p30']; K = ['rA', 'rB']
    print('| t | theta (chain) at (c, sigma/sigma*) | kappa*_h (quintic shells) | kappa*_AB (A/B shells) | kappa*_h + kappa*_AB | odd ratio sharing the spike | D/delta (c >= 0.1) | rho_AB(0), rho_h(0) used |')
    print('|---|---|---|---|---|---|---|---|')
    for k, r in enumerate(rows, 1):
        o = J('cs_%d.json' % k); hb = J('hab_%d.json' % k)
        if not o or not hb: continue
        rab = hb['AB(k)'][0]; rh = hb['h-first(p10,p01,p21,p12,p30)'][0]
        if rab >= 1: rab = hb['AB(k)'][1]                 # zero core above 1: the s = 0.1 value, as CAPPED_GATE did at t = 0.70
        pts = o['pts']; mu = lambda n: (1 - rh) * P2 if n in H else (1 - rab) * P1
        gh = lambda p: sum(p['content'][n] / (4 * mu(n)) for n in H); ga = lambda p: sum(p['content'][n] / (4 * mu(n)) for n in K)
        den = lambda p: p['D'] + p['Vsl']
        th = max(pts, key=lambda p: (gh(p) + ga(p) - den(p)) / p['delta'])
        kh = max(gh(p) / den(p) for p in pts); ka = max(ga(p) / den(p) for p in pts)
        ss = r['sig'] if r['sig'] > 0 else float('nan')
        print('| %.3f | %+.3f (%.2g, %s) | %.2f | %.2f | %.2f | %.3f | %.2f-%.2f | %.3f, %.3f |' % (r['t'], (gh(th) + ga(th) - den(th)) / th['delta'], th['c'],
              ('%.2f' % (th['sig'] / ss)) if r['sig'] > 0 else 'sigma = %.2f' % th['sig'], kh, ka, kh + ka, max(p['odd']['ratio_shared'] for p in pts),
              min(p['D'] / p['delta'] for p in pts if p['c'] >= 0.1), max(p['D'] / p['delta'] for p in pts if p['c'] >= 0.1), rab, rh))
