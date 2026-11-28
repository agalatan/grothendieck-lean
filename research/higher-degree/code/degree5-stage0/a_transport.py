# Stage 0 (a): transport the stored E3 rows of one game in t (N; exact rational arithmetic on the JSON decimals).
#   usage: a_transport.py RESULTS_A GAME [CLASS=E3_KOUL3] [EXCLUDE_T ...]
# Only the constant t^2 - 2 l t of a row depends on t, so a row (l_i, ...) stored at t_i with value v_i scores
#   v_i + t^2 - t_i^2 - 2 l_i (t - t_i) at t (same laws, same oracle grid).  min_i of these is a piecewise-quadratic
#   function with the same t^2 in every piece, so its maximum on [0, 0.55] is at an endpoint or where two pieces cross.
import sys, os, json, glob
from fractions import Fraction as F
D, g = sys.argv[1], sys.argv[2]; cls = sys.argv[3] if len(sys.argv) > 3 else 'E3_KOUL3'; ex = {F(x) for x in sys.argv[4:]}
R = []
for f in sorted(glob.glob(os.path.join(D, '%s__%s__*.json' % (g, cls)))):
    t = F(os.path.basename(f)[:-5].split('__')[2]); r = json.load(open(f))
    if t in ex or 'note' in r: continue
    R.append((t, F(repr(r['value'])), F(repr(r['p'][0]))))
s = lambda i, t: R[i][1] + t * t - R[i][0] ** 2 - 2 * R[i][2] * (t - R[i][0])
m = lambda t: min(s(i, t) for i in range(len(R)))
cand = {F(0), F(55, 100)}
for i in range(len(R)):
    for j in range(i + 1, len(R)):
        if R[i][2] != R[j][2]:   # s_i - s_j is affine in t
            a = (R[i][1] - R[i][0] ** 2 + 2 * R[i][2] * R[i][0]) - (R[j][1] - R[j][0] ** 2 + 2 * R[j][2] * R[j][0])
            t = a / (2 * (R[i][2] - R[j][2]))
            if 0 <= t <= F(55, 100): cand.add(t)
tb = max(cand, key=m); v = m(tb); tgt = F(10000, 14027)
print('rows used: t =', ', '.join(str(float(r[0])) for r in R))
print('max over t in [0, 0.55] of min_i score: %.10f at t = %.10f; room to 1/1.4027: %.10f' % (float(v), float(tb), float(tgt - v)))
