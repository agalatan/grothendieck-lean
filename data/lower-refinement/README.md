# Exact lower-witness refinement

This is the acceptance input for task #378. Its complete exact-arithmetic
replay gives the scalar cap

\[
B=\frac{3567097}{5000000}=0.7134194,
\qquad
K_G^{\mathbb C}\geq\frac{5000000}{3567097}>1.401700037873,
\]

using the repository's existing analytic reduction and Gaussian transfer.
There is no Conjecture K premise. `LowerRefinementCheck.certRefinementBatches`
checks the additional law bank. `Lower/FiniteMix.lean` proves soundness of finite
mixture expressions, their box bounds and the complete cover checker. The four
`RefinedCoverBoxes` checks and `RefinedCoverPartition` certify all 14,060 leaves
and coverage. `RefinedLowerCheck.lower_bound_of_completed_refinement` applies
the existing analytic reduction and transfer. `MainResult.main_bounds` discharges
the unchanged Gaussian node-cap hypothesis and displays the new strict endpoint.
The increase over `1.401697117301` is `0.000002920572`.

## Replay

From the repository root:

```sh
python3 -B -S tools/verify_lower_refinement.py
python3 -B -S tools/check_lower_refinement_controls.py
python3 -B -S tools/gen_lower_refinement_lean.py --check
python3 -B -S tools/gen_lower_refinement_cover.py --check
lake build Grothe.Research.RefinedCoverResult Grothe.LowerTarget
lake env lean scratch/LowerRefinementEndpointAxioms.lean > /tmp/lower-refinement-axioms.log
python3 scripts/check_axioms.py --refined-cover < /tmp/lower-refinement-axioms.log
lake env lean --run scratch/LowerRefinementPortCheck.lean > /tmp/lower-original-values.txt
python3 -B -S tools/check_lower_refinement_port.py /tmp/lower-original-values.txt
```

The Python commands use only the standard library and existing
`tools/rankone_law.py`. They neither access the network nor invoke a numerical
optimizer. Do not use `-O`: the inherited rational checker uses assertions,
and the entry points refuse optimized Python. Paths are resolved relative to
the scripts, so the current working directory does not affect acceptance.

Successful replay reports 10,909 original boxes, 21 new law majorants,
1,003 replaced parents, and 14,060 final leaves. The exact maximum is displayed
as a rational number; its approximate value is `0.7134193997590335` at parent
5588. Only rational comparisons decide acceptance. The eight negative
controls reject damaged majorants, spectral parameters, subdivision trees,
stored bounds, convex weights, node indices, and restricted-node usage.

## Inputs and provenance

- `sources.json` pins the 22 original Lean data files and the reused arithmetic
  checker by exact Git blob hash. A source change fails closed; investigate
  and reverify it before updating a hash. The historical run in the manifest
  identifies the inherited sources; the current PR check covers this extension.
- `nodes.json` is the ordered registry of the 21 files under `nodes/`. Original
  batch indices are 0 through 22; each new node contributes one singleton batch,
  starting at 23. Registry order is part of the certificate.
- Each node records its original source batch, scale, five polynomial
  coefficients, spectral/Gram/joint-moment witness, and exact positivity proof
  statistics. The `cut` field is discovery provenance and is not a premise.
- `cover.json` records the cap, the strict decimal consequence, the same node
  registry, and the complete replacement forest. Each parent record occupies
  one JSON line. Parents index the serialized boxes in
  `Grothe/Research/RefinedCoverData.lean` from zero.

The original Lean data and `rankone_law.py` are reused in place. Numerical
search scripts and abandoned candidates are not needed for acceptance.

## Mathematical checks

For the fixed witness epsilon = 149/200, the inherited reduction supplies
the domain

\[
0\leq t\leq9/10,\quad 0\leq\tau\leq\rho,
\quad0\leq x\leq31/4,\qquad \rho=973612157/10^9,
\]

and a common cubic law with

\[
\mathbb EU=1,\quad \mathbb E\sqrt U\leq\rho,\quad
\mathbb EU^2=2+x^2,\quad
\mathbb EU^3\leq6+9x^2+(4045313/100000)x^3.
\]

For each new law node, the reused checker proves
`S(tau * s) + G(s*s) <= p(s)` on the entire half-line `s >= 0`.
Here `S` is the existing source envelope with its certified affine tail,
and the existing Stein identities and checked budgets give `E G(U) >= 0`.
After clearing the removable denominators, positivity is checked by rational
Bernstein subdivision on bounded intervals and nonnegative translated
coefficients on the final ray. Gram budgets are checked exactly; joint
fourth/sixth-moment budgets retain their explicit maximum value of `x`.
No new source-node integration or shifted-source premise is used.

