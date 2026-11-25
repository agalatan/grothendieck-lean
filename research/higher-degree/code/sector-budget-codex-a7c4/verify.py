"""Replay the degree-five sector obstruction, the small-mass estimate and row cover.
Agent-ID: codex-a7c4
"""
import argparse
from fractions import Fraction as F
import json
from math import isqrt
from pathlib import Path


EPS = F(39, 50)
ETA = F(779, 10000)
TARGET = F(500, 701)
LO, HI = F(1, 4), F(2, 5)


RIGHT = F(886227, 10**6)
ORIGINAL_CAP = F(
    662347622732116212241577999582124140389607294524650360861387595141162658339929,
    929096907829117415874769952621021127153976124375040000000000000000000000000000,
)
CRITICAL_MASS = F(
    272331596903074371762863734746013890359, 321298910298168960326041600000000000000
)
SIX_CAP = F(59936435016214836017774490734531249674091, 84064579755505483146854400000000000000000)
SIX = ("0.300L", "0.600L", "0.780", "0.830", "0.845", "0.860")
EIGHT = ("0.300L", "0.600L", "0.780", "0.830", "0.845", "0.850", "0.855", "0.865")
# P4 section 3's 29 displayed per-row rooms, in millionths, sorted by nominal mass.
PUBLISHED_ROOMS = (5830, 9920, 12200, 18200, 20800, 20100, 20100, 18800, 11300,
                   9600, 7720, 5900, 4200, 3170, 2470, 1790, 1220, 738, 474, 400,
                   373, 373, 384, 438, 539, 637, 844, 1110, 1390)


def require(test, message):
    if not test:
        raise ValueError(message)


