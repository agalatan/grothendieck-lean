# Exact invariant projection closure for the genuine q_m family

Paper proof and numerical-calibration interface, 23 October 2026. Repository
history only. No new Lean theorem or Grothendieck endpoint is claimed here.

## 1. Gaussian representation and cubic normalization

Let `m>=1`, `V=C^m`, `W=Sym^2(V)`, and `d=m(m+1)/2`. Give `W` its induced
unitary inner product and use the orthonormal coordinate convention in which

    Q(X)=(X_i^2 ; sqrt(2) X_i X_j, i<j).

In particular `||Q(X)||^2=||X||^4`. Let `X` and `Y` be independent standard
proper Gaussians in `V,W`, respectively. Under the compact group `U(m)` act by

    X -> U X, Y -> Sym^2(U) Y.

This is a unitary Gaussian action. The polynomial

    q_m=<Y,Q(X)>/sqrt(m(m+1))

is invariant. Here the Hermitian inner product is conjugate-linear in its
first argument, so this agrees with the repository's explicit sum
`sum X_i^2 barY_ii + sqrt(2) sum_(i<j) X_i X_j barY_ij`.

The holomorphic X slots and antiholomorphic Y slot are disjoint; no Wick
contraction subtracts a linear term. Thus `q_m` belongs to the genuine
Gaussian bidegree `(2,1)` chaos. With `R_X=||X||^2~Gamma(m,1)`,

    E|q_m|^2=E R_X^2/[m(m+1)]=1.

The physical charge-one rotation of all Gaussian coordinates is distinct
from the center of this auxiliary `U(m)` action. Under its center,
`X` has weight one and `Y` weight two, so `q_m` is invariant; under physical
simultaneous rotation of all X,Y coordinates, it has charge `2-1=1`.

## 2. Remote invariant spaces: an exact representation calculation

Write the remote one-particle space as `H=V direct_sum W`. The Gaussian
Wick chaos of bidegree `(p,q)` is equivariantly isomorphic to
`Sym^p H tensor conjugate(Sym^q H)`. Wick contraction does not change this
representation identification; it separates the homogeneous chaoses.

The full center `exp(i theta) I` of `U(m)` acts on `V,W` with weights one
and two. Therefore:

* `H10^U=0`: neither summand has central weight zero.
* `H20^U=0`: `Sym^2 H=Sym^2 V direct_sum (V tensor W)
  direct_sum Sym^2 W` has weights two, three, four.
* `H11^U` is the commutant of `U(m)` on `H`. Both `V` and `W=Sym^2 V`
  are irreducible, and their different central weights make them
  inequivalent. Schur's lemma gives two scalar blocks. Their centered Wick
  representatives are `R_X-m` and `R_Y-d`, where `R_Y=||Y||^2`.
* `H21^U` identifies with `Hom_U(H,Sym^2 H)`. Only the weight-two source
  `W` and weight-two target `Sym^2 V` can match. They are the same
  irreducible representation; its intertwiner multiplicity is one.
  The invariant line is exactly `span(q_m)`.

These conclusions hold for **every m>=1**. In particular at `m=1`, `V,W`
are different one-dimensional `U(1)` characters of weights one and two;
the same argument applies without any extra invariant. The argument would
not be valid with `SU(m)` substituted for `U(m)`: dropping the center can
introduce determinant coincidences in small dimensions. The group matters.

## 3. Add a visible coordinate

Let `Z~CN(0,1)` be independent, and let `U(m)` act trivially on it. Define

    H(Z)=Z(|Z|^2-2)/sqrt(2),
    A_X=(R_X-m)/sqrt(m), A_Y=(R_Y-d)/sqrt(d).

The invariant first chaos of the full Gaussian space is exactly

    H10(full)^U=span(Z).

Decompose a full `(2,1)` chaos by the visible holomorphic degree `a=0,1,2`
and antiholomorphic degree `b=0,1`. The possibilities are:

    (a,b)=(0,0): remote H21 -> span(q_m);
           (0,1): barZ remote H20 -> zero;
           (1,0): Z remote H11 -> span(Z A_X, Z A_Y);
           (1,1): (|Z|^2-1) remote H10 -> zero;
           (2,0): Z^2 remote H01 -> zero;
           (2,1): visible H21 -> span(H(Z)).

Consequently the **exact** invariant cubic space is

    H21(full)^U=span{H(Z), Z A_X, Z A_Y, q_m}.

The four displayed cubic features and the linear feature `Z` are
orthonormal. Explicitly, `||H(Z)||_2^2=(6-8+4)/2=1`;
`||A_X||_2=||A_Y||_2=1` by gamma variances; `A_X,A_Y` are independent and
centered; `||q_m||_2=1`. Cross terms vanish by visible degree, centeredness,
or independence. No asymptotic Gaussian approximation is needed.

