<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/gaussian-core/GENUINE_SHARED_ODD_REGION.md, 15 November 2026; relayed by the user from codex-c7e2. -->
# An explicit genuine-cubic odd-sector region with shared drivers

Author: codex-c7e2, 2026-11-15. This theorem concerns genuine finite-dimensional `(2,1)` cubics. It proves the requested odd secant premise on an explicit non-Gaussian family and energy region, with the fixed retained trial unchanged.

## Theorem

Use the peak constants and notation

\[
a=699/1250,\quad b=179/1250,\quad p=2500/1891,\quad
\rho=5053/10000,\quad L=Z(a+bT),\quad T=|Z|^2.
\]

Let `u>0`. Let `Y=(Y₁,…,Y_m)` and `U=(U₁,…,U_m)` be independent standard complex Gaussian vectors, where `m≥2`. Let `X₀` and `X_{ij}`, `1≤i<j≤m`, be further independent standard complex Gaussians. All displayed Gaussian coordinates are mutually independent, including the visible `Z`; any additional remote Gaussian coordinates are independent of all displayed blocks and of one another. Define

\[
\boxed{
q_m=\frac{\sqrt u}{m}\left[
 X_0\sum_{i=1}^mY_i\overline{U_i}
 +\sum_{1\le i<j\le m}\overline{X_{ij}}(Y_iU_j-Y_jU_i)
\right].} \tag{1}
\]

The lower-chaos fields `r_A,r_B,Q,P` may depend arbitrarily on `Y,U` and the additional remote Gaussian coordinates, **but not on the X-block**. They have their usual genuine degrees: `r_A,r_B` holomorphic linear, `Q∈H₁,₁` complex-valued and centered, and `P∈H₂,₀`. Let `ν` be a complex constant and set

\[
\begin{aligned}
H&=(T-2/5)r_A+(3\rho/5)r_B+Z^2\overline{r_B}/\sqrt2,\\
O&=ZQ+\bar ZP+\nu Z(T-2)/\sqrt2,\qquad X=L+q_m+H,\\
V&=\|r_A\|_2^2+\|r_B\|_2^2,\qquad
W=\|Q\|_2^2+\|P\|_2^2+|\nu|^2.
\end{aligned}
\]

Define the explicit constants

\[
C_m=m^3\left(\frac{\Gamma(m-3/2)}{\Gamma(m)}\right)^2,
\qquad
\lambda_m=1+\frac3{8m}+\sqrt{\frac9{64m^2}+\frac9{4m}}.
\]

If

\[
\boxed{\quad V u^{-3/2} C_m\lambda_m^2\le1/400,\quad} \tag{2}
\]

then, at every odd amplitude,

\[
\boxed{\quad
\mathbb E\bigl[|X+O|+|X-O|-2|X|\bigr]-pW
\le-\frac1{100}W.
\quad} \tag{3}
\]

Thus the requested exact-secant odd premise holds with the single global coefficient `c=0`, before spending any residual-driver, energy-slack, or `5·10⁻⁵` allowance.

Here are fully rational sufficient regions. All allow arbitrary sharing of the lower-chaos fields with both Y and U.

| m | Complex coordinates in q_m | Normalized fourth excess χ | Energy range | Sufficient V bound |
|---|---:|---:|---|---:|
| 4 | 15 | 9/8 | u≥1/25 | 1/540000 |
| 8 | 45 | 17/32 | u≥1/25 | 1/210000 |
| 16 | 153 | 33/128 | u≥1/25 | 1/126000 |

In particular, the last row covers `u∈[0.040,0.041]` and `V≤1/126000≈7.9365·10⁻⁶`. The joint-degree refinement in §8 improves this cutoff to `V≤1/105000≈9.5238·10⁻⁶`, with the same cost and sharing hypotheses. The theorem itself imposes no upper bound on W and does not require the response ellipse or total-energy cap. Those caps may be intersected with the displayed region without changing its proof.

The normalized fourth excess here is `χ=(E|q_m|⁴−2u²)/u²`; the theorem is not a Gaussian approximation or an unspecified small-kurtosis assertion.

## 1. Genuine chaos and the conditional Gaussian law

