<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/codex-4d8a-uniform-local-2026-11-15/conjecture_k_uniform_local_codex_4d8a/variational/DRIVER_TAILS.md, 15 November 2026; Agent-ID: codex-4d8a. -->
<!-- handoff/codex-4d8a-compensated-joint/variational/DRIVER_TAILS.md -->
# Exact Gaussian-driver tails and a smaller averaged joint obligation

Agent-ID: codex-4d8a. 15 November 2026. Baseline: PR #447,
`e6ebb9db478350fb5be73c6d9e4548df158f192e`.

These are new analytic reductions, with the elementary scalar calculations
checked exactly by `verify_driver_tails.py`. The joint premise remains open.
The results do not change a Grothendieck endpoint.

An independent worker in this same session re-derived the tail argument,
the compensated defect cap and the harmonic decompositions, and replayed
the exact checker. Its V=0 endpoint objection was corrected by keeping
S_r<=16V in the central event and discarding the strict tail. This is
in-session review, not an external review or a Lean formalization.

## 1. A dimension-free exponential tail for the actual A/B drivers

Let r_A,r_B be arbitrary jointly proper complex Gaussian linear forms,
possibly dependent on every other remote field. Put

    S_r = |r_A|² + |r_B|²,       V = E S_r.

If V=0 then S_r=0 almost surely. If V>0, then for every x>=3,

    Pr(S_r >= x V) <= exp(-x).                              (1)

The coefficient is sharp: equality holds when the covariance has rank one.
Unlike a generic Markov or hypercontractive tail, this has no polynomial
factor multiplying exp(-x).

**Proof.** The two-dimensional proper Gaussian covariance diagonalizes, so
S_r/V has the law lambda X+(1-lambda)Y with independent rate-one exponentials
X,Y and 0<=lambda<=1. Put h(t)=t exp(-x/t), extending h(0)=0. When
lambda!=1/2, elementary convolution gives the survival function

    [h(lambda)-h(1-lambda)]/(2lambda-1).