Gaussian chaos projections commute with this unitary group. Thus for any
invariant `u` in L2, its first and cubic projections are invariant, and
orthonormal projection onto these explicitly determined spaces is exact.
In particular, with

    Phi=(Z,H(Z),Z A_X,Z A_Y,q_m), c_j(u)=E[barPhi_j u],

one has

    P10 u=c_0(u) Z,
    P21 u=sum_(j=1..4) c_j(u) Phi_j.

This is a genuine Gaussian grading statement. It does not leave a free
remote projection to choose after seeing the response fields.

## 4. The remote gate is rank one for a structural reason

For any invariant response pair, its visible conditional fields are also
invariant. The **actual** remote cubic projection is therefore

    Pi_H21 c=<q_m,c> q_m.

For functions of `(Z,q_m)` the same holds immediately, since `q_m` itself
is invariant. Thus the selected remote gate cost is the full remote gate
cost for this family. The additional actual full-cubic terms are the
coefficients of `Z A_X,Z A_Y`, for both h and k; they cannot be inferred
from the marginal law of q alone.

For `T=P10-epsilon P21`, `h=(f+g)/2`, `k=(f-g)/2`, the exact value is

    Re<f,Tg>=|c_0(h)|^2-epsilon sum_(j=1..4)|c_j(h)|^2
                        -|c_0(k)|^2+epsilon sum_(j=1..4)|c_j(k)|^2.

The frame condition has `t=|c_0(h)|` and the remote residual scale is
`tau=|c_4(k)|`. There is no source matrix E or R in this exact formula.

## 5. The coupled scalar law, including the shared G

Conditional on X, `Q(X)/R_X` is a unit vector of W. Define

    G=<Y,Q(X)/R_X>, V=||Y||^2-|G|^2.

The zero event `R_X=0` has probability zero. Gaussian unitary invariance
gives, independently of X,

    G~CN(0,1), V~Gamma(d-1,1), G independent V.

For `d=1`, interpret `Gamma(0,1)` as the deterministic zero variable.
Therefore the following joint scalar realization is **exact**:

    R_X~Gamma(m,1), G~CN(0,1), V~Gamma(d-1,1), Z~CN(0,1), independent;
    q_m=R_X G/sqrt(m(m+1)); R_Y=|G|^2+V;
    A_X=(R_X-m)/sqrt(m); A_Y=(|G|^2+V-d)/sqrt(d).

In particular A_Y and q_m share G. Replacing A_Y by an independent normal,
or drawing a new G for the q coordinate, changes the response projection
coefficients and the optimization problem.

For a response `F(Z,q_m)` alone, integration of independent V gives

    E[barZ A_Y F]=E[barZ (|G|^2-1) F]/sqrt(d).

This identity does not allow the same replacement inside a nonlinear
response which already depends on A_Y.

## 6. Which response family is closed under best response

Functions of `(Z,q_m)` have projections in the five-feature span, but their
best responses generally depend on A_X,A_Y as well. They are **not** a
closed best-response class.

The class of bounded measurable functions of `(Z,R_X,R_Y,q_m)` is closed:
for any such g, `Tg` is a linear combination of the five features, and
`phase(Tg)` belongs to that class. The norm of the invariant restriction is
therefore calibrated by this small actual scalar model. More generally,
any bounded U(m)-invariant function may depend on further invariants, but
its best response still lies in this smaller class because its P/Q images
belong to the same five-feature span.

Let `K={E[conj(Phi) f]: |f|<=1}` be the actual five-coordinate moment body.
It is compact and convex, with support function

    h_K(a)=E|sum_j a_j Phi_j|.

The supporting phase itself is invariant, so this is the same body whether
one starts with all disk responses or only invariant ones. With
`D=diag(1,-epsilon,-epsilon,-epsilon,-epsilon)`, the invariant witness norm is

    max_(c,d in K) Re(c^* D d).

This finite-dimensional reformulation is exact for the invariant restriction.
It remains a nonconvex bilinear optimization; alternating best response
does not certify its global maximum. It is a lower calibration for the
unrestricted Gaussian witness norm, not a universal upper bound on it.

## 7. Exact calibration and numerical engine

The actual response `f=g=phase(Z)` has coefficients

    c=(sqrt(pi)/2, -sqrt(pi)/(4sqrt(2)), 0,0,0)

and exact payoff

    pi/4-epsilon*pi/32.

