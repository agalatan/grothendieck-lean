# Stage 0 (a): laws of |q| for explicit cubics q in H_{2,1} of remote variables, normalised to E|q|^2 = 1 (N).
# Each law is stored as atoms r_j = |q| with weights (quantile bins of a scrambled Sobol sample, bin means of r); the
# moments E r, E r^4 - 2, P(r^2 <= x) are stored with it.  These are ACTUAL responses: a row value against them is a lower
# bound of the row bound in every valid law class.
#   usage: physlaws.py OUT.npz [log2 of the sample size, default 22]
import sys, math, json
import numpy as np
from scipy.stats import qmc

def sample(dim, m, seed):
    u = qmc.Sobol(d=dim, scramble=True, seed=seed).random_base2(m)
    return np.clip(u, 1e-16, 1 - 1e-16)
def cgauss(u1, u2):                      # standard complex Gaussian, E|z|^2 = 1
    return np.sqrt(-np.log(u1)) * np.exp(2j * np.pi * u2)

def junta(y): return y * (np.abs(y) ** 2 - 2) / math.sqrt(2)
CUBICS = {
    'junta': (1, lambda y: junta(y[0])),                                         # s = 42
    'y1y2Y3': (3, lambda y: y[0] * y[1] * np.conj(y[2])),                         # s = 6
    'y1sqY2': (2, lambda y: y[0] ** 2 * np.conj(y[1]) / math.sqrt(2)),            # s = 10
    'y1(T2-1)': (2, lambda y: y[0] * (np.abs(y[1]) ** 2 - 1)),                    # s = 16
    'junta2': (2, lambda y: (junta(y[0]) + junta(y[1])) / math.sqrt(2)),
    'junta4': (4, lambda y: sum(junta(y[k]) for k in range(4)) / 2),
    'mono2': (6, lambda y: (y[0] * y[1] * np.conj(y[2]) + y[3] * y[4] * np.conj(y[5])) / math.sqrt(2)),
    'chain': (3, lambda y: (y[0] * y[1] * np.conj(y[2]) + y[1] * y[2] * np.conj(y[0]) + y[2] * y[0] * np.conj(y[1])) / math.sqrt(3)),
    'y1y2(Y1+Y2)': (2, lambda y: (y[0] * (np.abs(y[1]) ** 2 - 1) + y[1] * (np.abs(y[0]) ** 2 - 1)) / math.sqrt(2)),
}
def atoms(r, nb=300):
    """quantile bins: equal probability in the bulk, the last and first bins split again (tails)."""
    r = np.sort(r); n = len(r)
    edges = np.unique(np.concatenate([np.linspace(0, n / nb, 41), np.linspace(n / nb, n - n / nb, nb - 1), n - np.geomspace(n / nb, 1, 60)]).astype(int))
    edges = np.unique(np.concatenate([edges, [n]]))
    cs = np.concatenate([[0], np.cumsum(r)]); cs2 = np.concatenate([[0], np.cumsum(r ** 2)])
    w = np.diff(edges) / n; mean = (cs[edges[1:]] - cs[edges[:-1]]) / np.diff(edges)
    return mean, w

def build(m=22):
    out = {}; info = {}
    def add(name, q):
        r = np.abs(q); u = (r ** 2).mean(); r = r / math.sqrt(u)          # exact norm is 1; the sample norm is used to normalise
        a, w = atoms(r)
        out[name + '_r'] = a; out[name + '_w'] = w
        info[name] = dict(norm2_sample=float(u), Er=float(r.mean()), s=float((r ** 4).mean() - 2), Er6=float((r ** 6).mean()),
                          P_U_le=dict((str(x), float((r ** 2 <= x).mean())) for x in (1e-4, 1e-3, 1e-2, 0.05, 0.1)),
                          Er_atoms=float(a @ w), s_atoms=float((a ** 4) @ w - 2))
    U = sample(2, m, 1); add('gauss', cgauss(U[:, 0], U[:, 1]))
    for name, (d, f) in CUBICS.items():
        U = sample(2 * d, m, 7 + d); y = [cgauss(U[:, 2 * k], U[:, 2 * k + 1]) for k in range(d)]
        add(name, f(y))
        if name in ('junta', 'y1y2Y3', 'y1sqY2', 'y1(T2-1)'):
            U = sample(2 * d + 2, m, 31 + d); y = [cgauss(U[:, 2 * k], U[:, 2 * k + 1]) for k in range(d)]; g = cgauss(U[:, 2 * d], U[:, 2 * d + 1])
            for c2 in (0.1, 0.25, 0.5, 0.75, 0.9):                              # spike of energy share c2 in a diffuse (Gaussian) bulk
                add('%s+bulk(c2=%g)' % (name, c2), math.sqrt(c2) * f(y) + math.sqrt(1 - c2) * g)
    return out, info

if __name__ == '__main__':
    m = int(sys.argv[2]) if len(sys.argv) > 2 else 22
    out, info = build(m)
    np.savez_compressed(sys.argv[1], **out)
    json.dump(info, open(sys.argv[1].replace('.npz', '.json'), 'w'), indent=1)
    for k, v in info.items(): print('%-28s E r %.5f  s %.3f  P(U<=1e-3) %.4f  P(U<=1e-2) %.4f  P(U<=0.1) %.4f  (atoms: E r %.5f s %.3f)' % (k, v['Er'], v['s'], v['P_U_le']['0.001'], v['P_U_le']['0.01'], v['P_U_le']['0.1'], v['Er_atoms'], v['s_atoms']))
