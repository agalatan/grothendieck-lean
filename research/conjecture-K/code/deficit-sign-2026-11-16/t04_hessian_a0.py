"""Second variation of T2 at the a = 0 cubic q0 = X^2 conj(Y)/sqrt2 in H_{2,1}(C^2), by torus-weight blocks (label N).

T2(q0) = 0 and the first variation vanishes (W-charge argument, REPORT section 4), so
T2(normalise(q0 + eps p)) = eps^2 Q(p) + O(eps^3).  Q splits into Hermitian blocks:
  block 1: span{e0 = X(|X|^2-2)/sqrt2, e1 = X(|Y|^2-1)}   block 2: span{e3 = (|X|^2-1)Y, e4 = Y(|Y|^2-2)/sqrt2}   block 3: e2 = conj(X)Y^2/sqrt2.
Output: eigenvalues of each block, for several profiles.  A negative eigenvalue gives cubics with T2 < 0 near q0.
"""
import sys, os, math
sys.path.append(os.path.dirname(os.path.abspath(__file__)))
import numpy as np
from dslib import *

def basis2():
    """orthonormal basis of H21(C^2) as tensors (E|q|^2 = 1 each)."""
    S2 = math.sqrt(2); B = []
    def T(entries):
        t = np.zeros((2, 2, 2), complex)
        for (i, j, k), v in entries.items():
            t[i, j, k] += v / 2; t[j, i, k] += v / 2
        return normalise(t)
    B.append(T({(0, 0, 0): 1}))        # e0 X^2 Xbar
    B.append(T({(0, 1, 1): 1}))        # e1 X Y Ybar
    B.append(T({(1, 1, 0): 1}))        # e2 Y^2 Xbar
    B.append(T({(0, 1, 0): 1}))        # e3 X Y Xbar
    B.append(T({(1, 1, 1): 1}))        # e4 Y^2 Ybar
    B.append(T({(0, 0, 1): 1}))        # e5 X^2 Ybar
    return B

def T2_of(g, t, prof):
    t = normalise(t, prof.u)
    return split(g, t, prof)

if __name__ == '__main__':
    g = Grid(2, PANELS_FINE, 8, 48)
    B = basis2(); q0 = B[5]
    specs = sys.argv[1:] or ['sqrt', 'buf:0.01', 'buf:0.03', 'buf:0.1', 'buf:0.3', 'buf:1', 'buf:4', 'peak:0.0463', 'peak:0.2', 'peak:1', 'peak:5']
    eps = 0.04
    for spec in specs:
        if spec == 'sqrt': prof = SqrtProfile(1.0)
        elif spec.startswith('buf:'): prof = buffer_profile(float(spec[4:]))
        else: prof = peak_profile(float(spec[5:]))
        def Q(p):
            # symmetric difference removes odd orders
            a = T2_of(g, q0 + eps * p, prof); b = T2_of(g, q0 - eps * p, prof)
            return 0.5 * (a['T2'] + b['T2']) / eps ** 2, 0.5 * (a['D'] + b['D'])
        D0 = T2_of(g, q0, prof)
        out = []
        for (i, j) in [(0, 1), (3, 4)]:
            hii, _ = Q(B[i]); hjj, _ = Q(B[j])
            hs, _ = Q((B[i] + B[j]) / math.sqrt(2)); hi_, _ = Q((B[i] + 1j * B[j]) / math.sqrt(2))
            re = hs - 0.5 * (hii + hjj)           # Re h_ij
            im = hi_ - 0.5 * (hii + hjj)          # Re(i h_ij) = -Im h_ij  (Q(p) = sum conj(p_i) h_ij p_j)
            H = np.array([[hii, re - 1j * (-im)], [re + 1j * (-im), hjj]])
            ev = np.linalg.eigvalsh(H)
            out.append((i, j, hii, hjj, re, im, ev))
        h22, _ = Q(B[2])
        print(f"{prof.name:16s} u={prof.u:g}: D(q0)={D0['D']:.6e} T2(q0)={D0['T2']:+.1e} | block(e0,e1): diag {out[0][2]/D0['D']:+.4f},{out[0][3]/D0['D']:+.4f} off {out[0][4]/D0['D']:+.4f},{out[0][5]/D0['D']:+.4f} eig/D {out[0][6][0]/D0['D']:+.5f},{out[0][6][1]/D0['D']:+.5f} | block(e3,e4): diag {out[1][2]/D0['D']:+.4f},{out[1][3]/D0['D']:+.4f} off {out[1][4]/D0['D']:+.4f},{out[1][5]/D0['D']:+.4f} eig/D {out[1][6][0]/D0['D']:+.5f},{out[1][6][1]/D0['D']:+.5f} | e2: {h22/D0['D']:+.5f}", flush=True)
