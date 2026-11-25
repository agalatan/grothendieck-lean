# Game and input constants of the stage-2c certificate (claude-b9ee worker d5newcap, 16 Nov 2026).
# Every script of this folder takes the game T = P10 - eps1 P21 + eta P32, the radius input rho (E|q| <= rho ||q||_2 on
# H_{2,1}) and the nu-grid of the node caps from ONE file: game.json beside this module, or the file named by D5_GAME.
# Stage 2b had these constants written into law2.py, lpfloat2.py, caps2.py, run_*.py, assemble2b.py and replay2b_all.py.
import os, json
from fractions import Fraction as F
_PATH = os.environ.get('D5_GAME') or os.path.join(os.path.dirname(os.path.abspath(__file__)), 'game.json')
CFG = json.load(open(_PATH))
EPS1 = F(CFG['eps1'])            # lambda_1 (the cubic weight), exact rational
ETA = F(CFG['eta'])              # the degree-5 coefficient, exact rational
RHO = F(CFG['rho'])              # radius input, exact rational (K ledger 3.7): E|q| <= RHO ||q||_2 for every s
TARGET = F(CFG.get('target', '500/701'))
NUFINE = CFG['nufine']           # "lo:hi:step" (rationals): nu-nodes with the fine s-grid
NUCOARSE = CFG['nucoarse']       # comma list (rationals): nu-nodes with the coarse s-grids; the ends must be <= -eta, >= eta
STEIN_NUGRID = CFG.get('stein_nugrid')     # merged nu-nodes of the Stein covers (a subset of the cap nodes, same ends)
LP_NU_RANGE = tuple(float(F(x)) for x in CFG.get('lp_nu_range', ['-3/100', '13/200']))
SMALL_T = CFG.get('small_t')     # None, or {"a": "...", "b": "...", "etap": "...", "dir": "smallt"}: V <= a t^2 + b on [0, t1]
assert 0 < ETA < EPS1 < 1 and F(9, 10) < RHO < 1
# Optional s-dependent radius input ("rho_table": a file beside game.json, format of radius/rho_table_N.json): rows
# [s_lo, s_hi, B_lo, B_hi]; for q in H_{2,1}, ||q||_2 = 1, s = E|q|^4 - 2 in [s_lo, s_hi]:
#     E|q| <= (1 - th) B_lo + th B_hi,  th = (s - s_lo)/(s_hi - s_lo)
# (the row bound is convex in s and <= B at both ends; certificate N of radius-relaxation-2026-11-16, P + C, reviewed).
# The rows must be contiguous from 0 to 42 (s <= 42 is the Lean bound E|q|^4 <= 44).
RHO_ROWS = None
if CFG.get('rho_table'):
    _t = json.load(open(os.path.join(os.path.dirname(os.path.abspath(_PATH)), CFG['rho_table'])))
    RHO_ROWS = [tuple(F(x) for x in r) for r in _t['rows']]
    assert RHO_ROWS[0][0] == 0 and RHO_ROWS[-1][1] == 42 and all(RHO_ROWS[i][1] == RHO_ROWS[i + 1][0] for i in range(len(RHO_ROWS) - 1))
    assert all(a < b and 0 < bl <= RHO and 0 < bh <= RHO for a, b, bl, bh in RHO_ROWS), 'the table must not exceed the constant rho'
def rho_on_s(s_a, s_b):
    """exact upper bound of the radius input on laws with s in [s_a, s_b] (0 <= s_a <= s_b): the largest chord value
    over the rows that meet the interval (a chord is linear, so its maximum on a piece is at an end); RHO without a table."""
    assert 0 <= s_a <= s_b
    if RHO_ROWS is None: return RHO
    s_b = min(s_b, F(42)); s_a = min(s_a, s_b)
    vals = []
    for a, b, bl, bh in RHO_ROWS:
        lo, hi = max(a, s_a), min(b, s_b)
        if lo > hi: continue
        if lo == hi and s_a != s_b: continue      # the row meets the interval in one point; the neighbouring row covers it
        vals.append(max(bl + (bh - bl) * (s - a) / (b - a) for s in (lo, hi)))
    assert vals
    best = min(vals) if s_a == s_b else max(vals)     # a single point: every row that contains it applies
    assert best <= RHO
    return best
def rho_on_x(x_a, x_b):
    """the same for x = sqrt(s) in [x_a, x_b] (the law-layer boxes use x = sqrt(m - 2))."""
    return rho_on_s(x_a * x_a, x_b * x_b)
def nu_nodes():
    lo, hi, st = (F(x) for x in NUFINE.split(':'))
    fine = [lo + k * st for k in range(int((hi - lo) / st) + 1)]
    coarse = [F(x) for x in NUCOARSE.split(',')]
    allv = sorted(set(fine + coarse))
    assert allv[0] <= -ETA and allv[-1] >= ETA, 'the nu-nodes must cover [-eta, eta]'
    return fine, coarse
