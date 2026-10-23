# Step 2: retain a shared response Gram budget before elimination

## Outcome and scope

The new result is a dimension-free extraction and support interface, not a
Grothendieck endpoint. It keeps the common first-chaos Gram budget, supplies an
all-completions test, and gives a near-maximizer reduction from bounded responses
to their two actual polynomial images. More strongly, the local quadratic
two-response support is exactly a 3-by-3 complex SDP. Rational dual prices
replace its response mesh with seven principal-minor checks. An independent
rectangle checker is also supplied.

The exploratory matrix completion still admits the configurations tested. The
small common-row gains are insufficient. Neither headline bound changes:
`1.401695322458 < K_G^C < 1.404598161566`, under the inputs documented in
[/Users/alingalatan/workspaces/grothe/README.md](/Users/alingalatan/workspaces/grothe/README.md).
All numerical diagnostics in this report use epsilon `149/200`; they cannot
be transferred to `1891/2500` without recomputation and a new certificate.

## 1. A shared Gram interval

Work in the realification of complex Gaussian L². Let P be the full first-chaos
projection, P0 any measured subprojection, and concatenate both branches:

`v = (f A_1, ..., f A_r, g B_1, ..., g B_s)`.

Let X be the Gram matrix of P0 v, V the Gram matrix of v-P0 v, and K that of
Pv-P0 v. Then

`0 <= K <= V`, `Gram(Pv) = X+K`, `V = Gram(v)-X`.

All inequalities are in PSD order. For any real coefficient vector c, the
inequality is precisely `0 <= ||P sum(c_i(v_i-P0v_i))||² <= ||sum(c_i(v_i-P0v_i))||²`.
The matrix size is the feature count, independent of Gaussian dimension.

The mixed block is not a free covariance: it contains
`E[Re(conj(f)g) A_i B_j]` from the same pair. Separately budgeting both branches
throws it away.

For one feature per branch, set c=X12, v=V12 and R=sqrt(V11 V22). An unknown
residual cross coefficient k must satisfy `|2k-v| <= R`. If stability additionally
requires `|c+k| <= a`, every completion must satisfy

`|2c+v| <= R+2a`.

This halves the radius of the separate Cauchy interval when v=0. It is sharp:
V=I and projection onto (1,1) give k=1/2. The exact example
`c=1/5, v=0, R=1/10, a=13/100` is excluded, although separate Cauchy admits
`k=-2/25`. This is a test of the mathematical interface, not a binding-node
counterexample.

For matrix prices Z,Y, `Y >= 0` and `Y-Z >= 0` give
`trace(Z K) <= trace(Y V)`. Rational rank-one factorizations suffice to verify
the prices. The projection interval is sharp for arbitrary Hilbert vectors by
an explicit projection dilation. Its power here must therefore come from the
restriction that the vectors are the same response multiplied by the features.

## 2. Eliminate the free responses from the new moments near the supremum

Let J=Re<f,Tg>, M the supremum over every dimension and disc-valued pair, and
J >= M-delta. Put a=|Tg|, b=|Tf|, phi_g=phase(Tg), phi_f=phase(Tf). Then

`E[a |f-phi_g|²] <= 2 delta`, `E[b |g-phi_f|²] <= 2 delta`.

Proof: phase replacement is an admissible one-sided competitor, so E|Tg| <= M.
Pointwise, `a |f-phi_g|² <= 2(a-Re(conj(f)Tg))`; likewise for the other branch.
There is no assumption that both phase replacements remain mutual best responses.

Fix tau>0 and bounded real image-dependent rules alpha,beta with pointwise sums
of squares <=1. Define

`A_i=sqrt(a/(a+tau)) alpha_i`, `B_j=sqrt(b/(b+tau)) beta_j`.

Then the total squared L² errors in replacing f A by phi_g A, and g B by phi_f B,
are each at most `2 delta/tau`. Their combined full, measured or residual Gram
matrix errors are at most `4 sqrt(2 delta/tau)` in operator norm. For the mixed
first-chaos block alone the error is at most `2 sqrt(2 delta/tau)`.

The positive weighted matrices Df=E[a A A^T], Dg=E[b B B^T] are unchanged. Combining
this with the existing fresh-second-chaos Hessian theorem yields

`[[Df, eps C_image], [eps C_image^T, Dg]] >=
 -(10 + 2 eps sqrt(2/tau)) sqrt(delta) I`,

where `C_image=Re<P(phi_g A),P(phi_f B)>`.

