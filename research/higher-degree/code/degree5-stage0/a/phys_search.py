# Stage 0 (a): search for explicit cubics that are bad for a given row (N).  A research worker of claude-b9ee.
# For a fixed row p of a game at t, maximise over q in H_{2,1}(C^n) + (a diffuse Gaussian bulk) and nu
#     F(q, nu) = E Psi5(|q|; nu; p) - kappa(p) ||q||^2 - nu^2/eta
# (the q-only response of s0core.py with sigma = ||q||).  q = sum_j c_j B_j, B_j the orthonormal Wick monomials
# prod_k e_{p_k, q_k}(y_k) with sum p = 2, sum q = 1, and B_0 = g an independent standard complex Gaussian (the limit of
# diffuse cubics).  The expectation is a sample average on a scrambled Sobol sample (L-BFGS, analytic gradient); every
# candidate is RE-SCORED on an independent larger sample, and its law (atoms) is written out, so that the value quoted
# is the value of an actual response up to the quadrature error of the re-scoring sample.
#   usage: phys_search.py E1 ETA t l beta bA bB n OUT.npz [starts=6] [seed=1]
import sys, os, json, math, itertools, time
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np, s0core as C, physlaws as PL
from scipy.optimize import minimize
from scipy.interpolate import CubicSpline

def basis(n, y, g):
    """orthonormal basis of H_{2,1}(C^n) at the sample y (list of n arrays), plus the bulk Gaussian g."""
    B = [g]; names = ['bulk']
    for (a, b) in itertools.combinations_with_replacement(range(n), 2):
        for c in range(n):
            p = [0] * n; q = [0] * n; p[a] += 1; p[b] += 1; q[c] += 1
            f = np.ones_like(g)
            for k in range(n):
                if p[k] or q[k]: f = f * C.e_ab(p[k], q[k], y[k])
            B.append(f); names.append('y%dy%dY%d' % (a + 1, b + 1, c + 1))
    return np.array(B), names

def sample(n, m, seed):
    U = PL.sample(2 * n + 2, m, seed)
    y = [PL.cgauss(U[:, 2 * k], U[:, 2 * k + 1]) for k in range(n)]
    return y, PL.cgauss(U[:, 2 * n], U[:, 2 * n + 1])

if __name__ == '__main__':
    e1, eta, t = map(float, sys.argv[1:4]); p = [float(x) for x in sys.argv[4:8]]; n = int(sys.argv[8]); outp = sys.argv[9]
    starts = int(sys.argv[10]) if len(sys.argv) > 10 else 6; seed = int(sys.argv[11]) if len(sys.argv) > 11 else 1
    eng = C.Engine(e1, eta); kap = eng.kappa(p); rng = np.random.default_rng(seed); t0 = time.time()
    nus = np.array([0.0, 0.01, 0.02, 0.04, 0.07, 0.11, 0.16])
    tab = C.PsiTable(eng, p, nus); dsp = [sp.derivative() for sp in tab.sp]
    y, g = sample(n, 15, 100 + seed); B, names = basis(n, y, g); nb = len(B)
    y2, g2 = sample(n, 20, 900 + seed); B2, _ = basis(n, y2, g2)
    def F(x, j, Bm):
        c = x[:nb] + 1j * x[nb:]; q = c @ Bm; r = np.abs(q); rc = np.minimum(r, C.SGRID[-1])
        val = tab.sp[j](rc).mean() - kap * (x @ x)
        w = dsp[j](rc) * np.conj(q / np.maximum(r, 1e-300)) / len(r)
        gc = Bm @ w
        return -val, -np.concatenate([np.real(gc), -np.imag(gc)]) + 2 * kap * x
    cands = []
    for st in range(starts):
        for j in ([2] if st else range(len(nus))):
            x0 = rng.normal(size=2 * nb); 
            if st % 3 == 0: x0[1:nb] *= 0.3; x0[nb + 1:] *= 0.3              # mostly bulk
            if st % 3 == 1: x0[0] = x0[nb] = 0.0                               # no bulk
            x0 *= 0.75 / np.linalg.norm(x0)
            r = minimize(F, x0, args=(j, B), jac=True, method='L-BFGS-B', options=dict(maxiter=400))
            cands.append((-r.fun - nus[j] ** 2 / eta, j, r.x))
    cands.sort(key=lambda c: -c[0]); out = {}; info = []
    seen = []
    for v, j, x in cands[:6]:
        # re-score on the independent sample at every nu of the table, keep the best
        res = [(-F(x, jj, B2)[0] - nus[jj] ** 2 / eta, jj) for jj in range(len(nus))]; v2, j2 = max(res)
        c = x[:nb] + 1j * x[nb:]; q = c @ B2; u = float(x @ x); r = np.abs(q) / math.sqrt(u)
        a, w = PL.atoms(r); key = 'n%d_s%d_%d' % (n, seed, len(info))
        out[key + '_r'] = a; out[key + '_w'] = w
        info.append(dict(key=key, in_sample=float(v), rescored=float(v2), row_value=float(eng.cconst(t, p) + v2), nu=float(nus[j2]), sigma=math.sqrt(u), bulk_share=float(abs(c[0]) ** 2 / u),
                         Er=float(r.mean()), s=float((r ** 4).mean() - 2), P_U_le_1e2=float((r ** 2 <= 1e-2).mean()), coef=[[float(z.real), float(z.imag)] for z in c], names=names))
    np.savez_compressed(outp, **out); json.dump(dict(e1=e1, eta=eta, t=t, p=p, n=n, secs=time.time() - t0, cands=info), open(outp.replace('.npz', '.json'), 'w'), indent=1)
    for i in info: print('%s: row value %.7f (in-sample F %.7f, rescored %.7f) nu %.3f sigma %.4f bulk %.3f  E r %.4f  s %.2f  P(U<=0.01) %.4f' % (i['key'], i['row_value'], i['in_sample'], i['rescored'], i['nu'], i['sigma'], i['bulk_share'], i['Er'], i['s'], i['P_U_le_1e2']))
