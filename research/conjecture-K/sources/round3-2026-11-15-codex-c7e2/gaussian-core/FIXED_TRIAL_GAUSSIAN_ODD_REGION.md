<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-c7e2-round3-2026-11-15/quantitative_odd_ab_codex_c7e2/gaussian-core/FIXED_TRIAL_GAUSSIAN_ODD_REGION.md, 15 November 2026; relayed by the user from codex-c7e2. -->
# An explicit odd-sector region at the fixed retained trial

Author: codex-c7e2, 2026-11-15. This is a restricted Gaussian-reference theorem, not Conjecture K for a genuine shared remote cubic. No existential smallness threshold is used.

## Statement

Use standard complex Gaussians, with `E|Z|²=1`. At the peak profile put

\[
a=699/1250,\quad b=179/1250,\quad p=2500/1891,\quad
L=Z(a+bT),\quad T=|Z|^2,\quad \rho=5053/10000.
\]

Let `Y` be any finite standard complex Gaussian vector independent of `Z`. Let `r_A,r_B` be arbitrary holomorphic linear forms in `Y`, `Q` an arbitrary complex-valued centered `(1,1)` quadratic, `P` an arbitrary holomorphic quadratic, and `ν` a complex constant. All these fields may share all their Gaussian coordinates. Put

\[
\begin{aligned}
H&=(T-2/5)r_A+(3\rho/5)r_B+Z^2\overline{r_B}/\sqrt2,\\
O&=ZQ+\bar ZP+\nu Z(T-2)/\sqrt2,\\
V&=\|r_A\|_2^2+\|r_B\|_2^2,\qquad
W_Q=\|Q\|_2^2,\quad W_P=\|P\|_2^2,\quad W_\nu=|\nu|^2,\quad W=W_Q+W_P+W_\nu.
\end{aligned}
\]

Let `W₀` be a further standard complex Gaussian independent of `(Z,Y)`, and set `q=√u W₀`, `X=L+q+H`. For

\[
 u>0,\qquad V\le u^{3/2}/400,
\]

one has, at every odd amplitude,

\[
\boxed{\quad
\mathbb E\bigl[|X+O|+|X-O|-2|X|\bigr]-pW
\le -\frac1{100}W.
\quad} \tag{1}
\]

In particular, on the explicitly requested energy window

\[
1/25\le u\le41/1000,\qquad V\le1/50000,
\]

(1) holds. This is the fixed trial in MONOGRAPH §2.8–2.9; its A/B shifts are not altered. It proves the secant version of the requested premise with `c=0`, with no use of the `0.01‖r_B−ρr_A‖²`, energy-slack, or `5·10⁻⁵` allowances. The restriction `q=√uW₀` independent of every driver is essential in this proof. It does not assert the corresponding estimate for the larger Ψ majorant.

A more flexible explicit sufficient test is supplied by (11) below.

## 1. A global Rice envelope

Write `m_u(x)=E|x+√uW₀|`. At `r=|x|>0`, let `D=m_u''(r)` and `R=m_u'(r)/r`. The Hessian eigenvalues are `D,R`, with `0≤D≤R`. The all-amplitude paired norm inequality

\[
|x+h|+|x-h|-2|x|
\le \frac{|h|^2}{|x|}-\frac{(\operatorname{Re}\bar xh)^2}{2|x|^3}
\]

can be written as `hᵀ(½D²|x|+½Δ|x| I)h`. Convolution with the independent Gaussian gives

\[
m_u(x+h)+m_u(x-h)-2m_u(x)
\le (R+D/2)|h|^2. \tag{2}
\]

The exact Rice formulas, with `s=r²/(2u)`, are

\[
R=\frac{\sqrt\pi}{2\sqrt u}e^{-s}(I_0(s)+I_1(s)),\qquad
D=\frac{\sqrt\pi}{2\sqrt u}e^{-s}(I_0(s)-I_1(s)).
\]

