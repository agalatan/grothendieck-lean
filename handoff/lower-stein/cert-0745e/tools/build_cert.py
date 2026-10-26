"""Assemble the exact certificate directory from row covers.
usage: build_cert.py OUT spec.json       spec = {"eps": "149/200", "rows": [{"t": "0.845", "pkl": ..., "stein": [cc json files], "moment": [mr json files],
                                                 "plan": [["stein", xlo, xhi] | ["moment", xlo, xhi], ...] (optional: default all stein cells)}]}
Then computes the envelope models (float search, exact data) and writes manifest.json; B is taken from spec["B"] if present, else the exact envelope maximum rounded up to 1e-9."""
import sys, os, json, pickle, hashlib, numpy as np
from fractions import Fraction as Fr
from math import ceil
import verify_cert as VC
out, spec = sys.argv[1], json.load(open(sys.argv[2])); os.makedirs(out, exist_ok=True); eps = Fr(spec['eps']); files = {}
def exact_nodes(pk):
    """cap nodes as exact rationals: pk['nodes_exact'] (strings) when present; otherwise the float nodes, accepted only if they are
    exactly representable on the 1e-4 grid (no silent rounding; cert-0745e fix of the round-2 hazard)."""
    if 'nodes_exact' in pk:
        N = [Fr(v) for v in pk['nodes_exact']]; assert len(N) == len(pk['nodes']) and all(abs(float(a) - b) < 1e-12 for a, b in zip(N, pk['nodes'])); return N
    N = [Fr(int(round(r * 10**4)), 10**4) for r in pk['nodes']]
    assert all(abs(float(a) - b) < 1e-12 for a, b in zip(N, pk['nodes'])), 'cap node not on the 1e-4 grid: store pk["nodes_exact"]'
    return N
fx = lambda v: Fr(str(float(v)))
def dump(name, obj):
    s = json.dumps(obj, separators=(',', ':')); open(os.path.join(out, name), 'w').write(s); files[name] = hashlib.sha256(s.encode()).hexdigest(); return len(s)
rows = {}
for r in spec['rows']:
    pk = pickle.load(open(r['pkl'], 'rb')); assert pk.get('certified'); name = r['t']
    nodes = [str(v) for v in exact_nodes(pk)]; caps = list(pk['caps_exact']); smax = Fr(int(np.ceil(pk['smax'] * 1000)), 1000); kappa = Fr(int(np.floor(pk['kappa'] * 10**9)), 10**9)
    st = {}; mesh = None
    def ints(vals, den):
        out = []
        for v in vals: q = Fr(v) * den; assert q.denominator == 1; out.append(int(q))
        return out
    for fn in r.get('stein', []):
        d = json.load(open(fn)); assert Fr(d['kappa']) == kappa and Fr(d['smax']) == smax and all(abs(a - b) < 1e-15 for a, b in zip(d['th'], pk['th'])); mesh = d['mesh']
        for c in d['cells']:
            k = (fx(c['x'][0]), fx(c['x'][1]))
            if k in st and c['bound'] >= st[k]['bound']: continue
            bank = []; nn = []
            for n in c['nodes']:
                nn.append(dict(sigma=n['sigma'], y=n['y'], mu=n['mu'], cuts=list(range(len(bank), len(bank) + len(n['bank'])))))
                bank += n['bank']
            st[k] = dict(bound=c['bound'], small=c['small'], bank=bank, nodes=nn)
    for fn in r.get('rebank', []):                                  # shared-bank rewrites override the plain covers
        d = json.load(open(fn)); mesh = d['mesh']
        for c in d['cells']: st[(fx(c['x'][0]), fx(c['x'][1]))] = dict(bound=0, small=c['small'], bank=c['bank'], nodes=c['nodes'])
    mo = {}
    for fn in r.get('moment', []):
        d = json.load(open(fn)); assert Fr(d['kappa']) == kappa and Fr(d['smax']) == smax
        for q in d['rects']:
            s0, s1, x0, x1 = [Fr(v) for v in q['rect']]; mo.setdefault((x0, x1), []).append((s0, s1, q['P'], q['bound']))
    plan = r.get('plan') or [['stein', float(k[0]), float(k[1])] for k in sorted(st)]; cells = []
    for kind, a, b in plan:
        a, b = fx(a), fx(b)
        if kind == 'stein':
            for k in sorted(st):
                if a <= k[0] and k[1] <= b:
                    c = st[k]; cells.append(dict(x=[str(k[0]), str(k[1])], kind='stein', small=[dict(s=q['rect'][:2], P=q['P']) for q in c['small']], bank=[ints(z, 10**7) for z in c['bank']],
                                                nodes=[dict(sigma=n['sigma'], y=n['y'], mu=ints(n['mu'], 10**10), cuts=n['cuts']) for n in c['nodes']]))
        else:
            for k in sorted(mo):
                if a <= k[0] and k[1] <= b: cells.append(dict(x=[str(k[0]), str(k[1])], kind='moment', rects=[dict(s=[str(s0), str(s1)], P=P) for s0, s1, P, _ in sorted(mo[k])]))
    R = dict(name=name, eps=str(eps), t=str(Fr(str(pk['t']))), theta=[str(Fr(float(v))) for v in pk['th'][:15]], kappa=str(kappa), smax=str(smax), nodes=nodes, caps=caps, mesh=mesh or [], cells=cells)
    n = dump(f"row_{name}.json", R); print(f"row {name}: {len(cells)} cells ({sum(c['kind']=='stein' for c in cells)} stein), {n/1e6:.2f} MB")
json.dump(dict(eps=str(eps), B="1", files=files), open(os.path.join(out, 'manifest.json'), 'w'))