For fixed tau this error tends to zero uniformly in dimension. The new moments
are now functions of the two actual polynomial images, not of separately fitted
bounded responses. Their shared coordinates and the original chaos degrees are
retained. No Gaussian replacement, independence assumption, small-core theorem,
or anti-concentration estimate enters this argument.

This is a necessary condition on global near-maximizers. It is not a bound for
all cubic perturbations. Moreover Tf,Tg must still be the actual images of the
same pair: arbitrary two polynomial images form an outer relaxation. That
compatibility is the remaining global obligation.

## 3. A finite local support problem, with an exact checker

Before taking the fibre supremum, attach equality prices to the measured
coefficients, joint Gram entries and weighted moments. For fixed quadratic-dual
variable y, the pointwise support remains over the same two response discs.
Integration and subtraction of the measured prices give a valid upper bound.
Taking the y supremum and optimizing prices does not interchange a tensor
supremum with an infimum. For a fixed image state the price dual is convex,
even though the maximization in y need not be concave.

For features fixed once the conditional images are specified, the local payoff
is a quadratic in two complex responses:

`a|u|²+b|v|²+Re(conj(p)u+conj(q)v)+2Re(conj(u)wv)`.

Define chi_b(r)=b+r if 2b+r>=0, and -r²/(4b) otherwise. Eliminating v gives

`sup_{|u|<=1} [a|u|²+Re(conj(p)u)+chi_b(|q+2 conj(w)u|)]`.

Thus the checker needs two real variables instead of four. Negative diagonal
prices can put the optimum in the interior; assuming unimodular responses here
would give an invalid majorant. The radial bound and attainment are in Lean.

[/Users/alingalatan/workspaces/grothe/tools/joint_disk_support.py](/Users/alingalatan/workspaces/grothe/tools/joint_disk_support.py)
implements exact rational square-root enclosures and dyadic rectangle bounds.
Every returned interval is valid even when its work budget is reached before the
requested tolerance. It certifies fixed rational local coefficients, not a
Gaussian integral or a global norm. The manuscript contains the cell-bound and
coverage proof.

The stronger interface uses the Hermitian matrix with diagonal (0,a,b) and
upper off-diagonal entries (conj(p)/2,conj(q)/2,w). Its support equals

`max tr(HX) subject to X>=0, X00=1, X11<=1, X22<=1`,

and its dual is

`min lambda0+lambda1+lambda2 subject to lambda1,lambda2>=0,
 diag(lambda)-H>=0`.

Equivalently, the convex hull of `(1,u,v)(1,u,v)*`, with both responses in the
unit disc, is exactly this 3-by-3 PSD set. The complete local quadratic moment
body therefore needs no higher moment hierarchy. The unresolved restriction
is which *fields* of these moments come from the same Gaussian responses with
the prescribed polynomial images; local convexification alone does not impose it.

