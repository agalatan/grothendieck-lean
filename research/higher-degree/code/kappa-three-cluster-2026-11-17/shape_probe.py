#!/usr/bin/env python3
"""Numerical shape comparisons in the archived t=0.70 model.

Agent-ID: codex-6d92. Takes the path to the V3 content-model packet.
The parameters are rounded candidates from formula_t070.log.
"""

from argparse import ArgumentParser
from fractions import Fraction
from pathlib import Path
from runpy import run_path

import numpy as np
from scipy.stats import gamma


def compare(packet, dim, energy, kappa, a_sq, magnitudes, phase_turns, bulk, names):
    formula = run_path(str(packet/"ref/kappa.py"))["Formula"]
    profiles = str(packet/"kit/profiles_low")+"/"
    bits = 19
    size = 1 << bits
    quantile = (np.arange(size)+0.5)/size
    shape = 1/(kappa-1)
    gamma_grid = gamma.ppf(quantile, shape)/shape
    beta_grid = -dim*np.expm1(np.log1p(-quantile)/(dim-1))
    p = 1/1024
    low = 1-np.sqrt((kappa-1)*p/(1-p))
    high = 1+np.sqrt((kappa-1)*(1-p)/p)
    two_point = np.where(quantile < 1-p, low, high)
    assert abs(two_point.mean()-1) < 1e-12
    assert abs(np.mean(two_point**2)-kappa) < 1e-12
    m = np.asarray(magnitudes)*np.exp(1j*np.pi*np.asarray(phase_turns))
    mass = a_sq+dim*np.vdot(m,m).real+bulk
    parameters = (np.sqrt(a_sq/mass), m/np.sqrt(mass), bulk/mass)
    for seed in (17, 23):
        model = formula("0.70", energy, dim, gamma_grid, profiles, m2=bits, seed=seed)
        model.kappa = kappa
        base = model.ratio(*parameters)[0]
        values = []
        for name, grid in (("Beta", beta_grid), ("two-point", two_point)):
            if name in names:
                model.G = np.random.default_rng(seed).permutation(grid)
                value = model.ratio(*parameters)[0]
                values.append(f"{name} {value:.6f} ({100*(value/base-1):+.2f}%)")
        print(f"c={dim} u/u*={energy} kappa={kappa:.6f} seed={seed}: Gamma {base:.6f}, "+", ".join(values))


if __name__ == "__main__":
    parser = ArgumentParser(description=__doc__)
    parser.add_argument("packet", type=Path)
    packet = parser.parse_args().packet.resolve()
    compare(packet, 6, 1.449, float(Fraction(552, 343)), .030, [.106, .098, .118],
            [-.11, -.12, .18], .746, {"two-point"})
    compare(packet, 4, 1.612, float(Fraction(8, 5)), .036, [.129, .131, .152],
            [-.13, -.13, .19], .736, {"Beta", "two-point"})
    compare(packet, 4, 1.449, float(Fraction(8, 5)), .038, [.130, .132, .154],
            [-.12, -.10, .20], .730, {"Beta", "two-point"})
