"""Figures for the article.

Reads the Lean-certified 64 x 64 x 36 cell map f_tig and its 251 exact interval
overlaps tigMuList directly from haagerup-article/anc/Grothe/UpperSix/Haagerup/Data/;
writes tiger_phase.pdf and tiger_mu.pdf next to this script.

usage:  uv run --offline --no-project --with numpy --with matplotlib python3 make_figures.py
"""
import os
import re

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt  # noqa: E402

OUT = os.path.dirname(os.path.abspath(__file__))
DATA = os.environ.get(
    "HAAGERUP_DATA",
    os.path.join(OUT, "..", "anc", "Grothe", "UpperSix", "Haagerup", "Data"),
)
GAMMA_DAGGER = 0.7119586597782638
R_SHOW = 3.6  # outer radial range shown on [0, 6)^2


def decode_table36(strs):
    """Exact mirror of HaagerupKernel.Cell.decodeTable36: returns shape (36, 64, 64)."""
    assert len(strs) == 36
    out = np.empty((36, 4096), dtype=np.int64)
    for k, s in enumerate(strs):
        b = np.frombuffer(s.encode("ascii"), dtype=np.uint8).astype(np.int64)
        assert b.size == 20480
        d = np.where(b > 92, b - 49, b - 48).reshape(4096, 5)
        u = d[:, 0] + (d[:, 1] << 6) + (d[:, 2] << 12) + (d[:, 3] << 18) + (d[:, 4] << 24)
        out[k] = u - 33554432
    return out.reshape(36, 64, 64)


tig_txt = open(os.path.join(DATA, "TigerData.lean")).read()
cre_sec = tig_txt.split("def tigCreStrs")[1].split("def tigCimStrs")[0]
cim_sec = tig_txt.split("def tigCimStrs")[1].split("def tigQreStrs")[0]
cre = decode_table36(re.findall(r'"([^"]+)"', cre_sec))
cim = decode_table36(re.findall(r'"([^"]+)"', cim_sec))
C = (cre.astype(np.float64) + 1j * cim.astype(np.float64)) / float(1 << 24)

# Evaluate radial-angular profile F(r_1, r_2, psi) = sum_{l=0}^{35} C_l e^{i(l - 17) psi}
e = np.linspace(0.0, 6.0, 65)
ex = np.exp(-(e ** 2))
masses = ex[:-1] - ex[1:]
wgt = masses[:, None] * masses[None, :]
# C[17] is the m = 0 harmonic; normalize global phase so E[F_{m=0}] >= 0
alpha = np.angle(np.sum(C[17] * wgt))
C = C * np.exp(-1j * alpha)

ks = np.arange(36, dtype=np.float64) - 17.0
psi_vals = [0.0, 0.5 * np.pi, np.pi, 1.5 * np.pi]
psi_labels = [r"$\psi = 0$", r"$\psi = \pi/2$", r"$\psi = \pi$", r"$\psi = 3\pi/2$"]

# ---------------------------------------------------------------- figure 1: arg F at four relative phases
plt.rcParams.update({"font.size": 8})
fig, axes = plt.subplots(1, 4, figsize=(7.2, 2.15), constrained_layout=True)
for ax, psi, lbl in zip(axes, psi_vals, psi_labels):
    harm = np.exp(1j * ks * psi)[:, None, None]
    F_slice = np.sum(C * harm, axis=0)
    im = ax.pcolormesh(e, e, np.angle(F_slice), cmap="twilight", vmin=-np.pi, vmax=np.pi,
                       shading="flat", rasterized=True)
    ax.set_title(lbl)
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
ov_txt = open(os.path.join(DATA, "OverlapData.lean")).read()
tig_sec = ov_txt[:ov_txt.index("private def tcellRow_0")]
pairs = [(int(lo), int(hi)) for lo, hi in re.findall(r"⟨(-?\d+),\s*(-?\d+)⟩", tig_sec)]
assert len(pairs) == 251
scale = float(1 << 128)
mu = np.array([(lo + hi) / (2.0 * scale) for lo, hi in pairs], dtype=np.float64)

k = np.arange(len(mu))
S = np.cumsum(((-1.0) ** k) * mu)
w_excess = S[-1] - GAMMA_DAGGER
fig, (a1, a2) = plt.subplots(1, 2, figsize=(7.2, 2.4), constrained_layout=True)
a1.plot(k, mu, ".", ms=2.5, color="#2a5aa0")
a1.set_yscale("symlog", linthresh=1e-7)
a1.axhline(0, color="0.6", lw=0.6)
a1.set_xlabel(r"$k$")
a1.set_ylabel(r"$\mu_k$")
a1.set_title(r"overlaps $\mu_k$ of the reflected pair $(f_{\mathrm{tig}}, g_{\mathrm{tig}})$")
a2.plot(k[5:], S[5:] - GAMMA_DAGGER, lw=0.8, color="#2a5aa0", label=r"$S_K-\gamma^\dagger$")
a2.axhline(w_excess, color="#c0392b", lw=0.8, ls="--", label=r"$S_{250}-\gamma^\dagger \approx 9.43\times 10^{-4}$")
a2.axhline(0, color="0.6", lw=0.6)
a2.set_xscale("log")
a2.set_xlabel(r"$K$")
a2.set_title(r"partial sums $S_K=\sum_{k=0}^{K}(-1)^k\mu_k$, minus $\gamma^\dagger$")
a2.legend(frameon=False, loc="lower right")
fig.savefig(os.path.join(OUT, "tiger_mu.pdf"))
plt.close(fig)
print("written", sorted(os.listdir(OUT)))
