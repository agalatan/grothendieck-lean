"""FLOAT replica of anchored_certificate.certify (search only).  qcap(recipe) -> (cap at anchor, (q0,q1,q2), min eig of D blocks)."""
import numpy as np, json
from fractions import Fraction as F
NR, NQ = 1600, 64
def radial(nr=NR, R=8.0, deg=12):
    x, w = np.polynomial.legendre.leggauss(10); e = np.linspace(0, R, nr + 1); a, b = e[:-1], e[1:]
    r = (a[:, None] + b[:, None]) / 2 + (b - a)[:, None] / 2 * x[None, :]; ww = (b - a)[:, None] / 2 * w[None, :]
    mom = np.stack([(ww * 2 * r ** (k + 1) * np.exp(-r * r)).sum(1) for k in range(deg + 1)], 1)
    from math import gamma, erfc, sqrt, pi, exp
    tail = [exp(-R * R)]; tail.append(R * exp(-R * R) + sqrt(pi) / 2 * erfc(R))
    for k in range(2, deg + 1): tail.append(R ** k * exp(-R * R) + k / 2 * tail[k - 2])
    return mom, np.array(tail), b
def angular(nq=NQ):
    th = np.pi * np.arange(nq + 1) / (2 * nq); A = np.zeros((nq, 5)); A[:, 0] = 1 / nq
    for k in range(1, 5): A[:, k] = 2 / (np.pi * k) * (np.sin(k * th[1:]) - np.sin(k * th[:-1]))
    return A
