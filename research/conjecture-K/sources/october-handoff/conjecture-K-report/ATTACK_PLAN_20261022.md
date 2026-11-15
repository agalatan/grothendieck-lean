<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/conjecture-K-report/ATTACK_PLAN_20261022.md (file dated 2026-10-22). Only this line was added. -->
# Attack plan: a better complex Grothendieck lower bound

22 October 2026. Recovered from the current manuscript and updated after the covariance-envelope certificate. Reference repository commit: `f5fe38c`.

**Decision:** resume the original-response feasibility programme. Proving all of raw Conjecture K is sufficient, but is not the main deliverable. The main deliverable is a uniform operator-norm cap for one witness, with a complete cover and an explicit Lean integration path.

The earlier plan was recovered at [PLAN_1402.md](/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/k-lower-audit-20261021/PLAN_1402.md). It records the 21 October change from the raw-K milestones to covering actual response configurations. The present plan continues that change, incorporates the multiplication-compression certificates and the new complete endpoint, and replaces its dated numerical priorities. The old file remains a historical research log, including approaches subsequently disproved.

Status labels: **[P]** analytic proof; **[C]** exact/directed certificate; **[F]** numerical exploration; **[?]** an open target or proposed method. This document is a plan, not a claim that its open steps have been solved.

### Reassessment update: the next proof target, 22 October

The new closed family compresses the eight-integral certificate to one erfc value and an exact square completion. It retains full-energy cutoffs .0365 at the peak and .0318 on t<=.851; keep the older weighted certificate for its stronger coverage. More scalar tuning is not the main next step: even the exact visible geometry with total k-energy admits a formal cap above .7175 if cubic energy is only bounded by that total.

**New proved tool [P]:** the Gram inequality discards exactly the cost of replacing the actual response by its minimum-weight-norm cubic interpolant k0. Actual |k|<=1 forces an additional weighted disk-distance cost. A closed formula recovers at least 8/9 of this correction, and a clipped quadratic dual permits optimizing it jointly. This uses no new moment or independence input and does not spend Pk twice.

**Joint-defect update [P,C]:** `ch25-parts/87-joint-response-defect.tex` now gives the exact joint-disk defect, including the interaction with h. Its rational nonnegative-polynomial formula retains at least the sharp fraction 81/250 of the full defect. It dominates the old disk-distance correction and can be positive inside that disk. This defect replaces the separate clipping/h-phase terms; do not add them again. The Qh completion and the explicitly derived Pk matching error remain compatible.

**Small regional gain [P,C]:** a price on the two-dimensional remote cubic/conjugate subspace, using only Cauchy–Schwarz, extends the sufficient weighted-energy cutoffs to .03748 at the peak and .03255 for t<=.851. The old bound is still better at some smaller energies, so take their minimum. This is not a full cover or a new endpoint.

**After the IDE review [P,C]:** `ch25-parts/88-joint-dual-descent.tex` now provides (i) a rational hierarchy retaining at least 99.99% of the joint defect after 32 steps, and (ii) an explicit guaranteed decrease for the joint dual from its averaged contact-mismatch vector and Gram matrix. For the accepted fixed weight, 48 steps lose less than 1.2e-6 in absolute expected correction uniformly on actual responses. Deterministic norm regularization by delta costs at most 2 delta, once, and is not a fresh Gaussian buffer. Rational steps can be checked by bounding `2 r·d - dᵀKd`; a floating inverse need not be trusted. The Gaussian-grade test falls below the design cap after these updates [F], but the general coupled-law expectations are still unbounded uniformly. The new finite phase-cut obstructions rule out only their specified tests, not this local response programme.

**Updated next target [?]:** on the remaining response set, lower-bound the rational joint defect (or optimize the exact joint support dual), with the compatible Qh completion and Pk matching error for that same response. Per-tensor positivity does not give a dimension-free rate. A successful rate must beat that same row's excess, then extend to a full same-witness cover. A scalar clipping multiplier on the entire response norm is already dominated by another radial quadratic weight; do not mistake that fallback for new response geometry. Do not substitute further finite-family K regions for this obligation.

