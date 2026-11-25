#!/usr/bin/env python3
"""Regenerate the two figures of the article from the Lean data.

Reads the cell map f_tig (Haagerup/Data/TigerData.lean) and the 251 certified intervals for mu_0..mu_250
(tigMuList in Haagerup/Data/OverlapData.lean) with common.py, and writes

    ../../figures/tiger_mu.pdf      left: the overlaps mu_n (midpoints of the intervals); right: the alternating
                                    partial sums S_K = sum_{n<=K} (-1)^n mu_n minus gamma-dagger
    ../../figures/tiger_phase.pdf   the argument of f_tig as a function of (|z_2|, |z_1|) at four relative
                                    phases psi = arg z_1 - arg z_2 (not included in the article at present)

Arithmetic : floating point (plots).  Not part of the proof.
Needs      : numpy and matplotlib.
Runtime    : about 5 seconds.
Usage      : python3 make_figures.py [--out DIR]     (default DIR: the article's figures/ folder)
"""
import sys

sys.dont_write_bytecode = True  # leave no __pycache__ next to the scripts

import argparse
import os

import numpy as np
import matplotlib

matplotlib.use("Agg")
import matplotlib.pyplot as plt  # noqa: E402

import common  # noqa: E402

R_SHOW = 3.6  # radial range shown, out of [0, 6)


def main() -> int:
    ap = argparse.ArgumentParser(description=__doc__.split("\n")[0])
    ap.add_argument("--out", default=str(common.FIGURES), help="output folder")
    args = ap.parse_args()
    out = args.out
    gamma_dagger = float(common.gamma_dagger_tight()[0])

    tab = common.cell_tables("tig")
    cre = np.array(tab["cre"], dtype=np.float64).reshape(36, 64, 64)
    cim = np.array(tab["cim"], dtype=np.float64).reshape(36, 64, 64)
    C = (cre + 1j * cim) / float(1 << 24)

    # Radial-angular profile F(r_1, r_2, psi) = sum_{l=0}^{35} C_l e^{i (l - 17) psi}
    e = np.linspace(0.0, 6.0, 65)
    ex = np.exp(-(e ** 2))
    masses = ex[:-1] - ex[1:]
    wgt = masses[:, None] * masses[None, :]
    # C[17] is the harmonic m = 0; normalise the global phase so that its Gaussian mean is >= 0
    alpha = np.angle(np.sum(C[17] * wgt))
    C = C * np.exp(-1j * alpha)

    ks = np.arange(36, dtype=np.float64) - 17.0
    psi_vals = [0.0, 0.5 * np.pi, np.pi, 1.5 * np.pi]
    psi_labels = [r"$\psi = 0$", r"$\psi = \pi/2$", r"$\psi = \pi$", r"$\psi = 3\pi/2$"]

    # ------------------------------------------------------------ figure: arg F at four relative phases
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
    fig.savefig(os.path.join(out, "tiger_phase.pdf"), dpi=300, metadata={"CreationDate": None})
    plt.close(fig)

    # ------------------------------------------------------------ figure: mu_n and partial sums
    pairs = common.tig_mu_intervals()
    scale = float(1 << 128)
    mu = np.array([(lo + hi) / (2.0 * scale) for lo, hi in pairs], dtype=np.float64)

    k = np.arange(len(mu))
    S = np.cumsum(((-1.0) ** k) * mu)
    w_excess = S[-1] - gamma_dagger
    fig, (a1, a2) = plt.subplots(1, 2, figsize=(7.2, 2.4), constrained_layout=True)
    a1.plot(k, mu, ".", ms=2.5, color="#2a5aa0")
    a1.set_yscale("symlog", linthresh=1e-7)
    a1.axhline(0, color="0.6", lw=0.6)
    a1.set_xlabel(r"$n$")
    a1.set_ylabel(r"$\mu_n$")
    a1.set_title(r"overlaps $\mu_n$ of the reflected pair $(f_{\mathrm{tig}}, g_{\mathrm{tig}})$")
    a2.plot(k[5:], S[5:] - gamma_dagger, lw=0.8, color="#2a5aa0", label=r"$S_K-\gamma^\dagger$")
    a2.axhline(w_excess, color="#c0392b", lw=0.8, ls="--",
               label=r"$S_{250}-\gamma^\dagger \approx 9.43\times 10^{-4}$")
    a2.axhline(0, color="0.6", lw=0.6)
    a2.set_xscale("log")
    a2.set_xlabel(r"$K$")
    a2.set_title(r"partial sums $S_K=\sum_{n=0}^{K}(-1)^n\mu_n$, minus $\gamma^\dagger$")
    a2.legend(frameon=False, loc="lower right")
    fig.savefig(os.path.join(out, "tiger_mu.pdf"), metadata={"CreationDate": None})
    plt.close(fig)
    print(f"S_250 - gamma-dagger = {w_excess:.6e} (floating point)")
    print("written: tiger_mu.pdf, tiger_phase.pdf in", os.path.abspath(out))
    return 0


if __name__ == "__main__":
    common.main_guard(main)
