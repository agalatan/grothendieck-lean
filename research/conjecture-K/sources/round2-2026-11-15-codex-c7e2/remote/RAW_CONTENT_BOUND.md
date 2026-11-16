<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/remote/RAW_CONTENT_BOUND.md, 15 November 2026; Agent-ID: codex-c7e2. -->
<!-- Intended filepath: codex-c7e2-round2/remote/RAW_CONTENT_BOUND.md -->
# Uniform raw A/B content bounds for circular cubic chaos

Research note, 15 November 2026. This proves a dimension-independent
`O(delta^(3/2))` bound for both raw shell contents. The constants are finite
and uniform on each compact set of visible profiles with `a > 0, b >= 0`.
No sharp numerical derivative estimate is required. This does not itself
prove global Conjecture K.

## Statement

Let the Gaussian coordinates be standard proper complex Gaussians. Let
`q` belong to the circular cubic chaos `H_(2,1)` in coordinates independent
of a standard proper complex Gaussian `Z`. Set

\[
u=\mathbb E|q|^2,\qquad
\delta=\mathbb E|q|^4-2u^2\ge0,
\qquad T=|Z|^2,\qquad L=Z(a+bT),
\]

where `a > 0, b >= 0`. Define

\[
\Phi_A(y)=\mathbb E_Z[(T-1)\operatorname{ph}(L+y)],
\qquad
\Phi_B(y)=\mathbb E_Z\left[\frac{Z^2}{\sqrt2}
              \overline{\operatorname{ph}(L+y)}\right],
\]

and let `c_A(q)=Pi_(1,0) Phi_A(q)`, `c_B(q)=Pi_(1,0) Phi_B(q)`, where
the projection is in the remote Gaussian coordinates. The choice of
`ph(0)` does not matter.

There exist finite constants `K_A(a,b), K_B(a,b)` such that in every
dimension and at every energy

\[
\boxed{\|c_A(q)\|_2^2\le K_A(a,b)\delta^{3/2},\qquad
       \|c_B(q)\|_2^2\le K_B(a,b)\delta^{3/2}.}\tag{1}
\]

For every compact parameter set

\[
\mathcal P\subset\{(a,b):a>0,\ b\ge0\},
\]

one can choose both constants uniformly over `P`.

These are the raw contents relevant to variations
`h_A=(T-1)r_A` and `h_B=Z^2 conjugate(r_B)/sqrt(2)`: for the even visible
shells the derivative of the two-sign objective is

\[
2\Re\mathbb E[\overline{r_A}\Phi_A(q)]
 +2\Re\mathbb E[\overline{r_B}\Phi_B(q)].\tag{2}
\]

In particular, with `e_A=||r_A||_2^2`, `e_B=||r_B||_2^2`, its absolute
value is at most

\[
2\delta^{3/4}
  \left(\sqrt{K_A e_A}+\sqrt{K_B e_B}\right)
\le 2\sqrt{(K_A+K_B)(e_A+e_B)}\,\delta^{3/4}.\tag{3}
\]

Any linear subtraction from `Phi_A` or `Phi_B` leaves these contents
unchanged, since `Pi_(1,0) q = 0`.

## 1. The real cubic resolvent estimate

This section reproduces the complete argument in repository source
`research/conjecture-K/sources/received-2026-11-15-tilted-sector/content_tensor_next.md`,
Sections 1--2, so the input and normalization are explicit.

Let `F=I_3(f)` be real cubic Gaussian chaos, with `f` symmetric and
`E I_k(f)^2=k! ||f||^2`. Put

\[
\sigma^2=\mathbb EF^2,\qquad
\kappa=\mathbb EF^4-3\sigma^4.
\]

For every real odd `C^3` function `m` with
`M_3=sup_x |m'''(x)| < infinity`, and every real first-chaos `H` with
`E H^2=1`,

\[
\boxed{|\mathbb E[H m(F)]|^2\le\frac{M_3^2}{16}\kappa^{3/2}.}\tag{4}
\]

To prove this, set `B_ij=sum_(k,l) f_ikl f_jkl`, `r=||B||_HS`.
For the unit vector `h` defining `H`, put `g=f_h`, `Y=I_2(g)`.
Then `||g||^2=h^T B h <= r`, and Gaussian integration by parts gives

