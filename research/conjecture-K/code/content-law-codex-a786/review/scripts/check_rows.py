# Review of codex-a786's content-law package: compare the package's rows.json with the row file of the degree-5 study,
# and look at the stored profile tables.  Reviewer: worker of claude-b9ee, 16 Nov 2026.  Read-only on both inputs.
import json, sys
from decimal import Decimal, ROUND_HALF_EVEN
import numpy as np
pkg, rows5, outdir = sys.argv[1], sys.argv[2], sys.argv[3]
P = json.load(open(pkg))
L = [json.loads(x) for x in open(rows5).read().splitlines() if x.strip()]
key = {'l': 'l', 'beta': 'beta', 'bA': 'bA', 'bB': 'bB', 'nu5': 'nu5', 'sigma': 'sig'}
ok_all = True
for p in P:
    t = float(p['t']); cand = [(i + 1, r) for i, r in enumerate(L) if abs(r['t'] - t) < 1e-12]
    assert len(cand) == 1, (t, cand)
    k, r = cand[0]; worst = Decimal(0); bad = []
    for a, b in key.items():
        d = Decimal(p[a]); full = Decimal(repr(r[b])); nd = -d.as_tuple().exponent
        rounded = full.quantize(Decimal(1).scaleb(-nd), rounding=ROUND_HALF_EVEN)
        diff = abs(d - full); worst = max(worst, diff)
        if rounded != d: bad.append((a, str(d), str(full)))
    ok_all &= not bad
    npz = np.load('%s/prof_%d.npz' % (outdir, k)); rec = json.loads(str(npz['rec']))
    same = all(rec[b] == r[b] for b in key.values())
    print('t=%-5s line %2d of rows5.lines: package decimals = rounding of the row file to 10 places: %s (max |diff| %.1e); prof_%d.npz carries the same record: %s; keys %s; S grid %d pts [%g, %g]'
          % (p['t'], k, 'YES' if not bad else 'NO %s' % bad, worst, k, same, sorted(npz.keys()), len(npz['S']), npz['S'][0], npz['S'][-1]))
print('ALL SIX ROWS MATCH' if ok_all else 'MISMATCH')
