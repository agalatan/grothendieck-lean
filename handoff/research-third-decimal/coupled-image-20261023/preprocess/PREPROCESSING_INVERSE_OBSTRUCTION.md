# Nonlinear scalar channel preprocessing: inverse tests and neutral factor removal

The subsequent companion note `MIXTURE_PREPROCESSOR_OBSTRUCTION.md` proves a
broader bound `D<0.711916311229984` for arbitrary mixtures of
`phi(p)*K` with real odd contractive `p` and arbitrary complex even
contractive `K`. It therefore covers mixtures, asymmetric neutral maps and
off-diagonal auxiliary quadratic interactions that the stronger inverse
ceiling and exact unmixed optimality equivalence below do not cover.
`COMPLEX_PREPROCESSOR_EXTENSION.md` further extends that broader mixture
bound to complex charged preprocessors with physical phase composition.

This note closes one concrete nonlinear-preprocessing escape route. It does
**not** extend the previous raw neutral-Gaussian theorem to arbitrary
preprocessors or arbitrary responses.

For the fully complex-valid independent Hermitian-quadratic family

\[
 F(z,w)=G(z,w)=\operatorname{phase}(z)\exp(ia|w|^2),\qquad a\in\mathbb R,
\]

any common real odd scalar Wiener preprocessor of norm at most one has full
residual score

\[
 D < 0.711900642946 < 0.711947.
\]

The first inequality is an upper ceiling for this class. It is not a new
Grothendieck endpoint. The current conditional incumbent score exceeds
`0.711947`, so this class cannot improve it. The proof uses only inverse
coefficients through degree seven and an interval enclosure of pi.

The same uniform ceiling holds for the broader family

\[
 F(z,W,Y)=G(z,W,Y)
 =\operatorname{phase}(z)\exp\{iW^*AW+i\langle a,Y\rangle\},
\]

with arbitrary finite Hermitian `A`, independent ordinary proper complex
Gaussian `W`, and independent neutral real Gaussian `Y` with correlation
`|rho|^2`. It includes arbitrarily many independent quadratic directions and
a diffuse neutral-Gaussian phase driver. Section 3 gives the inverse
inequality behind this extension.

There is a stronger structural result: **independent real scalar nonlinear
preprocessors for the charged and neutral channels do not help this
separable phase-modulation class either**. Its optimal full residual score
equals the phase-only scalar preprocessing optimum. This follows from the
factor-removal argument in Section 1, independently of the moment condition
used by the direct inverse-prefix proof in Section 3. The finite degree-seven
ceiling is sufficient to separate the class from the incumbent without
assuming any signs of the infinite Haagerup inverse.

## 1. A residual-to-exact-inverse lemma

Let `W` be the algebra of absolutely summable ordinary power series, with norm
equal to the sum of the absolute coefficients. Let `H` be an odd real series
in `W`, `H'(0)>0`. Its formal compositional inverse exists. Let `h` be an odd
real series with `||h||_W<=1`. Suppose

\[
 C(t)=H(h(t))=a t+E(t),\qquad a>0,\quad E(t)=O(t^3).
\]

Write `e=||E||_W` and assume the residual score `D=a-e` is positive. Then for
every `0<c<=D`,

\[
 \|H^{-1}(c t)\|_W\le1.\tag{1}
\]

Thus a finite inverse prefix whose absolute coefficient sum exceeds one
rules out **every** common scalar preprocessor with residual score at least
`c`. Searching for an approximately linear residual does not evade the
inverse-budget obstruction for a fixed scalar kernel.

### Proof

Set `E_abs(t)=sum_n |E_n| t^n`. Starting with `q_0=0`, iterate

\[
 q_{m+1}(t)=\frac ca t+\frac1a E_{\rm abs}(q_m(t)).
\]

Every iterate has nonnegative coefficients. The iterates increase
coefficientwise, and `q_m(1)<=1`, since

\[
 q_{m+1}(1)\le(c+e)/a\le1
\]

whenever `q_m(1)<=1`. Each fixed coefficient stabilizes after finitely many
iterations because `E` has order at least three. The limit formal series
`q` has nonnegative coefficients and Wiener norm at most one.

The formal inverse `r=C^{-1}(ct)` solves

\[
 r(t)=\frac ca t-\frac1aE(r(t)).
\]

The absolute coefficients of its formal iterates are dominated by those of
`q_m`, hence `||r||_W<=1`. Absolute composition now gives

\[
 \|h\circ r\|_W\le\sum_n|h_n|\|r\|_W^n\le1.
\]

Finally, `H(h(r(t)))=ct`, so formal uniqueness implies
`h(r(t))=H^{-1}(ct)`. This proves (1). No derivative contraction assumption
on `E` is required.

