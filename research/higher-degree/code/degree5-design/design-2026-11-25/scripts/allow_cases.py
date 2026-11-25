#!/usr/bin/env python3
"""Task C: command lines for theta_room under three A/B margin models, on the pieces of the record (N).
For every case (a band file of the NEWCAP study = one piece of t covered by one tuned row, with its room, t_lo, profile and split):
  model "mu":   the record's pointwise margin mu (the band file's value), to reproduce the record;
  model "glob": the constant secant margin mu_glob of margin_scan.py (an upper bound of the true infimum, so the allowance is an upper bound);
  model "lin":  m >= max(mu0 - b |rho|, mu_glob) |rho|^2 with b fitted by margin_scan.py (r4_theta6.py, sliced program).
Energies: the four energies of the record's scan with the smallest allowance.  PERCHI=1: theta_room(u, chi) for each chi of the grid.
Also writes the command lines of ratio_cluster.py for the same cases and energies (OUT_CMDS.ratio).
usage: allow_cases.py WORKDIR(game folder copy) MARGINDIR PREFIX(margin files m078) OUT_CMDS [filter]"""
import sys, os, json, glob
work, mdir, pref, outc = sys.argv[1:5]; flt = sys.argv[5] if len(sys.argv) > 5 else ''
PY = os.path.expanduser('~/claude-b9ee-degree5/venv/bin/python'); SC = os.path.expanduser('~/claude-b9ee-degree5/design/scripts/r4_theta6.py')
TH = os.path.expanduser('~/claude-b9ee-degree5/degree5-newcap-2026-11-16/thresholds')
cmds = []; cases = []
for bf in sorted(glob.glob(os.path.join(work, 'band5_shift_*.json')) + glob.glob(os.path.join(work, 'band5_t0p*.json'))):
    name = os.path.basename(bf)[len('band5'):-len('.json')]
    if flt and not any(x == name or (x.endswith('*') and x[:-1] in name) for x in flt.split(',')): continue
    recf = os.path.join(work, 'out', 'r4_theta5_1%s.json' % name)
    if not os.path.exists(recf): recf = os.path.join(work, 'out', 'r4_theta5_1%s_own.json' % name)
    if not os.path.exists(recf): print('no record for', name); continue
    rec = json.load(open(recf)); rw = json.load(open(bf))['rows']['1']; tp = float(rw['t'])
    mf = os.path.join(mdir, '%s_t%g.json' % (pref, tp))
    if not os.path.exists(mf): print('no margin scan for', name, tp); continue
    m = json.load(open(mf)); good = sorted([p for p in rec['pts'] if p['theta_room']], key=lambda p: p['theta_room'])[:int(os.environ.get('NENERGY', 3))]
    if not good: continue
    en = ','.join('%.6f' % p['ufrac'] for p in sorted(good, key=lambda p: p['ufrac']))
    kap = rec['kappa']; kenv = ('KAPPA_CHI=%s' % kap) if isinstance(kap, str) else ('KAPPA_AB=%r' % kap)
    mu_rec = rw['mu']; b = max(m['b_fit'], 0.0); mug = m['mu_glob']; uabs = ','.join('%.6f' % p['u'] for p in sorted(good, key=lambda p: p['ufrac']))
    # mu0 of the linear model: the band file's pointwise value (prof2 quadrature); b refers to the scan's own mu0, so shift it consistently
    if mug < 0.02:                                           # no usable constant secant margin on this row (mu_glob <= 0.02): the gain bound of the assembly is void
        cases.append(dict(name=name, band=os.path.basename(bf), tprime=tp, room=rw['room'], tlo=rw['tlo'], mu_record=mu_rec, mu0_scan=m['mu0'], mu_glob=mug, b_fit=b, energies=en, u_abs=uabs, prof=rw['prof'], kappa=kap, no_secant=True,
                          record_band_min=rec['band_min']['theta_room'] if rec.get('band_min') else None, record_at=rec['band_min']['ufrac'] if rec.get('band_min') else None))
        cmds.append('cd %s && PERCHI=1 D5_E1=%s D5_ETA=%s OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 THRESH_DIR=%s BAND_ROWS=%s %s %s %s 1 %s - %s_Mmu > out/r4_theta6%s_Mmu.log 2>&1' % (work, os.environ.get('D5_E1', '0.78'), os.environ.get('D5_ETA', '0.0779'), TH, os.path.basename(bf), kenv, PY, SC, en, name, name)); continue
    models = dict(mu='', glob='MARGIN_MODEL=const:%.6f' % mug, lin='MARGIN_C3=1.3293404 MARGIN_MODEL=lin:%.6f:%.6f:%.6f' % (min(mu_rec, m['mu0']), b, min(mug, mu_rec)))
    cases.append(dict(name=name, band=os.path.basename(bf), tprime=tp, room=rw['room'], tlo=rw['tlo'], mu_record=mu_rec, mu0_scan=m['mu0'], mu_glob=mug, b_fit=b, energies=en, u_abs=uabs, prof=rw['prof'], kappa=kap,
                      record_band_min=rec['band_min']['theta_room'] if rec.get('band_min') else None, record_at=rec['band_min']['ufrac'] if rec.get('band_min') else None))
    for mod, menv in models.items():
        tag = '%s_M%s' % (name, mod)
        cmds.append('cd %s && PERCHI=1 D5_E1=%s D5_ETA=%s OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 THRESH_DIR=%s BAND_ROWS=%s %s %s %s %s 1 %s - %s > out/r4_theta6%s.log 2>&1' % (
            work, os.environ.get('D5_E1', '0.78'), os.environ.get('D5_ETA', '0.0779'), TH, os.path.basename(bf), kenv, menv, PY, SC, en, tag, tag))
RC = os.path.expanduser('~/claude-b9ee-degree5/design/scripts/ratio_cluster.py'); BINS = '0:1,1:2,2:3,3:4,4:6,6:8,8:12,12:16,16:24,24:42.1'; rc = []
for cs in cases:
    for c_ in (4, 8):
        if c_ == 8 and os.environ.get('C8_FILTER') and not any(x in cs['name'] for x in os.environ['C8_FILTER'].split(',')): continue
        rc.append('cd %s && OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 %s %s %s 0.4,0.3 %s %r %s out/ratio%s_c%d.json A %d 14 19 %s > out/ratio%s_c%d.log 2>&1' % (
            work, PY, RC, cs['prof'], os.environ.get('D5_E1', '0.78'), cs['tlo'], cs['u_abs'], cs['name'], c_, c_, BINS, cs['name'], c_))
open(outc + '.ratio', 'w').write('\n'.join(rc) + '\n')
# long (lin) jobs first
cmds.sort(key=lambda c: 'lin:' not in c)
open(outc, 'w').write('\n'.join(cmds) + '\n'); json.dump(cases, open(outc + '.cases.json', 'w'), indent=1)
print(len(cases), 'cases,', len(cmds), 'commands ->', outc)
