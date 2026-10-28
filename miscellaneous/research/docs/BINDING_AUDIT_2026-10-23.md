# Step 1: reconstruct the binding configurations

Baseline: master `98f61ec`, 23 October 2026. No endpoint changed.

The main result of this audit is a reproducible distinction between a binding
certificate rule, a feasible radial relaxation law, and an actual response.
They are not interchangeable. The saved certificate determines the first;
we reconstructed exact examples of the second. It does not determine the third.

## What was reconstructed

The current source is the lifted joint-moment package, not the generator's
historical default package. The generator's default still points at
`cert-jointmoment`; its invocation must explicitly name the lifted package.

The audit executes the read-only prefix of the existing generator. It checks
the archived input hashes, source-row data against the committed row modules,
the referenced node budgets/ranges, every box bound, and the partition tree.
It then compares the reconstructed batch and box strings exactly with the
committed Lean data. Emission is never executed and the committed file's hash
is checked before and afterward.

All **21 batches, 351 nodes, and 8,756 boxes** match. Twelve representative rules
were decomposed into their maximizing certificate parameters, row weights,
moment terms, gate price, padding, and already-used mixture savings.

This replays the finite data and its assembly. It does not recompute the
underlying Gaussian source-potential integrals or independently rerun all
whole-half-line node verifications; those are inherited inputs/checks.

The exact maximum of the current box bounds lies between
`0.713421798525` and `0.713421798526`. The advertised cap is `0.7134218`, leaving
only approximately `1.4745e-9` of headline allowance. The per-box padding is
exactly `1e-11`. Removing those two allowances cannot supply a substantial gain.

There are 130 boxes within `1e-7` of the exact maximum. Their enclosing parameter
box has `0.84425 <= t <= 0.8545`. The boxes were adaptively refined to a common
target, so their near-equal caps do not establish that their underlying actual
response payoffs are near equal.

## A representative exact ledger

Rule 7234 has a maximizing point for its **certificate expression** near

\[
 (t,\tau,x)=(0.8495,\ 0.245542324,\ 0.7265625).
\]

It mixes source rows with nominal values `0.84`, `0.845`, and `0.85`, with
weights approximately `0.0380164`, `0.366394`, and `0.595590`.
The bound is assembled as

\[
\begin{split}
 0.7134217985255\ldots={}&-0.719702191279\ldots
 +0.055407255822\ldots\\
 &+1.408882874811\ldots-0.031166140839\ldots+10^{-11}.
\end{split}
\]

These are, respectively, the visible quadratic term, the beta completion,
the moment-majorant expectation, the negative pinned price, and the padding.
They are mathematical terms in the bound, not numerical error bars.

The moment-majorant term splits into approximately

- constant contribution: `1.371105624585`;
- first absolute moment contribution: `0`;
- second moment contribution: `0.038295863701`;
- fourth moment contribution: `-0.000642148395`;
- sixth moment contribution: `0.000123534920`.

The actual sixth moment is not claimed to attain its permitted upper bound.
The positive sixth contribution is a relaxation allowance, not rounding error.
The currently unused first-moment multiplier does not imply that a new,
stronger first-moment inequality could never help.

At this point, selecting the best direct chord from the already available
nodes of the same potentials saves approximately `2.9500e-6` relative to the
selected nested chords. Across the twelve diagnostics the savings range from
zero to approximately `1.3985e-5`. These are **pointwise** comparisons of exact
existing certificates; they are not a new certified cover or a global gain.
In particular rule 8701, in a different low-kurtosis regime, has zero such saving.

## Four exact radial countermodels to the fixed relaxation

We reconstructed laws on `U >= 0` using the source tables and cut banks. The
discovery LP ran on the droplet. It supplied candidates only. Their support
locations and weights were rationalized, three weights were corrected to make
the equality moments exact, and an independent standard-library verifier
recomputed every constraint with rational arithmetic.

