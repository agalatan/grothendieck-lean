# claude-b9ee, review of #508: independent Monte Carlo test of the spherical factorization G = B_c H (NOTE.md).
# For random mixed R and for the c = 4 extremal R_4: (1) kappa from the exact Wick formula against
# kappa_0(c) E H^2 = kappa_0(c) E[s^2 + d^2/2], s = (l1 + l2)/(2cm), d = (l1 - l2)/(2cm), l1 >= l2 the eigenvalues of L L^T
# for the real 2 x 2c matrix L of omega_x -> R(omega_x, omega_y, omega_w); (2) E G^3 sampled directly against
# E B_c^3 E H^3 = (6c^2/((c+1)(c+2))) E[s^3 + (3/2) s d^2]. Floating point (N). Run: python3 -I factorization_check.py
import numpy as np
src = open('wick4.py').read().split('for c in (2, 3):')[0]; ns = {}; exec(src, ns)
exact4 = ns['exact4']
rng = np.random.default_rng(2026)
def sph(N, c):
    z = rng.standard_normal((N, c)) + 1j*rng.standard_normal((N, c)); return z/np.linalg.norm(z, axis=1, keepdims=True)
def test(A, B, C, label, N=400_000):
    c = A.shape[0]; n2 = sum(np.vdot(T, T).real for T in (A, B, C)); m = n2/c**3
    kap_w = (c/(c + 1))**3*exact4(A, B, C)/n2**2
    y, w = sph(N, c), sph(N, c)
    al = np.einsum('abd,nb,nd->na', A, y, w)                                   # coefficient of conj(x_a)
    be = np.einsum('abd,nb,nd->na', B, y.conj(), w) + np.einsum('abd,nb,nd->na', C, y, w.conj())   # coefficient of x_a
    # R = sum_a p_a (al + be) + i q_a (be - al), x_a = p_a + i q_a
    u, v = al + be, 1j*(be - al)
    Lr = np.concatenate([u.real, v.real], 1); Li = np.concatenate([u.imag, v.imag], 1)
    g11, g22, g12 = (Lr*Lr).sum(1), (Li*Li).sum(1), (Lr*Li).sum(1)
    tr, det = g11 + g22, g11*g22 - g12**2
    disc = np.sqrt(np.maximum(tr**2/4 - det, 0)); l1, l2 = tr/2 + disc, tr/2 - disc
    s, d = (l1 + l2)/(2*c*m), (l1 - l2)/(2*c*m)
    k0 = 2*c/(c + 1)
    kap_f = k0*np.mean(s**2 + d**2/2); se_f = k0*np.std(s**2 + d**2/2)/np.sqrt(N)
    x = sph(N, c)
    R = (np.einsum('na,na->n', x.conj(), al) + np.einsum('na,na->n', x, be))
    G = np.abs(R)**2/m
    g3 = np.mean(G**3); se3 = np.std(G**3)/np.sqrt(N)
    g3_f = 6*c**2/((c + 1)*(c + 2))*np.mean(s**3 + 1.5*s*d**2)
    print('%-28s c=%d: E s = %.4f | kappa Wick %.5f, kappa_0 E H^2 %.5f (+-%.5f) | E G^3 direct %.4f (+-%.4f), factorised %.4f | mean d^2 %.2e'
          % (label, c, np.mean(s), kap_w, kap_f, se_f, g3, se3, g3_f, np.mean(d**2)), flush=True)
def crandn(*sh): return (rng.standard_normal(sh) + 1j*rng.standard_normal(sh))/np.sqrt(2)
for c in (3, 5):
    for t in range(2):
        test(crandn(c, c, c), crandn(c, c, c)*rng.uniform(0, 1), crandn(c, c, c)*rng.uniform(0, 1), 'random mixed R, trial %d' % t)
# the c = 4 extremal: R_4 = conj(x_0)(a b + u.v) + sum_j x_j (conj(a) v_j - b conj(u_j) + (u x conj(v))_j), y = (a,u), w = (b,v)
c = 4; A = np.zeros((4, 4, 4), complex); B = np.zeros_like(A); C = np.zeros_like(A)
A[0, 0, 0] = 1
for j in range(1, 4): A[0, j, j] = 1                                    # conj(x_0)(a b + sum u_j v_j)
for j in range(1, 4):
    B[j, 0, j] = 1                                                       # x_j conj(a) v_j
    C[j, j, 0] = -1                                                      # -x_j b conj(u_j): conj on y, but y-coefficient: handled below
# -x_j b conj(u_j) has its conjugate in cluster y: it belongs to B (x, conj(y), w): B[j, j, 0] = -1
C[:] = 0
for j in range(1, 4): B[j, j, 0] = -1
eps = {(1, 2, 3): 1, (2, 3, 1): 1, (3, 1, 2): 1, (1, 3, 2): -1, (3, 2, 1): -1, (2, 1, 3): -1}
for (j, k, l), sgn in eps.items(): C[j, k, l] += sgn                     # x_j (u_k conj(v_l) eps_jkl): conj in w
test(A, B, C, 'c=4 extremal R_4')
