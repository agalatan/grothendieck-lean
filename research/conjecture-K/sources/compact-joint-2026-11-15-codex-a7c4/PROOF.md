<!-- Verbatim from /Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/handoff/codex-a7c4-compact/PROOF.md, 2026-11-15; Agent-ID: codex-a7c4. -->
# Interior pieces of (P)

Agent-ID: codex-a7c4. Task #431. Author proofs and certificates, awaiting
independent review. **The complete compact interior remains open.**
The definitions of L,h,S,R,U and (P) are those of the merged #428
`JOINT_TARGET.md`; no hypothesis about the odd sectors is used here.

## 1. A nonsingular angular integral certificate

For complex c,d and real ell, put
`f(theta)=|ell+c exp(-i theta)+d exp(i theta)|`, M=|c|+|d|.
In the sense of distributions, `f'' >= -M`: regularize the norm by
`sqrt(|z|²+epsilon²)`, whose Hessian is positive semidefinite, and bound
the remaining term involving the second derivative of its argument by
`-|c exp(-i theta)+d exp(i theta)| >= -M`. Pass to the limit.
The periodic measure `mu=f''` has total mass zero.

On a uniform periodic mesh of width Delta=2pi/N, the normalized
trapezoidal mean Q_N satisfies
`Q_N-mean(f)=(1/(2pi)) integral K dmu`, where on each cell
`K(x)=(x-l)(h-x)/2`. Since `0<=K<=Delta²/8`, its average is
`Delta²/12`, and `mu+M dtheta` is nonnegative of mass 2pi M,

    Q_N-M Delta²/24 <= mean(f) <= Q_N+M Delta²/12.

This remains valid at zeros and cusps; no bounded norm Hessian is
assumed. The C++ engine evaluates Q_N with directed rounding. Its
sines and cosines use interval Taylor series and explicit remainder
bounds, rather than trusting libm trigonometric rounding.

For the present source polynomial, multiply by exp(-i theta):

    ell=sqrt(T)(a+bT),
    c=w+(T-2/5)A+(3rho/5)B,
    d=T conj(B)/sqrt(2).

At fixed parameters the angular average F(T,ell) is jointly convex
in (T,ell), even in ell (shift theta by pi in the original
polynomial), hence nondecreasing for ell>=0 and one-Lipschitz in ell.
The exponential-source chord/tangent quadrature of the inherited
`secant_proof.md` therefore applies without alteration: split at the
inflection of ell, use exact exponential conditional means, and use
the ell-curvature error on a straddling cell. The generalized checker
`joint_integral.cpp` implements these bounds with the angular
enclosure above. Its initial source cell and infinite tail use
triangle bounds including the additional `T|B|/sqrt(2)` term.
The inherited interval arithmetic and one-harmonic base integral are
copied with provenance in `inherited_secant.hpp`.

## 2. A five-parameter box containing the finite-amplitude bottleneck

The following whole box is covered, with w real:

    75/128 <= w <= 79/128,
    43/128 <= Re A <= 47/128,
    24/128 <= Re B <= 28/128,
    |Im A|, |Im B| <= 1/64.

Write beta(w)=w(g(w²)+(3/5)j(w²)), the **tilted** A first variation.
The inherited kernel comparison gives
`0<=k_B-rho k_A<=7/1000`. Since Re B>=0 throughout this box,

    first_variation >= beta(w) Re(A+rho B) - (7/1000)w Re B.

Thus an upper bound for the defect in (P) is

    G=2 E|L+w+h|-2 E|L+w|-2 beta(w) Re(A+rho B)
      +(7/500)w Re B - target(P).

The first norm is jointly convex in all five real parameters.
Its multilinear corner interpolation is an upper bound, even if
its zeros prevent a bounded Hessian. For the remaining terms use the
inherited certified bounds `F0''<=179/125`, `|beta''|<=1`.
Here F0(w)=E|L+w|. If

    m_A=p-.0926-.67-.08rho²,
    m_B=p-.0926-.67rho²-.08,

then upper bounds on the diagonal second derivatives of the quantity
subtracted from the convex first norm are

    M_w=2(179/125)+2 max|Re(A+rho B)|+S_max,
    M_i=2 m_i+w_max²+4 S_max+8 max x_i²

for the four shell coordinates. The mixed term `(7/500)w Re B`
is multilinear and has zero diagonal second derivatives. Successive
one-dimensional interpolation therefore gives

    G <= max_corner G + sum_i M_i (width_i)²/8.

