"""Task 3 for certificates (N): a certificate row evaluated on genuine cubics.

For a cubic with kurtosis s and scalars (n,h,b,y,z), and the row whose s-interval contains s:
  (i)   pointwise (C2) holds along the samples (min of RHS - |q|, with the true (c2, c1, rho));
  (ii)  the two test identities:  E[G1 - c2 phi1 - rho Y1] = 0,  E[G2 - c1 phi2/2 - rho Y2/2] = 0;
  (iii) chain:  E|q| <= E[RHS] = lam0 + lam1 + lam2 (2+s) + lam3 E V^3 + sum mu_j E q_j + sigma E[V rho]
                       <= lam0 + ... + lam3 M3 + sum mu_j B_j + sigma (32b+48y) <= row bound.
The Wick monomial is integrated by quadrature in t = |y|^2; the others by Monte Carlo.
"""
import os, sys, json
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from fractions import Fraction as Fr
import numpy as np
from outer import test_matrices
import verify_cert as VC

path = sys.argv[1]
cert = json.load(open(path))
rows = cert['rows']
rng = np.random.default_rng(11)
M = 2_000_000


def cg(shape):
    return (rng.standard_normal(shape) + 1j * rng.standard_normal(shape)) / np.sqrt(2)


def mono_parts(y):
    t = np.abs(y) ** 2
    return y * (t - 2) / np.sqrt(2), (2 * t - 2) / np.sqrt(2), y ** 2 / np.sqrt(2)


def samples(name):
    """V, c1, c2, rho*V, weights, scalars."""
    if name == 'mono (quadrature)':
        tt = np.linspace(0, 70, 4000001)
        tm = 0.5 * (tt[1:] + tt[:-1])
        wt = np.exp(-tt[:-1]) - np.exp(-tt[1:])
        return tm * (tm - 2) ** 2 / 2, 2 * (tm - 1) ** 2, tm ** 2 / 2, (tm - 1) * tm ** 2 * (tm - 2) ** 2 / 2, wt, (.25,) * 5
    if name == 'y1^2 conj(y2)/sqrt2':
        y1, y2 = cg(M), cg(M)
        q = y1 ** 2 * np.conj(y2) / np.sqrt(2)
        d, db, par = [2 * y1 * np.conj(y2) / np.sqrt(2)], [y1 ** 2 / np.sqrt(2)], (.25, .25, 0, 0, 0)
        a = 0 * q
    elif name == 'y1 y2 conj(y3)':
        y1, y2, y3 = cg(M), cg(M), cg(M)
        q = y1 * y2 * np.conj(y3)
        d, db, par = [y2 * np.conj(y3), y1 * np.conj(y3)], [y1 * y2], (.125, .25, 0, 0, 0)
        a = 0 * q
    else:
        n = int(name.split()[-1])
        q, d, db, a = 0, [], [], 0
        for _ in range(n):
            q1, dq1, dbq1 = mono_parts(cg(M))
            q = q + q1 / np.sqrt(n)
            d.append(dq1 / np.sqrt(n)); db.append(dbq1 / np.sqrt(n))
            a = a + dq1 * dbq1 / n
        par = tuple(0.25 / n for _ in range(5))
    V = np.abs(q) ** 2
    c1 = sum(np.abs(x_) ** 2 for x_ in d)
    c2 = sum(np.abs(x_) ** 2 for x_ in db)
    return V, c1, c2, np.real(np.conj(q) ** 2 * a), np.full(len(V), 1.0 / len(V)), par


