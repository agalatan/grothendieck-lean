# Float-level envelope and room per row (N) from the row optimisations: Gaussian rows (rowscan.py; the Gaussian ideal of the
# law layer) and law rows (lawbundle.py; "stein_opt" = moments + radius + scalar Stein class, else the plain class).
# claude-b9ee worker d5newcap, 16 Nov 2026.
#   python3 envelope_n.py OUT.json [--gauss F.lines ...] [--law F.lines ...] [--plain] [--small a,b] [--tmin T]
# --plain: use the plain (moments + radius) value of the law rows instead of the Stein one;  --small a,b: the direct
# small-t bound V <= a t^2 + b on [0, t1] (t1 = crossing).  Rows: V <= t^2 - 2 l t + C with C = value - t_r^2 + 2 l t_r.
import sys, os, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as F
from envelope import envelope, SQRTPI_2_UP
T = F(500, 701)
args = sys.argv[2:]; mode = None; gauss = []; law = []; plain = False; small = None; tmin = None
i = 0
while i < len(args):
    a = args[i]
    if a in ('--gauss', '--law'): mode = a
    elif a == '--plain': plain = True
    elif a == '--small': small = [float(x) for x in args[i + 1].split(',')]; i += 1
    elif a == '--tmin': tmin = float(args[i + 1]); i += 1
    else: (gauss if mode == '--gauss' else law).append(a)
    i += 1
rows = {}
for fn in gauss:
    for l in open(fn):
        if not l.strip(): continue
        r = json.loads(l); rows[('%.4f' % r['t'], 'G')] = dict(t=r['t'], kind='gaussian', l=r['l'], C=r['row'] - r['t'] ** 2 + 2 * r['l'] * r['t'], value=r['row'], sig=r['sig'], nu5=r['nu5'])
for fn in law:
    for l in open(fn):
        if not l.strip(): continue
        r = json.loads(l); so = r.get('stein_opt')
        if so and not plain: rows[('%.4f' % r['t'], 'L')] = dict(t=r['t'], kind='stein', l=so['l'], C=so['value'] - r['t'] ** 2 + 2 * so['l'] * r['t'], value=so['value'])
        else: rows[('%.4f' % r['t'], 'L')] = dict(t=r['t'], kind='law', l=r['l'], C=r['value'] - r['t'] ** 2 + 2 * r['l'] * r['t'], value=r['value'])
lst = sorted(rows.values(), key=lambda r: (r['t'], r['kind']))
if tmin is not None: lst = [r for r in lst if r['t'] >= tmin]
ex = [(F(r['l']).limit_denominator(10 ** 12), F(r['C']).limit_denominator(10 ** 12)) for r in lst]
t1 = F(0); dmax = None
if small:
    A, Bc = F(small[0]).limit_denominator(10 ** 12), F(small[1]).limit_denominator(10 ** 12)
    env = lambda t: min(t * t - 2 * l * t + C for l, C in ex)
    lo, hi = F(0), F(1, 4)
    if A * lo * lo + Bc <= env(lo):
        for _ in range(40):
            m = (lo + hi) / 2
            if A * m * m + Bc <= env(m): lo = m
            else: hi = m
        t1 = F(int(lo * 10 ** 6), 10 ** 6)
    dmax = A * t1 * t1 + Bc
B, tb, pieces = envelope(ex, t1, SQRTPI_2_UP)
Bt = B if dmax is None else max(B, dmax)
print('envelope max B = %.7f at t = %.4f; room 500/701 - B = %.3e; 1/B = %.6f' % (float(Bt), float(tb), float(T - Bt), 1 / float(Bt)))
if small: print('| direct small-t bound %.6f t^2 + %.7f | [0, %.4f] | max %.7f | room %.2e |' % (small[0], small[1], float(t1), float(dmax), float(T - dmax)))
act = {}
for a, b, i in pieces:
    l, C = ex[i]; m = max(a * a - 2 * l * a + C, b * b - 2 * l * b + C); act.setdefault(i, []).append((a, b, m))
out = []
print('| row t | kind | value at its t | active on | max there | room |')
for i, r in enumerate(lst):
    if i not in act:
        print('| %.4f | %s | %.7f | not active | - | - |' % (r['t'], r['kind'], r['value'])); out.append(dict(r, active=None)); continue
    a = min(s[0] for s in act[i]); b = max(s[1] for s in act[i]); m = max(s[2] for s in act[i])
    print('| %.4f | %s | %.7f | [%.4f, %.4f] | %.7f | %.2e |' % (r['t'], r['kind'], r['value'], float(a), float(b), float(m), float(T - m)))
    out.append(dict(r, active=[float(a), float(b)], max=float(m), room=float(T - m)))
json.dump(dict(B=float(Bt), room=float(T - Bt), t1=float(t1), rows=out), open(sys.argv[1], 'w'), indent=1)
