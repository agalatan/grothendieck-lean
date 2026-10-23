# Research attack plan — 23 October 2026

Integration baseline: GitHub master `9c08e96`. The initial research baseline
was `98f61ec`; the bounds are unchanged. This is a research proposal, not a new bound,
a new theorem, or a claim that the proposed finite relaxation is complete.

Current execution is isolated in
`/Users/alingalatan/workspaces/grothe-codex-joint-image`, branch
`codex/joint-image-compatibility-20261023`. The main checkout is not a working
directory for this attack. Historical main-checkout paths below record prior
provenance; do not execute their build/edit commands there.

The next completed stage is recorded in
[/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/SYMMETRIC_RESPONSE_REPLICAS_2026-10-23.md](/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/SYMMETRIC_RESPONSE_REPLICAS_2026-10-23.md).
The five-mode invariant image closure and fixed-size original-noise replica
law are now proved on paper. Eleven supporting algebra/series results compile
in Lean. A finite noise-price LP screens an entire omitted coefficient tail,
and its prices define admissible all-level witness multipliers. One complete
feedback round was run on the droplet: price the actual response pool, attack
the induced witness, and return independently evaluated response kernels.

Fresh stopping result: the first nine-column price witness has global norm
greater than `0.7169`, proved by a graded-Gaussian limit and an exact rational
series replay. Its apparent strength against the finite pool was not global.
The defeating baseline is the classical kernel `H((3*rho-rho^3)/4)`. Before
another expensive search, test candidate prices against the parametric
graded-Gaussian cubic-preprocessor family. Preserve the incumbent through
its actual coefficient-residual enclosure. No new endpoint is established.

Execution update: step 1 is recorded in
[/Users/alingalatan/workspaces/grothe/docs/BINDING_AUDIT_2026-10-23.md](/Users/alingalatan/workspaces/grothe/docs/BINDING_AUDIT_2026-10-23.md).
All committed batches and 8,756 boxes were reconstructed. Four exact finite
table-and-cut countermodels and the discarded joint variables are supplied.
Step 2 is recorded in
[/Users/alingalatan/workspaces/grothe/docs/JOINT_RESPONSE_LIFT_2026-10-23.md](/Users/alingalatan/workspaces/grothe/docs/JOINT_RESPONSE_LIFT_2026-10-23.md).
It supplies a shared residual Gram interval, an image-determined near-maximizer
lift with an explicit dimension-free error, and an exact 3-by-3 complex SDP
for the local quadratic support, with rational dual-price verification.
The tested completion family does not separate the obstruction;
its surviving Gram matrices are saved. Common-row savings are only about
`0.0000003` to `0.0000024` on the four audited laws. The next target is the
two-sided polynomial image map with its remote first-chaos coefficients retained,
not more clipping or a finer radial mesh. Neither endpoint has changed.

Fresh reassessment: [the common-kernel and frozen-table audit](COMMON_STEIN_REASSESSMENT_2026-10-23.md) now excludes all four old atomic laws with merges of inherited tests, but law reoptimization largely restores their scores. More decisively, a genuine finite cubic gives a directed floor above `0.71335` for every convex mixture of all nineteen frozen tables at an admissible state. Thus radial constraints alone cannot finish that fixed-table architecture. The next global attack must change the profiles or retain the actual response relation and joint polynomial image fields. This floor is for stored upper tables, not the witness norm.

## Decision

The next stage is complete: a common signed-tail spectral budget replaces the
independent residual relaxation, and an exact degree-seven separator proves
that the full Gaussian-phase cubic-preprocessor family, with arbitrary complex
phases and convex mixtures, has score at most `0.71186`. It cannot beat the
incumbent `0.711947153313208982`. Leave that architecture rather than optimize
its scalar parameters again. This does not exclude general finite cubic phases.
The common-tail screen of the updated twelve-column pool is `0.711605880` at
midpoints; its error-dependent bounds are still conditional on unproved
integral enclosures. The richer graded-image oracle defeats the separator
itself, so the separator is not a useful universal lower witness.
See [/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/CUBIC_PHASE_SEPARATOR_2026-10-23.md](/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/CUBIC_PHASE_SEPARATOR_2026-10-23.md).

