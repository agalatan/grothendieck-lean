# A finite certificate closes the separable neutral-mixture loophole

This is the real-preprocessor base proof. The companion
`COMPLEX_PREPROCESSOR_EXTENSION.md` extends the same absolute price bound
and all multiplier/mixture conclusions to arbitrary complex charged
preprocessors under physical phase composition. Read the two notes together.

For every finite or countable convex mixture of kernels

\[
 C(t)=\phi(p(t))K(t),
\]

where `p` is a **real odd** scalar Wiener series with norm at most one and
`K` is any **complex even** Wiener series with norm at most one, the full
residual score satisfies

\[
 D=|c_1|-\sum_{j\ge1}|c_{2j+1}|
 <0.711916311229984<0.711947.
\tag{1}
\]

Here `phi` is the complex Gaussian phase kernel restricted to the real axis.
The score includes every coefficient; no coefficient tail is dropped in
(1). This is an obstruction for the stated response architecture, not a
global Grothendieck endpoint. The current conditional incumbent score is
greater than `0.711947`.

The class includes pure phase rounding with independently chosen nonlinear
scalar preprocessors in each mixture component. It also includes two
independent bounded neutral response factors, with separate scalar
preprocessors for their Gaussian auxiliary coordinates. Thus the
nonlinear-preprocessing and convex-mixture qualifications of the earlier
raw-score theorem do not rescue this **separable pure-phase** subclass.
Coupling the response to the modulus of the phase coordinate remains
outside the theorem.

## 1. The degree-seven dual functional

For an odd Wiener series `C`, define

\[
 L(C)=c_1+\lambda_3c_3+\lambda_5c_5+\lambda_7c_7,
\]

with exact rational coefficients

\[
 (\lambda_3,\lambda_5,\lambda_7)
 =\frac1{10^9}(-606121006,-272015495,-762296131).
\tag{2}
\]

All three absolute values are at most one. The reverse triangle inequality
therefore gives

\[
 D(C)\le |L(C)|.
\tag{3}
\]

The same functional controls every component of a mixture. Unlike an
individual residual-score bound, an absolute linear-functional bound
passes directly to arbitrary convex mixtures.

Let

\[
 z=\frac{90644}{100000}=0.90644,\qquad \alpha=\pi/4.
\]

The exact Bernstein certificate described below proves

\[
 |L(\phi\circ p)|\le\alpha z
\tag{4}
\]

for every real odd Wiener contraction `p`, including arbitrary nonlinear
scalar preprocessors.

## 2. Exact pricing over the full preprocessor Wiener ball

Write the first four preprocessor coefficients as

\[
 p(t)=a t+b t^3+c t^5+d t^7+O(t^9),
 \qquad |a|+|b|+|c|+|d|\le1.
\]

Every omitted coefficient is irrelevant to the first seven ordinary
degrees. Since

\[
 \phi(t)/\alpha=t+t^3/8+3t^5/64+25t^7/1024+O(t^9),
\]

the normalized kernel coefficients are exactly

\[
\begin{aligned}
 g_1={}&a,\\
 g_3={}&b+a^3/8,\\
 g_5={}&c+3a^2b/8+3a^5/64,\\
 g_7={}&d+(3a^2c+3ab^2)/8+15a^4b/64+25a^7/1024.
\end{aligned}
\tag{5}
\]

The polynomial to price is `P=g1+lambda3*g3+lambda5*g5+lambda7*g7`.
For fixed `a,b`, it is linear in `c,d`. Consequently its maximum over
`|c|+|d|<=1-|a|-|b|` occurs with all remaining mass in one signed coordinate,
either `c` or `d`. This reduces the entire Wiener-ball price to sixteen
patches on the unit square:

\[
 a=\sigma_a u,\quad b=\sigma_b(1-u)v,\quad
 (c,d)=(\sigma_r(1-u)(1-v),0)
\]

or the same expression with `c,d` exchanged. Here `u,v in [0,1]`, and the
three signs are independently plus or minus. Each patch is a bivariate
polynomial of degree at most `(7,2)`.

The checker converts these exact rational power-basis coefficients to
Bernstein coefficients. The value of a polynomial on a unit square is a
convex combination of its Bernstein coefficients. If their maximum is at
most `z`, the entire patch is certified. Otherwise the checker subdivides
dyadically using exact de Casteljau arithmetic and repeats.

All sixteen patches pass with **67 accepted rectangles** and maximum
subdivision depth **9**. The proof uses rational arithmetic throughout. No
optimizer result, grid coverage assumption, or floating tolerance is
trusted. Every tested rectangle is either certified or subdivided; exceeding
the maximum depth is an error and produces no certificate.

This proves `P<=z`. The full preprocessor ball is symmetric under
`p -> -p`, and `phi` is odd, so it also proves `-P<=z`. That establishes
the absolute bound (4).

## 3. Arbitrary contractive even multipliers and all mixtures

Split the neutral multiplier as `K=k0+E`, where `E` has minimum ordinary
degree two. Since `K` is even,

\[
 |k_0|+\|E\|_W=\|K\|_W\le1.
\]

The constant part is controlled by (4). For the remainder, only the head
through degree five of `phi(p)` can enter `L(phi(p)E)`. Its Wiener norm is
at most

\[
 \|[\phi(p)]_{\le5}\|_W
 \le\alpha(1+1/8+3/64)=\alpha\frac{75}{64},
\]

because `||p||_W<=1`. Set
`lambda_max=max(|lambda3|,|lambda5|,|lambda7|)`. Exact rational arithmetic
verifies

\[
 \frac{75}{64}\lambda_{\max}
 =\frac{57172209825}{64000000000}
 =0.893315778515625<z.
\tag{6}
\]

