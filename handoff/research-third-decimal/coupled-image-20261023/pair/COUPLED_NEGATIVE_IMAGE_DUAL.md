# An exact coupled-image saddle and a finite-amplitude descent certificate

23 October 2026. This is a paper reduction and exact algebraic checker, not a
Gaussian integration certificate or a new Grothendieck endpoint. It uses no
file from the concurrently edited main checkout.

## What this adds

The paired support formula, canonical convex dual and quadratic majorant
descent are already in the repository's research history. In particular,
`attack-20261022/NOTES.md`, lines 79–117, records the canonical dual, the
descent `r^T(K+tau I)^(-1)r`, zero-safe smoothing, and numerical tightness on
the Gaussian-driver contact. It cites `ch25-parts/88-joint-dual-descent.tex`;
that module is absent from this worktree snapshot and was not re-read.
Sections 1–5 below reconstruct and audit the general framework and constants;
they do **not** claim to introduce convex duality or majorizer descent.

The useful additional target is Section 6: the **complete finite-amplitude
negative images** for a remote cubic, including two actual remote quadratic
projection fields and the missing first-chaos image. These supply concrete
joint update directions that a scalar radial-law relaxation does not carry.

The reconstructed quadratic majorizer is globally valid. It does not require a Taylor
remainder, a Hessian positivity conjecture, or a pointwise lower bound on a
polynomial image. If inverse-modulus curvature integrals exist, the
unregularized majorizer has zero allowance. Arbitrary positive regularized
weights give a zero-safe version with an explicit allowance. This is a
diagnostic for the same coupled images, rather than an independent missing
projection Gram completion.

An important direction check: the squared image-closure defect gives an
**upper** bound on the error of an inner dual trial. It cannot, by itself,
justify subtracting that defect from a global cap. The descent certificate
below supplies a separate sufficient condition for an actual subtraction.

## 1. Setting and exact saddle

Work in complex L2 of a probability space with real pairing
`(x,y)=Re E[conj(x)y]`. Let P,Q be finite-rank orthogonal complex-linear
projections, with PQ=0, and `eps>0`. Gaussian first and charge-one cubic
projections are the intended example. Set `T=P-eps Q` and

`M = sup_{|f|,|g|<=1} (f,Tg)`.

For `u=(f+g)/2`, `v=(f-g)/2`, let

`C = {(u,v): |u+v|<=1, |u-v|<=1 almost everywhere}`.

Then exactly

`M = sup_C [||Pu||² + eps||Qv||² - eps||Qu||² - ||Pv||²]`.

Although phase pairs satisfy `Re(conj(u)v)=0` and `|u|²+|v|²=1`, the convex
two-disc set C is the correct set for the following minimax exchange. The
original bilinear maximum over disks has phase maximizers; no enlargement of
the final M is introduced.

For `p in ran P`, `q in ran Q`, `a in ran Q`, `b in ran P`, put

```
r+ = p - eps a + eps q - b,
r- = p - eps a - eps q + b,
Phi_pq(a,b) = eps||a||² + ||b||² + E|r+| + E|r-|.
```

The exact identity is

```
M = sup_{p,q} [-||p||²-eps||q||² + I(p,q)],
I(p,q) = inf_{a,b} Phi_pq(a,b).
```

Proof: linearize the two positive squared norms by their usual quadratic
conjugates. For fixed p,q the remaining response objective is the concave
function

`L_pq(u,v) = 2(p,u)+2eps(q,v)-eps||Qu||²-||Pv||²`

on the convex weakly compact bounded set C. Linearizing the two negative
norms introduces a,b. The resulting expression is affine in (u,v) and convex
and coercive in (a,b). The convex minimax theorem therefore exchanges its
supremum and infimum. The support of C is

`sup_C [2(A,u)+2(B,v)] = E|A+B|+E|A-B|`.

Take `A=p-eps a`, `B=eps q-b`. Alternatively, this is Fenchel duality for a
continuous quadratic composed with a finite-rank linear map, so there is no
dual gap. Coercivity makes the inner infimum attainable; its quadratic part
makes the minimizing a,b unique. The finite-rank assumption avoids any
unspoken infinite-dimensional image compactness hypothesis.

The two-disc problem for fixed p,q may have a maximizer in the interior of
one disk. Requiring its inner maximizer to be a phase pair would make this
minimax argument invalid. Phase pairs suffice again only after the outer
supremum has reconstructed the original bilinear objective.