The following universal bound is certified independently of the profile and variance:

\[
\boxed{r(R+D/2)\le51/50.} \tag{3}
\]

Here is the complete one-dimensional certification and tail argument. Define

\[
f(s)=\sqrt{\pi s/2}\,e^{-s}(3I_0(s)+I_1(s))/2.
\]

For each of the 2000 closed cells `[j/1000,(j+1)/1000]` covering `[0,2]`, monotonicity of `√s`, `I₀`, `I₁` and `e^{-s}` separately gives an interval upper bound by taking the increasing factors at the right endpoint and the exponential at the left endpoint. Arb at 120 bits certifies every bound below `51/50`. The largest bound is `1.015181624655219`, leaving more than `.0048` reserve.

For `s≥2`, let `r_B(s)=I₁(s)/I₀(s)` and `U(s)=(4s−3)/(4s−1)`. The Riccati equation and direct differentiation give

\[
r_B'=1-r_B/s-r_B^2,\qquad
U'-(1-U/s-U^2)=\frac3{s(4s-1)^2}>0.
\]

The certified starting inequality `r_B(2)<5/7=U(2)` propagates by scalar ODE comparison. Since the sign of `f'` is that of `(3−4s)+(4s−1)r_B(s)`, `f` decreases throughout this tail. This proves (3) on the entire half-line.

Applying (2)–(3) at `x=L` and then averaging the remote fields gives

\[
\begin{aligned}
\mathbb E\,[m_u(L+O)+m_u(L-O)-2m_u(L)]
&\le \frac{51}{50}\bigl[J_1(W_Q+W_P)+J_\nu W_\nu\bigr],\\
J_1&=\mathbb E\frac{T}{|L|},\qquad
J_\nu=\frac12\mathbb E\frac{T(T-2)^2}{|L|}. \tag{4}
\end{aligned}
\]

The mixed terms vanish by the visible angular average, the distinct remote charges, and `EQ=0`. The scalar bounds

\[
p-J_1>16/125,\qquad p-J_\nu>33/100 \tag{5}
\]

are recomputed in the attached script, rather than assumed from the older zero-core theorem. Indeed, for `J_k=E[T^k/|L|]`,

\[
J_0=\frac\pi{\sqrt{ab}}e^{a/b}\operatorname{erfc}\sqrt{a/b},\qquad
J_{k+1}=\frac{\Gamma(k+1/2)-aJ_k}{b}.
\]

Arb yields `p−J₁=0.12837610707691433750…` and `p−Jν=0.33021263403125803029…`.

## 2. A fourth-derivative bound and cancellation by parity

The Gaussian-smoothed norm has the Fourier representation

\[
m_u(x)-m_u(0)
=\frac1{2\pi}\int_{\mathbb R^2}
\frac{e^{-u|k|^2/4}(1-\cos(k\cdot x))}{|k|^3}\,dk.
\]

After four derivatives, Cauchy–Schwarz in the positive spectral measure gives, for all real planar vectors `h,o`,

\[
\left|D^4m_u(x)[h,h,o,o]\right|
\le \frac{3\sqrt\pi}{4u^{3/2}}|h|^2|o|^2. \tag{6}
\]

The constant is exact for four identical directions at `x=0`: the angular integral is `3π/4` and the radial integral is `2√π/u^{3/2}`.

Set `d_u(x,o)=m_u(x+o)+m_u(x−o)−2m_u(x)`. Twice using the triangular-kernel second-difference identity, whose kernel has integral one, yields

\[
\frac{d_u(x+h,o)+d_u(x-h,o)}2-d_u(x,o)
\le\frac{3\sqrt\pi}{8u^{3/2}}|h|^2|o|^2. \tag{7}
\]

Under `Y→−Y`, `H→−H` while `O→O`, because its remote coefficients have even degree. Thus (7), averaged over `(Z,Y)`, gives exactly

