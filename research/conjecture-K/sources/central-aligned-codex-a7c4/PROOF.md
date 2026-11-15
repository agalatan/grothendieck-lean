<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe-codex-a7c4-conjecture-k-progress/handoff/codex-a7c4-central-aligned/PROOF.md (2026-11-15). Only this line was added. -->
# Central aligned directions of the joint inequality

Agent-ID: codex-a7c4. Refs #431. Author-only derivation. The complete
replay is required before asserting the real-plane cover below. Independent
complex phases, full (P), and a new Grothendieck endpoint remain open.

Use the peak constants a=699/1250, b=179/1250, c=15159/50000,
rho=5053/10000, p=2500/1891 and the definitions of (P) in ledger 7.4.10.
For D=(A,B), let S=|A|²+|B|² and

    h_D=(T-2/5)A+cB+Z² conjugate(B)/sqrt(2),
    Q0(D)=(p-.0926)S-.67|A+rho B|²-.08|B-rho A|²,
    R(w,D,t)=Rem(w,tD)/t²,
    J(w,D,t)=R(w,D,t)-Q0(D)-w²S/2-t²S².

Here t>0 and w is real. The target is J<=0. The previously reviewed
origin and exterior regions in #444 are inherited, not rediscovered by
the floating selector used in this cover.

## 1. Shift curvature from the unperturbed base

In the original Gaussian coordinates, h_D is independent of w. Put

    N(w)=2 E|L+w|,
    C_D(w)=E Re(h_D conjugate(ph(L+w))).

Then

    R(w,D,t)=[2E|L+w+t h_D|-N(w)-2t C_D(w)]/t².

The first term is convex in w, including its distributional Hessian at
zeros. Therefore

    J_ww >= -N''(w)/t²-2 C_D''(w)/t-S.                 (1)

For real w, reflection of Z across the real axis shows
C_D=(Re A) C_A+(Re B) C_B. In particular the two content functions
suffice even for complex D; the present corner cover uses real D only.
On a shift interval where

    N''<=n,  |C_A''|<=a2,  |C_B''|<=b2,

and a parameter box with t>=tlo>0, |Re A|<=a_max, |Re B|<=b_max,
S<=Smax, the one-sided curvature constant can be taken as

    Mw=min(481 Smax,
           n/tlo²+2(a2 a_max+b2 b_max)/tlo+Smax).      (2)

The first alternative is the reviewed amplitude-independent estimate of
#443. Both alternatives hold throughout the box, so their minimum does
too. The second estimate does not differentiate a perturbed zero and does
not require injectivity of the perturbed map.

## 2. Certified base curvature integrals

Write L+w=r exp(i theta), y=r exp(i theta)-w, and solve
T(a+bT)²=|y|². Put Z=y/(a+bT), D0=(a+bT)(a+3bT), f=exp(-T)/D0,
and zeta=Z²/sqrt(2). With theta=2pi u, 0<=u<=1, the three integrands are

    N'':     4 f sin²(theta),
    C_A'':   derivative_w² [2r f (T-2/5) cos(theta)],
    C_B'':   derivative_w² [2r f ((c+Re zeta)cos(theta)
                                           +Im zeta sin(theta))].       (3)

The first identity is the integrable norm Hessian
2E[(Im(L+w))²/|L+w|³]. The other two come from differentiating the
smooth transformed density and coefficient fields, with r and theta
fixed. No inner disk is removed: these kernels extend to r=0. Their
derivatives are integrable uniformly for w in the compact shift range;
the tail bounds below justify differentiating the content integrals.

`mixed_jet.hpp` stores bivariate Taylor coefficients through degree two
in w and degree two in one source coordinate. Products are truncated
convolutions. Reciprocal, exponential and trigonometric recurrences are
their finite formal Taylor identities. For T=H^{-1}(v), H(T)=T(a+bT)²,
the constant coefficient is enclosed by the reviewed endpoint-sign root
bracket. At each increasing total degree, H's corresponding coefficient
is H'(T0) times the one unknown T coefficient plus terms already known;
division by H'(T0)=(a+bT0)(a+3bT0)>0 encloses that coefficient. This is
implicit differentiation, not acceptance of a floating Newton iterate.

Every source rectangle uses midpoint quadrature with error

    area*(sup|F_rr| dr²+sup|F_uu| du²)/24.             (4)

For N'', the second source derivative is twice the relevant Taylor
coefficient. For C_i'', the mixed w²/source² derivative is four times
the coefficient, since 2!2!=4. The center value is separately evaluated
with the reviewed second-order jet arithmetic. The interval shift w is
retained in all operations. Repeated subdivision and outward summation
produce enclosures; a wide enclosure is never interpreted as a small
curvature constant. The verifier uses the actual reported endpoints.

The source integral stops at r=40. For |w|<=2, this implies T>36 on the
omitted region, since 6(a+36b)<38. The N'' tail is at most exp(-36)/20.
For a unit coefficient direction the reviewed differential estimates give

    |h|<=M=.503+1.226T,
    |h_w|<=K1=sqrt(6T)/(a+bT),
    |h_ww|<=K2=sqrt(6)/(a+bT)²*(1+6bT/(a+bT)),
    |T_w|<=2sqrt(T)/(a+3bT), |T_ww|<=2/D0.

Set m=1+b/(a+bT)+3b/(a+3bT). The absolute content derivative density
relative to exp(-T) is bounded by

    K2+2m|T_w|K1+
       [(m²+b²/(a+bT)²+9b²/(a+3bT)²)|T_w|²+m|T_ww|]M.

