# Common-tail dual and a cubic Gaussian-phase architecture ceiling

Worktree: `/Users/alingalatan/workspaces/grothe-codex-joint-image`.
Branch: `codex/joint-response-delivery-20261023`.
The upper focus is the conditional target `1.404598149141`; previous
endpoint comparisons are in [the preserved upper-bound archive](../archive/weaker-upper-bounds/README.md).
The integrated baseline is GitHub master `b1e3598`. Its concrete upper-rounding
theorem and split native checks are preserved. The default lower theorem still
uses `NodeCaps`; the heavy separate caps route is not reverified by this work.

## Main result and its scope

We now have an exact separator for the **whole Gaussian-phase cubic
preprocessor family**, including arbitrary complex phases and convex mixtures:

\[
K_{A,B}(\rho)=H_{\rm phys}(A\rho+B\rho^3),\qquad |A|+|B|\le1.
\]

Its full reciprocal score is at most `0.71186`. The incumbent score is
`0.711947399729542982`. Thus further optimization or convex mixing inside this
family cannot beat the incumbent. This is a restriction on a rounding
architecture, **not** a new Grothendieck endpoint and **not** a bound on arbitrary
genuine cubic-phase responses. Non-Gaussian finite cubics and responses using
shared nonlinear features are outside the class.

The proof uses the linear functional

\[
\Phi(c)=\Re(c_0-\tfrac9{25}c_1-c_2-c_3).
\]

The full score formed from real mixed coefficients is bounded by this
functional. Every column in the family has `Phi < 0.71186`; the same non-strict
bound holds for probability mixtures and their coefficient-l1 closure. We
average the **separator**, not individual full-score bounds: the latter would
be invalid because the full score is concave.

The key issue in extending the real calculation was complex phase freedom.
The physical Gaussian phase kernel is `sum a_j z |z|^(2j)`, not the
holomorphic odd series. After factoring the phase of A, the separator is a
quadratic Laurent polynomial in the phase of B. Two exact positive
Bernstein certificates prove its modulus is largest on the negative real
axis. A six-coefficient tangent remainder certificate bounds the remaining
degree-seven real polynomial. The resulting exact cap is less than
`0.711853539824`, with comfortable margin below `0.71186`.

The full written proof, including all four physical-kernel coefficients, is:

- [/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/cubic-phase-separator-20261023.tex](/Users/alingalatan/workspaces/grothe-codex-joint-image/docs/research/cubic-phase-separator-20261023.tex)
- [/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_cubic_phase_ceiling.py](/Users/alingalatan/workspaces/grothe-codex-joint-image/tools/verify_cubic_phase_ceiling.py)

The verifier reconstructs every rational Bernstein polynomial exactly. It
does not search over sampled phases or dimensions. The Lean generator emits
transparent polynomial identities and positivity proofs, with no numerical
native axiom.

## The common signed tail changes the pool diagnosis

For `R_i = K(rho_i)-rho_i*c0-rho_i^3*c1`, the earlier screen bounded each
`|R_i|` independently by `rho_i^5 * tail`. This discards that every residual
uses the **same signed coefficient sequence**.

It is enough instead to require

\[
\left|\sum_i a_i\rho_i^{2k+1}\right|\le1\quad(k\ge2).
\]

Then `D(c) <= c0-s*c1-sum a_i R_i` for `|s|<=1`. The price is admissible at
every index if it passes the finite front `2 <= k <= 64` and the geometric
budget `sum |a_i| rho_i^131 <= 1`. This is a proof for the entire infinite
tail, not a finite multiplier scan.

The error allowance retains the actual low-mode weights:

\[
 |1+\sum a_i\rho_i|e_0+
 |-s+\sum a_i\rho_i^3|e_1+\sum |a_i|e_i.
\]

This matters when large price coefficients cancel. The price search can
incorporate these error costs rather than minimize a midpoint bound first.

