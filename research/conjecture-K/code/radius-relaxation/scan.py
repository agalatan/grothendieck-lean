"""N: scan of the dual value over s for several constraint sets.  Usage:
   scan.py OUT.jsonl "tag:mode:json-opts;..." s1,s2,... [drk gk r_max]"""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dualcp import solve_cp

out = sys.argv[1]
specs = []
for sp in sys.argv[2].split(';'):
    tag, mode, js = sp.split(':', 2)
    specs.append((tag, mode, json.loads(js) if js else None))
svals = [float(x) for x in sys.argv[3].split(',')]
drk = float(sys.argv[4]) if len(sys.argv) > 4 else 0.2
gk = float(sys.argv[5]) if len(sys.argv) > 5 else 1.08
r_max = float(sys.argv[6]) if len(sys.argv) > 6 else 30.0
with open(out, 'a') as fh:
    for s in svals:
        for tag, mode, opts in specs:
            o, sol, h = solve_cp(s, mode, drk=drk, gk=gk, r_max=r_max, opts=opts, rounds=5)
            o['tag'] = tag
            fh.write(json.dumps(o) + '\n'); fh.flush()
            print(tag, s, o.get('value'), o.get('min_slack'), o.get('bound_N'), o.get('status'), flush=True)
