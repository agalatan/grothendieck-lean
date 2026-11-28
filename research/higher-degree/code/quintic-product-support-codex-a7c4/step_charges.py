"""Exact capped-game mass and sector budgets with nonnegative radial weights.

Agent-ID: codex-a7c4. Run python3 -IB -O step_charges.py --repo .
"""

import argparse
from bisect import bisect_right
from fractions import Fraction as Q
from functools import lru_cache
import importlib.util
from pathlib import Path

KNOTS = tuple(
    Q(n, 1000)
    for n in (
        0,
        35,
        90,
        180,
        300,
        500,
        750,
        1000,
        1400,
        1900,
        2500,
        3400,
        4700,
        6000,
        8000,
        12000,
        20000,
    )
)
SLOTS = ((0, 0), (1, 1), (2, 0), (1, 0), (0, 1), (2, 1))
WEIGHTS = tuple(Q(n - 138070, 10**6) for n in (252613, 274894, 204324, 204324, 308214))
N = 64
MOMENT_SCALE = 10**15
FLOOR = 10**9


def need(ok, reason):
    if not ok:
        raise ValueError(reason)


def load_step(repo):
    path = (
        repo
        / "research/higher-degree/code/quintic-mixed-sectors-codex-a7c4/step_shoulder.py"
    )
    spec = importlib.util.spec_from_file_location("sector_step_predecessor", path)
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def bins(step):
    """Intervals for the T^k exp(-T) integrals, k=0,...,6, including the tail."""
    left = (step.EXP_SCALE, step.EXP_SCALE)
    start = step.tail_polynomials(Q(0))
    for index in range(8 * N + 1):
        a = Q(index, N)
        b = a + Q(1, N)
        if index < 8 * N:
            right = step.step_exponential(*left, b * b - a * a)
            finish = step.tail_polynomials(b)
        else:
            right = (0, 0)
            finish = [Q(0)] * 7
        masses = []
        for first, last in zip(start, finish):
            lo = max(0, (first * left[0] - last * right[1]) / step.EXP_SCALE)
            hi = (first * left[1] - last * right[0]) / step.EXP_SCALE
            need(0 <= lo <= hi, "bin mass ordering")
            masses.append((lo, hi))
        yield ((a + b) / 2) ** 2, masses
        left, start = right, finish


def moment_banks(step, grid, profile, c):
    need(len(profile) == len(KNOTS) and min(profile) >= 0, "nonnegative radial profile")
    h = [[0, 0] for _ in range(7)]
    k = [[0, 0] for _ in range(7)]
    mean = 0
    for t, masses in grid:
        j = bisect_right(KNOTS, t) - 1
        z = Q(profile[j], 10**6)
        if j + 1 < len(KNOTS):
            z += (
                Q(profile[j + 1] - profile[j], 10**6)
                * (t - KNOTS[j])
                / (KNOTS[j + 1] - KNOTS[j])
            )
        weight = Q(round(10**7 * z), 10**7)
        need(weight >= 0, "nonnegative bin weight")
        mean += (MOMENT_SCALE * weight * masses[0][1]).__ceil__()
        for i, (lo, hi) in enumerate(masses):
            for dest, shift in ((h, step.ETA), (k, c)):
                dest[i][0] += (MOMENT_SCALE * lo / (shift + weight)).__floor__()
                dest[i][1] += (MOMENT_SCALE * hi / (shift + weight)).__ceil__()

    def intervals(numbers):
        return [(Q(lo, MOMENT_SCALE), Q(hi, MOMENT_SCALE)) for lo, hi in numbers]

    return step.ETA + Q(mean, MOMENT_SCALE), intervals(h), intervals(k)


def visible_price(step, moments, units):
    test, quintic = step.laguerre(0, 1), step.laguerre(2, 1)
    trial = Q(units, 10**5)
    step.modify(test, step.laguerre(1, 1), trial)
    den = 3 / step.ETA - step.gram(quintic, quintic, 1, moments)[1]
    need(den > 0, "quintic rank-one inverse")
    cov = max(abs(x) for x in step.gram(test, quintic, 1, moments))
    return 1 / (
        step.gram(test, test, 1, moments)[1] + cov**2 / den + 2 * trial**2 / step.EPS
    )


def check_row(step, grid, weights, row):
    c_int, s_int, profile, trial, expected = row
    c, s = Q(c_int, 10**6), Q(s_int, 10**6)
    need(0 < c <= step.ETA and s > 0, "admissible mass and sector prices")
    mean, hm, km = moment_banks(step, grid, profile, c)
    h = visible_price(step, hm, trial[0][0])
    p = [step.sector_price(i, j, v, km) for (i, j), v in zip(SLOTS, trial[1:])]
    actual = ((FLOOR * mean).__ceil__(), *((FLOOR * v).__floor__() for v in (h, *p)))
    need(
        len(trial) == 7 and actual == expected, "mean and seven certified price floors"
    )
    b = min(value - s * w for value, w in zip(p, (0, *weights)))
    need(b > 0 and 0 < h < 1, "positive price and increasing amplitude term")
    return (
        Q(actual[0], FLOOR),
        Q(actual[1], FLOOR),
        Q((FLOOR * b).__floor__(), FLOOR),
        step.ETA - c,
        s,
    )


