#!/usr/bin/env python3
# Reviewer's check of PROOFS.md sections 2-5 on the Hermitian-factor class q = X B (N, deterministic quadrature).
# For each law:
#   (a) kernel sanity: int p = 1, E|q|^2 = 1, E|q|^4 = 2(3 + 6 kappa), <Z, q> = 4 s3, E[conj(X) q |q|^2] = 4 s3;
#   (b) Lemma 3:  E[N | q] = 0, measured as ||E[N|q]||^2 / ||N||^2  (||N||^2 = 44 + 40 kappa);
#   (c) the SHARP profile-free constant of the method:
#           theta*(q) = sup over profiles of ||c[h]||^2/(delta Omega_hat[h]) = (2/3)(||E[Z|q]||^2 + <Z,q>^2/u)/delta,
#       because c[h] = <E[Z|q], F>, F = q k'(V) ranges over a dense set of the charge-one radial functions of q, and
#       Lemma 1 is an equality for the best F.  Every proved constant must be >= theta*.
#   (d) the proved constants: Theta(kappa, zeta) of Theorem 4 (11), G(kappa) of (12), and for equal spectra the
#       sign-pairing bound (15) with the exact J_m, H(m) of (17), I(m) of (18).
import sys, json, math
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L

r, wr = L.r_grid(90.0)
def Theta(k, z): return (17 + 24 * k - (22 + 16 * k) ** 2 / (44 + 40 * k) + 16 * z) / (6 + 18 * k)
def Gk(k): return (33 + 217 * k + 168 * k * k) / (3 * (1 + 3 * k) * (11 + 10 * k))
def aff(m): return math.exp(-m + m * math.log(m) + 0.5 * math.log(math.pi) + math.lgamma((m + 1) / 2) - math.lgamma(m) - math.lgamma((m + 2) / 2))

laws = [L.EqualLaw(m) for m in (1, 2, 3, 4, 5, 6, 8, 12, 22, 40)] + \
       [L.TwoEigLaw(0.8, 0.6), L.TwoEigLaw(0.8, -0.6), L.TwoEigLaw(1.0, 0.25), L.TwoEigLaw(1.0, -0.25), L.TwoEigLaw(1.0, -1.0), L.TwoEigLaw(1.0, 0.999)]
out = []
print('%-26s %6s %6s | %9s %9s %9s %9s %9s | %10s | %8s %8s %8s | %8s %8s %8s %8s' % (
    'law', 'kappa', 'zeta', 'int p', 'E|q|^2', 'E|q|^4 er', '<Z,q> er', 'h=v er', 'E[N|q] rel', '||EZ|q||2', '||Z*||^2', '||Z||^2', 'theta*', 'Theta', 'G(kap)', 'signpair'))
for law in laws:
    p, w1, zp, npk = L.hermitian_kernels(law, r)
    k, s3, z = law.kappa, law.s3, law.zeta
    ip = float(wr @ p); m2 = float(wr @ (r ** 2 * p)); m4 = float(wr @ (r ** 4 * p))
    zq = float(wr @ (r * zp)); hv = float(wr @ (r ** 3 * w1))
    pos = p > 1e-300
    EZ2 = float(wr[pos] @ (zp[pos] ** 2 / p[pos])); EN2 = float(wr[pos] @ (npk[pos] ** 2 / p[pos]))
    delta = 4 + 12 * k
    tstar = (2 / 3) * (EZ2 + zq * zq) / delta
    Zs2 = 17 + 24 * k - (22 + 16 * k) ** 2 / (44 + 40 * k)
    th = Theta(k, z); g = Gk(k)
    sp = float('nan')
    if isinstance(law, L.EqualLaw):
        # exact J_m by quadrature on the law's own nodes: J = int_0^inf (f(b) - f(-b))^2/(f(b)+f(-b)) db
        m = law.m; sm = math.sqrt(m)
        from scipy.special import gammaln
        f = lambda b: np.where(m + sm * b > 0, sm * np.exp((m - 1) * np.log(np.maximum(m + sm * b, 1e-300)) - (m + sm * b) - gammaln(m)), 0.0)
        e = [0.0] + list(np.linspace(0, sm, 400)[1:]) + list(np.linspace(sm, sm + 80, 1600)[1:])
        bb, wb = L.panels(e, 8); fp, fm = f(bb), f(-bb)
        J = float(wb @ ((fp - fm) ** 2 / np.maximum(fp + fm, 1e-300)))
        sp = (17 * m * J + 40) / (6 * (m + 3))
        H = (34 * m * (1 - aff(m)) + 40) / (6 * (m + 3))
    rec = dict(name=law.name, kappa=k, zeta=z, int_p=ip, Eq2=m2, Eq4_err=m4 - 2 * (3 + 6 * k), Zq_err=zq - 4 * s3, hv_err=hv - 4 * s3,
               EN_rel=EN2 / (44 + 40 * k), EZq2=EZ2, Zstar2=Zs2, Z2=17 + 24 * k, theta_star=tstar, Theta=th, G=g, signpair=sp,
               ratio_h_v=16 * z / (3 + 9 * k))
    if isinstance(law, L.EqualLaw): rec.update(J=J, H=H)
    out.append(rec)
    print('%-26s %6.4f %6.4f | %9.6f %9.6f %9.1e %9.1e %9.1e | %10.1e | %8.4f %8.4f %8.4f | %8.4f %8.4f %8.4f %8.4f' % (
        law.name, k, z, ip, m2, rec['Eq4_err'], rec['Zq_err'], rec['hv_err'], rec['EN_rel'], EZ2, Zs2, 17 + 24 * k, tstar, th, g, sp), flush=True)
    assert tstar <= th * (1 + 1e-6), 'Theorem 4 violated?'
    if isinstance(law, L.EqualLaw): assert tstar <= sp * (1 + 1e-6) and sp <= H * (1 + 1e-9), 'Lemma 5/6 violated?'
json.dump(out, open(sys.argv[2], 'w'), indent=1)
print()
print('equal family: theta* (sharp, N) against the proved constants')
print('%4s %9s %9s %9s %9s %9s %9s' % ('m', 'h(v)=v', 'theta*', '(15),J_m', 'H(m)', 'G(1/m)', 'claimed'))
for rec in out:
    if 'J' in rec:
        m = round(1 / rec['kappa'])
        claimed = '7/20' if m >= 22 else '3/5' if m >= 12 else '13/10' if m >= 4 else '5/3'
        print('%4d %9.5f %9.5f %9.5f %9.5f %9.5f %9s' % (m, rec['ratio_h_v'], rec['theta_star'], rec['signpair'], rec['H'], rec['G'], claimed))
