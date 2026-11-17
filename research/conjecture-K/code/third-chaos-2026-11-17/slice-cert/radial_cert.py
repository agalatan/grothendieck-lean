# claude-b9ee, 17 Nov 2026.  PART A3: full third chaos V_3(n), weighted great-circle slicing at fixed radius.
# For F in V_3(n), ||F||_2 = 1, F(R Theta) = A_F(Theta) e1(R) + B_F(Theta) e3(R), p = E_Theta A_F^2 in [0, 1]:
#   E|F| <= J_n(p) := int_0^oo Psi(A(R), B(R)) chi_n(R) dR,
#   A(R) = p e1^2 + (1-p)(1-tau) e3^2,  B(R) = (1-p) tau e3^2,  tau = (n+2)/(4(n-1)),
#   e1^2 = R^2 (R^2-n-2)^2/(2n(n+2)),  e3^2 = R^6/(n(n+2)(n+4)),  chi_n(R) = 2^(1-n/2)/Gamma(n/2) R^(n-1) e^(-R^2/2),
#   Psi(A, B) = f1 = (2 sqrt2/pi)(sqrt A + sqrt B/3)  if A >= (64/9) B   (regime 1),
#             = f2 = (3/pi) sqrt(A + 8B/9)             otherwise          (regime 2).
# f1 <= f2 everywhere (f1 is the unconstrained minimum over gamma > 0), so splitting the R-axis at rational points
# just outside / just inside the exact regime boundaries gives an upper / lower bound of J_n(p).
# Regime 1 <=> (R^2-n-2)^2 >= kappa R^4, kappa = 2(1-p)(73 tau/9 - 1)/(p(n+4)), i.e.
#   R^2 <= (n+2)/(1+sqrt kappa)  or  R^2 >= (n+2)/(1-sqrt kappa) (the latter only if sqrt kappa < 1).
# Integrals by Arb (python-flint acb.integral, rigorous Gauss-Legendre with error bounds; sqrt with the analytic flag),
# tail R >= T bounded by Psi <= (3/pi) sqrt(k1) R^3 and Gamma(s, x) <= x^(s-1) e^(-x) x/(x-s+1).
# J_n is concave in p (Psi is a minimum over gamma of sqrt of functions affine in p), so a grid with two-sided
# enclosures bounds max_p J_n(p) through extended secants (see concave_max_bound).
# Run:  python3 -I radial_cert.py [M]      (M = grid size, default 1000; needs python-flint)
import sys, time
from fractions import Fraction as Fr
from flint import arb, acb, fmpq, ctx
ctx.prec = 64
PI = arb.pi()

def Q(x): return arb(fmpq(x.numerator, x.denominator))
def exact_fr(x):                       # exact arb (radius 0) -> Fraction
    m, e = x.man_exp(); m, e = int(m), int(e)
    return Fr(m * 2**e) if e >= 0 else Fr(m, 2**(-e))
