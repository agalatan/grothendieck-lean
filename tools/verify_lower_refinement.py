# tools/verify_lower_refinement.py
"""Exact replay. Python standard library only; no optimization or floating tests.

The inherited analytic theorems and source node caps are those of the pinned,
Lean-audited repository. New spectral majorants and the entire refined cover
are independently checked here with rational arithmetic.
"""
from collections import Counter
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import re
import sys
import time

from lower_refinement import (
    DATA, ROOT, RHO, batches, chord, component, data, evaluate,
    new_certificates, original_batch_count, poly, rows, strings, value, weights,
)
import rankone_law as L

def require(ok, message):
    if not ok:
        raise ValueError(message)

def source_check():
    doc = json.loads((DATA / 'sources.json').read_text())
    for f, h in doc['git_blob_sha'].items():
        b = (ROOT / f).read_bytes()
        digest = hashlib.sha1(b'blob ' + str(len(b)).encode() + b'\x00' + b).hexdigest()
        require(digest == h, 'Source mismatch: ' + f)
    return len(doc['git_blob_sha'])

def original_coverage():
    s = (ROOT / 'Grothe/Research/RefinedCoverData.lean').read_text()
    chunks = re.findall('def refinedCuts\\d+ : String :=\\s*"([^"]*)"', s)
    toks = '|'.join(chunks).split('|')
    pos = 0
    leaf = 0
    doms = Counter((poly(st.split('|')[1]) for st in strings))

    def walk(bb):
        nonlocal pos, leaf
        require(pos < len(toks), 'Incomplete original coverage tree')
        t = toks[pos]
        pos += 1
        if t == '.':
            require(leaf < len(strings), 'Too many original leaves')
            require(doms[tuple(bb)] == 1, 'Original box/coverage mismatch')
            doms[tuple(bb)] -= 1
            leaf += 1
            return
        ax, mid = t.split(',')
        ax = int(ax)
        mid = Q(mid)
        require(ax in (0, 1, 2) and bb[2 * ax] < mid < bb[2 * ax + 1], 'Invalid original cut')
        l = list(bb)
        r = list(bb)
        l[2 * ax + 1] = mid
        r[2 * ax] = mid
        walk(l)
        walk(r)
    walk((Q(0), Q(9, 10), Q(0), RHO, Q(0), Q(31, 4)))
    require(pos == len(toks) and leaf == len(strings), 'Unused original coverage data')
    require(not any(doms.values()), 'Unused original boxes')
    return leaf

def source_of_batch(bi):
    require(0 <= bi < original_batch_count, 'New cut must cite an original source potential')
    b = batches[bi]
    parts = []
    for i, w in weights(b['i'], b['j'], b['w']).items():
        r = rows[i]
        table = [a.split(':') for a in r['raw_strings'][0].split(';') if a]
        require(r['h'][2] > 0 and r['h'][4] >= 0, 'Invalid source header')
        parts.append((w, L.source_from_table(table, r['h'][4], r['h'][2])))
    return L.mixture_source(parts)

def new_node_check(doc):
    w = doc['witness']
    required = {'tau', 'P', 'rv', 'phi', 'lam', 'mu', 't', 'beta', 'nu'}
    require(required <= set(w) and set(w) <= required | {'tensor_budget', 'sixth_joint'}, 'Unsupported spectral option')
    require('sixth_joint' not in w or 'tensor_budget' in w, 'Joint node lacks Gram budget')
    if 'tensor_budget' in w:
        L.verify_tensor_budget(w)
    require(w['tau'] == doc['tau'] and w['P'] == doc['P'], 'Witness/declared node mismatch')
    require(Q(w['tau']) > 0 and Q(w['lam']) > 0 and (Q(w['mu']) > 0) and (Q(w['nu']) >= 0), 'Invalid spectral parameters')
    pp = list(map(Q, w['P']))
    require(len(pp) == 5 and pp[1] >= 0 and (pp[4] >= 0), 'Invalid moment signs')
    rv, cuts = L.spectral_pieces(w)
    got = L.verify_node(source_of_batch(doc['batch']), Q(doc['tau']), pp, rv, cuts, depth=14)
    require(got == doc['proof'], 'Stored majorant proof statistics differ')
    return got