All widths here are 1/32. `profile_points.py` freshly encloses beta at
the two w endpoints using the inherited outward Arb signed-density
integrator. The C++ run checks every one of the 32 corner values,
including their source tails. The receipt is `critical-box.log`:

    max corner upper <= -0.0033430900508444744,
    interpolation error <= 0.0019521384660319088,
    defect upper <= -0.0013909515848125656.

These decimals display outward floating endpoints; the actual
acceptance is the strict directed-interval comparison in the code.
The first-variation point enclosures are freshly generated inputs;
an arbitrary saved table is not accepted as a newly proved integral.
The bounds on beta curvature and the global kernel comparison remain
explicit inherited certificates, rather than claims re-proved by
this local run.

## 3. A genuine small neighborhood of the origin

The premise (P) holds for **all complex** w,A,B with

    |w| <= 1/10000,  sqrt(S) <= 1/10000.

This includes arbitrarily small nonzero amplitudes; it is not an
extrapolation from a grid. Put tau=1/65536 and
`M(T)=503/1000+(613/500)T`. Cauchy--Schwarz on the constant and T
parts of h gives `|h|<=sqrt(S) M(T)`, since

    (503/1000)² > (2/5)²+(s rho)²,
    (613/500)² > 3/2.

Let K(x) be the Hessian of the Euclidean norm at x!=0. Its derivative
has operator norm at most `3/|x|²`: differentiate
`K=(I-ee^T)/|x|`, e=x/|x|. On T>=tau the exact comparisons in
`origin_check.py` give `|w+t h|<|L|/10` for 0<=t<=1. Consequently

    ||K(L+w+t h)-K(L)|| <= 4(|w|+|h|)/|L|².

The integral Taylor remainder (with weight 2(1-t)) then bounds the
normalized excess over the origin quadratic form, on this source
region, by

    far = 4 epsilon integral_tau^infinity
          e^-T M(T)²(1+M(T))/(T(a+bT)²) dT,
    epsilon=1/10000.

No intermediate norm zero occurs in this region. The checker bounds
the first interval [tau,1/16] using `log 2<7/10`, verified from a
positive finite exponential series. It bounds [1/16,16] on 256 exact
dyadic cells by monotonic bounds on numerator, denominator and
exponential. It bounds the remaining tail explicitly. All arithmetic
is rational; exponentials are bounded by reciprocals of their
positive Taylor polynomials. The result is

    far <= 6463129/500000000.

On T<=tau use the actual directional density under y=L. The existing
exterior density certificate bounds it by `.81/pi`; the restricted
mass is at most `M(tau)² tau`. The layer-cake potential bound therefore
gives, uniformly in complex w,

    Rem_near/S <= 2 sqrt(.81 M(tau)² tau) < 91/25600.

The origin quadratic form is nonnegative, so dropping its near-source
part is safe when assembling this upper bound.

For completeness, its matrix K0 (the same matrix on real and imaginary
coefficients) is obtained directly by angular integration. With
`J_j=integral_0^infinity T^(j-1/2)e^-T/(a+bT)dT`, v=s rho,

    K_AA=(J_2-(4/5)J_1+(4/25)J_0)/2,
    K_BB=(v²J_0-sqrt(2)vJ_1+J_2/2)/2,
    K_AB=(v(J_1-(2/5)J_0)-(J_2-(2/5)J_1)/sqrt(2))/2.

The exact radial moment routine freshly encloses these numbers, and
positive diagonal and determinant tests prove

    (p-.0926)I-.67(1,rho)(1,rho)^T
       -.08(-rho,1)(-rho,1)^T - K0 > (7/400) I.

Finally `far+91/25600 < 7/400`. The extra terms `.5|w|²S+S²`
on the right side of (P) are nonnegative. This proves (P) on the
stated neighborhood, with normalized reserve greater than .001019.
S=0 is equality. The only null singular point in the near-source
concavity estimate is L+w=0; the density potential bound includes
its neighborhood and ensures integrability.

## 4. The infinitesimal inequality at every shift

Write Q0 for the real quadratic form

    Q0(A,B)=(p-.0926)S-.67|A+rho B|²-.08|B-rho A|².

Let H0(w;A,B)=E[h^T K(L+w)h], where K is the Hessian of the
Euclidean norm and complex numbers are identified with real vectors.
The new certificate proves, for 0<=w<=2 and all complex A,B,

    H0(w;A,B) < Q0(A,B)+(.5w²-.01)S                 (H)

