#!/usr/bin/env python3
"""Exact scalar checks for FOUNDATIONS.md. Agent-ID: codex-a7c4. Refs #398.

Standard library only; python3 -I foundations_exact.py.
No saved numerical premises are loaded. The benchmark S upper bound is an
explicit inherited input from the independently replayed peak certificate.
This checks scalar consequences, not the still-open all-sector K hypothesis.
"""
from fractions import Fraction as F
from math import isqrt
import json


if not __debug__:
    raise RuntimeError('Assertions must be enabled; do not run with -O.')


def add(x, y):
    return x[0] + y[0], x[1] + y[1]


def mul(x, y):
    z = [a*b for a in x for b in y]
    return min(z), max(z)


def point(x):
    return x, x


def atan_inv(q, n):
    s = sum((F((-1)**k, (2*k+1)*q**(2*k+1)) for k in range(n)), F(0))
    nxt = F((-1)**n, (2*n+1)*q**(2*n+1))
    return min(s, s+nxt), max(s, s+nxt)


def sqrt_bounds(x, digits=45):
    scale = 10**digits
    lo = isqrt(x[0].numerator*scale**2//x[0].denominator)
    hi = isqrt(x[1].numerator*scale**2//x[1].denominator)+1
    assert F(lo, scale)**2 <= x[0] < x[1] <= F(hi, scale)**2
    return F(lo, scale), F(hi, scale)


def exp_negative(x, n=24):
    assert 0 < x < 1
    term = F(1)
    total = term
    for k in range(1, n):
        term *= -x/k
        total += term
    nxt = term*(-x)/n
    return min(total, total+nxt), max(total, total+nxt)


def bessel_i(order, x, n=20):
    assert order in (0, 1) and 0 < x < 1
    term = F(1) if order == 0 else x/2
    total = term
    for k in range(1, n):
        term *= x*x/(4*k*(k+order))
        total += term
    nxt = term*x*x/(4*n*(n+order))
    ratio = x*x/(4*(n+1)*(n+1+order))
    return total, total+nxt/(1-ratio)


def show(x):
    return {"rational": str(x), "decimal_diagnostic": float(x)}


pi = add(mul(point(F(16)), atan_inv(5, 36)),
         mul(point(F(-4)), atan_inv(239, 12)))
sqrt_pi = sqrt_bounds(pi)
R = mul(point(F(1, 2)), sqrt_pi)
assert pi[0] > 3 and sqrt_pi[0] > F(17, 10)
eps = F(1891, 2500)

# rho(u)=R exp(-u/2)[(1+u) I0(u/2)+u I1(u/2)].
# Concavity makes the tangent at u=1/10 global.
x = F(1, 20)
i0, i1 = bessel_i(0, x), bessel_i(1, x)
common = mul(R, exp_negative(x))
tangent_a = mul(common, add(mul(point(1+x), i0), mul(point(x), i1)))
tangent_b = mul(mul(point(F(1, 2)), common), add(i0, i1))
A, B = F(886762780, 10**9), F(432306903, 10**9)
assert tangent_a[1] < A and tangent_b[1] < B

energy_rows = []
for t, remote_cap, total_cap in [(F(21, 25), F(46266, 10**6), F(81884, 10**6)),
                                (F(1057, 1250), F(40726, 10**6), F(71981, 10**6)),
                                (F(851, 1000), F(35383, 10**6), F(62431, 10**6))]:
    remote = 4*eps**2*B*(A-t)
    total = eps**2*(3*R[1]*(R[1]-t)+B*(A-t))
    assert remote < remote_cap and total < total_cap
    energy_rows.append({"t_min": str(t), "remote_upper": show(remote),
                        "total_upper": show(total), "printed_caps": [str(remote_cap), str(total_cap)]})

# A genuine response at t=0: k=phase[X(|X|^2-2)], f=k, g=-k.
# E sqrt(T)|T-2| > sqrt(pi)/4 + 4 exp(-3) > 17/40+4/27.
moment_lower = F(17, 40)+F(4, 27)
response_energy_lower = eps**2*moment_lower**2/2
assert response_energy_lower > F(9, 125) > F(463, 10000)

ell, beta = F(1057, 1250), F(179, 1250)
S_hi = F('1.3739535256616')
target = F(500, 701)


def row(t, eta=F(0)):
    return t*t-2*ell*t+2*beta*beta/eps+S_hi+eta


eta_max = min(target-row(t) for t in [F(21, 25), F(851, 1000)])
assert eta_max == F(166713115892493, 1656988750000000000)
assert eta_max-F(1, 10000) > F(612, 10**9)
for t in [F(16799, 20000), F(681, 800)]:
    assert row(t, F(1, 10000)) < target
# With only this S upper enclosure, the left endpoint does not certify 1.4022.
assert row(F(21, 25)) > F(5000, 7011)

result = {"agent_id": "codex-a7c4", "status": "PASS",
          "scope": "Exact scalar checks; response/duality proofs in FOUNDATIONS.md; central consumer conditional on all-sector K_eta",
          "inherited_input": {"peak_S_upper": str(S_hi)},
          "rice_tangent": {"A_upper": str(A), "B_upper": str(B)},
          "response_energy_rows": energy_rows,
          "unrestricted_response_energy_lower": show(response_energy_lower),
          "central_eta_max": show(eta_max),
          "central_margin_after_eta_1e_4": show(eta_max-F(1, 10000)),
          "wider_certified_interval": [str(F(16799, 20000)), str(F(681, 800))],
          "minimizer_radius": "sqrt(pi)/2; analytic proof only",
          "dual_residual_error_bound": "||a-Pk_a||^2; analytic proof only"}
print(json.dumps(result, indent=2))
