# The missing quadratic image in the remote hard-defect family

This is an exact analytic reduction for later directed integration. The
companion quadrature is discovery only. No global norm cap is asserted.

Let Z,X,W be independent standard proper complex Gaussians. W has original
grade three in this model. Put

```
L(Z)=Z[ell+beta(|Z|²-2)],
q_kappa=kappa H21(X)+sqrt(1-kappa²) W,
f=phase(L+s q_kappa), g=phase(L-s q_kappa),
u=(f+g)/2, v=(f-g)/2,
```

where 0<=kappa<1 and `H21(X)=X(|X|²-2)/sqrt(2)`. The target is the actual
missing negative-image coefficient

`a_C=E[conj(Z)(|X|²-1)u]`.

For the contact parameters ell≈.85657017,beta≈.14750208,
`ell-2beta>0`, so the radial visible coefficient below stays positive.
Let

```
t=|Z|², x=|X|²,
l(t)=sqrt(t)[ell+beta(t-2)],
d(x)=s kappa sqrt(x)(x-2)/sqrt(2),
sigma=s sqrt(1-kappa²),
h(z)=(sqrt(pi)/2)exp(-z/2)[I0(z/2)+I1(z/2)],
C_sigma(w)=(w/sigma) h(|w|²/sigma²).
```

C_sigma is the exact Gaussian-buffer-smoothed phase. If `theta=arg X-arg Z`,
define

`F_sigma(l,d)=average_theta Re C_sigma(l+d exp(i theta))`.

Then the exact coefficient is the two-radial and one-angle integral

```
a_C = integral_0^infinity exp(-t)sqrt(t) dt
        integral_0^infinity exp(-x)(x-1)
             F_sigma(l(t),d(x)) dx.
```

The plus and minus branches have the same angular integral; replacing theta
by theta+pi proves this, including when d(x)<0. No Gaussian reciprocal score
singularity is left after conditioning W.

For numerical work define angular modes

```
F_j(t,x)=average_theta Re[exp(i j theta)
                       C_sigma(l(t)+d(x)exp(i theta))].
```

All projection coefficients of the full stated parity model follow from
the same two radial integrals (expectation below means independent Exp(1)
variables t,x):

```
Pu:           p_Z=E sqrt(t) F_0,
Qu:           a_H=E sqrt(t)(t-2) F_0/sqrt(2),
              a_C=E sqrt(t)(x-1) F_0,
              a_B=E sqrt(t)x F_(-2)/sqrt(2),
Pv:           b_X=E sqrt(x) F_(-1),
Qv:           q_H=E sqrt(x)(x-2) F_(-1)/sqrt(2),
              q_A=E sqrt(x)(t-1) F_(-1),
              q_B=E t sqrt(x) F_(+1)/sqrt(2),
              q_W=(sqrt(pi)/2) E average_theta
                       exp(-z/2)I0(z/2),
              z=|l(t)+d(x)exp(i theta)|²/sigma².
```

The W coefficient uses Gaussian integration by parts. In particular
`E[conj(W)phase(m+sigma W)]=(sigma/2)E[1/|m+sigma W|]` and
`E[1/|m+sigma W|]=(sqrt(pi)/sigma)exp(-z/2)I0(z/2)`.

The same rule computes the mean modulus without singular derivatives:

`E_W|m+sigma W|=(sigma sqrt(pi)/2)exp(-z/2)
                                    [(1+z)I0(z/2)+z I1(z/2)]`.

The helper uses scaled Bessel functions, so the exponential products remain
stable at large positive z. Its simultaneous projection and modulus formulas
also check the coupled primal-dual identity.

## What the small-kappa expansion proves, and what it does not

The circular mean expansion in d starts with

`F_sigma(l,d)=C_sigma(l)+(d²/4)Delta C_sigma(l)+O(d^4)`.

The exact Wick moment is `E[(x-1)|H21(X)|²]=3`. Hence the leading a_C term is

`(3s²kappa²/4) E_t[sqrt(t) Delta C_sigma(l(t))]`.

For l>0,

`Delta C_sigma(l)=-(2l/(sqrt(pi)sigma³)) integral_0^1
                      y^(1/2)(1-y)^(-1/2)exp(-l²y/sigma²)dy <0`.

Thus a nonzero negative field is forced for sufficiently small kappa.
This expansion alone does not certify its sign at kappa=.325; controlling
its finite remainder or directly integrating the displayed exact coefficient
is still necessary. A global fourth-moment remainder is likely wasteful
because H21 has heavy polynomial tails.

A tempting association shortcut is false. The squared signal
`|H21(X)|²=x(x-2)²/2` is not monotone in x. More strongly,

`sqrt(A) E[(x-1)exp(-A|H21(X)|²)] -> exp(-2)sqrt(pi)>0`

as A tends to infinity: the zero ring x=2 contributes order A^(-1/2), whereas
the negative endpoint x=0 contributes only order A^(-1). Therefore no proof
may assume `Cov(x,exp(-A|H21|²))<=0` for every A. The actual profile integral
must keep these signed contributions.

## Elementary tail bounds for a later interval certificate

Since |F_sigma|<=1, cutting the radial integrals at `t<=T`, `x<=U`, with
T>0,U>=1, loses at most

`(2/e) exp(-T)[sqrt(T)+1/(2sqrt(T))]
                              +(sqrt(pi)/2) U exp(-U)`.

