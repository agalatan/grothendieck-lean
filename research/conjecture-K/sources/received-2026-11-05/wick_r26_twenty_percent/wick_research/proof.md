<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/ai-notes/wick_r26_twenty_percent/wick_research/proof.md (file dated 2026-11-05). Only this line was added. -->
# Wick self-interaction: a certified 20% coefficient neighborhood

5 November 2026. Analytic proof with exact rational and Arb scalar certificates.
This is not a Lean proof. The full R26 and general Conjecture K remain open.

## The theorem

All complex Gaussians are standard, with E|X|²=1. Let X be independent of Y,
and let P=P(Y) be ANY centered complex random variable with finite second moment.
Set

\[
 q=X[c(|X|^2-2)+P],\quad q_0=cX(|X|^2-2),\quad
 v=2|c|^2,\quad p=\mathbb E|P|^2,\quad u=v+p.
\]

The visible variable Z is independent of all remote variables. At each row

| row | epsilon | a | b |
|---|---:|---:|---:|
| peak | 1891/2500 | 699/1250 | 179/1250 |
| flank | 149/200 | 14/25 | 1467/10000 |
| upper | 1891/2500 | 573/1000 | 19/125 |

put L=Z(a+b|Z|²), and define

\[
 F(q)=2\mathbb E|L+q|,\quad B(u)=2\mathbb E|L+\sqrt u W|,
 \quad \Delta(q)=B(u)-F(q),
\]
\[
 f(z)=\mathbb E_Z[(|Z|^2-1)\operatorname{ph}(L+z)]
     =z g(|z|^2),\quad C(q)=\|\Pi_{1,0}f(q)\|_2.
\]

Here W is independent standard complex Gaussian. Circular symmetry of L makes
2E|L+q| equal to E|L+q|+E|L-q|. If Y is not presented as a Gaussian vector,
C can simply be read as |E[conjugate(X) f(q)]|. In the Gaussian setting all
Y-direction coefficients vanish by the circular symmetry in X.

**Theorem.** If

\[
 \frac{551}{100000}\le u\le\frac{463}{10000},\qquad p\le\frac u5,
\]

then

\[
 \boxed{C(q)^2\le\frac9{40}\Delta(q)<\frac6{25}\Delta(q).}
\]

The second inequality is strict here: v >= (4/5)(551/100000)>0, and the
certificate gives a strictly positive deficit. In particular this covers
arbitrary centered non-Hermitian quadratic P, without a dimension or rank bound.
It also proves a statement for nonquadratic P, although the Conjecture-K
application takes P in H_(1,1).

The earlier endpoint certificate required p<=u/16 and u>=0.03. This theorem
allows p<=u/5 over the entire application energy interval.

## 1. An exact half-moment improves the content perturbation

Write R=|X|², with exponential density e^(-r). The inherited positive kernel
representation (derived in kernel_proof.md) is

\[
 -g(s)=\frac{\sqrt\pi}{4}\int \lambda^{-1/2}
 {}_1F_1(3/2;2;-\lambda s)\,\mu(d\lambda),
 \qquad \mu([0,\infty))=a^{-2}.
\]

Euler's beta integral identifies the hypergeometric function with
E exp(-lambda s V), where V has Beta(3/2,1/2) law. Thus, if
-g(s)=int exp(-ts) nu_f(dt), its half moment is EXACTLY

\[
 \int\sqrt t\,\nu_f(dt)
 =\frac{\sqrt\pi}{4}\mathbb E\sqrt V\,\mu([0,\infty))
 =\boxed{\frac{2}{3\sqrt\pi a^2}}.                 \tag{1}
\]

We used E sqrt(V)=8/(3pi). No Cauchy--Schwarz estimate of this half moment is
needed.

For F_t(z)=z exp(-t|z|²), considered as a map R² to R²,

\[
 \sup_{z,|h|=1}|D^2F_t(z)[h,h]|\le2\sqrt t.       \tag{2}
\]

For completeness, scale t to 1, choose h=(1,0), and write s=|z|² and
w=(Re z)²/s. A direct computation gives

\[
 |D^2F_1(z)[h,h]|^2
 =4e^{-2s}s[1+(8-4s)w+4s(s-2)w^2].
\]

