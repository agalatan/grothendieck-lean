#!/usr/bin/env python3
"""Rooms by degree and target, from the recorded model norms (arithmetic on recorded values; the norms are N, see the ledger rows named).
A model norm N of a game is the payoff of explicit pairs: no certificate for that game proves K > 1/N.  The room of a target K* is
1/K* - N: everything a certificate loses (law layer, every sector, every piece of t) has to fit into it.
usage: python3 -I ladder.py [eps_profile.json ...]   (the optional files add the capped games computed by ceiling/eps_profile.py)"""
import sys, json
from fractions import Fraction as F
REC = [  # (label, N, ledger row)
 ('degree 3, pure cubic, eps = 0.7564', '0.7131355', '1.1; ceiling 1.4022581233 [P, C] conjecture-K 12.2'),
 ('degree 3 + identity tail (0.7681, 0.0235)', '0.713021', 'identity-tail 3.1; conjecture-K par. 10'),
 ('degree 3 + tail, the Lean witness (191/250, 47/2000): Gaussian rows', '0.7131427', 'identity-tail 3.1'),
 ('degree 3 + tail, the Lean witness: certifiable cap of the model', '0.713198', 'identity-tail 3.1'),
 ('degree 5 capped (1, -39/50, 779/10000): model', '0.7128677', '1.10'),
 ('degree 5 capped: exact envelope B5 of D* (C, author only)', '0.7128931981', '4.42 and this note'),
 ('degree 5 (1, -0.77, 0.05)', '0.7129644', '1.10'),
 ('degree 5 (1, -0.84896, 0.28180), the optimum without tail', '0.7124294', '1.2'),
 ('degree 5 + tail (1, -0.86328, 0.33459), nu = -0.01384', '0.7123827', '1.3'),
 ('degree 7 (1, -0.906596, 0.541570, -0.242531)', '0.7121936', '1.4'),
 ('degree 7 + tail, nu = +0.00923', '0.7121878', '1.5'),
 ('degree 9, lambda_9 of 1.6: certified lower bound of its norm (P + C, author only)', '0.71214069', '1.6, 2.6'),
 ('degree 9, lambda_9: multi-spike pairs (N)', '0.71216039', '1.6, 2.6'),
]
TG = [('1.4021', F(10000, 14021)), ('1.4023', F(10000, 14023)), ('1.4025', F(10000, 14025)), ('1.4027', F(10000, 14027)), ('1.403', F(1000, 1403)), ('1.4035', F(10000, 14035)), ('1.404', F(1000, 1404))]
ROOM0 = F(500, 701) - F('0.7128677')      # the model room of the present design at 1.402 (ledger 1.10: 3.99e-4)
print('rooms 1/K* - N in units 1e-4 (negative: out of reach of that game even with zero cost); last column: the largest K* that leaves')
print('the model room %.3e of the present design at 1.402 (capped game against 500/701)' % float(ROOM0))
print('| game | N | 1/N | ' + ' | '.join(n for n, _ in TG) + ' | K* at the present model room | ledger |'); print('|---|---|---|' + '---|' * (len(TG) + 2))
def line(lab, N, src):
    N = F(N); print('| %s | %.7f | %.6f | ' % (lab, float(N), float(1 / N)) + ' | '.join('%.2f' % (float(t - N) * 1e4) for _, t in TG) + ' | %.6f | %s |' % (float(1 / (N + ROOM0)), src))
for r in REC: line(*r)
for fn in sys.argv[1:]:
    d = json.load(open(fn)); K = len(d['problems'][0]['best']['lam']) - 1
    for p in d['problems']:
        b = p['best']; lab = 'degree %d%s, eps %s: (%s)%s' % (2 * K + 1, ' + tail' if p['tail'] else '', 'free' if p['eps'] is None else '= %g' % p['eps'], ', '.join('%.4f' % x for x in b['lam']), (', nu = %+.4f' % b['nu']) if p['tail'] else '')
        line(lab, repr(p['U']), 'this note (U; LB %.7f, gap %.1e)' % (p['LB'], p['gap']))
