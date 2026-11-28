"""Numerical stress test of a fixed graded W3 pair. The quadrature has no error enclosure."""
from pathlib import Path
import argparse
import sys
import numpy as np

DEFAULT_ENGINE = Path(__file__).resolve().parents[3] / "research" / "higher-degree" / "code" / "primal-dual"


def phase(value):
    size = np.abs(value)
    return np.divide(value, size, out=np.ones_like(value), where=size > 0)


def score(nodes, engine):
    sys.path.insert(0, str(engine))
    from attack import grid_vars
    from gm2 import SPECS

    model = grid_vars(SPECS["W3"], 2, nodes, nodes, nodes)
    expected = [(0,((1,0),(0,0))), (1,((0,0),(1,0))), (1,((2,1),(0,0))),
                (2,((1,1),(1,0))), (2,((2,0),(0,1))), (2,((3,2),(0,0)))]
    if model.basis != expected:
        raise ValueError("W3 Hermite basis order changed")
    # Gauge-fixed and rounded generators, independent of nodes and of the debit under test.
    plus = np.array([81962, 22271, 20643, -344, -177, -331]) / 100000
    minus = plus * np.array([1,-1,1,-1,-1,1])
    nu = 47/2000
    fh, gh = np.zeros(model.nb, complex), np.zeros(model.nb, complex)
    identity = 0
    for start in range(0, nodes, 4):
        sl = slice(start, min(nodes, start+4))
        basis = model.T[0][:, sl]
        af, ag = model.evaluate(plus, T0=basis), model.evaluate(minus, T0=basis)
        f = phase(af)
        for _ in range(18):
            g = phase(ag+nu*f)
            f = phase(af+nu*g)
        fh += model.project(f, Tw0=model.Tw[0][:, sl])
        gh += model.project(g, Tw0=model.Tw[0][:, sl])
        identity += np.dot(model.vars[0].w[sl], (np.conj(f)*g) @ model.vars[1].w)
    c = model.pair_coeffs(fh,gh)
    tail = identity.real - sum(c)
    half = (fh-gh)/2
    p,q,r = model.energies(half)
    s = (1-identity.real)/2 - p - q
    print(f"nodes={nodes}, first half-sum norm={abs((fh[0]+gh[0])/2):.9f}, fifth cross={c[2]:.9f}")
    for debit in (.006,.02,.0235):
        payoff = c[0]-.764*c[1]+(nu-debit)*c[2]+nu*tail
        net = q-((1+nu)*p+(2*nu-debit)*s+debit*(s-r))/(.764-nu)
        print(f"d={debit:.4f} payoff={payoff:.10f} reciprocal={1/payoff:.10f} net cubic={net:.8f}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--nodes", type=int, nargs="+", default=[64,96,128])
    parser.add_argument("--engine", type=Path, default=DEFAULT_ENGINE)
    args = parser.parse_args()
    for n in args.nodes:
        if n <= 0 or n % 8:
            parser.error("radial grid size must be a positive multiple of eight")
        score(n, args.engine)