The maximum over w in [0,1] of the expression after 4e^(-2s) is
s(3-2s)² for 0<=s<=1/2, 2 for 1/2<=s<=2, and s(2s-3)² for s>=2.
Each is at most e^(2s):

* For 0<=s<=1/2, the first four terms of the exponential give a difference
  at least 1-7s+(38/3)s²>0; the quadratic has negative discriminant.
* For 1/2<=s<=2, use e^(2s)>=e>2.
* For s>=2, e^(2s)>=(2s)^4/24, and
  (2/3)s³-4s²+12s-9 is positive at 2 and increasing thereafter.

Integrating (2) against nu_f and using (1) proves

\[
 \sup_{z,|h|=1}|D^2f(z)[h,h]|
 \le\frac4{3\sqrt\pi a^2}.                       \tag{3}
\]

Conditional on X, the first-order Taylor term in XP vanishes because EP=0.
The second-order remainder, followed by the X first-chaos projection, gives

\[
 C(q)\le C(q_0)+\frac2{3\sqrt\pi a^2}p\,\mathbb ER^{3/2}
 =\boxed{C(q_0)+\frac{p}{2a^2}}
 \le C(q_0)+\frac85p.                            \tag{4}
\]

Indeed E R^(3/2)=3sqrt(pi)/4, and all three rows have a²>5/16.
This replaces the previous perturbation bound C(q)<=C(q_0)+4p.

## 2. A beta--gamma comparison improves the deficit perturbation

Let

\[
 \phi(s)=2\mathbb E|L+\sqrt s|-2\mathbb E|L|,
 \qquad A(s)=-B''(s)>0,\qquad I(s)=\int_0^s A(x)\,dx.
\]

The Gaussian scale-mixture formulas give

\[
 -\phi''(s)=\frac{\sqrt\pi}{8}\int\lambda^{3/2}
 {}_1F_1(3/2;3;-\lambda s)\,\nu(d\lambda),
\]
\[
 A(s)=\frac{\sqrt\pi}{4}\int
 \lambda^{3/2}(1+\lambda s)^{-3/2}\,\nu(d\lambda).
\]

If V has Beta(3/2,3/2) law and G has Gamma(shape=3/2, rate=3/2) law, then
V is stochastically smaller than G. On (0,1) their density ratio is

\[
 \sqrt{\frac{128}{27\pi}}\sqrt{1-x}\,e^{3x/2}.
\]

It starts above 1, increases up to x=2/3, and then decreases to zero, crossing
1 exactly once. Beyond 1 the beta density is zero. This one-crossing argument
proves the stochastic comparison. Taking Laplace transforms gives

\[
 {}_1F_1(3/2;3;-x)\ge(1+2x/3)^{-3/2},\qquad
 \boxed{-\phi''(s)\ge\tfrac12 A(2s/3)}.           \tag{5}
\]

Consequently phi'(s)<=phi'(0)-(3/4)I(2s/3). Define

\[
 H_v(t)=\mathbb E_R\phi\left(R[\tfrac v2(R-2)^2+t]\right).
\]

Since B'(0)=phi'(0), (5) proves

\[
 H_v'(t)-B'(v+t)
 \le I(v+t)-\frac34\widehat{\mathbb E}
 I\left(\frac23R[\tfrac v2(R-2)^2+t]\right),       \tag{6}
\]

where the hat means the Gamma(2,1) law, with density r e^(-r).

The exact-rational checker verify_deficit.py proves that the right side of (6)
is at most v, simultaneously at all three rows, on

\[
 \frac{11}{2500}\le v\le\frac{463}{10000},\quad
 0\le t\le v/4,\quad v+t\le\frac{463}{10000}.     \tag{7}
\]

It uses the inherited positive convex kernel A, outward linear bounds on A,
and exact integrals of those linear functions. The Gamma(2,1) expectation is
bounded below on radial bins of width 1/128 up to 24. Its omitted nonnegative
tail is discarded. The bin masses have outward Arb enclosures. All subsequent
comparisons are rational. Parameter rectangles cover the continuum, including
the boundaries.

Finally concavity of phi and EP=0 give

\[
 F(q)-2\mathbb E|L|\le H_v(p),\qquad
 F(q_0)-2\mathbb E|L|=H_v(0).
\]

Integrating (6)--(7) between 0 and p yields

