#!/usr/bin/env python3
"""The measured content ratio ||c_X||^2/(delta Omhat_X) of a band row of a game, on the content worker's families and on its
shared-driver class (N; lower bounds on a supremum over cubics in two core variables).  claude-b9ee worker d5newcap, 16 Nov 2026.
Same evaluator as the content study (its r4lib.light / r4lib.ratios, r4_ratio.py fam, r4_xz.py), with the row data from
band_rows.json.  The ratio is invariant under scaling of the profile, so it depends on the game only through the SHAPE of the
tilted sector profiles.
usage (cwd = the game folder): D5_E1=.. D5_ETA=.. ratio_game.py k u1,u2,...   -> out/ratio_<k>.json"""
import sys, os, json, warnings; warnings.filterwarnings('ignore')
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import numpy as np
import rowlib as R, t4lib as T4, rice as RI
from scipy.optimize import minimize
KAPPA = 0.82

def families(seed=42):
    rng = np.random.default_rng(seed)
    return [('junta', [1, 0, 0, 0, 0, 0], 1.0), ('Wick+shared (0.3, i)', [np.cos(0.3), 0, 0, 0, 1j * np.sin(0.3), 0], 1.0), ('H(X)+H(Y)', [1, 1, 0, 0, 0, 0], 1.0),
            ('X(|Y|^2-1)', [0, 0, 0, 0, 1, 0], 1.0), ('X^2 Ybar', [0, 0, 1, 0, 0, 0], 1.0), ('spike c=0.85', [1, 0, 0, 0, 0, 0], 0.85), ('spike c=0.7', [1, 0, 0, 0, 0, 0], 0.7),
            ('spike c=0.5', [1, 0, 0, 0, 0, 0], 0.5), ('spike c=0.35', [1, 0, 0, 0, 0, 0], 0.35), ('X(|Y|^2-1) c=0.6', [0, 0, 0, 0, 1, 0], 0.6),
            ('random c=1', rng.standard_normal(6) + 1j * rng.standard_normal(6), 1.0), ('random c=0.6', rng.standard_normal(6) + 1j * rng.standard_normal(6), 0.6)]

def light(core, row, sectors, coef, c, sig):
    coef = np.asarray(coef, complex); coef = coef / np.linalg.norm(coef)
    u = sig * sig; w = core.w; p = coef @ core.m
    chi_p = float(w @ np.abs(p) ** 4 - 2.0)
    a0 = sig * c * p; r = np.abs(a0); rc = np.minimum(r, 6.0); pha = np.where(r > 0, a0 / np.maximum(r, 1e-300), 1.0)
    tab = T4.tables(row, sectors, c, sig)
    out = dict(u=u, c=c, chi=c ** 4 * chi_p, delta=c ** 4 * u * u * chi_p, D=row.B5(u) - float(w @ tab['psi'](rc)), Vsl=row.Vsl(u), law=(tab['sm'], rc, w), sect={})
    wyc = [w * np.conj(core.ye[0]), w * np.conj(core.ye[1])]
    for name in sectors:
        T = tab['sect'][name]
        cont = np.array([wyc[j] @ (pha * T['S1G'](rc)) for j in range(2)])
        EVk2 = float(w @ T['S0f2k'](rc)); EVk = float(w @ T['S0f2'](rc))
        out['sect'][name] = dict(content=float(np.sum(np.abs(cont) ** 2)), Omhat=1.5 * EVk2 - 0.75 * EVk * EVk / u)
    return out

def ratios(o):
    d = o['delta']; A, B = o['sect']['A'], o['sect']['B']
    if d <= 0: return 0.0, 0.0, 0.0
    return A['content'] / (d * A['Omhat']), B['content'] / (d * B['Omhat']), (A['content'] + B['content']) / (d * (A['Omhat'] + B['Omhat']))

if __name__ == '__main__':
    k = int(sys.argv[1]); ufr = sys.argv[2].split(','); tag = sys.argv[3] if len(sys.argv) > 3 else ''      # an energy 'cX' = X times the response cap
    cfg = json.load(open(os.environ.get('BAND_ROWS', 'band_rows.json'))); rw = cfg['rows'][str(k)]; s, t = cfg['tilt']; tl, mu, tlo = rw['t'], rw['mu'], rw['tlo']
    row = R.Row(rw.get('prof', 'out/prof_%d.npz' % k))
    sectors = {'A': lambda x: row.ga(x) + s * row.g0(x), 'B': lambda x: row.gb(x) + t * row.g0(x)}
    ucap = 4 * RI.E1 ** 2 * 0.432306903 * (0.886762780 - tlo); core = T4.Core(n1=(16, 24), nth=32); out = []
    cf = lambda phi, psi: [np.cos(phi), 0, 0, 0, np.sin(phi) * np.exp(1j * psi), 0]
    for f in ufr:
        u = (min(float(f[1:]), 0.999) * ucap) if f.startswith('c') else min(float(f) * row.ustar, 0.999 * ucap); sig = np.sqrt(u); fam = []
        for nm, coef, c in families():
            o = light(core, row, sectors, coef, c, sig); rA, rB, rS = ratios(o)
            Tr = T4.rice_T(o) if c == 1.0 else None
            fam.append(dict(name=nm, c=c, chi=o['chi'], rA=rA, rB=rB, rS=rS, Dd=o['D'] / o['delta'], feasible=(bool(Tr >= tlo) if c == 1.0 else True)))
        val = lambda phi, psi: ratios(light(core, row, sectors, cf(phi, psi), 1.0, sig))
        grid = [(val(phi, psi)[0], phi, psi) for phi in np.linspace(0.3, 1.4, 12) for psi in np.linspace(0, np.pi, 13)]
        g0 = max(grid); r_ = minimize(lambda x: -val(x[0], x[1])[0], [g0[1], g0[2]], method='Nelder-Mead', options={'maxiter': 120, 'xatol': 1e-3, 'fatol': 1e-7})
        phi, psi = r_.x; o = light(core, row, sectors, cf(phi, psi), 1.0, sig); rA, rB, rS = ratios(o); Tr = T4.rice_T(o)
        xz = dict(phi=float(phi), psi=float(psi), chi=o['chi'], rA=rA, rB=rB, rS=rS, feasible=bool(Tr >= tlo), Dd=o['D'] / o['delta'])
        bf = max(fam, key=lambda r: r['rA']); bff = max([r for r in fam if r['feasible']], key=lambda r: r['rA'])
        best_any = max(bf['rA'], rA); best_feas = max(bff['rA'], rA if xz['feasible'] else 0.0)
        out.append(dict(ufrac=u / row.ustar, ucapfrac=u / ucap, families=fam, shared=xz, largest_A=best_any, largest_A_possible=best_feas))
        print('t=%s (t_lo %.4f) u/cap=%.3f u/u*=%.3f: largest ratio A %.4f (possible responses %.4f) | shared driver %.4f (B %.4f, sum %.4f) at alpha %.2f beta %.2f psi %.2f pi chi %.1f %s | families: %s %.4f; possible: %s %.4f' % (
            tl, tlo, u / ucap, u / row.ustar, best_any, best_feas, rA, rB, rS, np.cos(phi), np.sin(phi), psi / np.pi, o['chi'], 'possible' if xz['feasible'] else 'not possible (R1)',
            bf['name'], bf['rA'], bff['name'], bff['rA']), flush=True)
    json.dump(dict(k=k, t=tl, tlo=tlo, tilt=[s, t], ustar=row.ustar, pts=out), open('out/ratio_%d%s.json' % (k, tag), 'w'), indent=1)
