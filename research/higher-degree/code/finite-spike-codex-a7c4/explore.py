"""Direct, finite-amplitude g84 one-spike trials. Numerical. Agent-ID: codex-a7c4."""

import argparse
import json
from pathlib import Path

import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.optimize import minimize
from scipy.special import erf

EPS, ETA = 0.84, 0.2552
ROWS_FILE = (
    Path(__file__).resolve().parents[1] / "degree5-stage0/results/b/g84/rows_all.lines"
)


def radial(nodes):
    x, w = leggauss(nodes)
    r = 3.5 * (1 + x)
    return r, 7 * r * np.exp(-r * r) * w


class Trial:
    def __init__(self, row, c, shape):
        if not 0 <= c < 1 or len(shape) != 4 or min(shape) < 2:
            raise ValueError(
                "use a nondegenerate Gaussian bath and positive quadrature orders"
            )
        nz, ny, ntheta, nphi = shape
        z, wz = radial(nz)
        y, wy = radial(ny)
        theta = 2 * np.pi * (np.arange(ntheta) + 0.5) / ntheta
        phi = np.pi * (np.arange(nphi) + 0.5) / nphi
        zr = z[:, None, None, None]
        yr = y[None, :, None, None]
        th = theta[None, None, :, None]
        cp = np.cos(phi)[None, None, None, :]
        sp = np.sin(phi)[None, None, None, :]
        sig, t = row["sig"], row["t"]
        tau = sig * np.sqrt(1 - c * c)
        a = 1 - row["bA"] * (zr * zr - 1)
        b = -row["bB"] * zr * zr / np.sqrt(2)
        # After fixing the visible phase, the real and imaginary bath variances differ.
        self.sd = tau * np.hypot((a + b) * cp, (a - b) * sp) / np.sqrt(2)
        self.base = zr * (row["l"] + row["beta"] * (zr * zr - 2)) * cp
        self.q = (
            sig
            * c
            * yr
            * (yr * yr - 2)
            / np.sqrt(2)
            * ((a + b) * np.cos(th) * cp + (a - b) * np.sin(th) * sp)
        )
        # Project each of the three real-coefficient fields onto the norm direction.
        self.fields = (
            zr * (zr**4 - 6 * zr * zr + 6) * cp / np.sqrt(12),
            zr * (yr**4 - 4 * yr * yr + 2) * cp / 2,
            zr * yr**2 * (yr**2 - 3) * np.cos(2 * th - phi) / np.sqrt(6),
        )
        self.weights = (
            (np.pi / 2)
            * wz[:, None, None, None]
            * wy[None, :, None, None]
            / (ntheta * nphi)
        )
        self.constant = (
            t * t
            - 2 * row["l"] * t
            + 2 * row["beta"] ** 2 / EPS
            - sig * sig / EPS
            + (row["bA"] ** 2 + row["bB"] ** 2) * sig * sig / ETA
        )

    def evaluate(self, x):
        center = self.base + sum(coef * f for coef, f in zip(x, self.fields))
        value = self.constant - x @ x / ETA
        gradient = -2 * x / ETA
        for mean in (center + self.q, center - self.q):
            # Exact expectation of |N(mean,sd²)| before quadrature.
            v = mean / (np.sqrt(2) * self.sd)
            slope = erf(v)
            magnitude = mean * slope + np.sqrt(2 / np.pi) * self.sd * np.exp(-v * v)
            value += np.sum(self.weights * magnitude)
            weighted = self.weights * slope
            gradient += np.array([np.sum(weighted * f) for f in self.fields])
        return value, gradient

    def fit(self, initial, visible_only=False):
        n = 1 if visible_only else 3

        def objective(v):
            x = np.zeros(3)
            x[:n] = v
            value, grad = self.evaluate(x)
            return -value, -grad[:n]

        res = minimize(
            objective,
            initial[:n],
            method="BFGS",
            jac=True,
            options={"gtol": 2e-9, "maxiter": 45},
        )
        if np.linalg.norm(res.jac, ord=np.inf) > 1e-7:
            raise ValueError(res.message)
        return -res.fun, res.x


def main():
    p = argparse.ArgumentParser()
    p.add_argument(
        "--grid",
        default="48,32,20,48",
        help="orders for z radius, y radius, y azimuth and norm direction",
    )
    p.add_argument("--spikes", default="0,.02,.05,.1,.3")
    ns = p.parse_args()
    shape = tuple(map(int, ns.grid.split(",")))
    rows = {r["t"]: r for r in map(json.loads, ROWS_FILE.read_text().splitlines())}
    print(
        "t  c  stationary payoff  gain over free visible coefficient  coefficients (visible,H22,H31)"
    )
    for t in (0.8, 0.85):
        row = rows[t]
        if (row["e1"], row["eta"]) != (EPS, ETA):
            raise ValueError("unexpected game")
        initial = np.array([row["nu5"], 0.0, 0.0])
        for c in map(float, ns.spikes.split(",")):
            trial = Trial(row, c, shape)
            scalar, visible = trial.fit(initial, True)
            value, x = trial.fit(np.array([visible[0], 0.0, 0.0]))
            if c == 0 and (abs(value - scalar) > 1e-12 or max(abs(x[1:])) > 1e-9):
                raise ValueError("Gaussian control failed")
            if c == 0.1:
                point = np.array([row["nu5"], 0.001, -0.0008])
                direction = np.array([0.4, -0.37, 0.61])
                step = 2e-5
                slope = (
                    trial.evaluate(point + step * direction)[0]
                    - trial.evaluate(point - step * direction)[0]
                ) / (2 * step)
                if abs(slope - trial.evaluate(point)[1] @ direction) > 2e-7:
                    raise ValueError("directional derivative control failed")
            print(
                t,
                c,
                format(value, ".12f"),
                format(value - scalar, ".12g"),
                ",".join(format(a, ".9g") for a in x),
                flush=True,
            )


if __name__ == "__main__":
    main()