def make_rows(repo, weights):
    """Return (constant,h,b,d,s) entries for mass_gram.normalized_charge."""
    need(tuple(weights) == WEIGHTS, "same five normalized charge prices")
    step = load_step(repo)
    grid = tuple(bins(step))
    return tuple(check_row(step, grid, weights, row) for row in ROWS)


ROWS = (
    (
        350,
        174515,
        (
            0,
            0,
            0,
            639,
            1477,
            2994,
            5091,
            7423,
            11722,
            18298,
            28038,
            46090,
            76744,
            109016,
            157484,
            234485,
            891079,
        ),
        (
            (-13736,),
            (-103463,),
            (-62689, -37336),
            (-33486,),
            (-52218,),
            (-52218,),
            (-44578, -63659),
        ),
        (
            87684791,
            101265723,
            8325813,
            35406275,
            34209187,
            19887891,
            19887891,
            51042366,
        ),
    ),
    (
        499,
        255549,
        (
            0,
            0,
            0,
            913,
            2085,
            4299,
            7479,
            11130,
            18062,
            28899,
            44895,
            73758,
            122023,
            174296,
            257140,
            420424,
            894438,
        ),
        (
            (-18881,),
            (-102831,),
            (-59481, -39514),
            (-31025,),
            (-50725,),
            (-50725,),
            (-41579, -68100),
        ),
        (
            93176391,
            114335371,
            11991669,
            51133541,
            50176171,
            28922381,
            28922381,
            73242944,
        ),
    ),
    (
        778,
        310504,
        (
            0,
            0,
            0,
            1088,
            2518,
            5265,
            9298,
            13997,
            23022,
            37176,
            57873,
            94693,
            156117,
            223663,
            333069,
            564864,
            897049,
        ),
        (
            (-21869,),
            (-101065,),
            (-56825, -40852),
            (-29100,),
            (-49120,),
            (-49120,),
            (-39198, -70734),
        ),
        (
            97381464,
            124086385,
            14703667,
            61801130,
            61440046,
            35275122,
            35275122,
            88114951,
        ),
    ),
    (
        7251,
        396166,
        (
            0,
            0,
            0,
            0,
            2638,
            6646,
            12529,
            19151,
            31539,
            50217,
            76581,
            122392,
            198523,
            283430,
            423499,
            739117,
            902075,
        ),
        (
            (-24781,),
            (-70846,),
            (-43453, -39370),
            (-21877,),
            (-37008,),
            (-37008,),
            (-30015, -68266),
        ),
        (
            103449134,
            137634682,
            24719375,
            83396740,
            84607121,
            50965899,
            50965899,
            115810626,
        ),
    ),
    (
        77900,
        984265,
        (
            0,
            0,
            0,
            0,
            7458,
            24626,
            44282,
            64018,
            95771,
            136832,
            188698,
            272554,
            408045,
            561819,
            824414,
            1503389,
            936915,
        ),
        (
            (-30096,),
            (-16179,),
            (-13263, -28933),
            (-6122,),
            (-9622,),
            (-9622,),
            (-9828, -47002),
        ),
        (
            145715175,
            216568688,
            124370803,
            248047625,
            265678214,
            189580250,
            189580250,
            311503241,
        ),
    ),
    (
        77900,
        1080575,
        (
            0,
            0,
            0,
            0,
            13390,
            31242,
            53192,
            74588,
            108963,
            153082,
            208552,
            297938,
            442102,
            605801,
            885702,
            1614384,
            943252,
        ),
        (
            (-29820,),
            (-16208,),
            (-12904, -29811),
            (-5783,),
            (-9228,),
            (-9228,),
            (-9426, -47044),
        ),
        (
            155096518,
            231304160,
            130585573,
            261525580,
            284288262,
            202175532,
            202175532,
            329911540,
        ),
    ),
    (
        77900,
        1344049,
        (
            0,
            0,
            4915,
            16502,
            30319,
            52327,
            78706,
            104732,
            146619,
            200559,
            268521,
            378167,
            555224,
            756574,
            1100794,
            2009018,
            966705,
        ),
        (
            (-28887,),
            (-15283,),
            (-11769, -30928),
            (-5019,),
            (-8149,),
            (-8149,),
            (-8277, -46651),
        ),
        (
            184854536,
            275923035,
            151576925,
            305527808,
            340846789,
            240622924,
            240622924,
            390609484,
        ),
    ),
)


if __name__ == "__main__":
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--repo", type=Path, default=Path.cwd())
    repo = ap.parse_args().repo.resolve()
    result = make_rows(repo, WEIGHTS)
    need(len(result) == 7, "all seven profile rows")
    # A changed claimed floor must be rejected by the same pricing path.
    changed = list(ROWS[0])
    changed[-1] = (changed[-1][0] - 1, *changed[-1][1:])
    try:
        step = load_step(repo)
        check_row(step, tuple(bins(step)), WEIGHTS, changed)
    except ValueError as error:
        need(
            str(error) == "mean and seven certified price floors",
            "control rejected at correct check",
        )
    else:
        raise ValueError("understated mean accepted")
    print(
        "Seven radial mass profiles and 56 rational bounds checked; understated mean rejected."
    )
