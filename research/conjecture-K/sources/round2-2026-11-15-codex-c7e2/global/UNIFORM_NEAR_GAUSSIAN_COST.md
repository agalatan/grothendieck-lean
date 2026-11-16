<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round2-2026-11-15/codex-c7e2-round2/global/UNIFORM_NEAR_GAUSSIAN_COST.md, 15 November 2026; Agent-ID: codex-c7e2. -->
# Dimension-uniform visible-sector cost at a nearly Gaussian remote cubic

Agent ID: codex-c7e2, all-sector worker. 2026-11-15.

This proves the uniform quadratic-cost step needed to upgrade the fixed-block local theorem. It does not by itself prove global Conjecture K. The threshold is existential, not a numerical certificate.

## 1. Statement

Fix `a,b>0`, let `L=Z(a+b|Z|²)`, and fix a positive Gaussian variance `u*>0` with `p=B'(u*)`, where `B(v)=2E|L+√vW|`. Let `κ*>0` be the smallest of the visible-sector quadratic costs at the independent Gaussian core of variance `u*`: the A/B matrix least eigenvalue, the radial/tangential Q and ν coefficients, and the P coefficient. Their positivity is proved analytically in `GAUSSIAN_LOCAL_STABILITY.md` (round 1).

There is `η>0`, independent of the number of Gaussian coordinates, such that every remote cubic `q∈H_{2,1}` with

\[
\big|\|q\|_2^2-u_*\big|<\eta,
\qquad \delta(q):=\mathbb E|q|^4-2\|q\|_2^4<\eta
\]

satisfies, for every visible-sector cubic `h`,

\[
\boxed{\quad
p\|h\|_2^2-
\frac12\mathbb E\left[
K(L+q)[h,h]+K(L-q)[h,h]
\right]\ge\frac{\kappa_*}{2}\|h\|_2^2.
\quad}
\]

Here `K(x)=D²|x|` is the real two-dimensional norm Hessian and

\[
h=(T-1)r_A+\frac{Z^2\overline{r_B}}{\sqrt2}
+ZQ+\overline ZP+\frac{\nu Z(T-2)}{\sqrt2},
\]

with remote linear `r_A,r_B`, remote quadratic `Q∈H_{1,1}`, `P∈H_{2,0}`, and constant `ν∈C`. All sharing of their Gaussian coordinates with `q` is allowed.

Together with the uniform fractional Taylor remainder, this gives constants `η,r>0`, independent of dimension, for which

\[
\Lambda_p(q+h)\le \Lambda_p(q)+\ell_q(h)
-\frac{\kappa_*}{4}\|h\|_2^2
\quad\text{whenever }\|h\|_2\le r,
\]

where

\[
\ell_q(h)=\mathbb E\Re\left[
\left(\overline{\operatorname{ph}(L+q)}-
\overline{\operatorname{ph}(L-q)}\right)h
\right].
\]

The linear term only involves A/B contents. The result allows arbitrarily many remote coordinates; it does not require the coefficient vector of `h` to converge to a Gaussian vector.

## 2. Mixed contractions vanish

Use real standard Gaussian coordinates, with each complex coordinate `(X+iY)/√2`. A real component of `q_j` is a real third chaos `I₃(f_j)`. Circularity gives

\[
\kappa_4(\Re q_j)=\kappa_4(\Im q_j)=\frac38\delta(q_j).
\]

The third-chaos fourth-cumulant identity is a positive sum of squared contractions; hence

\[
\|f_j\otimes_1f_j\|+\|f_j\otimes_2f_j\|
\longrightarrow0
\quad\text{when }\delta(q_j)\to0.
\]

If `V_j=I_m(g_j)`, `m=1` or `2`, and `EV_j²` is bounded, then for every permissible `r≥1`,

\[
\|f_j\otimes_rg_j\|^2
=\langle f_j\otimes_{3-r}f_j,
g_j\otimes_{m-r}g_j\rangle
\le \|f_j\otimes_{3-r}f_j\|\,\|g_j\|^2
\longrightarrow0.
\]