The primary target is a **global certificate for joint response feasibility**.
Use the original bounded response pair, its mutual best-response conditions,
and the negative projection terms together. Test the full response-weighted
matrix constraints before spending time on another tensor region or a finer
radial certificate.

The first numerical question is precise: **can the additional joint information
separate the configurations that bind the present relaxation, with enough gain
left after every error and penalty is paid?** A positive answer warrants a
global analytic argument and certification. A negative answer must produce an
explicit surviving configuration and identify which joint observable is missing.

The upper construction and lower witness must use the same actual-response
library. A new adversary enters the upper search with its full signed coefficient
sequence and a tail allowance. A fictitious law admitted by a relaxation does not.

## 1. Baseline and quantitative objectives

The sharp results currently reported by master are

\[
 1.401695322458<K_G^{\mathbb C}<1.404598635371.
\]

The interval width is `0.002903312913`. Both sharp bounds have the numerical
input hypotheses documented in the repository. The separate fully formal upper
bound is \(K_G^{\mathbb C}\le1.40578\).

The current lower witness is \(P_{1,0}-(149/200)P_{2,1}\), with cap
\(B_0=0.7134218\). The default target retains `NodeCaps`, the numerical caps
for the 19 fibre potentials. Master now formalizes the majorant/integration
checkers and the route `lower_bound_of_capsRest` in the separate heavy target
`GrotheCaps`. That route retains only the localized central rows after the
range checks have actually run and been recorded. No verification stamp exists
at this integration baseline. Completing this work closes a formalization gap;
it does not change the numerical cap, and this branch leaves all cap sources unchanged.

The current upper certificate has the exact reciprocal denominator

\[
 A_0=\frac{355973576656604491}{500000000000000000}
     =0.711947153313208982.
\]

Master's upper theorem `Grothe.UpperChaos.fresh_upper_rounder` now constructs
the rounding and derives its Hermite, Mehler, charge and boundedness properties
inside Lean, including the phase cover. Only `compare`, `energy_close` and
`hardy` remain numerical inputs. The generic `DirectHyps` interface still
exists, but its structural fields are not additional hypotheses of the
concrete theorem. This removes duplicated formalization work from the attack.

An upper improvement needs an admissible rounding with a **certified full score
strictly larger than \(A_0\)**. A lower improvement needs a globally valid witness
cap with a strictly better reciprocal. These are different proof obligations.

For the near-term lower target, freeze the proposed witness
\(T=P_{1,0}-(1891/2500)P_{2,1}\) and aim for

\[
 N(T)\le0.713260<\frac{500}{701}
       =0.713266761768901569\ldots.
\]

This would give \(K_G^{\mathbb C}\ge1/0.713260>1.402\). It is a target, not
an available cap. Changing the witness requires revalidating the entire row
cover, including the flanks; the master cap at `149/200` cannot be inherited at
`1891/2500`. The numerical difference between the current master cap and
`500/701`, about `0.0001550382311`, indicates the scale of the problem, not a
transferable error budget between these two witnesses.

The larger objective requires higher-degree witnesses. The numerical cubic
ceiling near `1.402258` would remove only about 19.38% of the current interval.
That ceiling is exploratory evidence. The manuscript also has proved degree-five
and degree-seven barriers. Accordingly, retain degrees 9 and 13 as discovery
tests; do not assume a longer alternating multiplier is an improvement.

## 2. Diagnosis: the missing constraint is joint realizability

Write \(P_k=P_{k+1,k}\), and let \(c_k\) be the real mixed coefficients of an
actual response mixture. The manuscript's complex duality states

\[
 \frac1{K_G^{\mathbb C}}
 =\sup_{c\in\mathcal C}\left(c_0-\sum_{k\ge1}|c_k|\right)
 =\inf_{\lambda_0=1,\ |\lambda_k|\le1}N(\lambda).
\]