for name in ['mono (quadrature)', 'y1^2 conj(y2)/sqrt2', 'y1 y2 conj(y3)', 'sum of 2', 'sum of 4', 'sum of 8']:
    V, c1, c2, rhoV, wt, par = samples(name)
    n_, h_, b_, y_, z_ = par
    s = 32 * n_ + 8 * h_ + 32 * b_ + 96 * y_
    row = next(r for r in rows if Fr(r['s_lo']) <= Fr(s).limit_denominator(1000) <= Fr(r['s_hi']))
    ek = np.array([float(Fr(v)) for v in row['knots']])
    arr = lambda nm: np.array([float(Fr(v)) for v in row[nm]])
    f1, f2, x2, x1, xa, t2, t4 = (arr(nm) for nm in ['phi1', 'phi2', 'xi2', 'xi1', 'xia', 'th2', 'th4'])
    lam = [float(Fr(v)) for v in row['lam']]
    lam3 = sum(float(Fr(v)) for v in row['l3'])
    mu = [float(Fr(v)) for v in row['mu']]
    sig = float(Fr(row['sigma']))
    a1, a2 = (float(Fr(x_)) for x_ in row.get('slope', ['0', '0']))
    out = dict(cubic=name, s=s, row='[%s, %s]' % (row['s_lo'], row['s_hi']))
    # evaluate in chunks
    acc = dict(lhs=0.0, rhs=0.0, id1=0.0, id2=0.0, EV3=0.0, q=np.zeros(5), EVrho=0.0, minpt=np.inf, id1sq=0.0, id2sq=0.0)
    for i0 in range(0, len(V), 250000):
        sl_ = slice(i0, i0 + 250000)
        v, w = V[sl_], wt[sl_]
        k2, k1 = c2[sl_], c1[sl_]
        rho = rhoV[sl_] / np.maximum(v, 1e-300)
        Fm, Gm, Ym = test_matrices(ek ** 2, v)
        phi1, G1, Y1 = Fm.T @ f1 + a1 * v, Gm.T @ f1 + a1 * v ** 2 / 2, Ym.T @ f1 + a1 * v / 2
        phi2, G2, Y2 = Fm.T @ f2 + a2 * v, Gm.T @ f2 + a2 * v ** 2 / 2, Ym.T @ f2 + a2 * v / 2
        qs = [(k2 - 1) ** 2, (k1 - k2 - 1) ** 2, (k1 + k2 - 3) ** 2, (k1 - 2) ** 2, rho ** 2]
        i1 = G1 - k2 * phi1 - rho * Y1
        i2 = G2 - 0.5 * k1 * phi2 - 0.5 * rho * Y2
        rhs = lam[0] + lam[1] * v + lam[2] * v ** 2 + lam3 * v ** 3 + i1 + i2 + sig * v * rho + sum(m * q_ for m, q_ in zip(mu, qs))
        acc['lhs'] += w @ np.sqrt(v); acc['rhs'] += w @ rhs
        acc['id1'] += w @ i1; acc['id2'] += w @ i2; acc['id1sq'] += w @ i1 ** 2; acc['id2sq'] += w @ i2 ** 2
        acc['EV3'] += w @ v ** 3; acc['EVrho'] += w @ (v * rho)
        acc['q'] += np.array([w @ q_ for q_ in qs])
        acc['minpt'] = min(acc['minpt'], float((rhs - np.sqrt(v)).min()))
    nn = len(V) if name != 'mono (quadrature)' else None
    se1 = np.sqrt(acc['id1sq'] / nn) if nn else 0.0
    se2 = np.sqrt(acc['id2sq'] / nn) if nn else 0.0
    B = [16 * n_ + 4 * h_, 16 * n_ + 20 * h_ + 16 * b_, 80 * n_ + 20 * h_ + 16 * b_ + 96 * y_ + 32 * z_,
         32 * n_ + 16 * h_ + 16 * b_ + 48 * y_ + 16 * z_, 32 * b_ + 24 * y_]
    M3 = 6 + 9 * s + 40.45313 * s ** 1.5
    chain2 = lam[0] + lam[1] + lam[2] * (2 + s) + lam3 * acc['EV3'] + float(np.dot(mu, acc['q'])) + sig * acc['EVrho']
    chain3 = lam[0] + lam[1] + lam[2] * (2 + s) + lam3 * M3 + float(np.dot(mu, B)) + sig * (32 * b_ + 48 * y_)
    res = VC.verify_row(row, quiet=True)
    out.update({'E|q|': acc['lhs'], 'E[RHS]': acc['rhs'], 'pointwise min(RHS-|q|)': acc['minpt'],
                'identity I resid (s.e.)': (acc['id1'], se1), 'identity II resid (s.e.)': (acc['id2'], se2),
                'chain with true moments': chain2, 'chain with budgets (scalar M3)': chain3, 'row bound': float(res['bound']),
                'E q_j (true)': [float(x) for x in acc['q']], 'B_j': B})
    print(json.dumps(out), flush=True)
