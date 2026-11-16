<!-- Verbatim from the delivery conjecture_k_content_law_blocks_codex_a786.zip (PROOFS.md), 16 November 2026; agent codex-a786, relayed by the user. Only this line was added. -->
# Content-law bounds for sums of Hermitian factors

16 November 2026. Author: codex-a786. Repository snapshot:
`b3cca50483aaaf38ea83296428176a1553dd915f`.

**P** throughout this document means a complete written proof by the author,
not independent review or Lean verification. **C** denotes only the exact
arithmetic replay described in `README.md`. No numerical search is a premise.

## 1. The class and the main theorem [P]

Let all named Gaussian coordinate blocks be independent. For i=1,...,r let

\[
 P_i=\sum_j\lambda_{ij}(|Y_{ij}|^2-1),\qquad
 \lambda_{ij}\in\mathbb R,\quad \sum_j\lambda_{ij}^2=1.
\]

Thus arbitrary normalized Hermitian quadratic forms are allowed, after unitary
diagonalization within their separate blocks. Define

\[
 B_i=\sum_j\lambda_{ij}^2|Y_{ij}|^2,\quad R_i=P_i^2,
 \quad\kappa_i=\sum_j\lambda_{ij}^4,\quad s_i=\sum_j\lambda_{ij}^3,
 \quad\chi_i=4+12\kappa_i.
\]

An optional independent cubic bulk is

\[
 W=\sum_{a=1}^d\overline Z_a F_a(U),\qquad E|W|^2=1,
 \tag{1}
\]

where the F_a are homogeneous holomorphic quadratic polynomials. All sizes and
coefficients in (1) are unrestricted. Set D=sum_a |F_a(U)|², so ED=1.
Choose nonnegative weights rho_0,...,rho_r summing to one and put

\[
 q=\sqrt u\left(\sum_{i=1}^r\sqrt{\rho_i}\,X_iP_i+
                         \sqrt{\rho_0}\,W\right),\qquad u>0.
 \tag{2}
\]

Terms with zero weight may be deleted. Every q in (2) is a genuine finite
dimensional H_{2,1} cubic. Complex phases on the coefficients can be absorbed
in X_i and Z. No first-chaos Gaussian is being passed off as a cubic.
Unused coordinates and unitary changes of all ambient Gaussian coordinates
do not change the assertion.

For example W_N=N^(-1/2) sum_{a<=N} U_a V_a conjugate(Z_a), with all three
blocks independent, has D=N^(-1) sum |U_a|²|V_a|² and Var D=3/N. It is a
finite cubic for every N, and ordinary CLT makes its law tend to a proper
complex Gaussian. Formula (7) gives its contribution 6 rho_0²/N to chi;
the bound (6) is uniform in N.

An admissible profile is real, continuous on (0,infinity), and satisfies

\[
 |h(v)|\le C(v^{-1/2}+1+v^d)\quad(v>0)
 \tag{3}
\]

for some finite C,d. Use exactly the question's definitions of k, c[h], delta,
and Omega-hat. Define the phase statistic

\[
 \eta_i(R_i)=E[P_i\mid R_i],\qquad
 \alpha_i^2=E\frac{\eta_i(R_i)^2}{R_i}.
 \tag{4}
\]

Values at R_i=0 are immaterial: a nonconstant quadratic form P_i has a density.
Write

\[
 a^2=\max_i\alpha_i^2,\quad
 K=\max_i\frac{(\sqrt{17}\alpha_i+\sqrt{24\kappa_i})^2}{\chi_i},
 \quad M=\max_i\frac{s_i^2}{\chi_i}.
 \tag{5}
\]

**Theorem 1 (arbitrarily many independent blocks).** For every q in (2),
every u>0 and every profile (3),

\[
 \boxed{\quad \|c[h]\|^2\le
 \left\{\frac23(K+16M)+\frac{a^2}{3}\right\}
 \delta\,\widehat\Omega[h].\quad}
 \tag{6}
\]

There is no factor depending on r. If there are no active factor blocks, the
content is zero. The deficit in (6) is that of the SAME q:

\[
 \chi=\delta/u^2=\sum_i\rho_i^2\chi_i+
                         2\rho_0^2\operatorname{Var}D.
 \tag{7}
\]

