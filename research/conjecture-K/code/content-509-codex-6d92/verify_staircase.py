#!/usr/bin/env python3
"""Refs #509. Agent ID: codex-6d92, upper-banks.
Replay with python-flint 0.9 and the repository checkout path. The October
profile/moment caps are inherited. The gemini-5331 witnesses from #518
at b18e47309 are checked afresh.
"""
from collections import defaultdict
from fractions import Fraction as Q
from functools import lru_cache
from math import comb
from pathlib import Path
from itertools import pairwise
import hashlib
import json
import sys

from flint import acb, arb, arb_mat, ctx

sys.dont_write_bytecode = True
if not __debug__:
    raise RuntimeError("Assertions must be enabled.")

if len(sys.argv) != 2:
    raise SystemExit("usage: python3 -I verify_staircase.py /path/to/grothe")

ROOT = Path(__file__).resolve().parent
GROTHE = Path(sys.argv[1])
ARCHIVE = GROTHE / "research/conjecture-K/code/audit-2026-11-15-codex-a7c4/remote_stein_original"
CHECKER_HASHES = {
    "check_stein.py": "669688428045a2564a44680a62bdfca9277494c96b98155acc772691a21b8328",
    "exact.py": "8149a1b17c054c58461f36a8a2e030a2c324041c4b18d9e2e6eef72185e94145",
}
for filename, want in CHECKER_HASHES.items():
    actual = hashlib.sha256((ARCHIVE / filename).read_bytes()).hexdigest()
    assert actual == want, (filename, actual, want)
sys.path.insert(0, str(ARCHIVE))
from check_stein import check_node, load_caps
from exact import bernstein

C6 = Q(4045313,100000)
PRICE = Q(2500,1891)
KAPPA = Q(6,25)
S_LOWER = Q("1.3739535256614")
TARGET = S_LOWER + Q(1,10000)
CAP_HASHES = {
    'profile-caps.json':'01c2e2a7b4af452ce8729ec47cb0cd2c3aa7e1368c6b58336270c2a19b349514',
    'moment-boxes.json':'cef37c2a66eacd66296add7ed2efc5a8d6afc336d2ed614102de08429d449695',
}
TOP = Q(".0463")
RATES = (("5.38418435830","5.38418441830"),("17.03316035229","17.03316041229"),("39.73263774101","39.73263780101"))
WEIGHTS = tuple(map(Q, (".276113", "1.561297", ".315457", ".006316")))
RAD_CELLS = 400

ctx.prec = 140
A, B = arb(699)/1250, arb(179)/1250
TOL = arb("1e-27")


def ball(x):
    x = Q(x)
    return arb(x.numerator) / x.denominator


def atomic_moments():
    # Let l(s) solve s=l(a+b*l)^2. For f_A(s)=e^-l/(a+b*l)^2,
    # (-d/ds)^j f_A has coefficients in the dictionary below.
    # Substituting s=x^2(a+b*x^2)^2 into its Abel integral gives
    # the factor (a+3 b x^2). The angular moment cancels in m_j.
    coefficients = {(2, 0): arb(1)}
    moments = []
    for j in range(1, 8):
        nxt = defaultdict(arb)
        for (p, q), value in coefficients.items():
            nxt[p+1, q+1] += value
            if p:
                nxt[p+2, q+1] += value*p*B
            if q:
                nxt[p+1, q+2] += value*3*q*B
        coefficients = nxt

        def integrand(x, analytic):
            t = x*x
            a, b3 = A+B*t, A+3*B*t
            return (-t).exp() * sum(v*a**(-p)*b3**(1-q) for (p,q),v in coefficients.items())

        moment = sum(acb.integral(integrand, arb(k)/4, arb(k+1)/4,
                                  abs_tol=TOL, rel_tol=TOL, eval_limit=100000).real for k in range(32))
        cap = sum(v*(3*A**(1-p) if q == 0 else A**(1-p-q)) for (p,q),v in coefficients.items())
        mom_tail = cap * arb(-64).exp() / 16
        moment += arb(mom_tail / 2, mom_tail / 2)
        moments.append((arb(3)/8) * moment)
    return moments


