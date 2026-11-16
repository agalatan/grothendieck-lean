# Sector layer of the gate-free degree-5 row at a row optimum (Gaussian ideal q = sigma W).  N only.
# For every adversary sector (k-side cubic G3, h-side quintic G5) we compute, at the q-only point:
#   * first-order profile  Gamma_j(s) = E_z[conj(e_j) (ph A+ + sgn_j ph A-)]   (charge c_j = 1 - (a-b));
#     its variance Var_j over q = sigma W (the content allowance with the trivial bound theta = 1);
#   * the elementary global curvature matrix  M(s)_kj = sum_pm sgn_j sgn_k E[e_j conj(e_k) / (2|A_pm|)]
#     (from |a+g| <= |a| + Re(conj(g) ph a) + |g|^2/(2|a|)), and sup_s lambda_max(C^-1/2 M(s) C^-1/2);
#   * the true (phase-averaged) second variation for an independent diffuse driver of each remote chaos type,
#     group by group, relative to the cost (ratio < 1 means: strict local maximum in that group).
import sys, os, json, math; sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, d5eng as D
from numpy.polynomial.laguerre import laggauss
from scipy.linalg import eigh

# sector list: (name, side, a, b); remote type: k -> (2-a, 1-b), h -> (3-a, 2-b)
SECT = [('rz', 'k', 1, 0), ('rzb', 'k', 0, 1), ('rA', 'k', 1, 1), ('rB', 'k', 2, 0), ('nu3', 'k', 2, 1)] + \
       [('p%d%d' % (a, b), 'h', a, b) for a in range(4) for b in range(3) if (a, b) != (3, 2)]
def remote(side, a, b): return (2 - a, 1 - b) if side == 'k' else (3 - a, 2 - b)
def charge(a, b): return 1 - (a - b)
# driver groups: remote types equal or conjugate
GROUPS = {
 'H10/H01': [('rA', 'X'), ('rB', 'Xb'), ('p22', 'X'), ('p31', 'Xb')],
 'H11':     [('rz', 'R'), ('p21', 'R')],
 'H20/H02': [('rzb', 'X'), ('p12', 'X'), ('p30', 'Xb')],
 'H21/H12 (independent cubic)': [('p11', 'X'), ('p20', 'Xb')],
 'H22':     [('p10', 'R')],
 'H31':     [('p01', 'X')],
 'H30':     [('p02', 'X')],
 'H32':     [('p00', 'X')],
}

