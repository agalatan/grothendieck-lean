"""Exact checks for a cubic that escapes every one-holomorphic block projection.
Agent-ID: codex-a7c4. Run python3 -IB -O diagonal.py.
"""
from fractions import Fraction as F
from math import comb, factorial


def check(condition, message):
    if not condition:
        raise ArithmeticError(message)


def wick_moment(k):
    """E|Z(|Z|²-2)/sqrt(2)|^(2k); |Z|² is unit exponential."""
    terms = (
        comb(2 * k, j) * (-2) ** (2 * k - j) * factorial(k + j)
        for j in range(2 * k + 1)
    )
    return F(sum(terms), 2**k)


def complex_block(conjugate_anti):
    """Compute with powers of i only. P projects onto (1,i)/sqrt(2)."""
    # P_ij and (I-P)_ij have magnitude 1/2 in every position.
    p = ((0, -1), (1, 0))
    q = ((0, 1), (-1, 0))
    w = (0, 1)  # coefficient phases of the normalized diagonal tensor
    roots = ((1, 0), (0, 1), (-1, 0), (0, -1))
    real = imag = 0
    for i in range(2):
        for j in range(2):
            anti = -q[i][j] if conjugate_anti else q[i][j]
            power = -w[i] + w[j] + p[i][j] + q[i][j] + anti
            x, y = roots[power % 4]
            real += x
            imag += y
    # The two holomorphic orderings give the same term. Each matrix entry has
    # modulus 1/2 and the input coefficient pair contributes a further 1/2.
    check(imag == 0, "block energy must be real")
    return F(2 * real, 16)


def main():
    variance, fourth = wick_moment(1), wick_moment(2)
    check((variance, fourth) == (1, 44), "normalized Wick moments")
    excess = fourth - 2
    check(excess / 90 == F(7, 15), "ninety-coordinate shape")
    check(complex_block(True) == F(1, 2), "complex pair saturates the sharp bound")
    check(complex_block(False) == 0, "removing antiholomorphic conjugation changes the verdict")

    # Replace the twelve distinct-coordinate remote triples in the .47
    # relaxation example with 84 independent diagonal triples of the same shape.
    remote, mixed = F(".56"), F(".06")
    remote_shape = excess / 84
    check(remote_shape == F(1, 2), "same remote fourth excess")
    original_total = (remote_shape * remote**2 + 6 * mixed**2) / (remote + mixed)**2
    check(original_total == F(446, 961), "same full excess")
    # Fresh antiholomorphic labels remove the cross term under the partial trace.
    retained_ceiling = remote / 2 + mixed
    discarded_floor = remote + mixed - retained_ceiling
    check(retained_ceiling == F(".34") and discarded_floor == F(".28"),
          "physical energy obstruction")
    print("Normalized Wick moments 1, 44. At N=90, fourth excess 7/15.")
    print("Complex pair retains 1/2; the wrong conjugation gives 0.")
    print("N=84 mixed example preserves shape 446/961 and discards at least 0.28.")


if __name__ == "__main__":
    main()
