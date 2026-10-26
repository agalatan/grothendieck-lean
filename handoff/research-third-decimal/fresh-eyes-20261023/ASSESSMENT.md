# Fresh assessment and new attacks on the complex Grothendieck constant

23 October 2026. Work on `codex/research-audit-20261023`, in an isolated checkout
originally based on `98f61ec`, now integrated against GitHub master. See
`docs/RESEARCH_AUDIT.md` for the maintained dependency and validation status.
This continues the earlier repository assessment and
rank-one certification campaign. It does not announce a new global endpoint.

## Integration at master `6a869c8`

The earlier numerical cubic warning is now an externally certified,
one-sided method obstruction: for every complex `z`, the dimension-uniform
`P10-z P21` vector/scalar ratio is below `1.4022581233`. At the unchanged
`epsilon=149/200`, a genuine finite Gaussian pair has payoff above
`.71329>500/701`, forcing its reciprocal-method ceiling below `1.401955`.
Thus additional valid compatibility cuts cannot establish the old `1.402`
cap. Retuning or a different witness is necessary. The Gaussian construction,
projection closure and directed integrals remain external proofs; the new
Lean cubic modules check generic implications and arithmetic with those
inputs assumed. Neither result is an upper bound on the constant or a proof
of an exact cubic optimum. See the
[family ceiling](../../../docs/CUBIC_FAMILY_CEILING_2026-10-23.md) and
[fixed-witness obstruction](../../../docs/GENUINE_CUBIC_DIAGNOSIS_2026-10-23.md).

The new same-response multiplication compression is dimension-free but has
not supplied a uniform deficit: its tested finite lifts admit zero-cost
completions, and an actual bounded pair realizes the five selected targets
on abstract law 7234. Joint fibre deficit plus selected cost nevertheless has
a certified positive loss at that law/contact, with cap `.713261364` and
deficit above `.000093136`. This fixed-law result is not a tensor-uniform cap;
new common-Stein cuts independently exclude the old law. The actual Gaussian
grading remains essential: a free common projector can collapse all retained
fields to rank one, while substituting raw fields for their cubic projections
can add a false penalty. Our full-image and marginal-transfer models retain
their stated restrictions and do not resolve that uniformity obligation.

## What changed after stepping back

The most useful progress is structural. We have proved two obstructions to
plausible research routes, exposed a third route's flat directions, and built
an analytic engine for genuinely asymmetric response pairs outside the first
obstruction. The results distinguish mechanisms that can improve the bounds
from mechanisms that merely make a relaxation look more accurate.

The new upper-side obstruction is substantially stronger than a failed search:

\[
D\le {99993\over100000}\gamma^\dagger
 <0.711908822672080.
\]

It holds for arbitrary disk-valued response pairs with one separately
charge-one complex Gaussian coordinate and arbitrary even dependence on any
number of independent ordinary Gaussian auxiliaries. This includes actual
finite quadratic neutral drivers and arbitrary nonlinear dependence on their
joint law. It is below the current rounding score, about
`0.711947153313208982`. Nonlinear preprocessing of the final correlation is
outside this theorem.

On the lower side, for positive first radial moment, the entire unrestricted scalar AMMP matrix hierarchy has
exactly the same projection onto the first three radial moments as its
degree-two and degree-three tests. A written extension proof establishes
this, rather than extrapolating from a finite computation. With the existing
671 cuts retained, seven separate exact finite countermodels show that
degree-six PSD constraints can be repaired at negligible objective cost.

Finally, the full signed phase Hessian has independent-cubic tangent families with margins tending to zero
at the diffuse contact. Its regularized margin is an exact nonnegative
variance tending to zero. An apparent instability in sampled score matrices
disappeared after conditioning unused Gaussian coordinates analytically.

These facts change where I would spend the main research effort: retain
coupled image consistency, allow charged auxiliary channels that evade the
separate symmetry, and require a whole-mixture signed-tail calculation before
treating a rounding candidate as competitive.

## The actual mathematical target

