<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/optimizer_audit.md (file dated 2026-11-13). Only this line was added. -->
# Optimiser and independent C² audit

Author: codex-a713, optimizer-audit subagent, 13 November 2026.

This is an audit, not a continuation of the research programme. “Proved here” means an algebraic derivation below; “numerical” means floating deterministic quadrature with convergence checks, not an interval certificate. No assertion of a global optimum is made.

## 1. Formula audit: proved here

Sources: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/tables.py` and `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py`.

Let `M(r,y)=Eθ |r exp(iθ)+y|`, and let `J(r,y)=Eθ 1/|r exp(iθ)+y|`. The correct formulas are

```
m = 4ry/(r+y)^2,
M = (2/pi)(r+y) E(m),
J = (2/pi) K(m)/(r+y),
M_y = [M+(y²-r²)J]/(2y).
```

Here SciPy's complete elliptic integrals use the parameter m, not its square root. To check the last formula, write `2y(y+r cosθ)=|r exp(iθ)+y|²+y²-r²` and divide by the modulus. These are exactly the formulas used in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/tables.py:9–15,21–26`. The product `(y²-r²)J` has a zero limit at r=y despite J's logarithmic singularity. Splitting the integral at that point is appropriate.

With T=s², the exponential law contributes `2s exp(-s²) ds`, and r=s(a+bs²). Therefore

```
phi(y²) = 2 integral 2s exp(-s²) M(r,y) ds,
g(y²) = (1/y) integral 2s exp(-s²)(s²-1) M_y(r,y) ds,
g(0) = integral exp(-s²)(s²-1)/(a+bs²) ds.
```

The two factors of y in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/tables.py` are correct. The functions named `phi(y)` and `g(y)` there take a radius, although the mathematical kernels take its square. The later conversion to derivatives with respect to v is correct away from the special cases discussed below. Also `phi(0)=sqrt(pi)(a+3b/2)=1.371879280600...` and `g(0)=-0.835135932614...`.

The basis in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:16–24` is the full orthonormal Wick basis of H₂,₁(Cⁿ): the contractions subtract one first-chaos term for each matching holomorphic index, and the norm is √2 precisely when the two holomorphic indices coincide. Thus the number of coefficients is n²(n+1)/2, the population norm is `||c||²`, and the numerator in line 29 includes every remote direction.

For a sample define c_j=Ehat[conj(W_j)qg(v)], s=ΣW_j c_j, v=|q|², and R=||c_vector||²/D. Direct differentiation gives the complex representation of the real gradient

```
2 E* [conj(s)q²g' + s(g+vg') − R(κ−phi')q] / (N D).
```

This verifies `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:36–37`. The subtraction `c Re<c,gr>/u` in line 38 is the real tangent projection to the norm sphere; multiplication by √u/||c0|| in line 39 is the remaining derivative of normalization. The chain rule is correct where the kernel derivative actually equals the derivative of the value returned by `kern`.

The denominator control variate in line 28 is unbiased for a fixed coefficient vector of exact population norm u: E(v−u)=0. Choosing κ=phi′(u) is permissible, but is not variance-optimal. Its gradient must be included for the finite sample objective, and the code does include it.

Lines 41–47 are the usual equal-size delete-one-group jackknife: eight independent groups each contain 2²⁰ samples, the full estimate is formed from the mean C vector and mean D, and the SE factor `(B−1)/B` is correct. It is an estimated standard error, not a confidence bound, and does not include numerical kernel error or selection over candidates. The returned R is the original ratio estimator, not a bias-corrected jackknife estimator.

## 2. Limitations and actual code inconsistencies

