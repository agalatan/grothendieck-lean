"""Exact continuous envelope of the MIDT 6.3 row relaxation (#628, codex-062a)."""

from fractions import Fraction as Q
from pathlib import Path

RESEARCH = Path(__file__).resolve().parents[3]
TABLE = RESEARCH / "identity-tail/sources/stage0d-2026-11-17/ROW_CONSTANTS.txt"
EPS, ETA, EPS_HAT, NU_HAT = Q(39, 50), Q(779, 10000), Q(25, 31), Q(47, 1953)
R, TARGET = EPS/EPS_HAT, Q(500, 701)
MASS_C = 2*NU_HAT + Q(1, 2)
RADIUS = Q(2287, 2500)
LO, HI = Q(7, 20), Q(13, 20)
ROW_NAMES = "0.4 0.6 0.7 0.78 0.8 0.82 0.83 0.835 0.845 0.85 0.86 0.87 0.885 0.8875".split()


def require(ok, message):
    if not ok:
        raise ValueError(message)


def read_table():
    rows = {}
    fields = {}
    mass_s = None
    for line in TABLE.read_text().splitlines():
        if line.startswith("row "):
            name = line.split()[1]
            require(name not in rows, f"duplicate row {name}")
            fields = rows[name] = {}
        elif line.startswith("  S = "):
            mass_s = Q(line.split(" = ")[1])
        elif line.startswith(("  ell = ", "  beta = ", "  C = ")):
            key, value = line.strip().split(" = ")
            fields[key] = Q(value)
    require(list(rows) == ROW_NAMES, "changed row set")
    require(all(row.keys() == {"ell", "beta", "C"} for row in rows.values()), "missing row fields")
    require(mass_s is not None and mass_s > 0, "missing mass cap")
    return rows, mass_s


def eliminated(t, rows, S, h):
    """Each entry bounds the payoff after eliminating K. h=None discards all squares."""
    x = t*t
    norm2 = Q(0) if h is None else 2*h*h
    upper_k = 1-x-norm2
    b = (1-ETA)*x + ETA - (EPS+ETA)*norm2
    increasing = {"energy": (b, EPS-ETA), "mass": (b+R*S, R*MASS_C-ETA)}
    # 2/pi < 2/3 makes this radius constraint stronger. The extremizing rows below
    # are independent of the radius, so we can certify matching upper/lower values.
    decreasing = {"radius": (b + EPS*(RADIUS**2-Q(2, 3)*x), ETA)}
    hats = {name: (x-2*row["ell"]*t+row["C"], row["beta"]) for name, row in rows.items()}
    hats["mass"] = ((1+x)/2+S, Q(0))
    slope = ETA-2*R*NU_HAT
    require(slope > 0 and all(m > 0 for _, m in increasing.values()), "slope signs")
    for name, (cap, beta) in hats.items():
        square = Q(0) if h is None else 2*EPS_HAT*(h-beta/EPS_HAT)**2
        d = R*(cap-square)+(1-R-ETA)*x+ETA-ETA*norm2
        decreasing[name] = d, slope
    bounds = {}
    for i, (intercept, m) in increasing.items():
        bounds["right", i] = intercept + m*upper_k
    for j, (d, s) in decreasing.items():
        bounds[j, "left"] = d
        for i, (intercept, m) in increasing.items():
            bounds[j, i] = (m*d+s*intercept)/(m+s)
    return bounds


def quadratics(rows, S, h):
    # Every intercept is quadratic in t and every slope in K is constant.
    at_zero, at_one, at_minus_one = (eliminated(Q(k), rows, S, h) for k in (0, 1, -1))
    return {key: (v, (at_one[key]-at_minus_one[key])/2,
                  (at_one[key]+at_minus_one[key])/2-v) for key, v in at_zero.items()}


def value(poly, t):
    c, b, a = poly
    return (a*t+b)*t+c


def minimum(poly):
    _, b, a = poly
    points = [LO, HI]
    if a > 0 and LO < -b/(2*a) < HI:
        points.append(-b/(2*a))
    return min((value(poly, t), t) for t in points)


