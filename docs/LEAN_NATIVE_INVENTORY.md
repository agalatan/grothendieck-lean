# Native source inventory

This inventory describes the native facts (`native_decide`) allowed for the single `Grothe` target: those of the lower
bound by family and module pattern, and those of the upper bound. The complete allowlist is
`data/axioms/native.txt`, read by `scripts/check_axioms.py`. The default report is `scratch/Axioms.lean`, with its
required declarations in `data/axioms/required.txt`; CI checks it on every pushed branch, and on the merged tree before
a pull request lands.

The proof-check workflow also audits `scratch/UpperSixAxioms.lean` against the required six-channel
allowlist. It covers the two cell witnesses and both overlap-table checks of the library
`Grothe/UpperSix/`, and from the certificate `Grothe/UpperSix/Certificate/` the contour checks of the first
channel and the head check with the six linear floors. The disk and circle checks of the other five
channels and the rational tail comparisons reduce in the kernel.
[Run the upper-only audit](../README.md#building) · [Six-channel allowlist](../data/axioms/modes/upper-six.native.txt).

## Lower bound

Every native fact of the lower bound is one sequential exact computation; most of them sit in modules of their own, so
that Lake checks them in separate processes. The coupled endpoint uses the native scalar certificates for
rows 01–07 and 10–14. The two active rows use kernel-checked antiholomorphic Stein bounds. The shared witness
also uses the node-cap facts below. The exact dependencies are reported in `scratch/Axioms.lean`. Below, `KK` is the index of a cap row in `rowData` (`00`–`13`), `SS = KK + 1` the
number of its Stein row (`01`–`14`), `i` a node of its cap table and `J` a block of consecutive nodes or pieces.

| family | facts | module | what is checked | used by |
|---|---|---|---|---|
| row checks | `Grothe.Lower.certRowSS` | `Grothe/Lower/Cert/RowSS.lean` | `checkRow rowSS` (Stein nodes) or, for the rows 0.4 and 0.6, `checkSpecRow rowSS` (spectral nodes); `SS` is `01`–`07` or `10`–`14` | `tight_scalar_rows` (`Grothe/LowerAnalytic/LowerBoundTight.lean`), `Grothe/LowerAnalytic/SparseOuterRows.lean` |
| node caps: range facts | `Grothe.LowerAnalytic.rowKKAnchorRangeJJ` | `Grothe/LowerAnalytic/CapRowKK/AnchorRangeJJ.lean` | `rangeOKNu` over consecutive whole-fibre nodes (anchored and global) | `vertexCapsRowKK`, through `nodeCapNu_of_rangeOK` |
| node caps: coverage facts | `Grothe.LowerAnalytic.pieceCover_KKx<i>` | `Grothe/LowerAnalytic/CapPieces/CKKx<i>.lean` | `pieceCoverFastOK`: the pieces of a localised node cover the fibre space up to the symmetries of the potential | `nodeCap_KKx<i>`, through `pieceCoverOK_of_fast` |
| node caps: piece facts | `Grothe.LowerAnalytic.pieceRange_KKx<i>_<J>` | `Grothe/LowerAnalytic/CapPieces/RKKx<i>_<J>.lean` | `pieceRangeOKNu` over consecutive pieces of a localised node, on one grid | `nodeCap_KKx<i>`, through `pieceOneOKNu_of_range` |
| node caps: chord facts | `Grothe.LowerAnalytic.chordsOKRowKK` | `Grothe/LowerAnalytic/CapRowKK/Assembly.lean` | `chordOKLow`: the cap of every chord node of the row is above the chord of its two vertex nodes, at the vertex caps lowered by `10⁻¹²` | `capsRowKK`, through `nodeCaps_of_vertexCapsNu` |

Lean kernel-checks the spectral polynomial majorants and scale chords for `Grothe.Lower.certMassRow`.
The witness module took about four minutes to build on Linux with two CPUs available. The axiom
audit restricts both the mass certificate and `mass_law_bound` to Lean's three standard axioms.
`tools/gen_lower_data.py` generates the row certificates. `tools/gen_tail_caps.py` generates the node-cap facts and lists them in
`data/tail-caps/native.txt` ([CAPS.md](CAPS.md)). The node-cap facts take about 340 CPU-hours in all, dominated by the
piece facts; CI replays them from a verified build cache. No per-fact timing is recorded here.

## Upper bound

The upper bound of `main_bounds`, `K ≤ 1.404556392`, comes from the seven-channel proof. It uses the six-channel
native comparisons listed above (`data/axioms/modes/upper-six.native.txt`) and
`Haagerup.AngularSelector.NumericWitness.budgets_ok` (`Grothe/UpperSelector/NumericWitness.lean`), which evaluates
the signed mixed head and the selector allowance in one comparison.
