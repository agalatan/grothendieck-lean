import Grothe.Lower.RowData
import Grothe.Lower.MixedData
import Grothe.Lower.Support

/-!
# The certificate check

`cert_check` runs all exact checks of the certificate by one `native_decide`: the 19 rows (gate
and price, mesh, `x`-coverage, and every cell: moment rectangles, node majorants with their Stein
cuts, `σ`-chords), the exact node certificates of the mixed potentials (Stein and spectral), and
the boxes partitioning `[0, 9/10] × [0, ρ] × [0, 31/4]` (every box bounded by `B`, the partition
certified by its axis cuts); rows, cells, batches and boxes are
checked sequentially (single-threaded native code).
`lower_bound_data` is the finite-layer theorem `V ≤ B` for the certificate data.
-/

namespace Grothe.Lower

theorem cert_check : checkCert rowData mixedBatches coverCuts coverBoxes = true := by native_decide

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **The finite-layer lower bound for the certificate data**: `V ≤ B` from the
retained-square inequality of the crude row and the simultaneous Gaussian reduction of the 19
rows. -/
theorem lower_bound_data (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t)
    (ht1 : t ≤ 9 / 10) (hcrude : RowOf crudeRow V t Qh v)
    (hred : SharedReduction rowData V t Qh v) : V ≤ Bcap :=
  lower_bound_main rowData mixedBatches coverCuts coverBoxes cert_check V t Qh v hv ht0 ht1 hcrude
    hred

end Grothe.Lower
