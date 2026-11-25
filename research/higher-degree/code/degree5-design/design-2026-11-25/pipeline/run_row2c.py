# Stage 2c driver for ONE row (claude-b9ee worker d5newcap, 16 Nov 2026; from cert2/run_rows2.py, cert2b/run_rows2b.py and
# cert2b/run_stein2b.py).            python3 -I run_row2c.py ROWS.json TAG NPROC [--skip-plain]
# ROWS.json: {"rows": [{"tag", "t", "kind": "gaussian" | "law" | "stein", "l", "beta", "bA", "bB" (rationals p/q),
#                       "stein_target": rational (kind stein: the target of the Stein cover for G+)}, ...]}
# Steps, all outputs in out/:
#   1. caps_TAG.json: interval node caps of Psi5 (caps2.py, psi5), unless the file exists;
#   2. cover_TAG.json: the plain (moments + radius) cover, target = float LP supremum + 3e-6 (lpfloat2, N);  rec_TAG.json;
#   3. kind stein: coverS_TAG.json, the cover with the scalar Stein family (cover2s.py), target "stein_target";  recS_TAG.json.
# C_r = 2 beta^2/eps1 + G+.  Nothing certified depends on the targets: they only steer the refinement.
import sys, os, json, subprocess, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as F
import gamecfg as G
import law2 as law, lpfloat2
HERE = os.path.dirname(os.path.abspath(__file__)); OUT = os.path.join(HERE, 'out'); os.makedirs(OUT, exist_ok=True)
PY = sys.executable
spec = json.load(open(sys.argv[1])); tag = sys.argv[2]; nproc = sys.argv[3]; skip_plain = '--skip-plain' in sys.argv
r = [x for x in spec['rows'] if x['tag'] == tag][0]
t = float(r['t']); kind = r['kind']
p = [F(r[k]) for k in ('l', 'beta', 'bA', 'bB')]
assert all(q.denominator <= 10 ** 6 for q in p)
rowarg = ','.join('%d/%d' % (q.numerator, q.denominator) for q in p)
capsf = os.path.join(OUT, 'caps_%s.json' % tag); covf = os.path.join(OUT, 'cover_%s.json' % tag); covS = os.path.join(OUT, 'coverS_%s.json' % tag)
T0 = time.time()
if not os.path.exists(capsf):
    subprocess.run([PY, '-I', os.path.join(HERE, 'caps2.py'), '--row', rowarg, '--nproc', nproc, '--out', capsf + '.tmp'], check=True)
    os.replace(capsf + '.tmp', capsf)
t1 = time.time()
row = law.Row(capsf)
assert (row.l, row.beta, row.bA, row.bB) == tuple(p), 'caps file of another row'
small = t < 0.7
if not (skip_plain and kind == 'stein') and not os.path.exists(os.path.join(OUT, 'rec_%s.json' % tag)):
    G_lp, arg_lp = lpfloat2.lp_sup(capsf)
    target = F(G_lp).limit_denominator(10 ** 12) + F(3, 10 ** 6)
    t2 = time.time()
    subprocess.run([PY, '-I', os.path.join(HERE, 'cover2.py'), '--caps', capsf, '--target', '%d/%d' % (target.numerator, target.denominator),
                    '--nproc', nproc, '--maxboxes', '40000', '--out', covf] + (['--stall-x', '1/32', '--xweight', '1/16'] if small else []), check=True)
    t3 = time.time()
    cov = json.load(open(covf)); Gp = F(cov['G_plus']) if cov['G_plus'] else None
    C = 2 * row.beta ** 2 / law.EPS1 + Gp if Gp is not None else None
    rec = dict(t=t, kind=kind, tag=tag, row=rowarg, G_lp=G_lp, lp_arg=arg_lp, target=str(target), G_plus=(str(Gp) if Gp is not None else None),
               C=(str(C) if C is not None else None), C_float=(float(C) if C is not None else None), holes=len(cov['failed']),
               unfinished=len(cov['unfinished']), boxes=cov['accepted'], caps_secs=t1 - T0, lp_secs=t2 - t1, cover_secs=t3 - t2,
               game=dict(eps1=str(G.EPS1), eta=str(G.ETA), rho=str(G.RHO)))
    json.dump(rec, open(os.path.join(OUT, 'rec_%s.json' % tag), 'w'))
    print(json.dumps(rec), flush=True)
if kind == 'stein' and not os.path.exists(os.path.join(OUT, 'recS_%s.json' % tag)):
    target = F(r['stein_target'])
    t4 = time.time()
    subprocess.run([PY, '-I', os.path.join(HERE, 'cover2s.py'), '--caps', capsf, '--target', '%d/%d' % (target.numerator, target.denominator),
                    '--nproc', nproc, '--maxboxes', '40000', '--nu-grid=' + G.STEIN_NUGRID, '--xweight', '1/4', '--stall-x', '1/16',
                    '--stein-sig', '1/16', '--stein-x', '1/2', '--out', covS], check=True)
    t5 = time.time()
    cov = json.load(open(covS)); Gp = F(cov['G_plus']) if cov['G_plus'] else None
    C = 2 * row.beta ** 2 / law.EPS1 + Gp if Gp is not None else None
    rec = dict(t=t, kind=kind, tag=tag, row=rowarg, target=str(target), G_plus=(str(Gp) if Gp is not None else None),
               C=(str(C) if C is not None else None), C_float=(float(C) if C is not None else None), holes=len(cov['failed']),
               unfinished=len(cov['unfinished']), boxes=cov['accepted'], stein_boxes=sum(1 for b in cov['boxes'] if b.get('stein')),
               cover_secs=t5 - t4, game=dict(eps1=str(G.EPS1), eta=str(G.ETA), rho=str(G.RHO)))
    json.dump(rec, open(os.path.join(OUT, 'recS_%s.json' % tag), 'w'))
    print(json.dumps(rec), flush=True)