Here `E|x-1|=2/e`, the x tail is exactly `U exp(-U)`, and the t tail follows
by one integration by parts. This leaves a compact three-variable integral.
The changes `t=r²,x=y²` remove the radial square-root endpoints; its density
becomes `4r²y exp(-r²-y²)(y²-1)` times F_sigma.

`tools/coupled_image_conditioned.py` evaluates the unreduced infinite-domain
integral by Gauss-Laguerre and an angular trapezoid rule. Increasing orders
is a convergence diagnostic, not a certified error enclosure. Substantial
runs belong on the droplet.

The helper also optimizes the visible-only negative image, or all four complex
negative coefficients in the full stated parity model. For the latter it
replaces the deterministic conditional mean by

```
m+=ell sqrt(t)-eps[a_H H21(sqrt(t))+a_C sqrt(t)(x-1)
                    +a_B sqrt(t)x exp(2i theta)/sqrt(2)]
                    +[s kappa H21(sqrt(x))-b_X sqrt(x)]exp(i theta).
```

The negative a_B term is even in theta->theta+pi, and the last bracket is
odd. Hence the plus/minus angular folding used above remains exact. The
buffer coefficient sigma is unchanged by every selected update. The
ordinary phase gradient is therefore smooth after Gaussian conditioning;
the helper's analytic Rice diagonal step uses eta=0 and incurs zero
smoothing allowance. Its numerical gradient and remaining radial/angle
quadrature still need directed error bounds before that step is a certificate.

The source and frozen contact-fixture hashes, Python/NumPy/SciPy versions,
quadrature parameters and host are recorded in strict finite JSON output.

## Transfer of a certified field to an actual finite cubic buffer

Replace W by the normalized actual cubic

`R_m=(1/sqrt(2m)) sum_{j=1}^m X_j² conj(Y_j)`,

using buffer variables independent of the external Z,X above. Its conditional
variance `V_m=(1/(2m))sum |X_j|^4` has

`E V_m=1`, `Var(V_m)=5/m`.

For any coefficient test H independent of the **whole buffer**, with
`||H||_2<=1`, and any bounded phase response built from the same external
means and depending on the buffer **only through R_m**, its finite-buffer coefficient differs from its
Gaussian-buffer coefficient by at most

`delta_m=min{2, 2sqrt(5/m), 35/m}`.

This includes the paired response u, since |u|<=1; there is no extra factor
for its two branches. It applies to `H=Z(|X|²-1)` with unit L2 norm. The
statement compares the **same fixed visible dual trial**, not separately
reoptimized trials or different contact parameters.

First proof, the square-root rate: the Hellinger affinity of the complex
Gaussian densities with variances v and 1 is `2sqrt(v)/(1+v)`. Cauchy gives
their L1 distance at most `2|v-1|/(1+v)<=2|v-1|`. Conditioning and averaging
therefore gives `2sqrt(Var V_m)=2sqrt(5/m)`. Pairing with H costs at most
`E|H|<=1` by whole-buffer independence. The density L1 distance is always
at most 2.

The stronger `35/m` bound uses cancellation of the variance's mean error.
Let `p_v(z)=(pi v)^(-1)exp(-|z|²/v)`. Direct differentiation gives

```
p'_1=p_1(T-1),
p''_v=v^(-2)p_v(T²-4T+2),
T=|z|²/v ~ Exp(1) under p_v.
```

The exact exponential moments give `E(T-1)²=1` and
`E(T²-4T+2)²=4`, hence `||p'_1||_1<=1` and `||p''_v||_1<=2/v²`.
For v>=5/13, the integral Taylor remainder yields

`||p_v-p_1-(v-1)p'_1||_1 <= (169/25)(v-1)² <7(v-1)²`.

For v<5/13 put u=1-v>=8/13. The triangle bound is `2+u`, and
`2+u<=7u²`: the difference is positive at 8/13 and increasing thereafter.
Consequently the remainder bound `7(v-1)²` holds for every v>0. Averaging
over V_m cancels `(E V_m-1)p'_1` exactly and gives density L1 error
`7Var(V_m)=35/m`. These constants are universal in the external mean and
the nonzero common scale multiplying R_m, since translations and rescalings
preserve density L1 distance.

Here is a concrete finite-cubic descent consequence. Suppose a directed
calculation at a **fixed real visible-only trial** proves
`a_C,infinity<=-l`, l>0. Set `l_m=[l-delta_m]_+`. Then the corresponding
actual finite coefficient obeys `a_C,m<=-l_m`. The trial negative cubic has
zero coefficient along `psi_C=Z(|X|²-1)`, so its closure gradient in that
direction is at least `eps l_m`. With

`sigma=s sqrt(1-kappa²)`,
`K_m=sqrt(2pi)m/[sigma(m-1)]` for m>=2,

the explicit whole-buffer-independent negative-image update

`d= -eps l_m psi_C/(eps+eps² K_m)`

decreases the actual finite-cubic fixed dual by at least

`eps² l_m²/(eps+eps² K_m)`.

This is an unregularized finite-amplitude bound; no smoothing allowance is
needed. The update preserves conditional proper Gaussianity. A sign interval
is necessary to choose this explicit real update; an unsigned magnitude
bound gives existence of an appropriately oriented update instead.

The `35/m` transfer becomes nonvacuous once `m>35/l` (about 5,300 if
l≈.0066), instead of the square-root bound's requirement `m>20/l²` (about
460,000). This is a finite-dimensional realization of a fixed-image
correction, not a uniform bound over all tensors or outer images. A directed
sign enclosure for the actual radial-cubic visible L is still required.