The equality is the ordinary index rearrangement of the contraction norm. The last inequality uses `||g⊗_sg||≤||g||²` and includes `s=0`.

For the real Gaussian carré du champ `Γ(F,H)=∇F·∇H`, its product formula is

\[
\Gamma(I_k(f),I_m(g))
=km\sum_{r=1}^{\min(k,m)}(r-1)!
\binom{k-1}{r-1}\binom{m-1}{r-1}
I_{k+m-2r}(\widetilde{f\otimes_rg}).
\]

Consequently

\[
\Gamma(\Re q_j,V_j)\to0,
\qquad\Gamma(\Im q_j,V_j)\to0
\quad\text{in }L^2.
\]

The same contraction bounds, now between the two real components of `q_j`, give

\[
\frac13\Gamma(q_{j,i},q_{j,k})
-\frac{u_j}{2}\mathbf1_{i=k}\longrightarrow0
\quad\text{in }L^2,
\qquad u_j=\|q_j\|_2^2.
\]

These assertions are dimension-free: all numerical coefficients in the product formula depend only on chaos orders 1, 2 and 3.

## 3. Joint asymptotic independence from the entire coefficient vector

Normalize `||h_j||₂=1`, and collect the real and imaginary parts of `r_A,r_B,Q,P` into the eight-dimensional vector `V_j`. Every component has L² norm at most one. Hypercontractivity bounds every fixed moment of `V_j` uniformly in dimension. The deterministic complex coefficient `ν_j` is bounded too.

After passage to a subsequence, `(q_j,V_j,ν_j)` converges weakly to `(Q₀,V,ν)`, and all fixed second moments are preserved. Suppose `u_j→u*>0` and `δ(q_j)→0`. For a smooth compactly supported real test function `φ(q,V)`, the eigenfunction integration-by-parts identity gives

\[
\mathbb E[q_{j,i}\phi(q_j,V_j)]
=\frac13\sum_{k=1}^{2}\mathbb E[
\Gamma(q_{j,i},q_{j,k})\,\partial_{q_k}\phi]
+\frac13\sum_{\ell=1}^{8}\mathbb E[
\Gamma(q_{j,i},V_{j,\ell})\,\partial_{V_\ell}\phi].
\]

Passing to the limit using Section 2 gives

\[
\mathbb E[Q_{0,i}\phi(Q_0,V)]
=\frac{u_*}{2}\mathbb E[\partial_{q_i}\phi(Q_0,V)].
\]

This is the conditional Gaussian Stein identity. Taking product tests `φ(q,V)=ψ(q)χ(V)` shows that the conditional law of `Q₀` given `V` is `N(0,(u*/2)I₂)`. Thus

\[
Q_0\sim\sqrt{u_*}W,
\qquad Q_0\ \text{is independent of }V.
\]

No Gaussian limit for `V_j` was assumed or obtained. This avoids an unjustified application of a multivariate Gaussian convergence theorem to the lower-chaos coefficients.

## 4. Uniform integrability of the singular Hessian

The map `z↦L(z)=z(a+b|z|²)` is a radial diffeomorphism. Its Jacobian determinant is `(a+bT)(a+3bT)≥a²`; hence the planar density of `L` is bounded by `M=1/(πa²)`. Since `q_j` is independent of `Z`, the density of `L±q_j` has the same bound, for every law of `q_j`.

For any planar probability density bounded by `M` and `0<s<2`, layer cake with `P(|X|≤r)≤min(1,πMr²)` gives

\[
\mathbb E|L\pm q_j|^{-s}
\le\frac{2}{2-s}(\pi M)^{s/2}
=\frac{2a^{-s}}{2-s}.
\]

As `||K(x)||op=1/|x|`, the absolute Hessian integrand is bounded by `Y_j=|h_j|²/|L±q_j|`. Hölder with exponents 3 and 3/2 gives

\[
\mathbb E Y_j^{6/5}
\le(\mathbb E|h_j|^{36/5})^{1/3}
(\mathbb E|L\pm q_j|^{-9/5})^{2/3}\le C(a).
\]

