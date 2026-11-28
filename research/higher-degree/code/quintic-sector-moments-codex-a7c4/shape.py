"""Payoff for cubics with small full fourth excess. Agent-ID: codex-a7c4."""

import argparse
from fractions import Fraction as Q
import importlib.util
from pathlib import Path

ETA, EPS = Q(".0779"), Q(".78")
TARGET = 1 / Q("1.4025") - Q("0.00001")
START = Q(".38")
# Rows are nested. Each band is verified at the largest excess claimed on it.
CLAIMS = (
    (".50", ".0097"),
    (".55", ".0045"),
    (".60", ".00248"),
    (".62", ".00165"),
    (".64", ".00086"),
    (".649", ".00060"),
    (".65", ".00058"),
    (".66", ".00034"),
    ("2/3", ".000195"),
    (".67", ".000133"),
    (".675", ".000057"),
    (".68", ".000009"),
)
# Only the new angular trial and the elementary discard bound are needed
# alongside the earlier conditional trial.
TRIALS = (
    tuple(map(Q, ("1.79", ".65", ".93", ".185", "2.575"))),
    tuple(map(Q, ("2.15", ".788", ".99", ".205", "4.027225"))),
)
DIRECTIONS = tuple(
    map(
        Q,
        (
            ".79",
            ".81",
            ".85",
            ".87",
            ".9",
            ".95",
            "1",
            "1.08",
            "1.15",
            "1.25",
            "1.35",
            "1.45",
            "1.55",
            "1.7",
            "2",
            "2.5",
            "3",
            "4",
            "6",
            "8",
            "16",
        ),
    )
)


def need(condition, message):
    if not condition:
        raise ValueError(message)


def shape_budget(rays, chi):
    """Use the visible occupation bound and the diffuse lift at the same excess."""
    b = rays.sqrt_sides(chi / 2)[1]
    need(0 <= b < 1, "positive remote energy fraction for A>0")
    # The maximum of (chi - 2*v**2)/(1-v)**2 occurs at v=chi/2.
    chi_remote = chi / (1 - chi / 2)
    return b, chi_remote


def support_radius(rays, squared_slope, chi_remote):
    weight = squared_slope / (1 + squared_slope)
    return (
        rays.sqrt_sides(1 + squared_slope)[1] * rays.RHI * (1 + rays.SLOPE * chi_remote * weight**2)
    )


def support_lines(rays, chi):
    b, chi_remote = shape_budget(rays, chi)
    return b, [(slope, support_radius(rays, slope**2, chi_remote)) for slope in DIRECTIONS]


def trial_values(t, sigma, b):
    base = ETA + (1 - ETA) * t * t + (EPS - ETA) * sigma**2 / (1 - b)
    return [base] + [
        base
        + ETA * ((a - t) ** 2 + (w - sigma) ** 2 + 2 * (1 + ETA / EPS) * c * c + 2 * g * g - debit)
        for a, c, w, g, debit in TRIALS
    ]


def strip(left, right, b, lines):
    # A single support inequality and a single trial must work throughout the strip.
    best = None
    for slope, radius in lines:
        upper = ((radius - left) / slope, (radius - right) / slope)
        need(min(upper) >= 0, "nonnegative trapezoid heights")
        values = [trial_values(t, s, b) for t, top in zip((left, right), upper) for s in (0, top)]
        price = min(max(column) for column in zip(*values))
        if best is None or price < best:
            best = price
        if best < TARGET:
            break
    return best


def load_rice(repo):
    path = repo / "research/higher-degree/code/quintic-mixed-sectors-codex-a7c4/rays.py"
    spec = importlib.util.spec_from_file_location("previous_rice", path)
    rays = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(rays)
    rays.pi_control()
    need(
        (rays.RHI, rays.SLOPE) == (Q(8862269254529, 10**13), Q(".00529")),
        "constants in the diffuse lift",
    )
    return rays


def verify(repo):
    rays = load_rice(repo)
    left = START
    previous_chi = Q(42)
    for end_text, chi_text in CLAIMS:
        end, chi = Q(end_text), Q(chi_text)
        need(left < end and 0 < chi <= previous_chi, "nested domains")
        b, lines = support_lines(rays, chi)
        # Joint convexity on the four vertices permits arbitrary closed strip widths.
        cursor = left
        worst = 0
        while cursor < end:
            right = min(cursor + Q(".002"), end)
            worst = max(worst, strip(cursor, right, b, lines))
            cursor = right
        need(worst < TARGET, f"conditional shape comparison through {end}")
        print(
            f"Through t={end_text}, full fourth excess <= {chi_text}; "
            f"payoff clearance beyond 1e-5 > {(TARGET-worst)*10**12//1} trillionths."
        )
        left, previous_chi = end, chi
    need(ETA + (1 - ETA) * left**2 < TARGET, "zero projected cubic")
    # Same tests at a larger excess must retain a gap in the frozen relaxation.
    b, lines = support_lines(rays, Q(".001"))
    need(strip(Q(".649"), Q(".649"), b, lines) > TARGET, "larger-shape control")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    verify(parser.parse_args().repo)
