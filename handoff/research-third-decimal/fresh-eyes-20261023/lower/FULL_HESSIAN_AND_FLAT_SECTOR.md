# Fresh lower-bound architecture check: full phase Hessian and its flat sector

23 October 2026. No Grothendieck endpoint changes. New files only; the original
shared checkout was read without editing it.

## Outcome

The full signed phase Hessian can be reduced exactly to a finite Gram problem
for each fixed finite-dimensional image state. This retains the cubic cross
block omitted by the fresh-second-chaos Hessian test. It avoids introducing
an independent missing-projection completion at this stage.

However, the principal diffuse cubic contact has an entire independent-cubic
flat sector for this **full** Hessian. A regularized block has an exact variance
formula, proving positivity and convergence to zero. This explains why merely
adding cubic score features cannot yield uniform coercivity near that contact.
It also identifies a numerical trap: reciprocal-score signs are sensitive to
sampling and regularization at the diffuse contact. Exact conditioning of
unused Wick modes and image-centered polar integration resolve this ambiguity
in discovery arithmetic: the apparent negative QMC mode disappears.

The scalar critical condition below is the existing unused-direction reciprocal
modulus condition, not a new separating inequality. The new point is its exact
embedding into the complete signed phase-Hessian architecture and the explicit
regularized variance identity. It limits a plausible fresh attack before a
large certificate effort is spent on it.

## 1. Exact finite-rank reduction of the full phase Hessian

Let `T=P-eps Q` on complex Gaussian L2, with real inner product the real part
of the complex one. At an exact maximizing pair take

`f=phase(Tg)`, `g=phase(Tf)`, `a=|Tg|`, `b=|Tf|`.

For real phase perturbations A,B the necessary second-variation condition is

`H(A,B)=E[a A²]+E[b B²]-2 Re<f A,T(g B)> >= 0`.

In finite Gaussian dimension choose a complex orthonormal basis psi of the
first and charge-one cubic sectors. Let Lambda repeat the eigenvalues 1 and
`-eps` on the real and imaginary coordinates. Put

`v_f=(Re(conj(f) psi), Im(conj(f) psi))`, and similarly v_g.

Then exactly

`Re<f A,T(g B)> = (E[v_f A])^T Lambda (E[v_g B])`.

For eta>0 set

`R_f(eta)=E[v_f v_f^T/(a+eta)]`,
`R_g(eta)=E[v_g v_g^T/(b+eta)]`.

The Hessian with a,b replaced by a+eta,b+eta is PSD for all real A,B **iff**

`||R_f(eta)^(1/2) Lambda R_g(eta)^(1/2)||_op <= 1`.

An equivalent condition using no matrix square roots is that

`[[R_f, -R_f Lambda R_g],[-R_g Lambda R_f, R_g]] >= 0`.

Proof: multiplication by sqrt(a+eta) changes the weighted quadratic norm to
ordinary L2. The finite-rank cross operator factors through the two feature
maps; their Gram matrices are R_f,R_g. Its nonzero singular values are those
of `R_f^(1/2) Lambda R_g^(1/2)`. Alternatively, decompose A into the weighted
span of `v_f/(a+eta)` and its weighted orthogonal complement. The complement
has zero cross term and a nonnegative diagonal term. Do the same for B.
Testing only these two spans gives the displayed block matrix, including
singular Gram matrices. Finally let eta decrease to zero for each fixed
bounded A,B. Thus all eta tests recover the full second-variation condition.

For fixed images and phase-aligned responses, these matrices are determined
by the images themselves. This is stronger than granting their first-chaos
coefficients a free Gram completion. Its size is nevertheless O(n^3), not
dimension-free; a global image-state inequality remains missing.

## 2. Exact independent-cubic flat-sector lemma

Suppose the contact has images `L+sqrt(v)W` and `L-sqrt(v)W`, with L depending
on the visible Gaussian and W an independent proper Gaussian of original
grade three. Let f,g be their phases and a,b their moduli. Their distributions
agree. Take any proper, unit-L2, charge-one cubic q on independent Gaussian
coordinates, orthogonal to first chaos. With eta>0 use

`A=Im(conj(f)q)/(a+eta)`,
`B=-Im(conj(g)q)/(b+eta)`.

Independence, charge and chaos orthogonality give P(f A)=P(g B)=0 and

`Q(f A)=(-i/2) R_eta q`, `Q(g B)=(i/2) R_eta q`,

where `R_eta=E[1/(a+eta)]`. The same calculation applies to the orthogonal
real angular component. Both diagonal Hessian entries equal

`D_eta=(1/2) E[a/(a+eta)^2]`.

The smaller 2-by-2 block eigenvalue is therefore

`kappa_eta=D_eta-eps R_eta^2/4`.

At the diffuse contact the stationarity equation is `R_0=E[1/a]=2/eps`.
Define the probability measure `dmu=(1/(a R_0)) dP` and
`X_eta=a/(a+eta)`. Direct substitution gives the exact identity