The first factor is dimension-uniform by degree-three Gaussian hypercontractivity and `||h_j||₂=1`. Thus the Hessian integrands are uniformly integrable despite the moving zero set. No regularity or density assumption on `q_j` itself is needed.

## 5. Passage to the Gaussian quadratic form

The independent visible `Z` can be included in the joint convergence of Section 3. The limiting visible field

\[
h_0=(T-1)R_A+Z^2\overline{R_B}/\sqrt2+ZQ+\overline ZP+\nu Z(T-2)/\sqrt2
\]

has norm one. The moment relations used in the sector decomposition survive the limit, because of uniform fourth moments: the linear variables are proper, `EQ=0`, `P` has charge two, and all moment identities forced by the common remote phase rotation continue to hold.

The function `K(L±q)[h,h]` of `(Z,q,V,ν)` is continuous except where `L±q=0`. In the limiting law, `q=Q₀` is an independent nondegenerate planar Gaussian, so this exceptional set has probability zero. Weak convergence and Section 4 therefore imply convergence of the quadratic Hessian expectation.

The Gaussian-core sector calculation from round 1 uses only these second-moment identities, independence from the Gaussian core and independence from `Z`; it does not require `V` to be Gaussian or itself a genuine finite-chaos vector. Its limiting quadratic cost is at least `κ*||h₀||₂²=κ*`.

If the asserted uniform bound failed, choose `u_j→u*`, `δ(q_j)→0`, and normalized `h_j` whose costs are below `κ*/2`. The preceding argument produces a subsequence whose costs converge to at least `κ*`, a contradiction. This proves Section 1's quadratic inequality.

## 6. Finite amplitude

For `0<α<1`, the Euclidean norm satisfies the pointwise estimate

\[
\left||x+y|-|x|-\langle\operatorname{ph}x,y\rangle
-\tfrac12K(x)[y,y]\right|
\le C_\alpha|y|^{2+\alpha}|x|^{-1-\alpha}.
\]

Split into `|y|≤|x|/2`, where a third-derivative bound proves it, and its complement, where each term is bounded directly. Choosing `α=1/2`, applying Hölder and the negative moments above, and using cubic hypercontractivity gives

\[
|\operatorname{remainder}|\le C(a)\|h\|_2^{5/2}
\]

for both paired terms, uniformly in `q`, dimension and sharing. This is also proved independently by the variational worker. Taking `||h||₂` small enough absorbs this remainder into `(κ*/4)||h||₂²` and proves the finite-amplitude inequality.

The result supplies a genuine dimension-uniform neighbourhood of the remote Gaussian law with visible perturbations. To conclude exact K there, one still combines it with a quantitative remote deficit and a first-variation content bound; those are separate lemmas.

## 7. Compact-variance and compact-profile version, including variance zero

Let `P` be any compact subset of `{(a,b):a>0,b>0}`, and let `M<∞`. There are constants `η,c,r>0`, depending only on `P,M`, such that for every `(a,b)∈P`, every remote cubic `q` of variance `u∈[0,M]` with `δ(q)<η`, and every visible cubic `h`,

\[
\boxed{\quad
B'(u)\|h\|_2^2-
\frac12\mathbb E\{K(L+q)[h,h]+K(L-q)[h,h]\}
\ge c\|h\|_2^2.
\quad}
\]

Consequently, for `||h||₂≤r`,

\[
F(q+h)\le F(q)+\ell_q(h)+B'(u)\|h\|_2^2
-\frac c2\|h\|_2^2,
\qquad F(G)=\mathbb E|L+G|+\mathbb E|L-G|.
\]

This version has no fixed price and permits `u=0`. It is the appropriate form for same-variance comparison with `B(u+||h||²)`.

To prove it, first note that the Gaussian-core matrix coefficients are continuous jointly in `(a,b,u)` even at `u=0`: the Laplace representation gives `0≤D_u≤R_u≤R_0`, and `R_0(T)=1/[√T(a+bT)]` times any required fixed polynomial is integrable, uniformly on `P`. Their strictly positive minimum over `P×[0,M]` is therefore positive.