Conversely, if the inverse series `H^{-1}(ct)` has Wiener norm at most one,
it itself is an admissible preprocessor and yields the exact kernel `ct`.
Consequently the optimal residual score over common scalar preprocessing is
the inverse Wiener threshold, interpreted as a supremum. This equivalence
does not apply to a convex mixture of independently preprocessed kernels.

### Removing a neutral resolvent after exactifying the residual

The majorant proof also establishes this useful standalone fact: if an odd
real Wiener kernel `C` has `D(C)>=c>0`, then

\[
 r(t)=C^{-1}(ct),\qquad\|r\|_W\le1.
\tag{1a}
\]

Now consider the multichannel class

\[
 C(t)=\phi(p(t))
       \prod_{j=1}^m[1+A_j(1-R_j(t))]^{-1},
 \quad A_j\ge0.
\tag{1b}
\]

Here `p` is an odd real Wiener contraction, and each `R_j` is an even real
series with `R_j(0)=0` and `||R_j||_W<=1`. For the actual complex quadratic
response, `R_j=q_j^2`, where `q_j` is that auxiliary block's independently
chosen real odd scalar Wiener preprocessor. More generally an `R_j` is
allowed only when its physical neutral covariance has been supplied.

Each resolvent is an absolutely convergent geometric Wiener series of norm
at most one, since `A_j/(1+A_j)<1` and `||R_j||_W<=1`. The phase kernel has
Wiener norm one, so all compositions and products in (1b) belong to `W`.

Suppose `D(C)>=c`. Apply (1a), and precompose **all** channel preprocessors
with `r`. Every Wiener norm stays at most one; odd/even parity and the zero
constant conditions persist. The resulting full kernel is exactly `ct`.
Remove the last resolvent factor. The remaining kernel is

\[
 B(t)=ct[1+A_m(1-R_m(r(t)))].
\]

Its linear coefficient is `c(1+A_m)`, while the sum of absolute higher
coefficients is at most `cA_m`. Consequently `D(B)>=c`. Moreover, `B` is still
of form (1b), with one fewer factor and contracted channel preprocessors.
Repeat the same exactification and removal operation until no factor
remains. This produces an admissible phase-only preprocessor `p_*` with

\[
 D(\phi\circ p_*)\ge c.
\tag{1c}
\]

Thus the optimum over (1b) is at most the phase-only optimum. The reverse
inequality holds by taking all `A_j=0`, so the optima are equal. This is a
statement about full residual scores; it does not assume that the initial
scheme used exact inverse preprocessing.

Independent neutral-Gaussian phase factors are included by a Wiener-norm
limit:

\[
 e^{-s(1-R(t))}
 =\lim_{N\to\infty}[1+(s/N)(1-R(t))]^{-N},\qquad s\ge0.
\]

The convergence holds in the Banach algebra because `||1-R||_W<=2`.
Residual score is Lipschitz with respect to the coefficient Wiener norm, so
the same ceiling passes to the limit. Finite products of such exponential
factors, each with its own neutral correlation, are also covered.

The phase-only optimum can be characterized by the full inverse Wiener
threshold using (1). Its classical evaluation uses the infinite sign theorem
for the Haagerup inverse. Our explicit degree-seven certificate below gives
the slightly weaker but fully replayable uniform ceiling
`D<0.711900642946` for the whole class (1b) and its Gaussian limits.

## 2. Full complex realization of the neutral quadratic family

Take independent proper complex Gaussian coordinate pairs `(z,z')` and
`(w,w')`, both with cross covariance `rho`. The phase pair gives the usual
Haagerup kernel `phi(rho)`. A direct two-dimensional complex Gaussian
determinant calculation gives

