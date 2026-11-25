"""Enclose two selector kernels in the absolutely summable coefficient norm. Agent-ID: codex-a7c4."""

from fractions import Fraction

import numpy as np
from flint import acb, arb, ctx


LAST_PHASE = 6000
RADIAL_TERMS = 1600
FREQUENCIES = 220
PREPROCESS_DEGREE = 1024
HEAD_LENGTH = 251
WORK_SCALE = 2**50
FREQUENCY_SCALE = 2**26
MOMENT_SCALE = 2**34
ROW_SCALE = 2**31
BINOMIAL_SCALE = 2**28
MASS_SCALE = 2**30
TAIL_SCALE = 2**24


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def floor(ball):
    return int(ball.floor().unique_fmpz())


def frequency_moments():
    """Enclose Re(c_t lambda_t^j) and upper-bound |lambda_t|^J for each frequency."""
    moments = np.empty((FREQUENCIES, RADIAL_TERMS), dtype=np.int64)
    tails = np.empty(FREQUENCIES, dtype=np.int64)
    for frequency in range(FREQUENCIES):
        t = arb(17 * (2 * frequency + 1)) / 100
        denominator = acb(1, -t) ** 2
        ratio = -t * t / denominator
        first = acb(0, -2 * t).exp() / denominator
        tail = (t * t / (1 + t * t)) ** RADIAL_TERMS
        tails[frequency] = -floor(-(tail * TAIL_SCALE).upper())
        for j in range(RADIAL_TERMS):
            if j % 16 == 0:
                current = first * ratio**j
            scaled = current.real * MOMENT_SCALE
            midpoint = floor(scaled.mid())
            require(abs(scaled - midpoint) < 2, "Arb moment enclosure")
            moments[frequency, j] = midpoint
            current *= ratio
    require(np.max(np.abs(moments)) < 2 * MOMENT_SCALE, "moment range")
    require(np.min(tails) >= 0 and np.max(tails) <= TAIL_SCALE, "geometric-tail range")
    return moments, tails


def cosine_power_weights():
    """Lower-bound the probabilities of |2 Bin(2k+1,1/2)−(2k+1)| in the retained bins."""
    weights = np.empty((LAST_PHASE + 1, FREQUENCIES), dtype=np.int64)
    current = np.zeros(FREQUENCIES, dtype=np.int64)
    current[0] = WORK_SCALE
    for k in range(LAST_PHASE + 1):
        weights[k] = current // (WORK_SCALE // FREQUENCY_SCALE)
        following = 2 * current
        following[0] += current[0]  # The signed frequency −1 folds to +1.
        following[1:] += current[:-1]
        following[:-1] += current[1:]
        current = following // 4
    require(np.min(weights) >= 0 and np.max(weights.sum(axis=1)) <= FREQUENCY_SCALE,
            "positive cosine-power subprobabilities")
    return weights


def selector_columns():
    """Return the two integer-derived heads and an allowance covering each head error and tail."""
    ctx.prec = 110
    # Each signed sum is bounded by its absolute sum, including intermediate integer partial sums.
    require(max(2 * FREQUENCY_SCALE * MOMENT_SCALE, 2 * ROW_SCALE * BINOMIAL_SCALE,
                2 * ROW_SCALE * MASS_SCALE, 625 * WORK_SCALE) < 2**63,
            "int64 product and accumulator budgets")
    moments, geometric_tails = frequency_moments()
    weights = cosine_power_weights()
    raw = (weights @ moments) // (FREQUENCY_SCALE * MOMENT_SCALE // ROW_SCALE)
    omitted_radial = weights @ geometric_tails
    require(np.max(np.abs(raw)) < 2 * ROW_SCALE, "signed raw coefficient range")

    names = ("unit", "linear")
    length = LAST_PHASE + RADIAL_TERMS + PREPROCESS_DEGREE + 2
    columns = {name: np.zeros(length, dtype=np.int64) for name in names}
    losses = {name: Fraction(0) for name in names}
    phase_mass = arb.pi() / 4
    included_mass = 0
    binomial = np.zeros(PREPROCESS_DEGREE + 1, dtype=np.int64)
    binomial[0] = 23 * WORK_SCALE // 25
    binomial[1] = 2 * WORK_SCALE // 25

    for k in range(LAST_PHASE + 1):
        degree = 2 * k + 1
        mass = floor((phase_mass * MASS_SCALE).lower())
        require(0 <= mass and arb(mass) / MASS_SCALE <= phase_mass, "scalar-phase lower mass")
        included_mass += mass
        require(included_mass <= MASS_SCALE, "partial scalar-phase mass")
        phase_mass *= arb(degree**2) / (4 * (k + 1) * (k + 2))

        missing = 1 - Fraction(int(weights[k].sum()), FREQUENCY_SCALE)
        radial_tail = Fraction(int(omitted_radial[k]), FREQUENCY_SCALE * TAIL_SCALE)
        raw_loss = missing + radial_tail + Fraction(2 * RADIAL_TERMS, MOMENT_SCALE) + Fraction(RADIAL_TERMS, ROW_SCALE)
        columns["unit"][k:k + RADIAL_TERMS] += mass * raw[k]
        losses["unit"] += Fraction(mass, MASS_SCALE) * raw_loss

        # R(x) = 23/25−(2/25)x. Its absolute coefficients are binomial probabilities.
        coeff = binomial[:min(degree, PREPROCESS_DEGREE) + 1] // (WORK_SCALE // BINOMIAL_SCALE)
        missed_polynomial = 1 - Fraction(int(coeff.sum()), BINOMIAL_SCALE)
        require(missed_polynomial >= 0 and coeff.min() >= 0, "preprocessor subprobabilities")
        support = np.flatnonzero(coeff)
        first, last = int(support[0]), int(support[-1])
        signed = coeff[first:last + 1].copy()
        signed[(first + 1) % 2::2] *= -1
        composed = np.convolve(raw[k], signed) // BINOMIAL_SCALE
        require(np.max(np.abs(composed)) < 2 * ROW_SCALE, "composed coefficient range")
        columns["linear"][k + first:k + first + len(composed)] += mass * composed
        losses["linear"] += Fraction(mass, MASS_SCALE) * (
            raw_loss + missed_polynomial + Fraction(len(composed), ROW_SCALE)
        )

        following = 529 * binomial
        following[1:] += 92 * binomial[:-1]
        following[2:] += 4 * binomial[:-2]
        binomial = following // 625

    result = {}
    scale = ROW_SCALE * MASS_SCALE
    for name, column in columns.items():
        total_error = losses[name] + 1 - Fraction(included_mass, MASS_SCALE)
        tail = Fraction(sum(abs(int(x)) for x in column[HEAD_LENGTH:]), scale)
        head = [Fraction(int(x), scale) for x in column[:HEAD_LENGTH]]
        result[name] = (head, total_error + tail)
    return result
