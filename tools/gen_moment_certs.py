#!/usr/bin/env python3
"""Generate the rational certificates of the cubic-chaos moment constants.

Writes
  Grothe/LowerAnalytic/Moments.lean          (C6, rho, first-moment Bernstein leaves)
  Grothe/LowerAnalytic/SixthMomentData.lean  (line majorants, scalar polynomials, covers)

Usage:  python3 -I tools/gen_moment_certs.py [ARCHIVE_DIR]
ARCHIVE_DIR defaults to handoff/lower-v4 and must contain data/first-moment.json and
data/correlated-scalar-certificate.json.  Every polynomial, Bernstein coefficient and cover is
recomputed here in exact rational arithmetic; the archive data are only compared against the
recomputation (polynomials, saved minima, cover paths).
"""
import json
import random
import sys
from fractions import Fraction as Q
from math import comb
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
ARCH = Path(sys.argv[1]).resolve() if len(sys.argv) > 1 else ROOT / 'handoff' / 'lower-v4'
OUT = ROOT / 'Grothe' / 'LowerAnalytic'

C6 = Q(81641, 2000)
RHO = Q(19476417, 20000000)

# ---------------------------------------------------------------- univariate helpers
def add(*ps):
    out = [Q(0)] * max(map(len, ps))
    for p in ps:
        for i, v in enumerate(p):
            out[i] += v
    return out
