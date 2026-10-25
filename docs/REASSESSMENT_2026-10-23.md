# What would substantially move the complex Grothendieck bounds?

23 October 2026. Research baseline: `98f61ec`; the theorem-status audit below
is synchronized with the integrated development. The original binding-audit
inputs were preserved separately.
No other chat, transcript or chat database was accessed.

The main diagnosis is that the two sides optimize the same attainable set of
bounded-response correlations, but their practical obstructions are different.
The lower proof uses an outer relaxation that loses response and degree
compatibility. The upper construction uses a narrow inner family whose full
signed coefficients have to cancel. Exact duality connects these problems;
it does not say that fixing either relaxation will automatically fix the other.

The most important quantitative fact is that the cubic witness has far too
little demonstrated room to close most of the interval. Improving its
certificate is a useful controlled problem, not the whole research strategy.

## 1. Current statements, their status, and apparent discrepancies

I distinguish: **analytic** (an arbitrary-dimensional argument on paper),
**exact certificate** (a finite rational/interval computation under its analytic
interpretation), **Lean** (the stated implication is formalized),
**conditional** (some inputs remain hypotheses), and **numerical** (search or
ordinary quadrature without a rigorous error enclosure). These labels can
apply simultaneously; an exact checksum is not an analytic theorem.

The current main-development interval is

\[
1.401697049825<K_G^{\mathbb C}<1.404598158416.
\]

More precisely:

- **Lower:** `B=0.713420953220=35671047661/50000000000`. The current
  implication `NodeCaps → IsGrothendieckBound K → 1.401697049825<K`
  ends in `Grothe/Research/RefinedCoverResult.lean`. The 10,521-box cover
  uses the original source bank and two unshifted row-14 law nodes.
  Gaussian-to-finite transfer, the original witness, its vector value,
  row reduction and circular-cubic tensor/Stein budgets are formalized.
  `NodeCaps` still concerns the actual nineteen fibre potentials. The
  separate `GrotheCaps` route retains `CapsRest` for rows 12–15; its other
  60 range facts have a recorded droplet verification stamp. Those heavy
  facts are separate from the default CI build.
- **Upper:** `Grothe.UpperChaos.fresh_upper_rounder` formally gives
  `K≤500000000000000000/355973697533655491=1.404598570778625…`, conditional
  on an L² charge-one truncation `X` and the numerical bounds `compare`,
  `energy_close` and `hardy`. The concrete rounding, Gaussian Hermite
  completeness/Parseval/Mehler, charge selection, actual-rounding validity
  and energy summability are formalized, as are kernel transfer, tensor
  preprocessing, the interval evaluator, head assembly and endpoint
  arithmetic. The three numerical bounds involve external analysis and
  numerical enclosures. The older `Grothe.fresh_upper` table interface
  conditional on `DirectHyps E EX` remains available.
- **Unconditional formal upper:** `Grothe.haagerup_bound` proves
  `K≤1.404951` without `NodeCaps`, `DirectHyps`, or any other numerical input
  hypothesis. This is weaker than the sharp external-assisted construction.

The finite native checks are explicitly enumerated in
`scripts/check_axioms.py`; the lower certificate is assembled from fourteen
single-threaded checks. The upper head, unconditional Haagerup check,
phase cover and cap chords have separate native facts, and the heavy caps
target has a separate report. The generic research lemmas add no native
facts or headline assumptions.

Several archival numbers are legitimate historical statements, but cannot be
substituted silently for this baseline:

1. The 15/20/22 October portions of `ch17-crossbound.tex`, `ch4-ceilings.tex`
   and `breakthrough/00-state-of-the-math.md` quote earlier endpoints. For
   current endpoint arithmetic, the actual Lean interfaces and current
   generated certificate take precedence. Statements that the lower transfer
   or complex minimax argument is still unwritten are superseded.
2. The archive's matrix-prefix construction assembles `<1.404598428856`.
   The matrix note itself still displays an earlier `<1.404598524179`.
   Both are external-assisted packages, not the present main theorem's
   native computation from its energy table.
3. `work/upper-stable` reports `<1.404596071666` for an extra phase controller
   and matrix covariance. Inspection of that branch confirms an additional
   `head_close` hypothesis: it checks 251 stored head values instead of deriving
   that head by the main bivariate Gaussian-kernel checker. Two shipped replay
   scripts also require an input absent from this archive. It is a stronger
   conditional numerical construction with a different formal boundary,
   not a stronger unconditional theorem that master forgot to state.
4. The archived universal ceiling near `1.404592` was corrected later: its
   argument applies to a restricted diagonal preprocessing class. Noncommuting
   matrix preprocessing is already present in the repository. It is not a
   new proposal, and its full family ceiling is not established there.