The portable `genuine_qm_best_response.py` uses the exact coupled scalar
distribution above, Sobol inverse-CDF integration, and five-feature phase
alternation. It freezes both phase-numerator coefficient vectors before
independent scrambled holdout evaluations. It records orthonormal-Gram
errors, the exact phase(Z) calibration error, polarization pieces and
best-response defects. All discovery and holdout values are **numerical**;
QMC discrepancies are not certified integration error bars.

Every frozen numerator nevertheless defines an explicit actual bounded
Gaussian response in finite dimension. It can be rigorously integrated
later using the joint gamma/proper-Gaussian law, or used as a legitimate
response column in a more ambitious certification procedure. No marginal
pseudo-law or freely assigned cubic projector occurs in this construction.

## 8. Exact angular reduction and frozen-profile QMC evidence

Every feature has physical charge one. For the phase of a linear
combination of these features, multiplication of Z,G by a common unit
phase multiplies both the response and every feature by that phase.
Their moment products therefore do not depend on it. One may set

    Z=sqrt(R_Z) real, G=sqrt(R_G) exp(i theta),
    R_Z,R_G~Exp(1), theta uniform,

and retain independent R_X,V as before. This five-real-variable reduction
is exact for these frozen charge-one phase profiles. It is not a
factorization of A_Y from q_m. The script's `sample_features_reduced`
implements it. Its exact phase(Z) coefficient vector is a valid control
variate; holdout coefficients remain those of the frozen functions.

Discovery at 2^15 points and sixteen starts gave frozen best profiles for
m=1,16,128. For m=128, three independent reduced 2^20 Sobol holdouts give
phase(Z)-control-variate scores

    .713246106522, .713245615434, .713246000168.

The spread is about 4.91e-7, without a rigorous QMC error bound. The raw
estimates and Gram/calibration errors are retained in the JSON. The same
coarse test gives scores around .71238 at m=1 and .71301 at m=16. None is
a certified optimum or an endpoint obstruction by itself.

## 9. The diffuse three-feature limit and its Bessel formulas

Let `r_m=R_X/sqrt(m(m+1))`, so `q_m=r_m G`. For fixed rational c,b with
b>0 and `1-sqrt(2)c>0`, consider the actual phase pair

    f_m=phase(A(Z)+b r_m G), g_m=phase(A(Z)-b r_m G),
    A(Z)=Z+c H(Z).

The comparison pair has r_m replaced by one. It is a rank-three Gaussian
limit model; finite-dimensional transfer is proved below rather than
assumed from a central limit theorem.

For real s>=0 define

    psi(s)=E_G phase(s+G), zeta(s)=E_G[barG phase(s+G)].

Both are real, and with x=s^2/2,

    zeta(s)=sqrt(pi)/2 exp(-x) I0(x),
    psi(s)=sqrt(pi)/2 s exp(-x)[I0(x)+I1(x)].

One direct derivation avoids an assumed Rice approximation. Complex
Gaussian integration by parts gives `zeta(s)=E[1/|s+G|]/2`; the derivative
of phase is locally integrable in two real dimensions. The Laplace
representation of inverse modulus and the exact Gaussian exponential
integral give

    E[1/|s+G|]
       =(1/sqrt(pi)) integral_0^1 exp(-s^2 u)/sqrt(u(1-u)) du
       =sqrt(pi) exp(-x) I0(x).

Differentiating the shifted Gaussian density gives
`zeta'(s)=E[Re G/|s+G|]`, hence `psi(s)=2s zeta(s)+zeta'(s)`.
Using `I0'=I1` yields the displayed psi formula. These manipulations may
also be justified by smooth regularization of inverse modulus/phase.

Put `s(Z)=|A(Z)|/b`. The comparison pair's three coefficients are

    m0=E[|Z| psi(s)],
    m1=E[|Z|(|Z|^2-2) psi(s)]/sqrt(2),
    mq=E[zeta(s)].

Its exact lower payoff is `J_inf=m0^2-epsilon*m1^2+epsilon*mq^2`.
The fixed-point equations `c=-epsilon*m1/m0`, `b=epsilon*mq/m0` diagnose
a stationary pair, but are unnecessary for a lower certificate: any
explicit c,b define a valid pair.

The integration certificate `tools/verify_diffuse_cubic_limit.py` uses

    epsilon=149/200, c=243529/1000000, b=98197/500000

and certifies, including full Gaussian tails,

    .71329117 < J_inf < .71329118.

This is an external Arb lower-value certificate, not an upper bound or
an assertion that the fixed point is globally optimal. The finite bridge
below converts its lower bound to a genuine cubic obstruction.