1. `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:12` says `y = np.minimum(np.sqrt(rho), YMAX)`, while line 13 returns the unclipped derivative evaluated at YMAX. For v>400 the returned values are constant but the claimed derivatives are nonzero. Numerical example: at v=441 the returned phi derivative is 0.04997633 although the value's actual derivative is zero. This is a real inconsistency, although it is negligible for the checked small-dimensional candidates. No general tail-error bound is supplied.
2. `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:9` uses unconstrained cubic splines. The true kernels are even in y, but the generated peak splines have origin slopes −2.3057e−7 (phi) and −1.6095e−6 (g). The y≤1e−5 derivative substitution in lines 10–13 consequently is not exactly the derivative of the returned spline value. This did not materially affect the checked optimum.
3. `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/tables.py:14` replaces the singular elliptic parameter using `k2 = min(4*r*y/(r + y)**2, 1 - 1e-16)`; the integration and spline errors have no rigorous enclosures. This is satisfactory exploratory numerics, not a certificate. The truncation at s=9 is harmless at the scales checked, but the code does not prove a uniform error statement.
4. `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:34` returns zero value and zero gradient whenever the estimated denominator is nonpositive. For nearly Gaussian cubics the true D is small, so this can create artificial flat regions and very large ratios just on the positive side of a noisy denominator. The fixed-denominator normal approximation is then unreliable.
5. The sample squared projection has positive bias: `E||C_hat||²=||C||²+tr Cov(conj(W)qg)/N`. There is also ratio bias. Both are potentially relevant when D is tiny and/or the dimension grows. Fresh validation samples do not remove these biases.
6. Eight jackknife groups provide only seven variance degrees of freedom in the approximate normal situation. Reporting an SE with four decimal digits does not make it accurately known. Selecting the largest validation R across restarts adds winner-selection bias. A fresh final evaluation of a preselected coefficient vector would address that selection issue.
7. `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/kscan-2026-11-13/kscan.py:63–67` does not record `res.success`, `res.message`, or the gradient norm. A recorded candidate or iteration count is not evidence of optimizer convergence.

Numerical source checks, in `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_check_source.log`: a 4096-sample n=2 gradient test agrees with a central difference to 9.7e−13 at step 1e−4. Regenerating the source table exclusively inside the audit directory and comparing with the independent Abel method gave maximum node errors 3.7e−11 for phi and 2.1e−12 for g; midpoint interpolation errors were below 4.7e−9 and 6.6e−9. Evaluating the independent local maximizer with the source splines changes its ratio by only 1.7e−11. The spline therefore does not explain a reported ratio near 0.089.

## 3. Independent deterministic method

The independent implementation is `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_deterministic.py`. It imports no code from either audited script. It uses regular Abel transforms, not their elliptic-integral singularity calculation. The mathematical representation is taken from `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_endpoint_one_twelfth/wick_cert/proof.md:19–62`; its numerical implementation was written afresh.

For v≥0 let t(v) solve v=t(a+bt)², D(t)=(a+bt)(a+3bt), d0=D(t(v)), e0=2ab+3b²t(v), Q=d0+e0 y²+b²y⁴. Define A,H,V by integrating respectively

```
exp(-t(v)-y²)/sqrt(Q),
exp(-t(v)-y²)(a+3b(t(v)+y²))/[(a+b(t(v)+y²))sqrt(Q)],
exp(-t(v)-y²)D(t(v)+y²)/sqrt(Q)
```

over y≥0. The smooth angular averages are

```
g(v)=−(2/pi) integral sin²θ H(v sin²θ) dθ,
phi(v)=(4/pi) integral [V(v sin²θ)+2v cos²θ A(v sin²θ)] dθ,
```

with θ∈[0,pi/2]. We used Gauss–Legendre rules for these positive smooth integrals, y≤8, and a fine log(1+v/.02) interpolation grid. Refinement from 96 to 192 inner nodes and halving the interpolation spacing changed the final ratio by less than 1e−12. This is a convergence check, not interval error certification.

For the remote variables, global charge-one rotation lets us set X=√R and Y=√S exp(iθ), with R,S independent Exp(1) and θ uniform. The full basis in order is

```
X(R−2)/√2, X² conj(Y)/√2, Y(R−1), X(S−1),
Y² conj(X)/√2, Y(S−2)/√2.
```

Gauss–Laguerre rules integrate R,S and a periodic trapezoid integrates θ. Both first-chaos coefficients are retained. Seven local searches (four structured starts and three arbitrary complex starts) used all six complex coefficients. The three random starts converged to rotations of the same candidate. Reevaluating a general-coordinate candidate from 80×80×64 through 240×240×160 nodes changed the ratio by less than 8e−13. The adapted family was refined separately to 300 radial nodes. A conservative empirical accuracy claim for the ratios below is 2e−9; we do not attach rigorous intervals.

