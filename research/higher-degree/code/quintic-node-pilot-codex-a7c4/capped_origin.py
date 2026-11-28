"""Exact positive-quintic origin node and its neighbouring nodes. Agent-ID: codex-a7c4."""
import argparse
import json
from fractions import Fraction as Q
from hashlib import sha256
from math import isqrt
from pathlib import Path

ROWS = Path("research/higher-degree/code/degree5-design/design-2026-11-25/certB_const/out/rows2c_final.json")
DIGEST = "8663bc7ffdc0bc0d452540b8244c893f907794ffd57830b64dab2793489b4457"


def require(test, reason):
    if not test:
        raise ValueError(reason)


def roots(x):
    scale = 10**18
    k = isqrt(x.numerator * scale**2 // x.denominator)
    lo, hi = Q(k, scale), Q(k + 1, scale)
    require(lo**2 <= x < hi**2, "outward square roots")
    return lo, hi


def arctan(x, k):
    return sum((-1)**j * x**(2*j + 1) / (2*j + 1) for j in range(k + 1))


def verify(root):
    data = (root / ROWS).read_bytes()
    require(sha256(data).hexdigest() == DIGEST, "production row digest")
    doc = json.loads(data)
    game = doc["game"]
    require((Q(game["eps1"]), Q(game["eta"])) == (Q(39, 50), Q(779, 10000)), "game")
    row, = (v for v in doc["rows"] if v["tag"] == "0.850")
    ell, beta, ba, bb = map(Q, row["row"].split(","))
    nu = Q(25, 2048)
    pi_lo = 16*arctan(Q(1,5),13) - 4*arctan(Q(1,239),4)
    pi_hi = 16*arctan(Q(1,5),14) - 4*arctan(Q(1,239),3)
    pi_root_lo, pi_root_hi = roots(pi_lo)[0], roots(pi_hi)[1]
    sqrt3_lo, sqrt3_hi = roots(Q(3))
    require(nu > 0 and beta >= sqrt3_hi*nu and ell >= 2*beta, "constant radial phase")
    origin_lo = pi_root_lo * (ell - beta/2 + sqrt3_lo*nu/8)
    origin_hi = pi_root_hi * (ell - beta/2 + sqrt3_hi*nu/8)
    average = 1 + ba + 3*ba**2/4 + 3*bb**2/8
    pmin = ell - 2*beta + sqrt3_lo*nu
    require(pmin > 0 and average > 0, "radial curvature bound")
    quadratic = pi_root_hi * average / pmin
    scale = 10**12
    for s, cap in ((Q(0), 1379708917873), (Q(1,2048), 1379709621511), (Q(1,256), 1379753950700)):
        hi = origin_hi + quadratic*s**2
        require((cap-1)/Q(scale) < hi < Q(cap,scale), "rounded upper bound")
        print(f"s={s}, {origin_lo*scale//1}/10^12 < Psi5(s,25/2048) < {cap}/10^12")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, default=Path.cwd())
    verify(parser.parse_args().root)