Proofs, exact checks and live-source porting ledger: `/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/canonical-rethink-20261022/REASSESSMENT.md`.

### Execution update: response attack, 22 October

The user has assigned integration of the existing improvement to the IDE worker; assume that mathematical baseline exists and do not repeat its integration here. The new attack has produced:

- **[P,C] A universal visible-moment support bound.** At the peak it forces retained projection cost above .05019429. It excludes an explicit exact moment configuration that passes the two degree-two multiplication matrices and Parseval. Those matrices alone omit useful visible-coordinate information.
- **[P,C] A weighted full-energy cap, all dimensions and sectors:**
  \(\mathcal N\le t^2-.5604t+.42528575+1.25\mathcal V_*\), with the explicit weights in `ch25-parts/85-weighted-full-energy.tex`. It covers \(t\le.851,\mathcal V_*\le.0325\) at cap .71321135, and the peak with \(\mathcal V_*\le.03744\) at cap .71325087. No moment, buffer or tensor-orientation assumption is used. Both fresh exact replays pass.
- **[P,C] A stop rule for proportional tests:** in the diffuse Gaussian-grade model at \(e=.04,t=.8456\), optimising all complex \(v=\lambda q\), the parallel-envelope parameter and the scalar multiplier leaves cost .0007977136526…, above the peak budget. The same relaxed configuration passes all such cuts simultaneously. This is not a counterexample to K; the Gaussian-grade family has other proofs.

**Next target:** the intersection of the prior survivor set with \(\mathcal V_*>.037447304\) at the peak. Include the exact visible support constraint in the moment/canonical dual before optimising; retain free fifth moments and shared-sector data. A covariant joint certificate is still required. The global endpoint has not changed in this round. Full proof, exact replay and porting ledger:
`/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/response-attack-20261022/`.

## 1. Starting point and numerical targets

The manuscript still advertises master/CI **1.401674103**. Its newest complete numerical certificate is now **1.401687463503 [P,C]**, cap **0.7134258**, from the combined refined spectral/covariance cover (`lower-bound/joint-fine-covariance.tex`, independently replayed by the IDE). The earlier covariance bridge is reported integrated on local master with CI pending push; the joint certificate's Lean integration is in progress. This research task assumes that existing improvement and does not redo its port. All recorded Gaussian reduction, source-cap and transfer qualifications remain.

Its exact cap is

\[
B_{\rm current}=\frac{3567129}{5000000}=0.7134258.
\]

These are the cap thresholds, not predictions of what the next computation will achieve:

| Desired endpoint | Required cap, strictly below | Drop from current cap |
|---|---:|---:|
| 1.4017 | \(10000/14017=0.713419419276593\ldots\) | \(6.380723407\ldots\times10^{-6}\) |
| 1.4018 | \(5000/7009=0.713368526180625\ldots\) | \(5.7273819375\ldots\times10^{-5}\) |
| 1.402 | \(500/701=0.713266761768902\ldots\) | \(1.59038231098\ldots\times10^{-4}\) |

For the main attack, use the convenient design target

\[
B_* = \frac{35663}{50000}=0.713260,
\qquad B_*^{-1}=1.402013291085999\ldots.
\]

A uniform cap at this rational value leaves a little room beyond 1.402. If the first complete new cover instead proves a smaller improvement over the current cap, publish that improvement too. A successful single row is not an endpoint.

The current certificate uses \(\varepsilon=149/200\); the main response attack uses \(\varepsilon=1891/2500\). **Certificates at these two parameters cannot be pasted together.** A hybrid cover needs every component proved at the same witness parameter.

## 2. The earlier plan, stated precisely

Set \(P=P_{1,0}\), \(Q=P_{2,1}\), and \(\varepsilon=1891/2500\). For bounded responses \(|f_\pm|\le1\), let

