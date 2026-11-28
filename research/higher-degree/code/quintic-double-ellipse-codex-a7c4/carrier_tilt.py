"""Gaussian carrier translation and its tilted support bound. Agent-ID: codex-a7c4."""

from fractions import Fraction as F


def verified_carrier(repo, load):
    """Refine the original polygon proof at the same Gaussian axis."""
    polygon = load(
        "tilted_carrier_polygon",
        repo
        / "research/higher-degree/code/cubic-carrier-ellipse-codex-a7c4/verify_polygon.py",
    )
    if polygon.A != F(179, 200):
        raise ValueError("ellipse axis")
    polygon.N_EDGES = 256
    polygon.Z_DEN = 256
    table = polygon.normal_support()
    edges = polygon.polygon_edges()
    intervals = 400
    den = intervals * polygon.M**2
    least = None
    for j in range(3 * intervals):
        slope = intercept = 0
        for dy, sd in edges:
            numer = (2 * j + 1) * dy * polygon.Z_DEN
            divisor = 2 * intervals * sd
            idx = min(4 * polygon.Z_DEN, (2 * numer + divisor) // (2 * divisor))
            a, b = table[idx]
            slope += dy * a
            intercept += sd * b
        for i in (j, j + 1):
            gain = (i * slope + intervals * intercept) ** 2 - i * i * polygon.M**4
            least = gain if least is None else min(least, gain)
    c = F(".862040")
    if not c * c < F(least, den * den) < F(".862041") ** 2:
        raise ValueError("polygon endpoints and next coefficient control")
    if not 36 * (polygon.A**2 - c**2) > 3 * polygon.A**4:
        raise ValueError("uniform Gaussian tail")
    return c


def energy_cap(proof, floor, au, y0, y1, x0, x1, alpha, cross, refined):
    """Use any 0<alpha<=2.  x0,x1 are endpoints of c²t²."""
    j = proof.j
    if not 0 < alpha <= 2:
        raise ValueError("monotone energy root")
    left, right = alpha**2 * x0, alpha**2 * x1
    wl = left / (au + left)
    wh = right / (floor + right)
    s = y1 * y1
    high = j.up(
        min(F(42), j.quadratic_max(s + proof.tail - cross, cross - 2 * s, s, wl, wh))
    )
    s = y0 * y0
    low = j.down(-j.quadratic_max(-s - proof.tail, 2 * s, -s, wl, wh))
    if not 0 <= low <= high:
        raise ValueError("tilted excess bounds")

    def upper(rows):
        values = [p for a, b, p in rows if a <= 3 * high / 2 and b >= 3 * low / 2]
        if not values:
            raise ValueError("missing tilted real excess interval")
        return max(values)

    u = min(proof.rho**2, proof.mu2 * (1 + j.RATE * high) ** 2, upper(proof.rows))
    if refined and 3 * high / 2 < proof.refined_end:
        u = min(u, upper(proof.refined))
    if alpha == 1:
        return j.up(u - x0)
    disc = u * (u + 4 * alpha * (alpha - 1) * x0)
    if disc < 0:
        return F(0)
    return j.up((u - 2 * alpha * x0 + j.sqrt_hi(disc)) / 2)
