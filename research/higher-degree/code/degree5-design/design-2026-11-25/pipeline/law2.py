# [stage 2c copy of degree5-cert/cert2b/law2.py: EPS1, ETA, RHO now come from gamecfg.py (game.json); nothing else changed]
# Law layer of the degree-5 q-only row for the CAPPED GAME (stage 2), certified with exact rationals
# (claude-b9ee d5cert worker, 16 Nov 2026). Same method as stage 1 (law.py); constants changed:
#   eps1 = 39/50, eta = 779/10000, and the radius input E sqrt(U) <= rho = 95133/100000 (ledger 3.7, P + C; stage 2b
#   corrects stage 2's 9513293/10^7, which is below the largest certified row bound 0.95132934...)
#   in place of the Lean first-moment bound 973612157/10^9.
#
# Statement certified (C, given the node caps of caps.py):  for every sigma >= 0, every nu in [nu_min, nu_max] and
# every law of U >= 0 with E U = 1, m = E U^2 in [2, 44], E U^3 <= 9m - 12 + C6 (m-2)^(3/2), E sqrt(U) <= rho,
#     E Psi5(sigma sqrt(U); nu) - kappa sigma^2 - nu^2/eta  <=  G+   (kappa = 1/eps1 - (bA^2 + bB^2)/eta).
# Method, on boxes [s_a, s_b] x [x_a, x_b] x [nu_j, nu_j+1] (x = sqrt(m - 2)):
#   * two physical majorants p^i(s) = a0 + a1 s + a2 s^2 + a4 s^4 + a6 s^6 (a1, a6 >= 0) of Psi5(.; nu_j), Psi5(.; nu_j+1)
#     on [0, oo): above the chord interpolant of the caps on every cap segment (convexity of Psi5 in s; segment test
#     min(q(s_k), q(s_k+1)) >= (Delta^2/8) sup (p'')^+), and above c_N + Lip (s - s_N) beyond the last node
#     (|d Psi5/ds| <= 2 E|D| <= Lip = 2 sqrt(1 + bA^2 + bB^2));
#   * E p(sigma sqrt U) <= J(sigma, x) = a0 + a1 rho sigma + a2 sigma^2 + a4 (2 + x^2) sigma^4 + a6 (6 + 9x^2 + C6 x^3) sigma^6;
#   * convexity of Psi5 in nu: E Psi5(.; nu) <= (1-lam) J^0 + lam J^1, nu = nu_j + lam (nu_j+1 - nu_j);
#   * F(sigma, x, lam) = (1-lam) J^0 + lam J^1 - kappa sigma^2 - nu^2/eta: maximal at an x endpoint (cubic endpoint
#     lemma, a6 >= 0), then bounded by exact tensor Bernstein coefficients in (sigma, lam).
# Outside the box family: sigma >= Lip rho / kappa is dominated by sigma = 0, and |nu| >= eta by the boundary values.
import sys, os, json, math, time
from fractions import Fraction as F
import numpy as np
from scipy.optimize import linprog

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gamecfg import EPS1, ETA, RHO, rho_on_x      # stage 2c: the game and the radius input come from game.json (gamecfg.py)
C6 = F(4045313, 100000)
XMAX = F(6481, 1000)        # >= sqrt(42)
assert XMAX ** 2 >= 42

def rat_upper_sqrt(q, den=10 ** 9):
    r = F(math.isqrt(int(q * den * den)) + 1, den)
    assert r * r >= q
    return r

class Row:
    def __init__(self, capsfile):
        d = json.load(open(capsfile))
        self.l, self.beta, self.bA, self.bB = (F(d['row'][k]) for k in ('l', 'beta', 'bA', 'bB'))
        self.kappa = 1 / EPS1 - (self.bA ** 2 + self.bB ** 2) / ETA
        self.lip = rat_upper_sqrt(4 * (1 + self.bA ** 2 + self.bB ** 2))
        self.sigmax = self.lip * RHO / self.kappa
        self.caps = {}
        for k, v in d['caps'].items():
            self.caps[F(k)] = ([F(a) for a, _ in v], [F(b) for _, b in v])
        self.nus = sorted(self.caps)
        self.const = 2 * self.beta ** 2 / EPS1     # row constant without t^2 - 2 l t

# ---------------------------------------------------------------- exact polynomial tools (ascending coefficients)
def peval(c, x):
    y = F(0)
    for a in reversed(c): y = y * x + a
    return y

def taylor_shift(c, a):
    """coefficients of p(a + y) in y."""
    n = len(c); out = list(c)
    for i in range(n):
        for j in range(n - 2, i - 1, -1):
            out[j] += a * out[j + 1]
    return out

