<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-partial-2026-11-15/conjecture_k_partial_results/all-sector/GAUSSIAN_LOCAL_STABILITY.md, 15 November 2026; Agent-ID: codex-c7e2. -->
# Gaussian-core local stability for every positive profile

Agent ID: codex-c7e2 (all-sector worker). 2026-11-15.

This is an analytic second-variation theorem, not a proof of Conjecture K. In particular, strict negativity on visible sectors does not imply a dimension-uniform neighbourhood theorem, and the remote directions remain neutral to second order.

Provenance: the October manuscript `ch40-gpt-global-local-K.tex` already proves a local all-sector theorem at the peak profile using certified Hessian bounds. It explicitly makes no universal claim over all profiles or all variances. The contribution here is an analytic proof of the positivity for every `a,b>0` and every finite `v≥0`, followed by the corresponding all-profile fixed-block local corollary. The sector decomposition itself is inherited mathematical structure, not a new claim.

## Theorem

Let `a>0`, `b>0`, let `Z` be a standard complex Gaussian, `T=|Z|²`, and `L=Z(a+bT)`. Let `W` be an independent standard complex Gaussian, independent of every coordinate used by a finite-dimensional cubic Wick polynomial `H∈H_{2,1}`. Write

\[
B(v)=2\mathbb E|L+\sqrt v W|,
\quad \Lambda_p(G)=\mathbb E|L+G|+\mathbb E|L-G|-p\mathbb E|G|^2.
\]

For every `v≥0`,