\[
 \mathbb E\exp\{ia(|w|^2-|w'|^2)\}
 =\frac1{1+a^2(1-|\rho|^2)}.
\]

Therefore the actual response kernel is

\[
 H_a^{\rm phys}(\rho)
 =\frac{\phi(\rho)}{1+a^2(1-|\rho|^2)}.
\]

It is charge one, and the quadratic auxiliary is invariant under rotations
of its own Gaussian coordinate. With `b=a^2/(1+a^2) in [0,1)`, its real-axis
restriction is

\[
 H_b(t)=\frac\pi4(1-b)\frac{t\,{}_2F_1(1/2,1/2;2;t^2)}{1-bt^2}.
\tag{2}
\]

Its coefficients are nonnegative and sum to `H_b(1)=1`, so it lies in `W`.
For any real odd scalar Wiener preprocessor

\[
 h^{\rm phys}(\rho)=\sum_k h_k\rho|\rho|^{2k},\qquad\sum_k|h_k|\le1,
\]

the tensor construction supplies the physical correlation `h_phys(rho)`
to **both** Gaussian coordinate pairs. On the real axis this is precisely
`H_b(h(t))`. The real coefficients matter: an arbitrary complex-coefficient
ordinary composition need not equal the physical complex radial composition.

This physical composition remains correct when a real preprocessor takes
negative values on the positive real axis: the charged lift is
`rho*P(|rho|^2)`, and its real sign is carried by the charge-one factor.
The neutral even lift only uses its squared modulus. Thus the ordinary
odd/even compositions used in the exactification and removal proof agree
with their physical tensor compositions on the real axis.

The sometimes useful real-Gaussian example
`phase(z) exp(ia(V^2-1))` has a square-root determinant instead. Formula
(2) uses a Hermitian complex quadratic and supplies the full complex
realization explicitly.

## 3. An exact degree-seven obstruction uniform in the chirp size

Normalize (2) by writing

\[
 H_b(t)=\frac\pi4(1-b)F_b(t),\qquad
 y=\frac{4s}{\pi(1-b)}.
\]

The formal inverse of `F_b` begins

\[
\begin{aligned}
 F_b^{-1}(y)={}&y-(b+1/8)y^3
 +(2b^2+5b/8)y^5\\
 &-(5b^3+21b^2/8+7b/64+1/1024)y^7+O(y^9).
\end{aligned}
\tag{3}
\]

These are polynomial identities over the rationals. The checker verifies
the symbolic composition `F_b(F_b^{-1}(y))=y+O(y^9)` without a symbolic
algebra package.

For `s=c`, put `x=4c/pi` and `y=x/(1-b)>=x`. Keeping only degrees one,
three and seven in the absolute inverse budget gives

\[
\begin{aligned}
 \|H_b^{-1}(ct)\|_W
 &\ge y+(b+1/8)y^3
 +(5b^3+21b^2/8+7b/64+1/1024)y^7\\
 &\ge x+x^3/8+x^7/1024=:P_7(x).
\end{aligned}
\tag{4}
\]

All coefficients used in the second inequality are nonnegative. This is
uniform over the entire unbounded real chirp parameter `a`.

Let `c_7` be the unique positive solution `P_7(4c_7/pi)=1`. Interval
arithmetic proves

\[
 0.711900642945<c_7<0.711900642946.
\]

For any residual score `D>c_7`, the lemma and (4), with `c=D`, contradict
each other. Thus `D<=c_7`, proving the stated ceiling.

At the rational lower comparison score `c=711947/1000000`, the certified
degree-seven inverse prefix is

\[
 P_7(4c/\pi)
 =1.00007743375452122912310353594434574266\ldots>1.
\]

The omitted inverse coefficients can only increase the absolute budget.
There is no inverse-tail assumption in this obstruction. The phase case
`b=0` has a stronger known full inverse threshold, approximately
`0.7117898051`; the deliberately shorter prefix is sufficient here.

### Arbitrary Hermitian quadratic forms and neutral Gaussian phase drivers

The same proof works for `H=phi*K` whenever `0<kappa=K(0)<=1` and

\[
 K(t)/\kappa=1+r_1t^2+r_2t^4+r_3t^6+\cdots,
 \qquad r_1,r_2,r_3\ge0,\quad r_2\le r_1^2.
\tag{6}
\]

Here `H` is assumed to be an odd real Wiener series, as in the lemma. Its
normalized inverse has

\[
 d_3=-(1/8+r_1),\qquad d_5=5r_1/8+3r_1^2-r_2,
\]

and

\[
 d_7=-1/1024-7r_1/64-7r_1^2/2+7r_2/8
      -12r_1^3+8r_1r_2-r_3.
\]

The exact positive polynomial decomposition is

\[
 -d_7-1/1024
 =7r_1/64+21r_1^2/8+4r_1^3+r_3
 +(7/8+8r_1)(r_1^2-r_2)\ge0.
\]

Together with `y=4c/(pi*kappa)>=4c/pi`, this gives exactly the lower prefix
bound (4). The multivariate degree-seven identity is checked symbolically
with rational coefficient dictionaries in the replay script.

To see that the stated response class satisfies (6), diagonalize `A` by a
unitary rotation of `W`. If its eigenvalues are `a_j`, set
`b_j=a_j^2/(1+a_j^2) in [0,1)`. Independence and the determinant formula give

\[
 K(t)=e^{-s(1-t^2)}\prod_j\frac{1-b_j}{1-b_jt^2},
 \qquad s=\|a\|^2\ge0.
\]

Thus `kappa=e^{-s}prod_j(1-b_j)<=1`, and

\[
 r_1=s+\sum_jb_j,\qquad
 r_2=\frac12\left(r_1^2+\sum_jb_j^2\right)\le r_1^2,
 \qquad r_3\ge0.
\]

The proper complex auxiliary has physical correlation `rho`, while the
neutral Gaussian driver has physical correlation `|rho|^2`. After the common
scalar preprocessor these become `h_phys(rho)` and `|h_phys(rho)|^2`,
respectively, so the real-axis composed kernel is still `H(h(t))`. Every
finite dimension is covered by the same constant. No representation of an
arbitrary coupled neutral response is inferred.

## 4. Independent phases on the two quadratic responses: a local test

Allow

\[
 F=\operatorname{phase}(z)e^{ia|w|^2},\qquad
 G=\operatorname{phase}(z)e^{id|w|^2},\qquad a,d\in\mathbb R.
\]

Their exact complex kernel on the real axis is

\[
 \frac{\phi(t)}{D_0-ad t^2},\qquad D_0=1+ad+i(a-d).
\]

Multiplying by a constant phase and averaging with its conjugate-reflected
response gives the valid real kernel

\[
 \widetilde H_{a,d,\delta}(t)
 =\frac{\phi(t)}{|D_0|}
   \mathop{\rm Re}\frac{e^{i\delta}}{1-Bt^2},
 \qquad B=ad/D_0.
\tag{5}
\]

At the rational comparison score above, let `P_inv` be the sum of the first
four absolute inverse terms, through degree seven, for (5). Near
`a=d=delta=0`, direct expansion gives

\[
 P_{\rm inv}=P_7(x)
 +\frac L2(a^2+d^2+\delta^2)+M ad+N|ad|
 +o(a^2+d^2+\delta^2),
\]

where

\[
 L=x+3x^3/8+7x^7/1024,\quad
 M=x^3+7x^7/64,\quad N=5x^5/8.
\]

The absolute term comes from the inverse degree-five coefficient, which
vanishes at pure phase. Interval arithmetic certifies `M>N` and

\[
 (L-M+N)/2>0.3859531936305,\qquad L/2>0.5946193547080.
\]

For `ad>=0`, the cross term is positive. For `ad<0`, use
`2|ad|<=a^2+d^2`. Therefore the entire quadratic increment is at least

\[
 0.3859531936305(a^2+d^2)
 +0.5946193547080\delta^2.
\]

Pure phase is a strict **local** minimum of this necessary inverse budget.
Small independent quadratic phases, their relative constant phase, and
subsequent common nonlinear scalar preprocessing do not provide a local
escape. This local result is not a global theorem for (5).

A short floating diagnostic from five initial points found the same pure
phase minimum of the degree-seven inverse prefix. That diagnostic is
supporting discovery data only; the local theorem follows from the explicit
expansion and the positive quadratic coefficients.

## 5. What remains open and what to do next

The lemma eliminates a redundant search dimension for a fixed scalar
kernel: first screen its exact inverse prefix, and only certify inverse
tails for kernels that survive. In particular, common scalar preprocessing
cannot rescue (2).

The following remain outside the stronger `c7` ceiling and the unmixed
factor-removal equivalence in this note:

- Arbitrary convex mixtures of these modulated kernels, including mixtures
  whose components have independent preprocessors. A mixture is covered only
  if its averaged kernel independently satisfies a stated factorization or
  the direct inverse-prefix condition (6).
- Arbitrary coupled radial/neutral responses from the previous raw-score
  theorem. This note proves no uniform inverse-prefix bound for that whole
  response class.
- Hermitian off-diagonal couplings between auxiliary coordinates with
  different scalar preprocessors: the covariance cannot in general be
  diagonalized together with the quadratic form.
- The existing coupled charged grade-one/grade-three master response.
- A global classification of the two-sided family (5).

For the weaker ceiling `0.711916311229984`, the subsequent finite-functional
companion note covers arbitrary separable neutral maps, their mixtures,
off-diagonal quadratic interactions and all parameters of (5). Coupling the
neutral response to the phase coordinate's modulus is still excluded.

Different scalar preprocessors by themselves do not escape (1b). The
immediate upper-side research target should retain coupled response
dependence, such as a phase singularity involving more than one charged
coordinate or a nonseparable auxiliary interaction. A candidate must beat
the incumbent after coefficient tails are charged; escaping a raw-score
theorem alone is insufficient.

## Replay and primary sources

From our own worktree:

```
uv run --with python-flint==0.9.0 python tools/coupled_preprocess_inverse.py \
  --bits 160 \
  --output handoff/research-third-decimal/coupled-image-20261023/preprocess/inverse-certificate.json
```

The exact inverse mechanism and phase kernel have classical precedents in
[Haagerup's original paper](https://www.isibang.ac.in/~soumyashant/misc/collected-works-of-haagerup/1980s/1987_A_new_upper_bound_for_the_complex_Grothendieck_constant.pdf).
The phase covariance formula, absolute inverse series and tensor construction
are also developed in Sections 2–4 of
[Friedland–Lim–Zhang, *An elementary and unified proof of Grothendieck's inequality*](https://arxiv.org/html/1711.10595v2).
This note's residual-to-inverse reduction and neutral quadratic screen are
derived explicitly above; no claim of historical novelty is made.
