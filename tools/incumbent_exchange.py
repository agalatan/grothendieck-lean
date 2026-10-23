#!/usr/bin/env python3
"""Replay the incumbent's signed head, then expose an anchored exchange interface.

The export reads committed exact data, not a private search archive. `head`
uses Arb throughout. Its error ball is ONE l1 coefficient error: it must not
be charged independently at each noise point. The analytic comparison,
energy-table accuracy and Hardy bound remain the master's documented inputs.
No command in this file proves a new Grothendieck endpoint.
"""
import argparse
from fractions import Fraction as Q
import hashlib
import json
import math
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]


def dump(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2) + '\n')


def export_data(out):
    source = ROOT / 'Grothe/Upper/Data.lean'
    text = source.read_text()
    rational = r'\((-?\d+)\s*:\s*ℚ\)(?:\s*/\s*(\d+))?'

    def scalar(name):
        body = re.search(r'def ' + name + r' : ℚ := ([^\n]+)', text)[1]
        n, d = re.fullmatch(rational, body.strip()).groups()
        return str(Q(int(n), int(d or 1)))

    def vector(name):
        body = re.search(r'def ' + name + r' : List ℚ :=\s*\[(.*?)\]', text, re.S)[1]
        return [str(Q(int(n), int(d or 1))) for n, d in re.findall(rational, body)]

    def strings(name):
        body = re.search(r'def ' + name + r' : List String :=\s*\[(.*?)\]', text, re.S)[1]
        return re.findall(r'"([^"\n]+)"', body)

    data = {k: scalar(k) for k in ['aQ', 'bQ', 'etaQ', 'phaseEpsQ',
                                  'slopeQ', 'energyErrQ', 'headCapQ']}
    data.update({k: vector(k) for k in ['profileQ', 'pList', 'qList']})
    data['phase'] = [dict(powers=list(map(int, s.split(':')[0].split(','))),
                          coefficient=s.split(':')[1]) for s in strings('phaseStrs')]
    entries = []
    for row in strings('energyStrs'):
        m, rest = row.split(':')
        for term in rest.split(';'):
            n, num, power = map(int, term.split(','))
            entries.append([n, int(m), str(Q(num, 2**power))])
    assert len(entries) == 21168 and len(data['phase']) == 1140
    assert all((n+m) % 2 == 1 and n+3*m <= 501 and Q(e) > 0 for n,m,e in entries)
    assert all(sum(abs(Q(x)) for x in data[k]) <= 1 for k in ['pList', 'qList'])
    data['energies'] = entries
    bridge=ROOT/'Grothe/Upper/PolynomialBridge.lean'
    bt=bridge.read_text()
    for target,name in [('compare','compareQ'),('hardy_tail','tailQ')]:
        literal=re.search(r'def '+name+r' : ℚ := ([^\n]+)',bt)[1]
        data[target]=str(Q(literal.replace(' ','')))
    data['incumbent_score'] = str(Q(data['slopeQ'])-sum(Q(data[k]) for k in
        ['compare', 'hardy_tail', 'energyErrQ', 'headCapQ']))
    data['source'] = 'Grothe/Upper/Data.lean'
    data['source_sha256'] = hashlib.sha256(source.read_bytes()).hexdigest()
    data['bridge_sha256'] = hashlib.sha256(bridge.read_bytes()).hexdigest()
    data['scope'] = 'Exact export. Inherits the analytic hypotheses of PolynomialBridge.lean.'
    dump(out, data)
    print('PASS export: 21168 exact energies; 1140 phase terms; incumbent ledger', flush=True)


