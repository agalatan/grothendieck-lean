<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/global/INVERSE_MOMENT_COUNTEREXAMPLE.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- codex-c7e2-round2/global/INVERSE_MOMENT_COUNTEREXAMPLE.md; Agent-ID: codex-c7e2. -->
# The Laplace-order counterexample satisfies the buffered inverse-moment inequality

Agent ID: codex-c7e2. 2026-11-15.

Let `X,Y,W` be independent standard proper complex Gaussians, put `T=|X|²`, `S=|Y|²`, and

\[
q=\frac{X[(T-2)+i(S-1)]}{\sqrt3},\qquad
U=|q|^2=\frac{T[(T-2)^2+(S-1)^2]}3.
\]

Thus `q∈H_{2,1}(C²)` and `E|q|²=1`. This is the polynomial singled out in the global investigation as a counterexample to the stronger Laplace-transform comparison.

**Theorem (analytic argument plus Arb certificate).** For every `v≥0`,

\[
\boxed{\quad
2\mathbb E|q+\sqrt vW|
<(1+v)\mathbb E|q+\sqrt vW|^{-1}.
\quad}
\]

Consequently `E|q+√vW|/√(1+v)` is strictly increasing with `v` and tends to `√π/2`. In particular this polynomial satisfies the sharp Gaussian radius comparison at every Gaussian buffer and every amplitude. The failure of the stronger Laplace comparison therefore does not obstruct this inverse-moment route.

The certificate concerns this specific genuine cubic, not all two-variable cubics or all one-driver tensors. Its proof below has no Monte Carlo or uncontrolled quadrature input.

## 1. Rice kernels and convexity

For `v>0` define `m_v(r)=E|r+√vW|` and `K_v(r)=E|r+√vW|^{-1}`. If `x=r²/(2v)`, then

\[
K_v(r)=\sqrt{\pi/v}\,e^{-x}I_0(x),
\quad m_v(r)=\frac{\sqrt{\pi v}}2e^{-x}
\{(1+2x)I_0(x)+2xI_1(x)\}.
\]

The desired positive quantity is `J(v)=E f_v(U)`, with

\[
f_v(u)=\sqrt{\pi/v}
\{(1-u)e^{-u/(2v)}I_0(u/(2v))
-u e^{-u/(2v)}I_1(u/(2v))\}.
\]

As a function of `u`, `K_v(√u)` is completely monotone, by the circular integral for `I₀`. Also `m_v(√u)` is concave: its derivative is

\[
\frac1{2\sqrt\pi}\int_0^{1/v}
s^{-1/2}(1-vs)^{1/2}e^{-su}\,ds,
\]

a completely monotone function. Therefore `f_v=(1+v)K_v−2m_v` is convex and decreasing on `[0,∞)`.

For any finite measurable partition `C_j` of `(T,S)`, including unbounded cells, Jensen gives the rigorous lower bound

\[
J(v)\ge\sum_j p_j f_v(\mu_j),
\quad p_j=P(C_j),\quad\mu_j=E[U\mid C_j].
\]

No error estimate for numerical integration is needed: the finite sum is a proved lower bound on the full expectation.

## 2. The 625-cell distribution partition

Partition each exponential variable at

\[
0,\tfrac12,1,\ldots,8,9,10,\ldots,16,\infty.
\]

There are 25 intervals on each axis and 625 product cells. For an interval `[l,h]`, its mass and first three moments are evaluated exactly in terms of exponentials:

\[
M_k(l,h)=k!\left[e^{-l}\sum_{j=0}^{k}\frac{l^j}{j!}
-e^{-h}\sum_{j=0}^{k}\frac{h^j}{j!}\right],\qquad k=0,1,2,3,
\]

where the second term is zero at `h=∞`. Divide by `M₀` for conditional moments. Independence and the polynomial formula for `U` then give each `μ_j` exactly. All 625 cells, including every tail, are retained.

## 3. Small buffers, including zero

For `0≤v≤v₀=1/200`, convexity of `x↦x^{-1/2}` conditional on `q` and the triangle inequality give

\[
J(v)\ge E(U+v_0)^{-1/2}-2E\sqrt U-\sqrt{\pi v_0}
\ge\sum_jp_j(\mu_j+v_0)^{-1/2}
-2\sum_jp_j\sqrt{\mu_j}-\sqrt{\pi v_0}.
\]

The second step is Jensen, using respectively convexity and concavity. The 120-bit Arb calculation encloses the final lower bound in

\[
(0.00895141352304409086212463829221,
  0.00895141352304409086212463829223).
\]

This proves strict positivity throughout `[0,1/200]`.

## 4. A distribution-free derivative bound

The heat equation gives `∂_v m_v=K_v/4`. The angular formula for `K_v` yields

\[
|\partial_v K_v(r)|\le\frac{\sqrt\pi}{2v^{3/2}},
\qquad K_v(r)\le\sqrt{\pi/v}.
\]

For the derivative bound, write the angular integrand as `v^{-1/2}e^{-y}`, `y≥0`; its derivative contains `e^{-y}(y−1/2)`, whose absolute value is at most `1/2`.

Consequently

\[
|J'(v)|\le L(v):=\frac{\sqrt\pi(1+2v)}{2v^{3/2}}.
\]

`L` is decreasing. At a rational left endpoint `v_j`, compute the Arb lower ball `A_j=Σp_i f_{v_j}(μ_i)`. Every interval `[v_j,v_{j+1}]` satisfying

\[
A_j-L(v_j)(v_{j+1}-v_j)>0
\]

is therefore certified. Adaptive dyadic steps give 1,415 adjacent intervals covering `[1/200,43]` exactly. The smallest certified lower margin is greater than `0.01142495`.