Every monomial in (1) has exactly two holomorphic and one antiholomorphic Gaussian factors. Its three factors come from distinct coordinate blocks, so no Wick correction is needed. Therefore `q_m∈H₂,₁` exactly.

The complex Lagrange identity is

\[
\left|\sum_iY_i\overline{U_i}\right|^2
+\sum_{i<j}|Y_iU_j-Y_jU_i|^2
=\|Y\|^2\|U\|^2. \tag{4}
\]

Conditioning on `(Y,U)` and the additional coordinates, the variables `X₀,\overline{X_{ij}}` remain independent proper complex Gaussians. Consequently `q_m` is conditionally a centered proper complex Gaussian of variance

\[
R=\frac u{m^2}S_Y S_U,\qquad S_Y=\|Y\|^2,\quad S_U=\|U\|^2. \tag{5}
\]

Both radial variables are independent Gamma(m,1). In particular,

\[
ER=u,\qquad ER^2=u^2\left(\frac{m+1}{m}\right)^2,
\qquad \chi=\frac4m+\frac2{m^2}. \tag{6}
\]

The number of complex coordinates used by the core is `2m+1+m(m−1)/2=m(m+3)/2+1`. Identity (4) is also checked by exact symbolic coefficient enumeration for every displayed m.

## 2. The baseline is uniform in the conditional variance

Put `m_r(x)=E|x+√rW₀|` for a standard complex Gaussian `W₀`. The independently reviewed Gaussian-reference proof `FIXED_TRIAL_GAUSSIAN_ODD_REGION.md`, equations (2)–(5), gives for every r>0

\[
m_r(x+o)+m_r(x-o)-2m_r(x)
\le\frac{51}{50}\frac{|o|^2}{|x|}. \tag{7}
\]

This bound is uniform in r. Apply it conditionally at `r=R`, `x=L`, `o=O`. The variance R disappears from the right side **before averaging**. Thus any dependence of R on Q,P is harmless here. Angular orthogonality and the unconditional `EQ=0` give the same baseline as in the Gaussian-reference proof:

\[
\mathbb E d_R(L,O)
\le\frac{51}{50}\bigl[J_1(W_Q+W_P)+J_\nu W_\nu\bigr], \tag{8}
\]

where `d_r(x,o)=m_r(x+o)+m_r(x−o)−2m_r(x)`, `Wν=|ν|²`, and the certified constants obey

\[
p-J_1>16/125,\qquad p-J_\nu>33/100. \tag{9}
\]

No conditional centering such as `E[Q|R]=0` is used.

## 3. Parity survives the shared conditional variance

Simultaneously negate every lower-block coordinate `(Y,U,additional)`. Its Gaussian law is unchanged. The two radial variables and R are unchanged, while `H→−H` and `O→O`. After conditioning away the X-block, this gives

\[
\mathbb E d_R(L+H,O)
=\frac12\mathbb E\{d_R(L+H,O)+d_R(L-H,O)\}.
\]

The reviewed fourth-derivative estimate and the triangular-kernel identity give, for each r>0,

\[
\frac{d_r(x+h,o)+d_r(x-h,o)}2-d_r(x,o)
\le\frac{3\sqrt\pi}{8r^{3/2}}|h|^2|o|^2.
\]

Therefore

\[
\mathbb E D(X,O)
\le\mathbb E d_R(L,O)
+\frac{3\sqrt\pi}{8}\mathbb E[R^{-3/2}|HO|^2]. \tag{10}
\]

Here `D(x,o)=|x+o|+|x−o|−2|x|`. The small values of R are included in this expectation; none are discarded or replaced by a deterministic lower bound.

## 4. The inverse-radius weight preserves all allowed sharing

For each fixed visible Z, the product `HO` is a complex polynomial of total real degree at most three in the lower Gaussian coordinates: H has degree one, and O has degrees zero and two. The weighted polynomial lemma in `WEIGHTED_POLYNOMIAL_LEMMA.md` therefore applies directly:

\[
\mathbb E_{\rm lower}[R^{-3/2}|HO|^2]
\le u^{-3/2}C_m\lambda_m^2
\mathbb E_{\rm lower}|HO|^2. \tag{11}
\]