def analyse(rec, nU=40, grid=None, e1=D.E1, eta=D.ETA):
    t, l, beta, bA, bB, sig, nu5 = rec['t'], rec['l'], rec['beta'], rec['bA'], rec['bB'], rec['sig'], rec['nu5']
    z, wz = grid if grid is not None else D.zgrid(half=False)
    T = np.abs(z) ** 2
    L = z * (l + beta * (T - 2)); base = L + nu5 * D.e_ab(3, 2, z)
    Dz = 1 - bA * D.e_ab(1, 1, z) - bB * D.e_ab(2, 0, z)
    names = [s[0] for s in SECT]; idx = {n: i for i, n in enumerate(names)}
    E = np.array([D.e_ab(a, b, z) for (_, _, a, b) in SECT])               # (17, Nz)
    sg = np.array([1.0 if side == 'h' else -1.0 for (_, side, _, _) in SECT])   # sign in A-
    cost = np.array([1 / e1 if side == 'k' else 1 / eta for (_, side, _, _) in SECT])
    UL, WL = laggauss(nU)
    if sig < 1e-6: UL, WL = np.array([0.0]), np.array([1.0])
    n = len(SECT)
    Gam = np.zeros((len(UL), n)); Mmax = []; Mavg = np.zeros((n, n))
    # phase-averaged group forms, accumulated over U
    Gforms = {g: None for g in GROUPS}
    comp = np.zeros((2, 2))   # (a,b) W-driven companions p11 = a q, p20 = b conj(q)
    for k, (u, wu) in enumerate(zip(UL, WL)):
        s = sig * math.sqrt(u)
        Ap, Am = base + s * Dz, base - s * Dz
        aP, aM = np.abs(Ap), np.abs(Am); phP, phM = Ap / aP, Am / aM
        # first order
        Gam[k] = np.real((np.conj(E) * (phP[None, :] + sg[:, None] * phM[None, :])) @ wz)
        # elementary curvature matrix, real symmetric
        WP, WM = wz / (2 * aP), wz / (2 * aM)
        Mk = np.real((E * WP[None, :]) @ np.conj(E).T + np.outer(sg, sg) * ((E * WM[None, :]) @ np.conj(E).T))
        Mk = (Mk + Mk.T) / 2
        Mmax.append(Mk); Mavg += wu * Mk
        # phase-averaged second variation, group by group (real quadratic forms in Re/Im of coefficients)
        for g, mem in GROUPS.items():
            m = len(mem); J = [idx[nm] for nm, _ in mem]
            # real coefficient basis: for each member, Re and Im part of its complex coefficient a_j
            # driver representation: X = (xi1 + i xi2), xi ~ N(0,1/2) iid (circular, E|X|^2=1); 'Xb' uses conj(X);
            # 'R' = one real driver xi ~ N(0,1/2) with complex coefficients (charge-0 types; worst pseudo-covariance)
            Q = np.zeros((2 * m, 2 * m))
            drivers = [0] if all(tp == 'R' for _, tp in mem) else [0, 1]
            for side_A, ph, wA, sgn in ((0, phP, wz / aP, None), (1, phM, wz / aM, None)):
                for dv in drivers:
                    # b(z) = sum_j sgn_j * a_j * e_j * (driver factor): driver factor for xi1: 1 ; for xi2: i (X) or -i (Xb)
                    cols = []
                    for jj, (nm, tp) in enumerate(mem):
                        j = idx[nm]; sj = 1.0 if side_A == 0 else sg[j]
                        fac = 1.0 if (dv == 0 or tp == 'R') else (1j if tp == 'X' else -1j)
                        v = sj * fac * E[j]
                        cols.append(v); cols.append(1j * v)          # derivative w.r.t. Re a_j and Im a_j
                    Bm = np.array(cols)                                # (2m, Nz)
                    Im_ = np.imag(Bm * np.conj(ph)[None, :])           # Im(b ph(A)bar) per basis direction
                    # E[xi^2] = 1/2 ; second-order term (Im(u ph Abar))^2 / (2|A|)
                    Q += 0.5 * (Im_ * (wA / 2)[None, :]) @ Im_.T
            Q = np.real(Q)
            if Gforms[g] is None: Gforms[g] = np.zeros_like(Q)
            Gforms[g] += wu * Q
        # W-driven companions (correlated with q): u = s (a e11 + b e20), both functionals with +
        for ph, aa in ((phP, aP), (phM, aM)):
            Bm = np.array([s * E[idx['p11']], s * E[idx['p20']]])
            Im_ = np.imag(Bm * np.conj(ph)[None, :])
            comp += wu * ((Im_ * (wz / (2 * aa))[None, :]) @ Im_.T)
    # first-order statistics
    out = dict(t=t, sig=sig, nu5=nu5)
    fo = {}
    for j, (nm, side, a, b) in enumerate(SECT):
        g = Gam[:, j]; mean2 = (WL @ g) ** 2 if charge(a, b) == 0 else 0.0
        var = max(WL @ (g * g) - mean2, 0.0)
        fo[nm] = dict(side=side, remote=remote(side, a, b), charge=charge(a, b), Gamma0=float(Gam[0, j]), var=float(var), mean=float(WL @ g))
    out['first_order'] = fo
    # elementary curvature: sup over s of lambda_max(C^-1/2 M C^-1/2), full and by blocks
    Cm = 1 / np.sqrt(cost)
    def lam(Mk, sel):
        Ms = (Cm[sel][:, None] * Mk[np.ix_(sel, sel)] * Cm[sel][None, :]); return float(np.linalg.eigvalsh(Ms)[-1])
    allsel = list(range(n)); hsel = [i for i in range(n) if SECT[i][1] == 'h']; ksel = [i for i in range(n) if SECT[i][1] == 'k']
    noAB = [i for i in range(n) if SECT[i][0] not in ('rA', 'rB')]
    out['elem'] = dict(full=max(lam(M, allsel) for M in Mmax), hside=max(lam(M, hsel) for M in Mmax),
                       kside=max(lam(M, ksel) for M in Mmax), noAB=max(lam(M, noAB) for M in Mmax),
                       full_avg=lam(Mavg, allsel), diag={SECT[i][0]: float(max(M[i, i] for M in Mmax) / cost[i]) for i in range(n)})
    # phase-averaged group ratios vs cost
    grp = {}
    for g, mem in GROUPS.items():
        cvec = np.repeat([cost[idx[nm]] for nm, _ in mem], 2)
        allR = all(tp == 'R' for _, tp in mem)
        Cmat = np.diag(cvec * (0.5 if allR else 1.0))     # cost of a real driver xi ~ N(0,1/2): |a|^2/2
        w_ = eigh(Gforms[g], Cmat, eigvals_only=True)
        grp[g] = float(w_[-1])
    out['group_ratio'] = grp
    cc = np.diag([1 / eta * sig ** 2, 1 / eta * sig ** 2]) if sig > 1e-6 else None
    out['companions_ratio'] = float(eigh(comp, cc, eigvals_only=True)[-1]) if cc is not None else None
    # trivial-content allowance: 1/4 sum_j Var_j / ((1 - lam_bar) c_j), lam_bar from the elementary h-block (h sectors)
    lb_h = out['elem']['hside']
    allow_h = sum(fo[nm]['var'] / (4 * (1 - lb_h) * (1 / eta)) for nm in ('p10', 'p01', 'p21', 'p12', 'p30')) if lb_h < 1 else float('inf')
    out['allow_h_trivial'] = allow_h
    out['allow_k_trivial_AB_if_curv_ok'] = sum(fo[nm]['var'] / (4 * (1 / e1)) for nm in ('rA', 'rB'))
    return out

if __name__ == '__main__':
    rec = json.loads(sys.argv[1]) if len(sys.argv) > 1 else dict(t=0.84, l=0.8402, beta=0.1591, bA=-0.1585, bB=-0.0965, sig=0.2381, nu5=0.0409)
    print(json.dumps(analyse(rec), indent=1))