For an admissible mixed correlation kernel
`H(t)=sum c_n t^(2n+1)`, the useful upper-rounding quantity is

\[
D=\operatorname{Re}c_0-\sum_{n\ge1}|c_n|.
\]

The absolute values are taken after mixing the signed coefficients. A good
alternating functional, a good finite head, or a large individual coefficient
does not alone give a good D. The lower side seeks a multiplier game whose
norm is bounded over every Gaussian dimension and every response pair. A
restricted response class can screen constructions but cannot certify that
all-dimensional norm.

The common difficulty is realizability. The same pair must generate the
visible fibre, cubic tensor, contraction fields, first-chaos projections and
all comparison rows. Optimizing these pieces separately can assemble a state
that no bounded pair produces. Conversely, enforcing them through an
unrestricted high-dimensional Gaussian polynomial is expensive.

The finite coefficient-pool game has ordinary LP primal/dual equality. I do
not use a real-field primal/dual paper as an independent proof of every
complex infinite-dimensional equivalence asserted in the older attack note.
The present obstructions and countermodels use explicit operators or exact
finite inequalities and do not need such an extrapolation.

## Baseline and the size of the remaining task

The audited baseline remains:

- Conditional lower endpoint `1.401695322458`, requiring `NodeCaps`.
- Conditional upper endpoint `1.404598635371`: the generic table interface
  uses `DirectHyps`; the current concrete `fresh_upper_rounder` needs only
  `compare`, `energy_close`, `hardy`, with an `L²` charge-one truncation.
- Earlier conditional upper assembly refinement `1.404598540048`, with its
  inherited analytic inputs still distinguished from the endpoint implication.
- Unconditional formal upper bound `1.40578`.

This original campaign changed no Lean library source. The integration now
adds checked core majorizer and semiconvex lemmas, as listed in
`docs/RESEARCH_AUDIT.md`. The previous complete build and
axiom audit are not evidence that the new paper arguments have been formalized.
They have not.

The earlier rank-one campaign certified a complete new box-8150 bound
`0.713417810549848`, with `1.970634269349579e-6` net gain beyond simply
refining the old partition. That is a local result. The remaining cover and
the whole-row cap at box 8168 still prevent claiming a new lower endpoint.

At the current cubic witness, further certification is a credible route to a
small numerical improvement, limited by the fixed-witness obstruction above.
The rigorous dimension-uniform cubic-family ceiling `1.4022581233` leaves at
least 80.6% of the current interval beyond this architecture; attainability is
not proved. The already proved response obstructions for
the stated higher-degree witness architecture give degree-five and
degree-seven ceilings below `1.4036705` and `1.4044895`, respectively. Degree
seven may still reach `1.404`; approaching `1/gamma†` within that architecture
requires degree nine or higher. Those qualifications matter.

The proposed new cubic parameter `1891/2500` needs its own full-domain
certificate. Data at `149/200` cannot be transferred to it by changing a
number in the endpoint arithmetic.

## New upper-side results

### 1. A global bilinear one-coordinate theorem

For arbitrary complex disk-valued charge-one F,G of one proper complex
Gaussian, let `Gamma=sum (-1)^k P_(k+1,k)`. We prove

\[
|\langle F,\Gamma G\rangle|\le\gamma^\dagger,
\qquad \gamma^\dagger=0.7119586597782638015\ldots.
\]

This replaces the older random-start evidence with a global two-map argument.
It permits different responses and complex radial phases.

Writing `F(z)=phase(z)f(|z|)`, normalize the radial Hankel kernel by the
strictly positive phase potential V. The resulting selfadjoint compact
operator Q satisfies `Q sqrt(V)=sqrt(V)`. Directed rectangle integration with
an analytic infinite-tail bound gives `||Q||_HS²<7/4`. An independent root
replay at 160 bits and mesh `1/50` gave an upper bound
`1.593778738010`. Thus the orthogonal complement of the known eigenvector
has norm below `7/8`; the whole operator has norm one. The disk constraint
gives the desired bilinear bound. No finite chaos cutoff or optimizer is
trusted.

