<!-- Verbatim from the delivery conjecture_k_content_law_codex_a786.zip (PROOFS.md), 16 November 2026; codex-a786, a GPT session of the user, relayed by the user. Only this line was added. -->
# A phase-sensitive content-law inequality for Hermitian factors and decoupled bulk

Author: codex-a786. 16 November 2026. Repository reference:
b008629992e5dc6ff5672eb16c3ea72d59dcbccb.

Labels: **P** means a complete written proof below, by the author, not a Lean proof
or an independent review. **C** means an exact computation with a replay script.
No numerical assertion is used as a premise.

## 1. Statements and scope

All complex Gaussian coordinates below are standard, with E|X|²=1, and all
named coordinate blocks are independent. Put
\[
 P_m={\sum_{j=1}^m(|Y_j|^2-1)\over\sqrt m},\qquad m\ge1.
\]
An admissible real profile is continuous on (0,∞) and satisfies
\[
 |h(v)|\le C(v^{-1/2}+1+v^d)\quad(v>0)
 \tag{1}
\]
for some finite C,d≥0. Define k, c[h], u, δ and Ω̂ exactly as in the question.

**P1 (finite Hermitian factor).** For q=√u X P_m, at every u>0,
\[
 \boxed{\ \|c[h]\|^2\le {77\over9(m+3)}\,\delta\,\widehat\Omega[h].\ }
 \tag{2}
\]
Here q belongs to H_{2,1}(C^{m+1}) and χ=4+12/m. Extra unused coordinates,
unitary changes of coordinates and a scalar phase do not affect the conclusion.
In particular these are moderate-kurtosis cubics with generally nonzero content,
not a zero-content symmetry class.

**P2 (finite bulk, arbitrary size and coefficients).** Let
\[
 W=\sum_{j=1}^r\overline {Z_j}F_j(U),\qquad E|W|^2=1,
 \tag{3}
\]
where F_j are homogeneous holomorphic quadratic polynomials in an independent
complex Gaussian vector U. For 0≤ρ≤1 put
\[
 q=\sqrt u\{\sqrt\rho\,X P_m+\sqrt{1-\rho}\,W\}.
 \tag{4}
\]
This is a genuine finite-dimensional H_{2,1} cubic. For every such W, every ρ,
every u>0, and every admissible h,
\[
 \boxed{\ \|c[h]\|^2\le
 \left({253\over18(m+3)}+{2\over9m}\right)
 \delta\,\widehat\Omega[h].\ }
 \tag{5}
\]
For m=1 the smaller constant 55/16 is valid in (5).
For m=8 the smaller constant 11009947/8553600<13/10 is valid.
When ρ=1 use the sharper (2); when ρ=0 the content is zero.

The bulk includes
\[
 W_N={1\over\sqrt{2N}}\sum_{j=1}^N U_j^2\overline {Z_j}.
 \tag{6}
\]
It has variance one and χ=10/N, and converges to a standard complex Gaussian.
Thus (5) treats finite approximations to a diffuse Gaussian bulk with one
constant, without taking a first-chaos Gaussian as a cubic. It also treats
non-diffuse and correlated-coefficient bulk (3).

**P3 (general Hermitian-factor criterion).** Let
\[
 P=\sum_j\lambda_j(|Y_j|^2-1),\quad \lambda_j\in\mathbb R,\quad
 \sum_j\lambda_j^2=1,\quad B=\sum_j\lambda_j^2|Y_j|^2,\quad R=P^2.
\]
Define the phase-sensitive conditional quantities
\[
 p(R)=E[P\mid R],\quad b(R)=E[PB\mid R],\quad
 \kappa=\sum_j\lambda_j^4,\quad s_3=\sum_j\lambda_j^3 .
\]
For q=√u XP, the content-law inequality holds with
\[
 \theta(P)={2\over3(4+12\kappa)}
 \left\{24E{b(R)^2\over R}-8E{p(R)b(R)\over R}
        +E{p(R)^2\over R}+16s_3^2\right\}.
 \tag{7}
\]
The expression in braces is nonnegative. Values at R=0 can be assigned
arbitrarily; P has no atom there. A simpler sufficient bound is
\[
 \theta(P)\le {2\over3(4+12\kappa)}
 \{(\sqrt{17}\alpha+\sqrt{24\kappa})^2+16s_3^2\},
 \qquad \alpha^2=E{p(R)^2\over R}.
 \tag{8}
\]
There is no claim here that (7) or (8) is small enough for every spectrum λ.
They are a new explicit criterion on the factor's phase, not on the law of |q|
alone. Formula (2) evaluates this criterion analytically for equal eigenvalues.

