#!/usr/bin/env python3
"""Task D: candidate designs for the tuned/covering part of the certificate, with EXACT rooms (N for everything else).
Rows: the rational rows of ledger 4.17 (cert2b/out/rows2b.json) with their row constants C_r certified at rho0 = 2287/2500
(certB_const/out/rec_TAG.json of this folder: exact rationals).  A piece [a, b] of t covered by the row r has
   room(target) = target - max(a^2 - 2 l a + C_r, b^2 - 2 l b + C_r)       (exact; the bound is convex in t).
For every piece of PIECES and every candidate row tuned at t' in [b + DMIN, b + DMAX] with room >= ROOMMIN at the target, a band file
is written for the allowance program (t_lo = a, the whole room as eta_AB: an upper bound of what the A/B sector may take), with the
profile of the float tuned row t' (the NEWCAP profiles; the rational row differs from it in the 7th digit: PLAN section 6).
Also writes the command lines: r4_theta6.py (PERCHI, models mu and lin, optionally glob) and ratio_cluster.py (c = 4 and optionally 8).
usage: design_final.py WORK(game folder) CERTDIR MARGINDIR PREFIX OUTPREFIX TARGET(p/q) "a1,a2,...,aK" [energies] [tag]
env: DMIN (0.0), DMAX (0.125), ROOMMIN (1.5e-4), MODELS (mu,lin), BINS, CS (4), TILT (0.4,0.3), KAPPA_FILE_T (0.8)"""
import sys, os, json, glob
from fractions import Fraction as F
work, certd, mdir, pref, outp, tgt_s, a_s = sys.argv[1:8]
energies = sys.argv[8] if len(sys.argv) > 8 else 'c0.55,c0.65,c0.72,c0.78,c0.84,c0.90,c0.96'; tag = sys.argv[9] if len(sys.argv) > 9 else 'fin'
TGT = F(tgt_s); A = [F(x) for x in a_s.split(',')]
DMIN, DMAX, ROOMMIN = float(os.environ.get('DMIN', 0.0)), float(os.environ.get('DMAX', 0.125)), float(os.environ.get('ROOMMIN', 1.5e-4))
MODELS = os.environ.get('MODELS', 'mu,lin').split(','); CS = [int(x) for x in os.environ.get('CS', '4').split(',')]
BINS = os.environ.get('BINS', '0:1,1:2,2:3,3:4,4:6,6:8,8:12,12:16,16:24,24:42.1'); sa, sb = [float(x) for x in os.environ.get('TILT', '0.4,0.3').split(',')]
E1 = float(os.environ.get('D5_E1', '0.78')); ETA = os.environ.get('D5_ETA', '0.0779')
PY = os.path.expanduser('~/claude-b9ee-degree5/venv/bin/python'); SD = os.path.expanduser('~/claude-b9ee-degree5/design/scripts'); TH = os.path.expanduser('~/claude-b9ee-degree5/degree5-newcap-2026-11-16/thresholds')
rows = {}
for f in glob.glob(os.path.join(certd, 'out', 'rec_*.json')):
    r = json.load(open(f))
    if r.get('C') and not r['tag'].endswith('L'):
        l, be, bA, bB = [F(x) for x in r['row'].split(',')]; rows[round(float(r['t']), 4)] = dict(tag=r['tag'], l=l, beta=be, bA=bA, bB=bB, C=F(r['C']))
KCONST = {round(float(x.split(':')[0]), 4): float(x.split(':')[1]) for x in os.environ['KAPPA_CONST'].split(',')} if os.environ.get('KAPPA_CONST') else {}     # rows with a constant split kappa_AB
def kappa_spec(tp):
    if round(tp, 4) in KCONST: return KCONST[round(tp, 4)]
    kt = 0.82 if abs(tp - 0.82) < 1e-9 else float(os.environ.get('KAPPA_FILE_T', 0.8))
    kf = os.path.join(work, 'kappa_chi_t%s.json' % ('%.4f' % kt).replace('.', 'p'))
    pts_ = sorted(json.load(open(kf))['pts'], key=lambda p_: p_['chi'])
    def kh_(chi):
        lower = [p_ for p_ in pts_ if p_['chi'] <= chi + 1e-9]; right = [p_['kappa_h'] for p_ in pts_ if p_['chi'] >= chi - 1e-9]
        return max([lower[-1]['kappa_h'] if lower else pts_[0]['kappa_h']] + right[:1])
    return ','.join('%g:%.4f' % (c_, 1 - kh_(c_) - 0.02) for c_ in (1, 2, 3, 4, 6, 8, 10, 12, 14, 16, 20, 24, 30, 36, 42))