With updated projection estimates and unchanged original-noise kernels, the
twelve-column midpoint screen is about `0.711605880`. With **assumed** head
errors `1e-6` and kernel errors `1e-5`, a rationalized price gives the conditional
bound `0.711902941`. With larger assumptions `1e-5` and `1e-4`, it gives only
`0.712203821`. Thus the earlier apparent pool headroom near `0.712036` is not
robust to retaining the common tail, but these calculations still **do not
certify exclusion**. No deterministic error enclosures for the ten numerical
response columns have been supplied.

The two analytic baseline columns are separately enclosed by exact positive
series with infinite remainder bounds. The standard-library replay checks
the finite front, geometric tail, analytic baselines, conditional interval
arithmetic, and rejection of three corruptions. Passing it certifies the
prices and conditional algebra, not the numerical response integrals.

## Projection improvement preserves the shared driver

The first/cubic projection integrals can be reduced from six scalar uniforms
to four by analytically integrating the relative phase. The resulting circle
phase integral has explicit hypergeometric/elliptic formulas. Exact phase-Z
and phase-q anchors remove large radial contributions from the estimators.

The shared state is retained: `A_Y = (|G|^2+V-d)/sqrt(d)` uses exactly the same
`|G|` that appears in `q = R G/sqrt(m(m+1))`. None of these controls changes
the response, its original Gaussian noise, or its chaos grade.

The maximum change from the old stored heads is about `2.69e-5`; the largest
head difference between the two new power-20 scrambles is about `2.92e-6`.
Cross-scramble bilinear projection products avoid the plug-in product bias.
These are numerical diagnostics, not deterministic integration errors. The
kernel uncertainty remains the dominant obstacle to a certified pool screen.

## The separator is not a new global lower witness

The degree-seven separator has multipliers `(1,-0.36,-1,-1)` and zero higher
multipliers. A restricted exact image space in two graded Gaussian coordinates
has eleven charge-one modes of weighted degree at most seven. A droplet
best-response search in this larger space found independently evaluated
payoffs near `0.7742`--`0.7745`. This is floating evidence that the separator
is a poor global lower witness, not a universal cap of `0.71186`.

All four starts approached essentially the same visible radial response;
the grade-three-input coefficients were small. The first mixed coefficient
was near `0.4813`. A high adversarial payoff therefore supplies no competitive
full upper score by itself. This run should not be advertised as a new
rounding mechanism.

These graded Gaussian columns are admissible closure objects: replace the
grade-three coordinate by the genuine symmetric cubic q_m on fresh original
coordinates, use the original-noise replica limit, and apply the fixed-noise
smoothing/l1 argument in the preceding replica note. This gives no quantitative
finite dimension or unsmoothed uniform phase-tail estimate.

## Lean and the remaining analytic interface

Five results in
[/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Upper/SpectralScreen.lean](/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Upper/SpectralScreen.lean)
prove all-index admissibility, the common signed-tail bound, the full-score
inequality, affine error propagation, and finite-mixture separation.

Ten public results in
[/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Upper/CubicPhaseScreen.lean](/Users/alingalatan/workspaces/grothe-codex-joint-image/Grothe/Upper/CubicPhaseScreen.lean)
prove the exact triangle positivity, complex modulus comparison, real
polynomial cap, and full-score implication from the low-coefficient identity.

Both targets compile. The dedicated fifteen-theorem axiom report uses only
`propext`, `Classical.choice`, and `Quot.sound`. The modules are imported by the
root and required by the global audit configuration. No new axiom, `sorry`,
or `native_decide` fact is introduced. After rebasing onto current GitHub master,
the global configuration contains 372 reports. The complete build/audit runs
in CI; local validation targets every module added by this branch.

The general Gaussian phase identity is already in Lean elsewhere in the repo.
Composing it with arbitrary complex A,B, extracting the four displayed
coefficients, normalizing their common phase, and passing to the closure are
written applications, **not one end-to-end Lean theorem** in this module.
The theorem `full_score_cap_of_low_identity` exposes that application identity
as an explicit hypothesis. No numerical integral value is hidden in the module.

