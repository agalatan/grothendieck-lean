# Stage 0 (a): the enriched law classes, as conic programs over a grid of atoms of V = |q|^2 (||q||_2 = 1).  N.
# A research worker of claude-b9ee, 27-28 Nov 2026.
#
# The class is the set of "laws with kernels" that satisfy every constraint used by the radius certificates of
# research/conjecture-K (ledger 3.7): code/radius-relaxation/verify_cert.py (facts F1-F4: the class "E2") and
# sources/complex-radius-2026-11-17-gemini-2762/PROOF.md (Proposition 2, Theorem 3: the class "E3").
# Per atom v_i the unknowns are the mass w and the partial moments (E[X; V = v_i]) of
#   c1 = sum|d_j q|^2, c2 = sum|dbar_j q|^2, rho = Re(conj(q)^2 a)/V, their products, alpha2 = |a|^2,
#   beta~ = Re(conj(q) b_loc), w3 = sum|W_k|^2:
#   x_i = (w, c1, c2, rho, c1c1, c1c2, c2c2, c1rho, c2rho, rhorho, alpha2, beta, w3).
# Constraints (u = 1, s = E V^2 - 2 fixed, Gram scalars n, h, b, y, z of the tensor):
#   moments   E 1 = 1, E V = 1, E V^2 = 2 + s, E V^3 <= 6 + 9s + C6 s^1.5,
#             E V^3 <= 6 + 9s + sqrt(s)(198 h0 + 300 tau), E V^3 <= 6 + 9s + sqrt(s)((11781/32) h0 + 135 tau), tau^2 <= s0 h0
#             (the two forms of Circular.joint_sixth minimised over alpha), optionally E sqrt V <= rho0(s);
#   (I)   E[G(V)] = E[c2 phi(V)] + E[rho Y(V)],  (II)  E[G(V)] = E[c1 phi(V)]/2 + E[rho Y(V)]/2   for every test phi;
#   cone  per atom: the moment matrix of (1, c1, c2, rho) is PSD, the means lie in {c1, c2 >= 0, rho^2 <= c1 c2},
#         E[rho^2; v] <= E[alpha2; v] <= E[c1 c2; v];  rho = 0 at V = 0;
#   second moments  E(c2-1)^2 = 16n + 4h, E(c1-c2-1)^2 = 16n + 20h + 16b, E(c1+c2-3)^2 = 80n + 20h + 16b + 96y + 32z,
#         E alpha2 = 32b + 24y, E[V rho] = 32b + 48y;  s = 32n + 8h + 32b + 96y;
#         n, h, b, y, z >= 0, b <= n, y <= z, z^2 <= n h, m = n + b + 3y - z >= 0, (3y - z)^2 <= h m, h0 >= 0;
#   E3 only:  (III) E[c2(c2-1) phi - (c2-1) G + (c2-1) rho Y + beta g] = 0,  (IV) E[alpha2 phi - rho G + c2 rho Y + beta g] = 0,
#         per atom E[beta; v]^2 <= v E[c2; v] E[w3; v] (from beta^2 <= V c2 w3 and Cauchy-Schwarz),  E w3 = 24y.
# Tests phi: the hat functions (piecewise linear in v) on the knots, the last one constant beyond the last knot, and for
# (I), (II) also phi = v.  With finer knots and atoms the class shrinks; the atom grid makes the value a LOWER estimate
# of the class supremum on the continuum, the finite test family an UPPER one.  Both are varied in the report.
# The dual of this program is a certificate of the type of cert_916.json (a 4x4 PSD matrix on (c2, c1, rho, 1) per radius).
import math
import numpy as np, scipy.sparse as sp
import clarabel

C6 = 40.45313
NV = 13; NG = 6
(W, C1, C2, RH, A11, A12, A22, A1R, A2R, R2, X, B, W3) = range(13)
GN, GH, GB, GY, GZ, GT = range(6)

def knots_default():
    r = np.concatenate([np.arange(0, 1.6001, 0.1), [1.8, 2.0, 2.3, 2.6, 3.0, 3.5, 4.0, 5.0, 6.0, 8.0]])
    return r ** 2
def atoms_default():
    r = np.unique(np.concatenate([[0.0], np.geomspace(1e-3, 0.05, 6), np.linspace(0.05, 2.0, 118), np.linspace(2.0, 4.0, 61), np.linspace(4, 8, 41), np.geomspace(8, 40, 30)]))
    return r ** 2