For `p(s) = c0 + c1*s + c2*s^2 + c4*s^4 + c6*s^6`, with `c1,c6 >= 0`,
the resulting law bound is

\[
J(p,x)=c_0+\rho c_1+c_2+c_4(2+x^2)
       +c_6(6+9x^2+(4045313/100000)x^3).
\]

Finite convex mixtures preserve the retained-square row inequality by
iteration of the existing two-row mixing identity. Gate matrices and
coupling vectors are mixed before completing the square. If the mixed row
is `(ell,beta,k,h1,h2,c11,c12,c22)`, its price is

\[
D=k-h^{\mathsf T}C^{-1}h,\qquad
C=\begin{pmatrix}c_{11}&c_{12}\\c_{12}&c_{22}\end{pmatrix}>0.
\]

Scale interpolation between two law-node chords gives a quadratic expression
in the scale after subtracting `D*tau^2`. Its maximum includes an interior
vertex when applicable. The `x` dependence is `a+b*x^2+c*x^3`, with `c >= 0`.
On a nonnegative interval its derivative cannot change from positive to
negative, so its maximum is at an endpoint even if `b` is negative. The
`t` dependence is likewise maximized exactly. The original padding is restored
once, after mixing.

The verifier reconstructs the entire original binary partition. Every
replacement splits its parent into two children meeting at an interior
rational coordinate. A `cap` leaf uses the inherited box serialization
(its internal box type can be `c`, `b`, or `m`); a `multi` leaf supplies
nonnegative weights summing to one and compatible source-node components.
The first entry of each component tuple is a discovery label, not a premise;
the serialized component determines its source. Every node range, stored
leaf bound, parent maximum, and unchanged original box is rechecked. No
replacement may worsen its parent. The final maximum is compared with `B`
and the reciprocal comparison is checked exactly.

## Lean proof and exact port comparison

The existing `BoxKind` reflection handles at most two row components. The
extension uses `MixTree CompRef` to represent arbitrary finite binary mixing
expressions. Its resolver calls the existing `mixData` at every internal
node, so nonconvex weights and invalid leaf references fail closed. The new
`MixBox` checker embeds old boxes and applies the existing exact slab formula
to resolved mixtures. `MixTree.resolve_sound`, `MixBox.bound_sound`, and
`mixCover_sound` prove its soundness without adding analytic hypotheses.
`mixCover_bound` combines those results into the scalar bound `V ≤ B` for any
accepted complete cover under the existing common-law assumptions.

`tools/gen_lower_refinement_lean.py` rechecks and exports the ordered law bank
byte for byte. `LowerRefinementCheck.certRefinementBatches` uses `native_decide`
to check it with the existing `checkBatch` implementation, covering the source
envelopes, budgets, majorants, radial tails, and joint-node ranges. Its native
fact is recorded in the axiom inventory. The generic mixture proofs use no
native computation.

`tools/gen_lower_refinement_cover.py` replays the complete rational certificate
before exporting its 14,060 `MixBox` expressions and partition. Positive weights
are normalized into binary mixtures; old boxes reuse the pinned original data.
Lean independently checks the generated expressions, every range, all box caps
and the entire partition. The four existing native box checks and existing
partition check are replaced in place, rather than adding a second active cover.

The original cap data, Gaussian witness and source potentials are unchanged.
`lower_bound_of_refined_cover_data` retains its older, weaker conclusion solely
for the cached `CapNodes.lean` interface; the public target uses
`lower_bound_of_completed_refinement`. Both follow from the new checked cover.
No Python evaluation is a premise of the Lean theorem.

The indexed decoder in `Lower/BoxLookup.lean` selects the requested cell or
witness before parsing it. Its equality proofs preserve the original checker,
including invalid inputs and node ranges. On the local pinned Lean build, the
four complete box-check modules took 9.3, 10, 14 and 12 seconds; the partition
module took 3.1 seconds. These are whole-module measurements, not isolated native
evaluation timings. The law-bank module previously built in 62 seconds.

The diagnostic port comparison exports the indexed evaluator on all 10,909 original boxes.
`indexedBoxBound_eq` (in `Lower/BoxLookup.lean`) proves that its
output is exactly `boxBound`. It then compares each rational result exactly with the Python evaluator. It adds no
native fact or numerical premise. The principal implementation correspondence is:

| Python (`lower_refinement.py`) | Lean |
|---|---|
| `value` | `Grothe.Lower.boxVal` |
| `capvalue` | `Grothe.Lower.capVal` |
| `price` | `Grothe.Lower.VRow.price` |
| `component` | `Grothe.Lower.compRefData` |
| `qmax` | `Grothe.Lower.quadMax` |

Agent-ID: codex-df7b
