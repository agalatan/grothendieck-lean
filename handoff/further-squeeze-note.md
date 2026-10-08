# Further improvements to the complex Grothendieck bounds

8 October 2026 — research calculation with executable certificates.

The new interval is

\[
\boxed{1.400813971<K_G^{\mathbb C}<1.404898366983.}
\]

This continues our previous interval
\(1.40020018<K_G^{\mathbb C}<1.404898426735\). Its width decreases
from 0.004698246735 to 0.004084395983, a reduction of about 13.07%.
The larger gain comes from the lower side.

The analytic starting point is Heilman, Jones and Malavolta,
[Sharper Bounds for the Complex Grothendieck Constant](https://arxiv.org/html/2609.25462v1).
Their Gaussian witness, valid upper-bound kernels, and analytic reductions
remain essential inputs. What follows is a set of locally verified
refinements, not a claim of an externally reviewed result or a wholly new
solution of Grothendieck's problem.

## The lower bound: incompatible equality cases

An operator \(T\) in the lower-bound construction has its first relevant
eigenvalue normalized to one. Proving \(\|T\|_{\infty\to1}\le B\)
therefore gives \(K_G^{\mathbb C}\ge 1/B\). We obtain the exact rational bound

\[
B=\frac{3569353321}{5000000000}=0.7138706642,
\qquad
\frac1B=1.40081397114230933822\ldots.
\]

The first useful observation is to preserve information discarded in a
completion of the square. A profile gives an inequality of the form

\[
V\le F_i(t)-\varepsilon\|z+b_i\|_2^2.
\]

The same Hilbert-space vector \(z\) occurs in every profile, but the centers
\(b_i\) differ. These squares cannot all vanish simultaneously. For weights
\(w_i\ge0\) summing to one, the exact identity

\[
\sum_iw_i\|z+b_i\|^2
=\left\|z+\sum_iw_i b_i\right\|^2
 +\sum_iw_i\|b_i\|^2-\left\|\sum_iw_i b_i\right\|^2
\]

turns that incompatibility into a quantitative improvement. In our profiles,
the final variance term is \(2\operatorname{Var}_w(\beta)/\varepsilon\)
after multiplication by \(\varepsilon\). This is stronger than simply
taking the smallest separately certified \(F_i\).

A second loss occurs when each profile is maximized over residual moments
separately. Their maximizing residuals need not agree. Coupling the residual
moments before taking the maximum produces stronger intermediate profiles.

We then make two further improvements to those profiles:

1. **Tighten a matrix parameter.** Interpolation leaves slack in a positive
   semidefinite constraint. Its exact Schur complement allows a smaller
   residual parameter, increasing the negative quadratic term in the bound.
2. **Redistribute the scalar argument.** Joint convexity allows the same
   averaged potential to be bounded using several different splits of its
   argument between the two source profiles. The best split may change from
   one moment rectangle to another. All splits satisfy an exact weighted
   identity, and all polynomial bounds used are global.

These changes require no new lower-side Gaussian integrations. They extract
more information from the certified potential functions already available.
The final gain from argument allocation is small but survives an independent
exact verification. The [lower proof note](lower/research-note.md) gives the
precise formulas, including the negative quadratic term that must be kept
when changing arguments.

## The upper bound: completing the tail calculation

The earlier partial upper-bound route also yields a further improvement.
We retain the sixth kernel through radial mode 239, adding 120 modes on each
of its two sides. Directed Arb quadrature certifies all 240 new complex
coefficients. Higher precision is necessary at the larger Laguerre indices.

For the remaining infinite tail, we certify a joint real energy that preserves
cancellation between the two endpoint terms. Bounding those terms separately
would lose that cancellation. The residual sixth-kernel coefficient norm is
less than 0.000073549010646924 before its mixture weight is applied.

Finally, an explicit rational common preprocessor slightly improves the
coefficient balance. Its coefficient absolute sum is exactly one, which
controls its effect on the uncomputed remainder. The finite composition is
evaluated in full, through radial degree 57,240. It is not cut off at the old
degree.

The internal certified upper endpoint is

\[
1.404898366982454478500401026269606\ldots,
\]

giving the stated outward decimal 1.404898366983. See the
[upper proof note](upper/research-note.md) for its energy inequality and
error accounting.

## What the result establishes

The lower certificates use exact rational arithmetic after the prerequisite
Gaussian price replay. The upper certificates use directed interval arithmetic
and exact rational input data. Independent implementations reproduced the new
lower covers and the final upper assembly. This is computational mathematical
evidence with explicit analytic dependencies, not a formal proof-assistant
development or an external peer review.

The refinements are concrete improvements within the existing framework.
The variance identity, Schur complement and convexity principles are standard;
we do not claim their invention. Their combination here gives a materially
stronger locally checked lower endpoint.

The interval still crosses every thousandth-digit boundary from 1.401 through
1.404. It fixes the decimal prefix **1.40**, but it does not pin the next digit.
Moreover, the fixed witness used on the lower side has a ceiling:

\[
\frac{1}{\sup_n\|P_{1,0}-(37/50)P_{2,1}\|_{\infty\to1}}
\le\frac{1600}{363\pi}=1.403018782077314\ldots.
\]

This follows by testing the one-coordinate phase function \(z/|z|\).
Thus, with the current upper endpoint, this witness alone cannot close the
interval into the decimal cell \([1.404,1.405)\). Further progress toward a
new digit ultimately requires a different lower witness or a substantially
smaller upper bound.
