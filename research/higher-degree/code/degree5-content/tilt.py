# Tilted A/B shells through the retained functional (ledger 11.12 transferred to the degree-5 row).  N.
#   G0(s) = Re E_z[ph A+ - ph A-]  (first variation along a remote linear form with visible factor 1, charge +1)
#   Tilted A direction: e11 + s;  tilted B direction: e20 conj(.) + t (.)   (retained element xi = -s rA - t rB).
#   Pointwise second variation of |A+ + d| + |A- - d| on d = (e11+s) rhoA + e20 conj(rhoB) + t rhoB, cost (p1-s^2)|rhoA|^2
#   + (p1 - t^2)|rhoB|^2 - 2 s t Re(rhoA conj rhoB)  (the retained penalty ||s rA + t rB||^2 is subtracted from p1(|rA|^2+|rB|^2)).
import sys, json
import numpy as np, prof as PF

def tilt_profiles(rec, S, svals=(0.0,), tvals=(0.0,), grid=None):
    z, wz = grid if grid is not None else PF.zgrid()
    T = np.abs(z) ** 2
    base = z * (rec['l'] + rec['beta'] * (T - 2)) + rec['nu5'] * PF.e_ab(3, 2, z)
    Dz = 1 - rec['bA'] * PF.e_ab(1, 1, z) - rec['bB'] * PF.e_ab(2, 0, z)
    e11, e20 = PF.e_ab(1, 1, z), PF.e_ab(2, 0, z)
    G0 = np.zeros(len(S)); rhos = {}
    for i, s in enumerate(S):
        Ap, Am = base + s * Dz, base - s * Dz; aP, aM = np.abs(Ap), np.abs(Am)
        pP, pM = Ap / np.maximum(aP, 1e-300), Am / np.maximum(aM, 1e-300)
        G0[i] = np.real((pP - pM) @ wz)
        for sa in svals:
            for tb in tvals:
                # real basis of d for (Re rhoA, Im rhoA, Re rhoB, Im rhoB): rhoA -> (e11+s) rhoA ; rhoB -> e20 conj(rhoB) + t rhoB
                Bm = np.array([e11 + sa, 1j * (e11 + sa), e20 + tb, -1j * e20 + 1j * tb])
                Mi = np.zeros((4, 4))
                for A, a, sg in ((Ap, aP, 1.0), (Am, aM, -1.0)):
                    Im_ = np.imag(sg * Bm * np.conj(A / np.maximum(a, 1e-300))[None, :])
                    Mi += (Im_ * (wz / (2 * np.maximum(a, 1e-300)))[None, :]) @ Im_.T
                Mi = (Mi + Mi.T) / 2
                p1 = 1 / PF.E1
                C = np.diag([p1 - sa ** 2, p1 - sa ** 2, p1 - tb ** 2, p1 - tb ** 2])
                C[0, 2] = C[2, 0] = -sa * tb; C[1, 3] = C[3, 1] = -sa * tb
                # generalized eigenvalue: max curvature/cost; and min eigenvalue of (C - M)
                L = np.linalg.cholesky(C); Li = np.linalg.inv(L)
                ev = np.linalg.eigvalsh(Li @ Mi @ Li.T)
                mu = np.linalg.eigvalsh(C - Mi)[0]
                rhos.setdefault((sa, tb), []).append((float(ev[-1]), float(mu)))
    return G0, rhos

if __name__ == '__main__':
    k = int(sys.argv[1]); rec = json.loads(open('rows5.lines').read().splitlines()[k - 1])
    S = np.concatenate([np.linspace(0, 0.02, 41), np.linspace(0.02, 1.2, 473)[1:], np.linspace(1.2, 6.0, 193)[1:]])
    G0, _ = tilt_profiles(rec, S)
    d = dict(np.load('out/prof_%d.npz' % k)); d['G0'] = G0
    np.savez('out/prof_%d.npz' % k, **d)
    print('row', rec['t'], 'G0 added; G0/s at 0:', G0[1] / S[1])
