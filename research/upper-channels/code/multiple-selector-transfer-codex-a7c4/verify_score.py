"""Enclose finite and diffuse Fourier scores for multiple quadratic selectors. Agent-ID: codex-a7c4."""

from flint import arb, acb, ctx


def require(value, message):
    if not value:
        raise ArithmeticError(message)


def cosine_coefficients():
    half = arb(1) / 2
    pi = arb.pi()
    size = 256
    angles = [2 * pi * k / size for k in range(size)]
    samples = []
    for angle in angles:
        q = angle.cos()
        samples.append(pi / 4 * q * (-q*q).hypgeom_2f1(half, half, 2))
    coeff = {}
    for m in range(1, 82, 2):
        # Both sides of the alias sum, with twice the complex coefficient's bound.
        alias = 8 * (-arb(size-m)/2).exp() / (1-(-arb(size)/2).exp())
        mid = 2 * sum(v * (m*x).cos() for v, x in zip(samples, angles)) / size
        coeff[m] = mid + arb(0, alias.upper())
    tail = 4 * (-arb(83)/2).exp() / (1-arb(-1).exp())
    return coeff, arb(0, tail.upper())


def finite_score(coeff, tail, baths, a):
    result = arb(0)
    for m, value in coeff.items():
        t = a*m
        psi = acb(0, -2*t).exp() / acb(1-2*t*t, -2*t)
        result += value * (psi**baths).real
    return result + tail


def main():
    ctx.prec = 100
    coeff, tail = cosine_coefficients()
    controls = (
        (1, arb(1)/5, "0.71238639", "0.71238640"),
        (3, arb(17)/100, "0.71312555", "0.71312557"),
        (12, arb(7)/50, "0.71528556", "0.71528557"),
    )
    for dim, a, lo, hi in controls:
        value = finite_score(coeff, tail, dim, a)
        require(arb(lo) < value < arb(hi), "finite alternating score")
        print(f"{dim} selector(s): {value}")
    require(all((m**3-m)%24 == 0 for m in coeff), "cubic phase parity")
    limit = sum(v * (-1)**((m**3-m)//24) for m, v in coeff.items()) + tail
    require(arb("0.74366907") < limit < arb("0.74366908"), "diffuse score")
    print(f"Limiting alternating score: {limit}")


if __name__ == "__main__":
    main()
