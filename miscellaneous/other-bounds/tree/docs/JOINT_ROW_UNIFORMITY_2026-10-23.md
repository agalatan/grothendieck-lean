# Uniform-law and near-contact extension: mathematical audit

23 October 2026. Read-only repository history. This note formulates valid
extensions of the delivered fixed-law certificate; it does not claim that
any uniform bound has been certified.

**Subsequent decisive calibration:** the companion
`GENUINE_QM_PROJECTION_CLOSURE.md` now gives an exact finite-dimensional
bridge from the Arb-certified diffuse phase pair to a genuine q_4096
response with value above `.7132818073>500/701`. Therefore extending the
unchanged epsilon=.745 witness to a uniform cap `500/701` is impossible.
The formulations below remain correct for diagnosing the obstruction,
other attainable caps, or a changed epsilon/matrix/witness; they are not
a plan to certify this false target.

## 1. A necessary update to the admissible-law class

The original four atomic laws passed the old 671-cut bank. The newer
repository note `docs/COMMON_STEIN_REASSESSMENT_2026-10-23.md` constructs
valid fused Stein tests which reject all four, including 7234. Their old
finite-bank feasibility remains correct, but they are not feasible for the
stronger bank. The common-kernel finite-feature cone is also stronger than
independent cut tests. A new uniform program must identify its law class
explicitly; neither “all old cuts” nor “all cubic laws” is interchangeable
with those newer constraints.

Consequently the reciprocal ceiling `1/.7131526≈1.40222443` applies only
to the fixed mixed matrix, selected-cost surrogate, contact, and any
admissible law class still containing the certified 7234 response. It does
not constrain a strengthened common-kernel class which already excludes
that law. It also does not constrain changing the mixed matrix or witness.

The newer genuine q_128 table barrier has different scope: it survives
every valid scalar-law constraint, but concerns nineteen frozen upper
tables and their convex row mixtures. It does not establish the same floor
for the exact common potential or the joint-response objective.

## 2. Exact law constraints and their legal domains

Write `v=|q|`, `U=v^2`, and `chi=E v^4-2=x^2`. At fixed `x`, the inherited
radial constraints are

    nu>=0, integral dnu=1, E v^2=1, E v^4=2+x^2,
    E v<=rho=973612157/10^9,
    E v^6<=M6(x)=6+9x^2+(4045313/100000)x^3,
    E G_j(v^2)>=0 for each certified legal cut.

The test-function parameters called `t,tau,i,j,theta` in archived spectral
nodes are parameters/labels of those cuts. They do not require the actual
response contact to equal those node labels. Their legality comes from
the test mesh, positive lambda/mu, nonnegative covariance prices, and the
verified tensor budget. `proposed_x` is discovery metadata, not a theorem
hypothesis. The additional joint-sixth cut has the real restriction
`x<=xmax`; it cannot be carried across a cell whose upper x endpoint
exceeds that cap. Inherited Stein and ordinary tensor-budget cuts have no
such extra local x restriction.

Source anchors: `Grothe/Lower/Law.lean` defines `Moments,SteinCut`;
`Grothe/Lower/Gram.lean` defines `GBud.ok,xcap` and `jointCert`;
`Grothe/Lower/Stein.lean` proves the completed cuts. The exact cut function
used by `verify_radial_countermodel.py` is the scalar G_j. Validity of a
newly imported cut requires its budget certificate, not merely evaluating
its archived rational function on some candidate laws.

For a whole x cell one may retain x as an external parameter, or relax to
`2+xl^2<=E v^4<=2+xu^2`, `E v^6<=M6(xu)` and use only joint cuts legal at
`xu`. The latter gives a convex outer law class. The exact union of the
fixed-x classes is not automatically convex, because the sixth cap as a
function of `E v^4` contains `(E v^4-2)^(3/2)`.

The finite common-kernel compression in the newer reassessment can be
inserted as LMIs affine in the law and auxiliary `P,Q,xi,sX,sr`. Its shared
Stein equations and variance budgets must use the same variables across
all tests. A family of separately optimized scalar cuts is weaker. Neither
version yet couples those kernels to the bounded response fields or
characterizes genuine cubic tensors.

## 3. The exact joint law/response convex lift

