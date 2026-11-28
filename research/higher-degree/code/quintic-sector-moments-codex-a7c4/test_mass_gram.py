"""Exercise the mass-charge hook on the original #842 ray. Agent-ID: codex-a7c4."""

from dataclasses import replace
from fractions import Fraction as Q
from pathlib import Path
import argparse
import sys

sys.path.insert(0, str(Path(__file__).resolve().parent))
import mass_gram


def replay(repo):
    code = repo / "research/higher-degree/code"
    sys.path.insert(0, str(code / "quintic-mixed-sectors-codex-a7c4"))
    import all_sector as source

    h, p0, legacy = source.gram_prices()
    rows = mass_gram.make_rows(source.gram, legacy)
    curves = source.price_chords(repo, legacy)
    joint = source.load(code / "joint-spectral-cubic-lift-codex-a7c4/verify.py")
    witnesses = joint.witnesses((repo / "Grothe/Lower/MassWitnessData.lean").read_text())
    t, y = Q(".392"), Q("2.2")
    target = 1 / Q("1.4023") - Q(1, 100000)
    t2 = t * t
    offset = (joint.C * t) ** 2
    r = 2 * joint.AXIS**2 - 1
    cross, tail = 2 * joint.sqrt_hi(3 * (1 + r * r)), 2 * (1 + r * r)
    small = joint.A_MIN
    require = mass_gram.require

    def point(price_bank):
        energy = min(source.RHO**2 - offset, ((Q(582, 625) - source.ELL * t) / source.BETA) ** 2)
        for _ in range(8):
            require(energy >= small, "control remains on the large-energy branch")
            wl, wh = offset / (energy + offset), offset / (small + offset)
            shape = joint.quadratic_max(
                y * y - cross * y + tail, cross * y - 2 * y * y, y * y, wl, wh
            )
            energy = min(energy, joint.up(Q(355, 452) * (1 + joint.RATE * shape) ** 2 - offset))
            root = joint.sqrt_lo(energy)
            candidates = [
                (2 * joint.EH * p / joint.MC, (a + b * y * y + d * y**3) / joint.MC)
                for p, a, b, d in witnesses
            ]
            slope, paid = max(candidates, key=lambda term: term[0] * root - term[1])
            mass = slope * root - paid
            payoff = joint.H + (1 - joint.H) * t2 + joint.E * energy - joint.H * mass
            if payoff < target:
                return target - payoff
            z = joint.E - p0 + (joint.H + source.L + (1 - h) * t2 - target) / energy
            if price_bank:
                scaled = mass_gram.normalized_charge(
                    price_bank, t, target, small, energy, slope * joint.sqrt_lo(small) - paid, mass
                )
                z = min(z, scaled)
            require(z >= 0, "control uses a nonnegative sector charge")
            support = source.chord_price(curves, y * y, y * y, source.BETA**2 * z)
            require(support >= source.ELL * t, "directed support subtraction")
            new_energy = min(energy, joint.up(((support - source.ELL * t) / source.BETA) ** 2))
            if new_energy == energy:
                break
            energy = new_energy
        root = joint.sqrt_lo(energy)
        mass = max(u * root - b for u, b in candidates)
        return target - (joint.H + (1 - joint.H) * t2 + joint.E * energy - joint.H * mass)

    full = point(rows)
    old = point(())
    unpaid = point([replace(row, mass_price=Q(0)) for row in rows])
    require(
        full > Q(33, 100000) and old < -Q(78, 100000) and unpaid < -Q(78, 100000),
        "full, predecessor-only, and removed-mass controls",
    )
    print("Complete comparison passes; deleting just the mass debit or the new bank fails.")
    print(
        "Three clearance floors in billionths:",
        [(value * 10**9).__floor__() for value in (full, old, unpaid)],
    )


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--repo", type=Path, default=Path.cwd())
    replay(ap.parse_args().repo.resolve())
