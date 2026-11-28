"""Shape-conditioned KRS501 elliptic lift for the buffered degree-five witness.

Agent-ID: codex-a7c4. Uses the upstream rational checkers for every Stein and Gram row.
"""

from argparse import ArgumentParser
from fractions import Fraction as F
from functools import lru_cache
from importlib.util import module_from_spec, spec_from_file_location
import json
from pathlib import Path


def load(name, path):
    spec = spec_from_file_location(name, path)
    mod = module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def require(cond, tag):
    if not cond:
        raise ArithmeticError(tag)


energy_cap = load(
    "sector_carrier_tilt", Path(__file__).with_name("carrier_tilt.py")
).energy_cap


class Proof:
    def __init__(self, repo):
        kdir = repo / "research/conjecture-K/code/real-stein-501-gemini-8732"
        krs = load("krs", kdir / "verify.py")
        self.j = load(
            "spectral",
            repo
            / "research/higher-degree/code/joint-spectral-cubic-lift-codex-a7c4/verify.py",
        )
        cert = json.loads((kdir / "cert_real_501.json").read_text())
        res = krs.verify_certificate_dict(cert, generic=True, quiet=True)
        self.rho = res["claim_cplx"]
        require(self.rho == F("0.8884"), "global complex radius")
        pi = krs.verify_pi_bounds()[1]
        self.mu2 = self.j.up(pi / 4)
        self.rows = []
        last = F(0)
        for raw in cert["rows"]:
            lo, hi, b = (F(raw[key]) for key in ("s_lo", "s_hi", "bound"))
            require(lo == last and hi > lo, "complete real excess intervals")
            self.rows.append((lo, hi, self.j.up(pi**2 * b**2 / 8)))
            last = hi
        require(last > 63, "all complex shapes through 42")
        self.refined = []
        low = F(0)
        for i, cap, source in json.loads(
            (Path(__file__).parent / "retuned.json").read_text()
        ):
            lo, hi = F(i, 4), F(i + 1, 4)
            require(lo == low and 0 <= source < len(cert["rows"]), "new subslab cover")
            params = dict(cert["rows"][source])
            b = F(cap, 10**8)
            params.update(
                s_lo=str(lo),
                s_hi=str(hi),
                bound=str(b),
                x_lo="0",
                sig_lo=str(self.j.sqrt_hi(lo**3)),
                sig_hi=str(self.j.sqrt_hi(hi**3)),
            )
            checked = krs.verify_row(params)
            require(checked["bound"] == b, "subslab bound")
            self.refined.append((lo, hi, self.j.up(pi * pi * b * b / 8)))
            low = hi
        require(low == 4, "sixteen contiguous quarter-slabs")
        self.refined_end = low
        self.pool = self.j.witnesses(
            (repo / "Grothe/Lower/MassWitnessData.lean").read_text()
        )
        j = self.j
        require(
            all(
                j.E > j.H * j.EH * p / (j.MC * j.sqrt_lo(j.A_MIN))
                for p, *_ in self.pool
            ),
            "combined payoff increasing in A",
        )
        r = 2 * j.AXIS**2 - 1
        require(
            j.E == F(".78")
            and j.H == F(".0779")
            and j.C == F(".862")
            and j.AXIS == F(".895"),
            "game and elliptic lift",
        )
        require(0 < r < 1 and 64 >= 32 * r**2, "positive lower cross form")
        self.carrier = j.C
        self.tilts = (F(1),)
        self.tail = 2 * (1 + r**2)
        self.cross = 2 * j.sqrt_hi(3 * (1 + r**2))
        self.target = 1 / F("1.4023") - F(1, 10**5)
        self.gram = []
        here = Path(__file__).resolve().parent
        st = load(
            "step_charges",
            repo
            / "research/higher-degree/code/quintic-product-support-codex-a7c4/step_charges.py",
        )
        step = st.load_step(repo)
        require((step.EPS, step.ETA) == (j.E, j.H), "spectral and step games")
        grid = tuple(st.bins(step))
        for name in ["mixed.json", "unmixed.json"]:
            raw = json.loads((here / name).read_text())
            raw[4] = tuple(raw[4])
            st.check_row(step, grid, st.WEIGHTS, raw)
            gross, h, p0, *other = (F(n, 10**9) for n in raw[4])
            gap = min(other) - p0
            mass = j.H - F(raw[0], 10**6)
            require(
                0 <= mass <= j.H and gap > 0 and 1 - h >= gap, "mixed Gram price signs"
            )
            require(
                all(
                    j.E - p0 - gap > mass * j.EH * p / (j.MC * j.sqrt_lo(j.A_MIN))
                    for p, *_ in self.pool
                ),
                "increasing mass-priced Gram payoff",
            )
            diags = (8, 8, 4 + 4 * r, 4, 12 + 8 * r)
            ds = [v - p0 for v in other]
            cross_price = next(
                F(lam)
                for lam in range(1, 5001)
                if all(lam * price >= diag for price, diag in zip(ds, diags))
                and (lam * ds[0] - 8) * (lam * ds[1] - 8) >= 32 * r * r
            )
            self.gram.append((gross, h, p0, gap, mass, cross_price))

    @lru_cache(maxsize=None)
    def costs(self, y0, y1):
        return [
            (p, max(a + b * y0**2 + c * y0**3, a + b * y1**2 + c * y1**3))
            for p, a, b, c in self.pool
        ]

    def box(self, t0, t1, y0, y1, *, refined=True, paid_cross=True):
        j = self.j
        base = j.H + (1 - j.H) * t1**2
        floor = max(j.A_MIN, j.down((self.target - base) / (j.E - j.H)))
        small = base + (j.E - j.H) * j.A_MIN
        require(small < self.target, "small cubic energy arm")
        d0, d1 = (self.carrier**2 * t**2 for t in (t0, t1))
        au = j.up(self.rho**2 - d0)
        for _ in range(4):
            if au < floor:
                return max(small, base + (j.E - j.H) * au)
            cross = self.cross * y1
            best = max(
                self.costs(y0, y1),
                key=lambda pc: 2 * j.EH * pc[0] * j.sqrt_lo(au) - pc[1],
            )

            def mass_lower(a):
                return (2 * j.EH * best[0] * j.sqrt_lo(a) - best[1]) / j.MC

            for gross, h, p0, gap, mass, cross_price in self.gram if paid_cross else ():
                price_base = gross + (1 - h) * t1**2 - self.target
                z = (
                    j.E
                    - p0
                    + max((price_base - mass * mass_lower(a)) / a for a in (floor, au))
                )
                if z < 0:
                    return small
                cross = min(cross, cross_price * z)
            new = min(
                au,
                *(
                    energy_cap(self, floor, au, y0, y1, d0, d1, a, cross, refined)
                    for a in self.tilts
                ),
            )
            if new == au:
                break
            au = new
        if au < floor:
            return max(small, base + (j.E - j.H) * au)
        low_mass = max(
            (2 * j.EH * p * j.sqrt_lo(au) - cost) / j.MC
            for p, cost in self.costs(y0, y1)
        )
        best = base + j.E * au - j.H * low_mass
        for gross, h, p0, gap, mass, _ in self.gram:
            mixed = max(0, au + t1**2 - self.rho**2)
            best = min(
                best,
                gross
                + (1 - h) * t1**2
                + (j.E - p0) * au
                - gap * mixed
                - mass * low_mass,
            )
        return max(small, best)

    def cover(self, t0, t1):
        j = self.j
        require(0 <= t0 < t1, "nonempty amplitude interval")
        y_max = j.sqrt_hi(F(42))
        area = F(0)
        todo = [(t0, t1, F(0), y_max, 0)]
        worst = F(0)
        leaves = 0
        deepest = 0
        while todo:
            lo, hi, y, z, d = todo.pop()
            b = self.box(lo, hi, y, z)
            if b < self.target:
                area += (hi - lo) * (z - y)
                leaves += 1
                worst = max(worst, b)
                deepest = max(deepest, d)
                continue
            if d >= 45:
                raise ArithmeticError(
                    (
                        "unresolved box",
                        *[float(x) for x in (lo, hi, y, z, b - self.target)],
                    )
                )
            if 30 * (hi - lo) > z - y:
                m = (hi + lo) / 2
                todo.extend(((lo, m, y, z, d + 1), (m, hi, y, z, d + 1)))
            else:
                m = (y + z) / 2
                todo.extend(((lo, hi, y, m, d + 1), (lo, hi, m, z, d + 1)))
        require(area == (t1 - t0) * y_max, "complete rectangle area")
        return leaves, deepest, ((self.target - worst) * 10**12).__floor__()


