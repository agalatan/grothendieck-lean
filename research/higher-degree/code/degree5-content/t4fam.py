# T3 validation and the T4 frame on the fixed hard families, per band row.  N.
import sys, json, warnings; warnings.filterwarnings('ignore')
import numpy as np, rowlib as R, t4lib as T4, rice as RI
KAPPA = 0.82
def run(k, s, t, mu, tlo, ufr):
    row = R.Row('out/prof_%d.npz' % k)
    sectors = {'A': lambda x: row.ga(x) + s * row.g0(x), 'B': lambda x: row.gb(x) + t * row.g0(x)}
    core = T4.Core(); rng = np.random.default_rng(42); out = []
    fams = [('junta', [1, 0, 0, 0, 0, 0], 1.0), ('Wick+shared (0.3, i)', [np.cos(0.3), 0, 0, 0, 1j * np.sin(0.3), 0], 1.0), ('H(X)+H(Y)', [1, 1, 0, 0, 0, 0], 1.0),
            ('X(|Y|^2-1)', [0, 0, 0, 0, 1, 0], 1.0), ('X^2 Ybar', [0, 0, 1, 0, 0, 0], 1.0), ('spike c=0.85', [1, 0, 0, 0, 0, 0], 0.85), ('spike c=0.7', [1, 0, 0, 0, 0, 0], 0.7),
            ('spike c=0.5', [1, 0, 0, 0, 0, 0], 0.5), ('spike c=0.35', [1, 0, 0, 0, 0, 0], 0.35), ('X(|Y|^2-1) c=0.6', [0, 0, 0, 0, 1, 0], 0.6),
            ('random c=1', rng.standard_normal(6) + 1j * rng.standard_normal(6), 1.0), ('random c=0.6', rng.standard_normal(6) + 1j * rng.standard_normal(6), 0.6)]
    for f in ufr:
        sig = np.sqrt(f * row.ustar)
        for nm, coef, c in fams:
            o = T4.evaluate(core, row, sectors, coef, c, sig)
            cont = sum(o['sect'][n]['content'] for n in 'AB'); t3 = sum(o['sect'][n]['t3'] for n in 'AB')
            star = sum(o['sect'][n]['Om_star'] for n in 'AB'); sup = sum(max(o['sect'][n]['Om_core'], o['sect'][n]['Om_perp']) for n in 'AB'); hat = sum(o['sect'][n]['Omhat'] for n in 'AB')
            X = 4 * mu * KAPPA * (o['D'] + o['Vsl']); Tr = T4.rice_T(o)
            err = max(abs(o['sect'][n]['t3'] - o['sect'][n]['content']) for n in 'AB') / max(cont, 1e-300) if cont > 1e-12 else float('nan')
            rec = dict(name=nm, c=c, ufrac=f, chi=o['chi'], contd=cont / o['delta'], t3err=err, star=star, sup=sup, hat=hat, Dd=o['D'] / o['delta'], truth=cont / X,
                       rho_star=o['delta'] * star / X, rho_sup=o['delta'] * sup / X, T_rice=Tr, feasible=bool(Tr >= tlo))
            out.append(rec)
            print('t=%.3f u/u*=%.2f %-22s chi %5.2f | content/delta %.5f  T3 rel.err %.0e | Omega: e* %.4f sup %.4f Omhat %.4f | D/delta %.4f | ratio to 4mu*kappa*(D+Vsl): truth %.3f  T4 e* %.3f  T4 sup %.3f | %s' % (
                row.t, f, nm, rec['chi'], rec['contd'], err, star, sup, hat, rec['Dd'], rec['truth'], rec['rho_star'], rec['rho_sup'], 'ok' if rec['feasible'] else 'not a response (R1)'), flush=True)
    json.dump(out, open('out/t4fam_%d.json' % k, 'w'), indent=1)
if __name__ == '__main__':
    k = int(sys.argv[1]); s, t, mu, tlo = [float(x) for x in sys.argv[2:6]]
    run(k, s, t, mu, tlo, [float(x) for x in sys.argv[6].split(',')])