At lambda=1/2 its continuous value is h'(1/2). Now

    h'''(t) = x² exp(-x/t)(x-3t)/t⁵ >= 0,   0<t<=1,

when x>=3. Thus h' is convex. The average of a convex function over
[1/2-d,1/2+d] is nondecreasing in d: its derivative has the sign of
the endpoint average minus the interval average, nonnegative by convexity.
The divided difference is therefore maximal at d=1/2. Its value there is
h(1)-h(0)=exp(-x), proving (1). The endpoints lambda=0,1 have that law
directly. This also covers a one-dimensional or zero second driver.

An immediate weighted consequence, valid for tau>=3V, is

    E[S_r 1{S_r>=tau}] <= (tau+V) exp(-tau/V).               (2)

Indeed use tau Pr(S_r>=tau)+integral_tau^infinity Pr(S_r>=s) ds.

## 2. A universal positive-part cap for the compensated joint defect

Use exactly the centered joint defect F_joint of the near-star package:

    Y=L+w,
    K=(T-2/5)A+(3/5)rho B+Z² conjugate(B)/sqrt(2),
    O=ZQ+conjugate(Z)P+nu Z(T-2)/sqrt(2),
    S_r=|A|²+|B|²,      omega=|Q|²+|P|²+|nu|²,
    R=A+rho B,          U=B-rho A,
    B_P=(p-463/5000)S_r-(67/100)|R|²-(2/25)|U|²
                                  +( |w|²/2+S_r )S_r,
    C(Q,nu)=2h[(11/20)Re Q Re nu+Im Q Im nu],
    F_joint=E_Z[|Y+K+O|+|Y+K-O|-2|Y|
                    -2Re(K conjugate(ph Y))]-B_P-p omega-C.

Here p=2500/1891, rho=5053/10000 and
h=(I2-2I1)/sqrt(2), whose existing exact certificate gives |h|<61/100.
No restriction on nu is needed in this section.

The existing global even inverse-potential theorem gives Rem_even<=alpha S_r,
alpha=217/100. The central odd increment is at most 2E_Z|O|<=2sqrt(omega).
The latter second moment is exactly omega, even conditionally on all remote
coefficients: E[T(T-2)]=0 and the angular harmonics remove the other cross
terms. Also |C|<=(61/100)omega. Finally R and U are orthogonal linear
coordinates up to the factor 1+rho², so

    B_P >= (m+|w|²/2+S_r)S_r,
    m=p-463/5000-(67/100)(1+rho²)>0.

Set g=alpha-m and c=1/(p-61/100). Then, at every complex coefficient tuple,

    F_joint <= g S_r-S_r² + 2sqrt(omega)-(p-61/100)omega
                                           -|w|²S_r/2
            <= g S_r-S_r²+c
            <= M := g²/4+c < 11/5.                         (3)

Numerically M=2.1979328311582775...; only the exact rational bound is used.
In particular

    0 <= (F_joint)_+ <= M.

This retains the compensation term throughout the pointwise estimate.
There is no false cancellation of E[Q 1_E] on a selected event. The proof
uses neither (P) nor the conjectured joint inequality (J).

Combining (1) and (3), with any genuine shared remote fields, proves

    E[(F_joint)_+ 1{S_r>=xV}] <= M exp(-x),   x>=3.         (4)

The checker certifies these strict rational budgets:

| x | bound in (4) |
|---|---|
| 15 | < 7 / 10^7 |
| 16 | < 1 / 4,000,000 |
| 17 | < 1 / 10^7 |
| 18 | < 7 / 200,000,000 |
| 20 | < 1 / 200,000,000 |

For V=0 use the strict tail event {S_r>xV}, which is empty. For V>0
the Gaussian quadratic form has a continuous law, so either boundary
convention has the same expectation. This handles V=0 without excluding
the remote-core configurations from the central event below.

## 3. Consequence for the open averaged joint estimate

Remain in the genuine response domain of the near-star reduction:

    u<=.0463,   u+V<=.080051,   W=E omega<1/50,

with its unchanged response restrictions. Thus |nu|²<1/50. The already
proved near-star exteriors imply F_joint<=0 when |q|>=10 or omega>=4;
these statements retain precisely their original hypotheses.

It now suffices to prove the smaller averaged obligation

    E[(F_joint)_+ 1{|q|<10, S_r<=16V, omega<4}]
                                      <=199/4,000,000.      (5)

The right side is 49.75e-6. Equation (4) adds strictly less than .25e-6,
so E F_joint<50e-6. The existing signed-deficit/cession argument then gives
the same conditional retained cap below S+99.36e-6. This does not assert
that (5) has been proved.

The new shell cutoff is at most 16*.080051=1.280816 throughout the response
domain, replacing 11/5=2.2. If u>=1/25, it is at most

    16(.080051-.04)=40051/62500=.640816.

For smaller actual shell energy V the cutoff contracts proportionally.
Unlike conditional amplitude assumptions, this removes the omitted values
with a rigorous global budget. One may use x=15 and reserve .7e-6, or
another row of the table, to trade central size against the error budget.

## 4. Exact weighted chaos tails despite arbitrary sharing

The previous reduction needs only the driver distribution. For estimates
that also contain q, Q or P, the following weighted bounds preserve their
genuine sharing with the drivers.

For n>=0 write E_n(x)=sum_{j=0}^n x^j/j!, and define

    H11(x)=1+x-x²/2+x³/2,
    H21(x)=1+x+x²/2-x³/3+x⁴/6,
    T2(x)=exp(-x) max(E_3(x),H11(x)),
    T3(x)=exp(-x) max(E_4(x),H21(x)).

For every x>=0 and V>0,

    E[|q|² 1{S_r>=xV}] <= u T3(x),          q in H21,
    E[|Q|² 1{S_r>=xV}] <= W_Q T2(x),        Q in H11,
    E[|P|² 1{S_r>=xV}] <= W_P exp(-x)E_3(x), P in H20.      (6)

The maximum in T2 switches at x=3 and the maximum in T3 at x=4.
There is no independence hypothesis between these fields and the drivers.

**Proof.** The drivers lie in at most two complex Gaussian coordinates.
Add an unused independent coordinate if necessary and write their span
inside X=(X1,X2), with remaining coordinates Y independent of X. If
R=|X1|²+|X2|², diagonalization gives S_r<=VR, so the event in (6) is
contained in {R>=x}.

Decompose q into driver bidegrees:

    H21(X,Y)=direct_sum_{0<=j<=2,0<=k<=1}
                              Hjk(X) tensor H(2-j,1-k)(Y).

Different summands remain orthogonal after inserting a function of R,
because their Y bidegrees differ. Within each summand choose an orthonormal
basis in Y. It therefore suffices to bound radial truncation on each of
the six finite-dimensional spaces Hjk(C²). This is where the chaos
assumption enters; orthogonality to first chaos alone would not suffice.

The radial measure of R is r exp(-r)dr. The harmonic decompositions are

    H11(C²) = harmonic(1,1) plus span(R-2),
    H21(C²) = harmonic(2,1) plus (R-3) H10(C²).

For completeness, these follow from the ordinary bihomogeneous harmonic
decomposition P21=H21+R ell and Wick ordering exp(-Delta):
Delta(R ell)=3ell and Delta H21=0. Similarly Delta R=2 gives R-2.
The harmonic and trace pieces are orthogonal on each sphere, since their
spherical harmonic degrees differ. Thus radial truncation stays diagonal.

A homogeneous harmonic polynomial of degree d has squared modulus R^d
times its sphere value. Its radial tail-to-norm ratio is therefore
exp(-x)E_(d+1)(x). The two trace pieces instead give

    H11 trace: (1/2) integral_x^infinity r(r-2)² exp(-r)dr
                                            =exp(-x)H11(x),
    H21 trace: (1/6) integral_x^infinity r²(r-3)² exp(-r)dr
                                            =exp(-x)H21(x).

The denominators 2 and 6 are their exact full radial integrals. All
lower-degree harmonic tails are bounded by exp(-x)E_4 for q and by
exp(-x)E_3 for Q,P. The only additional trace tail in the q decomposition
is H11, and

    E_4-H11=x²(1-x/3+x²/24)>0 for x>0.

This proves (6). The switching identities are

    H11-E_3=x²(x-3)/3,
    H21-E_4=x³(x-4)/8.

The radial operator norms above are exact, although the first event
enlargement S_r>=xV => R>=x can lose sharpness. Higher weighted moments
R^j use the same diagonal decomposition and incomplete Gamma integrals;
no new probabilistic independence argument is needed.

## 5. What this resolves and what remains

The high conditional A/B amplitudes can now be removed at an arbitrarily
small explicitly exponential cost, even though the remote cubic and odd
fields share all the Gaussian drivers. This supplies a justified shrinking
event for the open averaged problem and exact tools for weighted tail
terms. The central finite-amplitude joint inequality, the all-sector
retained cap and Conjecture K remain open.