def sqrt_upper(value):
    """A rational upper endpoint for a square root with denominator 10^6."""
    scale = 10**6
    floor = isqrt(value.numerator * scale**2 // value.denominator)
    result = F(floor + 1, scale)
    require((result - F(1, scale))**2 <= value < result**2, "root enclosure")
    return result


def biased_inner(poly, other):
    # Gamma(3/2,1) moments under the sqrt(T)-biased exponential law.
    moments = [F(1)]
    for degree in range(len(poly) + len(other) - 2):
        moments.append(moments[-1] * (F(3, 2) + degree))
    return sum(x * y * moments[i+j] for i, x in enumerate(poly)
               for j, y in enumerate(other))


def necessary_loss(row, remote_count):
    ell, beta, _, _ = map(F, row["row"].split(","))
    linear = [ell - 2*beta, beta]
    laguerre = [6, -6, 1]  # divide by sqrt(12) in the field
    invroot = F(288676, 10**6)
    require(12 * invroot**2 > 1, "quintic normalization")
    bound = (biased_inner(linear, linear)
             + 2 * ETA * abs(biased_inner(linear, laguerre)) * invroot
             + ETA**2 * biased_inner(laguerre, laguerre) / 12)
    h = sqrt_upper(bound)
    mu_lower = F(4431, 5000)
    # 333/106 < pi < 355/113.
    require(4 * mu_lower**2 < F(333, 106), "Gaussian first moment")
    fourth = 3 + F(6, remote_count)
    return max(F(0), EPS * mu_lower - h)**2 / (EPS * fourth)


def row_margin(row, loss, lo, hi):
    ell = F(row["row"].split(",")[0])
    cap = F(row.get("C_stein", row["C_plain"]))
    t = min(hi, max(lo, ell))
    return t*t - 2*ell*t + cap + loss - TARGET


def check_obstruction(rows):
    margins = []
    for row in rows:
        _, _, b_a, b_b = map(F, row["row"].split(","))
        require(1/EPS - (b_a**2+b_b**2)/ETA > 0, "positive quadratic penalty")
        loss = necessary_loss(row, 48)
        margin = row_margin(row, loss, LO, HI)
        margins.append((margin, row["tag"]))
        print(f"{row['tag']:>6}  loss >= {loss}  |  excess >= {margin}")
    gap, tag = min(margins)
    require(gap > F(83, 100000) and tag == "0.500L", "sector obstruction")
    require(min(row_margin(row, 0, LO, HI) for row in rows) < 0,
            "the test must distinguish the unrestricted sector cost")
    require(min(row_margin(row, necessary_loss(row, 48), F(41, 100), F(41, 100))
                for row in rows) < 0, "do not extrapolate the barrier to 0.41")
    short_gap = min(row_margin(row, necessary_loss(row, 18), LO, HI) for row in rows)
    require(short_gap > F(3, 100000), "19-dimensional witness")
    print("19-dimensional minimum certified excess:", short_gap)
    print("Minimum certified excess on [1/4, 2/5]:", gap, "on", tag)


def response_checks(rows):
    """One unimodular pair at each mass; both t-boxes cover all 29 rows."""
    mu_lo, mu_hi = F("0.8862"), F("0.8863")
    require(4*mu_hi**2 > F(355, 113), "upper bound on the Gaussian first moment")
    a = F(27, 100)
    fourth = 3 + F(6, 128)
    # E|Q| >= 1/sqrt(fourth); h's independent phase sign can realize each t.
    v2 = a*a*fourth/(EPS*mu_lo)**2
    require(v2 < 1 and F(5, 12)**2 < mu_lo**2*(1-v2), "unimodular sign feasibility")
    payoff = (1-EPS/8+3*ETA/64)*F(5,12)**2+a*a/EPS
    require(payoff < F(252,1000), "actual feasible payoff")
    exp_sum = F(1)
    term = F(1)
    for k in range(1, 19):
        term *= F(6, k)
        exp_sum += term
    require(exp_sum > 400 and F(108)/(400*mu_lo*8) < F(1,25),
            "Gamma tail in the scalar optimization")
    invroot = F(288676, 10**6)
    require(F(17,10)**2 < 3 < F(7,4)**2 and 12 < F(7,2)**2
            and mu_lo*(F(17,80) - F(2,25)) > F(1,16), "scalar derivative signs")
    for left, right in [(LO, F(3,8)), (F(3,8), F(5,12))]:
        margins = {}
        for row in rows:
            ell, beta, _, _ = map(F, row["row"].split(","))
            linear = [ell-2*beta, beta]
            raw = [6, -6, 1]
            # nu' / sqrt(12) = eta*t/16, (nu')^2 = 3(eta*t)^2/64
            h2 = (biased_inner(linear, linear)
                  + 2*abs(biased_inner(linear, raw))*ETA*right/16
                  + biased_inner(raw, raw)*3*(ETA*right)**2/(12*64))
            h = sqrt_upper(h2)
            # sqrt_upper minus one unit encloses the root from below.
            root_lo = sqrt_upper(h*h + fourth*a*a) - F(1,10**6)
            require(root_lo > h, "positive modulus increment")
            increment = (2*mu_lo/fourth)*(root_lo-h) - a*a/EPS
            if row["tag"] == "0.125L":
                mass_sq = ell*ell + 2*beta*beta
                require(mass_sq >= ETA**2, "norm cap for the first profile")
                mean_lo = ell-beta/2+3*ETA*left/64
                require(mean_lo > 0, "scalar lower estimate")
                mismatch = (2*sqrt_upper(mass_sq)-2*mu_lo*mean_lo
                            + 3*ETA*right**2/64)
            else:
                require(ell + min(-2*beta,4*beta) > ETA*F(7,4),
                        "positive profile on [0,6]")
                if beta >= 0:
                    lower = ell-2*beta-3*ETA*invroot
                else:
                    lower = ell+beta-3*ETA*invroot-beta*beta*F(7,2)/(4*ETA/16)
                require(lower > 0, "positive profile for nu >= eta/16")
                mismatch = 3*ETA*(mu_hi-left)**2/64
            margins[row["tag"]] = row_margin(row, increment-mismatch, left, right)
        gap = min(margins.values())
        require(gap > F(12,100000), "response-field obstruction")
        print(f"Actual pairs on [{left}, {right}]: least certified excess {gap} "
              f"on {min(margins, key=margins.get)}")



def check_small_mass():
    r = EPS / F(25, 31)
    n = F(47, 1953)
    c = 2*n + F(1, 2)
    mass = F(3798855002922010337121170986221578569,
             22939068096000000000000000000000000000)
    require(mass < F(166, 1000) and F(7064131, 10**7) < F(71, 100),
            "cubic witness input caps")
    require(r*c >= ETA and r <= 1 and 2*r*n <= ETA, "signs in the transfer")
    x0 = F(4, 25)
    def target(x):
        return F(2, 5)*x + F(7058083, 10**7)
    def small(x):
        return r*(c+F(166, 1000))+(1-r*c)*x
    def large(x):
        return r*F(71, 100)+ETA+(1-r-ETA)*x
    for x in (F(0), x0):
        require(small(x) < target(x), "first affine comparison")
    for x in (x0, F(1)):
        require(large(x) < target(x), "second affine comparison")
    print("Claim 3 crossover slacks:", target(x0)-small(x0), target(x0)-large(x0))
    rho = F(2287, 2500)
    buffer = EPS*rho**2 + ETA**2/(F(333, 106)*EPS)
    require(buffer < F(655227, 10**6), "reviewed Gaussian-buffer bound")
    require(F(355, 113) < 4*F(886227, 10**6)**2, "upper visible mass")


def value(row, t):
    ell, cap = row
    return t*t - 2*ell*t + cap


def envelope(rows, tags, left, right):
    """Every consecutive crossing is rational as all quadratics have leading coefficient one."""
    cuts = [left]
    for first, second in zip(tags, tags[1:]):
        l, c = rows[first]
        m, d = rows[second]
        require(l < m, "row slopes must be strictly ordered")
        cuts.append((d-c)/(2*(m-l)))
    cuts.append(right)
    maxima = {}
    for tag, a, b in zip(tags, cuts, cuts[1:]):
        require(a < b, f"empty or reversed active interval for {tag}")
        # To check which row attains the minimum it suffices to compare affine differences
        # at both endpoints. On that entire interval the active quadratic is convex.
        for t in (a, b):
            v = value(rows[tag], t)
            require(all(v <= value(rows[other], t) for other in tags), f"wrong active row {tag}")
        maxima[tag] = max(value(rows[tag], a), value(rows[tag], b))
    return cuts, maxima


def disjoint_eligible(rows, masses, cap, *, strict=False):
    """Each of these points requires its own row for the specified type of cap."""
    used = set()
    for t in masses:
        require(F(1, 4) <= t <= RIGHT, "test mass outside the interval")
        eligible = {tag for tag, row in rows.items()
                    if (value(row, t) < cap if strict else value(row, t) <= cap)}
        require(bool(eligible), f"no eligible row at {t}")
        require(used.isdisjoint(eligible), f"row reused at {t}")
        used.update(eligible)


def check_cover(rows, *, show_rooms=False):
    """Check P4 claim 4, two sparse plain covers, and their cardinality and cap bounds."""
    plain = {}
    original = {}
    for r in rows:
        tag = r["tag"]
        require(tag not in plain, f"duplicate tag {tag}")
        ell = F(r["row"].split(",")[0])
        plain[tag] = (ell, F(r["C_plain"]))
        original[tag] = (ell, F(r.get("C_stein", r["C_plain"])))
    tags = sorted(original, key=lambda tag: F(tag.removesuffix("L")))
    require(len(tags) == len(PUBLISHED_ROOMS) and sum("C_stein" in r for r in rows) == 5,
            "expected 29 rows with five Stein caps")
    t1 = F(7967, 125000)
    cuts, maxima = envelope(original, tags, t1, RIGHT)
    require(F(2, 5)*t1**2 + F(7058083, 10**7) <= ORIGINAL_CAP, "original small-t interval")
    require(max(maxima.values()) == ORIGINAL_CAP and ORIGINAL_CAP < TARGET, "original maximum")
    critical = tags.index("0.845")
    require(tags[critical+1] == "0.850" and cuts[critical+1] == CRITICAL_MASS and
            value(original[tags[critical]], CRITICAL_MASS) == ORIGINAL_CAP, "wrong maximizer")
    print(f"29-row envelope: B = {ORIGINAL_CAP}, t = {CRITICAL_MASS}")

    # Taking the table's rounded rooms as simultaneous allowances violates the cap.
    published = {tag: F(n, 10**6) for tag, n in zip(tags, PUBLISHED_ROOMS)}
    test = F(847596, 10**6)
    excess = min(value(original[tag], test) + published[tag] for tag in tags) - TARGET
    require(excess > 0, "control: nearest-rounded printed rooms should fail")
    print(f"Literal P4 table allowances fail at {test} by {excess}")
    # Round every room down to a multiple of 10^-6. This suffices on its original cell.
    for tag, vmax in maxima.items():
        room = TARGET - vmax
        allowed = F((room * 10**6).__floor__(), 10**6)
        require(0 <= allowed <= room < allowed + F(1, 10**6), "room rounded inward")
        if show_rooms:
            print(f"{tag}: allowed loss {allowed}, exact room {room}")

    left = F(1, 4)
    # Ledger 4.18(a), with its reviewed radius, covers t below 1/4.
    direct = F(9221, 10000)*left**2 + F(655227, 10**6)
    require(direct == F(2851433, 4000000) and direct < ORIGINAL_CAP, "direct small-t cover")
    _, eight_max = envelope(plain, EIGHT, left, RIGHT)
    _, six_max = envelope(plain, SIX, left, RIGHT)
    require(max(eight_max.values()) == ORIGINAL_CAP, "eight-row maximum")
    require(max(six_max.values()) == SIX_CAP == value(plain["0.860"], RIGHT), "six-row maximum")
    require(ORIGINAL_CAP < SIX_CAP < TARGET, "six-row cap must beat the strict target")
    disjoint_eligible(plain, [F(1,3), F(4,7), F(3,4), F(5,6), F(11,13), F(17,20),
                              F(6,7), F(23,26)], ORIGINAL_CAP)
    disjoint_eligible(plain, [F(".26"), F(".50"), F(".70"), F(".8116"), F(".845"),
                              F(".882")], TARGET)
    # Testing < SIX_CAP is essential: the last point is the six-row equality contact.
    disjoint_eligible(plain, [F(".26"), F(".50"), F(".70"), F(".81"), F(".84"), F(".854"),
                              RIGHT], SIX_CAP, strict=True)
    print(f"Minimum row counts on [1/4,{RIGHT}]: 8 at B, 6 at 500/701. "
          f"Optimal six-row cap = {SIX_CAP}.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--rooms", action="store_true", help="print all exact and downward-rounded original row allowances")
    args = parser.parse_args()
    here = Path(__file__).resolve().parent
    rows = json.loads((here.parent/"degree5-attack"/"rows2b.json").read_text(),
                      parse_float=str)["rows"]
    check_small_mass()
    check_obstruction(rows)
    response_checks(rows)
    check_cover(rows, show_rooms=args.rooms)