## Next target

Stop treating more optimization of the linear Gaussian-phase cubic family as
a route past the incumbent; the separator rules that out. Retain nonlinear
shared image fields or leave the phase-of-linear-form architecture, then use
the common-tail dual to test whether a new pool actually has headroom. An
oracle that attacks only one phase family can miss large adversaries even
when its finite-pool dual looks excellent.

Before another endpoint claim, either certify all necessary original-noise
integrals and recover a competitive **full** signed score, or prove a
dimension-free cap for the new witness against all bounded responses. Neither
obligation is settled by the present architecture theorem.

## Integration with GitHub master

This delivery rebases all joint-response work onto GitHub master `b1e3598` as
one commit on a fresh, previously unpublished Codex branch. The published
predecessor stays intact. Commit subjects and ready-branch names identify
Codex. Master's new parallel-ready/self-retry CI workflow is inherited without
modification. Master's numerical endpoints, concrete upper-rounding theorem,
single-threaded native checks, `--caps` audit mode, native-fact allowlist and
CI delivery workflow are preserved. All 140 source-closure files protected by
the node-cap stamp are unchanged. The missing first heavy-cap verification
stamp is an inherited status, not a verification supplied by this branch.

The default report now includes 372 selected theorems, including 61 additional
results from this branch. Those 61 can be audited without triggering a full
endpoint build:

```sh
cd /Users/alingalatan/workspaces/grothe-codex-joint-image
/Users/alingalatan/.elan/bin/lake build Grothe.Lower.PrimalAudit Grothe.Lower.SteinFusion Grothe.LowerAnalytic.QuadraticFeatures Grothe.LowerAnalytic.ReplicaState Grothe.LowerAnalytic.ResponseGram Grothe.LowerAnalytic.TwoDisc Grothe.Upper.KernelScreen Grothe.Upper.SpectralScreen Grothe.Upper.CubicPhaseScreen
/Users/alingalatan/.elan/bin/lake env lean /Users/alingalatan/workspaces/grothe-codex-joint-image/scratch/AxiomsJointResponse.lean
```

The README, proof inventory and top-level overview reflect the current master
interfaces: the actual upper rounding's structure is already proved. The
truncation is still supplied with its L² and charge-one properties, as well as
the three numerical inequalities. The default lower theorem retains `NodeCaps`, while
the separate heavy route and localized central rows have their own validation
obligations. These changes avoid repeating formalization already completed
on master. The new response theorems require no changed numerical constants.

Master's response-geometry work and this delivery have different roles. Its
`ResponseCompression.bounded_response_compression` constructs multiplication
by one actual bounded response on L² and retains repeated moment entries and
cross-degree companions. Our projection Gram budgets are additional necessary
constraints; arbitrary feasible Gram completions are not thereby realized as
Gaussian responses. Both interfaces are retained.

The two cubic-family ceilings also concern different sides of duality.
Master's `ScalarCubicFamilyCeiling` bounds the performance of scalar cubic
**lower witnesses**, using actual-response pairing inputs. Our
`CubicPhaseScreen` bounds the full score of a Gaussian-phase **upper rounding
family**. Neither replaces the other or changes a universal endpoint.
Master's quintic-transfer audit remains available alongside the stronger
all-index signed-tail prices here; a finite necessary score remains an upper
relaxation, not an achieved rounding score.

The combined 116-theorem response audit covers both families and rejects all
native facts:

```sh
cd /Users/alingalatan/workspaces/grothe-codex-joint-image
/Users/alingalatan/.elan/bin/lake env lean /Users/alingalatan/workspaces/grothe-codex-joint-image/scratch/AxiomsResponseIntegration.lean | python3 /Users/alingalatan/workspaces/grothe-codex-joint-image/scripts/check_axioms.py --responses
```