For completeness, the single-block lemma is obtained by decomposing degree≤3 polynomials into real spherical harmonics in R^(2m). In angular degree zero, the weighted Gram matrix in the radial basis `1,(S−m)/√m`, divided by `ES^{-3/2}`, is

\[
\begin{pmatrix}1&-3/(2\sqrt m)\\-3/(2\sqrt m)&1+3/(4m)\end{pmatrix},
\]

whose largest eigenvalue is λ_m. Angular degree one gives `(m−3/2)/m` times the same matrix with m+1 in place of m; degrees two and three have scalar eigenvalues below one. The largest eigenvalue is therefore λ_m. Iteration over the independent Y and U blocks proves (11), even when the polynomial depends jointly on both blocks and on additional Gaussian coordinates.

The other reviewed multiplication estimate is unweighted and permits arbitrary sharing:

\[
\mathbb E|HO|^2
\le(3+\sqrt6)V
\bigl[(37/5+d)(W_Q+W_P)+(164/5+d)W_\nu\bigr],
\qquad d=4/25+(15159/50000)^2. \tag{12}
\]

It follows by conditioning on Z, using the exact degree-zero/two Gaussian multiplication norm `3+√6`, and evaluating the visible factorial moments. Equations (11) and (12) justify all integrability required in (10); no independence between H,O and R has been introduced.

## 5. Exact assembly

Combining (8)–(12), equation (11) of the Gaussian-reference proof holds with the scalar `V/u^{3/2}` replaced by

\[
\tau=V u^{-3/2}C_m\lambda_m^2.
\]

The already certified rational calculation states that at `τ≤1/400`, the resulting Q/P cost exceeds `0.03480083513724` and the ν cost exceeds `0.01074421951224`. Both exceed `1/100`, proving (3).

For m=16, the exact scalar checks give

\[
C_{16}<32/25,\quad \lambda_{16}<7/5,\quad
C_{16}\lambda_{16}^2<1568/625,
\quad
\frac{125}{126000}\frac{1568}{625}<\frac1{400}.
\]

Since `u≥1/25` implies `u^{-3/2}≤125`, this proves the last explicit row. The other displayed rows are checked in the same exact-arithmetic executable.

## 6. Independent lower-block corollary

If the lower-chaos fields use a Gaussian block disjoint from Y,U and X, no weighted polynomial loss is needed. Direct factorization gives

\[
\mathbb E[R^{-3/2}|HO|^2]
=u^{-3/2}C_m\mathbb E|HO|^2.
\]

Thus it suffices that `V u^{-3/2}C_m≤1/400`. For `u≥1/25`, rational sufficient bounds are `V≤1/160000` for m=4, `V≤1/84000` for m=8, and `V≤1/64000` for m=16. In particular, the 15-coordinate core at m=4 has `χ=9/8`, `C₄=π`, and still satisfies the odd premise on a concrete all-amplitude visible region.

## 7. The signed remote allowance is nonnegative on this family

The established visible-law theorem (`STATUS.md` §2.7, with its analytic derivation in `sources/audit-2026-11-13/ADDITIONAL_ANALYTIC_AUDIT.md`) represents L in law as an independent proper Gaussian scale mixture `√V₀ W₁`. Set `B(v)=2E|L+√vW₀|` and `S=sup_{v≥0}(B(v)−pv)`. For the core (1), conditional Gaussian integration and concavity of the square root give

\[
2\mathbb E|L+q_m|
=\sqrt\pi\,\mathbb E\sqrt{V_0+R}
\le\sqrt\pi\,\mathbb E\sqrt{V_0+u}=B(u).
\]

Consequently the signed remote deficit `D(q_m)=B(u)−2E|L+q_m|` is nonnegative, so `D₋(q_m)=0`. The benchmark slack `σ(u)=S−(B(u)−pu)` is also nonnegative by definition. Thus the signed allowance `σ(u)−D₋(q_m)` appearing in the requested odd premise is nonnegative here. This justifies the claim that (3) proves that premise with `c=0` without spending its residual-driver or numerical allowance. This paragraph uses only the established visible mixture theorem; the odd-cost inequality (3) itself did not need it.

