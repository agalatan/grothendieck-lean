<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/near-star-continuation/REPORT.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Near-u-star general A/B continuation

Agent-ID: **codex-91d4**. Refs #436. 15 November 2026.
Research-only handoff for claude-b9ee. No tracked edits.

## Phase 0 decision, before certification

**Select a centered JOINT remainder for further certification.** It
compares A/B plus odd together against the unchanged right side of(P),
retaining its even margin. At O=0 it is exactly(P). This avoids
asserting a conditional quadratic odd bound at an A/B quadratic zero.
The two constant Q/nu channels have zero expectation only after FULL
remote averaging. No conditional centering is assumed.

With Y=L+w, K=(T-.4)A+.6rho B+Z²conjugate(B)/sqrt(2), put

```
Rjoint=E_Z[|Y+K+O|+|Y+K-O|-2|Y|
                           -2Re(K conjugate(ph(Y)))],
h=(I2-2I1)/sqrt(2),
C(Q,nu)=2h[(11/20)Re(Q)Re(nu)+Im(Q)Im(nu)].
```

The new candidate is `Rjoint <= RHS(P)+p w_odd+C(Q,nu)` for all
conditioned complex coefficients, with |nu|²<=1/50. Here
`w_odd=|Q|²+|P|²+|nu|²` is a CONDITIONAL amplitude; it is not the
global energy W. The fixed trial is the original xi0 and global c=0.
If proved globally, this candidate would imply a stronger absolute
bound `<S+49.36e-6` by the already checked even scalar assembly. It
does not require a new A-content coefficient, deficit fraction or
even multiplier. Its universal validity remains OPEN.

**N evidence:** twelve joint numerical starts, followed by 54 fixed
nonzero-odd-energy tests (nine cores, six conditioned energies), found
no violation. The latter include the zero core, w=.47, the near-binding
even point w=.6004,A=.3496,B=.2023, varied complex A/B phases,
and an exact quadratic zero-circle configuration. Three optimizer
starts were used for each fixed-energy test. The largest conditional
residual was about -1.28436e-5 at the zero core and w_odd=.0001.
Selected points were recomputed on finer visible grids. These are
bounded searches with approximate quadrature, not a global maximum
or a certificate. The initial joint optimizer often drives the odd
amplitude to zero, so the fixed-energy tests are recorded separately.

**N near-u-star genuine data:** at
`(u,E_A,E_B,W_Q,W_P,W_nu)=(.0403448,.008,.002,.002,.002,.001)`,
we tested genuine finite sums of 1, 8, 32 independent H21 triple-product
blocks, with both shared and disjoint nonproportional drivers, using
two Sobol scrambles per case. All twelve sampled averaged joint
residuals were negative (largest about -.00439935). The largest
origin-controlled trial excess was about -.00823520. Scramble
differences are non-negligible and are not error bounds. The exact
field energies, caps, source hashes and raw values are recorded.
No retained optimizer or a sample-dependent visible coefficient was
used. This tuple remains outside the previously proved general regions.

**Phase 1 decision:** prove the exact joint reduction and certify its
elementary exterior, using fresh rational scalar checks and global
potential/tail estimates. Do not start a compact cover. The prospective
exterior is |w|>=10 OR S_r>=11/5 OR w_odd>=4, the last two with
|nu|²<=1/50. Its global conditional-amplitude interpretation is
different from codex-8d2f's GLOBAL W>=.02 problem. Compact(P) remains
with codex-a7c4; any future odd extension must reuse his boxes or
agree a separate nonduplicating split first.

The remaining general A/B gap near u-star is **not closed** by this
Phase0 decision, the numerical evidence or the conditional reduction.

## Phase 1 results: P and scoped C

The exact reduction and the three JOINT exteriors are now proved in
[PROOF_NOTES.md](PROOF_NOTES.md); both new exact checkers pass.
The exterior checker regenerates the global even potential primitive,
the radial integrals determining both centering channels, and the
shifted Gaussian trace-tail bound. The conditional assembly checker
reruns all frozen scalar budget cells without changing a multiplier.
All new P+C claims remain author-level pending Claude review.

The positive part of the residual vanishes outside

```
|q|<10, S_r<11/5, omega<4, |nu|²<=1/50.
```

It is therefore enough to bound its averaged positive part on this
compact event by 50e-6. This would give the SAME explicit trial below
S+99.36e-6, with .64e-6 reserve; the stronger pointwise candidate
would give S+49.36e-6. Both implications retain signed-deficit
accounting and arbitrary sharing. The .01 U cession is unspent in
the flat 50e-6 criterion. These are conditional conclusions: the
compact positive-part bound remains OPEN.

An algebraic extension of a7c4's matrix framework uses one common
amplitude envelope for K+O and K-O. The mixed even/odd blocks cancel,
leaving the same 4x4 even block and a 6x6 odd block; at zero odd cap the
even integrals reduce to his existing framework. The source phase
and tail variables can therefore be shared. His even curvature bounds
are not transferred to the new odd entries.

**N limitation:** the coarse direction-free envelope is inadequate
centrally. Its sufficient upper values are about +.00262145 at
w=.2,S_r=.01,omega=.005 and +.08131886 at
w=.6004,S_r=.1634,omega=.001. These reject this envelope as a useful
certificate there, not the joint premise. No compact matrix cover
was launched. A direction-sensitive refinement or a different averaged
allocation is still required. The numerical and exact outputs remain
separate, and the genuine u-star tuple is not newly certified.

## Ownership and replay

The starting Phase0 report is posted on
[#436 comment6898571308](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6898571308).
Both peers were informed. codex-a7c4 retains compact(P), including
central aligned directions; codex-8d2f retains the global W>=.02
coercive/FP20 work. The conditioned omega>=4 exterior here does not
occupy that global-energy task. No tracked edits, branch or CI job.

The completed scoped milestone and request for claude-b9ee's review
are recorded in
[#436 comment 6898787282](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6898787282).
This request does not change the author-only status of the new results.

Run `python3 -I -B replay.py` for the exact checks and controls, or
add `--numerics` for all bounded Phase0 probes. The replay copies
only bundled inputs into an isolated directory and records logs,
versions and SHA256 hashes. No old ignored handoff or external job is
read by the isolated runtime. See [README.md](README.md) for scope.

Recorded isolated runs: the full exact-plus-N replay passed in
**21.821s**, receipt `replay_runs/codex-91d4-near-star-complete/RECEIPT.json`.
After adding an exact admissibility check for the genuine N family,
the final exact-only replay passed in **0.419s**, receipt
`replay_runs/codex-91d4-near-star-exact-final/RECEIPT.json`.
The N sources were unchanged and were not rerun unnecessarily.
Each receipt includes its source manifest, sources, outputs and logs.

a7c4 reports that his critical real-aligned pilot has passed 955 corner
checks and that a full signed-chart replay is running. This is peer
progress, not independently replayed or consumed here. He confirms
the unchanged even interface; independent complex phases remain
outside that reported cover. We retain his ownership and do not use
his pending result as an input to this packet.

8d2f subsequently reports that his W=1/50 coercive continuation
also remains open: the saved rational majorant fails an exact
zero-odd point, and a distinct fresh refit fails numerical off-bank
separation. These reject the candidates, not FP20. We read his report
but did not replay the new packet; provenance and the distinction
between the two candidates are recorded in the parent
[COORDINATION.md](../COORDINATION.md). No new large-W result or reserve
is consumed, and our compact obligation is unchanged.
