#!/usr/bin/env python3
"""Independent exact check of saved refined moment leaves and their coverage.

Gaussian price integration is an external prerequisite, discharged by the
separate full replay. This file checks rational polynomial inequalities,
complete parent-by-parent coverage, and the final scalar envelope afresh.
Optional extra physical polynomials are also checked above the lifted chords.
"""

if not __debug__:
    raise RuntimeError('Assertions are proof gates; do not use Python -O or -OO.')

import argparse
import copy
from fractions import Fraction as Q
import importlib.util
import json
from math import comb
from pathlib import Path

HERE = Path(__file__).resolve().parent
LIFT = Q(1, 10**8)
RHO = Q('0.98')
C6 = Q('49.42289')
EPS = Q(37, 50)


def shifted(p, lo, width=Q(1)):
    out = [Q(0)] * len(p)
    for j, a in enumerate(p):
        for k in range(j + 1):
            out[k] += a * comb(j, k) * lo**(j-k) * width**k
    return out


def bernstein(p, lo, hi):
    q = shifted(p, lo, hi-lo)
    n = len(q)-1
    return [sum((q[j] * Q(comb(k,j), comb(n,j)) for j in range(k+1)), Q(0))
            for k in range(n+1)]


def moment_upper(p, delta, box):
    lo, hi, a, b = box
    assert len(p) == 7 and p[3] == p[5] == 0
    assert p[1] >= 0 and p[6] >= 0
    # For fixed sigma, the x-dependence is A*x^2+B*x^3, B>=0.
    # Any interior positive critical point is a minimum.
    bounds = []
    for x in (a, b):
        coeffs = [p[0], RHO*p[1], p[2]-1/delta, Q(0),
                  p[4]*(2+x*x), Q(0), p[6]*(6+9*x*x+C6*x**3)]
        bounds.extend(bernstein(coeffs, lo, hi))
    return max(bounds)


def check_parent_cover(parent, leaves):
    lo, hi, a, b = parent
    assert leaves
    for l,h,c,d in leaves:
        assert lo <= l < h <= hi and a <= c < d <= b
    edges = sorted({lo, hi} | {x for box in leaves for x in box[:2]})
    for l,h in zip(edges, edges[1:]):
        mid = (l+h)/2
        spans = sorted((c,d) for L,H,c,d in leaves if L < mid < H)
        assert spans and spans[0][0] == a and spans[-1][1] == b
        assert all(v[1] == w[0] for v,w in zip(spans, spans[1:])), (parent,l,h)


def check_physical_extra(group, record):
    points = [(Q(v['r']), Q(v['cap'])+LIFT) for v in group['points']]
    supports = []
    for (x,u),(y,v) in zip(points,points[1:]):
        slope = (v-u)/(y-x)
        supports.append(([u-slope*x,slope],x,y))
    x,u = points[-1]
    supports.append(([u-2*x,Q(2)],x,None))
    p = list(map(Q,record['coefficients']))
    p[0] += LIFT
    assert len(p)==7 and p[3]==p[5]==0 and p[1]>=0 and p[6]>=0
    proof = record['physical']
    tail = Q(proof['tail_start'])
    previous = Q(0)
    for l,h,idx in proof['cells']:
        l,h = Q(l),Q(h)
        assert l == previous and l < h <= tail
        previous = h
        assert isinstance(idx,int) and 0 <= idx < len(supports)
        line,left,right = supports[idx]
        assert left <= l and (right is None or h <= right)
        diff = p.copy()
        diff[0] -= line[0]; diff[1] -= line[1]
        assert min(bernstein(diff,l,h)) >= 0
    assert previous == tail
    idx=proof['tail_index']
    assert isinstance(idx,int) and 0 <= idx < len(supports)
    line,left,right = supports[idx]
    assert right is None and left <= tail
    diff = p.copy()
    diff[0] -= line[0]; diff[1] -= line[1]
    assert min(shifted(diff,tail)) >= 0