when S>0. This is an infinitesimal statement; the next section supplies
a quantitative nonlinear extension.

The singularity is removed by the change of variables

    x=L+w=r exp(i theta), y=x-w,
    T(a+bT)²=|y|², D(T)=(a+bT)(a+3bT),
    Z=y/(a+bT), theta=pi*u, 0<=u<=1.

The planar Jacobian of Z -> L is D(T). Polar area contributes r,
which cancels the 1/r in K(x). Reflection in the real axis makes all
mixed real/imaginary coefficient entries vanish. The real and imaginary
2-by-2 blocks of H0 are therefore the integrals, over r>=0 and 0<=u<=1,
of `2 exp(-T)/D(T)` times the respective outer products of

    v_real = (-(T-.4)sin(theta),
              ((r²-w²)/(sqrt(2)(a+bT)²)-.30318)sin(theta)),
    v_imag = ((T-.4)cos(theta),
              .30318 cos(theta)
              -((r²+w²)cos(theta)-2rw)/(sqrt(2)(a+bT)²)).

These integrands are smooth even at r=0: the inverse T(v) is smooth
for v>=0 because D(T)>=a²>0. No inverse distance remains in the
quadrature and no bounded Hessian of a finite-amplitude tilted norm
is assumed.

`hessian_integral.cpp` encloses the six independent entries. It uses
outward intervals, with second-order jets separately in r and u.
The derivatives of the implicit inverse are

    T'=v'/D,  T''=v''/D-D'(T)(v')²/D³.

Newton iteration merely proposes brackets for T; the increasing cubic
is evaluated with directed intervals to verify both endpoints before
any bracket is used. Each source rectangle uses its midpoint and the
rigorous error

    area*(sup|F_rr|*width_r²+sup|F_uu|*width_u²)/24.

The shift w is an interval throughout, so this covers all shifts in an
accepted interval, not only its endpoints. Adaptive rectangle splitting
sums enclosures; periodic resummation limits cancellation in the running
sum without shrinking any bound. The r>=40 tail is bounded by 10^-10
in operator norm and hence in every entry: w<=2 implies T>36 there,
`|L+w|>=.9 b T^(3/2)`, `M(T)<=(5/4)T`, and

    integral_{36}^infinity e^-T M(T)²/(|L|-2) dT
       <= integral_{36}^infinity 3T e^-T dT
       =111 e^-36 < 111/20^12 < 10^-10.

All tail comparisons, including exp(3)>20, are checked with exact
rationals by `strip_check.py`. The two block matrices for the difference
in (H) have positive diagonals and determinant, checked by directed
interval arithmetic. Recursive dyadic subdivision of [0,2] accepts
61 intervals and leaves no uncovered interval. A failed source budget
triggers shift subdivision; it never supplies an accepted matrix.

## 5. A nonlinear strip at every shift

Let epsilon=1/50000 and delta=1/500. We prove (P) for sqrt(S)<=epsilon
and |w|<=2. Phase rotation reduces w to a nonnegative real number
without changing S, |R| or |U|.

On the near region |L+w|<delta, concavity of the square root gives

    2(|x+h|-|x|-Re(h conj(ph(x)))) <= |h|²/|x|.

The inherited actual directional density bound f<=.81/pi therefore
bounds the normalized near remainder by

    integral_{|y+w|<delta} f(y)/|y+w| dy <= 1.62 delta=.00324.

On the complement, |h|<=epsilon M(T)<|L+w|/10. To check this uniformly,
if delta<=|L+w|<=1 then |L|<=3, hence T<6 and
`10 epsilon M(6)<delta`. If |L+w|>=1 and T<=36, use M(T)<45.
If T>=36, use `M(T)/(|L|-2)<2`. These are exact rational comparisons.
Thus no intermediate x+t h is zero there and the norm Hessian estimate
gives the following normalized error relative to H0(w):

    4 epsilon integral_{|L+w|>=delta} e^-T M(T)^3/|L+w|² dT dtheta/(2pi).

For T<=36, change variables y=L and use the fresh global density bound

    exp(-T) M(T)^3/D(T) <= 16/5.

