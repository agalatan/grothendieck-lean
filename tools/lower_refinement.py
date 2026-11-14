# tools/lower_refinement.py
"""Exact row and cover arithmetic shared by the lower-refinement verifier.

Source tables are read from the pinned Lean data. All acceptance arithmetic
uses Fraction; this module does not optimize, integrate, or access the network.
"""
from fractions import Fraction as Q
from functools import lru_cache
import json
from pathlib import Path
import re

if not __debug__:
    raise RuntimeError('Run without -O; inherited certificate checks use assertions')
ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / 'data/lower-refinement'
EPS = Q(149, 200)
RHO = Q(973612157, 10 ** 9)
C6 = Q(4045313, 100000)
PAD = Q(1, 10 ** 11)

def mix(w, a, b):
    assert len(a) == len(b)
    return tuple((1 - w) * x + w * y for x, y in zip(a, b))

def poly(s):
    return tuple(map(Q, s.split(',')))

def header(s):
    s = re.sub('\\((-?\\d+) : ℚ\\)', '\\1', s).replace('⟨', '').replace('⟩', '')
    return [Q(v.replace(' ', '')) for v in s.strip().strip(',').split(',')]
rows = []
for k in range(1, 20):
    s = (ROOT / f'Grothe/Lower/RowData{k:02d}.lean').read_text().split(':=', 1)[1]
    h = header(s[:s.index('"')])
    assert len(h) == 15
    ell, beta, d, kap, smax, cap, *rest = h
    a, n1, n2, c1, c2, c3, b0, b1, b2 = rest
    strings = re.findall('"([^"]*)"', s)
    cells = []
    for cs in strings[2:]:
        ss = cs.split('|')
        assert len(ss) == 5
        nodes = []
        for ns in ss[4].split(';'):
            if not ns:
                continue
            t, p, *_ = ns.split(':')
            nodes.append((Q(t) / d, poly(p)))
        cells.append(nodes)
    zero = Q(strings[0].split(';')[0].split(':')[1])
    rv = (ell, beta, a - EPS + 2 * d * (1 + b0), n1 + d * b1, n2 + d * b2, c1, c2, c3)
    rows.append(dict(v=rv, env=(ell, beta, 2 * beta ** 2 / EPS + cap + PAD), zero=(Q(0), (zero, Q(0), Q(0), Q(0), Q(0))), cells=cells, h=h, raw_strings=strings))
batches = []
for name in ['Grothe/Lower/MixedData.lean', 'Grothe/Research/LawNodeData.lean']:
    s = (ROOT / name).read_text()
    for b in re.split('⟨(?=\\d+, \\d+,)', s)[1:]:
        hh = header(b[:b.index('"')])
        assert len(hh) == 4
        i, j, w, smax = hh
        ns = []
        for st in re.findall('"([^"]*)"', b)[2:]:
            pre = st.split('|')[0].split(':')
            t, p = pre[:2]
            xc = Q(31, 4)
            if len(pre) == 4 and pre[3].startswith('j,'):
                xc = Q(pre[3].split(',')[3])
            ns.append((Q(t), poly(p), xc))
        batches.append(dict(i=int(i), j=int(j), w=w, nodes=ns, raw_strings=re.findall('"([^"]*)"', b)))
assert len(batches) == 23, len(batches)
original_batch_count = len(batches)
new_certificates = []
for path in [DATA / 'nodes' / f for f in json.loads((DATA / 'nodes.json').read_text())]:
    c = json.loads(path.read_text())
    assert 0 <= c['batch'] < original_batch_count
    parent = batches[c['batch']]
    xc = Q(c['witness'].get('sixth_joint', {}).get('xmax', Q(31, 4)))
    batches.append(dict(i=parent['i'], j=parent['j'], w=parent['w'], nodes=[(Q(c['tau']), tuple(map(Q, c['P'])), xc)]))
    new_certificates.append((path, c))

def weights(i, j, w):
    assert 0 <= i < len(rows) and 0 <= j < len(rows)
    assert 0 <= w <= 1, 'Nonconvex source mixture'
    return {k: v for k, v in [(i, 1 - w), (j, w)] if v} if i != j else {i: Q(1)}

@lru_cache(None)
def node(ref, i, j, w, xu):
    f = ref.split(',')
    typ = f[0]
    idx = int(f[1])
    assert typ in ('z', 's', 'b') and idx >= 0, 'Invalid node reference'
    assert all((int(x) >= 0 for x in f[1:])), 'Negative node index'
    assert len(f) == {'z': 2, 's': 4, 'b': 3}[typ], 'Malformed node reference'
    if typ in ('z', 's'):
        assert weights(i, j, w) == {idx: Q(1)}
        return rows[idx]['zero'] if typ == 'z' else rows[idx]['cells'][int(f[2])][int(f[3])]
    else:
        b = batches[idx]
        assert weights(i, j, w) == weights(b['i'], b['j'], b['w'])
        t, p, xc = b['nodes'][int(f[2])]
        assert xu <= xc, (ref, xu, xc)
        return (t, p)

