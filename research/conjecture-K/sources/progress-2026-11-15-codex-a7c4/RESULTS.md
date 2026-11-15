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

The research results provide sector control, a smaller response domain, and a precise next joint-sector target:

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
- [RESPONSE_ELLIPSOID.md](RESPONSE_ELLIPSOID.md) strengthens the simultaneous
  six-sector constraint on actual responses, by a weighted Cauchy–Schwarz or
  Bessel argument. The resulting total-energy caps are `.080051`, `.070564`,
  `.061366` at the existing thresholds `t≥.84`, `.8456`, `.851`. All sectors
  may share coordinates. This is a feasible-domain improvement, not a payoff
  bound or a theorem about every cubic in the raw K supremum.
- [JOINT_TARGET.md](JOINT_TARGET.md) uses the existing tilted-content theorem
  with coefficient `.3`, the centered A/B error and the stronger response
  domain. Conditional on its explicitly stated, still open pointwise
  remainder inequality, it proves joint A/B error below `.00004936`.
  A 1,000-cell exact rational certificate checks the scalar assembly.
  The exterior of that premise is proved by an exact density certificate; only
  `|w|≤2.02`, `sqrt(S)≤1.65` remains. The joint conclusion is still conditional.

The new analytic arguments are author proofs with independent review within this
session. Their scalar premises were recomputed with exact rational or outward
Arb arithmetic, including entire half-line covers and analytic tails. They are
not new Lean theorems and still require external mathematical review. None
establishes full Conjecture K: joint A/B cost and shared odd sectors over
a core containing A/B remain open.

## Verification

The odd-cost and content checkers were replayed independently within this session and reproduced their
saved JSON byte for byte. The six odd-potential bounds include all radial tails;
the exact kernel checker recomputes endpoint comparisons and conditional budgets.
The response-ellipsoid checker derives the sector weights and encloses π by
exact rational series; it replays all new numerical caps, conditional on the
inherited reviewed Rice tangent. The joint-target checker accepts all 1,000 cells
and is independently re-derived within this session. All four reject optimized
Python (`-O`). The complete production cover passes the
standard-library rational verifier and all eight negative controls. Its Lean
export passes the exact complete-partition replay.

The changed Lean modules built in the targeted check. The [full proof check](https://github.com/agalatan/grothendieck-lean/actions/runs/43690956235)
at commit `5446f03d780fbb10e53be00e0e40516738366fd2` passed, including `main_bounds`
and the axiom report. The heavy Gaussian cap computations are unchanged and
were replayed from the verified CI cache.

## Review feedback from merged PR #419

Claude's [independent review](https://github.com/agalatan/grothendieck-lean/pull/419#issuecomment-6890332884)
approved the mathematics and reproduced all four checkers. Its exclusions remain
explicit: inherited tilted-sector certification, python-flint internals, and the
inherited positive-mixture and sixth-moment inputs were not independently checked
in that review. The single-kernel correction concerns a numerical summary and has
Low–Medium severity. The local eigenvalue argument retains author-proof status
with replayed computation and a numerical cross-check; a special case is not an
independent stronger theorem.

The current-state rewrite landed in #423. This branch updates its book and ledger
in place with these results and their review status. The minor `STATUS 7.4.5`
reference in the preceding audit note is corrected here. No existing source
package is replaced.