For each of four parameter points, the final law satisfies exactly

\[
 \mathbb E U=1,\quad \mathbb E U^2=2+x^2,\quad
 \mathbb E U^3\le6+9x^2+40.45313x^3,\quad
 \mathbb E\sqrt U\le0.973612157.
\]

It also satisfies all **671 cut functions** in the reconstructed bank: the
306 spectral/joint cuts, 126 distinct inherited mixed Stein cuts, and 239
additional distinct source-row Stein cuts from the five source cells needed
by these four rules. All joint cuts are used only on their certified `x` ranges.
This bank includes the cut functions needed by the four selected rules; it is
not a claim to include every possible Stein test or every source-row cell.

The exact witness scores have the following strict rational lower bounds:

- Rule **7234**, 10 atoms: score `> 0.713412812507`.
- Rule **5661**, 15 atoms: score `> 0.713414640742`.
- Rule **1247**, 12 atoms: score `> 0.713406413945`.
- Rule **8701**, 11 atoms: score `> 0.713352277645`.

Every score is strictly greater than `500/701`. The relevant objective is

\[
 R_{\rm tab}(\nu)=t^2-2\bar\ell t+2\bar\beta^2/\varepsilon
  +\int \sum_iw_i\widehat\Psi_i(\delta_i\tau\sqrt u)\,d\nu(u)
  -D\tau^2+10^{-11},\qquad \varepsilon=149/200.
\]

Here `widehat Psi` is the **stored table**, not the exact fibre potential.
Consequently the conclusion is deliberately narrow: optimizing dual prices
against this fixed table and finite cut bank cannot prove a score below these
feasible primal values at these points. Improving the tables, adding valid
cuts, retaining joint response constraints, or selecting different row profiles
can still help. The profiles here are fixed: no minimax floor over all existing
profiles or their reoptimized mixtures has been proved. The comparison
also does not apply automatically to the proposed witness `1891/2500`.

These laws are atomic and are not presented as Gaussian cubic laws or response
pairs. They are not counterexamples to Conjecture K, the original norm target,
or any Grothendieck bound. The LP optimum, continuous-law optimum, and size of
the source-table overestimate have not been certified by this audit.

## Exactly where the joint information is discarded

The existing Lean reduction retains more than a scalar law initially. It has
the same bounded response pair, the remote cubic `p`, a common gate vector
`X=(p,X2,X3)`, and `Qh`. The losses occur in distinct places.

1. **Fibre maximization.** A section of the actual pair is replaced by its
   supremum in the fibre potential. That supremum does enforce the two-disk
   pointwise geometry. It does not retain the actual section as a function of
   the remote coordinates.
2. **Separate row maxima.** The mixed certificate uses a weighted sum of
   individual row potentials. The same original response must serve every row,
   whereas the individual suprema may select different maximizing sections.
3. **The h-side square.** After the beta mixing identity has been used, the
   remaining term `epsilon * ||Qh + (beta/epsilon)v||^2` is dropped. The beta
   mixture saving is already counted; it is not available a second time.
4. **The pinned gate square.** The common gate is replaced by its Schur price.
   Its remainder is `E ||Y + C^{-1} h p||_C^2`, with `Y=(X2,X3)`. At rule 7234,
   equality in this step would require approximately
   `X2 = -0.532438 p` and `X3 = -0.256700 p`. The certificate contains the
   required coefficients but does not determine the actual remainder.
5. **Law feasibility.** Scalar moments and the finite integrated cut bank do
   not assert that their law and all projection fields come from one cubic and
   one bounded response pair.

The moment and gate data therefore do not supply the functions `Tf`, `Tg`,
the fields `P(f A_i)`, `P(g B_j)`, or their response-weighted cross matrix.
The actual values of the dropped squares cannot be reconstructed from these
data either. An arbitrary completion must not be labeled the original response.