5. The `[P,C]` first-moment cap `E|q|≤0.97073` is a separate external-assisted
   result. The formal lower pipeline uses its own derived radius near
   `0.973612157`. The smaller number must not be described as already used
   in the headline Lean proof.

I also corrected a wording defect in `docs/overview.tex`: the identity
`|a+b|+|a−b|=2 max(|a|,|b|)` is a **real** scalar identity. Its application
to circular complex variables is valid after using
`E|W|=(π/2)E|Re W|`. It is false pointwise for general complex `a,b`.
The detailed manuscript makes this distinction correctly.

## 2. Where the lower proof loses

Let `P=P_(1,0)`, `Q=P_(2,1)`, `T=P−εQ`, and use the conjugate-first
inner product. After rotating a pairing to be real, set
`h=(f+g)/2`, `k=(f−g)/2`. The exact objective is

\[
J=\|Ph\|^2-\epsilon\|Qh\|^2-\|Pk\|^2+\epsilon\|Qk\|^2.       (4)
\]

For unimodular responses,
`|h|²+|k|²=1` and `Re(h conj(k))=0`. For disk-valued responses the exact
constraint is `|h|²+|k|²+2|Re(h conj(k))|≤1`. All four terms in (4)
belong to one pair of functions. Treating positive energies, negative
penalties and remote laws as separately optimizable enlarges the feasible set.

The binding audit identifies five distinct losses:

- Taking a fibre supremum removes the actual response section's dependence
  on the remote variables, although it preserves the pointwise two-disk support.
- Mixing already-maximized row potentials lets different rows choose different
  maximizing sections. Averaging their affine/quadratic data **before** the
  supremum can be stronger, but no global gain has yet been measured.
- The remaining `ε||Qh+(β/ε)v||²` is dropped after the already-used beta
  mixing identity. Its full value cannot be charged again elsewhere.
- A shared gate is replaced by a Schur price, dropping its actual matching
  remainder. At rule 7234, equality would require approximately
  `X2=−0.532438p`, `X3=−0.256700p`; the saved table does not supply those fields.
- Moment and finite Stein/Gram cuts constrain the radial law of `|q|²` without
  asserting that this law, all projections and both responses are jointly realizable.

The adaptive cover's exact maximum is approximately `0.713420953219917`,
below the rounded cap `B=0.713420953220`. Its earlier per-box padding
is already part of exact recipe evaluation. Removing rounding allowances
cannot account for the size of the remaining problem.

In the original frozen audit, four exact atomic radial laws satisfy the
671 cuts in that audited bank and the required moments, with table-objective scores exceeding
`0.713412812507`, `0.713414640742`, `0.713406413945` and `0.713352277645`.
All four were independently replayed using rational arithmetic. Each exceeds
`500/701=0.7132667617689…`. Consequently repricing the **same** finite table
and cut bank cannot reach that target at those points. These are not actual
cubics, response pairs, or counterexamples to Conjecture K. They establish an
obstruction to a particular relaxation, not an obstruction to the true norm.
The bank includes the cuts needed at those points, not every conceivable cut.
Later merges of inherited Stein tests exclude all four fixed atomic laws;
reoptimizing the law largely restores their scores. The original four laws
therefore do not certify an obstruction to the current adaptive bank. See
`COMMON_STEIN_REASSESSMENT_2026-10-23.md` for that distinction.

The older decomposition into roughly 78% row/gate loss and 22% law loss is
a floating diagnostic of a dated binding rule, not an exact ledger for every
current box. Its structural message agrees with the current audit; its precise
percentages cannot be transplanted to the newer certificate.

There is already a strong exact-support dual. For a fixed target cubic, its
loss is a nonnegative joint support defect, matching squares and a pointwise
response-support gap. The rational defect hierarchy recovers `9999/10000`
of the defect after 32 steps, and the fixed-tensor dual is convex with a
certified descent step. Thus the missing theorem is **uniform control over
all coupled target tensors**, not a better local optimizer for that dual or
another rational approximation to a defect whose expectation is still unknown.

Update after the finite-response continuation: the
[cubic-family ceiling](CUBIC_FAMILY_CEILING_2026-10-23.md) now proves the
dimension-uniform cubic-method ceiling `<1.4022581233` for every complex
cubic coefficient, using two actual finite Gaussian response pairs and
directed integral certificates. The generic cancellation and ratio arithmetic
are formalized separately; the Gaussian identities remain paper proofs.
No Grothendieck endpoint changes, and equality or optimality at that ceiling
is not asserted. The following paragraph records the original diagnosis.

The subsequent [quintic reassessment](QUINTIC_REASSESSMENT_2026-10-23.md)
derives the full actual fifth projection, certifies an escape direction
from that cubic bank, and implements realizable phase-feedback separation
with a full-tail price. It also certifies that mixing the old and new
cancellation banks cannot beat the incumbent direct rounding score.