Proof: `upper/BILINEAR_HANKEL_OBSTRUCTION.md` in the accompanying research
directory. Checker: `tools/fresh_upper_hankel_certificate.py`.

### 2. A strict score gap for one ordinary coordinate

Perturb just one admissible coefficient multiplier:

\[
\lambda_k=(-1)^k\quad(k\ne2),\qquad\lambda_2=199/200.
\]

The normalized fifth-degree projection is rank one. A two-by-two Schur
estimate against the spectral gap of Q proves

\[
D\le\gamma^\dagger-{3\pi\over102400}
=0.7118666209309906630\ldots.
\]

This covers probability mixtures and scalar linear Gaussian OU contractions
of one-coordinate responses. It does not cover arbitrary nonlinear
correlation preprocessing. In particular, this raw-score gap does not
contradict the familiar success of preprocessing phase rounding.

The reciprocal of this restricted ceiling is **not** a global lower bound
for the Grothendieck constant. Treating it as an all-dimensional oracle would
be precisely the wrong inference.

Proof: `ONE_COORDINATE_GAP.md`; checker:
`tools/fresh_one_coordinate_gap.py`.

### 3. Arbitrarily many neutral drivers still leave a strict gap

Let z be proper complex Gaussian and V any finite or countable independent
ordinary real Gaussian family, independent of z. Suppose both responses obey

\[
F(e^{i\theta}z,V)=e^{i\theta}F(z,V),\qquad
F(z,-V)=F(z,V),
\]

and likewise for G. All underlying ordinary coordinates have correlation t.
Then the displayed ceiling `D<(0.711908822672080)` holds, uniformly in the
number of auxiliaries. Arbitrary joint dependence on `|z|` and V is allowed.

For example, any measurable response through a vector Q(V) of joint quadratic
Gaussian forms is included when it has the stated charge. The quadratic
components may share every auxiliary coordinate, and need not have Gaussian
laws. Radial coupling through Q(|z|,V) is also allowed if the two symmetries
survive. Generic charged couplings such as `phase(z+aW)` fail separate
charge one in z and remain outside the theorem.

There is also a graded limit version: replace V by arbitrary independent real
neutral Gaussians Y of physical correlation `t²`, with arbitrary Y dependence
and charge one in z alone. No Y-evenness is needed in that version.

Here is why the finite quadratic extension is valid. Global V-evenness leaves
only Hermite degrees `2j`; their physical weight is `t^(2j)`. Reindexing by j
gives exactly the same radial operator blocks as degree-j neutral Gaussians
of correlation `t²`. The sign operator on the even V degrees is an auxiliary
spectral unitary, **not** pointwise V-reflection. The argument only needs its
orthogonal block decomposition.

Take `epsilon=1/1000`, `s=1/500`, `q=1-epsilon`, and use multipliers
`lambda0=1`, `lambda2=199/200`, with all other nonzero indices
`lambda_n=q*(-1)^n`. After radial normalization the blocks are

\[
T_0=qQ+\epsilon u_0u_0^*-2s u_2u_2^*,\quad
T_1=-qQ-2s u_1u_1^*,\quad
T_2=qQ-2s u_0u_0^*,
\]

and `T_j=q*(-1)^j Q` for every `j>=3`. The spaces' multiplicities can grow
without changing these norm bounds. Directed radial estimates establish
`||u0||²<2`, `||u1||²<2`, `||u2||²<1`. Two-by-two envelopes then give

\[
\|T_0\|<0.999924620669,\quad
\|T_1\|<0.999586388548,\quad
\sup_{j\ge2}\|T_j\|\le0.999.
\]

Consequently the common rational norm cap `99993/100000` applies to the
entire infinite direct sum. The root replay used 192-bit Arb arithmetic and
mesh `1/1200`; two other meshes also passed.

