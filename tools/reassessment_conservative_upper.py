#!/usr/bin/env python3
"""Discovery-only check: can old enclosures replace the missing moment file?

Constructs conservative phase moments from old low-band center/error and tail
caps, then reoptimizes the existing finite quadratic dual. Results are a
numerical search diagnostic, not a proof of optimality or a new KG bound.
"""
import json
import math
import re
from fractions import Fraction as Q
from pathlib import Path

import numpy as np
from scipy.optimize import minimize

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "handoff/research-third-decimal/reassessment-20261023/upper"
joint = json.loads((ROOT / "handoff/upper-residual/matrix/joint_prefix_certificate.json").read_text())
old = json.loads((ROOT / "handoff/upper-residual/global_norm/taylor_comparison_result.json").read_text())
cross, normerror = 0.0, float(Q(joint["rounding_norm_upper"]))
results = []
for row, inherited in zip(joint["dual_rows"], old["details"]):
    mu = Q(inherited["tail_cap"])**2
    for band in inherited["bands"]:
        m = re.fullmatch(r"\[([^ ]+) \+/- ([^ ]+)\]", band["center_norm"])
        mu += (Q(m[1])+Q(m[2])+Q(band["coefficient_error_cap"]))**2
    ell = np.array([float(Q(x)) for x in row["center_norm_lowers_scaled"]])
    eps = np.array([float(Q(x)) for x in row["prefix_errors_scaled"]])
    a = np.array([float(Q(x)) for x in row["X_band_caps"]])
    at = float(Q(row["X_tail_cap"]))
    mu_scaled = float(mu * 10**12)
    alpha = mu_scaled - np.dot(ell,ell)
    initial = np.log([float(Q(row["lambda_rational"]))]+[float(Q(x)) for x in row["prefix_multipliers"]])

    def objective(logparams):
        params = np.exp(logparams)
        lam, nu = params[0], params[1:]
        d = lam + np.cumsum(nu[::-1])[::-1]
        u = a + 2*lam*ell
        terms = u*u/(4*d)
        value = lam*alpha + at*at/(4*lam) + np.dot(nu,eps*eps) + terms.sum()
        gl = alpha-at*at/(4*lam*lam)+np.sum(ell*u/d-u*u/(4*d*d))
        gn = eps*eps - np.cumsum(u*u/(4*d*d))
        grad = np.concatenate(([gl], gn))*params
        return value,grad

    fit = minimize(objective, initial, jac=True, method="L-BFGS-B",
                   bounds=[(-35,35)]*len(initial),
                   options={"ftol":1e-14,"gtol":1e-10,"maxiter":10000,"maxls":100})
    dual = float(fit.fun)*1e-6
    power = row["power"]
    cross += 2*dual/math.factorial(power)
    t2 = mu_scaled - np.sum((ell-eps)**2)
    normerror += 1e-6*math.sqrt(t2+eps[-1]**2)/math.factorial(power)
    results.append({"power":power,"moment_upper_from_old_only":str(mu),
                    "moment_upper_decimal":float(mu),"dual_cross_term":2*dual/math.factorial(power),
                    "solver_success":bool(fit.success),"iterations":int(fit.nit),
                    "gradient_max":float(np.max(np.abs(fit.jac)))})
comparison = cross+normerror**2+4*float(Q(joint["rounding_norm_upper"]))
result={"status":"FLOAT_ONLY_CONSERVATIVE_MOMENT_DIAGNOSTIC",
        "comparison_screen":comparison,"current_comparison_cap":1.065637497e-6,
        "improves_current":bool(comparison<1.065637497e-6),"rows":results,
        "scope":"No optimizer optimality claim. Conservative moments use only available old center/error/tail enclosures. No Gaussian input has been regenerated."}
OUT.mkdir(parents=True,exist_ok=True)
(OUT/"conservative-moment-screen.json").write_text(json.dumps(result,indent=2)+"\n")
print(json.dumps(result,indent=2))