def bernstein(c, a, b):
    """Bernstein coefficients of p on [a, b]."""
    n = len(c) - 1
    t = taylor_shift(c, a)
    h = b - a
    t = [t[i] * h ** i for i in range(n + 1)]       # p(a + h u) in u
    out = []
    for k in range(n + 1):
        out.append(sum(t[i] * F(math.comb(k, i), math.comb(n, i)) for i in range(k + 1)))
    return out

def nonneg_on(c, a, b, depth=12):
    bc = bernstein(c, a, b)
    if min(bc) >= 0: return True
    if bc[0] < 0 or bc[-1] < 0 or depth == 0: return False
    m = (a + b) / 2
    return nonneg_on(c, a, m, depth - 1) and nonneg_on(c, m, b, depth - 1)

def nonneg_ray(c, a):
    """p >= 0 on [a, oo)."""
    if min(taylor_shift(c, a)) >= 0: return True
    for w in (1, 2, 4, 8, 16, 24, 32, 64, 128):
        b = a + w
        if nonneg_on(c, a, b, depth=16) and min(taylor_shift(c, b)) >= 0: return True
    return False

# ---------------------------------------------------------------- majorants
# stage 2: tail nodes beyond the last cap node sN: the linear Lipschitz tail c_N + Lip (s - sN) is treated as extra
# "caps" at s = sN + w (w in TAIL_W), so the same segment test applies; beyond sN + 24 a Taylor test closes the ray.
TAIL_W = [F(k, 50) for k in range(1, 101)] + [2 + F(k, 10) for k in range(1, 221)]

def maj_list(a):  # a = (a0, a1, a2, a4, a6) -> ascending coefficient list in s
    return [a[0], a[1], a[2], F(0), a[3], F(0), a[4]]

def verify_majorant(row, nu, a):
    """exact check that p(s) >= Psi5(s; nu) for all s >= 0 (given the caps). Returns (ok, worst slack)."""
    if a[1] < 0 or a[4] < 0: return False, 'sign'
    S, Cc = row.caps[nu]
    c = maj_list(a)
    q_prev = peval(c, S[0]) - Cc[0]
    worst = None
    for k in range(len(S) - 1):
        s0, s1 = S[k], S[k + 1]
        q_next = peval(c, s1) - Cc[k + 1]
        # p'' = 2a2 + 12a4 w + 30a6 w^2 (w = s^2) is convex in w (a6 >= 0): its sup is at a segment end
        supdd = max(2 * a[2] + 12 * a[3] * s0 * s0 + 30 * a[4] * s0 ** 4, 2 * a[2] + 12 * a[3] * s1 * s1 + 30 * a[4] * s1 ** 4)
        need = (s1 - s0) ** 2 / 8 * max(supdd, F(0))
        sl = min(q_prev, q_next) - need
        if worst is None or sl < worst: worst = sl
        q_prev = q_next
    if worst < 0: return False, ('segment', worst)
    sN, cN = S[-1], Cc[-1]
    tail0 = list(c); tail0[0] -= cN - row.lip * sN; tail0[1] -= row.lip
    if min(taylor_shift(tail0, sN)) >= 0:
        return True, worst          # stage-1 style tail certificate: p - tail has nonnegative Taylor coefficients at sN
    # tail nodes: Psi5(s) <= cN + lip (s - sN) for s >= sN; segment test against this line on the nodes sN + w
    TS = [sN] + [sN + w for w in TAIL_W]
    TC = [cN + row.lip * (x - sN) for x in TS]
    q_prev = peval(c, TS[0]) - TC[0]
    for k in range(len(TS) - 1):
        s0, s1 = TS[k], TS[k + 1]
        q_next = peval(c, s1) - TC[k + 1]
        supdd = max(2 * a[2] + 12 * a[3] * s0 * s0 + 30 * a[4] * s0 ** 4, 2 * a[2] + 12 * a[3] * s1 * s1 + 30 * a[4] * s1 ** 4)
        sl = min(q_prev, q_next) - (s1 - s0) ** 2 / 8 * max(supdd, F(0))
        if sl < worst: worst = sl
        q_prev = q_next
    if worst < 0: return False, ('segment', worst)
    sF = TS[-1]
    tail = list(c); tail[0] -= cN - row.lip * sN; tail[1] -= row.lip
    if not (min(taylor_shift(tail, sF)) >= 0 or nonneg_ray(tail, sF)): return False, 'tail'
    return True, worst

def J_coeffs(a, x, rho=RHO):
    """J(sigma, x) as ascending coefficients in sigma.  rho: the radius input valid on the x-box (stage 2c: rho_on_x(xa, xb),
    a constant on the box, so the x-dependence and the endpoint lemma in x are unchanged; a1 >= 0)."""
    return [a[0], a[1] * rho, a[2], F(0), a[3] * (2 + x * x), F(0), a[4] * (6 + 9 * x * x + C6 * x ** 3)]

