# Graded-model engine, version 2 [N] (claude-b9ee worker, 16 Nov 2026).
# Same model as gm.py; additions for many variables:
#  - recursive basis enumeration with bidegree pruning (gm.py enumerated a full product);
#  - projection contracts the large grid axes first (small intermediates);
#  - chunked fixed-pair scoring on fine grids with bounded memory (score_pair).
import numpy as np, math, itertools
from gm import herm_c, herm_r, gl_panels, Var, phase_coeffs, compose_phase, best_rho2, rho_value_grad

class Model2:
    def __init__(self, vars, K):
        self.vars = vars; self.K = K; maxdeg = 2 * K + 1
        cand = [v.indices(maxdeg) for v in vars]
        contrib = [[v.contrib(idx) for idx in c] for v, c in zip(vars, cand)]
        basis = []
        def rec(i, m, n, combo):
            if m > K + 1 or n > K: return
            if i == len(vars):
                if m == n + 1: basis.append((n, tuple(combo)))
                return
            for idx, (dm, dn) in zip(cand[i], contrib[i]):
                if m + dm <= K + 1 and n + dn <= K:
                    combo.append(idx); rec(i + 1, m + dm, n + dn, combo); combo.pop()
        rec(0, 0, 0, [])
        basis.sort(key=lambda t: (t[0], str(t[1])))
        self.basis = basis; self.nb = len(basis); self.kof = np.array([b[0] for b in basis])
        self.J = [sorted(set(b[1][i] for b in basis), key=str) for i in range(len(vars))]
        pos = [{idx: j for j, idx in enumerate(Ji)} for Ji in self.J]
        self.jpos = np.array([[pos[i][b[1][i]] for i in range(len(vars))] for b in basis])
        self.T = [v.table(Ji) for v, Ji in zip(vars, self.J)]
        self.Tw = [np.conj(t) * v.w[None, :] for t, v in zip(self.T, vars)]
        self.shape = tuple(len(Ji) for Ji in self.J)
    def coef_tensor(self, c):
        C = np.zeros(self.shape, complex); np.add.at(C, tuple(self.jpos.T), c); return C
    def evaluate(self, c, T0=None):
        A = self.coef_tensor(c)
        for i in range(len(self.vars)):
            A = np.tensordot(A, (T0 if (i == 0 and T0 is not None) else self.T[i]), axes=([0], [0]))
        return A
    def project(self, F, Tw0=None):
        A = F; m = len(self.vars)
        for i in reversed(range(m)):
            A = np.tensordot(A, (Tw0 if (i == 0 and Tw0 is not None) else self.Tw[i]), axes=([i], [1]))
        # axes are now (J_{m-1}, ..., J_0)
        return A[tuple(self.jpos.T[::-1])]
    def mass(self, F):
        A = F
        for v in self.vars: A = np.tensordot(A, v.w, axes=([0], [0]))
        return A
    def lamvec(self, lam):
        lam = np.asarray(lam, float); return np.array([lam[k] if k < len(lam) else 0.0 for (k, _) in self.basis])
    def pair_coeffs(self, fhat, ghat):
        c = np.zeros(self.K + 1); np.add.at(c, self.kof, np.real(np.conj(fhat) * ghat)); return c
    def energies(self, fhat):
        e = np.zeros(self.K + 1); np.add.at(e, self.kof, np.abs(fhat) ** 2); return e
    def phase_proj(self, c, chunk=None):
        """projection of ph(h_c); chunked along the visible-z axis when chunk is given"""
        if chunk is None:
            h = self.evaluate(c); return self.project(h / np.maximum(np.abs(h), 1e-300))
        n0 = self.vars[0].n; out = 0
        for s in range(0, n0, chunk):
            sl = slice(s, min(n0, s + chunk))
            h = self.evaluate(c, T0=self.T[0][:, sl])
            out = out + self.project(h / np.maximum(np.abs(h), 1e-300), Tw0=self.Tw[0][:, sl])
        return out

def alternate2(M, lam, c0, iters=400, tol=1e-11, lv=None):
    lv = M.lamvec(lam) if lv is None else lv; c = np.asarray(c0, complex); hist = []; vold = -9; v = None
    for it in range(iters):
        fh = M.phase_proj(c); hist.append((c, fh)); hist = hist[-2:]
        if len(hist) == 2:
            v = float(np.real(np.sum(lv * np.conj(hist[1][1]) * hist[0][1])))
            if it > 4 and abs(v - vold) < tol: break
            vold = v
        c = lv * fh
    (cg, gh), (cf, fh) = hist[0], hist[1]
    return dict(value=v, it=it, cf=cf, cg=cg, fhat=fh, ghat=gh, c=M.pair_coeffs(fh, gh))

def build2(spec, K, nz, nr, nth):
    """spec: list of (kind, a, b, name); nz radial nodes for z, (nr, nth) for complex variables"""
    vs = [Var('z', (1, 0), n1=nz, name='z')]
    for kind, a, b, name in spec:
        vs.append(Var(kind, (a, b), n1=(nr if kind != 'r' else 16), n2=nth, name=name))
    return Model2(vs, K)

def score_pair(spec, K, lam, cf, cg, nz, nr, nth, chunk=1):
    """payoff of the explicit pair (f, g) = (ph h_cf, ph h_cg) on a given grid (chunked)"""
    M = build2(spec, K, nz, nr, nth)
    fh = M.phase_proj(cf, chunk); gh = M.phase_proj(cg, chunk); c = M.pair_coeffs(fh, gh)
    return float(np.dot(lam, c)), c

SPECS = {
    'Z2': [('c', 1, 0, 'Z2')], 'W3': [('c', 2, 1, 'W3')], 'W5': [('c', 3, 2, 'W5')], 'W7': [('c', 4, 3, 'W7')],
    'Z3': [('c', 1, 0, 'Z2'), ('c', 1, 0, 'Z3')],
    'Z4': [('c', 1, 0, 'Z2'), ('c', 1, 0, 'Z3'), ('c', 1, 0, 'Z4')],
    'Z3W3': [('c', 1, 0, 'Z2'), ('c', 1, 0, 'Z3'), ('c', 2, 1, 'W3')],
    'Z2W3': [('c', 1, 0, 'Z2'), ('c', 2, 1, 'W3')],
    'W3W5': [('c', 2, 1, 'W3'), ('c', 3, 2, 'W5')], 'W3W7': [('c', 2, 1, 'W3'), ('c', 4, 3, 'W7')],
    'W5W7': [('c', 3, 2, 'W5'), ('c', 4, 3, 'W7')],
    'W3W5W7': [('c', 2, 1, 'W3'), ('c', 3, 2, 'W5'), ('c', 4, 3, 'W7')],
    'W3W3b': [('c', 2, 1, 'W3'), ('c', 2, 1, 'W3b')],
    'W3Z3': [('c', 2, 1, 'W3'), ('c', 1, 0, 'Z2'), ('c', 1, 0, 'Z3')],
    'W3Z2': [('c', 2, 1, 'W3'), ('c', 1, 0, 'Z2')],
}