`kappa_eta=(R_0/2) Var_mu(X_eta) >= 0`.

As eta decreases to zero, dominated convergence gives `kappa_eta -> 0`.
No distributional assertion about q beyond its independence, grade and
second moments enters the formula. Thus the full Hessian is blind at second
order to an arbitrarily large family of independent cubic driver changes.
For complex Gaussian W, the unregularized features can fail ordinary L2
because E[1/a²] diverges at the zero of the image; the regularized calculation
and limit avoid assuming these singular features are admissible directly.

This does not preclude using the full Hessian to exclude **other** image states
or improve the current global cap, which is above the diffuse response value.
It does preclude a uniform strict Hessian gap on a neighborhood containing the
contact. A proposed separator must pay attention to finite-amplitude effects,
higher cumulants, or coupled image consistency, while allowing this flat sector.

## 3. Exact quantitative finite-amplitude implication for polynomial tangents

For arbitrary unimodular f,g use the signed diagonal weights
`a=Re(conj(f)Tg)`, `b=Re(conj(g)Tf)` in H. If A,B are tangent features of the
form `Re(conj(f)p)`, `Re(conj(g)q)`, where p,q have Gaussian degree at most 3
and `||p||_2²+||q||_2²=1`, let `H(A,B)=-h<0`.

The symmetrized phase perturbation has gain at least

`h t²/2 - L t⁴/24`,

where `L=(||A||_8+||B||_8)^4 <= 4*7^6` by Gaussian hypercontractivity and
`||T||_(2->2)<=1`. To verify the remainder, differentiate the bilinear phase
payoff four times, use the L2 operator norm on each of the five Leibniz terms,
and bound `||A^k||_2 <= ||A||_8^k` for k<=4. Optimizing t² gives a valid
dimension-free gap from the global supremum of at least

`3 h²/(8*7^6) = 3 h²/941192`.

This floor is weak. It is stated to make the near-maximizer implication honest,
not as a promising numerical error budget. The reciprocal-score features use
larger moment costs and do not inherit this polynomial coefficient bound.