def lower_fr(x): return exact_fr(x.lower())
def dec_up(x, d=12):                   # decimal string >= x (Fraction), d digits after the point
    q = -((-x.numerator * 10**d) // x.denominator); s = str(q).rjust(d + 1, '0'); return s[:-d] + '.' + s[-d:]
def dec_dn(x, d=12):                   # decimal string <= x
    q = (x.numerator * 10**d) // x.denominator; s = str(q).rjust(d + 1, '0'); return s[:-d] + '.' + s[-d:]
def upper_fr(x): return exact_fr(x.upper())

class Radial:
    def __init__(self, n, T=16):
        assert n >= 2
        self.n, self.T = n, T
        self.k1 = 1/arb(2*n*(n + 2)); self.k3 = 1/arb(n*(n + 2)*(n + 4))
        self.tau = arb(n + 2)/arb(4*(n - 1))
        self.cn = arb(2)**(1 - arb(n)/2)/(arb(n)/2).gamma()
        self.C1 = 2*arb(2).sqrt()/PI; self.C2 = 3/PI
        s = arb(n + 3)/2; x = arb(T)**2/2
        assert x > s - 1 and T*T >= n + 2
        G = x**(s - 1)*(-x).exp()*x/(x - s + 1)            # Gamma(s, x) upper bound
        self.tail = (self.C2*self.k1.sqrt()*self.cn*arb(2)**((arb(n) + 1)/2)*G).upper()
        self.calls = 0

    def enclosure(self, p):
        n, T = self.n, self.T; p_ = Q(p); np2 = n + 2
        cA = acb(p_*self.k1); c1 = acb((1 - p_)*(1 - self.tau)*self.k3); c2 = acb((1 - p_)*(1 - self.tau/9)*self.k3)
        cB = acb(((1 - p_)*self.tau*self.k3).sqrt()); C1 = acb(self.C1); C2 = acb(self.C2); cn = acb(self.cn)
        def dens(x): return cn*x**(n - 1)*(-x*x/2).exp()
        def f1(x, an):
            q = cA*(x*x - np2)**2 + c1*x**4
            return C1*(x*q.sqrt(analytic=an) + cB*x**3/3)*dens(x)
        def f2(x, an):
            q = cA*(x*x - np2)**2 + c2*x**4
            return C2*x*q.sqrt(analytic=an)*dens(x)
        sc2 = acb(((1 - p_)*(1 - self.tau/9)*self.k3).sqrt())
        def f2_p0(x, an):                                   # p = 0: sqrt(q) = sqrt(c2) R^2 exactly
            return C2*sc2*x**3*dens(x)
        def integ(f, a, b):
            self.calls += 1
            v = acb.integral(f, Q(Fr(a)), Q(Fr(b)))
            assert v.real.rad() < 1e-14 and v.imag.rad() < 1e-14, (n, p, a, b, v)
            return v.real
        if p == 0:
            up = lo = integ(f2_p0, 0, T)
        else:
            ctx.prec = 192                                    # regime boundaries at high precision
            tau = arb(n + 2)/arb(4*(n - 1)); pp = Q(p)
            kap = 2*(1 - pp)*(73*tau/9 - 1)/(pp*(n + 4)); sk = kap.sqrt()
            def bracket(X):                                   # rationals a < X < b, b - a ~ 3 * 2^-40
                a = Fr(int((X.lower()*2**40).floor().unique_fmpz()) - 1, 2**40)
                b = Fr(int((X.upper()*2**40).ceil().unique_fmpz()) + 1, 2**40)
                assert Q(a) < X and X < Q(b) and b - a < Fr(1, 2**37); return a, b
            ra_lo, ra_hi = bracket((arb(np2)/(1 + sk)).sqrt())
            if sk < 1 and arb(np2)/(1 - sk) < T*T:           # second boundary inside [0, T]
                rb_lo, rb_hi = bracket((arb(np2)/(1 - sk)).sqrt())
            elif sk >= 1 or arb(np2)/(1 - sk) > T*T:          # regime 2 extends beyond T
                rb_lo = rb_hi = None
            else:
                raise ValueError('regime boundary not separated from T')
            ctx.prec = 64
            if rb_lo is not None:
                assert rb_hi < T
                pu = [(f1, 0, ra_lo), (f2, ra_lo, rb_hi), (f1, rb_hi, T)]     # regime 2 enlarged (upper bound)
                pl = [(f1, 0, ra_hi), (f2, ra_hi, rb_lo), (f1, rb_lo, T)]     # regime 2 shrunk   (lower bound)
            else:
                pu = [(f1, 0, ra_lo), (f2, ra_lo, T)]; pl = [(f1, 0, ra_hi), (f2, ra_hi, T)]
            up = sum((integ(f, a, b) for f, a, b in pu), arb(0))
            lo = sum((integ(f, a, b) for f, a, b in pl), arb(0))
        return lower_fr(lo), upper_fr(up + self.tail)

def concave_max_bound(ps, L, U):
    """ps = [p_0 = 0 < ... < p_{M-1}] evaluated, p_M = 1 not evaluated; L_j <= J(p_j) <= U_j; J concave on [0, 1].
    Returns (bound, interval index, p at the bound): an exact rational upper bound of max_{[0,1]} J."""
    M = len(ps); P = list(ps) + [Fr(1)]
    best = (None, None, None)
    for i in range(M):
        a, b = P[i], P[i + 1]; lines = []
        if i >= 1:                       # J(p) <= J(p_i) + (J(p_i) - J(p_{i-1}))/(p_i - p_{i-1}) (p - p_i), p >= p_i
            s = (U[i] - L[i - 1])/(P[i] - P[i - 1]); lines.append((U[i] - s*a, s))      # l(p) = c + s p
        if i + 2 <= M - 1:               # J(p) <= J(p_{i+1}) + (J(p_{i+1}) - J(p_{i+2}))/(p_{i+2} - p_{i+1}) (p_{i+1} - p)
            s = (U[i + 1] - L[i + 2])/(P[i + 2] - P[i + 1]); lines.append((U[i + 1] + s*b, -s))
        assert lines
        cands = [a, b]
        if len(lines) == 2 and lines[0][1] != lines[1][1]:
            x = (lines[1][0] - lines[0][0])/(lines[0][1] - lines[1][1])
            if a < x < b: cands.append(x)
        v, x = max((min(c + s*x for c, s in lines), x) for x in cands)
        if best[0] is None or v > best[0]: best = (v, i, x)
    return best

def mp_crosscheck(n, p, dps=30):        # independent floating evaluation (mpmath, split at the exact regime points)
    import mpmath as mp
    mp.mp.dps = dps; n_ = mp.mpf(n); p = mp.mpf(p.numerator)/p.denominator
    tau = (n_ + 2)/(4*(n_ - 1)); k1 = 1/(2*n_*(n_ + 2)); k3 = 1/(n_*(n_ + 2)*(n_ + 4))
    def f(r):
        e1 = r**2*(r**2 - n_ - 2)**2*k1; e3 = r**6*k3; A = p*e1 + (1 - p)*(1 - tau)*e3; B = (1 - p)*tau*e3
        v = (2*mp.sqrt(2)/mp.pi)*(mp.sqrt(A) + mp.sqrt(B)/3) if A >= 64*B/9 else (3/mp.pi)*mp.sqrt(A + 8*B/9)
        return v*2**(1 - n_/2)/mp.gamma(n_/2)*r**(n_ - 1)*mp.exp(-r**2/2)
    pts = [mp.mpf(0)]
    if p > 0:
        sk = mp.sqrt(2*(1 - p)*(73*tau/9 - 1)/(p*(n_ + 4)))
        pts.append(mp.sqrt((n_ + 2)/(1 + sk)))
        if sk < 1: pts.append(mp.sqrt((n_ + 2)/(1 - sk)))
    pts = sorted(set(pts + [mp.sqrt(n_ + 2), mp.mpf(20)]))
    return mp.quad(f, pts) + mp.quad(f, [20, mp.inf])

if __name__ == '__main__':
    M = int(sys.argv[1]) if len(sys.argv) > 1 else 1000
    S2P = (2/PI).sqrt(); T17 = Fr(17, 25)
    print('grid p_j = j/%d, j = 0..%d (p = 1 not evaluated; concavity covers [p_{M-1}, 1]); Arb prec %d bits, T = 16' % (M, M - 1, ctx.prec))
    print('cross-check (mpmath 30 digits, independent integrator) at three points:')
    for n, p in [(8, Fr(9, 20)), (11, Fr(2, 5)), (5, Fr(3, 5))]:
        lo, hi = Radial(n).enclosure(p); v = mp_crosscheck(n, p)
        print('   n=%2d p=%-5s  Arb [%s, %s]   mpmath %s   %s' % (n, p, dec_dn(lo, 20), dec_up(hi, 20), str(v)[:24], 'ok' if lo - Fr(1, 10**25) <= Fr(str(v)) <= hi + Fr(1, 10**25) else 'MISMATCH'))
    print()
    print(' n   max_j U_j (grid)  argmax p   certified B_n >= max_p J_n(p)  (worst interval)     target       result   margin     time')
    results = {}
    for n in range(2, 13):
        t0 = time.time(); R = Radial(n)
        ps = [Fr(j, M) for j in range(M)]; L = []; U = []
        for p in ps:
            lo, hi = R.enclosure(p); L.append(lo); U.append(hi)
        Bn, i, x = concave_max_bound(ps, L, U)
        jmax = max(range(M), key=lambda j: U[j])
        Bn_arb = Q(Bn)
        if n <= 8:
            ok = bool(Bn_arb*Bn_arb*PI < 2); tgt = 'sqrt(2/pi)'; margin = S2P - Bn_arb
        else:
            ok = Bn*Bn < T17; tgt = 'sqrt(17/25)'; margin = Q(T17).sqrt() - Bn_arb
        if n == 12:      # rigorous LOWER bound of max_p J_12: the method does not give (T) at n = 12
            Lmax = max(L); ok = None
            print('%2d   %.9f        %.3f      max_p J_12(p) >= %s > sqrt(17/25) = 0.824621125...: %s   %.1fs' % (n, float(U[jmax]), float(ps[jmax]), dec_dn(Lmax, 9), Lmax*Lmax > T17, time.time() - t0))
            continue
        results[n] = (Bn, ok)
        print('%2d   %.9f        %.3f      %s  ([%.3f, %.3f], p = %.4f)  %-12s %s  %.2e   %.1fs' % (n, float(U[jmax]), float(ps[jmax]), dec_up(Bn, 9), float(Fr(i, M)), float(Fr(i + 1, M)), float(x), tgt, 'PROVED' if ok else 'NOT PROVED', float(margin.mid()), time.time() - t0), flush=True)
    print()
    print('Arb integrals evaluated: all enclosures have radius < 1e-14 (asserted).')
    assert all(results[n][1] for n in range(2, 12))
    print('CERTIFIED: for every F in V_3(n): E|F| <= B_n ||F||_2 with B_n < sqrt(2/pi) for 2 <= n <= 8 and B_n < sqrt(17/25) for 2 <= n <= 11.')
