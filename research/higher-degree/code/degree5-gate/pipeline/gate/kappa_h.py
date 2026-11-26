"""The share of the deficit taken by the quintic shells in the exact coupled one-spike model (gate, spike2.py) at a row (N).
kappa_h = max over the points (c, sigma) of [sum of the gains of the groups other than the A/B shells H10/H01 and the scalar
shift 'const'] / (D + V_sl);  kappa_AB = the same for the A/B group;  and the one-inequality constant (all groups together).
With per-group constants the A/B shells may use kappa_AB <= 1 - kappa_h of the deficit.     claude-b9ee worker d5newcap, 16 Nov 2026.
usage: D5_E1=.. D5_ETA=.. kappa_h.py ROWS.lines k OUT.json     (points: c in {0.1, 0.3, 0.6, 1} x sigma in {0.9, 1, 1.1} sigma*)"""
import sys, os, json, math, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import spike2 as S2
rec = json.loads(open(sys.argv[1]).read().split('\n')[int(sys.argv[2]) - 1]); t0 = time.time()
ss = rec['sig']
o = S2.scan(rec, [0.1, 0.3, 0.6, 1.0], [0.9 * ss, ss, 1.1 * ss])
kh = kab = kall = -1; th = -9; exc = -9
for q in o['pts']:
    if not all(math.isfinite(v) for v in q['groups'].values()) or q['D'] <= 0: continue
    den = q['D'] + q['Vsl']
    h = sum(v for g, v in q['groups'].items() if g not in ('H10/H01', 'const')); ab = q['groups']['H10/H01']
    kh = max(kh, h / den); kab = max(kab, ab / den); kall = max(kall, (h + ab) / den)
    e = h + ab - den; exc = max(exc, e); th = max(th, e / (q['m2'] * q['sig'] ** 4))
out = dict(t=rec['t'], kappa_h=kh, kappa_AB=kab, kappa_all=kall, theta=th, largest_excess=exc, secs=time.time() - t0)
json.dump(out, open(sys.argv[3], 'w'), indent=1)
print('t=%.3f: kappa_h %.3f  kappa_AB(exact) %.3f  one inequality %.3f  theta %+.4f  largest excess %+.2e  (%.0fs)' % (rec['t'], kh, kab, kall, th, exc, out['secs']))
