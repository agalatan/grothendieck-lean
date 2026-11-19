# claude-b9ee, 17 Nov 2026.  Floating-point / Monte Carlo sanity checks (label N) of the hand proofs in PROOF.md, Part A1
# and Part B (restriction).  Not part of any certificate.   Run:  python3 -I sanity_checks.py   (needs numpy)
import numpy as np
rng = np.random.default_rng(20261117)
PI = np.pi

def frame(n, m):                                   # m Haar-random orthonormal 2-frames (U, V) in R^n
    G = rng.standard_normal((m, n, 2)); Qm, Rm = np.linalg.qr(G)
    Qm = Qm * np.sign(np.diagonal(Rm, axis1=1, axis2=2))[:, None, :]
    return Qm[:, :, 0], Qm[:, :, 1]

def rand_harmonic(n):                              # random harmonic cubic: symmetric tensor minus its trace part
    c = rng.standard_normal((n, n, n)); c = sum(np.transpose(c, p) for p in [(0,1,2),(0,2,1),(1,0,2),(1,2,0),(2,0,1),(2,1,0)])/6
    tr = np.einsum('iik->k', c); beta = 3*tr/(n + 2)
    c2 = c.reshape(n, n*n)
    def H(X):                                      # X: (..., n); chunked BLAS evaluation of the cubic form
        sh = X.shape[:-1]; Xf = X.reshape(-1, n); out = np.empty(Xf.shape[0])
        for s0 in range(0, Xf.shape[0], 65536):
            Z = Xf[s0:s0 + 65536]; T = (Z @ c2).reshape(-1, n, n)
            out[s0:s0 + 65536] = np.einsum('pj,pjk,pk->p', Z, T, Z) - (Z*Z).sum(-1)*(Z @ beta)
        return out.reshape(sh)
    return H

def circle_samples(f, U, V, R=1.0, L=16):          # f on R*(U cos phi + V sin phi), phi = 2 pi l/L
    ph = 2*PI*np.arange(L)/L
    X = R*(U[:, None, :]*np.cos(ph)[None, :, None] + V[:, None, :]*np.sin(ph)[None, :, None])
    return f(X)

def freq_energies(g):                              # mean-square energy of frequencies 1 and 3 (exact for degree <= 3, L = 16)
    Fh = np.fft.rfft(g, axis=-1)/g.shape[-1]
    return 2*np.abs(Fh[:, 1])**2, 2*np.abs(Fh[:, 3])**2, 2*(np.abs(Fh[:, [0, 2, 4, 5, 6, 7, 8]])**2).sum(-1)

print('1. tau_3(n) = (n+2)/(4(n-1)): Monte Carlo ratio E[e3]/E[e1+e3] for random harmonic cubics')
for n in [2, 3, 5, 8, 12]:
    H = rand_harmonic(n); U, V = frame(n, 100000)
    e1, e3, rest = freq_energies(circle_samples(H, U, V))
    assert rest.max() < 1e-18*max(1, (e1 + e3).max())
    print('   n=%2d  MC %.5f  formula %.5f' % (n, e3.mean()/(e1 + e3).mean(), (n + 2)/(4*(n - 1))))
print('   x1 x2 x3: E prod_j (U_j^2 + V_j^2) vs 8/((n-1) n (n+4)):')
for n in [3, 5, 9]:
    U, V = frame(n, 400000); v = np.prod(U[:, :3]**2 + V[:, :3]**2, axis=1).mean()
    print('   n=%d  MC %.6e  formula %.6e' % (n, v, 8/((n - 1)*n*(n + 4))))

print('2. cross term E_circle <L, Y>_circle = E_Theta[L Y] = 0 (L linear, Y harmonic cubic), relative to sqrt(E L^2 E Y^2)')
for n in [3, 6]:
    H = rand_harmonic(n); b = rng.standard_normal(n); U, V = frame(n, 100000)
    gL = circle_samples(lambda X: X @ b, U, V); gY = circle_samples(H, U, V)
    print('   n=%d  MC %.2e (std error ~ %.1e)' % (n, (gL*gY).mean()/np.sqrt((gL**2).mean()*(gY**2).mean()), 1/np.sqrt(100000)))

print('3. weighted circle lemma: max over random g of mean|g|^2 / ((8/pi^2)(1 + 1/(9 gamma))(e1 + gamma e3))')
ph = 2*PI*(np.arange(4096) + 0.5)/4096
co = rng.standard_normal((100000, 4))
co = np.vstack([co, [[0, 1, 0, 1/3], [0, 0, 0, 1], [0, 1, 0, 0]]])            # extremals: sin + sin3/3, sin 3, sin
G = co[:, :1]*np.cos(ph) + co[:, 1:2]*np.sin(ph) + co[:, 2:3]*np.cos(3*ph) + co[:, 3:4]*np.sin(3*ph)
L1 = np.abs(G).mean(1); e1 = (co[:, 0]**2 + co[:, 1]**2)/2; e3 = (co[:, 2]**2 + co[:, 3]**2)/2
for gam in [0.85, 8/9, 1.0, 1.5, 3.0, 10.0]:
    r = L1**2/((8/PI**2)*(1 + 1/(9*gam))*(e1 + gam*e3))
    print('   gamma = %.4f  max ratio %.8f  %s' % (gam, r.max(), '(> 1: the lemma fails below 8/9, e.g. g = sin 3 phi)' if r.max() > 1 + 1e-6
          else ('(= 1 up to quadrature error: equality at g = sin 3 phi for gamma = 8/9, at sin + sin 3/3 for gamma = 1)' if r.max() > 1 - 1e-6 else '')))