\[
 \boxed{\Delta(q)\ge\Delta(q_0)-vp.}              \tag{8}
\]

This replaces the old loss (7/2)up. The whole argument uses only the centering,
second moment, and independence of P.

## 3. The final one-dimensional certificate

For each coefficient cell [c_l,c_h] of width 1/4096, the Node checker obtains
an upper bound C_h for C(q_0) and a lower bound D_l for Delta(q_0), uniformly
on that cell. Let v_l=2c_l² and v_h=2c_h², and put

\[
 p_h=\min\{v_h/4,\ 463/10000-v_l\}.
\]

The checker verifies with integer arithmetic

\[
 D_l-v_h p_h>0,\qquad
 \boxed{(C_h+\tfrac85p_h)^2\le\tfrac9{40}(D_l-v_h p_h).} \tag{9}
\]

It keeps every coefficient cell meeting 0.0044<=v<=0.0463. Thus it includes
every possible v under the theorem's hypotheses, since
v >= (4/5)(551/100000)=0.004408. Equations (4), (8), and (9) prove the theorem.

The kernel enclosures in this checker are constructed from scratch, using
BigInt outward bounds for exponentials and the angular mean of a complex norm.
Convex interpolation improves the potential integration. In the remote radius
x=|X|, the interpolation error of c(x³-2x) contributes at most 2/n² to the
potential integral; the implementation includes this allowance with n=512.
The visible-radius interpolation has a separate allowance 1/n². The omitted
radius>5 tails have separate outward allowances. No floating quadrature enters
the proof. Integer guesses supplied by sqrt are checked by exact integer
comparisons. The program checks the safe-integer range for its accumulators.

| row | coefficient cells | certified upper ratio |
|---|---:|---:|
| peak | 432 | 0.224001 |
| flank | 432 | 0.223992 |
| upper | 432 | 0.222809 |

Rounding the theorem to 9/40=0.225 preserves margin. The deficit checker used
227, 229, and 145 rational parameter boxes, respectively. All 381 inherited
A,H kernel nodes were independently recomputed at 128-bit precision, with the
new balls contained in the old outward enclosures.

## 4. Consequence for the shared A shell

In the cubic application, use the supplied shell-cost estimate

\[
 \Lambda(q+(T-1)U)\le\Lambda(q)+2\Re\langle U,f(q)\rangle
       -\frac6{25}\|U\|_2^2
\]

for ||U||²<=0.0113. Maximizing its quadratic right side in U and using the
theorem gives

\[
 \boxed{\Lambda(q+(T-1)U)
 \le B(u)-u/\varepsilon-\frac1{16}\Delta(q)\le S.}
\]

Arbitrary sharing of U with X and Y is allowed. This corollary uses the
previously supplied shell-cost theorem; the present archive does not reprove it.

## Replay

Run from this directory:

    node verify_template.mjs
    python check_kernels.py
    python verify_deficit.py

The Python scripts require python-flint. The Node checker needs no packages.
The complete logs are included. generate.py and kernels.py can also reconstruct
the inherited kernel tables; check_kernels.py instead verifies their existing
outward endpoints at higher precision.

## Literature actually used

Euler's integral for Kummer functions supplies the beta-law representations:
NIST DLMF, https://dlmf.nist.gov/13.4.E1. DLMF uses the regularized Olver function;
the formulas here use the ordinary 1F1, so the beta density is normalized.

The additional papers inspected were Malicet--Nourdin--Peccati--Poly,
"Squared chaotic random variables: new moment inequalities with applications"
(https://arxiv.org/abs/1503.02154), and Pang, "A Gamma envelope and sharp moment
inequalities for Gaussian quadratic forms" (https://arxiv.org/abs/2609.05914).
Their product/moment and fourth-order convexity results are not asserted to
imply the nonlinear content inequality. They are not dependencies of this proof.

The original Gaussian-mixture and kernel identities are inherited from the
supplied R23/R24 bundle. The half-moment evaluation, sharper perturbation
estimates, and expanded certificate above are the new steps in this archive.

## Remaining scope

This does not settle p>u/5, mixtures of the other five one-driver shells,
several drivers with self-interaction, or arbitrary Conjecture K. A further exact
reduction and an explicitly uncertified numerical candidate are recorded in
integrate_first.md. Those exploratory observations are not used anywhere in
the theorem or its corollary.