## 2. Exact image closure and the direction of the error bound

For any `(u,v) in C`, the following identity holds:

```
Phi_pq(a,b) - L_pq(u,v)
 = E[|r+|+|r-| - 2(p-eps a,u)-2(eps q-b,v)]
   + eps||a-Qu||² + ||b-Pv||².
```

The first term is nonnegative by the support inequality. It vanishes for
`f=phase(r+)`, `g=phase(r-)`, `u=(f+g)/2`, `v=(f-g)/2`, using any unit phase
at a zero. Consequently this phase trial gives the computable bracket

```
Phi_pq(a,b) - R <= I(p,q) <= Phi_pq(a,b),
R = eps||a-Qu||² + ||b-Pv||².
```

Thus `Phi-I <= R`. A large R is a loose bracket, not proof of a comparably
large dual correction. At an inner optimum, a primal maximizer can be chosen
with `a=Qu`, `b=Pv`; at zero images the optimal subgradient can be disk-valued
rather than a fixed unit-phase convention. If `r+` and `r-` are nonzero
almost surely, the exposed phase pair is unique and this is ordinary image
closure.

At a stationary point of the full outer problem one also has `p=Pu` and
`q=Qv`. These four equations retain both actual response images. A scalar
law and a freely completed Gram matrix need not satisfy them.

## 3. Outer ascent and the distinction between fixed and global caps

Let `V(p,q)=I(p,q)-||p||²-eps||q||²`. Completing the two positive squares
gives the useful exact form

```
V(p,q) = sup_C [J(u,v)-||Pu-p||²-eps||Qv-q||²],
J(u,v) = ||Pu||²+eps||Qv||²-eps||Qu||²-||Pv||².
```

If `(u,v)` solves this fixed inner problem, take `p'=Pu`, `q'=Qv`. Then

```
V(p',q') >= J(u,v)
           = V(p,q)+||Pu-p||²+eps||Qv-q||².
```

Thus replacing the positive images by the actual projected phase responses
gives quantitative outer ascent, without differentiability of V. The same
argument works for an approximate inner phase trial: if its negative-image
bracket width is R, then

```
V(p',q') >= Phi_pq(a,b)-||p||²-eps||q||²
             + ||Pu-p||²+eps||Qv-q||²-R
          >= V(p,q)+||Pu-p||²+eps||Qv-q||²-R.
```

This supplies a stop test for coupled image closure and an honest way to
alternate convex negative-image minimization with positive-image ascent.
It does not certify that this ascent reaches the global maximum.

Every fixed value V(p,q) is a **lower bound** on the global norm M. An upper
bound on V for a tested image pair is only a cap for that fixed pair. A global
upper bound on M requires a uniform bound or cover over every outer pair p,q
and Gaussian dimension. Optimizing a few fixed convex inner problems cannot
replace that outer step.

## 4. A globally valid quadratic majorizer

Choose arbitrary measurable positive weights `s+`, `s-`. For any complex z,w
and positive s, Young's inequality gives the exact majorization

```
|z+w| <= |z| + Re(conj(z)w)/s + |w|²/(2s)
              + (s-|z|)²/(2s).
```

It follows immediately from `|z+w| <= (|z+w|²+s²)/(2s)`. The last allowance
vanishes if `s=|z|>0`. No smallness condition on w is needed.

At the current images r+,r-, define

```
u_s = (r+/s+ + r-/s-)/2,
v_s = (r+/s+ - r-/s-)/2,
G_s = (1/2)E[(s+-|r+|)²/s+ + (s--|r-|)²/s-].
```

For an update `d in ran Q`, `e in ran P`, define

```
g_s(d,e) = eps(a-Qu_s,d) + (b-Pv_s,e),
C_s(d,e) = eps||d||²+||e||²
 + (1/2)E[|eps d+e|²/s+ + |eps d-e|²/s-].
```

Then the **finite-amplitude** inequality is

```
Phi_pq(a+d,b+e) <= Phi_pq(a,b) + G_s + 2g_s(d,e) + C_s(d,e).
```

Proof: the changes in r+ and r- are `-eps d-e` and `-eps d+e`. Apply the
pointwise majorizer and expand the two quadratic penalties. Orthogonal
projection moves Qu_s and Pv_s onto d,e in the linear term. This proves the
display for arbitrary updates with finite indicated moments.