For reference, there are also exact finite-m conditional formulas. Set
`s=|A(Z)|/(b r_m)` and `S_m=E[|Z| s psi'(s)]`. Gamma and Gaussian
variance-score integration by parts give

    c_Z(h_m)=E[|Z|psi(s)],
    c_H(h_m)=E[|Z|(|Z|^2-2)psi(s)]/sqrt(2),
    c_q(k_m)=E[r_m zeta(s)],
    c_ZAX(h_m)=-S_m/sqrt(m),
    c_ZAY(h_m)=-S_m/(2sqrt(d)).

The other h/k coefficients vanish by G-sign symmetry. In particular
the A_Y term is tied to the same Gaussian variance derivative as A_X;
it is not an independent marginal correction. These formulas reduce
this particular genuine profile's payoff to two real radial integrals.

## 10. Exact finite-dimensional bridge using the normalized conditional Gaussian

This sharper bridge uses the genuine response class established in section
6. Fix the same rational c,b as in the Arb limit certificate, but choose

    f_m=phase(A(Z)+b G), g_m=phase(A(Z)-b G),
    G=sqrt(m(m+1))*q_m/R_X, A(Z)=Z+c H(Z).

R_X is positive almost surely. These are actual functions of
`(Z,R_X,q_m)` under the finite-dimensional Gaussian space. They can be
written without division as phases of the explicit degree-five
polynomials

    R_X*(Z+c H(Z)) +/- b*sqrt(m(m+1))*q_m.

Multiplying a numerator by positive R_X does not change its phase. The
higher polynomial degree is in the RESPONSE, not in the cubic witness.

The exact joint scalar law gives independence of R_X from Z,G,V. Let
m0,m1,mq be the three limit coefficients certified in section 9, and set

    n=E[barZ (|G|^2-1) f_m].

The G-sign symmetry preserves the first four feature coefficients and
reverses the q coefficient. Therefore the finite h/k coefficients are
exactly

    c_Z(h)=m0, c_H(h)=m1, c_ZAX(h)=0,
    c_ZAY(h)=n/sqrt(d), c_q(h)=0,
    c_q(k)=sqrt(m/(m+1))*mq,
    c_Z(k)=c_H(k)=c_ZAX(k)=c_ZAY(k)=0.

The A_Y statement integrates V first, using
`R_Y=|G|^2+V` and `E V=d-1`. It retains the actual negative cubic cost;
setting it to zero or using an independent G would be invalid. Its exact
numerator satisfies

    |n|<=sqrt(E[|Z|^2 (|G|^2-1)^2])*||f_m||_2=1.

Consequently the genuine finite-dimensional payoff is EXACTLY

    J_m=J_inf-epsilon*mq^2/(m+1)-epsilon*|n|^2/d,

and hence

    J_m>=J_inf-epsilon*(mq^2/(m+1)+1/d).

There is no CLT, phase-continuity estimate, or unproved convergence rate
in this identity. The limit certificate also encloses `mq^2<.051`.
With the explicit choice `m=4096`, `d=8390656`, the total number of complex
Gaussian coordinates including Z is 8,394,753. Exact rational arithmetic
gives

    epsilon*(.051/4097+1/8390656)
      =1963969/209766400000 <.000009363,
    J_4096 > .71329117-1963969/209766400000
      =18702819614211/26220800000000
      =.713281807351835... >500/701.

The strict excess over 500/701 is greater than 1.50e-5. The optional
larger choice `m=65536`, `d=2147516416` gives
`J_m>.713290589904243...` with the same elementary bound.

Thus an ACTUAL finite Gaussian unimodular pair defeats the global norm
cap `500/701` for the unchanged epsilon=.745 witness. Improved scalar
cuts, exact fibre integration, or complete projection compatibility
cannot prove that false cap. This does not rule out changing epsilon or
the witness, and it does not determine the complex Grothendieck constant.
The projection closure and finite bridge are paper proofs; the limit
integral is an external Arb certificate. They are not newly formalized in
Lean in this note.

## 11. Optional q-only phase-continuity comparison

If one insists on responses of `(Z,q_m)` alone, rather than the closed
class `(Z,R_X,q_m)`, the comparison profile
`phase(A(Z)+/-b*r_m*G)` is also genuine. Here
`E(r_m-1)^2=2-2sqrt(m/(m+1))<1/m`. Conditional Gaussian
anti-concentration and
`|phase(u)-phase(v)|^2<=4 min(1,|u-v|^2/|u|^2)` give response L2 error
at most `sqrt(8)*m^(-1/4)`. Five-coefficient Bessel bounds then yield
`J_m>=J_inf-24*m^(-1/4)-2*m^(-1/2)-4/m`.
This much weaker route would still provide a finite obstruction for a
huge m, but is unnecessary once the legitimate normalized-G response is
allowed. It must not be mistaken for a restriction justified by the
invariant projection closure.
