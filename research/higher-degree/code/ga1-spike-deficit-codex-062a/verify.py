"""Outward finite-spike deficit for gA1. Agent-ID: codex-062a."""
from fractions import Fraction
from functools import lru_cache
from math import comb
from pathlib import Path
from runpy import run_path

from flint import arb, arb_poly, ctx

SCALE = run_path(str(Path(__file__).resolve().parents[1] /
                     "ga1-diffuse-slack-codex-062a/verify.py"))
require = SCALE["require"]
ball = SCALE["ball"]
BIN_SCALE = 128
BIN_RADIUS = Fraction(1, 250)
PANEL_ERROR = Fraction(1, 10**11)
MAX_VISIBLE = 64
MAX_SHIFT = 6
MIN_WIDTH = Fraction(23, 100)


def folded_bound(max_abs, imag, real_distance):
    """Uniform over the two row scales and their residual Gaussian widths."""
    width = ball(MIN_WIDTH)
    exponent = ((imag**2 - real_distance**2) / width**2).max(0)
    if not exponent < 100:
        return None
    e = exponent.exp()
    return max_abs * (1 + 2*imag*e/width) + e


def visible_bound(row, r, u):
    m, axis, mixed, weight = row.radial(r)
    co = (row.pi*u/2).cos()
    d2 = axis + mixed*co**2
    if not d2.real > 0:
        return None
    speed = d2.sqrt()
    x = m*co/speed
    distance = (abs(x.real).lower() - MAX_SHIFT).max(0)
    bound = folded_bound(abs(x) + MAX_SHIFT, abs(x.imag).upper(), distance)
    if bound is not None:
        return abs(weight*speed)*bound
    return None


def remote_bound(row, scale, y, u):
    v = scale * y * (y*y - 2) * (row.pi*u).cos() / (10*row.sqrt2)
    bound = folded_bound(MAX_VISIBLE + abs(v), abs(v.imag).upper(), arb(0))
    if bound is not None:
        return abs(2*y*(-y*y).exp()) * bound
    return None


class Moments:
    """Six centered moments per lattice bin of a positive quadrature measure."""
    def __init__(self):
        self.bins = {}
        self.radius = ball(BIN_RADIUS)

    def add(self, x, weight):
        require(weight > 0, "nonpositive node weight")
        index = round(float(x) * BIN_SCALE)
        delta = x - arb(index)/BIN_SCALE
        require(abs(delta) < self.radius, "unverified bin center")
        if index not in self.bins:
            self.bins[index] = [arb(0) for _ in range(6)]
        for j in range(6):
            self.bins[index][j] += weight
            weight *= delta

    def polynomials(self):
        first = min(self.bins)
        last = max(self.bins)
        polys = [arb_poly([self.bins[i][j] if i in self.bins else 0
                           for i in range(first, last+1)]) for j in range(6)]
        return first, polys

    def mass(self):
        return sum(m[0] for m in self.bins.values())


def mapped_rule(order):
    nodes = [arb.legendre_p_root(order, j, weight=True) for j in range(order)]

    @lru_cache(None)
    def mapped(a, b):
        h = (b-a)/2
        return [((a+h) + h*x, h*w) for x, w in nodes]

    return mapped


def visible_nodes(row, rule):
    @lru_cache(None)
    def radii(a, b):
        result = []
        for r, w in rule(a,b):
            m, axis, mixed, weight = row.radial(r)
            result.append((m, axis, mixed, w*weight))
        return result

    @lru_cache(None)
    def angles(c, d):
        return [((row.pi*u/2).cos(), w) for u, w in rule(c,d)]

    measure = Moments()
    for a,b,c,d in SCALE["panels"](lambda r,u: visible_bound(row,r,u), ball(PANEL_ERROR)):
        for m, axis, mixed, wr in radii(a,b):
            for co, wu in angles(c,d):
                speed = (axis + mixed*co**2).sqrt()
                x = m*co/speed
                require(x >= 0 and x < MAX_VISIBLE, "visible node outside remote bound")
                measure.add(x, wr*wu*speed)
    require(measure.mass() < 4, "visible quadrature mass")
    return measure


