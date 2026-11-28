"""Outward Gaussian scale envelope for the gA1 retained-spike witness. Agent-ID: codex-062a."""
import hashlib
import json
from fractions import Fraction
from functools import lru_cache
from math import factorial
from pathlib import Path

from flint import acb, arb, ctx

SOURCE = Path(__file__).resolve().parents[1] / "degree5-stage0/results/b/gA1/rows_all.lines"
DIGEST = "5a309ba46067edecd91ca3a08ad492f5958cf49a51817d1194c84afefe9af15e"
GATE_DIGEST = "95b1ca929e0937eaf01f0a2d4cad2a4b30fab5d7a0c02deffb2ef1a670b3a9e3"
ORDER = 12
S_MIN = Fraction(1, 32)
S_GATE = Fraction(23953, 100000)
BIN_SCALE = 256
HALF_BIN_BOUND = Fraction(1, 500)


def require(condition, message):
    if not condition:
        raise ValueError(message)


def ball(q):
    q = Fraction(q)
    return arb(q.numerator) / q.denominator


class Row:
    def __init__(self):
        data = SOURCE.read_bytes()
        require(hashlib.sha256(data).hexdigest() == DIGEST, "wrong gA1 source")
        row = json.loads(data.splitlines()[10], parse_float=Fraction)
        require(row["t"] == Fraction(".84") and row["c5"] == 0, "wrong gA1 witness")
        self.scale = row["sig"]
        gate_data = SOURCE.with_name("sp2_11.json").read_bytes()
        require(hashlib.sha256(gate_data).hexdigest() == GATE_DIGEST, "wrong gate file")
        gate = json.loads(gate_data, parse_float=Fraction)
        require(gate["rec"]["t"] == row["t"] and gate["rec"]["sig"] == self.scale and
                any(p["c"] == Fraction(1,10) and p["sig"] == S_GATE for p in gate["pts"]),
                "historical gate point absent")
        self.l, self.beta, self.nu, self.a, self.b = (
            ball(row[k]) for k in ("l", "beta", "nu5", "bA", "bB")
        )
        self.k = ball(1/row["e1"] - (row["bA"]**2 + row["bB"]**2)/row["eta"])
        self.pi = arb.pi()
        self.sqrtpi = self.pi.sqrt()
        self.sqrt2 = arb(2).sqrt()
        self.sqrt12 = arb(12).sqrt()
        require(self.k > (1 + self.a**2 + self.b**2).sqrt(), "scale radius exceeds one")
        require(self.nu > 0 and self.l > 2*self.beta and
                self.beta > 6*self.nu/self.sqrt12, "visible polynomial changes sign")

    def radial(self, r):
        t = r*r
        a = 1 - self.a*(t-1)
        b = -self.b*t/self.sqrt2
        visible = r*(self.l + self.beta*(t-2) + self.nu*(t*(t-6)+6)/self.sqrt12)
        return visible, (a-b)**2, 4*a*b, 2*self.pi*r*(-t).exp()

    def zero(self):
        return self.sqrtpi*(self.l-self.beta/2 + 3*self.nu/(4*self.sqrt12))


def complex_box(mid, half, expanded):
    if expanded:
        return acb(arb(mid, 3*half), arb(0, 2*half))
    return acb(arb(mid, half))


def magnitude(row, r, u):
    visible, axis, mixed, weight = row.radial(r)
    cosine = (row.pi*u/2).cos()
    m = visible*cosine
    d2 = axis + mixed*cosine**2
    if not d2.real > 0:
        return None
    d = d2.sqrt()
    z = m/d
    excess = (-(z*z).real.lower()).max(0)
    if not excess < 100*ball(S_MIN)**2:
        return None
    exponential = (excess/ball(S_MIN)**2).exp()
    return abs(weight)*(abs(m)*(1 + 2*abs(z.imag)/ball(S_MIN)*exponential) +
                        abs(d)*exponential)


def panels(row):
    factor = ball(Fraction(factorial(ORDER)**4, (2*ORDER+1)*factorial(2*ORDER)**2))
    budget = arb("4e-11")
    pending = [(0., 7., 0., 1.)]
    while pending:
        a, b, c, d = pending.pop()
        hr, hu = (b-a)/2, (d-c)/2
        r, u = a+hr, c+hu
        # Up to this depth all binary64 panel geometry is exact (initial widths 7 and 1).
        require(hr >= 7*2.0**-40 and hu >= 2.0**-40, "panel depth exceeds exact geometry")
        mr = magnitude(row, complex_box(r, hr, True), complex_box(u, hu, False))
        mu = magnitude(row, complex_box(r, hr, False), complex_box(u, hu, True))
        good_r = mr is not None and factor*mr < budget
        good_u = mu is not None and factor*mu < budget
        if good_r and good_u:
            yield a, b, c, d
        elif not good_r and (good_u or hr/7 >= hu):
            pending.extend([(a,r,c,d), (r,b,c,d)])
        else:
            pending.extend([(a,b,c,u), (a,b,u,d)])


