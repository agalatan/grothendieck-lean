#!/usr/bin/env python3
"""Repair (b) of the zero-content obstruction (checks/zero_content_budget.py): give a part eta_h of the room of a piece to the
sectors other than A/B and recompute the allowances theta_j(u, chi) with the room that is left (N).  Standard library only.
For each piece of D* that the obstruction hits, and each variant
   fundMin :  eta_h = the lower bound of the eta_h needed by the zero-content pairs with the split of D* (kappa_h(10) = 1 - kappa_AB(10) - 1/50);
              a sensitivity calculation only: as an allocation it is false (checks/codex_a7c4_fundmin_test.py),
   fundFull:  eta_h = the whole gain F(nu') - F(nu5) at the upper end of the piece (upper bound), leaving kappa_h X for everything else,
   ctl     :  eta_h = 0 (control: must reproduce the allowances of tables/fin_table.json),
it writes the band file of scripts/r4_theta6.py with the reduced room and the command line of the design run with only the band file
and the output tag changed (the command lines of the design are read from FIN_ALL, the file work/fin_all.txt of the working folder).
usage: funded_rooms.py BUDGET.json WORK(game folder with band5_fin*.json) FIN_ALL.txt JOBDIR PYTHON
       writes JOBDIR/g078/band5_<variant><name>.json, JOBDIR/cmds.txt, JOBDIR/rooms.json; the job is run from JOBDIR (see README)."""
import json, os, re, sys
from fractions import Fraction as F
budget, work, finall, job, py = sys.argv[1:6]
B = json.load(open(budget)); lines = [l.strip() for l in open(finall) if 'r4_theta6.py' in l]; cmds = []; rooms = []
os.makedirs(os.path.join(job, 'g078', 'out'), exist_ok=True)
for b in B:
    need = F(b['eta_h_needed_design_share'])
    if need <= 0: continue
    name = b['name']; band = json.load(open(os.path.join(work, 'band5%s.json' % name))); room0 = band['rows']['1']['room']
    line = next(l for l in lines if 'BAND_ROWS=band5%s.json' % name in l); env = re.search(r'(PERCHI=1 .*?) \S+/python ', line).group(1)
    args = re.search(r'r4_theta6\.py (\S+ \S+ \S+) ', line).group(1)
    for var, eta in (('fundMin', need), ('fundFull', F(b['gain_hi'])), ('ctl', F(0))):
        nb = json.loads(json.dumps(band)); nb['rows']['1']['room'] = room0 - float(eta); bf = 'band5_%s%s.json' % (var, name)
        json.dump(nb, open(os.path.join(job, 'g078', bf), 'w'), indent=1)
        e = re.sub(r'THRESH_DIR=\S+', 'THRESH_DIR=../thresh', env); e = re.sub(r'BAND_ROWS=\S+', 'BAND_ROWS=' + bf, e)
        cmds.append('cd g078 && %s %s ../r4_theta6.py %s %s_M%s > out/r4_theta6%s_M%s.log 2>&1' % (e, py, args, name, var, name, var))
        rooms.append(dict(j=b['j'], name=name, variant=var, eta_h=float(eta), room=room0, room_left=room0 - float(eta), share_of_room=float(eta) / room0))
open(os.path.join(job, 'cmds.txt'), 'w').write('\n'.join(cmds) + '\n'); json.dump(rooms, open(os.path.join(job, 'rooms.json'), 'w'), indent=1)
for r in rooms:
    if r['variant'] != 'ctl': print('piece %2d %-8s eta_h %.4e = %4.1f %% of the room %.4e -> %.4e' % (r['j'], r['variant'], r['eta_h'], 100 * r['share_of_room'], r['room'], r['room_left']))
print(len(cmds), 'command lines')
