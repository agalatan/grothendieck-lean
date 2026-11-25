# Exact row envelope B = max_{t in [t_lo, t_hi]} min_r (t^2 - 2 l_r t + C_r) for rational rows (claude-b9ee d5cert, 16 Nov 2026).
# min_r is t^2 plus the concave lower envelope of the lines C_r - 2 l_r t; on each linear piece t^2 + line is convex,
# so the maximum over [t_lo, t_hi] is attained at a breakpoint or an end.  t_hi may be any rational upper bound of
# sqrt(pi)/2 (the response bound t <= sqrt(pi)/2; convexity on the last piece makes the larger end safe).   [C]
import sys, json
from fractions import Fraction as F

SQRTPI_2_UP = F(886227, 1000000)        # > sqrt(pi)/2 = 0.88622692545...
assert SQRTPI_2_UP ** 2 * 4 > F(314159265358979, 10 ** 14) * 1  # (2*0.886227)^2 = 3.14159... > pi

def envelope(rows, t_lo, t_hi):
    """rows: list of (l, C) rationals. Returns (B, argmax t, list of (t_a, t_b, row index) pieces)."""
    def val(i, t): return t * t - 2 * rows[i][0] * t + rows[i][1]
    # walk from t_lo upward: at each t the active row is the argmin of C - 2 l t (ties: larger l continues longer)
    t = t_lo; pieces = []
    cur = min(range(len(rows)), key=lambda i: (rows[i][1] - 2 * rows[i][0] * t, -rows[i][0]))
    while t < t_hi:
        nxt, tn = None, t_hi
        for j in range(len(rows)):
            if rows[j][0] > rows[cur][0]:        # a line with larger slope magnitude overtakes later
                tc = (rows[j][1] - rows[cur][1]) / (2 * (rows[j][0] - rows[cur][0]))
                if t < tc < tn: tn, nxt = tc, j
        pieces.append((t, tn, cur))
        if nxt is None: break
        t, cur = tn, nxt
    best = max([(val(i, a), a) for a, b, i in pieces] + [(val(i, b), b) for a, b, i in pieces])
    return best[0], best[1], pieces

if __name__ == '__main__':
    d = json.load(open(sys.argv[1]))
    t_lo = F(sys.argv[2]) if len(sys.argv) > 2 else F(69, 100)
    rows = [(F(r['row'].split(',')[0]), F(r['C'])) for r in d if r.get('C')]
    B, tb, pieces = envelope(rows, t_lo, SQRTPI_2_UP)
    print('B =', float(B), 'at t =', float(tb))
    for a, b, i in pieces:
        print('  [%.5f, %.5f] row l=%.6f  max %.7f' % (a, b, float(rows[i][0]), float(max(a * a - 2 * rows[i][0] * a + rows[i][1], b * b - 2 * rows[i][0] * b + rows[i][1]))))
    print('500/701 - B =', float(F(500, 701) - B), ' (largest uniform eta5 for 1.402)')