Fix epsilon, a legal common matrix M, source ell,beta,A, and a contact
`t,tau`. For each radius v let s denote an actual bounded pair of visible
sections. Its packed conditional coefficient K(s), visible moments, and
raw fibre value define

    u(v,s)=(Re E[barZ h], Re E[barZ(R-2)h],
             v Re K0, v Re K1, v Re K2),
    F_tau(v,s)=K(s)^T M K(s)+2ell*u0+2beta*u1
                +2tau*v*A dot Re(K_even).

K2 is the conjugated manuscript gate coordinate. Fourfold latent
symmetrization makes all selected global moments real and bh=0 while
preserving expected F. It does NOT average K before its square is taken.

Let eta be a joint nonnegative measure on `(v,s)`, with radial marginal
nu in the chosen law class. Let `z=integral u deta` and impose `z0=t`,
`z2=tau`. Then the relaxed uniform primal is

    B0(t,tau)+ max_eta [ integral F_tau deta
            -(epsilon/2)(z1+2beta/epsilon)^2
            -||(z3-alpha1*tau,z4-alpha2*tau)||_C^2 ].

The constraints are affine in eta (plus any common-kernel LMIs), and the
objective is concave. This is a genuine convex lifted optimization, even
though optimizing one deterministic section parameterization is
nonconvex. Atomic radius/section columns give a finite convex QP/SDP.
Every feasible finite response column is an actual disk section; this
alone does not make its radial law a Gaussian cubic law.

Moment vectors of visible disk sections form a compact finite-dimensional
body. Their values and F grow at most linearly in v. The sixth-moment cap
makes the radial laws tight, with uniformly integrable lower moments.
For the archived cuts, `G_j(v^2)+zeta_j v^6` is continuous of at most
fourth-order growth, with `zeta_j>=0`; hence the superlevel cut constraint
is weakly closed. These facts justify compactness for a finite fixed-x
cut class and continuity of all response payoff/moment features. Extra
kernel constraints require their analogous finite boundedness checks.

## 4. Minimax order and what a law-specific price proves

Use the plus-price convention of `verify_joint_fibre_upper.py`. For five
real prices lambda, define

    L_lambda=Z[ell+lambda0/2+(beta+lambda1/2)(R-2)],
    c_tau=tau*A+(lambda2,lambda3,lambda4)/2,
    Phi_lambda(v;tau)=sup_sections [K^T M K
                    +2 Re E[barL_lambda h]+2v*c_tau dot Re K_even].

With `c=(t,-2beta/epsilon,tau,alpha1*tau,alpha2*tau)` and
`Winv=diag(0,2/epsilon,0,C^-1)`, every common lambda gives

    UniformValue <= B0-lambda dot c+lambda^T Winv lambda/4
                    + sup_(nu in LawClass) integral Phi_lambda dnu.

This weak-duality statement is sufficient for certification. Optimizing
lambda separately at finitely many discovered laws does not bound the
supremum over all other laws.

For the fully lifted randomized-section class described above, the
compact convex law/moment sets and affine dependence on nu, convex
dependence on lambda permit the minimax equality

    sup_nu inf_lambda U(nu,lambda) = inf_lambda sup_nu U(nu,lambda).

One can prove it directly by Sion's theorem, or first apply it to the
joint eta model and its quadratic-penalty conjugates. Feasible target
moments are required for a finite primal value. Dual prices need not
attain their infimum at boundary contacts. This equality concerns the
specified convex relaxation; it does not interchange optimization over
genuine cubic tensors, nor certify local inner maxima as global values.

The safe implementation keeps one lambda for each parameter cell and
solves the law adversary jointly. A finite primal QP supplies lower
controls; a whole-half-line law dual supplies upper certificates.

## 5. Scalar-law dual signs and a certifiable polynomial majorant

For any fixed lambda, a sufficient law dual is

    Phi_lambda(v)+sum_j w_j G_j(v^2)
       <= a0+a1*v+a2*v^2+a4*v^4+a6*v^6, for ALL v>=0,
    w_j>=0, a1>=0, a6>=0.

Then its expectation is at most

    a0+a1*rho+a2+a4*(2+x^2)+a6*M6(x).

The positive cut sum belongs on the LEFT: valid cuts have nonnegative
expectation. a2,a4 may have either sign because their moments are fixed.
On an x interval, bound the resulting explicit polynomial in x with its
actual coefficient signs, rather than replacing signed equalities by
one-sided moment caps. Existing Bernstein/tail positivity machinery can
certify the full half-line majorant.

