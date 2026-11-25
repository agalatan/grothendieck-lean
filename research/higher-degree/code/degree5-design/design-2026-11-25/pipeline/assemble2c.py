# Assemble the stage-2c rows (claude-b9ee worker d5newcap, 16 Nov 2026; from cert2b/assemble2b.py).
#   python3 -I assemble2c.py ROWS.json        -> out/rows2c_final.json (the spec of replay2c_all.py) and the tables
# Per row: C_plain from out/rec_TAG.json (moments + radius cover), C_stein from out/recS_TAG.json (kind stein).  The final
# constant of a row is C_stein when it exists, else C_plain.  If game.json has "small_t" = {a, b, ...}, the direct bound
# V <= a t^2 + b (smallt/, P + C) is used on [0, t1], t1 = its crossing with the row envelope rounded down to 10^-6 (any t1
# gives a valid partition; the crossing minimises the maximum; "t1" in small_t overrides it); otherwise the rows must cover
# [0, 886227/10^6] themselves.
import sys, os, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as F
from envelope import envelope, SQRTPI_2_UP
import gamecfg as G
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'out')
TARGET = G.TARGET

def crossing(rows, A, Bc):
    def env(t): return min(t * t - 2 * l * t + C for l, C in rows)
    lo, hi = F(0), F(1, 4)
    if not (A * lo * lo + Bc <= env(lo)): return F(0)        # the direct bound is above the rows already at t = 0
    for _ in range(40):
        m = (lo + hi) / 2
        if A * m * m + Bc <= env(m): lo = m
        else: hi = m
    return F(int(lo * 10 ** 6), 10 ** 6)

def table(name, rows, tags, small):
    if small:
        # t1: "t1" of game.json when given (the direct bound needs no K5, so one may prefer to use it beyond the point
        # where it stops being the smaller bound; any t1 with a t1^2 + b < target gives a valid partition), else the crossing
        A, Bc = F(small['a']), F(small['b']); t1 = F(small['t1']) if small.get('t1') else crossing(rows, A, Bc); dmax = A * t1 * t1 + Bc
    else:
        t1 = F(0); dmax = None
    B, tb, pieces = envelope(rows, t1, SQRTPI_2_UP)
    Bt = B if dmax is None else max(B, dmax)
    print('### %s' % name)
    print('B = %.10f at t = %.5f; %s - B = %.4e' % (float(Bt), float(tb if (dmax is None or B >= dmax) else t1), str(TARGET), float(TARGET - Bt)))
    print('| piece | active on | max there | room |')
    print('|---|---|---|---|')
    if small: print('| direct small-t bound %s t^2 + %s | [0, %.6f] | %.7f | %.2e |' % (small['a'], small['b'], float(t1), float(dmax), float(TARGET - dmax)))
    act = {}
    for a, b, i in pieces:
        l, C = rows[i]; m = max(a * a - 2 * l * a + C, b * b - 2 * l * b + C)
        act.setdefault(i, []).append((a, b, m))
    for i, tag in enumerate(tags):
        if i not in act: print('| row %s | not active | - | - |' % tag); continue
        a = min(s[0] for s in act[i]); b = max(s[1] for s in act[i]); m = max(s[2] for s in act[i])
        print('| row %s | [%.4f, %.4f] | %.7f | %.2e |' % (tag, float(a), float(b), float(m), float(TARGET - m)))
    print()
    return Bt, t1

if __name__ == '__main__':
    spec = json.load(open(sys.argv[1])); rows_out = []; plain = []; final = []; tags = []
    for r in sorted(spec['rows'], key=lambda x: float(x['t'])):
        tag = r['tag']; fp = os.path.join(OUT, 'rec_%s.json' % tag); fs = os.path.join(OUT, 'recS_%s.json' % tag)
        rp = json.load(open(fp)) if os.path.exists(fp) else None; rs = json.load(open(fs)) if os.path.exists(fs) else None
        Cp = F(rp['C']) if rp and rp.get('C') else None; Cs = F(rs['C']) if rs and rs.get('C') else None
        if Cp is None and Cs is None: print('row %s: NO certified constant (skipped)' % tag); continue
        l = F(r['l']); rowarg = ','.join(str(F(r[k])) for k in ('l', 'beta', 'bA', 'bB'))
        covers = {}
        if Cp is not None: covers['plain'] = 'cover_%s.json' % tag
        if Cs is not None: covers['stein'] = 'coverS_%s.json' % tag
        e = dict(t=r['t'], kind=r['kind'], tag=tag, row=rowarg, covers=covers)
        if Cp is not None: e['C_plain'] = str(Cp); plain.append((l, Cp))
        if Cs is not None: e['C_stein'] = str(Cs)
        final.append((l, Cs if Cs is not None else Cp)); tags.append(tag); rows_out.append(e)
    small = G.SMALL_T
    print('game: eps1 = %s, eta = %s, rho = %s; rows: %s' % (G.EPS1, G.ETA, G.RHO, ', '.join(tags)))
    print('Stein rows: %s\n' % ', '.join(e['tag'] for e in rows_out if 'C_stein' in e))
    Bt, t1 = table('final envelope (Stein covers where present)', final, tags, small)
    out = dict(game=dict(eps1=str(G.EPS1), eta=str(G.ETA), rho=str(G.RHO), target=str(TARGET)), rows=rows_out,
               small_t=(dict(small, t1_final=str(t1)) if small else None), B=str(Bt), room=str(TARGET - Bt))
    json.dump(out, open(os.path.join(OUT, 'rows2c_final.json'), 'w'), indent=1)
    for e in rows_out:
        if 'C_stein' in e and 'C_plain' in e:
            print('row %s: C plain %.7f -> Stein %.7f (drop %.2e)' % (e['tag'], float(F(e['C_plain'])), float(F(e['C_stein'])), float(F(e['C_plain']) - F(e['C_stein']))))