## 8. Refinement: use the joint degree budget

The preceding theorem remains valid with its original constants. A sharper version of (11) improves the m=16 shared-driver cutoff to

\[
\boxed{u\ge1/25,\qquad V\le1/105000,\qquad
\mathbb E D(X,O)-pW\le-W/100.} \tag{13}
\]

The improvement uses the fact that `HO` has **total** degree at most three across the Y and U blocks. Define

\[
\Lambda_m=1+\frac3{2m}+\sqrt{\frac9{4m^2}+\frac9{2m}}.
\]

Then every polynomial F of total degree at most three in these two blocks obeys

\[
\mathbb E[R^{-3/2}|F|^2]
\le u^{-3/2}C_m\Lambda_m\mathbb E|F|^2. \tag{14}
\]

Its coefficients may depend on additional independent coordinates. To prove this, decompose into separate spherical harmonics of degrees k,l in Y,U. If k+l is zero or one, the remaining radial polynomial has degree at most one, so its orthonormal basis is

\[
1,\quad (S_Y-d)/\sqrt d,\quad(S_U-e)/\sqrt e,
\qquad d=m+k,\quad e=m+l.
\]

After dividing by the unweighted norm and the two inverse-radius means, its Gram matrix is

\[
\frac{(m-3/2)_k(m-3/2)_l}{(m)_k(m)_l}
\begin{pmatrix}
1&-3/(2\sqrt d)&-3/(2\sqrt e)\\
-3/(2\sqrt d)&1+3/(4d)&9/(4\sqrt{de})\\
-3/(2\sqrt e)&9/(4\sqrt{de})&1+3/(4e)
\end{pmatrix}. \tag{15}
\]

For k=l=0, the antisymmetric radial direction has eigenvalue `1−3/(2m)`. The symmetric two-dimensional block is

\[
\begin{pmatrix}1&-3/\sqrt{2m}\\-3/\sqrt{2m}&1+3/m\end{pmatrix},
\]

whose largest eigenvalue is Λ_m. For k+l=1, the prefactor in (15) is less than one and one of d,e increases to m+1. Conjugating by `diag(1,−1,−1)` makes every entry nonnegative; every entry is then bounded by the corresponding entry at d=e=m. The variational characterization, applied to absolute coordinate values, bounds the spectral radius by Λ_m. For k+l=2 or 3 no radial excitation is possible; the normalized eigenvalue is the scalar prefactor, below one. Angular orthogonality proves (14).

Apply (14) to F=HO for each visible Z. The previous proof is unchanged, with condition (2) replaced by

\[
V u^{-3/2} C_m\Lambda_m\le1/400. \tag{16}
\]

For m=16, exact squaring proves `Λ₁₆<49/30`, and the existing gamma bound gives

\[
C_{16}\Lambda_{16}<\frac{32}{25}\frac{49}{30}
=\frac{784}{375},\qquad
\frac{125}{105000}\frac{784}{375}<\frac1{400}.
\]

These exact comparisons are included in `check_genuine_core.mjs`. They prove (13), with the same permitted sharing, core dimension 153, and normalized fourth excess 33/128 as before. No change to the fixed retained trial or odd-energy allowance is made.

## Reproduction and limits

Run these checks in this directory:

- `python -O certify_rice_envelope.py` — global Rice envelope, exact profile scalar costs, and final odd-cost arithmetic.
- `node check_weighted_polynomial.mjs` — exact m=16 inverse-radius operator bounds and energy cutoff.
- `node check_genuine_core.mjs` — exact Lagrange polynomial identities, gamma constants, all displayed explicit thresholds, dimensions, and fourth excesses.

The theorem is an explicit restricted genuine-cubic result. It permits substantial dependence between q and the lower-chaos fields through Y,U, including fields such as `r_A=Y₁`, `Q=|Y₁|²−1`, and `P=Y₁²/√2`. It does not permit these fields to depend on the conditional-Gaussian X-block. It bounds the actual paired secant D, not the larger Ψ majorant, and it does not prove the arbitrary-remote-cubic premise or Conjecture K in full.
