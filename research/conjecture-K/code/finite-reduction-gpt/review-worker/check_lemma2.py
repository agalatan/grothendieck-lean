"""Review: independent checks of REDUCTION.md section 2 and section 5 (label N for the Monte Carlo parts, exact where stated).

(i)   dropped spherical harmonics: E_M ||low||^2 = ||f||^2/m for bidegree (1,1), 2||f||^2/(m+1) for bidegree (2,1)      [Monte Carlo over M, exact per M]
(ii)  radial factors: E(s-1)^2, E(s^2-1)^2 <= 1/m and E(s^3-1)^2 <= 3/m + 2/m^2, s = R/sqrt(m), R^2 ~ Gamma(m)           [closed forms]
(iii) radius case: E_M||Q_M||^2 = (m-1)(m+2)/m^2 and the exact value of E_M||Q_M - S_M||^2 against 7/m                 [closed forms + Monte Carlo]
(iv)  the chain of section 5 on the Wick monomial (n = 1): E|Q| <= E_M||Q_M||_1 + sqrt(7/m) <= rho_m sqrt(1+1/m) + sqrt(7/m)
"""
import math
import numpy as np
from scipy import special, integrate

rng = np.random.default_rng(20261116)

def cgauss(*shape):
    return (rng.standard_normal(shape) + 1j * rng.standard_normal(shape)) / math.sqrt(2)

def sym(t):
    return 0.5 * (t + t.transpose(1, 0, 2))

print('(i) dropped harmonic components, Monte Carlo over M (20000 matrices each)')
for p, m in [(2, 3), (3, 8), (2, 40)]:
    t = sym(cgauss(p, p, p)); nf2 = 2 * np.sum(abs(t) ** 2)          # f = sum t_ijk :Y_i Y_j conj(Y_k):, ||f||^2 = 2||t||^2
    tr = np.einsum('iji->j', t)
    gam = cgauss(p, p); ng2 = np.sum(abs(gam) ** 2)                  # f11 = sum gam_jk (Y_j conj(Y_k) - delta_jk)
    N = 20000; acc21 = np.zeros(N); acc11 = np.zeros(N); top21 = np.zeros(N)
    for i in range(N):
        M = cgauss(p, m); MM = M @ M.conj().T
        # (2,1): low(zeta) = sum_b [2 sum_j (sum_ik t_ijk MM_ik/(m+1) - tr_j) M_jb] zeta_b ; ||low||^2 = |coef|^2/m
        coef = 2 * ((np.einsum('ijk,ik->j', t, MM) / (m + 1) - tr) @ M)
        acc21[i] = np.sum(abs(coef) ** 2) / m
        # (1,1): constant = sum_jk gam_jk MM_jk/m - tr gam
        acc11[i] = abs(np.sum(gam * MM) / m - np.trace(gam)) ** 2
    print(f'  p={p} m={m}: (2,1): {acc21.mean():.4f} +- {acc21.std()/math.sqrt(N):.4f}  expected 2||f||^2/(m+1) = {2*nf2/(m+1):.4f} |'
          f' (1,1): {acc11.mean():.4f} +- {acc11.std()/math.sqrt(N):.4f}  expected ||f||^2/m = {ng2/m:.4f}')

print('(ii) radial factors (exact Gamma moments)')
def Es(k, m):      # E s^k, s = R/sqrt m, R^2 ~ Gamma(m,1)
    return math.exp(special.gammaln(m + k / 2) - special.gammaln(m)) / m ** (k / 2)
for m in [2, 3, 8, 32, 1024]:
    e1 = Es(2, m) - 2 * Es(1, m) + 1; e2 = Es(4, m) - 2 * Es(2, m) + 1; e3 = Es(6, m) - 2 * Es(3, m) + 1
    print(f'  m={m:5d}: E(s-1)^2 = {e1:.6f}, E(s^2-1)^2 = {e2:.6f} (1/m = {1/m:.6f}); E(s^3-1)^2 = {e3:.6f} <= 3/m+2/m^2 = {3/m+2/m**2:.6f}: {e1 <= 1/m + 1e-12 and abs(e2 - 1/m) < 1e-12 and e3 <= 3/m + 2/m**2}')