A finite-grid law LP maximizes only over its radius grid. Even with a
valid upper envelope for Phi, its optimum is not an upper bound on the
continuous-law program. Its dual prices are proposals until the
pointwise inequality is checked between grid points and on the full tail.
A large value under an upper envelope can expose an inadequate
majorizer; it is not by itself an actual joint-response counterexample.

## 6. Reusing the delivered global quadratic covers

Every delivered piece proves an upper polynomial
`q0+q1*v+q2*v^2` GLOBAL in radius v: its exact LDL matrix and scalar
half-space/slab constraints involve the twelve fibre variables, not v.
The saved atom label only selected useful prices; it is not a validity
restriction on that polynomial.

For each complete scalar-region cover a, let

    Q_a(v)=max_(pieces p in cover a) (q_ap0+q_ap1*v+q_ap2*v^2).

Then `Phi_lambda(v)<=min_a Q_a(v)` on the whole half-line. This envelope
uses no new Gaussian integrals. The evaluated cap at one atom is not a
valid replacement for its radius polynomial. Min/max breakpoints can be
handled with certified interval subdivision and rational polynomial
dominance; the envelope may still be too loose away from its anchor.

Chord interpolation exploits convexity of the TRUE potential in its
coupling scale, but the endpoint caps must themselves be globally
certified. A tail slope or a coercive polynomial is necessary beyond the
last node; truncating the radial law is invalid.

## 7. Exact near-contact continuation as an ordinary new row

At reference tau0>0 freeze lambda0,lambda1 and put

    mu=(lambda2,lambda3,lambda4)/tau0,
    a_new=A+mu/2, ell_new=ell+lambda0/2, beta_new=beta+lambda1/2.

For nearby tau, choose the remote prices `lambda_remote(tau)=tau*mu`.
All source constants cancel to give the ordinary new-row expression

    t^2-2ell_new*t+2beta_new^2/epsilon
       +E Psi_[M,ell_new,beta_new,a_new](tau*v)-D_new*tau^2,
    D_new=E11-epsilon+2a_new0
          -(a_new_rest+Eoff)^T C^-1(a_new_rest+Eoff).

The row has delta_new=1 and b_new=a_new-(1,0,0). E,R and their K-side
Loewner inequalities are unchanged; convex averaging preserved those
inequalities. The generic row reduction requires no old source-table
label for ell_new,beta_new,b_new. Its NEW potential caps, Lipschitz header,
law majorants, x ranges and parameter cover must still be certified.

The delivered polynomial envelopes continue by replacing their old
radius argument with `(tau/tau0)*v`. Alternatively certify potential
nodes as functions of sigma=tau*v, then reuse existing convex chords and
exact quadratic price maximization. This avoids a spurious 1/tau singular
parameterization and preserves a legal fixed row on a contact cell.

For any row coupling a, the potential is Lipschitz in sigma with constant
`L<=2(|a0|+(2/e)|a1|+|a2|/sqrt(2))`. Hence its expectation changes by at
most `rho*L*|Delta tau|`, uniformly over the law class. The visible part
changes exactly by `2(t0-ell_new)Delta t+(Delta t)^2`. These bounds extend
parameters once the LAW cap is uniform; they cannot turn the single
nu_7234 certificate into a law-uniform certificate. Small pointwise
margins can imply very small neighborhoods under crude Lipschitz bounds.

## 8. What would add genuine geometric information

Further scalar moment prices or a free common projector do not couple the
response to the Gaussian grading. A concrete stronger hypothesis is a
common Gaussian creation/annihilation representation in which multiplication
by the same cubic q has its exact Wick product blocks and the bounded
response multiplication commutes with it. For q in H21 and a test in Hpq,
the product has grades `(p+2-j,q+1-j)`, `j=r+s`, with `0<=r<=2`,
`0<=s<=1` constrained by available contraction slots. The blocks are
contractions of ONE cubic tensor, not independent PSD completions.

This is a structured future cone, not a proved quantitative deficit.
It must be calibrated on genuine X G2/coupled Wick families and cannot
reject a genuine response merely because a marginal approximation fails.
The q_m invariant-family calculation in the companion note supplies an
especially useful genuine calibration: exact grading reduces to five
orthonormal features while retaining their coupled scalar law.