def tests(knots, v):
    """hat tests on the knots at the points v: phi, G = int_0^v phi, g = G/v (g(0) = phi(0)), Y = phi - g."""
    K = len(knots); v = np.asarray(v, float)
    PHI = np.zeros((K, len(v))); G = np.zeros((K, len(v)))
    for k in range(K):
        val = np.zeros(K); val[k] = 1.0
        PHI[k] = np.interp(v, knots, val)                               # constant (= val[-1]) beyond the last knot
        cum = np.concatenate([[0], np.cumsum((val[1:] + val[:-1]) / 2 * np.diff(knots))])
        j = np.clip(np.searchsorted(knots, v, side='right') - 1, 0, K - 2)
        dv = v - knots[j]; sl = (val[j + 1] - val[j]) / (knots[j + 1] - knots[j])
        inside = v <= knots[-1]
        G[k] = np.where(inside, cum[j] + val[j] * dv + sl * dv * dv / 2, cum[-1] + val[-1] * (v - knots[-1]))
    with np.errstate(divide='ignore', invalid='ignore'):
        g = np.where(v > 0, G / np.maximum(v, 1e-300), PHI)
    return PHI, G, g, PHI - g

class Enriched:
    def __init__(self, third=True, knots=None, atoms=None, first=True):
        self.third, self.first = third, first
        self.kn = knots_default() if knots is None else np.asarray(knots, float)
        self.v = atoms_default() if atoms is None else np.asarray(atoms, float)
        self.N = len(self.v); self.nx = NG + NV * self.N
        self.PHI, self.G, self.g, self.Y = tests(self.kn, self.v)
        self._build()
    def ix(self, i, k): return NG + NV * i + k
    def _build(self):
        v = self.v; N = self.N; ix = self.ix
        rows = []; cols = []; vals = []; rhs = []; self.nrow = 0
        def add(coefs, b):                       # one row:  sum coef x  (+ slack in the cone) = b
            for c, a in coefs:
                if a != 0.0: rows.append(self.nrow); cols.append(c); vals.append(a)
            rhs.append(b); self.nrow += 1
        cones = []
        # ---- equalities
        n0 = self.nrow
        add([(ix(i, W), 1.0) for i in range(N)], 1.0)
        add([(ix(i, W), v[i]) for i in range(N)], 1.0)
        self.row_m2 = self.nrow; add([(ix(i, W), v[i] ** 2) for i in range(N)], 2.0)                       # rhs 2 + s
        self.row_s = self.nrow; add([(GN, 32.0), (GH, 8.0), (GB, 32.0), (GY, 96.0)], 0.0)                 # rhs s
        if self.first:
            for k in range(len(self.kn)):
                add([(ix(i, W), self.G[k, i]) for i in range(N)] + [(ix(i, C2), -self.PHI[k, i]) for i in range(N)] + [(ix(i, RH), -self.Y[k, i]) for i in range(N)], 0.0)
                add([(ix(i, W), self.G[k, i]) for i in range(N)] + [(ix(i, C1), -self.PHI[k, i] / 2) for i in range(N)] + [(ix(i, RH), -self.Y[k, i] / 2) for i in range(N)], 0.0)
            # phi = v: G = v^2/2, Y = v/2
            add([(ix(i, W), v[i] ** 2 / 2) for i in range(N)] + [(ix(i, C2), -v[i]) for i in range(N)] + [(ix(i, RH), -v[i] / 2) for i in range(N)], 0.0)
            add([(ix(i, W), v[i] ** 2 / 2) for i in range(N)] + [(ix(i, C1), -v[i] / 2) for i in range(N)] + [(ix(i, RH), -v[i] / 4) for i in range(N)], 0.0)
            add([(ix(i, A22), 1.0) for i in range(N)] + [(ix(i, C2), -2.0) for i in range(N)] + [(ix(i, W), 1.0) for i in range(N)] + [(GN, -16.0), (GH, -4.0)], 0.0)
            add([(ix(i, A11), 1.0) for i in range(N)] + [(ix(i, A12), -2.0) for i in range(N)] + [(ix(i, A22), 1.0) for i in range(N)] + [(ix(i, C1), -2.0) for i in range(N)]
                + [(ix(i, C2), 2.0) for i in range(N)] + [(ix(i, W), 1.0) for i in range(N)] + [(GN, -16.0), (GH, -20.0), (GB, -16.0)], 0.0)
            add([(ix(i, A11), 1.0) for i in range(N)] + [(ix(i, A12), 2.0) for i in range(N)] + [(ix(i, A22), 1.0) for i in range(N)] + [(ix(i, C1), -6.0) for i in range(N)]
                + [(ix(i, C2), -6.0) for i in range(N)] + [(ix(i, W), 9.0) for i in range(N)] + [(GN, -80.0), (GH, -20.0), (GB, -16.0), (GY, -96.0), (GZ, -32.0)], 0.0)
            add([(ix(i, X), 1.0) for i in range(N)] + [(GB, -32.0), (GY, -24.0)], 0.0)
            add([(ix(i, RH), v[i]) for i in range(N)] + [(GB, -32.0), (GY, -48.0)], 0.0)
            i0 = int(np.argmin(v))
            if v[i0] == 0.0:
                for k in (RH, R2, A1R, A2R, B): add([(ix(i0, k), 1.0)], 0.0)
        if self.third:
            add([(ix(i, W3), 1.0) for i in range(N)] + [(GY, -24.0)], 0.0)
            for k in range(len(self.kn)):
                add([(ix(i, A22), self.PHI[k, i]) for i in range(N)] + [(ix(i, C2), -self.PHI[k, i] - self.G[k, i]) for i in range(N)] + [(ix(i, W), self.G[k, i]) for i in range(N)]
                    + [(ix(i, A2R), self.Y[k, i]) for i in range(N)] + [(ix(i, RH), -self.Y[k, i]) for i in range(N)] + [(ix(i, B), self.g[k, i]) for i in range(N)], 0.0)
                add([(ix(i, X), self.PHI[k, i]) for i in range(N)] + [(ix(i, RH), -self.G[k, i]) for i in range(N)] + [(ix(i, A2R), self.Y[k, i]) for i in range(N)]
                    + [(ix(i, B), self.g[k, i]) for i in range(N)], 0.0)
        else:
            for i in range(N): add([(ix(i, B), 1.0)], 0.0); add([(ix(i, W3), 1.0)], 0.0)
        cones.append(clarabel.ZeroConeT(self.nrow - n0))
        # ---- inequalities  (row: coef x + slack = b, slack >= 0, i.e. coef x <= b)
        n0 = self.nrow
        self.row_m3 = self.nrow; add([(ix(i, W), v[i] ** 3) for i in range(N)], 0.0)                         # rhs 6 + 9s + C6 s^1.5
        # joint forms: s0 = 8n + 2h + 8b + 8z, h0 = (8n + 2h + 8b)/3 + 24y - 16z/3; coefficient sqrt(s) filled per solve
        self.row_j1 = self.nrow; add([(ix(i, W), v[i] ** 3) for i in range(N)] + [(GN, 1.0), (GH, 1.0), (GB, 1.0), (GY, 1.0), (GZ, 1.0), (GT, 1.0)], 0.0)
        self.row_j2 = self.nrow; add([(ix(i, W), v[i] ** 3) for i in range(N)] + [(GN, 1.0), (GH, 1.0), (GB, 1.0), (GY, 1.0), (GZ, 1.0), (GT, 1.0)], 0.0)
        self.row_rad = self.nrow; add([(ix(i, W), math.sqrt(v[i])) for i in range(N)], 0.0)                 # rhs rho0 (or large)
        for gidx in (GN, GH, GB, GY, GZ, GT): add([(gidx, -1.0)], 0.0)
        add([(GB, 1.0), (GN, -1.0)], 0.0); add([(GY, 1.0), (GZ, -1.0)], 0.0)
        add([(GN, -1.0), (GB, -1.0), (GY, -3.0), (GZ, 1.0)], 0.0)                                              # m >= 0
        add([(GN, -8 / 3), (GH, -2 / 3), (GB, -8 / 3), (GY, -24.0), (GZ, 16 / 3)], 0.0)                         # h0 >= 0
        for i in range(N):
            add([(ix(i, R2), 1.0), (ix(i, X), -1.0)], 0.0); add([(ix(i, X), 1.0), (ix(i, A12), -1.0)], 0.0)
            add([(ix(i, W3), -1.0)], 0.0)
        if not self.first:
            for i in range(N):
                for k in (C1, C2): add([(ix(i, k), -1.0)], 0.0)
        cones.append(clarabel.NonnegativeConeT(self.nrow - n0))
        # ---- second-order cones: s = b - A x in SOC.  x^2 <= y z  <=>  (y + z, 2x, y - z) in SOC
        def rsoc(xc, yc, zc):
            add([(c, -a) for c, a in yc] + [(c, -a) for c, a in zc], 0.0)
            add([(c, -2 * a) for c, a in xc], 0.0)
            add([(c, -a) for c, a in yc] + [(c, a) for c, a in zc], 0.0)
            cones.append(clarabel.SecondOrderConeT(3))
        rsoc([(GZ, 1.0)], [(GN, 1.0)], [(GH, 1.0)])                                                           # z^2 <= n h
        rsoc([(GY, 3.0), (GZ, -1.0)], [(GH, 1.0)], [(GN, 1.0), (GB, 1.0), (GY, 3.0), (GZ, -1.0)])            # (3y - z)^2 <= h m
        rsoc([(GT, 1.0)], [(GN, 8.0), (GH, 2.0), (GB, 8.0), (GZ, 8.0)], [(GN, 8 / 3), (GH, 2 / 3), (GB, 8 / 3), (GY, 24.0), (GZ, -16 / 3)])   # tau^2 <= s0 h0
        if self.first:
            for i in range(N):
                rsoc([(ix(i, RH), 1.0)], [(ix(i, C1), 1.0)], [(ix(i, C2), 1.0)])
                if self.third and v[i] > 0: rsoc([(ix(i, B), 1.0)], [(ix(i, C2), v[i])], [(ix(i, W3), 1.0)])
                elif self.third: add([(ix(i, B), 1.0)], 0.0) if False else None
            # ---- PSD blocks (upper triangle by columns, off-diagonal entries times sqrt 2)
            r2 = math.sqrt(2.0)
            for i in range(N):
                for (k, sc) in ((W, 1.0), (C1, r2), (A11, 1.0), (C2, r2), (A12, r2), (A22, 1.0), (RH, r2), (A1R, r2), (A2R, r2), (R2, 1.0)):
                    add([(ix(i, k), -sc)], 0.0)
                cones.append(clarabel.PSDTriangleConeT(4))
        else:
            n0 = self.nrow
            for i in range(N): add([(ix(i, W), -1.0)], 0.0)
            cones.append(clarabel.NonnegativeConeT(self.nrow - n0))
        self.rows_ = np.array(rows); self.cols_ = np.array(cols); self.vals_ = np.array(vals, float)
        self.b0 = np.array(rhs); self.cones = cones
        self.patch = {}                                  # positions of the entries that depend on s (the joint sixth-moment rows)
        for row in (self.row_j1, self.row_j2):
            for gidx in (GN, GH, GB, GY, GZ, GT):
                k = np.where((self.rows_ == row) & (self.cols_ == gidx))[0]; assert len(k) == 1
                self.patch[(row, gidx)] = int(k[0])
        self.settings = clarabel.DefaultSettings(); self.settings.verbose = False
        self.settings.max_iter = 200
        try: self.settings.max_threads = 1
        except Exception: pass
    def solve(self, f, s, rho0=None, m3=True):
        """maximise sum_i w_i f_i over the class at the fourth excess s.  Returns (value, w, info) or None."""
        vals = self.vals_.copy(); b = self.b0.copy(); rs = math.sqrt(max(s, 0.0)); A = {}
        b[self.row_m2] = 2.0 + s; b[self.row_s] = s
        b[self.row_m3] = 6 + 9 * s + C6 * s ** 1.5 if m3 else 1e9
        # E V^3 - sqrt(s)(c_h0 h0 + c_tau tau) <= 6 + 9s
        for row, ch, ct in ((self.row_j1, 198.0, 300.0), (self.row_j2, 11781 / 32, 135.0)):
            for gidx, cf in ((GN, -rs * ch * 8 / 3), (GH, -rs * ch * 2 / 3), (GB, -rs * ch * 8 / 3), (GY, -rs * ch * 24), (GZ, rs * ch * 16 / 3), (GT, -rs * ct)):
                vals[self.patch[(row, gidx)]] = cf
            b[row] = (6 + 9 * s) if m3 else 1e9
        b[self.row_rad] = rho0 if rho0 is not None else 1e6
        q = np.zeros(self.nx)
        for i in range(self.N): q[self.ix(i, W)] = -f[i]
        P = sp.csc_matrix((self.nx, self.nx))
        Am = sp.csc_matrix((vals, (self.rows_, self.cols_)), shape=(self.nrow, self.nx))
        sol = clarabel.DefaultSolver(P, q, Am, b, self.cones, self.settings).solve()
        st = str(sol.status)
        if 'Solved' not in st: return None
        x = np.array(sol.x); w = np.array([x[self.ix(i, W)] for i in range(self.N)])
        return -sol.obj_val, np.maximum(w, 0), dict(status=st, dual=-sol.obj_val_dual, gram=x[:5].tolist(), x=x)

if __name__ == '__main__':
    # sanity: the supremum of E sqrt(V) over each class (no radius input) against the record of K ledger 3.7:
    # second-moment class about 0.9286 at s = 5-6 (N), 0.9061 at s = 0 (certificate); third-order class: certificate
    # values 0.89694 at s = 0 and 0.91555 on s in [4, 17/4].
    import sys, time
    for third in (False, True):
        E = Enriched(third=third); f = np.sqrt(E.v)
        for s in (0.0, 2.0, 4.0, 4.25, 5.0, 5.5, 6.0, 8.0, 20.0):
            t0 = time.time(); o = E.solve(f, s)
            print('third=%s s=%5.2f sup E sqrt V = %s  (atoms %d, tests %d, %.1fs)' % (third, s, ('%.6f (dual %.6f) mass at V<=1e-2: %.4f' % (o[0], o[2]['dual'], o[1][E.v <= 1e-2].sum())) if o else 'fail', E.N, len(E.kn), time.time() - t0), flush=True)
