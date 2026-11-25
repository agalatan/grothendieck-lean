# Build the row file of stage 2c from the float row optimisations (N; it only selects the rows).
# claude-b9ee worker d5newcap, 16 Nov 2026.
#   python3 make_rows2c.py GAUSS.lines LAW.lines OUT.json [--stein T1,T2,...] [--law T1,...] [--gauss T1,...] [--slack 1/1000]
# GAUSS.lines: rows/rowscan.py output (Gaussian-ideal rows); LAW.lines: rows/lawbundle.py output (law-aware rows; the field
# "stein_opt" is the row re-optimised against the moment + radius + Stein class).  Row parameters are rounded to 6 decimals
# (exact rationals).  A Stein row takes its parameters from "stein_opt" and gets
#     stein_target = (float Stein value of G+ at that row) + slack,
# the target of the Stein cover (boxes above it are refined; the slack is room left unused, a smaller slack costs more boxes).
import sys, os, json
from fractions import Fraction as F
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import gamecfg as G
def arg(name, default=None):
    return sys.argv[sys.argv.index(name) + 1] if name in sys.argv else default
gauss = [json.loads(l) for l in open(sys.argv[1]) if l.strip()]; law = [json.loads(l) for l in open(sys.argv[2]) if l.strip()]
sel = lambda s: [round(float(x), 4) for x in s.split(',')] if s else []
ts_stein, ts_law, ts_gauss = sel(arg('--stein')), sel(arg('--law')), sel(arg('--gauss'))
slack = F(arg('--slack', '1/1000'))
q6 = lambda v: F(round(v * 10 ** 6), 10 ** 6)
rows = []
for r in gauss:
    if ts_gauss and round(r['t'], 4) not in ts_gauss: continue
    assert abs(r['e1'] - float(G.EPS1)) < 1e-12 and abs(r['eta'] - float(G.ETA)) < 1e-12, 'Gaussian rows of another game'
    p = [q6(r[k]) for k in ('l', 'beta', 'bA', 'bB')]
    rows.append(dict(tag='%.4f' % r['t'], t=r['t'], kind='gaussian', l=str(p[0]), beta=str(p[1]), bA=str(p[2]), bB=str(p[3]),
                     float_row=r['row'], float_room=float(G.TARGET) - r['row']))
for r in law:
    t = round(r['t'], 4)
    assert abs(r['e1'] - float(G.EPS1)) < 1e-12 and abs(r['eta'] - float(G.ETA)) < 1e-12 and abs(r['rho'] - float(G.RHO)) < 1e-12, 'law rows of another game'
    if t in ts_stein:
        so = r['stein_opt']; p = [q6(so[k]) for k in ('l', 'beta', 'bA', 'bB')]
        Gst = so['value'] - (r['t'] ** 2 - 2 * so['l'] * r['t'] + 2 * so['beta'] ** 2 / float(G.EPS1))      # the float Stein supremum G+
        tgt = (F(Gst).limit_denominator(10 ** 9) + slack).limit_denominator(10 ** 9)
        rows.append(dict(tag='%.4fL' % r['t'], t=r['t'], kind='stein', l=str(p[0]), beta=str(p[1]), bA=str(p[2]), bB=str(p[3]),
                         stein_target=str(tgt), float_row=so['value'], float_room=so['room']))
    elif t in ts_law:
        p = [q6(r[k]) for k in ('l', 'beta', 'bA', 'bB')]
        rows.append(dict(tag='%.4fL' % r['t'], t=r['t'], kind='law', l=str(p[0]), beta=str(p[1]), bA=str(p[2]), bB=str(p[3]),
                         float_row=r['value'], float_room=r['room']))
rows.sort(key=lambda r: r['t'])
assert len(set(r['tag'] for r in rows)) == len(rows)
json.dump(dict(game=dict(eps1=str(G.EPS1), eta=str(G.ETA), rho=str(G.RHO)), stein_slack=str(slack), rows=rows), open(sys.argv[3], 'w'), indent=1)
print('%d rows (%d gaussian, %d law, %d stein) -> %s' % (len(rows), sum(r['kind'] == 'gaussian' for r in rows), sum(r['kind'] == 'law' for r in rows),
      sum(r['kind'] == 'stein' for r in rows), sys.argv[3]))
for r in rows: print('  %-7s %-8s l=%s beta=%s bA=%s bB=%s  float row %.7f room %.2e %s' % (r['tag'], r['kind'], r['l'], r['beta'], r['bA'], r['bB'], r['float_row'], r['float_room'], ('target ' + r['stein_target']) if r['kind'] == 'stein' else ''))
