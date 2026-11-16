<!-- Verbatim from the delivery content_law_signed_pairing_20261116.zip (PROOFS.md), 16 November 2026; a GPT session of the user, relayed by the user. Only this line was added. -->
# Proofs: signed representatives for the content-law inequality

All theorem and lemma statements below are **P** (complete written proofs), except where an explicit **C** input is named. These are mathematical proofs, not Lean formalizations. Their computational parts have been replayed by the author, without an independent human review.

## 1. Conventions and the law norm

Write `E|X|²=1` for a standard complex Gaussian. The complex inner product is `⟨G,F⟩=E[conj(G) F]`. For a cubic `q`, put `V=|q|²`, `u=EV>0`, and `delta=EV²-2u²`. Let `h` be real, continuous, and of polynomial growth. Define

\[
k(v)=\int_0^\infty e^{-t}h(v+ut)\,dt,
\qquad F=qk'(V),\qquad M=\langle q,F\rangle=E[Vk'(V)].
\]

Then `k-uk'=h`. The law functional is

\[
\widehat\Omega=\frac32\|F\|_2^2-\frac34\frac{|M|^2}{u}
=\frac34\left(\|F\|_2^2+\inf_{a\in\mathbb C}\|F-aq\|_2^2\right).
\tag{1}
\]

It is nonnegative and, on the slice `EV=u` with `k` fixed by `u`, concave in the law of `V`. We do not claim concavity when `u` is varied together with the law.

**Lemma 1 (dual law norm).** For every `Z` in `L²`,

\[
|\langle Z,F\rangle|^2\le
\frac23\left(\|Z\|_2^2+\frac{|\langle q,Z\rangle|^2}{u}\right)\widehat\Omega.
\tag{2}
\]

**Proof.** Let `P` be the orthogonal projection onto the span of `q`. The quadratic form on the left of (1)'s first expression is `(3/2)⟨F,(I-P/2)F⟩`. Its inverse operator is `(2/3)(I+P)`. Cauchy–Schwarz in this positive quadratic form gives (2). This also proves the second expression in (1). Concavity follows either from that expression (an infimum of affine functionals) or from the negative square in the definition. ∎

We will replace `Z` by `Z+N`, where

\[
E[\overline N\mid q]=0.
\tag{3}
\]

Such a replacement preserves the pairing with every function of `q`, and preserves `⟨q,Z⟩`. The replacement is made before taking a norm. It can therefore keep cancellation lost by the four independent norm estimates in ledger 6.3.25.

## 2. Hermitian quadratic factors: the genuine cubic class

Let `X` and `Y=(Y_1,...,Y_m)` be independent standard complex Gaussians. Diagonalize a nonzero Hermitian matrix by a unitary change in `Y` and write its real eigenvalues as `lambda_j`. Set

\[
S=|X|^2,\quad T_j=|Y_j|^2,\quad
B=\sum_j\lambda_j(T_j-1),\quad C=\sum_j\lambda_j^2T_j,
\]
\[
q=XB,\quad u=\sum_j\lambda_j^2,\quad s_3=\sum_j\lambda_j^3,\quad s_4=\sum_j\lambda_j^4.
\tag{4}
\]

Because `X` is independent of the centered `(1,1)` quadratic, `q` belongs to `H_{2,1}`. Rotating all the `Y` coordinates leaves `q` fixed. Its content has only the `X` coordinate. This is the same elementary symmetry principle as ledger 11.31a, with a fixed `X` direction retained. In particular the content need not be zero.

The independent centered exponential variables give

\[
EB=0,\quad EB^2=u,\quad EB^3=2s_3,\quad EB^4=3u^2+6s_4,
\]
\[
EC=u,\quad EC^2=u^2+s_4,\quad E[BC]=s_3,\quad E[B^2C]=u^2+2s_4.
\tag{5}
\]

These follow by expansion, using `E(T-1)²=1`, `E(T-1)³=2`, and `E(T-1)⁴=9`; equivalently, exponential cumulants of orders 2, 3, 4 are `1,2,6`. Since `ES²=2`,

\[
\delta=4u^2+12s_4,\quad
\chi=4+12\kappa,\quad \kappa=s_4/u^2\in(0,1].
\tag{6}
\]

**Lemma 2 (one signed pairing).** The content coefficient is real, and