def remote_nodes(row, scale, rule):
    @lru_cache(None)
    def radii(a, b):
        return [(scale*y*(y*y-2)/(10*row.sqrt2), 2*w*y*(-y*y).exp())
                for y,w in rule(a,b)]

    @lru_cache(None)
    def angles(c, d):
        return [((row.pi*u).cos(), w) for u,w in rule(c,d)]

    measure = Moments()
    for a,b,c,d in SCALE["panels"](lambda y,u: remote_bound(row,scale,y,u), ball(PANEL_ERROR)):
        for size, wy in radii(a,b):
            for co, wu in angles(c,d):
                measure.add(size*co, wy*wu)
    mean = arb(0)
    second = arb(0)
    for index, (m0, m1, m2, *_) in measure.bins.items():
        center = arb(index)/BIN_SCALE
        mean += center*m0 + m1
        second += center*center*m0 + 2*center*m1 + m2
    require(abs(measure.mass()-1) < arb("1e-12"), "remote mass control")
    require(abs(mean) < arb("1e-12") and abs(second-scale**2/200) < arb("1e-12"),
            "projected spike mean and variance control")
    return measure


def convolve(left, right):
    li, lp = left.polynomials()
    ri, rp = right.polynomials()
    polys = [sum(comb(j,k) * lp[k] * rp[j-k] for k in range(j+1))
             for j in range(6)]
    length = len(polys[0])
    require(all(len(p) <= length for p in polys), "inconsistent moment support")
    return ((li+ri+i, [p[i] for p in polys]) for i in range(length))


def fold(measure, width, mass, radius, row):
    value = arb(0)
    for index, moments in measure:
        coeff = SCALE["folded_coefficients"](arb(index)/BIN_SCALE, width, row.sqrtpi)
        value += sum(c*m for c,m in zip(coeff, moments))
    error = mass * ball(radius)**6 / (30*row.sqrtpi*width**5)
    return value + arb(0,error)


def convolution_control(row):
    # Compare the complete bin calculation with direct paired averages, including signs.
    left = [(ball(Fraction(1, 3)), arb(2)), (ball(Fraction(2, 3)), arb(3))]
    right = [(-ball(Fraction(1, 3)), arb(5)), (ball(Fraction(1, 5)), arb(7))]
    a, b = Moments(), Moments()
    for x, w in left:
        a.add(x, w)
    for x, w in right:
        b.add(x, w)
    width = arb(".24")
    approx = fold(convolve(a,b), width, a.mass()*b.mass(), 2*BIN_RADIUS, row)
    exact = arb(0)
    for x, wx in left:
        for y, wy in right:
            v = (x+y)/width
            exact += wx*wy*((x+y)*v.erf() + width*(-(v*v)).exp()/row.sqrtpi)
    require(approx.contains(exact) and approx.rad() < arb("1e-8"),
            "signed convolution and Taylor control")


def verify():
    ctx.prec = 96
    row = SCALE["Row"]()
    convolution_control(row)
    require(row.zero() < 4 and row.pi*(1+row.a**2+row.b**2).sqrt() < 4,
            "expected projection and speed bounds")
    require(row.l < 1 and 0 < row.beta < 1 and row.nu < arb(".1")
            and abs(row.a) < arb(".5") and abs(row.b) < arb(".5"), "visible tail coefficients")
    tail_r = 4*row.pi*arb(-49).exp()*(49**3+3*49**2+6*49+6)
    tail_y = 5*arb(-49).exp()*(49**2+2*49+2)
    require(tail_r < arb("1e-14") and tail_y < arb("1e-14"), "radial tails")
    scales = [ball(SCALE["S_GATE"]), ball(row.scale)]
    residual = (arb(99)/100).sqrt()
    for s in scales:
        require(s*residual > ball(MIN_WIDTH) and s < arb(".24") and
                s*7*47/(10*row.sqrt2) < MAX_SHIFT, "scale and remote shift bounds")
    rule = mapped_rule(SCALE["ORDER"])
    visible = visible_nodes(row, rule)
    panel = 14*ball(PANEL_ERROR)
    for s in scales:
        remote = remote_nodes(row, s, rule)
        diffuse = fold(visible.bins.items(), s, visible.mass(), BIN_RADIUS, row)
        spike = fold(convolve(visible, remote), s*residual,
                     visible.mass()*remote.mass(), 2*BIN_RADIUS, row)
        error = (2+visible.mass())*panel + 2*tail_r + tail_y
        deficit = diffuse - spike + arb(0,error)
        require(deficit > arb("1.728e-6") and deficit < arb("1.732e-6"),
                f"deficit outside target: {deficit}")
        print(f"sigma={s.str(14)}: {deficit.str(12)}", flush=True)


if __name__ == "__main__":
    verify()