The ceiling survives mixtures and separate linear Gaussian contractions that
preserve the class. It does not assert full complex equivariance merely from
V-evenness: the larger real-t class is bounded, hence so is its valid complex
subset. Nonlinear final correlation preprocessing, symmetry-breaking charged
responses and arbitrary driver processes without this Gaussian representation
remain outside it.

Proof and full scope: `upper/neutral/NEUTRAL_GAUSSIAN_OBSTRUCTION.md`.
Checker: `tools/fresh_upper_neutral_certificate.py`.

### 4. Actual asymmetric quadratic-phase responses

For proper two-coordinate Gaussian inputs we implemented

\[
F(X)=\operatorname{phase}(uX)e^{iX^*HX},\qquad
G(Y)=\operatorname{phase}(vY)e^{iY^*KY},
\]

with independent complex u,v and Hermitian H,K. Gaussian quadratic tilting
reduces the kernel to a determinant, a projected tilted covariance and a
Gauss hypergeometric function. This retains an analytic kernel instead of
estimating coefficients by samples. Scalar phase and radial chirp formulas,
parity and pair symmetries calibrate to approximately `1e-15`; independent
Monte Carlo checks agree within about one RMS standard error. These are
validation checks, not interval certificates.

The initial 19 grade-(1,3) proposals all had negative price against a frozen
557-column pool dual. None entered its optimized mixture, even with their
new tails left unpaid. A subsequent bounded free-asymmetry pricing run found
a positive reduced price `7.9700549e-7`. Reoptimizing the pool improved its
optimistic score by only `1.8583748e-7`, to `0.7118919138795405`; the new
column has weight about `0.23467655`.

The optimized parameters returned almost to a reflected pair:
`a≈b≈0.32418576`, `h≈-k≈-0.00358092`. This bounded test supplies no
evidence that freeing the two maps is itself the missing mechanism. It does
not prove that the asymmetric family has been exhausted.

This pool remains well below the incumbent. New infinite tails are unpaid;
all of these scores are discovery diagnostics, and no endpoint follows.
Cross-radius coefficient drift for the priced proposal was below `6.71e-13`.

Engine and experiment notes: `upper/quadratic/README.md`; tools
`fresh_upper_quadratic_kernel.py`, `fresh_pool_asymmetric.py`,
`fresh_price_quadratic.py`, `fresh_replay_priced_pool.py`.

A further bounded test changed the charged auxiliary's physical grade to
five or seven, with two seeds and 300 evaluations per seed. A grade-seven
proposal had positive old-dual reduced price `1.2083694e-5`, but the common
pool gained only another `7.2432527e-8`, reaching `0.7118919863120672` with
grade-seven weight about `0.00696196`. The grade-five proposals had negative
price. The nearly reflected winning parameters again point to a grading/chirp
effect rather than a demonstrated asymmetry advantage. These are bounded
discovery tests with unpaid tails, not a family-optimality theorem. See
`barriers/HIGHER_GRADE_PRICING.md`.

### 5. Pricing against the actual incumbent

We then removed the weak-pool limitation. A new Arb exporter reads the exact
Lean preprocessors and all 21,168 stored dyadic energies, computes the 251
combined coefficients through degree 501, and exports a 129-coefficient head
through degree 257. Its conditional tax, less than `1.102399506610e-6`,
includes the inherited comparison, energy error, actual Hardy tail, omitted
stored head and binary64 midpoint error exactly once. It reproduces the
current conditional score. This does not discharge DirectHyps.

An independent standard-library checker builds physical t-polynomials with
exact fractions, rather than using the exporter's folded variable. Its first
nine odd coefficients, even-zero checks, negative-channel sign control and
independent reconstruction of the complete tax all pass.

The LP needed numerical repair: its default formulation dropped tiny
incumbent residual coefficients. An equivalent bounded-multiplier dual,
centered objective and scaling solved this. Scales `1e6`, `1e8` and a separate
per-row normalization agree; direct primal scores and maximum column prices
bracket the saved optimum to about `1e-15` in floating arithmetic.