def chord(n0, n1, t):
    a, p = n0
    b, q = n1
    assert a <= t <= b, (a, t, b)
    return p if a == b else mix((t - a) / (b - a), p, q)

@lru_cache(None)
def component(s, xu):
    hh, *rr = s.split(';')
    i, j, w, s0, s1 = hh.split(',')
    i, j = (int(i), int(j))
    w, s0, s1 = map(Q, (w, s0, s1))
    ns = [node(r, i, j, w, xu) for r in rr]
    assert len(ns) == 4
    p = chord(*ns[:2], s0)
    q = chord(*ns[2:], s1)
    return (mix(w, rows[i]['v'], rows[j]['v']), (s0, p), (s1, q))

def qmax(a, b, c, lo, hi):

    def val(x):
        return a + b * x + c * x * x
    vs = [val(lo), val(hi)]
    if c < 0:
        x = -b / (2 * c)
        if lo <= x <= hi:
            vs.append(val(x))
    return max(vs)

def J(p, x):
    a0, a1, a2, a4, a6 = p
    return a0 + RHO * a1 + a2 + a4 * (2 + x * x) + a6 * (6 + 9 * x * x + C6 * x * x * x)

def price(v):
    ell, beta, k, h1, h2, c1, c2, c3 = v
    det = c1 * c3 - c2 * c2
    assert c1 > 0 and det > 0
    return k - (c3 * h1 * h1 - 2 * c2 * h1 * h2 + c1 * h2 * h2) / det

def value(bb, v, p, q, eps=EPS):
    """The x polynomial has form a + b*x^2 + c*x^3 with c >= 0.

    On x >= 0 its derivative cannot change from positive to negative, so
    endpoints suffice even when b is negative. The remaining scale maximum
    is quadratic and includes an interior vertex whenever needed.
    """
    tl, tu, sl, su, xl, xu = bb
    ell, beta = v[:2]
    D = price(v) + (EPS - eps)
    assert 0 <= xl <= xu and 0 <= sl <= su and (tl <= tu), 'Invalid box'
    assert p[1] >= 0 and q[1] >= 0 and (p[4] >= 0) and (q[4] >= 0), 'Invalid moment signs'

    def xp(x):
        a, b = (J(p, x), J(q, x))
        if sl == su:
            return a - D * sl * sl
        m = (b - a) / (su - sl)
        return qmax(a - m * sl, m, -D, sl, su)
    return qmax(0, -2 * ell, 1, tl, tu) + 2 * beta * beta / eps + max(xp(xl), xp(xu)) + PAD
env = [(Q(0), Q(0), EPS * RHO ** 2)] + [r['env'] for r in rows]

def capvalue(bb, ij, eps=EPS):
    i, j, w = ij
    assert i.denominator == j.denominator == 1, 'Nonintegral cap index'
    i, j = (int(i), int(j))
    assert 0 <= i < len(env) and 0 <= j < len(env), 'Invalid cap index'
    assert 0 <= w <= 1, 'Nonconvex cap mixture'
    a, b = (env[i], env[j])
    ell, beta, C = mix(w, a, b)
    C -= 2 * w * (1 - w) * (a[1] - b[1]) ** 2 / EPS
    C += 2 * beta * beta * (1 / eps - 1 / EPS) + (eps - EPS) * bb[2] ** 2
    return qmax(C, -2 * ell, 1, bb[0], bb[1])

def data(s):
    typ, bounds, *rr = s.split('|')
    assert typ in ('c', 'b', 'm'), 'Unknown box type'
    assert len(rr) == (3 if typ == 'm' else 1), 'Malformed box'
    bb = poly(bounds)
    assert len(bb) == 6, 'Malformed box domain'
    if typ == 'c':
        return (typ, bb, poly(rr[0]))
    if typ == 'b':
        v, n0, n1 = component(rr[0], bb[5])
        p = chord(n0, n1, bb[2])
        q = chord(n0, n1, bb[3])
        return (typ, bb, (v, p, q))
    w = Q(rr[0])
    assert 0 <= w <= 1, 'Nonconvex row mixture'
    v0, a0, b0 = component(rr[1], bb[5])
    v1, a1, b1 = component(rr[2], bb[5])
    p = mix(w, chord(a0, b0, bb[2]), chord(a1, b1, bb[2]))
    q = mix(w, chord(a0, b0, bb[3]), chord(a1, b1, bb[3]))
    return (typ, bb, (mix(w, v0, v1), p, q))

def evaluate(d, eps=EPS):
    typ, bb, rest = d
    return capvalue(bb, rest, eps) if typ == 'c' else value(bb, *rest, eps)
strings = re.findall('"([bcm]\\|[^"]+)"', (ROOT / 'Grothe/Research/RefinedCoverData.lean').read_text())
