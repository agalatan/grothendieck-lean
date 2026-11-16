"""N: which of the new constraints matter (s = 5, finer grid), incl. the coordinator's question (a):
the rotation identity E f(V) - f(0) = E[(c1 - c2) f'(V)] is 2*(II) - (I); 'ident': 'mix' keeps only
the Lean mixture ((I) + 2 (II))/3, 'both' keeps (I) and (II) separately (= mixture + rotation identity)."""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from dualcp import solve_cp

out = sys.argv[1]
s = float(sys.argv[2]) if len(sys.argv) > 2 else 5.0
tests = [
    ('R0 old radial', 'R0', None),
    ('L Lean separate', 'L', None),
    ('G Lean gram', 'G', None),
    ('G + joint', 'G', dict(joint=True)),
    ('N all + joint', 'N', dict(joint=True)),
    ('N + joint, mix identity only (no rotation identity)', 'N', dict(joint=True, ident='mix')),
    ('N + joint, both identities, no cone', 'N', dict(joint=True, cone='none')),
    ('N + joint, both identities, positivity only', 'N', dict(joint=True, cone='pos')),
    ('N + joint, budgets 3,5 only (two identities + cone)', 'N', dict(joint=True, budgets=(3, 5))),
    ('N + joint, budgets 1,3,5', 'N', dict(joint=True, budgets=(1, 3, 5))),
    ('N + joint, budgets 2,3,5 (hazard)', 'N', dict(joint=True, budgets=(2, 3, 5))),
    ('N + joint, budgets 1,2,3,5', 'N', dict(joint=True, budgets=(1, 2, 3, 5))),
    ('N + joint, mix, no cone = G + joint + budgets 1,2,4', 'N', dict(joint=True, ident='mix', cone='none')),
]
with open(out, 'a') as fh:
    for tag, mode, opts in tests:
        o, sol, h = solve_cp(s, mode, drk=0.1, gk=1.06, r_max=30.0, opts=opts, rounds=5)
        o['tag'] = tag
        fh.write(json.dumps(o) + '\n'); fh.flush()
        print('%-60s value %.5f  min_slack %.1e  bound_N %.5f  %s' % (tag, o.get('value', float('nan')), o.get('min_slack', float('nan')),
                                                                       o.get('bound_N', float('nan')), o.get('status')), flush=True)
