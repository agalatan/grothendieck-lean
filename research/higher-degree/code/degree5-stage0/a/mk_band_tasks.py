# Stage 0 (b): task list for the law layer on the band rows: each Gaussian-optimal row of the gate run is evaluated,
# with its parameters fixed, in the classes of part (a).   usage: mk_band_tasks.py GATEB "classes" "t list" > tasks
import sys, json, os
G = sys.argv[1]; classes = sys.argv[2].split(); ts = [float(x) for x in sys.argv[3].split()]
for g, e1, eta in (('gC', 0.78, 0.0779), ('g80', 0.80, 0.1364), ('g83', 0.83, 0.2241), ('g84', 0.84, 0.2552), ('gA2', 0.848, 0.2795), ('gA1', 0.84896, 0.2818), ('gA', 0.8493, 0.2827)):
    f = os.path.join(G, 'thresholds/games/%s/rows_all.lines' % g)
    if not os.path.exists(f): continue
    for r in [json.loads(l) for l in open(f) if l.strip()]:
        if not any(abs(r['t'] - t) < 1e-9 for t in ts): continue
        for c in classes:
            tag = c.replace(':', '_').replace('/', '_')
            print('S0_FIXP=1 ../venv/bin/python rows0.py %s %s %s %s %.12f %.12f %.12f %.12f > outb/%s__%s__%s.json 2> outb/%s__%s__%s.err' % (e1, eta, r['t'], c, r['l'], r['beta'], r['bA'], r['bB'], g, tag, r['t'], g, tag, r['t']))