There is no intrinsic duality gap. There are two approximation errors: the lower
proof allows joint data that may not be realizable, while the upper search has
only a restricted collection of realizable responses. For any candidate pair,

\[
 N(\lambda)-D(c)
 =N(\lambda)-\langle\lambda,c\rangle
  +\sum_{k\ge1}(|c_k|+\lambda_kc_k).
\]

The first term measures response optimality; the second measures failure to
cancel unwanted coefficients. Both must be measured. A large witness payoff
alone does not imply a useful rounding.

For the cubic witness, put \(h=(f+g)/2\), \(k=(f-g)/2\). The exact objective is

\[
 J=\|Ph\|^2-\varepsilon\|Qh\|^2
              -\|Pk\|^2+\varepsilon\|Qk\|^2.
\]

The disk constraints are \(|h\pm k|\le1\). For unimodular responses they imply
\(|h|^2+|k|^2=1\) and \(\Re(h\bar k)=0\). Neither the negative squares nor the
joint disk geometry may be replaced by independently optimized marginal bounds.

Four findings constrain the next attempt:

1. The independent-cubic theorem and Gaussian local stability leave finite
   coupled perturbations uncontrolled. Extending another independent class
   does not establish the global inequality.
2. The influential family \(X_1(\|X\|^2-N-1)/\sqrt{N+1}\) defeats a fixed
   coordinate core. Its limit contains a shared linear driver times a real
   grade-two Gaussian. Conditional mean zero is insufficient for independence.
3. Some cubic phases have slow individual energy tails. This does not rule out
   rapid decay of the **signed mixed tail** of a mixture.
4. Existing rotation cuts and the scalar unused-direction stability test have
   already been audited. The scalar test is inactive at a recorded binding
   configuration; attaching it after the fibre supremum loses the variables
   it would constrain. Repeating that calculation is not the next target.

## 3. Primary mathematical target: a joint feasibility separator

The existing exact joint-defect identity is the starting certificate, not a new
conjectured comparison with an independent Gaussian. It expresses the objective
as a quadratic cap minus the joint support defect, projection matching errors,
and a bounded-response support gap. Its rational hierarchy approximates the
joint defect accurately. What remains missing is a sufficiently large
**uniform** correction on every surviving response.

For fixed target tensor and affine trial family, the stronger exact-support dual
is convex. Its averaged moment mismatch and Gram matrix give certified descent.
Thus the obstacle is uniformity over coupled tensors, not local minima of that
fixed-tensor dual.

### 3.1 Retain the information needed for two-sided consistency

At a finite-dimensional maximizing pair, phase replacement gives

\[
 f=\operatorname{phase}(Tg),\qquad g=\operatorname{phase}(Tf)
\]

with arbitrary unimodular choices on the zero sets. This is substantially more
than saying that one response is the phase of a cubic: every finite cubic phase
can already occur as a one-sided best response.

Use finite phase perturbations and the response-weighted matrix condition
already proved on paper. For bounded real features \(A_i,B_j\), retain

\[
 D_f[i,j]=\mathbb E(|Tg|A_iA_j),\quad
 D_g[i,j]=\mathbb E(|Tf|B_iB_j),\quad
 C[i,j]=\Re\langle P(fA_i),P(gB_j)\rangle.
\]

The fresh second-chaos stability argument supplies, for a globally
\(\delta\)-near-maximizing pair and pointwise feature budgets at most \(K^2\),

\[
 \begin{pmatrix}D_f&\varepsilon C\\
                 \varepsilon C^{\mathsf T}&D_g\end{pmatrix}
 \succeq-10K^2\sqrt\delta\,I.
\]

This constraint is already in the manuscript. The proposed work is to preserve
it in the reduction and test its correlated blocks, rather than replace it by
the already tested scalar reciprocal-modulus inequality.

Start with clipped response-weighted scores in linear directions, their
visible radial modulations, and bounded approximations of shared quadratic
features. Record every clipping constant. The same feature must have the same
law, covariance and pseudocovariance wherever it occurs in the two branches.