Even perfect cubic certification is limited. The numerical realizable
adversary model at the best `ε≈0.7564` gives norm about `0.7131355`, reciprocal
`1.402258`. This is numerical evidence, not a proved exact cubic optimum.
Used only as a diagnostic, that ceiling leaves about **80.66%** of the current
interval above it. At the current `ε=.745`, the model already gives norm
about `.713288`, so this fixed parameter cannot plausibly reach 1.402.
Changing ε requires a new complete cover, including its flanks.

There are stronger **analytic, externally certified degree barriers**:
explicit realizable chirp mixtures annihilate all retained nonlinear
coefficients and show that every degree-at-most-five witness is capped below
`1.4036705`, and every degree-at-most-seven witness below `1.4044895`.
These are bounds on what those witness classes can prove; they do not identify
the actual constant. Reaching the present upper region requires degree at
least nine within this Hermite-game architecture. Extending the full
alternating pattern fails: its dimension-uniform scalar norm is one.

## 3. Where the upper proof loses

The current slope is

\[
c=0.7119483103461,
\qquad A=c-\delta=0.711947395067310982,
\quad\delta=9.152793034218\cdot10^{-6}.
\]

The residual consists of comparison `1.065637497e−6` (93.59%), native
head `2.8153e−8` (2.50%), Hardy tail `3.04888432e−8` (2.71%), and table
error `1.3694018e−11` (about .001%). These are upper allowances, not
measurements of the actual residual or the proportion of the theorem that
is mathematically true.

Even removing **all** residual would yield only

\[
1/c=1.40459635266761\ldots,
\]

a gain of `2.218111014592e−6` in K. Removing the comparison allowance alone gives
about `1.404596468388596`. None of that can close the `.002901584608`
two-sided interval. The stable archive likewise has a fixed zero-residual
reciprocal `1.4045937`. Better upper arithmetic matters for trust and for
millionths; a substantial advance needs a different family or a different
signed coefficient balance.

The proposed Haagerup value `1.404575934663742…` is only about 0.766% of
the current interval below its upper endpoint. Reaching that value on the
upper side would still leave almost the whole lower-side gap. Conversely,
success with cubic Conjecture K would not justify that conjectured exact value.

Two ceiling arguments also need particular care. The physical charge-one
kernel is `H(z)=Σ c_k z|z|^(2k)`. At physical `z=i` this is `iΣc_k`,
whereas analytic continuation of the real odd series gives
`iΣ(−1)^k c_k`. They are different objects. A maximum-modulus principle
for the latter is not a rounding theorem for the former. Further, a fixed
endpoint Fourier value need not decrease under admissible preprocessing.
The exact disk response `f(z)=2sqrt(e) z exp(−2|z|²)` has
`c_k=4e(k+1)4^k/3^(2k+4)` and alternating damped value
`C(r)=4er/[81(1+4r²/9)²]`; `C(sqrt(3)/2)=e sqrt(3)/72>4e/169=C(1)`.
A scalar ceiling therefore needs a supremum over admissible damping;
matrix preprocessing requires its larger covariance domain. This correction
does not disprove Haagerup's candidate value, but removes an unjustified
argument for treating it as a universal family boundary.

A useful secondary calculation combines the archived matrix covariance with
the **disk polynomial** `F0 P3(φ)` instead of its exponential phase.
An exact independent replay checks source identities, 103 PSD gates,
14 Hilbert–Schmidt unions, 20 square-root gates and three rational quadratic
duals, then reconstructs comparison rather than subtracting from a rounded
endpoint. Its algebraic candidate is `1.4045980681017882`.
The Gaussian enclosure interpretations, actual phase-supremum cover and
universal bounded-rounding tail transfer remain explicit obligations.
It is neither a new proved bound nor the strongest archived conditional
candidate. Its size confirms the distinction between an arithmetic gain
and a change of research architecture.

## 4. Why cubics are structurally difficult

Charge one forces the sequence `H_(1,0),H_(2,1),H_(3,2),…`. The cubic is
the first three-index tensor, symmetric in its two holomorphic slots, with
an antiholomorphic slot coupling it back to linear directions. Unitary
rotation does not diagonalize a general such tensor as it does a quadratic
form. Its contractions simultaneously determine fourth/sixth moments,
Malliavin fluctuations and nonlinear first-chaos content. Bounding those
quantities independently throws away their common tensor origin.

There are three concrete obstructions that any new reduction must survive.

**Fixed-coordinate cores fail.** For independent proper Gaussians,

\[
Q_N=\frac{X_1(\|X\|^2-N-1)}{\sqrt{N+1}}\in H_{2,1},\qquad\|Q_N\|_2=1.
\]

