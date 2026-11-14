<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/gaussian_factor_extension/gaussian_factor_certificate/proof.md (file dated 2026-11-05). Only this line was added. -->
# Conjecture K: the full Gaussian-factor class

5 November 2026. **Status: a new restricted theorem, with an analytic proof and
a completed rigorous numerical certificate. General Conjecture K remains
unproved.** The theorem removes the covariance restriction on the
Gaussian-factor class in the supplied monograph. It does not prove the
self-interaction or general mixed-shell cases.

## 1. Statement

All complex Gaussians are standard, with E|Z|² = 1. Let Z, the vector
X = (X₁,…,Xₘ), and the vector Y = (Y₁,…,Yₙ) be independent. Let

\[
P_j=Y^*A_jY-\operatorname{tr}A_j,\qquad
q=\sum_{j=1}^mX_jP_j,\qquad
u=\mathbb E|q|^2=\sum_j\operatorname{tr}(A_jA_j^*),
\]

where each Aⱼ is an arbitrary complex matrix. The matrices need not be normal,
Hermitian, commuting, linearly independent, or orthogonal. There is no bound on
m or n and no restriction on the covariance operator of the Pⱼ.

Set

\[
L=Z(a+b|Z|^2),\quad F(q)=\mathbb E|L+q|+\mathbb E|L-q|,
\quad B(v)=2\mathbb E|L+\sqrt v W|,
\]

where W is independent standard complex Gaussian. Define

\[
F_A(z)=\mathbb E_Z[(|Z|^2-1)\operatorname{ph}(L+z)],\qquad
C(q)=\|\Pi_{1,0}F_A(q)\|_2,\qquad \Delta=B(u)-F(q).
\]

Here Π₁,₀ is the projection onto the full remote holomorphic first chaos,
including the X and Y coordinates and any extra independent coordinates.

**Theorem.** At each of the following three rows, for
551/100000 ≤ u ≤ 463/10000,

\[
\boxed{C(q)^2\le\frac{239}{1000}\,[B(u)-F(q)].}
\tag{1}
\]

| row | ε | ℓ | b | a = ℓ − 2b |
|---|---:|---:|---:|---:|
| peak | 1891/2500 | 1057/1250 | 179/1250 | 699/1250 |
| flank | 149/200 | 4267/5000 | 1467/10000 | 14/25 |
| upper | 1891/2500 | 877/1000 | 19/125 | 573/1000 |

**Consequence of the supplied A-shell cost theorem.** Write
Λ(G) = F(G) − ε⁻¹E|G|² and S = supᵥ[B(v) − v/ε]. For any remote holomorphic
linear U, with arbitrary sharing with X and Y and E|U|² ≤ 113/10000,

\[
\boxed{\Lambda(q+(|Z|^2-1)U)
\le B(u)-u/\varepsilon-\frac1{240}\Delta\le S.}
\tag{2}
\]

The proof of (1) does not assume Conjecture K or a remote domination conjecture.
The deduction of (2) uses the separate 0.24 shell-cost theorem supplied in the
attachments; this new certificate does not reprove that theorem.

## 2. A covariance-sensitive sixth-moment theorem for quadratic vectors

Let H = (H₁,…,H_d) be a real vector whose components are centered Hermitian
quadratic forms in a common standard complex Gaussian vector. Put

\[
V=|H|^2,\qquad \Sigma=\mathbb E[HH^T],\qquad
u=\operatorname{tr}\Sigma>0,\qquad
\rho=\|\Sigma\|_{\mathrm{op}},\qquad \lambda=\rho/u.
\]

Thus 0 < λ ≤ 1. The following inequality holds in every dimension:

\[
\boxed{
\mathbb EV^3\le\frac{25}{3}(u+4\rho)\mathbb EV^2
-\frac{22}{3}\left(u^3+6u\operatorname{tr}\Sigma^2
+8\operatorname{tr}\Sigma^3\right).
}
\tag{3}
\]

Consequently, for Y₀ = V/u,

\[
\mathbb E Y_0=1,\qquad
\mathbb E[Y_0^3-\alpha(\lambda)Y_0^2]\le-\beta(\lambda),
\tag{4}
\]

where

\[
\alpha(\lambda)=\frac{25}{3}(1+4\lambda),\qquad
\beta(\lambda)=\frac{22}{3}(1+6\lambda^2+8\lambda^3).
\tag{5}
\]

**Proof.** For a scalar centered Hermitian quadratic form
H₀ = ∑ᵢ aᵢ(Eᵢ−1), with independent unit exponential Eᵢ, set
sₖ = ∑ᵢ aᵢᵏ and v = s₂. Its fourth and sixth moments are

\[
\mathbb EH_0^4=3v^2+6s_4,\qquad
\mathbb EH_0^6=15v^3+90vs_4+40s_3^2+120s_6.
\]