MOM, TAIL, RHI = radial(); ANG = angular()
def P(d): return np.array([d.get(k, 0.0) for k in range(13)])
def pm(p, q): return np.convolve(p, q)[:13]
def ev(p): return MOM @ p
class Row:
    def __init__(s, row):
        th = [float(F(v)) for v in row['theta']]; s.th = th; s.eps = float(F(row['eps'])); c = th[13] - 2 * th[14]; be = th[14]; s.c, s.be = c, be
        rt = 1 / np.sqrt(2); s.V = [P({0: 1}), P({2: 1, 0: -1}), P({2: rt})]; s.W = [P({1: 1}), P({3: rt, 1: -2 * rt}), P({1: 1})]
        s.L = P({1: c, 3: be}); s.L2 = pm(s.L, s.L); s.uE = [pm(s.L, v) for v in s.V]; s.uR = [pm(s.L, w) for w in s.W]
        s.GP = [[ev(pm(s.V[i], s.V[j])) for j in range(3)] for i in range(3)]; s.GR = [[ev(pm(s.W[i], s.W[j])) for j in range(3)] for i in range(3)]
        s.UE = [[ev(pm(s.uE[i], s.uE[j])) for j in range(3)] for i in range(3)]; s.UR = [[ev(pm(s.uR[i], s.uR[j])) for j in range(3)] for i in range(3)]
        s.GPt = [[pm(s.V[i], s.V[j]) @ TAIL for j in range(3)] for i in range(3)]; s.GRt = [[pm(s.W[i], s.W[j]) @ TAIL for j in range(3)] for i in range(3)]
        s.lm = RHI * (c + be * RHI ** 2); s.L2e = ev(s.L2); s.uEe = [ev(u) for u in s.uE]; s.ctail = TAIL[0] + s.L2 @ TAIL
        E = np.array([[th[0], th[1], th[2]], [th[1], th[3], th[4]], [th[2], th[4], th[5]]]); R = np.array([[th[6], th[7], 0], [th[7], th[8], 0], [0, 0, s.eps]])
        s.Q = [np.linalg.inv(E)] * 2 + [np.linalg.inv(R)] * 2; s.a = np.array([1 + th[10], th[11], th[12]])
    def H(s, sv, m, var=None, scale=1.0):
        y = np.asarray(m, float) + sv * s.a; A = y[0] * s.V[0] + y[1] * s.V[1]; B = y[2] * s.V[2]
        nb = ev(s.L2 + pm(A, A) + pm(B, B)); nc = ev(2 * pm(A, B)); cr = ev(pm(s.L, A + B)); ex0 = np.zeros(NR); ex2 = np.zeros(NR)
        if var is not None:
            for f in var:
                FA = f[0] * s.W[0] + f[1] * s.W[1]; FB = f[2] * s.W[2]; ex0 = ex0 + ev(pm(FA, FA) + pm(FB, FB)); ex2 = ex2 + ev(2 * pm(FA, FB))
        mass = MOM[:, 0:1] * ANG[None, :, 0]; npv = nb[:, None] * ANG[None, :, 0] + nc[:, None] * ANG[None, :, 2] + ex0[:, None] * ANG[None, :, 0] + ex2[:, None] * ANG[None, :, 2]
        xc = cr[:, None] * ANG[None, :, 1]
        pa = np.sqrt(np.maximum(npv + 2 * xc, 0) / mass) * scale; pb = np.sqrt(np.maximum(npv - 2 * xc, 0) / mass) * scale
        pa = np.maximum(pa, 1e-30); pb = np.maximum(pb, 1e-30); lm = s.lm[:, None]
        sm = pa + pb; d = pa - pb; d2 = pa * pa - pb * pb; nu = (1 / pa + 1 / pb) / 2; dnu = (1 / pa - 1 / pb) / 2
        g = 8 / (sm * (sm * sm + 4 * lm * lm + 4 * lm * np.abs(d))); tau = dnu + g * d2 / 4; xi = sm / 2 - g * d2 * d2 / 16
        nu0 = (nu * ANG[None, :, 0]).sum(1); nu2 = (nu * ANG[None, :, 2]).sum(1); g0 = (g * ANG[None, :, 0]).sum(1); g2 = (g * ANG[None, :, 2]).sum(1); g4 = (g * ANG[None, :, 4]).sum(1)
        t1 = (tau * ANG[None, :, 1]).sum(1); xi0 = (xi * ANG[None, :, 0]).sum(1)
        C = s.L2e @ nu0 + MOM[:, 0] @ xi0 + s.ctail; h = np.array([s.uEe[i] @ t1 for i in range(3)]); Hb = np.zeros((4, 3, 3))
        for i in range(3):
            for j in range(i, 3):
                cl = (i == 2) != (j == 2); nn = nu2 if cl else nu0
                eb = s.GP[i][j] @ nn; Hb[0, i, j] = eb - s.UE[i][j] @ ((g0 + g2) / 2); Hb[1, i, j] = (-eb if cl else eb) - s.UE[i][j] @ ((g0 - g2) / 2)
                rb = s.GR[i][j] @ nn; rw = (g0 + g4) / 2 if i == j == 2 else (g2 if cl else g0)
                Hb[2, i, j] = rb - s.UR[i][j] @ rw; Hb[3, i, j] = rb - (s.UR[i][j] @ ((g0 - g4) / 2) if i == j == 2 else 0)
                if not cl: Hb[0, i, j] += s.GPt[i][j]; Hb[1, i, j] += s.GPt[i][j]; Hb[2, i, j] += s.GRt[i][j]; Hb[3, i, j] += s.GRt[i][j]
                Hb[:, j, i] = Hb[:, i, j]
        return C, h, Hb
    def quad(s, C, h, Hb):
        D = [s.Q[b] - Hb[b] for b in range(4)]; mins = [np.linalg.eigvalsh(d)[0] for d in D]
        a = s.a; Di = np.linalg.inv(D[0]); Dih = Di @ h
        q0 = C + h @ Dih; q1 = 2 * a @ (h + Hb[0] @ Dih); q2 = a @ (Hb[0] + Hb[0] @ Di @ Hb[0]) @ a
        return (q0, q1, q2), mins
    def cap(s, sv, m, var=None, scale=1.0):
        q, mins = s.quad(*s.H(sv, m, var, scale)); return q[0] + q[1] * sv + q[2] * sv * sv, q, mins