In any real orthonormal coordinates on `ran Q x ran P`, write
`C_s(x)=x^T C x`, `g_s(x)=g^T x`. The matrix C is positive definite since
`C_s >= eps||d||²+||e||²`. Taking `x=-C^{-1}g` gives

```
I(p,q) <= Phi_pq(a-C^{-1}g_a,b-C^{-1}g_b)
        <= Phi_pq(a,b) - [g^T C^{-1}g - G_s].
```

The coordinate notation means the Q and P components of the single vector
`-C^{-1}g`; it is not a claim that C is block diagonal. A strictly positive
`g^T C^{-1}g-G_s` is a rigorous inner correction once the expectations have
directed integration bounds. One can use any trial update x, without
inverting C, and certify the decrement `-G_s-2g^T x-x^T C x` instead.

For one chosen direction h and `R=-g_s(h)>0`, the update `t h`,
`t=R/C_s(h)`, guarantees decrement `R²/C_s(h)-G_s`.

## 5. Zeros, curvature, and what must be certified

If the images are nonzero almost surely and every finite image basis
direction has finite `E[|direction|²/|r+|]+E[|direction|²/|r-|]`, choose
`s+=|r+|`, `s-=|r-|`. Then `G_s=0` and g is the actual closure gradient.
Every nonzero gradient gives a strict computable finite-amplitude correction.
This needs inverse modulus, not inverse squared modulus. It therefore avoids
the more singular unregularized L2 score features in the phase Hessian, but
it is not automatically finite for a general complex cubic: a real common
factor can create a codimension-one zero set.

Always-safe choices are `s=max(|r|,eta)` or `s=sqrt(|r|²+eta²)` with eta>0.
The former has allowance only on `|r|<eta`; the latter has allowance
`(sqrt(|r|²+eta²)-|r|)²/(2sqrt(|r|²+eta²))`. Both bound the curvature weights
by `1/eta`. The latter allowance is typically much smaller than the crude
two-term smoothing bound `2eta`; its actual expectation still needs a proof.

These matrices are computed from the same actual polynomial images r+,r-.
One must not maximize their entries separately, replace them with arbitrary
PSD completions, or subtract the closure bracket R as a correction. For
Gaussian certification, conditional integration or existing interval source
banks must control the curvature matrix, linear term and allowance together.

## 6. The complete missing images for a remote cubic, at finite amplitude

There is a more concrete application than a generic O(n³) image matrix.
Let Z be a standard proper complex Gaussian independent of the remote
Gaussian vector X. Let q(X) be any charge-one cubic. Let L(Z) be charge one,
odd under `Z -> -Z`, and commute with conjugation; the existing real radial
visible polynomial is an example. For a real s set

```
f=phase(L(Z)+s q(X)), g=phase(L(Z)-s q(X)),
u=(f+g)/2, v=(f-g)/2.
```

Use compatible phases on null zero sets; all identities can alternatively be
read almost surely away from those sets. Then u is odd in Z and v is even
in Z. Let `H21(Z)=Z(|Z|²-2)/sqrt(2)` be the normalized visible cubic, and put

```
h = E[conj(H21(Z)) u],
A(X) = E_Z[conj(Z)u],
B(X) = E_Z[Z u],
C(X) = E_Z[v].
```

Here E_Z conditions on the entire remote vector. Separate rotations of Z
and q in these integrals show that A is a real function alpha(|q|²), B has
the form `exp(2i arg q) beta(|q|²)`, and C has the form
`exp(i arg q) eta(|q|²)`. Beta and eta are real under the stated conjugation
symmetry. At q=0, B=C=0; those forms do not require dividing by q there.

Write Pi_(r,s)^X for the normalized remote complex-chaos projection. The
**entire negative images**, not just a small-amplitude expansion, are

```
Qu = h H21(Z) + Z Pi_(1,1)^X A + conj(Z) Pi_(2,0)^X B,
Pv = Pi_(1,0)^X C.
```

Consequently,

```
||Qu||² = |h|² + ||Pi_(1,1) A||² + ||Pi_(2,0) B||²,
||Pv||² = ||Pi_(1,0) C||².
```

Proof: orthogonal tensor-product complex chaoses classify every degree-three,
charge-one component. Since u is odd in Z, its visible degree is either one
or three. Visible degree three leaves a remote constant and only H21(Z).
Visible degree one leaves either Z times a remote (1,1) chaos, or conj(Z)
times a remote (2,0) chaos. The conditional moments above are their exact
coefficient functions. Visible evenness eliminates the Z component of Pv,
leaving the remote (1,0) projection of C. All displayed components are
orthogonal and the visible linear factors have unit L2 norm.

