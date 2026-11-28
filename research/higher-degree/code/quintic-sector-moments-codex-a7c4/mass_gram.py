"""Mass-priced conditional Gram inequalities for the capped degree-five witness.
Agent-ID: codex-a7c4. All arithmetic uses rational numbers.
"""

from dataclasses import dataclass
from fractions import Fraction as Q

EPS, ETA = Q(39, 50), Q(779, 10000)
SLOTS = ((0, 0), (1, 1), (2, 0), (1, 0), (0, 1), (2, 1))

# L, c in D_k=c+LT. The h trial coefficient is in millionths; the six k
# trial lists use the predecessor sector_gram convention of hundred-thousandths.
# Seven verified price floors follow in units of 1e-7: h then SLOTS order.
TRIALS = (
    (
        ".005",
        ".0002",
        -50890,
        ((-93132,), (-61094, -35349), (-28958,), (-45495,), (-45495,), (-44616, -53346)),
        (878426, 49066, 140715, 143971, 96371, 96371, 185563),
    ),
    (
        ".012",
        ".0005",
        -103333,
        ((-88962,), (-55491, -38171), (-24777,), (-41267,), (-41267,), (-39194, -57382)),
        (1015770, 109934, 310495, 327500, 217364, 217364, 408245),
    ),
    (
        ".025",
        ".0005",
        -166406,
        ((-87045,), (-49406, -42875), (-19928,), (-36391,), (-36391,), (-33015, -63161)),
        (1265500, 199318, 568591, 633461, 409378, 409378, 753570),
    ),
    (
        ".04",
        ".002",
        -209385,
        ((-74194,), (-40317, -45060), (-15604,), (-29764,), (-29764,), (-26355, -65363)),
        (1545803, 304133, 851918, 983580, 628033, 628033, 1131183),
    ),
    (
        ".06",
        ".01",
        -242142,
        ((-49315,), (-28082, -43042), (-11015,), (-20742,), (-20742,), (-18533, -62255)),
        (1907924, 507308, 1302794, 1514519, 985213, 985213, 1705814),
    ),
)


@dataclass(frozen=True)
class MassRow:
    constant: Q
    visible_price: Q
    remote_price: Q
    mass_price: Q
    sector_scale: Q


def require(ok, reason):
    if not ok:
        raise ValueError(reason)


def ends(gram, shift):
    scale = 10**18
    low = gram.stieltjes_lower(shift, 0, 256)
    high = (1 - gram.stieltjes_lower(shift, 1, 256)) / shift
    require(0 < low <= high, "positive Laguerre resolvent enclosure")
    return Q((scale * low).__floor__(), scale), Q((scale * high).__ceil__(), scale)


def make_rows(gram, legacy_weights):
    """Use #842's sector_gram module and its five *unscaled* sector weights."""
    require((gram.EPS, gram.ETA) == (EPS, ETA), "same degree-five witness")
    require(len(legacy_weights) == 5 and min(legacy_weights) > 0, "five positive weights")
    rows = []
    for raw_l, raw_c, h_trial, coefficients, expected in TRIALS:
        L, c = Q(raw_l), Q(raw_c)
        d = ETA - c
        require(L > 0 and 0 < d < ETA, "admissible conditional weights")
        sh, sk = ETA / L, c / L
        h = gram.average_price(ends(gram, sh), shift=sh, mass=L + ETA, trial=Q(h_trial, 10**6))
        brackets = ends(gram, sk)
        trials = dict(zip(SLOTS, coefficients))
        p = [gram.sector_price(*ij, brackets, shift=sk, mass=L + c, trials=trials) for ij in SLOTS]
        floors = tuple((10**7 * v).__floor__() for v in (h, *p))
        require(floors == expected, "rational mass-Gram prices")
        h, remote, *other = [Q(n, 10**7) for n in floors]
        s = min((v - remote) / w for v, w in zip(other, legacy_weights))
        require(0 < h < 1 and s > 0, "positive sector conversion")
        rows.append(MassRow(ETA + L, h, remote, d, s))
    return tuple(rows)


def normalized_charge(rows, t_hi, target, A_lo, A_hi, mass_at_lo, mass_at_hi):
    """Upper bound on sum_j legacy_weights[j]*x_j/A if V>=target.

    mass_at_lo, mass_at_hi are downward bounds from ONE globally applicable
    K >= slope*sqrt(A) - intercept witness, slope>=0, at A_lo and A_hi.
    Multiply by beta**2 only at the consuming spiked ray.
    """
    require(0 < A_lo <= A_hi and t_hi >= 0 and rows, "nonempty charge domain and bank")
    values = []
    for row in rows:
        base = row.constant + (1 - row.visible_price) * t_hi**2 - target
        endpoint = max(
            (base - row.mass_price * mass_at_lo) / A_lo, (base - row.mass_price * mass_at_hi) / A_hi
        )
        values.append((EPS - row.remote_price + endpoint) / row.sector_scale)
    return min(values)
