"""Exact controls for the one-spike sectors, compact domains and saddle order."""

import ast
from fractions import Fraction as F
from functools import cache
from itertools import product
from math import comb, factorial
from pathlib import Path


def check(condition, message):
    if not condition:
        raise ValueError(message)


def model_sectors():
    source = Path(__file__).resolve().parents[1] / "degree5-gate/pipeline/gate/spike2.py"
    module = ast.parse(source.read_text())
    # Load only the upstream index definitions; the full module imports the numerical engine.
    definitions = [
        node
        for node in module.body
        if (
            isinstance(node, ast.Assign)
            and isinstance(node.targets[0], ast.Name)
            and node.targets[0].id == "SECT"
        )
        or (isinstance(node, ast.FunctionDef) and node.name == "remote")
    ]
    check(len(definitions) == 2, "Expected SECT and remote in the model")
    scope = {"__builtins__": {"range": range}}
    exec(compile(ast.Module(definitions, []), str(source), "exec"), scope)
    return [(name, side, (a, b), scope["remote"](side, a, b)) for name, side, a, b in scope["SECT"]]


@cache
def wick(pair):
    a, b = pair
    return [
        (a - k, b - k, (-1) ** k * factorial(k) * comb(a, k) * comb(b, k)) for k in range(min(a, b) + 1)
    ]


@cache
def inner(left, right):
    # E[z^p conjugate(z)^q] is zero unless p=q, in which case it is p!.
    return sum(
        m * n * factorial(a + d) for a, b, m in wick(left) for c, d, n in wick(right) if a + d == b + c
    )


def verify_sectors():
    attackers = model_sectors()
    defenders = [("dh10", "h", (1, 0), (1, 1)), ("dh01", "h", (0, 1), (2, 0))]
    blocks = {1: set(), -1: set()}
    for name, side, visible, remote in attackers + defenders:
        a, b = visible
        p, q = remote
        for i, j, _ in wick(visible):
            for k, l, _ in wick(remote):
                check(i - j + k - l == 1, f"Wrong joint charge for {name}")
        check((a + p, b + q) in {(2, 1), (3, 2)}, f"Unexpected bidegree for {name}")
        branch_sign = 1 if side == "h" else -1
        blocks[-branch_sign * (-1) ** (a + b)].add(name)
    check(
        blocks[1] == {"p01", "p10", "p12", "p21", "p30", "p32", "rA", "rB", "dh10", "dh01"},
        "Reflection-even coefficient block",
    )
    check(
        blocks[-1] == {"p00", "p02", "p11", "p20", "p22", "p31", "rz", "rzb", "nu3"},
        "Reflection-odd coefficient block",
    )
    check(
        {name for name, _, _, remote in attackers if remote == (0, 0)} == {"p32", "nu3"},
        "Visible-only shifts",
    )
    check(len(attackers) == 17, "All attacker entries are distinct")
    for collection in (attackers, defenders):
        for i, j in product(range(len(collection)), repeat=2):
            _, _, z1, y1 = collection[i]
            _, _, z2, y2 = collection[j]
            norm = factorial(z1[0]) * factorial(z1[1]) * factorial(y1[0]) * factorial(y1[1])
            check(inner(z1, z2) * inner(y1, y2) == (norm if i == j else 0), "Wick orthogonality")


def verify_saddle():
    # A=diag(2,3), B=5, K=(1,-2)^T, g=(3,-2), h=1. Solve independently in each order.
    a11, a22, b, k1, k2, g1, g2, h = map(F, (2, 3, 5, 1, -2, 3, -2, 1))
    s11, s22, s12 = a11 + k1 * k1 / b, a22 + k2 * k2 / b, k1 * k2 / b
    r1, r2 = (g1 - k1 * h / b) / 2, (g2 - k2 * h / b) / 2
    det = s11 * s22 - s12 * s12
    x, z = (s22 * r1 - s12 * r2) / det, (s11 * r2 - s12 * r1) / det
    y = -(h + 2 * k1 * x + 2 * k2 * z) / (2 * b)
    y_other = -(h + k1 * g1 / a11 + k2 * g2 / a22) / (2 * (b + k1 * k1 / a11 + k2 * k2 / a22))
    check(
        (x, z, y)
        == ((g1 + 2 * k1 * y_other) / (2 * a11), (g2 + 2 * k2 * y_other) / (2 * a22), y_other),
        "Schur elimination orders disagree",
    )

    # Wrong-order control: x^2+4xy+y^2 has positive defender curvature and finite max-min.
    def indefinite(x, y):
        return x**2 + 4 * x * y + y**2

    for x in (-2, -1, 0, 1, 2):
        check(indefinite(x, -2 * x) == -3 * x * x, "Defender-first envelope")
    for y in (-2, 0, 2):
        curvature = indefinite(-1, y) + indefinite(1, y) - 2 * indefinite(0, y)
        check(curvature > 0, "Attacker-first supremum is unbounded")


def verify_domain():
    # A two-Lipschitz linear functional reaches the boundary of the shifted ellipsoid.
    weights = (F(1, 4), F(3, 4))
    slope = (F(6, 5), F(8, 5))
    shift = (F(-1, 2), F(0))
    optimum = tuple(w * g / 2 - u for w, g, u in zip(weights, slope, shift))
    check(sum(g * g for g in slope) == 4, "Lipschitz constant two")
    check(
        sum(((x + u) / w) ** 2 for x, u, w in zip(optimum, shift, weights)) == 1, "Sharp shifted radius"
    )
    check(
        sum((x / w) ** 2 for x, w in zip(optimum, weights)) > 1, "Omitting the shift loses the optimum"
    )

    def even_gain(x):
        return abs(1 + x) + abs(1 - x) - F(x * x, 3)

    check(
        even_gain(3) == even_gain(-3) > even_gain(0), "Parity alone does not remove a finite amplitude"
    )


if __name__ == "__main__":
    verify_sectors()
    verify_saddle()
    verify_domain()
    print(
        "17 attackers, 2 defenders; exact charges, parity blocks, Gram norms, Schur and radius controls passed."
    )
