<!-- Verbatim copy of /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-tilted-sector-2026-11-15/secant_audit_results.md (file dated 2026-11-15 05:17). Only this line was added. -->
# Independent audit of the active secant route

Agent-ID: **codex-6e2b**. Auditor task: `/root/independent_audit`.
15 November 2026.

**Verdict:** no blocking mathematical or interval-arithmetic error was
found in the reviewed active route. The primary compact secant cover has
completed successfully, closing the global secant theorem as **P+C**. It
accepted 102,104 boxes after 204,207 visits, including 7,788 analytic
prunes, with maximum depth 27; it evaluated 154,239 parameter points and
129,496 source integrals in 153.72 seconds. The complete log is
`secant_core_results.txt`. The separate end-to-end default replay has also completed successfully:
all inputs were regenerated, and the repeated cover accepted the identical
102,104 boxes in 104.80 seconds. `results.txt` ends with
`PASS FULL SECANT REPLAY`. The regenerated radial table is byte-identical
to the first certified table. The central-energy content improvement has also passed its
complete independent replay.

## Mathematical reductions

The audit independently checked:

- The global remainder identity and the inequalities
  `Rem <= rho² E[A²/|L+w|]` and `Rem <= 4 E|A| rho`.
- The full exterior `|w|>=6`, valid at every amplitude: the weighted
  tail mass, density/Jacobian calculation, layer-cake estimate, and exact
  rational cap `3603551/5604000 < 13/20`.
- The small-amplitude region `rho<=33/200`: the actual unconditional
  scalar target in row 161 of `theta_candidates.txt`, its interpretation
  in the accepted theta engine, and the analytic projection exterior.
- The trilinear convex interpolation formula for `G=Rem−(13/20)rho²`,
  including the error
  `(j0+rho_hi)(dx²+dy²)/4+(13/80)drho²`.
- The estimate `|D² beta0|<=1` from the already proved tensor metric
  bound, and the exact scalar bound `j0<179/125`.

The root-based positive-part alternative and a nonnegative circular-mean
Bregman decomposition are recorded in `secant_audit_math.md`. They are
independent analytic checks, not additional assumptions of the engine.

## Point integration and compact-cover engine

The audit read `secant_verify.cpp` in full. It checked the positive
binomial-series circle mean and its explicit tail, weighted exponential
cell mass and mean, Jensen/chord/tangent bounds according to the sign of
`ell''`, the inflection-crossing error, the first source cell, and the
infinite source tail. All parameter acceptance uses outward bounds;
floating-point quantities used to choose refinement cannot accept a box.
The source-cell replacement arithmetic maintains rigorous cumulative
lower and upper bounds.

Two issues identified during development were corrected before the active
run: the radial-table scale is `10^8`, and radial cell selection now uses
interval enclosures of the exact rational nodes. The consumer includes
all intersecting cells and enforces the table domain `R<=6`; points outside
that domain use the exterior theorem. Linear interpolation includes the
error `(R_hi−R_lo)^2/8` supplied by `|Fraw''|<=1`.

The parameter cover starts with the complete compact rectangle. A box
is either accepted by an analytic exterior bound, accepted by the corner
and interpolation estimate, or replaced by two children sharing the same
boundary. The depth limit aborts rather than accepting an unresolved box.
The success message is emitted only after the work list is empty.

An independent compilation used `-frounding-math -ffp-contract=off
-fno-fast-math`, with assertions enabled. Three rigorous `--fpoint`
enclosures contained independently computed adaptive elliptic-integral
values, including a point near the numerical secant maximum. These are
smoke checks; they do not replace the analytic and source-code audit or
the complete compact cover.

## Regenerated radial data and uniform content

The audit checked `secant_profile_table.py`: 602 exact rational nodes
cover `[0,6]`, every field value is recomputed by the previously audited
Arb quadrature, and both scaled integer endpoints are rounded outward.
The original generation completed successfully in approximately 611
seconds. Its explicit dependency-skip option was used only after the
profile/Hessian prerequisites had already been certified in this chain.

The adapter `secant_profile_dual.py` reconstructs `h=Fraw/R−c0` at the
300 positive midpoint nodes below 3. It adds `.005/sqrt(3)` for the whole
radial cell, intersects the global profile bound, and invokes the
previously audited Gaussian-probe dual envelope. An independent adapter
replay returned exit zero in approximately 4.21 seconds, with

`||c_(3/5)(q)|| < 0.019830553181733 < 1/50`.

The adapter neither assumes an arbitrary saved table is certified nor
substitutes numerical samples for cell enclosures.

## Central-energy tensor improvement

The audit independently checked all of `secant_content_verify.py` and
`secant_content_proof.md`: the scalar derivative formulas; compact and
infinite-source bounds; the rational Hermite supersolution; source
interpolation with the certified fourth derivative; Bernstein residuals
at both energy endpoints; and the half-line maximum principle, including
the favorable derivative jump at one.

The angular metric bound `N<=11||k||_infinity²/72` was independently
derived for signed functions by reduction to a single threshold and the
nonnegative Bernstein coefficients `15,12,19/3,0,3`.

A complete independent replay returned exit zero in approximately 17.30
seconds. It reproduced all source bounds, 500 supersolution cells, and a
residual margin exceeding `1.93717e-5`. Thus

`||c_(3/5)(q)||² <= (1077659/27000000) delta <= delta/25`

is **P+C** for every dimension and every
`3/100 <= u <= 463/10000`, without a restriction on `chi`.

## Active default verification and trust

The audit read the active `secant_scalars()` and `replay()` in `verify.py`
and independently ran `--algebra-only` successfully. The default chain:

1. Certifies the exact pi, visible-integral, exterior, and assembly
   comparisons, and compiles both C++ engines with the required flags.
2. Replays the complete theta certificate and the profile range/Hessian
   certificates.
3. Regenerates the radial table, then executes the compact secant cover.
4. Reuses exactly those fresh radial values for the uniform-content dual,
   and replays the third-order and central-energy content certificates.

Every subprocess must exit successfully. The final full-replay success
message occurs only after all these steps. Successful verbose box rows
may be omitted from the transcript, but their checks still execute.
The default chain invokes no maximizing-sector localization theorem.
The reused `localization_circle.hpp` is solely an audited circle-series
utility; its filename does not introduce an A2 assumption.

The computational trust is ordinary directed IEEE arithmetic in the
strict-flag C++ binaries and Arb/python-flint interval arithmetic in the
Python certificates. These are not newly formalized Lean proofs. The
rational witness and candidate files are checked inputs, and stored logs
are not accepted in place of rerunning the computations.

## Scope and remaining limitation

The rational implications in `secant_assembly.md` sections 1–3 were
independently checked, including the improved all-tensor small-energy
endpoint and the weaker sufficient content/deficit target. The successful
compact cover now makes these stated corollaries unconditional on the
secant step, with their stated tensor/energy/deficit restrictions intact.

Neither the secant theorem nor the central-energy tensor improvement
alone proves the full requested comparison with the actual same-variance
deficit on arbitrary cubics. No new Grothendieck-constant bound is claimed.


## Final document consistency check

The final review covered `REPORT.md`, `secant_proof.md`,
`secant_content_proof.md`, `secant_assembly.md`, and the active verifier.
All linked local files in the report exist. All 14 active source hashes
match those printed in `results.txt`. Constants, parameter ranges,
status labels, and the distinction between the completed secant theorem
and the open general deficit comparison are consistent. The report now
distinguishes analytically pruned boxes from those accepted by the corner
interpolation inequality. No unresolved blocking issue was found in
these documents or the active verification chain. The end-to-end replay remained in progress at this review.
