"""Couple the spiked support, physical sector prices and elliptic fourth moment.
Agent-ID: codex-a7c4. Run python3 -IB path/to/cover.py --repo .
"""

import argparse
from fractions import Fraction as Q
from functools import lru_cache
import importlib.util
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import mass_gram
import spiked_p7

K = Q("1.4023")
TARGET = 1 / K - Q(1, 10**5)


def need(ok, message):
    if not ok:
        raise ValueError(message)


def module(path):
    spec = importlib.util.spec_from_file_location(path.parent.name, path)
    result = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(result)
    return result


class Payoff:
    def __init__(self, repo):
        code = repo / "research/higher-degree/code"
        self.old = module(code / "quintic-mixed-sectors-codex-a7c4/all_sector.py")
        self.joint = joint = module(code / "joint-spectral-cubic-lift-codex-a7c4/verify.py")
        self.h, self.p00, weights = self.old.gram_prices()
        self.chords = self.old.price_chords(repo, weights)
        self.mass_rows = mass_gram.make_rows(self.old.gram, weights)
        verifier = module(code / "spiked-cubic-radius-gemini-4c4c/verify.py")
        self.spiked = spiked_p7.read_models(verifier, weights)
        self.witnesses = joint.witnesses((repo / "Grothe/Lower/MassWitnessData.lean").read_text())
        need(
            all(
                joint.E > joint.H * joint.EH * p / (joint.MC * joint.sqrt_lo(joint.A_MIN))
                for p, *_ in self.witnesses
            ),
            "increasing payoff after inserting each spectral mass lower bound",
        )
        r = 2 * joint.AXIS**2 - 1
        need(r == 2 * Q(179, 200) ** 2 - 1 and r >= 0, "elliptic axis")
        diag = [99 * w - x for w, x in zip(weights, (8, 8, 4 + 4 * r, 4, 12 + 8 * r))]
        need(
            min(diag) >= 0 and diag[0] * diag[1] >= 32 * r * r,
            "PSD bound for the mixed fourth-moment coefficient",
        )
        self.cross = 2 * joint.sqrt_hi(3 * (1 + r * r))
        self.tail = 2 * (1 + r * r)

    @lru_cache(maxsize=None)
    def costs(self, y0, y1):
        return [
            (p, max(a + b * y0**2 + c * y0**3, a + b * y1**2 + c * y1**3))
            for p, a, b, c in self.witnesses
        ]

    def lift_cap(self, energy, floor, d0, d1, y, cross):
        joint = self.joint
        low, high = d0 / (energy + d0), d1 / (floor + d1)
        shape = joint.quadratic_max(y * y - cross + self.tail, cross - 2 * y * y, y * y, low, high)
        return joint.up(Q(355, 452) * (1 + joint.RATE * shape) ** 2 - d0)

    def cell(self, t0, t1, y0, y1, target, fresh=True, ellipse=True):
        joint, old = self.joint, self.old
        d0, d1 = (joint.C * t0) ** 2, (joint.C * t1) ** 2
        # Under a violation, K_mass >= A forces a physical lower bound on A.
        floor = max(
            joint.A_MIN,
            (target - joint.H - (1 - joint.H) * t1**2) / (joint.E - joint.H),
        )
        energy = min(old.RHO**2 - d0, ((Q(582, 625) - old.ELL * t0) / old.BETA) ** 2)
        costs = self.costs(y0, y1)
        chi_lo, chi_hi = min(Q(42), y0 * y0), min(Q(42), y1 * y1)
        for _ in range(64):
            if energy < floor:
                return Q(0)
            energy = min(energy, self.lift_cap(energy, floor, d0, d1, y1, self.cross * y1))
            if energy < floor:
                return Q(0)
            root = joint.sqrt_lo(energy)
            p, offset = max(costs, key=lambda w: 2 * joint.EH * w[0] * root - w[1])
            slope = 2 * joint.EH * p
            mass_lo = (slope * joint.sqrt_lo(floor) - offset) / joint.MC
            mass_hi = (slope * root - offset) / joint.MC
            payoff = joint.H + (1 - joint.H) * t1 * t1 + joint.E * energy - joint.H * mass_hi
            if payoff < target:
                return payoff
            base = joint.H + old.L + (1 - self.h) * t1 * t1 - target
            need(base < 0, "sign of the original Gram reciprocal")
            charge = min(
                joint.E - self.p00 + base / energy,
                mass_gram.normalized_charge(
                    self.mass_rows, t1, target, floor, energy, mass_lo, mass_hi
                ),
            )
            if charge < 0:
                return Q(0)
            price = old.chord_price(self.chords, chi_lo, chi_hi, old.BETA**2 * charge)
            if price < old.ELL * t0:
                return Q(0)
            updated = min(energy, joint.up(((price - old.ELL * t0) / old.BETA) ** 2))
            if fresh:
                updated = joint.up(
                    spiked_p7.energy_cap(self.spiked, chi_lo, chi_hi, t0, charge, updated)
                )
            if ellipse:
                cross = min(self.cross * y1, 99 * charge)
                updated = min(updated, self.lift_cap(energy, floor, d0, d1, y1, cross))
            if updated == energy:
                return payoff
            energy = updated
        if energy < floor:
            return Q(0)
        root = joint.sqrt_lo(energy)
        mass = max(2 * joint.EH * p * root - J for p, J in costs) / joint.MC
        return joint.H + (1 - joint.H) * t1 * t1 + joint.E * energy - joint.H * mass

    def cover(self, begin, end, k):
        target = 1 / k - Q(1, 10**5)
        j = self.joint
        small = j.H + (1 - j.H) * end**2 + (j.E - j.H) * j.A_MIN
        need(small < target, "small projected energies")
        stack = [(begin, end, Q(0), Q(13, 2), 0)]
        count = 0
        worst = small
        area = Q(0)
        while stack:
            left, right, low, high, depth = stack.pop()
            value = self.cell(left, right, low, high, target)
            if value < target:
                area += (right - left) * (high - low)
                count += 1
                worst = max(value, worst)
                continue
            need(depth < 55, f"unresolved cell at {left}, {low}")
            if 30 * (right - left) > high - low:
                middle = (left + right) / 2
                stack.extend(
                    [
                        (left, middle, low, high, depth + 1),
                        (middle, right, low, high, depth + 1),
                    ]
                )
            else:
                middle = (low + high) / 2
                stack.extend(
                    [
                        (left, right, low, middle, depth + 1),
                        (left, right, middle, high, depth + 1),
                    ]
                )
        need(
            area == (end - begin) * Q(13, 2) and Q(13, 2) ** 2 >= 42,
            "entire amplitude and shape rectangle",
        )
        print(
            f"{k}: [{begin}, {end}], {count} closed cells; contradiction clearance "
            f"> {(target-worst)*10**12//1} trillionths.",
            flush=True,
        )
        return target - worst


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    args = parser.parse_args()
    proof = Payoff(args.repo.resolve())
    for k, begin, end, spare in (
        (K, Q(".388"), Q(".408"), 704560),
        (Q("1.4025"), Q(".3875"), Q(".407"), 2570180),
        (Q("1.403"), Q(".386"), Q(".405"), 467250),
    ):
        need(
            proof.cover(begin, end, k) > Q(spare, 10**12),
            "announced contradiction clearance",
        )
    t, y = Q(".407"), Q("2.49")
    need(
        TARGET - proof.cell(t, t, y, y, TARGET) > Q(".00124")
        and proof.cell(t, t, y, y, TARGET, fresh=False) - TARGET > Q(".00361"),
        "new spiked row is active",
    )
    t, y = Q(".42"), Q("1.86")
    need(
        TARGET - proof.cell(t, t, y, y, TARGET) > Q(".00215")
        and proof.cell(t, t, y, y, TARGET, ellipse=False) - TARGET > Q(".00361"),
        "sector-sensitive elliptic cross term is active",
    )
    t, y = Q(".4085"), Q("2.305")
    need(
        proof.cell(t, t, y, y, TARGET) - TARGET > Q(".00207"),
        "this same majorant beyond the certified central strip",
    )
    print("Both necessity controls and the outside-strip relaxation control passed.")

    verifier = module(
        args.repo.resolve()
        / "research/higher-degree/code/spiked-cubic-radius-gemini-4c4c/verify.py"
    )
    proof.spiked += (spiked_p7.repriced_model(verifier),)
    need(TARGET - proof.cell(t, t, y, y, TARGET) > Q(".00039"), "repricing clears the old failure")
    for k, start, end, spare in (
        (K, ".408", ".40869", 771440),
        (Q("1.4025"), ".407", ".40825", 640650),
        (Q("1.403"), ".405", ".40705", 1578800),
    ):
        need(proof.cover(Q(start), Q(end), k) > Q(spare, 10**12), "verified repriced strip")

    t, y = Q(".408694"), Q("3.464102")
    need(proof.cell(t, t, y, y, TARGET) > TARGET, "remaining failure of this price pair")


if __name__ == "__main__":
    main()