For particular weights one can replace 16M in (6) by
16 sum_i rho_i³ s_i² / chi. This refinement follows from the same proof.

The proof is not an assertion that independent one-driver inequalities can
be added. The common radius of the entire sum remains inside every profile
evaluation. The central step below allocates one joint variance budget before
the final Cauchy-Schwarz inequality.

## 2. Exact reduction with a common radius [P]

Only the X_i coordinates can have content. Independent rotations of Y_ij fix q
and kill their content coordinates. The transformation U -> exp(it) U,
Z -> exp(2it) Z fixes the whole q and kills its U and Z content coordinates.
These statements follow directly by changing variables in E[conj(y_j) q h].

Condition on all Y and U. The remaining variables X,Z are Gaussian, and q is
a proper complex Gaussian of conditional variance uA, where

\[
 A=\sum_i\rho_i R_i+\rho_0D,\qquad EA=1.
 \tag{8}
\]

Conditional Gaussian regression, with an auxiliary T~Exp(1) independent of
everything in (8), gives

\[
 c_i:=E[\overline X_i qh(|q|^2)]
      =\sqrt u\sqrt{\rho_i}\,E[P_iT h(uAT)].
 \tag{9}
\]

In particular all c_i are real in these coordinates. Also E|q|⁴=2u²EA²,
which proves (7) using EP_i⁴=3+6kappa_i. The latter identity follows from the
exponential cumulants (j-1)! or by direct expansion.

The elementary Stein identity for each factor is

