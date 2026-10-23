"""Float evaluator of the TRUE fibre potential  Psi(s) = sup_m  int (|L + B.(m+s a)| + |L - B.(m+s a)|) dgamma - m^T M^{-1} m
(anchored_potential_formalization.md section 1; equals the (R) definition of CERT_FORMAT.md).  Polar Gauss-Legendre x uniform angles; L-BFGS multistart."""
import sys, json, numpy as np
from fractions import Fraction as F
from scipy.optimize import minimize
CERT = '/Users/alingalatan/workspaces/grothe/handoff/lower-stein/cert-0745'
class Psi:
    def __init__(self, th, eps, nr=700, nt=256, R=8.5):
        x, w = np.polynomial.legendre.leggauss(nr); r = (x + 1) * R / 2; wr = w * R / 2 * 2 * r * np.exp(-r * r)
        th_ = (np.arange(nt) + 0.5) * 2 * np.pi / nt
        z = (r[:, None] * np.exp(1j * th_)[None, :]).ravel(); self.w = (wr[:, None] * np.ones(nt)[None, :] / nt).ravel()
        x2 = np.abs(z) ** 2; i2 = 1 / np.sqrt(2)
        self.B = np.array([np.ones_like(z), x2 - 1, z * z * i2, 1j * np.ones_like(z), 1j * (x2 - 1), -1j * z * z * i2,
                           z, z * (x2 - 2) * i2, 1j * z, 1j * z * (x2 - 2) * i2, np.conj(z), 1j * np.conj(z)])
        th = np.array(th, float); E = np.array([[th[0], th[1], th[2]], [th[1], th[3], th[4]], [th[2], th[4], th[5]]]); Rm = np.array([[th[6], th[7]], [th[7], th[8]]])
        M = np.zeros((12, 12)); M[0:3, 0:3] = E; M[3:6, 3:6] = E; M[6:8, 6:8] = Rm; M[8:10, 8:10] = Rm; M[10:12, 10:12] = eps * np.eye(2)
        self.M = M; self.Q = np.linalg.inv(M); self.L = z * (th[13] + th[14] * (x2 - 2)); self.a = np.zeros(12); self.a[:3] = np.array([1.0, 0, 0]) + th[10:13]
        self.Bw = np.conj(self.B) * self.w[None, :]
    def J(self, m, s, grad=False):
        y = m + s * self.a; p = y @ self.B; A = self.L + p; Bm = self.L - p; aA = np.abs(A); aB = np.abs(Bm)
        val = self.w @ (aA + aB) - m @ self.Q @ m
        if not grad: return val
        g = (self.Bw @ (A / np.maximum(aA, 1e-300))).real - (self.Bw @ (Bm / np.maximum(aB, 1e-300))).real - 2 * self.Q @ m
        return val, g
    def psi(self, s, starts=None, rng=None, nrand=4):
        best = (-np.inf, None); st = [np.zeros(12)] + (starts or [])
        rng = rng or np.random.default_rng(0)
        for k in range(nrand): st.append(0.05 * rng.standard_normal(12))
        for m0 in st:
            r = minimize(lambda m: tuple(-v for v in self.J(m, s, True)), m0, jac=True, method='L-BFGS-B', options={'maxiter': 500, 'ftol': 1e-15, 'gtol': 1e-10})
            if -r.fun > best[0]: best = (-r.fun, r.x)
        return best
def load_row(t):
    R = json.load(open(f'{CERT}/row_{t}.json')); return R, [float(F(v)) for v in R['theta']], float(F(R['eps']))
if __name__ == "__main__":
    t = sys.argv[1]; R, th, eps = load_row(t); P = Psi(th, eps)
    low = [e for e in json.load(open('/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/anchored-tables-20261011/lower_certificates.json')) if e['profile']['name'] == t]
    print(f"row {t}: {len(low)} lower/upper records; grid {len(P.w)} points")
    for e in sorted(low, key=lambda e: F(e['lower']['s'])):
        s = float(F(e['lower']['s'])); mt = np.zeros(12); mt[:3] = [float(F(v)) for v in e['lower']['trial_m']]
        Jt = P.J(mt, s); Lp = float(F(e['lower']['lower_potential'])); U = float(F(e['upper']['upper'])) if 'upper' in e['upper'] else None
        v, m = P.psi(s, starts=[mt])
        print(f"  s={s:.4f}: J(trial_m) float {Jt:.9f} vs rigorous lower {Lp:.9f} (diff {Jt-Lp:+.2e}) | Psi_float {v:.9f} in [L, U]=[{Lp:.9f}, {U:.9f}]? {Lp-2e-7 <= v <= U+2e-7}  U-Psi={U-v:.2e}  m-block1={np.round(m[:3],5)} |m_rest|={np.abs(m[3:]).max():.1e}")
