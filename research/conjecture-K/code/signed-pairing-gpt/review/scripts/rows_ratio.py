#!/usr/bin/env python3
# Reviewer's independent numerical check (N) of the content-law inequality  ||c[h]||^2 <= theta delta Omega_hat[h]
# on the six rows, for the two tilted profiles h_A = (G_A + 0.4 G_0)(sqrt v)/sqrt v and h_B = (G_B + 0.3 G_0)(sqrt v)/sqrt v.
# Cubics: X(|Y|^2 - 1); the equal family m = 4, 12, 22; A = diag(0.8, 0.6) and diag(0.8, -0.6); the limit model
# Q = alpha X(|X|^2 - 2) + beta W at a grid of rho = alpha/beta that contains the ends of the certified ranges and the
# spike family c = 0.35, 0.5, 0.7, 0.85 of CONTENT_LEMMA_D5 section 11 (rho = c/sqrt(2(1 - c^2))).
# For each case: the content computed directly, the right side of the content representation (Lemma 2 / Lemma 10) as a
# check, delta, Omega_hat, the ratio, and the proved constant it must stay below.
#   argv: <scripts dir> <content5 dir (read-only)> <package rows.json> <out json> [quick]
import sys, json, math, time
import numpy as np
sys.path.insert(0, sys.argv[1])
import siglib as L

C5 = sys.argv[2]; rows_pkg = json.load(open(sys.argv[3])); OUT = sys.argv[4]
QUICK = len(sys.argv) > 5
ROWS = [(5, '0.80'), (7, '0.82'), (9, '0.84'), (10, '0.845'), (11, '0.85'), (12, '0.855')]
CAP = {'0.80': (0.11, 7 / 20), '0.82': (0.13, 3 / 5), '0.84': (0.2, 13 / 10), '0.845': (0.25, 9 / 5), '0.85': (1 / 3, 12 / 5), '0.855': (0.6, 18 / 5)}
NEED = {'0.80': 0.37, '0.82': 0.64, '0.84': 1.33, '0.845': 1.88, '0.85': 2.5, '0.855': 3.7}
TILT = {'A': 0.4, 'B': 0.3}
FR = [0.85, 1.0] if QUICK else [0.1, 0.25, 0.5, 0.85, 1.0, 1.25, 2.0, 5.0, 20.0]
rho_of_c = lambda c: c / math.sqrt(2 * (1 - c * c))
RHOS = sorted(set([0.05, 0.11, 0.13, 0.2, 0.25, 1 / 3, 0.6] + [rho_of_c(c) for c in (0.35, 0.5, 0.7, 0.85)]))

def Theta(k, z): return (17 + 24 * k - (22 + 16 * k) ** 2 / (44 + 40 * k) + 16 * z) / (6 + 18 * k)
def aff(m): return math.exp(-m + m * math.log(m) + 0.5 * math.log(math.pi) + math.lgamma((m + 1) / 2) - math.lgamma(m) - math.lgamma((m + 2) / 2))
def H(m): return (34 * m * (1 - aff(m)) + 40) / (6 * (m + 3))

t0 = time.time()
r, wr = L.r_grid(90.0)
herm = []
for law, claimed, formula in [(L.EqualLaw(1), 5 / 3, Theta(1, 1)), (L.EqualLaw(4), 13 / 10, H(4)), (L.EqualLaw(12), 3 / 5, H(12)), (L.EqualLaw(22), 7 / 20, H(22)),
                              (L.TwoEigLaw(0.8, 0.6), 5 / 3, None), (L.TwoEigLaw(0.8, -0.6), 5 / 3, None)]:
    p, w1, zp, _ = L.hermitian_kernels(law, r)
    pos = p > 1e-300
    tstar = (2 / 3) * (float(wr[pos] @ (zp[pos] ** 2 / p[pos])) + float(wr @ (r * zp)) ** 2) / (4 + 12 * law.kappa)
    herm.append(dict(name=('X(|Y|^2-1)' if law.name == 'equal m=1' else law.name), kappa=law.kappa, p=p, w1=w1, zp=zp, claimed=claimed,
                     formula=formula if formula is not None else Theta(law.kappa, law.zeta), tstar=tstar))