if __name__ == "__main__":
    cli = ArgumentParser()
    cli.add_argument("--repo", type=Path, default=Path.cwd())
    args = cli.parse_args()
    proof = Proof(args.repo)
    print("shape-conditioned KRS rows and 24 mass witnesses checked", flush=True)
    end = F(".460")
    leaves, depth, reserve = proof.cover(F(0), end)
    require(reserve >= 6_000_000, "weak all-sector contradiction margin")
    print(
        f"All dimensions and shapes through {end}: {leaves} leaves, depth {depth}, "
        f"additional conditional clearance {reserve}/10^12."
    )
    y = F(".66")
    require(proof.box(end, end, y, y) < proof.target, "full check at removal control")
    require(
        proof.box(end, end, y, y, refined=False) - proof.target > F(".0002"),
        "original excess partition misses control",
    )
    require(
        proof.box(end, end, y, y, paid_cross=False) - proof.target > F(".00008"),
        "dropping the mixed fourth-moment Gram price misses the control",
    )
    later = F(".461")
    require(
        proof.box(later, later, y, y) - proof.target > F(".0002"),
        "all rows on the later relaxation sample",
    )
    print("Partition, signed Gram and later-point controls passed.")
    for inverse_target, end in (("1.4025", ".4597"), ("1.403", ".459")):
        proof.target = 1 / F(inverse_target) - F(1, 10**5)
        count, depth, reserve = proof.cover(F(0), F(end))
        require(reserve > 0, "secondary target")
        print(f"Target {inverse_target} through {end}: {count} leaves, depth {depth}, "
              f"extra clearance {reserve}/10^12.")