This gives a precise implementation requirement for the next matrix test:
retain and constrain the cross block **before** the fibre supremum. If the cross
block is free, choosing it to be zero makes the block matrix PSD whenever its
diagonal blocks are PSD. Merely attaching the PSD condition to the saved radial
law would then add no restriction.

## A second joint quantity to preserve

For the common fibre coefficient `K`, let `F_i(f,g)` be the pre-supremum fibre
expression of row `i`. It is affine in that row's quadratic matrix, visible
linear term and coupling vector. Thus

\[
 \sup_{f,g}\sum_iw_iF_i(f,g)
 \le \sum_iw_i\sup_{f,g}F_i(f,g).
\]

The left side is the potential with the matrices, visible terms and coupling
vectors averaged **before** taking the supremum. Both sides still refer to the
same remote scale. Their nonnegative difference measures row consensus loss.
It has not been numerically lower-bounded here. It is an additional quantity
to inspect, not an established gain and not a reason to add previously spent
projection penalties again.

## Formal and computational status

- The comparison with all committed batches and boxes and the twelve ledgers
  uses exact arithmetic. The original source integrals remain inherited.
- The four final radial witnesses satisfy their finite models exactly, including
  all 671 cut inequalities. Their verifier needs no optimizer or third-party
  library. Floating searches are explicitly labeled discovery work.
- The generic primal-versus-dual separation argument is provided in Lean in
  `Grothe.Lower.PrimalAudit`. The four concrete numerical witness checks remain
  external rational checks; they have not been turned into Lean data theorems.
- No theorem in the headline lower or upper proof was strengthened by this
  audit. No global norm, endpoint, or complete new row cover is claimed.

Validation: the full Lean build passes (9,051 jobs); the expanded axiom report
passes for 188 theorems with the same three existing native facts. Both new
separation lemmas use only the standard axioms. The current manuscript compiles
with the desktop compiler. All four independent exact law replays pass, and
each rejects a deliberate change to an atom weight that breaks normalization.

## Replay and files

Exact finite-data reconstruction, with all arguments explicit:

```sh
python3 /Users/alingalatan/workspaces/grothe/tools/audit_lower_binding.py \
  --repo /Users/alingalatan/workspaces/grothe \
  --certificate cert-jointmoment-lifted-codex \
  --output /Users/alingalatan/workspaces/grothe/outputs/binding-audit-20261023/replay
```

Independent exact witness replay (repeat for the other three named files):

```sh
python3 -I /Users/alingalatan/workspaces/grothe/tools/verify_radial_countermodel.py \
  /Users/alingalatan/workspaces/grothe/outputs/binding-audit-20261023/radial-complete-7234-exact.json
```

- [Exact envelope and loss ledger](/Users/alingalatan/workspaces/grothe/outputs/binding-audit-20261023/binding-audit.json).
- [Final numerical discovery record](/Users/alingalatan/workspaces/grothe/outputs/binding-audit-20261023/radial-complete.json).
- [Finite-data replay log](/Users/alingalatan/workspaces/grothe/outputs/binding-audit-20261023/audit.log).
- [Droplet reconstruction log](/Users/alingalatan/workspaces/grothe/outputs/binding-audit-20261023/radial-complete.log).
- [Lean separation argument](/Users/alingalatan/workspaces/grothe/Grothe/Lower/PrimalAudit.lean).
- [Fibre supremum and its exact scope](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/FibreSup.lean).
- [Common response and projection fields](/Users/alingalatan/workspaces/grothe/Grothe/LowerAnalytic/FibreIntegral.lean).
- [Where the retained squares are dropped](/Users/alingalatan/workspaces/grothe/Grothe/Lower/Boxes.lean:568).
- [Source node-bank normalization](/Users/alingalatan/workspaces/grothe/Grothe/Lower/Rows.lean:107).

The next task is to write the extraction and majorization interface for the
response-weighted cross block, using these saved cases as the first tests.