Since s₃² ≤ v s₄ and s₆ ≤ v s₄,

\[
\mathbb EH_0^6\le\frac{125}{3}v\mathbb EH_0^4-110v^3.
\tag{6}
\]

More explicitly, the difference between the right and left sides is
40(vs₄−s₃²)+120(vs₄−s₆), a sum of two nonnegative quantities.

Let t be an auxiliary standard real Gaussian vector in Rᵈ, independent of H.
Apply (6) to t·H for every fixed t. Its variance is tᵀΣt. Real Gaussian
integration gives

\[
\mathbb E_t(t\cdot H)^6=15V^3,
\]

\[
\mathbb E_t[(t^T\Sigma t)(t\cdot H)^4]
=3uV^2+12V H^T\Sigma H,
\]

\[
\mathbb E_t(t^T\Sigma t)^3
=u^3+6u\operatorname{tr}\Sigma^2+8\operatorname{tr}\Sigma^3.
\]

Take expectations and use HᵀΣH ≤ ρV. Dividing by 15 proves (3).
Finally tr Σ² ≥ ρ² and tr Σ³ ≥ ρ³ imply (4).
The coefficients 3, 12, 15, 1, 6, 8 are also independently checked by exact
Wick-pairing enumeration in `verify_vector_moments.mjs`.

## 3. Apply the lemma to all complex coefficient matrices

For the coefficient vector P = (P₁,…,Pₘ), take

\[
H=(\Re P_1,\Im P_1,\ldots,\Re P_m,\Im P_m).
\]

Each entry is a centered Hermitian quadratic form: use the matrices
(Aⱼ+Aⱼ*)/2 and (Aⱼ−Aⱼ*)/(2i). Moreover |H|² = ∑ⱼ|Pⱼ|² = V.
Thus (3)–(5) apply without any restriction on the complex matrices Aⱼ.

It is the covariance of this **real** vector H that is used below. It must not
be replaced without adjustment by E[PP*]; the pseudocovariance is retained by
realification.

## 4. Exact conditional Gaussian and content identities

Conditionally on Y, q is a proper complex Gaussian of variance V. Hence

\[
F(q)=\mathbb EB(V),\qquad
\Delta=\mathbb E d_u(V),\qquad
d_u(v)=B(u)+B'(u)(v-u)-B(v)\ge0.
\tag{7}
\]

Strict concavity of B follows from the positive Gaussian-mixture
representation supplied in `kernel_proof.md`.

Define

\[
J(v)=\mathbb E_T[(T-1)K_v(\sqrt T(a+bT))],\qquad
K_v(r)=\mathbb E|r+\sqrt v W|^{-1}.
\]

Complex Gaussian integration by parts yields

\[
c_j:=\mathbb E[\overline{X_j}F_A(q)]
=\frac12\mathbb E[P_jJ(V)].
\tag{8}
\]

All coefficients in the Y directions vanish. Indeed F_A is rotation
equivariant and q is conditionally circular given Y, so E[F_A(q)|Y] = 0.
Coefficients in additional independent directions also vanish. Therefore
C(q) = |c|.

If c = 0 the theorem is immediate. Otherwise let e ∈ R²ᵐ be the unit vector
in the direction of the realification of c, and set ξ = e·H. Then

\[
C(q)=\frac12\mathbb E[\xi(J(V)-J(u))],\quad
\mathbb E\xi=0,\quad \xi^2\le V,\quad
\mathbb E\xi^2=e^T\Sigma e\le\lambda u.
\tag{9}
\]

Weighted Cauchy–Schwarz against dᵤ gives

\[
C(q)^2\le\Delta\,
\mathbb E\left[\frac{Z_0}{Y_0}R_u(Y_0)\right],
\tag{10}
\]

where

\[
Y_0=V/u,\quad Z_0=\xi^2/u,\qquad
R_u(y)=\frac{uy[J(uy)-J(u)]^2}{4d_u(uy)}.
\tag{11}
\]

The multiplier Z₀/Y₀ is set to zero at Y₀ = 0. At Y₀ = 1 the numerator
before division is zero; using the continuous value
Rᵤ(1) = uJ′(u)²/[−2B″(u)] is an upper bound and removes the singularity.
Thus (10) remains valid with atoms at either point. If Δ = 0, (7) implies
V = u almost surely, and (8) gives c = J(u)EP/2 = 0 directly.

The constraints needed for (10) are now just

\[
0\le Z_0\le Y_0,\quad \mathbb EY_0=1,\quad
\mathbb EZ_0\le\lambda,\quad
\mathbb E[Y_0^3-\alpha(\lambda)Y_0^2]\le-\beta(\lambda).
\tag{12}
\]

## 5. The completed scalar certificate