\[
c_X[h]=E[\bar Xq h(V)]=\langle Z,F\rangle,
\qquad Z=X(2SC-u).
\tag{7}
\]

**Proof.** In the conventions of ledger 6.3.20, the Stein pair is
`a=X²C`, `c_2=SC`, `x=c_2-u=SC-u`. Apply the content identity 6.3.23 at the `X` direction. Its integrand is
`conj(X) k'(V)(conj(q) a+q x)=S B(2SC-u)k'(V)`, which is precisely `conj(Z)F`. Everything remaining is real. No inequality has been used. ∎

The required inner products are

\[
\|Z\|^2=17u^2+24s_4,\qquad \langle Z,q\rangle=4s_3.
\tag{8}
\]

For example, the first is `E[S(2SC-u)²]=24EC²-8uEC+u²`; the second is `4E[BC]-uEB`.

## 3. A tangent divergence removes a large part of the pairing

**Lemma 3 (an exact zero).** Put

\[
N=X\{2B^2+4C-4SC\}.
\tag{9}
\]

Then `E[conj(N) f(q)]=0` for every square-integrable function `f(q)` for which the pairing exists. Moreover,

\[
\langle Z,N\rangle=-22u^2-16s_4,
\quad \|N\|^2=44u^2+40s_4,
\quad \langle N,q\rangle=0.
\tag{10}
\]

**Proof of the zero.** For complex Gaussian coordinates, the bilinear integration-by-parts adjoints of `partial_z` and `partial_bar_z` are `bar_z-partial_z` and `z-partial_bar_z`. Consider the real vector field, written in Wirtinger components,

\[
v_X=-2XC,\quad v_{\bar X}=-2\bar XC,
\quad v_{Y_j}=\lambda_jY_jB,\quad
v_{\bar Y_j}=\lambda_j\bar Y_jB.
\]

Its directional derivatives of both `q` and `conj(q)` are zero. Indeed its derivative of `B` is `2BC`, which cancels the derivative `-2XC` of `X` in `q=XB`. Its Gaussian divergence is
`2B²+2C-4SC`. Multiplying this vector field by `conj(X)` changes the divergence to
`conj(X)(2B²+4C-4SC)=conj(N)`, because its directional derivative of `conj(X)` is `-2conj(X)C`.

Integration by parts against any smooth compactly supported function of `q` gives zero. Thus the finite signed push-forward measure with density `conj(N)` is zero; approximation, or conditional expectation, extends the identity to the stated integrable functions. This proves (3).

**Proof of (10).** Integrate first over `S`, using `ES=1`, `ES²=2`, `ES³=6`, and then use (5):

\[
\langle Z,N\rangle
=8E[B^2C]-32EC^2-2uEB^2+4uEC=-22u^2-16s_4,
\]
\[
\|N\|^2=4EB^4-16E[B^2C]+48EC^2=44u^2+40s_4.
\]

Finally `⟨N,q⟩=2EB³-4E[BC]=0`. ∎

**Theorem 4 (all Hermitian factors).** In (4), let
`zeta=s_3²/u³`. Then

\[
\|c[h]\|^2\le \Theta(\kappa,\zeta)\,\delta\widehat\Omega[h],
\]
\[
\Theta(\kappa,\zeta)=
\frac{17+24\kappa-(22+16\kappa)^2/(44+40\kappa)+16\zeta}{6+18\kappa}.
\tag{11}
\]

Consequently `theta=5/3` works for every Hermitian factor. If `kappa<=1/6`, `theta=13/10` works.

**Proof.** Replace `Z` in (7) by

\[
Z_* =Z+\frac{22u^2+16s_4}{44u^2+40s_4}N.
\]

This has the same pairing and correlation with `q`, but

\[
\|Z_*\|^2=17u^2+24s_4-
\frac{(22u^2+16s_4)^2}{44u^2+40s_4}.
\]

Use (2), (6), and (8) to obtain (11). Cauchy–Schwarz on the eigenvalues gives `zeta<=kappa`, so

\[
\Theta\le G(\kappa):=
\frac{33+217\kappa+168\kappa^2}
{3(1+3\kappa)(11+10\kappa)}.
\tag{12}
\]

The numerator of `5/3-G` after taking the positive common denominator is
`22-2kappa-18kappa²=2[1+(1-kappa)(9kappa+10)]>0`. For `kappa<=1/6`, the inequality `G<=13/10` is equivalent to
`99-493kappa-510kappa²>=0`; this decreasing polynomial is at least `8/3` on that interval. ∎