For T>=36 use M<=5T/4, sqrt(6)<5/2 and m<=19/18. After multiplication
by b², this is at most

    335/(18 T²)+25(19/18)/(6T)+5(19/18)²/9 < 1.

Thus either content tail is at most exp(-36)/b². The code checks these
coefficient and tail comparisons outward and adds [-2^-40,2^-40] to
each integral enclosure. Both tail bounds are strictly below 2^-40.

The exact shift manifest has 160 contiguous intervals of width 1/128 on
[0,5/4], eight in each width-1/16 region. Maxima of the certified component
bounds on those eight intervals supply n,a2,b2 for (2).

## 3. Source integration for the actual finite-amplitude remainder

The corner integrator specializes the reviewed normalized remainder
engine to real A,B. Reflection gives an even source integrand in theta,
so theta=pi u with u in [0,1] has the same factor 4r f as the full-circle
form. Imaginary coefficient inputs are explicitly rejected.

The original one-sided source curvature estimate is retained everywhere.
Where the interval enclosure of v=r+t k avoids zero, the exact second
derivative of |v| is also enclosed using

    (|v|)''=(|v'|²+Re(v'' conjugate(v)))/|v|
                          -(Re(v' conjugate(v)))²/|v|³.

Applying the product rule to 4r f (|v|-r-t Re k)/t² gives an additional
lower and upper second-derivative bound. Its lower bound is intersected
with the original lower bound. If the perturbed norm may vanish, only
the original one-sided bound is used. No neighborhood of such a zero is
discarded.

Each source rectangle has the original endpoint-trapezoid upper bound.
Where finite upper bounds on both source second derivatives exist, it
also has the midpoint upper bound with denominator 24. The smaller of
these two valid upper bounds is used. The finite source interval, inner
disk and outer tail have exactly the reviewed bounds from the normalized
engine. Hexadecimal output preserves the precise binary upper endpoint;
the Python verifier checks it against the exact rational target.

## 4. Parameter charts, interpolation and complete coverage

For a nonzero real pair (A,B), choose t=max(|A|,|B|). There are four
normalized charts, with -1<=y<=1:

    D=(1,y), (-1,y), (y,1), (y,-1).

These cover all real coefficient pairs, including the signed boundaries.
If t<=1/1024 then |tD|²<=2/1024²<(1/512)², so #444's uniform origin
region applies. If t>=7/8 then |tD|²>=49/64>3/4, so the reviewed
amplitude exterior applies. The zero pair is equality. Shifts w>=5/4
are already covered in every direction by #444.

The remaining parameter roots are the twenty shift intervals
[i/16,(i+1)/16], all four charts, y in [-1,1], and the contiguous
amplitude intervals with endpoints

    1/1024,1/512,...,1/2,7/8.

For each rectangular box define Smax=max |D|², Smin=min |D|² and let
q_y be qa or qb according to the varied real coefficient. The spatial
interpolation error is

    Espace=Mw (delta w)²/8
         +[2q_y+wmax²+4tmax² Smax+8tmax² max(y²)](delta y)²/8.          (5)

The coefficient bound follows from convexity of the normalized norm
remainder in D, as in #443. On t in [lo,hi], the reviewed amplitude
continuation adds

    Eamp=[(2(p-.0926)+wmax²)Smax+12hi² Smax²]
                                           *(hi-lo)²/(8lo²).          (6)

Consequently, if all eight corner upper bounds for J are at most jmax
and jmax+Espace+Eamp<0, the whole box satisfies (P). Mixed derivative
bounds are unnecessary: apply the one-dimensional chord inequalities
successively. Every comparison in (5)-(6) is rational.

A box can instead be closed by a reviewed inherited region: the explicit
origin profile, the amplitude exterior, or the directional condition
16t² S_D²+3S_D>=6|2D_A+D_B|². The implementation uses conservative
interval extrema for this last condition; it never infers it from the
corners alone.

Each root is subdivided by exact dyadic bisection of one coordinate.
The receipt records the path of every terminal box. The auditor rebuilds
the tree and requires precisely both children of the same split axis at
every nonterminal node, with no overlap, missing root or missing child.
Every terminal box must pass its inherited-region test or all eight
corner/interpolation tests. Twenty distinct region receipts are required
for a complete real-plane assertion.

Floating Gaussian quadrature chooses reserves and subdivisions only.
Every corner is subsequently computed by the outward integrator. An
unresolved corner or parameter box fails the job. A partial set of
regions is not a complete cover. Optimized Python and non-strict compiler
modes are rejected; algebraic jet controls and impossible-bound controls
are replayed. Receipts identify exact sources and record executions;
they do not replace a fresh replay or Lean verification.

## 5. Consequences and limits

On successful complete replay, (P) holds whenever w,A,B lie on a common
complex line through zero. A common phase rotation reduces to real
parameters; a further sign makes w nonnegative. This includes every
amplitude and shift on the central aligned directions. It does not
identify the maximum over independent complex phases with this real
subspace.

A genuine family that can use this pointwise result is

    r_A=alpha Y, r_B=beta Y,
    q=Y[gamma(|Y|²-2)+sum_j delta_j(|Y_j|²-1)],

with real alpha,beta,gamma,delta_j and independent standard complex
Gaussian coordinates Y,Y_j. The cubic is genuine H_(2,1), and q,r_A,r_B
lie on the same random complex line. Positive aligned driver ratios are
allowed. Under the existing energy caps, the reviewed joint bridge then
has its original unconditional restricted-family consequence. Odd-sector
assembly still needs its own stated regional or global premise. Nothing
here proves full complex (P), Conjecture K, or a new global lower bound.
