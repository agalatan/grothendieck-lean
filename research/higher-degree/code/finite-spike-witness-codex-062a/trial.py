"""Finite-amplitude one-spike trials on five Stage 0 rows (numerical).

The five real quintic trial coefficients are ordered p10, p21, p01, p12, p30.
The final two entries multiply the two cubic h-defenders. Agent-ID: codex-062a.
"""
import argparse
import json
import heapq
from pathlib import Path

import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import erf

ROWS = Path(__file__).resolve().parents[1] / "degree5-stage0/results/b"
WITNESSES = (("g83", 7, .80), ("g84", 7, .80), ("gA2", 7, .80),
             ("gA1", 11, .84), ("gA", 7, .80))
# Trial coordinates in units of 1e-8, obtained from two Newton steps at zero.
TRIAL = {
    "g83": (-78913, 35150, -45082, 16688, 5288, 151361, 59993),
    "g84": (-92484, 40418, -54228, 19331, 6030, 156244, 62619),
    "gA2": (-103612, 44594, -61992, 21448, 6590, 160193, 64729),
    "gA1": (-61641, 32309, -38752, 15405, 5050, 101431, 40741),
    "gA": (-105107, 45147, -63048, 21729, 6662, 160760, 65024),
}


def radius(n):
    x, w = leggauss(n)
    r = 3.5 * (x + 1)
    return r, 7 * w * r * np.exp(-r**2)


def folded(mean, sd):
    v = mean / (np.sqrt(2) * sd)
    slope = erf(v)
    density = np.sqrt(2 / np.pi) * np.exp(-v**2) / sd
    return mean * slope + sd**2 * density, slope


def axes(row, r):
    a = 1 - row["bA"] * (r**2 - 1)
    b = -row["bB"] * r**2 / np.sqrt(2)
    return a + b, a - b


def visible(row, r):
    return (r * (row["l"] + row["beta"] * (r**2 - 2))
            + row["nu5"] * r * (r**4 - 6*r**2 + 6) / np.sqrt(12))


def diffuse(row, sigma, grid):
    r, w = radius(grid[0])
    r = r[:, None]
    phi = np.pi * (np.arange(grid[3]) + .5) / grid[3]
    ax, ay = axes(row, r)
    sd = sigma * np.hypot(ax * np.cos(phi), ay * np.sin(phi)) / np.sqrt(2)
    mean = visible(row, r) * np.cos(phi)
    f = np.abs(mean) if sigma == 0 else folded(mean, sd)[0]
    return np.pi * np.dot(w, f.mean(axis=1))


def evaluate(row, sigma, c, x, grid):
    """Price the exact nonlinear trial on a positive grid, one visible radius at a time."""
    nz, ny, nt, nf = grid
    rs, wz = radius(nz)
    ys, wy = radius(ny)
    y = ys[:, None, None]
    theta = 2 * np.pi * (np.arange(nt)[None, :, None] + .5) / nt
    phi = np.pi * (np.arange(nf)[None, None, :] + .5) / nf
    cp, sp = np.cos(phi), np.sin(phi)
    cos2, cosneg2 = np.cos(2*theta - phi), np.cos(2*theta + phi)
    # y -> -y exchanges the two norms since all seven fields have even remote degree.
    weights = np.pi * wy[:, None, None] / (nt * nf)
    price = np.array([-1/row["eta"]] * 5 + [1/row["e1"]] * 2)
    gain = np.dot(price, x**2)
    grad = 2 * price * x
    base = 0.
    spike = sigma * c * y * (y**2 - 2) / np.sqrt(2)
    for r, weight in zip(rs, wz):
        ax, ay = axes(row, r)
        sd = sigma * np.sqrt((1-c**2)/2) * np.hypot(ax*cp, ay*sp)
        m0 = visible(row, r) * cp + spike * (ax*np.cos(theta)*cp + ay*np.sin(theta)*sp)
        k21 = r * (r**2 - 2) / np.sqrt(2)
        y20 = y**2 / np.sqrt(2)
        fields = np.broadcast_arrays(
            r * (y**4 - 4*y**2 + 2) / 2 * cp,
            k21 * (y**2 - 1) * cp,
            r * y**2 * (y**2 - 3) / np.sqrt(6) * cos2,
            k21 * y20 * cos2,
            r**3 / np.sqrt(6) * y20 * cosneg2,
            r * (y**2 - 1) * cp,
            r * y20 * cos2,
        )
        mean = m0 + sum(coef * f for coef, f in zip(x, fields))
        value, slope = folded(mean, sd)
        origin, _ = folded(m0, sd)
        w = weight * weights
        base += np.sum(w * origin)
        gain += np.sum(w * (value-origin))
        ws = w * slope
        grad += [np.sum(ws * f) for f in fields]
    return base, gain, grad