def scale(p, a): return [a * v for v in p]
def mul(p, q):
    out = [Q(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            out[i + j] += a * b
    return out
def power(p, n):
    out = [Q(1)]
    for _ in range(n):
        out = mul(out, p)
    return out
def ev(p, x): return sum((c * x ** i for i, c in enumerate(p)), Q(0))
def trim(p):
    p = list(p)
    while len(p) > 1 and p[-1] == 0:
        p.pop()
    return p

def bern1(c, n, l, h):
    """Bernstein coefficients exactly as `bern1` in Bernstein2.lean."""
    a = [(h - l) ** k * sum((c[j] * comb(j, k) * l ** (j - k) for j in range(k, n + 1)), Q(0))
         for k in range(n + 1)]
    return [sum((a[k] * Q(comb(m, k), comb(n, k)) for k in range(m + 1)), Q(0)) for m in range(n + 1)]

# ---------------------------------------------------------------- bivariate helpers
def padd(*ps):
    r = {}
    for p in ps:
        for k, v in p.items():
            r[k] = r.get(k, Q(0)) + v
    return {k: v for k, v in r.items() if v}
def psc(p, s): return {k: v * s for k, v in p.items() if v * s}
def pmul(p, q):
    r = {}
    for (i, j), x in p.items():
        for (k, l), y in q.items():
            r[i + k, j + l] = r.get((i + k, j + l), Q(0)) + x * y
    return {k: v for k, v in r.items() if v}
def ppow(p, n):
    r = {(0, 0): Q(1)}
    for _ in range(n):
        r = pmul(r, p)
    return r
def pev(p, x, y): return sum((v * x ** i * y ** j for (i, j), v in p.items()), Q(0))
def dense(p):
    nx = max(i for i, j in p); ny = max(j for i, j in p)
    return [[p.get((i, j), Q(0)) for j in range(ny + 1)] for i in range(nx + 1)], nx, ny

def bern2(M, nx, ny, xl, xh, yl, yh):
    """Tensor Bernstein coefficients exactly as `bern2` in Bernstein2.lean: `B[m][m']`."""
    T = [bern1([M[k][j] for k in range(nx + 1)], nx, xl, xh) for j in range(ny + 1)]
    return [bern1([T[j][m] for j in range(ny + 1)], ny, yl, yh) for m in range(nx + 1)]

def check_tree(M, nx, ny, tree, box):
    """Replay `coverOK`; return (leaves, list of (box, min coefficient))."""
    xl, xh, yl, yh = box
    if tree == 'leaf':
        assert xl < xh and yl < yh
        b = bern2(M, nx, ny, xl, xh, yl, yh)
        mn = min(v for row in b for v in row)
        assert mn > 0, (box, mn)
        return [(box, mn)]
    ax, l, r = tree
    if ax == 'X':
        mid = (xl + xh) / 2
        return check_tree(M, nx, ny, l, (xl, mid, yl, yh)) + check_tree(M, nx, ny, r, (mid, xh, yl, yh))
    mid = (yl + yh) / 2
    return check_tree(M, nx, ny, l, (xl, xh, yl, mid)) + check_tree(M, nx, ny, r, (xl, xh, mid, yh))

def tree_from_paths(paths, axis_of_depth):
    paths = set(paths)
    def build(prefix):
        if prefix in paths:
            return 'leaf'
        assert any(p.startswith(prefix + '0') for p in paths) and any(p.startswith(prefix + '1') for p in paths)
        return (axis_of_depth(len(prefix)), build(prefix + '0'), build(prefix + '1'))
    return build('')

def adaptive_tree(M, nx, ny, box, xscale, depth=0):
    xl, xh, yl, yh = box
    b = bern2(M, nx, ny, xl, xh, yl, yh)
    if min(v for row in b for v in row) > 0:
        return 'leaf'
    assert depth < 60
    if (xh - xl) / xscale >= (yh - yl):
        m = (xl + xh) / 2
        return ('X', adaptive_tree(M, nx, ny, (xl, m, yl, yh), xscale, depth + 1),
                adaptive_tree(M, nx, ny, (m, xh, yl, yh), xscale, depth + 1))
    m = (yl + yh) / 2
    return ('Y', adaptive_tree(M, nx, ny, (xl, xh, yl, m), xscale, depth + 1),
            adaptive_tree(M, nx, ny, (xl, xh, m, yh), xscale, depth + 1))

def tree_lean(tree):
    if tree == 'leaf':
        return '.leaf'
    ax, l, r = tree
    return f"(.split{ax} {tree_lean(l)} {tree_lean(r)})"

# ---------------------------------------------------------------- Lean formatting
def qr(x):
    x = Q(x)
    return f"({x.numerator} : ℝ)" if x.denominator == 1 else f"({x.numerator} / {x.denominator} : ℝ)"
def qq(x):
    x = Q(x)
    return f"{x.numerator}" if x.denominator == 1 else f"{x.numerator}/{x.denominator}"
def mat_lean(M):
    rows = ["[" + ", ".join(qq(v) for v in row) + "]" for row in M]
    return "[" + ",\n    ".join(rows) + "]"

# ================================================================ sixth moment data
LINES = {  # rational affine majorants `c0 + c1 * x`
    'a': (Q('1.071025638618982'), Q('-1.805693552047514')),
    'b': (Q('1.063496608299650'), Q('-1.540111813698400')),
    'c': (Q('0.914114528237782'), Q('0.118174743921454')),
    'u': (Q('0.895600498452505'), Q('0.257742205086459')),
    'N': (Q('1.004044955488095'), Q('0.095971061993764')),
}
THETA = Q(-1, 10); R0 = Q(151, 160); LAM = Q(739, 2500)
YLO = Q(409, 500); YHI = Q('0.974021534012')
AA = Q('0.891132788680'); BB = Q('0.912870929176'); CC = Q('0.953462589246'); DD = Q('0.955442792205')
assert YHI * YHI > Q(37, 39) and 0 < YLO < YHI < 1
assert AA * AA > Q(27, 34) and BB * BB > Q(5, 6) and CC * CC > Q(10, 11) and DD * DD > BB
assert THETA * THETA - 2 * THETA == Q(21, 100)
TARGETS = {  # (target polynomial, power k, domain end); certified: L^k - target > 0 on [0, end]
    'a': ([Q(0), Q(81, 4), Q(-153), Q(289)], 2, Q(1, 6)),
    'b': ([Q(1, 2), Q(8), Q(-48)], 2, Q(1, 6)),
    'c': ([Q(2, 3), Q(4, 3), Q(-11, 6)], 2, Q(1, 2)),
    'u': ([Q(1, 2), Q(3, 2), Q(0), Q(-2)], 4, Q(1, 2)),
    'N': ([Q(1), Q(21, 100)], 2, Q(1)),
}
assert TARGETS['a'][0] == mul([Q(0), Q(1)], power([Q(9, 2), Q(-17)], 2))
assert TARGETS['u'][0] == scale(mul(power([Q(1), Q(2)], 2), [Q(1), Q(-1)]), Q(1, 2))
for name, (c0, c1) in LINES.items():
    assert c0 > 0 and c0 + c1 * TARGETS[name][2] > 0
assert LINES['a'][1] < 0 and LINES['b'][1] < 0 and LINES['c'][1] > 0 and LINES['u'][1] > 0 and LINES['N'][1] > 0

cert = json.loads((ARCH / 'data' / 'correlated-scalar-certificate.json').read_text())
assert Q(cert['C6']) == C6
uni_out = {}
for case, name in zip(cert['univariate'], ['a', 'b', 'c', 'u', 'N']):
    tgt, k, end = TARGETS[name]
    gap = trim(add(power(list(LINES[name]), k), scale(tgt, -1)))
    assert list(map(Q, case['polynomial'])) == gap, name
    assert list(map(Q, case['domain'])) == [Q(0), end]
    tree = tree_from_paths([r['path'] for r in case['leaves']], lambda d: 'X')
    M = [[v] for v in gap]; nx = len(gap) - 1
    leaves = check_tree(M, nx, 0, tree, (Q(0), end, Q(0), Q(1)))
    saved = {(Q(r['interval'][0]), Q(r['interval'][1])): Q(r['minimum_bernstein']) for r in case['leaves']}
    assert len(saved) == len(leaves)
    for (xl, xh, _, _), mn in leaves:
        assert saved[(xl, xh)] == mn
    uni_out[name] = (M, nx, tree, end, len(leaves))
print('univariate leaves', {k: v[4] for k, v in uni_out.items()}, sum(v[4] for v in uni_out.values()))

# high range polynomials in (y, w)
def tline_y2(name):  # y^2 * L(t_lambda)
    c0, c1 = LINES[name]
    return padd({(2, 0): c0 + (7 - LAM) * c1 / 48, (0, 1): c1 * (8 + 6 * LAM) / 144, (0, 0): -(7 - LAM) * c1 / 144})
Y = {(1, 0): Q(1)}; Y2 = {(2, 0): Q(1)}
U = {(0, 0): LINES['u'][0], (0, 1): LINES['u'][1]}
CL = {(0, 0): LINES['c'][0], (0, 1): LINES['c'][1]}
NL = {(0, 0): LINES['N'][0], (2, 0): LINES['N'][1]}
LaY = tline_y2('a'); LbY = tline_y2('b')
Dpoly = padd(psc(pmul(LaY, Y), Q(165, 4) * THETA / R0), psc(pmul(LbY, NL), Q(165, 4) / R0),
             psc(Y2, Q(165, 4) * R0), psc(pmul(U, Y), Q(-40)))
Ka = padd(psc(Y2, Q(135, 2) + 45 * THETA), psc(pmul(U, Y), Q(165, 4) * THETA / R0))
Kb = padd(psc(Y, Q(45)), psc(U, Q(165, 4) / R0))
Qp = padd(pmul(LaY, Ka), pmul(pmul(LbY, NL), Kb), psc(pmul(CL, Y2), Q(135, 2)),
          psc(pmul(pmul(U, U), Y), Q(-20)), psc(pmul(U, Y2), Q(165, 4) * R0))
DEN = {(0, 0): Q(1), (2, 0): Q(3, 2)}
Gpoly = padd(psc(pmul(Y2, ppow(DEN, 3)), C6 ** 2), psc(pmul(Qp, Qp), -Q(27, 50)))
# low range polynomial in (y, u)
Pold = {(3, 0): Q(135, 2) * AA, (2, 0): 45 * BB, (1, 0): Q(135, 2) * CC, (0, 2): Q(-20), (1, 1): Q(165, 2) * DD}
Lpoly = padd(psc(ppow(DEN, 3), C6 ** 2), psc(pmul(Pold, Pold), -Q(27, 50)))

# sanity: polynomial expressions agree with their symbolic definitions at random points
def Lval(name, x): return LINES[name][0] + LINES[name][1] * x
for _ in range(20):
    y = Q(random.randint(1, 999), 1000); w = Q(random.randint(0, 999), 1000); u = Q(random.randint(0, 999), 1000)
    tl = (7 - LAM) * (3 * y * y - 1) + (8 + 6 * LAM) * w
    lay = LINES['a'][0] * y * y + LINES['a'][1] * tl / 144
    lby = LINES['b'][0] * y * y + LINES['b'][1] * tl / 144
    assert pev(LaY, y, w) == lay and pev(LbY, y, w) == lby
    lu = Lval('u', w)
    kay = (Q(135, 2) + 45 * THETA) * y * y + 165 * THETA / (4 * R0) * lu * y
    kby = 45 * y + 165 / (4 * R0) * lu
    qh = kay * lay + kby * Lval('N', y * y) * lby + Q(135, 2) * Lval('c', w) * y * y - 20 * lu * lu * y + Q(165, 4) * R0 * lu * y * y
    assert pev(Qp, y, w) == qh
    dh = 165 * THETA / (4 * R0) * y * lay + 165 / (4 * R0) * Lval('N', y * y) * lby + Q(165, 4) * R0 * y * y - 40 * y * lu
    assert pev(Dpoly, y, w) == dh
    po = Q(135, 2) * AA * y ** 3 + 45 * BB * y ** 2 + Q(135, 2) * CC * y - 20 * u * u + Q(165, 2) * DD * y * u
    assert pev(Lpoly, y, u) == C6 ** 2 * (1 + Q(3, 2) * y * y) ** 3 - Q(27, 50) * po * po

biv_out = {}
for case, name, poly in zip(cert['bivariate_cases'], ['deriv', 'high'], [Dpoly, Gpoly]):
    assert {(i, j): Q(v) for i, j, v in case['polynomial']} == poly, name
    assert list(map(Q, case['domain'])) == [YLO, YHI, Q(0), Q(1, 2)]
    tree = tree_from_paths([r['path'] for r in case['leaves']], lambda d: 'X' if d % 2 == 0 else 'Y')
    M, nx, ny = dense(poly)
    leaves = check_tree(M, nx, ny, tree, (YLO, YHI, Q(0), Q(1, 2)))
    saved = {tuple(map(Q, r['box'])): Q(r['minimum_bernstein']) for r in case['leaves']}
    assert len(saved) == len(leaves)
    for box, mn in leaves:
        assert saved[box] == mn
    biv_out[name] = (M, nx, ny, tree, len(leaves))
M, nx, ny = dense(Lpoly)
tree = adaptive_tree(M, nx, ny, (Q(0), YLO, Q(0), Q(1)), YLO)
biv_out['low'] = (M, nx, ny, tree, len(check_tree(M, nx, ny, tree, (Q(0), YLO, Q(0), Q(1)))))
print('bivariate leaves', {k: v[4] for k, v in biv_out.items()})

# ================================================================ first moment data
fm = json.loads((ARCH / 'data' / 'first-moment.json').read_text())
assert Q(fm['C6']) == C6 and Q(fm['rho']) == RHO
mP = [Q(2), Q(0), Q(1)]; nP = [Q(6), Q(0), Q(9), C6]
q1 = add(nP, scale(mul(mP, mP), Q(-1)))
Up = add(scale(nP, RHO * RHO - 1), mul(mP, mP), scale(mP, -RHO * RHO - 1), [Q(1)])
gap8 = add(mul(Up, Up), scale(mul(q1, add(mP, [Q(-1)])), -4 * (1 - RHO * RHO) ** 2))
FM_POLY = {'q1poly': q1, 'Upoly': Up, 'gap8': gap8}
FM_KEY = {'q1poly': 'beta_positive', 'Upoly': 'unsquared_sign', 'gap8': 'squared_gap'}
FM_END = Q(31, 4)
assert FM_END ** 2 > 60
def fm_leaves(name):
    p = FM_POLY[name]; c = fm['certificates'][FM_KEY[name]]
    assert list(map(Q, c['polynomial'])) == p, name
    leaves = []; right = Q(0)
    for lo, hi, saved in c['cells']:
        lo, hi, saved = Q(lo), Q(hi), Q(saved)
        assert lo == right and lo < hi
        cs = bern1(p, len(p) - 1, lo, hi)
        assert min(cs) == saved and saved > 0
        leaves.append((lo, hi, cs)); right = hi
    assert right == FM_END
    return leaves

def leaf_lemma(name, unfold, var, deg, idx, l, h, cs):
    c = min(cs)
    for _ in range(3):
        s = Q(random.randint(0, 97), 97); x = l + (h - l) * s
        assert ev(FM_POLY[name], x) == sum(b * comb(deg, k) * s ** k * (1 - s) ** (deg - k) for k, b in enumerate(cs))
    T = []
    for k in range(deg + 1):
        if k == 0: T.append(f"(1 - s) ^ {deg}")
        elif k == deg: T.append(f"s ^ {deg}")
        else:
            sk = "s" if k == 1 else f"s ^ {k}"
            T.append(f"{comb(deg, k)} * {sk} * (1 - s) ^ {deg - k}")
    L = [f"lemma {name}_leaf{idx} ({var} : ℝ) (hl : {qr(l)} ≤ {var}) (hh : {var} ≤ {qr(h)}) :",
         f"    {qr(c)} ≤ {name} {var} := by",
         f"  obtain ⟨s, hs0, hs1, hv⟩ := exists_param hl hh (by norm_num)",
         f"  have h1s : (0 : ℝ) ≤ 1 - s := by linarith"]
    for k, t in enumerate(T):
        L.append(f"  have T{k} : (0 : ℝ) ≤ {t} := by positivity")
    L.append("  subst hv")
    L.append(f"  simp only [{unfold}]")
    hints = ", ".join(f"mul_nonneg (show (0 : ℝ) ≤ {qr(b)} - {qr(c)} by norm_num) T{k}" for k, b in enumerate(cs))
    L.append(f"  linarith [{hints}]")
    return "\n".join(L) + "\n\n", c

def pos_theorem(name, var, hi, leaves):
    out = [f"theorem {name}_pos ({var} : ℝ) (h0 : 0 ≤ {var}) (h1 : {var} ≤ {qr(hi)}) : 0 < {name} {var} := by"]
    prev = "h0"
    for i, (l, h, c) in enumerate(leaves):
        if i < len(leaves) - 1:
            out.append(f"  rcases le_or_gt {var} {qr(h)} with hA{i} | hA{i}")
            out.append(f"  · exact lt_of_lt_of_le (by norm_num) ({name}_leaf{i} {var} {prev} hA{i})")
            prev = f"hA{i}.le"
        else:
            out.append(f"  exact lt_of_lt_of_le (by norm_num) ({name}_leaf{i} {var} {prev} h1)")
    return "\n".join(out) + "\n\n"

MOMENTS_HEADER = '''import Grothe.LowerAnalytic.MomentLemma
import Grothe.LowerAnalytic.Bernstein2

/-!
# The cubic-moment constants `C₆` and `ρ`

Generated by `tools/gen_moment_certs.py` (exact rationals); do not edit.

For a normalized complex Gaussian cubic chaos `q` (`E|q|² = 1`) with `m = E|q|⁴ = 2 + x²`,
`0 ≤ x ≤ 31/4`, the lower-bound argument uses

* the sixth-moment bound `E|q|⁶ ≤ 9m − 12 + C₆ (m − 2)^{3/2} = 6 + 9x² + C₆ x³` with
  `C₆ = 81641/2000 = 40.8205` (`SixthMoment.lean`), and
* the first-moment bound `E|q| < ρ = 19476417/20000000 = 0.97382085`, obtained from the
  three-moment lemma (`moment_lemma`) applied to `Z = |q|²` and the positivity of `N − m²`, `U`,
  `U² − 4(1−ρ²)²(N−m²)(m−1)` on `[0, 31/4]` (`q1poly_pos`, `Upoly_pos`, `gap8_pos`), giving
  `first_moment_lt_rho`.

Each positivity statement is proved on a subdivision of the interval: on every leaf `[l, h]`
the polynomial is rewritten in the Bernstein basis of `s = (x − l)/(h − l) ∈ [0, 1]`; since
the Bernstein basis functions are nonnegative and sum to one, the polynomial is at least its
smallest Bernstein coefficient, which is positive.  `linarith` verifies the Bernstein identity
from the nonnegativity of the basis terms.  The square-root signs (`N − m² > 0`, `U > 0`) are
established before the squared inequality is used.
-/

namespace Grothe.LowerAnalytic

noncomputable section

/-- `C₆ = 81641/2000 = 40.8205`. -/
def C6 : ℝ := 81641 / 2000
/-- `ρ = 19476417/20000000 = 0.97382085`. -/
def rhoC : ℝ := 19476417 / 20000000
/-- `m = 2 + x²`. -/
def mX (x : ℝ) : ℝ := 2 + x ^ 2
/-- `N = 6 + 9x² + C₆ x³`. -/
def nX (x : ℝ) : ℝ := 6 + 9 * x ^ 2 + C6 * x ^ 3
/-- `N − m²`. -/
def q1poly (x : ℝ) : ℝ := nX x - mX x ^ 2
/-- `U = ρ²(N−m) − (m−1) − (N−m²)`. -/
def Upoly (x : ℝ) : ℝ := rhoC ^ 2 * (nX x - mX x) - (mX x - 1) - (nX x - mX x ^ 2)
/-- `U² − 4(1−ρ²)²(N−m²)(m−1)`. -/
def gap8 (x : ℝ) : ℝ := Upoly x ^ 2 - 4 * (1 - rhoC ^ 2) ^ 2 * q1poly x * (mX x - 1)

'''

MOMENTS_FOOTER = '''/-- The consequence of `Upoly_pos` and `gap8_pos`: with `α = (N−m)/(m−1)`, `β = (N−m²)/(m−1)`,
`(1 + √β)² < ρ² (α + 2√β)` for `0 ≤ x ≤ 31/4`. -/
theorem contact_ineq (x : ℝ) (h0 : 0 ≤ x) (h1 : x ≤ 31 / 4) :
    (1 + √((nX x - mX x ^ 2) / (mX x - 1))) ^ 2
      < rhoC ^ 2 * ((nX x - mX x) / (mX x - 1) + 2 * √((nX x - mX x ^ 2) / (mX x - 1))) := by
  have hq : 0 < nX x - mX x ^ 2 := q1poly_pos x h0 h1
  have hU : 0 < Upoly x := Upoly_pos x h0 h1
  have hg := gap8_pos x h0 h1
  have hm1 : 0 < mX x - 1 := by unfold mX; nlinarith [sq_nonneg x]
  have hr : 0 < 1 - rhoC ^ 2 := by unfold rhoC; norm_num
  obtain ⟨g, hg0, hg2⟩ : ∃ g : ℝ, 0 ≤ g ∧ g ^ 2 = (nX x - mX x ^ 2) * (mX x - 1) :=
    ⟨√((nX x - mX x ^ 2) * (mX x - 1)), Real.sqrt_nonneg _, Real.sq_sqrt (mul_pos hq hm1).le⟩
  have hUg : 2 * (1 - rhoC ^ 2) * g < Upoly x := by
    apply lt_of_pow_lt_pow_left₀ 2 hU.le
    unfold gap8 q1poly at hg
    nlinarith [hg2]
  obtain ⟨t, ht⟩ : ∃ t : ℝ, t = g / (mX x - 1) := ⟨_, rfl⟩
  have hgt : g = t * (mX x - 1) := by rw [ht]; field_simp
  have hsb : √((nX x - mX x ^ 2) / (mX x - 1)) = t := by
    rw [Real.sqrt_eq_iff_mul_self_eq (by positivity) (by rw [ht]; positivity)]
    rw [div_eq_iff hm1.ne']
    nlinarith [hg2, hgt]
  rw [hsb]
  unfold Upoly at hUg
  rw [hgt] at hUg hg2
  have key : (1 + t) ^ 2 * (mX x - 1) < rhoC ^ 2 * ((nX x - mX x) + 2 * t * (mX x - 1)) := by
    nlinarith [hg2, hUg]
  have e : rhoC ^ 2 * ((nX x - mX x) / (mX x - 1) + 2 * t)
      = rhoC ^ 2 * ((nX x - mX x) + 2 * t * (mX x - 1)) / (mX x - 1) := by
    field_simp
  rw [e, lt_div_iff₀ hm1]
  exact key

/-- Hence the moment-lemma bound is uniformly below `ρ`:
`(1 + √β) / √(α + 2√β) < ρ`. -/
theorem moment_bound_lt_rho (x : ℝ) (h0 : 0 ≤ x) (h1 : x ≤ 31 / 4) :
    (1 + √((nX x - mX x ^ 2) / (mX x - 1)))
      / √((nX x - mX x) / (mX x - 1) + 2 * √((nX x - mX x ^ 2) / (mX x - 1))) < rhoC := by
  have hc := contact_ineq x h0 h1
  have hρ : 0 < rhoC := by unfold rhoC; norm_num
  have hm1 : 0 < mX x - 1 := by unfold mX; nlinarith [sq_nonneg x]
  have hq := q1poly_pos x h0 h1
  unfold q1poly at hq
  have hβ : 0 < (nX x - mX x ^ 2) / (mX x - 1) := div_pos hq hm1
  have hnm : 0 < nX x - mX x := by
    have : 1 < mX x := by unfold mX; nlinarith
    nlinarith
  have hα : 0 < (nX x - mX x) / (mX x - 1) + 2 * √((nX x - mX x ^ 2) / (mX x - 1)) :=
    add_pos (div_pos hnm hm1) (mul_pos two_pos (Real.sqrt_pos.2 hβ))
  rw [div_lt_iff₀ (Real.sqrt_pos.2 hα)]
  have e : rhoC * √((nX x - mX x) / (mX x - 1) + 2 * √((nX x - mX x ^ 2) / (mX x - 1)))
      = √(rhoC ^ 2 * ((nX x - mX x) / (mX x - 1) + 2 * √((nX x - mX x ^ 2) / (mX x - 1)))) := by
    rw [Real.sqrt_mul (sq_nonneg _), Real.sqrt_sq hρ.le]
  rw [e, Real.lt_sqrt (by positivity)]
  exact hc

/-- **The first-moment bound.**  If `Z ≥ 0` (`Z = |q|²`) has `E Z = 1`, `E Z² = 2 + x²` and
`E Z³ ≤ 6 + 9x² + C₆ x³` with `0 ≤ x ≤ 31/4`, then `E √Z < ρ = 0.97382085`. -/
theorem first_moment_lt_rho {Ω : Type*} [MeasurableSpace Ω] (μ : MeasureTheory.Measure Ω)
    [MeasureTheory.IsProbabilityMeasure μ] (Z : Ω → ℝ) (hZ : ∀ ω, 0 ≤ Z ω)
    (hZ1 : MeasureTheory.Integrable Z μ) (hZ2 : MeasureTheory.Integrable (fun ω => Z ω ^ 2) μ)
    (hZ3 : MeasureTheory.Integrable (fun ω => Z ω ^ 3) μ)
    (x : ℝ) (h0 : 0 ≤ x) (h1 : x ≤ 31 / 4)
    (hm1 : ∫ ω, Z ω ∂μ = 1) (hm2 : ∫ ω, Z ω ^ 2 ∂μ = mX x) (hm3 : ∫ ω, Z ω ^ 3 ∂μ ≤ nX x) :
    ∫ ω, √(Z ω) ∂μ < rhoC := by
  have hm : 1 < mX x := by unfold mX; nlinarith [sq_nonneg x]
  have hN : mX x ^ 2 < nX x := by
    have := q1poly_pos x h0 h1
    unfold q1poly at this; linarith
  exact lt_of_le_of_lt (moment_lemma μ Z hZ hZ1 hZ2 hZ3 (mX x) (nX x) hm1 hm2 hm3 hm hN)
    (moment_bound_lt_rho x h0 h1)

end

end Grothe.LowerAnalytic
'''

def gen_moments():
    body = []
    specs = [('q1poly', 'q1poly, nX, mX, C6', 'x', 4),
             ('Upoly', 'Upoly, nX, mX, C6, rhoC', 'x', 4),
             ('gap8', 'gap8, Upoly, q1poly, nX, mX, C6, rhoC', 'x', 8)]
    for name, unfold, var, deg in specs:
        leaves = fm_leaves(name)
        assert all(len(cs) == deg + 1 for _, _, cs in leaves)
        lf = []
        for i, (l, h, cs) in enumerate(leaves):
            txt, c = leaf_lemma(name, unfold, var, deg, i, l, h, cs); body.append(txt); lf.append((l, h, c))
        body.append(pos_theorem(name, var, FM_END, lf))
        print(name, 'leaves', len(leaves))
    (OUT / 'Moments.lean').write_text(MOMENTS_HEADER + "".join(body) + MOMENTS_FOOTER)

# ---------------------------------------------------------------- SixthMomentData.lean
def gen_data():
    L = []
    w = L.append
    w('''import Grothe.LowerAnalytic.Bernstein2
import Grothe.LowerAnalytic.Moments

/-!
# Scalar data of the sixth-moment certificate

Generated by `tools/gen_moment_certs.py` (exact rationals); do not edit.

* Five rational affine majorants (`La`, `Lb`, `Lc`, `Lu`, `LN`) of `√t (9/2 − 17t)`,
  `√(1/2 + 8t − 48t²)` on `t ∈ [0, 1/6]`, `√(2/3 + 4w/3 − 11w²/6)`,
  `((1+2w)²(1−w)/2)^{1/4}` on `w ∈ [0, 1/2]`, and `√(1 + (21/100) x)` on `x ∈ [0, 1]`; each is
  certified by positive Bernstein coefficients of `L^k − target` on a subdivision of its domain.
* The scalar polynomials of the high range `y ∈ [409/500, yHi]`, `w ∈ [0, 1/2]`: the
  `u`-derivative `Dhat` (monotonicity in `u`) and the squared terminal gap `highGap`, and the
  terminal gap `lowGap` of the low range `y ∈ [0, 409/500]`, `u ∈ [0, 1]`, each with a dense
  coefficient matrix, a subdivision tree checked by `coverOK`, and the identity between the
  matrix and the symbolic polynomial.

The parameters are `θ = −1/10` (Cauchy–Schwarz against `C − θS`), `r₀ = 151/160` (tangent of
`√v`) and the blend `λ = 739/2500` of the two lower bounds on the neutral-block mass `t`.
-/

namespace Grothe.LowerAnalytic

open Grothe.Lower

noncomputable section
''')
    names = {'a': 'La', 'b': 'Lb', 'c': 'Lc', 'u': 'Lu', 'N': 'LN'}
    desc = {'a': '`√t (9/2 − 17t)` on `[0, 1/6]`', 'b': '`√(1/2 + 8t − 48t²)` on `[0, 1/6]`',
            'c': '`√(2/3 + 4w/3 − 11w²/6)` on `[0, 1/2]`', 'u': '`((1+2w)²(1−w)/2)^{1/4}` on `[0, 1/2]`',
            'N': '`√(1 + (21/100) x)` on `[0, 1]`'}
    for k, nm in names.items():
        c0, c1 = LINES[k]
        w(f"/-- Affine majorant of {desc[k]}. -/\ndef {nm} (x : ℝ) : ℝ := {qr(c0)} + {qr(c1)} * x\n")
    w(f'''/-- `θ = −1/10`. -/
def thetaC : ℝ := -1 / 10
/-- `r₀ = 151/160`. -/
def r0C : ℝ := 151 / 160
/-- `λ = 739/2500`. -/
def lamC : ℝ := 739 / 2500
/-- `144 y² t_λ = (7 − λ)(3y² − 1) + (8 + 6λ) w`. -/
def tlam (y w : ℝ) : ℝ := (7 - lamC) * (3 * y ^ 2 - 1) + (8 + 6 * lamC) * w
/-- `y² La(t_λ)`. -/
def LaY (y w : ℝ) : ℝ := {qr(LINES['a'][0])} * y ^ 2 + {qr(LINES['a'][1])} * tlam y w / 144
/-- `y² Lb(t_λ)`. -/
def LbY (y w : ℝ) : ℝ := {qr(LINES['b'][0])} * y ^ 2 + {qr(LINES['b'][1])} * tlam y w / 144
/-- Combined coefficient of `tr S³` (divided by `y`). -/
def KaY (y u : ℝ) : ℝ := (135 / 2 + 45 * thetaC) * y ^ 2 + 165 * thetaC / (4 * r0C) * u * y
/-- Combined coefficient of `√(tr S⁴)` (divided by `y`). -/
def KbY (y u : ℝ) : ℝ := 45 * y + 165 / (4 * r0C) * u
/-- `y · Pbar(y, w, u)`: the high-range polynomial majorant of `y · P`. -/
def Qhat (y w u : ℝ) : ℝ :=
  KaY y u * LaY y w + KbY y u * LN (y ^ 2) * LbY y w + 135 / 2 * Lc w * y ^ 2 - 20 * u ^ 2 * y
    + 165 / 4 * r0C * u * y ^ 2
/-- `y · ∂Pbar/∂u` at `u = Lu(w)`. -/
def Dhat (y w : ℝ) : ℝ :=
  165 * thetaC / (4 * r0C) * y * LaY y w + 165 / (4 * r0C) * LN (y ^ 2) * LbY y w
    + 165 / 4 * r0C * y ^ 2 - 40 * y * Lu w
/-- The squared terminal gap of the high range. -/
def highGap (y w : ℝ) : ℝ := C6 ^ 2 * y ^ 2 * (1 + 3 / 2 * y ^ 2) ^ 3 - 27 / 50 * Qhat y w (Lu w) ^ 2
/-- Uniform bounds of the low range: `aa > √(27/34)`, `bb > √(5/6)`, `cc > √(10/11)`,
`dd > √bb`. -/
def aaC : ℝ := {qr(AA)}
/-- See `aaC`. -/
def bbC : ℝ := {qr(BB)}
/-- See `aaC`. -/
def ccC : ℝ := {qr(CC)}
/-- See `aaC`. -/
def ddC : ℝ := {qr(DD)}
/-- The low-range majorant of `P`. -/
def Plow (y u : ℝ) : ℝ :=
  135 / 2 * aaC * y ^ 3 + 45 * bbC * y ^ 2 + 135 / 2 * ccC * y - 20 * u ^ 2 + 165 / 2 * ddC * y * u
/-- The squared terminal gap of the low range. -/
def lowGap (y u : ℝ) : ℝ := C6 ^ 2 * (1 + 3 / 2 * y ^ 2) ^ 3 - 27 / 50 * Plow y u ^ 2

end

''')
    # univariate certificates
    tdesc = {'a': ('La t ^ 2 - t * (9 / 2 - 17 * t) ^ 2', 't'),
             'b': ('Lb t ^ 2 - (1 / 2 + 8 * t - 48 * t ^ 2)', 't'),
             'c': ('Lc t ^ 2 - (2 / 3 + 4 / 3 * t - 11 / 6 * t ^ 2)', 't'),
             'u': ('Lu t ^ 4 - (1 + 2 * t) ^ 2 * (1 - t) / 2', 't'),
             'N': ('LN t ^ 2 - (1 + 21 / 100 * t)', 't')}
    certs = []
    for k, nm in names.items():
        M, nx, tree, end, nl = uni_out[k]
        certs.append((f"gap{nm}", M, nx, 0, tree, (Q(0), end, Q(0), Q(1)), tdesc[k][0], ['t'],
                      [nm], f"`{tdesc[k][0]}` on `[0, {qq(end)}]` ({nl} leaves)"))
    M, nx, ny, tree, nl = biv_out['deriv']
    certs.append(("dhat", M, nx, ny, tree, (YLO, YHI, Q(0), Q(1, 2)), "Dhat y w", ['y', 'w'],
                  ['Dhat', 'LaY', 'LbY', 'tlam', 'LN', 'Lu', 'thetaC', 'r0C', 'lamC'],
                  f"`Dhat` on `[409/500, yHi] × [0, 1/2]` ({nl} leaf)"))
    M, nx, ny, tree, nl = biv_out['high']
    certs.append(("highGap", M, nx, ny, tree, (YLO, YHI, Q(0), Q(1, 2)), "highGap y w", ['y', 'w'],
                  ['highGap', 'Qhat', 'KaY', 'KbY', 'LaY', 'LbY', 'tlam', 'LN', 'Lc', 'Lu', 'thetaC', 'r0C',
                   'lamC', 'C6'],
                  f"`highGap` on `[409/500, yHi] × [0, 1/2]` ({nl} leaves)"))
    M, nx, ny, tree, nl = biv_out['low']
    certs.append(("lowGap", M, nx, ny, tree, (Q(0), YLO, Q(0), Q(1)), "lowGap y u", ['y', 'u'],
                  ['lowGap', 'Plow', 'aaC', 'bbC', 'ccC', 'ddC', 'C6'],
                  f"`lowGap` on `[0, 409/500] × [0, 1]` ({nl} leaf)"))
    for (cn, M, nx, ny, tree, box, expr, vars_, unfold, doc) in certs:
        xl, xh, yl, yh = box
        w(f"/-- Coefficient matrix of {doc.split(' on ')[0]}. -/\ndef {cn}M : List (List ℚ) :=\n  {mat_lean(M)}\n")
        w(f"/-- Subdivision of the certificate box. -/\ndef {cn}T : Cover :=\n  {tree_lean(tree)}\n")
        w(f"theorem {cn}_fits : fitsDeg {cn}M {nx} {ny} = true := by decide\n")
        w(f"theorem {cn}_cover : coverOK {cn}M {nx} {ny} {cn}T ({qq(xl)}) ({qq(xh)}) ({qq(yl)}) ({qq(yh)}) = true := by\n  native_decide\n")
        if len(vars_) == 1:
            v = vars_[0]
            stmt = f"eval2 {cn}M {v} 0 = {expr}"
        else:
            stmt = f"eval2 {cn}M {vars_[0]} {vars_[1]} = {expr}"
        args = " ".join(f"({v} : ℝ)" for v in vars_)
        w(f"theorem {cn}_eval {args} : {stmt} := by\n"
          f"  simp only [eval2, {cn}M, List.map_cons, List.map_nil, evalL]\n"
          f"  simp only [{', '.join(unfold)}]\n  push_cast\n  ring\n")
        if len(vars_) == 1:
            v = vars_[0]
            w(f"/-- Certified: {doc}. -/\ntheorem {cn}_nonneg ({v} : ℝ) (h0 : 0 ≤ {v}) (h1 : {v} ≤ {qr(xh)}) :\n"
              f"    0 ≤ {expr} := by\n"
              f"  rw [← {cn}_eval]\n"
              f"  exact coverOK_sound _ _ _ {cn}_fits _ _ _ _ _ {cn}_cover {v} 0 (by push_cast; linarith)\n"
              f"    (by push_cast; linarith) (by norm_num) (by norm_num)\n")
        else:
            a, b = vars_
            w(f"/-- Certified: {doc}. -/\ntheorem {cn}_nonneg ({a} {b} : ℝ) (ha0 : {qr(xl)} ≤ {a}) (ha1 : {a} ≤ {qr(xh)})\n"
              f"    (hb0 : {qr(yl)} ≤ {b}) (hb1 : {b} ≤ {qr(yh)}) : 0 ≤ {expr} := by\n"
              f"  rw [← {cn}_eval]\n"
              f"  exact coverOK_sound _ _ _ {cn}_fits _ _ _ _ _ {cn}_cover {a} {b} (by push_cast; linarith)\n"
              f"    (by push_cast; linarith) (by push_cast; linarith) (by push_cast; linarith)\n")
        w("")
    w("end Grothe.LowerAnalytic\n")
    (OUT / 'SixthMomentData.lean').write_text("\n".join(L))

random.seed(20260)
gen_moments()
gen_data()
print('written')
