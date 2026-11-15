# claude-b9ee: independent re-implementation of the 4d8a exterior cover (EXTERIOR_PROOF.md), written from the proof
# note, reading the 19 rows directly from the repository's Lean row files. Exact rationals throughout.
import re, sys
from fractions import Fraction as F
from pathlib import Path
repo = Path(sys.argv[1])
rows = []
for p in sorted((repo / 'Grothe/Lower').glob('RowData[0-9][0-9].lean')):
    s = p.read_text()
    body = s.split(': Row :=', 1)[1]
    nums = re.findall(r'\((\d+) : ℚ\)(?:\s*/\s*(\d+))?', body)[:6]
    ell, beta, cap = (F(int(nums[i][0]), int(nums[i][1] or 1)) for i in (0, 1, 5))
    rows.append((p.name, ell, beta, cap))
assert len(rows) == 19, len(rows)
e0, e = F(149, 200), F(299, 400); d = e - e0; pad = F(1, 10**11)
rho = F(973612157, 10**9); A = F(886762780, 10**9); B = F(432306903, 10**9)
PI = F(314159266, 10**8)                 # > pi = 3.14159265358979...
target = F(713263, 10**6)
assert (F(1773, 2000))**2 > PI / 4       # the cells reach past sqrt(pi)/2
def rowmax(ell, beta, cap, lo, hi, branch):
    def f(t):
        base = t*t - 2*ell*t + 2*beta*beta/e + cap + pad
        return base + d*rho*rho if branch == 'rad' else base + d*(F(3, 2)*(PI/4 - t*t) + B*(A - t))
    return max(f(lo), f(hi))              # both branches are convex quadratics (leading 1 and 1 - 3d/2 > 0)
bad, need_energy, worst = [], 0, F(0)
for j in range(1773):
    lo, hi = F(j, 2000), F(j + 1, 2000)
    crude = hi*hi + e*rho*rho
    rad = min([crude] + [rowmax(l, b, c, lo, hi, 'rad') for _, l, b, c in rows])
    en = min(rowmax(l, b, c, lo, hi, 'en') for _, l, b, c in rows)
    cap = min(rad, en)
    if cap < target:
        worst = max(worst, cap)
        if rad >= target: need_energy += 1
    else:
        bad.append(j)
gaps = []
for j in bad:
    if gaps and gaps[-1][1] == j - 1: gaps[-1][1] = j
    else: gaps.append([j, j])
print('rows read from repo:', len(rows))
print('uncovered cells j (cell = [j/2000,(j+1)/2000]):', [(F(a, 2000), F(b + 1, 2000)) for a, b in gaps])
print('accepted cells:', 1773 - len(bad), '| of which need the response-energy branch (3):', need_energy)
print('max accepted cap:', float(worst), '< 713263/10^6:', worst < target, '< 500/701:', target < F(500, 701))
