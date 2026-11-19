# claude-b9ee: negative controls for own_verifier.py (each altered certificate must be rejected).
import json, sys, copy
from fractions import Fraction as Fr
import own_verifier as V
data = json.load(open(sys.argv[1]))
def rejected(mod, what):
    d = copy.deepcopy(data); mod(d)
    try:
        res = sorted(V.check(c) for c in d['certificates'])
        assert res[0][0] == 0 and res[-1][1] == 42 and all(res[i][1] == res[i + 1][0] for i in range(len(res) - 1)), 'no cover of [0, 42]'
    except AssertionError as e:
        print('rejected (%s): %s' % (what, e)); return
    raise SystemExit('NOT REJECTED: ' + what)
def lower_d0(d):
    c = d['certificates'][3]; c['d'][0] = str(Fr(c['d'][0]) - Fr(1, 100000))
def bad_W(d):
    c = d['certificates'][0]; c['ww'][5] = [c['ww'][5][0], c['ww'][5][1], '1']
def gap(d):
    d['certificates'][2]['interval'] = ['21/4', '6']
def flip_lambda(d):
    c = d['certificates'][1]; c['la'][4] = str(-abs(Fr(c['la'][4])) - Fr(1, 1000))
def raise_rho_target(d):                     # a certificate whose endpoint exceeds the target: enlarge its s-interval
    d['certificates'][3]['interval'] = ['25/4', '8']
for mod, what in ((lower_d0, 'd0 lowered by 1e-5'), (bad_W, 'W not PSD at a knot'),
                  (gap, 'gap in the s cover'), (flip_lambda, 'a negative multiplier'), (raise_rho_target, 's-interval enlarged')):
    rejected(mod, what)
print('all negative controls rejected')
# informational: the pointwise slack of the tightest certificate (lowering d0 by eps keeps Phi >= 0 only for small eps)
for k in (7, 6):
    d = copy.deepcopy(data); c = d['certificates'][3]; c['d'][0] = str(Fr(c['d'][0]) - Fr(1, 10 ** k))
    try:
        V.check(c); print('d0 - 1e-%d: still accepted (the pointwise gap of this certificate exceeds 1e-%d)' % (k, k))
    except AssertionError as e:
        print('d0 - 1e-%d: rejected (%s)' % (k, e))