def check_leaf(rec, domain):
    if rec['kind'] == 'cap':
        d = data(rec['box'])
        require(d[1] == tuple(domain), 'Leaf domain mismatch')
        val = evaluate(d)
    elif rec['kind'] == 'multi':
        require(tuple(map(Q, rec['bounds'])) == tuple(domain), 'Mixture domain mismatch')
        ws = []
        cs = []
        for _, weight, st in rec['components']:
            w = Q(weight)
            require(w >= 0, 'Negative mixture weight')
            v, n0, n1 = component(st, domain[5])
            p = chord(n0, n1, domain[2])
            q = chord(n0, n1, domain[3])
            require(p[4] >= 0 and q[4] >= 0, 'Invalid sixth-moment sign')
            ws.append(w)
            cs.append((v, p, q))
        require(ws and sum(ws) == 1, 'Mixture weights do not sum to one')
        # Retain the gate matrices/vectors until after the finite mixture;
        # completing each square first would lose the improvement.
        vv, pp, qq = [
            tuple(sum(w * c[j][i] for w, c in zip(ws, cs))
                  for i in range(len(cs[0][j])))
            for j in range(3)
        ]
        val = value(domain, vv, pp, qq)
    else:
        raise ValueError('Unknown leaf type')
    require(val == Q(rec['upper']), 'Stored leaf bound differs from exact recomputation')
    return val

def check_tree(tr, domain):
    if 'leaf' in tr:
        require(set(tr) == {'leaf'}, 'Malformed leaf')
        return (check_leaf(tr['leaf'], domain), 1)
    require(set(tr) == {'axis', 'mid', 'children'} and len(tr['children']) == 2, 'Incomplete subdivision')
    ax = tr['axis']
    mid = Q(tr['mid'])
    require(ax in (0, 1, 2), 'Invalid split axis')
    require(domain[2 * ax] < mid < domain[2 * ax + 1], 'Noninterior split')
    a = list(domain)
    b = list(domain)
    a[2 * ax + 1] = mid
    b[2 * ax] = mid
    va, na = check_tree(tr['children'][0], a)
    vb, nb = check_tree(tr['children'][1], b)
    return (max(va, vb), na + nb)

def certificate_check(doc, verbose=True):
    require(doc['new_nodes'] == [p.name for p, c in new_certificates], 'New node registry mismatch')
    records = doc['records']
    ids = [r['parent'] for r in records]
    require(len(ids) == len(set(ids)) and all((0 <= i < len(strings) for i in ids)), 'Duplicate/invalid parent')
    by = {r['parent']: r for r in records}
    b0 = Q('0.713420886479')
    target = Q(doc['target'])
    worst = Q(0)
    count = 0
    worst_parent = None
    for k, s in enumerate(strings):
        d = data(s)
        old = evaluate(d)
        require(old <= b0, 'Original bound replay failed')
        if k in by:
            rec = by[k]
            v, n = check_tree(rec['tree'], d[1])
            require(v == Q(rec['worst']), 'Wrong record maximum')
            require(v <= old, 'Replacement worsens original box')
        else:
            v, n = (old, 1)
        if v > worst:
            worst = v
            worst_parent = k
        count += n
    require(target > 0, 'Nonpositive target')
    require(worst <= target, 'Global target not reached: ' + str(float(worst)))
    lower = Q(doc['lower'])
    require(0 < lower and lower * target < 1, 'Reciprocal claim is invalid')
    if verbose:
        print('PASS exact whole-cover cap:', str(target), flush=True)
        print('Exact maximum:', str(worst), flush=True)
        print('Maximum decimal (display only):', float(worst), 'parent:', worst_parent, flush=True)
        print('Covered leaves:', count, 'replaced parents:', len(records), flush=True)
        print('Exact arithmetic consequence with inherited analytic theorems: K_G^C >=', str(1 / target), '>', str(lower), '=', float(lower), flush=True)
        print('Lean reflection of this extension remains pending.', flush=True)
    return (worst, count)
if __name__ == '__main__':
    if not __debug__:
        raise RuntimeError('Run without -O; inherited verifier uses assertions')
    started = time.time()
    print('Pinned source files:', source_check(), flush=True)
    print('Original coverage leaves:', original_coverage(), flush=True)
    for p, c in new_certificates:
        info = new_node_check(c)
        print('PASS new node:', p.name, info, flush=True)
    path = Path(sys.argv[1]) if len(sys.argv) > 1 else DATA / 'cover.json'
    doc = json.loads(path.read_text())
    certificate_check(doc)
    print('Elapsed seconds (display only):', round(time.time() - started, 2), flush=True)