class Rule:
    def __init__(self, row):
        self.row = row
        self.moments = {}
        self.total_weight = arb(0)
        self.far_linear = arb(0)
        self.far_weight = arb(0)
        rule = [arb.legendre_p_root(ORDER, j, weight=True) for j in range(ORDER)]

        @lru_cache(None)
        def radial(a, b):
            h = (b-a)/2
            values = []
            for x, w in rule:
                m, axis, mixed, weight = row.radial((a+h) + h*x)
                values.append((m, axis, mixed, weight*w*h))
            return values

        @lru_cache(None)
        def angles(a, b):
            h = (b-a)/2
            return [((row.pi*((a+h)+h*x)/2).cos(), w*h) for x, w in rule]

        self.count = 0
        radius = ball(HALF_BIN_BOUND)
        for a,b,c,d in panels(row):
            self.count += 1
            for m, axis, mixed, wr in radial(a,b):
                for co, wu in angles(c,d):
                    speed = (axis + mixed*co**2).sqrt()
                    x = m*co/speed
                    w = wr*wu*speed
                    require(w > 0 and x >= 0, "invalid quadrature node")
                    self.total_weight += w
                    if x > 8:
                        self.far_linear += w*x
                        self.far_weight += w
                        continue
                    index = round(float(x)*BIN_SCALE)
                    dx = x - arb(index)/BIN_SCALE
                    require(abs(dx) < radius, "uncertified bin membership")
                    if index not in self.moments:
                        self.moments[index] = [arb(0) for _ in range(6)]
                    moments = self.moments[index]
                    for j in range(6):
                        moments[j] += w
                        w *= dx

    def payoff(self, scale):
        require(S_MIN <= scale <= 1, "scale outside certified panel range")
        s = ball(scale)
        value = self.far_linear
        for index, moments in self.moments.items():
            x = arb(index)/BIN_SCALE
            v = x/s
            v2 = v*v
            gaussian = (-v2).exp() / self.row.sqrtpi
            slope = v.erf()
            coeff = (x*slope+s*gaussian, slope, gaussian/s,
                     -2*v*gaussian/(3*s**2), (2*v2-1)*gaussian/(6*s**3),
                     (3*v-2*v2*v)*gaussian/(15*s**4))
            value += sum(c*m for c,m in zip(coeff,moments))
        # Tensor quadrature, Taylor compression, discarded Gaussian smoothing, radial tail.
        error = (arb(7)*2*arb("4e-11") +
                 self.total_weight*ball(HALF_BIN_BOUND)**6/(30*self.row.sqrtpi*s**5) +
                 self.far_weight*arb(-64).exp() + arb("1e-14"))
        return value + arb(0,error)


def verify():
    ctx.prec = 96
    row = Row()
    tail = 4*row.pi*arb(-49).exp()*(49**3+3*49**2+6*49+6)
    require(tail < arb("1e-14") and row.l < 1 and 0 < row.beta < 1 and
            row.nu < arb(".1") and abs(row.a)<arb(".5") and abs(row.b)<arb(".5"),
            "radial tail assumptions")
    rule = Rule(row)
    print(f"{rule.count} panels, {len(rule.moments)} moment bins", flush=True)

    @lru_cache(None)
    def score(s):
        return (row.zero() if s == 0 else rule.payoff(s)) - row.k*ball(s)**2

    peak_lower = score(S_GATE).lower().min(score(row.scale).lower())
    require(score(S_GATE).lower() - score(Fraction(1,5)).upper() > arb("7e-5"),
            "off-peak control at scale .2")
    cap = arb("3e-9")
    pending = [(Fraction(0), S_MIN), (S_MIN,S_GATE), (S_GATE,Fraction(1))]
    leaves = 0
    while pending:
        a,b = pending.pop()
        upper = score(a).upper().max(score(b).upper()) + row.k*ball(b-a)**2/4
        if upper - peak_lower < cap:
            leaves += 1
            continue
        mid = (a+b)/2
        require(mid >= S_MIN and b-a > Fraction(1,10**8), "unresolved scale interval")
        pending.extend([(a,mid),(mid,b)])
    print(f"{leaves} scale intervals, {score.cache_info().misses} scores")
    print("gA1 t=.84: 0 <= diffuse scale slack < 3e-9 at the gate and full row scales")
    print("off-peak control: diffuse scale slack at .2 exceeds 7e-5")


if __name__ == "__main__":
    verify()