\[
\frac12\left.\frac{d^2}{dt^2}\Lambda_p(\sqrt vW+tH)\right|_{t=0}
\le (B'(v)-p)\|H\|_2^2.
\]

At `p=B'(v)`, equality holds precisely when `H` is remote, i.e. independent of `Z`. Every nonzero visible sector incurs a strictly positive quadratic cost. Consequently every Gaussian benchmark maximiser is second-order stable against all fixed finite-dimensional cubic perturbations independent of its Gaussian bath, throughout the conjectured box and indeed for every positive profile `a,b`.

The derivative at `v=0` means the right derivative. For an interior benchmark maximiser `v*>0`, `p=B'(v*)`; for a boundary maximiser `v*=0`, `p≥B'(0)`.

## 1. Rice Hessian and a monotone smoothing ratio

Put `m_v(r)=E|r+√vW|`, `R_v(r)=m_v'(r)/r` and `D_v(r)=m_v''(r)`. Gaussian convolution of the Laplace representation of the Euclidean norm gives

\[
R_v(r)=\frac1{\sqrt\pi}\int_0^{1/v}s^{-1/2}(1-vs)^{1/2}e^{-sr^2}\,ds,
\]

with upper endpoint infinity for `v=0`. Thus `R_0(r)=1/r`, `R_v>0`, and `D_v≤R_v`. Write `r(t)=√t(a+bt)` and abbreviate `R_v(t)=R_v(r(t))`. Then

\[
D_v(t)=R_v(t)+2w(t)R_v'(t),
\quad w(t)=\frac{t(a+bt)}{a+3bt},
\quad B'(v)=\mathbb E\frac{D_v(T)+R_v(T)}2.
\]

The last identity is the complex Gaussian heat equation, `∂_v m_v=Δm_v/4`.

For `X∼Gamma(3/2,1)`, differentiation of the integral and the change of variables `x=sr²` give

\[
\frac{-R_v'(t)}{-R_0'(t)}
=\mathbb E\left(1-\frac{vX}{r(t)^2}\right)_+^{1/2}
=:k_v(t).
\]

For finite `v`, `k_v(t)>0` for `t>0` and is nondecreasing in `t`. This transports any positive zero-buffer integral whose integrand has at most one sign change, from negative to positive, to every `v≥0`: if `f≤0` before `t0`, `f≥0` after `t0`, and `∫f>0`, then

\[
\int k_v f\ge k_v(t_0)\int f>0.
\]

If `f≥0` everywhere, strict positivity follows directly.

## 2. Exact sector decomposition of the Hessian

Use the orthogonal decomposition

\[
H=q+(T-1)r_A+\frac{Z^2\overline{r_B}}{\sqrt2}
 +ZQ+\overline ZP+\frac{\nu Z(T-2)}{\sqrt2}.
\]

Here `q` is remote cubic; `r_A,r_B` are remote holomorphic linear forms; `Q∈H_{1,1}`, `P∈H_{2,0}`, and `ν∈C`. Put `p_v=B'(v)` and let `C_v(H)` denote the quadratic cost at price `p_v`:

\[
\Lambda_{p_v}(\sqrt vW+tH)
=\Lambda_{p_v}(\sqrt vW)-t^2 C_v(H)+o(t^2).
\]

The remote block has cost zero. Orthogonality and angular averaging remove every cross block except A/B. On A/B the cost matrix is

\[
M_v=\begin{pmatrix}A_v&m_v^{AB}\\m_v^{AB}&B_v^{AB}\end{pmatrix},
\]

\[
A_v=p_v-\mathbb E\tfrac{D_v+R_v}{2}(T-1)^2,
\quad B_v^{AB}=p_v-\mathbb E\tfrac{D_v+R_v}{4}T^2,
\quad m_v^{AB}=\mathbb E\frac{(R_v-D_v)T(T-1)}{2\sqrt2}.
\]

Its contribution is `A_v||r_A||²+B_v^{AB}||r_B||²+2m_v^{AB} Re E[r_A overline(r_B)]`.

The `Q` block is the sum of its radial and tangential costs, with coefficients `p_v−E[T D_v]` and `p_v−E[T R_v]`. The `P` coefficient is `p_v−E[T(D_v+R_v)/2]`. The `ν` coefficients are `p_v−E[T(T−2)²D_v/2]` and `p_v−E[T(T−2)²R_v/2]`. Since `D_v≤R_v`, it suffices to prove positivity of the tangential `Q` and `ν` coefficients and of `M_v`.

The norm Hessian formula used here is

\[
\operatorname{Hess}m_v(re^{i\theta})[h,h]
=\frac{D_v+R_v}{2}|h|^2
+\frac{D_v-R_v}{2}\Re(e^{-2i\theta}h^2).
\]

## 3. The Q/P blocks

Exponential integration by parts gives

\[
p_v-\mathbb E[TR_v]
=\mathbb E\left[\frac{2bT^2}{a+3bT}(-R_v'(T))\right]>0.
\]

Therefore both Q coefficients and the P coefficient are strictly positive. This is a pointwise-positive integral and requires no range restriction on `a/b`.

## 4. The A/B matrix

For complex scalars `α,β`, put `A=|α|²`, `B=|β|²`, and `C=Re(α overline β)`. Direct integration by parts in `T` yields

\[
(\alpha,\beta)^*M_v(\alpha,\beta)
=\mathbb E\left[\frac{T^2}{a+3bT}(-R_v'(T))H_{\alpha,\beta}(T)\right],
\]

where

\[
H(t)=A[a(t-1)+bt(1+t)]
+\frac B2[a(t+1)+b(t^2+3t+4)]
+\sqrt2 C(t-1)(a+bt).
\]

The quadratic coefficient is `b|α+β/√2|²≥0`. The linear coefficient is the quadratic form with matrix

\[
\begin{pmatrix}a+b&(a-b)/\sqrt2\\(a-b)/\sqrt2&(a+3b)/2\end{pmatrix},
\]

whose determinant is `3ab+b²>0`. Thus `H(t)` is strictly increasing for every nonzero `(α,β)`. Its sign is either always positive or changes once from negative to positive.

It remains to prove `M_0>0`. Let

\[
J_j=\int_0^\infty\frac{t^{j-1/2}e^{-t}}{a+bt}\,dt.
\]

At `v=0`,

\[
M_0=\begin{pmatrix}
J_1-J_2/2&(J_2-J_1)/(2\sqrt2)\\
(J_2-J_1)/(2\sqrt2)&J_0/2-J_2/4
\end{pmatrix}.
\]

Using `1/(a+bt)=∫₀∞e^{-as}e^{-bst}ds` and `x=(1+bs)^{-1}∈(0,1]`, this is the positive weighted integral of

\[
\frac{\sqrt\pi\sqrt x}{4}
\begin{pmatrix}
2x-3x^2/2&(3x^2/2-x)/\sqrt2\\
(3x^2/2-x)/\sqrt2&2-3x^2/4
\end{pmatrix}.
\]

The upper-left entry is positive and the determinant of the displayed inner matrix is `x(4−7x/2)>0`. Hence `M_0` is positive definite. The single-crossing argument from Section 1 now proves `M_v>0` for every finite `v≥0`.

## 5. The visible cubic ν block

For its smaller (tangential) cost, integration by parts gives

\[
p_v-\mathbb E\frac{T(T-2)^2}{2}R_v
=\mathbb E\left[\frac{T^2}{2(a+3bT)}(-R_v'(T))P(T)\right],
\]

\[
P(t)=3bt^2+(a-3b)t+4b-a.
\]

If `a≥3b`, `P` is increasing on the positive axis. If `a<3b`, its minimum is

\[
b\left(4-r-\frac{(r-3)^2}{12}\right)>0,
\qquad r=a/b\in(0,3).
\]

Thus this kernel too is nonnegative everywhere or has a single negative-to-positive crossing. At `v=0` its integral is

\[
\frac{J_0-J_3+4J_2-4J_1}{2}.
\]

The same Laplace representation writes this as the positive weighted integral of

\[
\frac{\sqrt\pi\sqrt x}{2}
\left(1-2x+3x^2-\frac{15}{8}x^3\right).
\]

The polynomial is decreasing on `[0,1]` because its derivative `−2+6x−45x²/8` is strictly negative (discriminant `36−45<0`); its minimum is `1/8`. The zero-buffer cost is strictly positive, so the monotone smoothing ratio proves positivity for every `v`.

## 6. Differentiability and limitations

For `v>0` the convolved norm has bounded Hessian, so the second-variation passage follows from `H∈L²`. At `v=0`, the elementary paired norm remainder is bounded by a fixed multiple of `|H|²/|L|`; its expectation is finite for every finite cubic, since the only new visible-coordinate singularity is `T^{-1/2}` and all remote polynomial moments are finite. Dominated convergence therefore gives the stated Hessian there too. The exponential integration-by-parts boundary terms vanish: their polynomial factors are at least `T` or `T²`, whereas `R_0(T)=O(T^{-1/2})` at zero.

The Hessian theorem alone gives no conclusion about a non-Gaussian intermediate core `√vW+tH`, finite-amplitude monotonicity, or Gaussian approximation uniform in dimension. Section 7 handles the fourth-order neutral remote directions in each fixed finite block, but provides no global or dimension-uniform conclusion. Those limitations are why this theorem does not prove K.

## 7. Corollary: a strict local maximum in every fixed finite block

Suppose `v*>0` is the Gaussian benchmark maximiser, so `p=B'(v*)`. Fix finitely many genuine Gaussian coordinates, independent of the auxiliary bath `W`. Then `(v,H)=(v*,0)` is a strict local maximum of

\[
\Psi(v,H)=\Lambda_p(\sqrt vW+H),\qquad v\ge0,\quad H\in H_{2,1}
\]

within this fixed coordinate block. More quantitatively, write `H=q+h` with `q` remote and `h` its visible-sector part. There are positive constants `c_1,c_2,c_3` and a neighbourhood of `(v*,0)` such that

\[
S-\Psi(v,q+h)\ge
c_1(v+\|q\|_2^2-v_*)^2+c_2\|q\|_2^4+c_3\|h\|_2^2.
\]

The constants and neighbourhood may depend on the finite coordinate block. In particular, this does not yield a dimension-uniform local theorem or a global bound.

### Proof of the corollary

The known positive Gaussian scale-mixture representation of `L` gives

\[
B(v)=\sqrt\pi\,\mathbb E\sqrt{V+v},
\quad B''(v)=-\frac{\sqrt\pi}{4}\mathbb E(V+v)^{-3/2}<0\quad(v>0).
\]

This invokes the already proved scale-mixture statement of the repository (`STATUS.md` 2.7). Thus `f(v)=B(v)-pv` has strictly negative second derivative near `v*`.

For fixed positive `v`, Gaussian smoothing bounds every positive-order spatial derivative of `m_v`; on a fixed finite chaos block all polynomial moments are bounded by powers of the L² norm. The paired functional is even in `H`. Its Taylor expansion through degree four therefore has a remainder bounded by `C||H||_2^6`, uniformly for `v` in a small compact interval about `v*`.

For remote `q`, circular symmetry gives the explicit expansion

\[
\Psi(v,q)=B(v)-pv+(B'(v)-p)u
+\frac{B''(v)}4\mathbb E|q|^4+O(u^3),
\qquad u=\|q\|_2^2.
\]

Indeed the average fourth directional derivative in two dimensions is `3Δ²/8`, and `B''=EΔ²m_v/8`; its Taylor coefficient is consequently `B'' E|q|⁴/4`. Equivalently this coefficient is fixed by testing circular Gaussian `q`, whose fourth moment is `2u²`, against `B(v+u)`.

Writing `κ₄(q)=E|q|⁴−2u²`, Taylor expansion of `B(v+u)` yields

\[
\Psi(v,q)=f(v+u)+\frac{B''(v)}4\kappa_4(q)+O(u^3).
\]

Every nonzero finite-dimensional cubic has `κ₄(q)>0`. One elementary verification is to put `F=Re q=I₃(k)` in real Gaussian coordinates. Circularity gives

\[
\mathbb EF^4-3(\mathbb EF^2)^2=\frac38\kappa_4(q).
\]

For a symmetric real third-order tensor `k`, the Wick product formula gives

\[
\mathbb EF^4-3(\mathbb EF^2)^2
=324\big(\|k\otimes_1 k\|^2+6\|\widetilde{k\otimes_1 k}\|^2\big)
+324\big(\|k\otimes_2 k\|^2+2\|\widetilde{k\otimes_2 k}\|^2\big)>0.
\]

The last contraction is a nonzero positive Gram matrix when `k≠0`. Compactness of the L²-unit sphere in the fixed remote block now gives `κ₄(q)≥c_n u²` for some `c_n>0`.

The preceding Hessian theorem gives `C_v(h)≥c||h||_2²`, uniformly for nearby `v`. The quadratic remote-visible cross block vanishes. The difference between the homogeneous fourth-degree Taylor terms at `q+h` and `q` is bounded by

\[
C\big(\|q\|^3\|h\|+\|q\|^2\|h\|^2+\|q\|\|h\|^3+\|h\|^4\big).
\]

Young's inequality absorbs the first term into a small multiple of `||h||²` plus `C'||q||⁶`; the other terms and the sixth-order remainder are absorbed likewise on a sufficiently small neighbourhood. The additional quadratic coefficient `(B'(v)-p)||h||²` is small there. Therefore

\[
\Psi(v,q+h)\le f(v+u)+\frac{B''(v)}4\kappa_4(q)
-c'\|h\|^2+C'u^3.
\]

Since `B''` is bounded above by a strictly negative constant near `v*`, the positive fourth-cumulant bound absorbs the `u³` remainder. Strict concavity of `f` supplies the displayed `(v+u−v*)²` term. This proves the corollary.

This extends the peak-profile finite-dimensional local theorem described in the October handoff to every positive profile with an interior Gaussian optimum. It does not supply the missing global or dimension-uniform step.