There is no degree-one term in `phi(p)E`, hence

\[
 |L(\phi(p)E)|\le
 \alpha\frac{75}{64}\lambda_{\max}\|E\|_W.
\]

Combining the constant and nonconstant pieces gives

\[
 |L(\phi(p)K)|
 \le\alpha z\{|k_0|+\|E\|_W\}\le\alpha z.
\tag{7}
\]

Complex coefficients of `K` cause no difficulty because every step bounds
the absolute value of the linear price. For a convex mixture, triangle
inequality applies to `L` component by component. Absolute Wiener
convergence follows from `||phi(p)K||_W<=1`, so countable mixtures are also
covered. Equations (3) and (7) prove the full residual-score ceiling.

This proof is stronger than applying the individual factor-removal result
from the companion note: that argument alone cannot synchronously remove
different filters from different mixture components. The shared finite
dual functional is what closes the mixture loophole.

## 4. Actual independent neutral Gaussian responses fit the multiplier class

Consider actual disk-valued responses

\[
 F(z,V)=\operatorname{phase}(z)S(V),\qquad
 G(z,V)=\operatorname{phase}(z)T(V),\qquad |S|,|T|\le1,
\]

with the entire charged pair `(z,z')` independent of the entire auxiliary
pair `(V,V')`: all charged–auxiliary cross covariances vanish, including
across the two sides. Sidewise independence alone is insufficient to obtain
the product kernel. Let the charged coordinate have cross correlation given
by the real odd Wiener contraction `p`. The auxiliary response correlation
is `K`.

For independent real neutral Gaussian coordinates `Y_j` with separately
supplied even scalar covariance kernels `R_j` satisfying `||R_j||_W<=1`,
expand `S,T` in the orthonormal Hermite basis. Their correlation is

\[
 K(t)=\sum_\beta s_\beta\overline{t_\beta}
                 \prod_j R_j(t)^{\beta_j}.
\]

Every basis-mode kernel is even and has Wiener norm at most one. By
Cauchy–Schwarz,

\[
 \|K\|_W\le\sum_\beta|s_\beta t_\beta|
 \le\|S\|_2\|T\|_2\le1.
\]

This permits arbitrary nonlinear dependence on finitely or countably many
neutral Gaussian coordinates, arbitrary two different disk-valued maps, and
separate contractive scalar covariance preprocessors. Genuine grade-two
neutral Gaussians have the full complex covariance `|rho|^2`; their tensor
preprocessors must be supplied as valid physical even covariance kernels.

For ordinary proper complex Gaussian auxiliaries, require `S,T` to be
**rotation invariant**, so that the auxiliary responses have charge zero.
Their complex Hermite expansions use balanced total bidegrees. Under
separate real odd scalar covariance contractions, every surviving mode is
even on the real axis, has Wiener norm at most one, and the same
Cauchy–Schwarz argument applies. A common Hermitian quadratic phase is a
special case, with no need to diagonalize differently preprocessed covariance
blocks for the norm argument.

Global sign-evenness alone does not establish physical charge zero: for
example `phase(w)^2` is sign-even but has charge two. The abstract theorem
still bounds any even real-axis multiplier; a complex Grothendieck scheme
must separately meet the physical charge-one requirement. The preceding
neutral and rotation-invariant models do meet it.

## 5. Numerical discovery and exact replay

A droplet cutting-plane search suggested an optimistic degree-seven game
value near `0.71190065`, with all higher kernel coefficients unpaid. This
discovery value is not a bound on the full problem. It supplied the rational
dual multipliers (2); the independent exact Bernstein checker certifies the
slightly relaxed ceiling used here.

The checker is standard-library Python and does not import the numerical
search engine. It also bounds pi independently using

\[
 \pi=16\arctan(1/5)-4\arctan(1/239)
\]

and alternating rational Taylor sums. It verifies the integer arithmetic
behind Machin's identity and obtains a rational upper bound on `alpha*z`,
strictly below `0.711916311229984`. The comparison with `711947/1000000`
is exact rational arithmetic.

```
python3 tools/coupled_preprocess_mixture_certificate.py \
  --output handoff/research-third-decimal/coupled-image-20261023/preprocess/mixture-degree7-certificate.json
```

The discovery search ran on the droplet, in
`/home/agalatan/apap/codex-coupled-image-20261023/preprocess/`, using
`coupled_preprocess_mixture.py`. No main-checkout mutation or local heavy
parameter search was used.

## 6. Consequence for the attack

Independent neutral response factors multiplying a pure phase cannot beat
the current rounding score in this scalar Wiener architecture, even with
nonlinear preprocessing, two different neutral maps, and arbitrary mixtures.
The useful escape is **coupled response dependence**: the response must
depend jointly on the phase coordinate's modulus and the auxiliary
coordinates, or alter the charged phase mechanism itself.

The real-only argument in this note does not itself cover complex charged
preprocessors; the companion extension does. Neither argument covers
arbitrary first-coordinate charge-one responses replacing
pure phase, or the existing coupled charged grade-one/grade-three master
rounding. Nonzero charged–auxiliary cross covariances also fall outside the
product-kernel hypothesis. It makes no claim that these remaining classes
improve the bound.

The phase covariance and tensor realization background are classical; see
[Haagerup's original paper](https://www.isibang.ac.in/~soumyashant/misc/collected-works-of-haagerup/1980s/1987_A_new_upper_bound_for_the_complex_Grothendieck_constant.pdf)
and [Friedland–Lim–Zhang, Sections 2–4](https://arxiv.org/html/1711.10595v2).
The finite functional, exact polynomial certificate and multiplier extension
used in this note are derived above; no claim of historical novelty is made.
