"""Capped degree-five payoff through t = 19/50 at target 1.4023. Agent-ID: codex-a7c4."""
import argparse
import importlib.util
import json
from fractions import Fraction as Q
from functools import cache
from pathlib import Path

TARGET = Q(10000, 14023)
RADIUS = Q(2287, 2500)
START, END = Q(".358"), Q(19, 50)
ELL, SCALE, SUPPORT = Q(84, 205), Q(187, 205), Q(582, 625)
Y_MAX = Q(13, 2)
MIN_MARGIN = Q(20226, 10**12)
SHAPE_LO, SHAPE_HI = Q(9, 2), Q(13, 2)
SHAPE_SUPPORT = Q('.93091')


def load(path):
    spec = importlib.util.spec_from_file_location(path.parent.name, path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def check(repo, replay_ray=False):
    code = repo / "research/higher-degree/code"
    joint = load(code / "joint-spectral-cubic-lift-codex-a7c4/verify.py")
    require = joint.require
    cert_dir = code / "spiked-cubic-radius-gemini-4c4c"
    certificate = json.loads((cert_dir / "cert_spiked.json").read_text())
    ray = certificate["rays"][0]
    require(ray["kind"] == "stein" and ray["abc"] == [84, 187, 205] and
            Q(ray["R"]) == SUPPORT, "published support ray")
    spiked = load(cert_dir / "verify.py")
    rows = [spiked.sector_B_upper(Q(c)) for c in certificate["c_bank"]]
    source = ray["rows"][3]
    require((Q(source["s_lo"]), Q(source["s_hi"])) == (SHAPE_LO, SHAPE_HI),
            "shape-restricted source slab")
    cutoff = Q(".1762")
    require(spiked.envelope(cutoff)[1] < SHAPE_SUPPORT, "restricted ray exterior")
    # The dual's sector inequalities depend on the hypothesized support price.
    a_sec, b_sec = spiked.build_sector_polytope(ELL**2, cutoff, SHAPE_SUPPORT, rows)
    result = spiked.verify_spiked_row(source, ray["abc"], a_sec, b_sec,
                                      certificate["knot_sets"], quiet=True)
    require(result["ok"] and result["bound"] < Q(".930906813538") < SHAPE_SUPPORT,
            "restricted spiked Stein and Sturm comparison")
    if replay_ray:
        checked = spiked._verify_stein_ray_task((0, ray, rows, certificate["knot_sets"], True))
        require(checked[0:2] == (0, 8), "source ray Sturm/Stein slabs")
        print(checked[2])

    pool = joint.witnesses((repo / "Grothe/Lower/MassWitnessData.lean").read_text())
    e, eta = joint.E, joint.H
    require((e, eta) == (Q(39, 50), Q(779, 10000)), "capped degree-five game")
    require(Y_MAX**2 >= 42, "full normalized fourth-excess range")
    k = e - eta * joint.EH / joint.MC
    linear = 1 - eta - k * joint.C**2
    require(k > 0 and linear > 0 and
            eta * (1 + joint.MS / joint.MC) + k * RADIUS**2 + linear * START**2 < TARGET,
            "reviewed elliptic whole interval through .358")
    small = joint.A_MIN
    require(eta + (1 - eta) * END**2 + (e - eta) * small < TARGET-MIN_MARGIN,
            "small projected cubic energy")
    require(all(e > eta * joint.EH * p / (joint.MC * joint.sqrt_lo(small)) for p, *_ in pool),
            "payoff increasing in energy for each mass witness")
    r = 2 * joint.AXIS**2 - 1
    cross = 2 * joint.sqrt_hi(3 * (1 + r**2))
    tail = 2 * (1 + r**2)

    @cache
    def costs(y0, y1):
        return [(p, max(a + b*y0**2 + d*y0**3, a + b*y1**2 + d*y1**3))
                for p, a, b, d in pool]

    def upper(t0, t1, y0, y1):
        d0, d1 = (joint.C*t0)**2, (joint.C*t1)**2
        require(SUPPORT - ELL*t1 >= 0, "support half-plane may be squared")
        radius = SHAPE_SUPPORT if SHAPE_LO <= y0**2 and y1**2 <= SHAPE_HI else SUPPORT
        require(radius >= ELL*t1, "shape-specific support orientation")
        energy = min(RADIUS**2 - d0, ((radius - ELL*t0)/SCALE)**2)
        for _ in range(2):
            if energy < small:
                return Q(0)  # This cell has no response with projected energy at least small.
            lo, hi = d0/(energy+d0), d1/(small+d1)
            shape = joint.quadratic_max(y1**2-cross*y1+tail, cross*y1-2*y1**2, y1**2, lo, hi)
            energy = min(energy, joint.up(Q(355, 452)*(1 + joint.RATE*shape)**2 - d0))
        if energy < small:
            return Q(0)
        mass = max(2*joint.EH*p*joint.sqrt_lo(energy)-cost for p, cost in costs(y0, y1))/joint.MC
        return eta + (1-eta)*t1**2 + e*energy - eta*mass

    leaves, worst, area = 0, Q(0), Q(0)
    cells = [(START, END, Q(0), Y_MAX, 0)]
    while cells:
        t0, t1, y0, y1, depth = cells.pop()
        bound = upper(t0, t1, y0, y1)
        if bound < TARGET:
            worst = max(worst, bound)
            leaves += 1
            area += (t1-t0)*(y1-y0)
            continue
        require(depth < 55, ("unresolved", t0, t1, y0, y1))
        if 30*(t1-t0) > y1-y0:
            mid = (t0+t1)/2
            cells.extend(((t0, mid, y0, y1, depth+1), (mid, t1, y0, y1, depth+1)))
        else:
            mid = (y0+y1)/2
            cells.extend(((t0, t1, y0, mid, depth+1), (t0, t1, mid, y1, depth+1)))
    require(area == (END-START)*Y_MAX, "area of the closed cover")
    require(TARGET-worst > MIN_MARGIN, "minimum box clearance")

    # Each tuple is a point of the stated scalar relaxation. No physical realization is assumed.
    for t, y, a, mass, ray_passes, shape_ray_passes, cuts_pass in (
        (".378", "2.55", ".730688", ".800873", False, False, True),
        (".378", "3", ".724263", ".763463", True, True, False),
        (".38", "2.36", ".722735", ".787713", True, False, True),
        (".381", "2.55", ".721971", ".790841", True, True, True),
    ):
        t, y, a, mass = map(Q, (t, y, a, mass))
        d = (joint.C*t)**2
        w = d/(a+d)
        shape_lo = ((1-w)**2*y**2 + 2*joint.sqrt_lo(3*(1+r*r))*y*w*(1-w) + tail*w*w)
        require(small < a < mass < 1-t*t and joint.EH*a-joint.MC*mass < joint.MS,
                "Parseval and global mass on control")
        require(a+d < RADIUS**2 and a+d < Q(333, 424)*(1+joint.RATE*shape_lo)**2,
                "ordinary and fourth-excess elliptic caps on control")
        require((a <= ((SUPPORT-ELL*t)/SCALE)**2) == ray_passes, "support ray control")
        price = SHAPE_SUPPORT if SHAPE_LO <= y*y <= SHAPE_HI else SUPPORT
        require((a <= ((price-ELL*t)/SCALE)**2) == shape_ray_passes, "restricted ray control")
        root = joint.sqrt_hi(a) if cuts_pass else joint.sqrt_lo(a)
        inequalities_hold = all(2*joint.EH*p*root - cap <= joint.MC*mass for p, cap in costs(y, y))
        require(inequalities_hold == cuts_pass, "24 individual spectral cut controls")
        require(eta+(1-eta)*t*t+e*a-eta*mass > TARGET, "payoff relaxation exceeds target")
    print(f"All projected shapes and sectors through {END}: {leaves} closed rectangles.")
    print(f"New segment minimum clearance > 20226/10^12.")
    print("Ray, spectral and shape-ray deletion controls passed; joint relaxation overshoots at t=.381.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path(__file__).resolve().parents[4])
    parser.add_argument("--replay-ray", action="store_true")
    args = parser.parse_args()
    check(args.repo, args.replay_ray)