def replay_head(src, out):
    from flint import arb, arb_poly, ctx
    ctx.prec = 192
    data = json.loads(src.read_text())
    K = 251

    def ball(x):
        q = Q(x)
        return arb(q.numerator) / q.denominator

    P, R = [arb_poly([ball(x) for x in data[k]]) for k in ['pList', 'qList']]
    powers = [arb_poly([1])]
    for _ in range(501):
        powers.append((powers[-1]*P).truncate(K))
    rows = {}
    for n, m, e in data['energies']:
        rows.setdefault(m, []).append((n, e))
    head, rp = arb_poly([]), arb_poly([1])
    for m in range(max(rows)+1):
        if m:
            rp = (rp*R).truncate(K)
        row = arb_poly([])
        for n, e in rows.get(m, []):
            row += (powers[n]*ball(e)).left_shift(n//2).truncate(K-m//2)
        head += (row*rp).left_shift(m//2).truncate(K)
    # Export exact dyadic midpoints plus a directed outward l1 error.
    mids = [Q(float(head[i].mid())) for i in range(K)]
    error = sum((abs(head[i]-ball(q)) for i,q in enumerate(mids)), arb(0))
    radius = Q(math.nextafter(float(error.upper()), math.inf))
    assert error < ball(radius)
    c = Q(data['slopeQ'])
    head_residual = sum(abs(q-(c if i == 0 else 0)) for i,q in enumerate(mids))
    assert ball(head_residual+radius) < ball(data['headCapQ'])
    inherited = sum(Q(data[k]) for k in ['compare', 'hardy_tail', 'energyErrQ'])
    xi = inherited + radius
    score = mids[0]-sum(map(abs,mids[1:]))-xi
    result = {'scope': 'Directed finite-head replay; inherited analytic inputs unchanged.',
              'input_sha256': hashlib.sha256(src.read_bytes()).hexdigest(),
              'source_sha256': data.get('source_sha256', data.get('baseline_source_sha256')),
              'precision_bits': ctx.prec,
              'head': list(map(str,mids)), 'rounding_l1_radius': str(radius),
              'head_residual_upper': str(head_residual+radius),
              'analytic_l1_radius': str(inherited), 'total_l1_radius': str(xi),
              'incumbent_certified_score': data['incumbent_score'],
              'replayed_score_lower': str(score),
              'price_rule': 'For every all-level |lambda_k|<=1: '
                            'payoff <= dot(lambda,head)+total_l1_radius.',
              'warning': 'A screen is an upper bound on achievable score, not an achieved score.'}
    dump(out, result)
    print('PASS directed head: residual <=', float(head_residual+radius), flush=True)
    print('ONE inherited l1 radius:', float(xi), '; score >=', float(score), flush=True)


def verify_price(head, record):
    """Exact price admissibility and anchor arithmetic; no QMC validation."""
    price = record['prices']
    r = list(map(Q,price['rho']));a = list(map(Q,price['price']))
    s = Q(price['s']);cut = price['cutoff']
    assert len(r)==len(a) and all(0<=x<=1 for x in r) and abs(s)<=1
    assert all(abs(sum(x*t**(2*k+1) for x,t in zip(a,r)))<=1 for k in range(2,cut+1))
    assert sum(abs(x)*t**(2*cut+3) for x,t in zip(a,r))<=1
    c = list(map(Q,head['head']))
    weights = [Q(1),-s]+[-sum(x*t**(2*k+1) for x,t in zip(a,r)) for k in range(2,len(c))]
    value = sum(x*y for x,y in zip(weights,c))+Q(head['total_l1_radius'])
    assert value==Q(price['anchor_payoff_upper'])
    assert value>=Q(head['incumbent_certified_score'])
    print('PASS exact all-index price and single anchor error; payoff upper',float(value))
    print('QMC column integrals have NOT been certified.')


def main():
    p = argparse.ArgumentParser(description=__doc__)
    s = p.add_subparsers(dest='mode', required=True)
    e = s.add_parser('export'); e.add_argument('--out', type=Path, required=True)
    h = s.add_parser('head'); h.add_argument('input', type=Path); h.add_argument('--out', type=Path, required=True)
    v = s.add_parser('verify-price');v.add_argument('head',type=Path);v.add_argument('record',type=Path)
    a = p.parse_args()
    if a.mode == 'export':
        export_data(a.out)
    elif a.mode == 'head':
        replay_head(a.input, a.out)
    else:
        verify_price(json.loads(a.head.read_text()),json.loads(a.record.read_text()))


if __name__ == '__main__':
    main()