\[
h=(f_++f_-)/2,\quad k=(f_+-f_-)/2,\quad
Ph=tZ,\quad F=\varepsilon Qk.
\]

The exact objective is

\[
\mathcal N=t^2+\frac{\|F\|_2^2}{\varepsilon}
 -\underbrace{\bigl(\|Pk\|_2^2+\varepsilon\|Qh\|_2^2\bigr)}_{J}.
\]

For fixed dimension define

\[
J_n(t,F)=\inf\{\|Pk\|_2^2+\varepsilon\|Qh\|_2^2:
 |h\pm k|\le1,\ Ph=tZ,\ Qk=F/\varepsilon\},
\]

with value \(+\infty\) if the prescribed moments are infeasible. The required theorem is

\[
\boxed{J_n(t,F)\ge t^2+\|F\|_2^2/\varepsilon-B_*}
\]

for every finite dimension and every feasible pair. A finite collection of valid regional bounds may prove this jointly.

**Why this is preferable to unrestricted K:** the negative terms and the fact that all coefficients come from the same bounded responses can exclude the apparent adversaries of the relaxed cubic problem. We need control only of feasible responses. The exact support-function dual is already proved; the missing theorem is a successful uniform choice of dual certificates or a covering argument.

At fixed \((t,F)\), minimizing the retained penalty is convex. Maximizing \(t^2+\|F\|^2/\varepsilon-J_n(t,F)\) over \(F\) is not automatically an SDP. Any proposed global optimization must supply a valid upper relaxation or a justified cover.

## 3. First task: freeze the uncovered set and its budget

Create one coverage ledger at the chosen \(\varepsilon\) and target cap. Each entry must give its hypotheses, cap, proof/checker, dimension scope and which negative squares it uses. Include every applicable original-response and restricted-K theorem, taking the minimum of their complete upper bounds.

The current central interval is \(0.84\le t\le0.851\). Write

\[
q=\mathbb E[F\mid\text{remote coordinates}],\qquad e=\|q\|_2^2.
\]

Proved exclusions include:

- The moment-free ellipse \(e+(191/500)t^2\le9/40\).
- The full strip \(0\le t\le0.851,\ e\le0.0148\), with cap 0.713256.
- The stronger anisotropic sector-adjusted energy and phase/completion defects.
- The new weighted full-energy region and its central taper, with no projection-box restriction.
- The joint support/cumulant criteria and all applicable projection slabs.
- The exact restrictions from remote feasibility and the full sector-energy ellipsoid.

For orientation, at \(t=0.8456\), a putative response with \(\mathcal N>500/701\) must lie in the outer region

\[
0.0166059292\ldots+
\frac{\mathcal A_h+\varepsilon\|Qh+p\mathcal B_*\|^2}{0.54}
\le \mathcal E_{\rm adj}\le e<0.041319,
\qquad p=1/\varepsilon.
\]

It must also evade the other criteria. This is not a construction of a feasible response. For our stricter design cap \(B_*=0.713260\), the first number becomes
\(224011/13500000=0.0165934074\ldots\). Recompute exclusions at the chosen cap; do not use the slightly smaller survivor set for 1.402 as if it covered this stronger target.

The fixed central remote profile has

\[
\ell=1057/1250,\quad\beta=179/1250,\quad C'=2747927/2000000,
\quad B_0(t)=t^2-2\ell t+2\beta^2/\varepsilon+C'.
\]

The uniform allowance above this already-certified remote contribution is:

\[
\begin{array}{ll}
500/701:&240297199/2651182000000
 =9.063776044\ldots\times10^{-5},\\
B_*:&317219/3782000000
 =8.387599154\ldots\times10^{-5}.
\end{array}
\]