The checker proves it by positivity of
`(16/5)D(T)sum_{j=0}^8 T^j/j!-M(T)^3`: positive Bernstein coefficients
on all 64 cells [j/16,(j+1)/16], followed by positive power coefficients
after translation T=4+v. This covers the entire nonnegative half-line.
Also |L+w|<40 on T<=36 and log(40/delta)<10. Consequently this part of
the integral is at most `2*(16/5)*10=64`. For T>=36 the original-source
integrand is bounded by `120 exp(-T)`, so the remaining integral is
at most `120/20^12`. The full error bound is

    near+far <= .00324 + 4 epsilon (64+120/20^12) < .00836+10^-15.

The near part of H0 is nonnegative and can be dropped. Combining this
with (H) leaves a normalized reserve greater than .0016, even before
the nonnegative S² term of (P) is used. S=0 is equality.

The inherited exterior already proves (P) for |w|>=1.9, so this
small-amplitude strip in fact holds for **every complex shift w**.
It is a genuine neighborhood of S=0; no extrapolation from numerical
samples is involved.

## 6. Stronger nonlinear exteriors from the full potential matrix

The concavity inequality in section 5 applies at every amplitude. Define

    V(w;A,B)=E[|h|²/|L+w|].

It gives Rem<=V. Unlike the scalar density bound, this retains all
quadratic dependence on the complex coefficients A,B. Use the same
nonsingular polar change of variables as in section 4. Put z=T-.4,
v=.30318 and zeta=Z²/sqrt(2)=zeta_r+i zeta_i. The real and imaginary
blocks of V have integrands `2 exp(-T)/D(T)` times

    [[z², z(v+zeta_r)], [z(v+zeta_r), (v+zeta_r)²+zeta_i²]],
    [[z², z(v-zeta_r)], [z(v-zeta_r), (v-zeta_r)²+zeta_i²]],

respectively. Reflection again annihilates the mixed blocks. Here
`Z=(r exp(i theta)-w)/(a+bT)`, so every entry is a smooth expression in
the implicit T, with no inverse distance. `potential_integral.cpp`
uses the same interval jets, source rectangle error and tail bound as
section 4, with these full-norm entries in place of the directional
Hessian projections.

Two separate continuum certificates pass:

* **Amplitude exterior:** 178 dyadic intervals cover 0<=w<=2 and prove
  `V(w;A,B)<Q0(A,B)+(.5w²+3/4)S` for S>0.
  Therefore (P) holds whenever S>=3/4.
* **Shift exterior:** 11 dyadic intervals cover 11/8<=w<=2 and prove
  `V(w;A,B)<Q0(A,B)+.5w²S` for S>0.
  Therefore (P) holds there at every amplitude, with the additional S²
  term unused.

Both acceptances use positive diagonals and determinants of the two
real 2-by-2 matrix differences, not sampled eigenvalues. The runner
independently audits the accepted interval endpoints for exact coverage.
S=0 is equality. Rotation covers every complex phase of w, A and B.
The previously reviewed exterior |w|>=1.9 handles all remaining shifts
above 2. Thus the new exteriors are global statements:

    (P) holds if |w|>=11/8 OR S>=3/4.                 (E)

For comparison, the inherited uniform bound Rem<=2.17 S and the identity
`Q0=mS+.59|U|²`, `m=p-.0926-.67(1+rho²)`, give the reviewed exterior
`.5|w|²+S>=891/500`. Claude-b9ee identified that larger version of the
original exterior in the [review of #428](https://github.com/agalatan/grothendieck-lean/pull/428#issuecomment-6892396573).
`strip_check.py` independently replays its rational comparison and the
consequent amplitude cutoff 267/200. This inherited exterior is not
counted as a new result. The matrix exteriors (E) above are the new
finite-amplitude statements and remain author only.

## 7. Scope and replay

The compact problem left by these results is

    0<=|w|<=11/8,  1/50000<=sqrt(S)<=sqrt(3)/2,

minus the critical box of section 2 and the origin neighborhood of
section 3. Its finite-amplitude cover is **not complete**. These proofs
do not establish the odd-sector estimate, full Conjecture K, or a new
Grothendieck endpoint. All new results here are author-only, awaiting
independent mathematical review.

The interval arithmetic and the inherited profile curvature/first-variation
comparison remain explicit mathematical dependencies. No Lean theorem
uses this research package. The runner regenerates both profile values,
replays the inherited density certificate, compiles with strict directed
rounding, and reruns all accepted comparisons. Saved receipts are outputs,
never acceptance inputs. Exploratory annulus searches are not included in
its acceptance path.
