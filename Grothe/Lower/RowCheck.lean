import Grothe.Lower.RowData
import Grothe.Lower.MixedData

/-!
# The row, box and envelope certificate

`rows_check` runs the exact row checker on the 19 rows (headers, meshes, `x`-coverage, and every
cell: moment rectangles, node majorants with their Stein cuts, `σ`-chords; the cells of a row are
checked in parallel), `prices_check` the pinned gate prices of the rows, `outer_check` the
fixed-mixture envelope checker against `B` outside the central slab, `batches_check` the 36 exact
node certificates of the mixed potentials, `boxes_check` the 863 boxes of the slab and
`cover_check` their dyadic partition of the slab, all by `native_decide`.  `rows_bound` is the
resulting statement for each row, and `lower_bound_data` the finite-layer theorem `V ≤ B` for the
certificate data.
-/

namespace Grothe.Lower

theorem rows_check : rowData.all checkRow = true := by native_decide

theorem prices_check : rowData.all checkRowPrice = true := by native_decide

theorem outer_check :
    checkOuter (crudeRow :: rowData.map Row.env) envModels envCells Bcap mixedSlabLo mixedSlabHi
      = true := by
  native_decide

theorem batches_check : mixedBatches.all (checkBatch rowData) = true := by native_decide

theorem boxes_check : checkBoxes rowData mixedBatches mixedBoxes Bcap = true := by native_decide

theorem cover_check : coverOK (mixedBoxes.length + 1) (mixedSlabLo, mixedSlabHi, 0, ρ, 0, xMax)
    (mixedBoxes.map fun s => (parseBox s).dom) = true := by
  native_decide

/-- Every row has a valid header and its certified bound. -/
theorem rows_bound : ∀ r ∈ rowData, HeaderOK r ∧ RowBound r := fun r hr =>
  rowBound_of_check r (List.all_eq_true.1 rows_check r hr)

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- **The finite-layer lower bound for the certificate data**: `V ≤ B` from the
retained-square inequality of the crude row and the simultaneous Gaussian reduction of the 19
rows. -/
theorem lower_bound_data (V t : ℝ) (Qh v : E) (hv : ‖v‖ ^ 2 = 2) (ht0 : 0 ≤ t)
    (ht1 : t ≤ 9 / 10) (hcrude : RowOf crudeRow V t Qh v)
    (hred : SharedReduction rowData V t Qh v) : V ≤ Bcap :=
  lower_bound_main rowData envModels envCells mixedBatches mixedBoxes mixedSlabLo mixedSlabHi
    rows_check prices_check
    outer_check batches_check boxes_check cover_check V t Qh v hv ht0 ht1 hcrude hred

end Grothe.Lower