T = L.t_grid(40.0, 0.1)
lim = []
for rho in RHOS:
    s, ws = L.s_grid(240 * rho + 12)
    p, w1, zp = L.limit_kernels(rho, s, T)
    pos = p > 1e-300
    EZ2 = float(ws[pos] @ (zp[pos] ** 2 / p[pos])); u1 = 1 + 2 * rho * rho
    chk = dict(int_p=float(ws @ p), Eq2_err=float(ws @ (s * s * p)) - u1, Eq4_err=float(ws @ (s ** 4 * p)) - (2 * u1 * u1 + 168 * rho ** 4),
               C0Q_err=float(ws @ (s * zp)) - 32 * rho, hv_err=float(ws @ (s ** 3 * w1)) - 32 * rho ** 3)
    lim.append(dict(rho=rho, s=s, ws=ws, p=p, w1=w1, zp=zp, EC0=EZ2, tstar=(EZ2 + 1024 * rho * rho / u1) / 252, chk=chk))
    print('limit model rho = %.4f (c = %.3f, chi = %.3f): int p = %.8f, errors E|Q|^2 %.1e, E|Q|^4 %.1e, <C0,Q> %.1e, h=v content %.1e | ||E[C0|Q]||^2 = %.4f (of 764) | sharp profile-free theta*(rho) = %.5f' % (
        rho, math.sqrt(2 * rho * rho / u1), 42 * (2 * rho * rho / u1) ** 2, chk['int_p'], chk['Eq2_err'], chk['Eq4_err'], chk['C0Q_err'], chk['hv_err'], EZ2, lim[-1]['tstar']), flush=True)
print('kernels ready, %.0f s' % (time.time() - t0), flush=True)

