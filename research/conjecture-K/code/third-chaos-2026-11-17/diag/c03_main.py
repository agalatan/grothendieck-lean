# claude-b9ee research worker, 17 Nov 2026. RIGOROUS certificate (arb ball arithmetic, python-flint) for Lemma 4 of
# PROOF_DIAGONAL.md:  b(kappa) > tau(kappa) for every kappa >= 0, where
#   b(k)   = int_0^{u1} g(u) e^{-k u^2/2} u^{-2} du,            g = psi - e^{-u^2/2},  u1 = 29/10,
#   tau(k) = int_{u1}^inf (|psi(u)| e^{-k c(u) u^2} + e^{-(1+k) u^2/2}) u^{-2} du,
# and c is the nonincreasing step function built here (|psi(u)| <= e^{-c(u) u^2} for all u > 0).
# Inputs: psi_grid.txt (c01, real-line method), psi_grid_contour.txt (c01, contour method, cross-check), bnd40.txt (c02).
# Every quantity is an arb ball containing the exact real number named in the proof; every decision is a strict ball
# comparison, so a printed "True" is a proof of the stated inequality.
from flint import arb, fmpq, ctx
ctx.prec = 96
DEN, KA, K1, KE = 1000, 200, 2900, 40000           # grid u_k = k/1000; u_a = 1/5, u1 = 29/10, U_end = 40
L = arb(632) / 1024                                 # Lipschitz constant of psi and of |psi| (c00: E|h| < 632/1024)
d = arb(fmpq(1, DEN)); hLd = L * d / 2
u = lambda k: arb(fmpq(k, DEN))
lo = lambda x: x.lower(); hi = lambda x: x.upper()   # exact endpoints (radius 0)
def emin(a, b): return a if a < b else b             # a, b exact
def emax(a, b): return a if a > b else b
ok = True
def check(name, cond):
    global ok
    print(('PASS ' if cond else 'FAIL ') + name)
    ok = ok and bool(cond)
# ---- grid
psi = {}
for line in open('psi_grid.txt'):
    k, s = line.split(' ', 1); psi[int(k)] = arb(s.strip())
check('grid complete, k = %d..%d' % (KA, KE), all(k in psi for k in range(KA, KE + 1)))
print('largest radius of a psi enclosure: %s' % max(psi[k].rad() for k in range(KA, KE + 1)).str(3))
nx = 0
for line in open('psi_grid_contour.txt'):
    k, s = line.split(' ', 1); k = int(k); y = arb(s.strip())
    if not psi[k].overlaps(y): print('MISMATCH at k =', k); ok = False
    nx += 1
check('contour enclosures overlap the real-line enclosures at %d points' % nx, ok)
# ---- (F1) g > 0 on [1/5, 29/10], and the bulk cell bounds G_k <= inf_{[u_k, u_{k+1}]} g
G = {}
for k in range(KA, K1):
    m = emin(lo(psi[k]), lo(psi[k + 1]))
    G[k] = m - hLd - (-(u(k) ** 2) / 2).exp()
check('F1: g >= G_k > 0 on every cell of [1/5, 29/10] (%d cells); smallest G_k = %s' % (len(G), min(lo(G[k]) for k in G).str(5)),
      all(G[k] > 0 for k in G))
# ---- cell bounds P_k >= sup_{[u_k, u_{k+1}]} |psi| and the envelope C_k
P = {}
for k in range(KA, KE):
    P[k] = emax(abs(psi[k]).upper(), abs(psi[k + 1]).upper()) + hLd
c0 = 0.2                                            # c = 1/5 on (0, 1/5] (analytic, PROOF_DIAGONAL.md Lemma 2(c))
C = {}; prev = c0
for k in range(KA, KE):
    loc = -P[k].log() / u(k + 1) ** 2
    cand = float(loc.mid()) - float(loc.rad()) * 2 - 1e-12
    cand = max(cand, 0.0)
    ck = min(prev, cand)
    C[k] = ck; prev = ck
check('envelope: e^{-C_k u_{k+1}^2} > P_k on every cell (%d cells)' % len(C),
      all(((-arb(C[k]) * u(k + 1) ** 2).exp() - P[k]) > 0 for k in C))
check('C nonincreasing and <= 1/5, C_last = %r > 0' % C[KE - 1],
      all(C[k + 1] <= C[k] for k in range(KA, KE - 1)) and C[KA] <= c0 and C[KE - 1] > 0)
