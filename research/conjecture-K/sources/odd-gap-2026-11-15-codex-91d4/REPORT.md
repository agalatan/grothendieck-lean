<!-- Verbatim from /Users/alingalatan/workspaces/grothe/handoff/research-degree5/gpt-all-sector-peak-2026-11-15/odd-gap-continuation/REPORT.md, 15 November 2026; Agent-ID: codex-91d4. -->
# Odd-gap continuation: Phase0 decision and scoped progress

Agent-ID: **codex-91d4**. Issue **#436**. 15 November 2026.
New analytic claims are **P, author only**, with scoped exact arithmetic
**C** where recorded. Diagnostics are **N**. Internal reviews do not
upgrade these to independent external approval or Lean proofs.

## Phase0 decision first

**Subsequent independent review:** claude-b9ee's
[#436 comment6895762342](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6895762342)
re-derived the restricted assembly, sector cones, six energy-slack
rectangles, driver tail and good-event weighted lemma, and replayed
the five checks in0.70s. The ten earlier rectangles and the matrix
integration were outside that review. Initial author labels below
are historical; exact current scope is in `../reviews/REVIEW_STATUS.md`.
The newer unrestricted-driver progress is in
`../general-ab-continuation/REPORT.md` and awaits separate review.

**Latest restricted-family consequence:** a7c4's frozen author-level
even cone now discharges (P) for r_B=kappa r_A, |kappa+4|<=3. On the
odd regions already proved here, the same explicit trial is below
S+99e-6; for **r_B=-2r_A it is below S+79e-6**. This uses the correctly
recomputed core bound with .01||U||² retained. It assumes neither global
(P) nor a global odd premise, but the driver relation and regional odd
domain are additional restrictions. The imported cone and new assembly
were subsequently reviewed on the listed odd domains; the general
arbitrary-driver gap remains open.

The remaining averaged odd premise is still open. This bounded continuation
produced useful additional regions and supports a focused centered-matrix
route for a remote-only base. It did not start a full compact shift cover,
duplicate the separate A/B pointwise cover, or address the separately owned
W>=.02 exterior.

The constructive conclusions are sector-dominant cones and six enlarged
(u,V,W) regions. The compact matrix is a promising N candidate. A bounded
interval refinement has now accepted **one node**, q=47/100, after the
smaller attempt was unresolved. A separate direct interval box around that
node remained **UNRESOLVED** at the tested 30,000-cell-evaluation budget.
The node certificate works; direct shift-interval boxing is too costly at
the tested resolution. A separate two-endpoint interpolation now succeeds
on [.469,.471]: fresh endpoint margins .01 and the author-level bound
||N''||<6000 give exact chord error .003, leaving margin .007 throughout
that interval. The curvature scalar constants are checked exactly. This
establishes a workable local interpolation method; the compact shift cover
and general A/B extension remain open. No uniform matrix theorem or
closure of the global odd gap is claimed.

## New proved sufficient regions

`SECTOR_CONES.md` transports a finite remote-core odd majorant through the
A/B shells with charge at most sqrt(33V/7). The inherited uniform separate
potentials and weighted Minkowski inequality charge every mixed odd term.
They give, with x=||Q||², y=||P||² and n=|nu|²,

```
x+y<=n/1000       => J_Psi(0)<=-n/10+sqrt(33V/7),
y+n<=x/1000000    => J_Psi(0)<=-x/200+sqrt(33V/7),
```

and the symmetric P-dominant version. In particular V<=7n²/3300
in the first cone gives J_Psi(0)<=0. These statements allow all three odd
sectors, nonzero A/B and arbitrary sharing. Their P reductions and rational
cone comparisons are new; the scalar remote potentials are inherited.

The rational example u=.04,n=.01,x=y=.000005,E_A=E_B=.00000005 is inside
both caps and outside the direct regional half-space and all ten earlier
small-energy rectangles. It is a genuine energy-domain example, not a
claim of bounded-response realization.

`budget/ENERGY_SLACK.md` correctly retains both branches of the deficit:

```
sigma-D_minus=S-max(B(u)-pu,Lambda(q)).
```

Twenty new exact closed cells reuse17 inherited global Hermite profile
caps to bound **both** raw Lambda(q) and the Gaussian benchmark. They give
positive common slack .00113,.00049,.00027,.00010 for u at most
.01,.02,.025,.03 respectively. No sign of D is assumed and no retained-only
remote theorem is substituted for the raw bound.

The good/bad driver split then retains t=E[w 1_bad] instead of spending
the full odd energy on both events. Its conditional tilted quadratic form
is bounded by4w/3, including the Q/nu cross term. This gives

```
J_Psi(0)<=(2/m-p)W+(pi m/6)exp(-K/Vbar),
m=a-K/(2b), 0<K<2ab, K>=3Vbar/2.
```

The six exact accepted rectangles are:

| u cap | V cap | W cap |
|---:|---:|---:|
| .01 | .06 | .0000044 |
| .02 | .05 | .00000158 |
| .025 | .045 | .000000795 |
| .03 | .04 | .000000275 |
| .02 | .005 | .000139 |
| .03 | .005 | .0000359 |

Every row has more than1% reserve in its odd allocation and a checked
admissible endpoint outside the old direct region. These regions prove the
averaged Psi premise with one global c=0. Their all-sector consequence
**still requires the separate pointwise A/B premise(P)**. The new checker
replays exact continuation, not the inherited Arb profile integrations.

## Bounded genuine-core diagnostics: N only

The fixed common remote trial and c=0 bank accepted744 tuples and rejected
420 by its exact decimal-coefficient filters. Seven selected tuples were
re-evaluated at an independent finer Sobol rule. All accepted energies were
between1e-7 and.005; every attempted.015 tuple was infeasible in this bank.
It therefore supplies no evidence for the entire .005<W<.02 remainder.

The refined shortlist's largest allocation was approximately-0.877227e-6,
against the proposed50e-6 allowance. The original common-trial witness
still had positive sampled J_Psi≈.000470619, paid by its sampled energy
slack. Its J_Psi changed by about5.11e-5 between stages, and its sampled D
changed sign. Those variations prevent interpreting the results as
enclosures or as permission to assume D>=0.

The diagnostics emphasize directional cancellation. At one rotated
W=.001 witness, the normalized inverse term was about1.7888, the subtracted
directional term1.5632, and finite Psi.3457. Psi from |X|<.03 contributed
only.00811 per unit energy. The corresponding directional quadratic was
below finite Psi, so it cannot be used as a finite-amplitude upper bound.
See `numerics/README.md` for exact bank definitions and limitations.

## Centered matrix candidate and the bounded pilot

`analytic-geometry/CENTERED_DIRECTIONAL_MATRIX.md` proves the finite
quadratic majorant

```
Psi(X,H)<=|H|²/|X|-(9/20)Re(X conjugate(H))²/|X|³.
```

At the remote-only base L+q this defines a full real6x6 matrix. Subtracting
its two constant Q/nu cross entries integrates to zero using unconditional
EQ=0 and constant nu; all q-dependent entries remain. Shift phase is an
orthogonal gauge, so a uniform centered matrix bound would need only one
nonnegative real shift parameter. It would imply an all-amplitude odd
cost for V=0, but that uniform inequality remains unproved.

The sampled matrix maximum near q=.47118 was approximately1.2949891,
about.0270627 below p. This is N, not a certified maximum. Exact scalar
and inherited-input work proves the large-shift matrix exterior |q|>=11
with cost.01; the remaining compact interval is0<=|q|<11.

The one-node interval pilot uses the exact rational shift q=47/100 and
target N(q)<(p-.01)I. Its6000-evaluation attempt was UNRESOLVED. The bounded
30000-limit refinement accepted the node after18534 evaluations and9311
leaves, with freshly regenerated centering constants and an explicit
Gaussian tail. Unsafe compilation, optimized Python and an impossible
target are rejected by its controls. This is scoped author-level C for
one node. It does not certify an interval of shifts, the compact matrix
range, an averaged genuine-core theorem, or the A/B extension.

The separate optional extension on q in [469/1000,471/1000] was
UNRESOLVED after 30,000 evaluations and 15,044 leaves in 2.36 seconds;
it reached the evaluation limit, not the timeout. It certifies neither
the interval inequality nor its failure. The point-node certificate and
its frozen sources remain unchanged.

Midpoint-only interval widths on that final partition ranged from about
.01284 to .01708 per matrix entry, even without quadrature remainder
terms. These are N diagnostics of parameter dependency in this
implementation, **not rigorous irreducible lower bounds** on enclosure
width or true matrix variation. These diagnostics motivated the separate
interpolation method below; the unsuccessful box itself supplies no
interval certificate. See `spectral-pilot/INTERVAL_NOTE.md`.

`analytic-geometry/SHIFT_CURVATURE.md` supplies the analytic bound
||N''(x)||<6000 for every real shift, hence the matrix chord error750h²
on an interval of width h. Its new standard-library checker verifies the
rational density-envelope arithmetic and conditional interpolation
margins only; it performs no matrix integration or endpoint acceptance.
For example, two endpoint margins .01 and width1/400 would leave margin
17/3200>.005. This is author-level P with scoped scalar C; the scalar
checker by itself fills no interval and establishes no compact cover.

The separate `spectral-interpolation/verify.py` now certifies both exact
endpoints469/1000 and471/1000 with strict margin1/100. Its endpoint
integrations use18544 and18530 cell evaluations, respectively, with fresh
centering constants and Gaussian tail bounds. The exact width1/500 gives
chord penalty750/(500²)=3/1000, so

```
N(q)<(p-7/1000)I, 469/1000<=q<=471/1000.
```

This is scoped endpoint C plus the audited author-level analytic curvature
premise P. The successful bounded run took about2.83 seconds and passed
ten negative controls. Its conclusion extends to the phase orbit by the
existing gauge argument, at the remote-only base A=B=0. It does not cover
all shifts or imply an averaged genuine-core theorem. The direct-boxing
attempt remains UNRESOLVED: these are distinct methods and receipts.
In particular, restricting to the event that a remote q lies in this
annulus does not permit canceling the centering matrix C: unconditional
EQ=0 need not hold after that restriction. The remaining shifts and their
cross terms must still be accounted for before an averaged conclusion.

## Replay and unresolved work

`replay.py` creates a fresh isolated source/input snapshot. Its default
runs five scoped exact checkers and their-O controls using only the
standard library. Optional `--numerics` regenerates every N output it
later consumes. Optional `--spectral-pilot` rebuilds and runs the bounded
one-node pilot. Independently, `--spectral-interval` replays the bounded
short-interval extension. Saved numerical result JSONs are not runtime inputs.
Optional `--spectral-interpolation` independently rebuilds the endpoint
adapter, computes both endpoint certificates, and applies the freshly
checked curvature scalar envelope. Its copied analytic note is an explicit
proof premise, not a saved computational acceptance result.

Every run records input hashes, generated-file/log hashes, commands,
versions and separate exact/N/node/direct-interval/interpolation statuses
in `RECEIPT.json`.
A wrapper's normal exit does not turn its internal UNRESOLVED engine
result into acceptance. An UNRESOLVED pilot is preserved as that outcome;
even a successful node
leaves the uniform-matrix and global-Psi flags false. The root agent's
fresh replay receipt is the record of packaging verification.

The open remainder includes balanced odd sectors outside the displayed
regions, the compact centered matrix cover, extension from a remote-only
matrix to general A/B cores, and the separate pointwise premise(P).
No new Grothendieck endpoint or unconditional all-sector cap is claimed.

## Final author replay and review pointers

The root agent's fresh source-copy replay with `--spectral-interpolation`
passed in **2.830 seconds**, including all four exact checkers, four
optimized-Python rejection controls and ten interpolation controls.
Its receipt is
`replay_runs/codex-91d4-gap-interpolation-final/RECEIPT.json`.
The earlier new N plus one-node replay passed in9.284 seconds;
the direct interval replay remained UNRESOLVED in2.826 seconds.
Their historical receipts preserve the exact driver/source versions.

`INTERNAL_AUDIT.md` records the root's re-derivation and limitations.
`analytic-geometry/OPTIONAL_AB_TRANSPORT.md` additionally proves the
sharp global2-Lipschitz base dependence of Psi and a conditional A/B
transport consequence. Its uniform centered-matrix premise remains
open, so it adds no unconditional balanced-sector energy region.
All new claims are handed to claude-b9ee for independent review.
The milestone and ownership split are recorded on
[#436](https://github.com/agalatan/grothendieck-lean/issues/436#issuecomment-6894827420).

## Restricted-family all-sector assembly

`restricted-driver-assembly/PROOF_NOTES.md` uses the same trial, c=0,
and the inherited even cone from #444 at
`4cc7a1ab59f4fd907aa2dd2dd3cc7a6b85de0f71`. For r_B=-2r_A,

```
T_xi0(E)-Lambda(q)+.01||U||² <= 6151872/212253745625 <29e-6.
```

Adding any proved regional odd premise gives

```
T_xi0(E+O)-S <= 6151872/212253745625 +50e-6-D_plus <79e-6.
```

The even <19e-6 estimate used the full U cost and is not reused with
an extra .01 U allocation. The new checker verifies this distinction,
the signed-D cancellation and a fully shared genuine example at
u=.02, EA=.001, EB=.004, W=.000139, with all three odd energies W/3.
The example satisfies both caps and lies outside the old direct region
and ten old small-energy rectangles. This is an energy-domain example,
not a claim of bounded-response realization.

A second fully shared example has u=.0403448 near the quoted benchmark
optimizer, V=1e-7, W_Q=W_P=5e-6 and W_nu=.01, hence W=.01001.
It lies in the proved nu-dominant nonincrease cone, satisfies all caps
and gives the same restricted-family conclusion. No positive energy
slack near u_star is assumed and no optimizer location is certified.

For the broader proportional-driver disk, the original49e-6 cession
gives S+99e-6 on the same regional odd domain. Arbitrary sharing between
all fields remains allowed; arbitrary A/B pairs are not covered.
The even cone is a new author-level inherited input, not independently
replayed here. CI job/log provenance and frozen source copies are bundled.
The fresh source-copy replay passed all **five** scoped exact checks,
their optimized-Python controls and the new assembly controls in
**0.703 seconds**, recorded in
`replay_runs/codex-91d4-restricted-family-complete/RECEIPT.json`.
