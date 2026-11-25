#!/usr/bin/env python3
"""Task B: set up two copies of the stage-2c pipeline (NEWCAP cert2c) for the game (1, -39/50, 779/10000) with the radius input
rho0 = 2287/2500 (K ledger 3.7, P + C): certB_const (constant radius) and certB_lin (labelled variant: in addition the
energy-dependent bound E|q| <= (sqrt(pi)/2)(1 + (26449/5000000) s) ||q||_2 as a chord table).  The rows are the exact rational
rows of cert2b/out/rows2b.json (ledger 4.17) from t = 0.25 up, all with plain (moments + radius) covers; the node caps are those of
stage 2b (they do not depend on the radius).  The direct bound of ledger 4.18 (a) replaces the rows on [0, t1].
usage: setup_certB.py CERT2C_DIR CERT2B_DIR DEST_BASE [extra rows json]"""
import sys, os, json, shutil
from fractions import Fraction as F
c2c, c2b, dest = sys.argv[1:4]
EPS, ETA, RHO = F(39, 50), F(779, 10000), F(2287, 2500)
INVPI_UP = F(318309887, 10 ** 9); assert INVPI_UP * F(314159265358979, 10 ** 14) > 1          # 1/pi < 0.318309887
b = EPS * RHO ** 2 + ETA ** 2 / EPS * INVPI_UP; a = 1 - ETA
spec = json.load(open(os.path.join(c2b, 'out', 'rows2b.json')))
rows = []
for r in spec['rows']:
    if float(r['t']) < 0.25: continue
    l, be, bA, bB = r['row'].split(',')
    rows.append(dict(tag=r['tag'], t=r['t'], kind=('law' if r['tag'].endswith('L') else 'gaussian'), l=l, beta=be, bA=bA, bB=bB))
SQPI2_UP = F(886227, 10 ** 6); assert (2 * SQPI2_UP) ** 2 * 10 ** 14 > 314159265358980          # sqrt(pi)/2 < 0.886227
c = F(26449, 5000000); s1 = F(609, 100); L1 = SQPI2_UP * (1 + c * s1); assert L1 < RHO and SQPI2_UP * (1 + c * F(61, 10)) > RHO
for name, table in (('certB_const', None), ('certB_lin', [[0, s1, SQPI2_UP, L1], [s1, 42, RHO, RHO]])):
    d = os.path.join(dest, name)
    if not os.path.exists(d): shutil.copytree(c2c, d, ignore=shutil.ignore_patterns('out', '__pycache__', 'smallt', 'psi5'))
    os.makedirs(os.path.join(d, 'out'), exist_ok=True)
    shutil.copy(os.path.join(c2b, 'psi5'), os.path.join(d, 'psi5'))
    g = dict(name='T = P10 - (39/50) P21 + (779/10000) P32, radius input 2287/2500' + (' and the linear-in-s bound of KNG505' if table else ''),
             eps1=str(EPS), eta=str(ETA), rho=str(RHO), target='500/701', nufine='-1/250:9/250:1/250', nucoarse='-2/25,-1/20,-1/40,-3/250,9/200,3/50,2/25',
             stein_nugrid='-2/25,-1/20,-1/40,-3/250,0,3/250,3/125,9/250,9/200,3/50,2/25', lp_nu_range=['-3/100', '13/200'],
             small_t=dict(a=str(a), b=str(b), source='ledger 4.18 (a): V <= (1 - eta) t^2 + eps rho0^2 + eta^2/(pi eps), rho0 = 2287/2500, 1/pi < 318309887/10^9'))
    if table:
        g['rho_table'] = 'rho_table_lin.json'
        json.dump(dict(note='E|q| <= (sqrt(pi)/2)(1 + (26449/5000000) s) ||q||_2 (K ledger 3.7, KNG505), sqrt(pi)/2 < 886227/10^6, as one chord on [0, 609/100]; 2287/2500 beyond',
                       rows=[[str(F(x)) for x in r] for r in table]), open(os.path.join(d, 'rho_table_lin.json'), 'w'), indent=1)
    json.dump(g, open(os.path.join(d, 'game.json'), 'w'), indent=1)
    json.dump(dict(game=dict(eps1=str(EPS), eta=str(ETA), rho=str(RHO)), rows=rows), open(os.path.join(d, 'rows2c.json'), 'w'), indent=1)
    for r in rows:
        shutil.copy(os.path.join(c2b, 'out', 'caps_%s.json' % r['tag']), os.path.join(d, 'out', 'caps_%s.json' % r['tag']))
    print(name, 'ready:', len(rows), 'rows; direct bound a =', a, 'b =', b, '= %.9f' % float(b))