**Open.** These theorems do not cover arbitrary H_{2,1} tensors, the one-coordinate
Wick cubic, unequal-spectrum factors with sufficiently small constants, or
general self-interaction coupled to the bulk. No full certificate row, Conjecture K,
or new lower bound for K_G^C is claimed.

## 2. The dual quadratic form preserves the subtraction in Ω̂ [P]

If μ is a probability measure and f,d are real square-integrable functions, then
\[
 |E_\mu[df]|^2\le
 \{E_\mu d^2+(E_\mu d)^2\}
 \{E_\mu f^2-\tfrac12(E_\mu f)^2\}.                 \tag{9}
\]
Indeed split each function into its mean and centered part and use Cauchy–Schwarz
on the direct sum with weights 1 and 1/2. Equivalently the inverse of I−Π_const/2
is I+Π_const. In particular this is not the cruder bound Ω̂≥(3/4)E[V k'²].

For any joint probability space carrying V with EV=u, the size-biased probability
dμ=(V/u)dP gives
\[
 \widehat\Omega={3u\over2}
 \{E_\mu k'(V)^2-\tfrac12(E_\mu k'(V))^2\}.         \tag{10}
\]
Only the law of V occurs on the right. At fixed u this functional is concave in
that law. The multiplier δ is treated at a fixed fourth-moment cell, as in the
question; δ Ω̂ is not asserted to be jointly concave when δ is allowed to vary.

## 3. Keeping the sign of a quadratic factor [P]

