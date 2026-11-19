#!/usr/bin/env python3
# Reviewer (N): Theorem 1 on generic NON-COMMUTING factors sharing one block, with the row profiles, for the full
# content vector (no symmetry fixes its direction here).
#   example 1: q = X1 (Y*A1 Y - tr A1) + X2 (Y*A2 Y - tr A2), Y in C^2, A1, A2 complex (four real Hermitian factors);
#   example 2: three Hermitian factors on C^2, H1 = diag(1, 0.3), H2 = 0.7 sigma_x, H3 = 0.5 sigma_y + 0.2 sigma_z.
# The model is conditionally Gaussian, so only the law of A = |P|^2 and the vector E[P; A in da] enter: the quadrature
# nodes of Y are binned in A (relative width 0.5 %).  ||c||^2/(delta Omega_hat) at u/u* = 0.5, 1, 1.3 against (1) and 5/3.
#   argv: <scripts dir> <data dir>
import sys, math
import numpy as np
from scipy.interpolate import CubicSpline
sys.path.insert(0, sys.argv[1])
import siglib as L, proflib as PL
DATA = sys.argv[2]
sx = np.array([[0, 1], [1, 0]], complex); sy = np.array([[0, -1j], [1j, 0]]); sz = np.diag([1.0, -1.0]).astype(complex)
A1 = np.array([[0.9, 0.6 + 0.3j], [0.1 - 0.4j, -0.2 + 0.5j]]); A2 = np.array([[0.2j, 0.7], [-0.3, 0.4]], complex)
herm = lambda A: [(A + A.conj().T) / 2, (A - A.conj().T) / (2j)]
EX = {'two complex matrices (4 real factors)': herm(A1) + herm(A2),
      'three Hermitian factors': [np.diag([1.0, 0.3]).astype(complex), 0.7 * sx, 0.5 * sy + 0.2 * sz]}
t1, w1 = L.panels(list(np.linspace(0, 6, 61)) + list(np.linspace(6, 44, 39)[1:]), 6); w1 = w1 * np.exp(-t1)
nth = 96; th = (np.arange(nth) + 0.5) * 2 * np.pi / nth
T1, T2, TH = np.meshgrid(t1, t1, th, indexing='ij')
W = (w1[:, None, None] * w1[None, :, None] * np.ones(nth)[None, None, :] / nth).ravel()
Yv = np.array([np.sqrt(T1).ravel() + 0j, (np.sqrt(T2) * np.exp(1j * TH)).ravel()])
TAU, WTAU = L.panels(list(np.linspace(0, 8, 33)) + list(np.linspace(8, 48, 17)[1:]), 8); WTAU = WTAU * np.exp(-TAU)
for name, H in EX.items():
    p = len(H); tr = lambda M_: float(np.trace(M_).real)
    S = [[(H[i] @ H[j] + H[j] @ H[i]) / 2 for j in range(p)] for i in range(p)]
    M = np.array([[tr(H[i] @ H[j]) for j in range(p)] for i in range(p)]); G = sum(h @ h for h in H)
    R = np.array([[tr(G @ S[i][j]) for j in range(p)] for i in range(p)])
    T = np.array([[sum(tr(S[k][i] @ S[k][j]) for k in range(p)) for j in range(p)] for i in range(p)])
    v = np.array([tr(G @ H[i]) for i in range(p)]); J = M @ M + R + 2 * T; K = M @ M + T + 2 * R; u0 = float(np.trace(M)); L0 = 2 * float(np.trace(J))
    theta1 = (1 + 4 * float(np.linalg.eigvalsh(K + 4 * np.outer(v, v) / u0)[-1]) / L0) / 3
    P = np.array([np.einsum('an,ab,bn->n', Yv.conj(), H[i], Yv).real - tr(H[i]) for i in range(p)])
    A = (P ** 2).sum(0)
    chk = (abs(float(W @ A) / u0 - 1), abs(float(W @ (A - u0) ** 2) / L0 - 1), np.abs(2 * (P * A) @ W - 4 * v).max() / np.abs(v).max())
    comm = max(np.abs(H[i] @ H[j] - H[j] @ H[i]).max() for i in range(p) for j in range(p))
    # bin the nodes in A
    idx = np.floor(np.log(np.maximum(A, 1e-12) / 1e-12) / 0.005).astype(int); nb = idx.max() + 1
    f = np.bincount(idx, weights=W, minlength=nb); ok = f > 0
    a = (np.bincount(idx, weights=W * A, minlength=nb)[ok]) / f[ok]
    pi = np.array([np.bincount(idx, weights=W * P[i], minlength=nb)[ok] for i in range(p)]); f = f[ok]
    chk2 = (abs(float(f @ a) / u0 - 1), np.abs(2 * pi @ a - 4 * v).max() / np.abs(v).max())
    print('%s: u0 = %.4f, chi = %.4f, largest commutator entry %.2f; formula (1): theta = %.5f; checks (E A, Var A, content at h = v; after binning: E A, content at h = v): %.0e %.0e %.0e; %.0e %.0e; %d bins' % (
        name, u0, 2 * L0 / u0 ** 2, comm, theta1, *chk, *chk2, len(a)))
    worst = 0
    for t in ('0.80', '0.82', '0.84', '0.845', '0.85', '0.855'):
        npz = np.load('%s/prof_jets_%s.npz' % (DATA, t)); us = float(npz['ustar']); line = []
        for X in (0, 1):
            pr = PL.Prof(npz, X)
            for fr in (0.5, 1.0, 1.3):
                u = fr * us; sig2 = u / u0
                sg = np.linspace(0, 3.6, 1441); kpt, _ = PL.transforms(pr, u, sg ** 2); ksp = CubicSpline(sg, kpt)
                Vv = sig2 * a[:, None] * TAU[None, :]; s = np.sqrt(Vv)
                Gs = pr.G(s.ravel()).reshape(s.shape)
                c = pi @ ((np.sqrt(TAU)[None, :] / np.sqrt(a)[:, None] * Gs) @ WTAU)
                kp = np.where(s <= 3.6, ksp(np.minimum(s, 3.6)), -pr.Ginf / (2 * np.maximum(s, 3.6) ** 3))
                EVk2 = float(f @ ((Vv * kp * kp) @ WTAU)); EVk = float(f @ ((Vv * kp) @ WTAU))
                Om = 1.5 * EVk2 - 0.75 * EVk * EVk / u
                ratio = float(c @ c) / (sig2 ** 2 * 2 * L0 * Om); worst = max(worst, ratio)
                line.append('%.4f' % ratio)
        print('   row %-5s  A: u/u* = 0.5, 1, 1.3: %s %s %s   B: %s %s %s' % (t, *line), flush=True)
    assert worst <= theta1 <= 5 / 3
    print('   largest ratio %.4f  <=  formula (1) %.4f  <=  5/3' % (worst, theta1))