def crossing(rows, first, second):
    f, g = rows[first], rows[second]
    return (g["C"]-f["C"])/(2*(g["ell"]-f["ell"]))


def enclosure(label, x, low, high):
    require(Q(low) < x < Q(high), f"{label} outside {low}, {high}")
    print(f"{low} < {label} < {high}")


def main():
    rows, S = read_table()
    bare = quadratics(rows, S, None)
    require(len(bare) == 50, "two endpoint and three bounds per decreasing line")
    floor, t_min = min(minimum(poly) for poly in bare.values())
    require((floor, t_min) == minimum(bare["0.4", "mass"]), "minimum attaining row")
    switch = crossing(rows, "0.4", "0.6")
    t_max = crossing(rows, "0.6", "0.7")
    require(LO < switch < t_max < HI, "order of row crossings")
    peak = value(bare["0.6", "energy"], t_max)
    require(min(value(poly, t_max) for poly in bare.values()) == peak, "maximum attainment")
    for name, left, right in (("0.4", LO, switch), ("0.6", switch, t_max), ("0.7", t_max, HI)):
        poly = bare[name, "energy"]
        require(poly[2] > 0 and max(value(poly, t) for t in (left, right)) <= peak,
                f"continuous peak upper bound on {left} to {right}")

    enclosure("minimizer", t_min, ".3851826526", ".3851826527")
    enclosure("minimum excess", floor-TARGET, ".0015387344", ".0015387345")
    enclosure("maximizer", t_max, ".6320135611", ".6320135612")
    enclosure("maximum excess", peak-TARGET, ".0095284079", ".0095284080")
    # The legacy grid used just these three numbered rows and the mass row.
    subset = {name: rows[name] for name in ("0.4", "0.6", "0.7")}
    legacy = quadratics(subset, S, None)
    require(min(minimum(poly) for poly in legacy.values()) == (floor, t_min)
            and min(value(poly, t_max) for poly in legacy.values()) == peak,
            "extrema on the original subset")

    h = Q(3, 80)
    retained = quadratics(rows, S, h)
    fixed_floor, fixed_t = min(minimum(poly) for poly in retained.values())
    require((fixed_floor, fixed_t) == minimum(retained["0.4", "mass"])
            and fixed_t == t_min, "retained minimum attainment")
    enclosure("fixed-direction minimum excess", fixed_floor-TARGET, ".0011772030", ".0011772031")
    require(1-HI**2-2*h*h > 0 and (1-ETA)*HI**2+ETA < TARGET,
            "nonempty K interval and positive A at certified payoffs")
    for t in (LO, t_min, switch, Q(11, 20), t_max, HI):
        # Independently recover a primal scalar allocation from the energy and mass
        # lower bounds on K. Check it directly in the original variables.
        payoff = min(value(poly, t) for poly in retained.values())
        check_witness(t, h, payoff, rows, S)
    require(eliminated(HI, rows, S, Q(0))["0.7", "energy"] < TARGET, "zero-direction control")


def check_witness(t, h, payoff, rows, S):
    x, norm2 = t*t, 2*h*h
    b = (1-ETA)*x + ETA - (EPS+ETA)*norm2
    K = max(Q(0), (payoff-b)/(EPS-ETA), (payoff-b-R*S)/(R*MASS_C-ETA))
    A = (payoff-b+ETA*K)/EPS
    require(0 <= A <= K <= 1-x-norm2, "energy budget")
    require(A + Q(2, 3)*x <= RADIUS**2 and EPS_HAT*A-MASS_C*K <= S, "radius or mass")
    vhat = x + EPS_HAT*(A-norm2) - 2*NU_HAT*K
    require(vhat <= (1+x)/2+S-EPS_HAT*norm2, "mass row with square")
    for name, row in rows.items():
        cap = x-2*row["ell"]*t+row["C"] - 2*EPS_HAT*(h-row["beta"]/EPS_HAT)**2
        require(vhat <= cap, f"retained row {name}")
    require(payoff == x-EPS*norm2+ETA*(1-x-K-norm2)+EPS*A, "payoff identity")


if __name__ == "__main__":
    main()