Do not impose this near-maximizer constraint on arbitrary responses. Prefer the
existing finite-amplitude formulation: if \(C_j\) is the gain from an admissible
symmetrized response perturbation, then, for a fixed finite family with
nonnegative bounded-total prices,

\[
 M=\sup_{n,f,g}\left[J(f,g)-\sum_j\theta_j(C_j(f,g))_+\right],
 \qquad M=\sup_{n,f,g}J(f,g).
\]

The identity follows by approaching \(M\), since \(C_j\le M-J\). It makes the
proposed endpoint obligation explicit: upper-bound this penalized objective
**for all dimensions and all responses**. Its validity does not supply that
bound. If the Hessian form is used instead, retain the near-maximizer error and
pass to the limit along a globally maximizing sequence. Do not assume an
attained maximum over all dimensions.

### 3.2 Build a lifted potential before eliminating variables

Derive a new fibre majorant that retains the response-weighted moments entering
\(D_f,D_g,C\), together with the existing projection squares and joint support
defect. Its dual prices must be checked against a common Gram budget. This is
the principal technical step.

The required output is a theorem with one of two honest scopes:

- an inequality valid for every actual response; or
- an inequality for globally near-maximizing responses with an explicit error
  tending to zero uniformly in dimension.

The theorem must yield a finite checkable majorant on its stated parameter
domain. A PSD constraint on a fitted law without an extraction theorem from
actual Gaussian responses is insufficient. Optimize the fixed-tensor dual to
design the trials, but do not interchange a tensor supremum and trial infimum
without proof.

Spend each completion square once. In particular, a changed \(Qh\) trial cannot
also claim the full old \(Qh\) matching deficit. Likewise, alternative lower
bounds on the same joint defect are combined by a maximum, not by addition.

## 4. First experiment: a falsification gate

Run a small diagnostic campaign on the droplet before generating any large
certificate. Use the current binding configurations and their neighboring
parameter values, not only attractive examples far below the cap.

The benchmark set must include:

- the diffuse Gaussian-grade contact and its overlapping perturbations;
- the shared-driver Wick example versus its independent-driver counterpart;
- the influential linear-times-diffuse-quadratic family and its real Gaussian
  grade-two limit;
- mixed-square, two-slice and self-interacting cycle tensors;
- the actual response used in the known Laplace-comparison obstruction;
- the saved worst laws of the current moment/spectral relaxation.

For a relaxed worst law, the new joint observables may be absent. In that case
optimize over all their admissible completions. Choosing one convenient
completion and excluding it does not exclude the original worst law.

First batch: at most twelve selected configurations, with no more than two
feature enrichments before reassessment. These are discovery calculations.
Use independent evaluation grids, named response definitions, and calibration
against exact phase coefficients; an optimizer's reported tolerance is not an
integration error bound.

Record separately: the old cap, joint-defect correction, additional matrix or
finite-variation correction, lost gate price, regularization/clipping costs,
and evaluation uncertainty. A correction is useful only after subtracting all
its costs.

**Advance** if the lifted relaxation excludes the binding configurations by a
repeatable margin, retains all actual-response benchmarks, and has a plausible
dimension-free extraction proof. For the final design cap `0.713260`, reserve
at least the strict margin to `500/701`; initially budget no more than
`0.000003` for the total eventual enclosure and assembly error. This budget is
a design requirement, not an error bound already established.

**Stop this particular feature family** if it reduces to the old radial
constraints, remains inactive after both enrichments, spends more penalty than
it recovers, or requires an uncontrolled tensor rank. Save the surviving joint
configuration and missing observable. Do not respond by generating more knots
for the same ineffective inequality.

## 5. Use the same attack on the upper side

Keep the current certified rounding as an incumbent. The historical analytic
chirp pool is not a replacement: its recorded score near `0.711892` was already
below the present `0.711947153313208982`, even before all remaining tail costs.
An earlier phase-response pool also suffered inaccurate coefficients hidden by
stable witness payoffs.

