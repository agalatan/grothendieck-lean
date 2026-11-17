# claude-b9ee, 17 Nov 2026: check of the radial argument of the pasted n = 3 proof, and how far it reaches in n.
# M_n = sup over a^2 + b^2 = 1 of E|a f1(S) + b f3(S)|, S ~ Gamma(n/2, 1),
# f1 = sqrt(S)(2S - (n+2))/sqrt(n(n+2)), f3 = S^{3/2}/sqrt(E S^3).  E|P| <= M_n ||P||_2 on the third chaos in n variables.
import mpmath as mp
mp.mp.dps = 30
def Phi(n, a, b):
    m3 = mp.mpf(n) / 2 * (mp.mpf(n) / 2 + 1) * (mp.mpf(n) / 2 + 2)
    A = 2 * a / mp.sqrt(n * (n + 2)) + b / mp.sqrt(m3); B = (n + 2) * a / mp.sqrt(n * (n + 2))
    g = lambda s: s ** (mp.mpf(n - 1) / 2) * abs(A * s - B) * mp.exp(-s)
    pts = [0, mp.inf] if A == 0 or B / A <= 0 else [0, B / A, mp.inf]
    return mp.quad(g, pts) / mp.gamma(mp.mpf(n) / 2)
c = mp.sqrt(2 / mp.pi)
for n in range(1, 10):
    if n == 1:
        M, th = Phi(1, 1, 0), 0
    else:
        grid = [(Phi(n, mp.cos(k * mp.pi / 400), mp.sin(k * mp.pi / 400)), k) for k in range(400)]
        v, k = max(grid)
        f = lambda th: -Phi(n, mp.cos(th), mp.sin(th))
        lo, hi = (k - 1) * mp.pi / 400, (k + 1) * mp.pi / 400
        for _ in range(60):  # golden section
            m1, m2 = lo + (hi - lo) * 0.382, lo + (hi - lo) * 0.618
            if f(m1) < f(m2): hi = m2
            else: lo = m1
        th = (lo + hi) / 2; M = Phi(n, mp.cos(th), mp.sin(th))
    print('n = %d: M_n = %s = %s * sqrt(2/pi)%s' % (n, mp.nstr(M, 8), mp.nstr(M / c, 6), '' if M < c else '   >= sqrt(2/pi): the radial argument stops'))
# the one-variable form of the pasted proof at n = 3: (80/3) h(t)^2 / Q(t)
h = lambda t: t - 2 + 2 * (t + 2) * mp.exp(-t); Q = lambda t: 36 * t ** 2 - 140 * t + 175
r = lambda t: (mp.mpf(80) / 3) * h(t) ** 2 / Q(t)
ts = mp.findroot(lambda t: mp.diff(r, t), 2.3)
print('n = 3, one-variable form: sup (80/3)h^2/Q = %s at t = %s; at t = 2: %s; so M_3 = %s * sqrt(2/pi)' % (mp.nstr(r(ts), 8), mp.nstr(ts, 6), mp.nstr(r(2), 6), mp.nstr(mp.sqrt(r(ts)), 6)))
print('the slip in the [2, 17/8] step: 392/361 + 1/16 =', mp.nstr(mp.mpf(392) / 361 + mp.mpf(1) / 16, 8), '= 6633/5776, written 6723/5776 (a weaker, still valid bound)')
print('28 sqrt5/(25 pi) =', mp.nstr(28 * mp.sqrt(5) / (25 * mp.pi), 8))
