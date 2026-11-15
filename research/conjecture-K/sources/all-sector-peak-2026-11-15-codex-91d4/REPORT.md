<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/REPORT.md, 2026-11-15 13:27; Agent-ID: codex-91d4. -->
# Direct all-sector peak bound — Phase A and partial Phase B

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
Handoff for **claude-b9ee**. No tracked repository edits.

## Phase A decision, before certification

**External review update:** [claude-b9ee's review](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6893452582)
independently re-derived and replayed the regional theorem (P+C),
re-derived the Psi reduction and conditional assembly (P), and replayed
the scalar cession (which retains author-level C status in the review).
His isolated replay passed in 65 seconds. The shared moments, quadrature
bound and tiny odd strip were explicitly **not reviewed**. Full-domain
closure remains open. See `reviews/REVIEW_STATUS.md` for exact scope.

**Select the averaged directional-secant premise below for the next
certification attempt.** It is stronger than the requested trial cap,
has survived the specified genuine-chaos tests, and stays finite at
quadratic zeros. Its universal validity remains **OPEN**. Neither a
numerical search nor the scalar assembly proves this missing premise.

Write `X=L+E+(3/5)R`, `H=O-cZ`, `R=r_A+.5053r_B`,
`U=r_B-.5053r_A`, and define

```
Psi(X,H) = 2(sqrt(|X|²+|H|²)-|X|)
           - (Re(X conjugate(H)))²/(|X|²+|H|²)^(3/2),
```

with the quotient zero at `(X,H)=(0,0)`. The proposed premise is

```
(P_Psi): for every admissible genuine tuple, there exists ONE global
complex c such that

|c|² + E Psi(X,O-cZ) - p||O||²
  <= .01||U||² + sigma(u) - D_minus(q) + 50e-6.
```

The initial stronger version fixes `c=0`; the numerical tests support
it on the tested families. No sample-dependent visible coefficient is
allowed. The remote trial is always the prescribed `xi0=-(3/5)R`.

**P:** The exact central norm secant is at most Psi. This follows by
squaring the sum of the two norms and applying square-root concavity
twice. Psi is continuous at zero, retains the full directional cross
terms and has the correct leading Hessian away from zero. It is not a
conditional quadratic majorant. The full proof is in
`analytic/P_ALL_REDUCTION.md`.

**Conditional payoff:** (P_Psi), the original (P), and the inherited
content inputs give the requested explicit-trial cap **strictly below
S+99e-6**, hence below S+1e-4. The scalar consequence uses the existing
cession `J_AB+.01||U||²-D_plus<49e-6`. Its signed-D cancellation needs
no further .36e-6 remote surcharge. This implication does not assert
either missing universal premise.

## Agreed certificate split

Agreement is recorded on
[#436](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6893021242).

- **codex-a7c4:** all O=0 premise (P), its constants, covered regions,
  and the remaining compact interior. No duplicate A/B core cover is
  constructed here.
- **codex-91d4:** the averaged odd extension, shared-chaos moments,
  treatment of singular regions and tails, and the final scalar
  absorption. a7c4 explicitly confirmed that the .01 U-cost cession
  belongs to this final assembly and does not change his pointwise
  .31/.08 constants.

`inputs/SHARED_INTERFACE.json` freezes a7c4's rational schema and hash.
It is an interface, **not acceptance data**. The reviewed exterior is
`|w|²/2+S_r>=891/500`. Stronger exterior/local regions reported in
PR #437 at `c2307681c2863a54be751b32e55091d31e43a578` have historical
author-only labels in that frozen schema. Current STATUS 7.4.11–12
records their subsequent independent P+C review by claude-b9ee
([review #437](https://github.com/agalatan/grothendieck-lean/pull/437#issuecomment-6893325714)).
No frozen source input is changed or new region consumed by this update.
Full (P) is still open.

The shared integration primitive is the distributional angular
inequality `f'' >= -sum k²|c_k|` for a finite Fourier norm, which remains
valid at zeros. The even code's radial monotonicity is not silently
extended to odd harmonics. A separate radial interpolation enclosure
is developed in this folder, preserving the actual outer Gaussian
dependence. A complete even box list does not yet exist to consume.

## Exact reduction and what is being tested

For `V=||r_A||²+||r_B||²`, `W=||O||²`, the canonical two-norm identity is

```
trial_all - S = J_AB_trial + J_O(c) - D - sigma,
J_AB_trial = 2E|X|-2E|L+q| + (9/25)||R||² - pV,
J_O(c) = |c|²+E[|X+H|+|X-H|-2|X|]-pW.
```

Conditional on (P), the unrounded upper bound on `J_AB_trial` is

```
J_AB = 2Re<c_A,R>+2Re<e,r_B>
       -.31||R||²-.08||U||²+2V(u+V-.0463).
```

The contents are the matched tilted contents, with `e=c_B-.5053c_A`.
The tests separately record the actual explicit-trial residual, the
sufficient budget `M=J_AB+J_O-D-sigma`, and the allocation residual
`J_O-.01||U||²-sigma+D_minus`. Each is also evaluated with Psi in place
of the central secant where the numerical rule supports that calculation.
Success of the actual trial is not mistaken for success of M or P_Psi.

All energies use normalized genuine Hermite sectors and the stated
u, total-energy and weighted response caps. The #433 penalty is not
inserted into this arbitrary-cubic target; its permitted actual-response
interface remains in `inputs/RESPONSE_PENALTY_MAP.md`.

## Numerical decision evidence — N only

The one-variable lane uses 23 named configurations, 62 bounded local
search attempts and 11 selected points rechecked on two finer rules.
It varies all genuine complex sector coefficients, with the remote
trial fixed and either c=0 or one optimized global complex c. It covers
the two old witnesses, near-u-star data and genuine near-(P) embeddings.

- Largest fine actual c=0 trial minus S: about `-.001951006716`.
- Largest fine M and M_Psi: about `-.001950638614`, with odd amplitude
  numerically zero.
- Largest allocation and Psi-allocation residual: approximately zero
  at `u=.04034481`, U and O approximately zero. The largest selected
  nonzero-odd fine Psi-allocation residual is about `-9.79605e-5`.
- Optimizing global c improves the selected trial/M by at most
  `5.87148e-6`. The largest selected Psi-to-exact secant gap is about
  `.000245378` at the near-(P) embedding Y=2.5; its M_Psi is still about
  `-.0141962`.

The multivariate lane includes 88 near-peak genuine cores and 1,760
nonzero finite odd tests, eight independent-seed selected refinements,
12 finite triple-product mixture models, and 34 witness-plus-bath
stress configurations. In the near-peak bank every sampled nonzero
J_Psi is negative. The bath tests add remote energy to the old low-u
witnesses with a shared cubic `Y(|X|²-1)` in three phases or a disjoint
cubic filler, reaching u-star while enforcing all caps.

- Refined bath maximum Psi-allocation residual: `-3.88178794e-5`
  (c=0 value about `-3.87476e-5`).
- The old low-u common-trial witness has positive J_Psi about
  `.000461856`; its energy slack about `.00204579` pays for it.
- Exact conditional Gaussian-mixture numerical refinement gives
  maximum M about `-4.29430889e-5` at O=0 and about `-9.31400903e-5`
  among the tested nonzero odd choices.

The high-dimensional raw absolute and D estimates are not uniformly
accurate. Direct Sobol baselines include false positives already
incompatible with the inherited remote bound. They remain in the data
as diagnostics, not acceptance evidence. The finite triple-product
family admits an exact random-variance Rice reduction and has D>=0
by concavity of B; this avoids guessing the sign of a noisy D estimate.
The mixture refinement evaluates exact central secants numerically;
its Psi integral is **not yet evaluated** by that refinement. A proved
conditional Gaussian Laplace formula for Psi is supplied separately.
Direct paired Psi sampling is labelled N throughout.

Three unsuccessful constrained one-variable solves retain explicitly
flagged feasible iterates; an earlier infeasible SLSQP excursion is
rejected, not counted as a candidate. Canonical two-norm, gradient,
literal-budget and pointwise-Psi controls pass numerically. See the
lane reports for exact coefficients, seeds and replay instructions.

## Proven ingredients and the remaining certification obligation

`analytic/SHARED_ODD_MOMENTS.md` proves, by normalized tensor
contractions and chaos orthogonality, the arbitrary-sharing bounds

```
E|q|²|Q|²<=17uW_Q, E|q|²|P|²<=12uW_P,
E S_r|Q|²<=3VW_Q, E S_r|P|²<=3VW_P,
E|Q|⁴<=9W_Q², E|P|⁴<=6W_P², E|Q|²|P|²<=7W_QW_P,
```

and a sharp joint odd fourth-moment envelope retaining the nu terms.
These are **P, author-only**. They control polynomial tails and permit
explicit exceptional-set estimates. They do not by themselves prove
a useful small-ball bound for X or the averaged premise P_Psi.

The outstanding Phase B obligation is a dimension-free averaged bound
on that kernel under the genuine joint law, including the singular
regions, with outward integration and tails. Positive moment bounds
cannot be applied with negative coefficients, mixed terms cannot be
removed by unweighted centering, and a local numerical optimizer is
not an upper certificate. The exact scalar cession, moment arithmetic
and quadrature-error primitives can be checked independently; their
success must not be reported as a certificate of P_Psi.

## Phase B: checked ingredients and actual regional conclusions

Phase A was reported before these certification runs.

**P + C, re-derived and replayed by claude-b9ee: a direct all-sector energy region is closed.**
For the prescribed trial with c=0, in every dimension and with arbitrary
sharing, the target holds whenever

```
(771/500)u + (43/250)V - (16/125)(W_Q+W_P) - (33/100)W_nu
    <= 1087/500000.
```

Equivalently the left side is `1.542u+.172V-.128(W_Q+W_P)-.330W_nu`
and the right side is `.002174`. This theorem does **not** use (P).
It follows by the canonical parallelogram inequality at L and exact
remote-chaos orthogonality, followed by a two-by-two quadratic-form
bound. The four visible integrals are enclosed by global rational
polynomial envelopes on the entire positive half-line and exact Gamma
moments. The strict reserve exceeds `2.45e-7`, using the inherited
certified lower bound for S. See `analytic/REGIONAL_DIRECT_BOUND.md`
and `analytic/verify_region.py`. The proof and checker were independently
audited within this Codex task and subsequently re-derived and replayed
by claude-b9ee in the linked review.

**P, author-only, with inherited remote C: a tiny uniform odd strip is closed.**
The averaged Psi premise holds for every admissible genuine core when
`W<=1540081/2500000000000000 = 6.160324e-10`, with c=0. This uses
`Psi<=2|O|` and `sigma-D_minus>-.36e-6`. It is a genuine averaged
statement, but covers very little of the relevant odd-energy range.
Its all-sector consequence still uses the original (P).

**C, scoped scalar consequence:** the bundled 4,000-cell cession replay
passes. The main row's worst rational upper bound is approximately
`48.386896958e-6`, below its strict `49e-6` cap. The new signed-D
assembly therefore gives `<S+99e-6` **if P_Psi and (P) hold**. No
additional remote error is charged. Optimized-Python execution is
rejected.

**P + C, author-only, integration and moment primitives:** exact arithmetic reproduces
the sharp product constants and odd fourth-moment coefficients. The
new odd-safe visible quadrature proof permits norm zeros and supplies
positive radial interpolation weights and an explicit Gaussian tail.
For c=0, radius 6, 8192 radial intervals (8193 endpoints) and 8192 angular
nodes, the verified upper error is
`4.4502641819531102820468343e-7 < 4.48e-7`. Six deliberately incorrect
coefficient/budget choices are rejected. This certifies only the
error of the positive two-norm quadrature, **not its outer expectation,
a lower baseline, or a Psi integral**. No enormous tensor grid was
evaluated or prescribed as an outer proof.

**The main averaged closure is still missing.** A focused attempt with
the available moments quantifies why a simple cutoff plus separate
positive tail charges does not suffice. Even on a favorable zero-shell
energy tuple near u-star with W=.01, optimizing the explicit estimate
`W/tau+tau min(1,tau²/a²)` gives about `.07420539`, whereas the required
Psi budget is about `.01327`. A deliberately generous rigorous upper
bound on the required budget is below `.071`, so the failure of that
particular sufficient recipe does not depend on numerical precision.
Sharp mixed moments improve a separate exterior tail charge to about
`.00608436`, still roughly 122 times 50e-6. These are failures of the
specified estimates, **not counterexamples** to P_Psi or the trial cap.
`analytic/AVERAGED_CLOSURE_ATTEMPT.md` and its exact size checker state
the assumptions and the distinction explicitly.

The remaining domain includes nonzero A/B cores near u-star with
ordinary finite odd energy. It needs a bound on the weighted joint law
and directional term, retaining the negative costs before integration.
The sharp positive moments and better quadrature do not supply that
bound. No global P_Psi or full-cap all-sector certificate is claimed.

## Review follow-up: discriminant feasibility

**P, author-only:** the suggested anti-concentration route has a useful
specialized input. Write A=r_A, B=r_B and
`D1=conjugate(A)(sqrt(2)B-A)-ab`. A visible zero at which both
Wirtinger derivatives vanish must satisfy D1=0. For every joint law
of the two holomorphic linear drivers, including degenerate covariance,

```
Pr(|D1|<=delta) <= 2delta/[e(ab-delta)],  0<delta<ab.
```

The proof diagonalizes a Hermitian Gaussian quadratic form with at
most one positive and one negative eigenvalue; it needs no independence
between the drivers and the other sectors. On `S_r<=891/500`, a visible
point with `sqrt(|X_z|²+|X_conjugate(z)|²)<=g<=a/2` forces
`|D1|<=20g`. These give an explicit probability bound for near-rank-zero
cores, rather than a generic Carbery–Wright estimate.

This is **not** the missing averaged secant theorem. An additional
value defect involving q can vanish identically for admissible genuine
data outside the proved regional energy half-space. Rank-one singular
zeros also occur away from D1=0. Neither two independent small-ball
factors nor a uniform inverse-norm bound on the complement is justified.
The weighted finite secant, the other singular configurations and the
remaining energy budget must still be controlled.

`analytic/DISCRIMINANT_FEASIBILITY.md` gives the proof and limitations;
`analytic/verify_discriminant.py` checks only its rational constants and
explicit examples. In particular, its 50e-6 Hölder allocation check
uses the reference bound `E|O|^4<=43/20000`, **not the whole response
ellipsoid**. No new all-sector region or full-domain certificate is
claimed by this follow-up.

## Replay and handoff status

A fresh isolated combined replay passed in **67.265 seconds**,
regenerating all principal N searches/selections and the three main
exact checks from programs and frozen proof inputs. Its receipt is
`replay_runs/codex-91d4-clean-full/RECEIPT.json`. The subsequent
cutoff-size diagnostic is included in the current replay entry point
and is checked separately with the exact-only mode. Logs, input/output
hashes, rational values and negative controls are retained.

After the external review, a fresh isolated replay of all **five**
current exact entry points and their optimized-Python rejection
controls passed in **0.694 seconds**. Its receipt is
`replay_runs/codex-91d4-review-followup-exact/RECEIPT.json`.
The new discriminant checker also rejects three invalid constants or
examples. No N source or earlier theorem checker changed, so the
numerical searches were not repeated for this follow-up.

The repository and old handoffs are unchanged. This is a partially
reviewed Phase B delivery, with the agreed division of work maintained.
claude-b9ee will integrate the accepted regional theorem, Psi reduction
and conditional assembly. **Layer L5 remains open.**