def main():
    global RHO
    assert __debug__, 'Do not disable assertions.'
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('--source',type=Path,required=True)
    ap.add_argument('--certificate',type=Path,default=HERE/'certificates/moment-cover.json')
    ap.add_argument('--extra',type=Path,default=HERE/'certificates/additional-polynomials.json')
    ap.add_argument('--rho',type=Q,default=Q('0.98'))
    ap.add_argument('--safe-bound',type=Q,default=Q('1.40020018'))
    args=ap.parse_args()
    # .98 is upstream; .977459 has its separate exact moment certificate.
    # Refuse arbitrary unsupported first-moment assumptions.
    assert args.rho in (Q('0.98'),Q('0.977459'))
    RHO=args.rho
    source=args.source.resolve()
    import hashlib
    assert hashlib.sha256(source.read_bytes()).hexdigest() == '8c6105340cced0ee4b4d4977baab4c0d43f07466ce77e726eb1277b613473ac1'
    spec=importlib.util.spec_from_file_location('upstream_data',source)
    v=importlib.util.module_from_spec(spec);spec.loader.exec_module(v)
    gs=copy.deepcopy(v.DATA)
    extra=json.loads(args.extra.read_text()) if args.extra else {}
    assert set(extra).issubset({g['profile']['id'] for g in gs})
    cert=json.loads(args.certificate.read_text())
    assert len(cert['groups']) == len(gs)
    rows=[('crude',Q(0),EPS*RHO**2)]
    total=0
    for g,c in zip(gs,cert['groups']):
        name=g['profile']['id']
        assert name == c['id']
        assert Q(c['rho']) == RHO and Q(c['sixth']) == C6 and Q(c['lift']) == LIFT
        for rec in extra.get(name,[]):
            check_physical_extra(g,rec)
        g['polynomials'].extend(extra.get(name,[]))
        ps=[list(map(Q,p['coefficients'])) for p in g['polynomials']]
        for p in ps:p[0]+=LIFT
        delta=Q(g['profile']['delta']);cap=Q(c['cap'])
        assert 0 < delta < EPS and Q(g['profile']['epsilon']) == EPS
        parents=[tuple(map(Q,r['box'])) for r in g['rectangles']]
        grouped=[[] for _ in parents]
        for rec in c['rectangles']:
            idx=rec['polynomial'];parent=rec['parent']
            assert isinstance(idx,int) and 0 <= idx < len(ps)
            assert isinstance(parent,int) and 0 <= parent < len(parents)
            box=tuple(map(Q,rec['box']))
            assert len(box)==4
            grouped[parent].append(box)
            assert moment_upper(ps[idx],delta,box) <= cap, (name,rec)
        for parent,leaves in zip(parents,grouped):
            check_parent_cover(parent,leaves)
        # Recheck the original parents themselves cover the required domain.
        S=Q(g['sigma_max']);X=Q(g['x_max'])
        assert S >= delta*RHO and X >= Q(31,4)
        check_parent_cover((Q(0),S,Q(0),X),parents)
        total += len(c['rectangles'])
        rows.append((name,Q(g['profile']['ell']),cap))
        print(name,'PASS',len(c['rectangles']),'leaves;',len(extra.get(name,[])),'extra polynomials',flush=True)
    rows.sort(key=lambda r:r[1])
    assert all(a[1]<b[1] for a,b in zip(rows,rows[1:]))
    knots=[Q(0)]+[(b[2]-a[2])/(2*(b[1]-a[1])) for a,b in zip(rows,rows[1:])]+[Q(9,10)]
    assert all(a<b for a,b in zip(knots,knots[1:]))
    def f(row,t):return t*t-2*row[1]*t+row[2]
    maxima=[]
    for i,row in enumerate(rows):
        for t in (knots[i],knots[i+1]):
            assert all(f(row,t)<=f(other,t) for other in rows)
        maxima.append(max(f(row,t) for t in (knots[i],knots[i+1])))
    bound=max(maxima)
    assert bound == Q(cert['norm_bound'])
    assert args.safe_bound < 1/bound
    print('ALL EXACT LEAF AND COVERAGE CHECKS PASSED',total,'leaves')
    print('NORM_UPPER',bound)
    print('RECIPROCAL',float(1/bound))
    print('STRICT_SAFE_LOWER',args.safe_bound)


if __name__ == '__main__':main()
