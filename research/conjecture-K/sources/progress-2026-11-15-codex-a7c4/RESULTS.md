<!-- Agent-ID: codex-a7c4. Task #421. -->
# Lower-bound and Conjecture K progress

The complete lower certificate gives

\[
K_G^{\mathbb C}\ge\frac{1250000000}{891774069}>1.401700322371.
\]

The scalar cap is `0.7134192552`, with 15,096 leaves covering the full original
parameter domain. This improves the previous displayed lower bound by
`0.000000284498`, using the same Gaussian witness, certified law-node bank,
source tables and analytic hypotheses. It does not assume Conjecture K.
[LOWER_ROUTE.md](LOWER_ROUTE.md) gives the discovery method, exact acceptance
and remaining numerical bottlenecks. The production data and replay instructions
are in `data/lower-refinement/`.

Two new analytic results address Conjecture K:

- [ODD_CONTROL.md](ODD_CONTROL.md) proves uniform costs for each pure odd sector
  over every remote core, at every amplitude and with arbitrary sharing. The
  costs for `ZQ` or `conj(Z)P` are `.01`, `.03`, `.04` at the peak, flank and
  upper rows; the normalized visible cubic has costs `.22`, `.24`, `.25`.
  These conclusions hold for both the raw and retained functionals. Simultaneous
  odd sectors are covered under the stated conditional orthogonality; the
  retained simultaneous result covers disjoint Gaussian coordinate blocks.
- [JOINT_CONTENT.md](JOINT_CONTENT.md) proves a sharp global lower comparison
  for the A/B content kernels. Centering reduces the peak cubic projection
  error from `.007√u` to `.0035√u`. The completed tilted-A theorem then gives
  `||c_B,.30318||² ≤ .1 D_+ + 4.43·10⁻⁶` for every finite-dimensional cubic
  with `u≤.0463`. The corresponding finite-amplitude B and joint costs remain
  separate obligations. The note also records improved conditional joint budgets.

The new analytic arguments are author proofs with independent review within this
session. Their scalar premises were recomputed with exact rational or outward
Arb arithmetic, including entire half-line covers and analytic tails. They are
not new Lean theorems and still require external mathematical review. Neither
result establishes full Conjecture K: joint A/B cost and shared odd sectors over
a core containing A/B remain open.

## Verification

Both new research checkers were replayed independently and reproduced their
saved JSON byte for byte. The six odd-potential bounds include all radial tails;
the exact kernel checker recomputes endpoint comparisons and conditional budgets.
Both reject optimized Python (`-O`). The complete production cover passes the
standard-library rational verifier and all eight negative controls. Its Lean
export passes the exact complete-partition replay.

Targeted Lean compilation and the resulting axiom report are recorded in the PR
after integration. The heavy Gaussian cap computations are unchanged; full
assembly is checked in CI.

## Review feedback from merged PR #419

Claude's [independent review](https://github.com/agalatan/grothendieck-lean/pull/419#issuecomment-6890332884)
approved the mathematics and reproduced all four checkers. Its exclusions remain
explicit: inherited tilted-sector certification, python-flint internals, and the
inherited positive-mixture and sixth-moment inputs were not independently checked
in that review. The single-kernel correction concerns a numerical summary and has
Low–Medium severity. The local eigenvalue argument retains author-proof status
with replayed computation and a numerical cross-check; a special case is not an
independent stronger theorem.

The current-state rewrite under #414 owns the book, ledger and inventory changes,
including the status-label qualifications and duplicate presentation identified
by that review. This work supplies separate current theorem statements and proof
material for that rewrite. The minor `STATUS 7.4.5` reference in the preceding
audit note is corrected here. No existing source package is replaced.