def certify_rates():
    m = atomic_moments()
    gram = arb_mat([[m[i+j+1] for j in range(3)] for i in range(3)])
    coef = gram.solve(arb_mat(3, 1, m[4:7]))

    def poly(z):
        return z**3-sum(coef[i,0]*z**i for i in range(3))

    intervals = []
    for i,(lo,hi) in enumerate(RATES):
        lo,hi = ball(lo),ball(hi)
        assert 0 < lo < hi and (i == 0 or intervals[-1] < lo)
        assert (-1)**i * poly(lo) < 0 < (-1)**i * poly(hi)
        intervals.append(lo.union(hi))
    weights = []
    for i,x in enumerate(intervals):
        y,z = [r for j,r in enumerate(intervals) if i != j]
        weights.append((m[3]-(y+z)*m[2]+y*z*m[1])/(x*(x-y)*(x-z)))
    weights.insert(0,m[0]-sum(weights))
    assert all(0 < weight < ball(upper) for weight,upper in zip(weights, WEIGHTS))


@lru_cache(maxsize=None)
def content_factor(energy):
    # Four-node left Radau for the completely monotone function of lambda.
    # Substitute z=(j/N)^(3/2), so beta mass differences are rational.
    weights_and_rates = zip(WEIGHTS[1:], (Q(lo) for lo,_ in RATES))
    value = ball(WEIGHTS[0])
    for w, rate in weights_and_rates:
        t = ball(energy*rate)
        N = RAD_CELLS
        subtotal = arb(0)
        for j in range(1,N+1):
            y = 1 + t * (1-ball(Q(j,N)**3))
            subtotal += ball(Q(2*j-1,N*N)) / (y*y*y.sqrt())
        value += ball(w)*subtotal
    ka = (3*arb(6).sqrt()/4) * value**2
    up = Q(int((ka*1000000).upper().ceil().unique_fmpz()),1000000)
    assert ka < ball(up)
    return up


def load_banks():
    for name, want in CAP_HASHES.items():
        assert hashlib.sha256((ARCHIVE / name).read_bytes()).hexdigest() == want
    caps = load_caps()
    assert caps[0][0] == 0 and all(a[1] == b[0] for a,b in pairwise(caps))
    moment = [tuple(map(Q,row["coefficients"])) for row in json.loads((ARCHIVE / "moment-boxes.json").read_text())]
    dual = json.loads((ROOT / "stein-bank.json").read_text())
    models = defaultdict(list)
    for row in dual["models"]:
        result, _ = check_node(dict(row, knots=dual["knots"]),caps,depth=20)
        assert result
        v = Q(row["v"])
        models[v].append(tuple(map(Q,row["coefficients"])))
    assert sorted(models) == list(map(Q,dual["energies"]))
    assert all(p[3] >= 0 for p in moment)
    return moment, models


def verify_partition(boxes, lo, hi, xlo, xhi):
    assert all(lo <= a < b <= hi and xlo <= c < d <= xhi for a,b,c,d in boxes)
    edges = sorted({lo, hi} | {u for a,b,_,_ in boxes for u in (a,b)})
    for left, right in pairwise(edges):
        intervals = sorted((c,d) for a,b,c,d in boxes if a <= left < right <= b)
        assert intervals and intervals[0][0] == xlo and intervals[-1][1] == xhi
        assert all(a[1] == b[0] for a,b in pairwise(intervals))


def value(polynomial, u):
    out = Q(0)
    for c in reversed(polynomial):
        out = c + u*out
    return out


SQRT_INFLUENCE = Q(49,12)
TAIL_EDGE = Q(25,6)
assert SQRT_INFLUENCE**2 > Q(50,3)
assert TAIL_EDGE**2 > Q(52,3)
assert Q(931,1000)**2 > Q(13,15)