print('   per-radius optimum vs the plain constant 4 sqrt5/(3 pi): (2 sqrt2/pi)(sqrt e1 + sqrt e3/3) <= (4 sqrt5/(3 pi)) sqrt(e1 + e3):',
      bool(np.all((2*np.sqrt(2)/PI)*(np.sqrt(e1) + np.sqrt(e3)/3) <= 4*np.sqrt(5)/(3*PI)*np.sqrt(e1 + e3)*(1 + 1e-12))))

print('4. three-cut patterns: 1 - |w3|^2 = -(1 - |w1|^2) P(a,b,c), P = prod (1 + 2 cos a_j), a + b + c = pi; max P = 8')
a = rng.uniform(0, PI, 200000); b = rng.uniform(0, PI, 200000); keep = a + b < PI; a, b = a[keep], b[keep]; c = PI - a - b
z1, z2, z3 = np.exp(-1j*a), np.ones_like(a), np.exp(1j*b)
w1 = z1 - z2 + z3; w3 = z1**3 - z2**3 + z3**3
P = (1 + 2*np.cos(a))*(1 + 2*np.cos(b))*(1 + 2*np.cos(c))
print('   identity max error %.1e;  1 - |w1|^2 >= 0: %s;  max P on the sample %.6f (equilateral: 8)' % (
      np.abs((1 - np.abs(w3)**2) + (1 - np.abs(w1)**2)*P).max(), bool((1 - np.abs(w1)**2).min() > -1e-12), P.max()))

print('5. radius-R check of A(R), B(R) and E_circle mean|g| <= Psi(A, B) for a random F in V_3(n)')
for n, pw in [(5, 0.4), (8, 0.45)]:
    H = rand_harmonic(n); bvec = rng.standard_normal(n)
    # scale so that E_Theta A_F^2 = pw, E_Theta B_F^2 = 1 - pw  (A_F = sqrt(2n(n+2)) <b, Theta>, B_F = sqrt(n(n+2)(n+4)) H(Theta))
    Th = rng.standard_normal((400000, n)); Th /= np.linalg.norm(Th, axis=1)[:, None]
    sB = np.sqrt((1 - pw)/(n*(n + 2)*(n + 4)*(H(Th)**2).mean())); sA = np.sqrt(pw*n/(2*n*(n + 2)*(bvec @ bvec)))
    F = lambda X: sB*H(X) + sA*(X @ bvec)*((X*X).sum(-1) - n - 2)
    tau = (n + 2)/(4*(n - 1)); U, V = frame(n, 20000)
    for R in [1.5, np.sqrt(n + 2), 4.0]:
        e1R = R**2*(R**2 - n - 2)**2/(2*n*(n + 2)); e3R = R**6/(n*(n + 2)*(n + 4))
        A = pw*e1R + (1 - pw)*(1 - tau)*e3R; B = (1 - pw)*tau*e3R
        g = circle_samples(F, U, V, R); E1, E3, rest = freq_energies(g)
        gf = circle_samples(F, U, V, R, L=1024); mabs = np.abs(gf).mean()
        Psi = (2*np.sqrt(2)/PI)*(np.sqrt(A) + np.sqrt(B)/3) if A >= 64*B/9 else (3/PI)*np.sqrt(A + 8*B/9)
        print('   n=%d R=%.3f: E e1 MC %.4f formula %.4f | E e3 MC %.4f formula %.4f | E mean|g| %.4f <= Psi %.4f' % (n, R, E1.mean(), A, E3.mean(), B, mabs, Psi))

print('6. restriction: sampled circle sign sequences of F in V_3(n) have 1 or 3 sign changes per half-turn (N = 61)')
for n in [4, 9]:
    H = rand_harmonic(n); bvec = rng.standard_normal(n)
    F = lambda X: H(X) + 3*(X @ bvec)*((X*X).sum(-1) - n - 2)
    U, V = rng.standard_normal((20000, n)), rng.standard_normal((20000, n))
    r = np.arange(62); X = U[:, None, :]*np.cos(PI*r/61)[None, :, None] + V[:, None, :]*np.sin(PI*r/61)[None, :, None]
    s = np.sign(F(X)); ch = (s[:, 1:] != s[:, :-1]).sum(1)
    print('   n=%d: counts of sign changes over 20000 circles: %s' % (n, dict(zip(*np.unique(ch, return_counts=True)))))