\[
\mathbb E[H m(F)]=3\mathbb E[Y m'(F)].\tag{5}
\]

Writing `F^2=sigma^2+J_2+J_4+J_6`, the product formula yields

\[
J_2=18I_2(B),\quad
J_4=9I_4(\operatorname{Sym}(f\otimes_1 f)),\quad
\Gamma:=|DF|^2=3\sigma^2+2J_2+J_4.
\]

The identity `EF^4=E[F^2 Gamma]` follows from integration by parts
against `F^3`. Hence

\[
\kappa=2\|J_2\|_2^2+\|J_4\|_2^2\ge1296r^2,
\qquad \mathbb E(\Gamma-3\sigma^2)^2\le2\kappa.\tag{6}
\]

Let `T_sigma=sigma^2 d^2/dx^2 - x d/dx`, with semigroup `P_t`, and set

\[
\psi(x)=\int_0^\infty e^{2t}P_{3t}
   [m'-\mathbb E m'(N_\sigma)](x)\,dt.
\]

Since `m'` is even and centered, its first nonzero Gaussian degree is
at least two; the integral converges. The Mehler formula gives

\[
(3T_\sigma+2)\psi=-(m'-\mathbb Em'(N_\sigma)),
\qquad
\psi''=\int_0^\infty e^{-4t}P_{3t}m'''\,dt,
\qquad \|\psi''\|_\infty\le M_3/4.\tag{7}
\]

The Gaussian generator chain rule, self-adjointness, and `LY=-2Y` give

\[
\mathbb E[Y m'(F)]
 =\mathbb E[Y(\Gamma-3\sigma^2)\psi''(F)].\tag{8}
\]

Therefore

\[
\begin{aligned}
|\mathbb E[H m(F)]|
&\le\frac{3M_3}{4}\sqrt{2r}\sqrt{2\kappa}\\
&\le\frac{M_3}{4}\kappa^{3/4},
\end{aligned}
\]

proving (4). Bounded `m'''` implies the needed polynomial growth, so
these identities follow by ordinary smooth truncation if desired. The
case `sigma=0` is trivial.

## 2. Exact angular conversion to complex first-chaos content

Suppose that an odd real `C^3` function `m` with bounded third derivative
defines a charge-one response through

\[
\Phi(y)=\frac14\int_0^{2\pi}e^{i\theta}
               m(\Re(e^{-i\theta}y))\,d\theta.\tag{9}
\]

For any unit holomorphic complex first-chaos `X`, the pair `(q,X)` is
jointly circular under the common rotation of its underlying coordinates.
Consequently each angular integrand has the same expectation after
multiplication by `conjugate(X)`:

\[
\mathbb E[\overline X\Phi(q)]
 =\frac\pi2\mathbb E[\overline X m(\Re q)].\tag{10}
\]

Choose the phase of `X` so that the left side is real and nonnegative.
Since `m` is real, taking real parts and setting `H=sqrt(2) Re X` gives

\[
|\mathbb E[\overline X\Phi(q)]|
 =\frac\pi{2\sqrt2}\mathbb E[H m(\Re q)].\tag{11}
\]

Here `E H^2=1`. Circularity of `q` gives

\[
\mathbb E(\Re q)^2=u/2,\qquad
\mathbb E(\Re q)^4=\tfrac38\mathbb E|q|^4,
\qquad \kappa_4(\Re q)=\tfrac38\delta.\tag{12}
\]

Taking the supremum in (11) over all unit `X` and using (4) proves

\[
\boxed{\|\Pi_{1,0}\Phi(q)\|_2^2
 \le \frac{\pi^2}{128}\left(\frac38\right)^{3/2}
           \|m'''\|_\infty^2\delta^{3/2}.}\tag{13}
\]

The factor in front of the derivative norm is about `0.01770666`;
the decimal is unnecessary for the proof.

## 3. The two raw scalar responses

Define

\[
m_A(x)=\mathbb E[(T-1)\operatorname{sign}(\Re L+x)],
\qquad
m_B(x)=\mathbb E\left[\frac{Z^2}{\sqrt2}
                          \operatorname{sign}(\Re L+x)\right].\tag{14}
\]

The second expression is real because complex conjugation of `Z` fixes
`Re L` and conjugates `Z^2`. Both are odd because replacing `Z` by `-Z`
preserves their weights and reverses `Re L`.

The elementary phase identity

\[
\operatorname{ph}(w)=\frac14\int_0^{2\pi}e^{i\theta}
                  \operatorname{sign}(\Re(e^{-i\theta}w))\,d\theta
\]

directly gives (9) with `Phi_A,m_A`, by rotating `Z` in the expectation.
For `Phi_B`, conjugate the phase identity. Its angular multiplier is
`e^(-i theta)`. In the inner expectation substitute `Z=e^(i theta) Z'`;
the weight `Z^2` contributes `e^(2i theta)`. The combined multiplier is
again `e^(i theta)`, so (9) holds with `Phi_B,m_B` as well. This verifies
that the same complex estimate applies to the B-shell, despite its
antiholomorphic remote linear factor.

## 4. Smoothness and a uniform derivative bound

The map

\[
\Psi_{a,b}:z\longmapsto z(a+b|z|^2)
\]

is a proper smooth diffeomorphism of the plane when `a>0,b>=0`.
If `w=Psi(z)`, `t=|z|^2`, then

\[
|w|^2=t(a+bt)^2,\qquad
D(t):=\det D\Psi(z)=(a+bt)(a+3bt)>0.\tag{15}
\]

The weighted pushforward densities appearing in (14) are

\[
f_A(w)=\frac{(t-1)e^{-t}}{\pi D(t)},\qquad
f_B(w)=\frac{w^2e^{-t}}
              {\sqrt2\pi(a+bt)^2D(t)}.\tag{16}
\]

Both are Schwartz functions on `R^2`; `f_B` is complex valued. Here is
a proof that also establishes the required parameter uniformity.
On a compact profile set choose `a_min>0` and finite `a_max,b_max`.
The differential of `Psi` has eigenvalues `a+bt` and `a+3bt`, both at
least `a_min`. Derivatives of its inverse, of every fixed order, are
therefore bounded by a polynomial in `|w|` with coefficients uniform on
the profile set. This follows by differentiating `Psi(Psi^(-1)(w))=w`
recursively and using `|Psi^(-1)(w)|<=|w|/a_min`.
Moreover

\[
|w|\le (a_{\max}+b_{\max})(1+t)^{3/2},
\]

so `t >= c |w|^(2/3)-1` with one positive constant `c` for the profile
set. Every derivative of either expression in (16) is bounded by a
uniform polynomial in `|w|` times `exp(-t)`. Thus all their Schwartz
seminorms are bounded uniformly. This includes the endpoint `b=0`.

Let

\[
g_A(s)=\int_{\mathbb R}f_A(s+iy)\,dy,
\qquad
g_B(s)=\int_{\mathbb R}f_B(s+iy)\,dy.
\]

Integration in one coordinate maps Schwartz functions continuously to
Schwartz functions. The marginals `g_A,g_B` are real and even. From
(14), or directly differentiating the integrated sign function,

\[
m_j'(x)=2g_j(-x),\qquad m_j'''(x)=2g_j''(-x),
\qquad j\in\{A,B\}.\tag{17}
\]

Consequently both third-derivative suprema are finite and bounded
uniformly on compact positive profile sets. For example one valid
choice of constants in (1) is

\[
K_j(a,b)=\frac{\pi^2}{128}\left(\frac38\right)^{3/2}
               \bigl(2\|g_j''\|_\infty\bigr)^2.
\tag{18}
\]

Combining (13)--(18) proves (1), with no energy restriction and no
dimension dependence.

## Consequence for a near-Gaussian argument

Suppose a separate argument supplies a remote deficit
`D(q)>=c delta` on an energy/profile region and a positive quadratic
margin `mu(e_A+e_B)` against these visible shell perturbations. The raw
linear gain (3) can then be absorbed by Young's inequality at cost

\[
\frac{K_A+K_B}{\mu}\,\delta^{3/2}.
\]

This is lower order than `c delta` as `delta -> 0`, uniformly on the
region. Thus the previously unproved raw content estimate is not an
obstruction to a uniform near-Gaussian proof. Establishing the needed
quadratic margin and controlling other visible sectors remain separate
tasks.

## Appendix: cumulant inheritance under removal of one complex coordinate

Let `G` be circular cubic chaos in the visible coordinate `Z` and remote
coordinates, let `q=E[G | remote]`, and let `h=G-q`. Set
`delta_G=E|G|^4-2(E|G|^2)^2`. Then

\[
\boxed{\delta(q)\le\frac52\delta_G,\qquad
       \mathbb E|h|^2\le\frac{\sqrt3}{2}\sqrt{\delta_G}.}\tag{19}
\]

Indeed use the real symmetric cubic tensor `f` of `Re G`, with
`B=f tensor_2 f` and `r=||B||_HS`, as in Section 1. The tensor `f_0` of
`Re q` is the restriction of `f` to remote indices. Its matrix
`B_0=f_0 tensor_2 f_0` is positive semidefinite and no larger than the
remote compression of `B`: the difference is the sum of the outer
products of the vectors `(f_ikl)_i` over pairs `(k,l)` with at least one
visible index. Consequently `r_0<=r`.

The unsymmetrized contraction norms satisfy
`||f tensor_1 f||=||f tensor_2 f||=r`. From (6), therefore,

\[
1296r^2\le\kappa_4(\Re G)\le3240r^2.
\]

Applying the upper bound to `f_0` and the lower bound to `f` proves
`kappa_4(Re q)<= (5/2) kappa_4(Re G)`, which is the first assertion by
circularity.

There are two real visible indices. By symmetry of `f`,

\[
\begin{aligned}
\mathbb E|h|^2
&=12\sum_{(i,j,k):\,\text{some index visible}}f_{ijk}^2\\
&\le36\sum_{i:\,\text{visible}} B_{ii}
 \le36\sqrt2\,r
 \le\sqrt2\sqrt{\kappa_4(\Re G)}
 =\frac{\sqrt3}{2}\sqrt{\delta_G}.
\end{aligned}
\]

This proves (19), again without a dimension dependence.