cases = []; cmds = []; rc = []
TOPK = int(os.environ.get('TOPK', 99)); ONLY = os.environ.get('ONLY_ROWS')      # ONLY_ROWS: 'a:t1+t2,a:t3,...' = the candidate rows of the piece starting at a
only = {round(float(x.split(':')[0]), 4): [round(float(v), 4) for v in x.split(':')[1].split('+')] for x in ONLY.split(',')} if ONLY else None
room_of = lambda a, b, r: TGT - max(a * a - 2 * r['l'] * a + r['C'], b * b - 2 * r['l'] * b + r['C'])
for a, b in zip(A[:-1], A[1:]):
    cand = [tp for tp in sorted(rows) if float(b) + DMIN - 1e-9 <= tp <= float(b) + DMAX + 1e-9]
    if only is not None: cand = [tp for tp in sorted(rows) if tp in only.get(round(float(a), 4), [])]
    else: cand = sorted([tp for tp in cand if float(room_of(a, b, rows[tp])) >= ROOMMIN])[-TOPK:] + [tp for tp in cand if float(room_of(a, b, rows[tp])) < ROOMMIN][:1]
    for tp in cand:
        r = rows[tp]; room = TGT - max(a * a - 2 * r['l'] * a + r['C'], b * b - 2 * r['l'] * b + r['C'])
        tk = ('%.4f' % tp).replace('.', 'p'); pf = 'out/prof_t%s.npz' % tk; mf = os.path.join(mdir, '%s_t%g.json' % (pref, tp))
        rec = dict(piece=[str(a), str(b)], tprime=tp, row_tag=r['tag'], row=dict(l=str(r['l']), beta=str(r['beta']), bA=str(r['bA']), bB=str(r['bB'])), C=str(r['C']), room=float(room), room_exact=str(room))
        if float(room) < ROOMMIN or not os.path.exists(os.path.join(work, pf)) or not os.path.exists(mf): rec['skipped'] = 'room' if float(room) < ROOMMIN else 'no profile or margin scan'; cases.append(rec); continue
        m = json.load(open(mf)); mus = {(x['s'], x['t']): x for x in json.load(open(os.path.join(work, 'out', 'mu_t%s.json' % tk)))['tilts']}
        mu_rec = mus[(sa, sb)]['mu'] if (sa, sb) in mus else m['mu0']; mug = min(m['mu_glob'], m['mu0']); bfit = max(m['b_fit'], 0.0)
        name = '_%s_%g_%g_t%s' % (tag, float(a), float(b), tk); bandf = 'band5%s.json' % name
        json.dump(dict(tilt=[sa, sb], rows={'1': dict(t='%.3f' % tp, mu=mu_rec, tlo=float(a), room=float(room), prof=pf)}), open(os.path.join(work, bandf), 'w'), indent=1)
        ucap = 4 * E1 ** 2 * 0.432306903 * (0.886762780 - float(a)); uabs = ','.join('%.6f' % (min(float(e[1:]), 0.999) * ucap) for e in energies.split(','))
        kap = kappa_spec(tp); rec.update(name=name, band=bandf, mu_record=mu_rec, mu0_scan=m['mu0'], mu_glob=mug, b_fit=bfit, energies=energies, u_abs=uabs, prof=pf, tlo=float(a), kappa=kap, ucap=ucap)
        menv = dict(mu='', glob='MARGIN_MODEL=const:%.6f' % mug, lin='MARGIN_C3=1.3293404 MARGIN_MODEL=lin:%.6f:%.6f:%.6f' % (min(mu_rec, m['mu0']), bfit, min(mug, mu_rec)))
        if mug < 0.02: rec['no_secant'] = True
        for mod in MODELS:
            if mug < 0.02 and mod != 'mu': continue
            kenv = ('KAPPA_CHI=%s' % kap) if isinstance(kap, str) else ('KAPPA_AB=%r' % kap)
            cmds.append('cd %s && PERCHI=1 D5_E1=%s D5_ETA=%s OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 THRESH_DIR=%s BAND_ROWS=%s %s %s %s %s/r4_theta6.py 1 %s - %s_M%s > out/r4_theta6%s_M%s.log 2>&1' % (
                work, E1, ETA, TH, bandf, kenv, menv[mod], PY, SD, energies, name, mod, name, mod))
        for c_ in CS:
            rc.append('cd %s && OMP_NUM_THREADS=1 OPENBLAS_NUM_THREADS=1 %s %s/ratio_cluster.py %s %g,%g %s %r %s out/ratio%s_c%d.json A %d 14 19 %s > out/ratio%s_c%d.log 2>&1' % (
                work, PY, SD, pf, sa, sb, E1, float(a), uabs, name, c_, c_, BINS, name, c_))
        for rf in ('b2_gen5_5_u0.85_n6_free', 'b2_gen5_5_u0.85_n5_free', 'b2_rows_n4'):
            rc.append('cd %s && OMP_NUM_THREADS=1 THRESH_DIR=%s %s %s/reeval_tilt.py %s %s %s %s b2data/%s.json %s 19 > %s/out/reevalD%s_%s.log 2>&1' % (TH, TH, PY, SD, os.environ.get('GAME_LINK', 'g078design'), E1, ETA, bandf, rf, energies, work, name, rf))
        cases.append(rec)
cmds.sort(key=lambda c: 'lin:' not in c)
open(outp + '.txt', 'w').write('\n'.join(cmds + rc) + '\n'); json.dump(cases, open(outp + '.cases.json', 'w'), indent=1)
for c in cases: print('piece [%s, %s] <- row %.3f: room %.3e %s' % (float(F(c['piece'][0])), float(F(c['piece'][1])), c['tprime'], c['room'], ('SKIPPED: ' + c['skipped']) if c.get('skipped') else ('mu %.3f mu_glob %.3f b %.2f' % (c['mu_record'], c['mu_glob'], c['b_fit']))))
print(len([c for c in cases if not c.get('skipped')]), 'cases,', len(cmds) + len(rc), 'commands ->', outp + '.txt')