These allowances are above \(C'\), not above the Gaussian benchmark \(S\). The remote loss has already been paid. A total loss of \(10^{-4}\) cannot simply be inserted into the second line.

**Deliverable:** an exact budget/coverage ledger that identifies the central complement and the still-uncovered flank rows. Do not describe the central interval as the whole problem.

## 4. Main research task: one shared-response separation experiment

Start at \(t=1057/1250\) on the surviving intermediate-variance region. Use actual high-payoff bounded-response contacts as diagnostics, including coupled tensors and diffuse limits. Record all complex phases, full and remote energies, and the retained penalties.

For each prescribed tensor/contact, combine the following constraints on the **same unknown response pair**:

1. Polynomial multiplication contractions for both \(f_+\) and \(f_-\). Their degree-three tests link first, third and fifth moments; fifth moments remain free variables.
2. The joint Rice/support budget, including the transverse and even-sector terms.
3. Parseval and the compatible phase/completion defects.
4. Genuine cubic moment, contraction and covariance identities where used. Their scope must match the underlying cubic, not an abstract law with fewer constraints.

The smaller support-dual family already provided in the manuscript asks for a remote test \(v\) and \(\mu>8\varepsilon\) such that

\[
\mathcal R_\mu(v)\le B_*-B_0(t),
\]

where \(\mathcal N<B_0(t)+\mathcal R_\mu(v)\) is the proved joint-support bound. The proportional subfamily has now been tested and has an exact relaxation obstruction; do not resume tuning its scalar multipliers. Nonproportional contraction-generated tests remain an ansatz, not an assumed universal theorem.

If that restricted family fails, use the full polynomial-matrix dual. Convert successful dual multipliers to rational PSD certificates and prove a neighborhood of validity. If the relaxation remains above target, save the offending moment configuration and identify a missing realizability condition. Such a configuration may be a pseudoresponse, not an actual cubic or a counterexample to K.

**First meaningful milestone:** a certificate covering a nontrivial portion of the identified survivor region, expressed through tensor/Gram data and allowing arbitrary additional coordinates. A new isolated favorable box, without a reason remaining responses enter it, is not the milestone.

**Stop rule:** if a stable relaxation gap remains under refinement, stop refining that grid. Add a quantitatively separating, proved constraint or change the dual family. More quadrature accuracy does not fix a structural relaxation gap.

## 5. The main new lemma must remove dimension from the cover

There are two acceptable forms of this open lemma **[?]**:

**A. A covariant dual certificate.** Construct multipliers from the response tensor, its influence operators and finitely many contractions; prove the resulting operator/sum-of-squares inequality in every dimension. Optimize scalar coefficients over invariant ranges, not all tensor entries. Symmetry helps organize this ansatz but does not itself prove a finite invariant reduction.

**B. A proved projection alternative.** Every surviving tensor either has a projection in a certified family, or satisfies a complementary invariant inequality that gives the cap directly. The complementary branch must include diffuse tensors. Any approximation or replacement error must be paid by a retained deficit for that same response.

The existing six-moment slabs show that multiplication certificates can be strong: one gives a cap below 0.7124 with arbitrary extra coordinates. But no theorem puts all survivors in these slabs. Selecting a largest-influence coordinate does not prove that their particular moment patterns occur. Nor does small influence create an independent Gaussian buffer.

Prefer A initially: it uses the dimension-free multiplication identities already proved. Use B only when the data suggests a concrete dichotomy with a provable quantitative threshold. We do not currently have a uniform-in-dimension convergence theorem for the finite hierarchy.

**Go/no-go milestone:** exhibit the arbitrary-dimensional identity/inequality behind the candidate dual before commissioning an exhaustive numerical cover. A finite-dimensional search alone is not the missing dimension-free theorem.

## 6. Turn a central theorem into an endpoint

Once the central complement is controlled:

1. Cover the remaining \(t\) range, up to \(\sqrt\pi/2\), at the same \(\varepsilon\). Use the existing exclusions wherever valid, and new profiles/certificates on the remainder.
2. Optimize row profiles jointly with the certified error budget. Narrowing the peak-profile interval may recover useful room; the reported roughly 30% recovery is currently **[F]**, so it must be recomputed and certified before use.
3. Prove every cell and unbounded tail with exact or directed arithmetic. Check boundaries, overlaps and a uniform positive margin relative to \(500/701\).
4. Reuse the unchanged analytic reduction and transfer only with their exact hypotheses. Supply the new mathematical bridge and data to Lean, then run the complete checker/build/axiom audit/CI.

The final handoff must contain one complete cap, one reciprocal calculation, the full cover, standalone replay, manifest, and a dependency ledger. It must distinguish a verified mathematical certificate from a newly integrated Lean endpoint.

## 7. Parallel work, with bounded scope

### A. Land the improvement already won

Finish the separately assigned integration of the complete finer-spectral 1.401685105834 data, reusing the already integrated covariance layer as recorded by the IDE. This is a finite integration task. It should proceed in parallel with the new mathematics, not replace it.

Further same-witness tuning has a useful explicit checkpoint: a complete cap below \(10000/14017\) would pass 1.4017. Continue only while the exact full-cover cap improves; an improved nonbinding node is not progress toward that endpoint. Do not assume the old tables have a proved optimality ceiling.

### B. Higher-degree witnesses for larger gains

Keep the optimized degree-nine spectrum as a secondary research track. Its best reported challenger payoff is about 0.712056 **[F]**. This is a lower test of its norm, not an upper bound or a new Grothendieck bound.

The next tests must include simultaneous diffuse grades and coupled multi-coordinate responses. A rigorously evaluated challenger at or above \(500/701\) rules out that fixed spectrum for the 1.402 objective; a float violation triggers validation/reoptimization.

Use the signed-spectrum original-response identity and the same multiplication-certificate architecture to seek a universal upper bound. Do not spend most resources on more candidate spectra before one candidate has a workable upper-certification route. A finite Hermite spectrum is not yet a certified finite matrix game.

## 8. Avoid repeating exhausted or invalid routes

- Do not seek a universal coefficient smaller than \(1/3\) in the new covariance inequality \(Q_{\rm cov}\le\chi/3\); the genuine cubic sharpness family already rules that out, including relevant kurtosis ranges after dilution. This does not prove every richer cut is exhausted.
- Do not add gains from bounds that already spent the same \(Pk\), \(Qh\), or support-budget terms. Combine inequalities within one sound dual, or take the minimum of complete caps.
- Do not identify remote energy \(e\) with full \(\|F\|^2\). The moment slabs impose a full-energy hypothesis.
- Do not introduce a fresh buffer without a proved replacement cost. The naive smoothing cost is much larger than the central allowance.
- Do not impose unconstrained-maximizer Ward identities on arbitrary fixed-row responses. A separate maximizer-based proof needs its own quantifier and approximation argument.
- Do not resume fibrewise Gaussian domination, equal-variance peeling, the false weighted-content inequality, or law-only shared-driver comparisons.
- Do not treat quadrature agreement, successful low-dimensional searches, or the absence of counterexamples as a universal norm bound.

## 9. What the obstruction actually is

We can control the remote cubic law, and we can certify many shared-sector configurations. We have not yet proved that every high-payoff actual bounded response either lies in one of those configurations or must pay a sufficient retained projection penalty.

The missing interface is a **dimension-free joint realizability/cost inequality**, not another isolated moment constant. The response first/cubic/fifth coefficients, their shared phases and their negative projection costs must be controlled together. This is why the original-response plan remains the main plan.

## 10. Concrete next assignment and file map

**Completed branch [P,C]:** `ch25-parts/89-contact-concentration.tex` proves a cap below .71315 on the entire central interval when any remote normalized Wick direction carries at least 4/5 of the **full** cubic energy. The remainder can share every coordinate and visible sector. This is the desired kind of dimension-free response certificate: two covariant joint-support tests, one feasibility cut and a seven-endpoint proof. Both fresh integral replays pass; no raw-K or previous numerical theorem is an input.

**Completed mixed branch [P,C]:** `ch25-parts/89b-mixed-contact.tex` now proves N < .71295 when a remote normalized mixed-square direction X² conjugate(Y)/sqrt(2) carries at least 9/10 of the FULL cubic energy, throughout .84 <= t <= .851. At share 179/200 it gives N < .713225. X,Y are arbitrary orthogonal remote directions; the remainder may share all coordinates and sectors. The proof uses two fixed support integrals and four rational endpoint comparisons. Its canonical envelope is explicit for every concentration parameter 0 < eta <= 1, as a maximum of four rational affine functions of 1/eta. Both fresh integral replays pass. No raw-K or moment theorem is an input.

**Completed whole-subspace branches [P,C]:** `ch25-parts/89c-slice-contact.tex` now handles the entire remote holomorphic slice `S_X = {:X² conjugate(A):/sqrt(2): A remote}`. If its projection carries >=9/10 of the FULL energy, N<.71315 throughout .84<=t<=.851. The interior mixing parameter is covered by visible averaging, phase Jensen and a concave continuum envelope; neither endpoint interpolation alone nor pointwise squared-radius concavity is used. The same module handles `A_Y = conjugate(Y) H_{2,0}(Y-perp remote)`: share >=197/200 gives N<.713225; share >=99/100 gives N<.71305. The quadratic has arbitrary rank. Its Gaussian scale-mixture representation reduces every test to a product of two Gaussians, and this comparison is sharp as rank tends to infinity. Default and fine fresh directed replays pass. The cubic remainder is unrestricted and coupled in both results.

**Completed two-slice branch [P,C]:** `ch25-parts/89d-two-slice-contact.tex` now controls the full orthogonal sum W2=S_X1+S_X2, including arbitrary shared antiholomorphic drivers. Projection share >=39/40 of the FULL cubic energy gives N<.7132; share >=49/50 gives N<.7130, throughout .84<=t<=.851. This covers the previous two-way tensor F0=(X1² conjugate(X2)+X2² conjugate(X1))/2 and its coupled-remainder neighbourhood. The proof reduces all coefficients to a concave energy-weight triangle; five two-sided integrals per support row certify the entire triangle. It does not assert coverage of all tensors supported on two holomorphic coordinates: the subspace consists of the two repeated-holomorphic slices in one orthonormal frame.

**Canonical reduction [P]:** for r orthogonal repeated-holomorphic slices, the test support is bounded by three explicit profiles of two independent Gamma(r,1) variables. The weights are diagonal, internal off-diagonal, and external antiholomorphic energy. This unifies the one- and two-slice proofs. It also explains the limitation: the bound tends to constant-modulus support as r grows, since its phase averaging removes the diffuse spread. A growing slice cutoff alone cannot provide the sharp diffuse theorem.

**Completed phase-preserving branch [P,C]:** `ch25-parts/89e-phase-preserving-contact.tex` proves the sharp support over the whole subspace `H20(A) H01(B)` for mutually orthogonal remote input spaces. If `dim A=m`, its extremal law is `R_m G / sqrt(m(m+1))`, `R_m~Gamma(m,1)`, with an explicit finite-dimensional isotropic quadratic tensor attaining it. The support increases to the Gaussian support, with a closed O(1/m) error bound; it does not lose the Gaussian phase. The corresponding original-response caps are <.71325 on .84<=t<=.851 at full-energy projection shares 191/200,49/50,99/100,499/500,1999/2000 for m<=2,4,8,16,24. Antiholomorphic rank and the coupled remainder are unrestricted. Orthogonality concerns the selected test subspace only. These results require no raw-K or higher-moment theorem. They do not cover every self-interacting tensor. The spectral entrance test in the same module replaces a subspace search by `s_m(H_q-A_q) >= e+eta||F||^2`, where q is the remote part, e=||q||^2, H_q/A_q are its holomorphic/antiholomorphic derivative Grams, and s_m sums the largest at most m positive eigenvalues. The exact six-sector identity proves this sufficient criterion. It cannot trigger when H_q-A_q is positive semidefinite; this is a precise limitation of the spectral criterion, not of every geometric projection test.

**Next assignment:** intersect the prior survivor set with the new orthogonal-input-block exclusions above and all five earlier projection exclusions: diagonal Wick share <4/5, mixed-square share <179/200, whole holomorphic-slice share <9/10, orthogonal antiholomorphic-block share <197/200, and two-slice share <39/40. The unit three-cycle F3=(X1² conjugate(X2)+X2² conjugate(X3)+X3² conjugate(X1))/sqrt(6) has maximal two-slice share 2/3 and combined directional influence 1. It still escapes the concentration tests; this is geometry, not a counterexample to K or a constructed high-payoff response.

The next substantial target remains a uniform joint-response bound on this coupled complement or an exhaustive structural alternative with a paid response cost. The phase-preserving result supplies the sharp support for orthogonal holomorphic/antiholomorphic blocks; the next extension must handle their overlap, or prove a quantitative response-cost alternative when no large such projection exists. The general r-profile formula can help at small r, but its constant-modulus limit rules out treating it as a sharp diffuse replacement. Retain phases or the original-response joint defect in that regime. Preserve the existing low-energy and joint-defect criteria. Do not infer low influence, insert a free independent buffer, or double-spend the retained projection penalty. After a central cover, cover the flank rows at the same epsilon. These regional caps do not change the global endpoint.

Current target and obstruction:

- [Exact missing inequality and budget](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/lower-bound/obstruction-1402.tex)
- [Current state register](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch36-K-state.tex)
- [Canonical response geometry](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch25-parts/70-canonical-ellipse.tex)
- [Exact joint defect and rational correction](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch25-parts/87-joint-response-defect.tex)
- [Joint support and penalty constraints](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch25-parts/30-response-feasibility.tex)
- [Regional/support duals](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch25-parts/40-regional-and-cumulant-caps.tex)
- [Response multiplication and certified slabs](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/ch25-parts/80-response-moment-compressions.tex)

Reusable implementation:

- [Existing response/finite-witness handoff](/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/finite-witness-shared-response-20261021/HANDOFF.md)
- [Response hierarchy generator](/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/finite-witness-shared-response-20261021/response_hierarchy.py)
- [Exact dual checker](/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/finite-witness-shared-response-20261021/verify_response_dual.py)
- [Exact box checker](/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/finite-witness-shared-response-20261021/check_response_box.py)
- [Finite-spectrum source and scope](/Users/alingalatan/workspaces/grothe/handoff/research-third-decimal/handoff-2026-10-15/lower-bound/finite-spectrum-20261021.tex)
- [Current complete certificate: Lean integration handoff](/Users/alingalatan/Documents/Codex/2026-10-10/plea/outputs/spectral-covariance-envelope-20261022/LEAN_HANDOFF.md)

No new endpoint or new covering theorem is claimed by this plan. No numbered chapter is allocated, and existing theorem statements are not replaced.

### Update: whole-core milestone and the next structural target (22 October)

The spherical-core theorem now handles the entire H21 on any remote core of dimensions 2,3,4,6,8 under full-energy shares .935,.962,.976,.992,.9999, with all input overlap and arbitrary dependent remainder. It closes the three-cycle example. Canonical proof: harmonic plus trace decomposition -> two radial gamma profiles -> concave scalar support -> original-response cap. Source: ch25-parts/89f-spherical-core-contact.tex; portable package: handoff/research-third-decimal/spherical-response-contact-20261022/.

Do NOT conclude that the complement has small influence. The exact Q_N family in the new proof has order-one maximal influence and vanishing fixed-core shares. The next useful structural statement must combine the core branch with the Gaussian-factor branch, retaining a quantitative same-response deficit through their shared driver. The target is not another arbitrary rank cutoff.

Also do NOT substitute one-sided Gaussian support domination for the paired norm when tests involve Z: the explicit D=-.01 H(Z) counterexample has one-sided gap >.0025. Use E(|L+D|+|L-D|)/2 throughout. Remote tests alone permit one-sided reduction. No new complete endpoint is claimed.