The finite-chaos L2-to-Lp hypercontractive estimate is stated explicitly for
the sum of chaoses of degrees at most k in Lemma 2.3 of the primary paper
[A remark on Gibbs measures with log-correlated Gaussian fields](https://www.cambridge.org/core/journals/forum-of-mathematics-sigma/article/remark-on-gibbs-measures-with-logcorrelated-gaussian-fields/780B4F5373045FDB4B900CA2C8F30E96).
Here p=8 and k=3. The positive Ornstein-Uhlenbeck operator extends the same
norm estimate to complex-valued functions via its pointwise modulus bound.

## 4. Discriminating experiments

`tools/fresh_lower_full_hessian.py` imports the existing seven named fixtures
read-only. It uses independent projection-fit and evaluation Sobol grids.
The graded model has 25 complex image basis elements (3 first, 22 cubic) and
50 real tangent features per branch. One exact defining-image relation gives
a null feature; L2 whitening removes this before a stability margin is quoted.
No sampling discrepancy below is a rigorous integration error estimate.

Unweighted polynomial tangent features did not separate any fixture on the
first small screen. Reciprocal image weights exposed the following distinction:

- Coarse diffuse contact, 2^17 fit / 2^18 evaluation, eta=.01: full whitened
  minimum about -0.00371, while the fresh-first-only matrix was positive.
- Independent refined diffuse contact, 2^19 fit / 2^20 evaluation, eta=.02:
  full whitened minimum about +0.000183; fresh-first-only about +0.00445.
- Matched eta=.01 refinement, 2^19 fit / 2^20 evaluation: one negative mode
  remains, with full whitened minimum about -0.00114. The leading coefficients
  are in independent remote cubics, whose exact pure block is nonnegative.
- Refined mixed-square fixture: full whitened minimum about -0.00308, while
  fresh-first-only is about +0.00367. Its payoff is only about .70935, well
  below the binding region; this is no endpoint separation.

The matched refinement reduces but does not remove the eta=.01 negative mode;
changing eta changes the actual feature family. The analytic flat-sector
identity rules out an exact negative pure independent-cubic block, but it
does not settle all coupled modes. The full diffuse matrix has not been
interval-certified positive or negative. No global consequence is inferred from the
mixed-square numerical mode either.

`tools/fresh_lower_flat_sector.py` independently integrates the Rice modulus
distribution with adaptive radial quadrature and Laguerre visible-radius
quadrature. At order 192 it obtains

`ell=.8565701672801842`, `beta=.14750207856597156`, `v=.028299873803404752`,
`R_0=2.6845637583892517`, within 1.1e-14 of the contact target `400/149`.

The exact variance formula gives positive regularized margins; the numerical
values are about .0307191 at eta=.02, .0187581 at eta=.01, and .00251004 at
eta=.001. These numbers are discovery quadrature, not certified enclosures.

`tools/fresh_lower_exact.py` checks the variance identity with exact fractions
on a two-atom algebraic fixture having R0=400/149. The fixture is not claimed
to be a realizable image law. The identity itself has the written proof above.

### Exact conditioning resolves the reciprocal-score ambiguity

The final experiment does more than increase QMC resolution.
`tools/fresh_lower_diffuse_conditioned.py` factors every image basis function
as `psi_j=c_j(Z,W) r_j(X,Y,N)`, with r_j a normalized remote Wick mode. Thus

`E_remote[psi_i conj(psi_j)]=c_i conj(c_j) 1_(r_i=r_j)`,
`E_remote[psi_i psi_j]=c_i c_j 1_(r_i=conj(r_j))`.

All remote coordinates are integrated exactly. The independent replay checks
all 18 cubic factorization identities and all 1,250 conditional Gram and
pseudogram entries with integers and fractions. Fixing the visible phase
sets Z=sqrt(T) real. Set the image, rather than W, to `r exp(i theta)`:

`W=(r exp(i theta)-L)/sqrt(v)`.

Its conditional Gaussian density is

`r/(pi v) exp(-((r-L)^2+2rL(1-cos(theta)))/v) dr dtheta`.

The Jacobian cancels the reciprocal singularity at eta=0 in the R integral.
For eta>0, the same product quadrature computes R, the score diagonal D and
the ordinary feature Gram G. Each requires only six scalar W/phase moments
per visible-radius node; no high-dimensional response mesh remains.

The W -> -W branch symmetry gives `R_g=S R_f S` and `D_g=S D_f S`, where S
changes only the W-coordinate sign. Consequently the full score Hessian
splits into `D_f +/- R_f Lambda S R_f`. Conjugation symmetry separately splits
real and imaginary features. This exposes the same null defining-image
relation seen in the QMC screen.

At the same eta=.01 the conditioned computation gives the smallest
non-null L2-whitened score margin:

- 192 visible / 192 radial / 256 angular nodes: `+0.0000559792152`.
- 192 visible / 384 radial / 512 angular nodes: `+0.0000567118180`.
- 256 visible / 512 radial / 768 angular nodes: `+0.0000567120437`.

At the finest rule the integrated Gaussian mass is 1.0000000000000355 and
R0 differs from 400/149 by about 1.0e-13. The pure independent-cubic score
margin is .0187580992336309, agreeing with the separate adaptive Rice
integration. The regularized weighted-operator spectrum is approximately
[-.9252813892762,.9863374628053] in the real sector and
[-.9252813892762,.9354108162930] in the imaginary sector.

These are converged discovery values, not interval eigenvalue bounds.
They substantially support interpreting the small negative QMC modes as
projection/sampling contamination. In particular they provide no evidence for
a useful diffuse-contact instability. The exact variance lemma independently
establishes nonnegativity on the whole pure independent-cubic subspace.

This conditioning applies because the trial images have the specific
visible-plus-independent-Gaussian-driver form. General coupled image tensors
do not have these remote Kronecker covariance matrices. That is exactly the
joint realizability difficulty; it has not been removed from the global
problem by this experiment.

## 5. Consequence for the next architecture

The finite-rank matrix is an exact fixed-state alternative to the free
completion, but it should first be tested on a state **in the binding region**
with controlled image integrals. The independent flat sector should be
projected out or explicitly retained as equality, not attacked by increasing
the reciprocal-score feature count. A useful new condition must couple the
remote cubic replacement to its finite-amplitude effect or to the two-sided
image map. Merely changing a marginal cubic law while preserving its variance
does not produce a second-order obstruction at the diffuse contact.

The source/law/box rank-one route remains the demonstrated near-term way to
lower the current certified cap. This exploration adds an exact structural
obstruction and a diagnostic tool, not a new global cap or formal theorem.

Replay from this worktree:

```
python3 -I tools/fresh_lower_exact.py
OPENBLAS_NUM_THREADS=1 python3 tools/fresh_lower_flat_sector.py --out handoff/research-third-decimal/fresh-eyes-20261023/lower/flat-sector-rice.json
OPENBLAS_NUM_THREADS=1 python3 tools/fresh_lower_full_hessian.py --fit-power 19 --eval-power 20 --regularizer .02 --seed 6 --names diffuse-grade3 diffuse-overlap mixed-square --out handoff/research-third-decimal/fresh-eyes-20261023/lower/full-hessian-refined.json
OPENBLAS_NUM_THREADS=1 python3 tools/fresh_lower_diffuse_conditioned.py --outer 256 --radial 512 --angular 768 --eta .01 --out handoff/research-third-decimal/fresh-eyes-20261023/lower/diffuse-conditioned-512.json
```