for x in [0.5, 1, 2, 2.9, 3.5, 4, 4.727, 6, 8, 10, 20, 39.999]:
    print('  c(%g) = %.6f' % (x, C[int(x * DEN)]))
# ---- beyond U_end = 40: |psi(u)| <= Bnd(u) <= Bnd(40) <= e^{-beta}; c(u) = min(C_last, beta/u^2)
b40 = arb(open('bnd40.txt').read().strip())
beta = float(-b40.log().mid()) - 1e-9
check('Bnd(40) <= e^{-beta}, beta = %r' % beta, (arb(-beta).exp() - b40) > 0)
UE = u(KE)
Utail = emax(hi((-arb(C[KE - 1]) * UE ** 2).exp()), hi(arb(-beta).exp()))
Ustar = Utail
for k in range(K1 - 1, KE):                         # every cell meeting [u1, 40]
    Ustar = emax(Ustar, hi((-arb(C[k]) * u(k) ** 2).exp()))
print('U_tail = %s,  U* = sup_{u >= u1} e^{-c(u)u^2} <= %s' % (Utail.str(8), Ustar.str(8)))
# ---- b and tau on the kappa partition kappa_j = j/20, j = 0..160 (K = 8)
u1 = u(K1)
wB = {k: (1 / u(k) - 1 / u(k + 1)) for k in G}
wT = {k: (1 / u(k) - 1 / u(k + 1)) for k in range(K1, KE)}
qB = {k: (-(u(k + 1) ** 2) / 40).exp() for k in G}            # e^{-(1/20) u_{k+1}^2/2}
qT = {k: (-arb(C[k]) * u(k) ** 2 / 20).exp() for k in wT}       # e^{-(1/20) C_k u_k^2}
rB = {k: arb(1) for k in G}; rT = {k: arb(1) for k in wT}
an = arb(917) / 1200 / 375                                      # (917/1200) int_0^{1/5} u^2 du
def Bval(kap):
    return sum((G[k] * wB[k] * rB[k] for k in G), arb(0)) + an * (-kap / 50).exp()
def Tval(kap):
    s = sum((P[k] * wT[k] * rT[k] for k in wT), arb(0))
    s += arb(-beta).exp() * Utail ** kap / UE                    # u > 40
    s += (-(1 + kap) * u1 ** 2 / 2).exp() / ((1 + kap) * u1 ** 3) # Gaussian term
    return s
J = 160; Bs = []; Ts = []
for j in range(J + 1):
    kap = arb(j) / 20
    Bs.append(Bval(kap)); Ts.append(Tval(kap))
    for k in rB: rB[k] *= qB[k]
    for k in rT: rT[k] *= qT[k]
for j in [0, 1, 2, 4, 10, 20, 40, 80, 120, 160]:
    print('  kappa = %5.2f: b >= %s, tau <= %s' % (j / 20, lo(Bs[j]).str(8), hi(Ts[j]).str(8)))
margins = [Bs[j + 1] - Ts[j] for j in range(J)]
worst = min(range(J), key=lambda j: lo(margins[j]))
check('partition [0, 8]: b(kappa_{j+1}) - tau(kappa_j) > 0 for j = 0..159; smallest margin %s at kappa_j = %g'
      % (lo(margins[worst]).str(6), worst / 20), all(m > 0 for m in margins))
# ---- kappa >= K = 8: b(k) >= (917/450000) e^{-k/50},  tau(k) <= U*^k/u1 + Gamma(k), both sides compared at K
K = arb(8)
lhs = arb(917) / 450000 * (-K / 50).exp()
rhs = Ustar ** K / u1 + (-(1 + K) * u1 ** 2 / 2).exp() / ((1 + K) * u1 ** 3)
check('kappa >= 8: (917/450000) e^{-8/50} = %s > %s = U*^8/u1 + Gamma(8)' % (lo(lhs).str(6), hi(rhs).str(6)), (lhs - rhs) > 0)
check('U* e^{1/50} < 1 and e^{-u1^2/2} <= e^{-1/50}', (Ustar * arb(1 / 50).exp()) < 1 and (u1 ** 2 / 2 - arb(1) / 50) > 0)
print('ALL CHECKS PASSED' if ok else 'SOME CHECK FAILED')
