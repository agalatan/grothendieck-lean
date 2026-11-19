# Review of codex-a786's content-law package (worker of claude-b9ee, 16 Nov 2026).  N.
# NOT about the package's class: three hard families of CONTENT_LEMMA_D5.md that have self-interaction,
#   junta  H(X) = X(|X|^2-2)/sqrt2 (chi 42);   Wick + shared  cos(0.3) H(X) + i sin(0.3) X(|Y|^2-1) (chi 35.43);
#   (H(X) + H(Y))/sqrt2 (chi 21),
# evaluated across the band of energies: the ratio ||c[h]||^2/(delta Omhat[h]) per sector, against the row targets of the
# question.  Purpose: is the inequality the package was asked for (with the six thresholds) numerically true on the band for
# the families the package does not cover?  Validation: the study's logs at u = 0.85 u*, u* (content/delta and Omhat, A + B).
# usage (from the review folder): python3 -I -B -c "import sys; sys.path.insert(0,'scripts'); sys.argv=['hard_families.py','data','logs/hard_families.json']; exec(open('scripts/hard_families.py').read())"
import sys, json, math
import numpy as np
import content_ratio as CR
pdir, outjson = sys.argv[1], sys.argv[2]
TARGET = {'0.80': 0.37, '0.82': 0.64, '0.84': 1.33, '0.845': 1.88, '0.85': 2.5, '0.855': 3.7}
FR = (0.5, 0.6, 0.7, 0.85, 1.0, 1.3)
REF = {  # study (t4fam_<k>.log): (content/delta, Omhat) at u/u* = 0.85, 1.00, sums over A and B
 'junta': {'0.80': [(0.01333, 0.1397), (0.01140, 0.1450)], '0.82': [(0.01536, 0.1111), (0.01348, 0.1181)], '0.84': [(0.01790, 0.0807), (0.01619, 0.0879)],
           '0.845': [(0.01863, 0.0729), (0.01699, 0.0798)], '0.85': [(0.01939, 0.0648), (0.01786, 0.0715)], '0.855': [(0.02019, 0.0568), (0.01878, 0.0629)]},
 'Wick+shared': {'0.80': [(0.01433, 0.1436), (0.01229, 0.1489)], '0.82': [(0.01640, 0.1147), (0.01444, 0.1216)], '0.84': [(0.01892, 0.0837), (0.01717, 0.0909)],
                 '0.845': [(0.01962, 0.0755), (0.01797, 0.0827)], '0.85': [(0.02035, 0.0673), (0.01882, 0.0742)], '0.855': [(0.02110, 0.0590), (0.01971, 0.0654)]},
 'H(X)+H(Y)': {'0.80': [(0.01667, 0.1320), (0.01448, 0.1357)], '0.82': [(0.01852, 0.1071), (0.01656, 0.1127)], '0.84': [(0.02039, 0.0797), (0.01887, 0.0859)],
               '0.845': [(0.02081, 0.0724), (0.01945, 0.0786)], '0.85': [(0.02118, 0.0649), (0.02001, 0.0710)], '0.855': [(0.02147, 0.0573), (0.02052, 0.0630)]}}
# nodes in r = |X| (density 2 r exp(-r^2)): everything is smooth in r
def rnodes(npan):
    r, w = CR.gl(np.linspace(0, 7.2, npan + 1), 8); w = w * 2 * r * np.exp(-r * r); return r, w / w.sum()
r1, w1 = rnodes(72)                                    # one variable
r2, w2 = rnodes(36)                                    # two variables
th = (np.arange(48) + 0.5) * np.pi / 48
c3, s3 = math.cos(0.3), math.sin(0.3)
def fam_junta():
    T = r1 * r1; a = T - 2
    return [(w1, T * a * a / 2, [T * a / math.sqrt(2)])]                     # weights, |p|^2, [components of conj(y_e) p along the content coordinates]
