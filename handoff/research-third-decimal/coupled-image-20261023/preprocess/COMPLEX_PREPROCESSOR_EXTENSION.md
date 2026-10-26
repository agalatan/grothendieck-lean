# The same finite dual also controls complex charged preprocessors

The real-preprocessor theorem in `MIXTURE_PREPROCESSOR_OBSTRUCTION.md`
extends to **complex** odd charged Wiener preprocessors, using the physical
complex phase composition. The bound remains

\[
 D<0.711916311229984<0.711947
\]

for every convex mixture of `Phi_phys(p)*K`, where `||p||_W<=1`, `p` is odd,
and `K` is any complex even Wiener contraction. The earlier exact Bernstein
certificate is unchanged. This separate extension uses an analytic angular
comparison and exact rational identities; it requires no parameter search.

The extension does not cover a charged response other than pure phase,
joint dependence on the charged coordinate's modulus and auxiliary
coordinates, or charged–auxiliary cross covariances that destroy the product
kernel.

## 1. Physical composition and an individual real-part observation

For complex coefficients, ordinary `phi(p(t))` is generally the wrong
composition. Let `p_sharp` denote coefficientwise conjugation, with the
formal variable unchanged. The real-axis expansion of the physical phase
kernel is

\[
 \Phi_{\rm phys}(p)/\alpha
 =p+\frac18p^2p^\sharp
   +\frac3{64}p^3(p^\sharp)^2
   +\frac{25}{1024}p^4(p^\sharp)^3+\cdots,
 \quad\alpha=\pi/4.
\]

Indeed, the physical charged lift is
`p_phys(rho)=sum p_j rho|rho|^(2j)`, and the phase covariance is
`alpha*p_phys*2F1(1/2,1/2;2;|p_phys|^2)`. On the real axis the conjugate
series is exactly `p_sharp`.

A constant phase rotation of `p` rotates the whole phase kernel by the same
phase, so it leaves the absolute dual price unchanged. We may therefore
write

\[
 p(t)=a t+(x+iy)t^3+(u+iv)t^5+(w+is)t^7+\cdots,
 \qquad a\ge0.
\]

The real parts of the first four normalized phase coefficients are

\[
\begin{aligned}
 \Re g_1&=a,\\
 \Re g_3&=x+a^3/8,\\
 \Re g_5&=u+3a^2x/8+3a^5/64,\\
 \Re g_7&=w+3a^2u/8+a(3x^2+y^2)/8
              +15a^4x/64+25a^7/1024.
\end{aligned}
\]

Since the certified `lambda7` is negative, deleting imaginary coefficients
cannot decrease the real dual price and cannot increase the preprocessor
Wiener norm. This already establishes the individual score bound. Mixtures
need an **absolute** price bound, which the following stronger comparison
supplies.

## 2. Eliminate the last two coefficients

Use exactly the rational multipliers from the base certificate, and put

\[
 s_3=-\lambda_3>0,\qquad s_5=-\lambda_5>0,\qquad m=-\lambda_7>0.
\]

Set `b=x+iy`, `r=|b|`, so `a+r<=1`, and define

\[
\begin{aligned}
 q&=ma/8,\\
 A&=a-s_3a^3/8-3s_5a^5/64-25ma^7/1024,\\
 B&=s_3+3s_5a^2/8+15ma^4/64,\\
 C&=s_3+s_5a^2/8+3ma^4/64.
\end{aligned}
\]

The normalized dual price separates into `L0` plus real-linear contributions
of the degree-five and degree-seven preprocessor coefficients, where

\[
 \Re L_0=A-Bx-q(3x^2+y^2),\qquad
 \Im L_0=-y(C+2qx).
\]

The degree-five coefficient map has Euclidean operator norm
`s5+3ma^2/8`, whereas the degree-seven map has norm `m`. Exact rational
arithmetic verifies

\[
 m-s_5-3m/8=0.204419586875>0.
\]

Triangle inequality and the remaining coefficient budget therefore give

\[
 |L|/\alpha\le |L_0|+m(1-a-r).
\tag{2}
\]

## 3. A negative real cubic coefficient maximizes the remaining magnitude

Let

\[
 T=A+Br-3qr^2.
\]

Using `y^2=r^2-x^2`, exact expansion gives

\[
 T^2-|L_0|^2=(r+x)G,
\]

where

\[
 G=2B(A-3qr^2)
 +(r-x)\{B^2-C^2-4Aq+4q(B-C)x+8q^2r^2\}.
\tag{3}
\]

The checker independently verifies this identity as a six-variable rational
polynomial identity, as well as deriving the physical coefficient formulas
by generic formal multiplication of `p` and `p_sharp`.

For positivity, set

\[
 c_A=1-s_3/8-3s_5/64-25m/1024,\qquad
 d=s_5/4+3m/16.
\]

On the simplex `a,r>=0`, `a+r<=1`, we have

\[
 c_Aa\le A\le a,\quad B\ge C\ge s_3,\quad
 0\le B-C\le da^2,\quad ar\le1/4.
\]

In particular `A-3qr^2>=a(cA-3m/8)>=0`, so `T>=0`. In (3), discard
the nonnegative `B^2-C^2` and `8q^2r^2` terms, use `-r<=x<=r`, and obtain

\[
\begin{aligned}
 G&\ge2s_3a(c_A-3m/8)-8qr\{A+(B-C)r\}\\
  &\ge a\{2s_3(c_A-3m/8)-m/4-md/16\}.
\end{aligned}
\]

The last step uses `A<=a`, `B-C<=da^2`, `ar<=1/4`, and
`a^2r^2<=1/16`. The exact final coefficient is

\[
 \frac{34254220103996142329}{64000000000000000000}
 =0.5352221891249397\ldots>0.
\]

Thus `(r+x)G>=0`, and since `T>=0`,

\[
 |L_0|\le A+Br-3qr^2.
\]

Combining with (2), the price is bounded by

\[
 A+Br-3qr^2+m(1-a-r).
\]

This is exactly the real dual price of the real preprocessor prefix

\[
 (a,b,c,d)=(a,-r,0,-(1-a-r)).
\]

It is already controlled by the base certificate on the real Wiener ball.
Therefore

\[
 |L(\Phi_{\rm phys}(p))|\le\alpha z
\]

for arbitrary complex charged preprocessors. The case `a=0` is included;
all comparison inequalities are then non-strict where necessary.

## 4. Neutral factors, mixtures and replay

The neutral multiplier argument from the base theorem now applies
unchanged. Coefficientwise conjugation preserves the Wiener norm, hence

\[
 \|[\Phi_{\rm phys}(p)]_{\le5}\|_W
 \le\alpha(1+1/8+3/64)=75\alpha/64.
\]

The existing strict inequality `(75/64)*lambda_max<z` controls every
nonconstant even factor. The constant factor uses the absolute phase price
just proved. Consequently arbitrary complex even contractive `K` and all
convex mixtures satisfy the same ceiling.

```
python3 tools/coupled_preprocess_complex_certificate.py \
  --output handoff/research-third-decimal/coupled-image-20261023/preprocess/complex-preprocessor-certificate.json
```

The checker requires the sibling `coupled_preprocess_mixture_certificate.py`
and reruns its exact Bernstein and pi-enclosure proof. It imports no
numerical search package. The extension checker and certificate ran on the
research droplet. Independent algebraic audit confirmed the physical
coefficient expansion, factorization and positivity estimates.