Every rank-m complex projection captures at most `(m+1)/(N+1)` of its
energy, while its first-coordinate influence tends to one. Jointly,
`(X1,Q_N)⇒(X,XG2)`, where `G2` is a **real, neutral grade-two** Gaussian.
Conditional variance is `|X|²` and pseudovariance is `X²`. This is not a
fresh proper complex grade-three noise. Some later conditional-response
theorems control this particular family; that does not repair the false
small-coordinate-or-Gaussian dichotomy or cover every mixed tensor.

**Marginals, covariance and energies fail.** Let
`H(X)=X(|X|²−2)/sqrt(2)`. The pairs `(H(X),X)` and `(H(Y),X)` have the
same marginals and zero covariance/pseudocovariance, yet

\[
\mathbb E[\bar r q|q|^2]=8\sqrt2\quad\hbox{or}\quad0.
\]

Their bounded phase pairings likewise differ. The actual dependence matters
to the profile response. Nor is a general Gaussian Laplace comparison true:
the recorded normalized cubic
`X[4(|X|²−2)+3i(|Y|²−1)]/sqrt(41)` violates it at rate 20. Gaussian
local stability, or success for an independent sector, does not prove a
global assertion about these coupled configurations.

**Uniform fast phase tails fail.** The phases of `Q_N` have limiting
noise kernel

\[
h(\rho)\frac2\pi\arcsin(\rho^2),
\]

and tail at chaos index D at least `1/(6 sqrt(ceil(D/2)))` uniformly over
N. An individual-energy allowance `1e−4` therefore needs index at least
5,555,555 in the proved obstruction. A one-sided best-response hypothesis
does not avoid it: every finite cubic phase can be realized as such a
best response. Its payoff need not be near the global norm. A useful
near-extremizer hypothesis must impose mutual/global optimality with an
explicit error; one-sided phase form is insufficient.

This tail statement does **not** forbid fast signed tails. For the actual
phase-preprocessor example in the cross-bound reassessment, the unsigned
energy tail past index 64 exceeds `.003838`, while the signed kernel tail
is below `1.855e−14` under its proved contour conditions. Nor does it forbid
objective-specific smoothing: smoothing changes and prices the responses.

Circularity itself is essential, not a cosmetic normalization. The formal
sixth-moment theorem `E U³≤9m−12+40.45313(m−2)^(3/2)` fails for two unrelated
real third-chaos components with equal variance: the recorded pair has
`m=47`, `E U³=13506`, larger than the putative cap `12622.55`. A real
regularity or moment theorem must therefore retain the complex rotation
structure before it can supply this project's sharper inequalities.

For real signs, `h` and `k` have disjoint supports. For complex phases they
share a phase field and both can be nonzero. The important common geometry
is therefore the full bounded pair and its products across grades, rather
than the law of an isolated circular cubic.

## 5. The common optimization problem and the limits of cross-bound feedback

Let `P_k=P_(k+1,k)` and let `C` be the convex set of finite mixtures of
real mixed coefficient sequences

\[
c_k=\Re\langle P_kf,P_kg\rangle
\]

for actual charge-one disk-valued responses in arbitrary finite Gaussian
dimension. Bessel gives `Σ|c_k|≤1`. Conjugate reflection realizes the real
coefficients as actual kernels. Write

\[
D(c)=c_0-\sum_{k\ge1}|c_k|,
\quad N(\lambda)=\sup_{c\in C}\langle\lambda,c\rangle,
\quad\lambda_0=1,\quad\lambda_k\in[-1,1].
\]

The manuscript's complete analytic argument proves

\[
\frac1{K_G^{\mathbb C}}=\sup_{c\in C}D(c)=\min_\lambda N(\lambda). (5)
\]

The proof uses residual rounding transfer, finite-partition matrix transfer
with the vector test `Z/||Z||`, and Sion minimax on the weak-star compact
multiplier cube paired with `ℓ¹`. It does not require compactness of the
response set or an integral kernel. This exact complex equality is a paper
result here; it is not itself wholly formalized in Lean. Its component
transfer machinery is much more formalized than old notes imply.

For every feasible pair, the exact gap is

\[
N(\lambda)-D(c)=
\underbrace{N(\lambda)-\langle\lambda,c\rangle}_{\text{response gap}}
+\underbrace{\sum_{k\ge1}(|c_k|+\lambda_kc_k)}_{\text{coefficient gap}}. (6)
\]

A lower adversary is a useful upper component only if its defining functions
are actual bounded responses, its complete signed coefficients are computed
accurately, and some feasible mixture cancels its unwanted coefficients with
a paid tail. Large witness payoff alone certifies none of that. A fake radial
law supplies no rounding at all. Conversely residual signs propose a next
witness via `λ_k=−sign(c_k)` where coefficients are nonzero; at zero coefficients
any value in the subgradient interval is allowed. This is a search direction,
not a norm certificate. The next global best response may change completely.