results = []
for k, tname in ROWS:
    rec, GA, GB, G0 = L.load_row('%s/out/prof_%d.npz' % (C5, k))
    pk = [x for x in rows_pkg if x['t'] == tname][0]
    dev = max(abs(rec[a] - float(pk[b])) for a, b in (('l', 'l'), ('beta', 'beta'), ('bA', 'bA'), ('bB', 'bB'), ('nu5', 'nu5'), ('sig', 'sigma')))
    sv = [0.05, 0.3, 1.0, 2.5]
    direct = L.row_profile_direct({a: float(pk[a]) for a in ('l', 'beta', 'bA', 'bB', 'nu5')}, sv)
    tab = np.array([[float(GA(x)), float(GB(x)), float(G0(x))] for x in sv])
    print('\nrow t = %s (table %d): row constants agree with the package rows.json to %.1e; profile tables against my own z-quadrature at s = %s: max abs. difference %.1e (values up to %.3f); G(0) = %.1e, %.1e, %.1e' % (
        tname, k, dev, sv, np.abs(direct - tab).max(), np.abs(tab).max(), float(GA(0.0)), float(GB(0.0)), float(G0(0.0))), flush=True)
    ustar = float(pk['sigma']) ** 2
    prof_G = {'A': (lambda s, GA=GA, G0=G0: GA(s) + TILT['A'] * G0(s)), 'B': (lambda s, GB=GB, G0=G0: GB(s) + TILT['B'] * G0(s))}
    for fr in FR:
        u = fr * ustar; su = math.sqrt(u)
        for X in 'AB':
            G = prof_G[X]; pr = L.Profile(G, u)
            sp = su * r; f1 = pr.f1(sp); Gs = G(sp)
            for hl in herm:
                c = float(wr @ (Gs * hl['w1'])); cT3 = u * float(wr @ (hl['zp'] * f1))
                EVk2 = float(wr @ (hl['p'] * f1 * f1)); EVk = float(wr @ (hl['p'] * sp * f1))
                Om = 1.5 * EVk2 - 0.75 * EVk * EVk / u; delta = u * u * (4 + 12 * hl['kappa'])
                results.append(dict(t=tname, prof=X, ufrac=fr, u=u, law=hl['name'], kind='herm', chi=4 + 12 * hl['kappa'], c2=c * c, cT3=cT3 * cT3, delta=delta, Omhat=Om,
                                    ratio=c * c / (delta * Om), claimed=hl['claimed'], formula=hl['formula'], tstar=hl['tstar'], t3err=abs(c - cT3) / max(abs(c), 1e-300)))
            for lm in lim:
                rho = lm['rho']; beta = math.sqrt(u / (1 + 2 * rho * rho)); alpha = rho * beta
                sp = beta * lm['s']; f1 = pr.f1(sp)
                c = float(lm['ws'] @ (G(sp) * lm['w1'])); cT3 = alpha * alpha * float(lm['ws'] @ (lm['zp'] * f1))
                EVk2 = float(lm['ws'] @ (lm['p'] * f1 * f1)); EVk = float(lm['ws'] @ (lm['p'] * sp * f1))
                Om = 1.5 * EVk2 - 0.75 * EVk * EVk / u; delta = 168 * alpha ** 4
                results.append(dict(t=tname, prof=X, ufrac=fr, u=u, law='limit rho=%.4f' % rho, rho=rho, kind='limit', chi=delta / (u * u), c2=c * c, cT3=cT3 * cT3, delta=delta, Omhat=Om,
                                    ratio=c * c / (delta * Om), tstar=lm['tstar'], t3err=abs(c - cT3) / max(abs(c), 1e-300)))
    rs = [x for x in results if x['t'] == tname]
    print('  largest relative difference between the content and the representation <Z, F> (Lemma 2 / Lemma 10), all cases of the row: %.1e' % max(x['t3err'] for x in rs))
    print('  %-24s %6s | %-32s | %-32s | %8s %8s %8s' % ('cubic', 'chi', 'ratio, profile A: u/u* = .85, 1, max over u (at)', 'ratio, profile B: .85, 1, max (at)', 'theta*', 'proved', 'needed'))
    names = [h['name'] for h in herm] + ['limit rho=%.4f' % x for x in RHOS]
    for nm in names:
        cells = []
        for X in 'AB':
            sel = [x for x in rs if x['law'] == nm and x['prof'] == X]
            g = lambda fr: [x['ratio'] for x in sel if x['ufrac'] == fr][0]
            mx = max(sel, key=lambda x: x['ratio'])
            cells.append('%.4f  %.4f  %.4f (%5.2f)' % (g(0.85), g(1.0), mx['ratio'], mx['ufrac']))
        x0 = [x for x in rs if x['law'] == nm][0]
        if x0['kind'] == 'herm': proved = '%.4f' % x0['formula']
        else:
            proved = ('%.4f' % CAP[tname][1]) if x0['rho'] <= CAP[tname][0] + 1e-12 else 'none'
        print('  %-24s %6.3f | %-32s | %-32s | %8.4f %8s %8.2f' % (nm, x0['chi'], cells[0], cells[1], x0['tstar'], proved, NEED[tname]), flush=True)
        worst = max(x['ratio'] for x in rs if x['law'] == nm)
        assert worst <= x0['tstar'] * (1 + 1e-4), ('ratio above the sharp constant: numerics inconsistent', nm, worst, x0['tstar'])
        if proved != 'none': assert worst <= float(proved), ('PROVED CONSTANT VIOLATED', tname, nm, worst, proved)
    if tname == '0.84':
        print('  cross-check with CONTENT_LEMMA_D5 section 11.3 (t = 0.84, u = 0.85 u*; A + B summed):  sum c^2/delta, sum Omega_hat')
        for nm, ref in [('X(|Y|^2-1)', (0.0157, 0.0717))] + [('limit rho=%.4f' % rho_of_c(c), ref) for c, ref in ((0.35, (0.0147, 0.0955)), (0.5, (0.0174, 0.0952)), (0.7, (0.0181, 0.0940)), (0.85, (0.0180, 0.0901)))]:
            sel = [x for x in rs if x['law'] == nm and x['ufrac'] == 0.85]
            print('    %-22s mine %.4f, %.4f | table %.4f, %.4f' % (nm, sum(x['c2'] / x['delta'] for x in sel), sum(x['Omhat'] for x in sel), ref[0], ref[1]))
json.dump(dict(rows=results, limit=[dict(rho=l['rho'], tstar=l['tstar'], EC0=l['EC0'], chk=l['chk']) for l in lim],
               herm=[dict(name=h['name'], tstar=h['tstar'], claimed=h['claimed'], formula=h['formula']) for h in herm]), open(OUT, 'w'), indent=1)
print('\nall proved constants are upper bounds in every case computed; done in %.0f s' % (time.time() - t0))