With the incumbent and all 557 old columns included, the first 24 fresh
proposals receive zero weight. Their best reduced price is below `-9.98e-7`.
Two further bounded pricing campaigns against this actual-incumbent dual find
positive prices, including a grade-seven proposal with reduced price about
`0.00655`. Reoptimization shrinks that apparent promise to an optimistic gain
of only `2.1088e-11`, with grade-seven weight `9.35e-9`. Its individual
degree-257 head score is only about `0.22512`; a large price at one dual is
not a competitive standalone rounding. New tails are still unpaid at this
stage.

The total optimistic pool score is `0.7119471537322748`, only about `4.19e-10`
above the extracted incumbent-only score, including old-column polishing.
These floating LP quantities are diagnostics, not a new endpoint. The useful
deliverable is now a portable incumbent-aware pricing path with an explicit
conditional error budget. See `upper/incumbent/INCUMBENT_POOL.md`,
`INDEPENDENT_AUDIT.md`, and `pool/incumbent-priced-pool.json`.

We also tested a concrete tail budget. For each actual response pair, the
orthogonal-chaos Cauchy–Schwarz inequality gives

\[
\sum_{n>N}|c_n|\le
 \sqrt{\left(1-\sum_{n\le N}e_n(F)\right)
       \left(1-\sum_{n\le N}e_n(G)\right)},
\]

where the e_n are self-kernel energies and the responses have modulus one.
Computing both self-heads for all 26 new pairs gives estimated individual
tail charges from `0.00193610` to `0.00502950`. Their cross-radius energy-sum
drift is below `1.80e-11`. The previous optimistic mixture incurs estimated
tail cost `1.14e-8`, exceeding its advertised fresh gain. Reoptimizing with
these charges reduces the gain over
incumbent-plus-old to only `1.08e-12`, with one new weight about `1.11e-9`.
This is still discovery: the analytic inequality is valid, but the self-heads
are not interval-enclosed. Individual tail charges can also overpay a
whole-mixture cancellation. The experiment nevertheless explains why the
large grade-seven dual price did not become useful progress. See
`pool/parseval-pool.json` and `tools/fresh_parseval_pool.py`.

## New lower-side results

### 1. Why excluding the old atomic laws was misleading

For a genuine Gaussian bidegree-(2,1) cubic q, put `U=|q|²` and
`X=sqrt(2) Re(q)`. Then

\[
E X^{2r}={\binom{2r}{r}\over2^r}E U^r,\qquad E X^{2r+1}=0.
\]

The scalar spectral matrices

\[
M_k[i,j]=\left(k-{ij\over i+j-1}\right)E X^{i+j},
\quad 0\le i,j\le k,
\]