This proves the last-three-row conclusion for all Hermitian factors, and the last-four-row conclusion when `4<chi<=6` in this class. It is dimension uniform and requires no profile computation.

## 4. Pair the two signs of a gamma factor

Take the equal-eigenvalue special case

\[
B=\frac{R-m}{\sqrt m},\quad R=\sum_{j=1}^m|Y_j|^2\sim\operatorname{Gamma}(m,1),
\quad q=\sigma XB,\quad u=\sigma^2.
\tag{13}
\]

Here `C=R/m=1+B/sqrt(m)`. Define the density of `B` by `f_m`, extended by zero below `-sqrt(m)`, and for `b>=0` put

\[
g_m(b)=\frac{f_m(b)-f_m(-b)}{f_m(b)+f_m(-b)},\qquad
J_m=E[g_m(|B|)^2].
\tag{14}
\]

The denominator is positive away from irrelevant endpoints; assign any value at endpoints of zero probability.

**Lemma 5 (signed reflection).** The content pairing has a representative whose squared norm is `17J_m+24/m` and whose correlation with `q` is `4sigma/sqrt(m)`. Hence

\[
\|c[h]\|^2\le
\frac{17mJ_m+40}{6(m+3)}\,\delta\widehat\Omega[h].
\tag{15}
\]

**Proof.** Formula (7), with scaling restored, is
`c_X=sigma²⟨Z,F⟩`, with `Z=X(2S(1+B/sqrt(m))-1)`.
Let `b=|B|` and `X'=sign(B)X`. Circularity implies that `X'` is standard complex Gaussian and is independent of both `b` and the sign of `B`. Since `q=sigma X'b`, conditional expectation over that sign replaces `Z` by

\[
\widetilde Z=X'\left[(2S-1)g_m(b)+\frac{2Sb}{\sqrt m}\right].
\tag{16}
\]

Now `E[b g_m(b)]=EB=0` and `Eb²=1`. Therefore the cross term in its squared norm cancels:

\[
\|\widetilde Z\|^2
=17J_m+\frac{40}{\sqrt m}E[b g_m(b)]+\frac{24}{m}
=17J_m+\frac{24}{m}.
\]

Similarly `⟨tilde Z,q⟩=4sigma/sqrt(m)`. Apply (2) to `sigma² tilde Z` and divide by `delta=sigma⁴(4+12/m)`. This gives (15). ∎

The exact centering `EB=0` is essential here. Keeping absolute values before this pairing loses the cancellation.

## 5. Scalar bounds for the reflection asymmetry

**Lemma 6 (Hellinger bound).** Define

\[
\mathcal A_m=
\frac{e^{-m}m^m\sqrt\pi\,\Gamma((m+1)/2)}
{\Gamma(m)\Gamma((m+2)/2)}.
\]

Then

\[
J_m\le2(1-\mathcal A_m),\qquad
\theta\le H(m):=\frac{34m(1-\mathcal A_m)+40}{6(m+3)}.
\tag{17}
\]

**Proof.** For nonnegative `a,b`, `(a-b)²/(a+b)<=2(sqrt(a)-sqrt(b))²`. Integrating on the positive half-line with `a=f_m(b)`, `b=f_m(-b)` shows
`J_m<=∫(sqrt(f_m(x))-sqrt(f_m(-x)))² dx=2(1-A_m)`.
The affinity is supported on `|x|<=sqrt(m)`. With `r=m+sqrt(m)x`, its integral is

\[
\frac{e^{-m}}{\Gamma(m)}
\int_0^{2m}[r(2m-r)]^{(m-1)/2}\,dr,
\]

and the substitution `r=m(1+t)` gives the displayed beta integral. Formula (15) proves (17). ∎

**Lemma 7 (rational infinite tail).** For every integer `m>2`,

\[
J_m\le\frac2{m-2},\qquad
\theta\le I(m):=\frac{37m-40}{3(m-2)(m+3)}.
\tag{18}
\]

**Proof.** Let `gamma` be the standard real Gaussian density and `r=sqrt(f_m/gamma)`. The preceding Hellinger bound gives
`J_m<=||r-r(-.)||²_{L²(gamma)}`. The odd part of `r` has mean zero. Gaussian Poincare, followed by orthogonal projection onto the even part of its derivative, gives

