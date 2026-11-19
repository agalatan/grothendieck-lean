"""Numerical checks for 'Example 3.1 (HJM, arXiv:2610.10477) for d=2,3'.
Run:  python3 verify_example31.py      (numpy + scipy; ~1-2 min)
Everything here is double-precision numerics (no interval arithmetic)."""
import itertools
import numpy as np
from scipy import integrate, special

SQ = np.sqrt(2 / np.pi)
phi = lambda x: np.exp(-x * x / 2) / np.sqrt(2 * np.pi)
x = np.linspace(-14, 14, 2_000_001)
wx = phi(x) * (x[1] - x[0])
psi = {2: (x**2 - 1) / np.sqrt(2), 3: (x**3 - 3 * x) / np.sqrt(6)}

print("sqrt(2/pi) =", SQ)

# n = 1
print("[n=1] E|psi_2| =", np.sum(np.abs(psi[2]) * wx), " closed form 2e^{-1/2}/sqrt(pi) =", 2 * np.exp(-.5) / np.sqrt(np.pi))
print("[n=1] E|psi_3| =", np.sum(np.abs(psi[3]) * wx), " closed form (1+4e^{-3/2})/sqrt(3pi) =", (1 + 4 * np.exp(-1.5)) / np.sqrt(3 * np.pi))

# Prop 4.6: circle certificates (brute force over sign vectors)
def circle_value(N, weights, periodic):
    best = -np.inf
    for bits in itertools.product([1, -1], repeat=N):
        s = list(bits)
        full = s + (s if periodic else [-v for v in s])
        val = sum(wk * full[r] * full[(r + k) % (2 * N)] for r in range(N) for k, wk in weights.items()) / N
        best = max(best, val)
    return best
v2 = circle_value(6, {2: -0.8, 5: 1.6}, periodic=True)
c = np.cos(np.pi * np.arange(1, 6) / 6)
print("[4.6] d=2, N=6: max =", v2, "; coef_0, coef_2 =", 1.6 * c[4]**0 - 0.8 * c[1]**0, 1.6 * c[4]**2 - 0.8 * c[1]**2, " => W_2 <=", v2)
v3 = circle_value(5, {1: 1.0, 2: -1.0}, periodic=False)
c1, c2 = np.cos(np.pi / 5), np.cos(2 * np.pi / 5)
print("[4.6] d=3, N=5: max =", v3, "; coef_1, coef_3 =", c1 - c2, c1**3 - c2**3, " => W_3 <=", v3 / (c1**3 - c2**3))
a1, a3 = np.cos(np.pi / 7), np.cos(3 * np.pi / 7); om = 1 / (a1**3 - a3**3)
v7 = circle_value(7, {1: om, 3: -om}, periodic=False)
print("[4.6] d=3, N=7: W_3 <=", v7, " (closed form 4/(7(cos^3(pi/7)-cos^3(3pi/7))) =", 4 / (7 * (a1**3 - a3**3)), ")")

# Prop 4.3: high-correlation regime
for d, kappa, a in ((2, 1.16, 0.966), (3, 1.60, 0.874)):
    S = np.abs(psi[d]) > kappa
    al, be = np.sum(np.abs(psi[d]) * S * wx), np.sum(psi[d]**2 * S * wx)
    worst = max(aa * al + np.sqrt(1 - aa * aa * be) for aa in np.linspace(a, 1, 200))
    print(f"[4.3] d={d}: kappa={kappa}, alpha={al:.5f}, beta={be:.5f}; max over a in [{a},1] of bound = {worst:.5f}")

# Theorem 4.2: d=2 small-influence constants
M = 1 / 8; cc = 2 * M * M; nu = 1 / (4 * M * M)
B = (1 / 18) * cc**-2.5 * np.exp(special.betaln(2.5, nu - 2.5))
A = 0.5 * np.sqrt(np.pi / 2) * (1 - 4 * M * M)
print(f"[4.2] M=1/8: A_low={A:.5f}, B={B:.5f}, A-B={A - B:.5f} => E|F| <= sqrt(2/pi) - {2 / np.pi * (A - B):.5f} * L4")
xs = np.linspace(0, 1e4, 1_000_001)
print("[4.2] Pade check min_x [x-log(1+x) - x^2/(2(1+2x/3))] =", np.min(xs - np.log1p(xs) - xs**2 / (2 * (1 + 2 * xs / 3))))

# Prop 4.4: harmonic cubics (great circles) and full third chaos (radial sectors)
C3 = 4 * np.sqrt(5) / (3 * np.pi)
al = np.linspace(0, 2 * np.pi, 200001)[:-1]
g = np.sin(al) + np.sin(3 * al) / 3
print("[4.4] C_trig3 = 4sqrt5/(3pi) =", C3, "; L1/L2 of sin+sin3/3 =", np.mean(np.abs(g)) / np.sqrt(np.mean(g * g)))
lg = special.gammaln
ER = lambda k, n: np.exp(k / 2 * np.log(2) + lg((n + k) / 2) - lg(n / 2))
for n in (11, 12):
    print(f"[4.4] harmonic cubics n={n}: a_n*C = {ER(3, n) / np.sqrt(ER(6, n)) * C3:.6f}")
