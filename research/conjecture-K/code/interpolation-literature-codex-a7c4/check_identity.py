#!/usr/bin/env python3
"""codex-a7c4, #464: exact algebra and floating controls, not a sign certificate.

Run with Python 3, NumPy, SciPy and SymPy. Writes JSON only to stdout.
The controls use explicitly named artificial visible Gaussian mixtures;
they do not certify the peak visible profile or an all-cubic inequality.
"""

import json
import math

import numpy as np
import scipy
from scipy.special import erf, roots_hermitenorm, roots_legendre
from scipy.integrate import quad
from scipy.special import i0e, i1e, roots_laguerre
import sympy as sp


def gaussian_expectation(poly, variables):
    ans = sp.S.Zero
    for powers, coefficient in sp.Poly(sp.expand(poly), *variables).terms():
        factor = sp.S.One
        for power in powers:
            if power % 2:
                factor = sp.S.Zero
                break
            factor *= sp.factorial2(power - 1) if power else 1
        ans += coefficient * factor
    return sp.simplify(ans)


def exact_controls():
    a, u, v, t = sp.symbols("a u v t", positive=True)
    t_of_a = 2 * a * (v + u) / (u * (1 + 2 * a))
    amplitude = sp.simplify(v + u * (1 - t_of_a))
    assert sp.simplify(u * t_of_a / (2 * amplitude) - a) == 0
    assert sp.simplify(amplitude - (v + u) / (1 + 2 * a)) == 0
    assert sp.simplify(t_of_a.subs(a, u / (2 * v)) - 1) == 0
    weight = sp.simplify(u / 2 * sp.diff(t_of_a, a) / sp.sqrt(amplitude))
    assert sp.simplify(weight - sp.sqrt(v + u) / (1 + 2 * a) ** sp.Rational(3, 2)) == 0
    primitive = 1 - 1 / sp.sqrt(1 + 2 * a)
    assert sp.simplify(sp.diff(primitive, a) - (1 + 2 * a) ** -sp.Rational(3, 2)) == 0
    mass = sp.sqrt(v + u) * primitive.subs(a, u / (2 * v))
    assert sp.simplify(mass - sp.sqrt(v + u) + sp.sqrt(v)) == 0

    x, y = sp.symbols("x y", real=True)
    models = {
        "real_He3": ((x**3 - 3*x) / sp.sqrt(6), (x,)),
        "complex_Wick_projection": ((x**3 + x*y**2 - 4*x) / (2*sp.sqrt(2)), (x, y)),
    }
    moments = {}
    for name, (f, variables) in models.items():
        gamma = sum(sp.diff(f, z)**2 for z in variables) / 3
        e = lambda p: gaussian_expectation(p, variables)
        assert e(f) == 0 and e(f**2) == 1 and e(gamma) == 1
        k4 = e(f**4) - 3
        gamma_variance = e((gamma-1)**2)
        assert gamma_variance <= sp.Rational(2, 9)*k4
        slope = -e((gamma - 1) * f**2)
        assert sp.simplify(slope + k4 / 3) == 0
        moments[name] = {"fourth_cumulant": str(k4), "C_derivative_at_zero": str(slope),
                         "gamma_variance": str(gamma_variance)}

    # Compare the r=1,2 coefficients in book (5.2.3) and (5.2.5), d=3.
    for r in (1, 2):
        assert sp.Rational(r*r, 9) <= sp.Rational(2, 9)*r
    # kappa_4(F)=3 chi/2 and Var(exp(-a F^2)) <= 1/4.
    assert sp.Rational(2, 9)*sp.Rational(3, 2)/4 == sp.Rational(1, 12)
    peak_squared = (sp.Rational(22, 7)*sp.Rational(1, 45000)*sp.Rational(463, 10000)**2
                    / (48*sp.Rational(699, 1250)**2))
    assert peak_squared == sp.Rational(2358059, 236404707840000)
    assert peak_squared < sp.Rational(1, 10**8)
    return {"change_of_variables": "PASS", "weight_mass": "PASS", "moments": moments,
            "book_variance_coefficients": "PASS", "kernel_covariance_factor": "1/12",
            "peak_squared_deficit_bound_using_pi_lt_22_over_7": str(peak_squared),
            "peak_1e_minus4_corollary": "PASS (rational premise; paper implication in notes)"}


