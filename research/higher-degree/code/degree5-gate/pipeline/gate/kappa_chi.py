"""The quintic shells' share of D + V_sl along the one-spike family, as a function of the concentration chi = 42 c^4 (N).
claude-b9ee worker d5newcap, 16 Nov 2026.   Exact coupled one-spike model (gate, spike2.py), q = sigma (c H(y) + sqrt(1 - c^2) W):
for each c the largest share over sigma in {0.9, 1, 1.1} sigma* of (i) all shells other than A/B (and other than the scalar
shift), (ii) the A/B shells, (iii) both together.  This is ONE family: it indicates what a split kappa_AB(chi) + kappa_h(chi) <= 1
that depends on the concentration could look like; it proves nothing about other cubics.
usage: D5_E1=.. D5_ETA=.. kappa_chi.py ROWS.lines k OUT.json [c-list]"""
import sys, os, json, math, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import spike2 as S2
rec = json.loads(open(sys.argv[1]).read().split('\n')[int(sys.argv[2]) - 1]); t0 = time.time(); ss = rec['sig']
cs = [float(x) for x in sys.argv[4].split(',')] if len(sys.argv) > 4 else [0.1, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0]
o = S2.scan(rec, cs, [0.9 * ss, ss, 1.1 * ss]); out = []
for c in cs:
    best = dict(c=c, chi=42 * c ** 4, kappa_h=-1.0, kappa_AB=-1.0, kappa_all=-1.0)
    for q in o['pts']:
        if abs(q['c'] - c) > 1e-9 or not all(math.isfinite(v) for v in q['groups'].values()) or q['D'] <= 0: continue
        den = q['D'] + q['Vsl']; h = sum(v for g, v in q['groups'].items() if g not in ('H10/H01', 'const')); ab = q['groups']['H10/H01']
        best['kappa_h'] = max(best['kappa_h'], h / den); best['kappa_AB'] = max(best['kappa_AB'], ab / den); best['kappa_all'] = max(best['kappa_all'], (h + ab) / den)
    out.append(best)
    print('t=%.3f c=%.2f chi=%6.2f: quintic share %.3f | A/B share %.3f | together %.3f' % (rec['t'], c, best['chi'], best['kappa_h'], best['kappa_AB'], best['kappa_all']), flush=True)
json.dump(dict(t=rec['t'], pts=out, secs=time.time() - t0), open(sys.argv[3], 'w'), indent=1)
