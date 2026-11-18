"""Figures for the article draft (local only).

Reads the certified tiger (shrink/cert_final) and the overlaps mu_k of the independent re-check
(recheck-final/out/mu_final_mid.npy); writes tiger_phase.pdf and tiger_mu.pdf next to this script.
No new numbers are computed for the text: the plots only display material data.

usage:  uv run --offline --no-project --with numpy --with matplotlib python3 make_figures.py
"""
import json
import os
from fractions import Fraction

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt  # noqa: E402

BASE = "/Users/alingalatan/workspaces/grothe/handoff/haagerup-check-2026-11-18"
CERT = os.path.join(BASE, "shrink", "cert_final")
MU = os.path.join(BASE, "recheck-final", "out", "mu_final_mid.npy")
OUT = os.path.dirname(os.path.abspath(__file__))
GAMMA_DAGGER = 0.7119586597782638  # verifier log, shrink/logs/verify_v4.log
W_EXCESS = 1.0719690924e-3  # recheck-final/logs/combine_mu.log, averaged partial sums
R_SHOW = 3.6  # the outer cells [7/2, inf) and [107/36, inf) are drawn up to this radius

tj = json.load(open(os.path.join(CERT, "tiger.json")))
npz = np.load(os.path.join(CERT, "tiger.npz"))
q = int(tj["q_shift"])
F = (npz["F_re"].astype(np.float64) + 1j * npz["F_im"].astype(np.float64)) / float(1 << q)
Npsi = int(tj["Npsi"])


def edges(lst):
    return np.array([R_SHOW if s == "inf" else float(Fraction(s)) for s in lst])


e1, e2 = edges(tj["e1"]), edges(tj["e2"])


def masses(lst):
    """Gaussian masses of the radial cells, exp(-a^2) - exp(-b^2) (2r e^{-r^2} dr)."""
    ex = [0.0 if s == "inf" else np.exp(-float(Fraction(s)) ** 2) for s in lst]
    return np.array([ex[i] - ex[i + 1] for i in range(len(ex) - 1)])


# remove the (irrelevant) global phase: the kernel of (e^{ia} f, e^{ia} g) equals that of (f, g)
wgt = masses(tj["e1"])[None, :, None] * masses(tj["e2"])[None, None, :]
alpha = np.angle(np.sum(F * wgt))
F = F * np.exp(-1j * alpha)

# ---------------------------------------------------------------- figure 1: arg F at four angle cells
plt.rcParams.update({"font.size": 8})
fig, axes = plt.subplots(1, 4, figsize=(7.2, 2.15), constrained_layout=True)
labels = {0: r"$\psi\approx0$", Npsi // 4: r"$\psi\approx\pi/2$", Npsi // 2: r"$\psi\approx\pi$",
          3 * Npsi // 4: r"$\psi\approx3\pi/2$"}
for ax, p in zip(axes, sorted(labels)):
    im = ax.pcolormesh(e2, e1, np.angle(F[p]), cmap="twilight", vmin=-np.pi, vmax=np.pi,
                       shading="flat", rasterized=True)
    ax.set_title(labels[p] + f" (cell {p})")
    ax.set_xlabel(r"$r_2=|z_2|$")
    ax.set_xlim(0, R_SHOW)
    ax.set_ylim(0, R_SHOW)
    ax.set_aspect("equal")
axes[0].set_ylabel(r"$r_1=|z_1|$")
cb = fig.colorbar(im, ax=axes, shrink=0.85, ticks=[-np.pi, 0, np.pi])
cb.ax.set_yticklabels([r"$-\pi$", "0", r"$\pi$"])
fig.savefig(os.path.join(OUT, "tiger_phase.pdf"), dpi=300)
plt.close(fig)

# ---------------------------------------------------------------- figure 2: mu_k and partial sums
mu = np.load(MU)
k = np.arange(len(mu))
S = np.cumsum((-1.0) ** k * mu)
fig, (a1, a2) = plt.subplots(1, 2, figsize=(7.2, 2.4), constrained_layout=True)
a1.plot(k, mu, ".", ms=2.5, color="#2a5aa0")
a1.set_yscale("symlog", linthresh=1e-7)
a1.axhline(0, color="0.6", lw=0.6)
a1.set_xlabel(r"$k$")
a1.set_ylabel(r"$\mu_k$")
a1.set_title(r"overlaps $\mu_k=\langle P_kf,P_kg\rangle$ of the certified pair")
a2.plot(k[5:], S[5:] - GAMMA_DAGGER, lw=0.8, color="#2a5aa0", label=r"$S_K-\gamma^\dagger$")
a2.axhline(W_EXCESS, color="#c0392b", lw=0.8, ls="--", label="limit (averaged partial sums)")
a2.axhline(0, color="0.6", lw=0.6)
a2.set_xscale("log")
a2.set_xlabel(r"$K$")
a2.set_title(r"partial sums $S_K=\sum_{k=0}^{K}(-1)^k\mu_k$, minus $\gamma^\dagger$")
a2.legend(frameon=False, loc="lower right")
fig.savefig(os.path.join(OUT, "tiger_mu.pdf"))
plt.close(fig)
print("written", os.listdir(OUT))
