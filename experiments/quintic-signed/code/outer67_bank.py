"""Joint deductions for rows 06/07 using only their checked Stein polynomials and the deterministic zero.

The source rows and raw fourth/sixth moment normalization are the same as the public certificate.
Agent-ID: codex-a7c4
"""
import json
from fractions import Fraction as Q
from functools import cache
from math import floor
from pathlib import Path

from coupled_stein_profile import checked, quadratic_maximum
from sparse_stein_dilation import C6, hull, sqrt_upper
from test_tight_shared_gate import completed_gate, gate_minimum, header

MAX = Q(7, 20)


def outer67_prices(root):
    records = []
    breaks = {Q(0), Q(42)}
    for i, name in ((6, '0.82'), (7, '0.83')):
        raw = json.loads((Path(root) / 'data/tail-rows/plain' / f'row_{name}.json').read_text())
        row, encoded = header(i)
        delta, kappa = row[2:4]
        checked(kappa == Q(raw['kappa']) and Q(raw['t']) == Q(name), 'incorrect row or curvature')
        gate = list(completed_gate(row))
        gate[0] -= kappa*delta**2 - delta
        zero, value = map(Q, encoded.split(';', 1)[0].split(':'))
        checked(zero == 0, 'missing zero node')
        records.append((raw, row, gate, value))
        breaks.update(Q(v)**2 for c in raw['cells'] for v in c['x'] if Q(v)**2 <= 42)
    (left, right) = records
    delta = left[1][2]
    checked(delta == right[1][2], 'different physical scale maps')
    knots = sorted(breaks)
    checked(knots[0] == 0 and knots[-1] == 42, 'shape endpoints')
    bank = []
    for sl, sh in zip(knots, knots[1:]):
        s6 = [6+9*s+C6*s*sqrt_upper(s) for s in (sl,sh)]
        rows = []
        for raw, _, _, zero in records:
            parents = [c for c in raw['cells'] if Q(c['x'][0])**2 <= sl and sh <= Q(c['x'][1])**2]
            checked(len(parents)==1 and parents[0]['kind']=='stein', 'missing shape parent')
            vals = {Q(0): zero}
            for n in parents[0]['nodes']:
                x = Q(n['sigma'])
                a0, a2, a4, a6, a1 = map(Q, n['y'])
                checked(x > 0 and min(a6, a1) >= 0, 'Stein node domain or moment coefficient')
                y = (a0 + a2 + Q(93,100)*a1 +
                     max(a4*(2+s)+a6*v for s,v in zip((sl,sh),s6)))
                vals[x] = min(vals.get(x,y),y)
            pts = hull(vals.items())
            checked(pts[0][0]==0 and pts[-1][0]>=MAX, 'incomplete scale cover')
            lines = []
            for (l,y),(h,z) in zip(pts,pts[1:]):
                if l < MAX:
                    b = (z-y)/(h-l)
                    lines.append((l,min(h,MAX),y-l*b,b))
            rows.append(lines)
        before = len(bank)
        for l,h,a,b in rows[0]:
            for ll,hh,c,d in rows[1]:
                lo,hi = max(l,ll),min(h,hh)
                if lo < hi:
                    bank.append((lo,hi,a,b,c,d))
        checked(sum((hi-lo for lo,hi,*_ in bank[before:]),Q(0))==MAX, 'scale cover width')

    @cache
    def price(w,cut):
        checked(0<=w<=1 and 0<cut<=MAX, 'outer 06/07 weight or physical cutoff')
        s = 1-w
        gate = gate_minimum([s*a+w*b for a,b in zip(left[2],right[2],strict=True)])
        checked(gate>=0, 'negative mixed gate')
        k = s*left[1][3]+w*right[1][3]+gate/delta**2
        cap = s*left[1][5]+w*right[1][5]
        price = min(cap-quadratic_maximum((-k,s*b+w*d,s*a+w*c),l,min(cut,h),True)[0]
                    for l,h,a,b,c,d in bank if l<cut)
        return Q(floor(price*10**13),10**13)
    return price
