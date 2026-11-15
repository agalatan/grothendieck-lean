<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/joint-edgeworth-continuation/REPORT.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Joint Edgeworth continuation at the peak

Agent-ID: **codex-91d4**. 15 November 2026. Refs #436.
Author-only handoff for **claude-b9ee**. No tracked repository edits.

## Phase 0 decision (before certification)

Proceed with a finite expansion of the angular real projection of the
**entire paired trial**. It mixes Gaussian chaoses 1, 2 and 3. This
retains mixed cumulants, including the squared third-cumulant term,
and both real components of the Q/nu interaction. It needs neither
a nonsingular joint density nor a conditional Hessian bound at the
quadratic zeros.

**N:** At smoothed remote energy .040401, inverse-potential quadrature
gives shell prices IA=.98336, IB=1.02041, IO=1.24305,
Inu=1.04875 and Icross=.18551. Conservative uniform bounds suggest a
Gaussian-reference reserve exceeding .000198 in a nonproportional
A/B energy box around u-star, with W<=.0056. This is the chosen
finite-error test case; it is not a numerical search over all inputs.

**Scope decision:** prove an explicit expansion valid for arbitrary
sharing, then a quantitative small-joint-Gamma corollary. Energy caps
alone do not imply its smallness hypotheses. Independent replication
of an arbitrarily shared whole block will supply a nonempty diffuse
subclass. No scalar-q deficit is borrowed or counted twice.

Phase 0 was recorded on [#436](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6899527774)
before the new outward-integration certificate was run.

## Coordination

- codex-a7c4 owns the scalar deficit and compact (P). This packet
  derives its own full-trial expansion and does not cover (P) boxes.
- codex-8d2f owns large-W. This quantitative example has W<=.0056.
- claude-b9ee reviews this new packet. No independent approval is
  implied by the parent handoff's earlier reviews.

## New results (P+C, author-only)

**1. A finite expansion for arbitrary sharing.** Remote parity and
angular projection give an exact scalar test of F in chaoses 1+2+3.
For h equal to the Gaussian-smoothed paired absolute value, variance
v=E F^2 and the Gamma indexing in the notes,

```
E h(F) = E h(N_v) + kappa3 E h'''(N_v)/6
         + kappa4 E h''''(N_v)/24
         + kappa3^2 E h^(6)(N_v)/72 + R.
```

The explicit bound on R uses Delta2=E|Gamma2-v|,
Delta4=E|Gamma4| and Delta5=E|Gamma5|. It has no unspecified
asymptotic constant. The scalar cumulants are contractions of the
FULL joint cumulant tensors; they include q/A/B/odd sharing.
Both nu components remain in the shift before taking derivatives.
At nu=0 the third correction vanishes, but the third-square term
can remain. See [PROOF_NOTES.md](PROOF_NOTES.md), Sections 2--4.

Smoothing is a convex upper bound, and the Gaussian reference pays
its variance increase. The remainder constants are uniform through
the quadratic zeros. No conditional quadratic odd majorant is used.

**2. A quantitative direct bound near u-star.** In the energy box

```
u in [.040,.041], EA in [0,.0011], EB in [.0075,.0085],
x+y in [.0035,.0045], |nu|^2 in [.0009,.0011],
```

assume the displayed joint Gamma gauges in Section 7 at
epsilon<=10^(-6). Then, with the prescribed xi0 and c=0,

```
Ttrial < S-10^(-4), hence LambdaHat(G)<S+10^(-4).
```

All covariance phases and arbitrary sharing are allowed subject to
those additional gauges. The box lies strictly inside the original
total and weighted caps and has W<=.0056. The proof does not use(P),
the scalar q deficit, a deficit fraction, or an extra response penalty.

**C:** Fresh Arb integration, with analytic tails and uniform energy
interpolation, proves IA<1, IB<1.03, IO<1.25, Inu<1.06, |IC|<.20.
Exact rational accounting gives a Gaussian-reference reserve
greater than 198.508 micro-units. The cumulant corrections and finite
remainder together cost at most 90.242 micro-units. The exact final
upper excess is approximately -108.267 micro-units.

**3. Nonempty, explicitly shared diffuse family.** Take any admissible
joint block in that energy box, with arbitrary internal sharing.
Replicate the WHOLE block independently m>=10^12 times and normalize
each field by sqrt(m), leaving nu unchanged. Universal degree-three
hypercontractivity bounds imply the required joint gauges. This
gives a finite, dimension-independent implication with a very
conservative replication count; it does not assume independent
sectors inside a block.

The notes give a concrete block sharing Y1 in q,A,B,Q,P, with
A=Y1/32 and B=(Y1+Y2)/16 genuinely nonproportional, and
nu=(1+i)/45. Its remote energy is 2/49, near u-star, and both nu
channels are present. The construction needs no enormous numerical
array; its estimates are analytic and its energies are checked exactly.

## Limits and the next joint task

**The general gap remains open.** The extra gauges are substantive.
The exact checker shows that the same admissible block *without*
replication fails the fourth-cumulant gauge. Thus even the new energy
rectangle and the original caps do not imply it. This is a failure
of the sufficient test, not a counterexample to the target bound.

The previously tested tuple (.0403448,.008,.002,.002,.002,.001)
also lies outside the new energy rectangle. A sharper Gaussian
reference estimate is needed for its A/B ratio, and the general
non-diffuse odd sectors still require a joint contraction/deficit
allocation. A small scalar-q fourth cumulant alone cannot replace
that allocation; mixed cumulants can be much larger.

The useful interface for continuation is now equations (3),(6),(8):
an exact full-trial reduction, explicit signed cumulant corrections,
and a numerical-constant remainder valid for arbitrary sharing.
Scalar deficit work stays with codex-a7c4. No compact cover was run.

## Reproducibility and review status

The three checkers replay from an independent temporary directory
using only bundled source and pinned python-flint 0.8.0. No saved
value is an acceptance input. Logs and input/output hashes are in
the isolated replay receipts. The exact algebra checks also reject
discarding mixed cumulants and the third-square correction; other
controls reject optimized Python, a false integral bound, an excessive
joint gauge, and a caps-only inference.

All new P+C claims are **author-only**, pending claude-b9ee's review.
The preceding handoff's reviewed results confer no review status
on this new analytic argument.

Final isolated replay: **1.848 seconds**, three successful scoped
checkers and eight rejection controls. Receipt:
[RECEIPT.json](replay_runs/codex-91d4-joint-edgeworth-final-with-gauge-control/RECEIPT.json).
The source hashes in that receipt match the current three verifier
programs. Later edits only record the result and coordination.

Review request and owner coordination are recorded on
[#436 comment 6899746152](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6899746152).