We first prove (7). Independent rotations of each Y_j leave q unchanged, so all
content coordinates except X vanish. Put S=|X|², independent Exp(1). Then
\[
 c_X=\sqrt u\,E[P S h(uP^2 S)].                    \tag{11}
\]
For the above real quadratic P, exponential integration by parts gives
\[
 E[P g(P)]=E[B g'(P)].                            \tag{12}
\]
For completeness, for T_j=|Y_j|² and a differentiable test g,
E[(T_j−1)g(P)]=E[T_j\lambda_j g'(P)]; multiply by λ_j and sum.

Apply (12) to g(P)=S k(uP²S), and subtract the term u S P k'(uP²S).
Since h=k−uk',
\[
 c_X=u^{3/2}E[S\{2S PB-P\}k'(uP^2S)]
     =u^{3/2}E[S\{2S b(R)-p(R)\}k'(uRS)].          \tag{13}
\]
This conditional expectation is the crucial step. It retains the sign/phase
imbalance of P at fixed |P| before applying a norm estimate.

Take dμ=RS dP (ER=ES=1), f=k'(uRS), and
\[
 d(R,S)={2S b(R)-p(R)\over R}.
\]
Using ES=1, ES²=2, ES³=6,
\[
 E_\mu d^2=24E(b^2/R)-8E(pb/R)+E(p^2/R),\qquad
 E_\mu d=4E(PB)-EP=4s_3.                          \tag{14}
\]
All these terms are finite by conditional Jensen; for example
E[b²/R]≤EB² and E[p²/R]≤1.
Combining (9), (10), (13) gives
\[
 |c_X|^2\le {2u^2\over3}
 \{24E(b^2/R)-8E(pb/R)+E(p^2/R)+16s_3^2\}\widehat\Omega .
 \tag{15}
\]
The cumulants of a centered exponential are (j−1)! for j≥2, so
EP⁴=3+6κ. Hence E|q|⁴=2u²(3+6κ), and δ=u²(4+12κ).
This proves (7).

To prove (8), write b=p+d_0 with d_0(R)=E[P(B−1)|R].
The two summands in d are (2S−1)p/R and 2S d_0/R. Their squared L²(μ)
norms are respectively 17α² and 24E[d_0²/R]≤24E(B−1)²=24κ.
Use the triangle inequality and (14). This proves (8).

For equal eigenvalues λ_j=1/√m,
\[
 B=1+P_m/\sqrt m,\qquad b(R)=p(R)+R/\sqrt m .
\]
Consequently the cross term in (14) vanishes after expectation, because Ep=EP_m=0:
\[
 E_\mu d^2=17\alpha_m^2+{24\over m},\qquad
 (E_\mu d)^2={16\over m},\quad
 \alpha_m^2=E{E[P_m\mid P_m^2]^2\over P_m^2}.       \tag{16}
\]
Thus the sharper intermediate result is
\[
 \|c[h]\|^2\le
 {2(17\alpha_m^2+40/m)\over3(4+12/m)}\,
 \delta\,\widehat\Omega[h].                        \tag{17}
\]

## 4. A phase-asymmetry bound with an exact constant [P]

Let f_m be the density of P_m, and put g_m(p)=f_m(−p). Folding the real line,
\[
 \alpha_m^2=\int_0^\infty
 { (f_m(p)-f_m(-p))^2\over f_m(p)+f_m(-p)}\,dp .
 \tag{18}
\]
Terms with zero denominator are set to zero. If
A_m=∫_R√(f_m(p)f_m(−p))dp is their Hellinger affinity, then
\[
 \alpha_m^2\le1-A_m^2.                            \tag{19}
\]
To see this directly, under the folded probability with density f_m(p)+f_m(−p)
on p>0, set a(p)=(f_m(p)−f_m(−p))/(f_m(p)+f_m(−p)).
Then E a²=α_m² and E√(1−a²)=A_m. Cauchy–Schwarz gives A_m²≤1−α_m².

The centered Gamma density gives an exact beta integral:
\[
 A_m={m^m e^{-m}\sqrt\pi\,\Gamma((m+1)/2)
              \over\Gamma(m)\Gamma((m+2)/2)}
     =\exp\{-2r(m/2)\},                            \tag{20}
\]
where
\[
 r(x)=\log\Gamma(x)-(x-\tfrac12)\log x+x-\tfrac12\log(2\pi).
\]
Indeed the product of the two densities is supported on |p|<√m. Substitute
p=√m s and integrate (1−s²)^{(m−1)/2} on [−1,1]; the second equality is the
Gamma duplication formula.

For clarity the precise Stirling remainder estimate used here follows from
Binet's formula:
\[
 r(x)=2\int_0^\infty {\arctan(t/x)\over e^{2\pi t}-1}\,dt,\qquad
 0<r(x)<{2\over x}\int_0^\infty {t\over e^{2\pi t}-1}\,dt
 ={1\over12x}.                                   \tag{21}
\]
The last integral equals 1/24 by expanding the denominator and using
∑n^{-2}=π²/6. Binet's identity is DLMF 5.9.10; the bound also follows from the
positive-real remainder statement in DLMF §5.11(ii).
It follows that
\[
 A_m\ge e^{-1/(3m)},\qquad
 \boxed{\ \alpha_m^2\le1-e^{-2/(3m)}\le {2\over3m}.\ } \tag{22}
\]
Putting (22) in (17) gives
\[
 {2\over3}\,{34/(3m)+40/m\over4+12/m}
 ={77\over9(m+3)},
\]
proving (2).

This use of sign information is essential. If |P| were kept but its sign were
independently symmetrized, (11) would vanish for every radial profile, while
the law of |XP| would not change. This observation explains the information in
(18); the symmetrized variable is not asserted to be a cubic.

## 5. Arbitrary finite decoupled bulk [P]

Write
\[
 D=\sum_j|F_j(U)|^2,\qquad ED=1,\qquad v_D=\operatorname{Var}D .
\]
Conditional on U, W is a proper complex Gaussian with variance D.
The joint rotation U↦e^{iφ}U, Z↦e^{2iφ}Z leaves W fixed and has no fixed
coordinate vector in the U,Z block. Rotations of the individual Y_j also fix q.
Thus the entire content vector is again its X component. This is the
symmetry principle of ledger 11.31a, here verified directly for these rotations.

Put R=P_m² and
\[
 A=\rho R+(1-\rho)D.
\]
The radial law of q is V=uAT with T independent Exp(1), and
\[
 \delta=\delta_c+\delta_b,\qquad
 \delta_c=u^2\rho^2(4+12/m),\quad
 \delta_b=2u^2(1-\rho)^2v_D.                       \tag{23}
\]
This follows either by conditioning on (Y,U), or by adding fourth cumulants
of the two independent circular summands.

We use the content identity of ledger 6.3.23, not the Cauchy–Schwarz inequality
6.3.25:
\[
c_X=E[\overline X\,k'(V)\{\overline q\,a+q(c_2-u)\}].
\]
Direct differentiation of (4) gives its Stein pair:
\[
 a=u\rho X^2(1+P_m/\sqrt m),\quad
 c_2-u=u\rho\{|X|^2(1+P_m/\sqrt m)-1\}
                    +u(1-\rho)(D-1).             \tag{24}
\]
For the bulk, a_W=0, since it is holomorphic in U and antiholomorphic in the
disjoint Z block; c_{2,W}=D.

Assume 0<ρ≤1, and set
\[
 b={\rho R\over A},\quad
 H=bT+2(1-b),\quad \eta(R)=E[P_m\mid R].
\]
Conditional Gaussian regression of X against q, followed by conditioning on R,
turns 6.3.23 into
\[
 c_X=u^{3/2}\{\rho^{3/2}E[T\{\eta(2H-1)+2RH/\sqrt m\}k'(uAT)]
       +\sqrt\rho(1-\rho)E[T\eta(D-1)k'(uAT)]\}.
 \tag{25}
\]
Here and below b is a temporary regression weight, not the row coefficient b_A.
One way to check every factor: conditional on q,P_m,D, X has mean
\(\sqrt\rho P_m q/(\sqrt u A)\) and variance (1−ρ)D/A; for a proper complex
Gaussian with mean M and variance s, E[X|X|²]=M(|M|²+2s).
Inserting this in (24) gives (25).

Under dμ=AT dP, let
\[
 d={\eta(2H-1)+2RH/\sqrt m\over A},\qquad
 e={\eta(D-1)\over A},\qquad f=k'(uAT).
\]
The two summands of (25) are u^{3/2}ρ^{3/2}Eμ[df] and
u^{3/2}√ρ(1−ρ)Eμ[ef]. Since 0≤b≤1,
\[
 E_T[T(2H-1)^2]=9+8b^2\le17,\quad
 E_T[TH^2]=4+2b^2\le6,\quad E_T[TH]=2.
\]
Using A≥ρR and the triangle inequality in L²(μ),
\[
 \|d\|_{L^2(\mu)}
 \le {1\over\sqrt\rho}\{\sqrt{17}\alpha_m+\sqrt{24/m}\},
 \qquad E_\mu d={4\over\sqrt m}.                  \tag{26}
\]
Independence of D and P_m gives
\[
 E_\mu e=0,\qquad E_\mu e^2\le {\alpha_m^2v_D\over\rho}. \tag{27}
\]
Apply (9) separately to the two terms. Their squared absolute values are at most
\[
 \theta_c\delta_c\widehat\Omega,\quad
 \theta_b\delta_b\widehat\Omega,
\]
where
\[
 \theta_c={2\over3(4+12/m)}
       \{(\sqrt{17}\alpha_m+\sqrt{24/m})^2+16\rho/m\},
 \qquad \theta_b={\alpha_m^2\over3}.              \tag{28}
\]
Consequently, by Cauchy–Schwarz on the two scalar budgets,
\[
 |c_X|^2\le(\theta_c+\theta_b)(\delta_c+\delta_b)\widehat\Omega.
 \tag{29}
\]
This remains valid if either budget is zero.

From (22), ρ≤1 and √17<33/8,
\[
 \theta_c\le{77/9+(4/3)\sqrt{17}\over m+3}
             \le {253\over18(m+3)},\qquad
 \theta_b\le {2\over9m}.
\]
This proves (5). The exact checks include (33/8)²>17.

For m=1, (19),(20) give α_1²≤1−4/e²<1/2. The elementary estimate
e<1+1+1/2+(1/6)/(1−1/4)=49/18 implies e²<8.
Use α_1²≤1/2 and √204<15 in (28):
\[
 \theta_c\le{1\over24}\{17/2+24+2\sqrt{204}+16\}
 \le157/48,\quad \theta_b\le1/6,
\]
so θ_c+θ_b≤55/16. The case ρ=0 is zero-content by the symmetry already proved.

For m=8, retaining one more term of the scalar bound improves the common
threshold 13/10. Taylor's theorem gives
\[
\alpha_m^2\le1-e^{-x}\le x-x^2/2+x^3/6,\qquad x=2/(3m).
\]
At m=8 this is α_8²≤829/10368. Moreover
\[
{408\over8}{829\over10368}<(101/50)^2.
\]
Substituting these rational upper bounds into (28), with ρ≤1, yields
\[
\theta_c+\theta_b\le {4\over33}
\left(17{829\over10368}+5+{101\over25}\right)
{829\over31104}
={11009947\over8553600}<{13\over10}.              \tag{29a}
\]
All the comparisons in (29a) are exact. For m≥9 the simpler bound (5) is
already smaller than 13/10, so m≥8 suffices.

For (6), D_N=(2N)^{-1}∑|U_j|⁴, so ED_N=1 and Var D_N=5/N.
This proves χ(W_N)=10/N. The ordinary two-dimensional CLT proves the stated
Gaussian limit. The inequality itself is finite-dimensional and needs no CLT.

## 6. Admissibility of the six requested profiles [P]

No interval computation of a row profile is needed for (2) or (5): the theorem
holds for the whole class (1). For the profiles in the question,
|ph A_+−ph A_-|≤2. Therefore
\[
 |\Gamma_A|\le2E|e_{11}|\le2,\quad
 |\Gamma_B|\le2E|e_{20}|=\sqrt2,\quad |\Gamma_0|\le2.
\]
It follows that
\[
 |h_A(v)|\le{14\over5\sqrt v},\qquad
 |h_B(v)|\le{21\over10\sqrt v}.                    \tag{30}
\]
The second bound uses √2≤3/2. All row coefficients are real. Conjugation of z
shows that the radial restrictions Γ_X(r), r>0, are real.
For fixed r>0, the set where A_±(z;r)=0 has Gaussian measure zero:
a nonzero real polynomial component has a zero set of Lebesgue measure zero.
Here Re A_±(0;r)=±r(1+b_A)≠0 for each of the six rows.
Dominated convergence then gives continuity for r>0.

There is a minor covariance convention in the question: with the literal
definition using conjugate(e20), Γ_B(e^{iφ}q)=e^{-iφ}Γ_B(q), while Γ_A and Γ_0
have charge +1. The real-axis restriction Γ_B(r) used to define h_B(v) is
unambiguous and is exactly what is used here. This correction has no effect
on any scalar h_B or any inequality in this note.

To justify the identities at v=0 under (1), first replace h near zero by
h_ε(v)=h(max(v,ε)). These are continuous profiles of polynomial growth, to which
6.3.23 applies. The associated k_ε converge pointwise to k, and
\[
 |k_\epsilon(v)|\le C_u(1+v^d),\quad
 |k'_\epsilon(v)|\le C_u(v^{-1/2}+1+v^d).
\]
The first bound can be enlarged by a constant depending on u; it is uniform in ε.
Thus q k'_ε(|q|²) is bounded near q=0 and has polynomial growth at infinity.
Dominated convergence with Gaussian polynomial moments proves (13), (25), and
all content and Ω̂ limits. The same argument justifies the one-variable
integration by parts (12) after composition with k(uP²S).
Values of h or ph at zero are irrelevant; these q have no atom at zero.

In particular every u/σ²∈[1/2,13/10] in every requested row is covered on the
structured classes in P1 and P2. All coefficients may be treated as the exact
decimals provided: their values do not enter the constant.

## 7. Exact row comparisons and nonzero-content controls [P + C]

The following thresholds use the displayed approximate room targets in the
question only as rational comparison targets. They do NOT certify the external
convex program or its room.

| t | comparison target | P1: sufficient m | P1 theta at that m | P2: sufficient m | P2 theta at that m |
|---|---:|---:|---:|---:|---:|
| 0.80 | 37/100 | 21 | 77/216 | 36 | 386/1053 |
| 0.82 | 16/25 | 11 | 11/18 | 20 | 28/45 |
| 0.84 | 133/100 | 4 | 11/9 | 8 | 11009947/8553600 |
| 0.845 | 47/25 | 2 | 77/45 | 5 | 1297/720 |
| 0.85 | 5/2 | 1 | 77/36 | 3 | 29/12 |
| 0.855 | 37/10 | 1 | 77/36 | 1 | 55/16 |

All subsequent m also work: the basic rational constants decrease with m,
and the extra m=1 and m=8 refinements are checked separately.
For the single common target 13/10, P1 needs m≥4 and P2 needs m≥8.

For h(v)=v and q=√u XP_m,
\[
 c_X=4u^{3/2}/\sqrt m,\quad
 \delta=u^2(4+12/m),\quad \widehat\Omega=3u/4,\quad
 {\|c\|^2\over\delta\widehat\Omega}={16\over3(m+3)}. \tag{31}
\]
Thus these classes do not simply have zero content.
Also, (31) shows that the order 1/m in a bound uniform over profiles is
optimal on P1. The upper constant in (2) is 77/48 times this exact lower
bound on the best profile-uniform constant.

For the question's control q=X(|X|²−2), h(v)=v,
\[
 u=2,\quad E|q|^4=176,\quad \delta=168,\quad
 c_X=32,\quad \widehat\Omega=3/2,
\]
and the ratio is 1024/252=256/63. This verifies the warning that a profile-free
small constant cannot hold on all cubics. It does not contradict (2), because
that cubic has self-interaction in the driver, excluded from P1 and P2.

## 8. What is and is not a repository dependency

- Ledger **6.3.23** supplies the exact content representation used in (24)–(25).
  Its extension to the harmless v^{-1/2} bound is given in §6.
- Ledger **11.31a** is the general fixed-group symmetry principle; the relevant
  rotations are explicitly verified here, so this use can be removed.
- The radial transform convention is the one of **6.3.23**; Ω̂ and the row-room
  comparisons are those of CONTENT_LEMMA_D5.md §§11.4–11.6.
- Ledger **6.3.25** is NOT used to estimate the content. In particular no
  supremum over directions and no separate norms of its four pairings occur.
- Ledger **6.3.21** is consistent with the fourth moments, but (23) and the
  χ formulas are derived directly; no unproved deficit hypothesis is used.
- Existing Gaussian-factor content/deficit bounds **6.3.2–6.3.4** and **6.3.10**
  are background, not premises. Their RHS is different.
- Binet's formula and Gamma duplication are the only external special-function
  identities used. The exact constants follow in §4.

There is no implication from these restricted theorems to the universal
content-law inequality. Extending the sign-conditioned estimate to genuinely
coupled cubic tensors, or obtaining a comparable conditional phase estimate
for their content direction, remains open.