must be PSD, with the zero-moment conventions specified in the proof. This
follows directly from the number-operator bound on polynomials in a cubic;
it belongs to the known AMMP framework, not a newly invented principle.
[Azmoodeh–Malicet–Mijoule–Poly](https://arxiv.org/abs/1305.6579).

The four archived artificial laws first fail at k=4,5,6,6. That initially
looked promising. Reoptimization produced seven rational repairs passing
all 671 inherited cuts, the old moment assumptions and all ten parity blocks
through k=6. Their exact scores, computed from the same stored source tables
at epsilon `149/200`, still exceed `500/701`. The radius-16 losses
are only about `1.7e-10` to `6.5e-8`. At radius 128, one law uses mass about
`1.17e-17` and loses only `1.04e-9` in the objective.

All seven laws passed a separate exact root replay. Their later k=7 or k=9
failures are retained in the ledger: these are countermodels to the stated
finite relaxation, not actual cubic responses. Imposing the one-coordinate
H21 benchmark ceiling inequalities through E U^6 also leaves them feasible. We do not claim
to have proved those benchmarks universal sharp upper bounds.

Conclusion: test any new scalar cut family against reoptimized tail repairs
before building a global cover around it.

### 2. An infinite extension theorem explains the weakness

Let `m_r=E U^r`, `m0=1`, `m1>0`, without upper moment-growth restrictions.
There exists an actual nonnegative radial law satisfying **every** scalar
matrix `M_k PSD`, with prescribed first three moments, if and only if

\[
m_2\ge2m_1^2,\qquad m_3\ge{3m_2^2\over2m_1}.
\]

Necessity comes from M2 and M3. For sufficiency at k>=4, the leading block of M_k is
`M_(k-1)+H_X`, strictly positive because the ordinary real moment Hankel H_X
is positive definite. The only new moment m_k appears in the last diagonal
with positive coefficient. Choose it above that Schur threshold and the one
new Stieltjes Hankel threshold. Induction gives a consistent infinite
sequence; the one-dimensional Stieltjes moment theorem supplies a measure.

For the Gaussian prefix `(1,1,2,6)`, the next moment may be 25 rather than
the exponential value 24. An exact construction through degree ten is

`(1,1,2,6,25,136,908,7084,62517,611791,6558924)`.

This demonstrates that the scalar matrices alone do not encode genuine
Gaussian-chaos fourth-moment rigidity. The theorem does not preserve upper
moment bounds, the old 671 cuts, conditional contraction fields or the table
objective. It does not refute a richer charge-resolved spectral hierarchy.

Proof: `barriers/MOMENT_EXTENSION.md`; exact checker:
`tools/fresh_barrier_moment_extension.py`. The one-dimensional moment
criterion is recalled in §2 of
[Schmüdgen](https://doi.org/10.1007/s00013-021-01599-9).

### 3. The full Hessian is stronger, but has a genuine flat sector

At an exact maximizing pair for `T=P-epsilon Q` (hence a mutual best response), put
`f=phase(Tg)`, `g=phase(Tf)`, `a=|Tg|`, `b=|Tf|`. The full phase Hessian is

\[
\mathcal H(A,B)=E[aA^2]+E[bB^2]
 -2\operatorname{Re}\langle fA,T(gB)\rangle.
\]

For fixed finite-dimensional images, realifying the first/cubic basis gives
feature Gram matrices `R_f(eta)=E[v_f v_f^T/(a+eta)]` and R_g.
Replacing a,b by `a+eta,b+eta`, positivity for every real tangent is equivalent
to `||R_f^(1/2) Lambda R_g^(1/2)||<=1`. This retains the signed cubic cross
block and does not grant missing projections a free completion. Its dimension
still grows as `O(n³)`; a dimension-free global image theorem is missing.

At the diffuse contact, an independent proper unit cubic direction q gives
regularized tangents `A=Im(conj(f)q)/(a+eta)` and
`B=-Im(conj(g)q)/(b+eta)`. Their smaller
Hessian-block eigenvalue obeys the exact identity

\[
\kappa_\eta={R_0\over2}\operatorname{Var}_\mu
 \left({a\over a+\eta}\right)\ge0,
\qquad R_0={2\over\epsilon},\quad d\mu={dP\over aR_0}.
\]

It tends to zero as eta decreases to zero. The limiting unregularized
tangents need not belong to ordinary L2; the proof uses the regularized
family and its limit. Thus even the full Hessian has arbitrarily many
independent-cubic approximate flat directions at the contact. A uniform
strict Hessian margin there cannot be the missing argument.

Sampled reciprocal-score features misleadingly suggested a negative diffuse
mode. Analytically conditioning the unused Wick coordinates, followed by
image-centered polar quadrature, gave converged positive discovery margins:
`5.6711818e-5` and `5.6712044e-5` at the two finest rules for the pure diffuse
graded fixture and tested eta=.01 score matrix. The finest Gaussian
normalization residual was about `3.6e-14`; the reciprocal-modulus
stationarity residual was about `1e-13`. These residuals are not quadrature
error bounds. The converged values do not certify all actual cubic states,
all eta, or interval eigenvalue bounds. The variance identity, rather than
quadrature, proves positivity on the independent-cubic subspace.

Proof and limitations: `lower/FULL_HESSIAN_AND_FLAT_SECTOR.md`. The exact
standard-library checker verifies the algebra and conditional Wick identities.

## What the literature changes

The September complex-bound paper still states
`1.4<K_G^C<1.404898554746`; the project has stronger conditional endpoints,
with the remaining hypotheses explicitly visible.
[Heilman–Jones–Malavolta](https://arxiv.org/abs/2609.25462).

The October Gaussian-approximation paper is relevant to the diffuse branch:
its Theorem 1.1 gives an asymptotically optimal scale determined by complex
third moments, fourth defect and covariance mismatch. For normalized circular
charge-one cubics, the third moments vanish, so the scale is the fourth
defect `x²`, rather than merely its square root x. This supports a sharper
local strategy. It does not provide ready-to-spend explicit finite constants
or a threshold for the project's small numerical budget; that extraction
remains work.
[Chen–Chen–Liu](https://arxiv.org/html/2610.04532v1).

The real-field primal/dual paper and real Krivine optimality results are
valuable methodological references; their field distinction must remain
visible. None resolves the present complex joint-image certificate.
[Primal/Dual Method](https://arxiv.org/html/2610.10477v1),
[Naor–Regev](https://arxiv.org/abs/1205.6415).

The supplied books and Pisier survey remain foundations for the Gaussian
chaos, factorization and transfer framework. They do not supply the missing
joint realizability inequality merely by translating the notation. This
campaign builds on the earlier attachment/repository reading; it does not
claim a fresh line-by-line verification of every book or archived source.

## Revised execution priorities

1. **Secure the current endpoints separately from searching for new ones.**
   Continue the source/law/box rank-one certificate over the full same-epsilon
   cover; retain PAD and whole-row caps. Close the remaining node caps and
   concrete upper `compare`, `energy_close`, `hardy` inputs through their
   actual interfaces. A local cap gain is not an endpoint.

2. **Keep finite-amplitude and two-sided image consistency before fibre
   elimination.** The full Hessian supplies a precise necessary condition,
   but its flat sector must be retained as equality. Conditional contraction
   and tail estimates tied to the same cubic tensor are more promising than
   more unrestricted scalar matrices. The older local-stability and
   two-slice work already addresses parts of this; it should be integrated,
   not silently rediscovered as a new theorem.

3. **Use charged auxiliary response families and signed mixture pricing.**
   The neutral obstruction identifies exact symmetries that a raw-kernel
   candidate must evade. The new analytic engine supports independent maps,
   different odd grades and branch checks. Price full coefficient heads,
   reoptimize common mixtures, then pay the infinite tail and interval
   errors. The actual-incumbent pool is now available for this work; the old
   557-column dual alone is an inadequate screen. A better alternating W
   alone is insufficient.

4. **Plan higher-degree lower witnesses around a reusable image certificate.**
   Cubic refinement can deliver useful incremental progress, but it cannot
   account for most of the interval. A degree-five/seven/nine program needs
   a common realizability mechanism, not a larger version of the same scalar
   relaxation. The existing architecture ceilings supply useful stop rules.

The concrete deliverables are the new operator proofs, exact repaired laws,
moment-extension theorem, full-Hessian reduction and analytic response engine.
They narrow the live search space substantially. They do not change the global
Grothendieck endpoints or prove the conjectured value.

## Replay and provenance

The portable archive contains `tools/`, the fresh research directory with
proof notes and results, this assessment, a SHA-256 manifest and a replay
guide. Fraction-based proof checkers and the one-coordinate gap checker
refuse Python `-O/-OO`. The Hankel, neutral and incumbent Arb checkers use
explicit exceptions and were also replayed under `-O`.

The new proofs are written mathematics plus exact or directed external
checks. Optimizer and quadrature outputs are labeled discovery. The frozen
finite-law and response-fixture dependencies carry provenance hashes, so
replay does not rely on the concurrently edited original checkout. No source
or research artifact in the original shared checkout was edited in this campaign.
