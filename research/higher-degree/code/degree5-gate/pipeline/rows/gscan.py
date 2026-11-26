# Model value N(gamma) = max_t (Gaussian row value) of the game (1, -e1, gamma) for a list of gamma (N).
# claude-b9ee worker d5newcap, 16 Nov 2026.   usage: gscan.py e1 gamma1,gamma2,... [t-list]
import sys, os, json, time, subprocess
here = os.path.dirname(os.path.abspath(__file__))
e1 = sys.argv[1]; gs = sys.argv[2].split(','); ts = sys.argv[3] if len(sys.argv) > 3 else '0.84,0.845,0.85,0.855'
for g in gs:
    out = os.path.join(here, 'gscan_%s_%s.lines' % (e1, g))
    if os.path.exists(out): os.remove(out)
    env = dict(os.environ, D5_E1=e1, D5_ETA=g)
    subprocess.run([sys.executable, os.path.join(here, 'rowscan.py'), out, ts], env=env, check=True, stdout=subprocess.DEVNULL)
    rows = [json.loads(l) for l in open(out)]
    b = max(rows, key=lambda r: r['row'])
    # parabola through the three rows around the maximum (the envelope is smooth in t)
    import numpy as np
    tt = np.array([r['t'] for r in rows]); vv = np.array([r['row'] for r in rows]); i = int(np.argmax(vv)); i = min(max(i, 1), len(tt) - 2)
    c = np.polyfit(tt[i - 1:i + 2], vv[i - 1:i + 2], 2); tp = -c[1] / (2 * c[0]); vp = np.polyval(c, tp)
    print('e1=%s gamma=%s: max row %.7f at t=%.3f; parabola peak %.7f at t=%.4f; margin to 500/701 %.3e; 1/N %.6f' % (
        e1, g, b['row'], b['t'], vp, tp, 500 / 701 - vp, 1 / vp), flush=True)
