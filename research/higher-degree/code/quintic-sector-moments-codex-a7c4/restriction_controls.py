"""Exact small-tensor controls for cubic compression. Agent-ID: codex-a7c4."""

from fractions import Fraction as Q
from itertools import permutations, product


def require(condition, message):
    if not condition:
        raise ValueError(message)


def tensor(slots):
    out = {}
    for indices, value in slots.items():
        for key in set(permutations(indices)):
            require(key not in out, "duplicate symmetric coordinate")
            out[key] = value
    return out


def certificate(f, dimension, remote):
    """Return the integer cumulant, slice data, and the compressed cumulant."""
    full = range(dimension)
    kept = range(remote)
    visible = range(remote, dimension)

    def at(i, j, k):
        return f.get((i, j, k), 0)

    def gram(i, j, rows):
        return sum(at(i, a, b) * at(j, a, b) for a, b in product(rows, repeat=2))

    def paired(i, j, k, l, rows):
        return sum(at(i, j, h) * at(k, l, h) for h in rows)

    def sym3(i, j, k, l, rows):
        return paired(i, j, k, l, rows) + paired(i, k, j, l, rows) + paired(i, l, j, k, rows)

    def cumulant(rows):
        matrix = sum(gram(i, j, rows) ** 2 for i, j in product(rows, repeat=2))
        quartic = sum(sym3(*indices, rows) ** 2 for indices in product(rows, repeat=4))
        return 1296 * matrix + 216 * quartic

    kappa, remote_kappa = cumulant(full), cumulant(kept)
    trace = sum(gram(v, v, full) for v in visible)
    visible_norm = sum(gram(v, w, full) ** 2 for v, w in product(visible, repeat=2))
    overlap = sum(
        sum(at(a, k, i) * at(k, b, v) for k in kept) ** 2
        for i, a, b in product(kept, repeat=3)
        for v in visible
    )
    cross = Q(sum(sym3(*idx, kept) * sym3(*idx, visible) for idx in product(kept, repeat=4)), 9)
    require(
        kappa - remote_kappa >= 1296 * visible_norm + 2592 * overlap,
        "compression with visible Gram and overlap",
    )
    return kappa, remote_kappa, trace, visible_norm, cross


def main():
    # Slots of f for F=12 sqrt(2) Re [(Y1+Z)Y2 conjugate(Y3)].
    # Each of the eight distinct-index monomials has coefficient ±6 in F.
    slots = {}
    for base in (0, 6):
        for i, j, k, sign in (
            (base, 2, 4, 1),
            (base + 1, 3, 4, -1),
            (base, 3, 5, 1),
            (base + 1, 2, 5, 1),
        ):
            slots[tuple(sorted((i, j, k)))] = sign
    f = tensor(slots)
    kappa, remote_kappa, trace, visible_norm, _ = certificate(f, 8, 6)
    require(
        Q(kappa, 12**4) == 36 and Q(remote_kappa, 12**4) == 9, "complex product fourth cumulants"
    )
    require(
        Q(18 * trace, 12**2) == 1 and Q(visible_norm, 12**4) == Q(1, 648),
        "complex visible occupation",
    )
    energy = Q(6 * sum(v * v for v in f.values()), 12**2)
    remote_energy = Q(6 * sum(v * v for key, v in f.items() if max(key) < 6), 12**2)
    x = remote_energy / energy
    j = Q(18 * trace, 12**2) / energy
    chi_remote = Q(2 * remote_kappa, 3 * 12**4) / remote_energy**2
    chi = Q(2 * kappa, 3 * 12**4) / energy**2
    require(energy == 2 and x == j == Q(1, 2) and chi_remote == 6, "complex sector normalization")
    cost = x**2 * chi_remote + Q(4, 3) * j**2
    require(chi == 6 and cost == Q(11, 6), "normalized mixed test")
    print(f"Complex mixed cubic: chi = {chi}, simultaneous debit = {cost}.")

    # g_012=1, and its extra visible slice is diag(1,1,-1).
    slots = {(0, 1, 2): 1, (0, 0, 3): 1, (1, 1, 3): 1, (2, 2, 3): -1}
    _, _, _, _, cross = certificate(tensor(slots), 4, 3)
    require(cross == Q(-4, 3), "noncommuting slice must have a negative cross term")
    print(f"Noncommuting mixed slices: symmetrized cross term = {cross}.")

    # Two anticommuting reflections. Their aggregated trace correction is zero.
    slices = (((1, 0), (0, -1)), ((0, 1), (1, 0)))

    def pairing(i, j, k, l):
        return sum(b[i][j] * b[k][l] for b in slices)

    sym_square = Q(
        sum(
            (pairing(i, j, k, l) + pairing(i, k, j, l) + pairing(i, l, j, k)) ** 2
            for i, j, k, l in product(range(2), repeat=4)
        ),
        9,
    )
    trace = sum(b[i][j] ** 2 for b in slices for i, j in product(range(2), repeat=2))
    require(sym_square == Q(trace**2, 6) == Q(8, 3), "sharp two-slice Gram square")

    # Given (A_j), Y_N is proper Gaussian with variance mean |A_j|².
    for n in (1, 2, 5, 19):
        expected_variance_squared = Q(2 * n + n * (n - 1), n * n)
        fourth_y = 2 * expected_variance_squared
        fourth_zy = 2 * fourth_y
        for x in (Q(0), Q(1, 3), Q(4, 5), Q(1)):
            h = 1 - x
            fourth_sum = x * x * 8 + h * h * fourth_zy + 4 * x * h
            require(
                fourth_sum - 2 == 6 * x * x + h * h * (2 + Q(4, n)),
                "independent remote cubic and one-visible diffuse family",
            )
    print("Two-slice Gram lower bound attained; finite-N sharpness family passed.")

    # Add independent removed components in reverse order, without normalization.
    # The last vector has unequal, positive and zero drops, exercising both bounds.
    cases = ([Q(2)], [Q(3, 8)] * 2, [Q(5, 9)] * 4, [Q(0), Q(1, 7), Q(5, 7)])
    for drops in cases:
        n = 7
        variance, fourth = Q(3, 2), Q(8) * Q(3, 2) ** 2
        remote_excess = fourth - 2 * variance**2
        stage_sum = Q(0)
        for drop in reversed(drops):
            old_excess = fourth - 2 * variance**2
            fourth += drop**2 * (4 + Q(4, n)) + 4 * variance * drop
            variance += drop
            stage = fourth - 2 * variance**2 - old_excess
            require(stage == (2 + Q(4, n)) * drop**2, "one normalized bath drop")
            stage_sum += stage
        sharp = 2 * sum(drops) ** 2 / len(drops)
        debit = 2 * sum(v * v for v in drops)
        require(
            fourth - 2 * variance**2 - remote_excess == stage_sum >= debit >= sharp,
            "complex-subspace telescope and basis-independent debit",
        )
        require((debit == sharp) == (min(drops) == max(drops)), "equal-drop sharpness")
    print("Subspace telescope passed for equal, unequal, and zero variance drops.")


if __name__ == "__main__":
    main()
