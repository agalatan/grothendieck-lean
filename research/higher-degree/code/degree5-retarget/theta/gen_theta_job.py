#!/usr/bin/env python3
"""Allowances theta_j(u, chi) of the funded design D* (ledger 4.44) at higher targets: the job generator (N; standard library only).
For each of the 21 pieces of D* and each target K*, the room left for the A/B sector is
    room_j(500/701) - eta_h,j - (500/701 - 1/K*),     eta_h,j = the funded part of ledger 4.44 on the pieces 1-11 (0 on 12-21),
and the allowance program scripts/r4_theta6.py of ../../degree5-design/design-2026-11-25/ is re-run with only the room (band file) and
the output tag changed, exactly as checks/funded_rooms.py did for the funded allocation.  A control at 500/701 (tag K14020) re-runs the
funded allocation itself and must reproduce tables/funded/fin_table_fundFull.json.
usage: gen_theta_job.py DESIGN_DIR WORK FIN_ALL.txt JOBDIR PYTHON
   DESIGN_DIR = .../code/degree5-design/design-2026-11-25 (committed); WORK = the game folder g078 of the design run with the band files
   band5<name>.json, FIN_ALL = its command file work/fin_all.txt (both outside the repository: INVENTORY.md).
   Writes JOBDIR/g078/band5_<tag><name>.json, JOBDIR/cmds.txt (run each line from JOBDIR) and JOBDIR/rooms_targets.json."""
import json, os, re, sys
from fractions import Fraction as F
design, work, finall, job, py = sys.argv[1:6]
TARGETS = [('K14020', F(500, 701)), ('K14021', F(10000, 14021)), ('K14023', F(10000, 14023)), ('K14025', F(10000, 14025)), ('K14027', F(10000, 14027))]
tab = json.load(open(os.path.join(design, 'tables', 'funded', 'fin_table_fundFull.json')))
chosen = {(tuple(c['piece']), c['row_tag']) for c in tab['chosen']}
cases = sorted((c for c in tab['cases'] if (tuple(c['piece']), c['row_tag']) in chosen), key=lambda c: c['a'])
assert len(cases) == 21
funded = {r['name']: F(repr(r['eta_h'])) for r in json.load(open(os.path.join(design, 'tables', 'funded', 'rooms.json'))) if r['variant'] == 'fundFull'}
lines = [l.strip() for l in open(finall) if 'r4_theta6.py' in l]
os.makedirs(os.path.join(job, 'g078', 'out'), exist_ok=True); cmds = []; rooms = []
for j, c in enumerate(cases, 1):
    name = c['name']; band = json.load(open(os.path.join(work, 'band5%s.json' % name))); room0 = F(c['room_exact']); eta = funded.get(name, F(0))
    assert abs(float(room0) - band['rows']['1']['room']) < 1e-12 and (eta > 0) == (j <= 11)
    line = next(l for l in lines if 'BAND_ROWS=band5%s.json' % name in l); env = re.search(r'(PERCHI=1 .*?) \S+/python ', line).group(1)
    args = re.search(r'r4_theta6\.py (\S+ \S+ \S+) ', line).group(1)
    for tag, tg in TARGETS:
        left = room0 - eta - (F(500, 701) - tg)
        rooms.append(dict(j=j, name=name, piece=c['piece'], row=c['row_tag'], target=tag, room_500_701=float(room0), eta_h=float(eta), room_target=float(room0 - (F(500, 701) - tg)), room_left=float(left)))
        if left <= 0: continue
        if tag == 'K14020' and j > 11: continue          # eta_h = 0 at 500/701 is tables/fin_table.json itself
        nb = json.loads(json.dumps(band)); nb['rows']['1']['room'] = float(left); bf = 'band5_%s%s.json' % (tag, name)
        json.dump(nb, open(os.path.join(job, 'g078', bf), 'w'), indent=1)
        e = re.sub(r'THRESH_DIR=\S+', 'THRESH_DIR=../thresh', env); e = re.sub(r'BAND_ROWS=\S+', 'BAND_ROWS=' + bf, e)
        cmds.append('cd g078 && %s %s ../r4_theta6.py %s %s_M%s > out/r4_theta6%s_M%s.log 2>&1' % (e, py, args, name, tag, name, tag))
open(os.path.join(job, 'cmds.txt'), 'w').write('\n'.join(cmds) + '\n'); json.dump(rooms, open(os.path.join(job, 'rooms_targets.json'), 'w'), indent=1)
print(len(cmds), 'command lines;', sum(1 for r in rooms if r['room_left'] <= 0), 'cases without room')