print('(iii) radius case (all coordinates compressed)')
for m in [2, 3, 8, 32, 1024]:
    e3 = Es(6, m) - 2 * Es(3, m) + 1
    norm2 = Es(6, m) * (m - 1) / (m + 1)
    err = e3 * (m - 1) / (m + 1) + 2 / (m + 1)
    print(f'  m={m:5d}: E_M||Q_M||^2 = {norm2:.6f} = (m-1)(m+2)/m^2 = {(m-1)*(m+2)/m**2:.6f};  E_M||Q_M-S_M||^2 = {err:.6f} <= 7/m = {7/m:.6f}; sqrt = {math.sqrt(err):.4f} against sqrt(7/m) = {math.sqrt(7/m):.4f} (5/m would be {math.sqrt(5/m):.4f})')

print('(iv) Wick monomial Q = Y(|Y|^2-2)/sqrt2 (n = 1): M is a row mu in C^m; Q_M = |mu|^3/(m^{3/2} sqrt2) * ((m-1)/(m+1)) * w (|w|^2 - 2 g/(m-1)),')
print('     |w|^2 = t ~ Exp(1), g ~ Gamma(m-1) the rest of |Z|^2.   E|Q| = 0.690823')
EQ = integrate.quad(lambda r: math.sqrt(r / 2) * abs(r - 2) * math.exp(-r), 0, 2)[0] + integrate.quad(lambda r: math.sqrt(r / 2) * abs(r - 2) * math.exp(-r), 2, 60)[0]
for m in [2, 3, 4, 8, 16, 64, 256, 1024]:
    k = m - 1
    # E[ sqrt(t) |t - 2g/k| ]: integrate over g ~ Gamma(k) and t ~ Exp(1)
    def inner(g):
        c = 2 * g / k
        f = lambda tt: math.sqrt(tt) * abs(tt - c) * math.exp(-tt)
        return integrate.quad(f, 0, c, limit=200)[0] + integrate.quad(f, c, c + 80, limit=200)[0]
    lg = special.gammaln(k)
    dens = lambda g: math.exp((k - 1) * math.log(g) - g - lg) if g > 0 else (1.0 if k == 1 else 0.0)
    lo = max(0.0, k - 12 * math.sqrt(k) - 12); hi = k + 12 * math.sqrt(k) + 40
    A1 = integrate.quad(lambda g: inner(g) * dens(g), lo, hi, limit=400, points=[k] if k > 1 else None)[0]
    # second moment: E[t (t - 2g/k)^2] = E t^3 - 4 E t^2 E g/k + 4 E t E g^2/k^2 = 6 - 8 + 4 (k+1)/k
    A2 = 6 - 8 + 4 * (k + 1) / k
    c1 = math.exp(special.gammaln(m + 1.5) - special.gammaln(m)) / (m ** 1.5 * math.sqrt(2)) * (m - 1) / (m + 1)     # E|mu|^3 factor
    EM_L1 = c1 * A1
    ratio = A1 / math.sqrt(A2)                           # E|Q_M|/||Q_M||_2 (the same for every mu)
    rhs1 = EM_L1 + math.sqrt(7 / m)
    print(f'  m={m:5d}: E_M||Q_M||_1 = {EM_L1:.5f}; E|Q| = {EQ:.5f} <= E_M||Q_M||_1 + sqrt(7/m) = {rhs1:.5f}: {EQ <= rhs1};  E|Q_M|/||Q_M||_2 = {ratio:.5f} (a lower bound for rho_m);  3/sqrt(m) = {3/math.sqrt(m):.4f}')