def scaled_content(x, case, tau=None):
    # C^2/(K_A(u)u^3), using the directional bound with VarGamma retained.
    if tau is not None:
        return SQRT_INFLUENCE*tau*(x*x/2+Q(26,3)*tau)
    if case == "cubic":
        return Q(931,1000)*x**3
    if case == "directional":
        return SQRT_INFLUENCE*x*x
    assert case == "tail"
    return SQRT_INFLUENCE*(x*x/2+Q(26,3))


def moment_poly(p,x,ka,case,tau=None):
    c0,c1,c2,c3 = p
    return c0,c1-PRICE,c2*(2+x*x),c3*(6+9*x*x+C6*x**3)+ka*scaled_content(x,case,tau)/KAPPA


def moments_cover(moment, lo, hi, xhi, tau=None, xlo=Q(0)):
    accepted = []
    cuts = sorted({xlo,xhi,max(xlo,min(SQRT_INFLUENCE,xhi)),max(xlo,min(TAIL_EDGE,xhi))})
    todo = [(lo,hi,a,b,0) for a,b in pairwise(cuts)]
    while todo:
        a,b,c,d,depth = todo.pop()
        um, xm = (a+b)/2, (c+d)/2
        ka = content_factor(a)
        case = "tail" if c >= TAIL_EDGE else "directional" if c >= SQRT_INFLUENCE else "cubic"
        guesses = sorted(range(len(moment)),key=lambda j: value(moment_poly(moment[j],xm,ka,case,tau),um))[:7]
        best = min(max(max(bernstein(moment_poly(moment[j],x,ka,case,tau),a,b)) for x in (c,d)) for j in guesses)
        if best < TARGET:
            accepted.append((a,b,c,d,best))
            continue
        if depth >= 12:
            raise RuntimeError(('moment',a,b,c,d,float(best-TARGET)))
        if (b-a)/TOP >= (d-c)/xhi:
            todo.extend([(a,um,c,d,depth+1),(um,b,c,d,depth+1)])
        else:
            todo.extend([(a,b,c,xm,depth+1),(a,b,xm,d,depth+1)])
    verify_partition([v[:4] for v in accepted],lo,hi,xlo,xhi)
    return len(accepted), min(TARGET-v[4] for v in accepted)


def stein_cover(stein,lo,hi,xhi,tau=None,other_moments=None,xlo=Q(0)):
    energies = [u for u in sorted(stein) if lo <= u <= hi]
    assert energies[0] == lo and energies[-1] == hi
    accepted = []
    for a,b in pairwise(energies):
        ka = content_factor(a)
        todo = [(xlo,xhi,0)]
        while todo:
            c,d,depth = todo.pop()
            up = []
            for u in (a,b):
                up.append(min(max(p[0]+p[1]+p[2]*(2+x*x)+p[3]*(6+9*x*x+C6*x**3)-PRICE*u
                                  + ka*u**3*scaled_content(x,"cubic",tau)/KAPPA for x in (c,d)) for p in stein[u]))
            loss = Q(3,8)*(2+d*d)*(b-a)**2
            best = max(up)+loss
            if other_moments:
                um, xm = (a+b)/2, (c+d)/2
                guesses = sorted(range(len(other_moments)),key=lambda j: value(moment_poly(other_moments[j],xm,ka,"cubic",tau),um))[:6]
                mom = min(max(max(bernstein(moment_poly(other_moments[j],x,ka,"cubic",tau),a,b)) for x in (c,d)) for j in guesses)
                remote_cap = Q(1373953883,10**9) + ka*b**3*scaled_content(d,"cubic",tau)/KAPPA
                best = min(best,mom,remote_cap)
            if best < TARGET:
                accepted.append((a,b,c,d,best))
                continue
            if depth >= 12:
                raise RuntimeError(('Stein',a,b,c,d,float(best-TARGET)))
            midpoint = (c+d)/2
            todo.extend([(c,midpoint,depth+1),(midpoint,d,depth+1)])
    verify_partition([v[:4] for v in accepted],lo,hi,xlo,xhi)
    return len(accepted), min(TARGET-v[4] for v in accepted)