def diffuse_slack(row, sig, grid, k):
    """Upper endpoint for the scale search, subject to numerical integration error."""
    if k <= 0:
        raise ValueError("the row needs a positive Gaussian price")
    stop = 2.
    if k * stop < np.sqrt(1 + row["bA"]**2 + row["bB"]**2) or not 0 < sig < stop:
        raise ValueError("the scale window must cover the Lipschitz radius and the trial")

    def score(s):
        return diffuse(row, s, grid) - k * s**2

    def segment(a, b, fa, fb):
        upper = max(fa, fb) + k * (b-a)**2 / 4
        return -upper, a, b, fa, fb

    f0, fs, fr = score(0), score(sig), score(stop)
    best = max(f0, fs, fr)
    queue = [segment(0, sig, f0, fs), segment(sig, stop, fs, fr)]
    heapq.heapify(queue)
    while -queue[0][0] > best + 2e-13:
        _, a, b, fa, fb = heapq.heappop(queue)
        m = (a + b) / 2
        fm = score(m)
        best = max(best, fm)
        heapq.heappush(queue, segment(a, m, fa, fm))
        heapq.heappush(queue, segment(m, b, fm, fb))
    return -queue[0][0] - fs


def witness(game, row_id, t, grid, row_scale):
    data = json.loads((ROWS / game / f"sp2_{row_id}.json").read_text())
    row = json.loads((ROWS / game / "rows_all.lines").read_text().splitlines()[row_id - 1])
    keys = ("t", "l", "beta", "bA", "bB", "sig", "nu5")
    if row["t"] != t or any(row[k] != data["rec"][k] for k in keys):
        raise ValueError(f"wrong row for {game}")
    pt = min((p for p in data["pts"] if p["c"] == .1),
             key=lambda p: abs(p["sig"] - row["sig"]))
    sig = row["sig"] if row_scale else pt["sig"]
    c = pt["c"]
    x = np.array(TRIAL[game]) / 1e8
    base, gain, g = evaluate(row, sig, c, x, grid)
    gap = row["e1"] * np.dot(g[5:], g[5:]) / 4
    k = 1/row["e1"] - (row["bA"]**2 + row["bB"]**2)/row["eta"]

    deficit = diffuse(row, sig, grid) - base
    slack = diffuse_slack(row, sig, grid, k)
    den = deficit + slack
    if den <= 0:
        raise ValueError("nonpositive computed denominator")
    return sig, deficit, slack, gain, gap, (gain-gap)/den


def main():
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--grid", nargs=4, type=int, default=(52, 44, 32, 72),
                   metavar=("Z", "Y", "AZIMUTH", "PROJECTION"))
    p.add_argument("--game", choices=[w[0] for w in WITNESSES])
    p.add_argument("--row-scale", action="store_true",
                   help="use the full row scale in place of the stored gate point's scale")
    args = p.parse_args()
    if min(args.grid) < 2 or args.grid[2] % 2:
        p.error("use orders >= 2 and an even azimuth count for sign pairing")
    print("game sigma deficit slack_upper trial_gain defender_error trial_share")
    for game, index, t in WITNESSES:
        if args.game and args.game != game:
            continue
        vals = witness(game, index, t, args.grid, args.row_scale)
        print(game, *(f"{v:.10g}" for v in vals), flush=True)


if __name__ == "__main__":
    main()