\[
 E[P_i g(P_i)]=E[B_i g'(P_i)].
 \tag{10}
\]

Indeed E[(T_j-1)g(P_i)]=lambda_ij E[T_j g'(P_i)] for T_j=|Y_ij|².
Multiply by lambda_ij and sum. Some additional identities used below are

\[
 EB_i=1,\quad E(B_i-1)^2=\kappa_i,\quad E[P_iB_i]=s_i.
 \tag{11}
\]

For the moment take a smooth h of polynomial growth, so that the following
integrations by parts are classical. Put f=k',

\[
 C_i=A-\rho_iR_i,\quad E C_i=1-\rho_i,\quad
 b_i=\frac{\rho_iR_i}{A},\quad H_i=2+(T-2)b_i.
\]

Applying (10) to the k part of h=k-uk' gives

\[
 E[P_iT h(uAT)]
   =u E[T P_i(2\rho_iB_iT-1)f(uAT)].
 \tag{12}
\]

Here is a useful exact zero, with all other blocks still present:

\[
 E\left[T P_i C_i
     \left\{1+\frac{2\rho_iB_i}{A}(2-T)\right\}f(uAT)\right]=0.
 \tag{13}
\]

To prove (13), exponential integration by parts yields

\[
 E_T[T(2-T)f(uAT)]=-uA E_T[T^2 f'(uAT)].
\]

Identity (10), applied with the other blocks fixed, yields
E[P_i T f(uAT)]=2u rho_i E[P_iB_i T² f'(uAT)]. Multiplication by C_i is
legitimate because C_i is independent of the entire i-th factor block.
These two formulas cancel exactly in (13).

Adding (13) to (12) gives

\[
 E[P_iT h(uAT)]=u E\left[T
  \{\rho_i(2H_iP_iB_i-P_i)+P_i(C_i-E C_i)\}f(uAT)\right].
 \tag{14}
\]

This is the cancellation-preserving form used here. It is derived directly
from (9)-(10), without the Cauchy-Schwarz step of ledger 6.3.25.

Define

\[
 \zeta_i(R_i)=E[P_i(B_i-1)\mid R_i],\qquad
 U_i=(2H_i-1)\eta_i+2H_i\zeta_i.
\]

All factors other than P_i and B_i in (14) depend only on the R's, D and T.
Conditioning on those variables therefore changes (9) into

\[
 c_i=u^{3/2}\sqrt{\rho_i}\,
 E[T\{\rho_i U_i+\eta_i(C_i-E C_i)\}f(uAT)].
 \tag{15}
\]

Crucially, eta_i is the conditional SIGN information of P_i. Replacing it by
sqrt(R_i), or replacing the whole q by a variable with the same absolute-value
law, does not give this calculation.

## 3. The joint variance allocation [P]

Let dmu=AT dP. This is a probability measure. For real f,d in L²(mu),

\[
 |E_\mu df|^2\le
 \{E_\mu d^2+(E_\mu d)^2\}
 \{E_\mu f^2-\tfrac12(E_\mu f)^2\}.
 \tag{16}
\]

Split both functions into their means and centered parts and apply ordinary
Cauchy-Schwarz with weights 1 and 1/2. In this measure,

\[
 \widehat\Omega[h]=\frac{3u}{2}
 \{E_\mu f(uAT)^2-\tfrac12(E_\mu f(uAT))^2\}.
 \tag{17}
\]

This is the same law functional as in the question, with no added
structural term on the right. At fixed u, Omega-hat is concave in the law
of V, since its first term is linear and its second is the negative of
a square of a linear functional. No joint concavity of delta times
Omega-hat as delta varies is asserted.

Fix any real unit vector e in R^r, solely to compute the Euclidean norm of the
actual content vector. Define

\[
 d_0=\frac1A\sum_i e_i\rho_i^{3/2}U_i,
 \qquad d_1=\frac1A\sum_i e_i\sqrt{\rho_i}\eta_i(C_i-E C_i).
 \tag{18}
\]

Equation (15) says e.c=u^(3/2) E_mu[(d_0+d_1)f(uAT)].
Because A>=sum_i rho_i R_i, pointwise Cauchy-Schwarz gives, for arbitrary v_i,

\[
 \frac{|\sum_i e_i\sqrt{\rho_i}v_i|^2}{A}
       \le\sum_i e_i^2\frac{v_i^2}{R_i}.
 \tag{19}
\]

No supremum over the four projection weights Omega_e is used here.
For 0<=b<=1, H=2+(T-2)b satisfies exactly

\[
 E_T[T(2H-1)^2]=9+8b^2\le17,\quad
 E_T[TH^2]=4+2b^2\le6,\quad E_T[TH]=2.
 \tag{20}
\]

Conditional Jensen gives E[zeta_i²/R_i]<=kappa_i. Applying (19)-(20) and
the triangle inequality within each factor therefore gives

\[
 \|d_0\|_{L^2(\mu)}^2\le
 \sum_i e_i^2\rho_i^2(\sqrt{17}\alpha_i+\sqrt{24\kappa_i})^2
 \le K J_e,
 \qquad J_e=\sum_i e_i^2\rho_i^2\chi_i.
 \tag{21}
\]

More generally, any proved upper bound L_i on E[T U_i²/R_i] may replace
(sqrt(17) alpha_i+sqrt(24 kappa_i))² in the definition of K. The remainder
of this proof is unchanged. Section 5 uses this refinement to keep an
additional cross-term cancellation.

For the other term, independence of C_i and P_i gives

\[
 \begin{split}
 \|d_1\|_{L^2(\mu)}^2
 &\le\sum_i e_i^2\alpha_i^2\operatorname{Var}C_i\\
 &\le\frac{a^2}{2}(\chi-J_e),
 \end{split}
 \tag{22}
\]

since Var C_i=(chi-rho_i² chi_i)/2 and sum e_i²=1. Thus 0<=J_e<=chi.
Keeping the complementary budgets in (21)-(22) until this point is what
avoids a loss proportional to the number of blocks:

\[
 \|d_0+d_1\|_2
 \le\sqrt{KJ_e}+\sqrt{\tfrac12a^2(\chi-J_e)}
 \le\sqrt{(K+a^2/2)\chi}.
 \tag{23}
\]

The means also have an exact expression. Since E eta_i=0, E zeta_i=s_i,
and (20) holds even when b depends on all R's,

\[
 E_\mu d_1=0,\qquad E_\mu d_0=4\sum_i e_i\rho_i^{3/2}s_i.
\]

Consequently

\[
 (E_\mu(d_0+d_1))^2\le16\sum_i\rho_i^3s_i^2
 \le16M\sum_i\rho_i^2\chi_i\le16M\chi.
 \tag{24}
\]

Combine (16)-(17) and (23)-(24), then use delta=u² chi. This proves (6) for
every e, hence for the content norm. All block dependence of h has been kept
through the one shared A. This is why the invalid driver-by-driver argument
recorded in ledger section 14, item 32, is not being assumed.

## 4. An explicit phase bound for every Hermitian spectrum [P]

**Lemma 2.** For P=sum lambda_j(T_j-1), sum lambda_j²=1, and
kappa=sum lambda_j⁴,

\[
 \boxed{\quad\alpha^2=E\frac{E[P\mid P^2]^2}{P^2}
                  \le\min\{1,2\sqrt\kappa\}.\quad}
 \tag{25}
\]

Let p be a density of P and set
g(x)=(p(x)-p(-x))/(p(x)+p(-x)), using zero when the denominator is zero.
Choose an odd version. Folding the real line shows exactly

\[
 E g(P)=E g(P)^2=\alpha^2.
 \tag{26}
\]

In particular |g|<=1 and Eg(N)=0 for a real standard Gaussian N. Let

\[
 s(x)=-e^{x^2/2}\int_x^\infty g(t)e^{-t^2/2}\,dt.
\]

Oddness of g makes s even. For x>=0, the Gaussian tail estimate
x integral_x^infinity exp(-t²/2)dt <= exp(-x²/2) implies |x s(x)|<=1.
Therefore s'-xs=g almost everywhere, |s'|<=2, and s is bounded and globally
Lipschitz. Apply (10), valid also for bounded Lipschitz tests by approximation:

\[
 \alpha^2=E[s'(P)-Ps(P)]=E[(1-B)s'(P)]
       \le2E|1-B|\le2\sqrt\kappa.
\]

The bound by one follows directly from conditional Jensen. This proves (25).
It is an estimate of the sign imbalance of the FACTOR P; it is not a
law-only replacement of the cubic q by a Gaussian.

Also s_i²<=kappa_i, by Cauchy-Schwarz applied to lambda_ij and lambda_ij².
If kappa_i<=kappa_0<=1/3 for every active block, (6) therefore implies

\[
 \theta\le F(\kappa_0):=
 \frac{2}{3(4+12\kappa_0)}
 \{34\sqrt{\kappa_0}+40\kappa_0+
                      2\sqrt{816}\,\kappa_0^{3/4}\}
       +\frac23\sqrt{\kappa_0}.
 \tag{27}
\]

To check uniformity in kappa_i, each of x^(1/2)/(4+12x),
x^(3/4)/(4+12x), and x/(4+12x) increases on [0,1/3]. Thus separate maxima
in K and M may be evaluated at kappa_0, rather than merely bounding their
numerators while using the wrong denominator.

**Corollary 3 (unequal and signed spectra).** The following exact constants
hold for (2), with any number of blocks and every admissible profile:

| Assumption on every active factor | Valid theta | Consequence for supplied room targets |
|---|---:|---|
| sum_j lambda_ij⁴ <= 1/64 | 1015/804 < 13/10 | below all four targets at t>=0.84 |
| sum_j lambda_ij⁴ <= 1/576 | 2465/6948 < 37/100 | below all six targets |

For the first row, alpha²<=1/4 and
2 sqrt(17 alpha² * 24/64)<=sqrt(51/8)<81/32.
Hence (27) is at most 79/67+1/12=1015/804.
For the second, alpha²<=1/12 and sqrt(17/72)<35/72, so the bound is
568/1737+1/36=2465/6948. The squared radical comparisons and all rational
comparisons are replayed exactly. No asymptotic or existence threshold occurs.

These conditions can equivalently be stated as
tr(H_i⁴)/(tr(H_i²))² <= 1/64 or 1/576 before normalizing a nonzero Hermitian
matrix H_i. They allow unequal eigenvalues of either sign. In particular,
the q=XP examples have chi close to 4, not close to zero.

## 5. Equal eigenvalues: sharper constants, uniform over all sums [P]

Suppose P_i=P_{m_i}=m_i^(-1/2) sum_{j<=m_i}(|Y_ij|²-1).
We give the scalar estimate here so that the new package is self-contained.

Let p_m be the density of P_m, and let
A_m=integral_R sqrt(p_m(x)p_m(-x)) dx be its reflection affinity.
Folding and Cauchy-Schwarz give

\[
 \alpha_m^2\le1-A_m^2.
 \tag{28}
\]

For clarity, under the probability measure (p_m(x)+p_m(-x))dx on x>0,
the integrand defining A_m is sqrt(1-g(x)²), while alpha_m²=E g²;
hence A_m²<=(E1)(E(1-g²))=1-alpha_m².
The elementary beta integral evaluates the affinity:

\[
 A_m=\frac{m^m e^{-m}\sqrt\pi\,\Gamma((m+1)/2)}
                 {\Gamma(m)\Gamma((m+2)/2)}=e^{-2r(m/2)}.
 \tag{29}
\]

Here r(x)=log Gamma(x)-(x-1/2)log x+x-(1/2)log(2pi).
The last equality follows from Gamma duplication. Binet's integral is

\[
 r(x)=\int_0^\infty\left(\frac1{e^t-1}-\frac1t+\frac12\right)
                           \frac{e^{-xt}}t\,dt.
\]

Its parenthesis is between 0 and t/12: write it as
(1/2)coth(t/2)-1/t and use
coth z=1/z+2z sum_{n>=1}(z²+pi²n²)^(-1).
Consequently 0<r(x)<1/(12x), and

\[
 \alpha_m^2\le1-e^{-2/(3m)}\le\frac2{3m}.
 \tag{30}
\]

For an equal-eigenvalue factor, B_i=1+P_i/sqrt(m_i), so
zeta_i=R_i/sqrt(m_i). Expanding the square instead of applying the
triangle inequality in (21) gives the EXACT identity

\[
 E\frac{T U_i^2}{R_i}
 = E\left[(9+8b_i^2)\frac{\eta_i^2}{R_i}
       +\frac{24+16b_i^2}{\sqrt{m_i}}\eta_i
       +\frac{16+8b_i^2}{m_i}R_i\right].
 \tag{31a}
\]

E eta_i=0 cancels the constant 24 in the middle term. Since 0<=b_i²<=1,

\[
 E[b_i^2\eta_i]=E[(b_i^2-1/2)\eta_i]
       \le\tfrac12E|\eta_i|\le\tfrac12\alpha_{m_i}.
\]

The last step uses ER_i=1 and Cauchy-Schwarz in E|eta_i|.
No independence between b_i and eta_i is claimed: b_i still depends on
the common A. Equations (30)-(31a) yield the useful bound

\[
 E\frac{T U_i^2}{R_i}
 \le17\alpha_{m_i}^2+\frac{24}{m_i}
                       +\frac{8\alpha_{m_i}}{\sqrt{m_i}}
 \le\frac{42}{m_i},
 \tag{31b}
\]

where sqrt(2/3)<5/6. Consequently use K<=42/[4(m+3)],
M<=1/[4(m+3)] and a²<=2/(3m) in the refined (21). If all active m_i>=m,

\[
 \boxed{\quad\theta\le\frac{29}{3(m+3)}+\frac2{9m}.\quad}
 \tag{31}
\]

There is also a rank-one refinement, uniform over all m_i>=1:
**theta<=39/16**. Indeed (29) gives alpha_1²<=1-4/e²<1/2. In (31b)'s first
bound this gives L_1<=17/2+24+4 sqrt(2)<77/2. Thus K<=77/32, M<=1/16,
a²<=1/2. For m_i>=2 the respective bounds 42/[4(m_i+3)],
1/[4(m_i+3)] and 2/(3m_i) are smaller. Formula (6), with the refined K,
now gives (2/3)(77/32+1)+1/6=39/16.

For alpha_1²<1/2 use e<49/18 and (49/18)²<8, from the factorial series
and its geometric tail bound. The other radical bounds are checked by
squaring positive rational numbers. No floating point evaluation is needed.

In particular all m_i>=5 give theta<=451/360<13/10, and all m_i>=24 give
theta<=119/324<37/100. This improves the preceding package's one-factor
plus bulk thresholds 8 and 36, while also allowing any number of factors.

Here are sufficient minimum ranks, including the optional bulk (1):

| t | Rational comparison target | Every m_i at least | Valid theta |
|---|---:|---:|---:|
| 0.80 | 37/100 | 24 | 119/324 |
| 0.82 | 16/25 | 13 | 1163/1872 |
| 0.84 | 133/100 | 5 | 451/360 |
| 0.845 | 47/25 | 3 | 91/54 |
| 0.85 | 5/2 | 1 | 39/16 |
| 0.855 | 37/10 | 1 | 39/16 |

These compare to the question's approximate rooms as rational targets. They
do not independently certify the external row certificate or its margins.
Additional interval certificates in `INTERVAL_PROOF.md` lower these
sufficient ranks to 23,12,4,2,1,1, respectively (**P + C**). In particular,
all ranks at least 4 give theta<=8153/6300<13/10, and all ranks at least
23 give theta<=16226/43875<37/100. The entirely analytic estimates above
remain available without running those scalar certificates.

The classes need not have zero content. For h(v)=v, direct conditioning in
(9) gives

\[
 c_i=4u^{3/2}\rho_i^{3/2}s_i,
 \quad\|c\|^2=16u^3\sum_i\rho_i^3s_i^2,
 \quad\widehat\Omega=3u/4.
 \tag{32}
\]

For r equally weighted equal-m factors without bulk, the ratio is exactly
16/[3r(m+3)]>0. This is checked by an independent polynomial moment replay.

## 6. The requested profiles and analytic endpoints [P]

For the profiles in the question, |ph A_+-ph A_-|<=2 implies

\[
 |\Gamma_A|\le2,\quad |\Gamma_B|\le\sqrt2,\quad|\Gamma_0|\le2,
 \qquad |h_A(v)|\le\frac{14}{5\sqrt v},\quad
 |h_B(v)|\le\frac{21}{10\sqrt v}.
 \tag{33}
\]

For each positive real r, A_+(z;r) and A_-(z;r) are nonzero polynomials in
Re z, Im z: at z=0 their real parts are respectively +/-r(1+b_A), nonzero
on all supplied rows. Their zero sets have Gaussian measure zero. Dominated
convergence proves continuity of the radial Gamma functions. Conjugation of
z proves their positive-real restrictions are real. Thus (3) holds.

With the literal definition using conjugate(e20), Gamma_B has charge -1
under rotation of q, rather than +1. This has no effect on the positive-real
restriction Gamma_B(sqrt(v)) used to define h_B in the question.

To extend the calculations from smooth h to (3), choose smooth approximants
h_n which converge on each compact subset of (0,infinity) and satisfy the
same bound with a fixed larger C. They can be obtained by truncating h near
zero and infinity, followed by local mollification. For fixed u>0 their
resolvents satisfy uniformly

\[
 |k_n(v)|\le C_u(1+v^d),\qquad
 |k_n'(v)|\le C_u(v^{-1/2}+1+v^d).
\]

The first bound follows by integrating (v+u tau)^(-1/2) against exp(-tau);
the second follows from k_n'=(k_n-h_n)/u. Dominated convergence gives the
contents and Omega-hat: q h_n(|q|²) is bounded near zero, and
V k_n'(V)² is bounded there. Gaussian polynomial moments handle infinity.
For each smooth approximant the proof above holds. Passing to the limit in
the inequality proves it for (3), without needing pointwise convergence of
second derivatives. q has no atom at zero when its variance is positive.

All asserted results therefore hold for both specified profiles, at every
u/sigma² in [1/2,13/10], indeed at every u>0. No scalar profile interval check
is needed for these structural classes.

## 7. Relation to the ledger [P / open]

- Definitions agree with **6.3.23** and the degree-5 note's sections 11.4-11.6.
  The present proof of (14) is elementary and does not require 6.3.23 as a
  black-box theorem.
- **11.31a** is the fixed-symmetry principle used to identify zero content
  coordinates; the actual changes of variables are proved in section 2.
- The deficit is calculated directly in (7). Neither the budget bound in
  **6.3.21** nor the Cauchy-Schwarz inequality **6.3.25** is a premise.
- General Gaussian-factor rows **6.3.2-6.3.4, 6.3.10** have different right
  sides and are not being assumed or replaced.
- The result supplies a restricted P subcase for higher-degree **4.19**. The
  universal premise of that row, and hence the global certificate, remain open.
- Independence of the factor blocks is load-bearing in (13) and (22).
  Arbitrary coupled quadratic coefficients, driver self-interaction,
  non-Hermitian factors, and the full H_{2,1} class remain **open** here.

No new lower bound for the Grothendieck constant is claimed.