\[
\|r-r(-\cdot)\|^2\le4\|r'\|^2
=\int\left(\frac{f_m'}{f_m}+x\right)^2 f_m(x)\,dx.
\]

For completeness, Gaussian Poincare follows by expanding a mean-zero function in normalized real Hermite polynomials: its variance is `sum_{n>=1}|a_n|²`, while the squared derivative norm is `sum_{n>=1}n|a_n|²`. Approximation extends it to the Sobolev functions here. At the finite support endpoint, `sqrt(f_m)` behaves as a constant times `(x+sqrt(m))^{(m-1)/2}`; it has the required weak derivative for `m>2`.

The score of the standardized gamma is
`sqrt(m)[(m-1)/R-1]`. Its squared expectation is `m/(m-2)`, because `E(1/R)=1/(m-1)` and `E(1/R²)=1/[(m-1)(m-2)]`. Integration by parts gives `E[x f_m'/f_m]=-1`, while `Ex²=1`. The relative Fisher information is therefore `m/(m-2)-1=2/(m-2)`. Insert this in (15). ∎

**Theorem 8 (rational constants for all integer shapes; P+C).** For (13),

| Shape range | Valid rational `theta` |
|---|---|
| `m>=1` | `5/3` |
| `m>=4` | `13/10` |
| `m>=12` | `3/5` |
| `m>=22` | `7/20` |

**Proof.** The first line is Theorem 4. For the others, (18) proves respectively the infinite tails `m>=8`, `m>=19`, `m>=34`. Clearing positive denominators gives quadratics with nonnegative coefficients after shifting `m` by those thresholds; the exact checker verifies these polynomial facts. The remaining finite sets are `m=4,...,7`, `12,...,18`, and `22,...,33`. The 23 Arb checks of (17) at 160 bits, with exact integer inputs, prove the strict inequalities. These are the only interval inputs in this theorem.

The finite calculations require no general gamma-function routine. For `m=2k`,
`A_m=m*pi*exp(-m)*m^m/[2^m(k!)²]`; for `m=2k+1`,
`A_m=exp(-m)*m^m*4^(k+1)k!(k+1)!/[(2k)!(2k+2)!]`. ∎

In particular, `m>=22` proves the requested content inequality with `theta=7/20` on all six rows, throughout their full energy intervals, within this class. For `h(v)=v`, `c_X=4sigma³/sqrt(m)`, so these are not merely zero-content examples.

## 6. Gaussian smoothing and the radial resolvent

**Theorem 9 (exact intertwining and contraction).** Let `p` be any circular cubic core of energy `a>0`, let `W` be an independent standard complex Gaussian, and put `Q=p+sqrt(s)W`, `u=a+s`. Let `P_s` denote convolution on the complex plane with that Gaussian. If `k=K_u h`, define the radial scalar function

\[
K_s(|z|^2)=P_s[k(|\cdot|^2)](z).
\]

Then

\[
P_s[z h(|z|^2)](z)=z h_s(|z|^2),\quad
h_s=K_s-aK_s',\quad K_s=\mathcal K_a h_s,
\tag{19}
\]
\[
P_s[z k'(|z|^2)](z)=zK_s'(|z|^2),
\qquad \widehat\Omega_a[h_s;p]\le\widehat\Omega_u[h;Q].
\tag{20}
\]

**Proof.** Differentiation of scalar Gaussian convolution gives the second displayed vector identity. Gaussian integration by parts also gives
`P_s[z k](z)=zK_s+s zK_s'`. Subtract `u P_s[z k']` and use `h=k-uk'` to obtain (19). The solution of `K_s-aK_s'=h_s` of polynomial growth is unique, so it equals `K_a h_s`.

For (20), write `F=Qk'(|Q|²)`. Conditional expectation given the core gives `E[F|p]=pK_s'(|p|²)` and `E[Q|p]=p`. Conditional expectation contracts both `||F||²` and, for each scalar `lambda`, `||F-lambda Q||²`. Formula (1) proves the claim. The core's content is preserved by conditioning (19). Smooth approximation extends the identities from smooth profiles to the stated continuous polynomial-growth profiles. ∎

This theorem supplies no automatic comparison in the opposite direction and does not turn an arbitrary non-Gaussian remainder into a Gaussian one.

## 7. Exact polynomial certificates for one heavy coordinate

Set

\[
p(X)=X(|X|^2-2),\quad Q=\alpha p(X)+\beta W,\quad
u=2\alpha^2+\beta^2,\quad \rho=\alpha/\beta.
\tag{21}
\]

Assume first `alpha,beta>0`. The Gaussian `W` is a surrogate for a diffuse cubic bulk; only the `X` content is considered. This convention is justified in section 8.

**Lemma 10 (signed representative).** For `T=|X|²`, let
`C_0=X(3T²-2T-2)`. Then

\[
c_X[h]=\alpha^2\langle C_0,F\rangle,
\quad F=Qk'(|Q|^2),\quad
\|C_0\|^2=764,\quad \langle C_0,Q\rangle=32\alpha.
\tag{22}
\]

**Proof.** Apply Theorem 9 and the imported content identity 6.3.23 to the one-coordinate cubic core. Its Stein pair is
`a=alpha² X²(2T-2)`, `x=alpha²(T²-2)`. The two signed terms have real expectations by complex conjugation invariance. Combining them gives `C_0` in (22). Conditioning back over `W` gives the displayed pairing. Direct exponential moments prove the norm and correlation. Equivalently one may represent the Gaussian term as `beta conj(W)` for purposes of the antiholomorphic identity: its Stein fluctuation is zero and its mean variance is `beta²`. ∎

Let `H_{ab}(X)` be the unnormalized complex Wick polynomial, so
`||H_{ab}||²=a!b!`, `partial_X H_ab=a H_{a-1,b}`, and
`(conj(X)-partial_X)H_ab=H_{a,b+1}`. Use the corresponding polynomials for `W`.

For polynomial controls `A,B`, define

\[
\mathcal N_A=
(\bar X-\partial_X)A-
\rho\{(\bar W-\partial_W)[2H_{11}(X)A]
 +(W-\partial_{\bar W})[H_{02}(X)A]\},
\tag{23}
\]
\[
\mathcal N_B=
(X-\partial_{\bar X})B-
\rho\{(\bar W-\partial_W)[H_{20}(X)B]
 +(W-\partial_{\bar W})[2H_{11}(X)B]\}.
\tag{24}
\]

These are written as representatives for `conj(C_0)`, so their zero is the bilinear identity `E[N_A f(Q)]=E[N_B f(Q)]=0`.

**Proof.** The chain rule gives
`partial_X f(Q)=rho[2H_11(X) partial_W f(Q)+H_02(X) partial_bar_W f(Q)]`, and the conjugate-coordinate identity gives (24). Gaussian integration by parts moves each derivative to its displayed adjoint. Smooth test functions prove the conditional identities; the finite signed-measure argument from Lemma 3 extends them to every admissible `f(Q)`. ∎

If `Zbar=conj(C_0)-sum_j d_j N_j`, then (22) is unchanged and `E[Zbar Q]=32alpha`. Lemma 1 yields the explicit sufficient condition

\[
\theta\ge
\frac{\|Zbar\|^2+1024\rho^2/(1+2\rho^2)}{252}.
\tag{25}
\]

Here `delta=168alpha⁴`. The denominator `252=(3/2)168` is exact.

**Theorem 11 (uniform parameter certificates; P+C).** All six ranges in the second table of README.md satisfy (25) for the listed rational constants, for every admissible profile and every energy.

**Proof.** The controls are all Wick monomials `H_ab(X)H_cd(W)` of total degree at most 14, with charge `a-b+c-d=0` for `A`, and charge `-2` for `B`. There are 400 controls. The output Wick coefficients have degree at most 17 and charge `-1`.

For each of 121 rational parameter intervals, the delivered coefficients `d_j` are exact integers divided by `2^80`. Consequently `Zbar=Z_0+rho Z_1`, and its squared norm is a convex quadratic in the real variable `rho`. Its maximum on the interval is bounded by the larger endpoint norm. The remaining term in (25) is increasing, so its upper endpoint bounds it. Every endpoint norm is computed exactly as `sum a!b!c!d! * coefficient²`. `verify_exact.mjs` verifies the resulting rational inequality, the interval adjacency, and every required endpoint. This is a proof on the whole intervals. Floating optimization only proposed the coefficients. ∎

At `alpha=0`, the core content and `delta` are zero, so the endpoint follows directly.

The same exact checker confirms the obstruction requested in the question: at `q=X(T-2)` and `h(v)=v`, `u=2`, `delta=168`, `c=32`, and `Omega_hat=3u/4=3/2`. Thus the ratio is `1024/252=256/63`. No profile-independent theorem with a smaller constant can cover that pure-heavy endpoint.

## 8. Meaning of the diffuse limit

The model (21) is not itself a pure cubic if `W` is treated as an ordinary input coordinate. The theorem concerns the genuine-cubic limit

\[
q_N=\alpha p(X)+\frac{\beta}{\sqrt N}
\sum_{j=1}^N H(Y_j),\qquad
H(Y)=Y(|Y|^2-2)/\sqrt2.
\tag{26}
\]

Each `q_N` is in `H_{2,1}`. Its energy is `u` and its fourth excess is
`168alpha⁴+42beta⁴/N`. The joint complex central limit theorem applied to
`N^{-1/2}sum(H(Y_j),Y_j)` gives two independent proper standard complex Gaussians: their covariance and pseudo-covariance vanish, since `EH conj(Y)=EYH=0`. One becomes `W`; the other is independent of `(X,Q)`.

The `X` content therefore converges to (22). By exchangeability the total squared content in the `Y` directions is the squared content at `N^{-1/2}sum Y_j`, which converges to zero by that joint limit. The law functional and moments converge as well. For the requested bounded profiles, uniform integrability follows from uniform fixed moments of normalized sums of independent variables with all moments; the same argument applies to any fixed polynomial-growth profile by taking sufficiently high moments. Thus the limiting full content is exactly the core content used in Theorem 11.

This is a limit theorem. No finite `N` is certified by transferring the limiting numerical constant without an error bound.

## 9. Applicability to the six profiles and the B convention

In the repository's convention, `Gamma_B(q)` transforms as `conj(ph(q))`, not `ph(q)`. Its conjugated `H_{0,1}` content is the `H_{1,0}` content of the real radial coefficient `Gamma_B(r) ph(q)`. This packet uses that convention, agreeing with `CONTENT_LEMMA_D5.md` section 1 and the scalar `h_B` in the question.

Write

\[
L'(z)=z P(|z|^2),\quad
P(T)=\ell-2\beta+\sqrt3\nu_5
 +(\beta-\sqrt3\nu_5)T+\nu_5T^2/\sqrt{12}.
\]

For every row, exact decimal arithmetic verifies
`ell-2beta>1/2`, `beta-(7/4)nu5>0`, and `nu5>0`. As `sqrt(3)<7/4`, all coefficients are positive and `|L'(z)|>=|z|/2`. Also `|bA|<3/50`, `|bB|<3/100`, so for real `q=r`,
`|1-bA(T-1)-bB z²/sqrt(2)|<=(11/10)(1+T)`.

The phase inequality `|ph(a+b)-ph(a)|<=2|b|/|a|`, together with the preceding lower bound, provides an integrable dominator for each profile divided by `r` near zero. The phase is differentiable away from `a=0`, and that exceptional set has Gaussian measure zero. Dominated differentiation at zero shows that `Gamma_X(r)/r` extends continuously there. For positive `r`, dominated convergence applies because the nonzero polynomial `A_+(z)` has a zero set of planar measure zero. The profiles are real by conjugation symmetry.

For an explicit crude bound, the weights for the tilted A and B profiles are bounded by `T+3/5` and `T+3/10`. The phase inequality gives `|h_A|<946/25<40` and `|h_B|<748/25<40`, using
`E T^{-1/2}=sqrt(pi)<2`, `E T^{1/2}=sqrt(pi)/2`, and `E T^{3/2}=3sqrt(pi)/4`. At all radii, their vector profiles are bounded by `16/5` and `13/5`, respectively. Therefore all the theorems apply. No interval evaluation of a degree-5 phase integral is needed for these profile-independent class results.

## 10. What remains open

No argument here reduces an arbitrary tensor in `H_{2,1}` to an independent linear factor times a Hermitian quadratic, or to a one-coordinate core plus Gaussian bulk. The profile-specific inequality outside these classes remains open. The full pure-heavy endpoint requires profile information, as the exact `h(v)=v` example shows. Nothing in this packet proves the remaining sector premises or changes the repository's Grothendieck bounds.
