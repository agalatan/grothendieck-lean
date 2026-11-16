<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-ab-sector-2026-11-15/REPORT.md (15 November 2026); codex-91d4, task #426. Only this line was added. -->
# B-shell and joint A/B: Phase 0 decision and bounded proof progress

Agent-ID: **codex-91d4**. Issue #426. 15 November 2026.
Repository baseline: `9b0937ff7386ee9fdc41a7f976ed6a6d2f814153`.

**Verdict: the presently certified inputs do not close the joint bound.**
The numerical Phase 0 supports **route 2**, retaining `(s_A,s_B)=(3/5,0)`
and strengthening the content certificates. It supplies a concrete
conditional budget below `5×10⁻⁵`, but neither its global cost premise nor
its two content-versus-deficit premises has been certified. Heavy interval
coverage has deliberately not been started before this decision report.

One small result is complete on paper with exact scalar checks:

    ‖c_B(q)‖² ≤ (436959/3125000) δ < .14 δ  when δ>0.

It holds at the peak for every finite-dimensional remote complex `(2,1)`
cubic, at every energy; the non-strict `.14δ` form includes δ=0.
This is **P + C, author only**, with an independent rederivation within
this session. It is a structural bound against δ, not the requested
deficit bound. It uses the reviewed positive B-kernel representation and
the reviewed trace-sensitive cubic Stein/resolvent identity.

## Phase-by-phase status

| phase | verdict | evidence and remaining obligation |
|---|---|---|
| 0a, joint cost | N reconnaissance completed | Four tilts, both phases, finite-amplitude optimization and finer witness quadrature. Candidate `K=.23I` at tilt `(.6,0)`; global validity open. |
| 0b, contents | N probes completed | Wick monomial, finite bath families, archived and explicit 2/3-variable tensors; 33 energy/family cases at two quadrature resolutions. Not an all-tensor search. |
| 0c, budget | Conditional exact arithmetic completed; no unconditional closure | Route 2 targets below meet the error allowance. Existing saved envelopes cannot simply be relabelled with A coefficient .15. |
| 1, global joint secant | Open | Symmetry, a joint monotone-root Hessian representation, exterior inequalities and Cartesian interpolation contract derived. Zero accepted continuum boxes; no global supremum attained or certified. |
| 2, content versus deficit | Open; structural B bound above proved | New `.14δ` bound is insufficient. Energy-dependent B barriers and new A/B deficit covers are missing. |
| 3, assembly | P, conditional only | Exact completion of squares and both signs of D treated. No missing premise silently assumed. |
| 4, raw compact box | Open | Small reproducible N search found no obstruction. No interval cover or third-order remainder certificate. |

## The selected conditional target

Keep the task's peak parameters, arbitrary finite dimension, every remote
`q∈H₂,₁` with `u≤463/10000`, and all remote holomorphic linear forms
`r_A,r_B`, with arbitrary sharing and amplitude. Seek these three bounds:

1. For **all** complex `w,α,β`, the retained joint secant at `(s,t)=(.6,0)`
   satisfies `Rem≤(p−.36−.23)|α|²+(p−.23)|β|²`.
2. `‖c_(A,.6)(q)‖²≤.15D₊+6×10⁻⁶`.
3. `‖c_B(q)‖²≤.06D₊+4×10⁻⁶`.

Together they give joint gain at most

    (21/23)D₊ + 1/23000.

For `D≥0`, subtracting the original deficit gives an upper bound
`S+1/23000`. For `D<0`, use the reviewed remote cap with error
`9/25000000`. Thus the desired all-amplitude conclusion would be

    Λ̂(q+(T−1)r_A+Z²conj(r_B)/√2)
       < S + 1/23000 + 9/25000000
       = S + 25207/575000000
       < S + 5×10⁻⁵.

All three numbered statements are **targets, not conclusions**.
The arithmetic leaves approximately `6.16×10⁻⁶` below the requested joint
allowance, already including the remote error. The remote error is not
multiplied by `1−κ` when using D₊.

## Why the current inputs do not close it

At the requested tilt the zero-core cost matrix is approximately
`[[.44670706,.37120568],[.37120568,.94020220]]`, with least eigenvalue
`.2477215041`. Its inverse AA entry is about `3.33167206`: the existing
A coefficient `.3` already consumes approximately `.99950162` of a
separately budgeted A allowance even at this necessary local matrix.
This is a limitation on such a scalar budgeting argument, not a
counterexample to a joint inequality with correlated contents.

For the simpler proposed `K=.23I`, the existing `.3` A coefficient alone
would give `κ=30/23>1`. Tightening is essential for this proposal.
The finite numerical examples instead have a largest tilted-A
content²/D near `.0127`, B-content²/D near `.02163`, and quadratic
joint proxy/D near `.1435` for `K=.23I`. These are favorable tests, not
proofs of the proposed `.15` and `.06` coefficients.

Reusing the existing accepted dual pool and the current content upper
envelope does not establish `.15D₊+6×10⁻⁶`. At `(u,χ)=(.0463,3)`, the
selected content upper envelope is `.000209009775`, while the best saved
deficit lower expression is about `.0008450949624`. That pairing requires
γ above `.2402`, or an additive content allowance above `8.22×10⁻⁵` at
γ=.15. Another tested node requires γ above `.2747`. The exact diagnostic
and its scope are in BUDGET_AUDIT.md. These are limitations of saved
envelope pairs, not lower bounds on the actual content or a refutation
of the desired theorem. New content barriers or stronger remote duals
are needed; route 3 also needs more than these same coarse envelopes.

## Correction to the task and newer work

The assertion "B cannot be tilted" is too strong. Although `conj(r_B)`
is not an admissible retained multiplier, `r_B` is: take
`ξ=−s r_A−t r_B`. This changes the B-content to `c_B+t c₀` and the
penalty to `pI−(s,t)ᵀ(s,t)`. The extra angular component and cross penalty
must both be included.

The active work under #421 already derives an improved centered alignment
and a tilted-B bound at `t=.30318`; this delivery does not claim those
results as new or externally reviewed. However, a finite-amplitude probe
at `(s,t)=(.6,.30318)` finds cost near `.09577247`, far below its local
zero-core eigenvalue `.38985747`. The corresponding inverse factor along
the aligned content direction is at least about `12.9934` numerically.
The existing `.3` content coefficient therefore cannot close that
particular matched-tilt relaxation. Details and precise witness parameters
are in SECANT_NUMERICS.md.

## Deliverable and trust boundary

REPORT.md is the Phase 0 decision point requested before heavy compute.
CONTENT_STRUCTURE.md proves the new limited structural result;
GEOMETRY.md contains the joint reductions and conditional assembly;
CONTENT_NUMERICS.md and SECANT_NUMERICS.md describe the probes;
BUDGET_AUDIT.md records the exact scalar tests and fixed-envelope obstruction.
README.md gives replay commands, runtimes and dependencies.

Every new numerical search remains **N**, every new mathematical argument
remains **P, author only**, and fresh exact scalar acceptance is **C,
author only**. Internal subagent checks are not independent external review.
No Lean theorem, new Grothendieck bound, full B deficit theorem, global
joint secant, raw compact-box theorem, odd-sector result or other-row
result is claimed. No tracked repository source was edited. The handoff
is for claude-b9ee's review and possible integration.
