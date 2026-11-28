"""Rank-one Young intercept for the matched support proof. Agent-ID: codex-a7c4.

Install next to joint_sector.py. Run python3 -IBO rank_one.py --repo .
"""

import argparse
from fractions import Fraction as Q
from functools import lru_cache
import json
from pathlib import Path
import sys

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import joint_sector as joint
from rank_bound import riesz_bounds


class RankProof(joint.Proof):
    def __init__(self, repo):
        super().__init__(repo)
        cert = json.loads((HERE / "rank_sos.json").read_text())
        self.reference_shape, self.reference_index, self.reference_lambda = (
            Q(cert["chi"]),
            cert["idx"],
            Q(cert["lam"]),
        )
        joint.need(
            (self.reference_shape, self.reference_index, self.reference_lambda)
            == (Q("4.1"), 0, Q(".54")),
            "physical reference prices",
        )
        self.base, self.reference = self.ingredients(
            self.reference_shape, self.reference_index, self.reference_lambda
        )
        self.low, self.upper, _ = riesz_bounds(
            self.reference,
            self.products.product_factors(),
            self.products.FREQUENCIES,
            cert,
            tuple(map(Q, ("0", "0", ".26789", "0", "1"))),
        )
        joint.need(
            self.low / max(self.reference) > Q("1.05791050")
            and self.upper / max(self.reference) < Q("1.05791056"),
            "certified two-mode lower and uniform upper bounds",
        )

    def ingredients(self, shape, index, lam):
        q = (shape - self.lo) / (self.hi - self.lo)
        left, right = self.ends
        base = (1 - q) * left[0] + q * right[0]
        H = (1 - q) * left[2] + q * right[2]
        linear = [(1 - q) * a + q * b for a, b in zip(left[1], right[1])]
        prices = [lam * z - a for z, a in zip(self.profiles[index][-1], linear)]
        if min(prices) <= 0:
            return base, None
        return base, tuple(
            (H * k) ** 2 / (4 * a) for k, a in zip(self.ver.KAPPA_HI, prices)
        )

    @lru_cache(None)
    def intercept(self, s, index, lam, symmetric=True):
        prior = super().intercept(s, index, lam, symmetric)
        if prior is None or not symmetric:
            return prior
        base, terms = self.ingredients(s, index, lam)
        factor = max(t / ref for t, ref in zip(terms, self.reference))
        return min(prior, base + factor * self.upper)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    proof = RankProof(parser.parse_args().repo.resolve())
    t, s, x = Q(".4202"), Q("4.1"), Q(".82455")
    idx, lam = proof.reference_index, proof.reference_lambda
    c, h, p, d, _ = proof.profiles[idx]
    u, offset = max(proof.witnesses(s, s), key=lambda w: w[0] * x - w[1])
    charge = lam * (c + (1 - h) * t * t - joint.TARGET - d * (u * x - offset))

    def gap(I):
        return (
            I + lam * (joint.EPS - p) - joint.ELL * t - joint.BETA * x
        ) * x * x + charge

    old = joint.Proof.intercept(proof, s, idx, lam)
    combined = proof.intercept(s, idx, lam)
    joint.need(
        gap(old) > Q(".00000739") and gap(combined) < -Q(".00001419"),
        "fixed-input rank-one control",
    )
    clearance = proof.cover(Q(".4201"), Q(".4202"), proof.lo, proof.hi)
    joint.need(clearance > Q(1388594, 10**12), "entire shape and energy rectangle")
    print("Rank-one support comparison and complete strip passed.")


if __name__ == "__main__":
    main()
