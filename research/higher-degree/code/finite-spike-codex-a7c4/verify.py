"""Global curvature of the finite g84 three-coefficient objective. Agent-ID: codex-a7c4."""

import argparse
from fractions import Fraction as F
from functools import lru_cache
from hashlib import sha256
import json
from math import comb, factorial, isqrt
from pathlib import Path

ROW_PATH = Path(
    "research/higher-degree/code/degree5-stage0/results/b/g84/rows_all.lines"
)
ROW_SHA256 = "ae102696fb1e62265aa879d598491a43e03a24376a72d8eed17ac8c744b1c4c3"


def require(condition, message):
    if not condition:
        raise ValueError(message)


def value(p, x):
    result = 0
    for coefficient in reversed(p):
        result = coefficient + result * x
    return result


def multiply(p, q):
    result = [F(0)] * (len(p) + len(q) - 1)
    for i, a in enumerate(p):
        for j, b in enumerate(q):
            result[i + j] += a * b
    return result


def moment(p):
    return sum(a * factorial(i) for i, a in enumerate(p))


def reciprocal_integral(w, a, b, n):
    """Majorize E[w(T)/(a+bT)], T standard exponential, using a nonnegative residual."""
    require(a > 0 and b > 0, "denominator must be positive on the entire ray")
    r = a / b
    L = [F((-1) ** i * comb(n + 2, n - i), factorial(i)) for i in range(n + 1)]
    scale = r * value(L, -r) ** 2
    require(scale > 0, "Laguerre polynomial vanished at the negative pole")
    numerator = [F(1)] + [x / scale for x in multiply(L, L)]
    q = [F(0)] * (len(numerator) - 1)
    for i in range(len(q) - 1, -1, -1):
        q[i] = (numerator[i + 1] - (a * q[i + 1] if i + 1 < len(q) else 0)) / b
    require(
        scale > 0 and multiply([a, b], q) == numerator,
        "global polynomial majorant identity failed",
    )
    return moment(multiply(w, q))


def diagonals(row):
    bA, bB = row["bA"], row["bB"]
    require(
        row["eta"] == F(".2552")
        and row["e1"] == F(".84")
        and bA < 0
        and bB < 0
        and row["sig"] > 0,
        "unexpected row parameters",
    )
    intercept = 1 + bA
    lo, hi = F(".70710678"), F(".70710679")
    require(lo * lo < F(1, 2) < hi * hi, "inverse square root enclosure")
    plus = -bA - bB * lo
    minus = -bA + bB * hi
    nu2 = tuple(multiply([0, F(1, 12)], multiply([6, -6, 1], [6, -6, 1])))
    radial = (0, 1)
    require(moment(nu2) == moment(radial) == 1, "visible modes must be normalized")

    @lru_cache(None)
    def integral(w, b):
        return min(reciprocal_integral(w, intercept, b, n) for n in (6, 10, 14))

    def cos2(w):
        return (3 * integral(w, plus) + integral(w, minus)) / 8

    def sin2(w):
        return (integral(w, plus) + 3 * integral(w, minus)) / 8

    b = (integral(radial, plus) + integral(radial, minus)) / 4
    return ((cos2(nu2), cos2(radial), b), (sin2(nu2), sin2(radial), b))


def sqrt_floor(x, den=10**10):
    return F(isqrt(x.numerator * den * den // x.denominator), den)


def fixed_constants():
    # Machin's identity, arctan alternating upper/lower truncations.
    def atan(x, n):
        return sum((-1) ** j * x ** (2 * j + 1) / (2 * j + 1) for j in range(n + 1))

    require(
        16 * atan(F(1, 5), 6) - 4 * atan(F(1, 239), 1) < F("1.77246") ** 2,
        "sqrt(pi) upper",
    )
    require(1 + F(1, 2) + F(1, 8) > F(8, 5), "1-exp(-1/2)>3/8")
    require(
        F(1, 2) - F(1, 7) > 0 and (F(1, 2) - F(1, 7)) ** 2 > F(2, 16),
        "angular Gram floor",
    )
    e4upper = sum(F(4) ** i / factorial(i) for i in range(21)) + F(4) ** 21 / factorial(
        21
    ) / (1 - F(4, 22))
    p = multiply((0, 0, F(1, 6)), multiply((-3, 1), (-3, 1)))
    mass_pay = sum(
        a * factorial(i) * sum(F(4) ** j / factorial(j) for j in range(i + 1))
        for i, a in enumerate(p)
    )
    require(
        moment(p) == 1 and mass_pay == F(103, 3) and mass_pay / e4upper > F(31, 50),
        "retained remote tail",
    )
    return F(3, 8) * F(1, 7) * F(31, 50)


def cap(real, imag, sigma, c_low, c_high, tail, complex_coefficients):
    require(0 <= c_low <= c_high < 1, "ordered spike interval")
    avail = min(F(1), 16 * c_low * c_low / (1 - c_low * c_low))
    nu, A, B = (
        tuple(max(x, y) for x, y in zip(real, imag)) if complex_coefficients else real
    )
    return (
        2
        * F("1.77246")
        * max(nu, A, B * (1 - tail * avail))
        / (sigma * sqrt_floor(1 - c_high * c_high))
    )


def replay(root):
    data = (root / ROW_PATH).read_bytes()
    require(sha256(data).hexdigest() == ROW_SHA256, "g84 row data changed")
    rows = {
        r["t"]: r for r in (json.loads(s, parse_float=F) for s in data.splitlines())
    }
    tail = fixed_constants()
    cases = [
        (".80", "0", ".75", False, "7.646"),
        (".80", "0", ".73", True, "7.712"),
        (".85", "0", ".20", False, "7.786"),
        (".85", ".20", ".30", False, "7.821"),
    ]
    co = {t: diagonals(rows[t]) for t in (F(".80"), F(".85"))}
    for T, l, h, complex_coefficients, budget in cases:
        t, l, h, budget = map(F, (T, l, h, budget))
        row = rows[t]
        out = cap(*co[t], row["sig"], l, h, tail, complex_coefficients)
        require(out < budget < 2 / row["eta"], f"failed curvature at {T} on [{l},{h}]")
        margin = 2 / row["eta"] - budget
        displayed = (10**6 * margin.numerator) // margin.denominator
        print(
            f'{T}, c in [{l}, {h}], {"complex" if complex_coefficients else "real"}: Hessian < {budget}; concavity > {displayed}/10^6'
        )
    # The difficult rectangle genuinely uses both the paired signs and the restricted c interval.
    t = F(".85")
    row = rows[t]
    require(
        cap(*co[t], row["sig"], F(".2"), F(".3"), 0, False) > 2 / row["eta"],
        "removed paired discount control",
    )
    require(
        cap(*co[t], row["sig"], 0, F(".3"), tail, False) > 2 / row["eta"],
        "removed lower spike endpoint control",
    )
    require(
        cap(*co[t], row["sig"], F(".2"), F(".3"), tail, True) > 2 / row["eta"],
        "complex overextension control",
    )
    print("Three overextension/removal controls passed.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path)
    opt = parser.parse_args()
    root = opt.root or next(
        (d for d in Path(__file__).resolve().parents if (d / ROW_PATH).is_file()), None
    )
    if root is None:
        parser.exit(2, "supply --root pointing to the repository\n")
    replay(root)