This gives a concrete descent trial. Suppose the current dual uses only
`a=h0 H21(Z)` and `b=0`. With unregularized weights, its closure vector is

```
a-Qu = (h0-h)H21(Z) - Z Pi11 A - conj(Z)Pi20 B,
b-Pv = -Pi10 C.
```

The four terms are computed from the same remote q and actual phase pair.
Using their combined negative-gradient direction in Section 4 tests all
missing negative-image sectors at once; a nonzero gradient produces a strict
fixed-image improvement whenever the required inverse-modulus moments are
finite. Regularized weights give the explicit alternative in Section 5.

Near s=0, the first two quadratic fields reduce to the familiar contractions
of |q|² and q². The finite-amplitude formulas retain their nonlinear radial
profiles. Evaluating these projections requires the Gaussian embedding of q,
rather than just an integral against the scalar law of |q|². No theorem is
being asserted here that two genuine cubic tensors with the same radial law
must have different projection norms. The point is that a scalar law
relaxation does not currently carry these projection data. Replacing them
with independent moment or Stein bounds would again lose the common image
consistency that motivates this attack. The next global estimate should
bound these fields and their curvature cost jointly with that same q.

## 7. Explicit finite-amplitude contraction bridge for linear visible images

The conditional profiles can be made explicit when `L(Z)=ell Z`, ell>0,
and s>=0. This is a calibration model, **not** a replacement for the actual
radial-cubic visible L used in the lower certificate. Set `lambda=s²/ell²`
and define the profile h below (distinct from the visible scalar coefficient
in Section 6):

```
h(x) = (1/sqrt(pi)) integral_0^1
          y^(-1/2)(1-y)^(1/2) exp(-xy) dy.
```

Then exactly, with U=|q|²,

```
A = h(lambda U)+lambda U h'(lambda U),
B = lambda q² h'(lambda U),
C = (s/ell) q h(lambda U).
```

Proof: for w=sq, use the Laplace representation of reciprocal modulus and
the elementary Gaussian integral

`E[(ell Z+w) exp(-t|ell Z+w|²)]
 = w(1+ell²t)^(-2) exp(-t|w|²/(1+ell²t))`.

The change of variable `y=ell²t/(1+ell²t)` gives
`E_Z phase(ell Z+w)=(w/ell)h(|w|²/ell²)`. Gaussian integration by parts
then gives A and B by differentiating with respect to w and conj(w).
Equivalently one can differentiate the smooth Gaussian convolution. The
paired averaging does not change A or B because they are even in w; it
does not change C because C is odd in w.

An integration by parts in y also gives the positive formula

`h(x)+x h'(x) = (1/(2sqrt(pi))) integral_0^1
                         [y(1-y)]^(-1/2) exp(-xy) dy`.

The beta integrals imply

```
h(0)=sqrt(pi)/2, h'(0)=-sqrt(pi)/8,
h''(0)=sqrt(pi)/16.
```

For every x>=0, elementary exponential remainders therefore give

```
|A - sqrt(pi)/2 + sqrt(pi)lambda U/4|
       <= 3sqrt(pi)lambda² U²/32,
|B + sqrt(pi)lambda q²/8|
       <= sqrt(pi)lambda² U²/16,
|C - (s/ell)q[sqrt(pi)/2-sqrt(pi)lambda U/8]|
       <= sqrt(pi)lambda^(5/2) U^(5/2)/32.
```

For the first bound use `0<=e^(-z)-1+z<=z²/2` in the positive formula for A;
the relevant beta second moment is 3/8. For B use
`0<=h'(x)-h'(0)<=x h''(0)`. For C use
`0<=h(x)-h(0)-x h'(0)<=x² h''(0)/2`.

Orthogonal projections contract L2. Put

```
N_A=||Pi11 U||, N_B=||Pi20 q²||, N_C=||Pi10(q U)||,
M4=sqrt(E U^4), M5=sqrt(E U^5).
```

Since q is cubic, Pi10 q=0. The following **finite-amplitude**, dimension-free
inequalities follow by the reverse triangle inequality:

```
||Pi11 A|| >= sqrt(pi)lambda [N_A/4-3lambda M4/32]_+,
||Pi20 B|| >= sqrt(pi)lambda [N_B/8-lambda M4/16]_+,
||Pi10 C|| >= sqrt(pi)lambda^(3/2) [N_C/8-lambda M5/32]_+.
```