Equation (6) implies
`Σ(1−|λ_k|)|c_k|≤gap`. For a cubic witness this requires
`(1−ε)|c_1|+Σ_(k≥2)|c_k|` to be small. Thus a matching upper mixture must
cancel essentially every higher coefficient even when the lower witness
sees only the cubic. No finite-degree witness removes that obligation.

For a finite actual-response pool and retained index D, exact LP duality
gives a common value `v_D`. It has no automatic one-sided relation to
`1/K`: the pool restriction and tail truncation oppose each other. If a
global oracle certificate supplies `N(λ)≤v_D+δ` and the chosen actual
mixture has signed tail ≤τ, then

\[
\frac1{v_D+\delta}\le K_G^{\mathbb C}\le\frac1{v_D-\tau}.       (7)
\]

The reciprocal interval width is exactly `δ+τ`, before head/rounding errors.
Agreement of the two optimizations inside the same pool supplies neither.
The archived repaired pool and its later chirp search are explicit warnings:
recognizable phase columns were inaccurate under coarse quadrature, and
stable payoffs hid coefficient changes around `1.65e−4`. The large chirp pool
still scores about `.711892`, below the current `.711947179793…` incumbent,
even before all remaining family-specific tail obligations.

So the two sides are obstructed by the same response body in the precise
sense of (5), but **not demonstrably by one missing inequality**. A good
common experiment must separately measure improved global separation and
improved realizable signed cancellation.

## 6. Literature: specific usable results and blocked transfers

The following primary sources were opened and their relevant results read;
their hypotheses matter more here than their numerical constants.

