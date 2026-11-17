# claude-b9ee research worker (fourpartite): N-level values (floating point, orientation only) of
# E|P| / (sqrt(2/pi)||P||_2) for three further classes covered by Corollary 3' (PROOF_4PARTITE.md section 5):
#  (a) a Hermite term in the conditioning block:  P = t1 H2(x1) x3 + t2 x1 x2 x4 + (t3 x1 + t4 x2) x3 x4,
#      A = {x1, x2}, B3 = {x3}, B4 = {x4};
#  (b) sums of N independent copies of K_4^(3) (4N coordinates), the Larsson-Cohn (Gaussian-limit) regime;
#  (c) the 4th chaos: K_5^(4), P = sum_a t_a prod_{b != a} x_b (5 coordinates), and a sum of 3 copies (15 coordinates).
import numpy as np
import sys, time
sys.path.insert(0, '.')
from n04_reduction_and_classes import one_block, Eabs_general

SQ2PI = np.sqrt(2/np.pi)
rng = np.random.default_rng(171117)
gx, gw = np.polynomial.hermite_e.hermegauss(40); gw = gw/np.sqrt(2*np.pi)

def class_a(t):
    tot = 0.0
    for i in range(40):
        for j in range(40):
            x1, x2 = gx[i], gx[j]
            a = t[0]*(x1*x1 - 1); b = t[1]*x1*x2; c = t[2]*x1 + t[3]*x2
            tot += gw[i]*gw[j]*one_block(a, b, c)
    norm2 = 2*t[0]**2 + t[1]**2 + t[2]**2 + t[3]**2
    return tot/(SQ2PI*np.sqrt(norm2))

def class_b(N, t, nmc=2000):
    # copies k: x1k x2k x3k x4k with K_4^(3) coefficients t; condition on (x1k, x2k) for all k
    acc = []
    for it in range(nmc):
        x1 = rng.normal(size=N); x2 = rng.normal(size=N)
        u = t[3]*x1*x2            # coefficient of x3k  (edge 123)
        v = t[2]*x1*x2            # coefficient of x4k  (edge 124)
        M = np.diag(t[1]*x1 + t[0]*x2)   # x3k x4k (edges 134, 234)
        e, _ = Eabs_general(u, v, M, 0.0)
        acc.append(e)
    acc = np.array(acc); nrm = SQ2PI*np.sqrt(N*np.sum(np.array(t)**2))
    return np.mean(acc)/nrm, np.std(acc)/np.sqrt(nmc)/nrm

def class_c(t, ng=24):
    hx, hw = np.polynomial.hermite_e.hermegauss(ng); hw = hw/np.sqrt(2*np.pi)
    tot = 0.0
    for i in range(ng):
        for j in range(ng):
            for k in range(ng):
                x1, x2, x3 = hx[i], hx[j], hx[k]
                a = t[4]*x1*x2*x3      # x4 coefficient (edge missing x5)
                b = t[3]*x1*x2*x3      # x5 coefficient (edge missing x4)
                c = t[0]*x2*x3 + t[1]*x1*x3 + t[2]*x1*x2
                tot += hw[i]*hw[j]*hw[k]*one_block(a, b, c)
    return tot/(SQ2PI*np.sqrt(np.sum(np.array(t)**2)))

def class_c_sum(N, t, nmc=1500):
    acc = []
    for it in range(nmc):
        x1, x2, x3 = rng.normal(size=N), rng.normal(size=N), rng.normal(size=N)
        u = t[4]*x1*x2*x3; v = t[3]*x1*x2*x3
        M = np.diag(t[0]*x2*x3 + t[1]*x1*x3 + t[2]*x1*x2)
        e, _ = Eabs_general(u, v, M, 0.0)
        acc.append(e)
    acc = np.array(acc); nrm = SQ2PI*np.sqrt(N*np.sum(np.array(t)**2))
    return np.mean(acc)/nrm, np.std(acc)/np.sqrt(nmc)/nrm

if __name__ == '__main__':
    t0 = time.time()
    t = rng.normal(size=4)
    print('(a) H2(x1) x3 + x1 x2 x4 + (x1 + x2) x3 x4 type, t = %s: %.8f (Gauss-Hermite 40^2)' % (np.round(t, 3), class_a(t)))
    sys.stdout.flush()
    for N in [1, 2, 4, 8]:
        r, e = class_b(N, [1, 1, 1, 1], nmc=1500)
        print('(b) %d independent copies of K_4^(3) (equal weights, %d coordinates): %.5f +- %.5f' % (N, 4*N, r, e))
        sys.stdout.flush()
    t5 = rng.normal(size=5)
    print('(c) K_5^(4) in the 4th chaos, t = %s: %.8f (Gauss-Hermite 24^3)' % (np.round(t5, 3), class_c(t5)))
    r, e = class_c_sum(3, [1, 1, 1, 1, 1])
    print('(c) 3 independent copies of K_5^(4) (15 coordinates, equal weights): %.5f +- %.5f' % (r, e))
    print('time %.0f s' % (time.time() - t0))