## 4. Numerical results and shape of the C² candidate

At u=.0463:

* Monomial √(u/2) X(R−2): ratio **0.0875653042342**, D=0.0120634220393, C²=0.00105633722097.
* Template √u X(S−1): ratio **0.0409951189206**, D=0.00794007941771, C²=0.000325504499968.
* Pure imaginary family √(u/(2+τ²))X[(R−2)+iτ(S−1)]: maximum **0.0875781815234** near **τ=.1276083**. The relative excess over the monomial is **1.4706e−4**. At τ=.1 the ratio is 0.0875763291820, relative excess 1.2591e−4. This confirms the record's order of magnitude and explains its “near .1” description.
* Allowing a real component as well gives the numerical local maximizer

```
q = sqrt(.0463/(2+|z|²)) X[(R−2)+z(S−1)],
z = .0528353118687 + .221226689991 i,
C²/D = .0876025943567,
D = .0116698322793, C² = .00102230758337,
E|q|⁴/u²−2 = 40.0488036259.
```

Its relative excess over the monomial is 4.2586e−4, still only 0.043%, far below the apparent 1–2% Monte Carlo excess. In the orthonormal basis above its only nonzero coefficients are c0=.212444303661871 and c3=.007936963226309+.033232852064893i. In arbitrary coordinates it can have nonzero content in both directions; their sum is essential. The full numerical Hessian has the expected four zero directions for scaling and symmetries, and eight positive eigenvalues for the negative ratio, the smallest about .2033. This supports local maximality modulo symmetry. It does not certify the global supremum on C².

The source folder contained no candidate coefficient logs, only the two Python scripts. Thus the reported 0.0892 candidate could not be replayed directly. The evidence here does not support interpreting it as a genuine larger extremum, and cannot logically exclude a different undisclosed candidate. The independent small-dimensional searches and two distinct deterministic kernel calculations support approximately .087603 as the numerical candidate.

Detailed coefficients and τ scan: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_family_summary.json`. Search output: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_deterministic.log`. Refinements and Hessian: `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_refine.log`.

## 5. Why the Monte Carlo error is large

The source's tangent coefficient κ=phi′(u)=1.361334383 is unbiased but numerically inefficient here. Deterministic integration of the second moments gives:

* For the monomial, the variance of the denominator summand increases from .03848118 without the control variate to .05784521 with it, a factor 1.5032. The denominator-optimal coefficient is .603511.
* The delta-method standard error of the **ratio** at N=2²³ is .0006790 with the source control, compared with .0004386 without it. The ratio-optimal coefficient is .510251, giving .0002041.
* At the complex-mix local maximum the corresponding ratio SEs are .0006827, .0004450, and .0002044; its ratio-optimal coefficient is .514127.

These are numerical asymptotic standard errors, not guaranteed coverage. They follow by integrating the variance of

```
[2 Re<C, conj(W)qg> + R phi(v) − R κv] / D
```

after centering. The reported .0004–.0005 jackknife estimates are plausible low realizations with only eight groups. A selected .0892 result is only about 2.34 of the computed .000683 single-candidate standard errors above .0876026, before accounting for selection. The existing search therefore cannot resolve the small deterministic excess or establish a larger one.

## 6. Reproducibility and owned outputs

Python was `/Library/Frameworks/Python.framework/Versions/3.12/bin/python3 -I`; NumPy, SciPy, OPENBLAS/OMP/VECLIB thread counts all fixed to one. No installation, Lean build, Git mutation, or source edit was performed. All created files are inside `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/`.

This subagent owns only the following files:

* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_deterministic.py`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_deterministic.log`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_abel_0.002_96.npz`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_abel_0.001_192.npz`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_results.json`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_refine.py`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_refine.log`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_refined.npz`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_check_source.py`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_check_source.log`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/tables-peak.npz`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_family_summary.py`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_family_summary.log`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/opt_family_summary.json`
* `/Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-audit-2026-11-13/optimizer_audit.md`

The source table was generated by replaying the unmodified original table script with the audit directory as the working directory. No n>2 optimizer or large Monte Carlo search was run by this subagent.