Together with Section 6 these give a lower bound for the actual missing
negative-image penalty

```
eps(||Qu||²-|h_visible|²)+||Pv||²
 >= eps pi lambda² ([N_A/4-3lambda M4/32]_+²
                    +[N_B/8-lambda M4/16]_+²)
      + pi lambda³ [N_C/8-lambda M5/32]_+².
```

The bounds may be numerically weak when high moments are large. They still
give a concrete way to transfer the **same q's contraction fields** into a
finite-amplitude response-image penalty; no scalar pseudo-law is substituted
for q. They do not by themselves give a lower bound for the dual descent in
Section 4, which additionally requires its coupled curvature cost. Nor do
they assert a universal lower bound on N_A,N_B,N_C from the fourth defect.
The actual cubic-visible L requires its own conditioned profiles or a proved
transfer error before any of these particular constants can be used there.

## 8. A cubic smoothing allowance on conditionally Gaussian buffers

The regularization allowance in Section 5 admits a much smaller, explicit
bound for a useful class of actual images. This calculation was proposed by
the parent research agent and independently checked here.

For `s=sqrt(r²+eta²)` let

`g_eta(r)=(sqrt(r²+eta²)-r)²/(2sqrt(r²+eta²))`.

Its integral over the complex plane is exactly

`integral_C g_eta(|z|) d²z = pi eta³/3`.

Indeed, put `r=eta sinh(t)`. The radial area integral becomes
`pi eta³ integral_0^infinity sinh(t)exp(-2t)dt=pi eta³/3`.
If conditionally on a sigma-algebra an actual image has the proper Gaussian
form `r_image=m+sigma W`, where `W~CN(0,1)` is independent and sigma>0, its
conditional density is at most `1/(pi sigma²)`. Therefore

`E g_eta(|r_image|) <= (eta³/3) E[sigma^(-2)]`.

For the two actual images r+,r-, the total G_s is bounded by

`G_s <= (eta³/3) E[sigma+^(-2)+sigma-^(-2)]`.

This is O(eta³) rather than the crude O(eta) uniform smoothing allowance.
It is useful only when the same trial images retain the proved conditional
Gaussian representation and finite inverse conditional variances.

There is an actual finite cubic realization. Let independent standard
proper complex Gaussian variables X_j,Y_j define

`R_m = (1/sqrt(2m)) sum_{j=1}^m X_j² conj(Y_j)`.

This is a normalized charge-one cubic. Conditional on the X_j it is proper
Gaussian of variance `V_m=(1/(2m))sum |X_j|^4`. If `S=sum |X_j|²`, then
`V_m>=S²/(2m²)` by Cauchy. Since S has Gamma(m,1) density, for m>=3

`E[1/V_m] <= 2m²/[(m-1)(m-2)]`.

Thus a pair of actual images of the form
`r±=m±+sigma± R_m`, where m± and the nonzero scalar sigma± are independent
of the buffer Y_j, satisfies

`G_s <= (eta³/3) [2m²/((m-1)(m-2))]
                           (|sigma+|^(-2)+|sigma-|^(-2))`.

Here m± may depend on X and any other variables, but the displayed sigma±
are fixed. Random sigma± can instead be retained inside the inverse-variance
expectation. This includes finite cubic buffers rather than only a formal
independent grade-three Gaussian limit.

**Scope restriction:** full negative-image updates from Section 6 can
introduce quadratic dependence on the buffer Y_j or holomorphic terms that
make the conditional Gaussian improper. Conditional proper Gaussianity is
not preserved automatically by arbitrary coupled updates. The bound must
be checked for each actual updated trial. For a strictly nondegenerate
improper Gaussian one can replace sigma² by
`sqrt(variance²-|pseudovariance|²)` in the density denominator; a quadratic
conditional image requires a different argument. No uniform O(eta³) claim
for all cubic images is being made.

## 9. Analytic diagonal descent with an independent Gaussian buffer

The parent agent proposed a useful corollary that eliminates the need to
integrate a curvature matrix in a buffer-independent update subspace.
Suppose the two actual current images have the conditional form

`r±=m±+sigma W`,