def verify_low_influence():
    # For tau=max(lambda1/(2u), lambda2/u), the same directional proof yields
    # C^2 <= K_A(u) u^3 * sqrt(50/3) tau * (chi/2 + 26 tau/3).
    # Inserting chi <= 42 tau removes shape from the remaining scalar check.
    tau = Q(21,1000)
    remote_cap = Q(1373953883,10**9)
    nodes = [Q(k,5000) for k in range(232)] + [TOP]
    content_budget = max(content_factor(left)*right**3
                         for left,right in pairwise(nodes))
    margin = TARGET-remote_cap-content_budget*SQRT_INFLUENCE*Q(89,3)*tau*tau/KAPPA
    assert margin > 0
    print("PASS all energies, tau <=",str(tau),"margin",f"{float(margin):.8g}",flush=True)

def check():
    certify_rates()
    verify_low_influence()
    # |V''(r)| < 3 by complete monotonicity and the exact bound from #518.
    a,b = Q(699,1250),Q(179,1250)
    assert (a**-3+4*b*a**-4)/4 < 3
    print("OU enclosures",[(str(u),str(content_factor(u))) for u in (Q(".00551"),Q(".006"),Q(".04"),TOP)],flush=True)
    moment,stein = load_banks()
    regions = [
        ("0",".00815","6.481",moments_cover,moment),
        (".00815",".009","4.78",moments_cover,moment),
        (".009",".01","3.9",moments_cover,moment),
        (".01",".012","3.15",moments_cover,moment),
        (".012",".015","2.37",moments_cover,moment),
        (".015",".02","1.59",moments_cover,moment),
        (".02",".025","1.12",moments_cover,moment),
        (".025",".03",".79",moments_cover,moment),
        (".03",".035",".607",moments_cover,moment),
        (".035",".039",".573",stein_cover,stein),
        (".039",str(TOP),".53",stein_cover,stein),
    ]
    assert Q(regions[0][0]) == 0
    assert Q(regions[0][2])**2 >= 42
    assert all(Q(a[1]) == Q(b[0]) for a,b in pairwise(regions))
    assert Q(regions[-1][1]) == TOP
    assert all(Q(r[2]) >= Q(".53") for r in regions)
    for lo,hi,x,verify,bank in regions:
        lo,hi,x = map(Q,(lo,hi,x))
        count, margin = verify(bank,lo,hi,x)
        print("PASS",str(lo),str(hi),"chi",str(x*x),count,"margin",f"{float(margin):.8g}",flush=True)


    profile_caps = load_caps()
    supplement = json.loads((ROOT / "stein-supplement.json").read_text())
    extra = {u: list(stein[u]) for u in map(Q,supplement["energies"])}
    for row in supplement['models']:
        valid, msg = check_node(dict(row,knots=supplement['knots']),profile_caps,depth=20)
        assert valid,msg
        extra[Q(row['v'])].append(tuple(map(Q,row['coefficients'])))

    influence_slices = [
        (Q(".054"), Q(".53"), Q("1.507")),
        (Q(".055"), Q(".535"), Q("1.52")),
        (Q(".061"), Q(".97"), Q("1.601")),
    ]
    for tau, x_lo, x_hi in influence_slices:
        assert x_hi*x_hi >= 42*tau
        a = moments_cover(moment,Q(0),Q(".035"),x_hi,tau=tau,xlo=x_lo)
        b = stein_cover(extra,Q(".035"),TOP,x_hi,tau=tau,other_moments=moment,xlo=x_lo)
        print("PASS follow-up all energies, tau <=",str(tau),
              "chi >=",str(x_lo*x_lo),"margin",f"{float(min(a[1],b[1])):.8g}",
              "cells",a[0]+b[0],flush=True)


if __name__ == "__main__":
    check()
