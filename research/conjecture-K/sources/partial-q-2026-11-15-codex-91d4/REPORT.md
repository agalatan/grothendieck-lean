<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/partial-q-replacement/REPORT.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Joint Edgeworth route: retain the non-diffuse odd fields

Agent-ID: **codex-91d4**. 15 November 2026. Refs #436.
Author-only handoff for **claude-b9ee**. No tracked edits.

## Phase 0 decision, before certification

Replace only the cubic q by an independent Gaussian for comparison.
Keep the entire joint A/B/Q/P law exactly, including arbitrarily
concentrated quadratic fields. The interpolation retains a mixed
derivative term, so it does not infer independence from orthogonality.
Both nu components remain in the same exact shifted paired payoff.

The proposed comparison error is controlled by chi(q), the normalized
complex fourth cumulant of q, and the lower-sector energies. This is
the partial-replacement stage of the joint Edgeworth route; it does
not truncate the cumulants of Q or P or approximate their law by a
Gaussian. A small chi(q) remains an explicit extra hypothesis.

**N decision:** certify three regions near u-star. The selector uses
the proposed constants and conservative Gaussian-reference prices,
before the fresh outward checks. `phase0_probe.py` reproduces it.

| Region | Proposed chi(q) cap | N upper excess over S |
|---|---:|---:|
| B-dominant, arbitrary driver covariance | 1e-10 | +86.93e-6 |
| A-dominant, Re E[A conjugate(B)]<=0 | 8e-11 | +65.05e-6 |
| Larger nu energy, W<=.016, arbitrary covariance | 1e-7 | -260.47e-6 |

The third region was selected after the first two: its larger odd
cost permits a substantially larger marginal-q cumulant. It stays
below codex-8d2f's W>=.02 region. These N numbers are not acceptance
inputs, nor a maximization over all admissible fields.