For each new actual response pair, store the defining functions, original
complex bidegrees/grades, shared latent variables, signed coefficient vector,
coefficient error bounds, and a route to its complete tail. Allow asymmetric
response pairs and shared neutral quadratic factors; do not restrict the new
search to reflected copies of one chirp.

Solve one robust witness/mixture LP, initially testing degrees 3, 9 and 13. Use
degree 3 as a controlled comparison with the main lower target. Higher degrees
test whether the current witness architecture itself is limiting progress.
Enlarge the retained coefficient range only after checking that the full score,
rather than the low-degree payoff, is improving.

For a rational mixture with nominal coefficients \(\widehat c\), total head
error \(e\) and certified mixed tail \(\tau\), the accepted score is

\[
 L=\widehat c_0-\sum_{k=1}^{D}|\widehat c_k|-e-\tau.
\]

Only \(L>A_0\) improves the upper bound. Sum signed branch coefficients before
taking their absolute values. Use the analytic signed-tail method where its
zero-free and contour hypotheses hold. Otherwise pay a proved tail, including
any smoothing loss. An improved head without a competitive tail is a discovery
candidate, not an endpoint.

Use a provisional meaningful discovery gate of `0.00001` in the **full**
reciprocal score, beyond numerical uncertainty. Smaller certified gains remain
valid, but do not justify a large new research campaign by themselves.

When a new response defeats a lower trial, test it here immediately. When an
upper mixture leaves coherent uncancelled coefficients, use those signed
coefficients to propose the next lower multipliers. This is the operational
use of duality.

## 6. Globality: what regularity and the sphere can actually supply

Following the real primal/dual paper's references led to Jones's October
regularity paper. Its multivariate theorem supports joint polynomial features
with their original grades. Its approximation-size bound is nonconstructive;
the paper explicitly labels suggested quantitative recursions unverified.
Thus it does not provide a small numerical search dimension at our accuracy.

Use this structure to design tests, preserving a real neutral grade-two
Gaussian times a shared grade-one driver, proper or improper conditional
covariance, and the common primitives of both responses. A complex extension
must preserve charges as well as real polynomial degree. Realification alone
does not justify relabeling a neutral real fluctuation as proper complex noise.

If a finite feature reduction becomes necessary, prove an **objective-specific
joint remainder estimate**, with explicit constants and preserved projection
identities. An existential reduction, or a reduction of the cubic's marginal
law alone, cannot certify the cap. Modulus payoffs are Lipschitz; phase functions
are singular near zero. Transferring phase coefficients requires an additional
argument and cannot be inferred from stable modulus payoffs.

The spherical transfer remains a useful global interface and audit tool. It
does not yet supply a useful spherical norm cap. At `m=32`, truncation through
level 12 has a tiny cubic multiplier tail but rank
`796315556846635874048`. The finite-sphere outer relaxation also has its own
loss, separate from this tail.

Before investing in a spherical certificate, first check whether actual
spherical responses or the finite-order Grothendieck floor already exclude the
desired cap at the selected `m`. Then require an explicit symmetry reduction
whose block sizes are manageable. Average joint moment data under simultaneous
unitary action; do not assume maximizing functions themselves are invariant.

The operator is compact but not Hilbert–Schmidt. This excludes the proposed
square-integrable-kernel shortcut for this operator; it does **not** exclude
every kernel inequality, invariant moment method or SOS certificate. Direct
harmonic enumeration is not the primary attack.

## 7. Certificate and formalization sequence

1. Freeze the witness, feature definitions, admissibility domain, loss ledger,
   and the exact all-dimensions theorem to be proved.
2. Pass the diagnostic gate. Preserve failed tests and surviving configurations.
3. Prove the new joint inequality and its dimension-free reduction on paper.
   A new family theorem without an exhaustive complement remains regional.
4. Rationalize successful trials. Recompute every required integral and
   infinite tail with directed enclosures. Rebuild a complete cover at the
   chosen witness; reuse old cells only where their hypotheses still hold.
5. Connect the analytic theorem and finite checker in Lean, using the existing
   transfer. Maintain an explicit ledger of any remaining external inputs.
