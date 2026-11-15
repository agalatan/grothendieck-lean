<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/multivariate/PSI_GAUSSIAN_FORMULA.md, 2026-11-15 12:40; Agent-ID: codex-91d4. -->
# A conditional Gaussian formula for the zero-safe majorant

Agent-ID: **codex-91d4**. P, author derivation; no interval evaluation or
external review asserted. This concerns the genuine finite-triple variance
mixture only, and keeps its random conditional variance.

For complex x,h write s=|x|², v=|h|² and r=Re(x conj(h)). The proposed majorant is

```
Psi(x,h)=2(sqrt(s+v)−sqrt(s))−r²/(s+v)^(3/2),
```

with value zero at s+v=0. The first term can be evaluated as
`2v/(sqrt(s+v)+sqrt(s))`. The even binomial expansion (or its monotone limit
at |2r|=s+v) gives

```
sqrt(s+v+2r)+sqrt(s+v−2r)
 ≤2sqrt(s+v)−r²/(s+v)^(3/2).
```

Hence the exact paired norm difference is at most Psi, at every amplitude.
This majorant keeps the real longitudinal interaction and has the exact
second-order Hessian at nonzero x. The ordinary Sobol engine reports its
expectation at the actual optimizing global visible c, and at c=0. It does
not claim those c values minimize the majorant itself.

In the mixture reduction, condition on all retained active variables. Then
`X=mu+sqrt(vartheta)W`, with W standard proper complex Gaussian,
`vartheta>0`, and H fixed. Define

```
v=|H|²,     r0=Re(mu conj(H)),
A(t)=1+vartheta*t,
K(t)=exp(−t|mu|²/A(t))/A(t).
```

Gaussian completion of squares gives exactly

```
E exp(−t|X|²)=K(t),
E[(Re(X conj(H)))² exp(−t|X|²)]
 =K(t)[r0²/A(t)²+vartheta*v/(2A(t))].
```

The Laplace representations for square-root differences and negative powers
therefore yield the one-dimensional integral

```
E Psi(X,H) = 1/sqrt(pi) ∫_0^∞ K(t) [
  (1−exp(−vt))*t^(−3/2)
  −2exp(−vt)*t^(1/2)*(r0²/A(t)²+vartheta*v/(2A(t))) ] dt.
```

The two terms separately have finite integrals: the first equals a difference
of square-root expectations and the second is bounded by the first moments
of |X|. Tonelli may be applied to each nonnegative term before subtraction.
For v=0 both vanish. For vartheta=0 the original pointwise expression applies.
Near t=0 use `-expm1(-vt)`; this is a numerical stability suggestion, not a
certificate. At positive vartheta the first integrand is O(t^(−5/2)) at
infinity and the second has exponential decay when v>0.

This removes the conditional q integration analytically, but still requires
an additional scalar integral inside the remaining remote/visible integration.
The current `mixture_budget.py` explicitly records Jpsi as unevaluated. It
does not discard the random variance or replace the cubic by an unconditional
Gaussian. Outward evaluation of this formula is possible future work, outside
the present bounded Phase A probes.

For general genuine cores, useful diagnostics are weighted small-ball masses
`F(t)=E[|H|² 1_{|X|≤t}]` and the conditional derivative metric
`Gamma=|partial_z X|²+|partial_bar_z X|²`. If an averaged estimate
`F(t)≤C t^(1+alpha)` with alpha>0 can be proved up to delta, then

```
E[|H|²/|X|; |X|≤delta] ≤ C(1+1/alpha)delta^alpha.
```

This follows from layer cake, including the boundary term F(delta)/delta.
A conditioned quadratic zero need not satisfy alpha>0, which is why a bound
uniform in every conditioned core is too strong. Averaging over genuine
remote variables may improve the exponent. The zero-safe alternative
`central_difference≤min(|H|²/|X|,2|H|)` also permits a scale decomposition
without requiring the inverse norm to be integrable first. The recorded
small-ball and inverse-norm samples are diagnostics only; rare singular
samples can badly overestimate inverse-norm means and are not certificates.