- [Heilman–Jones–Malavolta, real primal/dual method](https://arxiv.org/html/2610.10477v1),
  Sections 2–3: Gaussian Hermite-game minimax and the actual-response exchange
  algorithm. This gives the right discovery loop and the distinction between
  heuristic response search and rigorous global certification. Real sign
  support identities do not transfer to phases. The complex minimax proof
  used here is the repository's independent argument in (5).
- [Heilman–Jones–Malavolta, complex bounds](https://arxiv.org/html/2609.25462v1):
  complex Gaussian phase kernels, admissible tensor preprocessing and residual
  repair directly fit this project. Their `1.4<K<1.404898554746` result is an
  external baseline, superseded numerically by the repository's conditional
  constructions. It does not certify this repository's sharper data.
- [Naor–Regev, Krivine schemes are optimal](https://arxiv.org/abs/1205.6415):
  general **real** oblivious Gaussian schemes approach the optimal constant
  with dimension-dependent loss `1+O(1/k)`. This is completeness of a broad
  scheme class, not optimality of one-dimensional signs or of two complex
  coordinates. It supplies no practical small dimension at our precision.
- [Braverman–Makarychev–Makarychev–Naor](https://arxiv.org/abs/1103.6161):
  higher-dimensional real rounding beats Krivine's previously conjectured
  value. The transferable lesson is the need to test asymmetric and richer
  phase families. Their sign perturbation theorem is not a complex numerical
  bound. A raw complex ceiling-functional gain would likewise still need
  actual full-kernel cancellation before moving K.
- [Raghavendra–Steurer, Towards Computing the Grothendieck Constant](https://www.bayesianestimation.org/paper/grothendieck.pdf),
  Theorems 1.3–1.4: real computability and Hermite-game completeness; additive
  accuracy η costs `exp(exp(O(η^−3)))`. UGC enters hardness, not computability.
  This rules out the claim that a known abstract algorithm makes the numerical
  problem easy. A complex implementation still needs its own phase model.
- [Jones, Regularity lemma for Gaussian polynomials](https://arxiv.org/html/2610.16180v1),
  Theorems 3.8–3.9: joint graded polynomial compactification and a finite
  approximation using shared polynomial features. The size bound is
  nonconstructive; the suggested recursion in the following remark is
  explicitly unverified. Realification preserves polynomial degree but does
  not by itself preserve complex charge or properness. It supports the
  `X G2` model, not an independent proper-cubic replacement.
- [Herry–Malicet–Poly](https://arxiv.org/html/2412.06749v1), stability of
  polynomial-chaos limits: bounded-degree limits remain polynomial in suitable
  primitives. This supplies a language for loss of coordinate compactness,
  not a quantitative joint-response inequality at error `1e−4`. Marginal
  convergence cannot determine the nonlinear correlation in Section 4.
- [Designolle et al., improved local models](https://arxiv.org/html/2302.04721v3)
  and [Designolle–Vértesi–Pokutta, finite-order bounds](https://arxiv.org/html/2409.03739v3),
  especially Proposition 1: finite feasible correlation decompositions,
  shrinking factors and residual repair yield local models; separation yields
  Bell inequalities only with a certified scalar oracle. The shared
  membership/separation engine is directly relevant. Their reported rank
  constants compare **real** vector correlations, not the present complex
  bilinear constant. Code capable of complex optimization is not a complex
  theorem or an arbitrary-dimensional norm certificate.
- [Acín–Gisin–Toner](https://arxiv.org/html/quant-ph/0606138), Theorem 1 and
  Lemmas 2–3: projective-measurement locality of two-qubit Werner states has
  threshold `1/K_G^R(3)`. Dichotomic quantum correlators have a real-vector
  representation. Converting correlator locality to full-distribution
  locality uses the relevant uniform-marginal property. This does not give
  `K_G^C`, arbitrary POVM locality, or a complex-phase response theorem.
- [Josz–Molzahn, complex moment/SOS hierarchy](https://arxiv.org/html/1508.02068v2)
  and [Sinjorgo–Sotirov–Anjos, complex cut liftings](https://arxiv.org/html/2402.04731v2):
  commuting complex moments can enforce repeated products and torus geometry.
  Convergence needs the stated finite-dimensional compactness/sphere setup;
  it does not justify a small Gaussian tensor rank. The repository already
  proves screening and a finite-lift counterexample for specific phase cuts.
  Reusing exactly those cuts with an unsigned tail is not a new attack.

For a concrete model mismatch, CHSH has real scalar norm 2 and vector norm
`2sqrt(2)`, but complex phases already attain `2sqrt(2)` using right phases
`(1,i)`. Its complex Grothendieck ratio is one. Binary XOR constraints,
noncommutative quantum moment hierarchies and commuting circle phases are
different feasible sets. A useful Bell-inspired cut must be proved for this
phase body and survive the existing screening counterexamples.

## 7. A checkable new step: compress the actual response multiplication

The new repository-specific proposal is to retain finite compressions of
`M_f:x↦fx` and `M_g` before taking the fibre supremum. For `|f|≤1`,
`M_f` contracts `L²`. For orthonormal polynomial banks `u_i,v_j`,

\[
C_{ij}=\mathbb E[\bar u_i f v_j],\qquad
\begin{pmatrix}I&C\\C^*&I\end{pmatrix}\succeq0.                 (8)
\]

Its entries are **affine in coefficients of the same response**, and Hermite
product identities repeat these coefficients across grades. This targets
the missing cross-degree structure without replacing the remote tensor by
noise or reconstructing fake responses from radial laws. The contraction
fact is standard; the proposed use as a shared-driver multi-grade extraction
hierarchy is new to the checked research interfaces, not a claim of worldwide
novelty for moment matrices.

Two explicit consequences illustrate its content. With `R=|Z|²` and
`u_j=(-1)^jL_j(R)`, let `q` be **any** normalized remote cubic and
`b_j=E[f conj(q)u_j]`. They are the degree `3,5,7,…` companions of the
same driver. Then

\[
\left\|\begin{pmatrix}b_0&b_1\\b_1&b_0+2b_1+2b_2\end{pmatrix}\right\|\le1. (9)
\]

The artificial profile `(4/5,3/10,0)` passes Parseval but violates (9),
with second-column squared norm `41/20`. Crucially, allowing the unobserved
companion `b2=−1/2` repairs this small block and costs displayed energy
`49/50`. Hence omitted coefficients must be optimized over, not set to zero.
Passing the repaired small block still does not realize a bounded response.

Similarly, for
`m_k=E[f conj(Z)(−1)^kL_k^1(R)]`, actual boundedness implies

\[
\sum_{j=0}^d|m_j+m_{j-1}|^2\le1,\quad m_{-1}=0.               (10)
\]

The profile `(21/25,−21/50,0)` passes weighted Parseval at `3969/5000`
but costs `1323/1250` in (10). Fixing its first two real coefficients
forces the quintic companion to satisfy `m2≥21/50−sqrt(59/500)>0`.

These are exact coefficient obstructions, not a claimed exclusion of the
saved binding radial laws. Those laws have no `b_j`, `m_j`, or response
sections attached to them. Testing them requires a supremum over all
admissible lifts with the new product identities and the old penalties.

Implemented artifacts are `ResponseCompression.lean`,
`response_compression.py`, and the detailed extraction note
`RESPONSE_COMPRESSION_2026-10-23.md`. The Lean module constructs the actual
bounded multiplication operator, proves its contraction and compression,
and verifies the finite coefficient interfaces and rejection arithmetic.
Gaussian Laguerre orthonormality/coefficient extraction remains explicit
in those interfaces and is proved on paper in the note. The standard-library
tool independently passes 167 exact polynomial/PSD checks, including actual
analytic disk responses and the omitted-companion repair. No endpoint uses
this new interface yet.

This differs from an inert freely completed PSD cross block: polynomial
products fix the entries before elimination. It differs from separated-site
phase cuts: products occur at one Gaussian input, so a large chaos index
cannot simply hide behind small off-site correlations. Its open difficulty
is retaining enough actual tensor-linked entries to make these necessary
constraints useful globally, with manageable matrix sizes.

## 8. A second implementation and a negative result

I also tested a realizability-preserving closure of the actual response pool.
Append one independent complex Gaussian `U`, put `R=|U|²`, and use

\[
F_t=f e^{itR},\qquad G_t=\frac{1+it}{1-it}g e^{-itR},
\]

then mix `t` and `−t`. The complete signed kernel coefficients transform
by convolution. For `s=t²`,

\[
\sum_{j\ge0}d_jz^j=
\frac1{1+s}\frac{1-uz}{1-2uz+vz^2},\quad
u=\frac{s(s-1)}{(1+s)^2},\quad v=\frac{s^2}{(1+s)^2}.
\]

For rational s all coefficients and tail allowances are rational. With
`ρ=s/(1+s)`, `||d||₁≤1` and tail past N is ≤`ρ^(N+1)`. The tool transports
an **existing** input tail; it does not manufacture tail regularity or make
arbitrary coefficient data realizable. Original shared drivers are preserved.

There are 589 exact independent Laguerre/Laplace/phase checks and seven
controls, including a known fresh-variation exclusion. The operation is a
portable all-grade implementation of a restricted variation, weaker than the
existing response-dependent fresh-mode theorem.

The actual numerical falsification was negative: closing the 594-column
quadratic pool with eleven s values and five additional Cayley phases gives
33,264 columns and no observed score improvement over `.7118923203267854`.
Adding the current incumbent likewise leaves its nominal full score unchanged
near `.71194715331348`. The solver exposes a roughly `1.65e−8` primal/dual
discrepancy. These are discovery calculations using inherited source head/tail
allowances, not rigorous optima, and uncertified source tails remain uncertified.
There is no reason to spend another campaign enlarging this same constant
independent-buffer grid. A serious successor must couple the new mode to
the original response features or introduce genuinely asymmetric shared phases.

## 9. Ranked directions and decisive stop tests

A different formulation already available is the spherical inverse operator.
It preserves the original response pair under a shared Gaussian restriction,
and its compact operator can be truncated without a phase-tail assumption.
For the cubic at sphere parameter `m=32`, index 12 has multiplier error below
`8.38e−8`, but its exact complex rank is `796315556846635874048`. Finite-m
outer loss is separate from that tail, and the outer norm has floor
`1/K_G^C(m)`. Moreover its multiplicity-weighted squared multipliers grow
like `r^7`, so the compact operator has no square-integrable kernel. These
facts rule out cheap coefficient enumeration and an unsigned Hilbert–Schmidt
bound on this inverse operator. They do not rule out every kernel argument,
an invariant certificate, or the unrelated upper comparison HS estimates.
The spherical bridge is a paper result; Lean proves the cubic tail and
conditional assembly, not a useful spherical norm cap. Without an explicit
small symmetry-reduced certificate, changing to this formulation relocates
the hard optimization rather than solving it.

**1. A shared-driver multi-grade certificate, starting with multiplication
compressions and the existing exact-support dual.** Highest potential to
raise the lower bound materially, because it attacks the documented loss
between degrees rather than sharpening the cubic radial law. The decisive
lemma is a dimension-free extraction/majorization theorem retaining one
response's cubic, quintic and higher companion coefficients and the original
negative projection terms. Ultimately test degree-nine/thirteen witnesses;
degree three is the controlled baseline. The first experiment is a lifted
pre-supremum fibre relaxation with order-one/two compressions, maximizing
over every unobserved companion and tensor-consistent Gram completion. Test
the binding regions and actual W-model, influential `XG2`, mixed/cycle and
phase contacts. Reject the feature bank after two enrichments if it leaves
the same relaxed optimum within the required certificate budget. The new
extraction module is the completed first step, not a finished lifted endpoint.

**2. One actual-response exchange with asymmetric phase drivers and signed
tails, unconstrained by the preferred value.** Highest potential on the
upper side and the necessary adversary engine for direction 1. The decisive
construction is a realizable mixture whose **full** denominator exceeds the
current `A`, preferably by `1e−5`, or an actual new response that invalidates
a promising higher-degree witness. Store defining functions, charge/grade
and driver identities, independently enclosed coefficients and a tail route.
Use residual signs for the witness update, then test against genuine new
responses. A raw ceiling functional, LP agreement, or stable payoff is not
the success metric. The first falsification is independent high-accuracy
recomputation of active coefficients and the complete signed mixture tail.
Stop a family if its certified full score loses its head gain. The constant
neutral closure above has already failed this test numerically and should
not be expanded further. Haagerup's proposed value remains a live conjecture;
the search must permit a smaller K instead of fitting that value by design.

**3. Near-extremizer rigidity with response-weighted features.** A targeted
alternative if the first hierarchy does not separate. The decisive lemma is
a uniform stability theorem for *globally* near-maximizing pairs, retaining
the correlated matrix blocks from mutual phase variations, with error
`O(sqrt(δ))` and explicitly paid clipping/regularization. Independent-sector
optimality and Gaussian local Hessians are insufficient. The first test is
whether the full feature matrix rules out all completions of a binding
configuration while admitting actual benchmark responses. The scalar
reciprocal-modulus cut is already inactive in a recorded binding regime;
repeating it after the fibre supremum is not this experiment. A successful
cubic result would be valuable, but the witness ceiling still limits its
contribution to the total interval.

Formalizing `NodeCaps`, closing the sharp upper hypotheses, or certifying a
small matrix/P3 improvement remain useful independent tasks. Their purpose
is stronger trust or additional digits. They should not be used as evidence
that the substantial-gap problem has been solved.

## Coverage and reproducibility

The read-only inventory includes 815 Markdown/TeX files, 9,122,988 bytes,
excluding dependency checkouts and duplicate worktrees. The maintained README,
all top-level `docs` Markdown/TeX, the current theorem interfaces, recent
cross-bound reassessment, joint-structure/phase-tail and phase-screening
results, witness ceilings, original-response duals, attack log, binding audit,
and relevant upper archives were read and cross-checked. The entire corpus
has a path/size/hash/heading inventory. This is not a claim that every old
archived proof, imported book chapter or duplicate certificate was independently
line-audited or regenerated. Primary sources were verified as cited above.

The source working directory changed concurrently during this investigation.
Its newly appearing `ResponseGram.lean` and two screening prototypes were
also inspected. The former derives a shared interval for unmeasured
projection Grams and a completion screen, complementary to (8)'s compression
of multiplication with repeated polynomial-product entries. The screening
scripts explicitly describe floating discovery and unobserved completions;
no unreported run or endpoint from them is assumed here. The initial inventory
and branch snapshot remain identifiable rather than being silently replaced
by these live edits.

Replays and new modules are delivered with the result. The original working
directory's uncommitted research was not overwritten or committed as new work.
The new branch contains only explicitly selected changes; its working tree
also preserves a snapshot of the pre-existing uncommitted inputs for context.

## Follow-through: the first shared-response experiment

The proposed selected-penalty multiplication lift has now been implemented.
[Its experiment note](RESPONSE_LIFT_EXPERIMENT_2026-10-23.md) supplies 24 exact
zero-cost completions, covering orders one and two at all twelve binding-audit
contacts. This is a falsification of positive recovery by that finite lift,
not a test of the complete joint pre-supremum objective.

A sharper fixed-law support test adds a substantive distinction. For abstract
radial law 5661 it certifies a selected-penalty recovery above `1.39e-8`.
For law 7234, it instead constructs an actual disk response pair matching all
five selected zero-cost targets. Thus additional bounded-response moments
alone do not yield a uniform positive correction over this radial class.
Retaining full conditional fields and their joint fibre deficit, or actual
cubic identities, is necessary to test the remaining mechanisms. Neither
Grothendieck endpoint nor the earlier proof-status classification changes.


## Follow-up: joint fibre experiment, 23 October 2026

See `JOINT_FIBRE_EXPERIMENT_2026-10-23.md` for the completed next test. The
conditional gate acts on cubic **projections**, and a free-projector model
has an exact rank-one ceiling (now proved in Lean). At saved law 7234 the
full-coordinate joint response problem has an externally certified bracket
`.7131526 < optimum <= .713261364`, and its deficit against the common fibre
potential is greater than `.000093136`. The remaining uniform-law and actual
cubic-projection obligations prevent any Grothendieck endpoint update.


## Continuation: genuine unchanged-witness obstruction

See `GENUINE_CUBIC_DIAGNOSIS_2026-10-23.md`. Newer common-Stein cuts already
exclude the old law 7234; a ceiling based on its feasibility applies only to
law classes still containing it. A separate genuine finite Gaussian pair now
proves `||P10-(149/200)P21||_infinity_to_1 > .71329 > 500/701`. Thus the
unchanged witness cannot reach the 1.402 target even with complete geometry.
This is a witness ceiling, not an upper bound on the Grothendieck constant.
The proof combines the actual U(m)-invariant projection closure, directed
Bessel integrals, and an exact finite coefficient correction. New row-pricing
identities and radius-uniform polynomial certificates remain reusable.