If the assertion failed, choose a sequence of profiles, variances, remote cubics and normalized visible directions with `δ(q_j)→0`. Take a convergent profile/variance subsequence. If its limiting variance is positive, Sections 2–5 apply with the limiting profile. If its limiting variance is zero, `q_j→0` in L², so the joint limit has `q=0` automatically; independence from the coefficient vector is then trivial and Sections 4–5 give the positive zero-buffer matrix. The density and hypercontractive bounds are uniform on `P`, so the same contradiction works. The Taylor remainder is uniform on `P` as well.

### A uniform bound for the Gaussian benchmark's curvature

If `L=√V W₀` is the established Gaussian scale mixture, then

\[
\sup_{u\ge0}|B''(u)|
\le\frac{\sqrt\pi}{4a^3}\sqrt{1+4b/a}.
\]

Indeed its planar density is `π^{-1}e^{-τ(s)}τ'(s)`, where `s=|L|²` and `τ` is the inverse of `t↦t(a+bt)²`. At zero, `τ'(0)=a^{-2}` and `τ''(0)=−4ba^{-5}`. Comparing with the Gaussian-mixture density `π^{-1}E[V^{-1}e^{-s/V}]`, monotone convergence of its derivative at zero gives

\[
\mathbb EV^{-1}=a^{-2},\qquad
\mathbb EV^{-2}=a^{-4}+4ba^{-5}.
\]

Cauchy–Schwarz yields `EV^{-3/2}≤a^{-3}√(1+4b/a)`, and
`−B''(u)=√π E(V+u)^{-3/2}/4` proves the bound. Thus the tangent correction obeys

\[
0\le B(u)+B'(u)v-B(u+v)
\le\frac{\sqrt\pi}{8a^3}\sqrt{1+4b/a}\,v^2
\quad(u,v\ge0).
\]

## 8. Quantitative fourth-root control: the weighted interpolation lemma

The compactness proof has a quantitative alternative. The complete proof and explicit scalar constants are in `../variational/WEIGHTED_GAUSSIAN_DECOUPLING.md`; they were independently checked by the all-sector worker. We use that direct interpolation proof rather than a second partial-Stein-equation proof.

For any two real remote coefficient fields `C,D` of degree at most two and a bounded planar test `K` with bounded first and second derivatives, write `M₁=max_l ||∂_lK||∞`, `M₂=max_lk ||∂_lkK||∞`. The lemma gives

    |E[CD K(q)] − E[CD] E[K(√uW)]|
      ≤ [3√3 M₂ δ(q)^(1/2)
         +(4√5/3)(3/8)^(1/4) M₁ δ(q)^(1/4)] ||C||₂||D||₂.

There is no lower bound on `u`; the independent Gaussian has the same variance `u=||q||₂²`. All coefficient sharing is allowed. Constants and mixtures of first and second chaos are allowed as `C,D`.

To apply this lemma, integrate out the visible coordinate first. The visible Hessian is a quadratic form in the ten real coefficient fields of `h`. Each matrix entry is a norm-Hessian convolution against a polynomial-weighted pushforward of the Gaussian density under `L`. These densities are smooth, with bounded integrable derivatives, uniformly on a compact positive profile set. The convolution derivatives are bounded by transferring them to the densities and splitting the locally integrable kernel `1/|x|` at radius one.

Applying the displayed inequality entrywise, and using the fixed number of coefficients together with `Σ_i E C_i²=||h||₂²`, proves that a finite locally uniform `C(a,b)` satisfies

    |½E{K(L+q)[h,h]+K(L−q)[h,h]}
       − E Hess(m_u)(L)[h,h]|
       ≤ C(a,b)(δ(q)^(1/4)+δ(q)^(1/2)) ||h||₂².

In the Gaussian term the bath is independent of all coefficient fields. This proves Section 7 from a quantitative error estimate. Evaluating the profile-dependent kernel derivative norms would turn the existential cost threshold into a numerical one.

The contraction proof is specific to coefficients of degree at most two. A general remote cubic coefficient would admit a full third contraction that need not be small. No such coefficient occurs in a visible sector of a cubic Wick polynomial.