for n in range(2, 8):
    r = np.linspace(1e-9, 30, 300001); dr = r[1] - r[0]
    dens = np.exp((n - 1) * np.log(r) - r * r / 2 - (n / 2 - 1) * np.log(2) - lg(n / 2))
    e1 = r * (r * r - (n + 2)); e1 /= np.sqrt(np.sum(e1**2 * dens) * dr)
    e3 = r**3; e3 /= np.sqrt(np.sum(e3**2 * dens) * dr)
    K = max(np.sum(np.abs(np.cos(t) * e1 + np.sin(t) * e3) * dens) * dr for t in np.linspace(0, np.pi, 2001))
    print(f"[4.4] full H_3^({n}): K_n = {K:.5f}")

# d=2 numerics: E|sum lam_j h2(X_j)| via Fourier, for a few spectra
def eabs_d2(lam, T=300.0):
    lam = np.asarray(lam, float); lam /= np.linalg.norm(lam)
    t = np.linspace(1e-7, T, 600001)
    lp = np.zeros_like(t, dtype=complex)
    for l in lam:
        lp += -1j * l * t / np.sqrt(2) - 0.5 * np.log(1 - 1j * np.sqrt(2) * l * t)
    f = (1 - np.real(np.exp(lp))) / t**2; f[0] = 0.5
    return 2 / np.pi * (integrate.simpson(f, x=t) + 1 / T)
for lam in ([1], [1, 1], [1, -1], [2, -1, -1], [1] * 8, [1] * 40, [1, 1, 1, 1, 0.3]):
    print(f"[d=2] spectrum {lam[:5]}{'...' if len(lam) > 5 else ''} (n={len(lam)}): E|F| = {eabs_d2(lam):.5f}")

# ---- additions (latest round) ----
# Prop 4.4(c'): circle slicing at fixed radius, full H_3^(n)
for n in range(2, 9):
    r = np.linspace(1e-9, 30, 300001); dr = r[1] - r[0]
    dens = np.exp((n - 1) * np.log(r) - r * r / 2 - (n / 2 - 1) * np.log(2) - lg(n / 2))
    e1 = r * (r * r - (n + 2)); e1 /= np.sqrt(np.sum(e1**2 * dens) * dr)
    e3 = r**3; e3 /= np.sqrt(np.sum(e3**2 * dens) * dr)
    b = max(C3 * np.sum(np.sqrt(p * e1**2 + (1 - p) * e3**2) * dens) * dr for p in np.linspace(0, 1, 501))
    print(f"[4.4c'] slice bound n={n}: {b:.5f}")
# Prop 4.3(b): conditional Cauchy-Schwarz, worst case = independent remainder
for d, a in ((3, 0.84), (2, 0.92)):
    print(f"[4.3b] d={d}, a={a}: bound {np.sum(np.sqrt(a*a*psi[d]**2 + 1 - a*a) * wx):.5f}")
# Cor 4.4': complete cubics
for N in (7, 12, 1000):
    a2, b2, c2 = (N-1)*(N-2)/N**2, 3*(N-2)/N**2, 4/N**2
    print(f"[4.4'] K_{N}: {np.sum(np.sqrt(a2*psi[3]**2 + b2*x**2 + c2) * wx):.5f}")
# Prop 4.3': d=2 envelope integral for M in [0.75, 1]
def env(M):
    l2 = 1 - M*M; t = np.linspace(1e-6, 2000, 2_000_001)
    Rl = (1+2*M*M*t*t)**-0.25*np.exp(-0.5*l2*t*t); Ru = (1+2*M*M*t*t)**-0.25*(1+2*l2*t*t)**-0.25
    a = np.sqrt(2)*M*t; Th = 0.5*(a-np.arctan(a)) + 3/13*l2*t*t
    low = np.where(Th <= np.pi/2, Rl*np.cos(Th), Ru*np.cos(np.minimum(Th, np.pi)))
    f = (low - np.exp(-t*t/2))/t**2; f[0] = 0
    return integrate.simpson(f, x=t) - 1/2000
print("[4.3'] min over M in [0.75,1] of envelope integral:", min(env(M) for M in np.linspace(0.75, 1, 26)))
# Sec 5.3: single crossing of D0 for h3 (the 1-D values used in the proof) and the monotonicity of g_*
xx = np.linspace(-14, 14, 1_400_001); wxx = np.exp(-xx**2/2)/np.sqrt(2*np.pi)*(xx[1]-xx[0])
h3v = (xx**3 - 3*xx)/np.sqrt(6)
D0 = lambda w: np.sum((np.maximum(np.abs(xx)-w, 0) - np.maximum(np.abs(h3v)-w, 0))*wxx)
y0 = np.sqrt(2/3)
print(f"[5.3] D0(0)={D0(0):.5f} (closed form {np.sqrt(2/np.pi)-(1+4*np.exp(-1.5))/np.sqrt(3*np.pi):.5f}), D0(sqrt(2/3))={D0(y0):.5f}")
xg = np.linspace(1.0001, 30, 300000); dlog = 1/xg + 2*xg/(xg**2+1) - xg - 6*xg/(xg**2-1)
print("[5.3] (log g_*)' < 0 on (1,30]:", bool(np.all(dlog < 0)))
# E h3^6 (the latest Gemini exposition still writes 54,123)
print(f"[audit] E h3^6 = {np.sum(h3v**6*wxx):.1f}")