where sigma>0 is fixed, W is standard proper complex Gaussian, and all chosen
update directions d,e are independent of W. A minus sign or a fixed unit
phase on W in either image gives the same statement. The conditional means
may depend on the variables generating d,e. The elementary Laplace formula
gives, uniformly in the mean m,

```
E_W[1/|m+sigma W|]
 = (1/sqrt(pi)) integral_0^infinity
      t^(-1/2)(1+sigma²t)^(-1)
      exp(-t|m|²/(1+sigma²t)) dt
 <= sqrt(pi)/sigma.
```

For `s±=sqrt(|r±|²+eta²)` this implies

```
C_s(d,e) <= (eps+K eps²)||d||²+(1+K)||e||²,
K=sqrt(pi)/sigma.
```

Indeed 1/s±<=1/|r±|, and conditioning bounds each weighted square by K times
the unweighted square. The two signs cancel their cross terms in
`|eps d+e|²+|eps d-e|²`.

Let Q0 and P0 be orthogonal subprojections of Q and P whose images consist
of admissible W-independent update directions. Assume the current a,b lie
in these subspaces and set

`r_a=a-Q0 u_s`, `r_b=b-P0 v_s`.

The explicit update

`d=-eps r_a/(eps+K eps²)`, `e=-r_b/(1+K)`

therefore guarantees

```
Phi(a+d,b+e) <= Phi(a,b) - Delta,
Delta = eps²||r_a||²/(eps+K eps²)
                 + ||r_b||²/(1+K) - 2eta³/(3sigma²).
```

The last term is the allowance from Section 8. A positive Delta certifies a
finite-amplitude inner dual improvement with no curvature integration.
The full residuals `a-Qu_s,b-Pv_s` can be used only if they already lie in the
admissible update subspaces. Otherwise their norms must not be substituted
for the restricted residual norms above.

For the actual finite cubic buffer R_m from Section 8, the same corollary
holds if the updates are independent of the **whole** buffer (all X_j and
Y_j), with

```
K_m = sqrt(2pi) m/[sigma(m-1)]                  (m>=2),
allowance <= 4m²eta³/[3sigma²(m-1)(m-2)]        (m>=3).
```

Proof: `1/sqrt(V_m)<=sqrt(2)m/S`, so
`E[V_m^(-1/2)]<=sqrt(2)m/(m-1)`. Condition on X and then average the reciprocal
modulus bound. Independence of the whole buffer factors that average from
the squared update norms. Section 8 gives the allowance.

If the update directions depend on X but are independent only of Y, the
scalar K_m bound does **not** follow by factoring expectations. The valid
curvature estimate is instead

```
C_s(d,e) <= eps||d||²+||e||²
 +(sqrt(pi)/sigma) E[(eps²|d|²+|e|²)/sqrt(V_m(X))].
```

One conservative alternative for m>=3 follows from Cauchy:

```
C_s(d,e) <= eps||d||²+||e||²
 + L_m [eps²||d||_4²+||e||_4²],
L_m = sqrt(2pi) m/[sigma sqrt((m-1)(m-2))].
```

For genuine Gaussian cubic d and linear e, Gaussian hypercontractivity gives
`||d||_4²<=27||d||²`, `||e||_4²<=3||e||²`. This supplies a looser diagonal
majorizer with coefficients `eps+27L_m eps²` and `1+3L_m`. It preserves a
dimension-free finite cubic statement while allowing dependence on X.
Every version still requires that the actual images remain conditionally
proper affine Gaussian in the Y variables; no update involving those
variables can be admitted without rechecking that property.

## 10. Consequence for the next numerical experiment

For each proposed positive image pair p,q, minimize the inner convex problem
with the above majorizer. Record both the actual feasible response value and
the dual upper value; their exact bracket is R. Then certify the best trial
dual upper value. This can reject a proposed coupled image state without
claiming that sampled phase stationarity proves a global maximum.

It does not eliminate the outer search over all Gaussian dimensions and
all Q tensors. Hence this is a mechanism for stronger **fixed-image** caps
and a quantitative closure audit. It is not yet the missing dimension-free
global image-state inequality. Any global endpoint claim still requires a
cover or a structural theorem for the outer p,q problem.

`tools/coupled_pair_dual_exact.py` checks the algebra with rational finite
probability spaces, verifies the full quadratic correction on a nonzero
closure fixture, and checks the zero-safe version including its allowance.
It also exhausts the relevant tensor Wick indices through degree seven to
check the sector classification. Its finite-space fixtures are not claimed
to be Gaussian cubic responses.