This SDP is exact. If an extreme feasible X has rank r>=2 and X=RR*, there
is a nonzero Hermitian U with diag(RUR*)=0: the real space of such U has
dimension r²>=4, but there are only three diagonal equations. Small positive
and negative perturbations R(I +/- tU)R* preserve feasibility and contradict
extremality. Thus an optimal extreme X has rank one and is an actual pair of
complex disc responses. Strict primal and dual feasibility give strong duality.
This adapts the complex correlation-matrix rank argument of
[Li and Tam (1994)](https://doi.org/10.1137/S0895479892240683).
The analogous real rank count permits rank two, and the argument also stops
guaranteeing rank one when more response branches are added.

[/Users/alingalatan/workspaces/grothe/tools/two_disc_sdp.py](/Users/alingalatan/workspaces/grothe/tools/two_disc_sdp.py)
verifies rational prices by all seven principal minors. Its optional floating
solver only proposes prices; exact diagonal loading is accepted solely by the
rational checker. Four examples, including the genuinely interior coupled
optimizer u=v=2/3, have exact primal--dual gaps below 1e-8. Tampered prices are
rejected. These examples certify local support values, not Gaussian integrals.
The 3-by-3 rank argument is a written proof; the Lean theorem formalizes the
dual price implication given a positive homogeneous slack, not the finite
principal-minor checker or SDP rank-one exactness.

The local certificate implication is now stronger in Lean:
[/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/TwoDisc.lean](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/TwoDisc.lean)
proves a general LDL sum-of-squares factorization and its support bound, and
sharp bounds and attainment for all four examples. Their exact support values
are 2, 1/2, 2/3 and 2. These four bounds need no external numerical input;
the floating proposals are an independent check. The general rank-one SDP
theorem is still a paper proof.

For response-independent fixed feature functions there is also a signed bilinear
interface: pricing the original Hessian H(A,B) by lambda>=0 replaces T by

`S=T+lambda(M_(A²) T + T M_(B²) + 2 eps M_A P M_B)`.

The original all-dimensional norm is at most the all-dimensional norm of S,
by applying the Hessian inequality along a global maximizing sequence. This is
an alternative certificate obligation; it does not assert that the new norm
has already been bounded. Image-dependent features do not define one fixed
bilinear operator and must use the lifted support interface.

## 4. Droplet falsification gate

All substantial calculations ran on `ssh yo` with the existing venv and one
BLAS thread. The named responses are explicitly defined in
[/Users/alingalatan/workspaces/grothe/tools/screen_response_gram.py](/Users/alingalatan/workspaces/grothe/tools/screen_response_gram.py).
The seven configurations include a degree-three Gaussian limit and overlap,
shared and independent Wick drivers, a shared real degree-two fluctuation,
mixed-square and cycle tensors. The independent Gaussian W retains original
degree 3; the neutral real Gaussian N retains degree 2. They are graded-limit
benchmarks, not first-chaos buffer coordinates.

Fit and evaluation Sobol grids are independent. Refined runs use 2^19 fit points,
2^20 evaluation points and independent scramble seeds. The first-chaos phase-Z
coefficient error in the refined calibrations stays below 3.1e-7; the cubic
error stays below 4e-6, and off-target coefficient errors reach about 5.7e-5. Those are
diagnostics, not integration error bounds. In particular no 1e-6 payoff or
eigenvalue enclosure is claimed.

The two feature sizes are 6 and 18 per branch. Clipping is 32, reciprocal
regularization .002, and normalization enforces the pointwise unit budget.
The image-based version uses phase(Tg), phase(Tf) and the modulus cutoff .01.
Both positive-weight and signed-weight completion SDPs are solved. Each saved
result includes the full observables and a surviving missing Gram K, together
with numerical primal feasibility residuals. Moment-body padding is recorded
explicitly; solver tolerances are not certificates.

No completion test in this batch excludes its configuration. In the response-
based sharp-score cycle test the actual matrix has eigenvalues about -4.36e-6
(6 features) and -1.55e-6 (18 features), reproducible with independent grids.
Allowing all missing coefficients raises the corresponding best eigenvalues
to about +6.67e-6 and +2.09e-7. Signed weights also remain feasible after this
completion. This identifies an observable loss: the measured visible direction
and total Gram budget do not pin the remote first-chaos coefficient map.
The cycle is far below the binding payoff, and these eigenvalues are floating
evidence. They do not exclude a near-maximizing law or certify a gain.

The four saved radial laws have none of these joint observables. They are not
declared excluded by the matrix test. Their common-row comparison is a separate
valid potential change: average the original quadratic matrices M, visible
polynomials L and coupling vectors delta*a before the fibre supremum. Averaging
M inverse would be incorrect. At the finer 512-by-384 grid the observed savings
are approximately 3.04e-7, 1.89e-6, 2.92e-7 and 2.39e-6 on laws 7234, 5661,
1247 and 8701. The resulting discovery scores remain about .713390, .713405,
.713386 and .713344. These are quadrature and local multistart evaluations,
not upper enclosures or new certificate boxes. No continuous-law optimum is
claimed.

The tested family therefore fails the planned separating gate. Further clipping
or feature mesh refinement is not justified as the main research direction.

## 5. Proof and integration ledger

Before the final ledger, the quadratic-feature follow-up is important: it
removes the free coefficient map in one entire feature class.

For Hermitian M put A_M=z*Mz-tr(M), and W_(jl;i)=:z_j z_l conj(z_i):. Exactly,

`A_M z_l = sum_j M_lj z_j + sum_ij M_ij W_(jl;i)`.

Thus `P(f A_M)` depends only on Pf and Qf. In terms of h=Tf its lth coefficient is

`sum_j conj(M_lj)<z_j,h> - (1/eps) sum_ij conj(M_ij)<W_(jl;i),h>`.

This is a tensor contraction, not a first-chaos variable that a completion can
change independently. It holds for every bounded response in every dimension,
with arbitrary shared inputs. No unbounded multiplication operator on all of
L² is assumed; the polynomial probe and bounded response products are in L².

For a centered Hermitian quadratic of variance a² the even moments are bounded
by `9 a^4`, `265 a^6`, `14833 a^8`. Diagonalization and the moment--cumulant
partition formula prove these bounds: the absolute kth cumulant is at most
`(k-1)! a^k`, and the centered exponential supplies the derangement numbers.
The existing L8 Hessian remainder is at most `48(a²+b²)²`. For affine quadratics,
including a constant feature, it is at most `67(a²+b²)²`. The TeX gives the
proof and rational sum-of-squares identities.

Orthonormal centered quadratic features give a dimension-free near-maximizer
matrix error `16 sqrt(3 delta)`; affine quadratic features give `4 sqrt(67 delta)`.
There is no clipping error or missing first-chaos completion in this family:
its cross block is computed from the two image tensors.

[/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/QuadraticFeatures.lean](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/QuadraticFeatures.lean)
formalizes the Wick identity, Hilbert-space probe closure and both rational
remainder budgets. The Gaussian moment bound and matrix assembly are paper
proofs. The independent replay
[/Users/alingalatan/workspaces/grothe/tools/verify_quadratic_closure.py](/Users/alingalatan/workspaces/grothe/tools/verify_quadratic_closure.py)
checks the contraction signs and indices by exact complex Gaussian polynomial
integration, including imaginary Hermitian entries and decoding from Tf.

The droplet script
[/Users/alingalatan/workspaces/grothe/tools/screen_quadratic_closure.py](/Users/alingalatan/workspaces/grothe/tools/screen_quadratic_closure.py)
tested the same seven configurations with the complete 3-coordinate Hermitian
quadratic basis, the shared real degree-two fluctuation, and then a constant
feature. All matrices remain positive in these floating diagnostics. The
smallest signed eigenvalue with the constant is about .0944. Direct projection
and the contraction map differ by at most .00181 on independent QMC grids;
their exact polynomial check passes. This discrepancy is not a rigorous error
bound. No endpoint gain is claimed.

This exposes a concrete tradeoff: quadratic tests close on the available image
tensors but are weak on this batch; stronger nonlinear scores need additional
projection information. The next lift should anchor score features to the exact
quadratic contractions and budget their remainder, rather than grant their
entire first-chaos map a free completion.

The live proof is
[/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/global-response/joint-response-lift-20261023.tex](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/global-response/joint-response-lift-20261023.tex),
included by
[/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch17-crossbound.tex](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch17-crossbound.tex).

The sixteen general lemmas in
[/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/ResponseGram.lean](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/ResponseGram.lean)
are imported by the root library and listed in its axiom audit. They formalize
the Hilbert-space Gram extraction, scalar completion, price assembly, pointwise
alignment/cutoff and inner-product error algebra, the scalar radial support,
and the complex two-disc dual price bound.
The Gaussian image-lift application, matrix operator-norm estimates, full complex
disc elimination, projection dilation and modified-operator identity are written
proofs, not claimed formal consequences already connected to the endpoint.
No new axiom, `sorry`, numerical hypothesis or endpoint input is introduced.

The two additional modules contribute eleven more kernel-checked theorems.
The root axiom report now contains 215 entries; the three existing numerical
`native_decide` facts are unchanged. The local SDP exactness proof and Gaussian
moment/extraction applications remain distinguished from the formal algebra.

The exact finite examples are independently replayed by
[/Users/alingalatan/workspaces/grothe/tools/verify_response_gram.py](/Users/alingalatan/workspaces/grothe/tools/verify_response_gram.py).
Logs, discovery observables and exact local enclosures live under
[/Users/alingalatan/workspaces/grothe/outputs/joint-response-lift-20261023](/Users/alingalatan/workspaces/grothe/outputs/joint-response-lift-20261023).

## 6. The next target

Use the image-determined interface to constrain the *two-sided polynomial image
map*, preserving remote first-chaos coefficients before the fibre supremum.
At a fixed lifted state, image-based features make the joint support checker
finite and remove free response fields. What remains is a uniform outer cover
of states that are simultaneously Tf,Tg for the same pair. The saved surviving
K matrices specify what a new compatibility condition must prohibit or price.
The fixed-feature modified-operator form is a parallel way to express this
obligation using the existing norm machinery.

The quadratic closure sharpens that target: keep the strong nonlinear score
tests, anchor their affine-quadratic part to the exact tensor contraction map,
and bound only the remaining feature projections. Their entire cross block
should not be granted a free completion. The seven tested quadratic-only
matrices are too slack to justify another quadratic feature scan by itself.

A new norm cap still needs an actual dimension-free image-state inequality,
source-potential enclosures and a complete row cover. Neither a fitted radial
law nor the exact local disc checker supplies them. Spend each old projection
square once, and keep signed rounding coefficients if an actual new adversary
is found; only an actual response can be fed to the upper-bound pool.