def fam_ws():
    T1 = (r2 * r2)[:, None]; T2 = (r2 * r2)[None, :]; a = T1 - 2; b = T2 - 1; W = (w2[:, None] * w2[None, :])
    return [(W.ravel(), (T1 * (c3 * c3 * a * a / 2 + s3 * s3 * b * b)).ravel(), [(T1 * c3 * a / math.sqrt(2) + 0 * T2).ravel(), (T1 * s3 * b).ravel()])]   # Re and Im of conj(X) p
def fam_hh():
    T1 = (r2 * r2)[:, None, None]; T2 = (r2 * r2)[None, :, None]; a = T1 - 2; b = T2 - 2; cs = np.cos(th)[None, None, :]
    W = (w2[:, None, None] * w2[None, :, None] * np.ones(len(th))[None, None, :] / len(th))
    V = (T1 * a * a + T2 * b * b + 2 * r2[:, None, None] * r2[None, :, None] * a * b * cs) / 4
    cx = (T1 * a + r2[:, None, None] * r2[None, :, None] * b * cs) / 2            # Re conj(X) p ; the Y component is equal by symmetry
    return [(W.ravel(), V.ravel(), [cx.ravel(), cx.ravel()])]
FAMS = {'junta': fam_junta(), 'Wick+shared': fam_ws(), 'H(X)+H(Y)': fam_hh()}
for nm, ((W, P2, comps),) in FAMS.items():
    print('%-12s  E|p|^2 = %.8f  chi = %.4f  E conj(y) p = %s' % (nm, W @ P2, W @ (P2 * P2) - 2, ['%.1e' % (W @ c) for c in comps]))
res = []; worst = {}
for tname, k in CR.ROWK.items():
    d = np.load('%s/prof_hp_%d.npz' % (pdir, k)); rec = json.loads(str(d['rec'])); S = d['S']; us = CR.ustar(S, d['psi'], rec)
    out = {nm: {} for nm in FAMS}
    for f in FR:
        u = f * us
        for sec, (gname, tilt) in CR.TILT.items():
            pr = CR.Prof(S, d[gname] + tilt * d['G0']); kp = CR.kprime(pr, u)
            for nm, ((W, P2, comps),) in FAMS.items():
                V = u * P2; hv = pr.h(V); kv = kp(V); chi = float(W @ (P2 * P2) - 2)
                c2 = sum((math.sqrt(u) * float(W @ (c * hv))) ** 2 for c in comps)
                EVk = float(W @ (V * kv)); EVk2 = float(W @ (V * kv * kv)); om = 1.5 * EVk2 - 0.75 * EVk ** 2 / u
                out[nm][(f, sec)] = (c2 / (chi * u * u), om)
    print('=== t = %s (target %.2f)' % (tname, TARGET[tname]))
    for nm in FAMS:
        for i, f in enumerate((0.85, 1.0)):
            mine = (out[nm][(f, 'A')][0] + out[nm][(f, 'B')][0], out[nm][(f, 'A')][1] + out[nm][(f, 'B')][1]); ref = REF[nm][tname][i]
            print('   %-12s u = %.2f u*: content/delta %.5f (study %.5f)  Omhat %.4f (study %.4f)' % (nm, f, mine[0], ref[0], mine[1], ref[1]))
        ratios = {f: (out[nm][(f, 'A')][0] / out[nm][(f, 'A')][1], out[nm][(f, 'B')][0] / out[nm][(f, 'B')][1]) for f in FR}
        mx = max(max(v) for v in ratios.values()); worst[(tname, nm)] = TARGET[tname] / mx
        print('   %-12s ratio per sector A/B by u/u*: ' % nm + '  '.join('%.2f: %.3f/%.3f' % (f, ratios[f][0], ratios[f][1]) for f in FR) + '   | target/largest = %.2f' % (TARGET[tname] / mx))
        res.append(dict(t=tname, family=nm, ratios={str(f): ratios[f] for f in FR}, margin=TARGET[tname] / mx))
    sys.stdout.flush()
json.dump(res, open(outjson, 'w'), indent=1)
print('smallest target/ratio over the band grid: %.2f at %s' % (min(worst.values()), min(worst, key=worst.get)))