def box_bound(row, nu0, nu1, a0, a1, sa, sb, xa, xb):
    """exact upper bound of max F over [sa,sb] x [xa,xb] x [nu0,nu1] given majorant coefficient tuples a0 (at nu0), a1."""
    dn = nu1 - nu0
    best = None
    rho = rho_on_x(xa, xb)             # stage 2c: E sqrt(U) <= rho for every law with sqrt(m - 2) in [xa, xb]
    for x in (xa, xb):
        J0 = J_coeffs(a0, x, rho); J1 = J_coeffs(a1, x, rho)
        # f[i][k]: coefficient of sigma^i lam^k
        f = [[J0[i], J1[i] - J0[i], F(0)] for i in range(7)]
        f[2][0] -= row.kappa
        f[0][0] -= nu0 * nu0 / ETA
        f[0][1] -= 2 * nu0 * dn / ETA
        f[0][2] -= dn * dn / ETA
        v = bern2_max(f, sa, sb)
        best = v if best is None else max(best, v)
    return best

def bern2_max(f, sa, sb, refine=None, tol=F(1, 10 ** 9), maxit=400):
    """upper bound of max over [sa,sb] x [0,1] of sum f[i][k] s^i lam^k: branch and bound on rectangles with exact
    tensor Bernstein coefficients (upper bounds) against exact point values (lower bounds); stops when every open
    rectangle's Bernstein maximum is within tol of the best point value. Returns the largest open upper bound."""
    def val(s, l):
        return sum(f[i][k] * s ** i * l ** k for i in range(7) for k in range(3))
    def ub(a, b, la, lb):
        cols = [bernstein(f[i], la, lb) for i in range(7)]
        return max(max(bernstein([cols[i][k] for i in range(7)], a, b)) for k in range(3))
    import heapq
    lo = max(val(a, l) for a in (sa, sb) for l in (F(0), F(1)))
    heap = [(-ub(sa, sb, F(0), F(1)), sa, sb, F(0), F(1))]
    it = 0
    while heap:
        nub, a, b, la, lb = heap[0]
        if -nub <= lo + tol or it >= maxit: break
        heapq.heappop(heap); it += 1
        m = (a + b) / 2; ml = (la + lb) / 2
        lo = max(lo, val(m, ml))
        # split the longer side (relative: sigma width vs lam width scaled by 1/10)
        if (b - a) * 10 >= (lb - la):
            parts = [(a, m, la, lb), (m, b, la, lb)]
        else:
            parts = [(a, b, la, ml), (a, b, ml, lb)]
        for p in parts:
            u = ub(*p)
            if u > lo: heapq.heappush(heap, (-u, *p))
    return max(lo, -heap[0][0]) if heap else lo