Floating point is used only to suggest a step size; every acceptance inequality uses Arb balls and exact rational endpoints. Failed comparisons shorten the step. All conditions remain active under `python -O`.

## 5. Large buffers: an exact moment argument

Direct exponential moments give

\[
EU=1,\qquad EU^2=70/3,\qquad EU^3=32722/9.
\]

More generally, for any nonnegative `U` with `EU=1`, put `δ=EU²−2`. The angular formulas for `I₀,I₁`, together with
`1-x≤e^{-x}≤1-x+x²/2`, imply

\[
J(v)\ge\sqrt{\pi/v}
\left\{\frac{\delta}{4v}-\frac{EU^3}{16v^2}\right\}.
\]

To see this directly, set `c=cosθ`, `x=U(1-c)/(2v)`, and bound
`e^{-x}−U(1+c)e^{-x}` using the lower exponential bound on its first term and the upper bound on its second. The angular moments are
`E(1−c)=1`, `E(1−c²)=1/2`, and `E[(1+c)(1−c)²]=1/2`.

For the present cubic, `δ=64/3`, and at `v=43` the positive numerator is

\[
4\delta v-EU^3=302/9>0.
\]

It remains positive for every larger buffer. This proves the theorem on `[43,∞)`.

## 6. Replay and scope

Run `python certify_inverse_counterexample.py` with `python-flint` installed. The script regenerates every cell moment and every special-function enclosure, checks the complete buffer cover, and writes `inverse_counterexample_certificate.json`. The original run used 120 bits and took about 20 seconds.

This is a finite Arb certificate backed by the analytic Jensen and derivative bounds above; it is not a Lean proof. It proves all Gaussian buffers for this polynomial. It does not establish the inverse-moment inequality for an arbitrary cubic, a general rank-one self-interaction, or all of Conjecture K.

## 7. Certified complex self-interaction neighbourhood

The same method proves a continuum of genuine complex-coefficient cubics. Put

\[
q_z=\frac{X[(T-2)+z(S-1)]}{\sqrt{2+|z|^2}},
\qquad |\Re z|\le\frac1{500},\quad
|\Im z-1|\le\frac1{500}.
\]

For every coefficient in this closed rectangle, `E|q_z|²=1` and

\[
2E|q_z+\sqrt vW|<(1+v)E|q_z+\sqrt vW|^{-1}
\quad\text{for every }v\ge0.
\]

This includes real perturbations of the relative coefficient, so it is not restricted to orthogonal real/imaginary self-interaction components. It still does not cover an arbitrary pair of remote Hermitian quadratic forms.

Write `x=Re z`, `k=|z|²`. On each fixed exponential product cell, enclose the conditional mean of

\[
U_z=\frac{T[(T-2)^2+2x(T-2)(S-1)+k(S-1)^2]}{2+k}
\]

by interval arithmetic over the whole coefficient rectangle. Use its upper endpoint `μ_j^+`. Since `f_v` is decreasing as well as convex,

\[
E f_v(U_z)\ge\sum_j p_j f_v(E[U_z\mid C_j])
\ge\sum_j p_j f_v(\mu_j^+).
\]

The same upper conditional means supply the small-buffer bounds: they decrease the inverse-square-root lower bound and increase the square-root upper bound. The derivative bound in Section 4 is distribution independent and unchanged.

For the large-buffer test the exact moment polynomials are

\[
EU_z^2=\frac{18k^2+16kx+16k+32x^2+176}{(2+k)^2},
\]

\[
EU_z^3=\frac{1590k^3+3168k^2x+1296k^2+5184kx^2
+5760kx+4464k+3840x^3+17856x^2+90816}{(2+k)^3}.
\]

They follow by expanding the polynomial and using `ET^i ES^j=i!j!`. Their interval enclosures give `4·50(EU_z²−2)−EU_z³>534` uniformly over the rectangle, proving the large-buffer ray `v≥50`.

The independent checker `certify_inverse_neighborhood.py` regenerates this parameter-uniform certificate at 120 bits. Its result is:

- 625 distribution cells, including tails;
- low-buffer lower bound greater than `0.00293372415` on `[0,1/200]`;
- 1,659 adjacent rational intervals covering `[1/200,50]`, with minimum certified margin greater than `0.00793660`;
- the exact polynomial large-buffer test above.

The parameter rectangle is enclosed continuously, not sampled. The checker also runs successfully with `python -O`; acceptance checks remain active. Its full record is `inverse_neighborhood_certificate.json`. No further region is claimed.


## 8. Exact remote K at every amplitude for this family

Let the variables X,Y in q_z be independent of the visible coordinate Z.
For every complex c, set q=c q_z and u=|c|². Then, for every a>0,b>0,

\[
E|L+q|+E|L-q|\le2E|L+\sqrt uW|,
\]

with strict inequality if c≠0. Therefore remote Conjecture K holds for
this entire family at every amplitude and every positive price p.

Indeed, the established visible Gaussian-mixture representation gives
`L = √R W₀` in distribution, independently of q. Conditional on R, the
all-buffer radius theorem, scaled by |c|, gives

\[
E|c q_z+\sqrt R W_0|
\le\frac{\sqrt\pi}{2}\sqrt{u+R}.
\]

Circularity makes the two signs equal in expectation. Integrating over R
identifies the right side with `E|L+√uW|`. Subtracting pu and maximizing
the Gaussian benchmark over all variances proves K. The argument uses
independence from the visible coordinate; it makes no assertion for
visible-sector perturbations of q_z.

The Gaussian-mixture input is recorded in the repository's
[pinned foundations, §6](https://github.com/agalatan/grothendieck-lean/blob/6bb44599190397f806d2db89b25df4e6785b758e/research/conjecture-K/sources/fifth-audit-2026-11-15-codex-a7c4/FOUNDATIONS.md).