Partition λ into

\[
[0,21/25], [21/25,43/50], [43/50,22/25],
[22/25,9/10], [9/10,23/25], [23/25,47/50],
[47/50,24/25], [24/25,49/50], [49/50,1].
\]

For each interval [l,h], use the rational constants
α = α(h) and β = β(l). Both functions in (5) are increasing, so
E[Y₀³−αY₀²] ≤ −β on this interval.

The file `envelopes.json` supplies rational a₀,a₁,a₃,γ with a₃ > 0 and γ ≥ 0.
Write

\[
Q(y)=a_0+a_1y+a_3(y^3-\alpha y^2).
\]

For all three rows, the exact checker proves

\[
Q(y)\ge0,\qquad R_u(y)\le Q(y)+\gamma y
\quad(0.00551\le u\le0.0463,\ y\ge0),
\tag{13}
\]

and checks by rational arithmetic that

\[
a_0+a_1-\beta a_3+\gamma h<239/1000.
\tag{14}
\]

The largest rational cap is

\[
\frac{111866579702833}{468750000000000}
=0.2386487033660437\ldots<0.239.
\]

Because 0 ≤ Z₀/Y₀ ≤ 1 and Q ≥ 0, (13) gives

\[
\frac{Z_0}{Y_0}R_u(Y_0)\le Q(Y_0)+\gamma Z_0.
\]

Taking expectations and using (12), (14), then (10), proves (1).

This is a continuum certificate, not a grid test. In brief:

* A₀(v) = −B″(v) and H₀(v) = J′(v) are positive, decreasing, and convex,
  by their positive mixture formulas in `kernel_proof.md`.
* Their values at 127 dyadic arguments per row have outward Arb enclosures.
  Convexity supplies a piecewise linear upper bound for H₀ and a piecewise
  linear lower bound for A₀.
* The cancellation-free formula

\[
R_u(y)=\frac{uy}{4}
\frac{[\int_0^1H_0(u(1+(y-1)t))\,dt]^2}
{\int_0^1(1-t)A_0(u(1+(y-1)t))\,dt}
\]

  reduces rectangle checks to rational integrals of these linear bounds.
  Monotonicity selects the appropriate rectangle corners. Cubic Bernstein
  coefficients give polynomial lower bounds. Adaptive rational subdivision
  covers the entire rectangle 0 ≤ y ≤ 70.
* For y ≥ 70, the checker uses |J(0)| < 17/10 and −B″(0.1463) > 1 to
  bound Rᵤ(y) by a fixed rational constant, below Q(70)+70γ. Both relevant
  polynomials are increasing on this tail.

No floating-point value decides an envelope inequality. Floating point is used
only for a tentative interval index; exact comparisons validate and correct it.

## 6. Recorded verification

| row | rational envelope boxes | auxiliary positivity boxes | result |
|---|---:|---:|---|
| peak | 2,928,095 | 157 | PASS |
| flank | 210,173 | 157 | PASS |
| upper | 33,711 | 157 | PASS |

All 381 inherited kernel nodes were independently recomputed with Arb at
128-bit precision. Every recomputed enclosure lies inside the stored enclosure
used by the exact checker. See `kernel_recheck.json` and `kernel_recheck.log`.

The scalar envelopes were selected using an exploratory floating-point linear
program. That program is not a proof input: the retained rational coefficients,
analytic kernel properties, and exact verifier suffice. The result is not
formalized in Lean.

## 7. Deduction of the A-shell result and the unresolved cases

The supplied shell-cost estimate is

\[
\Lambda(q+(T-1)U)\le\Lambda(q)
+2\Re\langle U,F_A(q)\rangle-\frac6{25}\|U\|_2^2.
\]

Since U lies in the first chaos, the two last terms are at most
(25/6)C(q)². Equation (1) therefore gives

\[
\Lambda(q+(T-1)U)
\le F(q)-u/\varepsilon+\frac{239}{240}\Delta
=B(u)-u/\varepsilon-\Delta/240\le S.
\]

This proves (2) on the stated energy and shell-amplitude ranges.

It does **not** cover q = X[c(|X|²−2)+P(Y)] when c ≠ 0, or arbitrary mixtures
of the six shells in R25. For those polynomials the factor X is not independent
of its coefficient, or the conditional law has other terms. In particular,
the exact identities (7)–(8) used in this proof cannot simply be substituted
into the size-biased self-interaction formula. The Gamma(2,1) variable there
remains correlated with its coefficient.

Accordingly this extension does not establish E′ for every cubic, does not
prove full K or K′, and does not establish an unconditional new bound
K_G^C > 1.402. Its precise contribution is a dimension-uniform closure of the
Gaussian-factor content inequality, including the previously uncovered
concentrated-covariance part of that class.