def samples(name, n):
    x, w = roots_hermitenorm(n)
    w = w / math.sqrt(2*math.pi)
    if name == "gaussian":
        return x, np.ones_like(x), w
    if name == "real_He3":
        return (x**3 - 3*x)/math.sqrt(6), (x*x-1)**2/2, w
    xx, yy = np.meshgrid(x, x, indexing="ij")
    f = (xx**3 + xx*yy**2 - 4*xx)/(2*math.sqrt(2))
    gamma = ((3*xx**2 + yy**2 - 4)**2 + 4*xx**2*yy**2)/24
    return f.ravel(), gamma.ravel(), np.outer(w, w).ravel()


def compare(name, n, u, visible):
    f, gamma, w = samples(name, n)
    nodes, weights = roots_legendre(72)
    ts, tw = (nodes + 1)/2, weights/2
    direct, path, transformed = 0., 0., 0.
    # Chunk scalar kernels, avoiding a large all-nodes tensor on the shared laptop.
    def c(a):
        return float(np.dot(w*(gamma-1), np.exp(-a*f*f)))
    for prob, v in visible:
        h = math.sqrt(math.pi*v)*np.exp(-u*f*f/(2*v))
        h += math.pi*math.sqrt(u/2)*f*erf(math.sqrt(u/(2*v))*f)
        direct += prob*(math.sqrt(math.pi*(v+u)) - float(np.dot(w, h)))
        path_sum, transformed_sum = 0., 0.
        for t, wt in zip(ts, tw):
            av = v + u*(1-t)
            path_sum += wt*c(u*t/(2*av))/math.sqrt(av)
            a = t*u/(2*v)
            transformed_sum += wt*c(a)/(1+2*a)**1.5
        path -= prob*math.sqrt(math.pi)*u/2*path_sum
        transformed -= prob*math.sqrt(math.pi*(v+u))*u/(2*v)*transformed_sum
    return {"direct": direct, "path": path, "transformed": transformed,
            "identity_error": max(abs(direct-path), abs(direct-transformed))}


def numerical_controls():
    visible = [(0.25, 0.4), (0.5, 0.9), (0.25, 1.6)]
    rows = []
    for name in ("gaussian", "real_He3", "complex_Wick_projection"):
        for u in (0.001, 0.04):
            low = compare(name, 80, u, visible)
            high = compare(name, 160, u, visible)
            order_error = max(abs(low[k]-high[k]) for k in ("direct", "path", "transformed"))
            assert high["identity_error"] < 2e-7, (name, u, high)
            assert order_error < 2e-7, (name, u, order_error)
            if name == "gaussian":
                assert abs(high["direct"]) < 2e-13
            rows.append({"model": name, "u": u, **high, "order_change": order_error})
    # Exact Stein identity applied to a nonconstant Gaussian scale mixture.
    mixture = [(0.5, 0.25), (0.5, 1.75)]
    signs = []
    for a in (0.001, 0.1, 1., 10., 100.):
        c = sum(prob*(r-1)/math.sqrt(1+2*a*r) for prob, r in mixture)
        assert c < 0
        signs.append({"a": a, "C": c})
    return {"status": "floating normalization controls only", "quadrature_orders": [80, 160],
            "t_and_a_nodes": 72, "visible_mixture": visible, "comparisons": rows,
            "gaussian_scale_mixture_sign_control": signs}


def peak_budget_diagnostic():
    # Conditional budget illustration, not an achieved all-shape transform bound.
    a, b, u = 699/1250, 179/1250, 1/25
    def rice_factor(t):
        z = t*(a+b*t)**2/u
        return (1+z)*i0e(z/2) + z*i1e(z/2)
    val, quad_error = quad(lambda t: math.exp(-t)*rice_factor(t), 0, np.inf,
                           epsabs=1e-12, epsrel=1e-12)
    benchmark = math.sqrt(math.pi*u)*val
    base = math.sqrt(math.pi)*(a+1.5*b)
    checks = []
    for order in (96, 192):
        nodes, weights = roots_laguerre(order)
        other = math.sqrt(math.pi*u)*float(np.dot(weights, rice_factor(nodes)))
        assert abs(other-benchmark) < 1e-11
        checks.append({"laguerre_order": order, "B": other})
    return {"status": "floating illustration, no certified sign bound",
            "u": u, "B": benchmark, "B0": base, "weight_mass": benchmark-base,
            "e_sufficient_for_deficit_loss_1e_minus4": 1e-4/(benchmark-base),
            "quad_reported_error_before_prefactor": quad_error, "independent_rules": checks}


def main():
    result = {"agent": "codex-a7c4", "task": 464,
              "scope": "Identity controls. No all-cubic sign certificate or endpoint improvement.",
              "versions": {"numpy": np.__version__, "scipy": scipy.__version__, "sympy": sp.__version__},
              "exact": exact_controls(), "numerical": numerical_controls(),
              "peak_budget_diagnostic": peak_budget_diagnostic()}
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
