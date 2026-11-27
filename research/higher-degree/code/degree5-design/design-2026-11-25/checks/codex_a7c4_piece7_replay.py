#!/usr/bin/env python3
# Exact replay by codex-a7c4 of the obstruction on piece 7 of the design D* (t = 0.78, row 0.810): copied unedited, below these
# comment lines, from the review comment of codex-a7c4 on PR #646 (25 November 2026).  It reads the files of the reviewed commit
# 8de915680f58773b3eb765df0a419a1523997fff with `git show`, so it must be run from the repository root with that commit present:
#     python3 -I research/higher-degree/code/degree5-design/design-2026-11-25/checks/codex_a7c4_piece7_replay.py
# Output: checks/codex_a7c4_piece7_replay.log.  The same computation on every piece: checks/zero_content_budget.py.
"""Independent Fraction replay of the actual-pair obstruction to D* piece 7."""
from fractions import Fraction as F
import json
from subprocess import check_output

head = '8de915680f58773b3eb765df0a419a1523997fff'
directory = 'research/higher-degree/code/degree5-design/design-2026-11-25/'
def read(name):
    return json.loads(check_output(['git','show',head+':'+directory+name]), parse_float=F)
tables = read('tables/fin_table.json')
case = next(x for x in tables['cases'] if x['piece']==['77/100','79/100'] and x['row_tag']=='0.810')
assert any(c['piece']==case['piece'] and c['row_tag']==case['row_tag'] for c in tables['chosen'])
ell, beta, bA, bB = [F(case['row'][k]) for k in ['l','beta','bA','bB']]
nu = read('margins/m078b_t0.81.json')['row']['nu5']
khmax = 1-F(dict(x.split(':') for x in case['kappa'].split(','))['10'])
target_mass, eps, eta = F('.78'), F('.78'), F('.0779')
probability = F('0.00001')
mu_lo,mu_hi = F('.8862'),F('.8863')
g_lo,g_hi = F('.2165'),F('.2166')
assert 4*mu_lo**2 < F(333,106) and F(355,113) < 4*mu_hi**2
assert 64*g_lo**2 < 3 < 64*g_hi**2
assert F('.00898') <= nu <= F('.009')
assert probability+target_mass/mu_lo < 1
vlo, vhi = eta*target_mass*g_lo, eta*target_mass*g_hi
assert ell-2*beta-max(vhi,nu) > 0 and beta>0 and 0<nu<vlo
gain = (vlo-nu)*(2*mu_lo*g_lo-(vhi+nu)/eta)
assert gain > F('.000412')
base_lower = 2*mu_lo*(ell-beta/2+g_lo*nu)-nu**2/eta
cap_minus_base = F(case['C'])-2*beta**2/eps-base_lower
assert 0<cap_minus_base<F('.0056')
assert 1+bA**2+bB**2 < F('1.01')**2
kq = 1/eps-(bA**2+bB**2)/eta
assert 0<kq<2
sqrt_u = eps*probability # upper bound, since P21 is an orthoprojection
budget = khmax*cap_minus_base + 2*F('1.01')*sqrt_u + khmax*kq*sqrt_u**2
assert budget < F('.00030')
print('Required gain >',float(gain),'available gain <',float(budget))
print('Exact gain lower, budget upper, and shortfall lower:')
print(gain,budget,gain-budget,sep='\n')
