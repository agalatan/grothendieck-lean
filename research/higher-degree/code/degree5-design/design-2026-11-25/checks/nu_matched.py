#!/usr/bin/env python3
"""Repair (a) of the zero-content obstruction (checks/zero_content_budget.py): take the comparator, the profiles and the margin of a
piece at the quintic coefficient of the pair, nu = nu' = eta t gamma at the upper end t of the piece, instead of the row's nu5 (N).
Standard library only.  Two stages, for the pieces that the obstruction hits (one row per piece, k = the number of the piece):
  stage 1:  nu_matched.py rows BUDGET.json ROWS_ALL.lines JOBDIR PYTHON
            writes JOBDIR/gnu/rows5.lines (the float row of each piece with nu5 replaced by nu'), JOBDIR/gnu/rows_<k>.lines, and the
            command lines JOBDIR/cmds_a1.txt: thresh/prof2.py (profiles with exact derivatives) and margin_scan.py at the tilt (2/5, 3/20);
  stage 2:  nu_matched.py bands BUDGET.json WORK(game folder with band5_fin*.json) FIN_ALL.txt JOBDIR PYTHON
            reads JOBDIR/gnu/mnu_<k>.json (the scans), writes the band files (the room, t_lo and split of the design; the new profile;
            the margin min(mu0, mu_glob) of the scan) and JOBDIR/cmds_a2.txt: r4_theta6.py as in the design run, tag _Mnu.
The job is run from JOBDIR (see README)."""
import json, os, re, sys, math
from fractions import Fraction as F
mode, budget = sys.argv[1:3]; B = [b for b in json.load(open(budget)) if F(b['eta_h_needed_design_share']) > 0]
ETA = 0.0779; GAM = math.sqrt(3) / 8
if mode == 'rows':
    rowsf, job, py = sys.argv[3:6]; rows = {round(r['t'], 4): r for r in (json.loads(l) for l in open(rowsf) if l.strip())}
    os.makedirs(os.path.join(job, 'gnu', 'out'), exist_ok=True); lines = {}; cmds = []
    for b in B:
        r = dict(rows[round(float(b['row_tag']), 4)]); r['nu5_row'] = r['nu5']; r['nu5'] = ETA * float(F(b['t'])) * GAM; r['piece_j'] = b['j']; lines[b['j']] = r
    ks = sorted(lines); assert ks == list(range(1, len(ks) + 1))
    open(os.path.join(job, 'gnu', 'rows5.lines'), 'w').write(''.join(json.dumps(lines[k]) + '\n' for k in ks))
    for k in ks:
        open(os.path.join(job, 'gnu', 'rows_%d.lines' % k), 'w').write(json.dumps(lines[k]) + '\n')
        cmds.append('cd gnu && D5_E1=0.78 D5_ETA=0.0779 %s ../thresh/prof2.py %d 0,0 0.4,0.15 > out/prof2_%d.log 2>&1' % (py, k, k))
        cmds.append('cd gnu && %s ../margin_scan.py rows_%d.lines %r mnu_%d.json 0.4,0.15 0.78 > mnu_%d.log 2>&1' % (py, k, lines[k]['t'], k, k))
        print('piece %2d row %.3f: nu5 %.7f -> nu\' %.7f' % (k, lines[k]['t'], lines[k]['nu5_row'], lines[k]['nu5']))
    open(os.path.join(job, 'cmds_a1.txt'), 'w').write('\n'.join(cmds) + '\n')
else:
    work, finall, job, py = sys.argv[3:7]; lines = [l.strip() for l in open(finall) if 'r4_theta6.py' in l]; cmds = []
    for b in B:
        k = b['j']; name = b['name']; band = json.load(open(os.path.join(work, 'band5%s.json' % name))); m = json.load(open(os.path.join(job, 'gnu', 'mnu_%d.json' % k)))
        mu = min(m['mu0'], m['mu_glob']); band['rows']['1']['mu'] = mu; band['rows']['1']['prof'] = 'out/prof_%d.npz' % k; bf = 'band5_nu%s.json' % name
        json.dump(band, open(os.path.join(job, 'gnu', bf), 'w'), indent=1)
        line = next(l for l in lines if 'BAND_ROWS=band5%s.json' % name in l); env = re.search(r'(PERCHI=1 .*?) \S+/python ', line).group(1)
        args = re.search(r'r4_theta6\.py (\S+ \S+ \S+) ', line).group(1)
        e = re.sub(r'THRESH_DIR=\S+', 'THRESH_DIR=../thresh', env); e = re.sub(r'BAND_ROWS=\S+', 'BAND_ROWS=' + bf, e); e = re.sub(r'MARGIN_MODEL=\S+', 'MARGIN_MODEL=const:%.6f' % mu, e)
        cmds.append('cd gnu && %s %s ../r4_theta6.py %s %s_Mnu > out/r4_theta6%s_Mnu.log 2>&1' % (e, py, args, name, name))
        print('piece %2d: margin at nu\' %.4f (mu0 %.4f, mu_glob %.4f)' % (k, mu, m['mu0'], m['mu_glob']))
    open(os.path.join(job, 'cmds_a2.txt'), 'w').write('\n'.join(cmds) + '\n')