def lp_majorants(row, nu0, nu1, sa, sb, xa, xb, margin=2e-10, nsig=7, nlam=5):
    """float LP: majorants at nu0 and nu1 minimising the sampled box maximum. Returns float coefficient arrays."""
    rows_A = []; rows_b = []
    nvar = 11
    def majrows(nu, off):
        S, Cc = row.caps[nu]
        Sf = np.array([float(s) for s in S]); Cf = np.array([float(c) for c in Cc])
        n = len(Sf)
        D = np.zeros(n)
        D[:-1] = np.diff(Sf); D[1:] = np.maximum(D[1:], np.diff(Sf))
        for k in range(n):
            s = Sf[k]
            base = np.array([1, s, s * s, s ** 4, s ** 6])
            for kk in (k - 1, k, k + 1):
                if 0 <= kk < n:
                    sp = Sf[kk]
                    dd = np.array([0, 0, 2, 12 * sp ** 2, 30 * sp ** 4]) * D[k] ** 2 / 8
                    r = np.zeros(nvar); r[off:off + 5] = -(base - dd)
                    rows_A.append(r); rows_b.append(-(Cf[k] + margin))
            r = np.zeros(nvar); r[off:off + 5] = -base
            rows_A.append(r); rows_b.append(-(Cf[k] + margin))
        sN, cN = Sf[-1], Cf[-1]; lip = float(row.lip)
        # tail (stage 2): p(s) >= cN + lip (s - sN) at dense samples on [sN, sN + 24], and the Taylor coefficients of
        # p(sF + y) - cN - lip (sF - sN + y) at the far point sF = sN + 24 all >= 0 (linear, sufficient beyond sF).
        # The exact check (nonneg_ray) then certifies the whole ray.  (Stage 1 imposed the Taylor condition at sN itself,
        # which forces a6 >= 0.0056 |a4| and spoils the majorants at large m.)
        TWf = np.array([0.0] + [float(w) for w in TAIL_W])
        TSf = sN + TWf; DT = np.zeros(len(TSf)); DT[:-1] = np.diff(TSf); DT[1:] = np.maximum(DT[1:], np.diff(TSf))
        for k in range(len(TSf)):
            s = TSf[k]; base = np.array([1, s, s * s, s ** 4, s ** 6]); cap = cN + lip * TWf[k]
            for kk in (k - 1, k, k + 1):
                if 0 <= kk < len(TSf):
                    sp = TSf[kk]
                    dd = np.array([0, 0, 2, 12 * sp ** 2, 30 * sp ** 4]) * DT[k] ** 2 / 8
                    r = np.zeros(nvar); r[off:off + 5] = -(base - dd)
                    rows_A.append(r); rows_b.append(-(cap + margin))
        sF = sN + 24.0
        pw = [0, 1, 2, 4, 6]
        for k in range(7):
            r = np.zeros(nvar)
            for idx, i in enumerate(pw):
                if i >= k: r[off + idx] = -math.comb(i, k) * sF ** (i - k)
            rows_A.append(r); rows_b.append(-((cN + lip * (sF - sN) if k == 0 else 0) + (lip if k == 1 else 0) + margin))
    majrows(nu0, 0); majrows(nu1, 5)
    kap = float(row.kappa); eta = float(ETA); rho = float(rho_on_x(F(xa), F(xb))); c6 = float(C6)
    dn = float(nu1 - nu0)
    for sg in np.linspace(float(sa), float(sb), nsig):
        for x in (float(xa), float(xb)):
            jv = np.array([1, rho * sg, sg * sg, (2 + x * x) * sg ** 4, (6 + 9 * x * x + c6 * x ** 3) * sg ** 6])
            for lam in np.linspace(0, 1, nlam):
                nu = float(nu0) + lam * dn
                r = np.zeros(nvar); r[0:5] = (1 - lam) * jv; r[5:10] = lam * jv; r[10] = -1
                rows_A.append(r); rows_b.append(kap * sg * sg + nu * nu / eta)
    c = np.zeros(nvar); c[10] = 1
    bounds = [(None, None), (0, None), (None, None), (None, None), (0, None)] * 2 + [(None, None)]
    A = np.array(rows_A); b = np.array(rows_b)
    # variable scaling (a4 s^4, a6 s^6 with s up to 6) and row normalisation, then tight tolerances
    vs = np.array([1, 1 / 6, 1 / 36, 1 / 1296, 1 / 46656] * 2 + [1])   # p in powers of s/6
    A = A * vs[None, :]
    rn = np.abs(A).max(axis=1); A = A / rn[:, None]; b = b / rn
    res = linprog(c, A_ub=A, b_ub=b, bounds=bounds, method='highs',
                  options=dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10))
    if res.status != 0: return None
    x = res.x * vs
    return x[0:5], x[5:10], x[10]

def to_rat(v, den=10 ** 14):
    """round UP (every coefficient multiplies a nonnegative power of s >= 0, so p only increases)."""
    return F(math.ceil(v * den), den)

def certify_box(row, nu0, nu1, sa, sb, xa, xb, cache=None):
    """LP, rationalise, verify both majorants exactly (lifting a0 if needed), return the exact box bound."""
    out = lp_majorants(row, nu0, nu1, sa, sb, xa, xb)
    if out is None: return None, 'lp'
    am = []
    for nu, av in ((nu0, out[0]), (nu1, out[1])):
        a = [to_rat(v) for v in av]
        a[1] = max(a[1], F(0)); a[4] = max(a[4], F(0))
        ok, info = verify_majorant(row, nu, a)
        if not ok:
            # lift a0 by the deficit (tiny when the LP margins are honoured)
            if isinstance(info, tuple) and info[0] == 'segment':
                lift = -info[1]
                a[0] += F(math.ceil(lift * 10 ** 15), 10 ** 15) + F(1, 10 ** 14)
                ok, info = verify_majorant(row, nu, a)
            # stage 2: the tail is sampled in the LP, so the exact ray test can fail between samples; lift a0 by a
            # small amount (every lift is paid in the bound through a0)
            for lift in (F(1, 10 ** 9), F(1, 10 ** 8), F(1, 10 ** 7), F(1, 10 ** 6), F(1, 10 ** 5), F(1, 10 ** 4)):
                if ok or info != 'tail': break
                a[0] += lift
                ok, info = verify_majorant(row, nu, a)
        if not ok: return None, ('majorant', float(nu), str(info)[:80])
        am.append(a)
    bound = box_bound(row, nu0, nu1, am[0], am[1], sa, sb, xa, xb)
    return bound, dict(lp=float(out[2]), a0=[str(v) for v in am[0]], a1=[str(v) for v in am[1]])