\[
\mathbb E d_u(L+H,O)
\le \mathbb E d_u(L,O)+\frac{3\sqrt\pi}{8u^{3/2}}\mathbb E|H|^2|O|^2. \tag{8}
\]

This parity cancellation is the reason the explicit threshold is proportional to `V`, rather than `√V`.

## 3. Exact lower-chaos multiplication control

For any real Gaussian linear form `ℓ` and any complex-valued polynomial `F` belonging to real chaoses zero and two,

\[
\mathbb E|\ell|^2|F|^2
\le (3+\sqrt6)\,\mathbb E|\ell|^2\,\mathbb E|F|^2. \tag{9}
\]

To verify this, rotate and normalize `ℓ` to a real standard Gaussian coordinate `x`, and decompose

\[
F=c+a(x^2-1)/\sqrt2+xL(Y')+Q_2(Y').
\]

The quadratic form for multiplication by `x` has the `c,a` block `[[1,√2],[√2,5]]`, with largest eigenvalue `3+√6`; the other blocks have coefficients `3` and `1`. The same bound for a complex Gaussian linear form follows by summing its real and imaginary parts. No independence of `F` and `ℓ` is assumed.

Conditioning on `Z`, apply (9) to `H` and `O`. Put `β=15159/50000` and

\[
S(t)=(t-2/5)^2+\beta^2+t^2/2
=\tfrac32t^2-\tfrac45t+d,\qquad d=4/25+\beta^2.
\]

The covariance matrix of `(r_A,r_B)` and Cauchy–Schwarz give `E_Y|H|²≤S(T)V`; the conjugate B term has zero covariance with the holomorphic part. Moreover, the chaos orthogonalities give

\[
\mathbb E_Y|O|^2=T(W_Q+W_P)+\tfrac12T(T-2)^2W_\nu.
\]

Hence, using `ET^k=k!`,

\[
\mathbb E|H|^2|O|^2
\le(3+\sqrt6)V\bigl[(37/5+d)(W_Q+W_P)+(164/5+d)W_\nu\bigr]. \tag{10}
\]

The two numerical moments are `7.6519181124` and `33.0519181124`.

## 4. Explicit assembly

Combining (4), (5), (8) and (10) yields the more general estimate

\[
\begin{aligned}
\mathbb E D(X,O)-pW
\le&-\left[p-\frac{51}{50}\left(p-\frac{16}{125}\right)
-C\frac V{u^{3/2}}(37/5+d)\right](W_Q+W_P)\\
&-\left[p-\frac{51}{50}\left(p-\frac{33}{100}\right)
-C\frac V{u^{3/2}}(164/5+d)\right]W_\nu,\\
C&=\frac{3\sqrt\pi}{8}(3+\sqrt6). \tag{11}
\end{aligned}
\]

Here `D(x,o)=|x+o|+|x−o|−2|x|`. Use the rational upper bounds `√π<1773/1000` and `√6<49/20`. At `V/u^{3/2}≤1/400`, the Q/P bracket is greater than `0.03480083513724` and the ν bracket is greater than `0.01074421951224`. Both exceed `1/100`. All final comparisons are exact rational checks in the attached executable, which proves (1).

## Reproduction and scope

Run `python -O certify_rice_envelope.py`. It uses `python-flint`, prints PASS, and records `rice_envelope_certificate.json`. Its checks are explicit exceptions, not removable Python assertions. It independently recomputes the scalar profile costs, covers every interval in `[0,2]`, checks the analytic-tail starting point, and verifies the final rational margins.

This controls arbitrary sharing among the genuine lower-degree remote coefficient fields, including their Q/ν correlations after multiplication by H. It neither assumes nor concludes joint Gaussianity of these fields. The additional independent Gaussian core is a genuine restriction: replacing a shared cubic q by this Gaussian core is a separate obligation. This theorem is a concrete restricted instance of the requested odd premise; it does not settle the general premise or Conjecture K.