6. Run the appropriate isolated replay, negative tests for the checker, the
   affected Lean builds, then the full build and axiom audit before changing
   a headline bound.

Keep closure of the existing `NodeCaps` proof as a separate formalization
task. On the upper side, improving the external comparison estimate may give
a useful small gain: it accounts for 88.71% of the current residual allowance.
Neither task substitutes for the joint-geometry target or establishes a new
rounding family.

The common reporting interface is a feasible witness with a certified global
cap \(B\), and a feasible actual mixture with certified full score \(L>0\):

\[
 1/B\le K_G^{\mathbb C}\le1/L.
\]

Equivalently, for a common finite-pool value \(v_D\), a global oracle error
\(\delta\) and a mixed tail \(\tau\), the reciprocal interval is
\([v_D-\tau,v_D+\delta]\). Its width is \(\delta+\tau\), before additional
coefficient enclosure and rounding allowances. Pool agreement supplies neither
error automatically.

## 8. Immediate work order

**First:** reconstruct the binding configurations with the joint variables
still present; specify the smallest response-weighted matrix feature set and
the required changes to the fibre potential. Produce the extraction statement
and a loss budget before running it.

**Second:** run the bounded diagnostic batch on the droplet. Decide whether the
full matrix/finite-variation information separates the current obstruction.

**Third:** if it does, develop the uniform lifted certificate. Feed every actual
new adversary into the incumbent upper pool at the same time. If it does not,
document the precise survivor and test the next approach against that survivor,
rather than return to isolated moment or concentration improvements.

The first deliverable is therefore a validated separating inequality or an
explicit obstruction to this feature family. A numerical endpoint is claimed
only after the global cap or full rounding score has been certified.

## Sources checked for this reassessment

The baseline was checked in the README and the actual lower and upper Lean
interfaces. The focused reread covered the common-pool audit, the previous
stationarity cuts, the exact joint defect/descent, the original-response target,
witness ceilings, and the spherical transfer. This is not a claim to have
line-audited every manuscript module again in this planning pass.

- [Repository state](/Users/alingalatan/workspaces/grothe/README.md).
- [Lower theorem and NodeCaps](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/Reduction.lean).
- [Upper theorem and numerical inputs](/Users/alingalatan/workspaces/grothe/Grothe/Upper/PolynomialBridge.lean).
- [Common duality, signed tails and pool calibration audit](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch17-crossbound.tex).
- [Witness ceilings and their status](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch4-ceilings.tex).
- [Finite variation and response-weighted matrix constraints](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch37-gpt-response-stability.tex).
- [Previously tested inactive cuts and gate accounting](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch38-near-maximizer-cuts.tex).
- [Exact joint support defect](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch25-parts/87-joint-response-defect.tex).
- [Convex joint dual and certified descent](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch25-parts/88-joint-dual-descent.tex).
- [Original-response target and all-dimensions obligation](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/lower-bound/obstruction-1402.tex).
- [Spherical bridge, truncation and obstructions](/Users/alingalatan/workspaces/grothe/docs/SPHERICAL_TRANSFER.md).
- [Heilman–Jones–Malavolta, Primal/Dual Method, Sections 2–3](https://arxiv.org/html/2610.10477v1): real-case exchange and graded joint compactification; its heuristic oracle does not certify a global norm. The complex duality used above is the manuscript's argument.
- [Jones, Regularity lemma, Theorems 3.8–3.9 and following remark](https://arxiv.org/html/2610.16180v1): multivariate graded structure and nonconstructive general size bound. No unverified rate is used here.
- [Herry–Malicet–Poly, Limit distributions for polynomials](https://arxiv.org/html/2412.06749v1): joint polynomial-limit framework; not a quantitative original-response inequality at our target accuracy.
- [Designolle–Vértesi–Pokutta, Better bounds on finite-order Grothendieck constants](https://arxiv.org/html/2409.03739v3): construction versus global scalar certification, and applicability of the computational framework to complex problems; its reported constants are not imported.