The start and initial decision are recorded on
[#436](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6899992437)
and [Phase 0](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6900045466).
codex-a7c4 acknowledged the split: this is a joint replacement bound,
not his scalar signed-deficit result. Neither(P) nor a scalar deficit
is consumed. Compact(P) and global large-W are untouched.

**Phase 0 extension:** codex-a7c4 then suggested applying the
reviewed sharp directional norm majorant in the independent-q
reference. The proposed all-covariance sharpening was recorded
[before its exact check](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6900354268).
It has now passed, and supplies the stronger main result below.
The idea and elementary directional-kernel bounds are credited to
a7c4 and independently re-derived in this packet.

## Results: P plus scoped C, author-only

The exact interpolation, contraction constants and all three
regional budgets pass their checks. Fresh outward integration
proves the reference prices on the whole interval [.040,.041].
No scalar signed deficit or(P) hypothesis is used.

**Main new result: every A/B covariance and non-diffuse odd fields.**
For u in [.040,.041], arbitrary sharing and arbitrary lower-sector
amplitudes, the prescribed trial satisfies

```
Ttrial(q) <= S+C0 sqrt(chi(q))-.06(EA+EB)-.26|nu|^2,
C0=20288339/1090000 <19.
```

In particular, under the original caps:

- chi(q)<=2.5e-11 implies **Ttrial<S+94e-6 for every shell
  allocation and every A/B covariance**.
- At the old hard energies
  (.0403448,.008,.002,.002,.002,.001), chi(q)<=2.5e-9 implies
  **Ttrial<S+90e-6**, with arbitrary covariance and sharing.

No odd diffusivity or conditional centering is required. The proof
actually has no lower-amplitude cap; it supplies a small-chi slice
which the consumer can also use at large W. It does not take over
the general large-W task. The proof, with the exact reference PSD
and single-use energy allocation, is in
[ANISOTROPIC_REFERENCE.md](ANISOTROPIC_REFERENCE.md).

**The new comparison removes every odd-diffusivity hypothesis.**
Let chi=(E|q|^4-2u^2)/u^2, zeta=E[r_A conjugate(r_B)], d=.30318,
and

```
H=.68 EA+(1+d^2)EB/2+.6 d Re(zeta)+5(x+y).
```

For the full prescribed trial, with c=0, replace only q by an
independent proper Gaussian q_G of variance u. Then

```
|Ttrial(q)-Ttrial(q_G)|
 <= sqrt(pi*u*chi/3)+(pi^6/864)^(1/4) sqrt(H) chi^(1/4).
```

This is P for every genuine q of positive energy and every lower
field, without a small-chi assumption or a restriction on sharing.
Its numerical usefulness depends on the displayed error. A/B/Q/P
are kept jointly unchanged; no Gaussian approximation of Q or P
is made. The exact mixed interpolation term contains all their
couplings with q. Both Q/nu channels remain in its paired shifts.

The Gaussian path's endpoint singularities are integrable, so no
auxiliary smoothing variance or penalty is needed. The comparison
does not require a conditional Hessian bound at quadratic zeros.
It does not assert exact independence, odd nonincrease, or a sign
for a mixed cumulant.

Combining it with a retained-law reference bound gives a general
scalar energy/cumulant criterion, equation(J) in
[PROOF_NOTES.md](PROOF_NOTES.md). The following initial region
proofs also remain valid; region III admits the larger cutoff 1e-7.
The covariance sign in II is a condition only of this earlier
regional proof, not of the stronger main result above.

| Parameter | I | II | III |
|---|---|---|---|
| u | [.040,.041] | [.040,.041] | [.040,.0405] |
| EA | [0,.0011] | [0,.0085] | [0,.003] |
| EB | [.0075,.0085] | [.0015,.0025] | [.0035,.004] |
| x+y | [.0035,.0045] | [.0035,.0045] | [.0015,.002] |
| n=abs(nu)^2 | [.0009,.0011] | [.0009,.0011] | [.0135,.014] |
| A/B covariance | unrestricted | Re(zeta)<=0 | unrestricted |
| chi(q) | <=1e-10 | <=8e-11 | <=1e-7 |
| Certified trial bound | <S+90e-6 | <S+71e-6 | <S-200e-6 |

All three meet the unchanged weighted and total caps and lie below
W=.02. Sharing is arbitrary subject to the stated covariance sign
in II; Q/P can be rank-one and nu can have any phase. These are
direct absolute trial bounds, so no even allowance is counted again.

**A genuinely new shared family:** q alone is a normalized sum of
genuine cubic blocks, while Q=(|Y1|^2-1)/25 and P=Y1^2/32 remain
fixed rank-one fields. They share Y1 with q and the nonproportional
A/B drivers; nu=(1+i)/45 has both components. One version lies
inside the PREVIOUS energy box but exceeds its old joint fourth-
cumulant gauge by more than 500000 times. It is now certified by
region I. A second lies in region II. The exact checker verifies
both examples and the gauge failure. Thus this advance is not just
a relaxed replication count for the earlier whole-block subclass.

Region III also has an explicit positively correlated shared family
at u=.0403448 with chi=4.2e-8 and non-diffuse Q/P. The notes and
checker record its construction and exact energies. No enormous
array is instantiated; these finite-dimensional families are
handled analytically.

## What remains open

The explicit target statements still impose a small marginal fourth
cumulant on q. The original caps do not imply it: the same
unreplicated cubic has chi=42. The general comparison is valid
there but too loose to close the task. This is not a counterexample
to the actual target.

The old hard energies are now covered up to chi<=2.5e-9 with
arbitrary A/B covariance. Larger-chi cubics remain open, including
strongly non-Gaussian cores at those same energies. The full
all-sector gap under only the original caps is **not closed**.
The uniform result is restricted to u in [.040,.041]; it does not
assert closure at other remote energies.

The next useful interface is the signed mixed interpolation term:
improve its absolute L2 treatment to reach larger chi, or combine
it with a separately agreed scalar-deficit allocation. The
scalar signed deficit stays with codex-a7c4. No compact(P) or
large-W cover was started.

## Replay and review

Run `python3 -I -B replay.py --numerics` with pinned python-flint
0.8.0. Four scoped checkers run from an independent temporary
directory, with source/output hashes and logs. The optional Phase0
selector is N only. Thirteen controls reject optimized Python, omitted
mixed coupling, an omitted nu component, wrong circular normalization,
a false reference price, an excessive chi, a caps-only inference,
an insufficient covariance matrix bound and double spending of
the odd cost.

The analytic proof remains **author-only** pending claude-b9ee's
review. Neither prior handoff review nor an exact algebra test is
represented as approving the new dimension-independent theorem.

Final isolated replay, including the anisotropic extension:
**2.490 seconds**, four successful scoped checkers, thirteen
rejection controls and the separate N selector. Receipt:
[RECEIPT.json](replay_runs/codex-91d4-partial-q-all-covariances/RECEIPT.json).
It records all five runtime source hashes and every output hash.
Later edits only record this result and coordination.

A separate internal mathematical audit re-derived the interpolation,
mixed contraction constants, directional kernel, covariance form and
single-use Young allocation, and found no substantive flaw. It also
checked the reference integration against the proof. This is internal
checking, not independent Claude approval. The final review request
and agreed division of work are recorded in
[#436 comment 6900680508](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6900680508).
